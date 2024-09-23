@implementation CNGroupIdentityHeaderViewController

- (CNGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3
{
  return -[CNGroupIdentityHeaderViewController initWithGroupIdentity:actionsViewConfiguration:](self, "initWithGroupIdentity:actionsViewConfiguration:", a3, 0);
}

- (CNGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4
{
  return -[CNGroupIdentityHeaderViewController initWithGroupIdentity:actionsViewConfiguration:avatarViewControllerSettings:](self, "initWithGroupIdentity:actionsViewConfiguration:avatarViewControllerSettings:", a3, a4, 0);
}

- (CNGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4 avatarViewControllerSettings:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNGroupIdentityHeaderViewController *v12;
  CNGroupIdentityHeaderViewController *v13;
  CNGroupAvatarViewController *v14;
  CNGroupAvatarViewController *groupAvatarViewController;
  CNContactFormatter *v16;
  CNContactFormatter *contactFormatter;
  uint64_t v18;
  CNSharedProfileBannerStyle *sharedProfileBannerStyle;
  void *v20;
  CNGroupIdentityHeaderViewController *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CNGroupIdentityHeaderViewController;
  v12 = -[CNGroupIdentityHeaderViewController init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    v14 = -[CNGroupAvatarViewController initWithGroup:avatarViewControllerSettings:]([CNGroupAvatarViewController alloc], "initWithGroup:avatarViewControllerSettings:", v9, v11);
    groupAvatarViewController = v13->_groupAvatarViewController;
    v13->_groupAvatarViewController = v14;

    objc_storeStrong((id *)&v13->_actionsViewConfiguration, a4);
    v16 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E0C97218]);
    contactFormatter = v13->_contactFormatter;
    v13->_contactFormatter = v16;

    -[CNContactFormatter setStyle:](v13->_contactFormatter, "setStyle:", 1000);
    -[CNContactFormatter setFallbackStyle:](v13->_contactFormatter, "setFallbackStyle:", -1);
    +[CNSharedProfileBannerStyle defaultStyle](CNSharedProfileBannerStyle, "defaultStyle");
    v18 = objc_claimAutoreleasedReturnValue();
    sharedProfileBannerStyle = v13->_sharedProfileBannerStyle;
    v13->_sharedProfileBannerStyle = (CNSharedProfileBannerStyle *)v18;

    -[CNGroupIdentityHeaderViewController setupActionButton](v13, "setupActionButton");
    -[CNGroupIdentityHeaderViewController setupActionsView](v13, "setupActionsView");
    -[CNGroupIdentityHeaderViewController setupSharedProfileBannerView](v13, "setupSharedProfileBannerView");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v13, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    v21 = v13;
  }

  return v13;
}

- (void)loadView
{
  CNGroupIdentityHeaderContainerView *v3;
  void *v4;
  CNGroupIdentityHeaderContainerView *v5;

  v3 = [CNGroupIdentityHeaderContainerView alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[CNGroupIdentityHeaderContainerView initWithFrame:](v3, "initWithFrame:");

  -[CNGroupIdentityHeaderContainerView setDelegate:](v5, "setDelegate:", self);
  -[CNGroupIdentityHeaderViewController setView:](self, "setView:", v5);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNGroupIdentityHeaderViewController;
  -[CNGroupIdentityHeaderViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNGroupIdentityHeaderViewController setupAvatarView](self, "setupAvatarView");
  -[CNGroupIdentityHeaderViewController setupTitleLabel](self, "setupTitleLabel");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNGroupIdentityHeaderViewController;
  -[CNGroupIdentityHeaderViewController viewDidLayoutSubviews](&v11, sel_viewDidLayoutSubviews);
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[CNGroupIdentityHeaderViewController previousSize](self, "previousSize");
  if (v9 != v5 || v8 != v7)
  {
    -[CNGroupIdentityHeaderViewController setPreviousSize:](self, "setPreviousSize:", v5, v7);
    -[CNGroupIdentityHeaderViewController updateTitleLabelFont](self, "updateTitleLabelFont");
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNGroupIdentityHeaderViewController actionsViewController](self, "actionsViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willMoveToParentViewController:", 0);

  -[CNGroupIdentityHeaderViewController actionsViewController](self, "actionsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[CNGroupIdentityHeaderViewController actionsViewController](self, "actionsViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromParentViewController");

  -[CNGroupIdentityHeaderViewController updateActionButtonFont](self, "updateActionButtonFont");
  if (-[CNGroupIdentityHeaderViewController shouldShowActionsView](self, "shouldShowActionsView"))
    -[CNGroupIdentityHeaderViewController setupPopulatedActionsView](self, "setupPopulatedActionsView");
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateIntrinsicContentSize");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupAvatarView
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
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
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
  _QWORD v40[6];

  v40[5] = *MEMORY[0x1E0C80C00];
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController addChildViewController:](self, "addChildViewController:", v5);

  -[CNGroupIdentityHeaderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v8);

  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintLessThanOrEqualToConstant:", 106.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = 1148846080;
  objc_msgSend(v39, "setPriority:", v12);
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:multiplier:", v17, 0.3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v18) = 1148829696;
  objc_msgSend(v38, "setPriority:", v18);
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 5.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v32;
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v20, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v21;
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, -0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v27;
  v40[3] = v38;
  v40[4] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v28);
}

- (UIFont)titleLabelFont
{
  cn_objectResultWithObjectLock();
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIFont)titleLabelWrappedFont
{
  cn_objectResultWithObjectLock();
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)preferredContentSizeCategoryIsXL
{
  void *v2;
  char v3;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DC48B8]);
  }

  return v3;
}

