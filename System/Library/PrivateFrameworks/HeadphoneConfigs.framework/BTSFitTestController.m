@implementation BTSFitTestController

- (BTSFitTestController)initWithDevice:(id)a3
{
  id v5;
  BluetoothDevice **p_currentDevice;
  UIView *v7;
  UIView *fitTestContentView;
  UIStackView *v9;
  UIStackView *stackViewImages;
  AVSystemController *v11;
  AVSystemController *avSystemController;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  double initialVolume;
  UIActivityIndicatorView *v25;
  UIActivityIndicatorView *spinner;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  UIView *v32;
  UIView *leftBudLabel;
  UIView *v34;
  UIView *rightBudLabel;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  UIImageView *v40;
  UIImageView *leftBudLabelImageView;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  UIImageView *v46;
  UIImageView *rightBudLabelImageView;
  UIImage *v48;
  UIImage *buttonImage;
  void *v50;
  void *v51;
  UILabel *v52;
  UILabel *leftBudResultLabel;
  UILabel *v54;
  UILabel *rightBudResultLabel;
  UILabel *v56;
  UILabel *resultDetailLabel;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id completionHandler;
  const char *v66;
  void *v67;
  const char *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  UIImageView *v77;
  UIImageView *leftImView;
  void *v79;
  void *v80;
  void *v81;
  UIImageView *v82;
  UIImageView *rightImView;
  void *v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  _BOOL4 darkMode;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  _QWORD *v102;
  void *v103;
  uint64_t v104;
  id v105;
  NSObject *v106;
  NSObject *v107;
  HPSDeviceAnalytics *v108;
  HPSDeviceAnalytics *deviceAnalytics;
  void *v111;
  void *v112;
  BluetoothDevice **v113;
  id v114;
  unsigned int v115;
  objc_super v116;
  uint64_t v117;
  uint8_t buf[4];
  _BYTE v119[10];
  __int16 v120;
  unsigned int v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
  {
    v116.receiver = self;
    v116.super_class = (Class)BTSFitTestController;
    self = -[BTSFitTestController init](&v116, sel_init);
    p_currentDevice = &self->currentDevice;
    objc_storeStrong((id *)&self->currentDevice, a3);
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    fitTestContentView = self->_fitTestContentView;
    self->_fitTestContentView = v7;

    v9 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackViewImages = self->_stackViewImages;
    self->_stackViewImages = v9;

    v11 = (AVSystemController *)objc_alloc_init(MEMORY[0x1E0D48560]);
    avSystemController = self->_avSystemController;
    self->_avSystemController = v11;

    self->_testActive = 0;
    self->_initialVolume = 0.0;
    self->_volumeModified = 0;
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "getVolume:forCategory:", &self->_initialVolume, CFSTR("Audio/Video"));

    if ((v14 & 1) == 0)
    {
      sharedBluetoothSettingsLogComponent();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[BTSFitTestController initWithDevice:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);

    }
    v113 = &self->currentDevice;
    sharedBluetoothSettingsLogComponent();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      initialVolume = self->_initialVolume;
      *(_DWORD *)buf = 134217984;
      *(double *)v119 = initialVolume;
      _os_log_impl(&dword_1DB30C000, v23, OS_LOG_TYPE_DEFAULT, "Fit Test: Volume before fit test : %0.9f", buf, 0xCu);
    }

    v25 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v25;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
    v27 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v28 = *MEMORY[0x1E0C9D648];
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v30 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v32 = (UIView *)objc_msgSend(v27, "initWithFrame:", *MEMORY[0x1E0C9D648], v29, v30, v31);
    leftBudLabel = self->_leftBudLabel;
    self->_leftBudLabel = v32;

    v34 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v28, v29, v30, v31);
    rightBudLabel = self->_rightBudLabel;
    self->_rightBudLabel = v34;

    v36 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("left.circle.fill"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "imageWithTintColor:renderingMode:", v38, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (UIImageView *)objc_msgSend(v36, "initWithImage:", v39);
    leftBudLabelImageView = self->_leftBudLabelImageView;
    self->_leftBudLabelImageView = v40;

    v42 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("right.circle.fill"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "imageWithTintColor:renderingMode:", v44, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (UIImageView *)objc_msgSend(v42, "initWithImage:", v45);
    rightBudLabelImageView = self->_rightBudLabelImageView;
    self->_rightBudLabelImageView = v46;

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("play.fill"));
    v48 = (UIImage *)objc_claimAutoreleasedReturnValue();
    buttonImage = self->_buttonImage;
    self->_buttonImage = v48;

    -[UIView setSize:](self->_leftBudLabel, "setSize:", 18.0, 18.0);
    -[UIView _setContinuousCornerRadius:](self->_leftBudLabel, "_setContinuousCornerRadius:", 9.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_leftBudLabel, "setBackgroundColor:", v50);

    -[UIView setSize:](self->_rightBudLabel, "setSize:", 18.0, 18.0);
    -[UIView _setContinuousCornerRadius:](self->_rightBudLabel, "_setContinuousCornerRadius:", 9.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_rightBudLabel, "setBackgroundColor:", v51);

    -[UIView addSubview:](self->_leftBudLabel, "addSubview:", self->_leftBudLabelImageView);
    -[UIView addSubview:](self->_rightBudLabel, "addSubview:", self->_rightBudLabelImageView);
    v52 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v28, v29, v30, v31);
    leftBudResultLabel = self->_leftBudResultLabel;
    self->_leftBudResultLabel = v52;

    v54 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v28, v29, v30, v31);
    rightBudResultLabel = self->_rightBudResultLabel;
    self->_rightBudResultLabel = v54;

    v56 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v28, v29, v30, v31);
    resultDetailLabel = self->_resultDetailLabel;
    self->_resultDetailLabel = v56;

    -[UILabel setText:](self->_leftBudResultLabel, "setText:", &stru_1EA29D890);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_leftBudResultLabel, "setTextColor:", v58);

    -[UILabel setTextAlignment:](self->_leftBudResultLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_leftBudResultLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_leftBudResultLabel, "setLineBreakMode:", 0);
    v59 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_leftBudResultLabel, "setFont:", v60);

    -[UILabel setAlpha:](self->_leftBudResultLabel, "setAlpha:", 1.0);
    -[UILabel setText:](self->_rightBudResultLabel, "setText:", &stru_1EA29D890);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_rightBudResultLabel, "setTextColor:", v61);

    -[UILabel setTextAlignment:](self->_rightBudResultLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_rightBudResultLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_rightBudResultLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v59);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_rightBudResultLabel, "setFont:", v62);

    -[UILabel setAlpha:](self->_rightBudResultLabel, "setAlpha:", 1.0);
    -[UILabel setText:](self->_resultDetailLabel, "setText:", &stru_1EA29D890);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_resultDetailLabel, "setTextColor:", v63);

    -[UILabel setTextAlignment:](self->_resultDetailLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_resultDetailLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_resultDetailLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v59);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_resultDetailLabel, "setFont:", v64);

    -[UILabel setAlpha:](self->_resultDetailLabel, "setAlpha:", 1.0);
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    if (self->_darkMode)
      v66 = "dark";
    else
      v66 = "light";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FitTest-Left-%s"), v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_darkMode)
      v68 = "dark";
    else
      v68 = "light";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FitTest-Right-%s"), v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BluetoothDevice productId](*p_currentDevice, "productId") == 8210)
    {
      *(_DWORD *)buf = 17;
      -[BluetoothDevice getDeviceColor:](*p_currentDevice, "getDeviceColor:", buf);
      -[BTSFitTestController getImageFileName:forSide:](self, "getImageFileName:forSide:", *(unsigned int *)buf, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      -[BTSFitTestController getImageFileName:forSide:](self, "getImageFileName:forSide:", *(unsigned int *)buf, 1);
      v71 = objc_claimAutoreleasedReturnValue();

      v69 = (void *)v71;
    }
    else
    {
      v70 = v67;
    }
    if (-[BluetoothDevice productId](*p_currentDevice, "productId") == 8221)
    {
      *(_DWORD *)buf = 17;
      -[BluetoothDevice getDeviceColor:](*p_currentDevice, "getDeviceColor:", buf);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("B498-Left-FitTest-CL%d"), *(unsigned int *)buf);
      v72 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("B498-Right-FitTest-CL%d"), *(unsigned int *)buf);
      v73 = objc_claimAutoreleasedReturnValue();

      v70 = (void *)v72;
      v69 = (void *)v73;
    }
    v74 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v70;
    objc_msgSend(v74, "imageNamed:inBundle:compatibleWithTraitCollection:", v70, v75, 0);
    v76 = objc_claimAutoreleasedReturnValue();

    v111 = (void *)v76;
    v77 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v76);
    leftImView = self->_leftImView;
    self->_leftImView = v77;

    v79 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "imageNamed:inBundle:compatibleWithTraitCollection:", v69, v80, 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v81);
    rightImView = self->_rightImView;
    self->_rightImView = v82;

    -[BTSFitTestController traitCollection](self, "traitCollection");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    self->_darkMode = objc_msgSend(v84, "userInterfaceStyle") == 2;

    if (-[BluetoothDevice productId](*v113, "productId") == 8221)
    {
      objc_msgSend(MEMORY[0x1E0DC3890], "_headphoneGetAssetsDictionary:", -[BluetoothDevice productId](*v113, "productId"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = -[BluetoothDevice productId](*v113, "productId");
      v115 = 17;
      -[BluetoothDevice getDeviceColor:](*v113, "getDeviceColor:", &v115);
      sharedBluetoothSettingsLogComponent();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        darkMode = self->_darkMode;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v119 = v86;
        *(_WORD *)&v119[4] = 1024;
        *(_DWORD *)&v119[6] = darkMode;
        v120 = 1024;
        v121 = v115;
        _os_log_impl(&dword_1DB30C000, v87, OS_LOG_TYPE_DEFAULT, "Initialized filter paramters: pid - %d, darkMode - %d, deviceColor - %d", buf, 0x14u);
      }

      -[UIImageView _headphoneApplyFilters:pid:darkMode:deviceColor:](self->_leftImView, "_headphoneApplyFilters:pid:darkMode:deviceColor:", v85, v86, self->_darkMode, v115);
      -[UIImageView _headphoneApplyFilters:pid:darkMode:deviceColor:](self->_rightImView, "_headphoneApplyFilters:pid:darkMode:deviceColor:", v85, v86, self->_darkMode, v115);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "addObserver:selector:name:object:", self, sel_inEarStatusChanged_, *MEMORY[0x1E0D03378], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addObserver:selector:name:object:", self, sel_sealValueChanged_, *MEMORY[0x1E0D03380], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObserver:selector:name:object:", self, sel_deviceDisconnectedHandler_, *MEMORY[0x1E0D033C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObserver:selector:name:object:", self, sel_powerChangedHandler_, *MEMORY[0x1E0D03390], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = *MEMORY[0x1E0C896F0];
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObserver:selector:name:object:", self, sel_handleAudioSessionInterruption_, v96, v97);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = *MEMORY[0x1E0D48200];
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v100 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "addObserver:selector:name:object:", self, sel_handleMediaServerConnectionDied_, v99, v100);

    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (_QWORD *)MEMORY[0x1E0D47EF0];
    v117 = *MEMORY[0x1E0D47EF0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = *MEMORY[0x1E0D48280];
    v114 = 0;
    LOBYTE(v100) = objc_msgSend(v101, "setAttribute:forKey:error:", v103, v104, &v114);
    v105 = v114;

    sharedBluetoothSettingsLogComponent();
    v106 = objc_claimAutoreleasedReturnValue();
    v107 = v106;
    if ((v100 & 1) != 0)
    {
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v107, OS_LOG_TYPE_INFO, "Fit Test: Successfully set AVSC attribute. Register listener for Call Active notification", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v107 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObserver:selector:name:object:](v107, "addObserver:selector:name:object:", self, sel_handleCallIsActiveDidChangeNotification_, *v102, 0);
    }
    else if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      -[BTSFitTestController initWithDevice:].cold.1();
    }

    v108 = objc_alloc_init(HPSDeviceAnalytics);
    deviceAnalytics = self->_deviceAnalytics;
    self->_deviceAnalytics = v108;

  }
  return self;
}

