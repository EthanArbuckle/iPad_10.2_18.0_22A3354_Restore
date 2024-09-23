@implementation CNMeCardSharingSettingsHeaderViewController

- (CNMeCardSharingSettingsHeaderViewController)initWithAvatarProvider:(id)a3
{
  return -[CNMeCardSharingSettingsHeaderViewController initWithAvatarProvider:mode:](self, "initWithAvatarProvider:mode:", a3, 0);
}

- (CNMeCardSharingSettingsHeaderViewController)initWithAvatarProvider:(id)a3 mode:(int64_t)a4
{
  id v7;
  CNMeCardSharingSettingsHeaderViewController *v8;
  CNMeCardSharingSettingsHeaderViewController *v9;
  CNMeCardSharingSettingsHeaderViewController *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNMeCardSharingSettingsHeaderViewController;
  v8 = -[CNMeCardSharingSettingsHeaderViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_avatarProvider, a3);
    v9->_mode = a4;
    v10 = v9;
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CNMeCardSharingAvatarViewController *v5;
  CNMeCardSharingAvatarViewController *avatarViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  UIButton *v21;
  UIButton *toggleAnimationButton;
  UIButton *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIButton *v28;
  UIButton *labelButton;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CNMeCardSharingSettingsHeaderViewController;
  -[CNMeCardSharingSettingsHeaderViewController viewDidLoad](&v36, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = -[CNMeCardSharingAvatarViewController initWithAvatarProvider:mode:]([CNMeCardSharingAvatarViewController alloc], "initWithAvatarProvider:mode:", self->_avatarProvider, self->_mode);
  avatarViewController = self->_avatarViewController;
  self->_avatarViewController = v5;

  -[CNMeCardSharingAvatarViewController setDelegate:](self->_avatarViewController, "setDelegate:", self);
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingAvatarViewController view](self->_avatarViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[CNMeCardSharingSettingsHeaderViewController addChildViewController:](self, "addChildViewController:", self->_avatarViewController);
  -[CNMeCardSharingAvatarViewController didMoveToParentViewController:](self->_avatarViewController, "didMoveToParentViewController:", self);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setButtonSize:", 3);
  v10 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationWithHierarchicalColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4AE8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationByApplyingConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredSymbolConfigurationForImage:", v14);

  v15 = (void *)MEMORY[0x1E0DC3870];
  -[CNMeCardSharingSettingsHeaderViewController toggleAnimationButtonImageName](self, "toggleAnimationButtonImageName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemImageNamed:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v17);

  objc_initWeak(&location, self);
  v18 = (void *)MEMORY[0x1E0DC3428];
  v19 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke;
  v33[3] = &unk_1E204CD40;
  objc_copyWeak(&v34, &location);
  objc_msgSend(v18, "actionWithHandler:", v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v9, v20);
  v21 = (UIButton *)objc_claimAutoreleasedReturnValue();
  toggleAnimationButton = self->_toggleAnimationButton;
  self->_toggleAnimationButton = v21;

  -[UIButton setMaximumContentSizeCategory:](self->_toggleAnimationButton, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
  v23 = self->_toggleAnimationButton;
  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke_2;
  v31[3] = &unk_1E204B3B0;
  objc_copyWeak(&v32, &location);
  -[UIButton setConfigurationUpdateHandler:](v23, "setConfigurationUpdateHandler:", v31);
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", self->_toggleAnimationButton);

  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setButtonSize:", 1);
  objc_msgSend(v25, "setCornerStyle:", 4);
  objc_msgSend(v25, "setContentInsets:", 8.0, 10.0, 8.0, 10.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBaseForegroundColor:", v26);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBaseBackgroundColor:", v27);

  objc_msgSend(v25, "setTitleTextAttributesTransformer:", &__block_literal_global_27678);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v25, 0);
  v28 = (UIButton *)objc_claimAutoreleasedReturnValue();
  labelButton = self->_labelButton;
  self->_labelButton = v28;

  -[CNMeCardSharingSettingsHeaderViewController updateButtonLabel](self, "updateButtonLabel");
  -[UIButton addTarget:action:forControlEvents:](self->_labelButton, "addTarget:action:forControlEvents:", self, sel_labelButtonTapped_, 64);
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", self->_labelButton);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

- (double)separatorHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = 1.0 / v8;

  }
  else
  {
    v9 = 1.0;
  }

  return v9;
}

- (CGRect)avatarViewControllerFrame
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  -[CNMeCardSharingSettingsHeaderViewController availableAvatarSpace](self, "availableAvatarSpace");
  v10 = v9;
  -[CNMeCardSharingSettingsHeaderViewController maxAvatarHeight](self, "maxAvatarHeight");
  v12 = v11;
  -[CNMeCardSharingSettingsHeaderViewController minAvatarHeight](self, "minAvatarHeight");
  if (v12 >= v10)
    v14 = v10;
  else
    v14 = v12;
  if (v13 >= v14)
    v15 = v13;
  else
    v15 = v14;
  -[CNMeCardSharingSettingsHeaderViewController avatarViewController](self, "avatarViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  if (objc_msgSend(v16, "showsPosterAnimation"))
  {
    v18 = v5 / v8;
    if (v5 / v8 < v8 / v5)
      v18 = v8 / v5;
    v17 = v15 / v18;
  }

  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v20 = floor((CGRectGetWidth(v28) - v17) * 0.5);

  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safeAreaInsets");
  v23 = v22;

  if (v23 >= 44.0)
    v24 = v23;
  else
    v24 = 44.0;
  v25 = v20;
  v26 = v17;
  v27 = v15;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v24;
  result.origin.x = v25;
  return result;
}

- (CGRect)toggleAnimationButtonFrame
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CNMeCardSharingSettingsHeaderViewController avatarViewController](self, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPosterAnimationPausable");

  if (v4)
  {
    -[CNMeCardSharingSettingsHeaderViewController avatarViewControllerFrame](self, "avatarViewControllerFrame");
    v7 = v5 + v6 + -44.0 + -7.0;
    -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9 + -44.0 + -25.0;

    v11 = 44.0;
    v12 = 44.0;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v13 = v10;
  v14 = v7;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)toggleAnimationButtonImageName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  -[CNMeCardSharingSettingsHeaderViewController avatarViewController](self, "avatarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isPosterAnimationPaused"))
    v3 = CFSTR("play.circle.fill");
  else
    v3 = CFSTR("pause.circle.fill");
  v4 = v3;

  return v4;
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  CGFloat v19;
  void *v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  -[CNMeCardSharingSettingsHeaderViewController avatarViewControllerFrame](self, "avatarViewControllerFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CNMeCardSharingAvatarViewController view](self->_avatarViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CNMeCardSharingSettingsHeaderViewController toggleAnimationButtonFrame](self, "toggleAnimationButtonFrame");
  v13 = v12;
  -[UIButton setFrame:](self->_toggleAnimationButton, "setFrame:");
  -[UIButton layer](self->_toggleAnimationButton, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v13 * 0.5);

  v15 = 1;
  -[UIButton setClipsToBounds:](self->_toggleAnimationButton, "setClipsToBounds:", 1);
  if (-[CNMeCardSharingAvatarViewController showsPosterAnimation](self->_avatarViewController, "showsPosterAnimation"))
    v15 = -[CNMeCardSharingAvatarViewController isPosterAnimationPausable](self->_avatarViewController, "isPosterAnimationPausable") ^ 1;
  -[UIButton setHidden:](self->_toggleAnimationButton, "setHidden:", v15);
  -[CNMeCardSharingSettingsHeaderViewController updateLabelButtonFrame](self, "updateLabelButtonFrame");
  -[CNMeCardSharingSettingsHeaderViewController separatorHeight](self, "separatorHeight");
  v17 = v16;
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v19 = CGRectGetMaxY(v22) - v17;
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, v19, CGRectGetWidth(v23), v17);

  v21.receiver = self;
  v21.super_class = (Class)CNMeCardSharingSettingsHeaderViewController;
  -[CNMeCardSharingSettingsHeaderViewController viewDidLayoutSubviews](&v21, sel_viewDidLayoutSubviews);
}

