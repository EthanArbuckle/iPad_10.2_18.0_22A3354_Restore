@implementation BannerAdMetricsView

- (_TtC7NewsAds19BannerAdMetricsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA27BB64();
}

- (void)layoutSubviews
{
  _TtC7NewsAds19BannerAdMetricsView *v2;

  v2 = self;
  sub_1BA27ABBC();

}

- (_TtC7NewsAds19BannerAdMetricsView)initWithFrame:(CGRect)a3
{
  _TtC7NewsAds19BannerAdMetricsView *result;

  result = (_TtC7NewsAds19BannerAdMetricsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BA23C2E0((uint64_t)self + OBJC_IVAR____TtC7NewsAds19BannerAdMetricsView_contentInfo);
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds19BannerAdMetricsView_promotedContentInfoObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds19BannerAdMetricsView_unfilledReasonObserver));
}

- (void)metricsViewReady:(id)a3
{
  id v4;
  _TtC7NewsAds19BannerAdMetricsView *v5;

  v4 = a3;
  v5 = self;
  sub_1BA27AF40(v4);

}

- (void)metricsViewCollapsed:(id)a3
{
  id v5;
  _TtC7NewsAds19BannerAdMetricsView *v6;

  sub_1BA23C4E8();
  v5 = a3;
  v6 = self;
  sub_1BA2C17D8();

}

@end
