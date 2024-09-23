@implementation HPSSpatialProfileSingeStepEnrollmentController

- (HPSSpatialProfileSingeStepEnrollmentController)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  void *v11;
  dispatch_queue_t v12;
  void *v13;
  dispatch_queue_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  __int16 v22[8];
  objc_super v23;

  if (!self)
    return 0;
  v23.receiver = self;
  v23.super_class = (Class)HPSSpatialProfileSingeStepEnrollmentController;
  v2 = -[HPSSpatialProfileSingeStepEnrollmentController init](&v23, sel_init);
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)*((_QWORD *)v2 + 157);
  *((_QWORD *)v2 + 157) = v3;

  v2[1264] = 0;
  v2[1265] = 0;
  v2[1268] = 0;
  v5 = (void *)*((_QWORD *)v2 + 123);
  *((_QWORD *)v2 + 123) = 0;

  v6 = (void *)*((_QWORD *)v2 + 172);
  *((_QWORD *)v2 + 172) = 0;

  v7 = (void *)*((_QWORD *)v2 + 128);
  *((_QWORD *)v2 + 128) = 0;

  *((_DWORD *)v2 + 281) = 4;
  v8 = (void *)*((_QWORD *)v2 + 146);
  *((_QWORD *)v2 + 146) = 0;

  v2[1181] = 0;
  v2[1182] = 0;
  v2[1183] = 0;
  v2[1185] = 0;
  v2[1186] = 0;
  v2[1184] = 0;
  v2[1336] = 0;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)(v2 + 1304) = *MEMORY[0x1E0C9D648];
  *(_OWORD *)(v2 + 1320) = v9;
  v2[1104] = 0;
  v2[1105] = 0;
  *((_DWORD *)v2 + 294) = 0;
  v2[1180] = 0;
  *((_QWORD *)v2 + 149) = 0;
  v2[1216] = 0;
  v2[1217] = 0;
  v2[1218] = 0;
  v2[1219] = 0;
  *((_DWORD *)v2 + 300) = 0;
  *((_DWORD *)v2 + 305) = 0;
  v2[1224] = 0;
  v2[1248] = 0;
  v2[1354] = 0;
  v2[1355] = 0;
  v10 = (void *)*((_QWORD *)v2 + 170);
  *((_QWORD *)v2 + 170) = 0;

  v11 = (void *)*((_QWORD *)v2 + 171);
  *((_QWORD *)v2 + 171) = 0;

  *((_QWORD *)v2 + 162) = 0;
  v2[1352] = 0;
  v2[1353] = 10;
  v12 = dispatch_queue_create("com.apple.HeadphoneSettings.stepSerialQueue", 0);
  v13 = (void *)*((_QWORD *)v2 + 154);
  *((_QWORD *)v2 + 154) = v12;

  v14 = dispatch_queue_create("com.apple.HeadphoneSettings.visualDetectionQueue", 0);
  v15 = (void *)*((_QWORD *)v2 + 155);
  *((_QWORD *)v2 + 155) = v14;

  *((_QWORD *)v2 + 141) = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel_cancelSpatialAudioProfile, *MEMORY[0x1E0DC4768], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel_bluetoothDidBecomeAvailable, *MEMORY[0x1E0D03390], 0);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)*((_QWORD *)v2 + 178);
  *((_QWORD *)v2 + 178) = v18;

  sharedBluetoothSettingsLogComponent();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 0;
    _os_log_impl(&dword_1DB30C000, v20, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Single step enrollment started.", (uint8_t *)v22, 2u);
  }

  return (HPSSpatialProfileSingeStepEnrollmentController *)v2;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HPSSpatialProfileSingeStepEnrollmentController;
  -[HPSSpatialProfileSingeStepEnrollmentController viewDidLoad](&v9, sel_viewDidLoad);
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;

  if (v5 <= v8)
  {
    -[HPSSpatialProfileSingeStepEnrollmentController setupEnrollController](self, "setupEnrollController");
    -[HPSSpatialProfileSingeStepEnrollmentController setupWelcomeContentView](self, "setupWelcomeContentView");
    -[HPSSpatialProfileSingeStepEnrollmentController setupAudioVideo](self, "setupAudioVideo");
    -[HPSSpatialProfileSingeStepEnrollmentController setupEarBoundingBox](self, "setupEarBoundingBox");
    -[HPSSpatialProfileSingeStepEnrollmentController setupEarTutorialView](self, "setupEarTutorialView");
    -[HPSSpatialProfileSingeStepEnrollmentController moveToStep:](self, "moveToStep:", 4);
  }
  else
  {
    -[HPSSpatialProfileSingeStepEnrollmentController showLandscapeAlert](self, "showLandscapeAlert");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HPSSpatialProfileSingeStepEnrollmentController;
  -[HPSSpatialProfileSingeStepEnrollmentController viewDidAppear:](&v3, sel_viewDidAppear_, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Controller viewDidDisappear", v5, 2u);
  }

  -[HPSSpatialProfileSingeStepEnrollmentController cancelSpatialAudioProfile](self, "cancelSpatialAudioProfile");
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupEnrollController
{
  HRTFEnrollmentSession *v3;
  HRTFEnrollmentSession *enrollmentSession;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  UIView *v9;
  UIView *enrollContentView;
  _TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer *v11;
  _TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer *v12;
  _TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer *bottomContainerView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
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
  _QWORD v88[4];
  id v89;
  id location;
  _QWORD v91[10];

  v91[8] = *MEMORY[0x1E0C80C00];
  if (!self->_enrollmentSession)
  {
    v3 = (HRTFEnrollmentSession *)objc_alloc_init(MEMORY[0x1E0D28718]);
    enrollmentSession = self->_enrollmentSession;
    self->_enrollmentSession = v3;

    -[HRTFEnrollmentSession setDelegate:](self->_enrollmentSession, "setDelegate:", self);
  }
  v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_userCancelEnrollment);
  -[HPSSpatialProfileSingeStepEnrollmentController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v87);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v9 = (UIView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  enrollContentView = self->_enrollContentView;
  self->_enrollContentView = v9;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_enrollContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  location = 0;
  objc_initWeak(&location, self);
  v11 = [_TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer alloc];
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __71__HPSSpatialProfileSingeStepEnrollmentController_setupEnrollController__block_invoke;
  v88[3] = &unk_1EA29AD80;
  objc_copyWeak(&v89, &location);
  v12 = -[HPSSpatialProfileSingleStepBottomContainer initWithBudsInEarString:](v11, "initWithBudsInEarString:", v88);
  bottomContainerView = self->_bottomContainerView;
  self->_bottomContainerView = v12;

  -[HPSSpatialProfileSingleStepBottomContainer setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HPSSpatialProfileSingleStepBottomContainer infoView](self->_bottomContainerView, "infoView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v16);

  -[HPSSpatialProfileSingleStepBottomContainer infoView](self->_bottomContainerView, "infoView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDetailText:", v19);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("WELCOME_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingleStepBottomContainer learnMoreView](self->_bottomContainerView, "learnMoreView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  v23 = self->_bottomContainerView;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingleStepBottomContainer updateContinueButtonTitleWithTitle:](v23, "updateContinueButtonTitleWithTitle:", v25);

  -[HPSSpatialProfileSingleStepBottomContainer updateContinueButtonActionWithTarget:selector:](self->_bottomContainerView, "updateContinueButtonActionWithTarget:selector:", self, sel_continueButtonTapped);
  if (self->_debugMode)
  {
    -[UIView layer](self->_enrollContentView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = objc_msgSend(v27, "CGColor");
    -[UIView layer](self->_enrollContentView, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBorderColor:", v28);

    -[HPSSpatialProfileSingleStepBottomContainer layer](self->_bottomContainerView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = objc_msgSend(v31, "CGColor");
    -[HPSSpatialProfileSingleStepBottomContainer layer](self->_bottomContainerView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBorderColor:", v32);

    -[HPSSpatialProfileSingleStepBottomContainer scrollView](self->_bottomContainerView, "scrollView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = objc_msgSend(v36, "CGColor");
    -[HPSSpatialProfileSingleStepBottomContainer scrollView](self->_bottomContainerView, "scrollView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setBorderColor:", v37);

    -[HPSSpatialProfileSingleStepBottomContainer infoView](self->_bottomContainerView, "infoView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setBorderWidth:", 2.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v43 = objc_msgSend(v42, "CGColor");
    -[HPSSpatialProfileSingleStepBottomContainer layer](self->_bottomContainerView, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setBorderColor:", v43);

    -[HPSSpatialProfileSingleStepBottomContainer buttonTrayEffectView](self->_bottomContainerView, "buttonTrayEffectView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setBorderWidth:", 2.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v48 = objc_msgSend(v47, "CGColor");
    -[HPSSpatialProfileSingleStepBottomContainer buttonTrayEffectView](self->_bottomContainerView, "buttonTrayEffectView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setBorderColor:", v48);

  }
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addSubview:", self->_enrollContentView);

  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addSubview:", self->_bottomContainerView);

  v64 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_enrollContentView, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "safeAreaLayoutGuide");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v83);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v82;
  -[UIView heightAnchor](self->_enrollContentView, "heightAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "frame");
  objc_msgSend(v80, "constraintEqualToConstant:", v53);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v79;
  -[UIView leadingAnchor](self->_enrollContentView, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v76);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v91[2] = v75;
  -[UIView trailingAnchor](self->_enrollContentView, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v91[3] = v71;
  -[HPSSpatialProfileSingleStepBottomContainer topAnchor](self->_bottomContainerView, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v68;
  -[HPSSpatialProfileSingleStepBottomContainer leadingAnchor](self->_bottomContainerView, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v91[5] = v54;
  -[HPSSpatialProfileSingleStepBottomContainer trailingAnchor](self->_bottomContainerView, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v91[6] = v58;
  -[HPSSpatialProfileSingleStepBottomContainer bottomAnchor](self->_bottomContainerView, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v91[7] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 8);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "activateConstraints:", v63);

  objc_destroyWeak(&v89);
  objc_destroyWeak(&location);

}

id __71__HPSSpatialProfileSingeStepEnrollmentController_setupEnrollController__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "getBudsInEarString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setupWelcomeContentView
{
  UIView *v3;
  UIView *welcomeContentView;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *welcomeImageView;
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
  _QWORD v34[10];

  v34[8] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  welcomeContentView = self->_welcomeContentView;
  self->_welcomeContentView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_welcomeContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_enrollContentView, "addSubview:", self->_welcomeContentView);
  v5 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("SpatialProfileIcon"), v6, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v33);
  welcomeImageView = self->_welcomeImageView;
  self->_welcomeImageView = v7;

  -[UIImageView setContentMode:](self->_welcomeImageView, "setContentMode:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_welcomeImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_welcomeContentView, "addSubview:", self->_welcomeImageView);
  v23 = (void *)MEMORY[0x1E0CB3718];
  -[UIView leadingAnchor](self->_welcomeContentView, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_enrollContentView, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v30;
  -[UIView trailingAnchor](self->_welcomeContentView, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_enrollContentView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v27;
  -[UIView topAnchor](self->_welcomeContentView, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_enrollContentView, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v24;
  -[UIView bottomAnchor](self->_welcomeContentView, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v20;
  -[UIImageView widthAnchor](self->_welcomeImageView, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 240.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v9;
  -[UIImageView heightAnchor](self->_welcomeImageView, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 240.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v11;
  -[UIImageView centerXAnchor](self->_welcomeImageView, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_welcomeContentView, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v14;
  -[UIImageView centerYAnchor](self->_welcomeImageView, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_welcomeContentView, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v18);

}

- (void)setupAudioVideo
{
  HPSSpatialProfileSingleStepSoundHapticManager *v3;
  HPSSpatialProfileSingleStepSoundHapticManager *soundHapticManager;
  HPSSpatialProfileVideoCaptureSession *v5;
  HPSSpatialProfileVideoCaptureSession *videoCaptureSession;

  v3 = objc_alloc_init(HPSSpatialProfileSingleStepSoundHapticManager);
  soundHapticManager = self->_soundHapticManager;
  self->_soundHapticManager = v3;

  -[HPSSpatialProfileSingleStepSoundHapticManager start](self->_soundHapticManager, "start");
  v5 = objc_alloc_init(HPSSpatialProfileVideoCaptureSession);
  videoCaptureSession = self->videoCaptureSession;
  self->videoCaptureSession = v5;

  -[HPSSpatialProfileSingeStepEnrollmentController checkVolume](self, "checkVolume");
}

- (void)checkVolume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Unable to Check Volume", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
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
  if (self->_volumeChanged)
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      initialVolume = self->_initialVolume;
      v7 = 134217984;
      v8 = initialVolume;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Volume Changed, Reset to Initial Volume: %f", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v6 = self->_initialVolume;
    objc_msgSend(v5, "setVolumeTo:forCategory:", CFSTR("Audio/Video"), v6);

  }
}

- (void)setupEnrollViewUI
{
  NSObject *v3;
  void *v4;
  HPSSpatialProfileSingleStepPillContainerView *v5;
  HPSSpatialProfileSingleStepPillContainerView *v6;
  HPSSpatialProfileSingleStepPillContainerView *pillContainerView;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  HPSSpatialProfileEarDotsMovieView *v14;
  HPSSpatialProfileEarDotsMovieView *earDotsMovieView;
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
  uint8_t buf[16];
  _QWORD v52[14];

  v52[12] = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Setting up Enroll View UI", buf, 2u);
  }

  -[HPSSpatialProfileSingleStepPearlEnrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_enrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BKUIPearlEnrollView setDelegate:](self->_enrollView, "setDelegate:", self);
  -[BKUIPearlEnrollView preEnrollActivate](self->_enrollView, "preEnrollActivate");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollView setBackgroundColor:](self->_enrollView, "setBackgroundColor:", v4);

  v5 = [HPSSpatialProfileSingleStepPillContainerView alloc];
  v6 = -[HPSSpatialProfileSingleStepPillContainerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  pillContainerView = self->_pillContainerView;
  self->_pillContainerView = v6;

  -[HPSSpatialProfileSingleStepPillContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_pillContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HPSSpatialProfileSingleStepPillContainerView setAlpha:](self->_pillContainerView, "setAlpha:", 0.0);
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9 / 390.0;

  v11 = v10 < 1.0;
  if (v10 >= 1.0)
    v12 = 5.0;
  else
    v12 = 15.0;
  if (v11)
    v13 = 85.0;
  else
    v13 = 100.0;
  v14 = -[HPSSpatialProfileEarDotsMovieView initWithFrame:]([HPSSpatialProfileEarDotsMovieView alloc], "initWithFrame:", 0.0, 0.0, 345.0, v13);
  earDotsMovieView = self->_earDotsMovieView;
  self->_earDotsMovieView = v14;

  -[HPSSpatialProfileEarDotsMovieView setTranslatesAutoresizingMaskIntoConstraints:](self->_earDotsMovieView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HPSSpatialProfileEarDotsMovieView setAlpha:](self->_earDotsMovieView, "setAlpha:", 0.0);
  -[UIView addSubview:](self->_enrollContentView, "addSubview:", self->_enrollView);
  -[UIView addSubview:](self->_enrollContentView, "addSubview:", self->_pillContainerView);
  -[UIView addSubview:](self->_enrollContentView, "addSubview:", self->_earDotsMovieView);
  v37 = (void *)MEMORY[0x1E0CB3718];
  -[HPSSpatialProfileSingleStepPearlEnrollView leadingAnchor](self->_enrollView, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_enrollContentView, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v48;
  -[HPSSpatialProfileSingleStepPearlEnrollView trailingAnchor](self->_enrollView, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_enrollContentView, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v45;
  -[HPSSpatialProfileSingleStepPearlEnrollView topAnchor](self->_enrollView, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_enrollContentView, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v42;
  -[HPSSpatialProfileSingleStepPearlEnrollView bottomAnchor](self->_enrollView, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v39;
  -[HPSSpatialProfileEarDotsMovieView widthAnchor](self->_earDotsMovieView, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToConstant:", 345.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v36;
  -[HPSSpatialProfileEarDotsMovieView heightAnchor](self->_earDotsMovieView, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v34;
  -[HPSSpatialProfileEarDotsMovieView centerXAnchor](self->_earDotsMovieView, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_enrollContentView, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v31;
  -[HPSSpatialProfileEarDotsMovieView bottomAnchor](self->_earDotsMovieView, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v28;
  -[HPSSpatialProfileSingleStepPillContainerView widthAnchor](self->_pillContainerView, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", 345.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v26;
  -[HPSSpatialProfileSingleStepPillContainerView heightAnchor](self->_pillContainerView, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", 100.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v16;
  -[HPSSpatialProfileSingleStepPillContainerView centerXAnchor](self->_pillContainerView, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_enrollContentView, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v19;
  -[HPSSpatialProfileSingleStepPillContainerView bottomAnchor](self->_pillContainerView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v23);

  -[BKUIPearlEnrollView setState:completion:](self->_enrollView, "setState:completion:", 0, &__block_literal_global_6);
  self->_enrollViewState = 0;
  if (self->_currentStep == 4)
    -[HPSSpatialProfileSingleStepPearlEnrollView setHidden:](self->_enrollView, "setHidden:", 1);
  -[HPSSpatialProfileSingeStepEnrollmentController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsLayout");

}

- (void)setupEarTutorialView
{
  NSObject *v3;
  UIView *v4;
  UIView *tutorialContentView;
  HPSSpatialProfileEarTutorialView *v6;
  HPSSpatialProfileEarTutorialView *earTutorialView;
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
  uint8_t buf[16];
  _QWORD v33[10];

  v33[8] = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Setting up Ear Tutorial", buf, 2u);
  }

  v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  tutorialContentView = self->_tutorialContentView;
  self->_tutorialContentView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_tutorialContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_enrollContentView, "addSubview:", self->_tutorialContentView);
  v6 = objc_alloc_init(HPSSpatialProfileEarTutorialView);
  earTutorialView = self->_earTutorialView;
  self->_earTutorialView = v6;

  -[HPSSpatialProfileEarTutorialView setTranslatesAutoresizingMaskIntoConstraints:](self->_earTutorialView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_tutorialContentView, "addSubview:", self->_earTutorialView);
  v22 = (void *)MEMORY[0x1E0CB3718];
  -[UIView leadingAnchor](self->_tutorialContentView, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_enrollContentView, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v29;
  -[UIView trailingAnchor](self->_tutorialContentView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_enrollContentView, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v26;
  -[UIView topAnchor](self->_tutorialContentView, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_enrollContentView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v23;
  -[UIView bottomAnchor](self->_tutorialContentView, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v19;
  -[HPSSpatialProfileEarTutorialView widthAnchor](self->_earTutorialView, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", 240.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v17;
  -[HPSSpatialProfileEarTutorialView heightAnchor](self->_earTutorialView, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", 106.666664);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v8;
  -[HPSSpatialProfileEarTutorialView centerXAnchor](self->_earTutorialView, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_tutorialContentView, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v11;
  -[HPSSpatialProfileEarTutorialView centerYAnchor](self->_earTutorialView, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_tutorialContentView, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v15);

  -[UIView setHidden:](self->_tutorialContentView, "setHidden:", 1);
}

- (void)startEnrollment
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Cannot Start Enrollment, Already Started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__HPSSpatialProfileSingeStepEnrollmentController_startEnrollment__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
    __65__HPSSpatialProfileSingeStepEnrollmentController_startEnrollment__block_invoke_cold_1();
  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Started", v3, 2u);
  }

}

- (void)stopEnrollment
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Cannot Stop Enrollment, Already Stopped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__HPSSpatialProfileSingeStepEnrollmentController_stopEnrollment__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  sharedBluetoothSettingsLogComponent();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DB30C000, v0, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Stopped", v1, 2u);
  }

}

- (void)pauseEnrollment
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Cannot Pause Enrollment, Already Paused", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)resumeEnrollment
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Cannot Resume Enrollment, NOT Paused", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)moveToStep:(int)a3
{
  NSObject *stepSerialQueue;
  _QWORD v4[5];
  int v5;

  stepSerialQueue = self->_stepSerialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke;
  v4[3] = &unk_1EA29AF18;
  v4[4] = self;
  v5 = a3;
  dispatch_async(stepSerialQueue, v4);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_group_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  HPSSpatialProfileAnalytics *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  dispatch_time_t v45;
  _QWORD v46[4];
  NSObject *v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t v50;
  _QWORD v51[4];
  NSObject *v52;
  _QWORD v53[4];
  NSObject *v54;
  uint64_t v55;
  int v56;
  _QWORD v57[4];
  NSObject *v58;
  _QWORD v59[4];
  NSObject *v60;
  uint64_t v61;
  int v62;
  _QWORD v63[4];
  NSObject *v64;
  _QWORD v65[5];
  NSObject *v66;
  int v67;
  _QWORD v68[4];
  NSObject *v69;
  uint64_t v70;
  NSObject *v71;
  id v72;
  int v73;
  _QWORD v74[4];
  NSObject *v75;
  uint64_t v76;
  NSObject *v77;
  id v78;
  int v79;
  _QWORD v80[4];
  NSObject *v81;
  uint64_t v82;
  NSObject *v83;
  int v84;
  _QWORD v85[5];
  NSObject *v86;
  NSObject *v87;
  int v88;
  _QWORD v89[5];
  NSObject *v90;
  int v91;
  uint8_t buf[16];
  _QWORD block[5];
  id location;

  v2 = dispatch_group_create();
  v3 = dispatch_group_create();
  NSLog(CFSTR("Spatial Profile: Sequence Enter Main"));
  dispatch_group_enter(v2);
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_DWORD *)(v4 + 1124);
  *(_DWORD *)(v4 + 1124) = *(_DWORD *)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2;
  block[3] = &unk_1EA29A770;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v7 = *(_QWORD *)(a1 + 32);
  switch(*(_DWORD *)(v7 + 1124))
  {
    case 0:
      sharedBluetoothSettingsLogComponent();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v23, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> CouldntScanEar", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "updateStatus:EnrollmentResult:", 0, CFSTR("Failed"));
      v59[0] = v6;
      v59[1] = 3221225472;
      v59[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_81;
      v59[3] = &unk_1EA29AE28;
      v24 = v3;
      v25 = *(_QWORD *)(a1 + 32);
      v60 = v24;
      v61 = v25;
      v62 = v5;
      v26 = MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v59);

      v57[0] = v6;
      v57[1] = 3221225472;
      v57[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_82;
      v57[3] = &unk_1EA29A770;
      v58 = v2;
      dispatch_group_notify(v24, v26, v57);

      v12 = v60;
      goto LABEL_34;
    case 1:
    case 2:
      objc_msgSend(*(id *)(v7 + 1160), "incrementRightEarOcclusionCount");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "incrementLeftEarOcclusionCount");
      sharedBluetoothSettingsLogComponent();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> HairCoveringEar", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "updateStatus:EnrollmentResult:", 0, CFSTR("Failed"));
      objc_msgSend(*(id *)(a1 + 32), "forceBlur");
      v53[0] = v6;
      v53[1] = 3221225472;
      v53[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_83;
      v53[3] = &unk_1EA29AE28;
      v9 = v3;
      v10 = *(_QWORD *)(a1 + 32);
      v54 = v9;
      v55 = v10;
      v56 = v5;
      v11 = MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v53);

      v51[0] = v6;
      v51[1] = 3221225472;
      v51[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_84;
      v51[3] = &unk_1EA29A770;
      v52 = v2;
      dispatch_group_notify(v9, v11, v51);

      v12 = v54;
      goto LABEL_34;
    case 3:
      sharedBluetoothSettingsLogComponent();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v27, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> GeneralFailure", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "updateStatus:EnrollmentResult:", 0, CFSTR("Failed"));
      v48[0] = v6;
      v48[1] = 3221225472;
      v48[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_85;
      v48[3] = &unk_1EA29A908;
      v28 = v3;
      v29 = *(_QWORD *)(a1 + 32);
      v49 = v28;
      v50 = v29;
      v30 = MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v48);

      v46[0] = v6;
      v46[1] = 3221225472;
      v46[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_93;
      v46[3] = &unk_1EA29A770;
      v47 = v2;
      dispatch_group_notify(v28, v30, v46);

      v12 = v49;
      goto LABEL_34;
    case 4:
      sharedBluetoothSettingsLogComponent();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v31, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Welcome", buf, 2u);
      }

      v89[0] = v6;
      v89[1] = 3221225472;
      v89[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_56;
      v89[3] = &unk_1EA29AE28;
      v89[4] = *(_QWORD *)(a1 + 32);
      v91 = v5;
      v90 = v2;
      v32 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v89);

      v12 = v90;
      goto LABEL_34;
    case 5:
      sharedBluetoothSettingsLogComponent();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontView", buf, 2u);
      }

      v14 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v14 + 1160))
      {
        v15 = objc_alloc_init(HPSSpatialProfileAnalytics);
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(void **)(v16 + 1160);
        *(_QWORD *)(v16 + 1160) = v15;

        v14 = *(_QWORD *)(a1 + 32);
      }
      v85[0] = v6;
      v85[1] = 3221225472;
      v85[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_59;
      v85[3] = &unk_1EA29AE50;
      v85[4] = v14;
      v88 = v5;
      v86 = v3;
      v87 = v2;
      v18 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v85);

      v12 = v86;
      goto LABEL_34;
    case 6:
      sharedBluetoothSettingsLogComponent();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v33, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCapturePositionFace", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "initFrameRateDetection");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "updateFaceEnrollStart");
      v80[0] = v6;
      v80[1] = 3221225472;
      v80[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_61;
      v80[3] = &unk_1EA29AE50;
      v34 = v3;
      v35 = *(_QWORD *)(a1 + 32);
      v81 = v34;
      v82 = v35;
      v84 = v5;
      v83 = v2;
      v36 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v80);

      v12 = v81;
      goto LABEL_34;
    case 7:
      sharedBluetoothSettingsLogComponent();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v37, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureMoveHead", buf, 2u);
      }

      v74[0] = v6;
      v74[1] = 3221225472;
      v74[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_64;
      v74[3] = &unk_1EA29AEA0;
      v75 = v3;
      objc_copyWeak(&v78, &location);
      v79 = v5;
      v76 = *(_QWORD *)(a1 + 32);
      v77 = v2;
      v38 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v74);

      objc_destroyWeak(&v78);
      v12 = v75;
      goto LABEL_34;
    case 8:
      *(_BYTE *)(v7 + 1218) = 1;
      sharedBluetoothSettingsLogComponent();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v39, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureCompleted", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "updateFaceEnrollDuration");
      v68[0] = v6;
      v68[1] = 3221225472;
      v68[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_68;
      v68[3] = &unk_1EA29AEF0;
      v40 = v3;
      v41 = *(_QWORD *)(a1 + 32);
      v69 = v40;
      v70 = v41;
      v73 = v5;
      objc_copyWeak(&v72, &location);
      v71 = v2;
      v42 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v68);

      objc_destroyWeak(&v72);
      v12 = v69;
      goto LABEL_34;
    case 0xA:
      sharedBluetoothSettingsLogComponent();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v44, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RetrieveProfile", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "retrieveProfile");
      goto LABEL_41;
    case 0xB:
      sharedBluetoothSettingsLogComponent();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v19, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> SyncProfile", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "syncProfile");
      goto LABEL_41;
    case 0xC:
      objc_msgSend(*(id *)(v7 + 1160), "updateStatus:EnrollmentResult:", 1, CFSTR("Success"));
      sharedBluetoothSettingsLogComponent();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v20, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Completed", buf, 2u);
      }

      v65[0] = v6;
      v65[1] = 3221225472;
      v65[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_74;
      v65[3] = &unk_1EA29AE28;
      v65[4] = *(_QWORD *)(a1 + 32);
      v21 = v3;
      v66 = v21;
      v67 = v5;
      v22 = MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v65);

      v63[0] = v6;
      v63[1] = 3221225472;
      v63[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_5_78;
      v63[3] = &unk_1EA29A770;
      v64 = v2;
      dispatch_group_notify(v21, v22, v63);

      v12 = v66;
LABEL_34:

      break;
    default:
      sharedBluetoothSettingsLogComponent();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_cold_1();

LABEL_41:
      dispatch_group_leave(v2);
      break;
  }
  v45 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v2, v45);
  objc_destroyWeak(&location);

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "scrollView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setContentOffset:animated:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_56(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "moveToEnrollmentFromStep:toStep:", *(unsigned int *)(a1 + 48), 4);
  if (!+[HPSSpatialProfileManager isProxCardShowed](HPSSpatialProfileManager, "isProxCardShowed"))
    +[HPSSpatialProfileManager setProxCardShowed:](HPSSpatialProfileManager, "setProxCardShowed:", 1);
  objc_msgSend(*(id *)(a1 + 32), "startEnrollment");
  objc_msgSend(*(id *)(a1 + 32), "showContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "setAlpha:", 0.0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_59(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setFaceCaptured:", 0);
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[123];
  v4 = (void *)v2[173];
  v5 = *(unsigned int *)(a1 + 56);
  v16 = (id)v2[129];
  v6 = MEMORY[0x1E0C809B0];
  v14[4] = v2;
  v15 = v3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_60;
  v14[3] = &unk_1EA29A770;
  v7 = v3;
  v8 = v16;
  objc_msgSend(v4, "moveToEnrollmentFromStep:toStep:animateInAlongSide:animateOutAlongSide:animatedCompletion:", v5, 5, &v16, &v15, v14);
  v9 = v16;

  v10 = v15;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3;
  v12[3] = &unk_1EA29A770;
  v11 = *(NSObject **)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v12);

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_60(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "tutorialMovieView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "play");

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontView Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_61(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "tutorialMovieView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 1032);
  v6 = *(void **)(v3 + 1384);
  v7 = *(unsigned int *)(a1 + 56);
  v26 = v2;
  v27 = v5;
  v24[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_62;
  v24[3] = &unk_1EA29A908;
  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[4] = v3;
  v25 = v4;
  v9 = v5;
  objc_msgSend(v6, "moveToEnrollmentFromStep:toStep:animateInAlongSide:animateOutAlongSide:animatedCompletion:", v7, 6, &v27, &v26, v24);
  v10 = v27;

  v11 = v26;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v13 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v12 + 1024);
  v15 = *(unsigned int *)(v12 + 1124);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4;
  v22[3] = &unk_1EA29A770;
  v23 = v13;
  objc_msgSend(v14, "triggerSoundHapticForEnrollmentState:completion:", v15, v22);
  objc_msgSend(*(id *)(a1 + 40), "resumeEnrollment");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = *(NSObject **)(a1 + 32);
  v17 = v8;
  v18 = 3221225472;
  v19 = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_5;
  v20 = &unk_1EA29A770;
  v21 = *(id *)(a1 + 48);
  dispatch_group_notify(v16, MEMORY[0x1E0C80D38], &v17);
  objc_msgSend(*(id *)(a1 + 40), "startFaceInFrameHandlerTimer", v17, v18, v19, v20);

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_62(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1200) = 5;
  objc_msgSend(*(id *)(a1 + 32), "startCaptureViewTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "pillContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 1032);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_63;
  v6[3] = &unk_1EA29A908;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v5, "setState:completion:", 3, v6);

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_63(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1400) = 3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCapturePositionFace Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_64(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int8x16_t v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  int8x16_t v18;
  id v19;
  int v20;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_65;
  aBlock[3] = &unk_1EA29AE78;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  v20 = *(_DWORD *)(a1 + 64);
  v12 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v12.i64[0];
  v18 = vextq_s8(v12, v12, 8uLL);
  v4 = _Block_copy(aBlock);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(v6 + 1400) == 5)
    (*((void (**)(void *))v4 + 2))(v4);
  else
    objc_msgSend(*(id *)(v6 + 1032), "setState:completion:", 5, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1160), "initFrameRateDetection", *(_OWORD *)&v12);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v7 + 1024);
  v10 = *(unsigned int *)(v7 + 1124);
  v15[0] = v2;
  v15[1] = 3221225472;
  v15[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_66;
  v15[3] = &unk_1EA29A770;
  v16 = v8;
  objc_msgSend(v9, "triggerSoundHapticForEnrollmentState:completion:", v10, v15);
  v11 = *(NSObject **)(a1 + 32);
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_67;
  block[3] = &unk_1EA29A770;
  v14 = *(id *)(a1 + 48);
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v19);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_65(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "showEarPillsDots");
  objc_msgSend(WeakRetained[173], "moveToEnrollmentFromStep:toStep:", *(unsigned int *)(a1 + 56), 7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setHidden:", 0);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1400) = 5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_66(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_67(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureMoveHead Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_68(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int8x16_t v8;
  _QWORD block[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  int8x16_t v14;
  id v15;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "setFaceCaptured:", 1);
  objc_msgSend(*(id *)(a1 + 40), "stopCaptureViewTimer");
  objc_msgSend(*(id *)(a1 + 40), "startPostProcessTimer");
  objc_msgSend(*(id *)(a1 + 40), "forceBlur");
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "moveToEnrollmentFromStep:toStep:", *(unsigned int *)(a1 + 64), 8);
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1032);
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_69;
  v13[3] = &unk_1EA29AEC8;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  v8 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v8.i64[0];
  v14 = vextq_s8(v8, v8, 8uLL);
  objc_msgSend(v2, "setState:completion:", 6, v13);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 1024);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_70;
  v11[3] = &unk_1EA29A770;
  v12 = v5;
  objc_msgSend(v6, "triggerSoundHapticForEarCaptureState:completion:", 1, v11);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v7 = *(NSObject **)(a1 + 32);
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_71;
  block[3] = &unk_1EA29A770;
  v10 = *(id *)(a1 + 48);
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 40), "stopFaceInFrameHandlerTimer");
  objc_msgSend(*(id *)(a1 + 40), "sendTipKitSignal");

  objc_destroyWeak(&v15);
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_69(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained[129], "pillContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setHidden:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", 0.0);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1400) = 6;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_70(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_71(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureCompleted Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_74(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];

  objc_msgSend(*(id *)(a1 + 32), "stopTimers");
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1384);
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(unsigned int *)(a1 + 48);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_75;
  v20[3] = &unk_1EA29A770;
  v20[4] = v2;
  objc_msgSend(v3, "moveToEnrollmentFromStep:toStep:completionAction:", v5, 12, v20);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(v6 + 1032);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_76;
  v18[3] = &unk_1EA29A908;
  v18[4] = v6;
  v19 = v7;
  objc_msgSend(v8, "setState:completion:", 10, v18);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(void **)(v9 + 1024);
  v12 = *(unsigned int *)(v9 + 1124);
  v13 = v4;
  v14 = 3221225472;
  v15 = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_77;
  v16 = &unk_1EA29A770;
  v17 = v10;
  objc_msgSend(v11, "triggerSoundHapticForEnrollmentState:completion:", v12, &v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "setAlpha:", 0.0, v13, v14, v15, v16);
  objc_msgSend(*(id *)(a1 + 32), "stopEnrollment");
  objc_msgSend(*(id *)(a1 + 32), "showContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "updateContinueButtonActionWithTarget:selector:", *(_QWORD *)(a1 + 32), sel_cancelSpatialAudioProfile);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1185) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_75(uint64_t a1)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[1105])
  {
    objc_msgSend(v2, "stopPostProcessSpinner");
    v2 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend(v2, "stopPostProcessTimer");
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_76(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1400) = 10;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_4_77(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_5_78(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Completed Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_81(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "moveToEnrollmentFromStep:toStep:", *(unsigned int *)(a1 + 48), 0);
  objc_msgSend(*(id *)(a1 + 40), "showContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "updateContinueButtonActionWithTarget:selector:", *(_QWORD *)(a1 + 40), sel_cancelSpatialAudioProfile);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_82(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> CouldntScanEar Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_83(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "moveToEnrollmentFromStep:toStep:", *(unsigned int *)(a1 + 48), 2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_84(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> HairCoveringEar Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_85(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "infoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("GENERAL_FAILURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "infoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GENERAL_FAILURE_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1384);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateContinueButtonTitleWithTitle:", v10);

  v11 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v11 + 1168))
  {
    objc_msgSend((id)v11, "cleanUpSpinner");
    v11 = *(_QWORD *)(a1 + 40);
  }
  if (*(_BYTE *)(v11 + 1105))
  {
    objc_msgSend((id)v11, "stopPostProcessSpinner");
    v11 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend((id)v11, "stopPostProcessTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1376), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "stopEnrollment");
  objc_msgSend(*(id *)(a1 + 40), "showContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "updateContinueButtonActionWithTarget:selector:", *(_QWORD *)(a1 + 40), sel_cancelSpatialAudioProfile);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v12 = *(void **)(a1 + 32);
  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 1024);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_92;
  v14[3] = &unk_1EA29A770;
  v15 = v12;
  objc_msgSend(v13, "triggerSoundHapticForEnrollmentState:completion:", 3, v14);

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_2_92(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_3_93(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> GeneralFailure Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)continueButtonTapped
{
  NSObject *v3;
  int currentStep;
  unint64_t sessionState;
  NSObject *v6;
  NSObject *v7;
  int v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentStep = self->_currentStep;
    sessionState = self->_sessionState;
    v9[0] = 67109376;
    v9[1] = currentStep;
    v10 = 1024;
    v11 = sessionState;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: ContinueButton Tapped Current Step %d, Currente Session %d ", (uint8_t *)v9, 0xEu);
  }

  if (self->_currentStep == 4)
  {
    if (-[HPSSpatialProfileSingeStepEnrollmentController checkAndShowInEarPopup](self, "checkAndShowInEarPopup"))
      return;
    if ((-[BluetoothManager available](self->_btManager, "available") & 1) == 0)
    {
      sharedBluetoothSettingsLogComponent();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: btManager is not available", (uint8_t *)v9, 2u);
      }

      if (!self->_welcomeSpinnerOn)
      {
        sharedBluetoothSettingsLogComponent();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v9[0]) = 0;
          _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: btManager is not available starting welcome spinner", (uint8_t *)v9, 2u);
        }

        -[HPSSpatialProfileSingeStepEnrollmentController startWelcomeSpinner](self, "startWelcomeSpinner");
      }
    }
  }
  if (self->_enrollmentReady)
  {
    v8 = self->_currentStep;
    if (v8 <= 9)
      -[HPSSpatialProfileSingeStepEnrollmentController moveToStep:](self, "moveToStep:", (v8 + 1));
  }
  else if (!self->_welcomeSpinnerOn)
  {
    -[HPSSpatialProfileSingeStepEnrollmentController startWelcomeSpinner](self, "startWelcomeSpinner");
  }
}

- (void)userCancelEnrollment
{
  NSObject *v3;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: User Cancelled Spatial Audio Profile", v4, 2u);
  }

  -[HPSSpatialProfileAnalytics updateStatus:EnrollmentResult:](self->_enrollmentAnalytics, "updateStatus:EnrollmentResult:", 0, CFSTR("Cancel"));
  -[HPSSpatialProfileSingeStepEnrollmentController cancelSpatialAudioProfile](self, "cancelSpatialAudioProfile");
}

- (void)stopTimers
{
  -[HPSSpatialProfileSingeStepEnrollmentController stopFaceInFrameHandlerTimer](self, "stopFaceInFrameHandlerTimer");
  -[HPSSpatialProfileSingeStepEnrollmentController stopCaptureViewTimer](self, "stopCaptureViewTimer");
  -[HPSSpatialProfileSingeStepEnrollmentController stopPostProcessTimer](self, "stopPostProcessTimer");
}

- (void)cancelSpatialAudioProfile
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Cancel Spatial Audio Profile", buf, 2u);
  }

  if (self->_enrollmentStarted)
    -[HPSSpatialProfileSingeStepEnrollmentController stopEnrollment](self, "stopEnrollment");
  -[HPSSpatialProfileSingeStepEnrollmentController stopTimers](self, "stopTimers");
  -[HPSSpatialProfileSingleStepSoundHapticManager stop](self->_soundHapticManager, "stop");
  -[HPSSpatialProfileSingeStepEnrollmentController resetVolume](self, "resetVolume");
  -[HPSSpatialProfileEarTutorialView stopPlayers](self->_earTutorialView, "stopPlayers");
  -[HPSSpatialProfileSingeStepEnrollmentController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_96);
  if (self->_enrollmentCompleted)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("HPSSpatialAudioProfileUpdated"), 0);

  }
  if (self->dismissalHandler)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Executing : Dismiss handler", v6, 2u);
    }

    (*((void (**)(void))self->dismissalHandler + 2))();
  }
  -[HPSSpatialProfileAnalytics submitHPSSpatialProfileEnrollAnalytics](self->_enrollmentAnalytics, "submitHPSSpatialProfileEnrollAnalytics");
}

- (void)bluetoothDidBecomeAvailable
{
  _QWORD block[5];

  self->_bluetoothBecameAvailable = 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HPSSpatialProfileSingeStepEnrollmentController_bluetoothDidBecomeAvailable__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __77__HPSSpatialProfileSingeStepEnrollmentController_bluetoothDidBecomeAvailable__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 1104))
  {
    v1 = result;
    sharedBluetoothSettingsLogComponent();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = *(unsigned __int8 *)(v3 + 1182);
      v5 = objc_msgSend(*(id *)(v3 + 1256), "available");
      v6[0] = 67109376;
      v6[1] = v4;
      v7 = 1024;
      v8 = v5;
      _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: bluetoothDidBecomeAvailable -> stopWelcomeSpinner, _enrollmentReady %d [_btManager available] %d", (uint8_t *)v6, 0xEu);
    }

    return objc_msgSend(*(id *)(v1 + 32), "stopWelcomeSpinner");
  }
  return result;
}

- (void)retrieveProfile
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*a1, "resultSize");
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_error_impl(&dword_1DB30C000, a2, OS_LOG_TYPE_ERROR, "Spatial Profile: Profile Generation failed : result size %d ", (uint8_t *)v4, 8u);
}

uint64_t __65__HPSSpatialProfileSingeStepEnrollmentController_retrieveProfile__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveToStep:", 3);
}

void __65__HPSSpatialProfileSingeStepEnrollmentController_retrieveProfile__block_invoke_102(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[6];
    v6 = a1[7];
    v7 = 134218240;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Retrive completion : requestedSize = %lu profileSize = %lu", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1[4] + 1152), "appendData:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[5] + 8) + 40));
}

uint64_t __65__HPSSpatialProfileSingeStepEnrollmentController_retrieveProfile__block_invoke_104(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "length");
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Retrieved Profile Size: %lu", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "moveToStep:", 11);
}

- (void)syncProfile
{
  NSMutableData *profileData;
  NSObject *v4;
  NSUInteger v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  NSUInteger v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  profileData = self->_profileData;
  if (profileData && -[NSMutableData length](profileData, "length"))
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSMutableData length](self->_profileData, "length");
      *(_DWORD *)buf = 134217984;
      v12 = v5;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Syncing Profile, Size: %lu", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D03428], "soundProfileRecordWithCustomData:", self->_profileData);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D03420]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke;
    v9[3] = &unk_1EA29AF88;
    v9[4] = self;
    v10 = v7;
    v8 = v7;
    objc_msgSend(v8, "createSoundProfileRecord:completion:", v6, v9);

  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Cannot Sync Profile, Invalid Profile Data", buf, 2u);
    }
  }

}

