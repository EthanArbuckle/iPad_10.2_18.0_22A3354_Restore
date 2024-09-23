@implementation StateOfMindCalendarDayCell

- (_TtC14MentalHealthUI26StateOfMindCalendarDayCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  _TtC14MentalHealthUI26StateOfMindCalendarDayCell *v11;
  _TtC14MentalHealthUI26StateOfMindCalendarDayCell *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC14MentalHealthUI26StateOfMindCalendarDayCell_day;
  v10 = type metadata accessor for StateOfMindCalendarDay();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v11 = -[StateOfMindCalendarDayCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  *(_QWORD *)(swift_allocObject() + 16) = v11;
  v12 = v11;
  sub_2418AA14C();

  return v12;
}

- (_TtC14MentalHealthUI26StateOfMindCalendarDayCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC14MentalHealthUI26StateOfMindCalendarDayCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC14MentalHealthUI26StateOfMindCalendarDayCell_day;
  v6 = type metadata accessor for StateOfMindCalendarDay();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC14MentalHealthUI26StateOfMindCalendarDayCell *)sub_2418AA380();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24172588C((uint64_t)self + OBJC_IVAR____TtC14MentalHealthUI26StateOfMindCalendarDayCell_day, (uint64_t (*)(_QWORD))sub_241859AE0);
}

@end
