@implementation MedsCompletionCheckmarkView

- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView *result;

  v5 = OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer;
  v6 = objc_allocWithZone(MEMORY[0x24BDE5758]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView *)sub_21C2C26C0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MedsCompletionCheckmarkView();
  v2 = (char *)v4.receiver;
  -[MedsCompletionCheckmarkView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_tickViewSize);
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[MedsCompletionCheckmarkView intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView)initWithFrame:(CGRect)a3
{
  _TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView *result;

  result = (_TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC25HealthMedicationsVisionUIP33_36E86986F41219E6742057645D27BDD227MedsCompletionCheckmarkView_shapeLayer));
}

@end
