@implementation BPSSetupOptinViewController

- (BPSSetupOptinViewController)init
{
  BPSSetupOptinViewController *v2;
  BPSSetupOptinViewController *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BPSSetupOptinViewController;
  v2 = -[BPSSetupOptinViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  v3 = v2;
  if (v2
    && -[BPSSetupOptinViewController wantsAlternateChoicePillButton](v2, "wantsAlternateChoicePillButton")
    && -[BPSSetupOptinViewController wantsAlternateChoiceSystemButton](v3, "wantsAlternateChoiceSystemButton"))
  {
    bps_setup_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21147E000, v4, OS_LOG_TYPE_DEFAULT, "Declared CONFLICTING Alternate Button Choices! Choose either BPSSetupOptinLayoutStyleAlternateChoicePillButton or BPSSetupOptinLayoutStyleAlternateChoiceSystemButton", v6, 2u);
    }

  }
  return v3;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 0;
}

- (id)suggestedButtonTitle
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[BPSSetupOptinViewController wantsSuggestedChoicePillButton](self, "wantsSuggestedChoicePillButton"))
  {
    bps_setup_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSSetupOptinViewController suggestedButtonTitle]";
      _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "Wants Suggested Choice Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }

  }
  return 0;
}

- (id)alternateButtonTitle
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (-[BPSSetupOptinViewController wantsAlternateChoicePillButton](self, "wantsAlternateChoicePillButton")
    && -[BPSSetupOptinViewController wantsAlternateChoiceSystemButton](self, "wantsAlternateChoiceSystemButton"))
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[BPSSetupOptinViewController alternateButtonTitle]";
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "Wants Alternate Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
    }

  }
  return 0;
}

- (id)learnMoreButtonTitle
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[BPSSetupOptinViewController wantsLearnMoreButton](self, "wantsLearnMoreButton"))
  {
    bps_setup_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSSetupOptinViewController learnMoreButtonTitle]";
      _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "Wants Learn More Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }

  }
  return 0;
}

- (id)okayButtonTitle
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[BPSSetupOptinViewController wantsOkayPillButton](self, "wantsOkayPillButton"))
  {
    bps_setup_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSSetupOptinViewController okayButtonTitle]";
      _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "Wants OkayPillButton Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }

  }
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[BPSSetupOptinViewController wantsSuggestedChoicePillButton](self, "wantsSuggestedChoicePillButton", a3))
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSSetupOptinViewController suggestedButtonPressed:]";
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "Wants Suggested Choice Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)alternateButtonPressed:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (-[BPSSetupOptinViewController wantsAlternateChoicePillButton](self, "wantsAlternateChoicePillButton", a3)
    && -[BPSSetupOptinViewController wantsAlternateChoiceSystemButton](self, "wantsAlternateChoiceSystemButton"))
  {
    bps_setup_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[BPSSetupOptinViewController alternateButtonPressed:]";
      _os_log_impl(&dword_21147E000, v4, OS_LOG_TYPE_DEFAULT, "Wants Alternate Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)learnMoreButtonPressed:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[BPSSetupOptinViewController wantsLearnMoreButton](self, "wantsLearnMoreButton", a3))
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSSetupOptinViewController learnMoreButtonPressed:]";
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "Wants Learn More Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)okayButtonPressed:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[BPSSetupOptinViewController wantsOkayPillButton](self, "wantsOkayPillButton", a3))
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSSetupOptinViewController okayButtonPressed:]";
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "Wants OkayPillButton Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (id)detailTitleString
{
  return 0;
}

- (id)detailString
{
  return 0;
}

- (id)detailAttributedString
{
  return 0;
}

- (id)imageResource
{
  return 0;
}

- (id)imageResourceBundleIdentifier
{
  return 0;
}

- (id)imageTintColor
{
  return 0;
}

- (double)sidePadding
{
  void *v2;
  double RelevantZoomValue;
  _OWORD v5[2];
  int64x2_t v6;
  int64x2_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = &unk_24CBEFF50;
  v9[0] = &unk_24CBEFFC8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = xmmword_2114A22D0;
  v5[1] = xmmword_2114A22E0;
  v6 = vdupq_n_s64(0x4045C00000000000uLL);
  v7 = v6;
  RelevantZoomValue = BPSScreenValueGetRelevantZoomValue((double *)v5, v2);

  return RelevantZoomValue;
}

