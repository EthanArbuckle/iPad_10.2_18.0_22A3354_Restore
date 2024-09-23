@implementation MedicationGradientBackground

- (_TtC27HealthMedicationsExperience28MedicationGradientBackground)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC27HealthMedicationsExperience28MedicationGradientBackground *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MedicationGradientBackground();
  v7 = -[MedicationGradientBackground initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  -[MedicationGradientBackground setContentMode:](v7, sel_setContentMode_, 3);
  -[MedicationGradientBackground setClipsToBounds:](v7, sel_setClipsToBounds_, 1);

  return v7;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC27HealthMedicationsExperience28MedicationGradientBackground *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1BCB5CA74(x, y, width, height);

}

- (_TtC27HealthMedicationsExperience28MedicationGradientBackground)initWithCoder:(id)a3
{
  _TtC27HealthMedicationsExperience28MedicationGradientBackground *result;

  result = (_TtC27HealthMedicationsExperience28MedicationGradientBackground *)sub_1BCB648B0();
  __break(1u);
  return result;
}

@end
