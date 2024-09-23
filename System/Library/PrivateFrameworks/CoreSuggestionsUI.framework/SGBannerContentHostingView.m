@implementation SGBannerContentHostingView

- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)initWithBanner:(id)a3
{
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *result;

  SGBannerContentHostingView.init(banner:)(a3);
  OUTLINED_FUNCTION_41();
  return result;
}

- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B119D188();
}

- (void)updateBannerViews
{
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *v2;

  v2 = self;
  sub_1B119D234();
  OUTLINED_FUNCTION_3(v2);
}

- (void)updateWithBanner:(id)a3
{
  id v4;
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_49_0();
  sub_1B119D39C(v6);

  OUTLINED_FUNCTION_8_1(v7);
}

- (void)setSuggestionWithStore:(id)a3
{
  id v4;
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_49_0();
  sub_1B119D408(v6);

  OUTLINED_FUNCTION_8_1(v7);
}

- (void)invalidateBannerView
{
  sub_1B119D468();
}

- (void)reload
{
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *v2;

  v2 = self;
  sub_1B119D49C();
  OUTLINED_FUNCTION_3(v2);
}

- (double)actionButtonLeadingEdgeOffset
{
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *v2;
  double v3;

  v2 = self;
  v3 = sub_1B119D684();

  return v3;
}

- (CGSize)intrinsicContentSize
{
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = self;
  sub_1B119D7D4();

  OUTLINED_FUNCTION_17_4();
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)initWithFrame:(CGRect)a3
{
  SGBannerContentHostingView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore));
  swift_release();
}

@end
