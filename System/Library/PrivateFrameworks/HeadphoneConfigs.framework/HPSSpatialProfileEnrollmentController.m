@implementation HPSSpatialProfileEnrollmentController

- (HPSSpatialProfileEnrollmentController)init
{
  HPSSpatialProfileEnrollmentController *v2;
  uint64_t v3;
  BluetoothManager *btManager;
  UIImageView *welcomeImageView;
  OBTrayButton *continueButton;
  OBTrayButton *occlusionContinueButton;
  OBTrayButton *earDistanceWarnContinueButton;
  HPSSpatialProfileEarPillContainerView *earPillContainer;
  HPSSpatialProfileSoundHapticManager *soundHapticManager;
  UIActivityIndicatorView *spinner;
  CIContext *frameContext;
  CIDetector *frameDetector;
  NSTimer *earEnrollmentNudgeTimer;
  NSArray *pendingYaw;
  dispatch_queue_t v16;
  OS_dispatch_queue *stepSerialQueue;
  dispatch_queue_t v18;
  OS_dispatch_queue *visualDetectionQueue;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *feedBackBinning;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSArray *feedBackPitch;
  void *v38;
  void *v39;
  objc_super v41;

  if (!self)
    return 0;
  v41.receiver = self;
  v41.super_class = (Class)HPSSpatialProfileEnrollmentController;
  v2 = -[HPSSpatialProfileEnrollmentController init](&v41, sel_init);
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v3 = objc_claimAutoreleasedReturnValue();
  btManager = v2->_btManager;
  v2->_btManager = (BluetoothManager *)v3;

  v2->_bluetoothBecameAvailable = 0;
  v2->_inEarDetectDisabledPopUpShown = 0;
  v2->_isEarOccluded = 0;
  welcomeImageView = v2->_welcomeImageView;
  v2->_welcomeImageView = 0;

  continueButton = v2->_continueButton;
  v2->_continueButton = 0;

  occlusionContinueButton = v2->_occlusionContinueButton;
  v2->_occlusionContinueButton = 0;

  earDistanceWarnContinueButton = v2->_earDistanceWarnContinueButton;
  v2->_earDistanceWarnContinueButton = 0;

  earPillContainer = v2->_earPillContainer;
  v2->_earPillContainer = 0;

  soundHapticManager = v2->_soundHapticManager;
  v2->_soundHapticManager = 0;

  v2->_currentStep = 0;
  v2->_previousStep = 0;
  spinner = v2->_spinner;
  v2->_spinner = 0;

  v2->_enrollmentStarted = 0;
  v2->_enrollmentReady = 0;
  v2->_enrollmentPaused = 0;
  v2->_enrollmentCompleted = 0;
  v2->_enrollViewInitialized = 0;
  v2->_welcomeSpinnerOn = 0;
  v2->_postProcessSpinnerOn = 0;
  v2->_initialVolume = 0.0;
  v2->_volumeChanged = 0;
  v2->_currentProgress = 0.0;
  v2->_faceDetected = 0;
  v2->_faceStraightZeroAngleCaptured = 0;
  v2->_faceCaptured = 0;
  v2->_faceUpFilled = 0;
  v2->_faceDownFilled = 0;
  v2->_faceLeftFilled = 0;
  v2->_faceRightFilled = 0;
  v2->_faceBoundingBoxStatus = 0;
  v2->_earCaptureSoundStep = 0;
  v2->_rightEarDetected = 0;
  v2->_rightEarCaptured = 0;
  v2->_rightEarFrontCaptured = 0;
  v2->_rightEarMidCaptured = 0;
  v2->_rightEarRearCaptured = 0;
  v2->_rightEarCaptureCount = 0;
  v2->_rightEarInViewCount = 0;
  v2->_rightEarStatus = 0;
  v2->_leftEarDetected = 0;
  v2->_leftEarCaptured = 0;
  v2->_leftEarFrontCaptured = 0;
  v2->_leftEarMidCaptured = 0;
  v2->_leftEarRearCaptured = 0;
  v2->_leftEarCaptureCount = 0;
  v2->_leftEarInViewCount = 0;
  v2->_earBoundingBoxDetectTracker = 0;
  v2->_earBoundingBoxDetected = 0;
  v2->_leftEarStatus = 0;
  v2->_debugMode = 0;
  v2->_currentTrackingEar = 0;
  v2->_isLookingAtPhone = 0;
  v2->_faceInFrameCount = 0;
  frameContext = v2->_frameContext;
  v2->_frameContext = 0;

  frameDetector = v2->_frameDetector;
  v2->_frameDetector = 0;

  v2->_earOcclusionDetectTracker = 0;
  v2->_supressEarOcclusionWarning = 0;
  v2->_occlusionSupressTimeOut = 10;
  v2->_currentEarBB.origin = 0u;
  v2->_currentEarBB.size = 0u;
  v2->_earTooClose = 0;
  v2->_supressEarDistanceWarning = 0;
  v2->_earTooCloseDetectTracker = 0;
  v2->_earTooFar = 0;
  v2->_earTooFarDetectTracker = 0;
  v2->_motionBlurr = 0;
  v2->_motionBlurrTracker = 0;
  v2->_lastEarCaptureTime = 0.0;
  earEnrollmentNudgeTimer = v2->_earEnrollmentNudgeTimer;
  v2->_earEnrollmentNudgeTimer = 0;

  v2->_leftEarLastYaw = -100.0;
  v2->_rightEarLastYaw = -100.0;
  v2->_leftLastReceivedYaw = -100.0;
  v2->_rightLastReceivedYaw = -100.0;
  v2->_enrollGuidancePitch = 0.5;
  v2->_currentYaw = -100.0;
  v2->_candidateYaw = -100.0;
  pendingYaw = v2->_pendingYaw;
  v2->_pendingYaw = 0;

  v16 = dispatch_queue_create("com.apple.HeadphoneSettings.stepSerialQueue", 0);
  stepSerialQueue = v2->_stepSerialQueue;
  v2->_stepSerialQueue = (OS_dispatch_queue *)v16;

  v18 = dispatch_queue_create("com.apple.HeadphoneSettings.visualDetectionQueue", 0);
  visualDetectionQueue = v2->_visualDetectionQueue;
  v2->_visualDetectionQueue = (OS_dispatch_queue *)v18;

  v2->_sessionState = 0;
  v20 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 30.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 25.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 20.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 15.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 10.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 5.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v20, "initWithObjects:", v21, v22, v23, v24, v25, v26, 0);
  feedBackBinning = v2->_feedBackBinning;
  v2->_feedBackBinning = (NSArray *)v27;

  v29 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 3.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v29, "initWithObjects:", v30, v31, v32, v33, v34, v35, 0);
  feedBackPitch = v2->_feedBackPitch;
  v2->_feedBackPitch = (NSArray *)v36;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObserver:selector:name:object:", v2, sel_cancelSpatialAudioProfile, *MEMORY[0x1E0DC4768], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObserver:selector:name:object:", v2, sel_bluetoothDidBecomeAvailable, *MEMORY[0x1E0D03390], 0);

  return v2;
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
  v9.super_class = (Class)HPSSpatialProfileEnrollmentController;
  -[HPSSpatialProfileEnrollmentController viewDidLoad](&v9, sel_viewDidLoad);
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;

  if (v5 <= v8)
  {
    -[HPSSpatialProfileEnrollmentController setupEnrollController](self, "setupEnrollController");
    -[HPSSpatialProfileEnrollmentController setupWelcomeContentView](self, "setupWelcomeContentView");
    -[HPSSpatialProfileEnrollmentController setupAudioVideo](self, "setupAudioVideo");
    -[HPSSpatialProfileEnrollmentController setupEarTutorialView](self, "setupEarTutorialView");
    -[HPSSpatialProfileEnrollmentController setupEarBoundingBox](self, "setupEarBoundingBox");
    -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 0);
  }
  else
  {
    -[HPSSpatialProfileEnrollmentController showLandscapeAlert](self, "showLandscapeAlert");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HPSSpatialProfileEnrollmentController;
  -[HPSSpatialProfileEnrollmentController viewDidAppear:](&v3, sel_viewDidAppear_, 1);
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

  -[HPSSpatialProfileEnrollmentController cancelSpatialAudioProfile](self, "cancelSpatialAudioProfile");
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
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;
  UIView *enrollContentView;
  UIView *v16;
  UIView *scrollContentView;
  UIScrollView *v18;
  UIScrollView *scrollView;
  UIView *v20;
  UIView *scrollInnerContentView;
  UIStackView *v22;
  UIStackView *scrollInnerStackView;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  OBHeaderView *v29;
  OBHeaderView *infoView;
  UILabel *v31;
  UILabel *learnMoreView;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  OBTrayButton *v37;
  OBTrayButton *continueButton;
  OBTrayButton *v39;
  void *v40;
  void *v41;
  OBTrayButton *v42;
  OBTrayButton *occlusionContinueButton;
  OBTrayButton *v44;
  void *v45;
  void *v46;
  OBTrayButton *v47;
  OBTrayButton *earDistanceWarnContinueButton;
  OBTrayButton *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  UIVisualEffectView *v54;
  UIVisualEffectView *buttonTrayEffectView;
  UIView *v56;
  UIView *spacerViewFirst;
  UIView *v58;
  UIView *spacerViewSecond;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
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
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  _QWORD v235[49];

  v235[47] = *MEMORY[0x1E0C80C00];
  if (!self->_enrollmentSession)
  {
    v3 = (HRTFEnrollmentSession *)objc_alloc_init(MEMORY[0x1E0D28718]);
    enrollmentSession = self->_enrollmentSession;
    self->_enrollmentSession = v3;

    -[HRTFEnrollmentSession setDelegate:](self->_enrollmentSession, "setDelegate:", self);
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_userCancelEnrollment);
  -[HPSSpatialProfileEnrollmentController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = (void *)v5;
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = (UIView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  enrollContentView = self->_enrollContentView;
  self->_enrollContentView = v14;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_enrollContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v10, v11, v12, v13);
  scrollContentView = self->_scrollContentView;
  self->_scrollContentView = v16;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", v10, v11, v12, v13);
  scrollView = self->_scrollView;
  self->_scrollView = v18;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  scrollInnerContentView = self->_scrollInnerContentView;
  self->_scrollInnerContentView = v20;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollInnerContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  scrollInnerStackView = self->_scrollInnerStackView;
  self->_scrollInnerStackView = v22;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollInnerStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_scrollInnerStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_scrollInnerStackView, "setAlignment:", 3);
  -[UIStackView setDistribution:](self->_scrollInnerStackView, "setDistribution:", 3);
  v24 = objc_alloc(MEMORY[0x1E0D65160]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (OBHeaderView *)objc_msgSend(v24, "initWithTitle:detailText:icon:", v26, v28, 0);
  infoView = self->_infoView;
  self->_infoView = v29;

  -[OBHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_infoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  learnMoreView = self->_learnMoreView;
  self->_learnMoreView = v31;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_learnMoreView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("WELCOME_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_learnMoreView, "setText:", v34);

  -[UILabel setLineBreakMode:](self->_learnMoreView, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](self->_learnMoreView, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_learnMoreView, "setFont:", v35);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_learnMoreView, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_learnMoreView, "setTextColor:", v36);

  -[UILabel setTextAlignment:](self->_learnMoreView, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v37 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v37;

  v39 = self->_continueButton;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setTitle:forState:](v39, "setTitle:forState:", v41, 0);

  -[OBTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped, 64);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v42 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
  occlusionContinueButton = self->_occlusionContinueButton;
  self->_occlusionContinueButton = v42;

  v44 = self->_occlusionContinueButton;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setTitle:forState:](v44, "setTitle:forState:", v46, 0);

  -[OBTrayButton addTarget:action:forControlEvents:](self->_occlusionContinueButton, "addTarget:action:forControlEvents:", self, sel_continueOcclusionWarning, 64);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v47 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
  earDistanceWarnContinueButton = self->_earDistanceWarnContinueButton;
  self->_earDistanceWarnContinueButton = v47;

  v49 = self->_earDistanceWarnContinueButton;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setTitle:forState:](v49, "setTitle:forState:", v51, 0);

  -[OBTrayButton addTarget:action:forControlEvents:](self->_earDistanceWarnContinueButton, "addTarget:action:forControlEvents:", self, sel_continueEarDistanceWarning, 64);
  v52 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 6);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (UIVisualEffectView *)objc_msgSend(v52, "initWithEffect:", v53);
  buttonTrayEffectView = self->_buttonTrayEffectView;
  self->_buttonTrayEffectView = v54;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonTrayEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v56 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  spacerViewFirst = self->_spacerViewFirst;
  self->_spacerViewFirst = v56;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_spacerViewFirst, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v58 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  spacerViewSecond = self->_spacerViewSecond;
  self->_spacerViewSecond = v58;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_spacerViewSecond, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (self->_debugMode)
  {
    -[UIView layer](self->_enrollContentView, "layer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v62 = objc_msgSend(v61, "CGColor");
    -[UIView layer](self->_enrollContentView, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setBorderColor:", v62);

    -[UIView layer](self->_scrollContentView, "layer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v66 = objc_msgSend(v65, "CGColor");
    -[UIView layer](self->_scrollContentView, "layer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setBorderColor:", v66);

    -[UIScrollView layer](self->_scrollView, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v70 = objc_msgSend(v69, "CGColor");
    -[UIScrollView layer](self->_scrollView, "layer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setBorderColor:", v70);

    -[OBHeaderView layer](self->_infoView, "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setBorderWidth:", 2.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v74 = objc_msgSend(v73, "CGColor");
    -[OBHeaderView layer](self->_infoView, "layer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setBorderColor:", v74);

    -[UIVisualEffectView layer](self->_buttonTrayEffectView, "layer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setBorderWidth:", 2.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v78 = objc_msgSend(v77, "CGColor");
    -[UIVisualEffectView layer](self->_buttonTrayEffectView, "layer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setBorderColor:", v78);

  }
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addSubview:", self->_enrollContentView);

  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "addSubview:", self->_scrollContentView);

  -[UIView addSubview:](self->_scrollContentView, "addSubview:", self->_scrollView);
  -[UIView addSubview:](self->_scrollContentView, "addSubview:", self->_buttonTrayEffectView);
  -[UIView addSubview:](self->_scrollContentView, "addSubview:", self->_continueButton);
  -[UIView addSubview:](self->_scrollContentView, "addSubview:", self->_occlusionContinueButton);
  -[UIView addSubview:](self->_scrollContentView, "addSubview:", self->_earDistanceWarnContinueButton);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_scrollInnerContentView);
  -[UIView addSubview:](self->_scrollInnerContentView, "addSubview:", self->_scrollInnerStackView);
  -[UIStackView addArrangedSubview:](self->_scrollInnerStackView, "addArrangedSubview:", self->_infoView);
  -[UIStackView addArrangedSubview:](self->_scrollInnerStackView, "addArrangedSubview:", self->_spacerViewFirst);
  -[UIStackView addArrangedSubview:](self->_scrollInnerStackView, "addArrangedSubview:", self->_learnMoreView);
  -[UIStackView addArrangedSubview:](self->_scrollInnerStackView, "addArrangedSubview:", self->_spacerViewSecond);
  -[HPSSpatialProfileEnrollmentController hideOcclusionContinueButton](self, "hideOcclusionContinueButton");
  -[HPSSpatialProfileEnrollmentController hideEarDistanceWarningContinueButton](self, "hideEarDistanceWarningContinueButton");
  v168 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](self->_enrollContentView, "topAnchor");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "safeAreaLayoutGuide");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "topAnchor");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "constraintEqualToAnchor:", v225);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v235[0] = v224;
  -[UIView heightAnchor](self->_enrollContentView, "heightAnchor");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "frame");
  objc_msgSend(v222, "constraintEqualToConstant:", v82);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v235[1] = v221;
  -[UIView leadingAnchor](self->_enrollContentView, "leadingAnchor");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v220, "leadingAnchor");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "constraintEqualToAnchor:", v218);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v235[2] = v217;
  -[UIView trailingAnchor](self->_enrollContentView, "trailingAnchor");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "trailingAnchor");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "constraintEqualToAnchor:", v214);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v235[3] = v213;
  -[UIView topAnchor](self->_scrollContentView, "topAnchor");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "constraintEqualToAnchor:constant:", v230, 24.0);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v235[4] = v211;
  -[UIView leadingAnchor](self->_scrollContentView, "leadingAnchor");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "leadingAnchor");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v209, "constraintEqualToAnchor:constant:", v208, 24.0);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v235[5] = v207;
  -[UIView trailingAnchor](self->_scrollContentView, "trailingAnchor");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "trailingAnchor");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "constraintEqualToAnchor:constant:", v204, -24.0);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v235[6] = v203;
  -[UIView bottomAnchor](self->_scrollContentView, "bottomAnchor");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "safeAreaLayoutGuide");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "bottomAnchor");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "constraintEqualToAnchor:", v199);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v235[7] = v198;
  -[OBTrayButton leadingAnchor](self->_continueButton, "leadingAnchor");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_scrollContentView, "leadingAnchor");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "constraintEqualToAnchor:", v196);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v235[8] = v195;
  -[OBTrayButton trailingAnchor](self->_continueButton, "trailingAnchor");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_scrollContentView, "trailingAnchor");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "constraintEqualToAnchor:", v193);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v235[9] = v192;
  -[OBTrayButton bottomAnchor](self->_continueButton, "bottomAnchor");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_scrollContentView, "bottomAnchor");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "constraintEqualToAnchor:", v190);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v235[10] = v189;
  -[OBTrayButton leadingAnchor](self->_occlusionContinueButton, "leadingAnchor");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_scrollContentView, "leadingAnchor");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "constraintEqualToAnchor:", v187);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v235[11] = v186;
  -[OBTrayButton trailingAnchor](self->_occlusionContinueButton, "trailingAnchor");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_scrollContentView, "trailingAnchor");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "constraintEqualToAnchor:", v184);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v235[12] = v183;
  -[OBTrayButton bottomAnchor](self->_occlusionContinueButton, "bottomAnchor");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_scrollContentView, "bottomAnchor");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "constraintEqualToAnchor:", v181);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v235[13] = v179;
  -[OBTrayButton leadingAnchor](self->_earDistanceWarnContinueButton, "leadingAnchor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_scrollContentView, "leadingAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "constraintEqualToAnchor:", v177);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v235[14] = v176;
  -[OBTrayButton trailingAnchor](self->_earDistanceWarnContinueButton, "trailingAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_scrollContentView, "trailingAnchor");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "constraintEqualToAnchor:", v174);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v235[15] = v173;
  -[OBTrayButton bottomAnchor](self->_earDistanceWarnContinueButton, "bottomAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_scrollContentView, "bottomAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "constraintEqualToAnchor:", v170);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v235[16] = v169;
  -[UIVisualEffectView leadingAnchor](self->_buttonTrayEffectView, "leadingAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "leadingAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "constraintEqualToAnchor:", v165);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v235[17] = v164;
  -[UIVisualEffectView trailingAnchor](self->_buttonTrayEffectView, "trailingAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "trailingAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:", v161);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v235[18] = v160;
  -[UIVisualEffectView topAnchor](self->_buttonTrayEffectView, "topAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton topAnchor](self->_continueButton, "topAnchor");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "constraintEqualToAnchor:constant:", v180, -24.0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v235[19] = v158;
  -[UIVisualEffectView topAnchor](self->_buttonTrayEffectView, "topAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton topAnchor](self->_occlusionContinueButton, "topAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "constraintEqualToAnchor:constant:", v156, -24.0);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v235[20] = v155;
  -[UIVisualEffectView topAnchor](self->_buttonTrayEffectView, "topAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton topAnchor](self->_earDistanceWarnContinueButton, "topAnchor");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "constraintEqualToAnchor:constant:", v172, -24.0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v235[21] = v153;
  -[UIVisualEffectView bottomAnchor](self->_buttonTrayEffectView, "bottomAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "bottomAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "constraintEqualToAnchor:", v150);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v235[22] = v149;
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_scrollContentView, "topAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "constraintEqualToAnchor:", v147);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v235[23] = v146;
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView topAnchor](self->_buttonTrayEffectView, "topAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintEqualToAnchor:constant:", v144, 24.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v235[24] = v143;
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_scrollContentView, "leadingAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "constraintEqualToAnchor:", v141);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v235[25] = v140;
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_scrollContentView, "trailingAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "constraintEqualToAnchor:", v138);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v235[26] = v137;
  -[UIView topAnchor](self->_scrollInnerContentView, "topAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:", v135);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v235[27] = v134;
  -[UIView bottomAnchor](self->_scrollInnerContentView, "bottomAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "constraintEqualToAnchor:", v132);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v235[28] = v131;
  -[UIView leadingAnchor](self->_scrollInnerContentView, "leadingAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "constraintEqualToAnchor:", v129);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v235[29] = v128;
  -[UIView trailingAnchor](self->_scrollInnerContentView, "trailingAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:", v126);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v235[30] = v125;
  -[UIView widthAnchor](self->_scrollInnerContentView, "widthAnchor");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView widthAnchor](self->_scrollView, "widthAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v232, "constraintEqualToAnchor:", v124);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v235[31] = v123;
  -[UIStackView topAnchor](self->_scrollInnerStackView, "topAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "constraintEqualToAnchor:", v121);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v235[32] = v120;
  -[UIStackView bottomAnchor](self->_scrollInnerStackView, "bottomAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "constraintEqualToAnchor:", v118);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v235[33] = v117;
  -[UIStackView leadingAnchor](self->_scrollInnerStackView, "leadingAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:", v115);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v235[34] = v114;
  -[UIStackView trailingAnchor](self->_scrollInnerStackView, "trailingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v112);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v235[35] = v111;
  -[OBHeaderView leadingAnchor](self->_infoView, "leadingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_scrollInnerStackView, "leadingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:", v109);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v235[36] = v108;
  -[OBHeaderView trailingAnchor](self->_infoView, "trailingAnchor");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_scrollInnerStackView, "trailingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "constraintEqualToAnchor:", v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v235[37] = v106;
  -[UILabel leadingAnchor](self->_learnMoreView, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_scrollInnerStackView, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v104);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v235[38] = v103;
  -[UILabel trailingAnchor](self->_learnMoreView, "trailingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_scrollInnerStackView, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v101);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v235[39] = v100;
  -[UILabel heightAnchor](self->_learnMoreView, "heightAnchor");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v233, "constraintGreaterThanOrEqualToConstant:", 50.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v235[40] = v99;
  -[UIView leadingAnchor](self->_spacerViewFirst, "leadingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_scrollInnerStackView, "leadingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v97);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v235[41] = v96;
  -[UIView trailingAnchor](self->_spacerViewFirst, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_scrollInnerStackView, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v235[42] = v93;
  -[UIView heightAnchor](self->_spacerViewFirst, "heightAnchor");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v231, "constraintEqualToConstant:", 24.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v235[43] = v83;
  -[UIView leadingAnchor](self->_spacerViewSecond, "leadingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_scrollInnerStackView, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v235[44] = v86;
  -[UIView trailingAnchor](self->_spacerViewSecond, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_scrollInnerStackView, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v235[45] = v89;
  -[UIView heightAnchor](self->_spacerViewSecond, "heightAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToConstant:", 24.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v235[46] = v91;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v235, 47);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "activateConstraints:", v92);

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
  HPSSpatialProfileSoundHapticManager *v3;
  HPSSpatialProfileSoundHapticManager *soundHapticManager;
  HPSSpatialProfileVideoCaptureSession *v5;
  HPSSpatialProfileVideoCaptureSession *videoCaptureSession;

  v3 = objc_alloc_init(HPSSpatialProfileSoundHapticManager);
  soundHapticManager = self->_soundHapticManager;
  self->_soundHapticManager = v3;

  -[HPSSpatialProfileSoundHapticManager start](self->_soundHapticManager, "start");
  v5 = objc_alloc_init(HPSSpatialProfileVideoCaptureSession);
  videoCaptureSession = self->videoCaptureSession;
  self->videoCaptureSession = v5;

  -[HPSSpatialProfileEnrollmentController checkVolume](self, "checkVolume");
}

- (void)checkVolume
{
  void *v3;
  float *p_initialVolume;
  int v5;
  NSObject *v6;
  NSObject *v7;
  double v8;
  NSObject *v9;
  void *v10;
  double v11;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_initialVolume = &self->_initialVolume;
  v5 = objc_msgSend(v3, "getVolume:forCategory:", &self->_initialVolume, CFSTR("Audio/Video"));

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *p_initialVolume;
      v12 = 134217984;
      v13 = v8;
      _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Initial Volume: %f", (uint8_t *)&v12, 0xCu);
    }

    if (*p_initialVolume < 0.5)
    {
      sharedBluetoothSettingsLogComponent();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = 0.5;
        _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Initial Volume Too Low, Changing to Min Volume: %f", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = 0.5;
      objc_msgSend(v10, "setVolumeTo:forCategory:", CFSTR("Audio/Video"), v11);

      self->_volumeChanged = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSingeStepEnrollmentController checkVolume].cold.1();

  }
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
  HPSSpatialProfileEarPillContainerView *v5;
  HPSSpatialProfileEarPillContainerView *earPillContainer;
  void *v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  HPSSpatialProfileEarDotsMovieView *v13;
  HPSSpatialProfileEarDotsMovieView *earDotsMovieView;
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
  uint8_t buf[16];
  _QWORD v51[14];

  v51[12] = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Setting up Enroll View UI", buf, 2u);
  }

  -[HPSSpatialProfileUIPearlEnrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_enrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BKUIPearlEnrollView setDelegate:](self->_enrollView, "setDelegate:", self);
  -[BKUIPearlEnrollView preEnrollActivate](self->_enrollView, "preEnrollActivate");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollView setBackgroundColor:](self->_enrollView, "setBackgroundColor:", v4);

  v5 = objc_alloc_init(HPSSpatialProfileEarPillContainerView);
  earPillContainer = self->_earPillContainer;
  self->_earPillContainer = v5;

  -[HPSSpatialProfileEarPillContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_earPillContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HPSSpatialProfileEarPillContainerView setAlpha:](self->_earPillContainer, "setAlpha:", 0.0);
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8 / 390.0;

  v10 = v9 < 1.0;
  if (v9 >= 1.0)
    v11 = 0.0;
  else
    v11 = 10.0;
  if (v10)
    v12 = 85.0;
  else
    v12 = 100.0;
  v13 = -[HPSSpatialProfileEarDotsMovieView initWithFrame:]([HPSSpatialProfileEarDotsMovieView alloc], "initWithFrame:", 0.0, 0.0, 345.0, v12);
  earDotsMovieView = self->_earDotsMovieView;
  self->_earDotsMovieView = v13;

  -[HPSSpatialProfileEarDotsMovieView setTranslatesAutoresizingMaskIntoConstraints:](self->_earDotsMovieView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HPSSpatialProfileEarDotsMovieView setAlpha:](self->_earDotsMovieView, "setAlpha:", 0.0);
  -[UIView addSubview:](self->_enrollContentView, "addSubview:", self->_enrollView);
  -[UIView addSubview:](self->_enrollContentView, "addSubview:", self->_earPillContainer);
  -[UIView addSubview:](self->_enrollContentView, "addSubview:", self->_earDotsMovieView);
  v37 = (void *)MEMORY[0x1E0CB3718];
  -[HPSSpatialProfileUIPearlEnrollView leadingAnchor](self->_enrollView, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_enrollContentView, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v47;
  -[HPSSpatialProfileUIPearlEnrollView trailingAnchor](self->_enrollView, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_enrollContentView, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v44;
  -[HPSSpatialProfileUIPearlEnrollView topAnchor](self->_enrollView, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_enrollContentView, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v41;
  -[HPSSpatialProfileUIPearlEnrollView bottomAnchor](self->_enrollView, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v38;
  -[HPSSpatialProfileEarPillContainerView widthAnchor](self->_earPillContainer, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToConstant:", 172.5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v35;
  -[HPSSpatialProfileEarPillContainerView heightAnchor](self->_earPillContainer, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", 25.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v33;
  -[HPSSpatialProfileEarPillContainerView centerXAnchor](self->_earPillContainer, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_enrollContentView, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v30;
  -[HPSSpatialProfileEarPillContainerView bottomAnchor](self->_earPillContainer, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v27;
  -[HPSSpatialProfileEarDotsMovieView widthAnchor](self->_earDotsMovieView, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 345.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v25;
  -[HPSSpatialProfileEarDotsMovieView heightAnchor](self->_earDotsMovieView, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = v15;
  -[HPSSpatialProfileEarDotsMovieView centerXAnchor](self->_earDotsMovieView, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_enrollContentView, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51[10] = v18;
  -[HPSSpatialProfileEarDotsMovieView bottomAnchor](self->_earDotsMovieView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_enrollContentView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[11] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v22);

  -[BKUIPearlEnrollView setState:completion:](self->_enrollView, "setState:completion:", 0, &__block_literal_global_11);
  if (!self->_currentStep)
    -[HPSSpatialProfileUIPearlEnrollView setHidden:](self->_enrollView, "setHidden:", 1);
  -[HPSSpatialProfileEnrollmentController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNeedsLayout");

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

- (void)startEnrollment
{
  _BOOL4 enrollmentStarted;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  enrollmentStarted = self->_enrollmentStarted;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (enrollmentStarted)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSingeStepEnrollmentController startEnrollment].cold.1();

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting Enrollment", v6, 2u);
    }

    self->_enrollmentStarted = 1;
    -[HRTFEnrollmentSession startSession:then:](self->_enrollmentSession, "startSession:then:", 1, &__block_literal_global_82);
  }
}

void __56__HPSSpatialProfileEnrollmentController_startEnrollment__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
    __56__HPSSpatialProfileEnrollmentController_startEnrollment__block_invoke_cold_1();
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
  _BOOL4 enrollmentStarted;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  enrollmentStarted = self->_enrollmentStarted;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (enrollmentStarted)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Enrollment", v6, 2u);
    }

    self->_enrollmentStarted = 0;
    -[HRTFEnrollmentSession stopSession:](self->_enrollmentSession, "stopSession:", &__block_literal_global_85);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSingeStepEnrollmentController stopEnrollment].cold.1();

  }
}

void __55__HPSSpatialProfileEnrollmentController_stopEnrollment__block_invoke()
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
  NSObject *v3;
  uint8_t v4[16];

  if (self->_enrollmentStarted)
  {
    if (self->_enrollmentPaused)
    {
      sharedBluetoothSettingsLogComponent();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[HPSSpatialProfileSingeStepEnrollmentController pauseEnrollment].cold.2();
    }
    else
    {
      -[HRTFEnrollmentSession pauseSession](self->_enrollmentSession, "pauseSession");
      self->_enrollmentPaused = 1;
      sharedBluetoothSettingsLogComponent();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Enrollment Paused", v4, 2u);
      }
    }
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSingeStepEnrollmentController pauseEnrollment].cold.1();
  }

}

- (void)resumeEnrollment
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  uint8_t buf[2];

  if (self->_enrollmentStarted)
  {
    if (self->_enrollmentPaused)
    {
      -[HRTFEnrollmentSession resumeSession](self->_enrollmentSession, "resumeSession");
      self->_enrollmentPaused = 0;
      sharedBluetoothSettingsLogComponent();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 0;
        v4 = "Spatial Profile: Enrollment Resumed";
        v5 = (uint8_t *)&v6;
LABEL_7:
        _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      }
    }
    else
    {
      sharedBluetoothSettingsLogComponent();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[HPSSpatialProfileSingeStepEnrollmentController resumeEnrollment].cold.1();
    }
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "Spatial Profile: Cannot Resume Enrollment, NOT Started";
      v5 = buf;
      goto LABEL_7;
    }
  }

}

- (void)moveToStep:(int)a3
{
  NSObject *stepSerialQueue;
  _QWORD v4[5];
  int v5;

  stepSerialQueue = self->_stepSerialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke;
  v4[3] = &unk_1EA29AF18;
  v4[4] = self;
  v5 = a3;
  dispatch_async(stepSerialQueue, v4);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_group_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  HPSSpatialProfileAnalytics *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  dispatch_time_t v77;
  _QWORD v78[4];
  NSObject *v79;
  _QWORD v80[4];
  NSObject *v81;
  uint64_t v82;
  _QWORD v83[4];
  NSObject *v84;
  _QWORD v85[4];
  NSObject *v86;
  uint64_t v87;
  _QWORD v88[4];
  NSObject *v89;
  _QWORD v90[4];
  NSObject *v91;
  uint64_t v92;
  _QWORD v93[4];
  NSObject *v94;
  _QWORD v95[5];
  NSObject *v96;
  _QWORD v97[4];
  NSObject *v98;
  uint64_t v99;
  NSObject *v100;
  id v101;
  _QWORD v102[4];
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  id v106;
  _QWORD v107[4];
  NSObject *v108;
  uint64_t v109;
  NSObject *v110;
  _QWORD v111[4];
  NSObject *v112;
  uint64_t v113;
  NSObject *v114;
  _QWORD v115[4];
  NSObject *v116;
  uint64_t v117;
  NSObject *v118;
  id v119;
  _QWORD v120[4];
  NSObject *v121;
  uint64_t v122;
  NSObject *v123;
  id v124;
  _QWORD v125[4];
  NSObject *v126;
  uint64_t v127;
  NSObject *v128;
  _QWORD v129[4];
  NSObject *v130;
  uint64_t v131;
  NSObject *v132;
  _QWORD v133[4];
  NSObject *v134;
  uint64_t v135;
  NSObject *v136;
  _QWORD v137[4];
  NSObject *v138;
  uint64_t v139;
  NSObject *v140;
  _QWORD v141[4];
  NSObject *v142;
  uint64_t v143;
  NSObject *v144;
  _QWORD v145[5];
  NSObject *v146;
  NSObject *v147;
  _QWORD v148[5];
  NSObject *v149;
  uint8_t buf[16];
  _QWORD block[5];
  id location;

  v2 = dispatch_group_create();
  v3 = dispatch_group_create();
  NSLog(CFSTR("Spatial Profile: Sequence Enter Main"));
  dispatch_group_enter(v2);
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1232) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1228);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1228) = *(_DWORD *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2;
  block[3] = &unk_1EA29A770;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v5 = *(_QWORD *)(a1 + 32);
  switch(*(_DWORD *)(v5 + 1228))
  {
    case 0:
      sharedBluetoothSettingsLogComponent();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Welcome", buf, 2u);
      }

      v148[0] = v4;
      v148[1] = 3221225472;
      v148[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_88;
      v148[3] = &unk_1EA29A908;
      v148[4] = *(_QWORD *)(a1 + 32);
      v149 = v2;
      v7 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v148);

      v8 = v149;
      goto LABEL_65;
    case 1:
      sharedBluetoothSettingsLogComponent();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontView", buf, 2u);
      }

      v10 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v10 + 1272))
      {
        v11 = objc_alloc_init(HPSSpatialProfileAnalytics);
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 1272);
        *(_QWORD *)(v12 + 1272) = v11;

        v10 = *(_QWORD *)(a1 + 32);
      }
      v145[0] = v4;
      v145[1] = 3221225472;
      v145[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_91;
      v145[3] = &unk_1EA29B018;
      v145[4] = v10;
      v146 = v3;
      v147 = v2;
      v14 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v145);

      v8 = v146;
      goto LABEL_65;
    case 2:
      sharedBluetoothSettingsLogComponent();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCapturePositionFace", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "initFrameRateDetection");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updateFaceEnrollStart");
      v141[0] = v4;
      v141[1] = 3221225472;
      v141[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_99;
      v141[3] = &unk_1EA29B018;
      v16 = v3;
      v17 = *(_QWORD *)(a1 + 32);
      v142 = v16;
      v143 = v17;
      v144 = v2;
      v18 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v141);

      v8 = v142;
      goto LABEL_65;
    case 3:
      sharedBluetoothSettingsLogComponent();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v19, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureMoveHead", buf, 2u);
      }

      v137[0] = v4;
      v137[1] = 3221225472;
      v137[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_104;
      v137[3] = &unk_1EA29B018;
      v20 = v3;
      v21 = *(_QWORD *)(a1 + 32);
      v138 = v20;
      v139 = v21;
      v140 = v2;
      v22 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v137);

      v8 = v138;
      goto LABEL_65;
    case 4:
      sharedBluetoothSettingsLogComponent();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v23, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> FrontViewCaptureCompleted", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updateFaceEnrollDuration");
      v133[0] = v4;
      v133[1] = 3221225472;
      v133[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_108;
      v133[3] = &unk_1EA29B018;
      v24 = v3;
      v25 = *(_QWORD *)(a1 + 32);
      v134 = v24;
      v135 = v25;
      v136 = v2;
      v26 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v133);

      v8 = v134;
      goto LABEL_65;
    case 5:
      sharedBluetoothSettingsLogComponent();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v27, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEar", buf, 2u);
      }

      v129[0] = v4;
      v129[1] = 3221225472;
      v129[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_114;
      v129[3] = &unk_1EA29B018;
      v28 = v3;
      v29 = *(_QWORD *)(a1 + 32);
      v130 = v28;
      v131 = v29;
      v132 = v2;
      v30 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v129);

      v8 = v130;
      goto LABEL_65;
    case 6:
      sharedBluetoothSettingsLogComponent();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v31, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureHoldPhone", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updateRightEarEnrollStart");
      v125[0] = v4;
      v125[1] = 3221225472;
      v125[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_124;
      v125[3] = &unk_1EA29B018;
      v32 = v3;
      v33 = *(_QWORD *)(a1 + 32);
      v126 = v32;
      v127 = v33;
      v128 = v2;
      v34 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v125);

      v8 = v126;
      goto LABEL_65;
    case 7:
      sharedBluetoothSettingsLogComponent();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v35, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureRotateHead", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "startEarEnrollmentNudgeTimer");
      v120[0] = v4;
      v120[1] = 3221225472;
      v120[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_128;
      v120[3] = &unk_1EA29B7D0;
      v36 = v3;
      v37 = *(_QWORD *)(a1 + 32);
      v121 = v36;
      v122 = v37;
      objc_copyWeak(&v124, &location);
      v123 = v2;
      v38 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v120);

      objc_destroyWeak(&v124);
      v8 = v121;
      goto LABEL_65;
    case 8:
      sharedBluetoothSettingsLogComponent();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v57, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureCompleted", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updateRightEarEnrollDuration");
      objc_msgSend(*(id *)(a1 + 32), "stopEarEnrollmentNudgeTimer");
      v115[0] = v4;
      v115[1] = 3221225472;
      v115[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_132;
      v115[3] = &unk_1EA29B7D0;
      v58 = v3;
      v59 = *(_QWORD *)(a1 + 32);
      v116 = v58;
      v117 = v59;
      objc_copyWeak(&v119, &location);
      v118 = v2;
      v60 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v115);

      objc_destroyWeak(&v119);
      v8 = v116;
      goto LABEL_65;
    case 9:
      sharedBluetoothSettingsLogComponent();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v61, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEar", buf, 2u);
      }

      v111[0] = v4;
      v111[1] = 3221225472;
      v111[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_138;
      v111[3] = &unk_1EA29B018;
      v62 = v3;
      v63 = *(_QWORD *)(a1 + 32);
      v112 = v62;
      v113 = v63;
      v114 = v2;
      v64 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v111);

      v8 = v112;
      goto LABEL_65;
    case 0xA:
      sharedBluetoothSettingsLogComponent();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v39, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureHoldPhone", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updateLeftEarEnrollStart");
      v107[0] = v4;
      v107[1] = 3221225472;
      v107[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_147;
      v107[3] = &unk_1EA29B018;
      v40 = v3;
      v41 = *(_QWORD *)(a1 + 32);
      v108 = v40;
      v109 = v41;
      v110 = v2;
      v42 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v107);

      v8 = v108;
      goto LABEL_65;
    case 0xB:
      sharedBluetoothSettingsLogComponent();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v43, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureRotateHead", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "startEarEnrollmentNudgeTimer");
      v102[0] = v4;
      v102[1] = 3221225472;
      v102[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_151;
      v102[3] = &unk_1EA29B7D0;
      v44 = v3;
      v45 = *(_QWORD *)(a1 + 32);
      v103 = v44;
      v104 = v45;
      objc_copyWeak(&v106, &location);
      v105 = v2;
      v46 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v102);

      objc_destroyWeak(&v106);
      v8 = v103;
      goto LABEL_65;
    case 0xC:
      sharedBluetoothSettingsLogComponent();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v47, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureCompleted", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updateLeftEarEnrollDuration");
      objc_msgSend(*(id *)(a1 + 32), "stopEarEnrollmentNudgeTimer");
      v97[0] = v4;
      v97[1] = 3221225472;
      v97[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_155;
      v97[3] = &unk_1EA29B7D0;
      v48 = v3;
      v49 = *(_QWORD *)(a1 + 32);
      v98 = v48;
      v99 = v49;
      objc_copyWeak(&v101, &location);
      v100 = v2;
      v50 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v97);

      objc_destroyWeak(&v101);
      v8 = v98;
      goto LABEL_65;
    case 0xE:
      sharedBluetoothSettingsLogComponent();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v51, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RetrieveProfile", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "retrieveProfile");
      goto LABEL_55;
    case 0xF:
      sharedBluetoothSettingsLogComponent();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v52, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> SyncProfile", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "syncProfile");
      goto LABEL_55;
    case 0x10:
      objc_msgSend(*(id *)(v5 + 1272), "updateStatus:EnrollmentResult:", 1, CFSTR("Success"));
      sharedBluetoothSettingsLogComponent();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v66, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> Completed", buf, 2u);
      }

      v95[0] = v4;
      v95[1] = 3221225472;
      v95[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_163;
      v95[3] = &unk_1EA29A908;
      v95[4] = *(_QWORD *)(a1 + 32);
      v67 = v3;
      v96 = v67;
      v68 = MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v95);

      v93[0] = v4;
      v93[1] = 3221225472;
      v93[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_172;
      v93[3] = &unk_1EA29A770;
      v94 = v2;
      dispatch_group_notify(v67, v68, v93);

      v8 = v96;
      goto LABEL_65;
    case 0x11:
      sharedBluetoothSettingsLogComponent();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v69, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> CouldntScanEar", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updateStatus:EnrollmentResult:", 0, CFSTR("Failed"));
      v90[0] = v4;
      v90[1] = 3221225472;
      v90[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_175;
      v90[3] = &unk_1EA29A908;
      v70 = v3;
      v71 = *(_QWORD *)(a1 + 32);
      v91 = v70;
      v92 = v71;
      v72 = MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v90);

      v88[0] = v4;
      v88[1] = 3221225472;
      v88[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_182;
      v88[3] = &unk_1EA29A770;
      v89 = v2;
      dispatch_group_notify(v70, v72, v88);

      v8 = v91;
      goto LABEL_65;
    case 0x12:
      sharedBluetoothSettingsLogComponent();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v73, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> HairCoveringEar", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updateStatus:EnrollmentResult:", 0, CFSTR("Failed"));
      v85[0] = v4;
      v85[1] = 3221225472;
      v85[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_183;
      v85[3] = &unk_1EA29A908;
      v74 = v3;
      v75 = *(_QWORD *)(a1 + 32);
      v86 = v74;
      v87 = v75;
      v76 = MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v85);

      v83[0] = v4;
      v83[1] = 3221225472;
      v83[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_188;
      v83[3] = &unk_1EA29A770;
      v84 = v2;
      dispatch_group_notify(v74, v76, v83);

      v8 = v86;
      goto LABEL_65;
    case 0x13:
      sharedBluetoothSettingsLogComponent();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v53, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> GeneralFailure", buf, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updateStatus:EnrollmentResult:", 0, CFSTR("Failed"));
      v80[0] = v4;
      v80[1] = 3221225472;
      v80[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_189;
      v80[3] = &unk_1EA29A908;
      v54 = v3;
      v55 = *(_QWORD *)(a1 + 32);
      v81 = v54;
      v82 = v55;
      v56 = MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v80);

      v78[0] = v4;
      v78[1] = 3221225472;
      v78[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_195;
      v78[3] = &unk_1EA29A770;
      v79 = v2;
      dispatch_group_notify(v54, v56, v78);

      v8 = v81;
LABEL_65:

      break;
    default:
      sharedBluetoothSettingsLogComponent();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        __61__HPSSpatialProfileSingeStepEnrollmentController_moveToStep___block_invoke_cold_1();

LABEL_55:
      dispatch_group_leave(v2);
      break;
  }
  v77 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v2, v77);
  objc_destroyWeak(&location);

}

