@implementation HUDashboardNavigationBar

- (HUDashboardNavigationBar)initWithFrame:(CGRect)a3
{
  HUDashboardNavigationBar *v3;
  HUDashboardNavigationBar *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUDashboardNavigationBar;
  v3 = -[HUDashboardNavigationBar initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUDashboardNavigationBar setPrefersLargeTitles:](v3, "setPrefersLargeTitles:", 1);
    objc_msgSend(MEMORY[0x1E0CEA7B0], "hu_dashboardAppearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardNavigationBar setStandardAppearance:](v4, "setStandardAppearance:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardNavigationBar setTintColor:](v4, "setTintColor:", v6);

  }
  return v4;
}

- (BOOL)isBackgroundVisible
{
  return self->_isBackgroundVisible;
}

- (void)largeTitleHeightDidChange:(double)a3
{
  void *v5;
  double v6;
  double v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;

  -[HUDashboardNavigationBar titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "largeTitleHeightRange");
  v7 = v6;
  v8 = v6 >= a3;

  if (v8 != -[HUDashboardNavigationBar isBackgroundVisible](self, "isBackgroundVisible"))
  {
    -[HUDashboardNavigationBar setIsBackgroundVisible:](self, "setIsBackgroundVisible:", v7 >= a3);
    -[HUDashboardNavigationBar delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF2E7DE8))
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "navigationBar:didChangeBackgroundVisibility:", self, -[HUDashboardNavigationBar isBackgroundVisible](self, "isBackgroundVisible"));
    }

  }
}

- (int64_t)_sceneDraggingBehaviorOnPan
{
  return 2;
}

- (void)setIsBackgroundVisible:(BOOL)a3
{
  self->_isBackgroundVisible = a3;
}

- (HUDashboardNavigationTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