void __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5)
      __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke_cold_2((uint64_t)v3, v4);
  }
  else if (v5)
  {
    __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "moveToStep:", 12);
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (id)angleArrayToBinaryString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = &stru_1EA29D890;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "captured"))
          v10 = CFSTR("1%@");
        else
          v10 = CFSTR("0%@");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v9);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = &stru_1EA29D890;
  }

  return v6;
}

- (void)startTutorialResumeEnrollTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *tutorialResumeEnrollTimer;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Tutorial automatic Delay Transition timer", buf, 2u);
  }

  if (self->_tutorialResumeEnrollTimer)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Tutorial automatic Delay Transition timer…", v9, 2u);
    }

    -[HPSSpatialProfileSingeStepEnrollmentController stopTutorialResumeEnrollTimer](self, "stopTutorialResumeEnrollTimer");
  }
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting Tutorial automatic Delay Transition timer", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_tutorialResumeEnrollTimerDidFire, 0, 0, 3.0);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  tutorialResumeEnrollTimer = self->_tutorialResumeEnrollTimer;
  self->_tutorialResumeEnrollTimer = v6;

}

- (void)stopTutorialResumeEnrollTimer
{
  NSObject *v3;
  NSTimer *tutorialResumeEnrollTimer;
  uint8_t v5[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping capture view timer", v5, 2u);
  }

  -[NSTimer invalidate](self->_tutorialResumeEnrollTimer, "invalidate");
  tutorialResumeEnrollTimer = self->_tutorialResumeEnrollTimer;
  self->_tutorialResumeEnrollTimer = 0;

}

