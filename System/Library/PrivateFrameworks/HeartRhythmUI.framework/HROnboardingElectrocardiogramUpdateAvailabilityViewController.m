@implementation HROnboardingElectrocardiogramUpdateAvailabilityViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL4 v4;
  _QWORD *v5;
  _QWORD *v6;
  HRElectrocardiogramWatchAppInstallability *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HROnboardingElectrocardiogramUpdateAvailabilityViewController;
  v5 = -[HROnboardingElectrocardiogramUpdateAvailabilityViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v10, sel_initForOnboarding_upgradingFromAlgorithmVersion_, a3, a4);
  v6 = v5;
  if (v5)
  {
    if (v4)
      objc_msgSend(v5, "setRightButtonType:", 2);
    v7 = objc_alloc_init(HRElectrocardiogramWatchAppInstallability);
    v8 = (void *)v6[134];
    v6[134] = v7;

  }
  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HROnboardingElectrocardiogramUpdateAvailabilityViewController;
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HROnboardingElectrocardiogramUpdateAvailabilityViewController markElectrocardiogramUpdateAsViewed:](HROnboardingElectrocardiogramUpdateAvailabilityViewController, "markElectrocardiogramUpdateAsViewed:", v5);

}

- (void)setUpUI
{
  HROnboardingWristImageView *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  objc_super v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)HROnboardingElectrocardiogramUpdateAvailabilityViewController;
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController setUpUI](&v32, sel_setUpUI);
  v3 = -[HROnboardingWristImageView initWithImageStyle:]([HROnboardingWristImageView alloc], "initWithImageStyle:", 1);
  -[HROnboardingWristImageView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HROnboardingWristImageView setContentMode:](v3, "setContentMode:", 1);
  -[HROnboardingWristImageView setTimeRemaining:](v3, "setTimeRemaining:", 26.0);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController setHeroView:](self, "setHeroView:", v3);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController heroView](self, "heroView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  v6 = objc_alloc(MEMORY[0x24BDF6B68]);
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v11 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], v8, v9, v10);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController titleString](self, "titleString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(v11, "setTextAlignment:", 1);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _titleFont](self, "_titleFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v13);

  objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "setNumberOfLines:", 0);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController setTitleLabel:](self, "setTitleLabel:", v11);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v7, v8, v9, v10);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController bodyString](self, "bodyString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v17);

  objc_msgSend(v16, "setTextAlignment:", 1);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _bodyFont](self, "_bodyFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v18);

  objc_msgSend(v16, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setNumberOfLines:", 0);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController setBodyLabel:](self, "setBodyLabel:", v16);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController bodyLabel](self, "bodyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v7, v8, v9, v10);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController locationFooterString](self, "locationFooterString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v22);

  objc_msgSend(v21, "setTextAlignment:", 1);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _footnoteFont](self, "_footnoteFont");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v23);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextColor:", v24);

  objc_msgSend(v21, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v21, "setNumberOfLines:", 0);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController setLocationFooterLabel:](self, "setLocationFooterLabel:", v21);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController buttonTitleString](self, "buttonTitleString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v28, 0, 0, self);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setFixedBottomButtonSpacing:", 1);
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v29, "setBlurHidden:", 1);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController setStackedButtonView:](self, "setStackedButtonView:", v29);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

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
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)HROnboardingElectrocardiogramUpdateAvailabilityViewController;
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController setUpConstraints](&v45, sel_setUpConstraints);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController heroView](self, "heroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController heroView](self, "heroView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v10, "hrui_alignHorizontalConstraintsWithView:insets:", v11);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController heroView](self, "heroView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 29.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController bodyLabel](self, "bodyLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController bodyLabel](self, "bodyLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _titleBottomToBodyTop](self, "_titleBottomToBodyTop");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:insets:", v25, *MEMORY[0x24BDF65E8], *(double *)(MEMORY[0x24BDF65E8] + 8), *(double *)(MEMORY[0x24BDF65E8] + 16), *(double *)(MEMORY[0x24BDF65E8] + 24));

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController bodyLabel](self, "bodyLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _bodyBottomToLocationTop](self, "_bodyBottomToLocationTop");
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController titleLabel](self, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController locationFooterLabel](self, "locationFooterLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "lastBaselineAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _locationFooterLastBaselineToContinueButton](self, "_locationFooterLastBaselineToContinueButton");
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "alignBlurViewHorizontalConstraintsWithView:", v39);

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController stackedButtonView](self, "stackedButtonView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

}

