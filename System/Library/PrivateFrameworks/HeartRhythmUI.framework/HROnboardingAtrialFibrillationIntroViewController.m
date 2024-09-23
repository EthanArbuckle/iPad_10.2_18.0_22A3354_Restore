@implementation HROnboardingAtrialFibrillationIntroViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingAtrialFibrillationIntroViewController;
  v5 = -[HROnboardingAtrialFibrillationIntroViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v9, sel_initForOnboarding_upgradingFromAlgorithmVersion_, a3, a4);
  v6 = v5;
  if (v5)
    v7 = !v4;
  else
    v7 = 1;
  if (!v7)
    objc_msgSend(v5, "setRightButtonType:", 2);
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
  id v19;
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
  id v30;
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
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)HROnboardingAtrialFibrillationIntroViewController;
  -[HROnboardingAtrialFibrillationIntroViewController setUpUI](&v44, sel_setUpUI);
  -[HROnboardingAtrialFibrillationIntroViewController _createHeroView](self, "_createHeroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController setHeroView:](self, "setHeroView:", v3);

  -[HROnboardingAtrialFibrillationIntroViewController heroView](self, "heroView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController heroView](self, "heroView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationIntroViewController setTitleLabel:](self, "setTitleLabel:", v7);

  -[HROnboardingAtrialFibrillationIntroViewController titleString](self, "titleString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 1);

  -[HROnboardingAtrialFibrillationIntroViewController _titleFont](self, "_titleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationIntroViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("PageTitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", v15);

  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  v19 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationIntroViewController setBodyLabel:](self, "setBodyLabel:", v19);

  -[HROnboardingAtrialFibrillationIntroViewController bodyString](self, "bodyString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v20);

  -[HROnboardingAtrialFibrillationIntroViewController _bodyFont](self, "_bodyFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v22);

  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationIntroViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("Description"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityIdentifier:", v26);

  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v29);

  v30 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingAtrialFibrillationIntroViewController setFootnoteLabel:](self, "setFootnoteLabel:", v30);

  -[HROnboardingAtrialFibrillationIntroViewController footnoteString](self, "footnoteString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v31);

  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTextColor:", v34);

  -[HROnboardingAtrialFibrillationIntroViewController _footnoteFont](self, "_footnoteFont");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFont:", v36);

  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setNumberOfLines:", 0);

  -[HROnboardingAtrialFibrillationIntroViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("SetupLocation"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAccessibilityIdentifier:", v40);

  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSubview:", v43);

  -[HROnboardingAtrialFibrillationIntroViewController _setUpLearnMoreViews](self, "_setUpLearnMoreViews");
  -[HROnboardingAtrialFibrillationIntroViewController _setUpStackedButtonView](self, "_setUpStackedButtonView");
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
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)HROnboardingAtrialFibrillationIntroViewController;
  -[HROnboardingAtrialFibrillationIntroViewController setUpConstraints](&v35, sel_setUpConstraints);
  -[HROnboardingAtrialFibrillationIntroViewController heroView](self, "heroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  -[HROnboardingAtrialFibrillationIntroViewController heroView](self, "heroView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, 16.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v10, "hrui_alignHorizontalConstraintsWithView:insets:", v11);

  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstBaselineAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController heroView](self, "heroView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController _assetImageBottomToTitleFirstBaseline](self, "_assetImageBottomToTitleFirstBaseline");
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstBaselineAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastBaselineAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController _titleLastBaselineToBodyFirstBaseline](self, "_titleLastBaselineToBodyFirstBaseline");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:margin:", v25, 0.0);

  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "hk_alignHorizontalConstraintsWithView:margin:", v27, 0.0);

  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "alignBlurViewHorizontalConstraintsWithView:", v29);

  -[HROnboardingAtrialFibrillationIntroViewController _setUpLearnMoreConstraints](self, "_setUpLearnMoreConstraints");
  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

}

- (HKAnalyticsEventSubmissionManager)analyticsEventSubmissionManager
{
  void *v3;
  void *v4;
  HKAnalyticsEventSubmissionManager *analyticsEventSubmissionManager;
  BOOL v6;
  id v7;
  HKAnalyticsEventSubmissionManager *v8;
  HKAnalyticsEventSubmissionManager *v9;
  HKAnalyticsEventSubmissionManager *v10;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[HROnboardingAtrialFibrillationIntroViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
  if (analyticsEventSubmissionManager)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDD3918]);
    v8 = (HKAnalyticsEventSubmissionManager *)objc_msgSend(v7, "initWithLoggingCategory:healthDataSource:", *MEMORY[0x24BDD3010], v4);
    v9 = self->_analyticsEventSubmissionManager;
    self->_analyticsEventSubmissionManager = v8;

    analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
  }
  v10 = analyticsEventSubmissionManager;

  return v10;
}

