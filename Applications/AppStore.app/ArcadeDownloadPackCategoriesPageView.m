@implementation ArcadeDownloadPackCategoriesPageView

- (_TtC8AppStore36ArcadeDownloadPackCategoriesPageView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36ArcadeDownloadPackCategoriesPageView *)sub_1003CDAA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36ArcadeDownloadPackCategoriesPageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003CEEB4();
}

- (CGSize)intrinsicContentSize
{
  _TtC8AppStore36ArcadeDownloadPackCategoriesPageView *v2;
  double v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  v2 = self;
  -[ArcadeDownloadPackCategoriesPageView bounds](v2, "bounds");
  v4 = v3;
  v5 = JUMeasuringSizeExpanded[1];
  v6 = -[ArcadeDownloadPackCategoriesPageView traitCollection](v2, "traitCollection");
  sub_1003CE184(v14);
  v7 = v15;
  v8 = v16;
  sub_100060B40(v14, v15);
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v7, v8, v4, v5);
  v11 = v10;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore36ArcadeDownloadPackCategoriesPageView *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[ArcadeDownloadPackCategoriesPageView traitCollection](v5, "traitCollection");
  sub_1003CE184(v14);
  v7 = v15;
  v8 = v16;
  sub_100060B40(v14, v15);
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v7, v8, width, height);
  v11 = v10;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = v17.receiver;
  -[ArcadeDownloadPackCategoriesPageView layoutSubviews](&v17, "layoutSubviews");
  sub_1003CE184(v14);
  v3 = v15;
  v4 = v16;
  sub_100060B40(v14, v15);
  objc_msgSend(v2, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v2, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v13, v3, v4, v6, v8, v10, v12);

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v14);
}

- (void)invalidateMeasurements
{
  _TtC8AppStore36ArcadeDownloadPackCategoriesPageView *v2;

  v2 = self;
  sub_1003CE87C();

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC8AppStore36ArcadeDownloadPackCategoriesPageView *v2;

  v2 = self;
  sub_1003CEB04();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCategoriesPageView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCategoriesPageView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCategoriesPageView_categoriesView));
}

@end
