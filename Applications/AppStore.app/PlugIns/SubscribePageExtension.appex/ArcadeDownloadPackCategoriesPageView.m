@implementation ArcadeDownloadPackCategoriesPageView

- (_TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView *)sub_1000A159C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000A29C0();
}

- (CGSize)intrinsicContentSize
{
  _TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView *v2;
  double v3;
  double v4;
  double v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  CGSize result;

  v2 = self;
  -[ArcadeDownloadPackCategoriesPageView bounds](v2, "bounds");
  v4 = v3;
  v5 = JUMeasuringSizeExpanded[1];
  v6 = -[ArcadeDownloadPackCategoriesPageView traitCollection](v2, "traitCollection");
  sub_1000A1C78(v15, v7);
  v8 = v16;
  v9 = v17;
  sub_100011064(v15, v16);
  v10 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v8, v9, v4, v5);
  v12 = v11;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v15);

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView *v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[ArcadeDownloadPackCategoriesPageView traitCollection](v5, "traitCollection");
  sub_1000A1C78(v15, v7);
  v8 = v16;
  v9 = v17;
  sub_100011064(v15, v16);
  v10 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v8, v9, width, height);
  v12 = v11;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v15);

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  __n128 v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  id v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v2 = v12.receiver;
  -[ArcadeDownloadPackCategoriesPageView layoutSubviews](&v12, "layoutSubviews");
  sub_1000A1C78(v9, v3);
  v4 = v10;
  v5 = v11;
  sub_100011064(v9, v10);
  objc_msgSend(v2, "bounds");
  v7 = v6;
  v8 = objc_msgSend(v2, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v8, v4, v5, v7);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v9);
}

- (void)invalidateMeasurements
{
  _TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView *v2;

  v2 = self;
  sub_1000A2378();

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView *v2;

  v2 = self;
  sub_1000A2600();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView_categoriesView));
}

@end
