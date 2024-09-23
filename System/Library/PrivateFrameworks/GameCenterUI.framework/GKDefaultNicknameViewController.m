@implementation GKDefaultNicknameViewController

- (void)viewDidLoad
{
  GKNicknameController *v3;
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
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  objc_super v83;

  v83.receiver = self;
  v83.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController viewDidLoad](&v83, sel_viewDidLoad);
  v3 = objc_alloc_init(GKNicknameController);
  -[GKDefaultNicknameViewController setNicknameController:](self, "setNicknameController:", v3);

  -[GKDefaultNicknameViewController activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActivityIndicator:", v4);

  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNickname:", v6);

  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldUseSuggestedNicknameOnDefaultNickname:", 1);

  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShouldShakeTextFieldOnError:", 1);

  objc_msgSend(MEMORY[0x1E0D253B8], "_gkReachabilityForInternetConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController setReachability:](self, "setReachability:", v11);

  -[GKDefaultNicknameViewController reachability](self, "reachability");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_gkStartNotifier");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_reachabilityDidChange_, CFSTR("GKNetworkReachabilityChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController setContinueButton:](self, "setContinueButton:", v14);

  -[GKDefaultNicknameViewController continueButton](self, "continueButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIgnoresInvertColors:", 1);

  -[GKDefaultNicknameViewController continueButton](self, "continueButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_continuePressed_, 0x2000);

  -[GKDefaultNicknameViewController continueButton](self, "continueButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  -[GKDefaultNicknameViewController buttonContainer](self, "buttonContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController continueButton](self, "continueButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v20 = (void *)MEMORY[0x1E0CB3718];
  -[GKDefaultNicknameViewController continueButton](self, "continueButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController buttonContainer](self, "buttonContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v21, v22);

  -[GKDefaultNicknameViewController addEditAvatarContainerView](self, "addEditAvatarContainerView");
  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AE8], 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController mainTitle](self, "mainTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v23);

  GKGameCenterUIFrameworkBundle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController mainTitle](self, "mainTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v26);

  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCornerRadius:", 12.0);

  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setMasksToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v32);

  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBorderWidth:", 0.75);

  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setNonEditingLinebreakMode:", 0);

  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activityIndicatorColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController activityIndicator](self, "activityIndicator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setColor:", v39);

  -[GKDefaultNicknameViewController bubbleImageView](self, "bubbleImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAccessibilityIgnoresInvertColors:", 1);

  -[GKDefaultNicknameViewController continueButton](self, "continueButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTitle:forState:", v44, 0);

  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  GKGameCenterUIFrameworkBundle();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setText:", v47);

  v48 = (void *)MEMORY[0x1E0DC1350];
  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "font");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "fontDescriptor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "fontDescriptorWithSymbolicTraits:", 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "font");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "pointSize");
  objc_msgSend(v48, "fontWithDescriptor:size:", v52);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "setFont:", v55);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setBackgroundColor:", v56);

  objc_msgSend(v45, "sizeToFit");
  objc_msgSend(v45, "frame");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  objc_msgSend(v45, "setTextAlignment:", 1);
  v65 = v62 + 30.0;
  objc_msgSend(v45, "setFrame:", v58, v60, v65, v64);
  objc_msgSend(v45, "widthAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToConstant:", v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setLeftViewMode:", 3);

  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setLeftView:", v45);

  -[GKDefaultNicknameViewController setupNavigationBar](self, "setupNavigationBar");
  -[GKDefaultNicknameViewController updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "alias");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setText:", v71);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setTextColor:", v73);

  -[GKDefaultNicknameViewController updateNicknameEditingSection](self, "updateNicknameEditingSection");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController message](self, "message");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setFont:", v75);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController message](self, "message");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setTextColor:", v77);

  -[GKDefaultNicknameViewController isAvatarEditingSupported](self, "isAvatarEditingSupported");
  GKGameCenterUIFrameworkBundle();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController message](self, "message");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setText:", v80);

  -[GKDefaultNicknameViewController message](self, "message");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setLineSpacing:", 13);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  NSString *v16;
  _BOOL4 IsAccessibilityCategory;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _BOOL8 v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _BOOL8 v50;
  void *v51;
  void *v52;
  uint64_t v53;
  double v54;
  void *v55;
  objc_super v56;

  -[GKDefaultNicknameViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[GKDefaultNicknameViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  -[GKDefaultNicknameViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "verticalSizeClass");

  if (v10 == 1)
  {
    -[GKDefaultNicknameViewController message](self, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 4);

    -[GKDefaultNicknameViewController mainTitle](self, "mainTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", 4);

    if (v5 > 350.0)
      v13 = 135.0;
    else
      v13 = 100.0;
    -[GKDefaultNicknameViewController avatarContainerLandscapeHeight](self, "avatarContainerLandscapeHeight");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", v13);
  }
  else
  {
    -[GKDefaultNicknameViewController traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredContentSizeCategory");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v16);

    -[GKDefaultNicknameViewController message](self, "message");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (IsAccessibilityCategory)
    {
      objc_msgSend(v18, "setTextAlignment:", 4);

      -[GKDefaultNicknameViewController mainTitle](self, "mainTitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;
      v21 = 4;
    }
    else
    {
      objc_msgSend(v18, "setTextAlignment:", 1);

      -[GKDefaultNicknameViewController mainTitle](self, "mainTitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;
      v21 = 1;
    }
    objc_msgSend(v20, "setTextAlignment:", v21);
  }

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  if (v23 == 1)
  {
    -[GKDefaultNicknameViewController mainStackViewLeadingConstraint](self, "mainStackViewLeadingConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setConstant:", 88.0);

    -[GKDefaultNicknameViewController mainStackView](self, "mainStackView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSpacing:", 65.0);
  }
  else
  {
    -[GKDefaultNicknameViewController traitCollection](self, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "preferredContentSizeCategory");
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    v28 = UIContentSizeCategoryIsAccessibilityCategory(v27);

    if (v28)
    {
      -[GKDefaultNicknameViewController mainStackView](self, "mainStackView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = 56.0;
    }
    else
    {
      -[GKDefaultNicknameViewController traitCollection](self, "traitCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "verticalSizeClass");

      if (v33 == 1)
      {
        -[GKDefaultNicknameViewController mainStackView](self, "mainStackView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        v31 = 20.0;
      }
      else
      {
        if (v5 > 667.0)
          v34 = 56.0;
        else
          v34 = 30.0;
        -[GKDefaultNicknameViewController mainStackView](self, "mainStackView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        v31 = v34;
      }
    }
    objc_msgSend(v29, "setSpacing:", v31);

    -[GKDefaultNicknameViewController traitCollection](self, "traitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "verticalSizeClass");

    if (v36 == 1)
    {
      if (v8 < 667.0)
        v37 = 30.0;
      else
        v37 = 100.0;
      -[GKDefaultNicknameViewController mainStackViewLeadingConstraint](self, "mainStackViewLeadingConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v38;
      v39 = v37;
    }
    else
    {
      -[GKDefaultNicknameViewController mainStackViewLeadingConstraint](self, "mainStackViewLeadingConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v38;
      v39 = 30.0;
    }
    objc_msgSend(v38, "setConstant:", v39);
  }

  -[GKDefaultNicknameViewController mainStackViewLeadingConstraint](self, "mainStackViewLeadingConstraint");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constant");
  v42 = v41;
  -[GKDefaultNicknameViewController mainStackViewTrailingConstraint](self, "mainStackViewTrailingConstraint");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setConstant:", v42);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "userInterfaceIdiom");

  v46 = v45 != 1;
  -[GKDefaultNicknameViewController continueButtonEqualMainStackViewWidthConstraint](self, "continueButtonEqualMainStackViewWidthConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", v46);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "userInterfaceIdiom");

  v50 = v49 == 1;
  -[GKDefaultNicknameViewController continueButtonWidthConstraint](self, "continueButtonWidthConstraint");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", v50);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "userInterfaceIdiom");

  if (v53 == 1)
    v54 = 60.0;
  else
    v54 = 16.0;
  -[GKDefaultNicknameViewController continueButtonBottomConstraint](self, "continueButtonBottomConstraint");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setConstant:", v54);

  v56.receiver = self;
  v56.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController viewWillLayoutSubviews](&v56, sel_viewWillLayoutSubviews);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopObservingKeyboardEvents");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startObservingKeyboardEvents");

  -[GKDefaultNicknameViewController continueButton](self, "continueButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

}

- (void)updateLeftBarButtonWithTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[GKDefaultNicknameViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:animated:", 0, 1);

  if (objc_msgSend(v7, "length"))
  {
    -[GKDefaultNicknameViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, 2, self, sel_cancelPressed_);
    objc_msgSend(v5, "setLeftBarButtonItem:animated:", v6, 1);

  }
}

- (void)setupNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[GKDefaultNicknameViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNavigationBarHidden:", 0);

  -[GKDefaultNicknameViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeNavigationBarBackgroundTranslucent");

  -[GKDefaultNicknameViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarTintColor:", v7);

  v8 = (void *)objc_opt_new();
  -[GKDefaultNicknameViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowImage:", v8);

  -[GKDefaultNicknameViewController navigationItem](self, "navigationItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidesBackButton:", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[GKDefaultNicknameViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactivePopGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[GKDefaultNicknameViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactivePopGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.25);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v9);

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  -[GKDefaultNicknameViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)updateUIBasedOnTraitCollection
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  id v12;

  -[GKDefaultNicknameViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v6, "setLeftViewMode:", 0);

    -[GKDefaultNicknameViewController nickname](self, "nickname");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  else
  {
    objc_msgSend(v6, "setLeftViewMode:", 3);

    -[GKDefaultNicknameViewController nickname](self, "nickname");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 4;
  }
  objc_msgSend(v8, "setTextAlignment:", v10);

  v11 = (double)-[GKDefaultNicknameViewController getTopMargin](self, "getTopMargin");
  -[GKDefaultNicknameViewController topMargin](self, "topMargin");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v11);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKDefaultNicknameViewController;
  -[GKDefaultNicknameViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, a3);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.25);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderColor:", v6);

  -[GKDefaultNicknameViewController updateUIBasedOnTraitCollection](self, "updateUIBasedOnTraitCollection");
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  objc_msgSend(a3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[GKDefaultNicknameViewController mainTitle](self, "mainTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v21.origin.x = v13;
  v21.origin.y = v14;
  v21.size.width = v15;
  v21.size.height = v16;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  v17 = CGRectIntersectsRect(v20, v21);

  if (v17)
  {
    -[GKDefaultNicknameViewController setTitle:](self, "setTitle:", 0);
  }
  else
  {
    -[GKDefaultNicknameViewController mainTitle](self, "mainTitle");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDefaultNicknameViewController setTitle:](self, "setTitle:", v18);

  }
}

- (void)reachabilityDidChange:(id)a3
{
  void *v4;
  char v5;

  -[GKDefaultNicknameViewController nickname](self, "nickname", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if ((v5 & 1) == 0)
    -[GKDefaultNicknameViewController updateNicknameEditingSection](self, "updateNicknameEditingSection");
}

- (void)updateNicknameEditingSection
{
  void *v3;
  int v4;
  void *v5;
  int v6;
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
  id v17;

  -[GKDefaultNicknameViewController reachability](self, "reachability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_gkCurrentReachabilityStatus");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isProfileModificationRestricted");

    -[GKDefaultNicknameViewController nickname](self, "nickname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    if (v6)
    {
      objc_msgSend(v7, "setEnabled:", 0);

      GKGameCenterUIFrameworkBundle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDefaultNicknameViewController message](self, "message");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

    }
    else
    {
      objc_msgSend(v7, "setEnabled:", 1);
    }
  }
  else
  {
    -[GKDefaultNicknameViewController nickname](self, "nickname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    v11 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDefaultNicknameViewController message](self, "message");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

  }
}

- (void)fadeNonEssentialViews:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  BOOL v11;

  v5 = !a3;
  -[GKDefaultNicknameViewController continueButton](self, "continueButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v5);

  -[GKDefaultNicknameViewController editAvatarView](self, "editAvatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", v5);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 != 1)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__GKDefaultNicknameViewController_fadeNonEssentialViews___block_invoke;
    v10[3] = &unk_1E59C5278;
    v11 = a3;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v10, &__block_literal_global_21, 0.4);
  }
}

void __57__GKDefaultNicknameViewController_fadeNonEssentialViews___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  id v16;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bubbleImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v2)
  {
    LODWORD(v5) = 0;
    objc_msgSend(v4, "setOpacity:", v5);

    objc_msgSend(*(id *)(a1 + 32), "mainTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 0;
    objc_msgSend(v8, "setOpacity:", v9);

    objc_msgSend(*(id *)(a1 + 32), "continueButton");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    LODWORD(v12) = 0;
  }
  else
  {
    LODWORD(v5) = 1.0;
    objc_msgSend(v4, "setOpacity:", v5);

    objc_msgSend(*(id *)(a1 + 32), "mainTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1.0;
    objc_msgSend(v14, "setOpacity:", v15);

    objc_msgSend(*(id *)(a1 + 32), "continueButton");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    LODWORD(v12) = 1.0;
  }
  objc_msgSend(v10, "setOpacity:", v12);

}

- (void)cancelPressed:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[GKDefaultNicknameViewController nickname](self, "nickname", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alias");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDefaultNicknameViewController nickname](self, "nickname");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[GKDefaultNicknameViewController nickname](self, "nickname");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endEditing:", 1);
  }
  else
  {
    +[GKOnboardingController shared](GKOnboardingController, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      return;
    +[GKOnboardingController shared](GKOnboardingController, "shared");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "onboardingFlowFinishedWithAction:", 1);

  }
}

- (void)keyboardWillShow:(id)a3
{
  id v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v4 = a3;
  v5 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__GKDefaultNicknameViewController_keyboardWillShow___block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  -[GKDefaultNicknameViewController fadeNonEssentialViews:](self, "fadeNonEssentialViews:", 1);
  -[GKDefaultNicknameViewController animateNicknameTextFieldIntoView:](self, "animateNicknameTextFieldIntoView:", v4);

}

void __52__GKDefaultNicknameViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  GKGameCenterUIFrameworkBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateLeftBarButtonWithTitle:", v2);

}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[GKDefaultNicknameViewController updateLeftBarButtonWithTitle:](self, "updateLeftBarButtonWithTitle:", 0);
  -[GKDefaultNicknameViewController fadeNonEssentialViews:](self, "fadeNonEssentialViews:", 0);
  -[GKDefaultNicknameViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__GKDefaultNicknameViewController_keyboardWillHide___block_invoke;
  v5[3] = &unk_1E59C4148;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.4);
}

void __52__GKDefaultNicknameViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  v2 = (double)objc_msgSend(*(id *)(a1 + 32), "getTopMargin");
  objc_msgSend(*(id *)(a1 + 32), "topMargin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (BOOL)nicknameShouldBeginEditing
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProfileModificationRestricted");

  if (v4)
  {
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)-[GKDefaultNicknameViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v6, v8, v10, 0);

  }
  return v4 ^ 1;
}

- (void)nicknameDidBecomeFirstResponder
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D25140]);

}

- (void)nicknameDidResignFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[GKDefaultNicknameViewController updateNicknameEditingSection](self, "updateNicknameEditingSection");
  -[GKDefaultNicknameViewController nickname](self, "nickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alias");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D25138]);

  }
}

