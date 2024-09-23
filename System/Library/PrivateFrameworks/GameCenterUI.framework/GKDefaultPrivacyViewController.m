@implementation GKDefaultPrivacyViewController

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  objc_super v100;

  v100.receiver = self;
  v100.super_class = (Class)GKDefaultPrivacyViewController;
  -[GKDefaultPrivacyViewController viewDidLoad](&v100, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isUnderage"))
    v4 = 2;
  else
    v4 = 0xFFFFFFFFLL;
  -[GKDefaultPrivacyViewController setProfilePrivacyVisibility:](self, "setProfilePrivacyVisibility:", v4);

  -[GKDefaultPrivacyViewController setNumberOfClicksOnPrivacySelection:](self, "setNumberOfClicksOnPrivacySelection:", 0);
  v5 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B10], 2);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AE8], 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController mainTitle](self, "mainTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController setNextButton:](self, "setNextButton:", v10);

  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIgnoresInvertColors:", 1);

  -[GKDefaultPrivacyViewController buttonContainer](self, "buttonContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  v14 = (void *)MEMORY[0x1E0CB3718];
  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController buttonContainer](self, "buttonContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v15, v16);

  -[GKDefaultPrivacyViewController publicRadioButton](self, "publicRadioButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIgnoresInvertColors:", 1);

  -[GKDefaultPrivacyViewController friendsOnlyRadioButton](self, "friendsOnlyRadioButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIgnoresInvertColors:", 1);

  -[GKDefaultPrivacyViewController meOnlyRadioButton](self, "meOnlyRadioButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIgnoresInvertColors:", 1);

  -[GKDefaultPrivacyViewController publicTitle](self, "publicTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v6);

  GKGameCenterUIFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController publicTitle](self, "publicTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v22);

  -[GKDefaultPrivacyViewController friendsOnlyTitle](self, "friendsOnlyTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v6);

  GKGameCenterUIFrameworkBundle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController friendsOnlyTitle](self, "friendsOnlyTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v26);

  -[GKDefaultPrivacyViewController meOnlyTitle](self, "meOnlyTitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = (void *)v6;
  objc_msgSend(v28, "setFont:", v6);

  GKGameCenterUIFrameworkBundle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController meOnlyTitle](self, "meOnlyTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v30);

  GKGameCenterUIFrameworkBundle();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController mainTitle](self, "mainTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setText:", v33);

  GKGameCenterUIFrameworkBundle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController subTitle](self, "subTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setText:", v36);

  -[GKDefaultPrivacyViewController publicSubTitle](self, "publicSubTitle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController publicSubTitle](self, "publicSubTitle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTextColor:", v39);

  GKGameCenterUIFrameworkBundle();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController publicSubTitle](self, "publicSubTitle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setText:", v42);

  -[GKDefaultPrivacyViewController friendsOnlySubtitle](self, "friendsOnlySubtitle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController friendsOnlySubtitle](self, "friendsOnlySubtitle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setTextColor:", v45);

  GKGameCenterUIFrameworkBundle();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController friendsOnlySubtitle](self, "friendsOnlySubtitle");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setText:", v48);

  -[GKDefaultPrivacyViewController meOnlySubtitle](self, "meOnlySubtitle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController meOnlySubtitle](self, "meOnlySubtitle");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setTextColor:", v51);

  GKGameCenterUIFrameworkBundle();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController meOnlySubtitle](self, "meOnlySubtitle");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setText:", v54);

  v56 = (void *)MEMORY[0x1E0CB3940];
  -[GKDefaultPrivacyViewController publicTitle](self, "publicTitle");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "text");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController publicSubTitle](self, "publicSubTitle");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "text");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stringWithFormat:", CFSTR("%@, %@"), v58, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = (void *)MEMORY[0x1E0CB3940];
  -[GKDefaultPrivacyViewController friendsOnlyTitle](self, "friendsOnlyTitle");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "text");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController friendsOnlySubtitle](self, "friendsOnlySubtitle");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "text");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "stringWithFormat:", CFSTR("%@, %@"), v64, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = (void *)MEMORY[0x1E0CB3940];
  -[GKDefaultPrivacyViewController meOnlyTitle](self, "meOnlyTitle");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "text");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController meOnlySubtitle](self, "meOnlySubtitle");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "text");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "stringWithFormat:", CFSTR("%@, %@"), v70, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDefaultPrivacyViewController publicContainer](self, "publicContainer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setAccessibilityElementsHidden:", 1);

  -[GKDefaultPrivacyViewController publicContainerButton](self, "publicContainerButton");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setAccessibilityLabel:", v61);

  -[GKDefaultPrivacyViewController friendsOnlyContainer](self, "friendsOnlyContainer");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setAccessibilityElementsHidden:", 1);

  -[GKDefaultPrivacyViewController friendsOnlyContainerButton](self, "friendsOnlyContainerButton");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setAccessibilityLabel:", v67);

  -[GKDefaultPrivacyViewController privateContainer](self, "privateContainer");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setAccessibilityElementsHidden:", 1);

  -[GKDefaultPrivacyViewController meOnlyContainerButton](self, "meOnlyContainerButton");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setAccessibilityLabel:", v73);

  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addTarget:action:forControlEvents:", self, sel_nextPressed_, 0x2000);

  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setTitle:forState:", v83, 0);

  -[GKDefaultPrivacyViewController updateUI](self, "updateUI");
  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setNavigationBarHidden:", 0);

  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "navigationBar");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)objc_opt_new();
  objc_msgSend(v86, "setBackgroundImage:forBarMetrics:", v87, 0);

  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "navigationBar");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setBarTintColor:", v90);

  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "navigationBar");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setTranslucent:", 1);

  v93 = (void *)objc_opt_new();
  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "navigationBar");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setShadowImage:", v93);

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v94) = objc_msgSend(v96, "isUnderage");

  if ((_DWORD)v94)
  {
    -[GKDefaultPrivacyViewController publicContainer](self, "publicContainer");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setHidden:", 1);

    -[GKDefaultPrivacyViewController publicDivider](self, "publicDivider");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setHidden:", 1);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKDefaultPrivacyViewController;
  -[GKDefaultPrivacyViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= 2)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
    GKGameCenterUIFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v9, 2, self, sel_notNowButtonPressed_);
    -[GKDefaultPrivacyViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDefaultPrivacyViewController;
  -[GKDefaultPrivacyViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[GKDefaultPrivacyViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D25180]);

  }
}

