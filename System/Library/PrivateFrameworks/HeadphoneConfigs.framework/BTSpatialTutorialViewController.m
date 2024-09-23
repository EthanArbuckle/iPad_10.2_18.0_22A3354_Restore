@implementation BTSpatialTutorialViewController

- (BTSpatialTutorialViewController)initWithDevice:(id)a3
{
  id v5;
  BTSpatialTutorialViewController *v6;
  BTSpatialTutorialViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BTSpatialTutorialViewController;
  v6 = -[BTSpatialTutorialViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentDevice, a3);
    -[BTSpatialTutorialViewController initCommon](v7, "initCommon");
  }

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BTSpatialTutorialViewController;
  -[BTSpatialTutorialViewController loadView](&v3, sel_loadView);
  -[BTSpatialTutorialViewController setupWelcomeController](self, "setupWelcomeController");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BTSpatialTutorialViewController;
  -[BTSpatialTutorialViewController viewDidAppear:](&v17, sel_viewDidAppear_, 1);
  objc_msgSend(MEMORY[0x1E0CC24D0], "sharedCommandCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  objc_msgSend(MEMORY[0x1E0CC24D0], "sharedCommandCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__BTSpatialTutorialViewController_viewDidAppear___block_invoke;
  v16[3] = &unk_1EA29B5C8;
  v16[4] = self;
  v9 = (id)objc_msgSend(v7, "addTargetWithHandler:", v16);

  objc_msgSend(MEMORY[0x1E0CC24D0], "sharedCommandCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pauseCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", 1);

  objc_msgSend(MEMORY[0x1E0CC24D0], "sharedCommandCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pauseCommand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __49__BTSpatialTutorialViewController_viewDidAppear___block_invoke_2;
  v15[3] = &unk_1EA29B5C8;
  v15[4] = self;
  v14 = (id)objc_msgSend(v13, "addTargetWithHandler:", v15);

  if (!self->_mediaSessionStarted)
  {
    -[RMMediaSession _start](self->_mediaSession, "_start");
    self->_mediaSessionStarted = 1;
  }
  -[BTSpatialTutorialViewController checkStatusAndPlay](self, "checkStatusAndPlay");
}

uint64_t __49__BTSpatialTutorialViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "startPlayers");
  return 0;
}

uint64_t __49__BTSpatialTutorialViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "stopPlayers");
  return 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[BTSpatialTutorialViewController stopPlayingContent](self, "stopPlayingContent", a3);
  -[RMMediaSession _stop](self->_mediaSession, "_stop");
  self->_mediaSessionStarted = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D03378], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D033C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4750], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C896F0];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D48200];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", self, v12, v13);

  objc_msgSend(MEMORY[0x1E0CC24D0], "sharedCommandCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playCommand");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeTarget:", 0);

  objc_msgSend(MEMORY[0x1E0CC24D0], "sharedCommandCenter");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pauseCommand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeTarget:", 0);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BTSpatialTutorialViewController;
  -[BTSpatialTutorialViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[BTSpatialTutorialViewController setupConstraints](self, "setupConstraints");
}

- (void)initCommon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  OBWelcomeController *v10;
  OBWelcomeController *welcomeController;
  UIStackView *v12;
  UIStackView *stackView;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UISegmentedControl *v21;
  UISegmentedControl *segmentedControl;
  UIView *v23;
  UIView *spacerView;
  VPSpatialTutorialContentView *v25;
  VPSpatialTutorialContentView *spatialTutorialContentView;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIAlertController *v32;
  UIAlertController *alert;
  UIAlertController *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  NSMutableArray *constraints;
  RMMediaSession *v41;
  RMMediaSession *mediaSession;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[5];

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)MGGetStringAnswer(), "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SPATIAL_AUDIO_DETAIL_"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA29D890, CFSTR("DeviceConfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D651B8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (OBWelcomeController *)objc_msgSend(v7, "initWithTitle:detailText:icon:contentLayout:", v9, v6, 0, 2);
  welcomeController = self->_welcomeController;
  self->_welcomeController = v10;

  v12 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  stackView = self->_stackView;
  self->_stackView = v12;

  v14 = objc_alloc(MEMORY[0x1E0DC3C58]);
  v15 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_STEREO_OPTION"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_SPATIAL_OPTION"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithObjects:", v17, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (UISegmentedControl *)objc_msgSend(v14, "initWithItems:", v20);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v21;

  v23 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  spacerView = self->_spacerView;
  self->_spacerView = v23;

  v25 = (VPSpatialTutorialContentView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6F70]), "initWithMode:", 0);
  spatialTutorialContentView = self->_spatialTutorialContentView;
  self->_spatialTutorialContentView = v25;

  -[BTSDevice classicDevice](self->_currentDevice, "classicDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "productId");

  +[HPSProductUtils getProductSpecificString:descriptionKey:](HPSProductUtils, "getProductSpecificString:descriptionKey:", v28, CFSTR("SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSDevice classicDevice](self->_currentDevice, "classicDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v30, "getAACPCapabilityBit:", 32);

  if ((_DWORD)v17)
  {
    +[HPSProductUtils getProductSpecificString:descriptionKey:](HPSProductUtils, "getProductSpecificString:descriptionKey:", v28, CFSTR("SPATIAL_TUTORIAL_NOT_ON_HEAD_WARNING"));
    v31 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v31;
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v29, &stru_1EA29D890, 1);
  v32 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alert = self->_alert;
  self->_alert = v32;

  v34 = self->_alert;
  v35 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __45__BTSpatialTutorialViewController_initCommon__block_invoke;
  v53[3] = &unk_1EA29A880;
  v53[4] = self;
  objc_msgSend(v35, "actionWithTitle:style:handler:", v37, 0, v53);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v34, "addAction:", v38);

  v39 = (NSMutableArray *)objc_opt_new();
  constraints = self->_constraints;
  self->_constraints = v39;

  v41 = (RMMediaSession *)objc_opt_new();
  mediaSession = self->_mediaSession;
  self->_mediaSession = v41;

  self->_mediaSessionStarted = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObserver:selector:name:object:", self, sel_inEarStatusChangedHandler_, *MEMORY[0x1E0D03378], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObserver:selector:name:object:", self, sel_deviceDisconnectedHandler_, *MEMORY[0x1E0D033C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *MEMORY[0x1E0C896F0];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObserver:selector:name:object:", self, sel_handleAudioSessionInterruption_, v48, v49);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = *MEMORY[0x1E0D48200];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObserver:selector:name:object:", self, sel_handleMediaServerConnectionDied_, v51, v52);

}