- (void)nicknameUpdateRequestCompletedWithStatus:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    -[GKDefaultNicknameViewController message](self, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v6);

  }
  else if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D25148]);

    -[GKDefaultNicknameViewController updateLeftBarButtonWithTitle:](self, "updateLeftBarButtonWithTitle:", 0);
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__GKDefaultNicknameViewController_nicknameUpdateRequestCompletedWithStatus_error___block_invoke;
    v12[3] = &unk_1E59C45D8;
    v12[4] = self;
    objc_msgSend(v11, "loadProfileWithCompletionHandler:", v12);

  }
}

uint64_t __82__GKDefaultNicknameViewController_nicknameUpdateRequestCompletedWithStatus_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "refreshAvatarImage");
}

- (void)nicknameTextDidChangeWithMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[GKDefaultNicknameViewController message](self, "message");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v7);
  }
  else
  {
    -[GKDefaultNicknameViewController isAvatarEditingSupported](self, "isAvatarEditingSupported");
    GKGameCenterUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDefaultNicknameViewController message](self, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

  }
}

- (void)nicknameUpdateAvatarImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = (void *)MEMORY[0x1E0D25330];
  v5 = a3;
  objc_msgSend(v4, "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlias:", v5);

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__GKDefaultNicknameViewController_nicknameUpdateAvatarImage___block_invoke;
  v11[3] = &unk_1E59C4708;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "deleteMonogramsWithHandler:", v11);

}

