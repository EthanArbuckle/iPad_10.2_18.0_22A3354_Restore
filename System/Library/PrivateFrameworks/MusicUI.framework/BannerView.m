@implementation BannerView

- (_TtC7MusicUI10BannerView)initWithCoder:(id)a3
{
  sub_21D159498();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC7MusicUI10BannerView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_21D1594FC();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC7MusicUI10BannerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_21D1595A4();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC7MusicUI10BannerView)initWithFrame:(CGRect)a3
{
  BannerView.init(frame:)();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_5_11((uint64_t)self, OBJC_IVAR____TtC7MusicUI10BannerView_contentView);
}

@end
