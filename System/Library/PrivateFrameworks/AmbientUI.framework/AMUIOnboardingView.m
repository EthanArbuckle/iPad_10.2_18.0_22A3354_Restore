@implementation AMUIOnboardingView

- (AMUIOnboardingView)initWithFrame:(CGRect)a3
{
  AMUIOnboardingView *v3;
  AMUIOnboardingView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AMUIOnboardingView;
  v3 = -[AMUIOnboardingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AMUIOnboardingView _setOverrideUserInterfaceStyle:](v3, "_setOverrideUserInterfaceStyle:", 2);
    -[AMUIOnboardingView _onboardingTitle](v4, "_onboardingTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIOnboardingView _setTitle:](v4, "_setTitle:", v5);

    AMUIAmbientUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_DESCRIPTION"), &stru_250764378, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIOnboardingView _setContent:](v4, "_setContent:", v7);

    -[AMUIOnboardingView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 1);

    -[AMUIOnboardingView setMaximumContentSizeCategory:](v4, "setMaximumContentSizeCategory:", *MEMORY[0x24BDF7680]);
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIOnboardingView;
  -[AMUIOnboardingView layoutSubviews](&v3, sel_layoutSubviews);
  -[AMUIOnboardingView _configureContainerScrollViewIfNecessary](self, "_configureContainerScrollViewIfNecessary");
  -[AMUIOnboardingView _configurePackageViewIfNecessary](self, "_configurePackageViewIfNecessary");
  -[AMUIOnboardingView _configureContinueButtonIfNecessary](self, "_configureContinueButtonIfNecessary");
  -[AMUIOnboardingView _layoutPackageViewIfNecessary](self, "_layoutPackageViewIfNecessary");
  -[AMUIOnboardingView _layoutTitleLabelIfNecessary](self, "_layoutTitleLabelIfNecessary");
  -[AMUIOnboardingView _layoutContentLabelIfNecessary](self, "_layoutContentLabelIfNecessary");
  -[AMUIOnboardingView _layoutContinueButtonIfNecessary](self, "_layoutContinueButtonIfNecessary");
  -[AMUIOnboardingView _layoutContainerScrollViewIfNecessary](self, "_layoutContainerScrollViewIfNecessary");
  -[AMUIOnboardingView _configureContinueButtonOcclusionMaterialViewIfNecessary](self, "_configureContinueButtonOcclusionMaterialViewIfNecessary");
  -[AMUIOnboardingView _layoutContinueButtonOcclusionMaterialViewIfNecessary](self, "_layoutContinueButtonOcclusionMaterialViewIfNecessary");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AMUIOnboardingView _contentAllowedWidthForSize:](self, "_contentAllowedWidthForSize:");
  v7 = v6;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:");
  v9 = v8 + 154.0 + 8.0;
  -[UILabel sizeThatFits:](self->_contentLabel, "sizeThatFits:", v7, height);
  v11 = ceil(v9 + v10 + 72.0 + 24.0);
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double Height;
  double v8;
  double v9;
  CGRect v10;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "frame");
  Height = CGRectGetHeight(v10);
  objc_msgSend(v4, "contentSize");
  v9 = v8;

  -[AMUIOnboardingView _toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible:animated:](self, "_toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible:animated:", v6 + Height < v9, 1, v6 + Height);
}

- (id)_onboardingTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  AMUIAmbientUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_TITLE"), &stru_250764378, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AMUIAmbientUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FEATURE_NAME"), &stru_250764378, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_containerScrollView
{
  -[AMUIOnboardingView _configureContainerScrollViewIfNecessary](self, "_configureContainerScrollViewIfNecessary");
  return self->_containerScrollView;
}

- (double)_contentAllowedWidthForSize:(CGSize)a3
{
  return a3.width * 0.5;
}