void __61__GKDefaultNicknameViewController_nicknameUpdateAvatarImage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "editAvatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerAvatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__GKDefaultNicknameViewController_nicknameUpdateAvatarImage___block_invoke_2;
  v4[3] = &unk_1E59C4148;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "refreshImageWithCompletionHandler:", v4);

}

void __61__GKDefaultNicknameViewController_nicknameUpdateAvatarImage___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlias:", v1);

}

- (int64_t)getTopMargin
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    return 0;
  -[GKDefaultNicknameViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "verticalSizeClass") == 1)
    v5 = 0;
  else
    v5 = 14;

  return v5;
}

- (void)animateNicknameTextFieldIntoView:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  NSString *v46;
  _BOOL4 IsAccessibilityCategory;
  double v48;
  void *v49;
  uint64_t v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  _QWORD v59[7];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  -[GKDefaultNicknameViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = (v10 - v12) * 0.5;

  -[GKDefaultNicknameViewController message](self, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController message](self, "message");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  -[GKDefaultNicknameViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertPoint:toView:", v20, v17, v19);
  v22 = v21;

  -[GKDefaultNicknameViewController message](self, "message");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v13 + v22 + v24;
  -[GKDefaultNicknameViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "safeAreaInsets");
  v28 = v25 + v27;

  -[GKDefaultNicknameViewController avatarContainer](self, "avatarContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultNicknameViewController avatarContainer](self, "avatarContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31;
  v34 = v33;
  -[GKDefaultNicknameViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "convertPoint:toView:", v35, v32, v34);
  v37 = v36;

  -[GKDefaultNicknameViewController avatarContainer](self, "avatarContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  v40 = v13 + v37 + v39;
  -[GKDefaultNicknameViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "safeAreaInsets");
  v43 = v40 + v42;

  if (v28 <= v43)
    v44 = v43;
  else
    v44 = v28;
  -[GKDefaultNicknameViewController traitCollection](self, "traitCollection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "preferredContentSizeCategory");
  v46 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v46);

  if (IsAccessibilityCategory)
    v48 = v43 + 100.0;
  else
    v48 = v44;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "userInterfaceIdiom");

  if (v50 == 1)
    v51 = 60.0;
  else
    v51 = 10.0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  v54 = v53;

  -[GKDefaultNicknameViewController topMargin](self, "topMargin");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constant");
  v57 = v56;
  v58 = (double)-[GKDefaultNicknameViewController getTopMargin](self, "getTopMargin");

  if (v57 == v58 && v54 - v7 < v48 + v51)
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __68__GKDefaultNicknameViewController_animateNicknameTextFieldIntoView___block_invoke;
    v59[3] = &unk_1E59C5F50;
    *(double *)&v59[5] = v54 - v7;
    *(double *)&v59[6] = v48 + v51;
    v59[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v59, 0.4);
  }

}

void __68__GKDefaultNicknameViewController_animateNicknameTextFieldIntoView___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  v2 = *(double *)(a1 + 40) - *(double *)(a1 + 48);
  v3 = v2 + (double)objc_msgSend(*(id *)(a1 + 32), "getTopMargin");
  objc_msgSend(*(id *)(a1 + 32), "topMargin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", v3);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)addEditAvatarContainerView
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
  id v22;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "loadNibNamed:owner:options:", CFSTR("GKAvatarContainerView"), self, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "prepareForDefaultNicknameViewController");
  -[GKDefaultNicknameViewController avatarContainer](self, "avatarContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  -[GKDefaultNicknameViewController avatarContainer](self, "avatarContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[GKDefaultNicknameViewController avatarContainer](self, "avatarContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[GKDefaultNicknameViewController avatarContainer](self, "avatarContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[GKDefaultNicknameViewController avatarContainer](self, "avatarContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[GKDefaultNicknameViewController setEditAvatarView:](self, "setEditAvatarView:", v4);
}

- (void)avatarView:(id)a3 didSelectImageWithEditingEnabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D253B0], "shared", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isProfileModificationRestricted");

  if (v7)
  {
    GKGameCenterUIFrameworkBundle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)-[GKDefaultNicknameViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v8, v10, v12, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D250E8]);

    if (v4)
      -[GKDefaultNicknameViewController presentAvatarPicker](self, "presentAvatarPicker");
    else
      -[GKDefaultNicknameViewController presentDeleteAvatarImageAlert](self, "presentDeleteAvatarImageAlert");
  }
}