- (void)_submitOnboardingUIErrorEventWithCountryCode:(id)a3 onboardingEligibility:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  HROnboardingAtrialFibrillationIntroViewController *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__HROnboardingAtrialFibrillationIntroViewController__submitOnboardingUIErrorEventWithCountryCode_onboardingEligibility___block_invoke;
  block[3] = &unk_24D34ABB0;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __120__HROnboardingAtrialFibrillationIntroViewController__submitOnboardingUIErrorEventWithCountryCode_onboardingEligibility___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;

  v2 = objc_alloc(MEMORY[0x24BE4A770]);
  v3 = *MEMORY[0x24BDD2E00];
  objc_msgSend(*(id *)(a1 + 32), "ISOCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFeatureIdentifier:featureVersion:countryCode:step:onboardingEligibility:", v3, CFSTR("1"), v4, CFSTR("Intro"), *(_QWORD *)(a1 + 40));

  v7 = *(void **)(a1 + 48);
  v6 = a1 + 48;
  objc_msgSend(v7, "analyticsEventSubmissionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v8, "submitEvent:error:", v5, &v12);
  v10 = v12;

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __120__HROnboardingAtrialFibrillationIntroViewController__submitOnboardingUIErrorEventWithCountryCode_onboardingEligibility___block_invoke_cold_1(v6, v11, (uint64_t)v10);
  }

}

- (id)_createHeroView
{
  id v2;
  void *v3;
  HRSimulatedAtrialFibrillationNotificationView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDF6F90]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v4 = objc_alloc_init(HRSimulatedAtrialFibrillationNotificationView);
  objc_msgSend(v3, "addSubview:", v4);
  -[HRSimulatedAtrialFibrillationNotificationView hk_alignVerticalConstraintsWithView:margin:](v4, "hk_alignVerticalConstraintsWithView:margin:", v3, 0.0);
  v5 = (void *)MEMORY[0x24BDD1628];
  -[HRSimulatedAtrialFibrillationNotificationView widthAnchor](v4, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 160.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  -[HRSimulatedAtrialFibrillationNotificationView centerXAnchor](v4, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateConstraints:", v11);

  return v3;
}

- (id)_createLearnMoreExpandedView
{
  return +[HROnboardingInlineExpandedContentView learnMoreAboutAtrialFibrillationExpandedView](HROnboardingInlineExpandedContentView, "learnMoreAboutAtrialFibrillationExpandedView");
}

- (void)_setUpLearnMoreViews
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
  double v19;
  void *v20;
  void *v21;
  id v22;

  -[HROnboardingAtrialFibrillationIntroViewController learnMoreString](self, "learnMoreString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationIntroViewController setLearnMoreButton:](self, "setLearnMoreButton:", v4);

    -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationIntroViewController learnMoreString](self, "learnMoreString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v6, 0);

    -[HROnboardingAtrialFibrillationIntroViewController _bodyFont](self, "_bodyFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v7);

    -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 0);

    -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_learnMoreButtonTapped_, 64);

    -[HROnboardingAtrialFibrillationIntroViewController axidForElementWithString:](self, "axidForElementWithString:", CFSTR("AFibLearnMoreLink"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessibilityIdentifier:", v14);

    -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 1148846080;
    objc_msgSend(v18, "setContentHuggingPriority:forAxis:", 0, v19);

    -[HROnboardingAtrialFibrillationIntroViewController _createLearnMoreExpandedView](self, "_createLearnMoreExpandedView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationIntroViewController setLearnMoreContentView:](self, "setLearnMoreContentView:", v20);

    -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[HROnboardingAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v21);

  }
}

- (void)_setUpLearnMoreConstraints
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
  _QWORD v55[5];
  _QWORD v56[7];

  v56[5] = *MEMORY[0x24BDAC8D0];
  -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v47);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v45;
  -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:", v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v35;
  -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController _titleLastBaselineToBodyFirstBaseline](self, "_titleLastBaselineToBodyFirstBaseline");
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v25;
  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstBaselineAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController _footnoteLeading](self, "_footnoteLeading");
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v5;
  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastBaselineAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController _viewLastBaselineToContinueButton](self, "_viewLastBaselineToContinueButton");
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController setLearnMoreCollapsedConstraints:](self, "setLearnMoreCollapsedConstraints:", v11);

  -[HROnboardingAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v48);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v46;
  -[HROnboardingAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v36;
  -[HROnboardingAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v26;
  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstBaselineAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController _footnoteLeading](self, "_footnoteLeading");
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v14;
  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController footnoteLabel](self, "footnoteLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastBaselineAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController _viewLastBaselineToContinueButton](self, "_viewLastBaselineToContinueButton");
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController setLearnMoreExpandedConstraints:](self, "setLearnMoreExpandedConstraints:", v20);

  -[HROnboardingAtrialFibrillationIntroViewController _updateViewsForContentExpansionState:](self, "_updateViewsForContentExpansionState:", 0);
}

