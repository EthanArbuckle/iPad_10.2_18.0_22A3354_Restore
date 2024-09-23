@implementation BPSWelcomeOptinViewController

- (BPSWelcomeOptinViewController)init
{
  BPSWelcomeOptinViewController *v2;
  BPSWelcomeOptinViewController *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BPSWelcomeOptinViewController;
  v2 = -[BPSWelcomeOptinViewController initWithTitle:detailText:icon:contentLayout:](&v7, sel_initWithTitle_detailText_icon_contentLayout_, &stru_24CBE59D0, 0, 0, 2);
  v3 = v2;
  if (v2
    && -[BPSWelcomeOptinViewController wantsAlternateChoicePillButton](v2, "wantsAlternateChoicePillButton")
    && -[BPSWelcomeOptinViewController wantsAlternateChoiceSystemButton](v3, "wantsAlternateChoiceSystemButton"))
  {
    bps_setup_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21147E000, v4, OS_LOG_TYPE_DEFAULT, "Declared CONFLICTING Alternate Button Choices! Choose either BPSWelcomeOptinLayoutStyleAlternateChoicePillButton or BPSWelcomeOptinLayoutStyleAlternateChoiceSystemButton", v6, 2u);
    }

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BPSWelcomeOptinViewController _removeButtonObservers](self, "_removeButtonObservers");
  v3.receiver = self;
  v3.super_class = (Class)BPSWelcomeOptinViewController;
  -[BPSWelcomeOptinViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)wantsLightenBlendedScreen
{
  return 0;
}