- (void)dealloc
{
  void *v3;
  OBWelcomeController *fitTestController;
  OBTrayButton *playButton;
  AVSystemController *avSystemController;
  AVAudioPlayer *player;
  UIView *fitTestContentView;
  UIStackView *stackViewImages;
  UIActivityIndicatorView *spinner;
  UIImage *buttonImage;
  UIView *leftBudLabel;
  UIImageView *leftBudLabelImageView;
  UIImageView *rightBudLabelImageView;
  UIView *rightBudLabel;
  UIImageView *leftImView;
  UIImageView *rightImView;
  id completionHandler;
  objc_super v19;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  fitTestController = self->_fitTestController;
  self->_fitTestController = 0;

  playButton = self->_playButton;
  self->_playButton = 0;

  avSystemController = self->_avSystemController;
  self->_avSystemController = 0;

  player = self->_player;
  self->_player = 0;

  fitTestContentView = self->_fitTestContentView;
  self->_fitTestContentView = 0;

  stackViewImages = self->_stackViewImages;
  self->_stackViewImages = 0;

  spinner = self->_spinner;
  self->_spinner = 0;

  buttonImage = self->_buttonImage;
  self->_buttonImage = 0;

  leftBudLabel = self->_leftBudLabel;
  self->_leftBudLabel = 0;

  leftBudLabelImageView = self->_leftBudLabelImageView;
  self->_leftBudLabelImageView = 0;

  rightBudLabelImageView = self->_rightBudLabelImageView;
  self->_rightBudLabelImageView = 0;

  rightBudLabel = self->_rightBudLabel;
  self->_rightBudLabel = 0;

  leftImView = self->_leftImView;
  self->_leftImView = 0;

  rightImView = self->_rightImView;
  self->_rightImView = 0;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  v19.receiver = self;
  v19.super_class = (Class)BTSFitTestController;
  -[BTSFitTestController dealloc](&v19, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTSFitTestController;
  -[BTSFitTestController viewDidLoad](&v6, sel_viewDidLoad);
  -[BTSFitTestController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);

  -[BTSFitTestController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[UIView sizeToFit](self->_fitTestContentView, "sizeToFit");
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BTSFitTestController;
  -[BTSFitTestController viewWillLayoutSubviews](&v10, sel_viewWillLayoutSubviews);
  -[OBTrayButton bounds](self->_playButton, "bounds");
  v4 = v3 * 0.25;
  -[OBTrayButton layer](self->_playButton, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  -[OBTrayButton bounds](self->_playButton, "bounds");
  v7 = v6 * 0.25;
  -[OBLinkTrayButton layer](self->_debugCopyResultsButton, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

  -[BTSFitTestController setupConstraints](self, "setupConstraints");
  -[BTSFitTestController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  OBWelcomeController *v11;
  OBWelcomeController *fitTestController;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  OBTrayButton *v24;
  OBTrayButton *playButton;
  OBTrayButton *v26;
  void *v27;
  void *v28;
  OBTrayButton *v29;
  void *v30;
  void *v31;
  OBLinkTrayButton *v32;
  OBLinkTrayButton *debugCopyResultsButton;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)BTSFitTestController;
  -[BTSFitTestController loadView](&v37, sel_loadView);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_INIT_HEADER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_INIT_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8210)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_INIT_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8221)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_INIT_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B498-v2"));
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  v11 = (OBWelcomeController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D651B8]), "initWithTitle:detailText:icon:contentLayout:", v4, v6, 0, 2);
  fitTestController = self->_fitTestController;
  self->_fitTestController = v11;

  -[BTSFitTestController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[OBWelcomeController view](self->_fitTestController, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[OBWelcomeController view](self->_fitTestController, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAutoresizingMask:", 18);

  -[BTSFitTestController setupFitTestContentView](self, "setupFitTestContentView");
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v24 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
  playButton = self->_playButton;
  self->_playButton = v24;

  -[OBTrayButton setTitle:forState:](self->_playButton, "setTitle:forState:", &stru_1EA29D890, 0);
  v26 = self->_playButton;
  -[UIImage imageWithRenderingMode:](self->_buttonImage, "imageWithRenderingMode:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setImage:forState:](v26, "setImage:forState:", v27, 0);

  -[OBTrayButton setClipsToBounds:](self->_playButton, "setClipsToBounds:", 1);
  -[OBTrayButton layer](self->_playButton, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setMasksToBounds:", 1);

  -[BTSFitTestController updateFitTestActiveState](self, "updateFitTestActiveState");
  -[OBTrayButton addTarget:action:forControlEvents:](self->_playButton, "addTarget:action:forControlEvents:", self, sel_startFitTest, 64);
  -[OBTrayButton setUserInteractionEnabled:](self->_playButton, "setUserInteractionEnabled:", 1);
  v29 = self->_playButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setBackgroundColor:](v29, "setBackgroundColor:", v30);

  -[OBWelcomeController buttonTray](self->_fitTestController, "buttonTray");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addButton:", self->_playButton);

  if (-[BTSFitTestController isDebugModeEnabled](self, "isDebugModeEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v32 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
    debugCopyResultsButton = self->_debugCopyResultsButton;
    self->_debugCopyResultsButton = v32;

    -[OBLinkTrayButton setTitle:forState:](self->_debugCopyResultsButton, "setTitle:forState:", CFSTR("Copy Results"), 0);
    -[OBLinkTrayButton setClipsToBounds:](self->_debugCopyResultsButton, "setClipsToBounds:", 1);
    -[OBLinkTrayButton layer](self->_debugCopyResultsButton, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setMasksToBounds:", 1);

    -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_debugCopyResultsButton, "addTarget:action:forControlEvents:", self, sel_copyToClipboard, 64);
    -[OBLinkTrayButton setUserInteractionEnabled:](self->_debugCopyResultsButton, "setUserInteractionEnabled:", 1);
  }
  -[BTSFitTestController addChildViewController:](self, "addChildViewController:", self->_fitTestController);
  -[BTSFitTestController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self->_fitTestController, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v36);

}

- (void)copyToClipboard
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_resultDetailLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setString:", v3);

}

- (void)setupFitTestContentView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIStackView setAxis:](self->_stackViewImages, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_stackViewImages, "setAlignment:", 3);
  -[UIStackView setDistribution:](self->_stackViewImages, "setDistribution:", 2);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackViewImages, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSemanticContentAttribute:](self->_stackViewImages, "setSemanticContentAttribute:", 3);
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[UIImageView setFrame:](self->_leftBudLabelImageView, "setFrame:", *MEMORY[0x1E0C9D648], v4, 22.0, 22.0);
  -[UIView center](self->_leftBudLabel, "center");
  -[UIImageView setCenter:](self->_leftBudLabelImageView, "setCenter:");
  -[UIImageView setFrame:](self->_rightBudLabelImageView, "setFrame:", v3, v4, 22.0, 22.0);
  -[UIView center](self->_rightBudLabel, "center");
  -[UIImageView setCenter:](self->_rightBudLabelImageView, "setCenter:");
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_leftImView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_rightImView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_leftBudLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_rightBudLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_leftBudResultLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_rightBudResultLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_resultDetailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_leftBudResultLabel, "setContentHuggingPriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_rightBudResultLabel, "setContentHuggingPriority:forAxis:", 1, v6);
  v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v10, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 40.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[UIStackView addArrangedSubview:](self->_stackViewImages, "addArrangedSubview:", self->_leftImView);
  -[UIStackView addArrangedSubview:](self->_stackViewImages, "addArrangedSubview:", v10);
  -[UIStackView addArrangedSubview:](self->_stackViewImages, "addArrangedSubview:", self->_rightImView);
  -[UIView addSubview:](self->_fitTestContentView, "addSubview:", self->_leftBudLabel);
  -[UIView addSubview:](self->_fitTestContentView, "addSubview:", self->_rightBudLabel);
  -[UIView addSubview:](self->_fitTestContentView, "addSubview:", self->_leftBudResultLabel);
  -[UIView addSubview:](self->_fitTestContentView, "addSubview:", self->_rightBudResultLabel);
  -[UIView addSubview:](self->_fitTestContentView, "addSubview:", self->_resultDetailLabel);
  -[UIView addSubview:](self->_fitTestContentView, "addSubview:", self->_stackViewImages);
  -[UIView bringSubviewToFront:](self->_fitTestContentView, "bringSubviewToFront:", self->_leftBudLabel);
  -[UIView bringSubviewToFront:](self->_fitTestContentView, "bringSubviewToFront:", self->_rightBudLabel);
  -[OBWelcomeController contentView](self->_fitTestController, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_fitTestContentView);

}

- (BOOL)isiPad
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

- (BOOL)isSmallScreenDevice
{
  unsigned int v2;

  v2 = MGGetSInt32Answer();
  return (v2 < 6) & (0x26u >> v2);
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *topSpacerConstraint;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  OBWelcomeController *fitTestController;
  NSLayoutConstraint *v28;
  float v29;
  void *v30;
  void *v31;
  int v32;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;

  v98 = (id)objc_opt_new();
  -[UIView topAnchor](self->_fitTestContentView, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self->_fitTestController, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = v8;
  v9 = (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DC4918]);
  -[BTSFitTestController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  if (-[BTSFitTestController isSmallScreenDevice](self, "isSmallScreenDevice"))
  {
    -[BTSFitTestController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14 * 0.35;

  }
  else
  {
    v15 = v12 * 0.3;
  }
  if (-[BTSFitTestController isiPad](self, "isiPad"))
  {
    -[UIStackView topAnchor](self->_stackViewImages, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController headerView](self->_fitTestController, "headerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 35.0);
    v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topSpacerConstraint = self->_topSpacerConstraint;
    self->_topSpacerConstraint = v19;
  }
  else
  {
    -[BTSFitTestController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v23 = v22;
    -[BTSFitTestController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "size");
    v26 = v25;

    -[UIStackView topAnchor](self->_stackViewImages, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fitTestController = self->_fitTestController;
    if (v23 <= v26)
    {
      -[OBWelcomeController headerView](fitTestController, "headerView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v15;
      objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, v29);
    }
    else
    {
      -[OBWelcomeController contentView](fitTestController, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    }
    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topSpacerConstraint = self->_topSpacerConstraint;
    self->_topSpacerConstraint = v28;
  }

  -[BTSFitTestController traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "preferredContentSizeCategory");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (((v9 | UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v31)) & 1) != 0)
  {

LABEL_18:
    -[OBWelcomeController contentView](self->_fitTestController, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintGreaterThanOrEqualToConstant:", 403.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "addObject:", v38);

    -[UIStackView topAnchor](self->_stackViewImages, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController headerView](self->_fitTestController, "headerView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41, 100.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "addObject:", v42);

    goto LABEL_19;
  }
  v32 = isPreferredLanguageEnglish();

  if (!v32)
    goto LABEL_18;
  -[OBWelcomeController contentView](self->_fitTestController, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintGreaterThanOrEqualToConstant:", 403.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v35);

  objc_msgSend(v98, "addObject:", self->_topSpacerConstraint);
LABEL_19:
  -[UIStackView centerXAnchor](self->_stackViewImages, "centerXAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self->_fitTestController, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v46);

  -[UILabel topAnchor](self->_leftBudResultLabel, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_leftBudLabel, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 1.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v49);

  -[UILabel topAnchor](self->_rightBudResultLabel, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_rightBudLabel, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, 1.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v52);

  -[UILabel centerXAnchor](self->_leftBudResultLabel, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_leftBudLabel, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v55);

  -[UILabel centerXAnchor](self->_rightBudResultLabel, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_rightBudLabel, "centerXAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v58);

  -[UIView widthAnchor](self->_leftBudLabel, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToConstant:", 18.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v60);

  -[UIView heightAnchor](self->_leftBudLabel, "heightAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToConstant:", 18.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v62);

  -[UIView widthAnchor](self->_rightBudLabel, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToConstant:", 18.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v64);

  -[UIView heightAnchor](self->_rightBudLabel, "heightAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToConstant:", 18.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v66);

  -[UILabel widthAnchor](self->_leftBudResultLabel, "widthAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintLessThanOrEqualToConstant:", 113.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v68);

  -[UILabel widthAnchor](self->_rightBudResultLabel, "widthAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintLessThanOrEqualToConstant:", 113.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v70);

  -[UILabel topAnchor](self->_resultDetailLabel, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_leftBudResultLabel, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:constant:", v72, 1.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v73);

  -[UILabel topAnchor](self->_resultDetailLabel, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_rightBudResultLabel, "bottomAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintGreaterThanOrEqualToAnchor:constant:", v75, 1.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v76);

  -[UILabel leadingAnchor](self->_resultDetailLabel, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self->_fitTestController, "headerView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v80);

  -[UILabel trailingAnchor](self->_resultDetailLabel, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self->_fitTestController, "headerView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v84);

  -[UIView topAnchor](self->_leftBudLabel, "topAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_leftImView, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, 20.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v87);

  -[UIView topAnchor](self->_rightBudLabel, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_rightImView, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89, 20.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v90);

  -[UIView leftAnchor](self->_leftBudLabel, "leftAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leftAnchor](self->_stackViewImages, "leftAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:constant:", v92, 62.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v93);

  -[UIView rightAnchor](self->_rightBudLabel, "rightAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView rightAnchor](self->_stackViewImages, "rightAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, -62.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "addObject:", v96);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v98);
}

- (void)startFitTest
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(unsigned __int8 *)(a2 + 1130);
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_1DB30C000, log, OS_LOG_TYPE_ERROR, "Fit Test: budsInEar: %d, callActive: %d", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_1();
}

void __36__BTSFitTestController_startFitTest__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  sharedBluetoothSettingsLogComponent();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DB30C000, v0, OS_LOG_TYPE_DEFAULT, "Fit Test: No action needed", v1, 2u);
  }

}

void __36__BTSFitTestController_startFitTest__block_invoke_108(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  float v33;
  uint8_t buf[4];
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = 0.0;
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getVolume:forCategory:", &v33, CFSTR("Audio/Video"));

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v35 = v33;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Fit Test: Current volume : %f", buf, 0xCu);
    }

    if (v33 < 0.5)
    {
      sharedBluetoothSettingsLogComponent();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Fit Test: Increase volume for AudioVideo for fit test", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = 0.5;
      objc_msgSend(v7, "setVolumeTo:forCategory:", CFSTR("Audio/Video"), v8);

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1132) = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __36__BTSFitTestController_startFitTest__block_invoke_108_cold_3(v5, v9, v10, v11, v12, v13, v14, v15);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pathForResource:ofType:", CFSTR("E+D-US_ML"), CFSTR("wav"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v19, "setActive:error:", 1, &v32);
  v20 = v32;

  if (v20)
  {
    sharedBluetoothSettingsLogComponent();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __36__BTSFitTestController_startFitTest__block_invoke_108_cold_2();

  }
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0C89690];
  v31 = v20;
  objc_msgSend(v22, "setCategory:error:", v23, &v31);
  v24 = v31;

  if (v24)
  {
    sharedBluetoothSettingsLogComponent();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __36__BTSFitTestController_startFitTest__block_invoke_108_cold_1();

    v26 = 0;
  }
  else
  {
    v30 = 0;
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC8]), "initWithContentsOfURL:error:", v18, &v30);
    v26 = v30;
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(v28 + 1016);
    *(_QWORD *)(v28 + 1016) = v27;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setNumberOfLoops:", 5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "prepareToPlay");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "play");
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1129) = 1;

}

- (void)setCancelAction
{
  void *v3;
  void *v4;
  id v5;

  -[BTSFitTestController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItems:animated:", 0, 1);

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_dismissFitTest);
  -[BTSFitTestController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v5);

}

- (void)removeDoneButton
{
  id v2;

  -[BTSFitTestController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRightBarButtonItem:animated:", 0, 1);

}

- (void)dismissFitTest
{
  -[BTSFitTestController cleanupAudio](self, "cleanupAudio");
  -[BTSFitTestController resetVolume](self, "resetVolume");
  if (!self->_completionHandler)
    -[BTSFitTestController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_119);
}

- (void)inEarStatusChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int budsInEar;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryInEarStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryInEarStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDevice address](self->currentDevice, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v10 = objc_msgSend(v5, "BOOLValue");
    v11 = (v10 | objc_msgSend(v6, "BOOLValue")) ^ 1;
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412802;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      v20 = 1024;
      v21 = v11;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "Fit Test: PrimaryInEar: %@, secondaryInEar : %@. newBudsInEar: %d", (uint8_t *)&v16, 0x1Cu);
    }

    budsInEar = self->_budsInEar;
    self->_budsInEar = v11;
    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (budsInEar == v11)
    {
      if (v15)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "Fit Test: No change needed based on in-ear status change", (uint8_t *)&v16, 2u);
      }

    }
    else
    {
      if (v15)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "Fit Test: Update UI since in-ear status has changed", (uint8_t *)&v16, 2u);
      }

      if (self->_testActive)
        -[BTSFitTestController fitTestStopped](self, "fitTestStopped");
    }
  }

}

- (void)sealValueChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  int v23;
  float v24;
  float v25;
  float v26;
  float v27;
  int v28;
  float v29;
  float v30;
  float v31;
  NSObject *v32;
  float v33;
  NSObject *v34;
  void *v35;
  float v36;
  float v37;
  float v38;
  float v39;
  BOOL v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  _BOOL4 v57;
  _BOOL4 v58;
  void *v59;
  void (*v60)(uint64_t);
  uint64_t *v61;
  void *v62;
  void (*v63)(uint64_t);
  uint64_t *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  OBTrayButton *playButton;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NSDate *v90;
  NSDate *endFitTestTimestamp;
  HPSDeviceAnalytics *deviceAnalytics;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  _BOOL4 v105;
  _QWORD v106[5];
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint8_t buf[4];
  _BYTE v118[10];
  __int16 v119;
  _BOOL4 v120;
  __int16 v121;
  _BOOL4 v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_testActive)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissFitTest);
    -[BTSFitTestController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItems:animated:", 0, 1);

    -[BTSFitTestController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", v5);

    v104 = v4;
    objc_msgSend(v4, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sealLeft"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sealRight"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v9;
    objc_msgSend(v9, "floatValue");
    v12 = v11;
    v102 = v10;
    objc_msgSend(v10, "floatValue");
    v14 = v13;
    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v118 = v12;
      _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "Fit Test: leftSeal : %0.06f", buf, 0xCu);
    }

    sharedBluetoothSettingsLogComponent();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v118 = v14;
      _os_log_impl(&dword_1DB30C000, v16, OS_LOG_TYPE_DEFAULT, "Fit Test: rightSeal : %0.06f", buf, 0xCu);
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("confidenceLeft"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("confidenceRight"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v17;
    objc_msgSend(v17, "floatValue");
    v20 = v19;
    v100 = v18;
    objc_msgSend(v18, "floatValue");
    v22 = v21;
    v23 = -[BluetoothDevice productId](self->currentDevice, "productId");
    if (v23 == 8210)
      v24 = v12;
    else
      v24 = -0.0;
    v25 = v20 + v24;
    if (v23 == 8210)
      v26 = v14;
    else
      v26 = -0.0;
    v27 = v22 + v26;
    v28 = -[BluetoothDevice productId](self->currentDevice, "productId");
    if (v28 == 8221)
      v29 = v12;
    else
      v29 = -0.0;
    v30 = v25 + v29;
    if (v28 == 8221)
      v31 = v14;
    else
      v31 = -0.0;
    sharedBluetoothSettingsLogComponent();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v118 = v30;
      _os_log_impl(&dword_1DB30C000, v32, OS_LOG_TYPE_DEFAULT, "Fit Test: confidenceL : %0.06f", buf, 0xCu);
    }
    v33 = v27 + v31;

    sharedBluetoothSettingsLogComponent();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v118 = v33;
      _os_log_impl(&dword_1DB30C000, v34, OS_LOG_TYPE_DEFAULT, "Fit Test: confidenceR : %0.06f", buf, 0xCu);
    }

    -[BTSFitTestController fitTestStopped](self, "fitTestStopped");
    -[OBWelcomeController headerView](self->_fitTestController, "headerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSFitTestController getSealThreshold](self, "getSealThreshold");
    v37 = v36;
    -[BTSFitTestController getConfidenceThreshold](self, "getConfidenceThreshold");
    v39 = v38;
    v40 = v30 < v38 || v33 < v38;
    v41 = MEMORY[0x1E0C809B0];
    if (v40)
    {
      sharedBluetoothSettingsLogComponent();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[BTSFitTestController sealValueChanged:].cold.1(v42, v43, v44, v45, v46, v47, v48, v49);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_RESULTS_FAILED_HEADER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTitle:", v51);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_RESULTS_FAILED_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setDetailText:", v53);

      -[BTSFitTestController setupConstraints](self, "setupConstraints");
      -[BTSFitTestController view](self, "view");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setNeedsLayout");

      -[BTSFitTestController view](self, "view");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "layoutIfNeeded");

      v105 = 0;
      v56 = 0;
      v57 = 0;
    }
    else
    {
      v105 = v12 >= v37;
      v59 = (void *)MEMORY[0x1E0DC3F10];
      if (v12 < v37)
      {
        v116 = MEMORY[0x1E0C809B0];
        v60 = __41__BTSFitTestController_sealValueChanged___block_invoke;
        v61 = &v116;
      }
      else
      {
        v115 = MEMORY[0x1E0C809B0];
        v60 = __41__BTSFitTestController_sealValueChanged___block_invoke_2;
        v61 = &v115;
      }
      v56 = v12 < v37;
      v61[1] = 3221225472;
      v61[2] = (uint64_t)v60;
      v61[3] = (uint64_t)&unk_1EA29A770;
      v61[4] = (uint64_t)self;
      objc_msgSend(v59, "animateWithDuration:animations:", 0.5);
      v57 = v14 >= v37;
      v62 = (void *)MEMORY[0x1E0DC3F10];
      if (v14 < v37)
      {
        v114 = v41;
        v63 = __41__BTSFitTestController_sealValueChanged___block_invoke_3;
        v64 = &v114;
      }
      else
      {
        v113 = v41;
        v63 = __41__BTSFitTestController_sealValueChanged___block_invoke_4;
        v64 = &v113;
      }
      v64[1] = 3221225472;
      v64[2] = (uint64_t)v63;
      v64[3] = (uint64_t)&unk_1EA29A770;
      v64[4] = (uint64_t)self;
      objc_msgSend(v62, "animateWithDuration:animations:", 0.5);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_RESULTS_HEADER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTitle:", v66);

      v58 = v14 < v37;
      if (v14 >= v37 && v12 >= v37)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_BOTH_GOOD_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setDetailText:", v75);

        if (self->_completionHandler)
        {
          playButton = self->_playButton;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBTrayButton setTitle:forState:](playButton, "setTitle:forState:", v78, 0);

          -[OBTrayButton imageView](self->_playButton, "imageView");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setHidden:", 1);

          -[OBTrayButton removeTarget:action:forControlEvents:](self->_playButton, "removeTarget:action:forControlEvents:", self, sel_startFitTest, 64);
          -[OBTrayButton addTarget:action:forControlEvents:](self->_playButton, "addTarget:action:forControlEvents:", self, sel_callCompletionHandler, 64);
        }
        v56 = 0;
        v58 = 0;
        goto LABEL_70;
      }
      if (v12 < v37 && v14 < v37)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_BOTH_POOR_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setDetailText:", v69);

        if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8210)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_BOTH_POOR_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setDetailText:", v71);

        }
        if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8221)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_BOTH_POOR_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B498-v2"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setDetailText:", v73);

        }
        v105 = 0;