- (void)_setTitle:(id)a3
{
  void *v4;
  char v5;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v13);

  if ((v5 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (!titleLabel)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
      v8 = self->_titleLabel;
      self->_titleLabel = v7;

      -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
      -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
      -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
      objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BDF7848], *MEMORY[0x24BDF7868]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_titleLabel, "setFont:", v9);
      v10 = self->_titleLabel;
      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v10, "setTextColor:", v11);

      -[UILabel setPreferredVibrancy:](self->_titleLabel, "setPreferredVibrancy:", 1);
      -[AMUIOnboardingView _containerScrollView](self, "_containerScrollView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_titleLabel);

      titleLabel = self->_titleLabel;
    }
    -[UILabel setText:](titleLabel, "setText:", v13);
    -[AMUIOnboardingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setContent:(id)a3
{
  void *v4;
  char v5;
  UILabel *contentLabel;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[UILabel text](self->_contentLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v13);

  if ((v5 & 1) == 0)
  {
    contentLabel = self->_contentLabel;
    if (!contentLabel)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
      v8 = self->_contentLabel;
      self->_contentLabel = v7;

      -[UILabel setNumberOfLines:](self->_contentLabel, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](self->_contentLabel, "setTextAlignment:", 1);
      -[UILabel setAdjustsFontForContentSizeCategory:](self->_contentLabel, "setAdjustsFontForContentSizeCategory:", 1);
      objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BDF77B0], *MEMORY[0x24BDF7888]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_contentLabel, "setFont:", v9);
      v10 = self->_contentLabel;
      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v10, "setTextColor:", v11);

      -[UILabel setPreferredVibrancy:](self->_contentLabel, "setPreferredVibrancy:", 1);
      -[AMUIOnboardingView _containerScrollView](self, "_containerScrollView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_contentLabel);

      contentLabel = self->_contentLabel;
    }
    -[UILabel setText:](contentLabel, "setText:", v13);
    -[AMUIOnboardingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_configureContinueButtonIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIButton *v14;
  UIButton *continueButton;
  _QWORD v16[4];
  id v17;
  id location;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_continueButton)
  {
    objc_msgSend(MEMORY[0x24BDF6888], "filledButtonConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0BF20], "preferredFontProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x24BDF77B0], 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x24BDD1458]);
    AMUIAmbientUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_250764378, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BDF65F8];
    v20[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithString:attributes:", v8, v9);

    objc_msgSend(v3, "setAttributedTitle:", v10);
    objc_msgSend(v3, "setCornerStyle:", 3);
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x24BDF6880];
    v12 = (void *)MEMORY[0x24BDF67B8];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __57__AMUIOnboardingView__configureContinueButtonIfNecessary__block_invoke;
    v16[3] = &unk_250763360;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "actionWithHandler:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buttonWithConfiguration:primaryAction:", v3, v13);
    v14 = (UIButton *)objc_claimAutoreleasedReturnValue();
    continueButton = self->_continueButton;
    self->_continueButton = v14;

    -[AMUIOnboardingView addSubview:](self, "addSubview:", self->_continueButton);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

void __57__AMUIOnboardingView__configureContinueButtonIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "onboardingViewRequestsDismissal:", v3);

    WeakRetained = v3;
  }

}

- (void)_configureContinueButtonOcclusionMaterialViewIfNecessary
{
  _BOOL4 showContinueButtonOcclusionMaterialView;
  MTMaterialView *continueButtonOcclusionMaterialView;
  MTMaterialView *v5;
  MTMaterialView *v6;
  MTMaterialView *v7;

  showContinueButtonOcclusionMaterialView = self->_showContinueButtonOcclusionMaterialView;
  continueButtonOcclusionMaterialView = self->_continueButtonOcclusionMaterialView;
  if (showContinueButtonOcclusionMaterialView)
  {
    if (!continueButtonOcclusionMaterialView)
    {
      objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:", 51);
      v5 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
      v6 = self->_continueButtonOcclusionMaterialView;
      self->_continueButtonOcclusionMaterialView = v5;

      -[MTMaterialView setGroupNameBase:](self->_continueButtonOcclusionMaterialView, "setGroupNameBase:", CFSTR("AMUIOnboardingViewMaterialGroup"));
      -[AMUIOnboardingView addSubview:](self, "addSubview:", self->_continueButtonOcclusionMaterialView);
    }
  }
  else if (continueButtonOcclusionMaterialView)
  {
    -[MTMaterialView removeFromSuperview](continueButtonOcclusionMaterialView, "removeFromSuperview");
    v7 = self->_continueButtonOcclusionMaterialView;
    self->_continueButtonOcclusionMaterialView = 0;

  }
}