- (void)notNowButtonPressed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[GKOnboardingController shared](GKOnboardingController, "shared", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[GKOnboardingController shared](GKOnboardingController, "shared");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "onboardingFlowFinishedWithAction:", 6);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  objc_super v38;

  -[GKDefaultPrivacyViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 1)
  {
    -[GKDefaultPrivacyViewController mainStackViewLeadingConstraint](self, "mainStackViewLeadingConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 88.0;
LABEL_15:
    objc_msgSend(v8, "setConstant:", v10);
    goto LABEL_16;
  }
  -[GKDefaultPrivacyViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "verticalSizeClass");

  if (v12 != 1)
  {
    -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "navigationBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isHidden"))
      v20 = 60.0;
    else
      v20 = 0.0;
    -[GKDefaultPrivacyViewController topMargin](self, "topMargin");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setConstant:", v20);

    -[GKDefaultPrivacyViewController mainStackViewLeadingConstraint](self, "mainStackViewLeadingConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 30.0;
    goto LABEL_15;
  }
  if (v5 < 667.0)
    v13 = 30.0;
  else
    v13 = 100.0;
  -[GKDefaultPrivacyViewController mainStackViewLeadingConstraint](self, "mainStackViewLeadingConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v13);

  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isHidden"))
    v16 = 20.0;
  else
    v16 = 0.0;
  -[GKDefaultPrivacyViewController topMargin](self, "topMargin");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", v16);

LABEL_16:
  -[GKDefaultPrivacyViewController mainStackViewLeadingConstraint](self, "mainStackViewLeadingConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constant");
  v24 = v23;
  -[GKDefaultPrivacyViewController mainStackViewTrailingConstraint](self, "mainStackViewTrailingConstraint");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setConstant:", v24);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "userInterfaceIdiom");

  v28 = v27 != 1;
  -[GKDefaultPrivacyViewController continueButtonEqualMainTitleWidthConstraint](self, "continueButtonEqualMainTitleWidthConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", v28);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "userInterfaceIdiom");

  v32 = v31 == 1;
  -[GKDefaultPrivacyViewController continueButtonWidthConstraint](self, "continueButtonWidthConstraint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", v32);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceIdiom");

  if (v35 == 1)
    v36 = 60.0;
  else
    v36 = 16.0;
  -[GKDefaultPrivacyViewController continueButtonBottomConstraint](self, "continueButtonBottomConstraint");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setConstant:", v36);

  v38.receiver = self;
  v38.super_class = (Class)GKDefaultPrivacyViewController;
  -[GKDefaultPrivacyViewController viewWillLayoutSubviews](&v38, sel_viewWillLayoutSubviews);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKDefaultPrivacyViewController;
  -[GKDefaultPrivacyViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");
  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interactivePopGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDefaultPrivacyViewController;
  -[GKDefaultPrivacyViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[GKDefaultPrivacyViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactivePopGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

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
  -[GKDefaultPrivacyViewController mainTitle](self, "mainTitle");
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
    -[GKDefaultPrivacyViewController setTitle:](self, "setTitle:", 0);
  }
  else
  {
    -[GKDefaultPrivacyViewController mainTitle](self, "mainTitle");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDefaultPrivacyViewController setTitle:](self, "setTitle:", v18);

  }
}

