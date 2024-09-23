@implementation WDClinicalOnboardingNoGeoView

- (WDClinicalOnboardingNoGeoView)init
{
  WDClinicalOnboardingNoGeoView *v2;
  WDClinicalOnboardingNoGeoView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDClinicalOnboardingNoGeoView;
  v2 = -[WDClinicalOnboardingNoGeoView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WDClinicalOnboardingNoGeoView _setupSubviews](v2, "_setupSubviews");
    -[WDClinicalOnboardingNoGeoView _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDClinicalOnboardingNoGeoView addSubview:](self, "addSubview:", v33);
  -[WDClinicalOnboardingNoGeoView setContainerView:](self, "setContainerView:", v33);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDClinicalOnboardingNoGeoView setTitleLabel:](self, "setTitleLabel:", v3);

  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

  HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_LOCATION_SERVICES_OFF_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v11);

  v12 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDClinicalOnboardingNoGeoView setSubtitleLabel:](self, "setSubtitleLabel:", v12);

  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_LOCATION_SERVICES_OFF_SUBTITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v20);

  v21 = objc_alloc_init(MEMORY[0x1E0DC3518]);
  -[WDClinicalOnboardingNoGeoView setLocationServicesButton:](self, "setLocationServicesButton:", v21);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNumberOfLines:", 0);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextAlignment:", 1);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_LOCATION_SERVICES_SETTINGS_TITLE"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTitle:forState:", v28, 0);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTitleColor:forState:", v30, 0);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addTarget:action:forControlEvents:", self, sel__tappedLocationServices_, 64);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v32);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;

  -[WDClinicalOnboardingNoGeoView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v68 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_containerView, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintGreaterThanOrEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  -[UIView bottomAnchor](self->_containerView, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintLessThanOrEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[UIView leadingAnchor](self->_containerView, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D2F3F0];
  objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:constant:", v10, *MEMORY[0x1E0D2F3F0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[UIView trailingAnchor](self->_containerView, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:constant:", v14, -v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[UIView centerXAnchor](self->_containerView, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[UIView centerYAnchor](self->_containerView, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView setContainerCenterYConstraint:](self, "setContainerCenterYConstraint:", v21);

  -[WDClinicalOnboardingNoGeoView containerCenterYConstraint](self, "containerCenterYConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_containerView, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_containerView, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_containerView, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_containerView, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_containerView, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "firstBaselineAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "lastBaselineAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView setSubtitleBaselineConstraint:](self, "setSubtitleBaselineConstraint:", v47);

  -[WDClinicalOnboardingNoGeoView subtitleBaselineConstraint](self, "subtitleBaselineConstraint");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_containerView, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_containerView, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_containerView, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "titleLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "firstBaselineAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "lastBaselineAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView setLocationServicesButtonBaselineConstraint:](self, "setLocationServicesButtonBaselineConstraint:", v66);

  -[WDClinicalOnboardingNoGeoView locationServicesButtonBaselineConstraint](self, "locationServicesButtonBaselineConstraint");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[WDClinicalOnboardingNoGeoView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDClinicalOnboardingNoGeoView;
  -[WDClinicalOnboardingNoGeoView layoutSubviews](&v6, sel_layoutSubviews);
  -[WDClinicalOnboardingNoGeoView bounds](self, "bounds");
  v4 = -(v3 * 0.5 + v3 * -0.45);
  -[WDClinicalOnboardingNoGeoView containerCenterYConstraint](self, "containerCenterYConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

}

- (void)_tappedLocationServices:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=LOCATION/com.apple.Health"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalOnboardingNoGeoView;
  -[WDClinicalOnboardingNoGeoView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDClinicalOnboardingNoGeoView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[WDClinicalOnboardingNoGeoView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)_updateForCurrentSizeCategory
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v3 = *MEMORY[0x1E0DC48F0];
  v4 = *MEMORY[0x1E0DC4B58];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B58], 1280, *MEMORY[0x1E0DC48F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  v7 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], 0, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", v4, 256, v3);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_scaledValueForValue:", 26.0);
  v11 = v10;
  -[WDClinicalOnboardingNoGeoView subtitleBaselineConstraint](self, "subtitleBaselineConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v11);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A88], 0, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingNoGeoView locationServicesButton](self, "locationServicesButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v13);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", v7, 0, v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_scaledValueForValue:", 32.0);
  v18 = v17;
  -[WDClinicalOnboardingNoGeoView locationServicesButtonBaselineConstraint](self, "locationServicesButtonBaselineConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConstant:", v18);

}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIButton)locationServicesButton
{
  return self->_locationServicesButton;
}

- (void)setLocationServicesButton:(id)a3
{
  objc_storeStrong((id *)&self->_locationServicesButton, a3);
}

- (NSLayoutConstraint)subtitleBaselineConstraint
{
  return self->_subtitleBaselineConstraint;
}

- (void)setSubtitleBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, a3);
}

- (NSLayoutConstraint)locationServicesButtonBaselineConstraint
{
  return self->_locationServicesButtonBaselineConstraint;
}

- (void)setLocationServicesButtonBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_locationServicesButtonBaselineConstraint, a3);
}

- (NSLayoutConstraint)containerCenterYConstraint
{
  return self->_containerCenterYConstraint;
}

- (void)setContainerCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerCenterYConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_locationServicesButtonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_locationServicesButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
