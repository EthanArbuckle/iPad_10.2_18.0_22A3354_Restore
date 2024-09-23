@implementation ConfirmDetailsLearnMoreView

- (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView)initWithCoder:(id)a3
{
  id v5;
  _TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer) = 0;
  v5 = a3;

  result = (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView *)sub_1D77F4DA0();
  __break(1u);
  return result;
}

- (void)dealloc
{
  _TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView *v2;
  id v3;
  id v4;
  objc_super v5;

  v2 = self;
  v3 = sub_1D77ECDD8();
  v4 = sub_1D77ED000();
  objc_msgSend(v3, sel_removeGestureRecognizer_, v4);

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for ConfirmDetailsLearnMoreView();
  -[ConfirmDetailsLearnMoreView dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1D77C564C((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_configuration;
  v4 = sub_1D77F4938();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer));
}

- (void)tintColorDidChange
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ConfirmDetailsLearnMoreView();
  v2 = v5.receiver;
  -[ConfirmDetailsLearnMoreView tintColorDidChange](&v5, sel_tintColorDidChange);
  v3 = sub_1D77ECDD8();
  v4 = objc_msgSend(v2, sel_tintColor, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setTextColor_, v4);

}

- (void)learnMoreTapped
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView *v6;

  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate;
  if (MEMORY[0x1D829C934]((char *)self + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView)initWithFrame:(CGRect)a3
{
  _TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView *result;

  result = (_TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