uint64_t __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setContentOffset:animated:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_88(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", v4, 0);

  if (!+[HPSSpatialProfileManager isProxCardShowed](HPSSpatialProfileManager, "isProxCardShowed"))
    +[HPSSpatialProfileManager setProxCardShowed:](HPSSpatialProfileManager, "setProxCardShowed:", 1);
  objc_msgSend(*(id *)(a1 + 32), "startEnrollment");
  objc_msgSend(*(id *)(a1 + 32), "showContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setAlpha:", 0.0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_91(uint64_t a1)
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
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FRONT_VIEW"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FRONT_VIEW_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("START_FRONT_VIEW_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "setFaceCaptured:", 0);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v11 = *(void **)(a1 + 40);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 1128);
  v13 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_98;
  v17[3] = &unk_1EA29A770;
  v18 = v11;
  objc_msgSend(v12, "setState:completion:", 2, v17);
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3;
  v15[3] = &unk_1EA29A770;
  v14 = *(NSObject **)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  dispatch_group_notify(v14, MEMORY[0x1E0C80D38], v15);

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_98(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3(uint64_t a1)
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

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_99(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FRONT_VIEW_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FRONT_VIEW_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1312) = 5;
  objc_msgSend(*(id *)(a1 + 40), "startCaptureViewTimer");
  objc_msgSend(*(id *)(a1 + 40), "hideContinueButton");
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 1128);
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_102;
  v20[3] = &unk_1EA29A770;
  v21 = v8;
  objc_msgSend(v9, "setState:completion:", 3, v20);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v12 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(v11 + 1120);
  v14 = *(unsigned int *)(v11 + 1228);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_103;
  v18[3] = &unk_1EA29A770;
  v19 = v12;
  objc_msgSend(v13, "triggerSoundHapticForEnrollmentState:completion:", v14, v18);
  objc_msgSend(*(id *)(a1 + 40), "resumeEnrollment");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v15 = *(NSObject **)(a1 + 32);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4;
  block[3] = &unk_1EA29A770;
  v17 = *(id *)(a1 + 48);
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 40), "startFaceInFrameHandlerTimer");

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_102(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_103(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4(uint64_t a1)
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

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_104(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 1128);
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_105;
  v14[3] = &unk_1EA29A770;
  v15 = v2;
  objc_msgSend(v3, "setState:completion:", 5, v14);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v5 + 1120);
  v8 = *(unsigned int *)(v5 + 1228);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_106;
  v12[3] = &unk_1EA29A770;
  v13 = v6;
  objc_msgSend(v7, "triggerSoundHapticForEnrollmentState:completion:", v8, v12);
  v9 = *(NSObject **)(a1 + 32);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_107;
  block[3] = &unk_1EA29A770;
  v11 = *(id *)(a1 + 48);
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_105(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_106(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_107(uint64_t a1)
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

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_108(uint64_t a1)
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
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FRONT_VIEW_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FRONT_VIEW_CAPTURED"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  objc_msgSend(*(id *)(a1 + 40), "stopCaptureViewTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setFaceCaptured:", 1);
  objc_msgSend(*(id *)(a1 + 40), "showContinueButton");
  objc_msgSend(*(id *)(a1 + 40), "forceBlur");
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v11 = *(void **)(a1 + 32);
  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 1128);
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_111;
  v23[3] = &unk_1EA29A770;
  v24 = v11;
  objc_msgSend(v12, "setState:completion:", 6, v23);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v15 = *(void **)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(v14 + 1120);
  v17 = *(unsigned int *)(v14 + 1228);
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_112;
  v21[3] = &unk_1EA29A770;
  v22 = v15;
  objc_msgSend(v16, "triggerSoundHapticForEnrollmentState:completion:", v17, v21);
  objc_msgSend(*(id *)(a1 + 40), "pauseEnrollment");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v18 = *(NSObject **)(a1 + 32);
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_113;
  block[3] = &unk_1EA29A770;
  v20 = *(id *)(a1 + 48);
  dispatch_group_notify(v18, MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 40), "stopFaceInFrameHandlerTimer");
  objc_msgSend(*(id *)(a1 + 40), "sendTipKitSignal");

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_111(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_112(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_113(uint64_t a1)
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

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_114(uint64_t a1)
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
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RIGHT_EAR"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RIGHT_EAR_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("START_RIGHT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1152), "startPlayerRightEar");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "pillContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setCrosshairsHidden:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setPauseBlur:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setForceBlur:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setHidden:", 1);
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1344) = 2;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1552) = 0x3FE0000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1560) = 0xC059000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1568) = 0xC059000000000000;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(v12 + 1576);
  *(_QWORD *)(v12 + 1576) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setCameraBlurAmount:useShade:duration:completion:", 0, 0, 0.0, 0.5);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v14 = *(void **)(a1 + 32);
  v15 = *(void **)(*(_QWORD *)(a1 + 40) + 1128);
  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_121;
  v29[3] = &unk_1EA29A770;
  v30 = v14;
  objc_msgSend(v15, "setState:completion:", 3, v29);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v18 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v19 = *(void **)(v17 + 1120);
  v20 = *(unsigned int *)(v17 + 1228);
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_122;
  v27[3] = &unk_1EA29A770;
  v28 = v18;
  objc_msgSend(v19, "triggerSoundHapticForEnrollmentState:completion:", v20, v27);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v21 = *(NSObject **)(a1 + 32);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_123;
  v24[3] = &unk_1EA29A908;
  v22 = *(id *)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 40);
  v25 = v22;
  v26 = v23;
  dispatch_group_notify(v21, MEMORY[0x1E0C80D38], v24);

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_121(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_122(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_123(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEar Done", v4, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "startTutorialResumeEnrollTimer");
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_124(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "stopTutorialResumeEnrollTimer");
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RIGHT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "setHidden:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1152), "stopPlayerRightEar");
  objc_msgSend(*(id *)(a1 + 40), "startCaptureViewTimer");
  objc_msgSend(*(id *)(a1 + 40), "hideContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setHidden:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1402) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1403) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1418) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1419) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1434) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1435) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1520) = 0xC059000000000000;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1432) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1433) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1417) = 10;
  objc_msgSend(*(id *)(a1 + 40), "startOcclusionWarnCoolDownTimer");
  objc_msgSend(*(id *)(a1 + 40), "startEarDistanceWarnCoolDownTimer");
  objc_msgSend(*(id *)(a1 + 40), "startEnrollGuidanceTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1272), "initFrameRateDetection");
  objc_msgSend(*(id *)(a1 + 40), "resumeEnrollment");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_127;
  block[3] = &unk_1EA29A770;
  v7 = *(id *)(a1 + 48);
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_127(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureHoldPhone Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_128(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RIGHT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1168));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1168), "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1160), "setAlpha:", 1.0);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1128);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_129;
  v16[3] = &unk_1EA29A9F0;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v5, "setState:completion:", 5, v16);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v7 + 1120);
  v10 = *(unsigned int *)(v7 + 1228);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_130;
  v14[3] = &unk_1EA29A770;
  v15 = v8;
  objc_msgSend(v9, "triggerSoundHapticForEnrollmentState:completion:", v10, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v11 = *(NSObject **)(a1 + 32);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_131;
  v12[3] = &unk_1EA29A770;
  v13 = *(id *)(a1 + 48);
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(&v18);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_129(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "showEarPillsDots");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_130(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_131(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureRotateHead Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_132(uint64_t a1)
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "hideEarDistanceWarningContinueButton");
  objc_msgSend(*(id *)(a1 + 40), "hideOcclusionContinueButton");
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RIGHT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RIGHT_EAR_CAPTURED"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  objc_msgSend(*(id *)(a1 + 40), "stopCaptureViewTimer");
  objc_msgSend(*(id *)(a1 + 40), "stopEnrollGuidanceTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1168), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "showContinueButton");
  objc_msgSend(*(id *)(a1 + 40), "forceBlur");
  objc_msgSend(*(id *)(a1 + 40), "hideEarPillsDots");
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v11 = *(void **)(*(_QWORD *)(a1 + 40) + 1128);
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_135;
  v22[3] = &unk_1EA29A9F0;
  objc_copyWeak(&v24, (id *)(a1 + 56));
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v11, "setState:completion:", 6, v22);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v14 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v13 + 1120);
  v16 = *(unsigned int *)(v13 + 1228);
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_136;
  v20[3] = &unk_1EA29A770;
  v21 = v14;
  objc_msgSend(v15, "triggerSoundHapticForEnrollmentState:completion:", v16, v20);
  objc_msgSend(*(id *)(a1 + 40), "pauseEnrollment");
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1344) = 3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v17 = *(NSObject **)(a1 + 32);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_137;
  v18[3] = &unk_1EA29A770;
  v19 = *(id *)(a1 + 48);
  dispatch_group_notify(v17, MEMORY[0x1E0C80D38], v18);

  objc_destroyWeak(&v24);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_135(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[141], "pillContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_136(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_137(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> RightEarCaptureCompleted Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_138(uint64_t a1)
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
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LEFT_EAR"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LEFT_EAR_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("START_LEFT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1152), "startPlayerLeftEar");
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v11 = *(void **)(a1 + 32);
  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 1128);
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_145;
  v21[3] = &unk_1EA29A770;
  v22 = v11;
  objc_msgSend(v12, "setState:completion:", 3, v21);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "pillContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "cancelBlur");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "resetPillsAnimated:", 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1335) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1360) = 2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v15 = *(NSObject **)(a1 + 32);
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_146;
  block[3] = &unk_1EA29A908;
  v16 = *(id *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 40);
  v19 = v16;
  v20 = v17;
  dispatch_group_notify(v15, MEMORY[0x1E0C80D38], block);

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_145(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_146(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEar Done", v4, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "startTutorialResumeEnrollTimer");
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_147(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LEFT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "setHidden:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1152), "stopPlayerLeftEar");
  objc_msgSend(*(id *)(a1 + 40), "stopTutorialResumeEnrollTimer");
  objc_msgSend(*(id *)(a1 + 40), "startCaptureViewTimer");
  objc_msgSend(*(id *)(a1 + 40), "hideContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setPauseBlur:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "pillContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1402) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1418) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1419) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1403) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1432) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1433) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1434) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1435) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1512) = 0xC059000000000000;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1417) = 10;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1552) = 0x3FE0000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1560) = 0xC059000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1568) = 0xC059000000000000;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 1576);
  *(_QWORD *)(v6 + 1576) = 0;

  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(double *)(v8 + 1552);
  *(float *)&v9 = v9;
  objc_msgSend(*(id *)(v8 + 1120), "setEnrollGuidancePitch:", v9);
  objc_msgSend(*(id *)(a1 + 40), "startOcclusionWarnCoolDownTimer");
  objc_msgSend(*(id *)(a1 + 40), "startEarDistanceWarnCoolDownTimer");
  objc_msgSend(*(id *)(a1 + 40), "startEnrollGuidanceTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1272), "initFrameRateDetection");
  objc_msgSend(*(id *)(a1 + 40), "resumeEnrollment");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v10 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_150;
  block[3] = &unk_1EA29A770;
  v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_150(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureHoldPhone Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_151(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LEFT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "pillContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 1128);
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_152;
  v17[3] = &unk_1EA29A9F0;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  v18 = *(id *)(a1 + 32);
  objc_msgSend(v6, "setState:completion:", 5, v17);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1168), "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1356) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1355) = 0;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v8 + 1120);
  v11 = *(unsigned int *)(v8 + 1228);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_153;
  v15[3] = &unk_1EA29A770;
  v16 = v9;
  objc_msgSend(v10, "triggerSoundHapticForEnrollmentState:completion:", v11, v15);
  objc_msgSend(*(id *)(a1 + 40), "resumeEnrollment");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v12 = *(NSObject **)(a1 + 32);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_154;
  v13[3] = &unk_1EA29A770;
  v14 = *(id *)(a1 + 48);
  dispatch_group_notify(v12, MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v19);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_152(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "showEarPillsDots");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_153(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_154(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureRotateHead Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_155(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1168), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "hideEarDistanceWarningContinueButton");
  objc_msgSend(*(id *)(a1 + 40), "hideOcclusionContinueButton");
  objc_msgSend(*(id *)(a1 + 40), "stopEnrollGuidanceTimer");
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LEFT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LEFT_EAR_CAPTURED"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  objc_msgSend(*(id *)(a1 + 40), "stopCaptureViewTimer");
  objc_msgSend(*(id *)(a1 + 40), "startPostProcessTimer");
  objc_msgSend(*(id *)(a1 + 40), "hideEarPillsDots");
  objc_msgSend(*(id *)(a1 + 40), "forceBlur");
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1360) = 3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1128);
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_158;
  v19[3] = &unk_1EA29A9F0;
  objc_copyWeak(&v21, (id *)(a1 + 56));
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v8, "setState:completion:", 6, v19);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v11 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(v10 + 1120);
  v13 = *(unsigned int *)(v10 + 1228);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_159;
  v17[3] = &unk_1EA29A770;
  v18 = v11;
  objc_msgSend(v12, "triggerSoundHapticForEnrollmentState:completion:", v13, v17);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v14 = *(NSObject **)(a1 + 32);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_160;
  v15[3] = &unk_1EA29A770;
  v16 = *(id *)(a1 + 48);
  dispatch_group_notify(v14, MEMORY[0x1E0C80D38], v15);

  objc_destroyWeak(&v21);
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_158(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[141], "pillContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_159(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_160(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Move to Step -> LeftEarCaptureCompleted Done", v3, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_163(uint64_t a1)
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
  _BYTE *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "stopTimers");
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_COMPLETE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  v11 = *(_BYTE **)(a1 + 32);
  if (v11[1209])
  {
    objc_msgSend(v11, "stopPostProcessSpinner");
    v11 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v11, "stopPostProcessTimer");
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v12 = *(void **)(a1 + 40);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 1128);
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_170;
  v24[3] = &unk_1EA29A770;
  v25 = v12;
  objc_msgSend(v13, "setState:completion:", 10, v24);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(a1 + 40);
  v17 = *(void **)(v15 + 1120);
  v18 = *(unsigned int *)(v15 + 1228);
  v19 = v14;
  v20 = 3221225472;
  v21 = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_171;
  v22 = &unk_1EA29A770;
  v23 = v16;
  objc_msgSend(v17, "triggerSoundHapticForEnrollmentState:completion:", v18, &v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setAlpha:", 0.0, v19, v20, v21, v22);
  objc_msgSend(*(id *)(a1 + 32), "stopEnrollment");
  objc_msgSend(*(id *)(a1 + 32), "showContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_continueButtonTapped, 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_cancelSpatialAudioProfile, 64);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1296) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_170(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_171(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_4_172(uint64_t a1)
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

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_175(uint64_t a1)
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

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COULDNT_SCAN_EAR"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("COULDNT_SCAN_EAR_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  objc_msgSend(*(id *)(a1 + 40), "showContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel_continueButtonTapped, 64);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SCAN_AGAIN"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel_cancelSpatialAudioProfile, 64);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_182(uint64_t a1)
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

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_183(uint64_t a1)
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

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HAIR_COVERING_EAR"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("HAIR_COVERING_EAR_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  objc_msgSend(*(id *)(a1 + 40), "showContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel_continueButtonTapped, 64);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SCAN_AGAIN"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel_cancelSpatialAudioProfile, 64);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_188(uint64_t a1)
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

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_189(uint64_t a1)
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
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("GENERAL_FAILURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GENERAL_FAILURE_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 1024);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v10, 0);

  v11 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v11 + 1280))
  {
    objc_msgSend((id)v11, "cleanUpSpinner");
    v11 = *(_QWORD *)(a1 + 40);
  }
  if (*(_BYTE *)(v11 + 1209))
  {
    objc_msgSend((id)v11, "stopPostProcessSpinner");
    v11 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend((id)v11, "stopPostProcessTimer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "stopEnrollment");
  objc_msgSend(*(id *)(a1 + 40), "showContinueButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel_continueButtonTapped, 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel_cancelSpatialAudioProfile, 64);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v12 = *(void **)(a1 + 32);
  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 1120);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_194;
  v14[3] = &unk_1EA29A770;
  v15 = v12;
  objc_msgSend(v13, "triggerSoundHapticForEnrollmentState:completion:", 19, v14);

}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_2_194(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __52__HPSSpatialProfileEnrollmentController_moveToStep___block_invoke_3_195(uint64_t a1)
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
  int v6;
  HPSSpatialProfileEnrollmentController *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentStep = self->_currentStep;
    sessionState = self->_sessionState;
    v11[0] = 67109376;
    v11[1] = currentStep;
    v12 = 1024;
    v13 = sessionState;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: ContinueButton Tapped Current Step %d, Currente Session %d ", (uint8_t *)v11, 0xEu);
  }

  if (!self->_currentStep)
  {
    if (-[HPSSpatialProfileEnrollmentController checkAndShowInEarPopup](self, "checkAndShowInEarPopup"))
      return;
    if ((-[BluetoothManager available](self->_btManager, "available") & 1) == 0)
    {
      sharedBluetoothSettingsLogComponent();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Spatial Profile: btManager is not available", (uint8_t *)v11, 2u);
      }

      if (!self->_welcomeSpinnerOn)
      {
        sharedBluetoothSettingsLogComponent();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "Spatial Profile: btManager is not available starting welcome spinner", (uint8_t *)v11, 2u);
        }

        -[HPSSpatialProfileEnrollmentController startWelcomeSpinner](self, "startWelcomeSpinner");
      }
    }
  }
  if (self->_enrollmentReady)
  {
    v6 = self->_currentStep;
    if (v6 > 13)
      return;
    if (self->_sessionState == 3)
    {
      if (v6 == 12)
        return;
      v7 = self;
      v8 = 12;
    }
    else
    {
      v8 = (v6 + 1);
      v7 = self;
    }
    -[HPSSpatialProfileEnrollmentController moveToStep:](v7, "moveToStep:", v8);
  }
  else if (!self->_welcomeSpinnerOn)
  {
    -[HPSSpatialProfileEnrollmentController startWelcomeSpinner](self, "startWelcomeSpinner");
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
  -[HPSSpatialProfileEnrollmentController cancelSpatialAudioProfile](self, "cancelSpatialAudioProfile");
}

