@implementation HROnboardingHeroExplanationViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingHeroExplanationViewController;
  -[HROnboardingHeroExplanationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HROnboardingHeroExplanationViewController _setUpButtonFooterView](self, "_setUpButtonFooterView");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HROnboardingHeroExplanationViewController;
  -[HROnboardingHeroExplanationViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HROnboardingHeroExplanationViewController _adjustButtonFooterViewLocationForViewContentHeight](self, "_adjustButtonFooterViewLocationForViewContentHeight");
}

- (void)setUpUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)HROnboardingHeroExplanationViewController;
  -[HROnboardingHeroExplanationViewController setUpUI](&v36, sel_setUpUI);
  -[HROnboardingHeroExplanationViewController createHeroView](self, "createHeroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController setHeroView:](self, "setHeroView:", v3);

  -[HROnboardingHeroExplanationViewController heroView](self, "heroView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HROnboardingHeroExplanationViewController heroView](self, "heroView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingHeroExplanationViewController heroView](self, "heroView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

  }
  v8 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingHeroExplanationViewController setTitleLabel:](self, "setTitleLabel:", v8);

  -[HROnboardingHeroExplanationViewController titleString](self, "titleString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[HROnboardingHeroExplanationViewController _titleFont](self, "_titleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", -[HROnboardingHeroExplanationViewController accessibilityGroupID](self, "accessibilityGroupID"), CFSTR("Onboarding.PageTitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", v15);

  -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  v19 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingHeroExplanationViewController setBodyLabel:](self, "setBodyLabel:", v19);

  -[HROnboardingHeroExplanationViewController bodyString](self, "bodyString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v20);

  -[HROnboardingHeroExplanationViewController _bodyFont](self, "_bodyFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v22);

  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", -[HROnboardingHeroExplanationViewController accessibilityGroupID](self, "accessibilityGroupID"), CFSTR("Onboarding.HowItWorksDescription"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityIdentifier:", v26);

  -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v29);

  if (-[HROnboardingHeroExplanationViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingHeroExplanationViewController buttonTitleString](self, "buttonTitleString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[HRStackedButtonView buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:](HRStackedButtonView, "buddyStackedButtonViewWithTitles:footerText:boldFooterText:delegate:", v31, 0, 0, self);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingHeroExplanationViewController setStackedButtonView:](self, "setStackedButtonView:", v32);

    -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBlurHidden:", 1);

    -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFixedBottomButtonSpacing:", 1);

    -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

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
  double v15;
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

  v32.receiver = self;
  v32.super_class = (Class)HROnboardingHeroExplanationViewController;
  -[HROnboardingHeroExplanationViewController setUpConstraints](&v32, sel_setUpConstraints);
  -[HROnboardingHeroExplanationViewController heroView](self, "heroView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HROnboardingHeroExplanationViewController heroView](self, "heroView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_alignHorizontalConstraintsWithView:margin:", v5, 0.0);

    -[HROnboardingHeroExplanationViewController heroView](self, "heroView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 29.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingHeroExplanationViewController heroView](self, "heroView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 29.0;
  }
  else
  {
    -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingHeroExplanationViewController contentTop](self, "contentTop");
  }
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v17, "hrui_alignHorizontalConstraintsWithView:insets:", v18);

  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_alignHorizontalConstraintsWithView:margin:", v20, 0.0);

  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastBaselineAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController _titleLastBaselineToBodyTop](self, "_titleLastBaselineToBodyTop");
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, *MEMORY[0x24BE4A138]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v30);

  -[HROnboardingHeroExplanationViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

}

- (void)setTextAlignment:(int64_t)a3
{
  void *v5;
  id v6;

  self->_textAlignment = a3;
  -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", a3);

  -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", a3);

}

- (int64_t)stackedButtonViewLastButtonMode
{
  return 0;
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  id v4;

  if (!a4)
  {
    -[HROnboardingHeroExplanationViewController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stepForward");

  }
}

- (void)_setUpButtonFooterView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;

  if (-[HROnboardingHeroExplanationViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthUIBuddyDirectionalEdgeInsets();
    -[HROnboardingHeroExplanationViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

    -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingHeroExplanationViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alignBlurViewHorizontalConstraintsWithView:", v5);

    -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBlurHidden:", 0);

    v7 = -[HROnboardingHeroExplanationViewController stackedButtonViewLastButtonMode](self, "stackedButtonViewLastButtonMode");
    -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastButtonMode:", v7);

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
  if (-[HROnboardingHeroExplanationViewController isOnboarding](self, "isOnboarding"))
  {
    -[HROnboardingHeroExplanationViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    -[HROnboardingHeroExplanationViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
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
    -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertRect:fromView:", v16, v9, v11, v13, v15);
    v18 = v17;

    -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;
    -[HROnboardingHeroExplanationViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safeAreaInsets");
    v24 = v18 - v23;

    if (v21 > v24)
    {
      -[HROnboardingHeroExplanationViewController removeFooterView](self, "removeFooterView");
      -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSubview:", v26);

      -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBlurHidden:", 1);

      -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingHeroExplanationViewController titleLabel](self, "titleLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v29, 0.0);

      -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingHeroExplanationViewController bodyLabel](self, "bodyLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setActive:", 1);

      v35 = (void *)MEMORY[0x24BDD1628];
      -[HROnboardingHeroExplanationViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "deactivateConstraints:", v37);

      -[HROnboardingHeroExplanationViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", 0);
      -[HROnboardingHeroExplanationViewController contentView](self, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingHeroExplanationViewController stackedButtonView](self, "stackedButtonView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HROnboardingHeroExplanationViewController setContentViewBottomConstraint:](self, "setContentViewBottomConstraint:", v42);

      -[HROnboardingHeroExplanationViewController contentViewBottomConstraint](self, "contentViewBottomConstraint");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setActive:", 1);

    }
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
  -[HROnboardingHeroExplanationViewController _titleFontTextStyle](self, "_titleFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 32770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_titleTopToFirstBaselineLeading
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x24BDF6D38], "hrui_currentDeviceHas5Point8InchScreen");
  result = 36.0;
  if (v2)
    return 44.0;
  return result;
}

- (double)_titleTopToFirstBaseline
{
  void *v3;
  double v4;
  double v5;

  -[HROnboardingHeroExplanationViewController _titleFont](self, "_titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingHeroExplanationViewController _titleTopToFirstBaselineLeading](self, "_titleTopToFirstBaselineLeading");
  objc_msgSend(v3, "_scaledValueForValue:");
  v5 = v4;

  return v5;
}

- (double)_titleLastBaselineToBodyTop
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingHeroExplanationViewController _titleFont](self, "_titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 24.0);
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
  -[HROnboardingHeroExplanationViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
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
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
}

- (id)createHeroView
{
  id result;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  return result;
}

- (NSString)titleString
{
  NSString *result;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  return result;
}

- (NSString)bodyString
{
  NSString *result;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  return result;
}

- (NSString)buttonTitleString
{
  NSString *result;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  return result;
}

- (int64_t)accessibilityGroupID
{
  int64_t result;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2();
  return result;
}

@end
