@implementation ScaledLabelConstraint

- (UILabel)referenceLabel
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI21ScaledLabelConstraint_referenceLabel;
  swift_beginAccess();
  return (UILabel *)(id)MEMORY[0x1AF41CA2C](v2);
}

- (void)setReferenceLabel:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)awakeFromNib
{
  char *v2;
  char *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ScaledLabelConstraint();
  v2 = (char *)v5.receiver;
  -[ScaledLabelConstraint awakeFromNib](&v5, sel_awakeFromNib);
  v3 = &v2[OBJC_IVAR____TtC18HealthExperienceUI21ScaledLabelConstraint_referenceLabel];
  swift_beginAccess();
  v4 = (void *)MEMORY[0x1AF41CA2C](v3);

  if (v4)
  {
    sub_1A96DFD28();

  }
  else
  {
    sub_1A9A96970();
    __break(1u);
  }
}

- (void)textSizeChanged
{
  _TtC18HealthExperienceUI21ScaledLabelConstraint *v2;

  v2 = self;
  sub_1A96DFE60();

}

- (_TtC18HealthExperienceUI21ScaledLabelConstraint)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI21ScaledLabelConstraint_rawConstant) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ScaledLabelConstraint();
  return -[ScaledLabelConstraint init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
