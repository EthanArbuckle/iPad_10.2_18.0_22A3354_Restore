@implementation HROnboardingElectrocardiogramSetupCompleteViewController

- (id)initForOnboarding:(BOOL)a3 isSampleInteractive:(BOOL)a4 electrocardiogramDelegate:(id)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  id *v10;
  id *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v8 = a5;
  v9 = *MEMORY[0x24BDD4290];
  v14.receiver = self;
  v14.super_class = (Class)HROnboardingElectrocardiogramSetupCompleteViewController;
  v10 = (id *)-[HROnboardingElectrocardiogramSetupCompleteViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v14, sel_initForOnboarding_upgradingFromAlgorithmVersion_, v6, v9);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidesBackButton:", 1);

    objc_storeWeak(v11 + 138, v8);
    *((_BYTE *)v11 + 1064) = 1;
    *((_BYTE *)v11 + 1065) = a4;
  }

  return v11;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramSetupCompleteViewController;
  -[HROnboardingElectrocardiogramSetupCompleteViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HROnboardingElectrocardiogramSetupCompleteViewController _recomputeState](self, "_recomputeState");
  -[HROnboardingElectrocardiogramSetupCompleteViewController _setUpUI](self, "_setUpUI");
  -[HROnboardingElectrocardiogramSetupCompleteViewController _setUpConstraints](self, "_setUpConstraints");
  if (-[HROnboardingElectrocardiogramSetupCompleteViewController state](self, "state") == 1)
    -[HROnboardingElectrocardiogramSetupCompleteViewController _setUpElectrocardiogramQuery](self, "_setUpElectrocardiogramQuery");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramSetupCompleteViewController;
  -[HROnboardingElectrocardiogramSetupCompleteViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (-[HROnboardingElectrocardiogramSetupCompleteViewController firstViewDidLayoutSubviews](self, "firstViewDidLayoutSubviews"))
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController setFirstViewDidLayoutSubviews:](self, "setFirstViewDidLayoutSubviews:", 0);
    -[HROnboardingElectrocardiogramSetupCompleteViewController _updateUI](self, "_updateUI");
  }
}

- (void)_setUpUI
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "-[HROnboardingElectrocardiogramSetupCompleteViewController _setUpUI]";
  _os_log_error_impl(&dword_215454000, log, OS_LOG_TYPE_ERROR, "%{public}s: Failed to fetch active algorithm version.", (uint8_t *)&v1, 0xCu);
}

- (void)_resetUI
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

  -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[HROnboardingElectrocardiogramSetupCompleteViewController activityIndicatorView](self, "activityIndicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[HROnboardingElectrocardiogramSetupCompleteViewController activityIndicatorView](self, "activityIndicatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAnimating");

  -[HROnboardingElectrocardiogramSetupCompleteViewController classificationLabel](self, "classificationLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramCardView](self, "electrocardiogramCardView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramCardTapGestureRecognizer](self, "electrocardiogramCardTapGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", v8);

  -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramCardView](self, "electrocardiogramCardView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[HROnboardingElectrocardiogramSetupCompleteViewController stackedButtonView](self, "stackedButtonView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

  -[HROnboardingElectrocardiogramSetupCompleteViewController removeFooterView](self, "removeFooterView");
}

