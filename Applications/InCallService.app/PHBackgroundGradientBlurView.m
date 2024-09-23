@implementation PHBackgroundGradientBlurView

- (UIImage)image
{
  return (UIImage *)sub_100192FB8();
}

- (void)setImage:(id)a3
{
  id v4;
  PHBackgroundGradientBlurView *v5;

  v4 = a3;
  v5 = self;
  sub_100193010(v4);

}

- (PHBackgroundGradientBlurView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100193094();
}

- (PHBackgroundGradientBlurView)initWithImage:(id)a3
{
  return (PHBackgroundGradientBlurView *)sub_100193120(a3);
}

- (PHBackgroundGradientBlurView)initWithFrame:(CGRect)a3
{
  sub_1001937AC();
}

- (void).cxx_destruct
{

}

@end
