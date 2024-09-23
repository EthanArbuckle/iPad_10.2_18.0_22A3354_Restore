@implementation DrugInteractionVisualizationView

- (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_visualizationConfig;
  v4 = type metadata accessor for DrugInteractionVisualizationConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_subview) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___imageView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DrugInteractionVisualizationView();
  return -[DrugInteractionVisualizationView initWithFrame:](&v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC19HealthMedicationsUI32DrugInteractionVisualizationView *result;

  v5 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_visualizationConfig;
  v6 = type metadata accessor for DrugInteractionVisualizationConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_subview) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___imageView) = 0;
  v7 = a3;

  result = (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView)initWithFrame:(CGRect)a3
{
  _TtC19HealthMedicationsUI32DrugInteractionVisualizationView *result;

  result = (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC0E1CFC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_visualizationConfig, (unint64_t *)&qword_1EF3FA0F8, (void (*)(uint64_t))type metadata accessor for DrugInteractionVisualizationConfig);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_subview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___medicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___imageView));
}

@end
