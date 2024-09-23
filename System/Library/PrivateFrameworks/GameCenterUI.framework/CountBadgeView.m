@implementation CountBadgeView

- (_TtC12GameCenterUI14CountBadgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB7BFE78();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI14CountBadgeView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1AB7BFEFC();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI14CountBadgeView *v2;

  v2 = self;
  sub_1AB7C0088();

}

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  _TtC12GameCenterUI14CountBadgeView *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB7C0240();

  return (NSLayoutYAxisAnchor *)v3;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityCountLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB7C028C();
}

- (_TtC12GameCenterUI14CountBadgeView)initWithFrame:(CGRect)a3
{
  sub_1AB7C029C();
}

- (void).cxx_destruct
{

}

@end
