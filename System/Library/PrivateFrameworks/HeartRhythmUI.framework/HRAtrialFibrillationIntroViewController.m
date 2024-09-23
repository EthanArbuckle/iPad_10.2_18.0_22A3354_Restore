@implementation HRAtrialFibrillationIntroViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HRAtrialFibrillationIntroViewController;
  -[HRAtrialFibrillationIntroViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HRAtrialFibrillationIntroViewController setUpUI](self, "setUpUI");
  -[HRAtrialFibrillationIntroViewController setUpConstraints](self, "setUpConstraints");
}

- (void)setUpUI
{
  id v3;
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
  id v16;
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
  id v27;
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
  id v39;

  v3 = objc_alloc_init(MEMORY[0x24BDF6D50]);
  -[HRAtrialFibrillationIntroViewController setScrollView:](self, "setScrollView:", v3);

  -[HRAtrialFibrillationIntroViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlwaysBounceVertical:", 1);

  -[HRAtrialFibrillationIntroViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRAtrialFibrillationIntroViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v8 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  -[HRAtrialFibrillationIntroViewController setContentView:](self, "setContentView:", v8);

  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRAtrialFibrillationIntroViewController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[HRAtrialFibrillationIntroViewController _createHeroView](self, "_createHeroView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController setHeroView:](self, "setHeroView:", v12);

  -[HRAtrialFibrillationIntroViewController heroView](self, "heroView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController heroView](self, "heroView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  v16 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRAtrialFibrillationIntroViewController setTitleLabel:](self, "setTitleLabel:", v16);

  HRHeartRhythmUIFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextAlignment:", 1);

  -[HRAtrialFibrillationIntroViewController _titleFont](self, "_titleFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v21);

  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNumberOfLines:", 0);

  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  v27 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRAtrialFibrillationIntroViewController setBodyLabel:](self, "setBodyLabel:", v27);

  HRHeartRhythmUIFrameworkBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setText:", v29);

  -[HRAtrialFibrillationIntroViewController _bodyFont](self, "_bodyFont");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFont:", v31);

  -[HRAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setNumberOfLines:", 0);

  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v36);

  +[HROnboardingInlineExpandedContentView learnMoreAboutAtrialFibrillationExpandedView](HROnboardingInlineExpandedContentView, "learnMoreAboutAtrialFibrillationExpandedView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController setLearnMoreContentView:](self, "setLearnMoreContentView:", v37);

  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSubview:", v38);

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
  id v61;

  -[HRAtrialFibrillationIntroViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", v4, 0.0);

  -[HRAtrialFibrillationIntroViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HRAtrialFibrillationIntroViewController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hk_alignHorizontalConstraintsWithView:margin:", v16, 0.0);

  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController scrollView](self, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_alignVerticalConstraintsWithView:margin:", v18, 0.0);

  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_alignHorizontalConstraintsWithView:margin:", v20, 0.0);

  -[HRAtrialFibrillationIntroViewController heroView](self, "heroView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_alignHorizontalConstraintsWithView:margin:", v22, 0.0);

  -[HRAtrialFibrillationIntroViewController heroView](self, "heroView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 16.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v28, "hrui_alignHorizontalConstraintsWithView:insets:", v29);

  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstBaselineAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController heroView](self, "heroView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController _assetImageBottomToTitleFirstBaseline](self, "_assetImageBottomToTitleFirstBaseline");
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[HRAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "hk_alignHorizontalConstraintsWithView:margin:", v36, 0.0);

  -[HRAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "firstBaselineAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "lastBaselineAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController _titleLastBaselineToBodyFirstBaseline](self, "_titleLastBaselineToBodyFirstBaseline");
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[HRAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  -[HRAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController titleLabel](self, "titleLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[HRAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController bodyLabel](self, "bodyLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

  -[HRAtrialFibrillationIntroViewController contentView](self, "contentView");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController learnMoreContentView](self, "learnMoreContentView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "lastBaselineAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationIntroViewController _bodyLastBaselineToContentBottom](self, "_bodyLastBaselineToContentBottom");
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setActive:", 1);

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
  -[HRAtrialFibrillationIntroViewController _titleFontTextStyle](self, "_titleFontTextStyle");
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
  -[HRAtrialFibrillationIntroViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_assetImageBottomToTitleFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HRAtrialFibrillationIntroViewController _titleFont](self, "_titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 54.0);
  v4 = v3;

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

- (double)_titleLastBaselineToBodyFirstBaseline
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = objc_alloc(MEMORY[0x24BDF6A80]);
  -[HRAtrialFibrillationIntroViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initForTextStyle:", v4);

  objc_msgSend(v5, "scaledValueForValue:", 32.0);
  v7 = v6;

  return v7;
}

- (double)_bodyLastBaselineToContentBottom
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = objc_alloc(MEMORY[0x24BDF6A80]);
  -[HRAtrialFibrillationIntroViewController _bodyFontTextStyle](self, "_bodyFontTextStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initForTextStyle:", v4);

  objc_msgSend(v5, "scaledValueForValue:", 48.0);
  v7 = v6;

  return v7;
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
  v10 = __79__HRAtrialFibrillationIntroViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D34A7B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HRAtrialFibrillationIntroViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __79__HRAtrialFibrillationIntroViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HRAtrialFibrillationIntroViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
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

- (UIView)learnMoreContentView
{
  return self->_learnMoreContentView;
}

- (void)setLearnMoreContentView:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreContentView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