- (id)suggestedButtonTitle
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (-[BPSWelcomeOptinViewController wantsSuggestedChoicePillButton](self, "wantsSuggestedChoicePillButton")
    || -[BPSWelcomeOptinViewController wantsSuggestedChoiceLinkButton](self, "wantsSuggestedChoiceLinkButton"))
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[BPSWelcomeOptinViewController suggestedButtonTitle]";
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "Wants Suggested Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
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
  if (-[BPSWelcomeOptinViewController wantsAlternateChoicePillButton](self, "wantsAlternateChoicePillButton")
    || -[BPSWelcomeOptinViewController wantsAlternateChoiceSystemButton](self, "wantsAlternateChoiceSystemButton"))
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[BPSWelcomeOptinViewController alternateButtonTitle]";
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
  if (-[BPSWelcomeOptinViewController wantsLearnMoreButton](self, "wantsLearnMoreButton"))
  {
    bps_setup_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSWelcomeOptinViewController learnMoreButtonTitle]";
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
  if (-[BPSWelcomeOptinViewController wantsOkayPillButton](self, "wantsOkayPillButton"))
  {
    bps_setup_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSWelcomeOptinViewController okayButtonTitle]";
      _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "Wants OkayPillButton Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }

  }
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (-[BPSWelcomeOptinViewController wantsSuggestedChoicePillButton](self, "wantsSuggestedChoicePillButton", a3)
    || -[BPSWelcomeOptinViewController wantsSuggestedChoiceLinkButton](self, "wantsSuggestedChoiceLinkButton"))
  {
    bps_setup_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[BPSWelcomeOptinViewController suggestedButtonPressed:]";
      _os_log_impl(&dword_21147E000, v4, OS_LOG_TYPE_DEFAULT, "Wants Suggested Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
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
  if (-[BPSWelcomeOptinViewController wantsAlternateChoicePillButton](self, "wantsAlternateChoicePillButton", a3)
    && -[BPSWelcomeOptinViewController wantsAlternateChoiceSystemButton](self, "wantsAlternateChoiceSystemButton"))
  {
    bps_setup_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[BPSWelcomeOptinViewController alternateButtonPressed:]";
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
  if (-[BPSWelcomeOptinViewController wantsLearnMoreButton](self, "wantsLearnMoreButton", a3))
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSWelcomeOptinViewController learnMoreButtonPressed:]";
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
  if (-[BPSWelcomeOptinViewController wantsOkayPillButton](self, "wantsOkayPillButton", a3))
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BPSWelcomeOptinViewController okayButtonPressed:]";
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "Wants OkayPillButton Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (BOOL)wantsInternalFPOLabel
{
  return 0;
}

- (id)titleString
{
  return 0;
}

- (id)titleAttributedString
{
  return 0;
}

- (id)detailTitleString
{
  return 0;
}

- (id)detailString
{
  return 0;
}

- (id)detailAtrributedString
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

- (id)captionText
{
  return 0;
}

- (id)privacyBundles
{
  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  BPSIllustratedWatchView *v5;
  BPSIllustratedWatchView *v6;
  uint64_t v7;
  BPSIllustratedWatchView *illustratedWatchView;
  void *v9;
  BPSWatchView *v10;
  BPSWatchView *watchView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *watchViewBottomConstraint;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[5];
  objc_super v64;
  uint8_t buf[4];
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v64.receiver = self;
  v64.super_class = (Class)BPSWelcomeOptinViewController;
  -[OBBaseWelcomeController viewDidLoad](&v64, sel_viewDidLoad);
  -[BPSWelcomeOptinViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1036831949;
  objc_msgSend(v3, "setTitleHyphenationFactor:", v4);

  if (-[BPSWelcomeOptinViewController wantsToShowWatchHW](self, "wantsToShowWatchHW"))
  {
    if (_os_feature_enabled_impl())
    {
      v5 = [BPSIllustratedWatchView alloc];
      v6 = -[BPSIllustratedWatchView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      v7 = 1200;
      illustratedWatchView = self->_illustratedWatchView;
      self->_illustratedWatchView = v6;

      -[BPSWelcomeOptinViewController contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_illustratedWatchView);

    }
    else
    {
      v10 = -[BPSWatchView initWithStyle:]([BPSWatchView alloc], "initWithStyle:", 2);
      v7 = 1192;
      watchView = self->_watchView;
      self->_watchView = v10;

      -[BPSWelcomeOptinViewController contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_watchView);

      -[BPSWatchView setWantsInternalFPOLabel:](self->_watchView, "setWantsInternalFPOLabel:", -[BPSWelcomeOptinViewController wantsInternalFPOLabel](self, "wantsInternalFPOLabel"));
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    watchViewBottomConstraint = self->_watchViewBottomConstraint;
    self->_watchViewBottomConstraint = v20;

    -[NSLayoutConstraint setActive:](self->_watchViewBottomConstraint, "setActive:", 1);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

  }
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __44__BPSWelcomeOptinViewController_viewDidLoad__block_invoke;
  v63[3] = &unk_24CBE4C00;
  v63[4] = self;
  v26 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BDABD0](v63);
  -[BPSWelcomeOptinViewController suggestedButtonTitle](self, "suggestedButtonTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27 || -[BPSWelcomeOptinViewController wantsSuggestedChoicePillButton](self, "wantsSuggestedChoicePillButton"))
  {

  }
  else if (!-[BPSWelcomeOptinViewController wantsSuggestedChoiceLinkButton](self, "wantsSuggestedChoiceLinkButton"))
  {
    v35 = 0;
    goto LABEL_15;
  }
  v28 = -[BPSWelcomeOptinViewController wantsSuggestedChoicePillButton](self, "wantsSuggestedChoicePillButton");
  if (v28)
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController setSuggestedChoiceButton:](self, "setSuggestedChoiceButton:", v29);

    -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v26)[2](v26, v30);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController setSuggestedChoiceButton:](self, "setSuggestedChoiceButton:", v30);
  }

  -[BPSWelcomeOptinViewController privacyBundles](self, "privacyBundles");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addTarget:action:forEvents:", self, sel__didTapPrivacyAccept_, 64);

  }
  -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addTarget:action:forControlEvents:", self, sel_suggestedButtonPressed_, 64);

  v35 = !v28;
LABEL_15:
  -[BPSWelcomeOptinViewController alternateButtonTitle](self, "alternateButtonTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36 || -[BPSWelcomeOptinViewController wantsAlternateChoicePillButton](self, "wantsAlternateChoicePillButton"))
  {

  }
  else if (!-[BPSWelcomeOptinViewController wantsAlternateChoiceSystemButton](self, "wantsAlternateChoiceSystemButton"))
  {
    goto LABEL_23;
  }
  if ((v35 & 1) != 0
    || !-[BPSWelcomeOptinViewController wantsAlternateChoicePillButton](self, "wantsAlternateChoicePillButton"))
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController setAlternateChoiceButton:](self, "setAlternateChoiceButton:", v38);
    v39 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController setAlternateChoiceButton:](self, "setAlternateChoiceButton:", v37);

    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v26)[2](v26, v38);
    v39 = 0;
  }

  -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addTarget:action:forControlEvents:", self, sel_alternateButtonPressed_, 64);

  v35 |= v39;