LABEL_69:
        v57 = 0;
        goto LABEL_70;
      }
      if (v14 < v37 && v12 >= v37)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_LEFT_GOOD_RIGHT_POOR_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setDetailText:", v84);

        if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8210)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_LEFT_GOOD_RIGHT_POOR_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setDetailText:", v86);

        }
        if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8221)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_LEFT_GOOD_RIGHT_POOR_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B498-v2"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setDetailText:", v88);

        }
        v56 = 0;
        goto LABEL_69;
      }
      if (v12 >= v37 || v14 < v37)
      {
        sharedBluetoothSettingsLogComponent();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)v118 = v12 >= v37;
          *(_WORD *)&v118[4] = 1024;
          *(_DWORD *)&v118[6] = v12 < v37;
          v119 = 1024;
          v120 = v14 >= v37;
          v121 = 1024;
          v122 = v14 < v37;
          _os_log_impl(&dword_1DB30C000, v82, OS_LOG_TYPE_DEFAULT, "Fit Test: leftSealGood: %d, leftSealPoor: %d, rightSealGood: %d, rightSealPoor: %d", buf, 0x1Au);
        }

        goto LABEL_70;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_LEFT_POOR_RIGHT_GOOD_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setDetailText:", v95);

      if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8210)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_LEFT_POOR_RIGHT_GOOD_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setDetailText:", v97);

      }
      if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8221)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_LEFT_POOR_RIGHT_GOOD_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B498-v2"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setDetailText:", v99);

      }
      v105 = 0;
    }
    v58 = 0;