- (void)nextPressed:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x1E0D25238], "reporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("continue"), CFSTR("button"), CFSTR("activityVisibility"), CFSTR("onboarding"));

  objc_msgSend(MEMORY[0x1E0D253B8], "_gkReachabilityForInternetConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_gkCurrentReachabilityStatus");

  if (v6)
  {
    -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);

    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "profileServicePrivate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GKDefaultPrivacyViewController profilePrivacyVisibility](self, "profilePrivacyVisibility");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__GKDefaultPrivacyViewController_nextPressed___block_invoke;
    v18[3] = &unk_1E59C45D8;
    v18[4] = self;
    objc_msgSend(v9, "setProfilePrivacy:handler:", v10, v18);

  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)-[GKDefaultPrivacyViewController _gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:](self, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v11, v13, v15, 0);

  }
}

void __46__GKDefaultPrivacyViewController_nextPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E0D25460])
      v4 = (id)GKOSLoggers();
    v5 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __46__GKDefaultPrivacyViewController_nextPressed___block_invoke_cold_1((uint64_t)v3, v5);
    objc_msgSend(*(id *)(a1 + 32), "nextButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 1);

    v7 = *(void **)(a1 + 32);
    GKGameCenterUIFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v7, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v9, v11, v13, &__block_literal_global_8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D252A0], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "platformBuildVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLastProfilePrivacyVersionDisplayedForSignedInPlayer:", v18);

    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v19, "shouldShowContactsIntegrationConsentScreen");

    +[GKOnboardingController shared](GKOnboardingController, "shared");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((_DWORD)v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "presentContactsIntegrationConsentScreen:", v22);
    }
    else
    {
      objc_msgSend(v20, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "onboardingFlowFinishedWithAction:", 7);
    }

  }
}

void __46__GKDefaultPrivacyViewController_nextPressed___block_invoke_79()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  +[GKOnboardingController shared](GKOnboardingController, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    +[GKOnboardingController shared](GKOnboardingController, "shared");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "onboardingFlowFinishedWithAction:", 8);

  }
}