- (void)startCaptureViewTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *captureViewTimer;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Restart capture view timer", buf, 2u);
  }

  if (self->_captureViewTimer)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping capture view timer…", v9, 2u);
    }

    -[HPSSpatialProfileSingeStepEnrollmentController stopCaptureViewTimer](self, "stopCaptureViewTimer");
  }
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting capture view timer", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_captureViewTimerDidFire, 0, 0, 180.0);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  captureViewTimer = self->_captureViewTimer;
  self->_captureViewTimer = v6;

}

- (void)stopCaptureViewTimer
{
  NSObject *v3;
  NSTimer *captureViewTimer;
  uint8_t v5[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping capture view timer", v5, 2u);
  }

  -[NSTimer invalidate](self->_captureViewTimer, "invalidate");
  captureViewTimer = self->_captureViewTimer;
  self->_captureViewTimer = 0;

}

- (void)captureViewTimerDidFire
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: captureViewTimerDidFire canceling spatial audio profile", buf, 2u);
  }

  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CANCEL_ENROLLMENT_ALERT_PROMPT"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, &stru_1EA29D890, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL_ENROLLMENT_ALERT_PROMPT_BUTTON"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__HPSSpatialProfileSingeStepEnrollmentController_captureViewTimerDidFire__block_invoke;
  v12[3] = &unk_1EA29A880;
  v12[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  -[HPSSpatialProfileSingeStepEnrollmentController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __73__HPSSpatialProfileSingeStepEnrollmentController_captureViewTimerDidFire__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelSpatialAudioProfile");
}

- (BOOL)isEarOccluded
{
  return !self->_supressEarOcclusionWarning && self->_isEarOccluded;
}

- (id)getBudsInEarString
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  int v29;
  int v30;
  uint8_t v31;
  _BYTE v32[15];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[BluetoothManager connectedDevices](self->_btManager, "connectedDevices");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (+[HPSProductUtils isAppleHeadphone:](HPSProductUtils, "isAppleHeadphone:", v7)
          && (objc_msgSend(v7, "isTemporaryPaired") & 1) == 0)
        {
          if ((objc_msgSend(v7, "isGenuineAirPods") & 1) != 0)
          {
            +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v7);
            v8 = objc_claimAutoreleasedReturnValue();
            v9 = v8;
            if (v8)
            {
              v29 = 3;
              v30 = 3;
              -[NSObject classicDevice](v8, "classicDevice");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "inEarStatusPrimary:secondary:", &v30, &v29);

              if (!v30 || !v29)
              {
                -[NSObject classicDevice](v9, "classicDevice");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "productId");

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ACCESSORY_MODEL_NAME_%d"), v13 - 0x2000);
                v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "localizedStringForKey:value:table:", v14, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v16, "length") && v13 >= 0x200A)
                {

                  if (v13 >> 4 <= 0x200)
                    goto LABEL_27;
                }
                else
                {

                }
                if (v13 == 8210)
                  v14 = CFSTR("ACCESSORY_MODEL_NAME_18");
                else
                  v14 = CFSTR("ACCESSORY_MODEL_NAME_15");