- (void)stopTimers
{
  -[HPSSpatialProfileEnrollmentController stopFaceInFrameHandlerTimer](self, "stopFaceInFrameHandlerTimer");
  -[HPSSpatialProfileEnrollmentController stopOcclusionWarnCoolDownTimer](self, "stopOcclusionWarnCoolDownTimer");
  -[HPSSpatialProfileEnrollmentController stopEarDistanceWarnCoolDownTimer](self, "stopEarDistanceWarnCoolDownTimer");
  -[HPSSpatialProfileEnrollmentController stopEnrollGuidanceTimer](self, "stopEnrollGuidanceTimer");
  -[HPSSpatialProfileEnrollmentController stopCaptureViewTimer](self, "stopCaptureViewTimer");
  -[HPSSpatialProfileEnrollmentController stopPostProcessTimer](self, "stopPostProcessTimer");
  -[HPSSpatialProfileEnrollmentController stopEarEnrollmentNudgeTimer](self, "stopEarEnrollmentNudgeTimer");
}

- (void)cancelSpatialAudioProfile
{
  NSObject *v3;
  NSObject *v4;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  double leftLastReceivedYaw;
  double rightLastReceivedYaw;
  void *v11;
  NSObject *v12;
  int v13;
  CGFloat v14;
  __int16 v15;
  CGFloat v16;
  __int16 v17;
  CGFloat v18;
  __int16 v19;
  CGFloat v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Cancel Spatial Audio Profile", (uint8_t *)&v13, 2u);
  }

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    x = self->_currentEarBB.origin.x;
    y = self->_currentEarBB.origin.y;
    width = self->_currentEarBB.size.width;
    height = self->_currentEarBB.size.height;
    leftLastReceivedYaw = self->_leftLastReceivedYaw;
    rightLastReceivedYaw = self->_rightLastReceivedYaw;
    v13 = 134219264;
    v14 = x;
    v15 = 2048;
    v16 = y;
    v17 = 2048;
    v18 = width;
    v19 = 2048;
    v20 = height;
    v21 = 2048;
    v22 = leftLastReceivedYaw;
    v23 = 2048;
    v24 = rightLastReceivedYaw;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: _currentEarBB.origin.x %f , _currentEarBB.origin.y %f , _currentEarBB.size.width %f , _currentEarBB.size.height %f Left Ear Last Yaw %f Right Ear Last Yaw %f", (uint8_t *)&v13, 0x3Eu);
  }

  if (self->_enrollmentStarted)
    -[HPSSpatialProfileEnrollmentController stopEnrollment](self, "stopEnrollment");
  -[HPSSpatialProfileEnrollmentController stopTimers](self, "stopTimers");
  -[HPSSpatialProfileSoundHapticManager stop](self->_soundHapticManager, "stop");
  -[HPSSpatialProfileEnrollmentController resetVolume](self, "resetVolume");
  -[HPSSpatialProfileEarTutorialView stopPlayers](self->_earTutorialView, "stopPlayers");
  -[HPSSpatialProfileEnrollmentController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_198);
  if (self->_enrollmentCompleted)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("HPSSpatialAudioProfileUpdated"), 0);

  }
  if (self->dismissalHandler)
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Executing : Dismiss handler", (uint8_t *)&v13, 2u);
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
  block[2] = __68__HPSSpatialProfileEnrollmentController_bluetoothDidBecomeAvailable__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __68__HPSSpatialProfileEnrollmentController_bluetoothDidBecomeAvailable__block_invoke(uint64_t result)
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
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 1208))
  {
    v1 = result;
    sharedBluetoothSettingsLogComponent();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = *(unsigned __int8 *)(v3 + 1294);
      v5 = objc_msgSend(*(id *)(v3 + 1392), "available");
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

uint64_t __56__HPSSpatialProfileEnrollmentController_retrieveProfile__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveToStep:", 19);
}

void __56__HPSSpatialProfileEnrollmentController_retrieveProfile__block_invoke_204(_QWORD *a1, void *a2)
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

  objc_msgSend(*(id *)(a1[4] + 1264), "appendData:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[5] + 8) + 40));
}

uint64_t __56__HPSSpatialProfileEnrollmentController_retrieveProfile__block_invoke_206(uint64_t a1)
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
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "length");
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Retrieved Profile Size: %lu", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "moveToStep:", 15);
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
    v9[2] = __52__HPSSpatialProfileEnrollmentController_syncProfile__block_invoke;
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