+ (void)markElectrocardiogramUpdateAsViewed:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  SEL v13;

  v5 = (void *)MEMORY[0x24BDBCE60];
  v6 = a3;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3C98], "safetyDefaultsDomainWithHealthStore:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __101__HROnboardingElectrocardiogramUpdateAvailabilityViewController_markElectrocardiogramUpdateAsViewed___block_invoke;
  v10[3] = &unk_24D34AD68;
  v12 = a1;
  v13 = a2;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "setDate:forKey:completion:", v9, CFSTR("ElectrocardiogramUpdateDateViewed"), v10);

}

void __101__HROnboardingElectrocardiogramUpdateAvailabilityViewController_markElectrocardiogramUpdateAsViewed___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _BOOL4 v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3010];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v8 = a1[5];
      v7 = (const char *)a1[6];
      v9 = v5;
      NSStringFromSelector(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v8;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_215454000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] Could not set viewed date: %{public}@", (uint8_t *)&v15, 0x20u);

LABEL_6:
    }
  }
  else if (v6)
  {
    v12 = a1[5];
    v11 = (const char *)a1[6];
    v9 = v5;
    NSStringFromSelector(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)a1[4];
    v15 = 138543874;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_215454000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] Successfully set viewed date to %{public}@", (uint8_t *)&v15, 0x20u);

    goto LABEL_6;
  }

}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  void *v5;
  id v6;

  if (!a4)
  {
    objc_msgSend(a3, "buttons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[HROnboardingElectrocardiogramUpdateAvailabilityViewController continueAndCheckForUpdateAvailability:](self, "continueAndCheckForUpdateAvailability:", v6);
  }
}

- (void)continueAndCheckForUpdateAvailability:(id)a3
{
  id v5;
  void *v6;
  HRElectrocardiogramCurrentLocationOnboardingDeterminer *v7;
  void *v8;
  void *v9;
  HRElectrocardiogramCurrentLocationOnboardingDeterminer *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HROnboardingElectrocardiogramUpdateAvailabilityViewController *v15;
  SEL v16;

  v5 = a3;
  objc_msgSend(v5, "setEnabled:", 0);
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController onboardingAvailabilityDeterminer](self, "onboardingAvailabilityDeterminer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [HRElectrocardiogramCurrentLocationOnboardingDeterminer alloc];
    -[HROnboardingElectrocardiogramUpdateAvailabilityViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "healthStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HRElectrocardiogramCurrentLocationOnboardingDeterminer initWithHealthStore:](v7, "initWithHealthStore:", v9);
    -[HROnboardingElectrocardiogramUpdateAvailabilityViewController setOnboardingAvailabilityDeterminer:](self, "setOnboardingAvailabilityDeterminer:", v10);

  }
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController onboardingAvailabilityDeterminer](self, "onboardingAvailabilityDeterminer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke;
  v13[3] = &unk_24D34AA88;
  v14 = v5;
  v15 = self;
  v16 = a2;
  v12 = v5;
  objc_msgSend(v11, "isElectrocardiogramOnboardingAvailableInCurrentLocationForActiveWatch:", v13);

}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_2;
  v14[3] = &unk_24D34AA60;
  v15 = *(id *)(a1 + 32);
  v16 = v9;
  v10 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = v8;
  v19 = v7;
  v20 = v10;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  v3 = (id *)(a1 + 40);
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    if (objc_msgSend(v2, "code") == 111)
    {
      v4 = *(void **)(a1 + 48);
      objc_msgSend(v4, "featureDisabledBodyString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentLearnMoreAlertWithMessage:learnMoreTapped:", v5, &__block_literal_global_3);
    }
    else if (objc_msgSend(*v3, "code") == 109)
    {
      v16 = *(void **)(a1 + 48);
      objc_msgSend(v16, "locationNotFoundPromptBodyString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "locationNotFoundPromptTitleString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentAlertWithMessage:title:", v5, v17);

    }
    else
    {
      if (objc_msgSend(*v3, "code") == 113)
      {
        v20 = *(void **)(a1 + 48);
        objc_msgSend(v20, "watchOSVersionTooLowBodyString");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = objc_msgSend(*(id *)(a1 + 40), "code");
        v20 = *(void **)(a1 + 48);
        if (v22 == 112)
          objc_msgSend(*(id *)(a1 + 48), "deviceNotSupportedBodyString");
        else
          objc_msgSend(*(id *)(a1 + 48), "locationFeatureIneligiblePromptBodyString");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v5 = (void *)v21;
      objc_msgSend(v20, "presentAlertWithMessage:", v21);
    }

    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_2_cold_1(a1, v23, (uint64_t *)(a1 + 40));
  }
  else
  {
    v6 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "upgradingFromAlgorithmVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "isEqualToNumber:", v7);

    v8 = *(void **)(a1 + 48);
    if ((_DWORD)v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "updateFeatureIneligiblePromptBodyString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentAlertWithMessage:", v9);

      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x24BDD3010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 48);
        v12 = *(const char **)(a1 + 72);
        v13 = v10;
        NSStringFromSelector(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v28 = v11;
        v29 = 2114;
        v30 = v14;
        v31 = 2114;
        v32 = v15;
        _os_log_error_impl(&dword_215454000, v13, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] No update available, Error: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "ecgAppInstallability");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 48);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_203;
      v24[3] = &unk_24D34AA38;
      v24[4] = v19;
      v25 = *(id *)(a1 + 64);
      v26 = *(id *)(a1 + 56);
      objc_msgSend(v18, "checkElectrocardiogramAppInstallStateWithContext:completion:", v19, v24);

    }
  }
}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BDD2BD8]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openURL:withOptions:", v1, 0);

}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_203(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x24BDD3010];
    v15 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v15)
        goto LABEL_9;
      v19 = 136446466;
      v20 = "-[HROnboardingElectrocardiogramUpdateAvailabilityViewController continueAndCheckForUpdateAvailability:]_block_invoke";
      v21 = 2114;
      v22 = v5;
      v16 = "[%{public}s]: Failed to install ECG App with error: %{public}@";
      v17 = v14;
      v18 = 22;
    }
    else
    {
      if (!v15)
        goto LABEL_9;
      v19 = 136446210;
      v20 = "-[HROnboardingElectrocardiogramUpdateAvailabilityViewController continueAndCheckForUpdateAvailability:]_block_invoke";
      v16 = "[%{public}s]: ECG App install was cancelled";
      v17 = v14;
      v18 = 12;
    }
    _os_log_impl(&dword_215454000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    goto LABEL_9;
  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("HROnboardingElectrocardiogramCountryCodeKey"));

  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("HROnboardingElectrocardiogramAlgorithmVersionKey"));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stepForward");

  objc_msgSend(*(id *)(a1 + 32), "ecgAppInstallability");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowInstallingElectrocardiogramWatchApp:", 1);