- (void)setupTitleLabel
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
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
  double v32;
  id v33;
  double v34;
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
  _QWORD v45[3];
  _QWORD v46[2];
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v3, "setAxis:", 1);
  objc_msgSend(v3, "setAlignment:", 3);
  objc_msgSend(v3, "setDistribution:", 3);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNGroupIdentityHeaderViewController setTitleLabelStackView:](self, "setTitleLabelStackView:", v3);
  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setNumberOfLines:", 2);
  objc_msgSend(v5, "setMinimumScaleFactor:", 0.8);
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  -[CNGroupIdentityHeaderViewController titleLabelFont](self, "titleLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "sizeToFit");
  v7 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v47[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArrangedSubviews:", v8);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setAxis:", 0);
  objc_msgSend(v9, "setAlignment:", 3);
  objc_msgSend(v9, "setDistribution:", 0);
  objc_msgSend(v9, "setSpacing:", 2.0);
  -[CNGroupIdentityHeaderViewController setTitleBadgeStackView:](self, "setTitleBadgeStackView:", v9);
  v44 = v9;
  objc_msgSend(v3, "addArrangedSubview:", v9);
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v3);

  objc_msgSend(v3, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v14, -4.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CNGroupIdentityHeaderViewController preferredContentSizeCategoryIsXL](self, "preferredContentSizeCategoryIsXL"))
  {
    LODWORD(v16) = 1132068864;
    objc_msgSend(v15, "setPriority:", v16);
  }
  objc_msgSend(v5, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v19;
  objc_msgSend(v5, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v42 = v5;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v43 = v15;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController setHorizontalTitleLabelConstraints:](self, "setHorizontalTitleLabelConstraints:", v23);

  v45[0] = v15;
  objc_msgSend(v3, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v24;
  objc_msgSend(v3, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController horizontalTitleLabelConstraints](self, "horizontalTitleLabelConstraints");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v31);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v37);
  LODWORD(v32) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 1, v32);
  -[CNGroupIdentityHeaderViewController setTitleLabel:](self, "setTitleLabel:", v42);
  -[CNGroupIdentityHeaderViewController updateTitleLabel](self, "updateTitleLabel");
  v33 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  LODWORD(v34) = 1148846080;
  objc_msgSend(v33, "setContentCompressionResistancePriority:forAxis:", 0, v34);
  objc_msgSend(v33, "setAccessibilityIdentifier:", CFSTR("VerifiedBadge"));
  CNContactsUIBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("GROUP_IDENTITY_HEADER_BADGE_ACCESSIBILITY_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAccessibilityLabel:", v36);

  objc_msgSend(v33, "setIsAccessibilityElement:", 1);
  -[CNGroupIdentityHeaderViewController setStaticIdentityBadge:](self, "setStaticIdentityBadge:", v33);
  -[CNGroupIdentityHeaderViewController setupCustomSubtitleLabel](self, "setupCustomSubtitleLabel");

}

- (double)titleLabelBaselineOffset
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  -[CNGroupIdentityHeaderViewController titleLabelStackView](self, "titleLabelStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[CNGroupIdentityHeaderViewController titleLabelStackView](self, "titleLabelStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v5 + v7;
  -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descender");
  v12 = v8 + v11;

  return v12;
}