- (void)reportPrivacySelectionClickAnalytics
{
  id v2;

  -[GKDefaultPrivacyViewController setNumberOfClicksOnPrivacySelection:](self, "setNumberOfClicksOnPrivacySelection:", -[GKDefaultPrivacyViewController numberOfClicksOnPrivacySelection](self, "numberOfClicksOnPrivacySelection") + 1);
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D25188]);

}

- (void)button1Pressed:(id)a3
{
  -[GKDefaultPrivacyViewController reportPrivacySelectionClickAnalytics](self, "reportPrivacySelectionClickAnalytics", a3);
  -[GKDefaultPrivacyViewController setProfilePrivacyVisibility:](self, "setProfilePrivacyVisibility:", 0);
  -[GKDefaultPrivacyViewController updateUI](self, "updateUI");
}

- (void)button2Pressed:(id)a3
{
  -[GKDefaultPrivacyViewController reportPrivacySelectionClickAnalytics](self, "reportPrivacySelectionClickAnalytics", a3);
  -[GKDefaultPrivacyViewController setProfilePrivacyVisibility:](self, "setProfilePrivacyVisibility:", 1);
  -[GKDefaultPrivacyViewController updateUI](self, "updateUI");
}

- (void)button3Pressed:(id)a3
{
  -[GKDefaultPrivacyViewController reportPrivacySelectionClickAnalytics](self, "reportPrivacySelectionClickAnalytics", a3);
  -[GKDefaultPrivacyViewController setProfilePrivacyVisibility:](self, "setProfilePrivacyVisibility:", 2);
  -[GKDefaultPrivacyViewController updateUI](self, "updateUI");
}

- (void)updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(void *, void *, void *, _QWORD);
  int v12;
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
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *, void *, uint64_t);
  void *v38;
  id v39;
  id v40;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 7, 23.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 2, 23.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("circle"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.fill"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = __42__GKDefaultPrivacyViewController_updateUI__block_invoke;
  v38 = &unk_1E59C52C0;
  v39 = v8;
  v40 = v6;
  v9 = v6;
  v10 = v8;
  v11 = (void (**)(void *, void *, void *, _QWORD))_Block_copy(&v35);
  v12 = -[GKDefaultPrivacyViewController profilePrivacyVisibility](self, "profilePrivacyVisibility", v35, v36, v37, v38);
  if (v12 == 2)
  {
    -[GKDefaultPrivacyViewController publicRadioButton](self, "publicRadioButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDefaultPrivacyViewController publicContainerButton](self, "publicContainerButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v15, v16, 0);

    -[GKDefaultPrivacyViewController friendsOnlyRadioButton](self, "friendsOnlyRadioButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDefaultPrivacyViewController friendsOnlyContainerButton](self, "friendsOnlyContainerButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v17, v18, 0);

    -[GKDefaultPrivacyViewController meOnlyRadioButton](self, "meOnlyRadioButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDefaultPrivacyViewController meOnlyContainerButton](self, "meOnlyContainerButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v19, v20, 1);
  }
  else
  {
    if (v12 == 1)
    {
      -[GKDefaultPrivacyViewController publicRadioButton](self, "publicRadioButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDefaultPrivacyViewController publicContainerButton](self, "publicContainerButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v21, v22, 0);

      -[GKDefaultPrivacyViewController friendsOnlyRadioButton](self, "friendsOnlyRadioButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDefaultPrivacyViewController friendsOnlyContainerButton](self, "friendsOnlyContainerButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v23, v24, 1);
    }
    else
    {
      if (v12)
      {
        -[GKDefaultPrivacyViewController publicRadioButton](self, "publicRadioButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKDefaultPrivacyViewController publicContainerButton](self, "publicContainerButton");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v13, v14, 0);
      }
      else
      {
        -[GKDefaultPrivacyViewController publicRadioButton](self, "publicRadioButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKDefaultPrivacyViewController publicContainerButton](self, "publicContainerButton");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v13, v14, 1);
      }

      -[GKDefaultPrivacyViewController friendsOnlyRadioButton](self, "friendsOnlyRadioButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDefaultPrivacyViewController friendsOnlyContainerButton](self, "friendsOnlyContainerButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v23, v24, 0);
    }

    -[GKDefaultPrivacyViewController meOnlyRadioButton](self, "meOnlyRadioButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDefaultPrivacyViewController meOnlyContainerButton](self, "meOnlyContainerButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v19, v20, 0);
  }

  v25 = -[GKDefaultPrivacyViewController profilePrivacyVisibility](self, "profilePrivacyVisibility");
  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEnabled:", v25 >= 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTintColor:", v27);

  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "tintColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v30);

  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "isEnabled"))
    v33 = 1.0;
  else
    v33 = 0.5;
  -[GKDefaultPrivacyViewController nextButton](self, "nextButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAlpha:", v33);

}

