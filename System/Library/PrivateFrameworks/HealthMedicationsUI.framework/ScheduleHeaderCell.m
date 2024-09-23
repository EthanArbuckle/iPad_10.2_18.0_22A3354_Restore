@implementation ScheduleHeaderCell

- (_TtC19HealthMedicationsUI18ScheduleHeaderCell)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI18ScheduleHeaderCell____lazy_storage___closeButton) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI18ScheduleHeaderCell_item;
  v9 = (objc_class *)type metadata accessor for ScheduleHeaderCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[ScheduleHeaderCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI18ScheduleHeaderCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI18ScheduleHeaderCell____lazy_storage___closeButton) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI18ScheduleHeaderCell_item;
  v6 = (objc_class *)type metadata accessor for ScheduleHeaderCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ScheduleHeaderCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI18ScheduleHeaderCell____lazy_storage___closeButton));
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI18ScheduleHeaderCell_item);
}

@end
