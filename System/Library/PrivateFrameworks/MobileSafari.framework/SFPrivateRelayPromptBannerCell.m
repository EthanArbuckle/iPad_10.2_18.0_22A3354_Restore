@implementation SFPrivateRelayPromptBannerCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("PrivateRelayPromptBanner");
}

- (SFPrivateRelayPromptBannerCell)initWithFrame:(CGRect)a3
{
  SFPrivateRelayPromptBannerCell *v3;
  uint64_t v4;
  SFBannerBackgroundView *backgroundView;
  uint64_t v6;
  UILabel *titleLabel;
  UITextView *v8;
  UITextView *messageLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  void *v20;
  UIButton *dismissButton;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIButton *v29;
  void *v30;
  UIButton *turnOnButton;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  SFPrivateRelayPromptBannerCell *v44;
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
  objc_super v86;
  _QWORD v87[15];
  uint64_t v88;
  void *v89;
  _QWORD v90[2];
  _QWORD v91[4];

  v91[2] = *MEMORY[0x1E0C80C00];
  v86.receiver = self;
  v86.super_class = (Class)SFPrivateRelayPromptBannerCell;
  v3 = -[SFPrivateRelayPromptBannerCell initWithFrame:](&v86, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIVisualEffectView sf_startPageCellBackgroundEffectViewWithShadow:](SFBannerBackgroundView, "sf_startPageCellBackgroundEffectViewWithShadow:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (SFBannerBackgroundView *)v4;

    -[SFBannerBackgroundView setBannerStyle:](v3->_backgroundView, "setBannerStyle:", 1);
    -[SFBannerBackgroundView _setGroupName:](v3->_backgroundView, "_setGroupName:", 0);
    -[SFBannerBackgroundView _setContinuousCornerRadius:](v3->_backgroundView, "_setContinuousCornerRadius:", 8.0);
    -[SFPrivateRelayPromptBannerCell setBackgroundView:](v3, "setBackgroundView:", v3->_backgroundView);
    -[SFPrivateRelayPromptBannerCell setLayoutMargins:](v3, "setLayoutMargins:", 30.0, 30.0, 30.0, 30.0);
    objc_msgSend(MEMORY[0x1E0DC1350], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B60], 2);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3990], "sf_startPageBannerTitleLabelWithFont:", v85);
    v6 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFPrivateRelayPromptBannerCell addSubview:](v3, "addSubview:", v3->_titleLabel);
    v8 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    messageLabel = v3->_messageLabel;
    v3->_messageLabel = v8;

    -[UITextView setDelegate:](v3->_messageLabel, "setDelegate:", v3);
    -[UITextView setEditable:](v3->_messageLabel, "setEditable:", 0);
    -[UITextView setSelectable:](v3->_messageLabel, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](v3->_messageLabel, "setScrollEnabled:", 0);
    -[UITextView textContainer](v3->_messageLabel, "textContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLineFragmentPadding:", 0.0);

    -[UITextView _setInteractiveTextSelectionDisabled:](v3->_messageLabel, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setTextContainerInset:](v3->_messageLabel, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v3->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v3->_messageLabel, "setBackgroundColor:", v11);

    -[UITextView setTextAlignment:](v3->_messageLabel, "setTextAlignment:", 1);
    -[UITextView setAdjustsFontForContentSizeCategory:](v3->_messageLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v88 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setLinkTextAttributes:](v3->_messageLabel, "setLinkTextAttributes:", v13);

    LODWORD(v14) = 1148846080;
    -[UITextView setContentHuggingPriority:forAxis:](v3->_messageLabel, "setContentHuggingPriority:forAxis:", 1, v14);
    LODWORD(v15) = 1148846080;
    -[UITextView setContentCompressionResistancePriority:forAxis:](v3->_messageLabel, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    -[SFPrivateRelayPromptBannerCell addSubview:](v3, "addSubview:", v3->_messageLabel);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setButtonSize:", 3);
    objc_msgSend(v16, "setContentInsets:", 10.0, 5.0, 10.0, 5.0);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v17);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreferredSymbolConfigurationForImage:", v18);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v16, 0);
    v19 = (UIButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v19, "setTintColor:", v20);

    -[UIButton setPointerStyleProvider:](v19, "setPointerStyleProvider:", &__block_literal_global_13);
    -[UIButton setTintAdjustmentMode:](v19, "setTintAdjustmentMode:", 1);
    -[UIButton _setTouchInsets:](v19, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    dismissButton = v3->_dismissButton;
    v3->_dismissButton = v19;

    -[UIButton addTarget:action:forControlEvents:](v3->_dismissButton, "addTarget:action:forControlEvents:", v3, sel__dismiss_, 0x2000);
    -[SFPrivateRelayPromptBannerCell addSubview:](v3, "addSubview:", v3->_dismissButton);
    objc_msgSend(MEMORY[0x1E0DC3520], "borderedProminentButtonConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerStyle:", 4);
    objc_msgSend(v22, "setButtonSize:", 0);
    v23 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v23, "setAlignment:", 1);
    objc_msgSend(v23, "setLineBreakStrategy:", 1);
    v24 = objc_alloc(MEMORY[0x1E0CB3498]);
    _WBSLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = *MEMORY[0x1E0DC1138];
    turnOnButtonFont();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = *MEMORY[0x1E0DC1178];
    v91[0] = v26;
    v91[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v24, "initWithString:attributes:", v25, v27);
    objc_msgSend(v22, "setAttributedTitle:", v28);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v22, 0);
    v29 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v29, "titleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAdjustsFontForContentSizeCategory:", 1);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton _sf_setMatchesIntrinsicContentSize](v29, "_sf_setMatchesIntrinsicContentSize");

    turnOnButton = v3->_turnOnButton;
    v3->_turnOnButton = v29;

    -[UIButton addTarget:action:forControlEvents:](v3->_turnOnButton, "addTarget:action:forControlEvents:", v3, sel__turnOnPrivateRelay_, 0x2000);
    -[SFPrivateRelayPromptBannerCell addSubview:](v3, "addSubview:", v3->_turnOnButton);
    -[UIButton bottomAnchor](v3->_turnOnButton, "bottomAnchor");
    v32 = objc_claimAutoreleasedReturnValue();
    -[SFPrivateRelayPromptBannerCell readableContentGuide](v3, "readableContentGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v82;
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v79;
    objc_msgSend(v33, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v76;
    -[UILabel centerXAnchor](v3->_titleLabel, "centerXAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivateRelayPromptBannerCell centerXAnchor](v3, "centerXAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v74);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v87[3] = v73;
    -[UITextView topAnchor](v3->_messageLabel, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 8.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v87[4] = v70;
    -[UITextView leadingAnchor](v3->_messageLabel, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v87[5] = v67;
    objc_msgSend(v33, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView trailingAnchor](v3->_messageLabel, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v87[6] = v63;
    -[UITextView centerXAnchor](v3->_messageLabel, "centerXAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivateRelayPromptBannerCell centerXAnchor](v3, "centerXAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v87[7] = v60;
    -[UIButton topAnchor](v3->_turnOnButton, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView bottomAnchor](v3->_messageLabel, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 16.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v87[8] = v55;
    -[UIButton centerXAnchor](v3->_turnOnButton, "centerXAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v87[9] = v52;
    -[UIButton leadingAnchor](v3->_turnOnButton, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v33;
    objc_msgSend(v33, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v87[10] = v49;
    -[UIButton leadingAnchor](v3->_dismissButton, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivateRelayPromptBannerCell leadingAnchor](v3, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 10.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v87[11] = v46;
    -[UIButton topAnchor](v3->_dismissButton, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivateRelayPromptBannerCell topAnchor](v3, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 10.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v87[12] = v36;
    objc_msgSend(v33, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)v32;
    objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v32);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v87[13] = v38;
    objc_msgSend(v33, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v32);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = 1132068864;
    objc_msgSend(v40, "sf_withPriority:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v87[14] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 15);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "activateConstraints:", v43);

    v44 = v3;
  }

  return v3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)SFPrivateRelayPromptBannerCell;
  -[SFPrivateRelayPromptBannerCell preferredLayoutAttributesFittingAttributes:](&v13, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivateRelayPromptBannerCell layoutIfNeeded](self, "layoutIfNeeded");
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFPrivateRelayPromptBannerCell bounds](self, "bounds");
  -[SFPrivateRelayPromptBannerCell systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", CGRectGetWidth(v14), *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v11);
  return v4;
}

- (SFPrivateRelayPromptBannerCell)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPrivateRelayPromptBannerCell;
  return -[SFPrivateRelayPromptBannerCell initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)SFPrivateRelayPromptBannerCell;
  -[SFPrivateRelayPromptBannerCell layoutSubviews](&v3, sel_layoutSubviews);
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel setPreferredMaxLayoutWidth:](self->_titleLabel, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v4));
  -[UITextView frame](self->_messageLabel, "frame");
  -[UITextView _setPreferredMaxLayoutWidth:](self->_messageLabel, "_setPreferredMaxLayoutWidth:", CGRectGetWidth(v5));
  -[SFPrivateRelayPromptBannerCell _updateTurnOnButtonConfiguration](self, "_updateTurnOnButtonConfiguration");
}

- (id)focusEffect
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC37D8];
  -[SFPrivateRelayPromptBannerCell bounds](self, "bounds");
  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A68]);
}

- (void)_dismiss:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportPrivateRelayModulePromptEvent:", CFSTR("Dismiss"));

  (*((void (**)(void))self->_dismissHandler + 2))();
}

- (void)_turnOnPrivateRelay:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportPrivateRelayModulePromptEvent:", CFSTR("Turn On Private Relay"));

  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrivacyProxyEnabled:completionHandler:", 1, 0);

  (*((void (**)(void))self->_dismissHandler + 2))();
}