void __52__HPSSpatialProfileEnrollmentController_syncProfile__block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(*(id *)(a1 + 32), "moveToStep:", 16);
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

    -[HPSSpatialProfileEnrollmentController stopTutorialResumeEnrollTimer](self, "stopTutorialResumeEnrollTimer");
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

- (void)tutorialResumeEnrollTimerDidFire
{
  NSObject *v3;
  int currentStep;
  NSObject *v6;
  int v7;
  _BOOL4 enrollmentPaused;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Tutorial automatic Delay Transition Timer did Fire", (uint8_t *)v9, 2u);
  }

  currentStep = self->_currentStep;
  if (currentStep == 9 || currentStep == 5)
  {
    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_currentStep;
      enrollmentPaused = self->_enrollmentPaused;
      v9[0] = 67109376;
      v9[1] = v7;
      v10 = 1024;
      v11 = enrollmentPaused;
      _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Starting enrollment while in Ear tutorial %d Enrollment Status %d", (uint8_t *)v9, 0xEu);
    }

    if (self->_enrollmentPaused)
      -[HPSSpatialProfileEnrollmentController resumeEnrollment](self, "resumeEnrollment");
  }
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

    -[HPSSpatialProfileEnrollmentController stopCaptureViewTimer](self, "stopCaptureViewTimer");
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
  v12[2] = __64__HPSSpatialProfileEnrollmentController_captureViewTimerDidFire__block_invoke;
  v12[3] = &unk_1EA29A880;
  v12[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  -[HPSSpatialProfileEnrollmentController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __64__HPSSpatialProfileEnrollmentController_captureViewTimerDidFire__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelSpatialAudioProfile");
}

- (BOOL)isEarOccluded
{
  unsigned int currentStep;
  BOOL v3;
  int v4;
  BOOL v5;

  currentStep = self->_currentStep;
  v3 = currentStep > 0xB;
  v4 = (1 << currentStep) & 0xCC0;
  v5 = v3 || v4 == 0;
  return !v5 && !self->_supressEarOcclusionWarning && self->_isEarOccluded;
}

- (BOOL)isPresentingWrongEar
{
  int leftEarStatus;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  int v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int rightEarStatus;
  BOOL v15;
  _BOOL4 supressEarEnrollWarning;
  int v17;
  int leftEarCaptureCount;
  int v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_supressEarEnrollWarning)
  {
    leftEarStatus = self->_leftEarStatus;
    v5 = leftEarStatus < 1 || leftEarStatus == 3;
    if (v5 || self->_currentTrackingEar != 2)
    {
      rightEarStatus = self->_rightEarStatus;
      v15 = rightEarStatus < 1 || rightEarStatus == 3;
      if (v15 || self->_currentTrackingEar != 1)
        return 0;
      sharedBluetoothSettingsLogComponent();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        supressEarEnrollWarning = self->_supressEarEnrollWarning;
        v17 = self->_rightEarStatus;
        leftEarCaptureCount = self->_leftEarCaptureCount;
        v19 = 67109632;
        v20 = supressEarEnrollWarning;
        v21 = 1024;
        v22 = v17;
        v23 = 1024;
        v24 = leftEarCaptureCount;
        v11 = "Spatial Profile: Detectin left ear during right enrollment Timeout: %d Right ear status %d Threshold %d";
        v12 = v6;
        v13 = 20;
        goto LABEL_18;
      }
    }
    else
    {
      sharedBluetoothSettingsLogComponent();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->_supressEarEnrollWarning;
        v8 = self->_rightEarStatus;
        v9 = self->_leftEarStatus;
        v10 = self->_leftEarCaptureCount;
        v19 = 67109888;
        v20 = v7;
        v21 = 1024;
        v22 = v8;
        v23 = 1024;
        v24 = v9;
        v25 = 1024;
        v26 = v10;
        v11 = "Spatial Profile: Detecting right ear during left enrollment Timeout: %d Right ear status %d Left ear statu"
              "s %d Threshold %d";
        v12 = v6;
        v13 = 26;
LABEL_18:
        _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, v13);
      }
    }

    return 1;
  }
  return 0;
}

- (void)alertEarEnrollWarning
{
  NSObject *v3;
  double currentYaw;
  double candidateYaw;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *stepSerialQueue;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentYaw = self->_currentYaw;
    candidateYaw = self->_candidateYaw;
    *(_DWORD *)buf = 134218240;
    v24 = currentYaw;
    v25 = 2048;
    v26 = candidateYaw;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Error Message *** Enrolling Left ear while right ear enroll is still pending Current yaw %f Candidate Yaw %f ", buf, 0x16u);
  }

  -[HPSSpatialProfileEnrollmentController pauseEnrollment](self, "pauseEnrollment");
  -[HPSSpatialProfileEnrollmentController forceBlur](self, "forceBlur");
  -[CEKSubjectIndicatorView setHidden:](self->_earBoundingBoxView, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_WRONG_EAR_LEFT_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_WRONG_EAR_LEFT_TEXT"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_currentTrackingEar == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_WRONG_EAR_RIGHT_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_WRONG_EAR_RIGHT_TEXT"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
    v9 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL_ENROLLMENT_ALERT_PROMPT_BUTTON"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke;
  v22[3] = &unk_1EA29A880;
  v22[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v19);

  -[HPSSpatialProfileEnrollmentController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  stepSerialQueue = self->_stepSerialQueue;
  v21[0] = v18;
  v21[1] = 3221225472;
  v21[2] = __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_3;
  v21[3] = &unk_1EA29A770;
  v21[4] = self;
  dispatch_async(stepSerialQueue, v21);

}

void __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "startEarEnrollWarningTimer");
  objc_msgSend(*(id *)(a1 + 32), "cancelBlur");
  objc_msgSend(*(id *)(a1 + 32), "resumeEnrollment");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_2;
  block[3] = &unk_1EA29A770;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "playProgressPlayer:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1228));
}

void __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  NSObject *v6;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1120);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_4;
  v5[3] = &unk_1EA29A770;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "triggerSoundHapticForEnrollmentState:completion:", 19, v5);

}

void __62__HPSSpatialProfileEnrollmentController_alertEarEnrollWarning__block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
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
  uint64_t v22;
  int v24;
  int v25;
  uint8_t v26;
  _BYTE v27[15];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[BluetoothManager connectedDevices](self->_btManager, "connectedDevices");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
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
              v24 = 3;
              v25 = 3;
              -[NSObject classicDevice](v8, "classicDevice");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "inEarStatusPrimary:secondary:", &v25, &v24);

              if (!v25 || !v24)
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
                  {
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
                      v33 = v19;
                      _os_log_impl(&dword_1DB30C000, v17, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Device %@, bud in ear", buf, 0xCu);

                    }
                    objc_msgSend((id)MGGetStringAnswer(), "uppercaseString");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_"), "stringByAppendingFormat:", CFSTR("%@_%@"), v20, v14);
                    v11 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v13 == 8215)
                    {
                      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_23"), &stru_1EA29D890, CFSTR("DeviceConfig-B453"));
                      v22 = objc_claimAutoreleasedReturnValue();

                      v11 = (void *)v22;
                    }

                    goto LABEL_32;
                  }
                }
                else
                {

                }
                if (v13 == 8210)
                  v14 = CFSTR("ACCESSORY_MODEL_NAME_18");
                else
                  v14 = CFSTR("ACCESSORY_MODEL_NAME_15");
                goto LABEL_27;
              }
            }
          }
          else
          {
            sharedBluetoothSettingsLogComponent();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              -[HPSSpatialProfileSingeStepEnrollmentController getBudsInEarString].cold.1(&v26, v27, v9);
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_32:

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

  if ((self->_currentStep & 0xFFFFFFFE) == 2)
  {
    if (self->_faceBoundingBoxStatus == 1 && !self->_faceCaptured)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__HPSSpatialProfileEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke;
      block[3] = &unk_1EA29A770;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v5 = (void *)MEMORY[0x1E0C99E88];
      v6 = 1.0;
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __73__HPSSpatialProfileEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke_2;
      v9[3] = &unk_1EA29A770;
      v9[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v9);
      v5 = (void *)MEMORY[0x1E0C99E88];
      v6 = 3.0;
    }
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_triggerFaceInFrameHandlerTimeout, 0, 0, v6);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    faceInFrameHandlerTimer = self->_faceInFrameHandlerTimer;
    self->_faceInFrameHandlerTimer = v7;

  }
  else
  {
    -[HPSSpatialProfileEnrollmentController stopFaceInFrameHandlerTimer](self, "stopFaceInFrameHandlerTimer");
  }
}

void __73__HPSSpatialProfileEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke(uint64_t a1)
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

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACE_TOO_CLOSE_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
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

void __73__HPSSpatialProfileEnrollmentController_triggerFaceInFrameHandlerTimeout__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FRONT_VIEW_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FRONT_VIEW_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailText:", v6);

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

    -[HPSSpatialProfileEnrollmentController stopFaceInFrameHandlerTimer](self, "stopFaceInFrameHandlerTimer");
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

- (void)startOcclusionWarnCoolDownTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HPSSpatialProfileEnrollmentController_startOcclusionWarnCoolDownTimer__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __72__HPSSpatialProfileEnrollmentController_startOcclusionWarnCoolDownTimer__block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 1408))
  {
    objc_msgSend((id)v3, "stopOcclusionWarnCoolDownTimer");
    v3 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v3 + 1416) = 1;
  LOBYTE(a2) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1417);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", (double)*(unint64_t *)&a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1408);
  *(_QWORD *)(v5 + 1408) = v4;

  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1417);
    v11[0] = 67109120;
    v11[1] = v8;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Start Occlusion timer for %dSec", (uint8_t *)v11, 8u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(unsigned __int8 *)(v9 + 1417);
  if (v10 <= 0x1E)
    *(_BYTE *)(v9 + 1417) = v10 + 5;
}

- (void)restartOcclusionWarnCoolDownTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HPSSpatialProfileEnrollmentController_restartOcclusionWarnCoolDownTimer__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __74__HPSSpatialProfileEnrollmentController_restartOcclusionWarnCoolDownTimer__block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 1408))
  {
    objc_msgSend((id)v3, "stopOcclusionWarnCoolDownTimer");
    v3 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v3 + 1416) = 1;
  LOBYTE(a2) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1417);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", (double)*(unint64_t *)&a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1408);
  *(_QWORD *)(v5 + 1408) = v4;

  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1417);
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Restart Occlusion warning timer to  %dSec", (uint8_t *)v9, 8u);
  }

}

- (void)triggerOcclusionWarnCoolDownTimer
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  self->_supressEarOcclusionWarning = 0;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isLookingAtPhone)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Ready to show occlusion error %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)stopOcclusionWarnCoolDownTimer
{
  NSObject *v3;
  const __CFString *v4;
  NSTimer *occlusionWarnCoolDownTimer;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isLookingAtPhone)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping Occlusion Timer Attention %@", (uint8_t *)&v6, 0xCu);
  }

  -[NSTimer invalidate](self->_occlusionWarnCoolDownTimer, "invalidate");
  occlusionWarnCoolDownTimer = self->_occlusionWarnCoolDownTimer;
  self->_occlusionWarnCoolDownTimer = 0;

}

- (void)alertOcclusionWarning
{
  int currentStep;
  _QWORD block[5];

  -[HPSSpatialProfileEnrollmentController updateBoundingBoxHiddenStatus](self, "updateBoundingBoxHiddenStatus");
  currentStep = self->_currentStep;
  if ((currentStep & 0xFFFFFFFE) == 6)
  {
    -[HPSSpatialProfileAnalytics incrementRightEarOcclusionCount](self->_enrollmentAnalytics, "incrementRightEarOcclusionCount");
    currentStep = self->_currentStep;
  }
  if ((currentStep & 0xFFFFFFFE) == 0xA)
    -[HPSSpatialProfileAnalytics incrementLeftEarOcclusionCount](self->_enrollmentAnalytics, "incrementLeftEarOcclusionCount");
  -[HPSSpatialProfileEnrollmentController pauseEnrollment](self, "pauseEnrollment");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HPSSpatialProfileEnrollmentController_alertOcclusionWarning__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__HPSSpatialProfileEnrollmentController_alertOcclusionWarning__block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  unsigned int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "getBudsInEarString");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clearBoundingBox");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "pauseProgressPlayer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "pauseEnrollGuidancePlayer");
  objc_msgSend(*(id *)(a1 + 32), "forceBlur");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OCCLUSION_EAR"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Buds In ear");
    if (!v2)
      v7 = CFSTR("General");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 1560);
    v10 = *(_QWORD *)(v8 + 1568);
    *(_DWORD *)buf = 138412802;
    v24 = v7;
    v25 = 2048;
    v26 = v9;
    v27 = 2048;
    v28 = v10;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Error Message *** Occlusion detection warning shown to user : %@ Current Yaw %f Candidate Yaw %f", buf, 0x20u);
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v12 = *(void **)(v11 + 1008);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v2;
LABEL_11:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDetailText:", v17);

    goto LABEL_12;
  }
  v16 = *(_DWORD *)(v11 + 1228) & 0xFFFFFFFE;
  if (v16 == 6)
  {
    v12 = *(void **)(v11 + 1008);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("OCCLUSION_EAR_DETAIL_RIGHT");
    goto LABEL_11;
  }
  if (v16 == 10)
  {
    v12 = *(void **)(v11 + 1008);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("OCCLUSION_EAR_DETAIL_LEFT");
    goto LABEL_11;
  }
LABEL_12:
  v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  v19 = *(void **)(*(_QWORD *)(a1 + 32) + 1120);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__HPSSpatialProfileEnrollmentController_alertOcclusionWarning__block_invoke_278;
  v21[3] = &unk_1EA29A770;
  v22 = v18;
  v20 = v18;
  objc_msgSend(v19, "triggerSoundHapticForEnrollmentState:completion:", 19, v21);
  objc_msgSend(*(id *)(a1 + 32), "showOcclusionContinueButton");

}

void __62__HPSSpatialProfileEnrollmentController_alertOcclusionWarning__block_invoke_278(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)continueOcclusionWarning
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Occlusion Continue Button Tapped", buf, 2u);
  }

  -[HPSSpatialProfileEnrollmentController resumeEnrollment](self, "resumeEnrollment");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HPSSpatialProfileEnrollmentController_continueOcclusionWarning__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  self->_isEarOccluded = 0;
  self->_earOcclusionDetectTracker = 0;
  -[HPSSpatialProfileSoundHapticManager playProgressPlayer:](self->_soundHapticManager, "playProgressPlayer:", self->_currentStep);
  -[HPSSpatialProfileEnrollmentController startOcclusionWarnCoolDownTimer](self, "startOcclusionWarnCoolDownTimer");
}

uint64_t __65__HPSSpatialProfileEnrollmentController_continueOcclusionWarning__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancelBlur");
  objc_msgSend(*(id *)(a1 + 32), "hideOcclusionContinueButton");
  return objc_msgSend(*(id *)(a1 + 32), "updateEarEnrollText");
}

- (void)updateEarEnrollText
{
  OBHeaderView *infoView;
  void *v4;
  void *v5;
  OBHeaderView *v6;
  void *v7;
  const __CFString *v8;
  OBHeaderView *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  switch(self->_currentStep)
  {
    case 6:
    case 7:
      infoView = self->_infoView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RIGHT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView setTitle:](infoView, "setTitle:", v5);

      v6 = self->_infoView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("RIGHT_EAR_DETAIL");
      goto LABEL_4;
    case 0xA:
    case 0xB:
      v9 = self->_infoView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LEFT_EAR_CAPTURE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView setTitle:](v9, "setTitle:", v11);

      v6 = self->_infoView;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("LEFT_EAR_DETAIL");
LABEL_4:
      v13 = v7;
      objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBHeaderView setDetailText:](v6, "setDetailText:", v12);

      break;
    default:
      return;
  }
}

- (void)startEarEnrollWarningTimer
{
  NSObject *v3;
  NSTimer *startEarEnrollWarningCoolDownTimer;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (self->_startEarEnrollWarningCoolDownTimer)
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Wrong ear check", buf, 2u);
    }

    -[NSTimer invalidate](self->_startEarEnrollWarningCoolDownTimer, "invalidate");
    startEarEnrollWarningCoolDownTimer = self->_startEarEnrollWarningCoolDownTimer;
    self->_startEarEnrollWarningCoolDownTimer = 0;

  }
  self->_supressEarEnrollWarning = 1;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Wrong ear check shown, wait some time before showing again", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_triggerstartEarEnrollWarningTimer, 0, 0, 3.0);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v7 = self->_startEarEnrollWarningCoolDownTimer;
  self->_startEarEnrollWarningCoolDownTimer = v6;

}

- (void)triggerstartEarEnrollWarningTimer
{
  NSObject *v2;
  uint8_t v3[16];

  self->_supressEarEnrollWarning = 0;
  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Wrong Ear warning Process Timeout", v3, 2u);
  }

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

    -[HPSSpatialProfileEnrollmentController stopPostProcessTimer](self, "stopPostProcessTimer");
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

  -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 19);
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
  double v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  int *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  double v37;
  NSObject *v38;
  double v39;
  double v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  int currentStep;
  void *v56;
  NSObject *v57;
  const char *v58;
  int v59;
  NSObject *v60;
  int v61;
  NSObject *v62;
  int v63;
  NSObject *v64;
  int v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  NSObject *v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  double v85;
  double v86;
  NSObject *v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  double v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  double v99;
  double v100;
  NSObject *v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  double v106;
  NSObject *v107;
  double v108;
  NSObject *v109;
  void *v110;
  NSObject *v111;
  char v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t k;
  void *v119;
  double v120;
  double v121;
  NSObject *v122;
  const __CFString *v123;
  double v124;
  double v125;
  int v126;
  NSObject *v127;
  const __CFString *v128;
  double v129;
  NSObject *v130;
  const __CFString *v131;
  double v132;
  void *v133;
  _BOOL4 rightEarCaptured;
  const __CFString *v135;
  const __CFString *v136;
  unint64_t v137;
  unint64_t v138;
  NSObject *v139;
  void *v140;
  NSObject *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t m;
  void *v147;
  double v148;
  double v149;
  NSObject *v150;
  const __CFString *v151;
  double v152;
  double v153;
  int v154;
  NSObject *v155;
  const __CFString *v156;
  double v157;
  NSObject *v158;
  const __CFString *v159;
  double v160;
  void *v161;
  _BOOL4 leftEarCaptured;
  uint64_t v163;
  NSObject *v164;
  unint64_t v165;
  unint64_t v166;
  unint64_t v167;
  unint64_t v168;
  unint64_t v169;
  const __CFString *v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  void *v180;
  void *v181;
  _QWORD block[5];
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _QWORD v187[5];
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _QWORD v192[5];
  _QWORD v193[5];
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _BYTE v206[128];
  uint8_t v207[128];
  uint8_t buf[4];
  double v209;
  __int16 v210;
  const __CFString *v211;
  __int16 v212;
  unint64_t v213;
  __int16 v214;
  unint64_t v215;
  __int16 v216;
  unint64_t v217;
  __int16 v218;
  unint64_t v219;
  __int16 v220;
  const __CFString *v221;
  __int16 v222;
  double v223;
  __int16 v224;
  double v225;
  __int16 v226;
  double v227;
  __int16 v228;
  double v229;
  __int16 v230;
  int v231;
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  uint64_t v235;
  CGRect v236;
  CGRect v237;

  v235 = *MEMORY[0x1E0C80C00];
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
    -[HPSSpatialProfileEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.1();
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", *v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v13 = COERCE_DOUBLE(objc_msgSend(v12, "integerValue"));

  v14 = (_QWORD *)MEMORY[0x1E0D28728];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28728]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *v14);
    v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v17 = v16;
    if (v16 != 0.0)
    {
      objc_msgSend(*(id *)&v16, "code");
      sharedBluetoothSettingsLogComponent();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v209 = v17;
        _os_log_impl(&dword_1DB30C000, v18, OS_LOG_TYPE_DEFAULT, "Spatial Profile: didReceiveStateUpdateForSession  ERROR: %@ ", buf, 0xCu);
      }

      if (self->_currentStep != 19)
        -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 19);
      sharedBluetoothSettingsLogComponent();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.4(*(void **)&v17);

    }
  }
  if (self->_sessionState != v13)
  {
    sharedBluetoothSettingsLogComponent();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v209 = *(double *)&v13;
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
      -[HPSSpatialProfileEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.3();

    objc_msgSend(v7, "objectForKeyedSubscript:", *v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

  }
  else
  {
    v26 = 0.0;
  }
  v27 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
  switch(v13)
  {
    case 0uLL:
      sharedBluetoothSettingsLogComponent();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v28, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Idle", buf, 2u);
      }

      goto LABEL_274;
    case 1uLL:
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28730]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (!v29)
        goto LABEL_170;
      objc_msgSend(v29, "faceBoundingBox");
      if (!CGRectEqualToRect(v236, *MEMORY[0x1E0C9D648]) && !self->_faceCaptured)
      {
        objc_msgSend(v30, "faceBoundingBox");
        -[HPSSpatialProfileEnrollmentController updateFaceTrackingStatus:](self, "updateFaceTrackingStatus:");
      }
      v177 = v7;
      v180 = v30;
      v174 = v6;
      if (!self->_faceStraightZeroAngleCaptured)
      {
        v204 = 0u;
        v205 = 0u;
        v202 = 0u;
        v203 = 0u;
        objc_msgSend(v30, "yawAngles");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v202, v234, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v203;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v203 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * i);
              objc_msgSend(v36, "angle");
              if (v37 == 0.0 && objc_msgSend(v36, "captured"))
              {
                self->_faceStraightZeroAngleCaptured = 1;
                sharedBluetoothSettingsLogComponent();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v36, "angle");
                  v40 = v39;
                  v41 = objc_msgSend(v36, "captured");
                  *(_DWORD *)buf = 134218240;
                  v209 = v40;
                  v210 = 1024;
                  LODWORD(v211) = v41;
                  _os_log_impl(&dword_1DB30C000, v38, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Captured straight face angle %f ->  %d", buf, 0x12u);
                }

              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v202, v234, 16);
          }
          while (v33);
        }

        v30 = v180;
      }
      if (objc_msgSend(v30, "hasYawAngle") && objc_msgSend(v30, "hasPitchAngle"))
      {
        if (self->_faceDetected || !self->_faceStraightZeroAngleCaptured || self->_currentStep != 2)
          goto LABEL_111;
        sharedBluetoothSettingsLogComponent();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB30C000, v42, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Straight angle: Transition to View CaptureMoveHead", buf, 2u);
        }

        self->_faceDetected = 1;
        v43 = 3;
      }
      else
      {
        if (!self->_faceDetected || self->_currentStep != 3)
          goto LABEL_111;
        sharedBluetoothSettingsLogComponent();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB30C000, v68, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Face NOT Detected, Return to previous step", buf, 2u);
        }

        self->_faceDetected = 0;
        v43 = 2;
      }
      -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", v43);
