@implementation HROnboardingECG2PossibleResultsViewController

- (HROnboardingECG2PossibleResultsViewController)initWithSample:(id)a3
{
  id v5;
  uint64_t v6;
  HROnboardingECG2PossibleResultsViewController *v7;

  v5 = a3;
  v6 = -[HROnboardingECG2PossibleResultsViewController initForOnboarding:](self, "initForOnboarding:", 0);
  v7 = (HROnboardingECG2PossibleResultsViewController *)v6;
  if (v6)
    objc_storeStrong((id *)(v6 + 1064), a3);

  return v7;
}

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  v5 = -[HROnboardingECG2PossibleResultsViewController initForOnboarding:upgradingFromAlgorithmVersion:](&v9, sel_initForOnboarding_upgradingFromAlgorithmVersion_, a3, a4);
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
  v3.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  -[HROnboardingECG2PossibleResultsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HROnboardingECG2PossibleResultsViewController _setStackedButtonViewAsFooterView](self, "_setStackedButtonViewAsFooterView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  -[HROnboardingECG2PossibleResultsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HROnboardingECG2PossibleResultsViewController _playResultViewVideos](self, "_playResultViewVideos");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  -[HROnboardingECG2PossibleResultsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[HROnboardingECG2PossibleResultsViewController _pauseResultViewVideos](self, "_pauseResultViewVideos");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  -[HROnboardingECG2PossibleResultsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HROnboardingECG2PossibleResultsViewController _adjustStackedButtonViewLocationForViewContentHeight](self, "_adjustStackedButtonViewLocationForViewContentHeight");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  -[HROnboardingECG2PossibleResultsViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HROnboardingECG2PossibleResultsViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HROnboardingECG2PossibleResultsViewController _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)setUpUI
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  -[HROnboardingECG2PossibleResultsViewController setUpUI](&v11, sel_setUpUI);
  if ((-[HROnboardingECG2PossibleResultsViewController isOnboarding](self, "isOnboarding") & 1) != 0
    || (-[HROnboardingECG2PossibleResultsViewController electrocardiogram](self, "electrocardiogram"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[HROnboardingECG2PossibleResultsViewController _setUpTitle](self, "_setUpTitle");
    -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastBaselineAnchor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  -[HROnboardingECG2PossibleResultsViewController setViewTopAnchor:](self, "setViewTopAnchor:", v5);

  -[HROnboardingECG2PossibleResultsViewController electrocardiogram](self, "electrocardiogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HROnboardingECG2PossibleResultsViewController _setUpOnlyResultView](self, "_setUpOnlyResultView");
    -[HROnboardingECG2PossibleResultsViewController onlyResultView](self, "onlyResultView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingECG2PossibleResultsViewController setTitle:](self, "setTitle:", v9);

  }
  else
  {
    -[HROnboardingECG2PossibleResultsViewController _setUpAllResultViews](self, "_setUpAllResultViews");
  }
  if (-[HROnboardingECG2PossibleResultsViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingECG2PossibleResultsViewController _setUpStackedButtonView](self, "_setUpStackedButtonView");
  }
  else
  {
    -[HROnboardingECG2PossibleResultsViewController electrocardiogram](self, "electrocardiogram");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[HROnboardingECG2PossibleResultsViewController _setUpDisclaimerLabel](self, "_setUpDisclaimerLabel");
  }
}

- (void)setUpConstraints
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HROnboardingECG2PossibleResultsViewController;
  -[HROnboardingECG2PossibleResultsViewController setUpConstraints](&v5, sel_setUpConstraints);
  if ((-[HROnboardingECG2PossibleResultsViewController isOnboarding](self, "isOnboarding") & 1) != 0
    || (-[HROnboardingECG2PossibleResultsViewController electrocardiogram](self, "electrocardiogram"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[HROnboardingECG2PossibleResultsViewController _setUpTitleConstraints](self, "_setUpTitleConstraints");
  }
  -[HROnboardingECG2PossibleResultsViewController electrocardiogram](self, "electrocardiogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[HROnboardingECG2PossibleResultsViewController _setUpOnlyResultViewConstraints](self, "_setUpOnlyResultViewConstraints");
  else
    -[HROnboardingECG2PossibleResultsViewController _setUpAllResultViewConstraints](self, "_setUpAllResultViewConstraints");
  -[HROnboardingECG2PossibleResultsViewController _setUpBottomResultViewConstraint](self, "_setUpBottomResultViewConstraint");
}

- (void)_updateForCurrentSizeCategory
{
  id v3;

  -[HROnboardingECG2PossibleResultsViewController _adjustDisclaimerLabelConstraints](self, "_adjustDisclaimerLabelConstraints");
  -[HROnboardingECG2PossibleResultsViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)linkTextView:(id)a3 didTapOnLinkInRange:(_NSRange)a4
{
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hk_hfeModeEnabled");

  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(v9, "URLIdentifier");
    if ((unint64_t)(v6 - 1) < 2)
    {
      NSURLFromHRLinkTextViewURLIdentifier(objc_msgSend(v9, "URLIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:withOptions:", v7, 0);

      goto LABEL_7;
    }
    if (v6)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v4;

  if (!a4)
  {
    -[HROnboardingECG2PossibleResultsViewController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stepForward");

  }
}

- (void)_setUpTitle
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
  id v14;

  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingECG2PossibleResultsViewController setTitleLabel:](self, "setTitleLabel:", v3);

  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("Onboarding.PageTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextAlignment:", 1);

  -[HROnboardingECG2PossibleResultsViewController titleFont](self, "titleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v13);

}

- (void)_setUpTitleConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController contentTop](self, "contentTop");
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

}

- (id)_resultViewForSample:(id)a3 activeAlgorithmVersion:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = objc_msgSend(v6, "privateClassification");
  objc_msgSend(v6, "_algorithmVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HRElectrocardiogramResultViewItem viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:](HRElectrocardiogramResultViewItem, "viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:", v7, v8, a4, *MEMORY[0x24BDD4290], self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[HROnboardingElectrocardiogramResultView resultViewWithItem:](HROnboardingElectrocardiogramResultView, "resultViewWithItem:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setUpOnlyResultView
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

  -[HROnboardingECG2PossibleResultsViewController electrocardiogram](self, "electrocardiogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController _resultViewForSample:activeAlgorithmVersion:](self, "_resultViewForSample:activeAlgorithmVersion:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setOnlyResultView:](self, "setOnlyResultView:", v4);

  -[HROnboardingECG2PossibleResultsViewController onlyResultView](self, "onlyResultView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHideNumberedTitle:", 1);

  -[HROnboardingECG2PossibleResultsViewController onlyResultView](self, "onlyResultView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldHideSeparatorLine:", 1);

  -[HROnboardingECG2PossibleResultsViewController onlyResultView](self, "onlyResultView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlwaysExpanded:", 1);

  -[HROnboardingECG2PossibleResultsViewController onlyResultView](self, "onlyResultView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingECG2PossibleResultsViewController onlyResultView](self, "onlyResultView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

  }
  -[HROnboardingECG2PossibleResultsViewController onlyResultView](self, "onlyResultView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setBottomResultView:](self, "setBottomResultView:", v11);

}

- (void)_setUpOnlyResultViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HROnboardingECG2PossibleResultsViewController onlyResultView](self, "onlyResultView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  -[HROnboardingECG2PossibleResultsViewController onlyResultView](self, "onlyResultView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController viewTopAnchor](self, "viewTopAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

}

- (void)_setUpAllResultViews
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
  id v23;

  +[HRElectrocardiogramResultViewItem viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:](HRElectrocardiogramResultViewItem, "viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:", 3, 0, 2, -[HROnboardingECG2PossibleResultsViewController upgradingFromAlgorithmVersion](self, "upgradingFromAlgorithmVersion"), 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  +[HROnboardingElectrocardiogramResultView resultViewWithItem:](HROnboardingElectrocardiogramResultView, "resultViewWithItem:", v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setSinusRhythmResultReview:](self, "setSinusRhythmResultReview:", v3);

  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  +[HRElectrocardiogramResultViewItem viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:](HRElectrocardiogramResultViewItem, "viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:", 8, 0, 2, -[HROnboardingECG2PossibleResultsViewController upgradingFromAlgorithmVersion](self, "upgradingFromAlgorithmVersion"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HROnboardingElectrocardiogramResultView resultViewWithItem:](HROnboardingElectrocardiogramResultView, "resultViewWithItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setAtrialFibrillationResultView:](self, "setAtrialFibrillationResultView:", v7);

  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController atrialFibrillationResultView](self, "atrialFibrillationResultView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  +[HRElectrocardiogramResultViewItem viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:](HRElectrocardiogramResultViewItem, "viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:", 6, 0, 2, -[HROnboardingECG2PossibleResultsViewController upgradingFromAlgorithmVersion](self, "upgradingFromAlgorithmVersion"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HROnboardingElectrocardiogramResultView resultViewWithItem:](HROnboardingElectrocardiogramResultView, "resultViewWithItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setHighOrLowHeartRateResultView:](self, "setHighOrLowHeartRateResultView:", v11);

  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController highOrLowHeartRateResultView](self, "highOrLowHeartRateResultView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  +[HRElectrocardiogramResultViewItem viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:](HRElectrocardiogramResultViewItem, "viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:", 2, 0, 2, -[HROnboardingECG2PossibleResultsViewController upgradingFromAlgorithmVersion](self, "upgradingFromAlgorithmVersion"), self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HROnboardingElectrocardiogramResultView resultViewWithItem:](HROnboardingElectrocardiogramResultView, "resultViewWithItem:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setInconclusiveResultView:](self, "setInconclusiveResultView:", v15);

  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController inconclusiveResultView](self, "inconclusiveResultView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  +[HRElectrocardiogramResultViewItem viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:](HRElectrocardiogramResultViewItem, "viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:", 1, 0, 2, -[HROnboardingECG2PossibleResultsViewController upgradingFromAlgorithmVersion](self, "upgradingFromAlgorithmVersion"), self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HROnboardingElectrocardiogramResultView resultViewWithItem:](HROnboardingElectrocardiogramResultView, "resultViewWithItem:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setPoorRecordingResultView:](self, "setPoorRecordingResultView:", v19);

  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController poorRecordingResultView](self, "poorRecordingResultView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  -[HROnboardingECG2PossibleResultsViewController poorRecordingResultView](self, "poorRecordingResultView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setBottomResultView:](self, "setBottomResultView:", v22);

}

- (void)_setUpAllResultViewConstraints
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
  id v36;

  -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController viewTopAnchor](self, "viewTopAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[HROnboardingECG2PossibleResultsViewController atrialFibrillationResultView](self, "atrialFibrillationResultView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_alignHorizontalConstraintsWithView:margin:", v10, 0.0);

  -[HROnboardingECG2PossibleResultsViewController atrialFibrillationResultView](self, "atrialFibrillationResultView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[HROnboardingECG2PossibleResultsViewController highOrLowHeartRateResultView](self, "highOrLowHeartRateResultView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_alignHorizontalConstraintsWithView:margin:", v17, 0.0);

  -[HROnboardingECG2PossibleResultsViewController highOrLowHeartRateResultView](self, "highOrLowHeartRateResultView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController atrialFibrillationResultView](self, "atrialFibrillationResultView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[HROnboardingECG2PossibleResultsViewController inconclusiveResultView](self, "inconclusiveResultView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hk_alignHorizontalConstraintsWithView:margin:", v24, 0.0);

  -[HROnboardingECG2PossibleResultsViewController inconclusiveResultView](self, "inconclusiveResultView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController highOrLowHeartRateResultView](self, "highOrLowHeartRateResultView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[HROnboardingECG2PossibleResultsViewController poorRecordingResultView](self, "poorRecordingResultView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hk_alignHorizontalConstraintsWithView:margin:", v31, 0.0);

  -[HROnboardingECG2PossibleResultsViewController poorRecordingResultView](self, "poorRecordingResultView");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController inconclusiveResultView](self, "inconclusiveResultView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

}

- (void)_setUpBottomResultViewConstraint
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HROnboardingECG2PossibleResultsViewController bottomResultView](self, "bottomResultView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HROnboardingECG2PossibleResultsViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingECG2PossibleResultsViewController bottomResultView](self, "bottomResultView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingECG2PossibleResultsViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v10);

      -[HROnboardingECG2PossibleResultsViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActive:", 1);

    }
  }
}

- (void)_setUpDisclaimerLabel
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
  id v15;

  v15 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingECG2PossibleResultsViewController setDisclaimerLabel:](self, "setDisclaimerLabel:", v15);
  objc_msgSend(v15, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v15, "setNumberOfLines:", 0);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v15);

  -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  objc_msgSend(v15, "firstBaselineAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController bottomResultView](self, "bottomResultView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setDisclaimerLabelTopConstraint:](self, "setDisclaimerLabelTopConstraint:", v8);

  -[HROnboardingECG2PossibleResultsViewController disclaimerLabelTopConstraint](self, "disclaimerLabelTopConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v13);

  -[HROnboardingECG2PossibleResultsViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HROnboardingECG2PossibleResultsViewController _adjustDisclaimerLabelConstraints](self, "_adjustDisclaimerLabelConstraints");
}

- (void)_adjustDisclaimerLabelConstraints
{
  void *v3;
  uint64_t v4;
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
  id v17;

  -[HROnboardingECG2PossibleResultsViewController disclaimerLabelTopConstraint](self, "disclaimerLabelTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *MEMORY[0x24BDF7810];
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A80]), "initForTextStyle:", *MEMORY[0x24BDF7810]);
    objc_msgSend(v17, "scaledValueForValue:", 40.0);
    v6 = v5;
    -[HROnboardingECG2PossibleResultsViewController disclaimerLabelTopConstraint](self, "disclaimerLabelTopConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", v6);

    -[HROnboardingECG2PossibleResultsViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", v6);

    v9 = (void *)MEMORY[0x24BDD1688];
    HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_FOOTER"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_BOLD_FOOTER"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hrui_attributedStringForText:style:color:boldText:", v10, v4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HROnboardingECG2PossibleResultsViewController disclaimerLabel](self, "disclaimerLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributedText:", v13);

    objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("ResultsYouMaySee.Note"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingECG2PossibleResultsViewController disclaimerLabel](self, "disclaimerLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityIdentifier:", v15);

  }
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
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  HRHeartRhythmUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_CONTINUE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_FOOTER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_BOLD_FOOTER"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v5, v6, v7, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingECG2PossibleResultsViewController setStackedButtonView:](self, "setStackedButtonView:", v8);

  -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBlurHidden:", 1);

  -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFixedBottomButtonSpacing:", 1);

  -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)_setStackedButtonViewAsFooterView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[HROnboardingECG2PossibleResultsViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      HKHealthUIBuddyDirectionalEdgeInsets();
      -[HROnboardingECG2PossibleResultsViewController setFooterView:insets:](self, "setFooterView:insets:", v4);

      -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[HROnboardingECG2PossibleResultsViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "alignBlurViewHorizontalConstraintsWithView:", v5);

    }
  }
}