- (void)presentAvatarPicker
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  GKDefaultNicknameViewController *v11;
  _QWORD v12[4];
  id v13;

  v3 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Onboarding UI/GKDefaultNicknameViewController.m", 675, "-[GKDefaultNicknameViewController presentAvatarPicker]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchGroupWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__GKDefaultNicknameViewController_presentAvatarPicker__block_invoke;
  v12[3] = &unk_1E59C4A28;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v7, "perform:", v12);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __54__GKDefaultNicknameViewController_presentAvatarPicker__block_invoke_3;
  v9[3] = &unk_1E59C4708;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(v8, "notifyOnMainQueueWithBlock:", v9);

}

void __54__GKDefaultNicknameViewController_presentAvatarPicker__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__GKDefaultNicknameViewController_presentAvatarPicker__block_invoke_2;
  v6[3] = &unk_1E59C5F78;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadPlayerContactForAvatarControllerWithImageSize:completion:", 65537, v6);

}

uint64_t __54__GKDefaultNicknameViewController_presentAvatarPicker__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__GKDefaultNicknameViewController_presentAvatarPicker__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0C97520];
  objc_msgSend(*(id *)(a1 + 32), "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerForGameCenterWithContact:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 40));
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAssignActionTitleOverride:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
    objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)photoPickerDidCancel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D253C0];
  v4 = a3;
  objc_msgSend(v3, "reporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D250E0]);

  objc_msgSend(v4, "presentingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Onboarding UI/GKDefaultNicknameViewController.m", 705, "-[GKDefaultNicknameViewController photoPicker:didUpdatePhotoForContact:withContactImage:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchGroupWithName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__GKDefaultNicknameViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke;
  v20[3] = &unk_1E59C41C0;
  v21 = v10;
  v22 = v9;
  v15 = v9;
  v16 = v10;
  objc_msgSend(v13, "perform:", v20);
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __89__GKDefaultNicknameViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke_85;
  v18[3] = &unk_1E59C4708;
  v18[4] = self;
  v19 = v8;
  v17 = v8;
  objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v18);

}

