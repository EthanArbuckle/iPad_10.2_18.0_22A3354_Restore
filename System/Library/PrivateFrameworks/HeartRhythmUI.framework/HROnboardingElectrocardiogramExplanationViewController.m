@implementation HROnboardingElectrocardiogramExplanationViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  v5 = -[HROnboardingElectrocardiogramExplanationViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v9, sel_initForOnboarding_upgradingFromAlgorithmVersion_, a3, a4);
  v6 = v5;
  if (v5)
    v7 = !v4;
  else
    v7 = 1;
  if (!v7)
    objc_msgSend(v5, "configureNavigationButtonWithTypeCancelWithConfirmForElectrocardiogram");
  return v6;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  -[HROnboardingElectrocardiogramExplanationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HROnboardingElectrocardiogramExplanationViewController _setUpButtonFooterView](self, "_setUpButtonFooterView");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  -[HROnboardingElectrocardiogramExplanationViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HROnboardingElectrocardiogramExplanationViewController _adjustButtonFooterViewLocationForViewContentHeight](self, "_adjustButtonFooterViewLocationForViewContentHeight");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  -[HROnboardingElectrocardiogramExplanationViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategory:error:", *MEMORY[0x24BDB1598], 0);

  -[HROnboardingElectrocardiogramExplanationViewController animatedWatchRhythmVideoView](self, "animatedWatchRhythmVideoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "play");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  -[HROnboardingElectrocardiogramExplanationViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[HROnboardingElectrocardiogramExplanationViewController animatedWatchRhythmVideoView](self, "animatedWatchRhythmVideoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

}

- (void)setUpUI
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
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
  objc_super v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  -[HROnboardingElectrocardiogramExplanationViewController setUpUI](&v43, sel_setUpUI);
  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramExplanationViewController setTitleLabel:](self, "setTitleLabel:", v3);

  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_2_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("Onboarding.PageTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", 1);

  -[HROnboardingElectrocardiogramExplanationViewController titleFont](self, "titleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramExplanationViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  v16 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "hrui_explanationVideoPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileURLWithPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[HRVideoPlayerView playerViewWithURL:looping:](HRVideoPlayerView, "playerViewWithURL:looping:", v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController setAnimatedWatchRhythmVideoView:](self, "setAnimatedWatchRhythmVideoView:", v19);

  -[HROnboardingElectrocardiogramExplanationViewController animatedWatchRhythmVideoView](self, "animatedWatchRhythmVideoView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hrui_maskAllCornersWithRadius:", *MEMORY[0x24BE4A250]);

  -[HROnboardingElectrocardiogramExplanationViewController contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController animatedWatchRhythmVideoView](self, "animatedWatchRhythmVideoView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  v23 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramExplanationViewController setBodyLabel:](self, "setBodyLabel:", v23);

  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_2_BODY"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v24);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("Onboarding.HowECGWorks"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityIdentifier:", v26);

  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextAlignment:", 1);

  -[HROnboardingElectrocardiogramExplanationViewController _bodyFont](self, "_bodyFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFont:", v29);

  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramExplanationViewController contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v35);

  if (-[HROnboardingElectrocardiogramExplanationViewController isOnboarding](self, "isOnboarding"))
  {
    HRHeartRhythmUIFrameworkBundle();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v38, 0, 0, self);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramExplanationViewController setStackedButtonView:](self, "setStackedButtonView:", v39);

    -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setBlurHidden:", 0);

    -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFixedBottomButtonSpacing:", 1);

    -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

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
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)HROnboardingElectrocardiogramExplanationViewController;
  -[HROnboardingElectrocardiogramExplanationViewController setUpConstraints](&v30, sel_setUpConstraints);
  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController contentTop](self, "contentTop");
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HROnboardingElectrocardiogramExplanationViewController animatedWatchRhythmVideoView](self, "animatedWatchRhythmVideoView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_alignHorizontalConstraintsWithView:margin:", v11, 0.0);

  -[HROnboardingElectrocardiogramExplanationViewController animatedWatchRhythmVideoView](self, "animatedWatchRhythmVideoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController _titleBottomToVideoViewTop](self, "_titleBottomToVideoViewTop");
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstBaselineAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController animatedWatchRhythmVideoView](self, "animatedWatchRhythmVideoView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController _videoViewBottomToBodyFirstBaseline](self, "_videoViewBottomToBodyFirstBaseline");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HROnboardingElectrocardiogramExplanationViewController contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, *MEMORY[0x24BE4A138]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramExplanationViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v28);

  -[HROnboardingElectrocardiogramExplanationViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v4;

  if (!a4)
  {
    -[HROnboardingElectrocardiogramExplanationViewController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stepForward");

  }
}

- (void)_setUpButtonFooterView
{
  void *v3;
  void *v4;
  id v5;

  if (-[HROnboardingElectrocardiogramExplanationViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthUIBuddyDirectionalEdgeInsets();
    -[HROnboardingElectrocardiogramExplanationViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

    -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramExplanationViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alignBlurViewHorizontalConstraintsWithView:", v4);

  }
}

- (void)_adjustButtonFooterViewLocationForViewContentHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
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
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  if (-[HROnboardingElectrocardiogramExplanationViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingElectrocardiogramExplanationViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    -[HROnboardingElectrocardiogramExplanationViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buttons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertRect:fromView:", v16, v9, v11, v13, v15);
    v18 = v17;

    -[HROnboardingElectrocardiogramExplanationViewController contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;
    -[HROnboardingElectrocardiogramExplanationViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safeAreaInsets");
    v24 = v18 - v23;

    if (v21 > v24)
    {
      -[HROnboardingElectrocardiogramExplanationViewController removeFooterView](self, "removeFooterView");
      -[HROnboardingElectrocardiogramExplanationViewController contentView](self, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSubview:", v26);

      -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBlurHidden:", 1);

      -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramExplanationViewController titleLabel](self, "titleLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v29, 0.0);

      -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramExplanationViewController bodyLabel](self, "bodyLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, *MEMORY[0x24BE4A258]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setActive:", 1);

      v35 = (void *)MEMORY[0x24BDD1628];
      -[HROnboardingElectrocardiogramExplanationViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "deactivateConstraints:", v37);

      -[HROnboardingElectrocardiogramExplanationViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
      -[HROnboardingElectrocardiogramExplanationViewController contentView](self, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramExplanationViewController stackedButtonView](self, "stackedButtonView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingElectrocardiogramExplanationViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v42);

      -[HROnboardingElectrocardiogramExplanationViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setActive:", 1);

    }
  }
}

- (double)_titleBottomToVideoViewTop
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramExplanationViewController titleFont](self, "titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 37.0);
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
  -[HROnboardingElectrocardiogramExplanationViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_videoViewBottomToBodyFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramExplanationViewController _bodyFont](self, "_bodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 30.0);
  v4 = v3;

  return v4;
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
  v10 = __94__HROnboardingElectrocardiogramExplanationViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D34A7B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HROnboardingElectrocardiogramExplanationViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __94__HROnboardingElectrocardiogramExplanationViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HROnboardingElectrocardiogramExplanationViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (HRVideoPlayerView)animatedWatchRhythmVideoView
{
  return self->_animatedWatchRhythmVideoView;
}

- (void)setAnimatedWatchRhythmVideoView:(id)a3
{
  objc_storeStrong((id *)&self->_animatedWatchRhythmVideoView, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_animatedWatchRhythmVideoView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
