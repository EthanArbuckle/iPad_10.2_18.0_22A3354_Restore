@implementation InAppPurchaseView

- (_TtC20ProductPageExtension17InAppPurchaseView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004BE1E8();
}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[InAppPurchaseView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[InAppPurchaseView setBackgroundColor:](&v6, "setBackgroundColor:", v4);
  sub_1004BD174();

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension17InAppPurchaseView *v2;

  v2 = self;
  sub_1004BD278();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC20ProductPageExtension17InAppPurchaseView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = InAppPurchaseIconLayout.Metrics.overallSize.getter();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC20ProductPageExtension17InAppPurchaseView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension17InAppPurchaseView *result;

  result = (_TtC20ProductPageExtension17InAppPurchaseView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.InAppPurchaseView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_artworkContainingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_plusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_tileIconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_tileBorderView));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_theme;
  v5 = type metadata accessor for InAppPurchaseTheme(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension17InAppPurchaseView_metrics;
  v7 = type metadata accessor for InAppPurchaseIconLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

@end
