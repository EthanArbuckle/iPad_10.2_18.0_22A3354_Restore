@implementation ImpressionMetricsDebugOverlay

- (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC20ProductPageExtension29ImpressionMetricsDebugOverlay *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension29ImpressionMetricsDebugOverlay_metricsLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ImpressionMetricsDebugOverlay.swift", 56, 2, 42, 0);
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension29ImpressionMetricsDebugOverlay *result;

  result = (_TtC20ProductPageExtension29ImpressionMetricsDebugOverlay *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.ImpressionMetricsDebugOverlay", 50, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29ImpressionMetricsDebugOverlay_metricsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29ImpressionMetricsDebugOverlay_overlayColor));
}

@end