LABEL_23:
  -[BPSWelcomeOptinViewController okayButtonTitle](self, "okayButtonTitle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {

    goto LABEL_26;
  }
  if (-[BPSWelcomeOptinViewController wantsOkayPillButton](self, "wantsOkayPillButton"))
  {
LABEL_26:
    -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {

    }
    else
    {
      -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
        v44 = 1;
      else
        v44 = v35;
      if ((v44 & 1) == 0 && -[BPSWelcomeOptinViewController wantsOkayPillButton](self, "wantsOkayPillButton"))
      {
        objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[BPSWelcomeOptinViewController setOkayButton:](self, "setOkayButton:", v45);

        -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v26)[2](v26, v46);
LABEL_35:

        -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addTarget:action:forControlEvents:", self, sel_okayButtonPressed_, 64);

        goto LABEL_36;
      }
    }
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController setOkayButton:](self, "setOkayButton:", v46);
    goto LABEL_35;
  }
LABEL_36:
  -[BPSWelcomeOptinViewController refreshViews](self, "refreshViews");
  -[BPSWelcomeOptinViewController learnMoreButtonTitle](self, "learnMoreButtonTitle");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    v50 = -[BPSWelcomeOptinViewController wantsLearnMoreButton](self, "wantsLearnMoreButton");

    if (v50)
    {
      if (-[BPSWelcomeOptinViewController hasDetailText](self, "hasDetailText"))
      {
        objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[BPSWelcomeOptinViewController setLearnMoreButton:](self, "setLearnMoreButton:", v51);

        -[BPSWelcomeOptinViewController learnMoreButton](self, "learnMoreButton");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[BPSWelcomeOptinViewController learnMoreButtonTitle](self, "learnMoreButtonTitle");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setTitle:forState:", v53, 0);

        -[BPSWelcomeOptinViewController learnMoreButton](self, "learnMoreButton");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addTarget:action:forControlEvents:", self, sel_learnMoreButtonPressed_, 64);

        -[BPSWelcomeOptinViewController headerView](self, "headerView");
        v55 = objc_claimAutoreleasedReturnValue();
        -[BPSWelcomeOptinViewController learnMoreButton](self, "learnMoreButton");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addAccessoryButton:](v55, "addAccessoryButton:", v56);
      }
      else
      {
        bps_setup_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          goto LABEL_48;
        v57 = (objc_class *)objc_opt_class();
        NSStringFromClass(v57);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v66 = v56;
        _os_log_impl(&dword_21147E000, v55, OS_LOG_TYPE_DEFAULT, "Error: %@ wants learnMoreButton but no detail text was provided, this is not supported", buf, 0xCu);
      }

LABEL_48:
    }
  }
  -[BPSWelcomeOptinViewController privacyBundles](self, "privacyBundles");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "count");

  if (v59)
  {
    -[BPSWelcomeOptinViewController buttonTray](self, "buttonTray");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController privacyBundles](self, "privacyBundles");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addPrivacyLinkForBundles:", v61);
LABEL_53:

    goto LABEL_54;
  }
  -[BPSWelcomeOptinViewController captionText](self, "captionText");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[BPSWelcomeOptinViewController buttonTray](self, "buttonTray");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController captionText](self, "captionText");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addCaptionText:", v61);
    goto LABEL_53;
  }
LABEL_54:
  -[BPSWelcomeOptinViewController _addButtonObservers](self, "_addButtonObservers");
  self->_hasFinishedLoadingView = 1;

}

void __44__BPSWelcomeOptinViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "useBridgeStyling"))
  {
    BPSPillSelectedColor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v3);

    BPSPillDeselectedColor();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BPSPillButtonBackground(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundImage:forState:", v5, 2);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.7, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitleColor:forState:", v6, 2);

  }
}

