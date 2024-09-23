@implementation CustomStrengthOptionCell

- (_TtC19HealthMedicationsUI24CustomStrengthOptionCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI24CustomStrengthOptionCell *)sub_1BC24DD7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI24CustomStrengthOptionCell)initWithCoder:(id)a3
{
  char *v4;
  uint64_t v5;
  id v6;
  _TtC19HealthMedicationsUI24CustomStrengthOptionCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell_titleLabel;
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)sub_1BC24DBB0();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell____lazy_storage___actionButton) = 0;

  result = (_TtC19HealthMedicationsUI24CustomStrengthOptionCell *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)actionButtonTapped
{
  _TtC19HealthMedicationsUI24CustomStrengthOptionCell *v2;

  v2 = self;
  sub_1BC24E680();

}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI24CustomStrengthOptionCell____lazy_storage___actionButton));
}

@end
