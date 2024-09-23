@implementation ScheduleIntervalCell

- (_TtC19HealthMedicationsUI20ScheduleIntervalCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC19HealthMedicationsUI20ScheduleIntervalCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___frequencyTitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___timesStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___dosesStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___containerStackView) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell_item;
  v9 = (objc_class *)type metadata accessor for ScheduleIntervalCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[ScheduleIntervalCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1BC2082D4();

  return v10;
}

- (_TtC19HealthMedicationsUI20ScheduleIntervalCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI20ScheduleIntervalCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___frequencyTitleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___timesStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___dosesStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___containerStackView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI20ScheduleIntervalCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___frequencyTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___timesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___dosesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell____lazy_storage___containerStackView));
  sub_1BC0F2444((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleIntervalCell_item, (unint64_t *)&qword_1EDA0F7D0, (uint64_t (*)(uint64_t))sub_1BC0E1B94);
}

@end