- (void)setupActionButton
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3518]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setContentEdgeInsets:", 1.0, 0.0, 1.0, 0.0);
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v6, 0);

  objc_msgSend(v4, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(v4, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 2);

  objc_msgSend(v4, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", 1);

  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_didTapActionButton, 64);
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v4);

  objc_msgSend(v4, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController titleLabelStackView](self, "titleLabelStackView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 2.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  objc_msgSend(v4, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController titleLabelStackView](self, "titleLabelStackView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v21;
  objc_msgSend(v4, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController titleLabelStackView](self, "titleLabelStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v14;
  objc_msgSend(v4, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
  LODWORD(v19) = 1148846080;
  objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 1, v19);
  -[CNGroupIdentityHeaderViewController setActionButton:](self, "setActionButton:", v4);
  -[CNGroupIdentityHeaderViewController updateActionButtonFont](self, "updateActionButtonFont");
  -[CNGroupIdentityHeaderViewController updateActionButton](self, "updateActionButton");

}

- (void)updateActionButtonFont
{
  void *v3;
  void *v4;
  id v5;

  if (-[CNGroupIdentityHeaderViewController preferredContentSizeCategoryIsXL](self, "preferredContentSizeCategoryIsXL"))
    +[CNUIFontRepository groupHeaderActionButtonWrappedFont](CNUIFontRepository, "groupHeaderActionButtonWrappedFont");
  else
    +[CNUIFontRepository groupHeaderActionButtonFont](CNUIFontRepository, "groupHeaderActionButtonFont");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController actionButton](self, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

- (void)setupActionsView
{
  if (-[CNGroupIdentityHeaderViewController shouldShowActionsView](self, "shouldShowActionsView"))
    -[CNGroupIdentityHeaderViewController setupPopulatedActionsView](self, "setupPopulatedActionsView");
  else
    -[CNGroupIdentityHeaderViewController setupEmptyActionsView](self, "setupEmptyActionsView");
}

- (BOOL)shouldShowActionsView
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *MEMORY[0x1E0D137F8];
  -[CNGroupIdentityHeaderViewController actionsViewConfiguration](self, "actionsViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedActionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v4) ^ 1;

  return v2;
}

- (void)setupEmptyActionsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[CNGroupIdentityHeaderViewController actionButton](self, "actionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:constant:", v7, -5.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v9);

}

- (void)setupPopulatedActionsView
{
  CNGroupIdentityInlineActionsViewController *v3;
  void *v4;
  void *v5;
  CNGroupIdentityInlineActionsViewController *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
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
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
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
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[8];

  v61[7] = *MEMORY[0x1E0C80C00];
  v3 = [CNGroupIdentityInlineActionsViewController alloc];
  -[CNGroupIdentityHeaderViewController group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController actionsViewConfiguration](self, "actionsViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNGroupIdentityInlineActionsViewController initWithGroupIdentity:actionsViewConfiguration:](v3, "initWithGroupIdentity:actionsViewConfiguration:", v4, v5);

  -[CNGroupIdentityInlineActionsViewController setDelegate:](v6, "setDelegate:", self);
  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNGroupIdentityHeaderViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[CNGroupIdentityInlineActionsViewController actionsViewHeightThatFits:](v6, "actionsViewHeightThatFits:", v9, v10);
  v12 = v11;

  -[CNGroupIdentityHeaderViewController addChildViewController:](self, "addChildViewController:", v6);
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  -[CNGroupIdentityInlineActionsViewController didMoveToParentViewController:](v6, "didMoveToParentViewController:", self);
  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintLessThanOrEqualToConstant:", 454.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = 1148846080;
  objc_msgSend(v60, "setPriority:", v17);
  -[CNGroupIdentityInlineActionsViewController style](v6, "style");
  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v22;
  v59 = v22;
  LODWORD(v29) = 1144766464;
  objc_msgSend(v22, "setPriority:", v29);
  v58 = v27;
  LODWORD(v30) = 1144766464;
  objc_msgSend(v27, "setPriority:", v30);
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v32 = 22.0;
  if (v33 > 896.0)
    v32 = 20.0;
  -[CNGroupIdentityHeaderViewController setActionsViewTopMargin:](self, "setActionsViewTopMargin:", v32);

  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController actionButton](self, "actionButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController actionsViewTopMargin](self, "actionsViewTopMargin");
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v39) = 1148829696;
  v57 = v38;
  objc_msgSend(v38, "setPriority:", v39);
  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, -5.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController setActionsViewBottomConstraint:](self, "setActionsViewBottomConstraint:", v44);

  v61[0] = v38;
  v61[1] = v28;
  v61[2] = v27;
  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v47;
  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "heightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToConstant:", v12);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v50;
  v61[5] = v60;
  -[CNGroupIdentityHeaderViewController actionsViewBottomConstraint](self, "actionsViewBottomConstraint");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 7);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNGroupIdentityInlineActionsViewController view](v6, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v54) = 1144750080;
  objc_msgSend(v53, "setContentHuggingPriority:forAxis:", 1, v54);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v52);
  -[CNGroupIdentityHeaderViewController setActionsViewController:](self, "setActionsViewController:", v6);

}

- (void)setActionButtonTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_actionButtonTitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_actionButtonTitle, a3);
    -[CNGroupIdentityHeaderViewController updateActionButton](self, "updateActionButton");
    v5 = v6;
  }

}

- (BOOL)shouldShowActionButton
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x1E0D13850];
  -[CNGroupIdentityHeaderViewController actionButtonTitle](self, "actionButtonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v2;
}

- (void)updateActionButton
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[CNGroupIdentityHeaderViewController shouldShowActionButton](self, "shouldShowActionButton");
  -[CNGroupIdentityHeaderViewController actionButtonZeroHeightConstraint](self, "actionButtonZeroHeightConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = 0;
  }
  else
  {

    if (!v5)
    {
      -[CNGroupIdentityHeaderViewController actionButton](self, "actionButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "heightAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToConstant:", 0.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGroupIdentityHeaderViewController setActionButtonZeroHeightConstraint:](self, "setActionButtonZeroHeightConstraint:", v9);

    }
    -[CNGroupIdentityHeaderViewController actionButtonZeroHeightConstraint](self, "actionButtonZeroHeightConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 1;
  }
  objc_msgSend(v4, "setActive:", v6);

  -[CNGroupIdentityHeaderViewController actionButton](self, "actionButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController actionButtonTitle](self, "actionButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v10, 0);

}

- (void)updateTitleLabel
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v17;

  -[CNGroupIdentityHeaderViewController displayNameForGroupIdentity](self, "displayNameForGroupIdentity");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17
    || (-[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "text"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v17, "isEqual:", v6) ^ 1;

    if (v17)
      goto LABEL_7;
  }
  else
  {
    v7 = 0;
  }

LABEL_7:
  -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v17);

  if (v7)
  {
    -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);

    if (v11 != v14 || v13 != v15)
      -[CNGroupIdentityHeaderViewController updateTitleLabelFont](self, "updateTitleLabelFont");
  }

}

- (void)updateTitleLabelFont
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;

  -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (v5 == v8 && v7 == v9)
  {
    -[CNGroupIdentityHeaderViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
  }
  else
  {
    -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
  }
  v13 = v12;

  -[CNGroupIdentityHeaderViewController titleLabelFont](self, "titleLabelFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController titleLabelBoundingRectForFont:text:maxWidth:context:](self, "titleLabelBoundingRectForFont:text:maxWidth:context:", v14, v16, 0, v13);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[CNGroupIdentityHeaderViewController titleLabelFont](self, "titleLabelFont");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CNGroupIdentityHeaderViewController shouldUseTitleLabelWrappedFontGivenBoundingRect:](self, "shouldUseTitleLabelWrappedFontGivenBoundingRect:", v18, v20, v22, v24))
  {
    -[CNGroupIdentityHeaderViewController titleLabelWrappedFont](self, "titleLabelWrappedFont");
    v25 = objc_claimAutoreleasedReturnValue();

    v30 = (id)v25;
  }
  -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "font");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v28 = v30;
  if (v27 != v30)
  {
    -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFont:", v30);

    v28 = v30;
  }

}