- (void)_adjustStackedButtonViewLocationForViewContentHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
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
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  if (-[HROnboardingECG2PossibleResultsViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HROnboardingECG2PossibleResultsViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layoutIfNeeded");

      -[HROnboardingECG2PossibleResultsViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "buttons");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "convertRect:fromView:", v17, v10, v12, v14, v16);
      v19 = v18;

      -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "frame");
      v22 = v21;
      -[HROnboardingECG2PossibleResultsViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "safeAreaInsets");
      v25 = v19 - v24;

      if (v22 > v25)
      {
        -[HROnboardingECG2PossibleResultsViewController removeFooterView](self, "removeFooterView");
        -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSubview:", v27);

        -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HROnboardingECG2PossibleResultsViewController titleLabel](self, "titleLabel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v29, 0.0);

        -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "topAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HROnboardingECG2PossibleResultsViewController bottomResultView](self, "bottomResultView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "bottomAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintEqualToAnchor:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setActive:", 1);

        -[HROnboardingECG2PossibleResultsViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = (void *)MEMORY[0x24BDD1628];
          -[HROnboardingECG2PossibleResultsViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = v37;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "deactivateConstraints:", v38);

        }
        -[HROnboardingECG2PossibleResultsViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
        -[HROnboardingECG2PossibleResultsViewController contentView](self, "contentView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "bottomAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HROnboardingECG2PossibleResultsViewController stackedButtonView](self, "stackedButtonView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "bottomAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "constraintEqualToAnchor:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[HROnboardingECG2PossibleResultsViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v43);

        -[HROnboardingECG2PossibleResultsViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setActive:", 1);

      }
    }
  }
}