- (void)_updateTurnOnButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[UIButton titleLabel](self->_turnOnButton, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  turnOnButtonFont();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v7 = v6;
  v18 = *MEMORY[0x1E0DC1138];
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v7, 1.79769313e308);
  v10 = v9;

  objc_msgSend(v4, "lineHeight");
  v12 = round(v10 / v11);
  if (v12 > 1.0)
    v13 = -1;
  else
    v13 = 4;
  -[UIButton configuration](self->_turnOnButton, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "cornerStyle");

  if (v13 != v15)
  {
    -[UIButton configuration](self->_turnOnButton, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerStyle:", v13);
    if (v12 > 1.0)
    {
      objc_msgSend(v16, "background");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCornerRadius:", 8.0);

    }
    -[UIButton setConfiguration:](self->_turnOnButton, "setConfiguration:", v16);

  }
}

- (void)configureUsingBanner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id dismissHandler;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedStringWithAttachment:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
      {
        objc_msgSend(v9, "appendAttributedString:", v7);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v9, "appendAttributedString:", v10);

        v11 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v23, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithString:", v12);
        objc_msgSend(v9, "appendAttributedString:", v13);

      }
      else
      {
        v14 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v23, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithString:", v15);
        objc_msgSend(v9, "appendAttributedString:", v16);

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v9, "appendAttributedString:", v17);

        objc_msgSend(v9, "appendAttributedString:", v7);
      }
      -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v9);

    }
    else
    {
      -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v7);
    }
  }
  else
  {
    objc_msgSend(v23, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v7);
  }

  objc_msgSend(v23, "message");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivateRelayPromptBannerCell _attributedStringForMessage:](self, "_attributedStringForMessage:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safari_replaceOccurrenceOfString:withString:link:", CFSTR("{learn-more-link}"), v20, CFSTR("learn-more://"));

  -[UITextView setAttributedText:](self->_messageLabel, "setAttributedText:", v19);
  objc_msgSend(v23, "dismissHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  dismissHandler = self->_dismissHandler;
  self->_dismissHandler = v21;

  -[SFPrivateRelayPromptBannerCell setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", objc_msgSend(v23, "userInterfaceStyle"));
  -[SFPrivateRelayPromptBannerCell setNeedsLayout](self, "setNeedsLayout");

}

- (id)_attributedStringForMessage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3778];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v6, 0, v7);
  v8 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v8, "setAlignment:", 1);
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v8, 0, v7);
  v9 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:value:range:", v9, v10, 0, v7);

  return v5;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[SFPrivateRelayPromptBannerCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)message
{
  return -[UITextView text](self->_messageLabel, "text");
}

- (void)setMessage:(id)a3
{
  -[UITextView setText:](self->_messageLabel, "setText:", a3);
  -[SFPrivateRelayPromptBannerCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTurnOnButton:(id)a3
{
  objc_storeStrong((id *)&self->_turnOnButton, a3);
  -[SFPrivateRelayPromptBannerCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDismissHandler:(id)a3
{
  void *v4;
  id dismissHandler;

  v4 = _Block_copy(a3);
  dismissHandler = self->_dismissHandler;
  self->_dismissHandler = v4;

  -[SFPrivateRelayPromptBannerCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", a3, a4, a5.location, a5.length, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportPrivateRelayModulePromptEvent:", CFSTR("Learn More"));

  objc_msgSend(MEMORY[0x1E0D8AAF8], "openPrivateRelayICloudSettings");
  return 0;
}

- (UIButton)turnOnButton
{
  return self->_turnOnButton;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_turnOnButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