- (CGRect)titleLabelBoundingRectForFont:(id)a3 text:(id)a4 maxWidth:(double)a5 context:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  _QWORD v27[2];
  CGRect result;

  v27[1] = *MEMORY[0x1E0C80C00];
  v26 = *MEMORY[0x1E0DC1138];
  v27[0] = a3;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 33, v13, v10, a5, 1.79769313e308);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)shouldUseTitleLabelWrappedFontGivenBoundingRect:(CGRect)a3
{
  double height;
  void *v4;
  double v5;
  BOOL v6;

  height = a3.size.height;
  -[CNGroupIdentityHeaderViewController titleLabelFont](self, "titleLabelFont", a3.origin.x, a3.origin.y, a3.size.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = ceil(height / v5) > 1.0;

  return v6;
}

- (void)setShouldHideTitleLabel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6 != v3)
  {
    -[CNGroupIdentityHeaderViewController titleLabel](self, "titleLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v3);

  }
}

- (void)setShouldShowStaticKeyBadge:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    +[CNStaticIdentityBadgeView sealLockImage](CNStaticIdentityBadgeView, "sealLockImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController staticIdentityBadge](self, "staticIdentityBadge");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v4);

    -[CNGroupIdentityHeaderViewController titleBadgeStackView](self, "titleBadgeStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController staticIdentityBadge](self, "staticIdentityBadge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addArrangedSubview:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[CNGroupIdentityHeaderViewController horizontalTitleLabelConstraints](self, "horizontalTitleLabelConstraints");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deactivateConstraints:");
  }
  else
  {
    -[CNGroupIdentityHeaderViewController staticIdentityBadge](self, "staticIdentityBadge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", 0);

    -[CNGroupIdentityHeaderViewController staticIdentityBadge](self, "staticIdentityBadge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[CNGroupIdentityHeaderViewController horizontalTitleLabelConstraints](self, "horizontalTitleLabelConstraints");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:");
  }

}

- (void)updateGroupWithContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNGroupIdentityHeaderViewController group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateContacts:", v7);
  -[CNGroupIdentityHeaderViewController groupIdentityDidUpdate:](self, "groupIdentityDidUpdate:", v6);

}

- (void)groupIdentityDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (!-[CNGroupIdentityHeaderViewController groupContactIsSameAsCurrentContact:](self, "groupContactIsSameAsCurrentContact:", v4))
  {
    -[CNGroupIdentityHeaderViewController setTappedSharedProfileBannerAction:](self, "setTappedSharedProfileBannerAction:", 0);
    -[CNGroupIdentityHeaderViewController setHasPerformedSharedProfileBannerAnimation:](self, "setHasPerformedSharedProfileBannerAnimation:", 0);
    -[CNGroupIdentityHeaderViewController setSharedProfileStateOracle:](self, "setSharedProfileStateOracle:", 0);
  }
  -[CNGroupIdentityHeaderViewController setGroup:](self, "setGroup:", v4);
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharedProfileStateOracle:", v6);

  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupIdentityDidUpdate:", v4);

  -[CNGroupIdentityHeaderViewController updateTitleLabel](self, "updateTitleLabel");
  -[CNGroupIdentityHeaderViewController actionsViewController](self, "actionsViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGroup:", v4);

}

- (BOOL)groupContactIsSameAsCurrentContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_msgSend(v4, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    -[CNGroupIdentityHeaderViewController group](self, "group");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 != 1)
    {
      v15 = 0;
      goto LABEL_7;
    }
    -[CNGroupIdentityHeaderViewController group](self, "group");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "contacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

  }
  else
  {
    v15 = 0;
  }

LABEL_7:
  return v15;
}

- (void)didTapActionButton
{
  void *v3;
  char v4;
  id v5;

  -[CNGroupIdentityHeaderViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNGroupIdentityHeaderViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headerViewControllerDidTapActionButton:", self);

  }
}

- (void)setCustomSubtitleLabel:(id)a3
{
  UILabel *v5;
  UILabel *customSubtitleLabel;
  UILabel *v7;

  v5 = (UILabel *)a3;
  customSubtitleLabel = self->_customSubtitleLabel;
  if (customSubtitleLabel != v5)
  {
    v7 = v5;
    -[UILabel removeFromSuperview](customSubtitleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customSubtitleLabel, a3);
    -[CNGroupIdentityHeaderViewController setupCustomSubtitleLabel](self, "setupCustomSubtitleLabel");
    v5 = v7;
  }

}

- (void)setupCustomSubtitleLabel
{
  void *v3;
  void *v4;
  id v5;

  -[CNGroupIdentityHeaderViewController customSubtitleLabel](self, "customSubtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNGroupIdentityHeaderViewController titleLabelStackView](self, "titleLabelStackView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController customSubtitleLabel](self, "customSubtitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addArrangedSubview:", v4);

  }
}

- (void)setAvatarBadgeImage:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_avatarBadgeImage, a3);
  v5 = a3;
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBadgeImage:", v5);

}

- (void)setAvatarBadgeStyleSettings:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_avatarBadgeStyleSettings, a3);
  v5 = a3;
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBadgeStyleSettings:", v5);

}

- (void)setIsMarkedForSyndication:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isMarkedForSyndication = a3;
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsMarkedForSyndication:", v3);

}

