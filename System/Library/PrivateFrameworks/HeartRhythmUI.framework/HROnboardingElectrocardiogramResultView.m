@implementation HROnboardingElectrocardiogramResultView

- (HROnboardingElectrocardiogramResultView)initWithBadge:(id)a3 title:(id)a4 numberedTitle:(id)a5 visibleBodyText:(id)a6 video:(id)a7 expandedView:(id)a8
{
  id v15;
  id v16;
  id v17;
  HROnboardingElectrocardiogramResultView *v18;
  HROnboardingElectrocardiogramResultView *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HROnboardingElectrocardiogramResultView;
  v18 = -[HROnboardingElectrocardiogramResultView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_badge, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_numberedTitle, a5);
    objc_storeStrong((id *)&v19->_visibleBody, a6);
    objc_storeStrong((id *)&v19->_playerView, a7);
    objc_storeStrong((id *)&v19->_expandedView, a8);
    -[HROnboardingElectrocardiogramResultView _setUpUI](v19, "_setUpUI");
    -[HROnboardingElectrocardiogramResultView _setUpConstraints](v19, "_setUpConstraints");
  }

  return v19;
}

+ (id)resultViewWithItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HROnboardingElectrocardiogramResultView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HROnboardingElectrocardiogramResultView *v15;

  v3 = a3;
  objc_msgSend(v3, "videoPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "videoPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[HRVideoPlayerView playerViewWithURL:looping:](HRVideoPlayerView, "playerViewWithURL:looping:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "expandedContentItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HROnboardingInlineExpandedContentView viewWithItems:](HROnboardingInlineExpandedContentView, "viewWithItems:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [HROnboardingElectrocardiogramResultView alloc];
  objc_msgSend(v3, "badge");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberedTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleBodyText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HROnboardingElectrocardiogramResultView initWithBadge:title:numberedTitle:visibleBodyText:video:expandedView:](v10, "initWithBadge:title:numberedTitle:visibleBodyText:video:expandedView:", v11, v12, v13, v14, v4, v9);

  return v15;
}

- (void)learnMoreButtonTapped:(id)a3
{
  -[HROnboardingElectrocardiogramResultView setExpanded:](self, "setExpanded:", 1);
}

- (void)setHideNumberedTitle:(BOOL)a3
{
  self->_hideNumberedTitle = a3;
  -[HROnboardingElectrocardiogramResultView _updateNumberedTitleViewState](self, "_updateNumberedTitleViewState");
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  -[HROnboardingElectrocardiogramResultView _updateExpandedViewState](self, "_updateExpandedViewState");
}

- (void)setAlwaysExpanded:(BOOL)a3
{
  self->_alwaysExpanded = a3;
  if (a3)
    -[HROnboardingElectrocardiogramResultView setExpanded:](self, "setExpanded:", 1);
  else
    -[HROnboardingElectrocardiogramResultView _updateExpandedViewState](self, "_updateExpandedViewState");
}

- (void)setShouldHideSeparatorLine:(BOOL)a3
{
  self->_shouldHideSeparatorLine = a3;
  -[HROnboardingElectrocardiogramResultView _updateExpandedViewState](self, "_updateExpandedViewState");
}

