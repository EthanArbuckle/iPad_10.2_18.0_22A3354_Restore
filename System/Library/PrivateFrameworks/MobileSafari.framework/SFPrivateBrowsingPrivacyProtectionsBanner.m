@implementation SFPrivateBrowsingPrivacyProtectionsBanner

- (SFPrivateBrowsingPrivacyProtectionsBanner)init
{
  SFPrivateBrowsingPrivacyProtectionsBanner *v2;
  SFPrivateBrowsingPrivacyProtectionsBanner *v3;
  SFThemeColorEffectView *v4;
  void *v5;
  uint64_t v6;
  SFThemeColorEffectView *backdrop;
  uint64_t v8;
  NSArray *backdropConstraints;
  UILabel *v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  _SFDimmingButton *dismissButton;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _SFDimmingButton *v26;
  void *v27;
  double v28;
  uint64_t v29;
  _SFDimmingButton *reducePrivacyProtectionsButton;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  id v39;
  void *v40;
  uint64_t v41;
  UIStackView *buttonStackView;
  double v43;
  void *v44;
  id v45;
  SFPrivateBrowsingPrivacyProtectionsBanner *v46;
  objc_super v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)SFPrivateBrowsingPrivacyProtectionsBanner;
  v2 = -[SFPrivateBrowsingPrivacyProtectionsBanner init](&v48, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SFPrivateBrowsingPrivacyProtectionsBanner setMaximumContentSizeCategory:](v2, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    v4 = [SFThemeColorEffectView alloc];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SFThemeColorEffectView initWithEffect:](v4, "initWithEffect:", v5);
    backdrop = v3->_backdrop;
    v3->_backdrop = (SFThemeColorEffectView *)v6;

    -[SFThemeColorEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backdrop, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFPrivateBrowsingPrivacyProtectionsBanner addSubview:](v3, "addSubview:", v3->_backdrop);
    -[SFPrivateBrowsingPrivacyProtectionsBanner sendSubviewToBack:](v3, "sendSubviewToBack:", v3->_backdrop);
    objc_msgSend(MEMORY[0x1E0CB3718], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v3->_backdrop, v3);
    v8 = objc_claimAutoreleasedReturnValue();
    backdropConstraints = v3->_backdropConstraints;
    v3->_backdropConstraints = (NSArray *)v8;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3->_backdropConstraints);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[SFPrivateBrowsingPrivacyProtectionsBanner _titleLabelFont:](v3, "_titleLabelFont:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v12);

    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_titleLabel, "setText:", v13);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v14);

    LODWORD(v15) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    LODWORD(v16) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v16);
    -[SFPrivateBrowsingPrivacyProtectionsBanner addSubview:](v3, "addSubview:", v3->_titleLabel);
    +[_SFDimmingButton buttonWithType:](_SFDimmingButton, "buttonWithType:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    dismissButton = v3->_dismissButton;
    v3->_dismissButton = (_SFDimmingButton *)v17;

    -[_SFDimmingButton setAccessibilityIdentifier:](v3->_dismissButton, "setAccessibilityIdentifier:", CFSTR("DismissBannerButton"));
    -[SFPrivateBrowsingPrivacyProtectionsBanner _titleLabelFont:](v3, "_titleLabelFont:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton titleLabel](v3->_dismissButton, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v19);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setTintColor:](v3->_dismissButton, "setTintColor:", v21);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setDimmableBackgroundColor:](v3->_dismissButton, "setDimmableBackgroundColor:", v22);

    -[_SFDimmingButton titleLabel](v3->_dismissButton, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLineBreakMode:", 0);

    -[_SFDimmingButton titleLabel](v3->_dismissButton, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextAlignment:", 1);

    -[_SFDimmingButton titleLabel](v3->_dismissButton, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAdjustsFontForContentSizeCategory:", 1);

    -[_SFDimmingButton setTapTargetSideMargin:](v3->_dismissButton, "setTapTargetSideMargin:", &unk_1E2245860);
    -[_SFDimmingButton _setCornerRadius:](v3->_dismissButton, "_setCornerRadius:", 13.5);
    -[_SFDimmingButton setContentEdgeInsets:](v3->_dismissButton, "setContentEdgeInsets:", 5.0, 13.0, 5.0, 13.0);
    -[_SFDimmingButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = v3->_dismissButton;
    _WBSLocalizedString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setTitle:forState:](v26, "setTitle:forState:", v27, 0);

    -[_SFDimmingButton addTarget:action:forControlEvents:](v3->_dismissButton, "addTarget:action:forControlEvents:", v3, sel__dismiss, 64);
    LODWORD(v28) = 1148846080;
    -[_SFDimmingButton setContentCompressionResistancePriority:forAxis:](v3->_dismissButton, "setContentCompressionResistancePriority:forAxis:", 1, v28);
    +[_SFDimmingButton buttonWithType:](_SFDimmingButton, "buttonWithType:", 1);
    v29 = objc_claimAutoreleasedReturnValue();
    reducePrivacyProtectionsButton = v3->_reducePrivacyProtectionsButton;
    v3->_reducePrivacyProtectionsButton = (_SFDimmingButton *)v29;

    -[_SFDimmingButton setAccessibilityIdentifier:](v3->_reducePrivacyProtectionsButton, "setAccessibilityIdentifier:", CFSTR("ReducePrivacyProtectionsButton"));
    -[SFPrivateBrowsingPrivacyProtectionsBanner _titleLabelFont:](v3, "_titleLabelFont:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton titleLabel](v3->_reducePrivacyProtectionsButton, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFont:", v31);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setTintColor:](v3->_reducePrivacyProtectionsButton, "setTintColor:", v33);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setDimmableBackgroundColor:](v3->_reducePrivacyProtectionsButton, "setDimmableBackgroundColor:", v34);

    -[_SFDimmingButton titleLabel](v3->_reducePrivacyProtectionsButton, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setLineBreakMode:", 0);

    -[_SFDimmingButton titleLabel](v3->_reducePrivacyProtectionsButton, "titleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTextAlignment:", 1);

    -[_SFDimmingButton titleLabel](v3->_reducePrivacyProtectionsButton, "titleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAdjustsFontForContentSizeCategory:", 1);

    -[_SFDimmingButton setTapTargetSideMargin:](v3->_reducePrivacyProtectionsButton, "setTapTargetSideMargin:", &unk_1E2245860);
    -[_SFDimmingButton _setCornerRadius:](v3->_reducePrivacyProtectionsButton, "_setCornerRadius:", 13.5);
    -[_SFDimmingButton setContentEdgeInsets:](v3->_reducePrivacyProtectionsButton, "setContentEdgeInsets:", 5.0, 13.0, 5.0, 13.0);
    -[_SFDimmingButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_reducePrivacyProtectionsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFDimmingButton addTarget:action:forControlEvents:](v3->_reducePrivacyProtectionsButton, "addTarget:action:forControlEvents:", v3, sel__reducePrivacyProtections, 64);
    LODWORD(v38) = 1148846080;
    -[_SFDimmingButton setContentCompressionResistancePriority:forAxis:](v3->_reducePrivacyProtectionsButton, "setContentCompressionResistancePriority:forAxis:", 1, v38);
    v39 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v50[0] = v3->_dismissButton;
    v50[1] = v3->_reducePrivacyProtectionsButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "initWithArrangedSubviews:", v40);
    buttonStackView = v3->_buttonStackView;
    v3->_buttonStackView = (UIStackView *)v41;

    -[UIStackView setAxis:](v3->_buttonStackView, "setAxis:", 0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v3->_buttonStackView, "setSpacing:", 8.0);
    LODWORD(v43) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v3->_buttonStackView, "setContentCompressionResistancePriority:forAxis:", 0, v43);
    -[SFPrivateBrowsingPrivacyProtectionsBanner addSubview:](v3, "addSubview:", v3->_buttonStackView);
    -[SFPrivateBrowsingPrivacyProtectionsBanner _createLayoutConstraints](v3, "_createLayoutConstraints");
    -[SFPrivateBrowsingPrivacyProtectionsBanner updateConstraintsForLayoutMode](v3, "updateConstraintsForLayoutMode");
    v49 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (id)-[SFPrivateBrowsingPrivacyProtectionsBanner registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v44, sel_updateConstraintsForLayoutMode);

    v46 = v3;
  }

  return v3;
}

