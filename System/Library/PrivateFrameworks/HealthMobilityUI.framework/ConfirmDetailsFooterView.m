@implementation ConfirmDetailsFooterView

- (_TtC16HealthMobilityUI24ConfirmDetailsFooterView)initWithCoder:(id)a3
{
  id v4;
  _TtC16HealthMobilityUI24ConfirmDetailsFooterView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel) = 0;
  v4 = a3;

  result = (_TtC16HealthMobilityUI24ConfirmDetailsFooterView *)sub_1D77F4DA0();
  __break(1u);
  return result;
}

- (_TtC16HealthMobilityUI24ConfirmDetailsFooterView)initWithFrame:(CGRect)a3
{
  _TtC16HealthMobilityUI24ConfirmDetailsFooterView *result;

  result = (_TtC16HealthMobilityUI24ConfirmDetailsFooterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView_configuration;
  v4 = sub_1D77F4938();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel));
}

@end
