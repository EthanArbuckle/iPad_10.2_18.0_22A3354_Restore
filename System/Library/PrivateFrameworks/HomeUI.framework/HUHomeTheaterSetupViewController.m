@implementation HUHomeTheaterSetupViewController

- (HUHomeTheaterSetupViewController)initWithAppleTVAccessory:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "hf_displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUHomeTheaterSetup_Title"), CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSetup_Detail"), CFSTR("HUHomeTheaterSetup_Detail"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HUHomeTheaterSetupViewController;
  v18 = -[HUHomeTheaterSetupViewController initWithTitle:detailText:icon:contentLayout:](&v20, sel_initWithTitle_detailText_icon_contentLayout_, v16, v17, 0, 2);

  if (v18)
  {
    objc_storeStrong((id *)v18 + 148, a3);
    objc_storeStrong((id *)v18 + 149, a4);
    *(_OWORD *)(v18 + 1256) = xmmword_1B9442520;
    *(_OWORD *)(v18 + 1272) = xmmword_1B9442520;
  }

  return (HUHomeTheaterSetupViewController *)v18;
}

- (HUHomeTheaterSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAppleTVAccessory_inHome_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeTheaterSetupViewController.m"), 62, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUHomeTheaterSetupViewController initWithTitle:detailText:symbolName:contentLayout:]",
    v9);

  return 0;
}

- (HUHomeTheaterSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAppleTVAccessory_inHome_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeTheaterSetupViewController.m"), 67, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUHomeTheaterSetupViewController initWithTitle:detailText:icon:contentLayout:]",
    v9);

  return 0;
}

- (void)viewDidLoad
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HUSimpleItemModuleTableViewController *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
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
  NSLayoutConstraint *v50;
  NSLayoutConstraint *tableViewHeightConstraint;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *contentViewHeightConstraint;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _QWORD aBlock[5];
  objc_super v143;
  uint8_t buf[4];
  HUHomeTheaterSetupViewController *v145;
  __int16 v146;
  void *v147;
  _QWORD v148[14];

  v148[12] = *MEMORY[0x1E0C80C00];
  v143.receiver = self;
  v143.super_class = (Class)HUHomeTheaterSetupViewController;
  -[OBBaseWelcomeController viewDidLoad](&v143, sel_viewDidLoad);
  -[HUHomeTheaterSetupViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v4, &unk_1E7043248);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController setUseHomeTheaterButton:](self, "setUseHomeTheaterButton:", v5);

  -[HUHomeTheaterSetupViewController useHomeTheaterButton](self, "useHomeTheaterButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeTheaterSetupViewController useHomeTheaterButton](self, "useHomeTheaterButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSetup_UseHomeTheaterButton"), CFSTR("HUHomeTheaterSetup_UseHomeTheaterButton"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  -[HUHomeTheaterSetupViewController useHomeTheaterButton](self, "useHomeTheaterButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeTheater.SetUp.UseHomeTheaterButton"));

  -[HUHomeTheaterSetupViewController useHomeTheaterButton](self, "useHomeTheaterButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__activateHomeTheater_, 64);

  -[HUHomeTheaterSetupViewController buttonTray](self, "buttonTray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController useHomeTheaterButton](self, "useHomeTheaterButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addButton:", v12);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController setNotNowButton:](self, "setNotNowButton:", v13);

  -[HUHomeTheaterSetupViewController notNowButton](self, "notNowButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeTheaterSetupViewController notNowButton](self, "notNowButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSetup_NotNowButton"), CFSTR("HUHomeTheaterSetup_NotNowButton"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:forState:", v16, 0);

  -[HUHomeTheaterSetupViewController notNowButton](self, "notNowButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeTheater.SetUp.NotNowButton"));

  -[HUHomeTheaterSetupViewController notNowButton](self, "notNowButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__doNotActivateHomeTheater_, 64);

  -[HUHomeTheaterSetupViewController buttonTray](self, "buttonTray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController notNowButton](self, "notNowButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addButton:", v20);

  -[HUHomeTheaterSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  v21 = objc_alloc(MEMORY[0x1E0CEA658]);
  HUImageNamed(CFSTR("Onboarding-HomeTheater"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithImage:", v22);
  -[HUHomeTheaterSetupViewController setContentImageView:](self, "setContentImageView:", v23);

  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContentMode:", 1);

  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HUHomeTheaterSetupViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E6F4FDA0;
  aBlock[4] = self;
  v141 = _Block_copy(aBlock);
  v28 = -[HUSimpleItemModuleTableViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:]([HUSimpleItemModuleTableViewController alloc], "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 1, v141, &__block_literal_global_224);
  -[HUHomeTheaterSetupViewController setTableViewController:](self, "setTableViewController:", v28);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v29);

  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tableView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setScrollEnabled:", 0);

  -[HUHomeTheaterSetupViewController traitCollection](self, "traitCollection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "userInterfaceStyle") != 2;
  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setShouldUseAlternateCellColor:", v35);

  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setWantsPreferredContentSize:", 1);

  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "tableView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setLayoutMargins:", 0.0, 1.0, 0.0, 1.0);

  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setSectionContentInsetFollowsLayoutMargins:", 1);

  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController addChildViewController:](self, "addChildViewController:", v43);

  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addSubview:", v46);

  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "heightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToConstant:", 1.0);
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  tableViewHeightConstraint = self->_tableViewHeightConstraint;
  self->_tableViewHeightConstraint = v50;

  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintLessThanOrEqualToConstant:", 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = 1148829696;
  objc_msgSend(v54, "hu_constraintWithPriority:", v55);
  v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewHeightConstraint = self->_contentViewHeightConstraint;
  self->_contentViewHeightConstraint = v56;

  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "layoutMarginsGuide");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentInsets](self, "contentInsets");
  v64 = -v63;
  -[HUHomeTheaterSetupViewController contentInsets](self, "contentInsets");
  objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:constant:", v62, v64 - v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v67) = 1148846080;
  objc_msgSend(v66, "setPriority:", v67);
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "image");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "size");
  v71 = v70;
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "image");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "size");
  v75 = v71 / v74;

  v117 = (void *)MEMORY[0x1E0CB3718];
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "topAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "layoutMarginsGuide");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "topAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentInsets](self, "contentInsets");
  objc_msgSend(v136, "constraintEqualToAnchor:constant:", v135);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v134;
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "centerXAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "layoutMarginsGuide");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "centerXAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:", v129);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v148[1] = v128;
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "widthAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "image");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "size");
  objc_msgSend(v125, "constraintLessThanOrEqualToConstant:");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v76) = 1148846080;
  objc_msgSend(v123, "hu_constraintWithPriority:", v76);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v148[2] = v122;
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "heightAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "constraintGreaterThanOrEqualToConstant:", 150.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v77) = 1148846080;
  objc_msgSend(v119, "hu_constraintWithPriority:", v77);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v148[3] = v118;
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "heightAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "widthAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:multiplier:", v113, v75);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v78) = 1148846080;
  objc_msgSend(v112, "hu_constraintWithPriority:", v78);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v148[4] = v111;
  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "view");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "topAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentImageView](self, "contentImageView");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v106, 1.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v148[5] = v105;
  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "view");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "leadingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "leadingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:", v100);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v148[6] = v99;
  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "view");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v148[7] = v93;
  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "bottomAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "layoutMarginsGuide");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterSetupViewController contentInsets](self, "contentInsets");
  objc_msgSend(v80, "constraintEqualToAnchor:constant:", v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v148[8] = v85;
  v148[9] = v66;
  v140 = v66;
  -[HUHomeTheaterSetupViewController contentViewHeightConstraint](self, "contentViewHeightConstraint");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v148[10] = v86;
  -[HUHomeTheaterSetupViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v148[11] = v87;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 12);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "activateConstraints:", v88);

  -[HUHomeTheaterSetupViewController updateViewConstraints](self, "updateViewConstraints");
  HFLogForCategory();
  v89 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v145 = self;
    v146 = 2112;
    v147 = v90;
    _os_log_impl(&dword_1B8E1E000, v89, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HTSVC", buf, 0x16u);

  }
}

id __47__HUHomeTheaterSetupViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HUHomeTheaterAudioItemModule *v5;
  void *v6;
  void *v7;
  HUHomeTheaterAudioItemModule *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HUHomeTheaterAudioItemModule alloc];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUHomeTheaterAudioItemModule initWithItemUpdater:mediaProfileContainer:includeLocalDestinations:](v5, "initWithItemUpdater:mediaProfileContainer:includeLocalDestinations:", v4, v7, 0);

  -[HUHomeTheaterAudioItemModule setDisableAutomaticCommit:](v8, "setDisableAutomaticCommit:", 1);
  -[HUHomeTheaterAudioItemModule setOnboardingDelegate:](v8, "setOnboardingDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setTableViewControllerModule:", v8);
  objc_msgSend(*(id *)(a1 + 32), "homeTheaterItemModuleDidChangeSelectedDestination:", v8);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

HUHomeTheaterAudioItemModuleController *__47__HUHomeTheaterSetupViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HUHomeTheaterAudioItemModuleController *v3;

  v2 = a2;
  v3 = -[HUItemModuleController initWithModule:]([HUHomeTheaterAudioItemModuleController alloc], "initWithModule:", v2);

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUHomeTheaterSetupViewController;
  -[HUHomeTheaterSetupViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[HUHomeTheaterSetupViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle") != 2;
  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldUseAlternateCellColor:", v5);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUHomeTheaterSetupViewController;
  -[HUHomeTheaterSetupViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[HUHomeTheaterSetupViewController _updateHeightConstraints](self, "_updateHeightConstraints");
}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUHomeTheaterSetupViewController;
  -[HUHomeTheaterSetupViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[HUHomeTheaterSetupViewController _updateHeightConstraints](self, "_updateHeightConstraints");
}

- (id)hu_preloadContent
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hu_preloadContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performPresentationRequest:](self, "hu_performPresentationRequest:", a4);
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performDismissalRequest:](self, "hu_performDismissalRequest:", a4);
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (void)homeTheaterItemModuleDidChangeSelectedDestination:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUHomeTheaterSetupViewController useHomeTheaterButton](self, "useHomeTheaterButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tappedDestinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setEnabled:", 1);
  }
  else
  {
    objc_msgSend(v7, "selectedUncommittedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v6 != 0);

  }
}

