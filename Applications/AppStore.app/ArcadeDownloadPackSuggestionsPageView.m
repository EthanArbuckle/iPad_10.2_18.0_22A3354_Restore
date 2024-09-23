@implementation ArcadeDownloadPackSuggestionsPageView

- (_TtC8AppStore37ArcadeDownloadPackSuggestionsPageView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore37ArcadeDownloadPackSuggestionsPageView *)sub_100611430(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore37ArcadeDownloadPackSuggestionsPageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100612808();
}

- (CGSize)intrinsicContentSize
{
  _TtC8AppStore37ArcadeDownloadPackSuggestionsPageView *v2;
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
  -[ArcadeDownloadPackSuggestionsPageView bounds](v2, "bounds");
  v4 = v3;
  v5 = JUMeasuringSizeExpanded[1];
  v6 = -[ArcadeDownloadPackSuggestionsPageView traitCollection](v2, "traitCollection");
  sub_100611AEC(v14);
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
  _TtC8AppStore37ArcadeDownloadPackSuggestionsPageView *v5;
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
  v6 = -[ArcadeDownloadPackSuggestionsPageView traitCollection](v5, "traitCollection");
  sub_100611AEC(v14);
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
  _TtC8AppStore37ArcadeDownloadPackSuggestionsPageView *v2;

  v2 = self;
  sub_100612110();

}

- (void)invalidateMeasurements
{
  _TtC8AppStore37ArcadeDownloadPackSuggestionsPageView *v2;

  v2 = self;
  -[ArcadeDownloadPackSuggestionsPageView setNeedsLayout](v2, "setNeedsLayout");
  -[ArcadeDownloadPackSuggestionsPageView invalidateIntrinsicContentSize](v2, "invalidateIntrinsicContentSize");

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC8AppStore37ArcadeDownloadPackSuggestionsPageView *v2;

  v2 = self;
  sub_100612288();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37ArcadeDownloadPackSuggestionsPageView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37ArcadeDownloadPackSuggestionsPageView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37ArcadeDownloadPackSuggestionsPageView_gamesView));
  swift_release(*(_QWORD *)&self->wordmarkView[OBJC_IVAR____TtC8AppStore37ArcadeDownloadPackSuggestionsPageView_impressionsUpdateBlock]);
}

@end