LABEL_70:
    if (-[BTSFitTestController isDebugModeEnabled](self, "isDebugModeEnabled"))
    {
      v106[0] = MEMORY[0x1E0C809B0];
      v106[1] = 3221225472;
      v106[2] = __41__BTSFitTestController_sealValueChanged___block_invoke_156;
      v106[3] = &unk_1EA29AB38;
      v106[4] = self;
      v107 = v37;
      v108 = v39;
      v109 = v12;
      v110 = v30;
      v111 = v14;
      v112 = v33;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v106, 0.5);
    }
    -[HPSDeviceAnalytics updateFitTestValue:value:](self->_deviceAnalytics, "updateFitTestValue:value:", 6, (int)v12);
    -[HPSDeviceAnalytics updateFitTestValue:value:](self->_deviceAnalytics, "updateFitTestValue:value:", 7, (int)v14);
    -[HPSDeviceAnalytics updateFitTestValue:value:](self->_deviceAnalytics, "updateFitTestValue:value:", 1, (int)v30);
    -[HPSDeviceAnalytics updateFitTestValue:value:](self->_deviceAnalytics, "updateFitTestValue:value:", 2, (int)v33);
    -[HPSDeviceAnalytics updateFitTestValue:value:](self->_deviceAnalytics, "updateFitTestValue:value:", 5, -[BluetoothDevice productId](self->currentDevice, "productId"));
    if (v105 && v57)
      v89 = 2;
    else
      v89 = v56 || v58;
    -[HPSDeviceAnalytics updateFitTestValue:value:](self->_deviceAnalytics, "updateFitTestValue:value:", 9, v89);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v90 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endFitTestTimestamp = self->_endFitTestTimestamp;
    self->_endFitTestTimestamp = v90;

    deviceAnalytics = self->_deviceAnalytics;
    -[NSDate timeIntervalSinceDate:](self->_endFitTestTimestamp, "timeIntervalSinceDate:", self->_startFitTestTimestamp);
    -[HPSDeviceAnalytics updateFitTestValue:value:](deviceAnalytics, "updateFitTestValue:value:", 8, (int)v93);
    -[HPSDeviceAnalytics submitFitTestAnalytics](self->_deviceAnalytics, "submitFitTestAnalytics");

    v4 = v104;
    goto LABEL_76;
  }
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Fit Test: Discard results since test is not active", buf, 2u);
  }