LABEL_111:
      v200 = 0u;
      v201 = 0u;
      v198 = 0u;
      v199 = 0u;
      objc_msgSend(v30, "yawAngles");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v198, v233, 16);
      if (v80)
      {
        v81 = v80;
        v82 = *(_QWORD *)v199;
        do
        {
          for (j = 0; j != v81; ++j)
          {
            if (*(_QWORD *)v199 != v82)
              objc_enumerationMutation(v79);
            if (self->_faceDetected)
            {
              v84 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * j);
              objc_msgSend(v84, "angle");
              if (v85 > 0.0 && objc_msgSend(v84, "captured") && !self->_faceRightFilled)
              {
                sharedBluetoothSettingsLogComponent();
                v91 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v84, "angle");
                  *(_DWORD *)buf = 134217984;
                  v209 = v92;
                  _os_log_impl(&dword_1DB30C000, v91, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Right with Yaw: %f", buf, 0xCu);
                }

                self->_faceRightFilled = 1;
                if (self->_faceUpFilled)
                  -[HPSSpatialProfileEnrollmentController fillFacePillsByDirection:](self, "fillFacePillsByDirection:", 1);
                v89 = 0;
                if (self->_faceDownFilled)
                {
                  v90 = 7;
LABEL_136:
                  -[HPSSpatialProfileEnrollmentController fillFacePillsByDirection:](self, "fillFacePillsByDirection:", v90);
                }
LABEL_137:
                -[HPSSpatialProfileEnrollmentController fillFacePillsByDirection:](self, "fillFacePillsByDirection:", v89);
                continue;
              }
              if (self->_faceDetected)
              {
                objc_msgSend(v84, "angle");
                if (v86 < 0.0 && objc_msgSend(v84, "captured") && !self->_faceLeftFilled)
                {
                  sharedBluetoothSettingsLogComponent();
                  v87 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v84, "angle");
                    *(_DWORD *)buf = 134217984;
                    v209 = v88;
                    _os_log_impl(&dword_1DB30C000, v87, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Left with Yaw: %f", buf, 0xCu);
                  }

                  self->_faceLeftFilled = 1;
                  if (self->_faceUpFilled)
                    -[HPSSpatialProfileEnrollmentController fillFacePillsByDirection:](self, "fillFacePillsByDirection:", 3);
                  v89 = 4;
                  if (self->_faceDownFilled)
                  {
                    v90 = 5;
                    goto LABEL_136;
                  }
                  goto LABEL_137;
                }
              }
            }
          }
          v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v198, v233, 16);
        }
        while (v81);
      }

      v196 = 0u;
      v197 = 0u;
      v194 = 0u;
      v195 = 0u;
      objc_msgSend(v180, "pitchAngles");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v194, v232, 16);
      if (!v94)
      {
LABEL_169:

        v6 = v174;
        v7 = v177;
        v27 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
        v30 = v180;
LABEL_170:
        if (v26 == 1.0 && !self->_faceCaptured)
        {
          sharedBluetoothSettingsLogComponent();
          v107 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            -[BKUIPearlEnrollView percentOfPillsCompleted](self->_enrollView, "percentOfPillsCompleted");
            *(_DWORD *)buf = 134217984;
            v209 = v108;
            _os_log_impl(&dword_1DB30C000, v107, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Face Captured %f", buf, 0xCu);
          }

          self->_faceCaptured = 1;
          *(Class *)((char *)&self->super.super.super.isa + v27[334]) = 0;
          dispatch_get_global_queue(21, 0);
          v109 = objc_claimAutoreleasedReturnValue();
          v193[0] = MEMORY[0x1E0C809B0];
          v193[1] = 3221225472;
          v193[2] = __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke;
          v193[3] = &unk_1EA29A770;
          v193[4] = self;
          dispatch_async(v109, v193);

        }
        goto LABEL_273;
      }
      v95 = v94;
      v96 = *(_QWORD *)v195;
LABEL_142:
      v97 = 0;
      while (1)
      {
        if (*(_QWORD *)v195 != v96)
          objc_enumerationMutation(v93);
        if (!self->_faceDetected)
          goto LABEL_167;
        v98 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * v97);
        objc_msgSend(v98, "angle");
        if (v99 > 0.0 && objc_msgSend(v98, "captured") && !self->_faceUpFilled)
          break;
        if (!self->_faceDetected)
          goto LABEL_167;
        objc_msgSend(v98, "angle");
        if (v100 >= 0.0 || !objc_msgSend(v98, "captured") || self->_faceDownFilled)
          goto LABEL_167;
        sharedBluetoothSettingsLogComponent();
        v101 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v98, "angle");
          *(_DWORD *)buf = 134217984;
          v209 = v102;
          _os_log_impl(&dword_1DB30C000, v101, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Down with Pitch: %f", buf, 0xCu);
        }

        self->_faceDownFilled = 1;
        if (self->_faceLeftFilled)
          -[HPSSpatialProfileEnrollmentController fillFacePillsByDirection:](self, "fillFacePillsByDirection:", 5);
        v103 = 6;
        if (self->_faceRightFilled)
        {
          v104 = 7;
LABEL_165:
          -[HPSSpatialProfileEnrollmentController fillFacePillsByDirection:](self, "fillFacePillsByDirection:", v104);
        }
LABEL_166:
        -[HPSSpatialProfileEnrollmentController fillFacePillsByDirection:](self, "fillFacePillsByDirection:", v103);
LABEL_167:
        if (v95 == ++v97)
        {
          v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v194, v232, 16);
          if (!v95)
            goto LABEL_169;
          goto LABEL_142;
        }
      }
      sharedBluetoothSettingsLogComponent();
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v98, "angle");
        *(_DWORD *)buf = 134217984;
        v209 = v106;
        _os_log_impl(&dword_1DB30C000, v105, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Fill up Up with Pitch: %f", buf, 0xCu);
      }

      self->_faceUpFilled = 1;
      if (self->_faceLeftFilled)
        -[HPSSpatialProfileEnrollmentController fillFacePillsByDirection:](self, "fillFacePillsByDirection:", 3);
      v103 = 2;
      if (!self->_faceRightFilled)
        goto LABEL_166;
      v104 = 1;
      goto LABEL_165;
    case 2uLL:
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28720]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28738]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D28748]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v30, "earCaptureStatus");
      objc_msgSend(v30, "earBoundingBox");
      v48 = v47;
      v50 = v49;
      v52 = v51;
      v54 = v53;
      -[HPSSpatialProfileEnrollmentController updateCurrentTrackingEar:rightEarPoseStatus:earBoundingBox:earStatus:](self, "updateCurrentTrackingEar:rightEarPoseStatus:earBoundingBox:earStatus:", v44, v45, v46);
      currentStep = self->_currentStep;
      if (currentStep == 9)
      {
        if (self->_currentTrackingEar != 1)
          goto LABEL_272;
        v56 = v45;
        sharedBluetoothSettingsLogComponent();
        v57 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          goto LABEL_95;
        *(_WORD *)buf = 0;
        v58 = "Spatial Profile: Deteceted Left Ear when in Tutorial View, Pivot to enrollment ";
        goto LABEL_94;
      }
      if (currentStep == 5)
      {
        if (self->_currentTrackingEar != 2)
          goto LABEL_272;
        v56 = v45;
        sharedBluetoothSettingsLogComponent();
        v57 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          goto LABEL_95;
        *(_WORD *)buf = 0;
        v58 = "Spatial Profile: Deteceted Right Ear when in Tutorial View, Pivot to right ear enrollment ";
LABEL_94:
        _os_log_impl(&dword_1DB30C000, v57, OS_LOG_TYPE_DEFAULT, v58, buf, 2u);
LABEL_95:

        -[HPSSpatialProfileEnrollmentController continueButtonTapped](self, "continueButtonTapped");
        v45 = v56;
        goto LABEL_272;
      }
      v173 = v30;
      sharedBluetoothSettingsLogComponent();
      v69 = objc_claimAutoreleasedReturnValue();
      v181 = v44;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(double *)&v135 = COERCE_DOUBLE(CFSTR("NO"));
        if (v44 && objc_msgSend(v44, "hasYawAngle"))
          *(double *)&v135 = COERCE_DOUBLE(CFSTR("YES"));
        v136 = CFSTR("NO");
        if (v45)
        {
          if (objc_msgSend(v45, "hasYawAngle"))
            v136 = CFSTR("YES");
          else
            v136 = CFSTR("NO");
        }
        if (v44)
        {
          if (objc_msgSend(v44, "hasYawAngle"))
          {
            objc_msgSend(v44, "currentYawAngle");
            v137 = v165;
          }
          else
          {
            v137 = 0xC059000000000000;
          }
          if (objc_msgSend(v44, "hasPitchAngle"))
          {
            objc_msgSend(v44, "currentPitchAngle");
            v138 = v166;
          }
          else
          {
            v138 = 0xC059000000000000;
          }
        }
        else
        {
          v137 = 0xC059000000000000;
          v138 = 0xC059000000000000;
        }
        if (v45)
        {
          if (objc_msgSend(v45, "hasYawAngle"))
          {
            objc_msgSend(v45, "currentYawAngle");
            v167 = v169;
          }
          else
          {
            v167 = 0xC059000000000000;
          }
          if (objc_msgSend(v45, "hasPitchAngle"))
            objc_msgSend(v45, "currentPitchAngle");
          else
            v168 = 0xC059000000000000;
        }
        else
        {
          v167 = 0xC059000000000000;
          v168 = 0xC059000000000000;
        }
        v170 = CFSTR("YES");
        if (!self->_earBoundingBoxDetected)
          v170 = CFSTR("NO");
        *(_DWORD *)buf = 138415106;
        v209 = *(double *)&v135;
        v210 = 2112;
        v211 = v136;
        v212 = 2048;
        v213 = v137;
        v214 = 2048;
        v215 = v138;
        v216 = 2048;
        v217 = v167;
        v218 = 2048;
        v219 = v168;
        v220 = 2112;
        v221 = v170;
        v222 = 2048;
        v223 = v48;
        v224 = 2048;
        v225 = v50;
        v226 = 2048;
        v227 = v52;
        v228 = 2048;
        v229 = v54;
        v230 = 1024;
        v231 = v46;
        _os_log_debug_impl(&dword_1DB30C000, v69, OS_LOG_TYPE_DEBUG, "Spatial Profile: Left :%@ Right:%@ Yaw-Pitch left (%f ,%f) Right (%f ,%f)Ear Bounding Box: : %@ origin(%f, %f), size(%f, %f) Status %d", buf, 0x76u);
        v27 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
      }

      v30 = v173;
      if (self->_enrollmentPaused)
        goto LABEL_180;
      v237.origin.x = v48;
      v237.origin.y = v50;
      v237.size.width = v52;
      v237.size.height = v54;
      if (!CGRectEqualToRect(v237, *MEMORY[0x1E0C9D648]))
      {
        v70 = v45;
        -[HPSSpatialProfileVideoCaptureSession previewLayer](self->videoCaptureSession, "previewLayer");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "frame");
        -[HPSSpatialProfileEnrollmentController translateEarBoundingBox:previewLayerBoundingBox:](self, "translateEarBoundingBox:previewLayerBoundingBox:", v48, v50, v52, v54, v72, v73, v74, v75);

        if (!self->_rightEarDetected && self->_currentStep == 6)
        {
          sharedBluetoothSettingsLogComponent();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB30C000, v76, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Right Ear Detected", buf, 2u);
          }

          self->_rightEarDetected = 1;
          -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 7);
        }
        v45 = v70;
        if (!self->_leftEarDetected && self->_currentStep == 10)
        {
          sharedBluetoothSettingsLogComponent();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB30C000, v77, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Left Ear Detected", buf, 2u);
          }

          -[HPSSpatialProfileEnrollmentController pauseEnrollment](self, "pauseEnrollment");
          self->_leftEarDetected = 1;
          -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 11);
          v45 = v70;
        }
      }
      -[HPSSpatialProfileEnrollmentController updateBoundingBoxHiddenStatus](self, "updateBoundingBoxHiddenStatus");
      if (-[HPSSpatialProfileEnrollmentController isEarTooClose](self, "isEarTooClose"))
      {
        v78 = 3;
LABEL_177:
        -[HPSSpatialProfileEnrollmentController alertEarDistanceWarning:](self, "alertEarDistanceWarning:", v78);
        goto LABEL_178;
      }
      if (-[HPSSpatialProfileEnrollmentController isEarTooFar](self, "isEarTooFar"))
      {
        v78 = 4;
        goto LABEL_177;
      }
      if (-[HPSSpatialProfileEnrollmentController isEarMovingFast](self, "isEarMovingFast"))
      {
        v78 = 5;
        goto LABEL_177;
      }
LABEL_178:
      if (-[HPSSpatialProfileEnrollmentController isEarOccluded](self, "isEarOccluded"))
        -[HPSSpatialProfileEnrollmentController alertOcclusionWarning](self, "alertOcclusionWarning");
LABEL_180:
      if (v45)
      {
        if (-[HPSSpatialProfileEnrollmentController isPresentingWrongEar](self, "isPresentingWrongEar"))
        {
          v110 = v45;
          sharedBluetoothSettingsLogComponent();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB30C000, v111, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Seeing Left ear When Right is not completed", buf, 2u);
          }

          if (!self->_enrollmentPaused)
          {
            v192[0] = MEMORY[0x1E0C809B0];
            v192[1] = 3221225472;
            v192[2] = __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_289;
            v192[3] = &unk_1EA29A770;
            v192[4] = self;
            dispatch_async(MEMORY[0x1E0C80D38], v192);
          }
          v112 = 0;
          v45 = v110;
        }
        else
        {
          v175 = v6;
          v178 = v7;
          v190 = 0u;
          v191 = 0u;
          v188 = 0u;
          v189 = 0u;
          v171 = v45;
          objc_msgSend(v45, "yawAngles");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v188, v207, 16);
          if (v114)
          {
            v115 = v114;
            v116 = 0;
            v117 = *(_QWORD *)v189;
            do
            {
              for (k = 0; k != v115; ++k)
              {
                if (*(_QWORD *)v189 != v117)
                  objc_enumerationMutation(v113);
                v119 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * k);
                objc_msgSend(v119, "angle");
                v121 = -v120;
                if (v120 <= -11.0)
                {
                  v125 = v120;
                  v126 = objc_msgSend(v119, "captured");
                  if (v125 >= -13.0)
                  {
                    if (v126 && !self->_rightEarMidCaptured)
                    {
                      sharedBluetoothSettingsLogComponent();
                      v130 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v119, "angle");
                        *(_DWORD *)buf = 134218240;
                        v209 = v121;
                        v210 = 2048;
                        v211 = v131;
                        _os_log_impl(&dword_1DB30C000, v130, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Right Ear: Mid Captured: %f (%f)", buf, 0x16u);
                      }

                      v116 = 1;
                      self->_rightEarMidCaptured = 1;
                      v132 = CACurrentMediaTime();
                      self->_lastEarCaptureTime = v132;
                      self->_enrollGuidancePitch = 0.5;
                      LODWORD(v132) = 0.5;
                      -[HPSSpatialProfileSoundHapticManager setEnrollGuidancePitch:](self->_soundHapticManager, "setEnrollGuidancePitch:", v132);
                      -[HPSSpatialProfileEnrollmentController earCentralPartCaptured](self, "earCentralPartCaptured");
                      -[HPSSpatialProfileAnalytics updateRightEarMidAnglelDuration](self->_enrollmentAnalytics, "updateRightEarMidAnglelDuration");
                    }
                  }
                  else if (v126 && !self->_rightEarFrontCaptured)
                  {
                    sharedBluetoothSettingsLogComponent();
                    v127 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v119, "angle");
                      *(_DWORD *)buf = 134218240;
                      v209 = v121;
                      v210 = 2048;
                      v211 = v128;
                      _os_log_impl(&dword_1DB30C000, v127, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Right Ear: Front Captured: %f (%f)", buf, 0x16u);
                    }

                    v116 = 1;
                    self->_rightEarFrontCaptured = 1;
                    v129 = CACurrentMediaTime();
                    self->_lastEarCaptureTime = v129;
                    self->_enrollGuidancePitch = 0.5;
                    LODWORD(v129) = 0.5;
                    -[HPSSpatialProfileSoundHapticManager setEnrollGuidancePitch:](self->_soundHapticManager, "setEnrollGuidancePitch:", v129);
                    -[HPSSpatialProfileAnalytics updateRightEarFrontAnglelDuration](self->_enrollmentAnalytics, "updateRightEarFrontAnglelDuration");
                    -[HPSSpatialProfileEnrollmentController earLeftPartCaptured](self, "earLeftPartCaptured");
                  }
                }
                else if (objc_msgSend(v119, "captured") && !self->_rightEarRearCaptured)
                {
                  sharedBluetoothSettingsLogComponent();
                  v122 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v119, "angle");
                    *(_DWORD *)buf = 134218240;
                    v209 = v121;
                    v210 = 2048;
                    v211 = v123;
                    _os_log_impl(&dword_1DB30C000, v122, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Right Ear: Rear Captured: %f (%f)", buf, 0x16u);
                  }

                  v116 = 1;
                  self->_rightEarRearCaptured = 1;
                  self->_lastEarCaptureTime = CACurrentMediaTime();
                  -[HPSSpatialProfileEnrollmentController earRightPartCaptured](self, "earRightPartCaptured");
                  self->_enrollGuidancePitch = 0.5;
                  LODWORD(v124) = 0.5;
                  -[HPSSpatialProfileSoundHapticManager setEnrollGuidancePitch:](self->_soundHapticManager, "setEnrollGuidancePitch:", v124);
                  -[HPSSpatialProfileAnalytics updateRightEarBackAnglelDuration](self->_enrollmentAnalytics, "updateRightEarBackAnglelDuration");
                }
              }
              v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v188, v207, 16);
            }
            while (v115);
          }
          else
          {
            v116 = 0;
          }

          objc_msgSend(v171, "remainingYawAngles");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v133, "count"))
          {

            v112 = v116 & 1;
            v6 = v175;
            v7 = v178;
            v27 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
            v30 = v173;
          }
          else
          {
            rightEarCaptured = self->_rightEarCaptured;

            v6 = v175;
            v7 = v178;
            v27 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
            v30 = v173;
            if (rightEarCaptured)
            {
              v112 = v116;
            }
            else
            {
              sharedBluetoothSettingsLogComponent();
              v139 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1DB30C000, v139, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Right Ear Captured", buf, 2u);
              }

              self->_rightEarCaptured = 1;
              -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 8);
              v112 = 0;
            }
          }
          v44 = v181;
          v45 = v171;
        }
      }
      else
      {
        v112 = 0;
      }
      if (!v44)
        goto LABEL_270;
      if (-[HPSSpatialProfileEnrollmentController isPresentingWrongEar](self, "isPresentingWrongEar"))
      {
        v140 = v45;
        sharedBluetoothSettingsLogComponent();
        v141 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB30C000, v141, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Seeing Left ear When Right is not completed", buf, 2u);
        }

        if (self->_enrollmentPaused)
        {
          v45 = v140;
          goto LABEL_270;
        }
        v187[0] = MEMORY[0x1E0C809B0];
        v187[1] = 3221225472;
        v187[2] = __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_290;
        v187[3] = &unk_1EA29A770;
        v187[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v187);
        v44 = v181;
        v45 = v140;
        if ((v112 & 1) == 0)
          goto LABEL_272;