void __42__GKDefaultPrivacyViewController_updateUI__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  v7 = a2;
  objc_msgSend(v7, "setClipsToBounds:", 0);
  if ((_DWORD)a4)
  {
    objc_msgSend(v7, "setImage:forState:", *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1.0;
  }
  else
  {
    objc_msgSend(v7, "setImage:forState:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.5;
  }
  objc_msgSend(v7, "setTintColor:", v8);
  objc_msgSend(v7, "setAlpha:", v9);

  objc_msgSend(v10, "setSelected:", a4);
}

- (UILabel)publicTitle
{
  return self->_publicTitle;
}

- (void)setPublicTitle:(id)a3
{
  objc_storeStrong((id *)&self->_publicTitle, a3);
}

- (UILabel)publicSubTitle
{
  return self->_publicSubTitle;
}

- (void)setPublicSubTitle:(id)a3
{
  objc_storeStrong((id *)&self->_publicSubTitle, a3);
}

- (UILabel)friendsOnlyTitle
{
  return self->_friendsOnlyTitle;
}

- (void)setFriendsOnlyTitle:(id)a3
{
  objc_storeStrong((id *)&self->_friendsOnlyTitle, a3);
}

- (UILabel)friendsOnlySubtitle
{
  return self->_friendsOnlySubtitle;
}

- (void)setFriendsOnlySubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_friendsOnlySubtitle, a3);
}

- (UILabel)meOnlyTitle
{
  return self->_meOnlyTitle;
}

- (void)setMeOnlyTitle:(id)a3
{
  objc_storeStrong((id *)&self->_meOnlyTitle, a3);
}

- (UILabel)meOnlySubtitle
{
  return self->_meOnlySubtitle;
}

- (void)setMeOnlySubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_meOnlySubtitle, a3);
}

- (UIView)publicDivider
{
  return self->_publicDivider;
}

- (void)setPublicDivider:(id)a3
{
  objc_storeStrong((id *)&self->_publicDivider, a3);
}

- (UIView)publicContainer
{
  return self->_publicContainer;
}

- (void)setPublicContainer:(id)a3
{
  objc_storeStrong((id *)&self->_publicContainer, a3);
}

- (UIView)friendsOnlyContainer
{
  return self->_friendsOnlyContainer;
}

- (void)setFriendsOnlyContainer:(id)a3
{
  objc_storeStrong((id *)&self->_friendsOnlyContainer, a3);
}

- (UIView)privateContainer
{
  return self->_privateContainer;
}

- (void)setPrivateContainer:(id)a3
{
  objc_storeStrong((id *)&self->_privateContainer, a3);
}

- (UIButton)publicRadioButton
{
  return self->_publicRadioButton;
}

- (void)setPublicRadioButton:(id)a3
{
  objc_storeStrong((id *)&self->_publicRadioButton, a3);
}

- (UIButton)publicContainerButton
{
  return self->_publicContainerButton;
}