LABEL_76:

}

void __41__BTSFitTestController_sealValueChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("left.circle.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setImage:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_POOR_RESULT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setText:", v6);

}

void __41__BTSFitTestController_sealValueChanged___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("left.circle.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setImage:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_GOOD_RESULT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setText:", v6);

}

void __41__BTSFitTestController_sealValueChanged___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("right.circle.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setImage:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_POOR_RESULT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setText:", v6);

}

void __41__BTSFitTestController_sealValueChanged___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("right.circle.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setImage:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_GOOD_RESULT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setText:", v6);

}

void __41__BTSFitTestController_sealValueChanged___block_invoke_156(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addButton:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setTextColor:", v3);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Target Seal : %.2f  Confidence : %.2f\nLeft Seal : %.2f  Confidence : %.2f\nRight Seal : %.2f  Confidence : %.2f"), *(float *)(a1 + 40), *(float *)(a1 + 44), *(float *)(a1 + 48), *(float *)(a1 + 52), *(float *)(a1 + 56), *(float *)(a1 + 60));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setText:", v4);

}

- (void)fitTestStopped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD block[5];

  self->_testActive = 0;
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__BTSFitTestController_fitTestStopped__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(v3, block);

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", 1);
  -[OBTrayButton setUserInteractionEnabled:](self->_playButton, "setUserInteractionEnabled:", 1);
  -[OBTrayButton imageView](self->_playButton, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[OBWelcomeController headerView](self->_fitTestController, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_INIT_HEADER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_INIT_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8210)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_INIT_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  if (-[BluetoothDevice productId](self->currentDevice, "productId") == 8221)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_INIT_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B498-v2"));
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  objc_msgSend(v5, "setDetailText:", v9);

}