- (void)updateLabelButtonFrame
{
  void *v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  CGFloat v12;
  void *v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  if (-[CNMeCardSharingSettingsHeaderViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_labelButton)
    {
      -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      v4 = CGRectGetWidth(v14) + -40.0;

      -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v4, 100.0);
      v6 = v5;
      v8 = v7;
      -[CNMeCardSharingSettingsHeaderViewController avatarViewController](self, "avatarViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "showsPosterAnimation");

      v10 = v6 + 40.0;
      -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v12 = (CGRectGetWidth(v15) - v10) * 0.5;
      -[CNMeCardSharingAvatarViewController view](self->_avatarViewController, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      -[UIButton setFrame:](self->_labelButton, "setFrame:", v12, CGRectGetMaxY(v16) + 16.0, v10, v8);

      -[UIButton _setCornerRadius:](self->_labelButton, "_setCornerRadius:", v8 * 0.5);
    }
  }
}

- (double)desiredHeightForTraitCollection:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  CGFloat v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;

  -[CNMeCardSharingSettingsHeaderViewController avatarViewControllerFrame](self, "avatarViewControllerFrame", a3);
  v5 = v4;
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = CGRectGetWidth(v16) + -40.0;

  -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v8, 100.0);
  v10 = v9;
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaInsets");
  v13 = v12;

  v14 = 44.0;
  if (v13 >= 44.0)
    v14 = v13;
  return v10 + v5 + v14 + 32.0;
}