- (void)_updateHeightConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double MaxY;
  void *v23;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[HUHomeTheaterSetupViewController tableViewController](self, "tableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSize");
  v5 = v4;
  -[HUHomeTheaterSetupViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  -[HUHomeTheaterSetupViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  -[HUHomeTheaterSetupViewController headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  -[HUHomeTheaterSetupViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  -[HUHomeTheaterSetupViewController headerView](self, "headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v17 = v12 + v15 - CGRectGetMaxY(v26);

  -[HUHomeTheaterSetupViewController buttonTray](self, "buttonTray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;

  -[HUHomeTheaterSetupViewController scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  MaxY = CGRectGetMaxY(v27);
  -[HUHomeTheaterSetupViewController buttonTray](self, "buttonTray");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v24 = MaxY - CGRectGetMaxY(v28);

  -[HUHomeTheaterSetupViewController contentViewHeightConstraint](self, "contentViewHeightConstraint");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setConstant:", -v9 - v17 - v20 - v24);

}

- (void)_activateHomeTheater:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  HUHomeTheaterSetupViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  _QWORD v21[5];
  uint8_t buf[4];
  HUHomeTheaterSetupViewController *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (HUHomeTheaterSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: Setting Up Home Theater", buf, 0xCu);

  }
  -[HUHomeTheaterSetupViewController tableViewControllerModule](self, "tableViewControllerModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commitConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeTheaterSetupViewController useHomeTheaterButton](self, "useHomeTheaterButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activityIndicator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startAnimating");

  objc_msgSend(v5, "setEnabled:", 0);
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__HUHomeTheaterSetupViewController__activateHomeTheater___block_invoke;
  v21[3] = &unk_1E6F502A0;
  v21[4] = self;
  objc_msgSend(v11, "addSuccessBlock:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __57__HUHomeTheaterSetupViewController__activateHomeTheater___block_invoke_59;
  v18[3] = &unk_1E6F570B8;
  v19 = v5;
  v20 = a2;
  v18[4] = self;
  v16 = v5;
  v17 = (id)objc_msgSend(v15, "addFailureBlock:", v18);

}

void __57__HUHomeTheaterSetupViewController__activateHomeTheater___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  v10[0] = &unk_1E70416B0;
  v9[0] = CFSTR("HUHomeTheaterOnboardingKey_UserInput");
  v9[1] = CFSTR("HUHomeTheaterOnboardingKey_Accessory");
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "useHomeTheaterButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopAnimating");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController:didFinishWithConfigurationResults:", *(_QWORD *)(a1 + 32), v5);

}

void __57__HUHomeTheaterSetupViewController__activateHomeTheater___block_invoke_59(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ completed with error: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "useHomeTheaterButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopAnimating");

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleError:", v3);

}

- (void)_doNotActivateHomeTheater:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];
  uint8_t buf[4];
  HUHomeTheaterSetupViewController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  v7 = (void *)MEMORY[0x1E0C99E08];
  -[HUHomeTheaterSetupViewController accessory](self, "accessory", CFSTR("HUHomeTheaterOnboardingKey_UserInput"), CFSTR("HUHomeTheaterOnboardingKey_Accessory"), &unk_1E70416C8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeTheaterSetupViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewController:didFinishWithConfigurationResults:", self, v10);

}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (OBTrayButton)useHomeTheaterButton
{
  return self->_useHomeTheaterButton;
}

- (void)setUseHomeTheaterButton:(id)a3
{
  objc_storeStrong((id *)&self->_useHomeTheaterButton, a3);
}

- (OBLinkTrayButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
  objc_storeStrong((id *)&self->_notNowButton, a3);
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void)setContentImageView:(id)a3
{
  objc_storeStrong((id *)&self->_contentImageView, a3);
}

- (HUSimpleItemModuleTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (HUHomeTheaterAudioItemModule)tableViewControllerModule
{
  return (HUHomeTheaterAudioItemModule *)objc_loadWeakRetained((id *)&self->_tableViewControllerModule);
}

- (void)setTableViewControllerModule:(id)a3
{
  objc_storeWeak((id *)&self->_tableViewControllerModule, a3);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, a3);
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_tableViewControllerModule);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_useHomeTheaterButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
