@implementation TodayCardLockupView

- (_TtC20ProductPageExtension19TodayCardLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension19TodayCardLockupView *)sub_1005480C4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC20ProductPageExtension19TodayCardLockupView *v4;
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
  sub_100546A58((uint64_t)v14);
  v6 = (uint64_t)v4 + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView_axMetrics;
  swift_beginAccess((char *)v4 + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView_axMetrics, v12, 0, 0);
  sub_100225678(v6, (uint64_t)v13);
  -[TodayCardLockupView layoutMargins](v4, "layoutMargins");
  v7 = sub_100547CBC((uint64_t)v14, (uint64_t)v13, v5, width);
  v9 = v8;
  sub_1002256B4(v13);
  sub_1002256B4(v14);

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC20ProductPageExtension19TodayCardLockupView *v2;
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_10054700C();
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
  _TtC20ProductPageExtension19TodayCardLockupView *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15[3];
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v3 = (objc_class *)type metadata accessor for TodayCardLockupView();
  v18.receiver = self;
  v18.super_class = v3;
  v4 = self;
  -[TodayCardLockupView layoutSubviews](&v18, "layoutSubviews");
  sub_1005471C4(v15);
  v5 = v16;
  v6 = v17;
  sub_100010F08(v15, v16);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(v3);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[TodayCardLockupView traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v14, v5, v6, v7, v9, v11, v13);

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v15);
}

- (void).cxx_destruct
{
  sub_1002256B4((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView_metrics));
  sub_1002256B4((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView_axMetrics));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView_crossLinkSubtitleLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView_searchAdTertiaryLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView____lazy_storage___lockupViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView____lazy_storage___crossLinkViews));
}

- (_TtC20ProductPageExtension25SearchAdTransparencyLabel)accessibilityAdLabel
{
  return (_TtC20ProductPageExtension25SearchAdTransparencyLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension19TodayCardLockupView_searchAdTertiaryLabel);
}

@end