- (double)availableAvatarSpace
{
  void *v3;
  double v4;
  double v5;
  double result;
  void *v7;
  void *v8;
  CGFloat v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;

  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  result = 0.0;
  if (v5 > 0.0)
  {
    -[CNMeCardSharingSettingsHeaderViewController view](self, "view", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

    -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = CGRectGetWidth(v16) + -40.0;

    -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v9, 100.0);
    v11 = v10;
    -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeAreaInsets");
    v14 = v13;

    v15 = 44.0;
    if (v14 >= 44.0)
      v15 = v14;
    return v5 - v15 - v11 + -32.0;
  }
  return result;
}

- (double)minAvatarHeight
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;

  -[CNMeCardSharingSettingsHeaderViewController avatarViewController](self, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsPosterAnimation");

  if (!v4)
    return 130.0;
  -[CNMeCardSharingSettingsHeaderViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewHeight");
  v7 = v6;

  return ceil(v7 / 3.0);
}

- (double)maxAvatarHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;

  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 + -10.0;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (v5 > 320.0)
      return 320.0;
  }
  else if (!-[CNMeCardSharingSettingsHeaderViewController mode](self, "mode"))
  {
    -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v5 = v9 + -40.0;

  }
  return v5;
}

- (double)minHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  CGFloat v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGRect v15;

  -[CNMeCardSharingSettingsHeaderViewController minAvatarHeight](self, "minAvatarHeight");
  v4 = v3;
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = CGRectGetWidth(v15) + -40.0;

  -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v7, 100.0);
  v9 = v8;
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeAreaInsets");
  v12 = v11;

  v13 = 44.0;
  if (v12 >= 44.0)
    v13 = v12;
  return v9 + v4 + v13 + 32.0;
}

- (double)maxHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  CGFloat v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGRect v15;

  -[CNMeCardSharingSettingsHeaderViewController maxAvatarHeight](self, "maxAvatarHeight");
  v4 = v3;
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = CGRectGetWidth(v15) + -40.0;

  -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v7, 100.0);
  v9 = v8;
  -[CNMeCardSharingSettingsHeaderViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeAreaInsets");
  v12 = v11;

  v13 = 44.0;
  if (v12 >= 44.0)
    v13 = v12;
  return v9 + v4 + v13 + 32.0;
}

