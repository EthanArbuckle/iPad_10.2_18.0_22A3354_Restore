@implementation HROnboardingAtrialFibrillationEnableViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingAtrialFibrillationEnableViewController;
  v5 = -[HROnboardingAtrialFibrillationEnableViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v9, sel_initForOnboarding_upgradingFromAlgorithmVersion_, a3, a4);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesBackButton:", v4);

  }
  return v6;
}

- (void)setUpUI
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
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
  id v33;
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
  objc_super v58;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x24BDAC8D0];
  v58.receiver = self;
  v58.super_class = (Class)HROnboardingAtrialFibrillationEnableViewController;
  -[HROnboardingAtrialFibrillationEnableViewController setUpUI](&v58, sel_setUpUI);
  -[HROnboardingAtrialFibrillationEnableViewController createHeroView](self, "createHeroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController setHeroView:](self, "setHeroView:", v3);

  -[HROnboardingAtrialFibrillationEnableViewController heroView](self, "heroView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController heroView](self, "heroView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationEnableViewController setTitleLabel:](self, "setTitleLabel:", v7);

  HRHeartRhythmUIFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextAlignment:", 1);

  -[HROnboardingAtrialFibrillationEnableViewController _titleFont](self, "_titleFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationEnableViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("PageTitle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", v16);

  -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v20 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationEnableViewController setBodyLabel:](self, "setBodyLabel:", v20);

  HRHeartRhythmUIFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v22);

  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextAlignment:", 1);

  -[HROnboardingAtrialFibrillationEnableViewController _bodyFont](self, "_bodyFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFont:", v25);

  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationEnableViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("IfYouReceiveANotificationDescription"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAccessibilityIdentifier:", v29);

  -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v32);

  v33 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationEnableViewController setFootnoteLabel:](self, "setFootnoteLabel:", v33);

  HRHeartRhythmUIFrameworkBundle();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_FOOTNOTE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setText:", v35);

  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTextAlignment:", 1);

  -[HROnboardingAtrialFibrillationEnableViewController _footnoteFont](self, "_footnoteFont");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFont:", v38);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTextColor:", v40);

  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationEnableViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("ManageNotificationsInHeartSettings"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAccessibilityIdentifier:", v44);

  -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addSubview:", v47);

  if (-[HROnboardingAtrialFibrillationEnableViewController isOnboarding](self, "isOnboarding"))
  {
    HRHeartRhythmUIFrameworkBundle();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_ENABLE_BUTTON"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v49;
    HRHeartRhythmUIFrameworkBundle();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_NOT_NOW_BUTTON"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v52, 0, 0, self);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationEnableViewController setStackedButtonView:](self, "setStackedButtonView:", v53);

    -[HROnboardingAtrialFibrillationEnableViewController stackedButtonView](self, "stackedButtonView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setBlurHidden:", 1);

    -[HROnboardingAtrialFibrillationEnableViewController stackedButtonView](self, "stackedButtonView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationEnableViewController stackedButtonView](self, "stackedButtonView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v57);

  }
}

- (void)setUpConstraints
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
  double v34;
  double v35;
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
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)HROnboardingAtrialFibrillationEnableViewController;
  -[HROnboardingAtrialFibrillationEnableViewController setUpConstraints](&v51, sel_setUpConstraints);
  -[HROnboardingAtrialFibrillationEnableViewController heroView](self, "heroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HROnboardingAtrialFibrillationEnableViewController heroView](self, "heroView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController contentTop](self, "contentTop");
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v13, "hrui_alignHorizontalConstraintsWithView:insets:", v14);

  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController heroView](self, "heroView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 30.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hk_alignHorizontalConstraintsWithView:margin:", v21, 0.0);

  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstBaselineAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastBaselineAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController _titleLastBaselineToBodyFirstBaseline](self, "_titleLastBaselineToBodyFirstBaseline");
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hk_alignHorizontalConstraintsWithView:margin:", v28, 0.0);

  -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "firstBaselineAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController bodyLabel](self, "bodyLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "lastBaselineAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationEnableViewController _titleLastBaselineToBodyFirstBaseline](self, "_titleLastBaselineToBodyFirstBaseline");
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  if (-[HROnboardingAtrialFibrillationEnableViewController isOnboarding](self, "isOnboarding"))
  {
    +[HRStackedButtonView topPadding](HRStackedButtonView, "topPadding");
    v35 = 44.0 - v34;
    -[HROnboardingAtrialFibrillationEnableViewController stackedButtonView](self, "stackedButtonView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationEnableViewController titleLabel](self, "titleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "hk_alignHorizontalConstraintsWithView:margin:", v37, 0.0);

    -[HROnboardingAtrialFibrillationEnableViewController stackedButtonView](self, "stackedButtonView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, v35);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    -[HROnboardingAtrialFibrillationEnableViewController stackedButtonView](self, "stackedButtonView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "alignBlurViewHorizontalConstraintsWithView:", v44);

    -[HROnboardingAtrialFibrillationEnableViewController stackedButtonView](self, "stackedButtonView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setBlurHidden:", 1);

    -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationEnableViewController stackedButtonView](self, "stackedButtonView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v49);
  }
  else
  {
    -[HROnboardingAtrialFibrillationEnableViewController contentView](self, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationEnableViewController footnoteLabel](self, "footnoteLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationEnableViewController _footnoteToButton](self, "_footnoteToButton");
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49);
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

}

- (id)createHeroView
{
  HRSimulatedAtrialFibrillationNotificationView *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HRSimulatedAtrialFibrillationNotificationView);
  -[HRSimulatedAtrialFibrillationNotificationView widthAnchor](v2, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 160.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 1);

  return v2;
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  if (a4 == 1)
  {
    v12 = v6;
    -[HROnboardingAtrialFibrillationEnableViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = MEMORY[0x24BDBD1C0];
    goto LABEL_5;
  }
  if (!a4)
  {
    v12 = v6;
    -[HROnboardingAtrialFibrillationEnableViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = MEMORY[0x24BDBD1C8];
LABEL_5:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("HROnboardingAtrialFibrillationEnableNotificationsKey"));

    -[HROnboardingAtrialFibrillationEnableViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stepForward");

    v6 = v12;
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
  -[HROnboardingAtrialFibrillationEnableViewController _titleFontTextStyle](self, "_titleFontTextStyle");
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
  -[HROnboardingAtrialFibrillationEnableViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_titleLastBaselineToBodyFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationEnableViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 32.0);
  v4 = v3;

  return v4;
}

- (id)_footnoteFontTextStyle
{
  return (id)*MEMORY[0x24BDF77D0];
}

- (id)_footnoteFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingAtrialFibrillationEnableViewController _footnoteFontTextStyle](self, "_footnoteFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_footnoteToButton
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationEnableViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 44.0);
  v4 = v3;

  return v4;
}

- (id)axidForElementWithString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v3, "healthAccessibilityIdentifier:suffix:", 2, CFSTR("Onboarding"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(".%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __90__HROnboardingAtrialFibrillationEnableViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D34A7B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HROnboardingAtrialFibrillationEnableViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __90__HROnboardingAtrialFibrillationEnableViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HROnboardingAtrialFibrillationEnableViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (UIView)heroView
{
  return self->_heroView;
}

- (void)setHeroView:(id)a3
{
  objc_storeStrong((id *)&self->_heroView, a3);
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

- (UILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteLabel, a3);
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
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
}

@end
