@implementation SFWebExtensionPermissionGrantedBanner

- (SFWebExtensionPermissionGrantedBanner)initWithExtensions:(id)a3 grantedHost:(id)a4
{
  id v6;
  id v7;
  SFWebExtensionPermissionGrantedBanner *v8;
  uint64_t v9;
  NSArray *extensions;
  uint64_t v11;
  NSString *grantedHost;
  void *v13;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *titleTopConstraint;
  SFWebExtensionPermissionGrantedBanner *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SFWebExtensionPermissionGrantedBanner;
  v8 = -[SFWebExtensionPermissionGrantedBanner init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    extensions = v8->_extensions;
    v8->_extensions = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    grantedHost = v8->_grantedHost;
    v8->_grantedHost = (NSString *)v11;

    -[SFWebExtensionPermissionGrantedBanner setMaximumContentSizeCategory:](v8, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    -[SFWebExtensionPermissionGrantedBanner _setUpBackdrop](v8, "_setUpBackdrop");
    -[SFWebExtensionPermissionGrantedBanner _setUpTitleLabel](v8, "_setUpTitleLabel");
    -[SFWebExtensionPermissionGrantedBanner _setUpAllowButton](v8, "_setUpAllowButton");
    -[SFWebExtensionPermissionGrantedBanner _setUpResetExtensionPermissionsButton](v8, "_setUpResetExtensionPermissionsButton");
    -[UILabel topAnchor](v8->_titleLabel, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebExtensionPermissionGrantedBanner topAnchor](v8, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 9.0);
    v15 = objc_claimAutoreleasedReturnValue();
    titleTopConstraint = v8->_titleTopConstraint;
    v8->_titleTopConstraint = (NSLayoutConstraint *)v15;

    -[SFWebExtensionPermissionGrantedBanner _setUpButtonStackView](v8, "_setUpButtonStackView");
    -[SFWebExtensionPermissionGrantedBanner _setUpConstraints](v8, "_setUpConstraints");
    -[SFWebExtensionPermissionGrantedBanner sizeToFit](v8, "sizeToFit");
    v17 = v8;
  }

  return v8;
}

- (void)_setUpBackdrop
{
  SFThemeColorEffectView *v3;
  void *v4;
  SFThemeColorEffectView *v5;
  SFThemeColorEffectView *backdrop;
  NSArray *v7;
  NSArray *backdropConstraints;

  v3 = [SFThemeColorEffectView alloc];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFThemeColorEffectView initWithEffect:](v3, "initWithEffect:", v4);
  backdrop = self->_backdrop;
  self->_backdrop = v5;

  -[SFThemeColorEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backdrop, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFWebExtensionPermissionGrantedBanner addSubview:](self, "addSubview:", self->_backdrop);
  -[SFWebExtensionPermissionGrantedBanner sendSubviewToBack:](self, "sendSubviewToBack:", self->_backdrop);
  objc_msgSend(MEMORY[0x1E0CB3718], "safari_constraintsMatchingFrameOfView:withFrameOfView:", self->_backdrop, self);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  backdropConstraints = self->_backdropConstraints;
  self->_backdropConstraints = v7;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_backdropConstraints);
}

- (void)_setUpTitleLabel
{
  NSUInteger v3;
  void *v4;
  NSUInteger v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  double v13;
  id v14;

  v3 = -[NSArray count](self->_extensions, "count");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = v3 - 1;
  if (v3 == 1)
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](self->_extensions, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6, v8, self->_grantedHost);
  }
  else
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](self->_extensions, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v6, v8, v5, self->_grantedHost);
  }
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFWebExtensionPermissionGrantedBanner _titleLabelFont](self, "_titleLabelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v11);

  -[UILabel setText:](self->_titleLabel, "setText:", v14);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", _SFDeviceIsPad() ^ 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v12);

  LODWORD(v13) = 1144750080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v13);
  -[SFWebExtensionPermissionGrantedBanner addSubview:](self, "addSubview:", self->_titleLabel);

}