void __89__GKDefaultNicknameViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__GKDefaultNicknameViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke_2;
  v8[3] = &unk_1E59C4CB8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "setPhotoFromCNContactImage:pendingContact:withCompletionHandler:", v6, v5, v8);

}

void __89__GKDefaultNicknameViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E0D25460])
      v4 = (id)GKOSLoggers();
    v5 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __89__GKDefaultNicknameViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke_2_cold_1((uint64_t)v3, v5);
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D25128]);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __89__GKDefaultNicknameViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke_85(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearInMemoryCachedAvatars");

  objc_msgSend(*(id *)(a1 + 32), "refreshAvatarImage");
  objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D250F0]);

}

- (void)presentDeleteAvatarImageAlert
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__GKDefaultNicknameViewController_presentDeleteAvatarImageAlert__block_invoke;
  v5[3] = &unk_1E59C4148;
  v5[4] = self;
  objc_msgSend(v3, "deleteAvatarAlertControllerWithHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDefaultNicknameViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

void __64__GKDefaultNicknameViewController_presentDeleteAvatarImageAlert__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__GKDefaultNicknameViewController_presentDeleteAvatarImageAlert__block_invoke_2;
  v3[3] = &unk_1E59C45D8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "loadProfileWithCompletionHandler:", v3);

}

