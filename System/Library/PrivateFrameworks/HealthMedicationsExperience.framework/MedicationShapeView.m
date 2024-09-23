@implementation MedicationShapeView

- (_TtC27HealthMedicationsExperience19MedicationShapeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_shadowLayer) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_config;
  v9 = type metadata accessor for MedicationVisualizationConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MedicationShapeView();
  return -[MedicationShapeView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC27HealthMedicationsExperience19MedicationShapeView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC27HealthMedicationsExperience19MedicationShapeView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_shadowLayer) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_config;
  v6 = type metadata accessor for MedicationVisualizationConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC27HealthMedicationsExperience19MedicationShapeView *)sub_1BCB648B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC27HealthMedicationsExperience19MedicationShapeView *v2;

  v2 = self;
  sub_1BCB4E8EC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_shadowLayer));
  sub_1BCB4F7B0((uint64_t)self + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_config, &qword_1EF487308, (void (*)(uint64_t))type metadata accessor for MedicationVisualizationConfig);
}

@end