LABEL_27:
                sharedBluetoothSettingsLogComponent();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  -[NSObject classicDevice](v9, "classicDevice");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "name");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v38 = v19;
                  _os_log_impl(&dword_1DB30C000, v17, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Device %@, bud in ear", buf, 0xCu);

                }
                objc_msgSend((id)MGGetStringAnswer(), "uppercaseString");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_"), "stringByAppendingFormat:", CFSTR("%@_%@"), v20, v14);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "localizedStringForKey:value:table:", v21, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
                v11 = (void *)objc_claimAutoreleasedReturnValue();

                switch(v13)
                {
                  case 0x2025u:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = v23;
                    v25 = CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_24");
                    v26 = CFSTR("DeviceConfig-B465");
                    break;
                  case 0x201Du:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = v23;
                    v25 = CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_42");
                    v26 = CFSTR("DeviceConfig-B498-v2");
                    break;
                  case 0x2017u:
                    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = v23;
                    v25 = CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_23");
                    v26 = CFSTR("DeviceConfig-B453");
                    break;
                  default:
LABEL_36:

                    goto LABEL_37;
                }
                objc_msgSend(v23, "localizedStringForKey:value:table:", v25, &stru_1EA29D890, v26);
                v27 = objc_claimAutoreleasedReturnValue();

                v11 = (void *)v27;
                goto LABEL_36;
              }
            }
          }
          else
          {
            sharedBluetoothSettingsLogComponent();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              -[HPSSpatialProfileSingeStepEnrollmentController getBudsInEarString].cold.1(&v31, v32, v9);
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_37:

  return v11;
}