- (void)refreshViews
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  if (-[BPSWelcomeOptinViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[BPSWelcomeOptinViewController headerView](self, "headerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController titleString](self, "titleString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v4);

    -[BPSWelcomeOptinViewController detailString](self, "detailString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v36 = v5;
    }
    else
    {
      -[BPSWelcomeOptinViewController detailAtrributedString](self, "detailAtrributedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "string");
      v36 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[BPSWelcomeOptinViewController headerView](self, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDetailText:", v36);

    -[BPSWelcomeOptinViewController setHasDetailText:](self, "setHasDetailText:", v36 != 0);
    -[BPSWelcomeOptinViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

    -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController suggestedButtonTitle](self, "suggestedButtonTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forState:", v11, 0);

    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController alternateButtonTitle](self, "alternateButtonTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v13, 0);

    -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController okayButtonTitle](self, "okayButtonTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:forState:", v15, 0);

    -[BPSWelcomeOptinViewController _refreshButtonTray](self, "_refreshButtonTray");
    if (-[BPSWelcomeOptinViewController wantsToShowWatchHW](self, "wantsToShowWatchHW")
      && (-[BPSWelcomeOptinViewController imageResource](self, "imageResource"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v16))
    {
      if (_os_feature_enabled_impl())
      {
        v17 = 1200;
      }
      else
      {
        v17 = 1192;
        -[BPSWatchView setWantsLightenBlendedScreen:](self->_watchView, "setWantsLightenBlendedScreen:", -[BPSWelcomeOptinViewController wantsLightenBlendedScreen](self, "wantsLightenBlendedScreen"));
      }
      v33 = *(Class *)((char *)&self->super.super.super.super.super.isa + v17);
      -[BPSWelcomeOptinViewController imageResourceBundleIdentifier](self, "imageResourceBundleIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setScreenImageSearchBundleIdentifier:", v34);

      v35 = *(Class *)((char *)&self->super.super.super.super.super.isa + v17);
      -[BPSWelcomeOptinViewController imageResource](self, "imageResource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setScreenImageName:", v19);
    }
    else
    {
      -[BPSWelcomeOptinViewController imageResource](self, "imageResource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
LABEL_21:

        return;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSWelcomeOptinViewController imageResourceBundleIdentifier](self, "imageResourceBundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = (void *)MEMORY[0x24BDD1488];
        -[BPSWelcomeOptinViewController imageResourceBundleIdentifier](self, "imageResourceBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bundleWithIdentifier:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v23;
      }
      v24 = (void *)MEMORY[0x24BDF6AC8];
      -[BPSWelcomeOptinViewController imageResource](self, "imageResource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "imageNamed:inBundle:", v25, v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v27 = (void *)MEMORY[0x24BDF6AC8];
        -[BPSWelcomeOptinViewController imageResource](self, "imageResource");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "systemImageNamed:", v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[BPSWelcomeOptinViewController imageTintColor](self, "imageTintColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[BPSWelcomeOptinViewController imageTintColor](self, "imageTintColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "imageWithTintColor:", v30);
        v31 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v31;
      }
      -[BPSWelcomeOptinViewController headerView](self, "headerView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setIcon:accessibilityLabel:", v26, 0);

    }
    goto LABEL_21;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BPSWelcomeOptinViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[BPSWelcomeOptinViewController _startTapToRadarActivity](self, "_startTapToRadarActivity");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BPSWelcomeOptinViewController;
  -[BPSWelcomeOptinViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[BPSWelcomeOptinViewController _endTapToRadarActivity](self, "_endTapToRadarActivity");
}

- (void)_addButtonObservers
{
  void *v3;
  void *v4;
  id v5;

  -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("hidden"), 1, BPSWelcomeOptinViewControllerKVOContext);

  -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("hidden"), 1, BPSWelcomeOptinViewControllerKVOContext);

  -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("hidden"), 1, BPSWelcomeOptinViewControllerKVOContext);

}

- (void)_removeButtonObservers
{
  void *v3;
  void *v4;
  id v5;

  -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("hidden"));

  -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("hidden"));

  -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("hidden"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if ((void *)BPSWelcomeOptinViewControllerKVOContext == a6)
  {
    if (objc_msgSend(CFSTR("hidden"), "isEqualToString:", a3, a4, a5))
      -[BPSWelcomeOptinViewController _refreshButtonTray](self, "_refreshButtonTray");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BPSWelcomeOptinViewController;
    -[BPSWelcomeOptinViewController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_refreshButtonTray
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  NSObject *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  objc_class *v35;
  int v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[BPSWelcomeOptinViewController suggestedButtonTitle](self, "suggestedButtonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[BPSWelcomeOptinViewController wantsSuggestedChoicePillButton](self, "wantsSuggestedChoicePillButton")
     || -[BPSWelcomeOptinViewController wantsSuggestedChoiceLinkButton](self, "wantsSuggestedChoiceLinkButton")))
  {
    -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden") ^ 1;

  }
  else
  {
    v5 = 0;
  }

  -[BPSWelcomeOptinViewController alternateButtonTitle](self, "alternateButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (-[BPSWelcomeOptinViewController wantsAlternateChoiceSystemButton](self, "wantsAlternateChoiceSystemButton")
     || -[BPSWelcomeOptinViewController wantsAlternateChoicePillButton](self, "wantsAlternateChoicePillButton")))
  {
    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isHidden") ^ 1;

  }
  else
  {
    v8 = 0;
  }

  -[BPSWelcomeOptinViewController okayButtonTitle](self, "okayButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && -[BPSWelcomeOptinViewController wantsOkayPillButton](self, "wantsOkayPillButton"))
  {
    -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isHidden") ^ 1;

  }
  else
  {
    v11 = 0;
  }

  if ((_DWORD)v5 == -[BPSWelcomeOptinViewController showSuggestedButton](self, "showSuggestedButton")
    && (_DWORD)v8 == -[BPSWelcomeOptinViewController showAlternateButton](self, "showAlternateButton")
    && (_DWORD)v11 == -[BPSWelcomeOptinViewController showOkayButton](self, "showOkayButton")
    && self->_hasFinishedLoadingView)
  {
    goto LABEL_50;
  }
  -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[BPSWelcomeOptinViewController buttonTray](self, "buttonTray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeButton:", v15);

  }
  -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[BPSWelcomeOptinViewController buttonTray](self, "buttonTray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeButton:", v19);

  }
  -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[BPSWelcomeOptinViewController buttonTray](self, "buttonTray");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeButton:", v23);

  }
  if (!(_DWORD)v5)
  {
    if (!(_DWORD)v8)
      goto LABEL_27;
    goto LABEL_36;
  }
  -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[BPSWelcomeOptinViewController buttonTray](self, "buttonTray");
    v25 = objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addButton:](v25, "addButton:", v26);
