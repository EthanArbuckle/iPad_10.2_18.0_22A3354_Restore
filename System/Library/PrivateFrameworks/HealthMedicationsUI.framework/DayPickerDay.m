@implementation DayPickerDay

- (_TtC19HealthMedicationsUI12DayPickerDay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC194120();
}

- (void)layoutSubviews
{
  _TtC19HealthMedicationsUI12DayPickerDay *v2;

  v2 = self;
  sub_1BC193C64();

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DayPickerDay();
  v2 = v3.receiver;
  -[DayPickerDay tintColorDidChange](&v3, sel_tintColorDidChange);
  sub_1BC19391C();

}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DayPickerDay();
  return -[DayPickerDay isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DayPickerDay();
  v4 = v5.receiver;
  -[DayPickerDay setSelected:](&v5, sel_setSelected_, v3);
  sub_1BC19391C();

}

- (_TtC19HealthMedicationsUI12DayPickerDay)initWithFrame:(CGRect)a3
{
  _TtC19HealthMedicationsUI12DayPickerDay *result;

  result = (_TtC19HealthMedicationsUI12DayPickerDay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI12DayPickerDay_day;
  v4 = sub_1BC2B3848();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI12DayPickerDay_formatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI12DayPickerDay_background));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI12DayPickerDay_dayLabel));
}

@end