LABEL_9:
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
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _titleFontTextStyle](self, "_titleFontTextStyle");
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
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _footnoteTextStyle](self, "_footnoteTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_titleBottomToBodyTop
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 15.0);
  v4 = v3;

  return v4;
}

- (double)_bodyBottomToLocationTop
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 37.0);
  v4 = v3;

  return v4;
}

- (double)_locationFooterLastBaselineToContinueButton
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramUpdateAvailabilityViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 6.0);
  v4 = v3;

  return v4;
}

- (id)titleString
{
  return HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_UPDATE_SECTION_1_TITLE"));
}

- (id)bodyString
{
  return HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_UPDATE_SECTION_1_BODY"));
}

- (id)locationFooterString
{
  return HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_UPDATE_LOCATION_FOOTNOTE"));
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

- (id)locationFeatureIneligiblePromptBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_LOCATION_INELIGIBLE_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationNotFoundPromptTitleString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_LOCATION_NOT_FOUND_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationNotFoundPromptBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_LOCATION_NOT_FOUND_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)updateFeatureIneligiblePromptBodyString
{
  return HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_1_UPDATE_INELIGIBLE_BODY"));
}

- (id)featureDisabledBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_FEATURE_DISABLED_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)deviceNotSupportedBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_DEVICE_NOT_SUPPORTED_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)watchOSVersionTooLowBodyString
{
  void *v2;
  void *v3;

  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ECG_ONBOARDING_1_OS_VERSION_TOO_LOW"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HRElectrocardiogramCurrentLocationOnboardingDeterminer)onboardingAvailabilityDeterminer
{
  return self->_onboardingAvailabilityDeterminer;
}

- (void)setOnboardingAvailabilityDeterminer:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingAvailabilityDeterminer, a3);
}

- (HRElectrocardiogramWatchAppInstallability)ecgAppInstallability
{
  return self->_ecgAppInstallability;
}

- (void)setEcgAppInstallability:(id)a3
{
  objc_storeStrong((id *)&self->_ecgAppInstallability, a3);
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

- (UILabel)locationFooterLabel
{
  return self->_locationFooterLabel;
}

- (void)setLocationFooterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationFooterLabel, a3);
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_stackedButtonView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_locationFooterLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_ecgAppInstallability, 0);
  objc_storeStrong((id *)&self->_onboardingAvailabilityDeterminer, 0);
}

void __103__HROnboardingElectrocardiogramUpdateAvailabilityViewController_continueAndCheckForUpdateAvailability___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t *a3)
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
  _os_log_error_impl(&dword_215454000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Could not pass location check, Error: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