- (BOOL)_shouldUseCompactModeLayout
{
  void *v2;
  int v3;

  -[SFPrivateBrowsingPrivacyProtectionsBanner traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "horizontalSizeClass") == 1)
    LOBYTE(v3) = 1;
  else
    v3 = _SFDeviceIsPad() ^ 1;

  return v3;
}

- (void)_createLayoutConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *titleTopConstraint;
  void *v7;
  double v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *compactModeButtonStackViewWidthConstraint;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *compactModeConstraints;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *v30;
  NSArray *regularModeConstraints;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[7];
  _QWORD v56[8];

  v56[6] = *MEMORY[0x1E0C80C00];
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivateBrowsingPrivacyProtectionsBanner topAnchor](self, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 9.0);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleTopConstraint = self->_titleTopConstraint;
  self->_titleTopConstraint = v5;

  -[NSLayoutConstraint setActive:](self->_titleTopConstraint, "setActive:", 1);
  -[UIStackView widthAnchor](self->_buttonStackView, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel frame](self->_titleLabel, "frame");
  objc_msgSend(v7, "constraintEqualToConstant:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  compactModeButtonStackViewWidthConstraint = self->_compactModeButtonStackViewWidthConstraint;
  self->_compactModeButtonStackViewWidthConstraint = v9;

  v56[0] = self->_compactModeButtonStackViewWidthConstraint;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivateBrowsingPrivacyProtectionsBanner layoutMarginsGuide](self, "layoutMarginsGuide");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v49);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v47;
  -[SFPrivateBrowsingPrivacyProtectionsBanner layoutMarginsGuide](self, "layoutMarginsGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v39;
  -[UIStackView topAnchor](self->_buttonStackView, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v11, 8.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v12;
  -[UIStackView centerXAnchor](self->_buttonStackView, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivateBrowsingPrivacyProtectionsBanner centerXAnchor](self, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v15;
  -[SFPrivateBrowsingPrivacyProtectionsBanner bottomAnchor](self, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_buttonStackView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 9.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 6);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  compactModeConstraints = self->_compactModeConstraints;
  self->_compactModeConstraints = v19;

  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivateBrowsingPrivacyProtectionsBanner leadingAnchor](self, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v52, 20.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v50;
  -[UIStackView leadingAnchor](self->_buttonStackView, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v46, 16.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v44;
  -[SFPrivateBrowsingPrivacyProtectionsBanner bottomAnchor](self, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v40, 9.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v38;
  -[SFPrivateBrowsingPrivacyProtectionsBanner trailingAnchor](self, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_buttonStackView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 20.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v34;
  -[UIStackView centerYAnchor](self->_buttonStackView, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivateBrowsingPrivacyProtectionsBanner centerYAnchor](self, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v21;
  -[UIStackView topAnchor](self->_buttonStackView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivateBrowsingPrivacyProtectionsBanner safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:constant:", v24, 10.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v25;
  -[SFPrivateBrowsingPrivacyProtectionsBanner safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_buttonStackView, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:constant:", v28, 10.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 7);
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  regularModeConstraints = self->_regularModeConstraints;
  self->_regularModeConstraints = v30;

}

- (void)updateConstraintsForLayoutMode
{
  _BOOL4 v3;
  UILabel *titleLabel;
  uint64_t v5;
  _SFDimmingButton *reducePrivacyProtectionsButton;
  void *v7;
  int *v8;
  int *v9;
  _SFDimmingButton *v10;

  v3 = -[SFPrivateBrowsingPrivacyProtectionsBanner _shouldUseCompactModeLayout](self, "_shouldUseCompactModeLayout");
  titleLabel = self->_titleLabel;
  if (v3)
  {
    v5 = 1;
    -[UILabel setTextAlignment:](titleLabel, "setTextAlignment:", 1);
    reducePrivacyProtectionsButton = self->_reducePrivacyProtectionsButton;
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setTitle:forState:](reducePrivacyProtectionsButton, "setTitle:forState:", v7, 0);
    v8 = &OBJC_IVAR___SFPrivateBrowsingPrivacyProtectionsBanner__compactModeConstraints;
    v9 = &OBJC_IVAR___SFPrivateBrowsingPrivacyProtectionsBanner__regularModeConstraints;
  }
  else
  {
    -[UILabel setTextAlignment:](titleLabel, "setTextAlignment:", 4);
    v10 = self->_reducePrivacyProtectionsButton;
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setTitle:forState:](v10, "setTitle:forState:", v7, 0);
    v8 = &OBJC_IVAR___SFPrivateBrowsingPrivacyProtectionsBanner__regularModeConstraints;
    v5 = 2;
    v9 = &OBJC_IVAR___SFPrivateBrowsingPrivacyProtectionsBanner__compactModeConstraints;
  }

  -[UIStackView setDistribution:](self->_buttonStackView, "setDistribution:", v5);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v9));
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v8));
}

- (id)_titleLabelFont:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = 32770;
  else
    v6 = 0x8000;
  objc_msgSend(v4, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  -[SFPrivateBrowsingPrivacyProtectionsBanner systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_reducePrivacyProtections
{
  void (**reducePrivacyProtectionsActionHandler)(id, SFPrivateBrowsingPrivacyProtectionsBanner *);

  reducePrivacyProtectionsActionHandler = (void (**)(id, SFPrivateBrowsingPrivacyProtectionsBanner *))self->_reducePrivacyProtectionsActionHandler;
  if (reducePrivacyProtectionsActionHandler)
    reducePrivacyProtectionsActionHandler[2](reducePrivacyProtectionsActionHandler, self);
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  objc_super v3;

  if (a3.left == 0.0)
    a3.left = 20.0;
  if (a3.right == 0.0)
    a3.right = 20.0;
  v3.receiver = self;
  v3.super_class = (Class)SFPrivateBrowsingPrivacyProtectionsBanner;
  -[SFPrivateBrowsingPrivacyProtectionsBanner setLayoutMargins:](&v3, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)layoutSubviews
{
  double Height;
  double v4;
  void *v5;
  double v6;
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
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)SFPrivateBrowsingPrivacyProtectionsBanner;
  -[SFPrivateBrowsingPrivacyProtectionsBanner layoutSubviews](&v18, sel_layoutSubviews);
  -[UILabel bounds](self->_titleLabel, "bounds");
  Height = CGRectGetHeight(v19);
  v4 = _SFRoundFloatToPixels(Height);
  -[UILabel font](self->_titleLabel, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  v7 = _SFRoundFloatToPixels(v6);

  v8 = 9.0;
  if (v4 > v7)
    v8 = 8.0;
  -[NSLayoutConstraint setConstant:](self->_titleTopConstraint, "setConstant:", v8);
  if (-[SFPrivateBrowsingPrivacyProtectionsBanner _shouldUseCompactModeLayout](self, "_shouldUseCompactModeLayout"))
  {
    -[UILabel frame](self->_titleLabel, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[UILabel frame](self->_titleLabel, "frame");
    -[NSLayoutConstraint setConstant:](self->_compactModeButtonStackViewWidthConstraint, "setConstant:", v17);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v10, v12, v14, v16);
    -[SFPrivateBrowsingPrivacyProtectionsBanner _updateButtonStackViewAxisIfNeeded](self, "_updateButtonStackViewAxisIfNeeded");
  }
  else
  {
    -[UIStackView setAxis:](self->_buttonStackView, "setAxis:", 0);
  }
}

- (void)_updateButtonStackViewAxisIfNeeded
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFAttributedString *v9;
  const __CTLine *v10;
  double width;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFAttributedString *v17;
  const __CTLine *v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];
  CGRect BoundsWithOptions;
  CGRect v35;

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[_SFDimmingButton titleLabel](self->_reducePrivacyProtectionsButton, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0DC1138];
  v6 = v32;
  -[SFPrivateBrowsingPrivacyProtectionsBanner _titleLabelFont:](self, "_titleLabelFont:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const __CFAttributedString *)objc_msgSend(v3, "initWithString:attributes:", v5, v8);

  v10 = CTLineCreateWithAttributedString(v9);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v10, 0);
  width = BoundsWithOptions.size.width;
  CFRelease(v10);
  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[_SFDimmingButton titleLabel](self->_dismissButton, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  -[SFPrivateBrowsingPrivacyProtectionsBanner _titleLabelFont:](self, "_titleLabelFont:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (const __CFAttributedString *)objc_msgSend(v12, "initWithString:attributes:", v14, v16);

  v18 = CTLineCreateWithAttributedString(v17);
  v35 = CTLineGetBoundsWithOptions(v18, 0);
  v19 = v35.size.width;
  CFRelease(v18);
  -[UIStackView frame](self->_buttonStackView, "frame");
  v20 = 0;
  v22 = (v21 + -8.0 + -52.0) * 0.5;
  if (width <= v22 && v19 <= v22)
    goto LABEL_9;
  -[_SFDimmingButton frame](self->_reducePrivacyProtectionsButton, "frame", 0);
  v25 = v24;
  -[_SFDimmingButton intrinsicContentSize](self->_reducePrivacyProtectionsButton, "intrinsicContentSize");
  if (v25 <= v26
    || (-[_SFDimmingButton frame](self->_dismissButton, "frame"),
        v28 = v27,
        -[_SFDimmingButton intrinsicContentSize](self->_dismissButton, "intrinsicContentSize"),
        v28 <= v29))
  {
    v20 = 1;
LABEL_9:
    -[UIStackView setAxis:](self->_buttonStackView, "setAxis:", v20);
  }
  -[SFPrivateBrowsingPrivacyProtectionsBanner sizeToFit](self, "sizeToFit");

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
  _SFDimmingButton **p_reducePrivacyProtectionsButton;
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
    p_reducePrivacyProtectionsButton = &self->_reducePrivacyProtectionsButton;
    -[_SFDimmingButton setDimmableBackgroundColor:](self->_reducePrivacyProtectionsButton, "setDimmableBackgroundColor:", v5);
    objc_msgSend(v10, "themeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    p_reducePrivacyProtectionsButton = &self->_reducePrivacyProtectionsButton;
    -[_SFDimmingButton setDimmableBackgroundColor:](self->_reducePrivacyProtectionsButton, "setDimmableBackgroundColor:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  -[_SFDimmingButton setTintColor:](*p_reducePrivacyProtectionsButton, "setTintColor:", v7);

  -[_SFDimmingButton setTintAdjustmentMode:](*p_reducePrivacyProtectionsButton, "setTintAdjustmentMode:", v8);
  -[_SFDimmingButton setDimmableBackgroundColor:](self->_dismissButton, "setDimmableBackgroundColor:", v5);
  if (v4)
    objc_msgSend(v10, "themeColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDimmingButton setTintColor:](self->_dismissButton, "setTintColor:", v9);

  -[_SFDimmingButton setTintAdjustmentMode:](self->_dismissButton, "setTintAdjustmentMode:", v8);
}

- (void)_dismiss
{
  void (**dismissButtonHandler)(id, SFPrivateBrowsingPrivacyProtectionsBanner *);

  dismissButtonHandler = (void (**)(id, SFPrivateBrowsingPrivacyProtectionsBanner *))self->_dismissButtonHandler;
  if (dismissButtonHandler)
    dismissButtonHandler[2](dismissButtonHandler, self);
}

- (id)accessibilityIdentifier
{
  return CFSTR("PrivacyProtectionsBanner");
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (id)reducePrivacyProtectionsActionHandler
{
  return self->_reducePrivacyProtectionsActionHandler;
}

- (void)setReducePrivacyProtectionsActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (id)dismissButtonHandler
{
  return self->_dismissButtonHandler;
}

- (void)setDismissButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissButtonHandler, 0);
  objc_storeStrong(&self->_reducePrivacyProtectionsActionHandler, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_regularModeConstraints, 0);
  objc_storeStrong((id *)&self->_compactModeConstraints, 0);
  objc_storeStrong((id *)&self->_compactModeButtonStackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_reducePrivacyProtectionsButton, 0);
  objc_storeStrong((id *)&self->_titleTopConstraint, 0);
  objc_storeStrong((id *)&self->_backdropConstraints, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end
