extends Line2D
@onready var audio_instance
@onready var lines_up=[]
@onready var lines_down=[]

func add_up_lines():
	for i in points.size():
		var new_line_1=Line2D.new()
		add_child(new_line_1)
		lines_up.append(new_line_1)
		new_line_1.add_point(points[i])
		new_line_1.add_point(points[i])
func add_down_lines():
	for i in points.size():
		var new_line_2=Line2D.new()
		add_child(new_line_2)
		lines_down.append(new_line_2)
		new_line_2.add_point(points[i])
		new_line_2.add_point(points[i])
func _ready():
	for i in 48:
		add_point(Vector2(i*16,0))
	audio_instance=AudioServer.get_bus_effect_instance(1,0)
	add_down_lines()
	add_up_lines()
func _process(_delta):
	for i in points.size():
		var temp_y=-(audio_instance.get_magnitude_for_frequency_range(60*i,60*(i+1))*1000).y
		lines_down[i].points[1].y=lerp(lines_down[i].points[1].y,-temp_y,0.1)
		lines_up[i].points[1].y=lerp(lines_up[i].points[1].y,temp_y,0.1)
