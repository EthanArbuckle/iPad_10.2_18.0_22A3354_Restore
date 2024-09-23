@implementation AddMedicationView

- (_TtC19HealthMedicationsUI17AddMedicationView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC19HealthMedicationsUI17AddMedicationView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___addMedLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___detailLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___separatorView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___addMedPromptLabel) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AddMedicationView();
  v7 = -[AddMedicationView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_1BC13D008();

  return v7;
}

- (_TtC19HealthMedicationsUI17AddMedicationView)initWithCoder:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI17AddMedicationView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___iconView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___addMedLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___detailLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___separatorView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___addMedPromptLabel) = 0;
  v4 = a3;

  result = (_TtC19HealthMedicationsUI17AddMedicationView *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___addMedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI17AddMedicationView____lazy_storage___addMedPromptLabel));
}

@end
