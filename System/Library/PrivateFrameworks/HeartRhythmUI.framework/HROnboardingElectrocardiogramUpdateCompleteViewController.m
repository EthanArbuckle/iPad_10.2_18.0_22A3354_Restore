@implementation HROnboardingElectrocardiogramUpdateCompleteViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4 electrocardiogramDelegate:(id)a5
{
  _BOOL8 v6;
  id v8;
  id *v9;
  id *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HROnboardingElectrocardiogramUpdateCompleteViewController;
  v9 = (id *)-[HROnboardingElectrocardiogramUpdateCompleteViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v13, sel_initForOnboarding_upgradingFromAlgorithmVersion_, v6, a4);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidesBackButton:", 1);

    objc_storeWeak(v10 + 133, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramUpdateCompleteViewController;
  -[HROnboardingElectrocardiogramUpdateCompleteViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HROnboardingElectrocardiogramUpdateCompleteViewController _setUpUI](self, "_setUpUI");
  -[HROnboardingElectrocardiogramUpdateCompleteViewController _setUpConstraints](self, "_setUpConstraints");
}

- (void)_setUpUI
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
  HRMiniTilePlatterView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HRMiniTilePlatterView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6B68], "hrui_fontAdjustingLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController titleString](self, "titleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(v3, "setTextAlignment:", 1);
  -[HROnboardingElectrocardiogramUpdateCompleteViewController _titleFont](self, "_titleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController setTitleLabel:](self, "setTitleLabel:", v3);
  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  objc_msgSend(MEMORY[0x24BDF6B68], "hrui_fontAdjustingLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController bodyString](self, "bodyString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v8, "setTextAlignment:", 1);
  -[HROnboardingElectrocardiogramUpdateCompleteViewController _bodyFont](self, "_bodyFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v10);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController setBodyLabel:](self, "setBodyLabel:", v8);
  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController bodyLabel](self, "bodyLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController otherDevicesWithUpdateAvailable](self, "otherDevicesWithUpdateAvailable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [HRMiniTilePlatterView alloc];
    -[HROnboardingElectrocardiogramUpdateCompleteViewController otherDevicesTileTitle](self, "otherDevicesTileTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController otherDevicesTileBody](self, "otherDevicesTileBody");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "hrui_watchIconImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController otherDevicesTileAction](self, "otherDevicesTileAction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HRMiniTilePlatterView initWithtitle:body:footnote:icon:actionText:](v15, "initWithtitle:body:footnote:icon:actionText:", v16, v17, v14, v18, v19);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__showDevicesInWatchAppTapped_);
    -[HRMiniTilePlatterView addGestureRecognizer:](v20, "addGestureRecognizer:", v21);
    -[HRMiniTilePlatterView setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HRMiniTilePlatterView setUserInteractionEnabled:](v20, "setUserInteractionEnabled:", 1);

    -[HROnboardingElectrocardiogramUpdateCompleteViewController setOtherDevicesTile:](self, "setOtherDevicesTile:", v20);
    -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController otherDevicesTile](self, "otherDevicesTile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

  }
  -[HROnboardingElectrocardiogramUpdateCompleteViewController buttonTitleString](self, "buttonTitleString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v25, 0, 0, self);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setBlurHidden:", 0);
  objc_msgSend(v26, "setFixedBottomButtonSpacing:", 1);
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HROnboardingElectrocardiogramUpdateCompleteViewController setStackedButtonView:](self, "setStackedButtonView:", v26);

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
  double Width;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
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
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
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
  _QWORD v94[2];
  CGRect v95;

  v94[1] = *MEMORY[0x24BDAC8D0];
  -[HROnboardingElectrocardiogramUpdateCompleteViewController titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentTop](self, "contentTop");
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  Width = CGRectGetWidth(v95);
  HKHealthUIBuddyDirectionalEdgeInsets();
  v16 = Width - v15;
  HKHealthUIBuddyDirectionalEdgeInsets();
  v18 = v16 - v17;

  -[HROnboardingElectrocardiogramUpdateCompleteViewController titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPreferredMaxLayoutWidth:", v18);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "intrinsicContentSize");
  v22 = v21;

  if (v18 >= v22)
    v18 = v22;
  -[HROnboardingElectrocardiogramUpdateCompleteViewController titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintLessThanOrEqualToConstant:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = 1148846080;
  objc_msgSend(v26, "setContentHuggingPriority:forAxis:", 0, v27);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController bodyLabel](self, "bodyLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController bodyLabel](self, "bodyLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v33, "hrui_alignHorizontalConstraintsWithView:insets:", v34);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController otherDevicesTile](self, "otherDevicesTile");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[HROnboardingElectrocardiogramUpdateCompleteViewController otherDevicesTile](self, "otherDevicesTile");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController bodyLabel](self, "bodyLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, 24.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    -[HROnboardingElectrocardiogramUpdateCompleteViewController otherDevicesTile](self, "otherDevicesTile");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthUIBuddyDirectionalEdgeInsets();
    objc_msgSend(v41, "hrui_alignHorizontalConstraintsWithView:insets:", v42);

    -[HROnboardingElectrocardiogramUpdateCompleteViewController otherDevicesTile](self, "otherDevicesTile");
  }
  else
  {
    -[HROnboardingElectrocardiogramUpdateCompleteViewController bodyLabel](self, "bodyLabel");
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v44);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v47);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController stackedButtonView](self, "stackedButtonView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController setFooterView:insets:](self, "setFooterView:insets:", v49);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController stackedButtonView](self, "stackedButtonView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "alignBlurViewHorizontalConstraintsWithView:", v51);

  -[HROnboardingElectrocardiogramUpdateCompleteViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layoutIfNeeded");

  -[HROnboardingElectrocardiogramUpdateCompleteViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateCompleteViewController stackedButtonView](self, "stackedButtonView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "buttons");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "firstObject");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "frame");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  -[HROnboardingElectrocardiogramUpdateCompleteViewController stackedButtonView](self, "stackedButtonView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "convertRect:fromView:", v65, v58, v60, v62, v64);
  v67 = v66;

  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "frame");
  v70 = v69;
  -[HROnboardingElectrocardiogramUpdateCompleteViewController view](self, "view");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "safeAreaInsets");
  v73 = v67 - v72;

  if (v70 <= v73)
  {
    v89 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingElectrocardiogramUpdateCompleteViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v90;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v93, 1);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "deactivateConstraints:", v91);

    -[HROnboardingElectrocardiogramUpdateCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
    -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v44);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v86);
  }
  else
  {
    -[HROnboardingElectrocardiogramUpdateCompleteViewController removeFooterView](self, "removeFooterView");
    -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController stackedButtonView](self, "stackedButtonView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addSubview:", v75);

    -[HROnboardingElectrocardiogramUpdateCompleteViewController stackedButtonView](self, "stackedButtonView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController titleLabel](self, "titleLabel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "hk_alignHorizontalConstraintsWithView:margin:", v77, 0.0);

    -[HROnboardingElectrocardiogramUpdateCompleteViewController stackedButtonView](self, "stackedButtonView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "topAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:constant:", v44, *MEMORY[0x24BE4A258]);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setActive:", 1);

    v81 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingElectrocardiogramUpdateCompleteViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = v82;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "deactivateConstraints:", v83);

    -[HROnboardingElectrocardiogramUpdateCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
    -[HROnboardingElectrocardiogramUpdateCompleteViewController contentView](self, "contentView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController stackedButtonView](self, "stackedButtonView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "bottomAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramUpdateCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v88);

  }
  -[HROnboardingElectrocardiogramUpdateCompleteViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setActive:", 1);

}

- (id)otherDevicesWithUpdateAvailable
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v2;
  objc_msgSend(v2, "getActivePairedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    v9 = *MEMORY[0x24BE6B318];
    v22 = *MEMORY[0x24BE6B398];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        if (v11 != v4)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("68AB2987-CE75-463C-9EAF-9861B292F01E"));
          v13 = objc_msgSend(v11, "supportsCapability:", v12);

          objc_msgSend(v11, "valueForProperty:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 && v14 == 0)
          {
            objc_msgSend(v11, "valueForProperty:", v22);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            v18 = CFSTR("(null)");
            if (v16)
              v18 = (__CFString *)v16;
            v19 = v18;

            objc_msgSend(v23, "addObject:", v19);
          }
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  return v23;
}

- (void)_showDevicesInWatchAppTapped:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[HROnboardingElectrocardiogramUpdateCompleteViewController electrocardiogramDelegate](self, "electrocardiogramDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HROnboardingElectrocardiogramUpdateCompleteViewController electrocardiogramDelegate](self, "electrocardiogramDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didTapOnShowDevicesInWatchApp");

  }
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v4;

  if (!a4)
  {
    -[HROnboardingElectrocardiogramUpdateCompleteViewController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stepForward");

  }
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x24BDF7800];
}

- (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingElectrocardiogramUpdateCompleteViewController _titleFontTextStyle](self, "_titleFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_bodyFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingElectrocardiogramUpdateCompleteViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleString
{
  return HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_6_TITLE"));
}

- (id)bodyString
{
  return HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_6_BODY"));
}

- (id)buttonTitleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_DONE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)otherDevicesTileTitle
{
  return HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_6_DEVICES_TITLE"));
}

- (id)otherDevicesTileBody
{
  return HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_6_DEVICES_BODY"));
}

- (id)otherDevicesTileAction
{
  return HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_6_DEVICES_ACTION"));
}

- (HROnboardingElectrocardiogramUpdateCompleteViewControllerDelegate)electrocardiogramDelegate
{
  return (HROnboardingElectrocardiogramUpdateCompleteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_electrocardiogramDelegate);
}

- (void)setElectrocardiogramDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_electrocardiogramDelegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (HRMiniTilePlatterView)otherDevicesTile
{
  return self->_otherDevicesTile;
}

- (void)setOtherDevicesTile:(id)a3
{
  objc_storeStrong((id *)&self->_otherDevicesTile, a3);
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_stackedButtonView, a3);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_otherDevicesTile, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_electrocardiogramDelegate);
}

@end
