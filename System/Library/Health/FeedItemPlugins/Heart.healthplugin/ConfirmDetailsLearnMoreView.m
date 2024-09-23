@implementation ConfirmDetailsLearnMoreView

- (_TtC5Heart27ConfirmDetailsLearnMoreView)initWithCoder:(id)a3
{
  id v5;
  _TtC5Heart27ConfirmDetailsLearnMoreView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel) = 0;
  v5 = a3;

  result = (_TtC5Heart27ConfirmDetailsLearnMoreView *)sub_231414EE4();
  __break(1u);
  return result;
}

- (void)learnMoreTapped
{
  _TtC5Heart27ConfirmDetailsLearnMoreView *v2;

  v2 = self;
  sub_2312EA538();

}

- (_TtC5Heart27ConfirmDetailsLearnMoreView)initWithFrame:(CGRect)a3
{
  _TtC5Heart27ConfirmDetailsLearnMoreView *result;

  result = (_TtC5Heart27ConfirmDetailsLearnMoreView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_2312D2854((uint64_t)self + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel));
  v3 = (char *)self + OBJC_IVAR____TtC5Heart27ConfirmDetailsLearnMoreView_configuration;
  v4 = sub_231413930();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
