@implementation TodayCardLockupView

- (_TtC22SubscribePageExtension19TodayCardLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension19TodayCardLockupView *)sub_10028EAB8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC22SubscribePageExtension19TodayCardLockupView *v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12[24];
  _QWORD v13[43];
  _QWORD v14[43];
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[TodayCardLockupView traitCollection](v4, "traitCollection");
  sub_10028D408((uint64_t)v14);
  v6 = (uint64_t)v4 + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView_axMetrics;
  swift_beginAccess((char *)v4 + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView_axMetrics, v12, 0, 0);
  sub_100076534(v6, (uint64_t)v13);
  -[TodayCardLockupView layoutMargins](v4, "layoutMargins");
  v7 = sub_10028E66C((uint64_t)v14, (uint64_t)v13, v5, width);
  v9 = v8;
  sub_100076570(v13);
  sub_100076570(v14);

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC22SubscribePageExtension19TodayCardLockupView *v2;
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_10028D9BC();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC22SubscribePageExtension19TodayCardLockupView *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  uint64_t v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v3 = (objc_class *)type metadata accessor for TodayCardLockupView();
  v12.receiver = self;
  v12.super_class = v3;
  v4 = self;
  -[TodayCardLockupView layoutSubviews](&v12, "layoutSubviews");
  sub_10028DB74(v9);
  v5 = v10;
  v6 = v11;
  sub_100011064(v9, v10);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(v3);
  v8 = -[TodayCardLockupView traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v8, v5, v6, v7);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v9);
}

- (void).cxx_destruct
{
  sub_100076570((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView_metrics));
  sub_100076570((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView_axMetrics));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView_crossLinkSubtitleLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView_crossLinkPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView_searchAdTertiaryLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView____lazy_storage___lockupViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView____lazy_storage___crossLinkViews));
}

- (_TtC22SubscribePageExtension25SearchAdTransparencyLabel)accessibilityAdLabel
{
  return (_TtC22SubscribePageExtension25SearchAdTransparencyLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension19TodayCardLockupView_searchAdTertiaryLabel);
}

@end