- (double)minBottomPadding
{
  return 32.0;
}

- (void)updateWithAvatarProvider:(id)a3
{
  -[CNMeCardSharingAvatarViewController updateWithAvatarProvider:](self->_avatarViewController, "updateWithAvatarProvider:", a3);
}

- (void)reload
{
  -[CNMeCardSharingAvatarViewController reload](self->_avatarViewController, "reload");
}

- (void)updateButtonLabel
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  -[CNMeCardSharingSettingsHeaderViewController avatarViewController](self, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsPosterAnimation");

  v5 = -[CNMeCardSharingAvatarViewController hasImage](self->_avatarViewController, "hasImage");
  if (v4)
  {
    if (v5
      || -[CNMeCardSharingAvatarViewController isWaitingForPosterPreviews](self->_avatarViewController, "isWaitingForPosterPreviews"))
    {
      CNContactsUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SNAP_SHARING_POSTER_EDIT");
    }
    else
    {
      CNContactsUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SNAP_SHARING_POSTER_ADD");
    }
  }
  else if (v5
         || -[CNMeCardSharingAvatarViewController isWaitingForPosterPreviews](self->_avatarViewController, "isWaitingForPosterPreviews"))
  {
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SHARING_EDIT");
  }
  else
  {
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SHARING_ADD_PHOTO");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E20507A8, CFSTR("Localized"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[UIButton titleLabel](self->_labelButton, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v12, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    -[UIButton setTitle:forState:](self->_labelButton, "setTitle:forState:", v12, 0);
    -[CNMeCardSharingSettingsHeaderViewController updateLabelButtonFrame](self, "updateLabelButtonFrame");
  }

}

- (void)labelButtonTapped:(id)a3
{
  id v4;

  -[CNMeCardSharingSettingsHeaderViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharingSettingsHeaderWasTapped:", self);

}

- (void)avatarViewControllerDidUpdateImage:(id)a3 needsLayout:(BOOL)a4
{
  void *v5;

  if (a4)
  {
    -[CNMeCardSharingSettingsHeaderViewController view](self, "view", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
  -[CNMeCardSharingSettingsHeaderViewController updateButtonLabel](self, "updateButtonLabel", a3);
}

- (void)avatarViewControllerWasTapped:(id)a3
{
  id v4;

  -[CNMeCardSharingSettingsHeaderViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharingSettingsHeaderWasTapped:", self);

}

- (CNMeCardSharingSettingsHeaderViewControllerDelegate)delegate
{
  return (CNMeCardSharingSettingsHeaderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNMeCardSharingAvatarProvider)avatarProvider
{
  return self->_avatarProvider;
}

- (void)setAvatarProvider:(id)a3
{
  objc_storeStrong((id *)&self->_avatarProvider, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (CNMeCardSharingAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewController, a3);
}

- (UIButton)toggleAnimationButton
{
  return self->_toggleAnimationButton;
}

- (void)setToggleAnimationButton:(id)a3
{
  objc_storeStrong((id *)&self->_toggleAnimationButton, a3);
}

- (UIButton)labelButton
{
  return self->_labelButton;
}

- (void)setLabelButton:(id)a3
{
  objc_storeStrong((id *)&self->_labelButton, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_labelButton, 0);
  objc_storeStrong((id *)&self->_toggleAnimationButton, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "togglePosterAnimation");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "toggleAnimationButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConfiguration");

}

void __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3870];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "toggleAnimationButtonImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  objc_msgSend(v3, "setConfiguration:", v8);
}

id __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1138]);

  return v2;
}

+ (double)avatarEdgeLengthForTraitCollection:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "verticalSizeClass");
  result = 168.0;
  if (v3 == 1)
    return 120.0;
  return result;
}

@end