- (void)_playResultViewVideos
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
  id v12;

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCategory:error:", *MEMORY[0x24BDB1598], 0);

  -[HROnboardingECG2PossibleResultsViewController electrocardiogram](self, "electrocardiogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HROnboardingECG2PossibleResultsViewController bottomResultView](self, "bottomResultView");
  }
  else
  {
    -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "play");

    -[HROnboardingECG2PossibleResultsViewController atrialFibrillationResultView](self, "atrialFibrillationResultView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "play");

    -[HROnboardingECG2PossibleResultsViewController highOrLowHeartRateResultView](self, "highOrLowHeartRateResultView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "play");

    -[HROnboardingECG2PossibleResultsViewController inconclusiveResultView](self, "inconclusiveResultView");
  }
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "play");

}

- (void)_pauseResultViewVideos
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

  -[HROnboardingECG2PossibleResultsViewController electrocardiogram](self, "electrocardiogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HROnboardingECG2PossibleResultsViewController bottomResultView](self, "bottomResultView");
  }
  else
  {
    -[HROnboardingECG2PossibleResultsViewController sinusRhythmResultReview](self, "sinusRhythmResultReview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pause");

    -[HROnboardingECG2PossibleResultsViewController atrialFibrillationResultView](self, "atrialFibrillationResultView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pause");

    -[HROnboardingECG2PossibleResultsViewController highOrLowHeartRateResultView](self, "highOrLowHeartRateResultView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pause");

    -[HROnboardingECG2PossibleResultsViewController inconclusiveResultView](self, "inconclusiveResultView");
  }
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pause");

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
  v10 = __85__HROnboardingECG2PossibleResultsViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D34A7B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HROnboardingECG2PossibleResultsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __85__HROnboardingECG2PossibleResultsViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HROnboardingECG2PossibleResultsViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (HKElectrocardiogram)electrocardiogram
{
  return self->_electrocardiogram;
}