LABEL_271:
        -[HPSSpatialProfileEnrollmentController startOcclusionWarnCoolDownTimer](self, "startOcclusionWarnCoolDownTimer");
        -[HPSSpatialProfileEnrollmentController startEarDistanceWarnCoolDownTimer](self, "startEarDistanceWarnCoolDownTimer");
        goto LABEL_272;
      }
      if (self->_rightEarStatus != 3)
        goto LABEL_270;
      v172 = v45;
      v176 = v6;
      v179 = v7;
      v185 = 0u;
      v186 = 0u;
      v183 = 0u;
      v184 = 0u;
      objc_msgSend(v44, "yawAngles");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v183, v206, 16);
      if (v143)
      {
        v144 = v143;
        v145 = *(_QWORD *)v184;
        do
        {
          for (m = 0; m != v144; ++m)
          {
            if (*(_QWORD *)v184 != v145)
              objc_enumerationMutation(v142);
            v147 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * m);
            objc_msgSend(v147, "angle");
            v149 = -v148;
            if (v148 >= -13.0)
            {
              v153 = v148;
              v154 = objc_msgSend(v147, "captured");
              if (v153 <= -11.0)
              {
                if (v154 && !self->_leftEarMidCaptured)
                {
                  sharedBluetoothSettingsLogComponent();
                  v158 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v147, "angle");
                    *(_DWORD *)buf = 134218240;
                    v209 = v149;
                    v210 = 2048;
                    v211 = v159;
                    _os_log_impl(&dword_1DB30C000, v158, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Left Ear: Mid Captured: %f (%f)", buf, 0x16u);
                  }

                  v112 = 1;
                  self->_leftEarMidCaptured = 1;
                  v160 = CACurrentMediaTime();
                  self->_lastEarCaptureTime = v160;
                  self->_enrollGuidancePitch = 0.5;
                  LODWORD(v160) = 0.5;
                  -[HPSSpatialProfileSoundHapticManager setEnrollGuidancePitch:](self->_soundHapticManager, "setEnrollGuidancePitch:", v160);
                  -[HPSSpatialProfileEnrollmentController earCentralPartCaptured](self, "earCentralPartCaptured");
                  -[HPSSpatialProfileAnalytics updateLeftEarMidAnglelDuration](self->_enrollmentAnalytics, "updateLeftEarMidAnglelDuration");
                }
              }
              else if (v154 && !self->_leftEarFrontCaptured)
              {
                sharedBluetoothSettingsLogComponent();
                v155 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v147, "angle");
                  *(_DWORD *)buf = 134218240;
                  v209 = v149;
                  v210 = 2048;
                  v211 = v156;
                  _os_log_impl(&dword_1DB30C000, v155, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Left Ear: Rear Captured: %f (%f)", buf, 0x16u);
                }

                v112 = 1;
                self->_leftEarFrontCaptured = 1;
                v157 = CACurrentMediaTime();
                self->_lastEarCaptureTime = v157;
                self->_enrollGuidancePitch = 0.5;
                LODWORD(v157) = 0.5;
                -[HPSSpatialProfileSoundHapticManager setEnrollGuidancePitch:](self->_soundHapticManager, "setEnrollGuidancePitch:", v157);
                -[HPSSpatialProfileEnrollmentController earLeftPartCaptured](self, "earLeftPartCaptured");
                -[HPSSpatialProfileAnalytics updateLeftEarBackAnglelDuration](self->_enrollmentAnalytics, "updateLeftEarBackAnglelDuration");
              }
            }
            else if (objc_msgSend(v147, "captured") && !self->_leftEarRearCaptured)
            {
              sharedBluetoothSettingsLogComponent();
              v150 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v147, "angle");
                *(_DWORD *)buf = 134218240;
                v209 = v149;
                v210 = 2048;
                v211 = v151;
                _os_log_impl(&dword_1DB30C000, v150, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Left Ear: Front Captured: %f (%f)", buf, 0x16u);
              }

              v112 = 1;
              self->_leftEarRearCaptured = 1;
              v152 = CACurrentMediaTime();
              self->_lastEarCaptureTime = v152;
              self->_enrollGuidancePitch = 0.5;
              LODWORD(v152) = 0.5;
              -[HPSSpatialProfileSoundHapticManager setEnrollGuidancePitch:](self->_soundHapticManager, "setEnrollGuidancePitch:", v152);
              -[HPSSpatialProfileEnrollmentController earRightPartCaptured](self, "earRightPartCaptured");
              -[HPSSpatialProfileAnalytics updateLeftEarFrontAnglelDuration](self->_enrollmentAnalytics, "updateLeftEarFrontAnglelDuration");
            }
          }
          v144 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v183, v206, 16);
        }
        while (v144);
      }

      v44 = v181;
      objc_msgSend(v181, "remainingYawAngles");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v161, "count"))
      {

        v6 = v176;
        v7 = v179;
        v27 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
        v30 = v173;
        v45 = v172;
        if ((v112 & 1) == 0)
          goto LABEL_272;
        goto LABEL_271;
      }
      leftEarCaptured = self->_leftEarCaptured;

      v6 = v176;
      v7 = v179;
      v27 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
      v30 = v173;
      v45 = v172;
      if (leftEarCaptured)
      {
LABEL_270:
        v44 = v181;
        if ((v112 & 1) == 0)
          goto LABEL_272;
        goto LABEL_271;
      }
      sharedBluetoothSettingsLogComponent();
      v164 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v164, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Left Ear Captured", buf, 2u);
      }

      self->_leftEarCaptured = 1;
      -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 12);
      v44 = v181;
      v45 = v172;
LABEL_272:

LABEL_273:
LABEL_274:
      v163 = v27[334];
      if (*(double *)((char *)&self->super.super.super.isa + v163) != v26)
        *(double *)((char *)&self->super.super.super.isa + v163) = v26;

      return;
    case 3uLL:
      -[HPSSpatialProfileAnalytics updateSoundProfileCreationDurationStart](self->_enrollmentAnalytics, "updateSoundProfileCreationDurationStart");
      v59 = self->_currentStep;
      if (v59 <= 11 && (v59 == 9 || v59 == 5))
      {
        sharedBluetoothSettingsLogComponent();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB30C000, v60, OS_LOG_TYPE_DEFAULT, "Spatial Profile: detected Post Process when in  Tutorial View, Pivot to next step. ", buf, 2u);
        }

        v61 = self->_currentStep;
        if (v61 != 12)
        {
          if (v61 <= 10)
            -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 11);
          -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 12);
        }
      }
      sharedBluetoothSettingsLogComponent();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = self->_currentStep;
        *(_DWORD *)buf = 67109120;
        LODWORD(v209) = v63;
        _os_log_impl(&dword_1DB30C000, v62, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Post Process : %d", buf, 8u);
      }

      goto LABEL_274;
    case 4uLL:
      sharedBluetoothSettingsLogComponent();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v64, OS_LOG_TYPE_DEFAULT, "Spatial Profile: State Update: Retrieve Profile", buf, 2u);
      }

      v65 = self->_currentStep;
      if (v65 == 9 || v65 == 5)
      {
        sharedBluetoothSettingsLogComponent();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB30C000, v66, OS_LOG_TYPE_DEFAULT, "Spatial Profile: detected Post Process when in  Tutorial View, Pivot to next step. ", buf, 2u);
        }

        -[HPSSpatialProfileEnrollmentController continueButtonTapped](self, "continueButtonTapped");
        v65 = self->_currentStep;
      }
      if (v65 != 12)
      {
        if (v65 <= 10)
          -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 11);
        -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 12);
      }
      -[HPSSpatialProfileEnrollmentController moveToStep:](self, "moveToStep:", 14);
      -[HPSSpatialProfileAnalytics updateSoundProfileCreationDuration](self->_enrollmentAnalytics, "updateSoundProfileCreationDuration");
      goto LABEL_274;
    case 5uLL:
      sharedBluetoothSettingsLogComponent();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        -[HPSSpatialProfileSingeStepEnrollmentController didReceiveStateUpdateForSession:stateInfo:].cold.2();

      -[HPSSpatialProfileAnalytics updateStatus:EnrollmentResult:](self->_enrollmentAnalytics, "updateStatus:EnrollmentResult:", 0, CFSTR("Failed"));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_291;
      block[3] = &unk_1EA29A770;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      goto LABEL_274;
    default:
      goto LABEL_274;
  }
}

uint64_t __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke(uint64_t a1)
{
  sleep(1u);
  return objc_msgSend(*(id *)(a1 + 32), "moveToStep:", 4);
}

uint64_t __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_289(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Enrolling Wrong ear", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "alertEarEnrollWarning");
}

uint64_t __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_290(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Enrolling Wrong ear", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "alertEarEnrollWarning");
}

uint64_t __83__HPSSpatialProfileEnrollmentController_didReceiveStateUpdateForSession_stateInfo___block_invoke_291(uint64_t a1)
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
    block[2] = __97__HPSSpatialProfileEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_296;
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
    v15[2] = __97__HPSSpatialProfileEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke;
    v15[3] = &unk_1EA29B018;
    v12 = (id *)v16;
    v16[0] = v8;
    v16[1] = self;
    v17 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
}

void __97__HPSSpatialProfileEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke(uint64_t a1)
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
  HPSSpatialProfileUIPearlEnrollView *v17;
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

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1297) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1248), "setPreviewLayer:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 1496);
    *(_QWORD *)(v6 + 1496) = v5;

    v8 = (void *)MEMORY[0x1E0C9DDA8];
    v9 = *MEMORY[0x1E0C9DD28];
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1496);
    v35 = *MEMORY[0x1E0C9DD18];
    v36[0] = *MEMORY[0x1E0C9DD10];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detectorOfType:context:options:", v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 1504);
    *(_QWORD *)(v13 + 1504) = v12;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1248), "previewLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 0;
    objc_msgSend(v15, "setOpacity:", v16);

    v17 = -[HPSSpatialProfileUIPearlEnrollView initWithVideoCaptureSession:inSheet:squareNeedsPositionLayout:]([HPSSpatialProfileUIPearlEnrollView alloc], "initWithVideoCaptureSession:inSheet:squareNeedsPositionLayout:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1248), 0, 0);
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(v18 + 1128);
    *(_QWORD *)(v18 + 1128) = v17;

    objc_msgSend(*(id *)(a1 + 40), "setupEnrollViewUI");
    objc_msgSend(*(id *)(a1 + 40), "pauseEnrollment");
    v20 = *(_QWORD *)(a1 + 40) + 1088;
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
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1104);
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112);
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
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1208))
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      v32 = 138412290;
      *(_QWORD *)v33 = v27;
      _os_log_impl(&dword_1DB30C000, v26, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Checking enrollment viewer Spinner %@", (uint8_t *)&v32, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1294) = 1;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1208))
    {
      sharedBluetoothSettingsLogComponent();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = *(_QWORD *)(a1 + 40);
        v30 = *(unsigned __int8 *)(v29 + 1294);
        v31 = objc_msgSend(*(id *)(v29 + 1392), "available");
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

void __97__HPSSpatialProfileEnrollmentController_didReceiveCaptureVideo_colorImage_depthImage_faceObject___block_invoke_296(uint64_t a1)
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
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1488);
    v3 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, *MEMORY[0x1E0C9DD20]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1504), "featuresInImage:options:", *(_QWORD *)(a1 + 32), v5);
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
      v16 = *(unsigned __int8 *)(v15 + 1489);
      if (v16 <= 0x63)
        *(_BYTE *)(v15 + 1489) = v16 + 1;
    }
    else
    {
LABEL_12:
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1489) = 0;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1488) = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1489) > 0x63u;
    if (v2 != *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1488))
    {
      sharedBluetoothSettingsLogComponent();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(unsigned __int8 *)(v18 + 1488);
        v20 = *(unsigned __int8 *)(v18 + 1489);
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
      if (*(_BYTE *)(v22 + 1488))
      {
        *(_BYTE *)(v22 + 1403) = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1402) = 0;
      }
    }

  }
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
  HPSSpatialProfileSoundHapticManager *v7;
  NSObject *v8;
  HPSSpatialProfileSoundHapticManager *soundHapticManager;
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
    v13[2] = __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_2;
    v13[3] = &unk_1EA29A770;
    v14 = v5;
    -[HPSSpatialProfileSoundHapticManager triggerSoundHapticForEarCaptureState:completion:](soundHapticManager, "triggerSoundHapticForEarCaptureState:completion:", 1, v13);
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
    v15[2] = __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke;
    v15[3] = &unk_1EA29A770;
    v16 = v5;
    -[HPSSpatialProfileSoundHapticManager triggerSoundHapticForEarCaptureState:completion:](v7, "triggerSoundHapticForEarCaptureState:completion:", 0, v15);
    v8 = v16;
  }

LABEL_7:
  ++self->_earCaptureSoundStep;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_3;
  block[3] = &unk_1EA29A6D8;
  v12 = v4;
  v10 = v4;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);

}

void __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __75__HPSSpatialProfileEnrollmentController_playEarCaptureSoundWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  uint64_t v17;
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
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
    v30 = v13;
    _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Device %@, bud in ear", buf, 0xCu);

  }
  objc_msgSend((id)MGGetStringAnswer(), "uppercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_"), "stringByAppendingFormat:", CFSTR("%@_%@"), v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v4;
  if (v6 == 8215)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_IED_WARN_IPHONE_ACCESSORY_MODEL_NAME_23"), &stru_1EA29D890, CFSTR("DeviceConfig-B453"));
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  v18 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", v15, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_PROFILE_IN_EAR_TEXT"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v20, v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, &__block_literal_global_305);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v27);

  -[HPSSpatialProfileEnrollmentController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
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
                  -[HPSSpatialProfileEnrollmentController showBudsInEarPopUp:](self, "showBudsInEarPopUp:", v9);
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
                  -[HPSSpatialProfileEnrollmentController showBudsInEarPopUp:](self, "showBudsInEarPopUp:", v9);
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
  v14[2] = __59__HPSSpatialProfileEnrollmentController_showLandscapeAlert__block_invoke;
  v14[3] = &unk_1EA29A880;
  v14[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  -[HPSSpatialProfileEnrollmentController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __59__HPSSpatialProfileEnrollmentController_showLandscapeAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelSpatialAudioProfile");
}

- (void)fillFacePillsByDirection:(int)a3
{
  uint64_t v3;
  NSObject *stepSerialQueue;
  _QWORD v5[6];

  v3 = 0;
  if ((a3 - 1) <= 6)
    v3 = qword_1DB3C1600[a3 - 1];
  stepSerialQueue = self->_stepSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__HPSSpatialProfileEnrollmentController_fillFacePillsByDirection___block_invoke;
  v5[3] = &unk_1EA29A798;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(stepSerialQueue, v5);
}

void __66__HPSSpatialProfileEnrollmentController_fillFacePillsByDirection___block_invoke(uint64_t a1)
{
  _QWORD v1[6];

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __66__HPSSpatialProfileEnrollmentController_fillFacePillsByDirection___block_invoke_2;
  v1[3] = &unk_1EA29A798;
  v1[4] = *(_QWORD *)(a1 + 32);
  v1[5] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
}

void __66__HPSSpatialProfileEnrollmentController_fillFacePillsByDirection___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "pillContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fillPillsAroundAngle:", *(double *)(a1 + 40));

}

- (void)showEarPillsDots
{
  HPSSpatialProfileEarPillContainerView *earPillContainer;
  _QWORD v4[5];

  earPillContainer = self->_earPillContainer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__HPSSpatialProfileEnrollmentController_showEarPillsDots__block_invoke;
  v4[3] = &unk_1EA29A770;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", earPillContainer, 5242880, v4, 0, 0.4);
  -[HPSSpatialProfileEarDotsMovieView showDots](self->_earDotsMovieView, "showDots");
}

uint64_t __57__HPSSpatialProfileEnrollmentController_showEarPillsDots__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setAlpha:", 1.0);
}

- (void)hideEarPillsDots
{
  HPSSpatialProfileEarPillContainerView *earPillContainer;
  _QWORD v4[5];

  earPillContainer = self->_earPillContainer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__HPSSpatialProfileEnrollmentController_hideEarPillsDots__block_invoke;
  v4[3] = &unk_1EA29A770;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", earPillContainer, 5242880, v4, 0, 0.4);
  -[HPSSpatialProfileEarDotsMovieView hideDots](self->_earDotsMovieView, "hideDots");
}

uint64_t __57__HPSSpatialProfileEnrollmentController_hideEarPillsDots__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setAlpha:", 0.0);
}

- (void)prepareSpinner
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
  double v5;
  double v6;
  double v7;

  if (!self->_spinner)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = self->_spinner;
    self->_spinner = v3;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_spinner, "setActivityIndicatorViewStyle:", 100);
    -[OBTrayButton bounds](self->_continueButton, "bounds");
    v6 = v5 * 0.5;
    -[OBTrayButton bounds](self->_continueButton, "bounds");
    -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:", v6, v7 * 0.5);
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    -[OBTrayButton addSubview:](self->_continueButton, "addSubview:", self->_spinner);
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
  UIActivityIndicatorView *spinner;
  void *v6;
  uint8_t v7[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Welcome Spinner", v7, 2u);
  }

  self->_welcomeSpinnerOn = 1;
  -[OBTrayButton titleLabel](self->_continueButton, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[OBTrayButton setUserInteractionEnabled:](self->_continueButton, "setUserInteractionEnabled:", 0);
  -[HPSSpatialProfileEnrollmentController prepareSpinner](self, "prepareSpinner");
  spinner = self->_spinner;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](spinner, "setColor:", v6);

}

- (void)stopWelcomeSpinner
{
  _BOOL4 welcomeSpinnerOn;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _BOOL4 enrollmentReady;
  int v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_enrollmentReady || !-[BluetoothManager available](self->_btManager, "available"))
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      enrollmentReady = self->_enrollmentReady;
      v8 = -[BluetoothManager available](self->_btManager, "available");
      v9[0] = 67109376;
      v9[1] = enrollmentReady;
      v10 = 1024;
      v11 = v8;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: stopWelcomeSpinner failed _enrollmentReady %d [_btManager available] %d", (uint8_t *)v9, 0xEu);
    }
    goto LABEL_11;
  }
  welcomeSpinnerOn = self->_welcomeSpinnerOn;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!welcomeSpinnerOn)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSingeStepEnrollmentController stopWelcomeSpinner].cold.1();
LABEL_11:

    return;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stop Welcome Spinner", (uint8_t *)v9, 2u);
  }

  self->_welcomeSpinnerOn = 0;
  -[OBTrayButton titleLabel](self->_continueButton, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  -[OBTrayButton setUserInteractionEnabled:](self->_continueButton, "setUserInteractionEnabled:", 1);
  -[HPSSpatialProfileEnrollmentController cleanUpSpinner](self, "cleanUpSpinner");
  -[HPSSpatialProfileEnrollmentController continueButtonTapped](self, "continueButtonTapped");
}

- (void)startPostProcessSpinner
{
  NSObject *v3;
  void *v4;
  void *v5;
  UIActivityIndicatorView *spinner;
  void *v7;
  uint8_t v8[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Post Process Spinner", v8, 2u);
  }

  self->_postProcessSpinnerOn = 1;
  -[OBTrayButton titleLabel](self->_continueButton, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[OBTrayButton setUserInteractionEnabled:](self->_continueButton, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setTintColor:](self->_continueButton, "setTintColor:", v5);

  -[HPSSpatialProfileEnrollmentController showContinueButton](self, "showContinueButton");
  -[HPSSpatialProfileEnrollmentController prepareSpinner](self, "prepareSpinner");
  spinner = self->_spinner;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](spinner, "setColor:", v7);

}

- (void)stopPostProcessSpinner
{
  _BOOL4 postProcessSpinnerOn;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  postProcessSpinnerOn = self->_postProcessSpinnerOn;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (postProcessSpinnerOn)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stop Post Process Spinner", v8, 2u);
    }

    self->_postProcessSpinnerOn = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTintColor:](self->_continueButton, "setTintColor:", v6);

    -[OBTrayButton titleLabel](self->_continueButton, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    -[OBTrayButton setUserInteractionEnabled:](self->_continueButton, "setUserInteractionEnabled:", 1);
    -[HPSSpatialProfileEnrollmentController cleanUpSpinner](self, "cleanUpSpinner");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSingeStepEnrollmentController stopWelcomeSpinner].cold.1();

  }
}

- (void)earLeftPartCaptured
{
  NSObject *stepSerialQueue;
  _QWORD block[5];

  stepSerialQueue = self->_stepSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(stepSerialQueue, block);
}

void __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "pulseEarBoundingBox");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1136);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke_2;
  v11[3] = &unk_1EA29A770;
  v5 = v2;
  v12 = v5;
  objc_msgSend(v3, "fillLeftPillsWithCompletion:", v11);
  dispatch_group_enter(v5);
  v6 = *(void **)(a1 + 32);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke_3;
  v9[3] = &unk_1EA29A770;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "playEarCaptureSoundWithCompletion:", v9);
  v8 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v7, v8);

}

void __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__HPSSpatialProfileEnrollmentController_earLeftPartCaptured__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)earCentralPartCaptured
{
  NSObject *stepSerialQueue;
  _QWORD block[5];

  stepSerialQueue = self->_stepSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(stepSerialQueue, block);
}

void __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "pulseEarBoundingBox");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1136);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke_2;
  v11[3] = &unk_1EA29A770;
  v5 = v2;
  v12 = v5;
  objc_msgSend(v3, "fillCentralPillsWithCompletion:", v11);
  dispatch_group_enter(v5);
  v6 = *(void **)(a1 + 32);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke_3;
  v9[3] = &unk_1EA29A770;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "playEarCaptureSoundWithCompletion:", v9);
  v8 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v7, v8);

}

void __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__HPSSpatialProfileEnrollmentController_earCentralPartCaptured__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)earRightPartCaptured
{
  NSObject *stepSerialQueue;
  _QWORD block[5];

  stepSerialQueue = self->_stepSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(stepSerialQueue, block);
}

void __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "pulseEarBoundingBox");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1136);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke_2;
  v11[3] = &unk_1EA29A770;
  v5 = v2;
  v12 = v5;
  objc_msgSend(v3, "fillRightPillsWithCompletion:", v11);
  dispatch_group_enter(v5);
  v6 = *(void **)(a1 + 32);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke_3;
  v9[3] = &unk_1EA29A770;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "playEarCaptureSoundWithCompletion:", v9);
  v8 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v7, v8);

}

void __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__HPSSpatialProfileEnrollmentController_earRightPartCaptured__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)pulseEarBoundingBox
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HPSSpatialProfileEnrollmentController_pulseEarBoundingBox__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__HPSSpatialProfileEnrollmentController_pulseEarBoundingBox__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setInactive:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "startScalingWithExpansionWidth:duration:repeatCount:", 1, 10.0, 0.1);
  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HPSSpatialProfileEnrollmentController_pulseEarBoundingBox__block_invoke_2;
  block[3] = &unk_1EA29A770;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

uint64_t __60__HPSSpatialProfileEnrollmentController_pulseEarBoundingBox__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setInactive:", 1);
}

- (void)clearBoundingBox
{
  self->_earBoundingBoxDetectTracker = 0;
  self->_earBoundingBoxDetected = 0;
  -[HPSSpatialProfileEnrollmentController updateBoundingBoxHiddenStatus](self, "updateBoundingBoxHiddenStatus");
}

- (void)updateBoundingBoxHiddenStatus
{
  int v3;
  int currentStep;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  _QWORD v9[5];
  char v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;
  CGRect v14;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[CEKSubjectIndicatorView isHidden](self->_earBoundingBoxView, "isHidden");
  currentStep = self->_currentStep;
  if (currentStep == 7 || currentStep == 11)
  {
    if (v3 == !self->_earBoundingBoxDetected)
      return;
    if (self->_earBoundingBoxDetected)
    {
      -[CEKSubjectIndicatorView bounds](self->_earBoundingBoxView, "bounds");
      if (CGRectEqualToRect(v14, *MEMORY[0x1E0C9D648]))
        return;
      v6 = 0;
      goto LABEL_12;
    }
  }
  else if ((v3 & 1) != 0)
  {
    return;
  }
  v6 = 1;
LABEL_12:
  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("Showing");
    if (v6)
      v8 = CFSTR("Hidden");
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Bouding Box Updated : %@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HPSSpatialProfileEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke;
  v9[3] = &unk_1EA29B068;
  v9[4] = self;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);
}

uint64_t __70__HPSSpatialProfileEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__HPSSpatialProfileEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke_2;
  v2[3] = &unk_1EA29B068;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.3);
}