LABEL_31:

    goto LABEL_35;
  }
  bps_setup_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138412290;
    v37 = v26;
    _os_log_impl(&dword_21147E000, v25, OS_LOG_TYPE_DEFAULT, "Error: %@ wants suggestedChoiceButton but none was initialized", (uint8_t *)&v36, 0xCu);
    goto LABEL_31;
  }
LABEL_35:

  if (!(_DWORD)v8)
  {
LABEL_27:
    if (!(_DWORD)v11)
      goto LABEL_50;
LABEL_43:
    -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[BPSWelcomeOptinViewController buttonTray](self, "buttonTray");
      v33 = objc_claimAutoreleasedReturnValue();
      -[BPSWelcomeOptinViewController okayButton](self, "okayButton");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addButton:](v33, "addButton:", v34);
    }
    else
    {
      bps_setup_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412290;
      v37 = v34;
      _os_log_impl(&dword_21147E000, v33, OS_LOG_TYPE_DEFAULT, "Error: %@ wants okayButton but none was initialized", (uint8_t *)&v36, 0xCu);
    }

LABEL_49:
    goto LABEL_50;
  }
LABEL_36:
  -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[BPSWelcomeOptinViewController buttonTray](self, "buttonTray");
    v29 = objc_claimAutoreleasedReturnValue();
    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addButton:](v29, "addButton:", v30);
LABEL_38:

    goto LABEL_42;
  }
  bps_setup_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138412290;
    v37 = v30;
    _os_log_impl(&dword_21147E000, v29, OS_LOG_TYPE_DEFAULT, "Error: %@ wants alternateChoiceButton but none was initialized", (uint8_t *)&v36, 0xCu);
    goto LABEL_38;
  }
LABEL_42:

  if ((_DWORD)v11)
    goto LABEL_43;
LABEL_50:
  -[BPSWelcomeOptinViewController setShowSuggestedButton:](self, "setShowSuggestedButton:", v5);
  -[BPSWelcomeOptinViewController setShowAlternateButton:](self, "setShowAlternateButton:", v8);
  -[BPSWelcomeOptinViewController setShowOkayButton:](self, "setShowOkayButton:", v11);
}

- (id)optinLocalizationStringsFile
{
  return CFSTR("OptinDescriptions");
}

- (id)optinLocalizationBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
}

- (id)localizedTitle
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  bps_setup_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[BPSWelcomeOptinViewController localizedTitle]";
    _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)localizedInformativeText
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  bps_setup_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[BPSWelcomeOptinViewController localizedInformativeText]";
    _os_log_impl(&dword_21147E000, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
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
  void *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  void *v32;
  uint8_t buf[16];
  _QWORD v34[5];
  BOOL v35;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_ENABLE_ALERT_TITLE"), v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_ENABLE_ALERT_BODY"), v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_ENABLE_ALERT_CANCEL"), v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_ENABLE_ALERT_OK"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF67F0];
  -[BPSWelcomeOptinViewController optinLocalizationBundle](self, "optinLocalizationBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSWelcomeOptinViewController optinLocalizationStringsFile](self, "optinLocalizationStringsFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v7;
  objc_msgSend(v11, "localizedStringForKey:value:table:", v7, &stru_24CBE59D0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSWelcomeOptinViewController optinLocalizationBundle](self, "optinLocalizationBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSWelcomeOptinViewController optinLocalizationStringsFile](self, "optinLocalizationStringsFile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v8;
  objc_msgSend(v14, "localizedStringForKey:value:table:", v8, &stru_24CBE59D0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v13, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDF67E8];
  -[BPSWelcomeOptinViewController optinLocalizationBundle](self, "optinLocalizationBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSWelcomeOptinViewController optinLocalizationStringsFile](self, "optinLocalizationStringsFile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", v29, &stru_24CBE59D0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v22);

  v23 = (void *)MEMORY[0x24BDF67E8];
  -[BPSWelcomeOptinViewController optinLocalizationBundle](self, "optinLocalizationBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSWelcomeOptinViewController optinLocalizationStringsFile](self, "optinLocalizationStringsFile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", v9, &stru_24CBE59D0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __72__BPSWelcomeOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke;
  v34[3] = &unk_24CBE4BB0;
  v34[4] = self;
  v35 = a4;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v26, 0, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v27);

  bps_setup_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21147E000, v28, OS_LOG_TYPE_DEFAULT, "Presenting 'opt-in confirmation' alert", buf, 2u);
  }

  -[BPSWelcomeOptinViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
}

uint64_t __72__BPSWelcomeOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyConfirmedOptin:", *(unsigned __int8 *)(a1 + 40));
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
    v5 = "-[BPSWelcomeOptinViewController applyConfirmedOptin:]";
    _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

}