- (void)setElectrocardiogram:(id)a3
{
  objc_storeStrong((id *)&self->_electrocardiogram, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (HROnboardingElectrocardiogramResultView)sinusRhythmResultReview
{
  return self->_sinusRhythmResultReview;
}

- (void)setSinusRhythmResultReview:(id)a3
{
  objc_storeStrong((id *)&self->_sinusRhythmResultReview, a3);
}

- (HROnboardingElectrocardiogramResultView)atrialFibrillationResultView
{
  return self->_atrialFibrillationResultView;
}

- (void)setAtrialFibrillationResultView:(id)a3
{
  objc_storeStrong((id *)&self->_atrialFibrillationResultView, a3);
}

- (HROnboardingElectrocardiogramResultView)highOrLowHeartRateResultView
{
  return self->_highOrLowHeartRateResultView;
}

- (void)setHighOrLowHeartRateResultView:(id)a3
{
  objc_storeStrong((id *)&self->_highOrLowHeartRateResultView, a3);
}

- (HROnboardingElectrocardiogramResultView)poorRecordingResultView
{
  return self->_poorRecordingResultView;
}

- (void)setPoorRecordingResultView:(id)a3
{
  objc_storeStrong((id *)&self->_poorRecordingResultView, a3);
}

- (HROnboardingElectrocardiogramResultView)inconclusiveResultView
{
  return self->_inconclusiveResultView;
}

- (void)setInconclusiveResultView:(id)a3
{
  objc_storeStrong((id *)&self->_inconclusiveResultView, a3);
}

- (HROnboardingElectrocardiogramResultView)onlyResultView
{
  return self->_onlyResultView;
}

- (void)setOnlyResultView:(id)a3
{
  objc_storeStrong((id *)&self->_onlyResultView, a3);
}

- (HROnboardingElectrocardiogramResultView)bottomResultView
{
  return self->_bottomResultView;
}

- (void)setBottomResultView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomResultView, a3);
}

- (UILabel)disclaimerLabel
{
  return self->_disclaimerLabel;
}

- (void)setDisclaimerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_disclaimerLabel, a3);
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_stackedButtonView, a3);
}

- (NSLayoutAnchor)viewTopAnchor
{
  return self->_viewTopAnchor;
}

- (void)setViewTopAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_viewTopAnchor, a3);
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, a3);
}

- (NSLayoutConstraint)disclaimerLabelTopConstraint
{
  return self->_disclaimerLabelTopConstraint;
}

- (void)setDisclaimerLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_disclaimerLabelTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclaimerLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_viewTopAnchor, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_bottomResultView, 0);
  objc_storeStrong((id *)&self->_onlyResultView, 0);
  objc_storeStrong((id *)&self->_inconclusiveResultView, 0);
  objc_storeStrong((id *)&self->_poorRecordingResultView, 0);
  objc_storeStrong((id *)&self->_highOrLowHeartRateResultView, 0);
  objc_storeStrong((id *)&self->_atrialFibrillationResultView, 0);
  objc_storeStrong((id *)&self->_sinusRhythmResultReview, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_electrocardiogram, 0);
}

@end