- (void)_setUpStackedButtonView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[HROnboardingAtrialFibrillationIntroViewController buttonTitleString](self, "buttonTitleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:footerTextAlignment:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:footerTextAlignment:delegate:", v4, 0, 0, 4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController setStackedButtonView:](self, "setStackedButtonView:", v5);

  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBlurHidden:", 1);

  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFixedBottomButtonSpacing:", 1);

  -[HROnboardingAtrialFibrillationIntroViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

}

- (void)_setStackedButtonViewAsFooterView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HROnboardingAtrialFibrillationIntroViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 0);

  -[HROnboardingAtrialFibrillationIntroViewController stackedButtonView](self, "stackedButtonView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alignBlurViewHorizontalConstraintsWithView:", v5);

}

- (void)_updateViewsForContentExpansionState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[HROnboardingAtrialFibrillationIntroViewController learnMoreButton](self, "learnMoreButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setHidden:", 1);

    -[HROnboardingAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    v8 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingAtrialFibrillationIntroViewController learnMoreCollapsedConstraints](self, "learnMoreCollapsedConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deactivateConstraints:", v9);

    v10 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingAtrialFibrillationIntroViewController learnMoreExpandedConstraints](self, "learnMoreExpandedConstraints");
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0);

    -[HROnboardingAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    v12 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingAtrialFibrillationIntroViewController learnMoreExpandedConstraints](self, "learnMoreExpandedConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deactivateConstraints:", v13);

    v10 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingAtrialFibrillationIntroViewController learnMoreCollapsedConstraints](self, "learnMoreCollapsedConstraints");
  }
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:");

}

- (void)learnMoreButtonTapped:(id)a3
{
  -[HROnboardingAtrialFibrillationIntroViewController _updateViewsForContentExpansionState:](self, "_updateViewsForContentExpansionState:", 1);
}

- (void)_presentFeatureAlertWithMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, a3, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDF67E8];
  -[HROnboardingAtrialFibrillationIntroViewController locationFeatureAlertAckButtonString](self, "locationFeatureAlertAckButtonString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v6);

  -[HROnboardingAtrialFibrillationIntroViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HROnboardingAtrialFibrillationIntroViewController *v13;
  SEL v14;
  uint64_t v15;
  uint64_t v16;

  if (!a4)
  {
    v15 = v4;
    v16 = v5;
    objc_msgSend(a3, "buttons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setEnabled:", 0);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke;
    v11[3] = &unk_24D34AC00;
    v12 = v9;
    v13 = self;
    v14 = a2;
    v10 = v9;
    -[HROnboardingAtrialFibrillationIntroViewController _isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch:](self, "_isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch:", v11);

  }
}

void __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a2;
  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2;
  v12[3] = &unk_24D34ABD8;
  v13 = *(id *)(a1 + 32);
  v14 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = v8;
  v17 = a3;
  v18 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    if ((v2 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "_presentLocationNotFoundAlert");
      return;
    }
    if ((v2 & 2) != 0 || (v2 & 4) != 0 || (v2 & 8) != 0 || (v2 & 0x20) != 0 || (v2 & 0x10) != 0)
    {
      v3 = *(void **)(a1 + 48);
      objc_msgSend(v3, "locationFeatureIneligiblePromptBodyString");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if ((v2 & 0x40) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "presentLearnMoreAlertWithFeatureDisabledMessage");
      return;
    }
    if ((v2 & 0x80) != 0)
    {
      v3 = *(void **)(a1 + 48);
      objc_msgSend(v3, "seedExpiredBodyString");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v13 = (id)v4;
      objc_msgSend(v3, "presentAlertWithMessage:", v4);
      goto LABEL_16;
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("HROnboardingAtrialFibrillationCountryCodeKey"));

      objc_msgSend(*(id *)(a1 + 48), "delegate");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stepForward");
LABEL_16:

      return;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 56), "hk_isHealthKitErrorWithCode:", 111))
  {
    objc_msgSend(*(id *)(a1 + 48), "presentLearnMoreAlertWithFeatureDisabledMessage");
    goto LABEL_25;
  }
  if (objc_msgSend(*(id *)(a1 + 56), "hk_isHealthKitErrorWithCode:", 109))
  {
    v8 = *(void **)(a1 + 48);
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 56), "hk_isHealthKitErrorWithCode:", 113);
    v10 = *(void **)(a1 + 48);
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 48), "watchOSVersionTooLowBodyString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentAlertWithMessage:", v11);

      goto LABEL_25;
    }
    v8 = *(void **)(a1 + 48);
  }
  objc_msgSend(v8, "_presentLocationNotFoundAlert");