- (void)_setUpUI
{
  void *v3;
  HRPaddingLabel *v4;
  HRPaddingLabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  id v40;
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
  id v54;
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
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;

  -[HROnboardingElectrocardiogramResultView badge](self, "badge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [HRPaddingLabel alloc];
    v5 = -[HRPaddingLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[HROnboardingElectrocardiogramResultView setBadgeLabel:](self, "setBadgeLabel:", v5);

    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(MEMORY[0x24BDF6950], "hk_heartKeyColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 1148846080;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v10);

    -[HROnboardingElectrocardiogramResultView _badgeFont](self, "_badgeFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNumberOfLines:", 2);

    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPadding:", 5.0, 8.0, 5.0, 8.0);

    -[HROnboardingElectrocardiogramResultView badge](self, "badge");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedUppercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextColor:", v18);

    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hrui_maskAllCornersWithRadius:", 4.0);

    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView addSubview:](self, "addSubview:", v22);

  }
  v23 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramResultView setNumberedTitleLabel:](self, "setNumberedTitleLabel:", v23);

  -[HROnboardingElectrocardiogramResultView numberedTitle](self, "numberedTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v24);

  v26 = (void *)MEMORY[0x24BDD17C8];
  -[HROnboardingElectrocardiogramResultView numberedTitle](self, "numberedTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("ResultsYouMaySee.%@.Title"), v27);
  v78 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, v78);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAccessibilityIdentifier:", v28);

  -[HROnboardingElectrocardiogramResultView _numberedTitleFont](self, "_numberedTitleFont");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFont:", v30);

  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView addSubview:](self, "addSubview:", v35);

  -[HROnboardingElectrocardiogramResultView playerView](self, "playerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[HROnboardingElectrocardiogramResultView playerView](self, "playerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HROnboardingElectrocardiogramResultView playerView](self, "playerView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "hrui_maskAllCornersWithRadius:", *MEMORY[0x24BE4A250]);

    -[HROnboardingElectrocardiogramResultView playerView](self, "playerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView addSubview:](self, "addSubview:", v39);

  }
  v40 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HROnboardingElectrocardiogramResultView setVisibleBodyLabel:](self, "setVisibleBodyLabel:", v40);

  -[HROnboardingElectrocardiogramResultView visibleBody](self, "visibleBody");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setText:", v41);

  v43 = (void *)MEMORY[0x24BDD17C8];
  -[HROnboardingElectrocardiogramResultView numberedTitle](self, "numberedTitle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", CFSTR("ResultsYouMaySee.%@.Description"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAccessibilityIdentifier:", v46);

  -[HROnboardingElectrocardiogramResultView _visibleBodyFont](self, "_visibleBodyFont");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFont:", v48);

  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setNumberOfLines:", 0);

  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView addSubview:](self, "addSubview:", v53);

  v54 = objc_alloc_init(MEMORY[0x24BDF6880]);
  -[HROnboardingElectrocardiogramResultView setLearnMoreButton:](self, "setLearnMoreButton:", v54);

  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  HRHeartRhythmUIFrameworkBundle();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("ONBOARDING_LEARN_MORE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setTitle:forState:", v57, 0);

  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, CFSTR("ResultsYouMaySee.LearnMoreButton"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setAccessibilityIdentifier:", v59);

  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setTitleColor:forState:", v61, 0);

  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addTarget:action:forControlEvents:", self, sel_learnMoreButtonTapped_, 64);

  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setContentHorizontalAlignment:", 4);

  -[HROnboardingElectrocardiogramResultView _visibleBodyFont](self, "_visibleBodyFont");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "titleLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setFont:", v64);

  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "titleLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setAdjustsFontForContentSizeCategory:", 1);

  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView addSubview:](self, "addSubview:", v69);

  -[HROnboardingElectrocardiogramResultView expandedView](self, "expandedView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramResultView expandedView](self, "expandedView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setHidden:", 1);

  -[HROnboardingElectrocardiogramResultView expandedView](self, "expandedView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView addSubview:](self, "addSubview:", v72);

  v73 = objc_alloc_init(MEMORY[0x24BE4A838]);
  -[HROnboardingElectrocardiogramResultView setSeparatorLineView:](self, "setSeparatorLineView:", v73);

  objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView separatorLineView](self, "separatorLineView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setColor:", v74);

  -[HROnboardingElectrocardiogramResultView separatorLineView](self, "separatorLineView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HROnboardingElectrocardiogramResultView separatorLineView](self, "separatorLineView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView addSubview:](self, "addSubview:", v77);

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
  id v49;

  -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView leadingAnchor](self, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView trailingAnchor](self, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstBaselineAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView topAnchor](self, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView _badgeTopToFirstBaseline](self, "_badgeTopToFirstBaseline");
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

  }
  -[HROnboardingElectrocardiogramResultView _setUpNumberedTitleLabelConstraints](self, "_setUpNumberedTitleLabelConstraints");
  -[HROnboardingElectrocardiogramResultView playerView](self, "playerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HROnboardingElectrocardiogramResultView playerView](self, "playerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    -[HROnboardingElectrocardiogramResultView _setUpPlayerViewTopConstraint](self, "_setUpPlayerViewTopConstraint");
    -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstBaselineAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView playerView](self, "playerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView _visibleBodyFirstBaselineDistance](self, "_visibleBodyFirstBaselineDistance");
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

  }
  else
  {
    -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

    -[HROnboardingElectrocardiogramResultView _setUpVisibleBodyLabelTopConstraint](self, "_setUpVisibleBodyLabelTopConstraint");
  }
  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstBaselineAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lastBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView _visibleBodyLastBaselineToLearnMoreButtonFirstBaseline](self, "_visibleBodyLastBaselineToLearnMoreButtonFirstBaseline");
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[HROnboardingElectrocardiogramResultView expandedView](self, "expandedView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  -[HROnboardingElectrocardiogramResultView expandedView](self, "expandedView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[HROnboardingElectrocardiogramResultView separatorLineView](self, "separatorLineView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  -[HROnboardingElectrocardiogramResultView separatorLineView](self, "separatorLineView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  -[HROnboardingElectrocardiogramResultView separatorLineView](self, "separatorLineView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView bottomAnchor](self, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[HROnboardingElectrocardiogramResultView bottomAnchor](self, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "lastBaselineAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView _learnMoreButtonLastBaselineToBottom](self, "_learnMoreButtonLastBaselineToBottom");
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView setBottomConstraint:](self, "setBottomConstraint:", v48);

  -[HROnboardingElectrocardiogramResultView bottomConstraint](self, "bottomConstraint");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

}

- (void)_setUpNumberedTitleLabelConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstBaselineAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HROnboardingElectrocardiogramResultView badgeLabel](self, "badgeLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView _numberedTitleToBadgeLastBaseline](self, "_numberedTitleToBadgeLastBaseline");
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

  }
  else
  {
    -[HROnboardingElectrocardiogramResultView topAnchor](self, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView _numberedTitleTopToFirstBaseline](self, "_numberedTitleTopToFirstBaseline");
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);
  }

}

- (void)_setUpPlayerViewTopConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[HROnboardingElectrocardiogramResultView playerViewOrVisibleBodyLabelTopConstraint](self, "playerViewOrVisibleBodyLabelTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingElectrocardiogramResultView playerViewOrVisibleBodyLabelTopConstraint](self, "playerViewOrVisibleBodyLabelTopConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v6);

    -[HROnboardingElectrocardiogramResultView setPlayerViewOrVisibleBodyLabelTopConstraint:](self, "setPlayerViewOrVisibleBodyLabelTopConstraint:", 0);
  }
  -[HROnboardingElectrocardiogramResultView _playerViewOrVisibleBodyLabelTopConstraint](self, "_playerViewOrVisibleBodyLabelTopConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView _playerViewOrVisibleBodyLabelTopConstant](self, "_playerViewOrVisibleBodyLabelTopConstant");
  v9 = v8;
  -[HROnboardingElectrocardiogramResultView playerView](self, "playerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView setPlayerViewOrVisibleBodyLabelTopConstraint:](self, "setPlayerViewOrVisibleBodyLabelTopConstraint:", v12);

  -[HROnboardingElectrocardiogramResultView playerViewOrVisibleBodyLabelTopConstraint](self, "playerViewOrVisibleBodyLabelTopConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

}

- (void)_setUpVisibleBodyLabelTopConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[HROnboardingElectrocardiogramResultView playerViewOrVisibleBodyLabelTopConstraint](self, "playerViewOrVisibleBodyLabelTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingElectrocardiogramResultView playerViewOrVisibleBodyLabelTopConstraint](self, "playerViewOrVisibleBodyLabelTopConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v6);

    -[HROnboardingElectrocardiogramResultView setPlayerViewOrVisibleBodyLabelTopConstraint:](self, "setPlayerViewOrVisibleBodyLabelTopConstraint:", 0);
  }
  -[HROnboardingElectrocardiogramResultView _playerViewOrVisibleBodyLabelTopConstraint](self, "_playerViewOrVisibleBodyLabelTopConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView _playerViewOrVisibleBodyLabelTopConstant](self, "_playerViewOrVisibleBodyLabelTopConstant");
  v9 = v8;
  -[HROnboardingElectrocardiogramResultView visibleBodyLabel](self, "visibleBodyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView setPlayerViewOrVisibleBodyLabelTopConstraint:](self, "setPlayerViewOrVisibleBodyLabelTopConstraint:", v12);

  -[HROnboardingElectrocardiogramResultView playerViewOrVisibleBodyLabelTopConstraint](self, "playerViewOrVisibleBodyLabelTopConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

}

- (id)_playerViewOrVisibleBodyLabelTopConstraint
{
  void *v3;
  void *v4;

  if (-[HROnboardingElectrocardiogramResultView isHidingNumberedTitle](self, "isHidingNumberedTitle"))
  {
    -[HROnboardingElectrocardiogramResultView topAnchor](self, "topAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastBaselineAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (double)_playerViewOrVisibleBodyLabelTopConstant
{
  double v3;
  double result;

  if (-[HROnboardingElectrocardiogramResultView isHidingNumberedTitle](self, "isHidingNumberedTitle"))
  {
    HKHealthUIBuddyDirectionalEdgeInsets();
    return v3;
  }
  else
  {
    -[HROnboardingElectrocardiogramResultView _numberedTitleLastBaseLineToVideoTop](self, "_numberedTitleLastBaseLineToVideoTop");
  }
  return result;
}

- (void)_updateNumberedTitleViewState
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[HROnboardingElectrocardiogramResultView isHidingNumberedTitle](self, "isHidingNumberedTitle");
  -[HROnboardingElectrocardiogramResultView numberedTitleLabel](self, "numberedTitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "removeFromSuperview");

  }
  else
  {
    -[HROnboardingElectrocardiogramResultView addSubview:](self, "addSubview:", v4);

    -[HROnboardingElectrocardiogramResultView _setUpNumberedTitleLabelConstraints](self, "_setUpNumberedTitleLabelConstraints");
  }
  -[HROnboardingElectrocardiogramResultView playerView](self, "playerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[HROnboardingElectrocardiogramResultView _setUpPlayerViewTopConstraint](self, "_setUpPlayerViewTopConstraint");
  else
    -[HROnboardingElectrocardiogramResultView _setUpVisibleBodyLabelTopConstraint](self, "_setUpVisibleBodyLabelTopConstraint");
}

- (void)_updateExpandedViewState
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[HROnboardingElectrocardiogramResultView shouldHideSeparatorLine](self, "shouldHideSeparatorLine");
  -[HROnboardingElectrocardiogramResultView separatorLineView](self, "separatorLineView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  LODWORD(v4) = -[HROnboardingElectrocardiogramResultView isExpanded](self, "isExpanded");
  -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4)
  {
    objc_msgSend(v5, "setHidden:", 1);

    -[HROnboardingElectrocardiogramResultView expandedView](self, "expandedView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    v8 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingElectrocardiogramResultView bottomConstraint](self, "bottomConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deactivateConstraints:", v10);

    -[HROnboardingElectrocardiogramResultView setBottomConstraint:](self, "setBottomConstraint:", 0);
    -[HROnboardingElectrocardiogramResultView bottomAnchor](self, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView expandedView](self, "expandedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0);

    -[HROnboardingElectrocardiogramResultView expandedView](self, "expandedView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    v15 = (void *)MEMORY[0x24BDD1628];
    -[HROnboardingElectrocardiogramResultView bottomConstraint](self, "bottomConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deactivateConstraints:", v17);

    -[HROnboardingElectrocardiogramResultView setBottomConstraint:](self, "setBottomConstraint:", 0);
    -[HROnboardingElectrocardiogramResultView bottomAnchor](self, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HROnboardingElectrocardiogramResultView learnMoreButton](self, "learnMoreButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastBaselineAnchor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v13;
  -[HROnboardingElectrocardiogramResultView _learnMoreButtonLastBaselineToBottom](self, "_learnMoreButtonLastBaselineToBottom");
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HROnboardingElectrocardiogramResultView setBottomConstraint:](self, "setBottomConstraint:", v19);

  -[HROnboardingElectrocardiogramResultView bottomConstraint](self, "bottomConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

}

- (id)_badgeFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x24BDF77D0], 2);
}

- (double)_badgeTopToFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramResultView _badgeFont](self, "_badgeFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 52.0);
  v4 = v3;

  return v4;
}

- (id)_numberedTitleFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x24BDF7850], 32770);
}

- (double)_numberedTitleTopToFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramResultView _numberedTitleFont](self, "_numberedTitleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 52.0);
  v4 = v3;

  return v4;
}

- (double)_numberedTitleToBadgeLastBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramResultView _numberedTitleFont](self, "_numberedTitleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 26.0);
  v4 = v3;

  return v4;
}

- (double)_numberedTitleLastBaseLineToVideoTop
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramResultView _numberedTitleFont](self, "_numberedTitleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 18.0);
  v4 = v3;

  return v4;
}

