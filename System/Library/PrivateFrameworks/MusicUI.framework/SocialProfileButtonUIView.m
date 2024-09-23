@implementation SocialProfileButtonUIView

- (SocialProfileButtonUIView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21CF6F104();
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 28.0;
  v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 28.0;
  v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)layoutSubviews
{
  SocialProfileButtonUIView *v2;

  v2 = self;
  sub_21CF6F2D0();

}

- (void)_tapGestureAction:(id)a3
{
  id v4;
  SocialProfileButtonUIView *v5;

  v4 = a3;
  v5 = self;
  sub_21CF6FB50();

}

- (SocialProfileButtonUIView)initWithFrame:(CGRect)a3
{
  sub_21CF6FCC4();
}

- (void).cxx_destruct
{

  swift_release();
}

@end
