@implementation DayPicker

- (_TtC19HealthMedicationsUI9DayPicker)initWithCoder:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI9DayPicker *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC19HealthMedicationsUI9DayPicker_dayViews) = (Class)MEMORY[0x1E0DEE9D8];
  v4 = a3;

  result = (_TtC19HealthMedicationsUI9DayPicker *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)didTapDay:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI9DayPicker *v5;

  v4 = a3;
  v5 = self;
  sub_1BC146E78(v4);

}

- (_TtC19HealthMedicationsUI9DayPicker)initWithFrame:(CGRect)a3
{
  _TtC19HealthMedicationsUI9DayPicker *result;

  result = (_TtC19HealthMedicationsUI9DayPicker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI9DayPicker_selectedDays;
  v4 = sub_1BC2B38E4();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI9DayPicker_disabledDays, v4);
  swift_bridgeObjectRelease();
}

@end
