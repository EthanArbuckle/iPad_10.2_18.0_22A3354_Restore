@implementation ArtworkView

- (_TtC12GameCenterUI11ArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI11ArtworkView *)sub_1AB5A0F84();
}

- (_TtC12GameCenterUI11ArtworkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5A11A8();
}

- (UIColor)backgroundColor
{
  _TtC12GameCenterUI11ArtworkView *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB5A1754();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC12GameCenterUI11ArtworkView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5A17C8(a3);

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI11ArtworkView *v2;

  v2 = self;
  sub_1AB5A17FC();

}

- (CGRect)frame
{
  _TtC12GameCenterUI11ArtworkView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_1AB5A1CAC();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  _TtC12GameCenterUI11ArtworkView *v3;

  v3 = self;
  sub_1AB5A1D40();

}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI11ArtworkView_shadowView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI11ArtworkView_shadow);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI11ArtworkView_internalBackgroundColor);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI11ArtworkView_artworkTintColor));
}

@end
