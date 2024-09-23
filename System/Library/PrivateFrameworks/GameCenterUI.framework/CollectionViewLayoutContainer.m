@implementation CollectionViewLayoutContainer

- (CGSize)contentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_1AB5C1D70();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  sub_1AB5C1DA4(a3.width, a3.height);
}

- (CGSize)effectiveContentSize
{
  _TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94429CollectionViewLayoutContainer *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1AB5C1DF8();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = sub_1AB5C1E40();
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  sub_1AB5C1E6C(a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (NSDirectionalEdgeInsets)effectiveContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = sub_1AB5C1E98();
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setEffectiveContentInsets:(NSDirectionalEdgeInsets)a3
{
  sub_1AB5C1EC4(a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (_TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94429CollectionViewLayoutContainer)init
{
  sub_1AB5C1EE4();
}

@end