- (double)imageDetailPadding
{
  _OWORD v8[4];

  __asm { FMOV            V1.2D, #27.0 }
  v8[0] = xmmword_2114A22F0;
  v8[1] = _Q1;
  v8[2] = _Q1;
  v8[3] = _Q1;
  return BPSScreenValueGetRelevantValue((uint64_t)v8);
}

- (double)okayButtonTopPadding
{
  _OWORD v8[4];

  __asm { FMOV            V1.2D, #27.0 }
  v8[0] = xmmword_2114A22F0;
  v8[1] = _Q1;
  v8[2] = _Q1;
  v8[3] = _Q1;
  return BPSScreenValueGetRelevantValue((uint64_t)v8);
}

- (double)alternateButtonDetailTextPaddingWithImage
{
  _OWORD v8[4];

  __asm { FMOV            V1.2D, #27.0 }
  v8[0] = xmmword_2114A22F0;
  v8[1] = _Q1;
  v8[2] = xmmword_2114A2300;
  v8[3] = xmmword_2114A2310;
  return BPSScreenValueGetRelevantValue((uint64_t)v8);
}

- (double)noHWImageOffset
{
  __int128 v3;
  int64x2_t v4;
  int64x2_t v5;
  int64x2_t v6;

  v3 = xmmword_2114A2320;
  v4 = vdupq_n_s64(0x4059000000000000uLL);
  v5 = v4;
  v6 = v4;
  return BPSScreenValueGetRelevantValue((uint64_t)&v3);
}

- (double)noHWDetailOffset
{
  __int128 v3;
  int64x2_t v4;
  int64x2_t v5;
  int64x2_t v6;

  v3 = xmmword_2114A2330;
  v4 = vdupq_n_s64(0x4066800000000000uLL);
  v5 = v4;
  v6 = v4;
  return BPSScreenValueGetRelevantValue((uint64_t)&v3);
}

- (void)viewDidLoad
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIScrollView *v11;
  UIScrollView *scrollView;
  void *v13;
  double RelevantValue;
  uint64_t v20;
  UILabel *v21;
  UILabel *detailTextTitleLabel;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  UILabel *v31;
  UILabel *detailTextLabel;
  UILabel *v33;
  void *v34;
  UILabel *v35;
  void *v36;
  UILabel *v37;
  void *v38;
  UILabel *v39;
  void *v40;
  void *v41;
  BPSWatchView *v42;
  BPSWatchView *watchView;
  void *v44;
  void *v45;
  void *v46;
  double Width;
  double v48;
  double v49;
  _BOOL4 v50;
  _BOOL4 v51;
  _BOOL4 v52;
  _BOOL4 v53;
  UIButton *v54;
  UIButton *suggestedChoiceButton;
  UIButton *v56;
  UIButton *alternateChoiceButton;
  UIButton *v58;
  void *v59;
  UIButton *v60;
  void *v61;
  UIButton *v62;
  void *v63;
  UIButton *v64;
  UIButton *v65;
  UIButton *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  UIButton *v72;
  UIButton *v73;
  UIButton *okayButton;
  UIButton *v75;
  void *v76;
  void *v77;
  UIButton *v78;
  UIButton *learnMoreButton;
  UIButton *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  void *v90;
  void *v91;
  void *v92;
  objc_super v93;
  _BYTE buf[32];
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  CGRect v98;

  v97 = *MEMORY[0x24BDAC8D0];
  v93.receiver = self;
  v93.super_class = (Class)BPSSetupOptinViewController;
  -[BPSSetupPageViewController viewDidLoad](&v93, sel_viewDidLoad);
  if (!self->_style)
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "Error: Style should be set in -init! (%@ - %@)", buf, 0x16u);

    }
  }
  v6 = objc_alloc(MEMORY[0x24BDF6D50]);
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v11 = (UIScrollView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], v8, v9, v10);
  scrollView = self->_scrollView;
  self->_scrollView = v11;

  -[BPSSetupPageViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __asm { FMOV            V0.2D, #16.0 }
  v86 = xmmword_2114A2340;
  v88 = _Q0;
  *(_OWORD *)buf = xmmword_2114A2340;
  *(_OWORD *)&buf[16] = _Q0;
  v95 = _Q0;
  v96 = _Q0;
  RelevantValue = BPSScreenValueGetRelevantValue((uint64_t)buf);
  -[BPSSetupOptinViewController detailTitleString](self, "detailTitleString");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v7, v8, v9, v10);
  detailTextTitleLabel = self->_detailTextTitleLabel;
  self->_detailTextTitleLabel = v21;

  v23 = self->_detailTextTitleLabel;
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v23, "setBackgroundColor:", v24);

  v25 = self->_detailTextTitleLabel;
  BPSTextColor();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v25, "setTextColor:", v26);

  v27 = self->_detailTextTitleLabel;
  BPSFontWithSize(RelevantValue);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v27, "setFont:", v28);

  -[UILabel setTextAlignment:](self->_detailTextTitleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_detailTextTitleLabel, "setNumberOfLines:", 0);
  v92 = (void *)v20;
  -[UILabel setText:](self->_detailTextTitleLabel, "setText:", v20);
  objc_msgSend(v13, "addSubview:", self->_detailTextTitleLabel);
  -[BPSSetupOptinViewController detailString](self, "detailString");
  v29 = objc_claimAutoreleasedReturnValue();
  -[BPSSetupOptinViewController detailAttributedString](self, "detailAttributedString");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v29 | v30)
  {
    v31 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v7, v8, v9, v10);
    detailTextLabel = self->_detailTextLabel;
    self->_detailTextLabel = v31;

    v33 = self->_detailTextLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v33, "setBackgroundColor:", v34);

    v35 = self->_detailTextLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v35, "setTextColor:", v36);

    v37 = self->_detailTextLabel;
    BPSRegularFontWithSize(RelevantValue);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v37, "setFont:", v38);

    -[UILabel setTextAlignment:](self->_detailTextLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_detailTextLabel, "setNumberOfLines:", 0);
    v39 = self->_detailTextLabel;
    if (v29)
      -[UILabel setText:](v39, "setText:", v29);
    else
      -[UILabel setAttributedText:](v39, "setAttributedText:", v30);
    objc_msgSend(v13, "addSubview:", self->_detailTextLabel, 0x402E000000000000, 0x4030000000000000, v88);
  }
  if (-[BPSSetupOptinViewController wantsToShowWatchHW](self, "wantsToShowWatchHW", v86, v88))
  {
    -[BPSSetupOptinViewController imageResource](self, "imageResource");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSSetupOptinViewController imageResourceBundleIdentifier](self, "imageResourceBundleIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v42 = -[BPSWatchView initWithStyle:]([BPSWatchView alloc], "initWithStyle:", 2);
      watchView = self->_watchView;
      self->_watchView = v42;

      -[BPSWatchView setWantsLightenBlendedScreen:](self->_watchView, "setWantsLightenBlendedScreen:", -[BPSSetupOptinViewController wantsLightenBlendedScreen](self, "wantsLightenBlendedScreen"));
      -[BPSWatchView setScreenImageSearchBundleIdentifier:](self->_watchView, "setScreenImageSearchBundleIdentifier:", v41);
      -[BPSWatchView setScreenImageName:](self->_watchView, "setScreenImageName:", v40);
      objc_msgSend(v13, "addSubview:", self->_watchView);
    }

  }
  v90 = (void *)v30;
  v91 = (void *)v29;
  -[BPSSetupOptinViewController suggestedButtonTitle](self, "suggestedButtonTitle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSetupOptinViewController alternateButtonTitle](self, "alternateButtonTitle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSetupOptinViewController okayButtonTitle](self, "okayButtonTitle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  Width = CGRectGetWidth(v98);
  -[BPSSetupOptinViewController sidePadding](self, "sidePadding");
  v49 = Width + v48 * -2.0;
  BPSPillButtonImageDesiredSize(v44);
  BPSPillButtonImageDesiredSize(v45);
  v50 = -[BPSSetupOptinViewController wantsSuggestedChoicePillButton](self, "wantsSuggestedChoicePillButton", BPSPillButtonImageDesiredSize(v46));
  v51 = -[BPSSetupOptinViewController wantsAlternateChoicePillButton](self, "wantsAlternateChoicePillButton");
  v52 = -[BPSSetupOptinViewController wantsAlternateChoiceSystemButton](self, "wantsAlternateChoiceSystemButton");
  v53 = -[BPSSetupOptinViewController wantsOkayPillButton](self, "wantsOkayPillButton");
  if (v50)
  {
    if (v44)
    {
      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
      v54 = (UIButton *)objc_claimAutoreleasedReturnValue();
      suggestedChoiceButton = self->_suggestedChoiceButton;
      self->_suggestedChoiceButton = v54;

      -[UIButton addTarget:action:forControlEvents:](self->_suggestedChoiceButton, "addTarget:action:forControlEvents:", self, sel_suggestedButtonPressed_, 64);
    }
    if (v51)
    {
      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
      v56 = (UIButton *)objc_claimAutoreleasedReturnValue();
      alternateChoiceButton = self->_alternateChoiceButton;
      self->_alternateChoiceButton = v56;

      v58 = self->_alternateChoiceButton;
      BPSPillButtonImage(v45, v49, 0.0, 0, 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setImage:forState:](v58, "setImage:forState:", v59, 0);

      v60 = self->_suggestedChoiceButton;
      BPSPillButtonImage(v44, v49, 0.0, 0, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setImage:forState:](v60, "setImage:forState:", v61, 0);
    }
    else
    {
      v62 = self->_suggestedChoiceButton;
      BPSPillButtonImage(v44, v49, 0.0, 0, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setImage:forState:](v62, "setImage:forState:", v63, 0);

      if (!v52)
        goto LABEL_23;
      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
      v64 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v65 = self->_alternateChoiceButton;
      self->_alternateChoiceButton = v64;

      -[UIButton setTitle:forState:](self->_alternateChoiceButton, "setTitle:forState:", v45, 0);
      v66 = self->_alternateChoiceButton;
      BPSBridgeTintColor();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_accessibilityHigherContrastTintColorForColor:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](v66, "setTitleColor:forState:", v68, 0);

      -[UIButton titleLabel](self->_alternateChoiceButton, "titleLabel");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)buf = v87;
      *(_OWORD *)&buf[16] = v89;
      v95 = v89;
      v96 = v89;
      v70 = BPSScreenValueGetRelevantValue((uint64_t)buf);
      BPSRegularFontWithSize(v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setFont:", v71);

      v72 = self->_alternateChoiceButton;
      BPSTextColor();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](v72, "setTintColor:", v61);
    }

  }