- (void)triggerFaceInFrameHandlerTimeout
{
  NSObject *v3;
  int faceBoundingBoxStatus;
  void *v5;
  double v6;
  NSTimer *v7;
  NSTimer *faceInFrameHandlerTimer;
  _QWORD v9[5];
  _QWORD block[5];
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    faceBoundingBoxStatus = self->_faceBoundingBoxStatus;
    *(_DWORD *)buf = 67109120;
    v12 = faceBoundingBoxStatus;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Update Face Capture %d ", buf, 8u);
  }

  if ((self->_currentStep & 0xFFFFFFFE) != 6)
    goto LABEL_8;
  if (self->_faceBoundingBoxStatus == 1 && !self->_faceCaptured)
  {
    self->_faceTooCloseErrorShowing = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__HPSSpatialProfileSingeStepEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke;
    block[3] = &unk_1EA29A770;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v6 = 1.0;
    goto LABEL_10;
  }
  if (!self->_faceTooCloseErrorShowing)
  {
LABEL_8:
    -[HPSSpatialProfileSingeStepEnrollmentController stopFaceInFrameHandlerTimer](self, "stopFaceInFrameHandlerTimer");
    return;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__HPSSpatialProfileSingeStepEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke_2;
  v9[3] = &unk_1EA29A770;
  v9[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v9);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v6 = 3.0;
LABEL_10:
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_triggerFaceInFrameHandlerTimeout, 0, 0, v6);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  faceInFrameHandlerTimer = self->_faceInFrameHandlerTimer;
  self->_faceInFrameHandlerTimer = v7;

}

void __82__HPSSpatialProfileSingeStepEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C99840]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "infoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACE_TOO_CLOSE_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "infoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
    v10 = CFSTR("FACE_TOO_CLOSE_DETAIL_METRICS");
  else
    v10 = CFSTR("FACE_TOO_CLOSE_DETAIL_IMPERIAL");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetailText:", v11);

}

void __82__HPSSpatialProfileSingeStepEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 1219))
  {
    objc_msgSend(*(id *)(v1 + 1384), "infoView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SINGLE_STEP_FRONT_VIEW_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "infoView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SINGLE_STEP_FRONT_VIEW_CAPTURE_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDetailText:", v8);

    v1 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v1 + 1219) = 0;
}

- (void)startFaceInFrameHandlerTimer
{
  NSObject *v3;
  NSObject *v4;
  NSTimer *v5;
  NSTimer *faceInFrameHandlerTimer;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_faceInFrameHandlerTimer)
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Face Tracker Timer already started, stopping it first", buf, 2u);
    }

    -[HPSSpatialProfileSingeStepEnrollmentController stopFaceInFrameHandlerTimer](self, "stopFaceInFrameHandlerTimer");
  }
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Face Tracker Timer", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_triggerFaceInFrameHandlerTimeout, 0, 0, 3.0);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  faceInFrameHandlerTimer = self->_faceInFrameHandlerTimer;
  self->_faceInFrameHandlerTimer = v5;

}

- (void)stopFaceInFrameHandlerTimer
{
  NSObject *v3;
  NSTimer *faceInFrameHandlerTimer;
  uint8_t v5[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Face Tracker Timer", v5, 2u);
  }

  -[NSTimer invalidate](self->_faceInFrameHandlerTimer, "invalidate");
  faceInFrameHandlerTimer = self->_faceInFrameHandlerTimer;
  self->_faceInFrameHandlerTimer = 0;

}

- (void)startPostProcessTimer
{
  NSObject *v3;
  double v4;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *postProcessTimer;
  NSTimer *v8;
  NSTimer *postProcessSpinnerTimer;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_postProcessTimer)
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Post Process Timer already started, stopping it first", (uint8_t *)&v10, 2u);
    }

    -[HPSSpatialProfileSingeStepEnrollmentController stopPostProcessTimer](self, "stopPostProcessTimer");
  }
  if (MGGetBoolAnswer())
    v4 = 120.0;
  else
    v4 = 240.0;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v4;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting Post Process Timer %f", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_triggerPostProcessTimeout, 0, 0, v4);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  postProcessTimer = self->_postProcessTimer;
  self->_postProcessTimer = v6;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_startPostProcessSpinner, 0, 0, 2.0);
  v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  postProcessSpinnerTimer = self->_postProcessSpinnerTimer;
  self->_postProcessSpinnerTimer = v8;

}

- (void)stopPostProcessTimer
{
  NSObject *v3;
  NSTimer *postProcessTimer;
  NSTimer *postProcessSpinnerTimer;
  uint8_t v6[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Post Process Timer", v6, 2u);
  }

  -[NSTimer invalidate](self->_postProcessTimer, "invalidate");
  postProcessTimer = self->_postProcessTimer;
  self->_postProcessTimer = 0;

  -[NSTimer invalidate](self->_postProcessSpinnerTimer, "invalidate");
  postProcessSpinnerTimer = self->_postProcessSpinnerTimer;
  self->_postProcessSpinnerTimer = 0;

}

- (void)triggerPostProcessTimeout
{
  NSObject *v3;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Triggering Post Process Timeout", v4, 2u);
  }

  -[HPSSpatialProfileSingeStepEnrollmentController moveToStep:](self, "moveToStep:", 3);
}

- (void)didReceiveStateUpdateForSession:(id)a3 stateInfo:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  void *v31;
  unsigned int v32;
  int *v33;
  unsigned int v34;
  int *v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  int currentStep;
  void *v45;
  char *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _BOOL4 v64;
  int v65;
  uint64_t v66;
  unint64_t v67;
  NSObject *v68;
  _BOOL4 faceCaptured;
  _QWORD block[5];
  _QWORD v71[5];
  _QWORD v72[5];
  uint8_t buf[4];
  unint64_t v74;
  __int16 v75;
  int v76;
  uint64_t v77;
  CGRect v78;
  CGRect v79;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)MEMORY[0x1E0D28750];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28750]);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v7, "objectForKeyedSubscript:", *v8),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.1();
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", *v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  v14 = (_QWORD *)MEMORY[0x1E0D28728];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28728]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "code");
      sharedBluetoothSettingsLogComponent();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v74 = (unint64_t)v17;
        _os_log_impl(&dword_1DB30C000, v18, OS_LOG_TYPE_DEFAULT, "Spatial Profile: didReceiveStateUpdateForSession  ERROR: %@ ", buf, 0xCu);
      }

      if (self->_currentStep != 3)
        -[HPSSpatialProfileSingeStepEnrollmentController moveToStep:](self, "moveToStep:", 3);
      sharedBluetoothSettingsLogComponent();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.4(v17);

    }
  }
  if (self->_sessionState != v13)
  {
    sharedBluetoothSettingsLogComponent();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v74 = v13;
      _os_log_impl(&dword_1DB30C000, v20, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Frame Rate : Update Session %lu", buf, 0xCu);
    }

    self->_sessionState = v13;
  }
  if (v13 - 1 <= 1)
    -[HPSSpatialProfileAnalytics incrementFrameCount](self->_enrollmentAnalytics, "incrementFrameCount");
  v21 = (_QWORD *)MEMORY[0x1E0D28740];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28740]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.3();

    objc_msgSend(v7, "objectForKeyedSubscript:", *v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

  }
  else
  {
    v26 = 0.0;
  }
  switch(v13)
  {
    case 0uLL:
      sharedBluetoothSettingsLogComponent();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_71;
      *(_WORD *)buf = 0;
      v28 = "Spatial Profile: State Update: Idle";
      v29 = v27;
      v30 = 2;
      goto LABEL_34;
    case 1uLL:
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28730]);
      v27 = objc_claimAutoreleasedReturnValue();
      -[NSObject yawAngles](v27, "yawAngles");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      v33 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
      if (v27)
      {
        v34 = v32 >> 1;
        -[NSObject faceBoundingBox](v27, "faceBoundingBox");
        if (!CGRectEqualToRect(v78, *MEMORY[0x1E0C9D648]) && !self->_faceCaptured)
        {
          -[NSObject faceBoundingBox](v27, "faceBoundingBox");
          -[HPSSpatialProfileSingeStepEnrollmentController updateFaceTrackingStatus:](self, "updateFaceTrackingStatus:");
        }
        v35 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
        if (!self->_faceStraightZeroAngleCaptured)
        {
          -[NSObject yawAngles](v27, "yawAngles");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectAtIndexedSubscript:", v34);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "captured");

          if (v41)
          {
            self->_faceStraightZeroAngleCaptured = 1;
            sharedBluetoothSettingsLogComponent();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              v74 = 0;
              v75 = 1024;
              v76 = 1;
              _os_log_impl(&dword_1DB30C000, v42, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Captured straight face angle %f ->  %d", buf, 0x12u);
            }

          }
          v35 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
          if (!self->_faceStraightZeroAngleCaptured)
            goto LABEL_53;
        }
        if (self->_currentStep == 6)
        {
          self->_faceDetected = 1;
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35[180]), "fillPill:updatePillsForPoseStatus:withCompletion:", v34, v27, &__block_literal_global_173);
          sharedBluetoothSettingsLogComponent();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB30C000, v43, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Straight angle: Transition to View CaptureMoveHead", buf, 2u);
          }

          v33 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
          if (self->_currentStep <= 6)
            -[HPSSpatialProfileSingeStepEnrollmentController moveToStep:](self, "moveToStep:", 7);
        }
        else
        {
LABEL_53:
          v33 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
        }
        currentStep = self->_currentStep;
        if (currentStep == 7 || currentStep == 2)
        {
          -[HPSSpatialProfileSingleStepSoundHapticManager startEnrollLoop](self->_soundHapticManager, "startEnrollLoop");
          v45 = *(Class *)((char *)&self->super.super.super.isa + v35[180]);
          v46 = (char *)self + v33[202];
          v72[0] = MEMORY[0x1E0C809B0];
          v72[1] = 3221225472;
          v72[2] = __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_174;
          v72[3] = &unk_1EA29AFF0;
          v72[4] = self;
          objc_msgSend(v45, "updatePillsForPoseStatus:pillCount:alongSideAction:", v27, v46, v72);
        }
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28720]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28738]);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28748]);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v47, "earCaptureStatus");
      objc_msgSend(v47, "earBoundingBox");
      v52 = v51;
      v54 = v53;
      v56 = v55;
      v58 = v57;
      -[HPSSpatialProfileSingeStepEnrollmentController updateCurrentTrackingEar:rightEarPoseStatus:earBoundingBox:earStatus:](self, "updateCurrentTrackingEar:rightEarPoseStatus:earBoundingBox:earStatus:", v48, v49, v50);
      if (self->_enrollmentPaused)
        goto LABEL_66;
      v79.origin.x = v52;
      v79.origin.y = v54;
      v79.size.width = v56;
      v79.size.height = v58;
      if (!CGRectEqualToRect(v79, *MEMORY[0x1E0C9D648]))
      {
        -[HPSSpatialProfileVideoCaptureSession previewLayer](self->videoCaptureSession, "previewLayer");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "frame");
        -[HPSSpatialProfileSingeStepEnrollmentController translateEarBoundingBox:previewLayerBoundingBox:](self, "translateEarBoundingBox:previewLayerBoundingBox:", v52, v54, v56, v58, v60, v61, v62, v63);

      }
      -[HPSSpatialProfileSingeStepEnrollmentController updateBoundingBoxHiddenStatus](self, "updateBoundingBoxHiddenStatus");
      v64 = -[HPSSpatialProfileSingeStepEnrollmentController isEarOccluded](self, "isEarOccluded");
      v65 = self->_currentStep;
      if (v64)
      {
        if (v65 != 7)
          goto LABEL_66;
        v66 = 2;
      }
      else
      {
        if (v65 != 2)
          goto LABEL_66;
        v66 = 7;
      }
      -[HPSSpatialProfileSingeStepEnrollmentController moveToStep:](self, "moveToStep:", v66);