- (void)setShouldShowContactBusy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_shouldShowContactBusy = a3;
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDoNotDisturb:", v3);

}

- (void)setMediaContextBadge:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_mediaContextBadge, a3);
  v5 = a3;
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaContextBadge:", v5);

}

- (void)setSharedProfileStateOracle:(id)a3
{
  CNSharedProfileStateOracle *v5;
  void *v6;
  CNSharedProfileStateOracle *v7;

  v5 = (CNSharedProfileStateOracle *)a3;
  if (self->_sharedProfileStateOracle != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
    -[CNGroupIdentityHeaderViewController setupSharedProfileBannerView](self, "setupSharedProfileBannerView");
    -[CNGroupIdentityHeaderViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsUpdateConstraints");

    v5 = v7;
  }

}

- (void)setSharedProfileBannerStyle:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  CNSharedProfileBannerStyle *v17;

  v17 = (CNSharedProfileBannerStyle *)a3;
  if (self->_sharedProfileBannerStyle != v17)
  {
    objc_storeStrong((id *)&self->_sharedProfileBannerStyle, a3);
    -[CNGroupIdentityHeaderViewController sharedProfileBannerView](self, "sharedProfileBannerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyle:", v17);

    -[CNSharedProfileBannerStyle backgroundColor](v17, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerView](self, "sharedProfileBannerContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[CNSharedProfileBannerStyle backgroundVisualEffectView](v17, "backgroundVisualEffectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerView](self, "sharedProfileBannerContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharedProfileBannerStyle backgroundVisualEffectView](v17, "backgroundVisualEffectView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addBackgroundVisualEffectView:withCornerRadius:", v10, 12.0);

    }
    -[CNSharedProfileBannerStyle leadingTrailingInset](v17, "leadingTrailingInset");
    v12 = v11;
    -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerLeadingConstraint](self, "sharedProfileBannerContainerLeadingConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", v12);

    -[CNSharedProfileBannerStyle leadingTrailingInset](v17, "leadingTrailingInset");
    v15 = -v14;
    -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerTrailingConstraint](self, "sharedProfileBannerContainerTrailingConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", v15);

  }
}

- (BOOL)shouldShowSharedProfileBannerView
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  void *v15;
  uint8_t v16[16];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 16);

  if (!v5)
    return 0;
  -[CNGroupIdentityHeaderViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  -[CNGroupIdentityHeaderViewController group](self, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 != 1)
    return 0;
  -[CNGroupIdentityHeaderViewController sharedProfileBannerView](self, "sharedProfileBannerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isIgnored");

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEFAULT, "Not showing banner view, user dismissed banner view", v16, 2u);
    }

    return 0;
  }
  -[CNGroupIdentityHeaderViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "bannerActionTypeForEffectiveState"))
    v13 = 1;
  else
    v13 = -[CNGroupIdentityHeaderViewController tappedSharedProfileBannerAction](self, "tappedSharedProfileBannerAction") != 0;

  return v13;
}

