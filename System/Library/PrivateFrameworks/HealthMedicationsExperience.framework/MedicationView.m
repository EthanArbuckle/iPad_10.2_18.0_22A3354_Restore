@implementation MedicationView

- (_TtC27HealthMedicationsExperience14MedicationView)initWithFrame:(CGRect)a3
{
  return (_TtC27HealthMedicationsExperience14MedicationView *)MedicationView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC27HealthMedicationsExperience14MedicationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BCAFC670();
}

- (void)layoutSubviews
{
  char *v2;
  char *v3;
  char *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationView(0);
  v2 = (char *)v5.receiver;
  -[MedicationView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = &v2[OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView_circular];
  swift_beginAccess();
  if (*v3 == 1)
  {
    v4 = (char *)objc_msgSend(v2, sel_layer);
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v4, sel_setCornerRadius_, CGRectGetHeight(v6) * 0.5);

    v2 = v4;
  }

}

- (void)setNeedsUpdateConstraints
{
  _TtC27HealthMedicationsExperience14MedicationView *v2;

  v2 = self;
  sub_1BCAF9C74();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView____lazy_storage___gradientBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView____lazy_storage___gradientDefaultBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView____lazy_storage___shapeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView____lazy_storage___placeholderView));
  sub_1BCAFC62C((uint64_t)self + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView_config, &qword_1EF487308, type metadata accessor for MedicationVisualizationConfig);
}

@end