- (void)setPublicContainerButton:(id)a3
{
  objc_storeStrong((id *)&self->_publicContainerButton, a3);
}

- (UIButton)friendsOnlyRadioButton
{
  return self->_friendsOnlyRadioButton;
}

- (void)setFriendsOnlyRadioButton:(id)a3
{
  objc_storeStrong((id *)&self->_friendsOnlyRadioButton, a3);
}

- (UIButton)friendsOnlyContainerButton
{
  return self->_friendsOnlyContainerButton;
}

- (void)setFriendsOnlyContainerButton:(id)a3
{
  objc_storeStrong((id *)&self->_friendsOnlyContainerButton, a3);
}

- (UIButton)meOnlyRadioButton
{
  return self->_meOnlyRadioButton;
}

- (void)setMeOnlyRadioButton:(id)a3
{
  objc_storeStrong((id *)&self->_meOnlyRadioButton, a3);
}

- (UIButton)meOnlyContainerButton
{
  return self->_meOnlyContainerButton;
}

- (void)setMeOnlyContainerButton:(id)a3
{
  objc_storeStrong((id *)&self->_meOnlyContainerButton, a3);
}

- (UILabel)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
  objc_storeStrong((id *)&self->_subTitle, a3);
}

- (NSLayoutConstraint)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(id)a3
{
  objc_storeStrong((id *)&self->_topMargin, a3);
}

- (UIView)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainer, a3);
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

- (NSLayoutConstraint)continueButtonEqualMainTitleWidthConstraint
{
  return self->_continueButtonEqualMainTitleWidthConstraint;
}

- (void)setContinueButtonEqualMainTitleWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonEqualMainTitleWidthConstraint, a3);
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

- (UIButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (UILabel)mainTitle
{
  return self->_mainTitle;
}

- (void)setMainTitle:(id)a3
{
  objc_storeStrong((id *)&self->_mainTitle, a3);
}

- (int)profilePrivacyVisibility
{
  return self->_profilePrivacyVisibility;
}

- (void)setProfilePrivacyVisibility:(int)a3
{
  self->_profilePrivacyVisibility = a3;
}

- (int64_t)numberOfClicksOnPrivacySelection
{
  return self->_numberOfClicksOnPrivacySelection;
}

- (void)setNumberOfClicksOnPrivacySelection:(int64_t)a3
{
  self->_numberOfClicksOnPrivacySelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainTitle, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_continueButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_continueButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_continueButtonEqualMainTitleWidthConstraint, 0);
  objc_storeStrong((id *)&self->_mainStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_mainStackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonContainer, 0);
  objc_storeStrong((id *)&self->_topMargin, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_meOnlyContainerButton, 0);
  objc_storeStrong((id *)&self->_meOnlyRadioButton, 0);
  objc_storeStrong((id *)&self->_friendsOnlyContainerButton, 0);
  objc_storeStrong((id *)&self->_friendsOnlyRadioButton, 0);
  objc_storeStrong((id *)&self->_publicContainerButton, 0);
  objc_storeStrong((id *)&self->_publicRadioButton, 0);
  objc_storeStrong((id *)&self->_privateContainer, 0);
  objc_storeStrong((id *)&self->_friendsOnlyContainer, 0);
  objc_storeStrong((id *)&self->_publicContainer, 0);
  objc_storeStrong((id *)&self->_publicDivider, 0);
  objc_storeStrong((id *)&self->_meOnlySubtitle, 0);
  objc_storeStrong((id *)&self->_meOnlyTitle, 0);
  objc_storeStrong((id *)&self->_friendsOnlySubtitle, 0);
  objc_storeStrong((id *)&self->_friendsOnlyTitle, 0);
  objc_storeStrong((id *)&self->_publicSubTitle, 0);
  objc_storeStrong((id *)&self->_publicTitle, 0);
}

void __46__GKDefaultPrivacyViewController_nextPressed___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "Edit profile privacy error: %@", (uint8_t *)&v2, 0xCu);
}

@end