- (void)setupSharedProfileBannerView
{
  void *v3;
  void *v4;
  CNSharedProfileBannerView *v5;
  void *v6;
  void *v7;
  id v8;
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
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
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
  double v39;
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
  _QWORD v66[9];
  void *v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerView](self, "sharedProfileBannerContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerView](self, "sharedProfileBannerContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  if (-[CNGroupIdentityHeaderViewController shouldShowSharedProfileBannerView](self, "shouldShowSharedProfileBannerView"))
  {
    v5 = objc_alloc_init(CNSharedProfileBannerView);
    -[CNSharedProfileBannerView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNSharedProfileBannerView setDelegate:](v5, "setDelegate:", self);
    -[CNGroupIdentityHeaderViewController sharedProfileBannerStyle](self, "sharedProfileBannerStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView setStyle:](v5, "setStyle:", v6);

    -[CNGroupIdentityHeaderViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfileBannerView setUpWithSharedProfileStateOracle:tappedAction:hasPerformedAnimation:](v5, "setUpWithSharedProfileStateOracle:tappedAction:hasPerformedAnimation:", v7, -[CNGroupIdentityHeaderViewController tappedSharedProfileBannerAction](self, "tappedSharedProfileBannerAction"), -[CNGroupIdentityHeaderViewController hasPerformedSharedProfileBannerAnimation](self, "hasPerformedSharedProfileBannerAnimation"));

    -[CNGroupIdentityHeaderViewController setHasPerformedSharedProfileBannerAnimation:](self, "setHasPerformedSharedProfileBannerAnimation:", 1);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNGroupIdentityHeaderViewController sharedProfileBannerStyle](self, "sharedProfileBannerStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v10);

    objc_msgSend(v8, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 12.0);

    -[CNGroupIdentityHeaderViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v8);

    objc_msgSend(v8, "addSubview:", v5);
    -[CNGroupIdentityHeaderViewController sharedProfileBannerStyle](self, "sharedProfileBannerStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backgroundVisualEffectView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[CNGroupIdentityHeaderViewController sharedProfileBannerStyle](self, "sharedProfileBannerStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "backgroundVisualEffectView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addBackgroundVisualEffectView:withCornerRadius:", v16, 12.0);

    }
    -[CNGroupIdentityHeaderViewController actionsViewBottomConstraint](self, "actionsViewBottomConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB3718];
      -[CNGroupIdentityHeaderViewController actionsViewBottomConstraint](self, "actionsViewBottomConstraint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "deactivateConstraints:", v20);

    }
    v21 = -[CNGroupIdentityHeaderViewController shouldShowActionsView](self, "shouldShowActionsView");
    objc_msgSend(v8, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[CNGroupIdentityHeaderViewController actionsViewController](self, "actionsViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:constant:", v25, 10.0);
      v26 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[CNGroupIdentityHeaderViewController actionButton](self, "actionButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 10.0);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v56 = (void *)v26;

    objc_msgSend(v8, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController sharedProfileBannerStyle](self, "sharedProfileBannerStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingTrailingInset");
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController setSharedProfileBannerContainerLeadingConstraint:](self, "setSharedProfileBannerContainerLeadingConstraint:", v34);

    objc_msgSend(v8, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController sharedProfileBannerStyle](self, "sharedProfileBannerStyle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingTrailingInset");
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, -v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController setSharedProfileBannerContainerTrailingConstraint:](self, "setSharedProfileBannerContainerTrailingConstraint:", v40);

    v55 = (void *)MEMORY[0x1E0CB3718];
    v66[0] = v26;
    -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerLeadingConstraint](self, "sharedProfileBannerContainerLeadingConstraint");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v65;
    -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerTrailingConstraint](self, "sharedProfileBannerContainerTrailingConstraint");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v64;
    objc_msgSend(v8, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController view](self, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v60;
    -[CNSharedProfileBannerView topAnchor](v5, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v66[4] = v57;
    -[CNSharedProfileBannerView leadingAnchor](v5, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v66[5] = v51;
    -[CNSharedProfileBannerView trailingAnchor](v5, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v66[6] = v41;
    -[CNSharedProfileBannerView bottomAnchor](v5, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v66[7] = v44;
    -[CNSharedProfileBannerView heightAnchor](v5, "heightAnchor");
    v29 = v5;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "estimatedHeight");
    objc_msgSend(v45, "constraintGreaterThanOrEqualToConstant:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v66[8] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 9);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v47);

    -[CNGroupIdentityHeaderViewController setSharedProfileBannerContainerView:](self, "setSharedProfileBannerContainerView:", v8);
    -[CNGroupIdentityHeaderViewController setSharedProfileBannerView:](self, "setSharedProfileBannerView:", v29);

  }
  else
  {
    -[CNGroupIdentityHeaderViewController actionsViewBottomConstraint](self, "actionsViewBottomConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      return;
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[CNGroupIdentityHeaderViewController actionsViewBottomConstraint](self, "actionsViewBottomConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v8);
  }

}

- (void)hideSharedProfileBannerViewForDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerView](self, "sharedProfileBannerContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNGroupIdentityHeaderViewController sharedProfileBannerContainerView](self, "sharedProfileBannerContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
  -[CNGroupIdentityHeaderViewController actionsViewBottomConstraint](self, "actionsViewBottomConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[CNGroupIdentityHeaderViewController actionsViewBottomConstraint](self, "actionsViewBottomConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateConstraints:", v8);

  }
}

- (void)performAnimationToNewContact:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  CNSharedProfileAnimationGenerator *v16;

  v6 = a4;
  v7 = a3;
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryAvatarSize");
  v10 = v9;
  v12 = v11;

  -[CNGroupIdentityHeaderViewController traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "layoutDirection") == 1;

  v16 = objc_alloc_init(CNSharedProfileAnimationGenerator);
  -[CNGroupIdentityHeaderViewController groupAvatarViewController](self, "groupAvatarViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedProfileAnimationGenerator performCoinFlipAnimationForAnimatingAvatarView:toContact:rightToLeft:avatarSize:completionHandler:](v16, "performCoinFlipAnimationForAnimatingAvatarView:toContact:rightToLeft:avatarSize:completionHandler:", v15, v7, v14, v6, v10, v12);

}

- (id)viewForActionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CNGroupIdentityHeaderViewController actionsViewController](self, "actionsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForActionAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)sizeForLayoutInContainerSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v57 = *MEMORY[0x1E0C80C00];
  -[CNGroupIdentityHeaderViewController displayNameForGroupIdentity](self, "displayNameForGroupIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
  objc_msgSend(v7, "setMaximumNumberOfLines:", 2);
  -[CNGroupIdentityHeaderViewController titleLabelFont](self, "titleLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController titleLabelBoundingRectForFont:text:maxWidth:context:](self, "titleLabelBoundingRectForFont:text:maxWidth:context:", v8, v6, v7, width);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0
    && -[CNGroupIdentityHeaderViewController shouldUseTitleLabelWrappedFontGivenBoundingRect:](self, "shouldUseTitleLabelWrappedFontGivenBoundingRect:", v10, v12, v14, v16))
  {
    -[CNGroupIdentityHeaderViewController titleLabelWrappedFont](self, "titleLabelWrappedFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController titleLabelBoundingRectForFont:text:maxWidth:context:](self, "titleLabelBoundingRectForFont:text:maxWidth:context:", v17, v6, v7, width);
    v16 = v18;

  }
  v19 = v16 + 102.0;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[CNGroupIdentityHeaderViewController titleLabelStackView](self, "titleLabelStackView", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrangedSubviews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v51;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v51 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v25);
        objc_opt_class();
        v27 = v26;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
        v29 = v28;

        if (v29)
        {
          objc_msgSend(v29, "sizeToFit");
          objc_msgSend(v29, "bounds");
          v19 = v19 + v30;
        }

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v23);
  }

  if (-[CNGroupIdentityHeaderViewController shouldShowActionButton](self, "shouldShowActionButton"))
  {
    -[CNGroupIdentityHeaderViewController actionButton](self, "actionButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGroupIdentityHeaderViewController actionButtonTitle](self, "actionButtonTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTitle:forState:", v32, 0);

    objc_msgSend(v7, "setMaximumNumberOfLines:", 2);
    -[CNGroupIdentityHeaderViewController actionButtonTitle](self, "actionButtonTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = *MEMORY[0x1E0DC1138];
    +[CNUIFontRepository groupHeaderActionButtonFont](CNUIFontRepository, "groupHeaderActionButtonFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "boundingRectWithSize:options:attributes:context:", 33, v35, v7, width, height);
    v37 = v36;

    v38 = v19 + v37 + -2.0;
    if (-[CNGroupIdentityHeaderViewController preferredContentSizeCategoryIsXL](self, "preferredContentSizeCategoryIsXL"))
    {
      v19 = v38 + 25.0;
    }
    else
    {
      v19 = v38;
    }
  }
  if (-[CNGroupIdentityHeaderViewController shouldShowActionsView](self, "shouldShowActionsView"))
  {
    -[CNGroupIdentityHeaderViewController actionsViewTopMargin](self, "actionsViewTopMargin");
    v40 = v19 + v39;
    -[CNGroupIdentityHeaderViewController actionsViewController](self, "actionsViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "actionsViewHeightThatFits:", width, height);
    v43 = v42;

    v19 = v40 + v43;
  }
  v44 = v19 + 10.0;
  if (-[CNGroupIdentityHeaderViewController shouldShowSharedProfileBannerView](self, "shouldShowSharedProfileBannerView"))
  {
    -[CNGroupIdentityHeaderViewController sharedProfileBannerView](self, "sharedProfileBannerView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "estimatedHeightForWidth:", width);
    v47 = v44 + v46 + 10.0;

    v44 = v47 + -5.0;
  }
  if (width > 454.0)
    width = 454.0;

  v48 = ceil(width);
  v49 = ceil(v44);
  result.height = v49;
  result.width = v48;
  return result;
}

- (id)displayNameForGroupIdentity
{
  void *v3;
  void *v4;
  void *v5;

  -[CNGroupIdentityHeaderViewController contactFormatter](self, "contactFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupIdentityHeaderViewController group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromGroupIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)groupIdentityInlineActionsViewController:(id)a3 didPerformActionOfType:(id)a4 fromDisambiguation:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a4;
  -[CNGroupIdentityHeaderViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNGroupIdentityHeaderViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupIdentityHeaderViewController:didPerformActionOfType:fromDisambiguation:", self, v10, v5);

  }
}

- (void)groupIdentityInlineActionsViewController:(id)a3 willPresentDisambiguationUIForActionType:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CNGroupIdentityHeaderViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNGroupIdentityHeaderViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupIdentityHeaderViewController:willPresentDisambiguationUIForActionType:", self, v8);

  }
}

- (void)sharedProfileBannerView:(id)a3 didUpdateContact:(id)a4 forAction:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__CNGroupIdentityHeaderViewController_sharedProfileBannerView_didUpdateContact_forAction___block_invoke;
  v9[3] = &unk_1E204D910;
  v9[4] = self;
  v10 = v7;
  v11 = a5;
  v8 = v7;
  -[CNGroupIdentityHeaderViewController performAnimationToNewContact:withCompletion:](self, "performAnimationToNewContact:withCompletion:", v8, v9);

}

- (void)sharedProfileBannerView:(id)a3 didDismissWithUpdatedContact:(id)a4 forAction:(unint64_t)a5
{
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[CNGroupIdentityHeaderViewController setTappedSharedProfileBannerAction:](self, "setTappedSharedProfileBannerAction:", 0);
  -[CNGroupIdentityHeaderViewController updateGroupWithContact:](self, "updateGroupWithContact:", v10);
  -[CNGroupIdentityHeaderViewController hideSharedProfileBannerViewForDismiss](self, "hideSharedProfileBannerViewForDismiss");
  -[CNGroupIdentityHeaderViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNGroupIdentityHeaderViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupIdentityHeaderViewController:didDismissSharedProfileBannerWithUpdatedContact:forAction:", self, v10, a5);

  }
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (CNGroupIdentityHeaderViewControllerDelegate)delegate
{
  return (CNGroupIdentityHeaderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNGroupIdentity)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (CNGroupIdentityInlineActionsViewConfiguration)actionsViewConfiguration
{
  return self->_actionsViewConfiguration;
}

- (UIImage)avatarBadgeImage
{
  return self->_avatarBadgeImage;
}

- (CNBadgingAvatarBadgeStyleSettings)avatarBadgeStyleSettings
{
  return self->_avatarBadgeStyleSettings;
}

- (BOOL)isMarkedForSyndication
{
  return self->_isMarkedForSyndication;
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (UILabel)customSubtitleLabel
{
  return self->_customSubtitleLabel;
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (CNSharedProfileBannerStyle)sharedProfileBannerStyle
{
  return self->_sharedProfileBannerStyle;
}

- (BOOL)shouldShowContactBusy
{
  return self->_shouldShowContactBusy;
}

- (UIStackView)titleLabelStackView
{
  return self->_titleLabelStackView;
}

- (void)setTitleLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelStackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setTitleLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelFont, a3);
}

- (void)setTitleLabelWrappedFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelWrappedFont, a3);
}

- (UIStackView)titleBadgeStackView
{
  return self->_titleBadgeStackView;
}

- (void)setTitleBadgeStackView:(id)a3
{
  objc_storeStrong((id *)&self->_titleBadgeStackView, a3);
}

- (NSArray)horizontalTitleLabelConstraints
{
  return self->_horizontalTitleLabelConstraints;
}

- (void)setHorizontalTitleLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalTitleLabelConstraints, a3);
}

- (UIImageView)staticIdentityBadge
{
  return self->_staticIdentityBadge;
}

- (void)setStaticIdentityBadge:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentityBadge, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (NSLayoutConstraint)actionButtonZeroHeightConstraint
{
  return self->_actionButtonZeroHeightConstraint;
}

- (void)setActionButtonZeroHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonZeroHeightConstraint, a3);
}

- (double)actionsViewTopMargin
{
  return self->_actionsViewTopMargin;
}

- (void)setActionsViewTopMargin:(double)a3
{
  self->_actionsViewTopMargin = a3;
}

- (CNGroupAvatarViewController)groupAvatarViewController
{
  return self->_groupAvatarViewController;
}

- (void)setGroupAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_groupAvatarViewController, a3);
}

- (CNGroupIdentityInlineActionsViewController)actionsViewController
{
  return self->_actionsViewController;
}

- (void)setActionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsViewController, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (CGSize)previousSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousSize.width;
  height = self->_previousSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousSize:(CGSize)a3
{
  self->_previousSize = a3;
}

- (UIView)sharedProfileBannerContainerView
{
  return self->_sharedProfileBannerContainerView;
}

- (void)setSharedProfileBannerContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileBannerContainerView, a3);
}