LABEL_66:
      v67 = *(unsigned int *)((char *)&self->super.super.super.isa + v33[202]);
      -[NSObject yawAngles](v27, "yawAngles");
      v68 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v68, "count") > v67)
        goto LABEL_69;
      faceCaptured = self->_faceCaptured;

      if (!faceCaptured)
      {
        self->_currentProgress = 0.0;
        dispatch_get_global_queue(21, 0);
        v68 = objc_claimAutoreleasedReturnValue();
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_177;
        v71[3] = &unk_1EA29A770;
        v71[4] = self;
        dispatch_async(v68, v71);
LABEL_69:

      }
LABEL_71:

LABEL_72:
      if (self->_currentProgress != v26)
        self->_currentProgress = v26;

      return;
    case 3uLL:
      -[HPSSpatialProfileAnalytics updateSoundProfileCreationDurationStart](self->_enrollmentAnalytics, "updateSoundProfileCreationDurationStart");
      sharedBluetoothSettingsLogComponent();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v36 = self->_currentStep;
        *(_DWORD *)buf = 67109120;
        LODWORD(v74) = v36;
        v28 = "Spatial Profile: State Update: Post Process : %d";
        v29 = v27;
        v30 = 8;
LABEL_34:
        _os_log_impl(&dword_1DB30C000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      }
      goto LABEL_71;
    case 4uLL:
      if (self->_currentStep <= 7)
        -[HPSSpatialProfileSingeStepEnrollmentController moveToStep:](self, "moveToStep:", 8);
      sharedBluetoothSettingsLogComponent();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v37, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Retrieve Profile", buf, 2u);
      }

      -[HPSSpatialProfileSingeStepEnrollmentController moveToStep:](self, "moveToStep:", 10);
      -[HPSSpatialProfileAnalytics updateSoundProfileCreationDuration](self->_enrollmentAnalytics, "updateSoundProfileCreationDuration");
      goto LABEL_72;
    case 5uLL:
      sharedBluetoothSettingsLogComponent();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.2();

      -[HPSSpatialProfileAnalytics updateStatus:EnrollmentResult:](self->_enrollmentAnalytics, "updateStatus:EnrollmentResult:", 0, CFSTR("Failed"));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_178;
      block[3] = &unk_1EA29A770;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      goto LABEL_72;
    default:
      goto LABEL_72;
  }
}

int *__92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_174(uint64_t a1)
{
  char v2;
  int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  int *result;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1224) = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "leftSectionCompleted");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "rightSectionCompleted");
  v4 = v3;
  if ((v2 & 1) != 0 || v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v5 + 1184))
    {
      *(_BYTE *)(v5 + 1184) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "triggerSoundHapticForEarCaptureState:completion:", 0, &__block_literal_global_175);
    }
  }
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "leftSectionCompleted");
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1404);
    v11[0] = 67109632;
    v11[1] = v7;
    v12 = 1024;
    v13 = v4;
    v14 = 1024;
    v15 = v8;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Phase 2 -> End, L%i R%i _enrollmentUICompletionStepComplete:%i", (uint8_t *)v11, 0x14u);
  }

  result = (int *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "leftSectionCompleted");
  if ((_DWORD)result)
  {
    result = (int *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "rightSectionCompleted");
    if ((_DWORD)result)
    {
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1404))
      {
        sharedBluetoothSettingsLogComponent();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Phase 2 -> End UI complete", (uint8_t *)v11, 2u);
        }

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1404) = 1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "stopEnrollLoop");
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1220) = 33;
        result = *(int **)(a1 + 32);
        if (result[281] <= 7)
          return (int *)objc_msgSend(result, "moveToStep:", 8);
      }
    }
  }
  return result;
}

void __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  sharedBluetoothSettingsLogComponent();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DB30C000, v0, OS_LOG_TYPE_DEFAULT, "Spatial Profile: HPSSpatialProfileEarCaptureStep_First complete sound played", v1, 2u);
  }

}

uint64_t __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_177(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveToStep:", 8);
}

uint64_t __92__HPSSpatialProfileSingeStepEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_178(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopEnrollment");
}

- (void)didReceiveCaptureVideo:(id)a3 colorImage:(id)a4 depthImage:(id)a5 faceObject:(id)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *visualDetectionQueue;
  id *v12;
  _QWORD block[4];
  _QWORD v14[2];
  _QWORD v15[4];
  _QWORD v16[2];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (self->_enrollViewInitialized)
  {
    visualDetectionQueue = self->_visualDetectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_187;
    block[3] = &unk_1EA29A908;
    v12 = (id *)v14;
    v14[0] = v9;
    v14[1] = self;
    dispatch_async(visualDetectionQueue, block);
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke;
    v15[3] = &unk_1EA29B018;
    v12 = (id *)v16;
    v16[0] = v8;
    v16[1] = self;
    v17 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
}

void __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  HPSSpatialProfileSingleStepPearlEnrollView *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double Width;
  size_t Height;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const __CFString *v27;
  NSObject *v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  _BYTE v33[10];
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Update Preview Layer", (uint8_t *)&v32, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1186) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "setPreviewLayer:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 1360);
    *(_QWORD *)(v6 + 1360) = v5;

    v8 = (void *)MEMORY[0x1E0C9DDA8];
    v9 = *MEMORY[0x1E0C9DD28];
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1360);
    v35 = *MEMORY[0x1E0C9DD18];
    v36[0] = *MEMORY[0x1E0C9DD10];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detectorOfType:context:options:", v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 1368);
    *(_QWORD *)(v13 + 1368) = v12;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "previewLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 0;
    objc_msgSend(v15, "setOpacity:", v16);

    v17 = -[HPSSpatialProfileSingleStepPearlEnrollView initWithVideoCaptureSession:inSheet:squareNeedsPositionLayout:]([HPSSpatialProfileSingleStepPearlEnrollView alloc], "initWithVideoCaptureSession:inSheet:squareNeedsPositionLayout:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1136), 0, 0);
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(v18 + 1032);
    *(_QWORD *)(v18 + 1032) = v17;

    objc_msgSend(*(id *)(a1 + 40), "setupEnrollViewUI");
    objc_msgSend(*(id *)(a1 + 40), "pauseEnrollment");
    v20 = *(_QWORD *)(a1 + 40) + 992;
    Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 48), "pixelBuffer"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 48), "pixelBuffer"));
    *(_QWORD *)v20 = 0;
    *(_QWORD *)(v20 + 8) = 0;
    *(double *)(v20 + 16) = Width;
    *(double *)(v20 + 24) = (double)Height;
    sharedBluetoothSettingsLogComponent();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1008);
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1016);
      v32 = 134218240;
      *(_QWORD *)v33 = v25;
      *(_WORD *)&v33[8] = 2048;
      v34 = v24;
      _os_log_impl(&dword_1DB30C000, v23, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Frame Size  %f %f", (uint8_t *)&v32, 0x16u);
    }

    sharedBluetoothSettingsLogComponent();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1104))
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      v32 = 138412290;
      *(_QWORD *)v33 = v27;
      _os_log_impl(&dword_1DB30C000, v26, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Checking enrollment viewer Spinner %@", (uint8_t *)&v32, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1182) = 1;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1104))
    {
      sharedBluetoothSettingsLogComponent();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = *(_QWORD *)(a1 + 40);
        v30 = *(unsigned __int8 *)(v29 + 1182);
        v31 = objc_msgSend(*(id *)(v29 + 1256), "available");
        v32 = 67109376;
        *(_DWORD *)v33 = v30;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v31;
        _os_log_impl(&dword_1DB30C000, v28, OS_LOG_TYPE_DEFAULT, "Spatial Profile: didReceiveCaptureVideo -> stopWelcomeSpinner, _enrollmentReady %d [_btManager available] %d", (uint8_t *)&v32, 0xEu);
      }

      objc_msgSend(*(id *)(a1 + 40), "stopWelcomeSpinner");
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_cold_1();

  }
}

void __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_187(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  int v20;
  const __CFString *v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  int v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1354);
    v3 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, *MEMORY[0x1E0C9DD20]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1368), "featuresInImage:options:", *(_QWORD *)(a1 + 32), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (!v7)
      goto LABEL_12;
    v8 = v7;
    v23 = v2;
    v24 = v5;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v9 |= objc_msgSend(v14, "hasLeftEyePosition");
        v10 |= objc_msgSend(v14, "hasRightEyePosition");
        v11 |= objc_msgSend(v14, "hasMouthPosition");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v8);
    v5 = v24;
    v2 = v23;
    if ((v9 & v10 & v11 & 1) != 0)
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(unsigned __int8 *)(v15 + 1355);
      if (v16 <= 0x63)
        *(_BYTE *)(v15 + 1355) = v16 + 1;
    }
    else
    {
LABEL_12:
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1355) = 0;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1354) = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1355) > 0x63u;
    if (v2 != *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1354))
    {
      sharedBluetoothSettingsLogComponent();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(unsigned __int8 *)(v18 + 1354);
        v20 = *(unsigned __int8 *)(v18 + 1355);
        if (v19)
          v21 = CFSTR("At Phone");
        else
          v21 = CFSTR("away");
        *(_DWORD *)buf = 138412546;
        v30 = v21;
        v31 = 1024;
        v32 = v20;
        _os_log_impl(&dword_1DB30C000, v17, OS_LOG_TYPE_DEFAULT, "Spatial Profile: 2 User attention status %@ Count %d", buf, 0x12u);
      }

      v22 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v22 + 1354))
      {
        *(_QWORD *)(v22 + 1296) = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1268) = 0;
      }
    }

  }
}

