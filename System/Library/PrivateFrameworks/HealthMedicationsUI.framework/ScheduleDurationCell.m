@implementation ScheduleDurationCell

- (_TtC19HealthMedicationsUI20ScheduleDurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI20ScheduleDurationCell *)ScheduleDurationCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI20ScheduleDurationCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC19HealthMedicationsUI20ScheduleDurationCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___mainStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___startDateStackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___endDateStackView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC19HealthMedicationsUI20ScheduleDurationCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI20ScheduleDurationCell *v8;
  uint64_t v9;

  v4 = sub_1BC2B3B00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B3AF4();
  v8 = self;
  sub_1BC19C40C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___mainStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___startDateStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell____lazy_storage___endDateStackView));
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20ScheduleDurationCell_item);
}

@end