- (id)_visibleBodyFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_visibleBodyFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HROnboardingElectrocardiogramResultView _visibleBodyFontTextStyle](self, "_visibleBodyFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_visibleBodyFirstBaselineDistance
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramResultView _visibleBodyFont](self, "_visibleBodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 30.0);
  v4 = v3;

  return v4;
}

- (double)_visibleBodyLastBaselineToLearnMoreButtonFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramResultView _visibleBodyFont](self, "_visibleBodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 40.0);
  v4 = v3;

  return v4;
}

- (double)_learnMoreButtonLastBaselineToBottom
{
  void *v2;
  double v3;
  double v4;

  -[HROnboardingElectrocardiogramResultView _visibleBodyFont](self, "_visibleBodyFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 40.0);
  v4 = v3;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (HRVideoPlayerView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerView, a3);
}

- (BOOL)isHidingNumberedTitle
{
  return self->_hideNumberedTitle;
}

- (BOOL)isAlwaysExpanded
{
  return self->_alwaysExpanded;
}

- (BOOL)shouldHideSeparatorLine
{
  return self->_shouldHideSeparatorLine;
}

- (NSString)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)numberedTitle
{
  return self->_numberedTitle;
}

- (void)setNumberedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)visibleBody
{
  return self->_visibleBody;
}