uint64_t __38__BTSFitTestController_fitTestStopped__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resetVolume");
  return objc_msgSend(*(id *)(a1 + 32), "cleanupAudio");
}

- (void)deviceDisconnectedHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDevice address](self->currentDevice, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[BTSFitTestController dismissFitTest](self, "dismissFitTest");

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
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Fit Test: Received %@ with power state %s", (uint8_t *)&v11, 0x16u);

  }
  -[BTSFitTestController dismissFitTest](self, "dismissFitTest");

}

- (void)handleCallIsActiveDidChangeNotification:(id)a3
{
  int callActive;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t buf[2];

  callActive = self->_callActive;
  v5 = -[BTSFitTestController isCallActive](self, "isCallActive", a3);
  self->_callActive = -[BTSFitTestController isCallActive](self, "isCallActive");
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (callActive == v5)
  {
    if (v7)
    {
      v10 = 0;
      v8 = "Fit Test: No change needed based on call status change";
      v9 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    v8 = "Fit Test: Update UI since call status has changed";
    v9 = buf;
    goto LABEL_6;
  }

}

- (void)handleAudioSessionInterruption:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 testActive;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C89718]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 == 1)
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      testActive = self->_testActive;
      v9[0] = 67109120;
      v9[1] = testActive;
      _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Fit Test: Audio session interrupted. Reset Fit Test (Active: %d)", (uint8_t *)v9, 8u);
    }

    if (self->_testActive)
      -[BTSFitTestController fitTestStopped](self, "fitTestStopped");
  }

}

