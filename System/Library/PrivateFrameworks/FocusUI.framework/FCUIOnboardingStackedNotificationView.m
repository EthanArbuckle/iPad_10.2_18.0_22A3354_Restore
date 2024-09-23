@implementation FCUIOnboardingStackedNotificationView

- (FCUIOnboardingStackedNotificationView)initWithBackgroundColor:(id)a3 assetImageName:(id)a4
{
  id v6;
  FCUIOnboardingStackedNotificationView *v7;
  FCUIOnboardingStackedNotificationView *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FCUIOnboardingStackedNotificationView;
  v7 = -[FCUIOnboardingStackedNotificationView init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_assetImageName, a4);

  return v8;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)FCUIOnboardingStackedNotificationView;
  -[FCUIOnboardingStackedNotificationView layoutSubviews](&v20, sel_layoutSubviews);
  -[FCUIOnboardingStackedNotificationView _configureViewIfNecessary](self, "_configureViewIfNecessary");
  -[FCUIOnboardingStackedNotificationView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  -[FCUIOnboardingStackedNotificationView bounds](self, "bounds");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  v19 = CGRectGetWidth(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v10 = CGRectGetHeight(v22) + -12.0;
  if (v10 <= 30.0)
    v11 = v10;
  else
    v11 = 30.0;
  UIRectCenteredYInRectScale();
  v13 = v12;
  -[UIView setFrame:](self->_assetView, "setFrame:", v14 + 10.0, v5, *(_QWORD *)&v19);
  UIRectIntegralWithScale();
  -[UIView setFrame:](self->_line1TextView, "setFrame:", v13 + v15 + 20.0, v16 + 6.0);
  UIRectIntegralWithScale();
  -[UIView setFrame:](self->_line2TextView, "setFrame:", v13 + v17 + 20.0, v11 * 0.25 + v18 + 12.0);
}

- (void)_configureViewIfNecessary
{
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v4;
  MTMaterialView *v5;
  MTMaterialView *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  MTMaterialView *v11;
  MTVisualStylingProvider *v12;
  MTVisualStylingProvider *visualStylingProvider;
  void *v14;
  void *v15;
  UIView *v16;
  UIView *assetView;
  UIView *v18;
  void *v19;
  UIView *v20;
  UIView *v21;
  UIView *v22;
  void *v23;
  UIView *v24;
  UIView *line1TextView;
  UIView *v26;
  void *v27;
  UIView *v28;
  UIView *line2TextView;
  UIView *v30;
  void *v31;

  -[FCUIOnboardingStackedNotificationView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 10.0);
  backgroundMaterialView = self->_backgroundMaterialView;
  if (!backgroundMaterialView)
  {
    objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:options:", 1, 0);
    v4 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v4;

    v6 = self->_backgroundMaterialView;
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%p"), v9, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView setGroupNameBase:](v6, "setGroupNameBase:", v10);

    -[FCUIOnboardingStackedNotificationView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundMaterialView, 0);
    v11 = self->_backgroundMaterialView;
    -[FCUIOnboardingStackedNotificationView bounds](self, "bounds");
    -[MTMaterialView setFrame:](v11, "setFrame:");
    -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);
    -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundMaterialView, "_setContinuousCornerRadius:", 10.0);
    backgroundMaterialView = self->_backgroundMaterialView;
  }
  -[MTMaterialView visualStylingProviderForCategory:](backgroundMaterialView, "visualStylingProviderForCategory:", 1);
  v12 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
  visualStylingProvider = self->_visualStylingProvider;
  self->_visualStylingProvider = v12;

  -[FCUIOnboardingStackedNotificationView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  if (!self->_assetView)
  {
    if (self->_assetImageName)
    {
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 2, 60.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", self->_assetImageName, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v15);
      assetView = self->_assetView;
      self->_assetView = v16;

      v18 = self->_assetView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTintColor:](v18, "setTintColor:", v19);

    }
    else
    {
      v20 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      v21 = self->_assetView;
      self->_assetView = v20;

      v22 = self->_assetView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

      -[UIView _setContinuousCornerRadius:](self->_assetView, "_setContinuousCornerRadius:", 10.0);
    }
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self->_assetView, 1);
    -[FCUIOnboardingStackedNotificationView addSubview:](self, "addSubview:", self->_assetView);
  }
  if (!self->_line1TextView)
  {
    v24 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    line1TextView = self->_line1TextView;
    self->_line1TextView = v24;

    v26 = self->_line1TextView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    -[UIView _setContinuousCornerRadius:](self->_line1TextView, "_setContinuousCornerRadius:", 3.0);
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self->_line1TextView, 1);
    -[FCUIOnboardingStackedNotificationView addSubview:](self, "addSubview:", self->_line1TextView);
  }
  if (!self->_line2TextView)
  {
    v28 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    line2TextView = self->_line2TextView;
    self->_line2TextView = v28;

    v30 = self->_line2TextView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v30, "setBackgroundColor:", v31);

    -[UIView _setContinuousCornerRadius:](self->_line2TextView, "_setContinuousCornerRadius:", 3.0);
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self->_line2TextView, 1);
    -[FCUIOnboardingStackedNotificationView addSubview:](self, "addSubview:", self->_line2TextView);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextView, 0);
  objc_storeStrong((id *)&self->_line1TextView, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_assetImageName, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end