- (void)_setUpAllowButton
{
  _SFDimmingButton *v3;
  _SFDimmingButton *allowButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFDimmingButton *v9;
  void *v10;

  +[_SFDimmingButton buttonWithType:](_SFDimmingButton, "buttonWithType:", 1);
  v3 = (_SFDimmingButton *)objc_claimAutoreleasedReturnValue();
  allowButton = self->_allowButton;
  self->_allowButton = v3;

  -[SFWebExtensionPermissionGrantedBanner _titleLabelFont](self, "_titleLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton titleLabel](self->_allowButton, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setTintColor:](self->_allowButton, "setTintColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setDimmableBackgroundColor:](self->_allowButton, "setDimmableBackgroundColor:", v8);

  -[_SFDimmingButton setTapTargetSideMargin:](self->_allowButton, "setTapTargetSideMargin:", &unk_1E2245848);
  -[_SFDimmingButton _setCornerRadius:](self->_allowButton, "_setCornerRadius:", 13.5);
  -[_SFDimmingButton setContentEdgeInsets:](self->_allowButton, "setContentEdgeInsets:", 5.0, 13.0, 5.0, 13.0);
  -[_SFDimmingButton setTranslatesAutoresizingMaskIntoConstraints:](self->_allowButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = self->_allowButton;
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setTitle:forState:](v9, "setTitle:forState:", v10, 0);

  -[_SFDimmingButton addTarget:action:forControlEvents:](self->_allowButton, "addTarget:action:forControlEvents:", self, sel__dismiss, 64);
}

- (void)_setUpResetExtensionPermissionsButton
{
  _SFDimmingButton *v3;
  _SFDimmingButton *resetExtensionPermissionsButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFDimmingButton *v9;
  void *v10;

  +[_SFDimmingButton buttonWithType:](_SFDimmingButton, "buttonWithType:", 1);
  v3 = (_SFDimmingButton *)objc_claimAutoreleasedReturnValue();
  resetExtensionPermissionsButton = self->_resetExtensionPermissionsButton;
  self->_resetExtensionPermissionsButton = v3;

  -[SFWebExtensionPermissionGrantedBanner _titleLabelFont](self, "_titleLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton titleLabel](self->_resetExtensionPermissionsButton, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setTintColor:](self->_resetExtensionPermissionsButton, "setTintColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setDimmableBackgroundColor:](self->_resetExtensionPermissionsButton, "setDimmableBackgroundColor:", v8);

  -[_SFDimmingButton setTapTargetSideMargin:](self->_resetExtensionPermissionsButton, "setTapTargetSideMargin:", &unk_1E2245848);
  -[_SFDimmingButton _setCornerRadius:](self->_resetExtensionPermissionsButton, "_setCornerRadius:", 13.5);
  -[_SFDimmingButton setContentEdgeInsets:](self->_resetExtensionPermissionsButton, "setContentEdgeInsets:", 5.0, 13.0, 5.0, 13.0);
  -[_SFDimmingButton setTranslatesAutoresizingMaskIntoConstraints:](self->_resetExtensionPermissionsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = self->_resetExtensionPermissionsButton;
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setTitle:forState:](v9, "setTitle:forState:", v10, 0);

  -[_SFDimmingButton addTarget:action:forControlEvents:](self->_resetExtensionPermissionsButton, "addTarget:action:forControlEvents:", self, sel__resetExtensionPermissions, 64);
}

- (void)_setUpButtonStackView
{
  id v3;
  _SFDimmingButton *resetExtensionPermissionsButton;
  void *v5;
  UIStackView *v6;
  UIStackView *buttonStackView;
  double v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  resetExtensionPermissionsButton = self->_resetExtensionPermissionsButton;
  v9[0] = self->_allowButton;
  v9[1] = resetExtensionPermissionsButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UIStackView *)objc_msgSend(v3, "initWithArrangedSubviews:", v5);
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v6;

  -[UIStackView setAxis:](self->_buttonStackView, "setAxis:", 0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_buttonStackView, "setSpacing:", 8.0);
  -[UIStackView setDistribution:](self->_buttonStackView, "setDistribution:", 2);
  LODWORD(v8) = 1148846080;
  -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_buttonStackView, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  if ((_SFDeviceIsPad() & 1) == 0)
    -[UIStackView setDistribution:](self->_buttonStackView, "setDistribution:", 1);
  -[SFWebExtensionPermissionGrantedBanner addSubview:](self, "addSubview:", self->_buttonStackView);
}