LABEL_25:
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
    __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2_cold_1(a1, v12, (uint64_t *)(a1 + 56));
}

- (void)_isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  HKPreferredRegulatoryDomainProvider();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __134__HROnboardingAtrialFibrillationIntroViewController__isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch___block_invoke;
  v8[3] = &unk_24D34AC28;
  v8[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  objc_msgSend(v6, "fetchMobileCountryCodeFromCellularWithCompletion:", v8);

}

void __134__HROnboardingAtrialFibrillationIntroViewController__isAtrialFibrillationDetectionOnboardingAvailableInCurrentLocationForActiveWatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, id, uint64_t, _QWORD);
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v9 = *MEMORY[0x24BDD2E00];
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "healthStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithFeatureIdentifier:healthStore:", v9, v11);

    objc_msgSend(v5, "ISOCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v12, "onboardingEligibilityForCountryCode:error:", v13, &v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v35;

    objc_msgSend(*(id *)(a1 + 32), "_submitOnboardingUIErrorEventWithCountryCode:onboardingEligibility:", v5, v14);
    if (v14)
    {
      if (objc_msgSend(v14, "isEligible"))
      {
        v16 = *(_QWORD *)(a1 + 40);
        v17 = objc_msgSend(v14, "ineligibilityReasons");
        v18 = *(void (**)(uint64_t, id, uint64_t, _QWORD))(v16 + 16);
        v19 = v16;
        v20 = v5;
      }
      else
      {
        _HKInitializeLogging();
        v23 = (void *)*MEMORY[0x24BDD3010];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
        {
          v30 = *(_QWORD *)(a1 + 32);
          v31 = *(const char **)(a1 + 48);
          v32 = v23;
          NSStringFromSelector(v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "ineligibilityReasonsDescription");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v37 = v30;
          v38 = 2114;
          v39 = v33;
          v40 = 2114;
          v41 = v34;
          _os_log_error_impl(&dword_215454000, v32, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Not eligible for onboarding: %{public}@", buf, 0x20u);

        }
        v24 = *(_QWORD *)(a1 + 40);
        v17 = objc_msgSend(v14, "ineligibilityReasons");
        v18 = *(void (**)(uint64_t, id, uint64_t, _QWORD))(v24 + 16);
        v19 = v24;
        v20 = 0;
      }
      v18(v19, v20, v17, 0);
    }
    else
    {
      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x24BDD3010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(const char **)(a1 + 48);
        v28 = v21;
        NSStringFromSelector(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v26;
        v38 = 2114;
        v39 = v29;
        v40 = 2114;
        v41 = v15;
        _os_log_error_impl(&dword_215454000, v28, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Could not determine onboarding eligibility: %{public}@", buf, 0x20u);

      }
      v22 = *(_QWORD *)(a1 + 40);
      if (v15)
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v22 + 16))(v22, 0, 0, v15);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 110, CFSTR("Feature eligibility could not be determined"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v22 + 16))(v22, 0, 0, v25);

      }
    }

  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 109, CFSTR("Unable to determine location"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "_submitOnboardingUIErrorEventWithCountryCode:onboardingEligibility:", 0, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)presentLearnMoreAlertWithFeatureDisabledMessage
{
  id v3;

  -[HROnboardingAtrialFibrillationIntroViewController featureDisabledBodyString](self, "featureDisabledBodyString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController presentLearnMoreAlertWithMessage:learnMoreTapped:](self, "presentLearnMoreAlertWithMessage:learnMoreTapped:", v3, &__block_literal_global_1);

}

void __100__HROnboardingAtrialFibrillationIntroViewController_presentLearnMoreAlertWithFeatureDisabledMessage__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BDD2810]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openURL:withOptions:", v1, 0);

}

