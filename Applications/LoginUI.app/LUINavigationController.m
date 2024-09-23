@implementation LUINavigationController

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUINavigationController;
  -[LUINavigationController loadView](&v5, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.150000006));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUINavigationController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