uint64_t __70__HPSSpatialProfileEnrollmentController_updateBoundingBoxHiddenStatus__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setHidden:", *(unsigned __int8 *)(a1 + 40));
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
  block[2] = __89__HPSSpatialProfileEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke;
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

uint64_t __89__HPSSpatialProfileEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  __int128 v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __89__HPSSpatialProfileEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke_2;
  v2[3] = &unk_1EA29B040;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.1);
}

uint64_t __89__HPSSpatialProfileEnrollmentController_translateEarBoundingBox_previewLayerBoundingBox___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setBounds:", 0.0, 0.0, *(float *)(a1 + 40), *(float *)(a1 + 44));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setCenter:", *(float *)(a1 + 48), *(float *)(a1 + 52));
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

- (void)updateCurrentTrackingEar:(id)a3 rightEarPoseStatus:(id)a4 earBoundingBox:(CGRect)a5 earStatus:(int)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  void *v15;
  _BOOL4 earTooClose;
  _BOOL4 isEarOccluded;
  unsigned int currentStep;
  BOOL v19;
  int v20;
  uint64_t v22;
  unsigned int earOcclusionDetectTracker;
  char v24;
  unsigned int earTooCloseDetectTracker;
  _BOOL4 v26;
  unsigned int earBoundingBoxDetectTracker;
  BOOL v28;
  unsigned __int8 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSArray *v34;
  NSArray *pendingYaw;
  unsigned int leftEarInViewCount;
  double v37;
  double v38;
  double v39;
  double v40;
  NSArray *v41;
  NSArray *v42;
  unsigned int rightEarInViewCount;
  int v44;
  int leftEarStatus;
  double v46;
  NSArray *v47;
  NSArray *v48;
  int rightEarStatus;
  double v50;
  NSArray *v51;
  NSArray *v52;
  NSObject *v53;
  double currentYaw;
  double candidateYaw;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  int v60;
  NSObject *v61;
  int v62;
  int v63;
  NSObject *v64;
  const __CFString *v65;
  const __CFString *v66;
  _BOOL4 motionBlurr;
  _BOOL4 v68;
  const __CFString *v69;
  const __CFString *v70;
  NSObject *v71;
  const char *v72;
  int v73;
  _BOOL4 supressEarOcclusionWarning;
  _BOOL4 earTooFar;
  int currentTrackingEar;
  _BOOL4 v77;
  _BOOL4 v78;
  uint8_t buf[4];
  _BYTE v80[10];
  _BYTE v81[10];
  const __CFString *v82;
  __int16 v83;
  const __CFString *v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  const __CFString *v88;
  uint64_t v89;
  CGRect v90;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v89 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = v14;
  if (v13)
  {
    v78 = objc_msgSend(v13, "hasYawAngle") != 0;
    if (v15)
    {
LABEL_3:
      v77 = objc_msgSend(v15, "hasYawAngle") != 0;
      goto LABEL_6;
    }
  }
  else
  {
    v78 = 0;
    if (v14)
      goto LABEL_3;
  }
  v77 = 0;
LABEL_6:
  currentTrackingEar = self->_currentTrackingEar;
  earTooClose = self->_earTooClose;
  earTooFar = self->_earTooFar;
  isEarOccluded = self->_isEarOccluded;
  currentStep = self->_currentStep;
  v19 = currentStep > 0xB;
  v20 = (1 << currentStep) & 0xCC0;
  if (v19 || v20 == 0)
    goto LABEL_42;
  switch(a6)
  {
    case 0:
      if (self->_earOcclusionDetectTracker)
        --self->_earOcclusionDetectTracker;
      if (self->_earTooCloseDetectTracker)
        --self->_earTooCloseDetectTracker;
      if (self->_earTooFarDetectTracker)
        --self->_earTooFarDetectTracker;
      if (self->_motionBlurrTracker)
        self->_motionBlurrTracker = 0;
      break;
    case 2:
      if (!self->_isLookingAtPhone && !earTooClose)
      {
        v22 = 1403;
        earOcclusionDetectTracker = self->_earOcclusionDetectTracker;
        if (earOcclusionDetectTracker < 0x15)
          goto LABEL_29;
        v24 = 20;
        goto LABEL_30;
      }
      break;
    case 3:
      if (!self->_isLookingAtPhone)
      {
        v22 = 1419;
        earOcclusionDetectTracker = self->_earTooCloseDetectTracker;
        if (earOcclusionDetectTracker < 6)
          goto LABEL_29;
        v24 = 5;
        goto LABEL_30;
      }
      break;
    case 4:
      v22 = 1433;
      earOcclusionDetectTracker = self->_earTooFarDetectTracker;
      if (earOcclusionDetectTracker < 0xB)
        goto LABEL_29;
      v24 = 10;
      goto LABEL_30;
    case 5:
      v22 = 1435;
      earOcclusionDetectTracker = self->_motionBlurrTracker;
      if (earOcclusionDetectTracker < 0x1F)
LABEL_29:
        v24 = earOcclusionDetectTracker + 1;
      else
        v24 = 30;
LABEL_30:
      *((_BYTE *)&self->super.super.super.isa + v22) = v24;
      break;
    default:
      break;
  }
  self->_isEarOccluded = self->_earOcclusionDetectTracker > 0x13u;
  if (self->_earTooFarDetectTracker < 0xAu)
  {
    if (!self->_earTooCloseDetectTracker)
      self->_earTooFar = 0;
  }
  else
  {
    self->_earTooFar = 1;
  }
  earTooCloseDetectTracker = self->_earTooCloseDetectTracker;
  if (earTooCloseDetectTracker > 4)
  {
    LOBYTE(earTooCloseDetectTracker) = 1;
LABEL_38:
    self->_earTooClose = earTooCloseDetectTracker;
    goto LABEL_39;
  }
  if (!self->_earTooCloseDetectTracker)
    goto LABEL_38;
LABEL_39:
  self->_motionBlurr = self->_motionBlurrTracker > 0x1Du;
  if (self->_earTooClose || self->_earTooFar)
  {
    self->_earOcclusionDetectTracker = 0;
    self->_isEarOccluded = 0;
  }
LABEL_42:
  v90.origin.x = x;
  v90.origin.y = y;
  v90.size.width = width;
  v90.size.height = height;
  v26 = CGRectEqualToRect(v90, *MEMORY[0x1E0C9D648]);
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
    self->_earBoundingBoxDetectTracker = earBoundingBoxDetectTracker + 1;
    self->_currentEarBB.origin.x = x;
    self->_currentEarBB.origin.y = y;
    self->_currentEarBB.size.width = width;
    self->_currentEarBB.size.height = height;
    v29 = self->_earBoundingBoxDetectTracker;
  }
  if (v29 >= 0x15u)
  {
    v29 = 20;
    self->_earBoundingBoxDetectTracker = 20;
  }
  self->_earBoundingBoxDetected = v29 != 0;
  if (v78)
  {
    objc_msgSend(v13, "currentYawAngle");
    if (v30 != -100.0)
    {
      objc_msgSend(v13, "currentYawAngle");
      self->_leftEarLastYaw = v31;
      objc_msgSend(v13, "currentYawAngle");
      self->_leftLastReceivedYaw = v32;
      objc_msgSend(v13, "currentYawAngle");
      self->_currentYaw = v33;
      objc_msgSend(v13, "remainingYawAngles");
      v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
      pendingYaw = self->_pendingYaw;
      self->_pendingYaw = v34;

    }
    self->_rightEarLastYaw = -100.0;
    ++self->_leftEarCaptureCount;
    leftEarInViewCount = self->_leftEarInViewCount;
    if (leftEarInViewCount <= 0x13)
      self->_leftEarInViewCount = leftEarInViewCount + 1;
    self->_rightEarCaptureCount = 0;
  }
  else
  {
    self->_leftEarCaptureCount = 0;
    if (self->_leftEarInViewCount)
      --self->_leftEarInViewCount;
  }
  if (v77)
  {
    objc_msgSend(v15, "currentYawAngle");
    if (v37 != -100.0)
    {
      objc_msgSend(v15, "currentYawAngle");
      self->_rightEarLastYaw = v38;
      objc_msgSend(v15, "currentYawAngle");
      self->_rightLastReceivedYaw = v39;
      objc_msgSend(v15, "currentYawAngle");
      self->_currentYaw = v40;
      objc_msgSend(v15, "remainingYawAngles");
      v41 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v42 = self->_pendingYaw;
      self->_pendingYaw = v41;

    }
    self->_leftEarLastYaw = -100.0;
    ++self->_rightEarCaptureCount;
    rightEarInViewCount = self->_rightEarInViewCount;
    if (rightEarInViewCount <= 0x13)
      self->_rightEarInViewCount = rightEarInViewCount + 1;
    v44 = 1353;
  }
  else
  {
    if (self->_rightEarInViewCount)
      --self->_rightEarInViewCount;
    v44 = 1341;
  }
  *((_BYTE *)&self->super.super.super.isa + v44) = 0;
  if (v13)
  {
    if (objc_msgSend(v13, "hasYawAngle"))
    {
      leftEarStatus = self->_leftEarStatus;
      if (leftEarStatus >= 1 && leftEarStatus != 3)
      {
        objc_msgSend(v13, "currentYawAngle");
        self->_currentYaw = v46;
        objc_msgSend(v13, "remainingYawAngles");
        v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v48 = self->_pendingYaw;
        self->_pendingYaw = v47;

      }
    }
  }
  if (v15)
  {
    if (objc_msgSend(v15, "hasYawAngle"))
    {
      rightEarStatus = self->_rightEarStatus;
      if (rightEarStatus >= 1 && rightEarStatus != 3)
      {
        objc_msgSend(v15, "currentYawAngle");
        self->_currentYaw = v50;
        objc_msgSend(v15, "remainingYawAngles");
        v51 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v52 = self->_pendingYaw;
        self->_pendingYaw = v51;

      }
    }
  }
  sharedBluetoothSettingsLogComponent();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    currentYaw = self->_currentYaw;
    candidateYaw = self->_candidateYaw;
    v56 = CFSTR("YES");
    if (self->_earTooClose)
      v57 = CFSTR("YES");
    else
      v57 = CFSTR("NO");
    if (self->_earTooFar)
      v58 = CFSTR("YES");
    else
      v58 = CFSTR("NO");
    if (self->_motionBlurr)
      v59 = CFSTR("YES");
    else
      v59 = CFSTR("NO");
    if (!self->_isEarOccluded)
      v56 = CFSTR("NO");
    *(_DWORD *)buf = 134219266;
    *(double *)v80 = currentYaw;
    *(_WORD *)&v80[8] = 2048;
    *(double *)v81 = candidateYaw;
    *(_WORD *)&v81[8] = 2112;
    v82 = v57;
    v83 = 2112;
    v84 = v58;
    v85 = 2112;
    v86 = v59;
    v87 = 2112;
    v88 = v56;
    _os_log_impl(&dword_1DB30C000, v53, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Current yaw : %f  < %f >  :  Too Close: %@ Too Far : %@ Motion Blurr: %@ Occlusion (Note other param affect this) : %@", buf, 0x3Eu);
  }

  if (self->_leftEarCaptureCount >= 5u)
  {
    self->_leftEarCaptureCount = 1;
    self->_currentTrackingEar = 1;
  }
  if (self->_rightEarCaptureCount >= 5u)
  {
    self->_rightEarCaptureCount = 1;
    self->_currentTrackingEar = 2;
  }
  if (v78 || v77)
  {
    v60 = self->_currentTrackingEar;
  }
  else
  {
    v60 = 0;
    self->_currentTrackingEar = 0;
  }
  if (v60 != currentTrackingEar)
  {
    sharedBluetoothSettingsLogComponent();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = self->_currentTrackingEar;
      v63 = self->_currentStep;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v80 = v62;
      *(_WORD *)&v80[4] = 1024;
      *(_DWORD *)&v80[6] = v63;
      _os_log_impl(&dword_1DB30C000, v61, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Tracking Changed to %d Current State %d", buf, 0xEu);
    }

  }
  if (earTooClose != self->_earTooClose
    || earTooFar != self->_earTooFar
    || isEarOccluded != self->_isEarOccluded
    || self->_currentTrackingEar != currentTrackingEar)
  {
    sharedBluetoothSettingsLogComponent();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = CFSTR("YES");
      if (self->_earTooClose)
        v66 = CFSTR("YES");
      else
        v66 = CFSTR("NO");
      motionBlurr = self->_motionBlurr;
      v68 = self->_isEarOccluded;
      if (self->_earTooFar)
        v69 = CFSTR("YES");
      else
        v69 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      if (motionBlurr)
        v70 = CFSTR("YES");
      else
        v70 = CFSTR("NO");
      *(_QWORD *)v80 = v66;
      *(_WORD *)&v80[8] = 2112;
      if (!v68)
        v65 = CFSTR("NO");
      *(_QWORD *)v81 = v69;
      *(_WORD *)&v81[8] = 2112;
      v82 = v70;
      v83 = 2112;
      v84 = v65;
      _os_log_impl(&dword_1DB30C000, v64, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Aggressor parameter Changes Too Close: %@ Too Far : %@ Motion Blurr: %@ Occlusion (Note other param affect this) : %@ ", buf, 0x2Au);
    }

    if (isEarOccluded != self->_isEarOccluded)
    {
      sharedBluetoothSettingsLogComponent();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_isEarOccluded)
          v72 = "YES";
        else
          v72 = "NO";
        v73 = self->_earOcclusionDetectTracker;
        supressEarOcclusionWarning = self->_supressEarOcclusionWarning;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v80 = v72;
        *(_WORD *)&v80[8] = 1024;
        *(_DWORD *)v81 = v73;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = supressEarOcclusionWarning;
        _os_log_impl(&dword_1DB30C000, v71, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Occlusion changed to %s current number of entries %d UI supressed = %d", buf, 0x18u);
      }

    }
  }

}

- (void)hideContinueButton
{
  -[OBTrayButton setHidden:](self->_continueButton, "setHidden:", 1);
  -[UIVisualEffectView setHidden:](self->_buttonTrayEffectView, "setHidden:", 1);
}

- (void)showContinueButton
{
  -[OBTrayButton setHidden:](self->_continueButton, "setHidden:", 0);
  -[UIVisualEffectView setHidden:](self->_buttonTrayEffectView, "setHidden:", 0);
}

- (void)hideOcclusionContinueButton
{
  -[OBTrayButton setHidden:](self->_occlusionContinueButton, "setHidden:", 1);
  -[UIVisualEffectView setHidden:](self->_buttonTrayEffectView, "setHidden:", 1);
}

- (void)showOcclusionContinueButton
{
  -[OBTrayButton setHidden:](self->_occlusionContinueButton, "setHidden:", 0);
  -[UIVisualEffectView setHidden:](self->_buttonTrayEffectView, "setHidden:", 0);
}

- (BOOL)isEarTooClose
{
  unsigned int currentStep;
  BOOL v3;
  int v4;
  BOOL v5;

  currentStep = self->_currentStep;
  v3 = currentStep > 0xB;
  v4 = (1 << currentStep) & 0xCC0;
  v5 = v3 || v4 == 0;
  return !v5 && !self->_supressEarDistanceWarning && self->_earTooClose;
}

- (BOOL)isEarTooFar
{
  unsigned int currentStep;
  BOOL v3;
  int v4;
  BOOL v5;

  currentStep = self->_currentStep;
  v3 = currentStep > 0xB;
  v4 = (1 << currentStep) & 0xCC0;
  v5 = v3 || v4 == 0;
  return !v5 && !self->_supressEarDistanceWarning && self->_earTooFar;
}

- (BOOL)isEarMovingFast
{
  unsigned int currentStep;
  BOOL v3;
  int v4;
  BOOL v5;

  currentStep = self->_currentStep;
  v3 = currentStep > 0xB;
  v4 = (1 << currentStep) & 0xCC0;
  v5 = v3 || v4 == 0;
  return !v5 && !self->_supressEarDistanceWarning && self->_motionBlurr && !self->_earTooClose && !self->_earTooFar;
}

- (void)startEarDistanceWarnCoolDownTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HPSSpatialProfileEnrollmentController_startEarDistanceWarnCoolDownTimer__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __74__HPSSpatialProfileEnrollmentController_startEarDistanceWarnCoolDownTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 1424))
  {
    objc_msgSend((id)v2, "stopEarDistanceWarnCoolDownTimer");
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 1436) = 1;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_triggerEarDistanceWarnCoolDownTimer, 0, 0, 9.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1424);
  *(_QWORD *)(v4 + 1424) = v3;

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Ear distance Cool down timer", v7, 2u);
  }

}

- (void)triggerEarDistanceWarnCoolDownTimer
{
  NSObject *v2;
  uint8_t v3[16];

  self->_supressEarDistanceWarning = 0;
  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ready to show ear too close error", v3, 2u);
  }

}

- (void)stopEarDistanceWarnCoolDownTimer
{
  NSObject *v3;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  NSTimer *earTooCloseWarnCoolDownTimer;
  int v9;
  CGFloat v10;
  __int16 v11;
  CGFloat v12;
  __int16 v13;
  CGFloat v14;
  __int16 v15;
  CGFloat v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    x = self->_currentEarBB.origin.x;
    y = self->_currentEarBB.origin.y;
    width = self->_currentEarBB.size.width;
    height = self->_currentEarBB.size.height;
    v9 = 134218752;
    v10 = x;
    v11 = 2048;
    v12 = y;
    v13 = 2048;
    v14 = width;
    v15 = 2048;
    v16 = height;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Stopping ear too close  Timer Current Bounding Box [ %f %f %f %f", (uint8_t *)&v9, 0x2Au);
  }

  -[NSTimer invalidate](self->_earTooCloseWarnCoolDownTimer, "invalidate");
  earTooCloseWarnCoolDownTimer = self->_earTooCloseWarnCoolDownTimer;
  self->_earTooCloseWarnCoolDownTimer = 0;

}

- (void)startEnrollGuidanceTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HPSSpatialProfileEnrollmentController_startEnrollGuidanceTimer__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __65__HPSSpatialProfileEnrollmentController_startEnrollGuidanceTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 1544))
  {
    objc_msgSend(*(id *)(a1 + 32), "stopEnrollGuidanceTimer");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v2, sel_triggerEnrollGuidanceTimer, 0, 0, 5.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1544);
  *(_QWORD *)(v4 + 1544) = v3;

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Start Progress Player", v7, 2u);
  }

}