- (void)setVisibleBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (HRPaddingLabel)badgeLabel
{
  return self->_badgeLabel;
}

- (void)setBadgeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_badgeLabel, a3);
}

- (UILabel)numberedTitleLabel
{
  return self->_numberedTitleLabel;
}

- (void)setNumberedTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_numberedTitleLabel, a3);
}

- (UILabel)visibleBodyLabel
{
  return self->_visibleBodyLabel;
}

- (void)setVisibleBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_visibleBodyLabel, a3);
}

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (UIView)expandedView
{
  return self->_expandedView;
}

- (void)setExpandedView:(id)a3
{
  objc_storeStrong((id *)&self->_expandedView, a3);
}

- (HKSeparatorLineView)separatorLineView
{
  return self->_separatorLineView;
}

- (void)setSeparatorLineView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLineView, a3);
}

- (NSLayoutConstraint)playerViewOrVisibleBodyLabelTopConstraint
{
  return self->_playerViewOrVisibleBodyLabelTopConstraint;
}

- (void)setPlayerViewOrVisibleBodyLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewOrVisibleBodyLabelTopConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_playerViewOrVisibleBodyLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_separatorLineView, 0);
  objc_storeStrong((id *)&self->_expandedView, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_visibleBodyLabel, 0);
  objc_storeStrong((id *)&self->_numberedTitleLabel, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_visibleBody, 0);
  objc_storeStrong((id *)&self->_numberedTitle, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