uint64_t __64__GKDefaultNicknameViewController_presentDeleteAvatarImageAlert__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D250D8]);

  return objc_msgSend(*(id *)(a1 + 32), "refreshAvatarImage");
}

- (void)refreshAvatarImage
{
  id v2;

  -[GKDefaultNicknameViewController editAvatarView](self, "editAvatarView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshViewForLocalPlayer");

}

- (void)continuePressed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD aBlock[5];

  v4 = (void *)MEMORY[0x1E0D25238];
  v5 = a3;
  objc_msgSend(v4, "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("continue"), CFSTR("button"), CFSTR("profileCreation"), CFSTR("onboarding"));

  -[GKDefaultNicknameViewController setTitle:](self, "setTitle:", 0);
  objc_msgSend(v5, "setEnabled:", 0);

  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__GKDefaultNicknameViewController_continuePressed___block_invoke;
  aBlock[3] = &unk_1E59C4148;
  aBlock[4] = self;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "nicknameWasEdited") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "nicknameChangeWasCommitted");

  if ((v11 & 1) != 0)
  {
LABEL_5:
    v8[2](v8);
    goto LABEL_6;
  }
  -[GKDefaultNicknameViewController nicknameController](self, "nicknameController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __51__GKDefaultNicknameViewController_continuePressed___block_invoke_2;
  v13[3] = &unk_1E59C4CB8;
  v14 = v8;
  objc_msgSend(v12, "commitNicknameChanges:", v13);

LABEL_6:
}