- (void)updateCurrentTrackingEar:(id)a3 rightEarPoseStatus:(id)a4 earBoundingBox:(CGRect)a5 earStatus:(int)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char *v13;
  id v14;
  NSObject *v15;
  void *v16;
  unint64_t earOcclusionDetectTracker;
  _BOOL4 isEarOccluded;
  unint64_t v19;
  unint64_t earTooCloseDetectTracker;
  uint64_t v21;
  unint64_t earTooFarDetectTracker;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _BOOL4 v26;
  unint64_t earBoundingBoxDetectTracker;
  BOOL v28;
  unint64_t v29;
  NSObject *v30;
  unint64_t v31;
  _BOOL4 supressEarOcclusionWarning;
  const char *v33;
  int v34;
  const char *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  unint64_t v43;
  uint64_t v44;
  NSRect v45;
  CGRect v46;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v44 = *MEMORY[0x1E0C80C00];
  v13 = (char *)a3;
  v14 = a4;
  sharedBluetoothSettingsLogComponent();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    NSStringFromRect(v45);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    earOcclusionDetectTracker = self->_earOcclusionDetectTracker;
    v34 = 138413314;
    v35 = v13;
    v36 = 2112;
    v37 = (unint64_t)v14;
    v38 = 2112;
    v39 = v16;
    v40 = 1024;
    v41 = a6;
    v42 = 2048;
    v43 = earOcclusionDetectTracker;
    _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "Spatial Profile: updateCurrentTrackingEar left:%@  right: %@  box: %@  status:%i tracker:%lu", (uint8_t *)&v34, 0x30u);

  }
  if (self->_currentStep >= 7)
  {
    isEarOccluded = self->_isEarOccluded;
    switch(a6)
    {
      case 0:
        v19 = self->_earOcclusionDetectTracker;
        if (v19)
          self->_earOcclusionDetectTracker = v19 - 1;
        earTooCloseDetectTracker = self->_earTooCloseDetectTracker;
        if (earTooCloseDetectTracker)
          self->_earTooCloseDetectTracker = earTooCloseDetectTracker - 1;
        v21 = 1280;
        earTooFarDetectTracker = self->_earTooFarDetectTracker;
        if (earTooFarDetectTracker)
        {
          v23 = earTooFarDetectTracker - 1;
          goto LABEL_21;
        }
        break;
      case 2:
        if (!self->_isLookingAtPhone && !self->_earTooClose)
        {
          v21 = 1296;
          goto LABEL_18;
        }
        break;
      case 3:
        if (!self->_isLookingAtPhone)
        {
          v21 = 1288;
          v24 = self->_earTooCloseDetectTracker;
          if (v24 < 6)
            goto LABEL_20;
          v23 = 5;
          goto LABEL_21;
        }
        break;
      case 4:
        v21 = 1280;
LABEL_18:
        v24 = *(unint64_t *)((char *)&self->super.super.super.isa + v21);
        if (v24 < 0xB)
LABEL_20:
          v23 = v24 + 1;
        else
          v23 = 10;
LABEL_21:
        *(Class *)((char *)&self->super.super.super.isa + v21) = (Class)v23;
        break;
      default:
        break;
    }
    self->_isEarOccluded = self->_earOcclusionDetectTracker > 9;
    if (self->_earTooFarDetectTracker < 0xA)
    {
      v25 = self->_earTooCloseDetectTracker;
      if (!v25)
      {
        self->_earTooFar = 0;
        goto LABEL_31;
      }
    }
    else
    {
      self->_earTooFar = 1;
      v25 = self->_earTooCloseDetectTracker;
    }
    if (v25 >= 5)
    {
      self->_earTooClose = 1;
      goto LABEL_33;
    }
    if (v25)
    {
      if (self->_earTooClose)
        goto LABEL_33;
      goto LABEL_32;
    }
LABEL_31:
    self->_earTooClose = 0;
LABEL_32:
    if (!self->_earTooFar)
    {
LABEL_34:
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = height;
      v26 = CGRectEqualToRect(v46, *MEMORY[0x1E0C9D648]);
      earBoundingBoxDetectTracker = self->_earBoundingBoxDetectTracker;
      if (v26)
      {
        v28 = earBoundingBoxDetectTracker >= 3;
        v29 = earBoundingBoxDetectTracker - 3;
        if (!v28)
          v29 = 0;
        self->_earBoundingBoxDetectTracker = v29;
      }
      else
      {
        v29 = earBoundingBoxDetectTracker + 1;
        self->_earBoundingBoxDetectTracker = v29;
        self->_currentEarBB.origin.x = x;
        self->_currentEarBB.origin.y = y;
        self->_currentEarBB.size.width = width;
        self->_currentEarBB.size.height = height;
      }
      if (v29 >= 0xB)
      {
        v29 = 10;
        self->_earBoundingBoxDetectTracker = 10;
      }
      self->_earBoundingBoxDetected = v29 != 0;
      if (isEarOccluded != self->_isEarOccluded)
      {
        sharedBluetoothSettingsLogComponent();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = self->_earOcclusionDetectTracker;
          supressEarOcclusionWarning = self->_supressEarOcclusionWarning;
          if (self->_isEarOccluded)
            v33 = "YES";
          else
            v33 = "NO";
          v34 = 136315650;
          v35 = v33;
          v36 = 2048;
          v37 = v31;
          v38 = 1024;
          LODWORD(v39) = supressEarOcclusionWarning;
          _os_log_impl(&dword_1DB30C000, v30, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Occlusion changed to %s current number of entries %lu UI supressed = %d", (uint8_t *)&v34, 0x1Cu);
        }

      }
      goto LABEL_48;
    }
LABEL_33:
    self->_earOcclusionDetectTracker = 0;
    self->_isEarOccluded = 0;
    goto LABEL_34;
  }
LABEL_48:

}

- (void)translateEarBoundingBox:(CGRect)a3 previewLayerBoundingBox:(CGRect)a4
{
  float64x2_t v4;
  CGFloat height;
  float32x2_t v7;
  float v8;
  float v14;
  float v15;
  float v16;
  float v17;
  _QWORD block[6];
  float v19;
  float v20;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__HPSSpatialProfileSingeStepEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke;
  block[3] = &unk_1EA29B040;
  block[4] = self;
  v4.f64[0] = a4.size.width;
  v4.f64[1] = a4.size.height;
  _Q7 = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(v4, (float64x2_t)self->_visageFrame.size)));
  height = a3.size.height;
  v7 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(vmulq_f64((float64x2_t)a3.size, _Q7))), (float64x2_t)xmmword_1DB3C14A0));
  v8 = vmlad_n_f64((float)(0.5 * v7.f32[0]), a3.origin.x, _Q7.f64[0]);
  __asm { FMLA            D3, D1, V7.D[1] }
  v14 = _D3;
  v15 = a4.origin.y + v14;
  v16 = a4.size.width - v8;
  block[5] = v7;
  v17 = a4.origin.x + v16;
  v19 = v17;
  v20 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __98__HPSSpatialProfileSingeStepEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  __int128 v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __98__HPSSpatialProfileSingeStepEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke_2;
  v2[3] = &unk_1EA29B040;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.1);
}

uint64_t __98__HPSSpatialProfileSingeStepEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setBounds:", 0.0, 0.0, *(float *)(a1 + 40), *(float *)(a1 + 44));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setCenter:", *(float *)(a1 + 48), *(float *)(a1 + 52));
}

- (void)updateBoundingBoxHiddenStatus
{
  int v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  _QWORD v7[5];
  char v8;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;
  CGRect v12;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[CEKSubjectIndicatorView isHidden](self->_earBoundingBoxView, "isHidden");
  if (self->_currentStep == 7)
  {
    if (v3 == !self->_earBoundingBoxDetected)
      return;
    if (self->_earBoundingBoxDetected)
    {
      -[CEKSubjectIndicatorView bounds](self->_earBoundingBoxView, "bounds");
      if (CGRectEqualToRect(v12, *MEMORY[0x1E0C9D648]))
        return;
      v4 = 0;
      goto LABEL_8;
    }
  }
  else if ((v3 & 1) != 0)
  {
    return;
  }
  v4 = 1;
LABEL_8:
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("Showing");
    if (v4)
      v6 = CFSTR("Hidden");
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Bouding Box Updated : %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__HPSSpatialProfileSingeStepEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke;
  v7[3] = &unk_1EA29B068;
  v7[4] = self;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
}

uint64_t __79__HPSSpatialProfileSingeStepEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __79__HPSSpatialProfileSingeStepEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke_2;
  v2[3] = &unk_1EA29B068;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.3);
}

uint64_t __79__HPSSpatialProfileSingeStepEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setHidden:", *(unsigned __int8 *)(a1 + 40));
}

- (void)clearBoundingBox
{
  self->_earBoundingBoxDetectTracker = 0;
  self->_earBoundingBoxDetected = 0;
  -[HPSSpatialProfileSingeStepEnrollmentController updateBoundingBoxHiddenStatus](self, "updateBoundingBoxHiddenStatus");
}

- (int)state
{
  return 6;
}

- (void)playEarCaptureSoundWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  HPSSpatialProfileSingleStepSoundHapticManager *v7;
  NSObject *v8;
  HPSSpatialProfileSingleStepSoundHapticManager *soundHapticManager;
  id v10;
  _QWORD block[4];
  id v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x1E0C809B0];
  if (self->_earCaptureSoundStep == 1)
  {
    soundHapticManager = self->_soundHapticManager;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_2;
    v13[3] = &unk_1EA29A770;
    v14 = v5;
    -[HPSSpatialProfileSingleStepSoundHapticManager triggerSoundHapticForEarCaptureState:completion:](soundHapticManager, "triggerSoundHapticForEarCaptureState:completion:", 1, v13);
    v8 = v14;
  }
  else
  {
    if (self->_earCaptureSoundStep)
    {
      dispatch_group_leave(v5);
      goto LABEL_7;
    }
    v7 = self->_soundHapticManager;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke;
    v15[3] = &unk_1EA29A770;
    v16 = v5;
    -[HPSSpatialProfileSingleStepSoundHapticManager triggerSoundHapticForEarCaptureState:completion:](v7, "triggerSoundHapticForEarCaptureState:completion:", 0, v15);
    v8 = v16;
  }

LABEL_7:
  ++self->_earCaptureSoundStep;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_3;
  block[3] = &unk_1EA29A6D8;
  v12 = v4;
  v10 = v4;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);

}

void __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __84__HPSSpatialProfileSingeStepEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setupEarBoundingBox
{
  CEKSubjectIndicatorView *v3;
  CEKSubjectIndicatorView *earBoundingBoxView;

  v3 = (CEKSubjectIndicatorView *)objc_alloc_init(MEMORY[0x1E0D0D0A0]);
  earBoundingBoxView = self->_earBoundingBoxView;
  self->_earBoundingBoxView = v3;

  -[CEKSubjectIndicatorView setPulsing:](self->_earBoundingBoxView, "setPulsing:", 0);
  -[CEKSubjectIndicatorView setInactive:](self->_earBoundingBoxView, "setInactive:", 1);
  -[CEKSubjectIndicatorView setHidden:](self->_earBoundingBoxView, "setHidden:", 1);
  -[UIView addSubview:](self->_enrollContentView, "addSubview:", self->_earBoundingBoxView);
}

- (void)pulseEarBoundingBox
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HPSSpatialProfileSingeStepEnrollmentController_pulseEarBoundingBox__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __69__HPSSpatialProfileSingeStepEnrollmentController_pulseEarBoundingBox__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setInactive:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "startScalingWithExpansionWidth:duration:repeatCount:", 1, 10.0, 0.1);
  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HPSSpatialProfileSingeStepEnrollmentController_pulseEarBoundingBox__block_invoke_2;
  block[3] = &unk_1EA29A770;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

uint64_t __69__HPSSpatialProfileSingeStepEnrollmentController_pulseEarBoundingBox__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setInactive:", 1);
}

- (void)showBudsInEarPopUp:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "classicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "productId");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ACCESSORY_MODEL_NAME_%d"), v6 - 0x2000);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    v10 = v6 >= 0x200A;
  else
    v10 = 0;
  if (v10)
  {

    if (v6 >> 4 <= 0x200)
      goto LABEL_10;
  }
  else
  {

  }
  if (v6 == 8210)
    v7 = CFSTR("ACCESSORY_MODEL_NAME_18");
  else
    v7 = CFSTR("ACCESSORY_MODEL_NAME_15");
LABEL_10:
  sharedBluetoothSettingsLogComponent();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "classicDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v13;
    _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Device %@, bud in ear", buf, 0xCu);

  }
  objc_msgSend((id)MGGetStringAnswer(), "uppercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_"), "stringByAppendingFormat:", CFSTR("%@_%@"), v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", v15, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v6)
  {
    case 0x2025u:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_24");
      v21 = CFSTR("DeviceConfig-B465");
      goto LABEL_18;
    case 0x201Du:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_42");
      v21 = CFSTR("DeviceConfig-B498-v2");
      goto LABEL_18;
    case 0x2017u:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_23");
      v21 = CFSTR("DeviceConfig-B453");
LABEL_18:
      objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1EA29D890, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v22;
      break;
  }
  v23 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_IN_EAR_TEXT"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "alertControllerWithTitle:message:preferredStyle:", v17, v25, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 0, &__block_literal_global_203);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addAction:", v30);

  -[HPSSpatialProfileSingeStepEnrollmentController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v26, 1, 0);
}

- (BOOL)checkAndShowInEarPopup
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  uint8_t buf[16];
  uint8_t v16;
  _BYTE v17[15];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[BluetoothManager connectedDevices](self->_btManager, "connectedDevices");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (+[HPSProductUtils isAppleHeadphone:](HPSProductUtils, "isAppleHeadphone:", v8)
          && (objc_msgSend(v8, "isTemporaryPaired") & 1) == 0)
        {
          if ((objc_msgSend(v8, "isGenuineAirPods") & 1) != 0)
          {
            +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v8, "inEarDetectEnabled") & 1) != 0)
            {
              if (v9)
              {
                v14 = 3;
                *(_DWORD *)buf = 3;
                -[NSObject classicDevice](v9, "classicDevice");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "inEarStatusPrimary:secondary:", buf, &v14);

                if (!*(_DWORD *)buf || !v14)
                {
                  -[HPSSpatialProfileSingeStepEnrollmentController showBudsInEarPopUp:](self, "showBudsInEarPopUp:", v9);
                  v12 = 1;
LABEL_26:

                  goto LABEL_27;
                }
              }
            }
            else
            {
              sharedBluetoothSettingsLogComponent();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Please enable the Automatic Ear Detection in Bluetooth Settings", buf, 2u);
              }

              if (v9)
              {
                v12 = !self->_inEarDetectDisabledPopUpShown;
                if (!self->_inEarDetectDisabledPopUpShown)
                {
                  v12 = 1;
                  self->_inEarDetectDisabledPopUpShown = 1;
                  -[HPSSpatialProfileSingeStepEnrollmentController showBudsInEarPopUp:](self, "showBudsInEarPopUp:", v9);
                }
                goto LABEL_26;
              }
            }
          }
          else
          {
            sharedBluetoothSettingsLogComponent();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              -[HPSSpatialProfileSingeStepEnrollmentController getBudsInEarString].cold.1(&v16, v17, v9);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_27:

  return v12;
}

