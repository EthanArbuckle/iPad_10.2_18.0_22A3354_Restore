@implementation InAppPurchaseView

- (_TtC8AppStore17InAppPurchaseView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002AB4DC();
}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
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
  sub_1002AA2A0();

}

- (void)layoutSubviews
{
  _TtC8AppStore17InAppPurchaseView *v2;

  v2 = self;
  sub_1002AA3A4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC8AppStore17InAppPurchaseView *v3;
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

- (_TtC8AppStore17InAppPurchaseView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore17InAppPurchaseView *result;

  result = (_TtC8AppStore17InAppPurchaseView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.InAppPurchaseView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17InAppPurchaseView_artworkContainingView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17InAppPurchaseView_tileIconArtworkView));

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore17InAppPurchaseView_theme;
  v4 = type metadata accessor for InAppPurchaseTheme(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore17InAppPurchaseView_metrics;
  v6 = type metadata accessor for InAppPurchaseIconLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