uint64_t __45__BTSpatialTutorialViewController_initCommon__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissWelcomeController");
}

- (void)setupWelcomeController
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[BTSpatialTutorialViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[OBWelcomeController view](self->_welcomeController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[OBWelcomeController view](self->_welcomeController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoresizingMask:", 18);

  -[BTSpatialTutorialViewController setupStackView](self, "setupStackView");
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_BUTTON_DONE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:forState:", v15, 0);

  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_quitSpatialTutorial_, 64);
  -[OBWelcomeController buttonTray](self->_welcomeController, "buttonTray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addButton:", v19);

  -[BTSpatialTutorialViewController addChildViewController:](self, "addChildViewController:", self->_welcomeController);
  -[BTSpatialTutorialViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self->_welcomeController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

}

- (void)setupStackView
{
  id v3;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 3);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", 0);
  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel_segmentControlValueChanged_, 4096);
  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VPSpatialTutorialContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_spatialTutorialContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_segmentedControl);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_spacerView);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_spatialTutorialContentView);
  -[OBWelcomeController contentView](self->_welcomeController, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_stackView);

}

- (void)setupConstraints
{
  NSMutableArray *constraints;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  float v22;
  NSMutableArray *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableArray *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  if (-[NSMutableArray count](self->_constraints, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
    -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  }
  constraints = self->_constraints;
  -[UISegmentedControl leadingAnchor](self->_segmentedControl, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self->_welcomeController, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](constraints, "addObject:", v7);

  v8 = self->_constraints;
  -[UISegmentedControl trailingAnchor](self->_segmentedControl, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self->_welcomeController, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v8, "addObject:", v12);

  v13 = self->_constraints;
  -[UIView heightAnchor](self->_spacerView, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl heightAnchor](self->_segmentedControl, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v13, "addObject:", v16);

  -[OBWelcomeController headerView](self->_welcomeController, "headerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v18 = 400.0;
  if (v19 <= 400.0)
  {
    -[OBWelcomeController headerView](self->_welcomeController, "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = v21;
    v18 = v22;

  }
  v23 = self->_constraints;
  -[VPSpatialTutorialContentView widthAnchor](self->_spatialTutorialContentView, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v23, "addObject:", v25);

  v26 = self->_constraints;
  -[VPSpatialTutorialContentView heightAnchor](self->_spatialTutorialContentView, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v26, "addObject:", v28);

  v29 = self->_constraints;
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self->_welcomeController, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v29, "addObject:", v33);

  v34 = self->_constraints;
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self->_welcomeController, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v34, "addObject:", v38);

  v39 = self->_constraints;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self->_welcomeController, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v39, "addObject:", v43);

  v44 = self->_constraints;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self->_welcomeController, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v44, "addObject:", v48);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
}

- (void)startPlayingContent
{
  -[VPSpatialTutorialContentView startPlayers](self->_spatialTutorialContentView, "startPlayers");
}

- (void)stopPlayingContent
{
  -[VPSpatialTutorialContentView stopPlayers](self->_spatialTutorialContentView, "stopPlayers");
}

- (void)checkStatusAndPlay
{
  UIAlertController *alert;
  _QWORD v4[5];

  -[BTSpatialTutorialViewController updateInEarState](self, "updateInEarState");
  if (self->_budsInEar)
  {
    if (self->_alertShowing)
    {
      alert = self->_alert;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __53__BTSpatialTutorialViewController_checkStatusAndPlay__block_invoke;
      v4[3] = &unk_1EA29A770;
      v4[4] = self;
      -[UIAlertController dismissViewControllerAnimated:completion:](alert, "dismissViewControllerAnimated:completion:", 1, v4);
    }
    else
    {
      -[BTSpatialTutorialViewController startPlayingContent](self, "startPlayingContent");
    }
  }
  else if (!self->_alertShowing)
  {
    -[BTSpatialTutorialViewController showAlert](self, "showAlert");
  }
}