- (void)handleMediaServerConnectionDied:(id)a3
{
  NSObject *v4;
  AVSystemController *avSystemController;
  uint8_t v6[16];

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Fit Test: Audio session server connection died", v6, 2u);
  }

  avSystemController = self->_avSystemController;
  self->_avSystemController = 0;

}

- (void)updateFitTestActiveState
{
  uint64_t v3;

  v3 = 0x300000003;
  -[BluetoothDevice inEarStatusPrimary:secondary:](self->currentDevice, "inEarStatusPrimary:secondary:", (char *)&v3 + 4, &v3);
  self->_budsInEar = v3 == 0;
  self->_callActive = -[BTSFitTestController isCallActive](self, "isCallActive");
}

- (void)resetVolume
{
  NSObject *v3;
  double initialVolume;
  void *v5;
  double v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_volumeModified && self->_initialVolume <= 0.5)
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      initialVolume = self->_initialVolume;
      v7 = 134217984;
      v8 = initialVolume;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Fit Test: Cleanup audio. Set audioVideo volume to: %f", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v6 = self->_initialVolume;
    objc_msgSend(v5, "setVolumeTo:forCategory:", CFSTR("Audio/Video"), v6);

    self->_volumeModified = 0;
  }
}

- (void)cleanupAudio
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Fit Test: Failed to deactivate AVAudioSession with AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)isCallActive
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D47EE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "BOOLValue");
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Fit Test: Call is active : %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (BOOL)isDebugModeEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("FitTestOptions"), CFSTR("com.apple.BTServer"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (float)getSealThreshold
{
  int v3;
  int v4;
  float v5;
  float v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[BluetoothDevice productId](self->currentDevice, "productId");
  v4 = v3;
  v5 = 4.3;
  if (v3 != 8210)
    v5 = -5.0;
  if (v3 == 8221)
    v6 = 5.0;
  else
    v6 = v5;
  if (v3 == 8212)
  {
    v6 = 0.0;
    if (self->_completionHandler)
    {
      sharedBluetoothSettingsLogComponent();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Fit Test: getSealThreshold Hearing Test Threshold 6.0", (uint8_t *)&v10, 2u);
      }

    }
  }
  if (v4 == 8228)
    v6 = 0.0;
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v6;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Fit Test: Target Seal Threshold: %.2f", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (float)getConfidenceThreshold
{
  int v2;
  float v3;
  float v5;
  NSObject *v6;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = -[BluetoothDevice productId](self->currentDevice, "productId");
  v3 = 5.1;
  if (v2 != 8210)
    v3 = 10.0;
  if (v2 == 8221)
    v3 = 1.0;
  if (v2 == 8212 || v2 == 8228)
    v5 = -3.0;
  else
    v5 = v3;
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Fit Test: Target Confidence Threshold: %.2f", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (id)getImageFileName:(unsigned int)a3 forSide:(BOOL)a4
{
  void *v4;
  const char *v5;
  _BOOL4 darkMode;
  const char *v7;
  const char *v8;
  const char *v9;

  if ((int)a3 > 84)
  {
    if ((int)a3 <= 118)
    {
      if (a3 == 85)
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = "Left";
        if (a4)
          v5 = "Right";
        darkMode = self->_darkMode;
        v7 = "dark-CL8";
        v8 = "light-CL5";
        goto LABEL_43;
      }
      if (a3 == 102)
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = "Left";
        if (a4)
          v5 = "Right";
        darkMode = self->_darkMode;
        v7 = "dark-CL9";
        v8 = "light-CL6";
        goto LABEL_43;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x77u:
          v4 = (void *)MEMORY[0x1E0CB3940];
          v5 = "Left";
          if (a4)
            v5 = "Right";
          darkMode = self->_darkMode;
          v7 = "dark-CL7";
          v8 = "light-CL7";
          goto LABEL_43;
        case 0x88u:
          v4 = (void *)MEMORY[0x1E0CB3940];
          v5 = "Left";
          if (a4)
            v5 = "Right";
          darkMode = self->_darkMode;
          v7 = "dark-CL8";
          v8 = "light-CL8";
          goto LABEL_43;
        case 0x99u:
          v4 = (void *)MEMORY[0x1E0CB3940];
          v5 = "Left";
          if (a4)
            v5 = "Right";
          darkMode = self->_darkMode;
          v7 = "dark-CL9";
          v8 = "light-CL9";
          goto LABEL_43;
      }
    }
LABEL_17:
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = "Left";
    if (a4)
      v5 = "Right";
    darkMode = self->_darkMode;
    v7 = "dark-CL1";
    v8 = "light-CL1";
    goto LABEL_43;
  }
  if ((int)a3 <= 33)
  {
    if (!a3)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = "Left";
      if (a4)
        v5 = "Right";
      darkMode = self->_darkMode;
      v7 = "dark-CL0";
      v8 = "light-CL0";
      goto LABEL_43;
    }
    goto LABEL_17;
  }
  switch(a3)
  {
    case '"':
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = "Left";
      if (a4)
        v5 = "Right";
      darkMode = self->_darkMode;
      v7 = "dark-CL2";
      v8 = "light-CL2";
      break;
    case '3':
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = "Left";
      if (a4)
        v5 = "Right";
      darkMode = self->_darkMode;
      v7 = "dark-CL3";
      v8 = "light-CL3";
      break;
    case 'D':
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = "Left";
      if (a4)
        v5 = "Right";
      darkMode = self->_darkMode;
      v7 = "dark-CL7";
      v8 = "light-CL4";
      break;
    default:
      goto LABEL_17;
  }