void __51__GKDefaultNicknameViewController_continuePressed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D252A0], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "platformBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastPersonalizationVersionDisplayedForSignedInPlayer:", v5);

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v6, "shouldShowProfilePrivacyScreen");

  if ((_DWORD)v3)
  {
    +[GKOnboardingController shared](GKOnboardingController, "shared");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentProfilePrivacyScreen:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldShowContactsIntegrationConsentScreen");

    if (v9)
    {
      +[GKOnboardingController shared](GKOnboardingController, "shared");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentContactsIntegrationConsentScreen:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D25330], "local");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "shouldShowProfileCreatedScreen");

      +[GKOnboardingController shared](GKOnboardingController, "shared");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "navigationController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "presentProfileCreatedScreen:", v7);
      }
      else
      {
        objc_msgSend(v12, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "onboardingFlowFinishedWithAction:", 2);
      }
    }
  }

}

uint64_t __51__GKDefaultNicknameViewController_continuePressed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (GKAvatarContainerView)editAvatarView
{
  return self->_editAvatarView;
}

- (void)setEditAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_editAvatarView, a3);
}

- (UIView)avatarContainer
{
  return self->_avatarContainer;
}

- (void)setAvatarContainer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContainer, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UIStackView)mainStackView
{
  return self->_mainStackView;
}

- (void)setMainStackView:(id)a3
{
  objc_storeStrong((id *)&self->_mainStackView, a3);
}

- (UITextField)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (UIView)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainer, a3);
}

- (UIImageView)bubbleImageView
{
  return self->_bubbleImageView;
}

- (void)setBubbleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleImageView, a3);
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (NSLayoutConstraint)mainStackViewTrailingConstraint
{
  return self->_mainStackViewTrailingConstraint;
}

- (void)setMainStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_mainStackViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)mainStackViewLeadingConstraint
{
  return self->_mainStackViewLeadingConstraint;
}

- (void)setMainStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_mainStackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)continueButtonEqualMainStackViewWidthConstraint
{
  return self->_continueButtonEqualMainStackViewWidthConstraint;
}

- (void)setContinueButtonEqualMainStackViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonEqualMainStackViewWidthConstraint, a3);
}

- (NSLayoutConstraint)continueButtonWidthConstraint
{
  return self->_continueButtonWidthConstraint;
}

- (void)setContinueButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)continueButtonBottomConstraint
{
  return self->_continueButtonBottomConstraint;
}

- (void)setContinueButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonBottomConstraint, a3);
}

- (NSLayoutConstraint)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(id)a3
{
  objc_storeStrong((id *)&self->_topMargin, a3);
}

- (UIStackView)middleStackView
{
  return self->_middleStackView;
}

- (void)setMiddleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_middleStackView, a3);
}

- (UILabel)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UILabel)mainTitle
{
  return self->_mainTitle;
}

- (void)setMainTitle:(id)a3
{
  objc_storeStrong((id *)&self->_mainTitle, a3);
}

- (NSLayoutConstraint)avatarContainerLandscapeHeight
{
  return self->_avatarContainerLandscapeHeight;
}

- (void)setAvatarContainerLandscapeHeight:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContainerLandscapeHeight, a3);
}

- (GKReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (GKNicknameController)nicknameController
{
  return self->_nicknameController;
}

- (void)setNicknameController:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknameController, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->_avatarContainerLandscapeHeight, 0);
  objc_storeStrong((id *)&self->_mainTitle, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_middleStackView, 0);
  objc_storeStrong((id *)&self->_topMargin, 0);
  objc_storeStrong((id *)&self->_continueButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_continueButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_continueButtonEqualMainStackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_mainStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_mainStackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_bubbleImageView, 0);
  objc_storeStrong((id *)&self->_buttonContainer, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_avatarContainer, 0);
  objc_storeStrong((id *)&self->_editAvatarView, 0);
}

void __89__GKDefaultNicknameViewController_photoPicker_didUpdatePhotoForContact_withContactImage___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "Error setting avatar image from avatar picker %@", (uint8_t *)&v2, 0xCu);
}

@end
