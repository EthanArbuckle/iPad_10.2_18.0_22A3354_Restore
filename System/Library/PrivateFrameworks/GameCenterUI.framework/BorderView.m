@implementation BorderView

- (_TtC12GameCenterUI10BorderView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI10BorderView *)sub_1AB5C8298(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI10BorderView)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI10BorderView *)sub_1AB5C8338(a3);
}

- (UIColor)backgroundColor
{
  _TtC12GameCenterUI10BorderView *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB5A1754();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC12GameCenterUI10BorderView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5C8420(a3);

}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)setClipsToBounds:(BOOL)a3
{
  _TtC12GameCenterUI10BorderView *v3;

  v3 = self;
  sub_1AB5C8504();

}

@end