LABEL_23:
  if (v53)
  {
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
    v73 = (UIButton *)objc_claimAutoreleasedReturnValue();
    okayButton = self->_okayButton;
    self->_okayButton = v73;

    v75 = self->_okayButton;
    BPSPillButtonImage(v46, v49, 0.0, 0, 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v75, "setImage:forState:", v76, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_okayButton, "addTarget:action:forControlEvents:", self, sel_okayButtonPressed_, 64);
  }
  -[UIButton addTarget:action:forControlEvents:](self->_alternateChoiceButton, "addTarget:action:forControlEvents:", self, sel_alternateButtonPressed_, 64);
  objc_msgSend(v13, "addSubview:", self->_alternateChoiceButton);
  objc_msgSend(v13, "addSubview:", self->_suggestedChoiceButton);
  objc_msgSend(v13, "addSubview:", self->_okayButton);
  if (-[BPSSetupOptinViewController wantsLearnMoreButton](self, "wantsLearnMoreButton"))
  {
    -[BPSSetupOptinViewController learnMoreButtonTitle](self, "learnMoreButtonTitle");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
      v78 = (UIButton *)objc_claimAutoreleasedReturnValue();
      learnMoreButton = self->_learnMoreButton;
      self->_learnMoreButton = v78;

      -[UIButton setTitle:forState:](self->_learnMoreButton, "setTitle:forState:", v77, 0);
      v80 = self->_learnMoreButton;
      BPSBridgeTintColor();
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_accessibilityHigherContrastTintColorForColor:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](v80, "setTitleColor:forState:", v82, 0);

      -[UIButton titleLabel](self->_learnMoreButton, "titleLabel");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      BPSRegularFontWithSize(RelevantValue);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setFont:", v84);

      -[UIButton addTarget:action:forControlEvents:](self->_learnMoreButton, "addTarget:action:forControlEvents:", self, sel_learnMoreButtonPressed_, 64);
      objc_msgSend(v13, "addSubview:", self->_learnMoreButton);
    }

  }
  -[BPSSetupOptinViewController view](self, "view");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "addSubview:", self->_scrollView);

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v13);
}