- (id)followUpIdentifier
{
  return 0;
}

- (BOOL)wantsFollowUpNotification
{
  return 0;
}

- (id)followUpActions
{
  return 0;
}

- (id)_baseIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[BPSFollowUpController baseDomainIdentifier](BPSFollowUpController, "baseDomainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSWelcomeOptinViewController followUpIdentifier](self, "followUpIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addFollowUpForPageAndDevice:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BPSWelcomeOptinViewController _baseIdentifier](self, "_baseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BE6B400]);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    bps_setup_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_21147E000, v11, OS_LOG_TYPE_DEFAULT, "Add FollowUp for identifier %{public}@...", buf, 0xCu);
    }

    bps_setup_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl(&dword_21147E000, v12, OS_LOG_TYPE_DEFAULT, "...for device: %{public}@", buf, 0xCu);
    }

    v20[0] = CFSTR("title");
    -[BPSWelcomeOptinViewController localizedTitle](self, "localizedTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v20[1] = CFSTR("description");
    -[BPSWelcomeOptinViewController localizedInformativeText](self, "localizedInformativeText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v14;
    v20[2] = CFSTR("followUpActions");
    -[BPSWelcomeOptinViewController followUpActions](self, "followUpActions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[BPSFollowUpAttributes attributeWithOptions:](BPSFollowUpAttributes, "attributeWithOptions:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __76__BPSWelcomeOptinViewController_addFollowUpForPageAndDevice_withCompletion___block_invoke;
    v18[3] = &unk_24CBE4B20;
    v19 = v7;
    +[BPSFollowUpController addFollowUpForIdentifier:withAttributes:withCompletion:](BPSFollowUpController, "addFollowUpForIdentifier:withAttributes:withCompletion:", v10, v17, v18);

  }
  else
  {
    bps_setup_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21147E000, v9, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
    }
  }

}

uint64_t __76__BPSWelcomeOptinViewController_addFollowUpForPageAndDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addFollowUpForPageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BPSWelcomeOptinViewController _baseIdentifier](self, "_baseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bps_setup_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "Add Global FollowUp for %{public}@", buf, 0xCu);
    }

    v14[0] = CFSTR("title");
    -[BPSWelcomeOptinViewController localizedTitle](self, "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v14[1] = CFSTR("description");
    -[BPSWelcomeOptinViewController localizedInformativeText](self, "localizedInformativeText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    v14[2] = CFSTR("followUpActions");
    -[BPSWelcomeOptinViewController followUpActions](self, "followUpActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[BPSFollowUpAttributes attributeWithOptions:](BPSFollowUpAttributes, "attributeWithOptions:", v11);
    v7 = objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__BPSWelcomeOptinViewController_addFollowUpForPageWithCompletion___block_invoke;
    v12[3] = &unk_24CBE4B20;
    v13 = v4;
    +[BPSFollowUpController addFollowUpForIdentifier:withAttributes:withCompletion:](BPSFollowUpController, "addFollowUpForIdentifier:withAttributes:withCompletion:", v5, v7, v12);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
  }

}

uint64_t __66__BPSWelcomeOptinViewController_addFollowUpForPageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeFollowupForPageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BPSWelcomeOptinViewController followUpIdentifier](self, "followUpIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bps_setup_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "Remove identifier %{public}@", buf, 0xCu);
    }

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __69__BPSWelcomeOptinViewController_removeFollowupForPageWithCompletion___block_invoke;
    v8[3] = &unk_24CBE4B20;
    v9 = v4;
    +[BPSFollowUpController removeFollowUpForIdentifier:withCompletion:](BPSFollowUpController, "removeFollowUpForIdentifier:withCompletion:", v5, v8);
    v7 = v9;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21147E000, v7, OS_LOG_TYPE_DEFAULT, "Error!! Removing a FollowUp requires dictating an identifier!", buf, 2u);
  }

}