- (id)_onboardingViewPackageName
{
  __CFString *v2;

  if (-[AMUIOnboardingView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    objc_msgSend(CFSTR("AmbientOnboardingAsset"), "stringByAppendingString:", CFSTR("-RTL"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("AmbientOnboardingAsset");
  }
  return v2;
}

- (void)_configurePackageViewIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  BSUICAPackageView *v6;
  BSUICAPackageView *packageView;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[5];

  if (!self->_packageView)
  {
    v3 = objc_alloc(MEMORY[0x24BE0BF18]);
    -[AMUIOnboardingView _onboardingViewPackageName](self, "_onboardingViewPackageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (BSUICAPackageView *)objc_msgSend(v3, "initWithPackageName:inBundle:", v4, v5);
    packageView = self->_packageView;
    self->_packageView = v6;

    -[AMUIOnboardingView _containerScrollView](self, "_containerScrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_packageView);

    self->_packageViewStateIndex = 0;
    v9 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__AMUIOnboardingView__configurePackageViewIfNecessary__block_invoke;
    block[3] = &unk_250763388;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __54__AMUIOnboardingView__configurePackageViewIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextAnimationForPackageViewAnimated:", 1);
}

- (void)_configureContainerScrollViewIfNecessary
{
  id v3;
  UIScrollView *v4;
  UIScrollView *containerScrollView;

  if (!self->_containerScrollView)
  {
    v3 = objc_alloc(MEMORY[0x24BDF6D50]);
    -[AMUIOnboardingView bounds](self, "bounds");
    v4 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:");
    containerScrollView = self->_containerScrollView;
    self->_containerScrollView = v4;

    -[UIScrollView setShowsVerticalScrollIndicator:](self->_containerScrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setClipsToBounds:](self->_containerScrollView, "setClipsToBounds:", 0);
    -[UIScrollView setDelegate:](self->_containerScrollView, "setDelegate:", self);
    -[AMUIOnboardingView addSubview:](self, "addSubview:", self->_containerScrollView);
  }
}

- (void)_layoutTitleLabelIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGRect v13;

  if (self->_titleLabel)
  {
    -[AMUIOnboardingView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[AMUIOnboardingView _contentAllowedWidthForSize:](self, "_contentAllowedWidthForSize:", v7, v9);
    v12 = v11;
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.width = v8;
    v13.size.height = v10;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, CGRectGetHeight(v13));
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  }
}

- (void)_layoutContentLabelIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;

  if (self->_contentLabel)
  {
    -[AMUIOnboardingView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[AMUIOnboardingView _contentAllowedWidthForSize:](self, "_contentAllowedWidthForSize:", v7, v9);
    v12 = v11;
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.width = v8;
    v13.size.height = v10;
    -[UILabel sizeThatFits:](self->_contentLabel, "sizeThatFits:", v12, CGRectGetHeight(v13));
    -[UILabel frame](self->_titleLabel, "frame");
    CGRectGetMaxY(v14);
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_contentLabel, "setFrame:");
  }
}

- (void)_layoutPackageViewIfNecessary
{
  if (self->_packageView)
  {
    -[AMUIOnboardingView bounds](self, "bounds");
    -[BSUICAPackageView frame](self->_packageView, "frame");
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    -[BSUICAPackageView setFrame:](self->_packageView, "setFrame:");
  }
}

- (void)_layoutContinueButtonOcclusionMaterialViewIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;
  CGRect v12;

  if (self->_continueButtonOcclusionMaterialView)
  {
    -[AMUIOnboardingView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[MTMaterialView frame](self->_continueButtonOcclusionMaterialView, "frame");
    v11.origin.x = v4;
    v11.origin.y = v6;
    v11.size.width = v8;
    v11.size.height = v10;
    CGRectGetHeight(v11);
    v12.origin.x = v4;
    v12.origin.y = v6;
    v12.size.width = v8;
    v12.size.height = v10;
    CGRectGetWidth(v12);
    UIRectIntegralWithScale();
    -[MTMaterialView setFrame:](self->_continueButtonOcclusionMaterialView, "setFrame:");
    -[AMUIOnboardingView bringSubviewToFront:](self, "bringSubviewToFront:", self->_continueButton);
  }
}

- (void)_layoutContinueButtonIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;
  CGRect v12;

  if (self->_continueButton)
  {
    -[AMUIOnboardingView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIButton frame](self->_continueButton, "frame");
    v11.origin.x = v4;
    v11.origin.y = v6;
    v11.size.width = v8;
    v11.size.height = v10;
    CGRectGetWidth(v11);
    v12.origin.x = v4;
    v12.origin.y = v6;
    v12.size.width = v8;
    v12.size.height = v10;
    CGRectGetMaxY(v12);
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    -[UIButton setFrame:](self->_continueButton, "setFrame:");
    -[AMUIOnboardingView bringSubviewToFront:](self, "bringSubviewToFront:", self->_continueButton);
  }
}

- (void)_layoutContainerScrollViewIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MaxY;
  double v17;
  BOOL v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  if (self->_containerScrollView)
  {
    -[AMUIOnboardingView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIScrollView frame](self->_containerScrollView, "frame");
    -[UIButton frame](self->_continueButton, "frame");
    v11 = CGRectGetMinY(v19) + -24.0;
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    CGRectGetWidth(v20);
    UIRectIntegralWithScale();
    v13 = v12;
    v15 = v14;
    -[UIScrollView setFrame:](self->_containerScrollView, "setFrame:");
    -[UILabel frame](self->_contentLabel, "frame");
    MaxY = CGRectGetMaxY(v21);
    if (MaxY <= v11)
    {
      -[UIScrollView setScrollEnabled:](self->_containerScrollView, "setScrollEnabled:", 0);
      v18 = 0;
      v17 = v15;
    }
    else
    {
      v17 = MaxY;
      v18 = 1;
    }
    self->_showContinueButtonOcclusionMaterialView = v18;
    -[UIScrollView setContentSize:](self->_containerScrollView, "setContentSize:", v13, v17);
  }
}

- (void)_performNextAnimationForPackageViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int64_t v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->_packageView)
  {
    v3 = a3;
    objc_msgSend(&unk_250778B38, "objectAtIndexedSubscript:", self->_packageViewStateIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUICAPackageView setState:animated:transitionSpeed:completion:](self->_packageView, "setState:animated:transitionSpeed:completion:", v5, v3, 0, 1.0);
    objc_initWeak(&location, self);
    if (v3)
      v6 = 2200000000;
    else
      v6 = 0;
    v7 = dispatch_time(0, v6);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__AMUIOnboardingView__performNextAnimationForPackageViewAnimated___block_invoke;
    v8[3] = &unk_2507633B0;
    objc_copyWeak(&v9, &location);
    dispatch_after(v7, MEMORY[0x24BDAC9B8], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
}

void __66__AMUIOnboardingView__performNextAnimationForPackageViewAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 55) + 1;
    *((_QWORD *)WeakRetained + 55) = v3;
    v5 = WeakRetained;
    v4 = objc_msgSend(&unk_250778B50, "count");
    if (v3 >= v4)
      v5[55] = 0;
    objc_msgSend(v5, "_performNextAnimationForPackageViewAnimated:", v3 < v4);
    v2 = v5;
  }

}

- (void)_toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible:(BOOL)a3 animated:(BOOL)a4
{
  double v5;
  MTMaterialView *v6;
  MTMaterialView *v7;
  void *v8;
  _QWORD v9[4];
  MTMaterialView *v10;
  double v11;

  if (a3)
    v5 = 1.0;
  else
    v5 = 0.0;
  v6 = self->_continueButtonOcclusionMaterialView;
  v7 = v6;
  if (a4)
  {
    v8 = (void *)MEMORY[0x24BDF6F90];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __93__AMUIOnboardingView__toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible_animated___block_invoke;
    v9[3] = &unk_2507633D8;
    v10 = v6;
    v11 = v5;
    objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 0, v9, 0, 0.25, 0.0);

  }
  else
  {
    -[MTMaterialView setAlpha:](v6, "setAlpha:", v5);
  }

}

uint64_t __93__AMUIOnboardingView__toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (AMUIOnboardingViewDelegate)delegate
{
  return (AMUIOnboardingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_continueButtonOcclusionMaterialView, 0);
  objc_storeStrong((id *)&self->_containerScrollView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
