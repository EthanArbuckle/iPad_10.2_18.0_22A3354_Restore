@implementation ClimateStepperButton

- (_TtC7Climate20ClimateStepperButton)init
{
  _QWORD *v3;
  char *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7Climate20ClimateStepperButton_presentationStatesBlock);
  *v3 = 0;
  v3[1] = 0;
  v4 = (char *)self + OBJC_IVAR____TtC7Climate20ClimateStepperButton_delegate;
  *((_QWORD *)v4 + 1) = 0;
  swift_unknownObjectWeakInit(v4, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClimateStepperButton();
  return -[ClimateButton init](&v6, "init");
}

- (void).cxx_destruct
{
  sub_100005118(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC7Climate20ClimateStepperButton_presentationStatesBlock), *(_QWORD *)&self->super.action[OBJC_IVAR____TtC7Climate20ClimateStepperButton_presentationStatesBlock]);
  sub_10001BF8C((uint64_t)self + OBJC_IVAR____TtC7Climate20ClimateStepperButton_delegate);
}

@end