- (void)_setUpConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  double v23;
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
  double v53;
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
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
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
  _QWORD v113[2];

  v113[1] = *MEMORY[0x24BDAC8D0];
  HKHealthUIBuddyDirectionalEdgeInsets();
  v4 = v3;
  v6 = v5;
  -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController contentTop](self, "contentTop");
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 1148846080;
  objc_msgSend(v22, "setContentHuggingPriority:forAxis:", 0, v23);

  if (-[HROnboardingElectrocardiogramSetupCompleteViewController state](self, "state") == 1)
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController activityIndicatorView](self, "activityIndicatorView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 12.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

    -[HROnboardingElectrocardiogramSetupCompleteViewController activityIndicatorView](self, "activityIndicatorView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, -v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    -[HROnboardingElectrocardiogramSetupCompleteViewController activityIndicatorView](self, "activityIndicatorView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "lastBaselineAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, 2.0);
  }
  else
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:constant:", v37, -v6);
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  if (-[HROnboardingElectrocardiogramSetupCompleteViewController state](self, "state") == 2)
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController classificationLabel](self, "classificationLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[HROnboardingElectrocardiogramSetupCompleteViewController classificationLabel](self, "classificationLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      HKHealthUIBuddyDirectionalEdgeInsets();
      objc_msgSend(v40, "hrui_alignHorizontalConstraintsWithView:insets:", v41);

      -[HROnboardingElectrocardiogramSetupCompleteViewController classificationLabel](self, "classificationLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "topAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "bottomAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, 15.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setActive:", 1);

      -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramCardView](self, "electrocardiogramCardView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "topAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramSetupCompleteViewController classificationLabel](self, "classificationLabel");
    }
    else
    {
      -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramCardView](self, "electrocardiogramCardView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "topAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v55, 37.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setActive:", 1);

    -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramCardView](self, "electrocardiogramCardView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthUIBuddyDirectionalEdgeInsets();
    objc_msgSend(v57, "hrui_alignHorizontalConstraintsWithView:insets:", v58);

    -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramCardView](self, "electrocardiogramCardView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 12.0;
  }
  else
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 15.0;
  }
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, v53);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setActive:", 1);

  -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v62, "hrui_alignHorizontalConstraintsWithView:insets:", v63);

  -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "bottomAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v61);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v66);

  -[HROnboardingElectrocardiogramSetupCompleteViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setActive:", 1);

  -[HROnboardingElectrocardiogramSetupCompleteViewController stackedButtonView](self, "stackedButtonView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HROnboardingElectrocardiogramSetupCompleteViewController setFooterView:insets:](self, "setFooterView:insets:", v68);

  -[HROnboardingElectrocardiogramSetupCompleteViewController stackedButtonView](self, "stackedButtonView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "alignBlurViewHorizontalConstraintsWithView:", v70);

  -[HROnboardingElectrocardiogramSetupCompleteViewController view](self, "view");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "layoutIfNeeded");

  -[HROnboardingElectrocardiogramSetupCompleteViewController view](self, "view");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController stackedButtonView](self, "stackedButtonView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "buttons");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "firstObject");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "frame");
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = v82;
  -[HROnboardingElectrocardiogramSetupCompleteViewController stackedButtonView](self, "stackedButtonView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "convertRect:fromView:", v84, v77, v79, v81, v83);
  v86 = v85;

  -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "frame");
  v89 = v88;
  -[HROnboardingElectrocardiogramSetupCompleteViewController view](self, "view");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "safeAreaInsets");
  v92 = v86 - v91;

  if (v89 <= v92)
  {
    v108 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingElectrocardiogramSetupCompleteViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v109;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v112, 1);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "deactivateConstraints:", v110);

    -[HROnboardingElectrocardiogramSetupCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
    -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v61);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v105);
  }
  else
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController removeFooterView](self, "removeFooterView");
    -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController stackedButtonView](self, "stackedButtonView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "addSubview:", v94);

    -[HROnboardingElectrocardiogramSetupCompleteViewController stackedButtonView](self, "stackedButtonView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController titleLabel](self, "titleLabel");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "hk_alignHorizontalConstraintsWithView:margin:", v96, 0.0);

    -[HROnboardingElectrocardiogramSetupCompleteViewController stackedButtonView](self, "stackedButtonView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:constant:", v61, *MEMORY[0x24BE4A258]);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setActive:", 1);

    v100 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingElectrocardiogramSetupCompleteViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = v101;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 1);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "deactivateConstraints:", v102);

    -[HROnboardingElectrocardiogramSetupCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
    -[HROnboardingElectrocardiogramSetupCompleteViewController contentView](self, "contentView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController stackedButtonView](self, "stackedButtonView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "bottomAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v107);

  }
  -[HROnboardingElectrocardiogramSetupCompleteViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setActive:", 1);

}

- (void)_updateUIForElectrocardiogram:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v4 = a3;
  -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramQuery](self, "electrocardiogramQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[HROnboardingElectrocardiogramSetupCompleteViewController _stopElectrocardiogramQuery](self, "_stopElectrocardiogramQuery");
  -[HROnboardingElectrocardiogramSetupCompleteViewController setElectrocardiogram:](self, "setElectrocardiogram:", v4);
  -[HROnboardingElectrocardiogramSetupCompleteViewController _recomputeState](self, "_recomputeState");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerForKey:", CFSTR("HROnboardingCinnamonSetupDelayInSec"));

  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall") && v7 >= 1)
  {
    v8 = dispatch_time(0, 1000000000 * v7);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__HROnboardingElectrocardiogramSetupCompleteViewController__updateUIForElectrocardiogram___block_invoke;
    block[3] = &unk_24D34AAB0;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController _resetUI](self, "_resetUI");
    -[HROnboardingElectrocardiogramSetupCompleteViewController _setUpUI](self, "_setUpUI");
    -[HROnboardingElectrocardiogramSetupCompleteViewController _setUpConstraints](self, "_setUpConstraints");
    -[HROnboardingElectrocardiogramSetupCompleteViewController _updateUI](self, "_updateUI");
  }

}

