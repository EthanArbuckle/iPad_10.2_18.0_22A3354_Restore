@implementation ImpressionMetricsDebugOverlay

- (_TtC8AppStore29ImpressionMetricsDebugOverlay)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8AppStore29ImpressionMetricsDebugOverlay *result;

  v5 = OBJC_IVAR____TtC8AppStore29ImpressionMetricsDebugOverlay_metricsLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC8AppStore29ImpressionMetricsDebugOverlay *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ImpressionMetricsDebugOverlay.swift", 44, 2, 42, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore29ImpressionMetricsDebugOverlay)initWithFrame:(CGRect)a3
{
  _TtC8AppStore29ImpressionMetricsDebugOverlay *result;

  result = (_TtC8AppStore29ImpressionMetricsDebugOverlay *)_swift_stdlib_reportUnimplementedInitializer("AppStore.ImpressionMetricsDebugOverlay", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ImpressionMetricsDebugOverlay_metricsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ImpressionMetricsDebugOverlay_overlayColor));
}

@end