- (void)_setUpConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v19;
  void *v20;
  void *v21;
  double v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *buttonStackViewWidthConstraint;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[8];
  _QWORD v46[9];

  v46[7] = *MEMORY[0x1E0C80C00];
  if ((_SFDeviceIsPad() & 1) != 0)
  {
    v32 = (void *)MEMORY[0x1E0CB3718];
    v45[0] = self->_titleTopConstraint;
    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebExtensionPermissionGrantedBanner leadingAnchor](self, "leadingAnchor");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v31, 20.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v44;
    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_buttonStackView, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v3;
    objc_msgSend(v3, "constraintEqualToAnchor:constant:", -16.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v41;
    -[SFWebExtensionPermissionGrantedBanner bottomAnchor](self, "bottomAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v4;
    objc_msgSend(v4, "constraintEqualToAnchor:constant:", 9.0);
    v30 = objc_claimAutoreleasedReturnValue();
    v45[3] = v30;
    -[UIStackView trailingAnchor](self->_buttonStackView, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebExtensionPermissionGrantedBanner trailingAnchor](self, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v5;
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", -20.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v36;
    -[UIStackView centerYAnchor](self->_buttonStackView, "centerYAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebExtensionPermissionGrantedBanner centerYAnchor](self, "centerYAnchor");
    v29 = objc_claimAutoreleasedReturnValue();
    v35 = v6;
    objc_msgSend(v6, "constraintEqualToAnchor:", v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v45[5] = v7;
    -[UIStackView topAnchor](self->_buttonStackView, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebExtensionPermissionGrantedBanner safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10, 10.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45[6] = v11;
    -[UIStackView bottomAnchor](self->_buttonStackView, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebExtensionPermissionGrantedBanner safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:constant:", v14, 10.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45[7] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v16);

    v17 = (void *)v31;
    v18 = (void *)v30;

    v19 = (void *)v29;
    v20 = v33;
  }
  else
  {
    -[UIStackView widthAnchor](self->_buttonStackView, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel frame](self->_titleLabel, "frame");
    objc_msgSend(v21, "constraintEqualToConstant:", v22);
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    buttonStackViewWidthConstraint = self->_buttonStackViewWidthConstraint;
    self->_buttonStackViewWidthConstraint = v23;

    v34 = (void *)MEMORY[0x1E0CB3718];
    v46[0] = self->_titleTopConstraint;
    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebExtensionPermissionGrantedBanner layoutMarginsGuide](self, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v43;
    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebExtensionPermissionGrantedBanner layoutMarginsGuide](self, "layoutMarginsGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = v25;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v39;
    -[UIStackView topAnchor](self->_buttonStackView, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", 8.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v37;
    -[UIStackView centerXAnchor](self->_buttonStackView, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWebExtensionPermissionGrantedBanner centerXAnchor](self, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v26;
    objc_msgSend(v26, "constraintEqualToAnchor:");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = self->_buttonStackViewWidthConstraint;
    v19 = (void *)v27;
    v46[4] = v27;
    v46[5] = v28;
    -[SFWebExtensionPermissionGrantedBanner bottomAnchor](self, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](self->_buttonStackView, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 9.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v10);
  }

}

- (id)_titleLabelFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SFWebExtensionPermissionGrantedBanner systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_resetExtensionPermissions
{
  void (**resetExtensionPermissionsHandler)(id, SFWebExtensionPermissionGrantedBanner *);

  resetExtensionPermissionsHandler = (void (**)(id, SFWebExtensionPermissionGrantedBanner *))self->_resetExtensionPermissionsHandler;
  if (resetExtensionPermissionsHandler)
    resetExtensionPermissionsHandler[2](resetExtensionPermissionsHandler, self);
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  objc_super v3;

  if (a3.left == 0.0)
    a3.left = 20.0;
  if (a3.right == 0.0)
    a3.right = 20.0;
  v3.receiver = self;
  v3.super_class = (Class)SFWebExtensionPermissionGrantedBanner;
  -[SFWebExtensionPermissionGrantedBanner setLayoutMargins:](&v3, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)layoutSubviews
{
  CGFloat v3;
  double Height;
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
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)SFWebExtensionPermissionGrantedBanner;
  -[SFWebExtensionPermissionGrantedBanner layoutSubviews](&v19, sel_layoutSubviews);
  -[_SFDimmingButton bounds](self->_resetExtensionPermissionsButton, "bounds");
  v3 = CGRectGetHeight(v20) * 0.482142857;
  -[_SFDimmingButton _setCornerRadius:](self->_resetExtensionPermissionsButton, "_setCornerRadius:", v3);
  -[_SFDimmingButton _setCornerRadius:](self->_allowButton, "_setCornerRadius:", v3);
  -[UILabel bounds](self->_titleLabel, "bounds");
  Height = CGRectGetHeight(v21);
  v5 = _SFRoundFloatToPixels(Height);
  -[UILabel font](self->_titleLabel, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");
  v8 = _SFRoundFloatToPixels(v7);

  v9 = 9.0;
  if (v5 > v8)
    v9 = 8.0;
  -[NSLayoutConstraint setConstant:](self->_titleTopConstraint, "setConstant:", v9);
  if ((_SFDeviceIsPad() & 1) == 0)
  {
    -[UILabel frame](self->_titleLabel, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[UILabel frame](self->_titleLabel, "frame");
    -[NSLayoutConstraint setConstant:](self->_buttonStackViewWidthConstraint, "setConstant:", v18);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v11, v13, v15, v17);
  }
}

- (void)invalidateBannerLayout
{
  -[UILabel invalidateIntrinsicContentSize](self->_titleLabel, "invalidateIntrinsicContentSize");
}

- (void)themeDidChange
{
  void *v3;
  void *v4;
  id v5;
  _SFDimmingButton **p_resetExtensionPermissionsButton;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[SFPinnableBanner theme](self, "theme");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SFThemeColorEffectView setTheme:](self->_backdrop, "setTheme:", v10);
  objc_msgSend(v10, "overrideTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    p_resetExtensionPermissionsButton = &self->_resetExtensionPermissionsButton;
    -[_SFDimmingButton setDimmableBackgroundColor:](self->_resetExtensionPermissionsButton, "setDimmableBackgroundColor:", v5);
    objc_msgSend(v10, "themeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    p_resetExtensionPermissionsButton = &self->_resetExtensionPermissionsButton;
    -[_SFDimmingButton setDimmableBackgroundColor:](self->_resetExtensionPermissionsButton, "setDimmableBackgroundColor:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  -[_SFDimmingButton setTintColor:](*p_resetExtensionPermissionsButton, "setTintColor:", v7);

  -[_SFDimmingButton setTintAdjustmentMode:](*p_resetExtensionPermissionsButton, "setTintAdjustmentMode:", v8);
  -[_SFDimmingButton setDimmableBackgroundColor:](self->_allowButton, "setDimmableBackgroundColor:", v5);
  if (v4)
    objc_msgSend(v10, "themeColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setTintColor:](self->_allowButton, "setTintColor:", v9);

  -[_SFDimmingButton setTintAdjustmentMode:](self->_allowButton, "setTintAdjustmentMode:", v8);
}

- (void)_dismiss
{
  void (**allowButtonHandler)(id, SFWebExtensionPermissionGrantedBanner *);

  allowButtonHandler = (void (**)(id, SFWebExtensionPermissionGrantedBanner *))self->_allowButtonHandler;
  if (allowButtonHandler)
    allowButtonHandler[2](allowButtonHandler, self);
}

- (id)resetExtensionPermissionsHandler
{
  return self->_resetExtensionPermissionsHandler;
}

- (void)setResetExtensionPermissionsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (id)allowButtonHandler
{
  return self->_allowButtonHandler;
}

- (void)setAllowButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_allowButtonHandler, 0);
  objc_storeStrong(&self->_resetExtensionPermissionsHandler, 0);
  objc_storeStrong((id *)&self->_grantedHost, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_allowButton, 0);
  objc_storeStrong((id *)&self->_resetExtensionPermissionsButton, 0);
  objc_storeStrong((id *)&self->_buttonStackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleTopConstraint, 0);
  objc_storeStrong((id *)&self->_backdropConstraints, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end