uint64_t __90__HROnboardingElectrocardiogramSetupCompleteViewController__updateUIForElectrocardiogram___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_resetUI");
  objc_msgSend(*(id *)(a1 + 32), "_setUpUI");
  objc_msgSend(*(id *)(a1 + 32), "_setUpConstraints");
  return objc_msgSend(*(id *)(a1 + 32), "_updateUI");
}

- (void)_updateUI
{
  id v2;

  -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramCardView](self, "electrocardiogramCardView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateUI");

}

- (void)_electrocardiogramCardViewTapped:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[HROnboardingElectrocardiogramSetupCompleteViewController _stopElectrocardiogramQuery](self, "_stopElectrocardiogramQuery", a3);
  -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramDelegate](self, "electrocardiogramDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramDelegate](self, "electrocardiogramDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogram](self, "electrocardiogram");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didTapOnElectrocardiogram:", v6);

  }
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v5;

  if (!a4)
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController _stopElectrocardiogramQuery](self, "_stopElectrocardiogramQuery", a3);
    -[HROnboardingElectrocardiogramSetupCompleteViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stepForward");

  }
}

- (void)_recomputeState
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HROnboardingElectrocardiogramSetupCompleteViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HROnboardingElectrocardiogramDidCompleteRecordingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogram](self, "electrocardiogram");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = 2;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  -[HROnboardingElectrocardiogramSetupCompleteViewController setState:](self, "setState:", v8);
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_opt_class();
    v12 = v11;
    v13 = 138412546;
    v14 = v11;
    v15 = 2048;
    v16 = -[HROnboardingElectrocardiogramSetupCompleteViewController state](self, "state");
    _os_log_impl(&dword_215454000, v10, OS_LOG_TYPE_DEFAULT, "[%@]: Cinnamon Setup Complete state: %ld", (uint8_t *)&v13, 0x16u);

  }
}

- (id)_classificationAttributedTextForElectrocardiogram:(id)a3 activeAlgorithmVersion:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDF6750];
  v7 = a3;
  objc_msgSend(v6, "defaultParagraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[HROnboardingElectrocardiogramSetupCompleteViewController _classificationTextDistance](self, "_classificationTextDistance");
  v11 = v10;
  -[HROnboardingElectrocardiogramSetupCompleteViewController _bodyFont](self, "_bodyFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ascender");
  v14 = v11 - v13;
  -[HROnboardingElectrocardiogramSetupCompleteViewController _bodyFont](self, "_bodyFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descender");
  objc_msgSend(v9, "setParagraphSpacing:", v14 - v16);

  v22 = *MEMORY[0x24BDF6628];
  v23[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v7, "hrui_classificationShortBodyTextWithActiveAlgorithmVersion:isSharedData:", a4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v17);
  return v20;
}

