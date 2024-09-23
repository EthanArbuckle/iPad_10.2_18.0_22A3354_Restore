@implementation UINavigationBar

- (UIView)largeTitleView
{
  UINavigationBar *v2;
  void *v3;

  v2 = self;
  v3 = sub_100062974();

  return (UIView *)v3;
}

- (BOOL)shouldHideBarButtonItem
{
  UINavigationBar *v2;
  UIView *v3;
  UIView *v4;
  double v5;
  double v6;

  v2 = self;
  v3 = -[UINavigationBar largeTitleView](v2, "largeTitleView");
  if (v3)
  {
    v4 = v3;
    -[UIView alpha](v3, "alpha");
    v6 = v5;

    return v6 != 0.0;
  }
  else
  {

    return 0;
  }
}

@end