- (double)suggestedChoicePillDetailTextLabelVerticalOffset
{
  double v7;
  _OWORD v9[4];

  -[UILabel _firstLineBaselineFrameOriginY](self->_detailTextTitleLabel, "_firstLineBaselineFrameOriginY");
  __asm { FMOV            V1.2D, #27.0 }
  v9[0] = xmmword_2114A2350;
  v9[1] = _Q1;
  v9[2] = _Q1;
  v9[3] = _Q1;
  return v7 + BPSScreenValueGetRelevantValue((uint64_t)v9);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double RelevantZoomValue;
  double Width;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UILabel **p_detailTextTitleLabel;
  double v28;
  double v29;
  id *p_detailTextLabel;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v45;
  void *v46;
  _BOOL4 v47;
  _BOOL4 v48;
  _BOOL4 v49;
  double v50;
  double v51;
  double v52;
  float v53;
  double v54;
  double MaxY;
  double v56;
  float v57;
  double v58;
  double v59;
  CGFloat v60;
  UILabel *v61;
  double v62;
  double v63;
  id v64;
  double v66;
  float v67;
  double v68;
  double v69;
  double v70;
  double v71;
  float v72;
  double v73;
  double v74;
  double v75;
  double v76;
  float v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  id v86;
  double v87;
  float v88;
  CGFloat v89;
  double v90;
  double Height;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  float v103;
  float v104;
  void *v105;
  double v106;
  int64x2_t v107;
  double v108;
  double v109;
  double v110;
  CGFloat v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double rect;
  CGFloat v117;
  double v118;
  CGFloat v119;
  double v120;
  int64x2_t v121;
  CGFloat v122;
  double v123;
  int64x2_t v124;
  int64x2_t v125;
  int64x2_t v126;
  int64x2_t v127;
  objc_super v128;
  void *v129;
  void *v130;
  void *v131;
  _QWORD v132[3];
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;

  v132[1] = *MEMORY[0x24BDAC8D0];
  v128.receiver = self;
  v128.super_class = (Class)BPSSetupOptinViewController;
  -[BPSSetupPageViewController viewDidLayoutSubviews](&v128, sel_viewDidLayoutSubviews);
  -[BPSSetupOptinViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v131 = &unk_24CBEFF50;
  v132[0] = &unk_24CBEFFD8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v132, &v131, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = vdupq_n_s64(0x4040000000000000uLL);
  v125 = v124;
  v126 = v124;
  v127 = v124;
  RelevantZoomValue = BPSScreenValueGetRelevantZoomValue((double *)v124.i64, v12);

  v118 = RelevantZoomValue;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, RelevantZoomValue, v9, v11 - RelevantZoomValue);
  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 0);
  v133.origin.x = v5;
  v133.origin.y = v7;
  v133.size.width = v9;
  v117 = v11;
  v133.size.height = v11;
  Width = CGRectGetWidth(v133);
  -[BPSSetupOptinViewController sidePadding](self, "sidePadding");
  v16 = v15;
  v17 = *MEMORY[0x24BDBF148];
  v18 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[BPSWatchView sizeThatFits:](self->_watchView, "sizeThatFits:", *MEMORY[0x24BDBF148], v18);
  v20 = v19;
  v22 = v21;
  -[UIButton sizeThatFits:](self->_suggestedChoiceButton, "sizeThatFits:", v17, v18);
  rect = v23;
  v108 = v24;
  -[UIButton sizeThatFits:](self->_alternateChoiceButton, "sizeThatFits:", v17, v18);
  v112 = v25;
  v106 = v26;
  p_detailTextTitleLabel = &self->_detailTextTitleLabel;
  v119 = v16;
  v28 = Width + v16 * -2.0;
  -[UILabel sizeThatFits:](self->_detailTextTitleLabel, "sizeThatFits:", v28, 0.0);
  v115 = v29;
  p_detailTextLabel = (id *)&self->_detailTextLabel;
  -[UILabel sizeThatFits:](self->_detailTextLabel, "sizeThatFits:", v28, 0.0);
  v120 = v31;
  -[UIButton sizeThatFits:](self->_learnMoreButton, "sizeThatFits:", v17, v18);
  v113 = v32;
  v114 = v33;
  -[UIButton sizeThatFits:](self->_okayButton, "sizeThatFits:", v17, v18);
  v109 = v35;
  v110 = v34;
  v123 = Width;
  *(float *)&v34 = (Width - v20) * 0.5;
  v36 = floorf(*(float *)&v34);
  -[BPSSetupPageViewController titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_lastLineBaselineFrameOriginY");
  v39 = v38;
  __asm { FMOV            V0.2D, #20.0 }
  v107 = _Q0;
  v124 = (int64x2_t)xmmword_2114A2360;
  v125 = _Q0;
  v126 = _Q0;
  v127 = _Q0;
  v45 = v39 + BPSScreenValueGetRelevantValue((uint64_t)&v124);

  -[BPSWatchView setFrame:](self->_watchView, "setFrame:", v36, v45, v20, v22);
  -[BPSSetupOptinViewController imageResource](self, "imageResource");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = -[BPSSetupOptinViewController wantsSuggestedChoicePillButton](self, "wantsSuggestedChoicePillButton");
  v48 = -[BPSSetupOptinViewController wantsAlternateChoicePillButton](self, "wantsAlternateChoicePillButton");
  v49 = -[BPSSetupOptinViewController wantsAlternateChoiceSystemButton](self, "wantsAlternateChoiceSystemButton");
  if (!-[BPSSetupOptinViewController wantsToShowWatchHW](self, "wantsToShowWatchHW"))
  {
    -[BPSSetupOptinViewController noHWImageOffset](self, "noHWImageOffset");
    v22 = v50;
  }
  v51 = v118 * -2.0;
  if (v47)
  {
    v111 = v9;
    if (!v46)
    {
      -[BPSSetupOptinViewController noHWImageOffset](self, "noHWImageOffset");
      v22 = v52;
    }
    v53 = (v123 - rect) * 0.5;
    v54 = floorf(v53);
    v134.origin.x = v36;
    v134.origin.y = v45;
    v134.size.width = v20;
    v134.size.height = v22;
    MaxY = CGRectGetMaxY(v134);
    v124 = (int64x2_t)xmmword_2114A2360;
    v125 = v107;
    v126 = v107;
    v127 = v107;
    v56 = MaxY + BPSScreenValueGetRelevantValue((uint64_t)&v124);
    -[UIButton setFrame:](self->_suggestedChoiceButton, "setFrame:", v54, v56, rect, v108);
    if (v48 || v49)
    {
      v57 = (v123 - v112) * 0.5;
      v58 = floorf(v57);
      v135.origin.x = v54;
      v135.origin.y = v56;
      v135.size.width = rect;
      v135.size.height = v108;
      v59 = CGRectGetMaxY(v135) + 8.0;
      v60 = v106;
      -[UIButton setFrame:](self->_alternateChoiceButton, "setFrame:", v58, v59, v112, v106);
    }
    else
    {
      v60 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v112 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v58 = *MEMORY[0x24BDBF090];
      v59 = *(double *)(MEMORY[0x24BDBF090] + 8);
    }
    if (v48 || v49)
    {
      if (v46)
        -[BPSSetupOptinViewController alternateButtonDetailTextPaddingWithImage](self, "alternateButtonDetailTextPaddingWithImage");
      else
        -[BPSSetupOptinViewController noHWDetailOffset](self, "noHWDetailOffset");
      v84 = v79;
      v83 = v118 * -2.0;
      v145.origin.x = v58;
      v145.origin.y = v59;
      v145.size.width = v112;
      v145.size.height = v60;
      v82 = v84 + CGRectGetMaxY(v145);
    }
    else
    {
      v144.origin.x = v54;
      v144.origin.y = v56;
      v144.size.width = rect;
      v144.size.height = v108;
      v80 = CGRectGetMaxY(v144);
      v129 = &unk_24CBEFF50;
      v130 = &unk_24CBEFFE8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = (int64x2_t)xmmword_2114A2370;
      v125 = vdupq_n_s64(0x4055800000000000uLL);
      v126 = v125;
      v127 = v125;
      v82 = v80 + BPSScreenValueGetRelevantZoomValue((double *)v124.i64, v81);

      v83 = v118 * -2.0;
    }
    -[UILabel setFrame:](*p_detailTextTitleLabel, "setFrame:", v16, 0.0, v28, v115);
    -[UILabel _setFirstLineCapFrameOriginY:](*p_detailTextTitleLabel, "_setFirstLineCapFrameOriginY:", v82);
    v85 = v120;
    objc_msgSend(*p_detailTextLabel, "setFrame:", v16, 0.0, v28, v120);
    v86 = *p_detailTextLabel;
    -[BPSSetupOptinViewController suggestedChoicePillDetailTextLabelVerticalOffset](self, "suggestedChoicePillDetailTextLabelVerticalOffset");
    objc_msgSend(v86, "_setFirstLineBaselineFrameOriginY:");
    v87 = 0.0;
    if (self->_learnMoreButton)
    {
      v28 = v113;
      v88 = (v123 - v113) * 0.5;
      v89 = floorf(v88);
      objc_msgSend(*p_detailTextLabel, "frame");
      v87 = CGRectGetMaxY(v146) + 1.0;
      v119 = v89;
      v90 = v89;
      v85 = v114;
      -[UIButton setFrame:](self->_learnMoreButton, "setFrame:", v90, v87, v113, v114);
    }
    v147.origin.x = 0.0;
    v147.origin.y = v83;
    v147.size.width = v111;
    v147.size.height = v117;
    Height = CGRectGetHeight(v147);
    v92 = v85;
    v93 = v119;
    v94 = v87;
    v95 = v28;
    v122 = v92;
    if (!self->_learnMoreButton)
    {
      objc_msgSend(*p_detailTextLabel, "frame");
      v93 = v96;
      v94 = v97;
      v95 = v98;
      v92 = v99;
    }
    v148.origin.x = v93;
    v148.origin.y = v94;
    v148.size.width = v95;
    v148.size.height = v92;
    v100 = Height + -5.0;
    if (CGRectGetMaxY(v148) < v100)
    {
      v149.origin.x = v119;
      v149.origin.y = v87;
      v149.size.width = v28;
      v149.size.height = v122;
      if (CGRectGetMaxY(v149) < v100)
      {
        v51 = v118 * -2.0;
        v9 = v111;
        v70 = v117;
        goto LABEL_33;
      }
    }
    v150.origin.x = v93;
    v150.origin.y = v94;
    v150.size.width = v95;
    v150.size.height = v92;
    v101 = CGRectGetMaxY(v150);
    v151.origin.x = v119;
    v151.origin.y = v87;
    v151.size.width = v28;
    v151.size.height = v122;
    v102 = CGRectGetMaxY(v151);
    if (v101 >= v102)
      v102 = v101;
    v103 = v102;
    v70 = v103;
    v78 = v103 + 5.0;
    v51 = v118 * -2.0;
    v9 = v111;
LABEL_32:
    v104 = v78 + v118 * -2.0;
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, v104);
    goto LABEL_33;
  }
  -[UILabel setFrame:](*p_detailTextTitleLabel, "setFrame:", v16, 0.0, v28, v115);
  v61 = *p_detailTextTitleLabel;
  v136.origin.x = v36;
  v136.origin.y = v45;
  v136.size.width = v20;
  v136.size.height = v22;
  v62 = CGRectGetMaxY(v136);
  -[BPSSetupOptinViewController imageDetailPadding](self, "imageDetailPadding");
  -[UILabel _setFirstLineCapFrameOriginY:](v61, "_setFirstLineCapFrameOriginY:", v62 + v63);
  objc_msgSend(*p_detailTextLabel, "setFrame:", v16, 0.0, v28, v120);
  v64 = *p_detailTextLabel;
  -[UILabel _firstLineBaselineFrameOriginY](*p_detailTextTitleLabel, "_firstLineBaselineFrameOriginY");
  __asm { FMOV            V1.2D, #27.0 }
  v121 = _Q1;
  v124 = (int64x2_t)xmmword_2114A2350;
  v125 = _Q1;
  v126 = _Q1;
  v127 = _Q1;
  objc_msgSend(v64, "_setFirstLineBaselineFrameOriginY:", v66 + BPSScreenValueGetRelevantValue((uint64_t)&v124));
  v67 = (v123 - v113) * 0.5;
  v68 = floorf(v67);
  objc_msgSend(*p_detailTextLabel, "frame");
  v69 = CGRectGetMaxY(v137);
  v124 = (int64x2_t)xmmword_2114A22F0;
  v125 = v121;
  v126 = v121;
  v127 = v121;
  -[UIButton setFrame:](self->_learnMoreButton, "setFrame:", v68, v69 + BPSScreenValueGetRelevantValue((uint64_t)&v124), v113, v114);
  v138.origin.x = 0.0;
  v138.origin.y = v118 * -2.0;
  v138.size.width = v9;
  v70 = v117;
  v138.size.height = v117;
  v71 = CGRectGetHeight(v138);
  objc_msgSend(*p_detailTextLabel, "frame");
  if (CGRectIsEmpty(v139))
  {
    -[UILabel frame](*p_detailTextTitleLabel, "frame");
    if (CGRectIsEmpty(v140))
      p_detailTextLabel = (id *)&self->_watchView;
    else
      p_detailTextLabel = (id *)&self->_detailTextTitleLabel;
  }
  objc_msgSend(*p_detailTextLabel, "frame");
  v72 = (v123 - v110) * 0.5;
  v73 = floorf(v72);
  v74 = CGRectGetMaxY(v141);
  -[BPSSetupOptinViewController okayButtonTopPadding](self, "okayButtonTopPadding");
  v76 = v74 + v75;
  -[UIButton setFrame:](self->_okayButton, "setFrame:", v73, v76, v110, v109);
  v142.origin.x = v73;
  v142.origin.y = v76;
  v142.size.width = v110;
  v142.size.height = v109;
  if (CGRectGetMaxY(v142) >= v71 + -5.0)
  {
    v143.origin.x = v73;
    v143.origin.y = v76;
    v143.size.width = v110;
    v143.size.height = v109;
    v77 = CGRectGetMaxY(v143) + 5.0;
    v78 = v77;
    v70 = v78;
    goto LABEL_32;
  }
LABEL_33:
  -[BPSSetupPageViewController contentView](self, "contentView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setFrame:", 0.0, v51, v9, v70);

}

- (id)optinLocalizationStringsFile
{
  return CFSTR("OptinDescriptions");
}

- (id)optinLocalizationBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
}

- (void)showOptinConfirmationAlert:(id)a3 optinChoice:(BOOL)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  BOOL v37;
  uint8_t buf[8];
  _QWORD v39[5];
  BOOL v40;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_ENABLE_ALERT_TITLE"), v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_ENABLE_ALERT_BODY"), v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_ENABLE_ALERT_CANCEL"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_ENABLE_ALERT_OK"), v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF67F0];
  -[BPSSetupOptinViewController optinLocalizationBundle](self, "optinLocalizationBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSetupOptinViewController optinLocalizationStringsFile](self, "optinLocalizationStringsFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v7;
  objc_msgSend(v11, "localizedStringForKey:value:table:", v7, &stru_24CBE59D0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSetupOptinViewController optinLocalizationBundle](self, "optinLocalizationBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSetupOptinViewController optinLocalizationStringsFile](self, "optinLocalizationStringsFile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v8;
  objc_msgSend(v14, "localizedStringForKey:value:table:", v8, &stru_24CBE59D0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v13, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDF67E8];
  -[BPSSetupOptinViewController optinLocalizationBundle](self, "optinLocalizationBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSetupOptinViewController optinLocalizationStringsFile](self, "optinLocalizationStringsFile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", v9, &stru_24CBE59D0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v22);

  v23 = (void *)MEMORY[0x24BDF67E8];
  -[BPSSetupOptinViewController optinLocalizationBundle](self, "optinLocalizationBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSetupOptinViewController optinLocalizationStringsFile](self, "optinLocalizationStringsFile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __70__BPSSetupOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke;
  v39[3] = &unk_24CBE4BB0;
  v39[4] = self;
  v40 = a4;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v26, 0, v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v28);

  bps_setup_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21147E000, v29, OS_LOG_TYPE_DEFAULT, "Presenting 'opt-in confirmation' alert", buf, 2u);
  }

  v35[0] = v27;
  v35[1] = 3221225472;
  v35[2] = __70__BPSSetupOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke_48;
  v35[3] = &unk_24CBE4BD8;
  v37 = a4;
  v35[4] = self;
  v36 = v17;
  v30 = v17;
  -[BPSSetupOptinViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v30, 1, v35);

}

