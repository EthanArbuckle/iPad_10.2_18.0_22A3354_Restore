@implementation ImpressionMetricsDebugOverlay

- (_TtC22SubscribePageExtension29ImpressionMetricsDebugOverlay)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC22SubscribePageExtension29ImpressionMetricsDebugOverlay *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension29ImpressionMetricsDebugOverlay_metricsLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC22SubscribePageExtension29ImpressionMetricsDebugOverlay *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ImpressionMetricsDebugOverlay.swift", 58, 2, 42, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension29ImpressionMetricsDebugOverlay)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension29ImpressionMetricsDebugOverlay *result;

  result = (_TtC22SubscribePageExtension29ImpressionMetricsDebugOverlay *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ImpressionMetricsDebugOverlay", 52, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29ImpressionMetricsDebugOverlay_metricsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29ImpressionMetricsDebugOverlay_overlayColor));
}

@end