LABEL_43:
  if (darkMode)
    v9 = v7;
  else
    v9 = v8;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%s-FitTest-%s"), v5, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id completionHandler;
  uint8_t v8[16];

  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Fit Test: Setting Completion Handler", v8, 2u);
  }

  v6 = _Block_copy(v4);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  -[HPSDeviceAnalytics updateFitTestValue:value:](self->_deviceAnalytics, "updateFitTestValue:value:", 4, 1);
}

- (void)callCompletionHandler
{
  NSObject *v3;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Fit Test: Call Completion Handler", v4, 2u);
  }

  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endFitTestTimestamp, 0);
  objc_storeStrong((id *)&self->_startFitTestTimestamp, 0);
  objc_storeStrong((id *)&self->_deviceAnalytics, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_resultDetailLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_buttonImage, 0);
  objc_storeStrong((id *)&self->_rightBudResultLabel, 0);
  objc_storeStrong((id *)&self->_leftBudResultLabel, 0);
  objc_storeStrong((id *)&self->_rightBudLabelImageView, 0);
  objc_storeStrong((id *)&self->_rightBudLabel, 0);
  objc_storeStrong((id *)&self->_leftBudLabelImageView, 0);
  objc_storeStrong((id *)&self->_leftBudLabel, 0);
  objc_storeStrong((id *)&self->_rightImView, 0);
  objc_storeStrong((id *)&self->_leftImView, 0);
  objc_storeStrong((id *)&self->_stackViewImages, 0);
  objc_storeStrong((id *)&self->_fitTestContentView, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_topSpacerConstraint, 0);
  objc_storeStrong((id *)&self->_debugCopyResultsButton, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_fitTestController, 0);
  objc_storeStrong((id *)&self->currentDevice, 0);
}

- (void)initWithDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Fit Test: Failed to subscribe to AVSystemController notifications due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDevice:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB30C000, a1, a3, "Fit Test: Unable to fetch volume before test", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __36__BTSFitTestController_startFitTest__block_invoke_108_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Fit Test: Couldn't set session's audio category %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __36__BTSFitTestController_startFitTest__block_invoke_108_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Fit Test: Unable to activate AVAudioSession : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __36__BTSFitTestController_startFitTest__block_invoke_108_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB30C000, a1, a3, "Fit Test: Unable to fetch current volume", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)sealValueChanged:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB30C000, a1, a3, "Fit Test: Confidence values too low.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