- (void)triggerEnrollGuidanceTimer
{
  NSArray *pendingYaw;
  double enrollGuidancePitch;
  double candidateYaw;
  void *v6;
  void *v7;
  float v8;
  double v9;
  NSObject *v10;
  double v11;
  int leftEarStatus;
  BOOL v13;
  _BOOL4 v14;
  int rightEarStatus;
  NSObject *v17;
  double currentYaw;
  double v19;
  int leftEarInViewCount;
  int rightEarInViewCount;
  const __CFString *v22;
  double v23;
  double v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  float v33;
  NSObject *v34;
  double v35;
  void *v36;
  float v37;
  NSObject *v38;
  double v39;
  float v40;
  void *v41;
  float v42;
  NSObject *v43;
  double v44;
  NSObject *v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  double v50;
  _BOOL4 v51;
  const __CFString *v52;
  double v53;
  int v54;
  BOOL v55;
  int v56;
  BOOL v57;
  uint64_t v58;
  void *v59;
  _QWORD block[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  _BYTE v71[10];
  _QWORD v72[5];

  *(_QWORD *)((char *)&v72[2] + 6) = *MEMORY[0x1E0C80C00];
  pendingYaw = self->_pendingYaw;
  if (pendingYaw)
  {
    enrollGuidancePitch = self->_enrollGuidancePitch;
    if (-[NSArray count](pendingYaw, "count"))
    {
      candidateYaw = self->_candidateYaw;
      self->_candidateYaw = -100.0;
      -[NSArray firstObject](self->_pendingYaw, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "floatValue");
        v9 = (float)-v8;
        self->_candidateYaw = v9;
        if (candidateYaw != v9)
        {
          sharedBluetoothSettingsLogComponent();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = self->_candidateYaw;
            *(_DWORD *)buf = 134218240;
            v67 = candidateYaw;
            v68 = 2048;
            v69 = v11;
            _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Candidate angle updated %f --> %f", buf, 0x16u);
          }

        }
      }
      leftEarStatus = self->_leftEarStatus;
      v13 = leftEarStatus < 1 || leftEarStatus == 3;
      if (v13 || !self->_leftEarInViewCount)
      {
        rightEarStatus = self->_rightEarStatus;
        v14 = rightEarStatus >= 1 && rightEarStatus != 3 && self->_rightEarInViewCount != 0;
      }
      else
      {
        v14 = 1;
      }
      sharedBluetoothSettingsLogComponent();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        currentYaw = self->_currentYaw;
        v19 = self->_candidateYaw;
        leftEarInViewCount = self->_leftEarInViewCount;
        rightEarInViewCount = self->_rightEarInViewCount;
        v22 = CFSTR("NO");
        if (v14)
          v22 = CFSTR("YES");
        *(_DWORD *)buf = 134219010;
        v67 = currentYaw;
        v68 = 2048;
        v69 = v19;
        v70 = 1024;
        *(_DWORD *)v71 = leftEarInViewCount;
        *(_WORD *)&v71[4] = 1024;
        *(_DWORD *)&v71[6] = rightEarInViewCount;
        LOWORD(v72[0]) = 2112;
        *(_QWORD *)((char *)v72 + 2) = v22;
        _os_log_impl(&dword_1DB30C000, v17, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance evaluating Feedback Current Yaw %f Target Yaw %f Ear Tracking [L %d R %d] %@", buf, 0x2Cu);
      }

      v23 = self->_candidateYaw;
      if (v23 != -100.0)
      {
        if (v14)
        {
          v58 = 1560;
          v24 = vabdd_f64(v23, self->_currentYaw);
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v59 = v7;
          v25 = self->_feedBackBinning;
          v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
          if (v26)
          {
            v27 = v26;
            v28 = 0;
            v29 = *(_QWORD *)v62;
            while (2)
            {
              v30 = 0;
              v31 = v28 + v27;
              do
              {
                if (*(_QWORD *)v62 != v29)
                  objc_enumerationMutation(v25);
                v32 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v30);
                objc_msgSend(v32, "floatValue", v58);
                if (v24 > v33)
                {
                  v31 = v28 + v30;
                  -[NSArray objectAtIndex:](self->_feedBackPitch, "objectAtIndex:", v28 + v30);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "floatValue");
                  self->_enrollGuidancePitch = v37;
                  sharedBluetoothSettingsLogComponent();
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                  {
                    v39 = self->_enrollGuidancePitch;
                    objc_msgSend(v32, "floatValue");
                    *(_DWORD *)buf = 134218240;
                    v67 = v39;
                    v68 = 2048;
                    v69 = v40;
                    _os_log_impl(&dword_1DB30C000, v38, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Calcuated new Pitch %f based on Bin %f ", buf, 0x16u);
                  }

                  goto LABEL_42;
                }
                ++v30;
              }
              while (v27 != v30);
              v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
              v28 = v31;
              if (v27)
                continue;
              break;
            }
          }
          else
          {
            v31 = 0;
          }
LABEL_42:

          v7 = v59;
          if (v31 > -[NSArray count](self->_feedBackBinning, "count"))
          {
            -[NSArray lastObject](self->_feedBackPitch, "lastObject");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "floatValue");
            self->_enrollGuidancePitch = v42;
            sharedBluetoothSettingsLogComponent();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              v44 = self->_enrollGuidancePitch;
              *(_DWORD *)buf = 134217984;
              v67 = v44;
              _os_log_impl(&dword_1DB30C000, v43, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Calcuated new Pitch as lowest %f", buf, 0xCu);
            }

          }
          sharedBluetoothSettingsLogComponent();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = self->_candidateYaw;
            v47 = *(double *)((char *)&self->super.super.super.isa + v58);
            v48 = self->_enrollGuidancePitch;
            *(_DWORD *)buf = 134218752;
            v67 = v46;
            v68 = 2048;
            v69 = v47;
            v70 = 2048;
            *(double *)v71 = v24;
            *(_WORD *)&v71[8] = 2048;
            *(double *)v72 = v48;
            _os_log_impl(&dword_1DB30C000, v45, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Candidate %f  _currentYaw %f : evaluating Delta %f New Pitch %f ", buf, 0x2Au);
          }

          if (enrollGuidancePitch != self->_enrollGuidancePitch
            || !-[HPSSpatialProfileSoundHapticManager isEnrollGuidancePlaying](self->_soundHapticManager, "isEnrollGuidancePlaying"))
          {
            sharedBluetoothSettingsLogComponent();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = self->_enrollGuidancePitch;
              v51 = -[HPSSpatialProfileSoundHapticManager isEnrollGuidancePlaying](self->_soundHapticManager, "isEnrollGuidancePlaying");
              v52 = CFSTR("YES");
              *(_DWORD *)buf = 134218498;
              v67 = enrollGuidancePitch;
              if (v51)
                v52 = CFSTR("NO");
              v68 = 2048;
              v69 = v50;
              v70 = 2112;
              *(_QWORD *)v71 = v52;
              _os_log_impl(&dword_1DB30C000, v49, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Update Dynamic audio feedback pitch %f -> %f Restart Play %@", buf, 0x20u);
            }

            v53 = self->_enrollGuidancePitch;
            *(float *)&v53 = v53;
            -[HPSSpatialProfileSoundHapticManager setEnrollGuidancePitch:](self->_soundHapticManager, "setEnrollGuidancePitch:", v53);
            if (!-[HPSSpatialProfileSoundHapticManager isEnrollGuidancePlaying](self->_soundHapticManager, "isEnrollGuidancePlaying"))-[HPSSpatialProfileSoundHapticManager playEnrollGuidance:](self->_soundHapticManager, "playEnrollGuidance:", self->_currentStep);
          }
        }
        else
        {
          self->_enrollGuidancePitch = 0.5;
          LODWORD(v23) = 0.5;
          -[HPSSpatialProfileSoundHapticManager setEnrollGuidancePitch:](self->_soundHapticManager, "setEnrollGuidancePitch:", v23);
          sharedBluetoothSettingsLogComponent();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = self->_enrollGuidancePitch;
            *(_DWORD *)buf = 134218240;
            v67 = enrollGuidancePitch;
            v68 = 2048;
            v69 = v35;
            _os_log_impl(&dword_1DB30C000, v34, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Not tracking ear, reset Pitch + Pause Play .%f -> %f", buf, 0x16u);
          }

          -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer](self->_soundHapticManager, "pauseEnrollGuidancePlayer");
          self->_currentYaw = -100.0;
        }
      }

    }
  }
  v54 = self->_leftEarStatus;
  v55 = v54 < 1 || v54 == 3;
  if (!v55 || ((v56 = self->_rightEarStatus, v56 >= 1) ? (v57 = v56 == 3) : (v57 = 1), !v57))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HPSSpatialProfileEnrollmentController_triggerEnrollGuidanceTimer__block_invoke;
    block[3] = &unk_1EA29A770;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __67__HPSSpatialProfileEnrollmentController_triggerEnrollGuidanceTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_triggerEnrollGuidanceTimer, 0, 0, 0.5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1544);
  *(_QWORD *)(v3 + 1544) = v2;

}

- (void)stopEnrollGuidanceTimer
{
  NSObject *v3;
  NSTimer *enrollGuidanceTimer;
  NSTimer *v5;
  uint8_t v6[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Dynamic enrollment guidance Stopping Timer", v6, 2u);
  }

  enrollGuidanceTimer = self->_enrollGuidanceTimer;
  if (enrollGuidanceTimer)
  {
    -[NSTimer invalidate](enrollGuidanceTimer, "invalidate");
    v5 = self->_enrollGuidanceTimer;
    self->_enrollGuidanceTimer = 0;

  }
}

- (void)alertEarDistanceWarning:(int)a3
{
  NSObject *v5;
  double currentYaw;
  double candidateYaw;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];
  uint8_t buf[4];
  int v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    currentYaw = self->_currentYaw;
    candidateYaw = self->_candidateYaw;
    *(_DWORD *)buf = 67109632;
    v17 = a3;
    v18 = 2048;
    v19 = currentYaw;
    v20 = 2048;
    v21 = candidateYaw;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Error Message *** Ear distance detection warning shown to user %d Current yaw %f Candidate Yaw %f ", buf, 0x1Cu);
  }

  self->_earOcclusionDetectTracker = 0;
  self->_isEarOccluded = 0;
  -[HPSSpatialProfileEnrollmentController restartOcclusionWarnCoolDownTimer](self, "restartOcclusionWarnCoolDownTimer");
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  switch(a3)
  {
    case 5:
      -[HPSSpatialProfileEnrollmentController pauseEnrollment](self, "pauseEnrollment");
      v12 = v8;
      v9 = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_6;
      v10 = &v12;
      break;
    case 4:
      -[HPSSpatialProfileEnrollmentController pauseEnrollment](self, "pauseEnrollment");
      v13 = v8;
      v9 = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_4;
      v10 = &v13;
      break;
    case 3:
      -[HPSSpatialProfileEnrollmentController pauseEnrollment](self, "pauseEnrollment");
      v14 = v8;
      v9 = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_2;
      v10 = &v14;
      break;
    default:
      return;
  }
  v10[1] = 3221225472;
  v10[2] = (uint64_t)v9;
  v10[3] = (uint64_t)&unk_1EA29A770;
  v10[4] = (uint64_t)self;
  v11 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "pauseProgressPlayer");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "pauseEnrollGuidancePlayer");
}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;

  objc_msgSend(*(id *)(a1 + 32), "clearBoundingBox");
  objc_msgSend(*(id *)(a1 + 32), "forceBlur");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EAR_TOO_CLOSE_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C99840]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "BOOLValue");

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)v4)
    v10 = CFSTR("EAR_TOO_CLOSE_DETAIL_METRICS");
  else
    v10 = CFSTR("EAR_TOO_CLOSE_DETAIL_IMPERIAL");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetailText:", v11);

  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 1120);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_3;
  v15[3] = &unk_1EA29A770;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "triggerSoundHapticForEnrollmentState:completion:", 19, v15);
  objc_msgSend(*(id *)(a1 + 32), "showEarDistanceWarningContinueButton");

}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;

  objc_msgSend(*(id *)(a1 + 32), "clearBoundingBox");
  objc_msgSend(*(id *)(a1 + 32), "forceBlur");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EAR_TOO_FAR_TITLE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C99840]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "BOOLValue");

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)v4)
    v10 = CFSTR("EAR_TOO_CLOSE_DETAIL_METRICS");
  else
    v10 = CFSTR("EAR_TOO_CLOSE_DETAIL_IMPERIAL");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetailText:", v11);

  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 1120);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_5;
  v15[3] = &unk_1EA29A770;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "triggerSoundHapticForEnrollmentState:completion:", 19, v15);
  objc_msgSend(*(id *)(a1 + 32), "showEarDistanceWarningContinueButton");

}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;

  objc_msgSend(*(id *)(a1 + 32), "clearBoundingBox");
  objc_msgSend(*(id *)(a1 + 32), "forceBlur");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EAR_TOO_FAST_DETAIL"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDetailText:", v4);

  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1120);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_7;
  v8[3] = &unk_1EA29A770;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "triggerSoundHapticForEnrollmentState:completion:", 19, v8);
  objc_msgSend(*(id *)(a1 + 32), "showEarDistanceWarningContinueButton");

}

void __65__HPSSpatialProfileEnrollmentController_alertEarDistanceWarning___block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)continueEarDistanceWarning
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Too close ContinueButton Tapped", buf, 2u);
  }

  -[HPSSpatialProfileEnrollmentController resumeEnrollment](self, "resumeEnrollment");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HPSSpatialProfileEnrollmentController_continueEarDistanceWarning__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  self->_isEarOccluded = 0;
  self->_earOcclusionDetectTracker = 0;
  self->_earTooClose = 0;
  self->_earTooCloseDetectTracker = 0;
  self->_earTooFar = 0;
  self->_earTooFarDetectTracker = 0;
  -[HPSSpatialProfileEnrollmentController startEarDistanceWarnCoolDownTimer](self, "startEarDistanceWarnCoolDownTimer");
}

uint64_t __67__HPSSpatialProfileEnrollmentController_continueEarDistanceWarning__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancelBlur");
  objc_msgSend(*(id *)(a1 + 32), "hideEarDistanceWarningContinueButton");
  objc_msgSend(*(id *)(a1 + 32), "updateEarEnrollText");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "playProgressPlayer:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1228));
}

- (void)hideEarDistanceWarningContinueButton
{
  -[OBTrayButton setHidden:](self->_earDistanceWarnContinueButton, "setHidden:", 1);
  -[UIVisualEffectView setHidden:](self->_buttonTrayEffectView, "setHidden:", 1);
}

- (void)showEarDistanceWarningContinueButton
{
  -[OBTrayButton setHidden:](self->_earDistanceWarnContinueButton, "setHidden:", 0);
  -[UIVisualEffectView setHidden:](self->_buttonTrayEffectView, "setHidden:", 0);
}

- (void)startEarEnrollmentNudgeTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HPSSpatialProfileEnrollmentController_startEarEnrollmentNudgeTimer__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __69__HPSSpatialProfileEnrollmentController_startEarEnrollmentNudgeTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 1472))
  {
    objc_msgSend(*(id *)(a1 + 32), "stopEarEnrollmentNudgeTimer");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v2, sel_triggerEarEnrollmentNudgeTimer, 0, 1, 20.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1472);
  *(_QWORD *)(v4 + 1472) = v3;

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Spatial Profile:Checking ear enrollment nudge", v7, 2u);
  }

}

- (void)triggerEarEnrollmentNudgeTimer
{
  if (self->_rightEarStatus == 3 && self->_leftEarStatus == 3)
    -[HPSSpatialProfileEnrollmentController stopEarEnrollmentNudgeTimer](self, "stopEarEnrollmentNudgeTimer");
  else
    -[HPSSpatialProfileEnrollmentController nudgeEar](self, "nudgeEar");
}

- (void)nudgeEar
{
  NSObject *v3;
  CFTimeInterval v4;
  _BOOL4 enrollmentPaused;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  int *v10;
  int *v11;
  int leftEarStatus;
  _BOOL4 leftEarRearCaptured;
  _BOOL4 leftEarFrontCaptured;
  int rightEarStatus;
  _BOOL4 rightEarFrontCaptured;
  _BOOL4 rightEarRearCaptured;
  CFTimeInterval v18;
  double candidateYaw;
  double currentYaw;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  dispatch_time_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  dispatch_time_t v29;
  NSObject *v30;
  _QWORD *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD block[5];
  uint8_t buf[4];
  _BYTE v37[10];
  uint64_t v38;
  int v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  CFTimeInterval v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (CACurrentMediaTime() - self->_lastEarCaptureTime < 3.0 || self->_enrollmentPaused)
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      return;
    }
    v4 = CACurrentMediaTime() - self->_lastEarCaptureTime;
    enrollmentPaused = self->_enrollmentPaused;
    *(_DWORD *)buf = 134218240;
    *(CFTimeInterval *)v37 = v4;
    *(_WORD *)&v37[8] = 1024;
    LODWORD(v38) = enrollmentPaused;
    v6 = "Spatial Profile:got frame within last %f sec Enrollment Pause status: %d";
    v7 = v3;
    v8 = 18;
LABEL_5:
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    goto LABEL_6;
  }
  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
  v11 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    leftEarStatus = self->_leftEarStatus;
    leftEarRearCaptured = self->_leftEarRearCaptured;
    leftEarFrontCaptured = self->_leftEarFrontCaptured;
    rightEarStatus = self->_rightEarStatus;
    rightEarFrontCaptured = self->_rightEarFrontCaptured;
    rightEarRearCaptured = self->_rightEarRearCaptured;
    v18 = CACurrentMediaTime() - self->_lastEarCaptureTime;
    candidateYaw = self->_candidateYaw;
    currentYaw = self->_currentYaw;
    *(_DWORD *)buf = 67111168;
    *(_DWORD *)v37 = leftEarStatus;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = leftEarRearCaptured;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = leftEarFrontCaptured;
    HIWORD(v38) = 1024;
    v39 = rightEarStatus;
    v40 = 1024;
    v41 = rightEarFrontCaptured;
    v10 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
    v42 = 1024;
    v43 = rightEarRearCaptured;
    v11 = &OBJC_IVAR___HPSSpatialProfileSoundHapticManager__scanErrorPlayer;
    v44 = 2048;
    v45 = v18;
    v46 = 2048;
    v47 = candidateYaw;
    v48 = 2048;
    v49 = currentYaw;
    _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Trigger nudge Left ear Status %d : [ Rear captured : %d Fron Captured : %d ] right ear  Status %d: [ Rear captured : %d Fron Captured : %d ] Time From last detection %f Candidate Yaw %f Current Yaw %f", buf, 0x44u);
  }

  v21 = v11[386];
  v22 = *(double *)((char *)&self->super.super.super.isa + v21);
  if (v22 == -100.0 || (v23 = v10[387], v24 = *(double *)((char *)&self->super.super.super.isa + v23), v24 == -100.0))
  {
    sharedBluetoothSettingsLogComponent();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v26, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ignore Trigger nudge Left ear due to missing yaw", buf, 2u);
    }

    return;
  }
  if (vabdd_f64(v24, v22) <= 10.0)
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    v27 = *(uint64_t *)((char *)&self->super.super.super.isa + v23);
    v28 = *(uint64_t *)((char *)&self->super.super.super.isa + v21);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v37 = v27;
    *(_WORD *)&v37[8] = 2048;
    v38 = v28;
    v6 = "Spatial Profile: Ignore Trigger nudge Left ear due to lower threshold : Candiate %f - Current %f";
    v7 = v3;
    v8 = 22;
    goto LABEL_5;
  }
  if (self->_rightEarStatus != 2)
  {
    if (self->_leftEarStatus != 2)
      return;
    if (v24 > v22)
    {
LABEL_24:
      v29 = dispatch_time(0, 300000000);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_5;
      v33[3] = &unk_1EA29A770;
      v33[4] = self;
      v30 = MEMORY[0x1E0C80D38];
      v31 = v33;
LABEL_27:
      dispatch_after(v29, v30, v31);
      return;
    }
    goto LABEL_26;
  }
  v25 = dispatch_time(0, 300000000);
  if (v24 <= v22)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_3;
    v34[3] = &unk_1EA29A770;
    v34[4] = self;
    dispatch_after(v25, MEMORY[0x1E0C80D38], v34);
    if (self->_leftEarStatus != 2)
      return;
LABEL_26:
    v29 = dispatch_time(0, 300000000);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_7;
    v32[3] = &unk_1EA29A770;
    v32[4] = self;
    v30 = MEMORY[0x1E0C80D38];
    v31 = v32;
    goto LABEL_27;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_after(v25, MEMORY[0x1E0C80D38], block);
  if (self->_leftEarStatus == 2)
    goto LABEL_24;
}

uint64_t __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "forceBlur");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1128);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_2;
  v5[3] = &unk_1EA29A770;
  v5[4] = v2;
  return objc_msgSend(v3, "nudgeRight:", v5);
}

_DWORD *__49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_2(uint64_t a1)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[336] == 2 || result[340] == 2)
    return (_DWORD *)objc_msgSend(result, "cancelBlur");
  return result;
}

uint64_t __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "forceBlur");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1128);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_4;
  v5[3] = &unk_1EA29A770;
  v5[4] = v2;
  return objc_msgSend(v3, "nudgeLeft:", v5);
}

_DWORD *__49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_4(uint64_t a1)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[336] == 2 || result[340] == 2)
    return (_DWORD *)objc_msgSend(result, "cancelBlur");
  return result;
}

uint64_t __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "forceBlur");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1128);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_6;
  v5[3] = &unk_1EA29A770;
  v5[4] = v2;
  return objc_msgSend(v3, "nudgeLeft:", v5);
}

_DWORD *__49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_6(uint64_t a1)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[336] == 2 || result[340] == 2)
    return (_DWORD *)objc_msgSend(result, "cancelBlur");
  return result;
}

uint64_t __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "forceBlur");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1128);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_8;
  v5[3] = &unk_1EA29A770;
  v5[4] = v2;
  return objc_msgSend(v3, "nudgeRight:", v5);
}

_DWORD *__49__HPSSpatialProfileEnrollmentController_nudgeEar__block_invoke_8(uint64_t a1)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[336] == 2 || result[340] == 2)
    return (_DWORD *)objc_msgSend(result, "cancelBlur");
  return result;
}

- (void)stopEarEnrollmentNudgeTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HPSSpatialProfileEnrollmentController_stopEarEnrollmentNudgeTimer__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __68__HPSSpatialProfileEnrollmentController_stopEarEnrollmentNudgeTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1472), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1472);
  *(_QWORD *)(v2 + 1472) = 0;

}

- (void)cancelBlur
{
  -[HPSSpatialProfileUIPearlEnrollView setPauseBlur:](self->_enrollView, "setPauseBlur:", 1);
  -[HPSSpatialProfileUIPearlEnrollView setForceBlur:](self->_enrollView, "setForceBlur:", 0);
  -[HPSSpatialProfileUIPearlEnrollView setCameraBlurAmount:useShade:duration:completion:](self->_enrollView, "setCameraBlurAmount:useShade:duration:completion:", 0, 0, 0.0, 0.5);
}

- (void)forceBlur
{
  -[HPSSpatialProfileUIPearlEnrollView setPauseBlur:](self->_enrollView, "setPauseBlur:", 0);
  -[HPSSpatialProfileUIPearlEnrollView setForceBlur:](self->_enrollView, "setForceBlur:", 1);
  -[HPSSpatialProfileUIPearlEnrollView setCameraBlurAmount:useShade:duration:completion:](self->_enrollView, "setCameraBlurAmount:useShade:duration:completion:", 0, 0, 15.0, 0.5);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1608);
}

- (BOOL)pillsFilled
{
  return self->_pillsFilled;
}

- (void)setPillsFilled:(BOOL)a3
{
  self->_pillsFilled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->dismissalHandler, 0);
  objc_storeStrong((id *)&self->_feedBackPitch, 0);
  objc_storeStrong((id *)&self->_feedBackBinning, 0);
  objc_storeStrong((id *)&self->_pendingYaw, 0);
  objc_storeStrong((id *)&self->_enrollGuidanceTimer, 0);
  objc_storeStrong((id *)&self->_frameDetector, 0);
  objc_storeStrong((id *)&self->_frameContext, 0);
  objc_storeStrong((id *)&self->_earEnrollmentNudgeTimer, 0);
  objc_storeStrong((id *)&self->_earTooCloseWarnCoolDownTimer, 0);
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
  objc_storeStrong((id *)&self->_earPillContainer, 0);
  objc_storeStrong((id *)&self->_enrollView, 0);
  objc_storeStrong((id *)&self->_soundHapticManager, 0);
  objc_storeStrong((id *)&self->_welcomeImageView, 0);
  objc_storeStrong((id *)&self->_welcomeContentView, 0);
  objc_storeStrong((id *)&self->_spacerViewSecond, 0);
  objc_storeStrong((id *)&self->_spacerViewFirst, 0);
  objc_storeStrong((id *)&self->_buttonTrayEffectView, 0);
  objc_storeStrong((id *)&self->_earDistanceWarnContinueButton, 0);
  objc_storeStrong((id *)&self->_occlusionContinueButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_learnMoreView, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_scrollInnerStackView, 0);
  objc_storeStrong((id *)&self->_scrollInnerContentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_scrollContentView, 0);
  objc_storeStrong((id *)&self->_enrollContentView, 0);
}

void __56__HPSSpatialProfileEnrollmentController_startEnrollment__block_invoke_cold_1()
{
  __assert_rtn("-[HPSSpatialProfileEnrollmentController startEnrollment]_block_invoke", "HPSSpatialProfileEnrollmentController.m", 803, "started");
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.1()
{
  __assert_rtn("-[HPSSpatialProfileEnrollmentController didReceiveStateUpdateForSession:stateInfo:]", "HPSSpatialProfileEnrollmentController.m", 2026, "stateInfo[kHRTFStateInfoStateKey] && [stateInfo[kHRTFStateInfoStateKey] isKindOfClass:NSNumber.class]");
}

- (void)didReceiveStateUpdateForSession:stateInfo:.cold.3()
{
  __assert_rtn("-[HPSSpatialProfileEnrollmentController didReceiveStateUpdateForSession:stateInfo:]", "HPSSpatialProfileEnrollmentController.m", 2053, "[stateInfo[kHRTFStateInfoProgressKey] isKindOfClass:NSNumber.class]");
}

@end
