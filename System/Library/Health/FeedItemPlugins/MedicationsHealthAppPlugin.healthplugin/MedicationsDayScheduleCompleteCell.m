@implementation MedicationsDayScheduleCompleteCell

- (_TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell_item;
  v9 = (objc_class *)type metadata accessor for MedicationsDayScheduleCompleteCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[MedicationsDayScheduleCompleteCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell_item;
  v6 = (objc_class *)type metadata accessor for MedicationsDayScheduleCompleteCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[MedicationsDayScheduleCompleteCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_2317FAF6C((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin34MedicationsDayScheduleCompleteCell_item);
}

@end