- (NSLayoutConstraint)actionsViewBottomConstraint
{
  return self->_actionsViewBottomConstraint;
}

- (void)setActionsViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_actionsViewBottomConstraint, a3);
}

- (NSLayoutConstraint)sharedProfileBannerContainerLeadingConstraint
{
  return self->_sharedProfileBannerContainerLeadingConstraint;
}

- (void)setSharedProfileBannerContainerLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileBannerContainerLeadingConstraint, a3);
}

- (NSLayoutConstraint)sharedProfileBannerContainerTrailingConstraint
{
  return self->_sharedProfileBannerContainerTrailingConstraint;
}

- (void)setSharedProfileBannerContainerTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileBannerContainerTrailingConstraint, a3);
}

- (CNSharedProfileBannerView)sharedProfileBannerView
{
  return self->_sharedProfileBannerView;
}

- (void)setSharedProfileBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileBannerView, a3);
}

- (unint64_t)tappedSharedProfileBannerAction
{
  return self->_tappedSharedProfileBannerAction;
}

- (void)setTappedSharedProfileBannerAction:(unint64_t)a3
{
  self->_tappedSharedProfileBannerAction = a3;
}

- (BOOL)hasPerformedSharedProfileBannerAnimation
{
  return self->_hasPerformedSharedProfileBannerAnimation;
}