uint64_t __70__BPSSetupOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyConfirmedOptin:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __70__BPSSetupOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_madeOptinChoice:withAlertController:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  bps_setup_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[BPSSetupOptinViewController applyConfirmedOptin:]";
    _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)wantsSuggestedChoicePillButton
{
  return (LOBYTE(self->_style) >> 1) & 1;
}

- (BOOL)wantsAlternateChoicePillButton
{
  return (LOBYTE(self->_style) >> 2) & 1;
}

- (BOOL)wantsAlternateChoiceSystemButton
{
  return (LOBYTE(self->_style) >> 3) & 1;
}

- (BOOL)wantsLearnMoreButton
{
  return (LOBYTE(self->_style) >> 4) & 1;
}

- (BOOL)wantsToShowWatchHW
{
  return (LOBYTE(self->_style) >> 6) & 1;
}

- (BOOL)wantsOkayPillButton
{
  return (LOBYTE(self->_style) >> 5) & 1;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BPSWatchView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
  objc_storeStrong((id *)&self->_watchView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UILabel)detailTextTitleLabel
{
  return self->_detailTextTitleLabel;
}

- (void)setDetailTextTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextTitleLabel, a3);
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextLabel, a3);
}

- (UIButton)suggestedChoiceButton
{
  return self->_suggestedChoiceButton;
}

- (void)setSuggestedChoiceButton:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedChoiceButton, a3);
}

- (UIButton)alternateChoiceButton
{
  return self->_alternateChoiceButton;
}

- (void)setAlternateChoiceButton:(id)a3
{
  objc_storeStrong((id *)&self->_alternateChoiceButton, a3);
}

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (UIButton)okayButton
{
  return self->_okayButton;
}

- (void)setOkayButton:(id)a3
{
  objc_storeStrong((id *)&self->_okayButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_okayButton, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_alternateChoiceButton, 0);
  objc_storeStrong((id *)&self->_suggestedChoiceButton, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_detailTextTitleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
}

@end