- (void)showLandscapeAlert
{
  NSObject *v3;
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
  _QWORD v14[5];
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Landscape Mode Detected, not supported, show pop up alert", buf, 2u);
  }

  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LANDSCAPE_MODE_ALERT_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LANDSCAPE_MODE_ALERT_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HPSSpatialProfileSingeStepEnrollmentController_showLandscapeAlert__block_invoke;
  v14[3] = &unk_1EA29A880;
  v14[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  -[HPSSpatialProfileSingeStepEnrollmentController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __68__HPSSpatialProfileSingeStepEnrollmentController_showLandscapeAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelSpatialAudioProfile");
}

- (void)showEarPillsDots
{
  HPSSpatialProfileSingleStepPillContainerView *pillContainerView;
  _QWORD v4[5];

  pillContainerView = self->_pillContainerView;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HPSSpatialProfileSingeStepEnrollmentController_showEarPillsDots__block_invoke;
  v4[3] = &unk_1EA29A770;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", pillContainerView, 5242880, v4, 0, 0.4);
  -[HPSSpatialProfileEarDotsMovieView showDots](self->_earDotsMovieView, "showDots");
}

uint64_t __66__HPSSpatialProfileSingeStepEnrollmentController_showEarPillsDots__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "setAlpha:", 1.0);
}

- (void)hideEarPillsDots
{
  HPSSpatialProfileSingleStepPillContainerView *pillContainerView;
  _QWORD v4[5];

  pillContainerView = self->_pillContainerView;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HPSSpatialProfileSingeStepEnrollmentController_hideEarPillsDots__block_invoke;
  v4[3] = &unk_1EA29A770;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", pillContainerView, 5242880, v4, 0, 0.4);
  -[HPSSpatialProfileEarDotsMovieView hideDots](self->_earDotsMovieView, "hideDots");
}

uint64_t __66__HPSSpatialProfileSingeStepEnrollmentController_hideEarPillsDots__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "setAlpha:", 0.0);
}

- (void)prepareSpinner
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  if (!self->_spinner)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v3;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_spinner, "setActivityIndicatorViewStyle:", 100);
    -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6 * 0.5;
    -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", v7, v9 * 0.5);

    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_spinner);

  }
}

- (void)cleanUpSpinner
{
  UIActivityIndicatorView *spinner;

  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
  spinner = self->_spinner;
  self->_spinner = 0;

}

- (void)startWelcomeSpinner
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  UIActivityIndicatorView *spinner;
  void *v8;
  uint8_t v9[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Welcome Spinner", v9, 2u);
  }

  self->_welcomeSpinnerOn = 1;
  -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[HPSSpatialProfileSingeStepEnrollmentController prepareSpinner](self, "prepareSpinner");
  spinner = self->_spinner;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](spinner, "setColor:", v8);

}

- (void)stopWelcomeSpinner
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Not Started, Can Not Stop Post Process Spinner", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)startPostProcessSpinner
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIActivityIndicatorView *spinner;
  void *v13;
  uint8_t v14[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Post Process Spinner", v14, 2u);
  }

  self->_postProcessSpinnerOn = 1;
  -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  -[HPSSpatialProfileSingeStepEnrollmentController showContinueButton](self, "showContinueButton");
  -[HPSSpatialProfileSingeStepEnrollmentController prepareSpinner](self, "prepareSpinner");
  -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 1.0);

  spinner = self->_spinner;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](spinner, "setColor:", v13);

}

- (void)stopPostProcessSpinner
{
  _BOOL4 postProcessSpinnerOn;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  postProcessSpinnerOn = self->_postProcessSpinnerOn;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (postProcessSpinnerOn)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stop Post Process Spinner", v11, 2u);
    }

    self->_postProcessSpinnerOn = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

    -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    -[HPSSpatialProfileSingleStepBottomContainer continueButton](self->_bottomContainerView, "continueButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInteractionEnabled:", 1);

    -[HPSSpatialProfileSingeStepEnrollmentController cleanUpSpinner](self, "cleanUpSpinner");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSingeStepEnrollmentController stopWelcomeSpinner].cold.1();

  }
}

- (void)updateFaceTrackingStatus:(CGRect)a3
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int faceBoundingBoxStatus;
  double v9;
  float v10;
  int v11;
  NSObject *v12;
  float v13;
  int v14;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  CGFloat v23;
  __int16 v24;
  double v25;
  __int16 v26;
  CGFloat v27;
  __int16 v28;
  CGFloat v29;
  uint64_t v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  faceBoundingBoxStatus = self->_faceBoundingBoxStatus;
  v9 = self->_visageFrame.size.height;
  v10 = a3.size.width / self->_visageFrame.size.width;
  if (faceBoundingBoxStatus == 1)
  {
    if (v10 >= 0.45)
      return;
    v11 = 5;
  }
  else
  {
    if (faceBoundingBoxStatus != 5 || v10 <= 0.55)
      return;
    v11 = 1;
  }
  self->_faceBoundingBoxStatus = v11;
  sharedBluetoothSettingsLogComponent();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = height / v9;
    v14 = self->_faceBoundingBoxStatus;
    v15[0] = 67110912;
    v15[1] = faceBoundingBoxStatus;
    v16 = 1024;
    v17 = v14;
    v18 = 2048;
    v19 = (float)(v10 * 100.0);
    v20 = 2048;
    v21 = (float)(v13 * 100.0);
    v22 = 2048;
    v23 = width;
    v24 = 2048;
    v25 = height;
    v26 = 2048;
    v27 = x;
    v28 = 2048;
    v29 = y;
    _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Face Status changed from %d -> %d Status Ratio [ %f %f ] Face BB [ %f %f , %f %f]", (uint8_t *)v15, 0x4Au);
  }

}

- (void)hideContinueButton
{
  -[HPSSpatialProfileSingleStepBottomContainer showContinueButton:](self->_bottomContainerView, "showContinueButton:", 0);
}

- (void)showContinueButton
{
  -[HPSSpatialProfileSingleStepBottomContainer showContinueButton:](self->_bottomContainerView, "showContinueButton:", 1);
}

- (void)cancelBlur
{
  -[HPSSpatialProfileSingleStepPearlEnrollView setPauseBlur:](self->_enrollView, "setPauseBlur:", 1);
  -[HPSSpatialProfileSingleStepPearlEnrollView setForceBlur:](self->_enrollView, "setForceBlur:", 0);
  -[HPSSpatialProfileSingleStepPearlEnrollView setCameraBlurAmount:useShade:duration:completion:](self->_enrollView, "setCameraBlurAmount:useShade:duration:completion:", 0, 0, 0.0, 0.5);
}

- (void)forceBlur
{
  -[HPSSpatialProfileSingleStepPearlEnrollView setPauseBlur:](self->_enrollView, "setPauseBlur:", 0);
  -[HPSSpatialProfileSingleStepPearlEnrollView setForceBlur:](self->_enrollView, "setForceBlur:", 1);
  -[HPSSpatialProfileSingleStepPearlEnrollView setCameraBlurAmount:useShade:duration:completion:](self->_enrollView, "setCameraBlurAmount:useShade:duration:completion:", 0, 0, 15.0, 0.5);
}

- (void)sendTipKitSignal
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0D027B8], "discoverabilitySignal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D02618]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:bundleID:context:", CFSTR("com.apple.HeadphoneSettings.spatial-profile-enrollment-triggered"), v6, 0);

  objc_msgSend(v3, "sendEvent:", v7);
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Signal Sent to TipKit", v9, 2u);
  }

}

- (id)dismissalHandler
{
  return self->dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (NSString)downloadAssetPath
{
  return self->_downloadAssetPath;
}

- (void)setDownloadAssetPath:(id)a3
{
  objc_storeStrong((id *)&self->_downloadAssetPath, a3);
}

- (BOOL)pillsFilled
{
  return self->_pillsFilled;
}

- (void)setPillsFilled:(BOOL)a3
{
  self->_pillsFilled = a3;
}

- (NSMutableArray)cachedTransitionStates
{
  return self->_cachedTransitionStates;
}

- (void)setCachedTransitionStates:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTransitionStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTransitionStates, 0);
  objc_storeStrong((id *)&self->_downloadAssetPath, 0);
  objc_storeStrong(&self->dismissalHandler, 0);
  objc_storeStrong((id *)&self->_offScreenBottomContainerView, 0);
  objc_storeStrong((id *)&self->_bottomContainerView, 0);
  objc_storeStrong((id *)&self->_pillContainerView, 0);
  objc_storeStrong((id *)&self->_frameDetector, 0);
  objc_storeStrong((id *)&self->_frameContext, 0);
  objc_storeStrong((id *)&self->_occlusionWarnCoolDownTimer, 0);
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_visualDetectionQueue, 0);
  objc_storeStrong((id *)&self->_stepSerialQueue, 0);
  objc_storeStrong((id *)&self->_faceInFrameHandlerTimer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_enrollmentAnalytics, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_enrollmentSession, 0);
  objc_storeStrong((id *)&self->videoCaptureSession, 0);
  objc_storeStrong((id *)&self->_startEarEnrollWarningCoolDownTimer, 0);
  objc_storeStrong((id *)&self->_tutorialResumeEnrollTimer, 0);
  objc_storeStrong((id *)&self->_postProcessSpinnerTimer, 0);
  objc_storeStrong((id *)&self->_postProcessTimer, 0);
  objc_storeStrong((id *)&self->_captureViewTimer, 0);
  objc_storeStrong((id *)&self->_earBoundingBoxView, 0);
  objc_storeStrong((id *)&self->_earDotsMovieView, 0);
  objc_storeStrong((id *)&self->_earTutorialView, 0);
  objc_storeStrong((id *)&self->_tutorialContentView, 0);
  objc_storeStrong((id *)&self->_enrollView, 0);
  objc_storeStrong((id *)&self->_soundHapticManager, 0);
  objc_storeStrong((id *)&self->_welcomeImageView, 0);
  objc_storeStrong((id *)&self->_welcomeContentView, 0);
  objc_storeStrong((id *)&self->_enrollContentView, 0);
}

void __65__HPSSpatialProfileSingeStepEnrollmentController_startEnrollment__block_invoke_cold_1()
{
  __assert_rtn("-[HPSSpatialProfileSingeStepEnrollmentController startEnrollment]_block_invoke", "HPSSpatialProfileSingeStepEnrollmentController.m", 532, "started");
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Move to Step -> Default", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Profile Synced", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __61__HPSSpatialProfileSingeStepEnrollmentController_syncProfile__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB30C000, a2, OS_LOG_TYPE_ERROR, "Spatial Profile: Profile NOT Synced, Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)getBudsInEarString
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_1(&dword_1DB30C000, a3, (uint64_t)a3, "Spatial Profile: Not Genuine Apple Headphone", a1);
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.1()
{
  __assert_rtn("-[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:]", "HPSSpatialProfileSingeStepEnrollmentController.m", 1282, "stateInfo[kHRTFStateInfoStateKey] && [stateInfo[kHRTFStateInfoStateKey] isKindOfClass:NSNumber.class]");
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: State Update: State Error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.3()
{
  __assert_rtn("-[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:]", "HPSSpatialProfileSingeStepEnrollmentController.m", 1309, "[stateInfo[kHRTFStateInfoProgressKey] isKindOfClass:NSNumber.class]");
}

- (void)didReceiveStateUpdateForSession:(void *)a1 stateInfo:.cold.4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1DB30C000, v1, v2, "Spatial Profile: Fetch Completed: Error: %s, Error code: %d", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7();
}

void __106__HPSSpatialProfileSingeStepEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Invalid Capture Session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