uint64_t __69__BPSWelcomeOptinViewController_removeFollowupForPageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)markPaneAsSkipped
{
  if (!-[BPSWelcomeOptinViewController isDisplayingInSkippedMiniFlow](self, "isDisplayingInSkippedMiniFlow"))
    +[BPSFollowUpController markSkippedSetupPaneClassForCurrentDevice:](BPSFollowUpController, "markSkippedSetupPaneClassForCurrentDevice:", objc_opt_class());
}

- (id)tapToRadarMetadata
{
  return -[BPSTTRMetadata initWithComponent:]([BPSTTRMetadata alloc], "initWithComponent:", 0);
}

- (void)openTapToRadar
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  -[BPSWelcomeOptinViewController tapToRadarMetadata](self, "tapToRadarMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[BPSTapToRadarCoordinator openTapToRadarWithInitialMetadata:](BPSTapToRadarCoordinator, "openTapToRadarWithInitialMetadata:", v2);
  }
  else
  {
    bps_setup_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "Error!! Could not retrieve metadata for tap to radar!", v4, 2u);
    }

  }
}

- (void)_startTapToRadarActivity
{
  void *v3;
  void *v4;
  NSUserActivity *v5;
  NSUserActivity *tapToRadarActivity;
  NSUserActivity *v7;
  NSObject *v8;
  uint8_t v9[16];

  if (PBIsInternalInstall())
  {
    -[BPSWelcomeOptinViewController tapToRadarMetadata](self, "tapToRadarMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[BPSWelcomeOptinViewController tapToRadarMetadata](self, "tapToRadarMetadata");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[BPSTapToRadarCoordinator tapToRadarUserActivityWithInitialMetadata:](BPSTapToRadarCoordinator, "tapToRadarUserActivityWithInitialMetadata:", v4);
      v5 = (NSUserActivity *)objc_claimAutoreleasedReturnValue();
      tapToRadarActivity = self->_tapToRadarActivity;
      self->_tapToRadarActivity = v5;

      v7 = self->_tapToRadarActivity;
      if (v7)
      {
        -[NSUserActivity becomeCurrent](v7, "becomeCurrent");
      }
      else
      {
        bps_setup_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_21147E000, v8, OS_LOG_TYPE_DEFAULT, "Error: We're eligible to raise a TTR NSUserActivity but it could not be generated, so we're aborting.", v9, 2u);
        }

      }
    }
  }
}

- (void)_endTapToRadarActivity
{
  NSUserActivity *tapToRadarActivity;
  NSUserActivity *v4;

  tapToRadarActivity = self->_tapToRadarActivity;
  if (tapToRadarActivity)
  {
    -[NSUserActivity invalidate](tapToRadarActivity, "invalidate");
    v4 = self->_tapToRadarActivity;
    self->_tapToRadarActivity = 0;

  }
}

- (void)_didTapPrivacyAccept:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id obj;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[8];
  uint64_t v32;
  Class (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  -[BPSWelcomeOptinViewController privacyBundles](self, "privacyBundles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BPSWelcomeOptinViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setupFlowUserInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "objectForKey:", CFSTR("BPSPairingFlowIsTinkerPairing"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      objc_msgSend(v24, "objectForKey:", CFSTR("BPSPairingFlowFamilyMember"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dsid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9
        || (objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "ams_iTunesAccountWithDSID:", v9),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            !v11))
      {
        bps_setup_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21147E000, v12, OS_LOG_TYPE_DEFAULT, "Error acknowledging privacy bundle: alt account pairing but we could not map an alt ACAccount", buf, 2u);
        }

        v11 = 0;
      }

    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x24BDB4398]);
      objc_msgSend(v13, "aa_primaryAppleAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[BPSWelcomeOptinViewController privacyBundles](self, "privacyBundles");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v28;
      v16 = MEMORY[0x24BDAC760];
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
          v36 = 0;
          v37 = &v36;
          v38 = 0x2050000000;
          v19 = (void *)getAMSAcknowledgePrivacyTaskClass_softClass;
          v39 = getAMSAcknowledgePrivacyTaskClass_softClass;
          if (!getAMSAcknowledgePrivacyTaskClass_softClass)
          {
            *(_QWORD *)buf = v16;
            v32 = 3221225472;
            v33 = __getAMSAcknowledgePrivacyTaskClass_block_invoke;
            v34 = &unk_24CBE4A00;
            v35 = &v36;
            __getAMSAcknowledgePrivacyTaskClass_block_invoke((uint64_t)buf);
            v19 = (void *)v37[3];
          }
          v20 = objc_retainAutorelease(v19);
          _Block_object_dispose(&v36, 8);
          v21 = (void *)objc_msgSend([v20 alloc], "initWithPrivacyIdentifier:account:", v18, v11);
          objc_msgSend(v21, "acknowledgePrivacy");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v16;
          v26[1] = 3221225472;
          v26[2] = __54__BPSWelcomeOptinViewController__didTapPrivacyAccept___block_invoke;
          v26[3] = &unk_24CBE4C28;
          v26[4] = v18;
          objc_msgSend(v22, "addFinishBlock:", v26);

          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
      }
      while (v14);
    }

  }
}