- (void)_setupBodyLabelForSetupCompleteState:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (a3 == 2)
  {
    HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_6_BODY"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextAlignment:", 4);

    -[HROnboardingElectrocardiogramSetupCompleteViewController _subheadlineFont](self, "_subheadlineFont");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 1)
    {
      v4 = CFSTR("ECG_ONBOARDING_6_BODY_WAITING_FOR_SAMPLE");
    }
    else
    {
      if (a3)
        return;
      v4 = CFSTR("ECG_ONBOARDING_6_BODY_TAKEN_LATER");
    }
    HRUIECGLocalizedString(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextAlignment:", 1);

    -[HROnboardingElectrocardiogramSetupCompleteViewController _bodyFont](self, "_bodyFont");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (id)v10;
  -[HROnboardingElectrocardiogramSetupCompleteViewController bodyLabel](self, "bodyLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v17);

}

- (void)_setUpElectrocardiogramQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HROnboardingElectrocardiogramSetupCompleteViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HROnboardingElectrocardiogramStartDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD3E88], "predicateForSamplesWithStartDate:endDate:options:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  _HKInitializeLogging();
  v7 = (id)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    v25 = 2112;
    v26 = v5;
    v9 = v8;
    _os_log_impl(&dword_215454000, v7, OS_LOG_TYPE_DEFAULT, "[%@]: Querying for new electrocardiograms during on-boarding after %@", buf, 0x16u);

  }
  v10 = objc_alloc(MEMORY[0x24BDD3920]);
  objc_msgSend(MEMORY[0x24BDD3B80], "electrocardiogramType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke;
  v20[3] = &unk_24D34AB00;
  v20[4] = self;
  objc_copyWeak(&v21, &location);
  v13 = (void *)objc_msgSend(v10, "initWithType:predicate:anchor:limit:resultsHandler:", v11, v6, 0, 0, v20);
  -[HROnboardingElectrocardiogramSetupCompleteViewController setElectrocardiogramQuery:](self, "setElectrocardiogramQuery:", v13);

  objc_copyWeak(&v19, &location);
  -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramQuery](self, "electrocardiogramQuery", v12, 3221225472, __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_229, &unk_24D34AB50);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUpdateHandler:", &v18);

  -[HROnboardingElectrocardiogramSetupCompleteViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "healthStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramQuery](self, "electrocardiogramQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "executeQuery:", v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2;
  v13[3] = &unk_24D34AAD8;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v10;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], v13);
  objc_destroyWeak(&v17);

}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_cold_1(a1, v2);
  }
  else
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 48);
      v23[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        _HKInitializeLogging();
        v8 = (id)*MEMORY[0x24BDD3010];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (id)objc_opt_class();
          objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "showSensitiveLogItems");
          objc_msgSend(v6, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = v12;
          if ((v11 & 1) == 0)
          {
            objc_msgSend(v12, "UUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v19 = 138412546;
          v20 = v9;
          v21 = 2112;
          v22 = v14;
          _os_log_impl(&dword_215454000, v8, OS_LOG_TYPE_DEFAULT, "[%@]: Initial electrocardiogram retrieved during on-boarding: %@", (uint8_t *)&v19, 0x16u);
          if ((v11 & 1) == 0)

        }
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(v6, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_updateUIForElectrocardiogram:", v16);

      }
    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x24BDD3010];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
        return;
      v3 = v17;
      v19 = 138412290;
      v20 = (id)objc_opt_class();
      v18 = v20;
      _os_log_impl(&dword_215454000, v3, OS_LOG_TYPE_DEFAULT, "[%@]: No initial electrocardiograms retrieved during on-boarding", (uint8_t *)&v19, 0xCu);

    }
  }
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_229(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_230;
  block[3] = &unk_24D34AB28;
  v13 = v9;
  v10 = v9;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  v14 = v8;
  v11 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v15);
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_230(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_230_cold_1(a1, v2);
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v22[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _HKInitializeLogging();
      v8 = (id)*MEMORY[0x24BDD3010];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        v10 = (id)objc_opt_class();
        objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "showSensitiveLogItems");
        objc_msgSend(v6, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = v13;
        if ((v12 & 1) == 0)
        {
          objc_msgSend(v13, "UUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v18 = 138412546;
        v19 = v10;
        v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_215454000, v8, OS_LOG_TYPE_DEFAULT, "[%@]: New electrocardiogram received during on-boarding: %@", (uint8_t *)&v18, 0x16u);
        if ((v12 & 1) == 0)

      }
      v16 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v6, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_updateUIForElectrocardiogram:", v17);

    }
  }
}