uint64_t __53__BTSpatialTutorialViewController_checkStatusAndPlay__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1034) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "startPlayingContent");
}

- (void)dismissWelcomeController
{
  UIAlertController *alert;
  _QWORD v4[5];

  -[BTSpatialTutorialViewController stopPlayingContent](self, "stopPlayingContent");
  if (self->_alertShowing)
  {
    alert = self->_alert;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__BTSpatialTutorialViewController_dismissWelcomeController__block_invoke;
    v4[3] = &unk_1EA29A770;
    v4[4] = self;
    -[UIAlertController dismissViewControllerAnimated:completion:](alert, "dismissViewControllerAnimated:completion:", 1, v4);
  }
  else
  {
    -[BTSpatialTutorialViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_62);
  }
}

uint64_t __59__BTSpatialTutorialViewController_dismissWelcomeController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_10);
}

- (void)updateInEarState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v7 = 0x300000003;
  -[BTSpatialTutorialViewController currentDevice](self, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inEarStatusPrimary:secondary:", (char *)&v7 + 4, &v7);

  self->_budsInEar = v7 == 0;
  -[BTSDevice classicDevice](self->_currentDevice, "classicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "productId") == 8215)
  {
    self->_budsInEar = 1;
  }
  else
  {
    -[BTSDevice classicDevice](self->_currentDevice, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_budsInEar |= objc_msgSend(v6, "productId") == 8229;

  }
}

- (void)showAlert
{
  -[BTSpatialTutorialViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alert, 1, 0);
  self->_alertShowing = 1;
}

- (void)segmentControlValueChanged:(id)a3
{
  NSInteger v4;
  uint64_t v5;

  v4 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex", a3);
  if (v4)
  {
    if (v4 != 1)
      return;
    -[RMMediaSession _resetTrackingForAllClients](self->_mediaSession, "_resetTrackingForAllClients");
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  -[VPSpatialTutorialContentView setMode:](self->_spatialTutorialContentView, "setMode:", v5);
}

- (void)deviceDisconnectedHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSpatialTutorialViewController currentDevice](self, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
    -[BTSpatialTutorialViewController dismissWelcomeController](self, "dismissWelcomeController");

}

- (void)powerChangedHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enabled");

  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = "off";
    if (v6)
      v10 = "on";
    v11 = 138412546;
    v12 = v8;
    v13 = 2080;
    v14 = v10;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ with power state %s", (uint8_t *)&v11, 0x16u);

  }
  -[BTSpatialTutorialViewController dismissWelcomeController](self, "dismissWelcomeController");

}

- (void)handleAudioSessionInterruption:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C89718]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5 == 1)
    -[BTSpatialTutorialViewController dismissWelcomeController](self, "dismissWelcomeController");

}

- (void)handleMediaServerConnectionDied:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Audio session server connection died", v5, 2u);
  }

  -[BTSpatialTutorialViewController dismissWelcomeController](self, "dismissWelcomeController");
}

- (void)inEarStatusChangedHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  char v14;
  int v15;
  UIAlertController *alert;
  _QWORD v17[5];
  uint8_t buf[4];
  NSObject *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSpatialTutorialViewController currentDevice](self, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryInEarStatus"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryInEarStatus"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject BOOLValue](v9, "BOOLValue");
    v12 = v11 | objc_msgSend(v10, "BOOLValue");
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 1024;
      v23 = v12 ^ 1;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "PrimaryInEar: %@, secondaryInEar : %@. newBudsInEar: %d", buf, 0x1Cu);
    }

    if (self->_alertShowing)
      v14 = v12;
    else
      v14 = 1;
    if ((v14 & 1) != 0)
    {
      if (self->_alertShowing)
        v15 = 0;
      else
        v15 = v12;
      if (v15 == 1)
      {
        -[BTSpatialTutorialViewController stopPlayingContent](self, "stopPlayingContent");
        -[BTSpatialTutorialViewController showAlert](self, "showAlert");
      }
    }
    else
    {
      alert = self->_alert;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__BTSpatialTutorialViewController_inEarStatusChangedHandler___block_invoke;
      v17[3] = &unk_1EA29A770;
      v17[4] = self;
      -[UIAlertController dismissViewControllerAnimated:completion:](alert, "dismissViewControllerAnimated:completion:", 1, v17);
    }

  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Device does not match, cannot handle In Ear Status change", buf, 2u);
    }
  }

}

uint64_t __61__BTSpatialTutorialViewController_inEarStatusChangedHandler___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1034) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "startPlayingContent");
}

- (BTSDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_mediaSession, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_spatialTutorialContentView, 0);
  objc_storeStrong((id *)&self->_spacerView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end