void __54__BPSWelcomeOptinViewController__didTapPrivacyAccept___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  bps_setup_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_21147E000, v6, OS_LOG_TYPE_DEFAULT, "Successfully acknowledged privacy for %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_21147E000, v6, OS_LOG_TYPE_DEFAULT, "Error acknowledging privacy for %{public}@: %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

+ (id)expressModeSettingsItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(a1, "expressModeSettingsString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v6);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "imageForExpressSetting");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setImage:", v7);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)wantsSuggestedChoicePillButton
{
  return (LOBYTE(self->_style) >> 1) & 1;
}

- (BOOL)wantsSuggestedChoiceLinkButton
{
  return LOBYTE(self->_style) >> 7;
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

- (id)imageTintColor
{
  return 0;
}

- (BOOL)useBridgeStyling
{
  return 1;
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

- (BPSIllustratedWatchView)illustratedWatchView
{
  return self->_illustratedWatchView;
}

- (void)setIllustratedWatchView:(id)a3
{
  objc_storeStrong((id *)&self->_illustratedWatchView, a3);
}

- (BPSBuddyControllerDelegate)delegate
{
  return (BPSBuddyControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDisplayingInSkippedMiniFlow
{
  return self->_isDisplayingInSkippedMiniFlow;
}

- (void)setIsDisplayingInSkippedMiniFlow:(BOOL)a3
{
  self->_isDisplayingInSkippedMiniFlow = a3;
}

- (OBTrayButton)suggestedChoiceButton
{
  return self->_suggestedChoiceButton;
}

- (void)setSuggestedChoiceButton:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedChoiceButton, a3);
}

- (OBTrayButton)alternateChoiceButton
{
  return self->_alternateChoiceButton;
}

- (void)setAlternateChoiceButton:(id)a3
{
  objc_storeStrong((id *)&self->_alternateChoiceButton, a3);
}

- (OBTrayButton)okayButton
{
  return self->_okayButton;
}

- (void)setOkayButton:(id)a3
{
  objc_storeStrong((id *)&self->_okayButton, a3);
}

- (OBHeaderAccessoryButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (NSLayoutConstraint)watchViewBottomConstraint
{
  return self->_watchViewBottomConstraint;
}

- (void)setWatchViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_watchViewBottomConstraint, a3);
}

- (BOOL)showSuggestedButton
{
  return self->_showSuggestedButton;
}

- (void)setShowSuggestedButton:(BOOL)a3
{
  self->_showSuggestedButton = a3;
}

- (BOOL)showAlternateButton
{
  return self->_showAlternateButton;
}

- (void)setShowAlternateButton:(BOOL)a3
{
  self->_showAlternateButton = a3;
}

- (BOOL)showOkayButton
{
  return self->_showOkayButton;
}

- (void)setShowOkayButton:(BOOL)a3
{
  self->_showOkayButton = a3;
}

- (BOOL)hasFinishedLoadingView
{
  return self->_hasFinishedLoadingView;
}

- (void)setHasFinishedLoadingView:(BOOL)a3
{
  self->_hasFinishedLoadingView = a3;
}

- (BOOL)hasDetailText
{
  return self->_hasDetailText;
}

- (void)setHasDetailText:(BOOL)a3
{
  self->_hasDetailText = a3;
}

- (NSUserActivity)tapToRadarActivity
{
  return self->_tapToRadarActivity;
}

- (void)setTapToRadarActivity:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarActivity, 0);
  objc_storeStrong((id *)&self->_watchViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_okayButton, 0);
  objc_storeStrong((id *)&self->_alternateChoiceButton, 0);
  objc_storeStrong((id *)&self->_suggestedChoiceButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_illustratedWatchView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
}

@end