- (void)setHasPerformedSharedProfileBannerAnimation:(BOOL)a3
{
  self->_hasPerformedSharedProfileBannerAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileBannerView, 0);
  objc_storeStrong((id *)&self->_sharedProfileBannerContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_sharedProfileBannerContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_actionsViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_sharedProfileBannerContainerView, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_groupAvatarViewController, 0);
  objc_storeStrong((id *)&self->_actionButtonZeroHeightConstraint, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_staticIdentityBadge, 0);
  objc_storeStrong((id *)&self->_horizontalTitleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_titleBadgeStackView, 0);
  objc_storeStrong((id *)&self->_titleLabelWrappedFont, 0);
  objc_storeStrong((id *)&self->_titleLabelFont, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabelStackView, 0);
  objc_storeStrong((id *)&self->_sharedProfileBannerStyle, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_customSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_avatarBadgeStyleSettings, 0);
  objc_storeStrong((id *)&self->_avatarBadgeImage, 0);
  objc_storeStrong((id *)&self->_actionsViewConfiguration, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
}

uint64_t __90__CNGroupIdentityHeaderViewController_sharedProfileBannerView_didUpdateContact_forAction___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupIdentityHeaderViewController:sharedProfileBannerDidUpdateContact:forAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "setTappedSharedProfileBannerAction:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "updateGroupWithContact:", *(_QWORD *)(a1 + 40));
}

id __60__CNGroupIdentityHeaderViewController_titleLabelWrappedFont__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  if (!v2)
  {
    +[CNUIFontRepository groupHeaderWrappedTitleFont](CNUIFontRepository, "groupHeaderWrappedTitleFont");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1080);
    *(_QWORD *)(v4 + 1080) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  }
  return v2;
}

id __53__CNGroupIdentityHeaderViewController_titleLabelFont__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1072);
  if (!v2)
  {
    +[CNUIFontRepository groupHeaderTitleFont](CNUIFontRepository, "groupHeaderTitleFont");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1072);
    *(_QWORD *)(v4 + 1072) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1072);
  }
  return v2;
}

+ (id)log
{
  if (log_cn_once_token_1 != -1)
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_5306);
  return (id)log_cn_once_object_1;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_2 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_2, &__block_literal_global_17);
  return (id)descriptorForRequiredKeys_cn_once_object_2;
}

void __64__CNGroupIdentityHeaderViewController_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  +[CNGroupAvatarViewController descriptorForRequiredKeys](CNGroupAvatarViewController, "descriptorForRequiredKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNGroupIdentityInlineActionsViewController descriptorForRequiredKeys](CNGroupIdentityInlineActionsViewController, "descriptorForRequiredKeys", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNGroupIdentityHeaderViewController descriptorForRequiredKeys]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)descriptorForRequiredKeys_cn_once_object_2;
  descriptorForRequiredKeys_cn_once_object_2 = v6;

}

void __42__CNGroupIdentityHeaderViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNGroupIdentityHeaderViewController");
  v1 = (void *)log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;

}

@end