- (void)_presentLocationNotFoundAlert
{
  void *v3;
  id v4;

  -[HROnboardingAtrialFibrillationIntroViewController locationNotFoundPromptMessageString](self, "locationNotFoundPromptMessageString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController locationNotFoundPromptTitleString](self, "locationNotFoundPromptTitleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingAtrialFibrillationIntroViewController presentAlertWithMessage:title:](self, "presentAlertWithMessage:title:", v4, v3);

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
  -[HROnboardingAtrialFibrillationIntroViewController _titleFontTextStyle](self, "_titleFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_assetImageBottomToTitleFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationIntroViewController _titleFont](self, "_titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 54.0);
  v4 = v3;

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
  -[HROnboardingAtrialFibrillationIntroViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
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

  -[HROnboardingAtrialFibrillationIntroViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 32.0);
  v4 = v3;

  return v4;
}

- (double)_learnMoreContentViewLastBaselineToContinueButton
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationIntroViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 16.0);
  v4 = v3;

  return v4;
}

- (double)_viewLastBaselineToContinueButton
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationIntroViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 6.0);
  v4 = v3;

  return v4;
}

- (id)_footnoteTextStyle
{
  return (id)*MEMORY[0x24BDF77D0];
}

- (id)_footnoteFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingAtrialFibrillationIntroViewController _footnoteTextStyle](self, "_footnoteTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_footnoteLeading
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingAtrialFibrillationIntroViewController _footnoteFont](self, "_footnoteFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 40.0);
  v4 = v3;

  return v4;
}

- (id)titleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)learnMoreString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_LEARN_MORE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footnoteString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_LOCATION_FOOTNOTE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buttonTitleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationNotFoundPromptTitleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_ALERT_LOCATION_UNAVAILABLE_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationNotFoundPromptMessageString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_ALERT_LOCATION_UNAVAILABLE_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationFeatureAlertAckButtonString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_OK"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationFeatureIneligiblePromptBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_LOCATION_INELIGIBLE_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)featureDisabledBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_FEATURE_DISABLED_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)watchOSVersionTooLowBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_OS_VERSION_TOO_LOW"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)seedExpiredBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SEED_EXPIRED"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axidForElementWithString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Onboarding.%@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSNumber)activeWatchNeedsLocationCheck
{
  return self->_activeWatchNeedsLocationCheck;
}

- (void)setActiveWatchNeedsLocationCheck:(id)a3
{
  objc_storeStrong((id *)&self->_activeWatchNeedsLocationCheck, a3);
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

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (BOOL)learnMoreContentExpanded
{
  return self->_learnMoreContentExpanded;
}

- (void)setLearnMoreContentExpanded:(BOOL)a3
{
  self->_learnMoreContentExpanded = a3;
}

- (UIView)learnMoreContentView
{
  return self->_learnMoreContentView;
}

- (void)setLearnMoreContentView:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreContentView, a3);
}

- (NSArray)learnMoreCollapsedConstraints
{
  return self->_learnMoreCollapsedConstraints;
}

- (void)setLearnMoreCollapsedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreCollapsedConstraints, a3);
}

- (NSArray)learnMoreExpandedConstraints
{
  return self->_learnMoreExpandedConstraints;
}

- (void)setLearnMoreExpandedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreExpandedConstraints, a3);
}

- (void)setAnalyticsEventSubmissionManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_learnMoreExpandedConstraints, 0);
  objc_storeStrong((id *)&self->_learnMoreCollapsedConstraints, 0);
  objc_storeStrong((id *)&self->_learnMoreContentView, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_activeWatchNeedsLocationCheck, 0);
}

void __120__HROnboardingAtrialFibrillationIntroViewController__submitOnboardingUIErrorEventWithCountryCode_onboardingEligibility___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_215454000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error submitting onboarding errors analytics event: %{public}@", (uint8_t *)&v6, 0x16u);

}

void __91__HROnboardingAtrialFibrillationIntroViewController_stackedButtonView_didTapButtonAtIndex___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(const char **)(a1 + 72);
  v6 = a2;
  NSStringFromSelector(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  v9 = 138543874;
  v10 = v4;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_215454000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Unexpectedly received an location check error: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