- (void)_stopElectrocardiogramQuery
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramQuery](self, "electrocardiogramQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      *(_DWORD *)v10 = 138412290;
      *(_QWORD *)&v10[4] = objc_opt_class();
      v6 = *(id *)&v10[4];
      _os_log_impl(&dword_215454000, v5, OS_LOG_TYPE_DEFAULT, "[%@]: Stopping query for new electrocardiograms", v10, 0xCu);

    }
    -[HROnboardingElectrocardiogramSetupCompleteViewController delegate](self, "delegate", *(_OWORD *)v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "healthStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramSetupCompleteViewController electrocardiogramQuery](self, "electrocardiogramQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopQuery:", v9);

    -[HROnboardingElectrocardiogramSetupCompleteViewController setElectrocardiogramQuery:](self, "setElectrocardiogramQuery:", 0);
  }
}

- (double)_classificationTextDistance
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x24BDF6A80];
  -[HROnboardingElectrocardiogramSetupCompleteViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaledValueForValue:", 30.0);
  v6 = v5;

  return v6;
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
  -[HROnboardingElectrocardiogramSetupCompleteViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_subheadlineFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (HKAnchoredObjectQuery)electrocardiogramQuery
{
  return self->_electrocardiogramQuery;
}

- (void)setElectrocardiogramQuery:(id)a3
{
  objc_storeStrong((id *)&self->_electrocardiogramQuery, a3);
}

- (HKElectrocardiogram)electrocardiogram
{
  return self->_electrocardiogram;
}

- (void)setElectrocardiogram:(id)a3
{
  objc_storeStrong((id *)&self->_electrocardiogram, a3);
}

- (UITapGestureRecognizer)electrocardiogramCardTapGestureRecognizer
{
  return self->_electrocardiogramCardTapGestureRecognizer;
}

- (void)setElectrocardiogramCardTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_electrocardiogramCardTapGestureRecognizer, a3);
}

- (HROnboardingElectrocardiogramSetupCompleteViewControllerDelegate)electrocardiogramDelegate
{
  return (HROnboardingElectrocardiogramSetupCompleteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_electrocardiogramDelegate);
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

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UILabel)classificationLabel
{
  return self->_classificationLabel;
}

- (void)setClassificationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_classificationLabel, a3);
}

- (HKElectrocardiogramCardView)electrocardiogramCardView
{
  return self->_electrocardiogramCardView;
}

- (void)setElectrocardiogramCardView:(id)a3
{
  objc_storeStrong((id *)&self->_electrocardiogramCardView, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
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

- (NSLayoutYAxisAnchor)viewBottomAnchor
{
  return self->_viewBottomAnchor;
}

- (void)setViewBottomAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_viewBottomAnchor, a3);
}

- (BOOL)firstViewDidLayoutSubviews
{
  return self->_firstViewDidLayoutSubviews;
}

- (void)setFirstViewDidLayoutSubviews:(BOOL)a3
{
  self->_firstViewDidLayoutSubviews = a3;
}

- (BOOL)isSampleInteractive
{
  return self->_isSampleInteractive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewBottomAnchor, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_electrocardiogramCardView, 0);
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_electrocardiogramDelegate);
  objc_storeStrong((id *)&self->_electrocardiogramCardTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_electrocardiogram, 0);
  objc_storeStrong((id *)&self->_electrocardiogramQuery, 0);
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a2;
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_0_3(v3);
  OUTLINED_FUNCTION_1_2(&dword_215454000, v5, v6, "[%@]: Error fetching electrocardiograms during on-boarding: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

void __88__HROnboardingElectrocardiogramSetupCompleteViewController__setUpElectrocardiogramQuery__block_invoke_2_230_cold_1(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v2 = (id *)(a1 + 48);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_opt_class();
  v6 = OUTLINED_FUNCTION_0_3(v5);
  OUTLINED_FUNCTION_1_2(&dword_215454000, v7, v8, "[%@]: Error fetching electrocardiograms during on-boarding: %@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_2_0();
}

@end
