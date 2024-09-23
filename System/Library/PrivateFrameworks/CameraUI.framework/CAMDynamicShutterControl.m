@implementation CAMDynamicShutterControl

- (CAMDynamicShutterControl)initWithMetalDevice:(id)a3 commandQueue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  CAMDynamicShutterControl *v11;

  v6 = (void *)MEMORY[0x1E0DC3708];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cam_initialLayoutStyle");

  v11 = -[CAMDynamicShutterControl initWithMetalDevice:commandQueue:layoutStyle:](self, "initWithMetalDevice:commandQueue:layoutStyle:", v8, v7, v10);
  return v11;
}

- (CAMDynamicShutterControl)initWithMetalDevice:(id)a3 commandQueue:(id)a4 layoutStyle:(int64_t)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  CAMDynamicShutterControl *v12;
  CAMDynamicShutterControl *v13;
  id v14;
  uint64_t v15;
  CEKDisplayLinkTarget *displayLinkTarget;
  uint64_t v17;
  CADisplayLink *displayLink;
  CADisplayLink *v19;
  void *v20;
  CAMLiquidShutterRenderer *v21;
  CAMLiquidShutterRenderer *liquidShutterRenderer;
  CAMMetalView *v23;
  CAMMetalView *metalView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UIView *leftLineView;
  void *v31;
  uint64_t v32;
  UIView *rightLineView;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  double v38;
  __int128 v39;
  __int128 v40;
  double v41;
  __int128 v42;
  __int128 v43;
  double v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  UIView *centerOuterView;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  UIView *lockButtonOuterView;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  UIView *pauseResumeButtonOuterView;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  UIImageView *videoLockImageView;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  UIImageView *pauseImageView;
  void *v73;
  uint64_t v74;
  UIView *resumeCircleView;
  void *v76;
  uint64_t v77;
  UILabel *counterLabel;
  void *v79;
  void *v80;
  void *v81;
  CAMDynamicShutterGestureRecognizer *v82;
  CAMDynamicShutterGestureRecognizer *gestureRecognizer;
  void *v84;
  CAMFeedbackController *v85;
  CAMFeedbackController *feedbackController;
  CAMTrackingSpring *v87;
  CAMTrackingSpring *dragHandleOffsetSpring;
  CAMSpring *v89;
  CAMSpring *dragHandleWidthSpring;
  CAMSpring *v91;
  CAMSpring *dragHandleColorIsWhiteSpring;
  CAMSpring *v93;
  CAMSpring *dragHandleAlphaSpring;
  CAMSpring *v95;
  CAMSpring *innerShapeWidthSpring;
  CAMSpring *v97;
  CAMSpring *innerShapePowerSpring;
  CAMSpring *v99;
  CAMSpring *innerShapeColorIsRedSpring;
  CAMSpring *v101;
  CAMSpring *innerShapeAlphaSpring;
  CAMSpring *v103;
  CAMSpring *drawLockUISpring;
  CAMSpring *v105;
  CAMSpring *expandLockRingSpring;
  CAMSpring *v107;
  CAMSpring *drawPauseResumeUISpring;
  CAMSpring *v109;
  CAMSpring *pausedDuringVideoSpring;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  NSArray *springs;
  CAMSpring *v122;
  void *v123;
  CFIndex AppIntegerValue;
  double v125;
  CFIndex v126;
  double v127;
  CAMDynamicShutterControl *v128;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  id v136;
  double v137[5];
  __int128 v138;
  __int128 v139;
  double v140;
  _QWORD v141[4];
  id v142;
  id location;
  objc_super v144;
  _QWORD v145[14];

  v145[12] = *MEMORY[0x1E0C80C00];
  v136 = a3;
  v135 = a4;
  v144.receiver = self;
  v144.super_class = (Class)CAMDynamicShutterControl;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[CAMDynamicShutterControl initWithFrame:](&v144, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    *(_OWORD *)&v12->_settings.tapBehavior = 0u;
    *(_OWORD *)&v12->_settings.dragRightBehavior = 0u;
    *(_OWORD *)&v12->_settings.allowsZoom = 0u;
    *(_OWORD *)&v12->_settings.ringStyle = 0u;
    v12->_settings.idleColor = 0;
    v12->_privateSettings.allowPauseResume = 0;
    objc_initWeak(&location, v12);
    v14 = objc_alloc(MEMORY[0x1E0D0D048]);
    v141[0] = MEMORY[0x1E0C809B0];
    v141[1] = 3221225472;
    v141[2] = __73__CAMDynamicShutterControl_initWithMetalDevice_commandQueue_layoutStyle___block_invoke;
    v141[3] = &unk_1EA32F3B0;
    objc_copyWeak(&v142, &location);
    v15 = objc_msgSend(v14, "initWithHandler:", v141);
    displayLinkTarget = v13->__displayLinkTarget;
    v13->__displayLinkTarget = (CEKDisplayLinkTarget *)v15;

    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v13->__displayLinkTarget, sel_displayLinkDidFire_);
    v17 = objc_claimAutoreleasedReturnValue();
    displayLink = v13->__displayLink;
    v13->__displayLink = (CADisplayLink *)v17;

    v19 = v13->__displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v19, "addToRunLoop:forMode:", v20, *MEMORY[0x1E0C99860]);

    v21 = -[CAMLiquidShutterRenderer initWithDevice:commandQueue:pixelFormat:]([CAMLiquidShutterRenderer alloc], "initWithDevice:commandQueue:pixelFormat:", v136, v135, 80);
    liquidShutterRenderer = v13->__liquidShutterRenderer;
    v13->__liquidShutterRenderer = v21;

    v23 = -[CAMMetalView initWithFrame:]([CAMMetalView alloc], "initWithFrame:", v8, v9, v10, v11);
    metalView = v13->__metalView;
    v13->__metalView = v23;

    -[CAMMetalView setMetalViewDelegate:](v13->__metalView, "setMetalViewDelegate:", v13);
    -[CAMMetalView metalLayer](v13->__metalView, "metalLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDevice:", v136);

    -[CAMMetalView metalLayer](v13->__metalView, "metalLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPixelFormat:", 80);

    -[CAMMetalView metalLayer](v13->__metalView, "metalLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMLiquidShutterRenderer setMetalLayer:](v13->__liquidShutterRenderer, "setMetalLayer:", v27);

    -[CAMMetalView layer](v13->__metalView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setOpaque:", 0);

    -[CAMMetalView setUserInteractionEnabled:](v13->__metalView, "setUserInteractionEnabled:", 0);
    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__metalView);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    leftLineView = v13->__leftLineView;
    v13->__leftLineView = (UIView *)v29;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13->__leftLineView, "setBackgroundColor:", v31);

    -[UIView setUserInteractionEnabled:](v13->__leftLineView, "setUserInteractionEnabled:", 0);
    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__leftLineView);
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    rightLineView = v13->__rightLineView;
    v13->__rightLineView = (UIView *)v32;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13->__rightLineView, "setBackgroundColor:", v34);

    -[UIView setAlpha:](v13->__rightLineView, "setAlpha:", 0.5);
    -[UIView setUserInteractionEnabled:](v13->__rightLineView, "setUserInteractionEnabled:", 0);
    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__rightLineView);
    v35 = (void *)objc_opt_class();
    if (v35)
    {
      objc_msgSend(v35, "shutterButtonSpecForLayoutStyle:", a5);
    }
    else
    {
      v140 = 0.0;
      v138 = 0u;
      v139 = 0u;
    }
    v36 = v138;
    v37 = v139;
    v13->__shutterButtonSpec.interRingSpacing = v140;
    *(_OWORD *)&v13->__shutterButtonSpec.outerRingDiameter = v36;
    *(_OWORD *)&v13->__shutterButtonSpec.stopSquareSideLength = v37;
    v38 = CAMPixelWidthForView(v13);
    CAMShutterButtonSpecMake((double *)&v138, 55.0, 3.0 - v38, 0.0, 0.0, 2.0);
    v39 = v138;
    v40 = v139;
    v13->__lockButtonActiveSpec.interRingSpacing = v140;
    *(_OWORD *)&v13->__lockButtonActiveSpec.outerRingDiameter = v39;
    *(_OWORD *)&v13->__lockButtonActiveSpec.stopSquareSideLength = v40;
    v41 = CAMPixelWidthForView(v13);
    CAMShutterButtonSpecMake((double *)&v138, 40.0, v41 + 1.0, 0.0, 0.0, 2.0);
    v42 = v138;
    v43 = v139;
    v13->__lockButtonInactiveSpec.interRingSpacing = v140;
    *(_OWORD *)&v13->__lockButtonInactiveSpec.outerRingDiameter = v42;
    *(_OWORD *)&v13->__lockButtonInactiveSpec.stopSquareSideLength = v43;
    v44 = CAMPixelWidthForView(v13);
    CAMShutterButtonSpecMake((double *)&v138, 55.0, 3.0 - v44, 0.0, 0.0, 2.0);
    v45 = v138;
    v46 = v139;
    v13->__pauseResumeButtonSpec.interRingSpacing = v140;
    *(_OWORD *)&v13->__pauseResumeButtonSpec.outerRingDiameter = v45;
    *(_OWORD *)&v13->__pauseResumeButtonSpec.stopSquareSideLength = v46;
    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    centerOuterView = v13->__centerOuterView;
    v13->__centerOuterView = (UIView *)v47;

    -[UIView setUserInteractionEnabled:](v13->__centerOuterView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v50 = objc_msgSend(v49, "CGColor");
    -[UIView layer](v13->__centerOuterView, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setBorderColor:", v50);

    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__centerOuterView);
    v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    lockButtonOuterView = v13->__lockButtonOuterView;
    v13->__lockButtonOuterView = (UIView *)v52;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13->__lockButtonOuterView, "setBackgroundColor:", v54);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v56 = objc_msgSend(v55, "CGColor");
    -[UIView layer](v13->__lockButtonOuterView, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setBorderColor:", v56);

    -[UIView setUserInteractionEnabled:](v13->__lockButtonOuterView, "setUserInteractionEnabled:", 0);
    -[UIView setAlpha:](v13->__lockButtonOuterView, "setAlpha:", 0.0);
    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__lockButtonOuterView);
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    pauseResumeButtonOuterView = v13->__pauseResumeButtonOuterView;
    v13->__pauseResumeButtonOuterView = (UIView *)v58;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13->__pauseResumeButtonOuterView, "setBackgroundColor:", v60);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v62 = objc_msgSend(v61, "CGColor");
    -[UIView layer](v13->__pauseResumeButtonOuterView, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setBorderColor:", v62);

    -[UIView setUserInteractionEnabled:](v13->__pauseResumeButtonOuterView, "setUserInteractionEnabled:", 0);
    -[UIView setAlpha:](v13->__pauseResumeButtonOuterView, "setAlpha:", 0.0);
    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__pauseResumeButtonOuterView);
    v64 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "systemImageNamed:withConfiguration:", CFSTR("lock.fill"), v65);
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v134);
    videoLockImageView = v13->__videoLockImageView;
    v13->__videoLockImageView = (UIImageView *)v66;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v13->__videoLockImageView, "setTintColor:", v68);

    -[UIImageView setAlpha:](v13->__videoLockImageView, "setAlpha:", 0.0);
    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__videoLockImageView);
    v69 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "systemImageNamed:withConfiguration:", CFSTR("pause.fill"), v70);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v133);
    pauseImageView = v13->__pauseImageView;
    v13->__pauseImageView = (UIImageView *)v71;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v13->__pauseImageView, "setTintColor:", v73);

    -[UIImageView setAlpha:](v13->__pauseImageView, "setAlpha:", 0.0);
    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__pauseImageView);
    v74 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    resumeCircleView = v13->__resumeCircleView;
    v13->__resumeCircleView = (UIView *)v74;

    CAMRedColor();
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13->__resumeCircleView, "setBackgroundColor:", v76);

    -[UIView setUserInteractionEnabled:](v13->__resumeCircleView, "setUserInteractionEnabled:", 0);
    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__resumeCircleView);
    v77 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
    counterLabel = v13->__counterLabel;
    v13->__counterLabel = (UILabel *)v77;

    -[UILabel setUserInteractionEnabled:](v13->__counterLabel, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13->__counterLabel, "setTextColor:", v79);

    -[UILabel setTextAlignment:](v13->__counterLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v13->__counterLabel, "setBackgroundColor:", v80);

    +[CAMFont cameraMonospacedFontOfSize:](CAMFont, "cameraMonospacedFontOfSize:", 20.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13->__counterLabel, "setFont:", v81);

    -[UILabel setAlpha:](v13->__counterLabel, "setAlpha:", 0.0);
    -[CAMDynamicShutterControl _updateCounterLabelText](v13, "_updateCounterLabelText");
    -[CAMDynamicShutterControl addSubview:](v13, "addSubview:", v13->__counterLabel);
    -[CAMDynamicShutterControl bringSubviewToFront:](v13, "bringSubviewToFront:", v13->__metalView);
    v82 = -[CAMDynamicShutterGestureRecognizer initWithTarget:action:]([CAMDynamicShutterGestureRecognizer alloc], "initWithTarget:action:", v13, sel__handlePress_);
    gestureRecognizer = v13->__gestureRecognizer;
    v13->__gestureRecognizer = v82;

    -[CAMDynamicShutterGestureRecognizer setMinimumPressDuration:](v13->__gestureRecognizer, "setMinimumPressDuration:", 0.0);
    -[CAMDynamicShutterGestureRecognizer setCancelsTouchesInView:](v13->__gestureRecognizer, "setCancelsTouchesInView:", 0);
    -[CAMDynamicShutterGestureRecognizer setDelaysTouchesEnded:](v13->__gestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[CAMDynamicShutterGestureRecognizer setDelegate:](v13->__gestureRecognizer, "setDelegate:", v13);
    -[CAMDynamicShutterControl addGestureRecognizer:](v13, "addGestureRecognizer:", v13->__gestureRecognizer);
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v69) = objc_msgSend(v84, "allowHaptics");

    if ((_DWORD)v69)
    {
      v85 = objc_alloc_init(CAMFeedbackController);
      feedbackController = v13->__feedbackController;
      v13->__feedbackController = v85;

    }
    v13->__touchSequencePhase = 0;
    v87 = -[CAMTrackingSpring initWithTension:friction:epsilon:]([CAMTrackingSpring alloc], "initWithTension:friction:epsilon:", 240.0, 30.0, CAMPixelWidthForView(v13));
    dragHandleOffsetSpring = v13->__dragHandleOffsetSpring;
    v13->__dragHandleOffsetSpring = v87;

    v89 = -[CAMSpring initWithTension:friction:epsilon:]([CAMSpring alloc], "initWithTension:friction:epsilon:", 240.0, 30.0, CAMPixelWidthForView(v13));
    dragHandleWidthSpring = v13->__dragHandleWidthSpring;
    v13->__dragHandleWidthSpring = v89;

    v91 = -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:]([CAMSpring alloc], "initWithTension:friction:epsilon:boundedBetween:and:", 240.0, 30.0, 0.001, 0.0, 1.0);
    dragHandleColorIsWhiteSpring = v13->__dragHandleColorIsWhiteSpring;
    v13->__dragHandleColorIsWhiteSpring = v91;

    v93 = -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:]([CAMSpring alloc], "initWithTension:friction:epsilon:boundedBetween:and:", 400.0, 40.0, 0.001, 0.0, 1.0);
    dragHandleAlphaSpring = v13->__dragHandleAlphaSpring;
    v13->__dragHandleAlphaSpring = v93;

    v95 = -[CAMSpring initWithTension:friction:epsilon:]([CAMSpring alloc], "initWithTension:friction:epsilon:", 240.0, 30.0, CAMPixelWidthForView(v13));
    innerShapeWidthSpring = v13->__innerShapeWidthSpring;
    v13->__innerShapeWidthSpring = v95;

    v97 = -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:]([CAMSpring alloc], "initWithTension:friction:epsilon:boundedBetween:and:", 240.0, 30.0, 0.001, 2.0, 6.0);
    innerShapePowerSpring = v13->__innerShapePowerSpring;
    v13->__innerShapePowerSpring = v97;

    v99 = -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:]([CAMSpring alloc], "initWithTension:friction:epsilon:boundedBetween:and:", 400.0, 40.0, 0.001, 0.0, 1.0);
    innerShapeColorIsRedSpring = v13->__innerShapeColorIsRedSpring;
    v13->__innerShapeColorIsRedSpring = v99;

    v101 = -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:]([CAMSpring alloc], "initWithTension:friction:epsilon:boundedBetween:and:", 400.0, 40.0, 0.001, 0.0, 1.0);
    innerShapeAlphaSpring = v13->__innerShapeAlphaSpring;
    v13->__innerShapeAlphaSpring = v101;

    v103 = -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:]([CAMSpring alloc], "initWithTension:friction:epsilon:boundedBetween:and:", 400.0, 40.0, 0.001, 0.0, 1.0);
    drawLockUISpring = v13->__drawLockUISpring;
    v13->__drawLockUISpring = v103;

    v105 = -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:]([CAMSpring alloc], "initWithTension:friction:epsilon:boundedBetween:and:", 400.0, 40.0, 0.001, 0.0, 1.0);
    expandLockRingSpring = v13->__expandLockRingSpring;
    v13->__expandLockRingSpring = v105;

    v107 = -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:]([CAMSpring alloc], "initWithTension:friction:epsilon:boundedBetween:and:", 400.0, 40.0, 0.001, 0.0, 1.0);
    drawPauseResumeUISpring = v13->__drawPauseResumeUISpring;
    v13->__drawPauseResumeUISpring = v107;

    v109 = -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:]([CAMSpring alloc], "initWithTension:friction:epsilon:boundedBetween:and:", 400.0, 40.0, 0.001, 0.0, 1.0);
    pausedDuringVideoSpring = v13->__pausedDuringVideoSpring;
    v13->__pausedDuringVideoSpring = v109;

    -[CAMDynamicShutterControl _dragHandleOffsetSpring](v13, "_dragHandleOffsetSpring");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v145[0] = v132;
    -[CAMDynamicShutterControl _dragHandleWidthSpring](v13, "_dragHandleWidthSpring");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v145[1] = v131;
    -[CAMDynamicShutterControl _dragHandleColorIsWhiteSpring](v13, "_dragHandleColorIsWhiteSpring");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v145[2] = v130;
    -[CAMDynamicShutterControl _dragHandleAlphaSpring](v13, "_dragHandleAlphaSpring");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v145[3] = v111;
    -[CAMDynamicShutterControl _innerShapeWidthSpring](v13, "_innerShapeWidthSpring");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v145[4] = v112;
    -[CAMDynamicShutterControl _innerShapePowerSpring](v13, "_innerShapePowerSpring");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v145[5] = v113;
    -[CAMDynamicShutterControl _innerShapeAlphaSpring](v13, "_innerShapeAlphaSpring");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v145[6] = v114;
    -[CAMDynamicShutterControl _innerShapeColorIsRedSpring](v13, "_innerShapeColorIsRedSpring");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v145[7] = v115;
    -[CAMDynamicShutterControl _drawLockUISpring](v13, "_drawLockUISpring");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v145[8] = v116;
    -[CAMDynamicShutterControl _expandLockRingSpring](v13, "_expandLockRingSpring");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v145[9] = v117;
    -[CAMDynamicShutterControl _drawPauseResumeUISpring](v13, "_drawPauseResumeUISpring");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v145[10] = v118;
    -[CAMDynamicShutterControl _pausedDuringVideoSpring](v13, "_pausedDuringVideoSpring");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v145[11] = v119;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 12);
    v120 = objc_claimAutoreleasedReturnValue();
    springs = v13->__springs;
    v13->__springs = (NSArray *)v120;

    -[CAMSpring resetToValue:](v13->__dragHandleWidthSpring, "resetToValue:", 45.0);
    -[CAMSpring resetToValue:](v13->__dragHandleAlphaSpring, "resetToValue:", 1.0);
    v122 = v13->__innerShapeWidthSpring;
    -[CAMDynamicShutterControl _shutterButtonSpec](v13, "_shutterButtonSpec");
    -[CAMSpring resetToValue:](v122, "resetToValue:", CAMShutterButtonSpecGetInnerCircleDiameter(v137));
    -[CAMSpring resetToValue:](v13->__innerShapePowerSpring, "resetToValue:", 2.0);
    -[CAMSpring resetToValue:](v13->__innerShapeAlphaSpring, "resetToValue:", 1.0);
    v13->__longPressVideoDuration = 0.55;
    v13->__externalLongPressVideoDuration = 0.55;
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v113) = objc_msgSend(v123, "isTrueVideoSupported");

    if ((_DWORD)v113)
    {
      AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CAMLongPressVideoDurationMS"), CFSTR("com.apple.camera"), 0);
      v125 = (double)AppIntegerValue / 1000.0;
      if (AppIntegerValue <= 0)
        v125 = 0.416;
      v13->__longPressVideoDuration = v125;
      v126 = CFPreferencesGetAppIntegerValue(CFSTR("CAMExternalLongPressVideoDurationMS"), CFSTR("com.apple.camera"), 0);
      v127 = (double)v126 / 1000.0;
      if (v126 <= 0)
        v127 = 0.416;
      v13->__externalLongPressVideoDuration = v127;
    }
    v128 = v13;

    objc_destroyWeak(&v142);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __73__CAMDynamicShutterControl_initWithMetalDevice_commandQueue_layoutStyle___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id WeakRetained;

  objc_msgSend(a2, "targetTimestamp");
  v4 = v3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateForTargetTimestamp:", v4);

}

- (void)dealloc
{
  CADisplayLink *displayLink;
  objc_super v4;

  -[CADisplayLink invalidate](self->__displayLink, "invalidate");
  displayLink = self->__displayLink;
  self->__displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMDynamicShutterControl;
  -[CAMDynamicShutterControl dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $8F57A2112632B2254562D71809B68519 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToTopLevelSuperview = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidShortPress = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanStartOnTouchDown = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldBeginGesture = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToGesturesDidBegin = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToGesturesDidEnd = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToGesturesDidCancel = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidStart = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidStartWithGesture = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidStartZoomGesture = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeRelativeZoomProgress = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidStop = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPressLockButton = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPressPauseResumeButton = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPresentCounter = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidDismissCounter = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToTouchAttemptedWhileDisabled = objc_opt_respondsToSelector() & 1;
  }

}

- (BOOL)_canDragCounter
{
  uint64_t v4;

  -[CAMDynamicShutterControl settings](self, "settings");
  if (v4 == 1)
    return !-[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", -[CAMDynamicShutterControl _shutterState](self, "_shutterState"));
  else
    return 0;
}

- (BOOL)_canDragStartStop
{
  uint64_t v4;

  -[CAMDynamicShutterControl settings](self, "settings");
  return v4 == 1 && -[CAMDynamicShutterControl _shutterState](self, "_shutterState") != 1;
}

- (BOOL)_isStartStopShutterState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 4;
}

- (BOOL)_isTrackingHandleState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 4;
}

- (BOOL)_isValidChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  BOOL result;
  BOOL v5;

  if (!a4)
    return 1;
  result = 0;
  switch(a3)
  {
    case 0:
      return 1;
    case 2:
    case 4:
      v5 = a4 == 3;
      goto LABEL_8;
    case 5:
      v5 = a4 == 4 || (a4 & 0xFFFFFFFFFFFFFFFELL) == 2;
LABEL_8:
      result = v5;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_shouldStartTrackingHandle
{
  char v3;

  v3 = -[CAMDynamicShutterControl _isTrackingHandleState:](self, "_isTrackingHandleState:", -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState"));
  return (-[CAMDynamicShutterControl _shutterState](self, "_shutterState") != 2) & ~v3;
}

- (void)_resetShutterState
{
  void *v3;

  if (self->__shutterState)
  {
    self->__shutterState = 0;
    if (self->_delegateFlags.respondsToGesturesDidCancel)
    {
      -[CAMDynamicShutterControl delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dynamicShutterControlGesturesDidCancel:", self);

    }
    -[CAMDynamicShutterControl _updateSpringTargetsAnimated:](self, "_updateSpringTargetsAnimated:", 0);
    -[CAMDynamicShutterControl _updateOuterAndInnerLayersAnimated:](self, "_updateOuterAndInnerLayersAnimated:", 0);
  }
}

- (void)_setShutterState:(int64_t)a3
{
  int64_t shutterState;
  int64_t v6;
  NSObject *v7;
  NSObject *v8;
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
  int64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t v29[16];

  shutterState = self->__shutterState;
  if (shutterState != a3)
  {
    if (-[CAMDynamicShutterControl _isValidChangeFromState:toState:](self, "_isValidChangeFromState:toState:", shutterState, a3))
    {
      v6 = self->__shutterState;
      self->__shutterState = a3;
      switch(a3)
      {
        case 0:
          if (-[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", v6))
          {
            if (self->_delegateFlags.respondsToDidStop)
            {
              -[CAMDynamicShutterControl delegate](self, "delegate");
              v7 = objc_claimAutoreleasedReturnValue();
              -[NSObject dynamicShutterControlDidStop:](v7, "dynamicShutterControlDidStop:", self);
              goto LABEL_21;
            }
          }
          else if (v6 == 1 && self->_delegateFlags.respondsToDidDismissCounter)
          {
            -[CAMDynamicShutterControl delegate](self, "delegate");
            v7 = objc_claimAutoreleasedReturnValue();
            -[NSObject dynamicShutterControlDidDismissCounter:](v7, "dynamicShutterControlDidDismissCounter:", self);
            goto LABEL_21;
          }
          goto LABEL_22;
        case 1:
          if (v6)
          {
            if (-[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", v6))
            {
              v7 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
                -[CAMDynamicShutterControl _setShutterState:].cold.1(v7, v9, v10, v11, v12, v13, v14, v15);
              goto LABEL_21;
            }
          }
          else if (self->_delegateFlags.respondsToDidPresentCounter)
          {
            -[CAMDynamicShutterControl delegate](self, "delegate");
            v7 = objc_claimAutoreleasedReturnValue();
            -[NSObject dynamicShutterControlDidPresentCounter:](v7, "dynamicShutterControlDidPresentCounter:", self);
            goto LABEL_21;
          }
          goto LABEL_22;
        case 2:
        case 3:
        case 5:
          goto LABEL_15;
        case 4:
          -[CAMDynamicShutterControl _innerShapeWidthSpring](self, "_innerShapeWidthSpring");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setTension:", 100.0);

          -[CAMDynamicShutterControl _innerShapeWidthSpring](self, "_innerShapeWidthSpring");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setFriction:", 10.0);

          -[CAMDynamicShutterControl _innerShapeWidthSpring](self, "_innerShapeWidthSpring");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setVelocity:", 500.0);

          -[CAMDynamicShutterControl _feedbackController](self, "_feedbackController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "performDiscreteFeedback:", 0);

LABEL_15:
          if (v6 == 1)
          {
            v7 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
              -[CAMDynamicShutterControl _setShutterState:].cold.2(v7, v22, v23, v24, v25, v26, v27, v28);
            goto LABEL_21;
          }
          if (v6)
            goto LABEL_22;
          if (self->_delegateFlags.respondsToDidStartWithGesture)
          {
            v20 = -[CAMDynamicShutterControl _startGestureForShutterState:](self, "_startGestureForShutterState:", a3);
            -[CAMDynamicShutterControl delegate](self, "delegate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "dynamicShutterControlDidStart:withGesture:", self, v20);

            goto LABEL_22;
          }
          if (self->_delegateFlags.respondsToDidStart)
          {
            -[CAMDynamicShutterControl delegate](self, "delegate");
            v7 = objc_claimAutoreleasedReturnValue();
            -[NSObject dynamicShutterControlDidStart:](v7, "dynamicShutterControlDidStart:", self);
LABEL_21:

          }
LABEL_22:
          -[CAMDynamicShutterControl _updateSpringTargetsAnimated:](self, "_updateSpringTargetsAnimated:", 0);
          -[CAMDynamicShutterControl _updateOuterAndInnerLayersAnimated:](self, "_updateOuterAndInnerLayersAnimated:", 0);
          break;
        default:
          goto LABEL_22;
      }
    }
    else
    {
      v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: Invalid state change", v29, 2u);
      }

    }
  }
}

- (int64_t)_startGestureForShutterState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return 0;
  else
    return qword_1DB9A7E18[a3 - 2];
}

- (void)_setDragHandleState:(int64_t)a3
{
  -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", a3, 0);
}

- (void)_setDragHandleState:(int64_t)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->__dragHandleState != a3)
  {
    self->__dragHandleState = a3;
    -[CAMDynamicShutterControl _updateSpringTargetsAnimated:](self, "_updateSpringTargetsAnimated:", a4);
    if (!a4)
    {
      -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "converge");

      -[CAMDynamicShutterControl _dragHandleWidthSpring](self, "_dragHandleWidthSpring");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "converge");

      -[CAMDynamicShutterControl _dragHandleColorIsWhiteSpring](self, "_dragHandleColorIsWhiteSpring");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "converge");

      -[CAMDynamicShutterControl _dragHandleAlphaSpring](self, "_dragHandleAlphaSpring");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "converge");

    }
  }
}

- (void)_setInnerShapeState:(int64_t)a3
{
  -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", a3, 0);
}

- (void)_setInnerShapeState:(int64_t)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->__innerShapeState != a3)
  {
    self->__innerShapeState = a3;
    -[CAMDynamicShutterControl _updateSpringTargetsAnimated:](self, "_updateSpringTargetsAnimated:", a4);
    if (!a4)
    {
      -[CAMDynamicShutterControl _innerShapeWidthSpring](self, "_innerShapeWidthSpring");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "converge");

      -[CAMDynamicShutterControl _innerShapePowerSpring](self, "_innerShapePowerSpring");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "converge");

      -[CAMDynamicShutterControl _innerShapeColorIsRedSpring](self, "_innerShapeColorIsRedSpring");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "converge");

      -[CAMDynamicShutterControl _innerShapeAlphaSpring](self, "_innerShapeAlphaSpring");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "converge");

    }
  }
}

- (void)_setExternalShutterPressed:(BOOL)a3
{
  if (self->__externalShutterPressed != a3)
  {
    self->__externalShutterPressed = a3;
    -[CAMDynamicShutterControl _updateSpringTargetsAnimated:](self, "_updateSpringTargetsAnimated:", 0);
  }
}

- (void)cancelZoom
{
  -[CAMDynamicShutterControl setZooming:](self, "setZooming:", 0);
  -[CAMDynamicShutterControl set_didCancelZoomForCurrentGesture:](self, "set_didCancelZoomForCurrentGesture:", 1);
}

- (void)resetAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  __CFString *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v7 = v6;
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: ResetAnimated: %{public}@", buf, 0xCu);

  }
  if (-[CAMDynamicShutterControl _isActiveTouchSequencePhase:](self, "_isActiveTouchSequencePhase:", -[CAMDynamicShutterControl _touchSequencePhase](self, "_touchSequencePhase")))
  {
    -[CAMDynamicShutterControl _cancelTouchSequenceForReset:](self, "_cancelTouchSequenceForReset:", 1);
  }
  -[CAMDynamicShutterControl _setExternalShutterPressed:](self, "_setExternalShutterPressed:", 0);
  -[CAMDynamicShutterControl _setExternalLockButtonPressed:](self, "_setExternalLockButtonPressed:", 0);
  -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", 0, v3);
  -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", 0, v3);
  -[CAMDynamicShutterControl _resetShutterState](self, "_resetShutterState");
  -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeSecondaryTargetAnimated:", v3);

  if (!v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[CAMDynamicShutterControl _springs](self, "_springs", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "converge");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  -[CAMDynamicShutterControl _displayLink](self, "_displayLink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPaused:", 0);

}

- (BOOL)isShutterStateDefault
{
  return -[CAMDynamicShutterControl _shutterState](self, "_shutterState") == 0;
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMDynamicShutterControl setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMDynamicShutterControl setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __52__CAMDynamicShutterControl_setOrientation_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.3, 0.0);
    }
  }
}

uint64_t __52__CAMDynamicShutterControl_setOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (CGRect)frameForAlignmentRect:(CGRect)a3 availableWidth:(double)a4
{
  double v5;
  double v6;
  double v7;
  CGRect result;

  v5 = a3.origin.y + -16.0;
  v6 = a3.size.height + 16.0 + 16.0;
  v7 = 0.0;
  result.size.height = v6;
  result.size.width = a4;
  result.origin.y = v5;
  result.origin.x = v7;
  return result;
}

- (void)setLockButtonCenterRightInset:(double)a3
{
  if (self->_lockButtonCenterRightInset != a3)
  {
    self->_lockButtonCenterRightInset = a3;
    -[CAMDynamicShutterControl _updateSpringTargetsAnimated:](self, "_updateSpringTargetsAnimated:", 0);
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  v3 = v5;
  v4 = v6;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)_updateCenterButton
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
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;

  -[CAMDynamicShutterControl _pausedDuringVideoSpring](self, "_pausedDuringVideoSpring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");

  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  -[CAMDynamicShutterControl _pauseResumeButtonSpec](self, "_pauseResumeButtonSpec");
  CEKInterpolateClamped();
  v5 = v4;
  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  -[CAMDynamicShutterControl _pauseResumeButtonSpec](self, "_pauseResumeButtonSpec");
  CEKInterpolateClamped();
  v7 = v6;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  v9 = v8;
  v11 = v10;
  -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v9, v11);

  -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, v5, v5);

  v14 = v5 * 0.5;
  -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerRadius:", v5 * 0.5);

  -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBorderWidth:", v7);

  -[CAMDynamicShutterControl _centerOuterImageView](self, "_centerOuterImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", v9, v11);

  -[CAMDynamicShutterControl _centerOuterImageView](self, "_centerOuterImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, v5, v5);

  -[CAMDynamicShutterControl _centerTimelapseOuterView](self, "_centerTimelapseOuterView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCenter:", v9, v11);

  -[CAMDynamicShutterControl _centerTimelapseOuterView](self, "_centerTimelapseOuterView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBounds:", 0.0, 0.0, v5, v5);

  -[CAMDynamicShutterControl _centerOuterLegibilityView](self, "_centerOuterLegibilityView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCenter:", v9, v11);

  UIRectInset();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[CAMDynamicShutterControl _centerOuterLegibilityView](self, "_centerOuterLegibilityView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setBounds:", v25, v27, v29, v31);

  -[CAMDynamicShutterControl _centerOuterLegibilityView](self, "_centerOuterLegibilityView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setCornerRadius:", v14 + 1.0);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CAMDynamicShutterControl;
  -[CAMDynamicShutterControl layoutSubviews](&v30, sel_layoutSubviews);
  -[CAMDynamicShutterControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMDynamicShutterControl _metalView](self, "_metalView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CAMDynamicShutterControl _lockButtonCenter](self, "_lockButtonCenter");
  v13 = v12;
  v15 = v14;
  -[CAMDynamicShutterControl _lockButtonOuterView](self, "_lockButtonOuterView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCenter:", v13, v15);

  -[CAMDynamicShutterControl _lockButtonOuterLegibilityView](self, "_lockButtonOuterLegibilityView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenter:", v13, v15);

  -[CAMDynamicShutterControl _videoLockImageView](self, "_videoLockImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCenter:", v13, v15);

  -[CAMDynamicShutterControl _updateLockGlyphTransformAndAlpha](self, "_updateLockGlyphTransformAndAlpha");
  -[CAMDynamicShutterControl _updateViewsFromCurrentState](self, "_updateViewsFromCurrentState");
  -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[CAMDynamicShutterControl _counterLabel](self, "_counterLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  -[CAMDynamicShutterControl _counterLabel](self, "_counterLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v29, -[CAMDynamicShutterControl orientation](self, "orientation"), 0);

}

- (BOOL)_isPastStartStopDragThreshold
{
  void *v2;
  double v3;
  BOOL v4;

  -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3 >= 60.0;

  return v4;
}

- (BOOL)_isPastCounterDragThreshold
{
  void *v2;
  double v3;
  BOOL v4;

  -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3 <= -60.0;

  return v4;
}

- (double)_dragHandleXPosition
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  v4 = v3;
  -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v7 = v4 + v6;

  return v7;
}

+ (CAMShutterButtonSpec)shutterButtonSpecForLayoutStyle:(SEL)a3
{
  void *v6;
  double v7;
  double v8;
  CAMShutterButtonSpec *result;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  _OWORD v17[2];
  double v18;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  retstr->interRingSpacing = 0.0;
  *(_OWORD *)&retstr->outerRingDiameter = 0u;
  *(_OWORD *)&retstr->stopSquareSideLength = 0u;
  if ((unint64_t)(a4 - 1) >= 3)
  {
    v10 = 1.0 / v8;
    if (a4)
    {
      if (a4 != 4)
        return result;
      v11 = 4.0 - v10;
      v12 = v10 + 2.0;
      v13 = 72.0;
      v14 = 25.0;
      v15 = 5.0;
    }
    else
    {
      v11 = 4.0 - v10;
      v13 = 66.0;
      v14 = 28.0;
      v15 = 5.0;
      v12 = 2.0;
    }
    CAMShutterButtonSpecMake((double *)v17, v13, v11, v14, v15, v12);
  }
  else
  {
    CAMShutterButtonSpecForLayoutStyle(a4, (uint64_t)v17);
  }
  v16 = v17[1];
  *(_OWORD *)&retstr->outerRingDiameter = v17[0];
  *(_OWORD *)&retstr->stopSquareSideLength = v16;
  retstr->interRingSpacing = v18;
  return result;
}

- (CGPoint)_shutterButtonCenter
{
  double v2;
  double v3;
  CGPoint result;

  -[CAMDynamicShutterControl bounds](self, "bounds");
  UIRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)_shutterButtonFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_isPointWithinShutterButtonTouchArea:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[CAMDynamicShutterControl _shutterButtonFrame](self, "_shutterButtonFrame");
  UIRectInset();
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (double)_absoluteShutterToBottomDistance
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[CAMDynamicShutterControl superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_delegateFlags.respondsToTopLevelSuperview)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dynamicShutterControlTopLevelSuperview:", self);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_msgSend(v3, "safeAreaInsets");
  v7 = v6;
  objc_msgSend(v3, "bounds");
  v9 = v8;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  -[CAMDynamicShutterControl convertPoint:toView:](self, "convertPoint:toView:", v3);
  v11 = v9 - v10 - v7;

  return v11;
}

- (CGPoint)_lockButtonCenter
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CAMDynamicShutterControl bounds](self, "bounds");
  v4 = v3;
  -[CAMDynamicShutterControl lockButtonCenterRightInset](self, "lockButtonCenterRightInset");
  v6 = v4 - v5;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  v8 = v6;
  result.y = v7;
  result.x = v8;
  return result;
}

- (CGRect)_lockButtonFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CAMDynamicShutterControl _lockButtonActiveSpec](self, "_lockButtonActiveSpec");
  -[CAMDynamicShutterControl _lockButtonActiveSpec](self, "_lockButtonActiveSpec");
  -[CAMDynamicShutterControl _lockButtonCenter](self, "_lockButtonCenter");
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_isPointWithinLockRingTouchArea:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[CAMDynamicShutterControl _lockButtonFrame](self, "_lockButtonFrame");
  UIRectInset();
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (BOOL)_isHandleWithinLockRing
{
  double v3;
  double v4;

  -[CAMDynamicShutterControl _dragHandleXPosition](self, "_dragHandleXPosition");
  v4 = v3;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  return -[CAMDynamicShutterControl _isPointWithinLockRingTouchArea:](self, "_isPointWithinLockRingTouchArea:", v4);
}

- (CGPoint)_pauseResumeButtonCenter
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  -[CAMDynamicShutterControl pauseResumeButtonCenterLeftInset](self, "pauseResumeButtonCenterLeftInset");
  v4 = v3;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  v6 = v4;
  result.y = v5;
  result.x = v6;
  return result;
}

- (CGRect)_pauseResumeButtonFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CAMDynamicShutterControl _pauseResumeButtonSpec](self, "_pauseResumeButtonSpec");
  -[CAMDynamicShutterControl _pauseResumeButtonSpec](self, "_pauseResumeButtonSpec");
  -[CAMDynamicShutterControl _pauseResumeButtonCenter](self, "_pauseResumeButtonCenter");
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_isPointWithinPauseResumeRingTouchArea:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  if ((-[CAMDynamicShutterControl privateSettings](self, "privateSettings") & 1) == 0)
    return 0;
  -[CAMDynamicShutterControl _pauseResumeButtonFrame](self, "_pauseResumeButtonFrame");
  UIRectInset();
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- ($E50CC26D34D0158E20D4445E4757B7F2)_touchForPoint:(SEL)a3
{
  double y;
  double x;
  BOOL v8;
  $E50CC26D34D0158E20D4445E4757B7F2 *result;

  y = a4.y;
  x = a4.x;
  v8 = -[CAMDynamicShutterControl _isHandleWithinLockRing](self, "_isHandleWithinLockRing");
  retstr->var1 = 0.0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var0.x = x;
  retstr->var0.y = y;
  retstr->var1 = CFAbsoluteTimeGetCurrent();
  retstr->var2 = -[CAMDynamicShutterControl _isPointWithinShutterButtonTouchArea:](self, "_isPointWithinShutterButtonTouchArea:", x, y);
  retstr->var3 = -[CAMDynamicShutterControl _isPointWithinLockRingTouchArea:](self, "_isPointWithinLockRingTouchArea:", x, y)&& v8;
  result = ($E50CC26D34D0158E20D4445E4757B7F2 *)-[CAMDynamicShutterControl _isPointWithinPauseResumeRingTouchArea:](self, "_isPointWithinPauseResumeRingTouchArea:", x, y);
  retstr->var4 = (char)result;
  return result;
}

- (BOOL)_shouldReceiveTouch:(id *)a3
{
  int64_t v4;

  v4 = -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (v4)
      return 0;
    return a3->var2;
  }
  else
  {
    if (a3->var2 || a3->var3)
      return 1;
    return a3->var4;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  id WeakRetained;
  CAMDynamicShutterControl *v9;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;
  objc_super v14;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)CAMDynamicShutterControl;
  -[CAMDynamicShutterControl hitTest:withEvent:](&v14, sel_hitTest_withEvent_, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDynamicShutterControl bounds](self, "bounds");
  v15.x = x;
  v15.y = y;
  if (CGRectContainsPoint(v16, v15) && (-[CAMDynamicShutterControl isEnabled](self, "isEnabled") & 1) == 0)
  {
    v12 = 0u;
    v13 = 0u;
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:", x, y);
    v11[0] = v12;
    v11[1] = v13;
    if (-[CAMDynamicShutterControl _shouldReceiveTouch:](self, "_shouldReceiveTouch:", v11)
      && self->_delegateFlags.respondsToTouchAttemptedWhileDisabled)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "shutterControlTouchAttemptedWhileDisabled:", self);

    }
    v9 = self;

    v7 = v9;
  }
  return v7;
}

- (void)_setFirstTouch:(id *)a3
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  CGFloat x;
  CGFloat y;
  __int128 v14;
  int v15;
  CGFloat v16;
  __int16 v17;
  CGFloat v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3->var2)
    v5 = CFSTR("WithinShutter");
  else
    v5 = &stru_1EA3325A0;
  v6 = v5;
  if (a3->var3)
    v7 = CFSTR("WithinLockButton");
  else
    v7 = &stru_1EA3325A0;
  v8 = v7;
  if (a3->var4)
    v9 = CFSTR("WithinPauseResumeButton");
  else
    v9 = &stru_1EA3325A0;
  v10 = v9;
  v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    x = a3->var0.x;
    y = a3->var0.y;
    v15 = 134219010;
    v16 = x;
    v17 = 2048;
    v18 = y;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v8;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: Updating first touch [(%.02f,%.02f) %{public}@ %{public}@ %{public}@]", (uint8_t *)&v15, 0x34u);
  }

  v14 = *(_OWORD *)&a3->var1;
  self->$2BE7AFF22295DED6A45A0E44EF7D16DF::point = a3->var0;
  *(_OWORD *)&self->$2BE7AFF22295DED6A45A0E44EF7D16DF::time = v14;

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  char v5;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  objc_msgSend(a3, "locationInView:", self);
  v8 = 0u;
  v9 = 0u;
  -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
  v7[0] = v8;
  v7[1] = v9;
  if (!-[CAMDynamicShutterControl _shouldReceiveTouch:](self, "_shouldReceiveTouch:", v7)
    || !-[CAMDynamicShutterControl isEnabled](self, "isEnabled"))
  {
    return 0;
  }
  if (!self->_delegateFlags.respondsToShouldBeginGesture)
    return 1;
  -[CAMDynamicShutterControl delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dynamicShutterControlShouldBeginGesture:", self);

  return v5;
}

- (void)_handlePress:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _OWORD v8[2];
  uint8_t v9[16];
  __int128 v10;
  _OWORD v11[2];
  uint8_t buf[16];
  __int128 v13;

  v4 = a3;
  if (-[CAMDynamicShutterControl _isExternalShutterPressed](self, "_isExternalShutterPressed")
    || -[CAMDynamicShutterControl _isExternalLockButtonPressed](self, "_isExternalLockButtonPressed"))
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: Ignoring screen touch, handling external press", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(v4, "locationInView:", self);
    *(_OWORD *)buf = 0u;
    v13 = 0u;
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    switch(objc_msgSend(v4, "state"))
    {
      case 1:
        v11[0] = *(_OWORD *)buf;
        v11[1] = v13;
        -[CAMDynamicShutterControl _setFirstTouch:](self, "_setFirstTouch:", v11);
        v7 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganScreen", v9, 2u);
        }

        *(_OWORD *)v9 = *(_OWORD *)buf;
        v10 = v13;
        -[CAMDynamicShutterControl _touchSequenceBegan:](self, "_touchSequenceBegan:", v9);
        break;
      case 2:
        *(_OWORD *)v9 = *(_OWORD *)buf;
        v10 = v13;
        -[CAMDynamicShutterControl _touchSequenceChanged:](self, "_touchSequenceChanged:", v9);
        break;
      case 3:
      case 5:
        *(_OWORD *)v9 = *(_OWORD *)buf;
        v10 = v13;
        -[CAMDynamicShutterControl _touchSequenceEnded:forReset:](self, "_touchSequenceEnded:forReset:", v9, 0);
        v6 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedScreen", v9, 2u);
        }

        break;
      case 4:
        if (-[CAMDynamicShutterControl _ignoreNextCancelledGesture](self, "_ignoreNextCancelledGesture"))
          -[CAMDynamicShutterControl _setIgnoreNextCancelledGesture:](self, "_setIgnoreNextCancelledGesture:", 0);
        else
          -[CAMDynamicShutterControl _touchSequenceCancelledForReset:](self, "_touchSequenceCancelledForReset:", 0);
        break;
      default:
        break;
    }
    v8[0] = *(_OWORD *)buf;
    v8[1] = v13;
    -[CAMDynamicShutterControl _setMostRecentTouch:](self, "_setMostRecentTouch:", v8);
  }

}

- (BOOL)_shouldStartStopOnTouchDown
{
  int64_t v3;
  void *v4;
  char v5;
  uint64_t v9;
  uint64_t v10;

  -[CAMDynamicShutterControl settings](self, "settings");
  v3 = -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
  -[CAMDynamicShutterControl settings](self, "settings");
  if (self->_delegateFlags.respondsToCanStartOnTouchDown)
  {
    -[CAMDynamicShutterControl delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "dynamicShutterControlCanStartOnTouchDown:", self);

  }
  else
  {
    v5 = 1;
  }
  if (v10 == 1 && v3 == 0 && v9 == 0)
    return v5;
  else
    return 0;
}

- (BOOL)_shouldShortPressOnTouchDown
{
  int64_t v3;
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;

  -[CAMDynamicShutterControl settings](self, "settings");
  v3 = v7 | -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
  -[CAMDynamicShutterControl settings](self, "settings");
  v4 = !-[CAMDynamicShutterControl _isDraggingEnabled](self, "_isDraggingEnabled");
  if (v6)
    LOBYTE(v4) = 0;
  return !v3 && v4;
}

- (BOOL)_shouldShortPressOnTouchUp
{
  int64_t v3;
  BOOL v4;
  BOOL v5;
  uint64_t v7;
  uint64_t v8;

  -[CAMDynamicShutterControl settings](self, "settings");
  v3 = v8 | -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
  -[CAMDynamicShutterControl settings](self, "settings");
  v4 = -[CAMDynamicShutterControl _isDraggingEnabled](self, "_isDraggingEnabled");
  if (v7)
    v5 = 1;
  else
    v5 = v4;
  return !v3 && v5;
}

- (void)_updateStateForTouchPoint:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  int v15;
  CAMDynamicShutterControl *v16;
  uint64_t v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  x = a3.x;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter", a3.x, a3.y);
  v6 = v5;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  v8 = v7;
  -[CAMDynamicShutterControl _lockButtonCenter](self, "_lockButtonCenter");
  v10 = v9;
  v11 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
  v12 = vabdd_f64(x, v8);
  v13 = v10 + -30.0;
  switch(v11)
  {
    case 2:
      v13 = 60.0;
      if (v12 < 60.0)
        goto LABEL_7;
      break;
    case 3:
      v14 = x - v6;
      if (v14 < 0.0)
        LOBYTE(v15) = 0;
      else
        v15 = !-[CAMDynamicShutterControl _canDragStartStop](self, "_canDragStartStop", v13);
      if (v14 >= 0.0)
        LOBYTE(v18) = 0;
      else
        v18 = !-[CAMDynamicShutterControl _canDragCounter](self, "_canDragCounter");
      v13 = 60.0;
      if (v12 < 60.0)
        v19 = 1;
      else
        v19 = v15;
      if ((v19 & 1) == 0 && (v18 & 1) == 0)
      {
        if (v14 < 0.0)
          v20 = 2;
        else
          v20 = 4;
        if (v14 >= 0.0)
          v21 = 1;
        else
          v21 = 2;
        if (v14 < 0.0)
          v22 = 1;
        else
          v22 = 3;
        -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", v20, 1);
        -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", v21, 1);
        -[CAMDynamicShutterControl _setShutterState:](self, "_setShutterState:", v22);
        goto LABEL_32;
      }
      break;
    case 4:
      if (v12 >= 60.0)
      {
        if (x > v13)
        {
          v16 = self;
          v17 = 5;
          goto LABEL_15;
        }
      }
      else
      {
LABEL_7:
        -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", 3, 1);
        -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", 0, 1);
LABEL_32:
        -[CAMDynamicShutterControl _feedbackController](self, "_feedbackController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "performDiscreteFeedback:", 0);

      }
      break;
    case 5:
      if (x <= v13)
      {
        v16 = self;
        v17 = 4;
LABEL_15:
        -[CAMDynamicShutterControl _setDragHandleState:animated:](v16, "_setDragHandleState:animated:", v17, 1);
        -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", 1, 1);
      }
      break;
    default:
      break;
  }
  -[CAMDynamicShutterControl _displayLink](self, "_displayLink", v13);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPaused:", 0);

}

- (void)_touchSequenceBegan:(id *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int64_t v13;
  CAMDynamicShutterControl *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[16];

  -[CAMDynamicShutterControl _setTouchSequencePhase:](self, "_setTouchSequencePhase:", 1);
  -[CAMDynamicShutterControl _feedbackController](self, "_feedbackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareDiscreteFeedback:", 0);

  -[CAMDynamicShutterControl set_shouldCheckTouchUpEvents:](self, "set_shouldCheckTouchUpEvents:", 1);
  -[CAMDynamicShutterControl set_didCancelZoomForCurrentGesture:](self, "set_didCancelZoomForCurrentGesture:", 0);
  if (self->_delegateFlags.respondsToGesturesDidBegin)
  {
    -[CAMDynamicShutterControl delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dynamicShutterControlGesturesDidBegin:", self);

  }
  if (-[CAMDynamicShutterControl _isActiveTouchSequencePhase:](self, "_isActiveTouchSequencePhase:", -[CAMDynamicShutterControl _touchSequencePhase](self, "_touchSequencePhase")))
  {
    if (a3->var2)
    {
      v7 = -[CAMDynamicShutterControl _shouldStartStopOnTouchDown](self, "_shouldStartStopOnTouchDown");
      v8 = -[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", -[CAMDynamicShutterControl _shutterState](self, "_shutterState"));
      if (v7 && !v8)
      {
        -[CAMDynamicShutterControl settings](self, "settings");
        if (v18 || (-[CAMDynamicShutterControl settings](self, "settings"), v17))
        {
          v9 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganUnresolvedStart", buf, 2u);
          }

          -[CAMDynamicShutterControl _setShutterState:](self, "_setShutterState:", 5);
        }
        else
        {
          v16 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganTapStart", buf, 2u);
          }

          -[CAMDynamicShutterControl _handleTapToStartStop](self, "_handleTapToStartStop");
          -[CAMDynamicShutterControl set_shouldCheckTouchUpEvents:](self, "set_shouldCheckTouchUpEvents:", 0);
        }
      }
      if (-[CAMDynamicShutterControl _shouldShortPressOnTouchDown](self, "_shouldShortPressOnTouchDown"))
      {
        v10 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganShortPress", buf, 2u);
        }

        if (self->_delegateFlags.respondsToDidShortPress)
        {
          -[CAMDynamicShutterControl delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "dynamicShutterControlDidShortPress:", self);

        }
        -[CAMDynamicShutterControl set_shouldCheckTouchUpEvents:](self, "set_shouldCheckTouchUpEvents:", 0);
      }
      if (!-[CAMDynamicShutterControl _isDraggingEnabled](self, "_isDraggingEnabled")
        || !-[CAMDynamicShutterControl _shouldStartTrackingHandle](self, "_shouldStartTrackingHandle")
        || -[CAMDynamicShutterControl _ignoreNextCancelledGesture](self, "_ignoreNextCancelledGesture"))
      {
        goto LABEL_37;
      }
      goto LABEL_30;
    }
    if (!a3->var3 || !-[CAMDynamicShutterControl _isDraggingEnabled](self, "_isDraggingEnabled"))
      goto LABEL_37;
    if (-[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState") == 7)
    {
      if (!-[CAMDynamicShutterControl _shouldStartTrackingHandle](self, "_shouldStartTrackingHandle"))
      {
LABEL_35:
        -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", 5, 1);
        v14 = self;
        v15 = 1;
        goto LABEL_36;
      }
    }
    else
    {
      v13 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
      if (!-[CAMDynamicShutterControl _shouldStartTrackingHandle](self, "_shouldStartTrackingHandle"))
      {
        if (v13 != 6)
        {
LABEL_37:
          if (-[CAMDynamicShutterControl _isTrackingHandleState:](self, "_isTrackingHandleState:", -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState")))
          {
            -[CAMDynamicShutterControl _updateStateForTouchPoint:](self, "_updateStateForTouchPoint:", a3->var0.x, a3->var0.y);
            -[CAMDynamicShutterControl _updateTrackingDragHandleOffsetTargetWithPoint:](self, "_updateTrackingDragHandleOffsetTargetWithPoint:", a3->var0.x, a3->var0.y);
          }
          -[CAMDynamicShutterControl _displayLink](self, "_displayLink");
          v12 = objc_claimAutoreleasedReturnValue();
          -[NSObject setPaused:](v12, "setPaused:", 0);
          goto LABEL_40;
        }
        goto LABEL_35;
      }
    }
LABEL_30:
    -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", 3, 1);
    v14 = self;
    v15 = 0;
LABEL_36:
    -[CAMDynamicShutterControl _setInnerShapeState:animated:](v14, "_setInnerShapeState:animated:", v15, 1);
    goto LABEL_37;
  }
  v12 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganReset", buf, 2u);
  }
LABEL_40:

}

- (void)_touchSequenceChanged:(id *)a3
{
  void *v5;
  double v6;
  double v7;
  double y;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  char v18;

  -[CAMDynamicShutterControl _feedbackController](self, "_feedbackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareDiscreteFeedback:", 0);

  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  v7 = v6;
  y = a3->var0.y;
  if (-[CAMDynamicShutterControl _isTrackingHandleState:](self, "_isTrackingHandleState:", -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState")))
  {
    -[CAMDynamicShutterControl _updateStateForTouchPoint:](self, "_updateStateForTouchPoint:", a3->var0.x, a3->var0.y);
    -[CAMDynamicShutterControl _updateTrackingDragHandleOffsetTargetWithPoint:](self, "_updateTrackingDragHandleOffsetTargetWithPoint:", a3->var0.x, a3->var0.y);
  }
  v9 = v7 - y;
  -[CAMDynamicShutterControl settings](self, "settings");
  if (v18)
  {
    if (!-[CAMDynamicShutterControl _didCancelZoomForCurrentGesture](self, "_didCancelZoomForCurrentGesture")
      && fabs(v9) > 55.0
      && !-[CAMDynamicShutterControl isZooming](self, "isZooming"))
    {
      -[CAMDynamicShutterControl setZooming:](self, "setZooming:", 1);
      -[CAMDynamicShutterControl set_initalZoomGestureOffsetY:](self, "set_initalZoomGestureOffsetY:", v9);
      if (self->_delegateFlags.respondsToDidStartZoomGesture)
      {
        -[CAMDynamicShutterControl delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dynamicShutterControlDidStartZoomGesture:", self);

      }
    }
  }
  if (-[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", -[CAMDynamicShutterControl _shutterState](self, "_shutterState"))&& -[CAMDynamicShutterControl isZooming](self, "isZooming")&& self->_delegateFlags.respondsToDidChangeRelativeZoomProgress)
  {
    -[CAMDynamicShutterControl _initalZoomGestureOffsetY](self, "_initalZoomGestureOffsetY");
    v12 = v9 - v11;
    -[CAMDynamicShutterControl _absoluteShutterToBottomDistance](self, "_absoluteShutterToBottomDistance");
    -[CAMDynamicShutterControl _initalZoomGestureOffsetY](self, "_initalZoomGestureOffsetY");
    if (v12 >= 0.0)
    {
      CEKProgress();
      v14 = v15;
    }
    else
    {
      CEKProgressClamped();
      v14 = -v13;
    }
    -[CAMDynamicShutterControl delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dynamicShutterControl:didChangeRelativeZoomProgress:", self, v14);

  }
  -[CAMDynamicShutterControl _displayLink](self, "_displayLink");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPaused:", 0);

}

- (void)_touchSequenceEnded:(id *)a3 forReset:(BOOL)a4
{
  _BOOL4 v7;
  _BOOL4 var2;
  int v9;
  _BOOL4 var4;
  BOOL v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double var1;
  double v18;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  unint64_t v24;
  unint64_t v25;
  CAMDynamicShutterControl *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[16];
  uint64_t v33;
  double v34;
  uint64_t v35;
  unsigned __int8 v36;
  char v37;
  char v38;

  if ((unint64_t)(-[CAMDynamicShutterControl _touchSequencePhase](self, "_touchSequencePhase") - 1) <= 1)
    -[CAMDynamicShutterControl _setTouchSequencePhase:](self, "_setTouchSequencePhase:", 3);
  -[CAMDynamicShutterControl _firstTouch](self, "_firstTouch");
  if (v38)
    v7 = -[CAMDynamicShutterControl _isHandleWithinLockRing](self, "_isHandleWithinLockRing");
  else
    v7 = 0;
  -[CAMDynamicShutterControl _firstTouch](self, "_firstTouch");
  if (v37)
    var2 = a3->var2;
  else
    var2 = 0;
  -[CAMDynamicShutterControl _firstTouch](self, "_firstTouch");
  v9 = v36;
  if (v36)
    var4 = a3->var4;
  else
    var4 = 0;
  -[CAMDynamicShutterControl settings](self, "settings");
  if (v7)
  {
    v11 = self->_delegateFlags.respondsToDidPressLockButton && v35 == 2;
    if (v11 && !a4)
    {
      -[CAMDynamicShutterControl delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dynamicShutterControlDidPressLockButton:", self);

    }
  }
  if (var4 && !a4 && self->_delegateFlags.respondsToDidPressPauseResumeButton)
  {
    -[CAMDynamicShutterControl delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dynamicShutterControlDidPressPauseResumeButton:", self);

  }
  if (var2 && -[CAMDynamicShutterControl _shouldCheckTouchUpEvents](self, "_shouldCheckTouchUpEvents") && !a4)
  {
    v14 = -[CAMDynamicShutterControl _shouldShortPressOnTouchUp](self, "_shouldShortPressOnTouchUp");
    if (-[CAMDynamicShutterControl _isExternalShutterPressed](self, "_isExternalShutterPressed"))
      -[CAMDynamicShutterControl _externalLongPressVideoDuration](self, "_externalLongPressVideoDuration");
    else
      -[CAMDynamicShutterControl _longPressVideoDuration](self, "_longPressVideoDuration");
    v16 = v15;
    var1 = a3->var1;
    -[CAMDynamicShutterControl _firstTouch](self, "_firstTouch");
    v18 = var1 - v34;
    if (var1 - v34 < v16 && v14)
    {
      -[CAMDynamicShutterControl settings](self, "settings", v18);
      if (!v33 || !self->_delegateFlags.respondsToDidShortPress)
      {
LABEL_43:
        v22 = -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
        if (v22 > 5)
          goto LABEL_52;
        if (((1 << v22) & 0x1A) == 0)
        {
          if (((1 << v22) & 0x21) != 0)
          {
            -[CAMDynamicShutterControl settings](self, "settings");
            if (v31 == 1)
            {
              v23 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedTapStart", buf, 2u);
              }

              -[CAMDynamicShutterControl _handleTapToStartStop](self, "_handleTapToStartStop");
            }
            goto LABEL_52;
          }
          -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", 1, 0);
          -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", 0, 1);
          -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", 0, 1);
        }
        -[CAMDynamicShutterControl _setShutterState:](self, "_setShutterState:", 0);
        goto LABEL_52;
      }
      v20 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v20, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedShortPress", buf, 2u);
      }

      -[CAMDynamicShutterControl delegate](self, "delegate");
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject dynamicShutterControlDidShortPress:](v21, "dynamicShutterControlDidShortPress:", self);
    }
    else
    {
      if (v18 < v16)
        goto LABEL_43;
      v21 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedIgnoredShortPressTimeout", buf, 2u);
      }
    }

    goto LABEL_43;
  }
LABEL_52:
  v24 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
  if (v24 > 8)
    goto LABEL_66;
  if (((1 << v24) & 0x1C3) != 0)
  {
    if (v9)
      goto LABEL_66;
    v25 = -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
    if (v25 > 5 || ((1 << v25) & 0x3A) == 0)
      goto LABEL_66;
LABEL_60:
    -[CAMDynamicShutterControl _setShutterState:](self, "_setShutterState:", 0);
    goto LABEL_66;
  }
  if (((1 << v24) & 0xC) != 0)
  {
    -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", 0, 1);
    -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", 0, 1);
    goto LABEL_60;
  }
  -[CAMDynamicShutterControl settings](self, "settings");
  if (v30 == 2)
  {
    v26 = self;
    v27 = 7;
  }
  else
  {
    if (v30 != 1)
      goto LABEL_66;
    v26 = self;
    v27 = 6;
  }
  -[CAMDynamicShutterControl _setDragHandleState:animated:](v26, "_setDragHandleState:animated:", v27, 1);
  -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", 1, 1);
LABEL_66:
  if (self->_delegateFlags.respondsToGesturesDidEnd)
  {
    -[CAMDynamicShutterControl delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dynamicShutterControlGesturesDidEnd:", self);

  }
  -[CAMDynamicShutterControl set_shouldCheckTouchUpEvents:](self, "set_shouldCheckTouchUpEvents:", 0);
  -[CAMDynamicShutterControl setZooming:](self, "setZooming:", 0);
  -[CAMDynamicShutterControl _displayLink](self, "_displayLink");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPaused:", 0);

}

- (void)_touchSequenceCancelledForReset:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  _BYTE v8[32];

  v3 = a3;
  -[CAMDynamicShutterControl _mostRecentTouch](self, "_mostRecentTouch");
  -[CAMDynamicShutterControl _touchSequenceEnded:forReset:](self, "_touchSequenceEnded:forReset:", v8, v3);
  if (self->_delegateFlags.respondsToGesturesDidCancel)
  {
    -[CAMDynamicShutterControl delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dynamicShutterControlGesturesDidCancel:", self);

  }
  v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchEndedCancelled", v7, 2u);
  }

}

- (void)_cancelTouchSequenceForReset:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[CAMDynamicShutterControl _touchSequenceCancelledForReset:](self, "_touchSequenceCancelledForReset:", a3);
  -[CAMDynamicShutterControl _gestureRecognizer](self, "_gestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if ((unint64_t)(v5 - 1) <= 1)
  {
    -[CAMDynamicShutterControl _setIgnoreNextCancelledGesture:](self, "_setIgnoreNextCancelledGesture:", 1);
    -[CAMDynamicShutterControl _gestureRecognizer](self, "_gestureRecognizer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelGesture");

  }
}

- (void)_handleTapToStartStop
{
  CAMDynamicShutterControl *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[CAMDynamicShutterControl settings](self, "settings");
  if (v6 < 2)
  {
    v3 = self;
    v4 = 1;
    v5 = 0;
LABEL_5:
    -[CAMDynamicShutterControl _setDragHandleState:animated:](v3, "_setDragHandleState:animated:", v4, v5);
    goto LABEL_6;
  }
  if (v6 == 2)
  {
    -[CAMDynamicShutterControl _setDragHandleState:animated:](self, "_setDragHandleState:animated:", 8, 0);
    v3 = self;
    v4 = 7;
    v5 = 1;
    goto LABEL_5;
  }
LABEL_6:
  -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", 1, 1);
  -[CAMDynamicShutterControl _setShutterState:](self, "_setShutterState:", 2);
}

- (BOOL)externalButtonPressedWithBehavior:(int64_t)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  id WeakRetained;
  NSObject *v10;
  NSObject *v11;
  _OWORD v13[2];
  uint8_t buf[16];
  __int128 v15;
  _OWORD v16[2];
  uint8_t v17[16];
  __int128 v18;

  v5 = -[CAMDynamicShutterControl _isExternalShutterPressed](self, "_isExternalShutterPressed");
  v6 = -[CAMDynamicShutterControl isTracking](self, "isTracking");
  v7 = -[CAMDynamicShutterControl isEnabled](self, "isEnabled");
  v8 = v7 & (v6 ^ 1) & ~v5;
  if ((v7 & 1) == 0 && self->_delegateFlags.respondsToTouchAttemptedWhileDisabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "shutterControlTouchAttemptedWhileDisabled:", self);

  }
  if (v8)
  {
    -[CAMDynamicShutterControl _setExternalShutterPressed:](self, "_setExternalShutterPressed:", 1);
    -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
    *(_OWORD *)v17 = 0u;
    v18 = 0u;
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    v16[0] = *(_OWORD *)v17;
    v16[1] = v18;
    -[CAMDynamicShutterControl _setFirstTouch:](self, "_setFirstTouch:", v16);
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: TouchBeganExternal", buf, 2u);
    }

    *(_OWORD *)buf = *(_OWORD *)v17;
    v15 = v18;
    -[CAMDynamicShutterControl _touchSequenceBegan:](self, "_touchSequenceBegan:", buf);
    v13[0] = *(_OWORD *)v17;
    v13[1] = v18;
    -[CAMDynamicShutterControl _setMostRecentTouch:](self, "_setMostRecentTouch:", v13);
    -[CAMDynamicShutterControl set_externalShutterLongPressBehavior:](self, "set_externalShutterLongPressBehavior:", a3);
  }
  else
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: External shutter button press ignored", v17, 2u);
    }

  }
  return v8;
}

- (BOOL)externalButtonReleased
{
  _BOOL4 v3;
  int64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _OWORD v9[2];
  _OWORD v10[2];
  uint8_t buf[16];
  __int128 v12;

  v3 = -[CAMDynamicShutterControl _isExternalShutterPressed](self, "_isExternalShutterPressed");
  if (v3)
  {
    v4 = -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
    *(_OWORD *)buf = 0u;
    v12 = 0u;
    -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    v10[0] = *(_OWORD *)buf;
    v10[1] = v12;
    -[CAMDynamicShutterControl _touchSequenceEnded:forReset:](self, "_touchSequenceEnded:forReset:", v10, 0);
    v9[0] = *(_OWORD *)buf;
    v9[1] = v12;
    -[CAMDynamicShutterControl _setMostRecentTouch:](self, "_setMostRecentTouch:", v9);
    if (-[CAMDynamicShutterControl _externalShutterLongPressBehavior](self, "_externalShutterLongPressBehavior") == 2
      && v4 == 1)
    {
      -[CAMDynamicShutterControl _setShutterState:](self, "_setShutterState:", 0);
      -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", 0, 1);
      -[CAMDynamicShutterControl _setDragHandleState:](self, "_setDragHandleState:", 0);
    }
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      v6 = "Dynamic Shutter: TouchEndedExternal";
      v7 = (uint8_t *)v10;
LABEL_9:
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Dynamic Shutter: External shutter button release ignored, external shutter not pressed";
      v7 = buf;
      goto LABEL_9;
    }
  }

  -[CAMDynamicShutterControl _setExternalShutterPressed:](self, "_setExternalShutterPressed:", 0);
  -[CAMDynamicShutterControl set_externalShutterLongPressBehavior:](self, "set_externalShutterLongPressBehavior:", 0);
  return v3;
}

- (void)externalButtonCancelled
{
  id v3;

  -[CAMDynamicShutterControl externalButtonReleased](self, "externalButtonReleased");
  -[CAMDynamicShutterControl set_externalShutterLongPressBehavior:](self, "set_externalShutterLongPressBehavior:", 0);
  if (self->_delegateFlags.respondsToGesturesDidCancel)
  {
    -[CAMDynamicShutterControl delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dynamicShutterControlGesturesDidCancel:", self);

  }
}

- (BOOL)externalLockButtonPressed
{
  double v3;
  double v4;
  _BOOL4 v5;
  int v6;
  int v7;
  int v8;
  int v9;
  id WeakRetained;
  NSObject *v11;
  _OWORD v13[2];
  _OWORD v14[2];
  _OWORD v15[2];
  uint8_t buf[16];
  __int128 v17;

  -[CAMDynamicShutterControl _dragHandleXPosition](self, "_dragHandleXPosition");
  v4 = v3;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  v5 = -[CAMDynamicShutterControl _isPointWithinLockRingTouchArea:](self, "_isPointWithinLockRingTouchArea:", v4);
  v6 = -[CAMDynamicShutterControl _isExternalLockButtonPressed](self, "_isExternalLockButtonPressed");
  v7 = -[CAMDynamicShutterControl isTracking](self, "isTracking");
  v8 = -[CAMDynamicShutterControl isEnabled](self, "isEnabled");
  v9 = v5 & ~v6 & v8 & (v7 ^ 1);
  if ((v8 & 1) == 0 && self->_delegateFlags.respondsToTouchAttemptedWhileDisabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "shutterControlTouchAttemptedWhileDisabled:", self);

  }
  if (v9)
  {
    -[CAMDynamicShutterControl _setExternalLockButtonPressed:](self, "_setExternalLockButtonPressed:", 1);
    *(_OWORD *)buf = 0u;
    v17 = 0u;
    -[CAMDynamicShutterControl _lockButtonCenter](self, "_lockButtonCenter");
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    v15[0] = *(_OWORD *)buf;
    v15[1] = v17;
    -[CAMDynamicShutterControl _setFirstTouch:](self, "_setFirstTouch:", v15);
    v14[0] = *(_OWORD *)buf;
    v14[1] = v17;
    -[CAMDynamicShutterControl _touchSequenceBegan:](self, "_touchSequenceBegan:", v14);
    v13[0] = *(_OWORD *)buf;
    v13[1] = v17;
    -[CAMDynamicShutterControl _setMostRecentTouch:](self, "_setMostRecentTouch:", v13);
  }
  else
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: External lock button press ignored", buf, 2u);
    }

  }
  return v9;
}

- (void)externalLockButtonReleased
{
  _BOOL4 v3;
  NSObject *v4;
  _OWORD v5[2];
  _OWORD v6[2];
  uint8_t buf[16];
  __int128 v8;

  v3 = -[CAMDynamicShutterControl _isExternalLockButtonPressed](self, "_isExternalLockButtonPressed");
  -[CAMDynamicShutterControl _setExternalLockButtonPressed:](self, "_setExternalLockButtonPressed:", 0);
  if (v3)
  {
    *(_OWORD *)buf = 0u;
    v8 = 0u;
    -[CAMDynamicShutterControl _lockButtonCenter](self, "_lockButtonCenter");
    -[CAMDynamicShutterControl _touchForPoint:](self, "_touchForPoint:");
    v6[0] = *(_OWORD *)buf;
    v6[1] = v8;
    -[CAMDynamicShutterControl _touchSequenceEnded:forReset:](self, "_touchSequenceEnded:forReset:", v6, 0);
    v5[0] = *(_OWORD *)buf;
    v5[1] = v8;
    -[CAMDynamicShutterControl _setMostRecentTouch:](self, "_setMostRecentTouch:", v5);
  }
  else
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Dynamic Shutter: External lock button button release ignored, external lock button not pressed", buf, 2u);
    }

  }
}

- (void)_setCounterValue:(int64_t)a3
{
  if (self->__counterValue != a3)
  {
    self->__counterValue = a3;
    -[CAMDynamicShutterControl _updateCounterLabelText](self, "_updateCounterLabelText");
  }
}

- (void)_updateCounterLabelText
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02ld"), -[CAMDynamicShutterControl _counterValue](self, "_counterValue"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMDynamicShutterControl _counterLabel](self, "_counterLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

}

- (int64_t)incrementCounter
{
  double v3;

  v3 = (double)(-[CAMDynamicShutterControl _counterValue](self, "_counterValue") + 1);
  if (v3 > 999.0)
    v3 = 999.0;
  -[CAMDynamicShutterControl _setCounterValue:](self, "_setCounterValue:", (uint64_t)v3);
  return -[CAMDynamicShutterControl _counterValue](self, "_counterValue");
}

- (void)resetCounter
{
  -[CAMDynamicShutterControl _setCounterValue:](self, "_setCounterValue:", 0);
}

- (void)setSettings:(id *)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v5[4];
  int64_t var8;

  v3 = *(_OWORD *)&a3->var6;
  v5[2] = *(_OWORD *)&a3->var4;
  v5[3] = v3;
  var8 = a3->var8;
  v4 = *(_OWORD *)&a3->var2;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v4;
  -[CAMDynamicShutterControl setSettings:animated:](self, "setSettings:animated:", v5, 0);
}

- (void)setSettings:(id *)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  $E5C720D6BB068A42F0C2CD001350366C v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[4];
  int64_t var8;

  v4 = a4;
  v7.var0 = (BOOL)-[CAMDynamicShutterControl privateSettings](self, "privateSettings");
  v8 = *(_OWORD *)&a3->var6;
  v10[2] = *(_OWORD *)&a3->var4;
  v10[3] = v8;
  var8 = a3->var8;
  v9 = *(_OWORD *)&a3->var2;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v9;
  -[CAMDynamicShutterControl setSettings:privateSettings:animated:](self, "setSettings:privateSettings:animated:", v10, v7.var0, v4);
}

- (void)setSettings:(id *)a3 privateSettings:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v5 = a5;
  if (a3->var0 != self->_settings.tapBehavior
    || a3->var1 != self->_settings.longPressBehavior
    || a3->var2 != self->_settings.dragRightBehavior
    || a3->var3 != self->_settings.dragLeftBehavior
    || a3->var5 != self->_settings.lockBehavior
    || a3->var6 != self->_settings.ringStyle
    || a3->var7 != self->_settings.stopColor
    || a3->var8 != self->_settings.idleColor
    || a3->var4 != self->_settings.allowsZoom
    || a4.var0 != self->_privateSettings.allowPauseResume)
  {
    *(_OWORD *)&self->_settings.tapBehavior = *(_OWORD *)&a3->var0;
    v7 = *(_OWORD *)&a3->var2;
    v8 = *(_OWORD *)&a3->var4;
    v9 = *(_OWORD *)&a3->var6;
    self->_settings.idleColor = a3->var8;
    *(_OWORD *)&self->_settings.allowsZoom = v8;
    *(_OWORD *)&self->_settings.ringStyle = v9;
    *(_OWORD *)&self->_settings.dragRightBehavior = v7;
    self->_privateSettings.allowPauseResume = a4.var0;
    -[CAMDynamicShutterControl _updateSpringTargetsAnimated:](self, "_updateSpringTargetsAnimated:", a5);
    -[CAMDynamicShutterControl _updateOuterAndInnerLayersAnimated:](self, "_updateOuterAndInnerLayersAnimated:", v5);
    -[CAMDynamicShutterControl _updateCenterLegibilityView](self, "_updateCenterLegibilityView");
  }
}

- (BOOL)_isDraggingEnabled
{
  uint64_t v4;
  uint64_t v5;

  -[CAMDynamicShutterControl settings](self, "settings");
  if (v5)
    return 1;
  -[CAMDynamicShutterControl settings](self, "settings");
  return v4 != 0;
}

- (id)_outerImage
{
  void *v3;
  double v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  double v11;
  double v12;
  uint64_t v13;

  -[CAMDynamicShutterControl settings](self, "settings");
  if (v13 == 1)
  {
    -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
    v3 = (void *)objc_opt_class();
    if (v3)
    {
      objc_msgSend(v3, "shutterButtonSpecForLayoutStyle:", 0);
      v4 = v11;
    }
    else
    {
      v4 = 0.0;
    }
    if (v12 <= v4)
      v6 = CFSTR("CAMDynamicShutterButtonSlomoLegacyPhone");
    else
      v6 = CFSTR("CAMShutterButtonThinSlomo");
    v7 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_updateOuterAndInnerLayersAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
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
  CAMTimelapseShutterRingView *v18;
  void *v19;
  CAMTimelapseShutterRingView *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  _BOOL4 v28;
  double v29;
  double v30;
  _QWORD v31[6];
  BOOL v32;
  BOOL v33;
  BOOL v34;
  _OWORD v35[2];
  uint64_t v36;
  uint64_t v37;

  v3 = a3;
  -[CAMDynamicShutterControl settings](self, "settings");
  v5 = v37;
  -[CAMDynamicShutterControl settings](self, "settings");
  v6 = v36;
  if (v37 == 1)
  {
    -[CAMDynamicShutterControl _centerOuterImageView](self, "_centerOuterImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0DC3890]);
      -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v10 = (void *)objc_msgSend(v8, "initWithFrame:");
      -[CAMDynamicShutterControl set_centerOuterImageView:](self, "set_centerOuterImageView:", v10);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMDynamicShutterControl _centerOuterImageView](self, "_centerOuterImageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTintColor:", v11);

      -[CAMDynamicShutterControl _centerOuterImageView](self, "_centerOuterImageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMDynamicShutterControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v13, v14);

    }
    -[CAMDynamicShutterControl _outerImage](self, "_outerImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMDynamicShutterControl _centerOuterImageView](self, "_centerOuterImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v15);

  }
  if (v36 == 2)
  {
    -[CAMDynamicShutterControl _centerTimelapseOuterView](self, "_centerTimelapseOuterView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v18 = [CAMTimelapseShutterRingView alloc];
      -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v35[0] = xmmword_1DB9A7DF8;
      v35[1] = unk_1DB9A7E08;
      v20 = -[CAMTimelapseShutterRingView initWithFrame:spec:](v18, "initWithFrame:spec:", v35);
      -[CAMDynamicShutterControl set_centerTimelapseOuterView:](self, "set_centerTimelapseOuterView:", v20);

      -[CAMDynamicShutterControl _centerTimelapseOuterView](self, "_centerTimelapseOuterView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMDynamicShutterControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v21, v22);

    }
    v23 = -[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", -[CAMDynamicShutterControl _shutterState](self, "_shutterState"));
    -[CAMDynamicShutterControl _centerTimelapseOuterView](self, "_centerTimelapseOuterView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAnimating:", v23);

  }
  v25 = v5 == 1;
  v26 = v6 == 2 || v5 == 1;
  v27 = !v26;
  v28 = -[CAMDynamicShutterControl showDisabled](self, "showDisabled");
  v29 = 1.0;
  if (v28)
    v29 = 0.4;
  v30 = 0.3;
  if (!v3)
    v30 = 0.0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __63__CAMDynamicShutterControl__updateOuterAndInnerLayersAnimated___block_invoke;
  v31[3] = &unk_1EA32F3D8;
  v31[4] = self;
  v32 = v27;
  *(double *)&v31[5] = v29;
  v33 = v25;
  v34 = v6 == 2;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v31, v30);
}

void __63__CAMDynamicShutterControl__updateOuterAndInnerLayersAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v2 = 0.0;
  v3 = 0.0;
  if (*(_BYTE *)(a1 + 48))
    v3 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_centerOuterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  if (*(_BYTE *)(a1 + 49))
    v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_centerOuterImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v2);

  if (*(_BYTE *)(a1 + 50))
    v6 = *(double *)(a1 + 40);
  else
    v6 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_centerTimelapseOuterView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

}

- (void)setSpinning:(BOOL)a3
{
  if (self->_spinning != a3)
  {
    self->_spinning = a3;
    -[CAMDynamicShutterControl _updateSpinningAnimations](self, "_updateSpinningAnimations");
  }
}

- (void)_updateSpinningAnimations
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double InnerCircleDiameter;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  __CFString *v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  double v23[5];

  v3 = -[CAMDynamicShutterControl isSpinning](self, "isSpinning");
  -[CAMDynamicShutterControl _spinnerView](self, "_spinnerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("CAMDynamicShutterButtonSpinner"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    -[CAMDynamicShutterControl set_spinnerView:](self, "set_spinnerView:", v4);

  }
  objc_msgSend(v4, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAMDynamicShutterControl addSubview:](self, "addSubview:", v4);
    -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
    objc_msgSend(v4, "setCenter:");
    -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
    InnerCircleDiameter = CAMShutterButtonSpecGetInnerCircleDiameter(v23);
    objc_msgSend(v4, "setBounds:", 0.0, 0.0, InnerCircleDiameter, InnerCircleDiameter);
    -[CAMDynamicShutterControl settings](self, "settings");
    v11 = 0.8;
    if (v22 != 1)
      v11 = 0.0;
    if (!v22)
      v11 = 0.501960784;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v11, v11, v11, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v12);

    -[CAMDynamicShutterControl _updateMetalViewAlpha](self, "_updateMetalViewAlpha");
    objc_msgSend(v4, "setAlpha:", 1.0);
    +[CAMShutterUtilities spinnerAnimation](CAMShutterUtilities, "spinnerAnimation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAnimation:forKey:", v13, CFSTR("spinnerRotation"));

  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__CAMDynamicShutterControl__updateSpinningAnimations__block_invoke;
    v20[3] = &unk_1EA328A40;
    v20[4] = self;
    v21 = v4;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __53__CAMDynamicShutterControl__updateSpinningAnimations__block_invoke_2;
    v16[3] = &unk_1EA32C128;
    v16[4] = self;
    v17 = v21;
    v18 = v9;
    v19 = CFSTR("spinnerRotation");
    objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 327680, v20, v16, 0.3, 0.0);

  }
}

uint64_t __53__CAMDynamicShutterControl__updateSpinningAnimations__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateMetalViewAlpha");
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __53__CAMDynamicShutterControl__updateSpinningAnimations__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSpinning");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
    return objc_msgSend(*(id *)(a1 + 48), "removeAnimationForKey:", *(_QWORD *)(a1 + 56));
  }
  return result;
}

- (void)setPausedDuringVideo:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_pausedDuringVideo != a3)
  {
    self->_pausedDuringVideo = a3;
    -[CAMDynamicShutterControl _updateSpringTargetsAnimated:](self, "_updateSpringTargetsAnimated:", a4);
  }
}

- (void)setShowContrastBorder:(BOOL)a3
{
  id v4;
  UIView *v5;
  UIView *leftLineLegibilityView;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIView *v11;
  void *v12;
  id v13;
  UIView *v14;
  UIView *rightLineLegibilityView;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  UIView *v20;
  void *v21;
  id v22;
  UIView *v23;
  UIView *centerOuterLegibilityView;
  void *v25;
  UIView *v26;
  void *v27;
  id v28;
  UIView *v29;
  UIView *lockButtonOuterLegibilityView;
  void *v31;
  UIView *v32;
  void *v33;
  id v34;
  UIView *v35;
  UIView *pauseResumeButtonLegibilityView;
  void *v37;
  UIView *v38;
  void *v39;
  id v40;

  if (self->_showContrastBorder != a3)
  {
    self->_showContrastBorder = a3;
    if (a3)
    {
      if (!self->__leftLineLegibilityView)
      {
        v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        leftLineLegibilityView = self->__leftLineLegibilityView;
        self->__leftLineLegibilityView = v5;

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v8 = objc_msgSend(v7, "CGColor");
        -[UIView layer](self->__leftLineLegibilityView, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBorderColor:", v8);

        -[UIView layer](self->__leftLineLegibilityView, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBorderWidth:", 1.0);

        -[UIView setUserInteractionEnabled:](self->__leftLineLegibilityView, "setUserInteractionEnabled:", 0);
        v11 = self->__leftLineLegibilityView;
        -[CAMDynamicShutterControl _leftLineView](self, "_leftLineView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMDynamicShutterControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v11, v12);

      }
      if (!self->__rightLineLegibilityView)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v14 = (UIView *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        rightLineLegibilityView = self->__rightLineLegibilityView;
        self->__rightLineLegibilityView = v14;

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v17 = objc_msgSend(v16, "CGColor");
        -[UIView layer](self->__rightLineLegibilityView, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setBorderColor:", v17);

        -[UIView layer](self->__rightLineLegibilityView, "layer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setBorderWidth:", 1.0);

        -[UIView setUserInteractionEnabled:](self->__rightLineLegibilityView, "setUserInteractionEnabled:", 0);
        v20 = self->__rightLineLegibilityView;
        -[CAMDynamicShutterControl _rightLineView](self, "_rightLineView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMDynamicShutterControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v20, v21);

      }
      if (!self->__centerOuterLegibilityView)
      {
        v22 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v23 = (UIView *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        centerOuterLegibilityView = self->__centerOuterLegibilityView;
        self->__centerOuterLegibilityView = v23;

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->__centerOuterLegibilityView, "setBackgroundColor:", v25);

        -[UIView setUserInteractionEnabled:](self->__centerOuterLegibilityView, "setUserInteractionEnabled:", 0);
        v26 = self->__centerOuterLegibilityView;
        -[CAMDynamicShutterControl _centerOuterView](self, "_centerOuterView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMDynamicShutterControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v26, v27);

      }
      if (!self->__lockButtonOuterLegibilityView)
      {
        v28 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v29 = (UIView *)objc_msgSend(v28, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        lockButtonOuterLegibilityView = self->__lockButtonOuterLegibilityView;
        self->__lockButtonOuterLegibilityView = v29;

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->__lockButtonOuterLegibilityView, "setBackgroundColor:", v31);

        -[UIView setUserInteractionEnabled:](self->__lockButtonOuterLegibilityView, "setUserInteractionEnabled:", 0);
        v32 = self->__lockButtonOuterLegibilityView;
        -[CAMDynamicShutterControl _lockButtonOuterView](self, "_lockButtonOuterView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMDynamicShutterControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v32, v33);

      }
      if (!self->__pauseResumeButtonLegibilityView)
      {
        v34 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v35 = (UIView *)objc_msgSend(v34, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        pauseResumeButtonLegibilityView = self->__pauseResumeButtonLegibilityView;
        self->__pauseResumeButtonLegibilityView = v35;

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->__pauseResumeButtonLegibilityView, "setBackgroundColor:", v37);

        -[UIView setUserInteractionEnabled:](self->__pauseResumeButtonLegibilityView, "setUserInteractionEnabled:", 0);
        v38 = self->__pauseResumeButtonLegibilityView;
        -[CAMDynamicShutterControl _pauseResumeButtonOuterView](self, "_pauseResumeButtonOuterView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMDynamicShutterControl insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v38, v39);

      }
    }
    -[CAMDynamicShutterControl _updateCenterLegibilityView](self, "_updateCenterLegibilityView");
    -[CAMDynamicShutterControl setNeedsLayout](self, "setNeedsLayout");
    -[CAMDynamicShutterControl _displayLink](self, "_displayLink");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPaused:", 0);

  }
}

- (void)_updateCenterLegibilityView
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[CAMDynamicShutterControl settings](self, "settings");
  if (v5)
    v3 = 1;
  else
    v3 = -[CAMDynamicShutterControl showContrastBorder](self, "showContrastBorder") ^ 1;
  -[CAMDynamicShutterControl _centerOuterLegibilityView](self, "_centerOuterLegibilityView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setShowDisabled:(BOOL)a3
{
  -[CAMDynamicShutterControl setShowDisabled:animated:](self, "setShowDisabled:animated:", a3, 0);
}

- (void)setShowDisabled:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];

  if (self->_showDisabled != a3)
  {
    self->_showDisabled = a3;
    v4 = 0.3;
    if (!a4)
      v4 = 0.0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__CAMDynamicShutterControl_setShowDisabled_animated___block_invoke;
    v5[3] = &unk_1EA328868;
    v5[4] = self;
    +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", 2, v5, 0, v4);
  }
}

uint64_t __53__CAMDynamicShutterControl_setShowDisabled_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateMetalViewAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "_updateOuterAndInnerLayersAnimated:", 0);
}

- (void)_updateMetalViewAlpha
{
  double v3;
  id v4;

  if (-[CAMDynamicShutterControl isSpinning](self, "isSpinning"))
  {
    v3 = 0.2;
  }
  else if (-[CAMDynamicShutterControl showDisabled](self, "showDisabled"))
  {
    v3 = 0.4;
  }
  else
  {
    v3 = 1.0;
  }
  -[CAMDynamicShutterControl _metalView](self, "_metalView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (int64_t)_consumeAndUpdateTouchSequencePhase
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;

  v3 = -[CAMDynamicShutterControl _touchSequencePhase](self, "_touchSequencePhase");
  v4 = v3;
  if (v3 == 1)
  {
    v5 = 2;
    goto LABEL_5;
  }
  if (v3 == 3)
  {
    v5 = 0;
LABEL_5:
    -[CAMDynamicShutterControl _setTouchSequencePhase:](self, "_setTouchSequencePhase:", v5);
  }
  return v4;
}

- (BOOL)_isActiveTouchSequencePhase:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (void)_updateForTargetTimestamp:(double)a3
{
  int64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = -[CAMDynamicShutterControl _consumeAndUpdateTouchSequencePhase](self, "_consumeAndUpdateTouchSequencePhase");
  v6 = -[CAMDynamicShutterControl _isActiveTouchSequencePhase:](self, "_isActiveTouchSequencePhase:", v5);
  -[CAMDynamicShutterControl _updateTrackingSpringTargets](self, "_updateTrackingSpringTargets");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CAMDynamicShutterControl _springs](self, "_springs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v11++), "updateForTimestamp:", a3);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  -[CAMDynamicShutterControl _innerShapeWidthSpring](self, "_innerShapeWidthSpring");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isConverged");

  if (v13)
  {
    -[CAMDynamicShutterControl _innerShapeWidthSpring](self, "_innerShapeWidthSpring");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTension:", 240.0);

    -[CAMDynamicShutterControl _innerShapeWidthSpring](self, "_innerShapeWidthSpring");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFriction:", 30.0);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CAMDynamicShutterControl _springs](self, "_springs", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
LABEL_12:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v19)
        objc_enumerationMutation(v16);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20), "isConverged"))
        goto LABEL_20;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v18)
          goto LABEL_12;
        break;
      }
    }
  }

  if (!v6)
  {
    -[CAMDynamicShutterControl _displayLink](self, "_displayLink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPaused:", 1);
LABEL_20:

  }
  -[CAMDynamicShutterControl _updateStateToLongPressIfNeededWithPhase:](self, "_updateStateToLongPressIfNeededWithPhase:", v5);
  -[CAMDynamicShutterControl _updateViewsFromCurrentState](self, "_updateViewsFromCurrentState");
  -[CAMDynamicShutterControl _updateRendererShapes](self, "_updateRendererShapes");
  -[CAMDynamicShutterControl _liquidShutterRenderer](self, "_liquidShutterRenderer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "renderIfNecessary");

}

- (void)_updateStateToLongPressIfNeededWithPhase:(int64_t)a3
{
  _BOOL4 v4;
  int64_t v5;
  _BOOL4 v6;
  int64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  int v11;
  double Current;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;

  v4 = -[CAMDynamicShutterControl _isActiveTouchSequencePhase:](self, "_isActiveTouchSequencePhase:", a3);
  v5 = -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
  if ((v5 == 5 || !v5) && v4)
  {
    v6 = -[CAMDynamicShutterControl _isExternalShutterPressed](self, "_isExternalShutterPressed");
    -[CAMDynamicShutterControl settings](self, "settings");
    v7 = -[CAMDynamicShutterControl _externalShutterLongPressBehavior](self, "_externalShutterLongPressBehavior");
    -[CAMDynamicShutterControl settings](self, "settings");
    v8 = 0;
    v9 = v7 == 1 && v6;
    v10 = v9 || !v6;
    if (v17 == 1)
      v11 = v10;
    else
      v11 = 0;
    if (v6 && v7 == 2)
      v8 = v16 == 1;
    Current = CFAbsoluteTimeGetCurrent();
    -[CAMDynamicShutterControl _firstTouch](self, "_firstTouch");
    v13 = Current - v15;
    if (v6)
      -[CAMDynamicShutterControl _externalLongPressVideoDuration](self, "_externalLongPressVideoDuration");
    else
      -[CAMDynamicShutterControl _longPressVideoDuration](self, "_longPressVideoDuration");
    if (v13 >= v14)
    {
      if (v11)
      {
        -[CAMDynamicShutterControl _setShutterState:](self, "_setShutterState:", 4);
      }
      else if (v8)
      {
        -[CAMDynamicShutterControl _setShutterState:](self, "_setShutterState:", 1);
        -[CAMDynamicShutterControl _setInnerShapeState:animated:](self, "_setInnerShapeState:animated:", 2, 1);
        -[CAMDynamicShutterControl _setDragHandleState:](self, "_setDragHandleState:", 1);
      }
    }
  }
}

- (void)_updateTrackingSpringTargets
{
  -[CAMDynamicShutterControl _updateDragHandleWidthTarget](self, "_updateDragHandleWidthTarget");
  -[CAMDynamicShutterControl _updateInnerShapeWidthTarget](self, "_updateInnerShapeWidthTarget");
}

- (void)_updateSpringTargetsAnimated:(BOOL)a3
{
  id v4;

  -[CAMDynamicShutterControl _updateStaticDragHandleOffsetTargetAnimated:](self, "_updateStaticDragHandleOffsetTargetAnimated:", a3);
  -[CAMDynamicShutterControl _updateDragHandleWidthTarget](self, "_updateDragHandleWidthTarget");
  -[CAMDynamicShutterControl _updateDragHandleColorIsWhiteTarget](self, "_updateDragHandleColorIsWhiteTarget");
  -[CAMDynamicShutterControl _updateDragHandleAlphaTarget](self, "_updateDragHandleAlphaTarget");
  -[CAMDynamicShutterControl _updateInnerShapeWidthTarget](self, "_updateInnerShapeWidthTarget");
  -[CAMDynamicShutterControl _updateInnerShapePowerTarget](self, "_updateInnerShapePowerTarget");
  -[CAMDynamicShutterControl _updateInnerShapeColorIsRedTarget](self, "_updateInnerShapeColorIsRedTarget");
  -[CAMDynamicShutterControl _updateInnerShapeAlphaTarget](self, "_updateInnerShapeAlphaTarget");
  -[CAMDynamicShutterControl _updateDrawLockUITarget](self, "_updateDrawLockUITarget");
  -[CAMDynamicShutterControl _updateExpandLockRingTarget](self, "_updateExpandLockRingTarget");
  -[CAMDynamicShutterControl _updatePauseResumeDrawTarget](self, "_updatePauseResumeDrawTarget");
  -[CAMDynamicShutterControl _updatePausedDuringVideoTarget](self, "_updatePausedDuringVideoTarget");
  -[CAMDynamicShutterControl _displayLink](self, "_displayLink");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", 0);

}

- (void)_updateStaticDragHandleOffsetTargetAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  id v12;

  v3 = a3;
  -[CAMDynamicShutterControl _lockButtonCenter](self, "_lockButtonCenter");
  v6 = v5;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  v8 = v7;
  v9 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
  if (v9 - 6 >= 3)
  {
    if (v9 > 1)
      return;
    -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v11 = 0.0;
  }
  else
  {
    -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v11 = v6 - v8;
  }
  objc_msgSend(v10, "setTarget:animated:", v3, v11);

}

- (void)_updateTrackingDragHandleOffsetTargetWithPoint:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  void *v9;
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  int v19;
  double v20;
  id v21;

  x = a3.x;
  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter", a3.x, a3.y);
  v6 = x - v5;
  if (-[CAMDynamicShutterControl _isTrackingHandleState:](self, "_isTrackingHandleState:", -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState")))
  {
    -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTarget:", v6);

  }
  v8 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
  if (v8 <= 8)
  {
    if (((1 << v8) & 0x1D7) == 0)
    {
      if (v8 == 3)
      {
        if (v6 >= 0.0)
          v11 = !-[CAMDynamicShutterControl _canDragStartStop](self, "_canDragStartStop");
        else
          v11 = 0;
        if (v6 >= 0.0)
          v19 = 0;
        else
          v19 = !-[CAMDynamicShutterControl _canDragCounter](self, "_canDragCounter");
        if (v11 | v19)
          v20 = 0.85;
        else
          v20 = 0.6;
        -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v16;
        v18 = 0.0;
        v17 = v20;
      }
      else
      {
        -[CAMDynamicShutterControl _lockButtonCenter](self, "_lockButtonCenter");
        v13 = v12;
        -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
        v15 = v13 - v14;
        -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v16;
        v17 = 0.9;
        v18 = v15;
      }
      objc_msgSend(v16, "setSecondaryTarget:withStrength:animated:", 1, v18, v17);
      goto LABEL_21;
    }
    -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasSecondaryTarget");

    if (v10)
    {
      -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeSecondaryTargetAnimated:", 1);
LABEL_21:

    }
  }
}

- (void)_updateDragHandleWidthTarget
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  CAMPixelWidthForView(self);
  switch(-[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState"))
  {
    case 0:
      -[CAMDynamicShutterControl _dragHandleWidthSpring](self, "_dragHandleWidthSpring");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 35.0;
      goto LABEL_7;
    case 1:
    case 6:
    case 8:
      -[CAMDynamicShutterControl _dragHandleWidthSpring](self, "_dragHandleWidthSpring");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 0.0;
      goto LABEL_7;
    case 2:
    case 4:
    case 5:
      -[CAMDynamicShutterControl _dragHandleWidthSpring](self, "_dragHandleWidthSpring");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 40.5;
      goto LABEL_7;
    case 3:
      -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");

      CEKProgressClamped();
      CEKInterpolate();
      v7 = v6 * 0.9;
      -[CAMDynamicShutterControl _dragHandleWidthSpring](self, "_dragHandleWidthSpring");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v3;
      v4 = v7;
      goto LABEL_8;
    case 7:
      -[CAMDynamicShutterControl _dragHandleWidthSpring](self, "_dragHandleWidthSpring");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 45.0;
LABEL_7:
      v8 = v3;
LABEL_8:
      objc_msgSend(v3, "setTarget:", v4);

      break;
    default:
      return;
  }
}

- (void)_updateDragHandleColorIsWhiteTarget
{
  unint64_t v3;
  void *v4;
  double v5;
  id v6;

  v3 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
  if (v3 <= 8)
  {
    if (((1 << v3) & 0x1F4) != 0)
    {
      -[CAMDynamicShutterControl _dragHandleColorIsWhiteSpring](self, "_dragHandleColorIsWhiteSpring");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1.0;
    }
    else
    {
      -[CAMDynamicShutterControl _dragHandleColorIsWhiteSpring](self, "_dragHandleColorIsWhiteSpring");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0.0;
    }
    v6 = v4;
    objc_msgSend(v4, "setTarget:", v5);

  }
}

- (void)_updateDragHandleAlphaTarget
{
  unint64_t v3;
  void *v4;
  double v5;
  id v6;

  if (!-[CAMDynamicShutterControl _isDraggingEnabled](self, "_isDraggingEnabled"))
    goto LABEL_5;
  v3 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
  if (v3 > 8)
    return;
  if (((1 << v3) & 0xBC) != 0)
  {
    -[CAMDynamicShutterControl _dragHandleAlphaSpring](self, "_dragHandleAlphaSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1.0;
  }
  else
  {
LABEL_5:
    -[CAMDynamicShutterControl _dragHandleAlphaSpring](self, "_dragHandleAlphaSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0.0;
  }
  v6 = v4;
  objc_msgSend(v4, "setTarget:", v5);

}

- (void)_updateInnerShapeWidthTarget
{
  void *v3;
  void *v4;
  int64_t v5;
  double v6;
  double InnerCircleDiameter;
  _BOOL4 v8;
  void *v9;
  double v10;
  double v11;
  char v12;
  double v13;
  double v14[5];
  double v15[5];

  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  CAMShutterButtonSpecGetInnerCircleDiameter(v15);
  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  if (-[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState") == 3)
  {
    -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");

    -[CAMDynamicShutterControl _dragHandleOffsetSpring](self, "_dragHandleOffsetSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    CEKProgressClamped();

    CEKInterpolate();
    InnerCircleDiameter = v6;
    v8 = 1;
  }
  else
  {
    v5 = -[CAMDynamicShutterControl _innerShapeState](self, "_innerShapeState");
    if (v5 == 1)
    {
      -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
      InnerCircleDiameter = v13;
    }
    else
    {
      InnerCircleDiameter = 0.0;
      if (!v5)
      {
        -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
        InnerCircleDiameter = CAMShutterButtonSpecGetInnerCircleDiameter(v14);
      }
    }
    v8 = -[CAMDynamicShutterControl _isActiveTouchSequencePhase:](self, "_isActiveTouchSequencePhase:", -[CAMDynamicShutterControl _touchSequencePhase](self, "_touchSequencePhase"));
    -[CAMDynamicShutterControl _mostRecentTouch](self, "_mostRecentTouch");
    if (!v12)
      v8 = 0;
  }
  if (-[CAMDynamicShutterControl isPausedDuringVideo](self, "isPausedDuringVideo"))
  {
    -[CAMDynamicShutterControl _pauseResumeButtonSpec](self, "_pauseResumeButtonSpec");
    -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
    InnerCircleDiameter = InnerCircleDiameter * (v11 / v10);
  }
  if (v8)
    InnerCircleDiameter = InnerCircleDiameter * 0.9;
  -[CAMDynamicShutterControl _innerShapeWidthSpring](self, "_innerShapeWidthSpring");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTarget:", InnerCircleDiameter);

}

- (void)_updateInnerShapePowerTarget
{
  int64_t v3;
  uint64_t *v4;
  double v5;
  id v6;

  v3 = -[CAMDynamicShutterControl _innerShapeState](self, "_innerShapeState");
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      v4 = &CAMLiquidShutterPowerSquare;
      goto LABEL_6;
    }
    if (v3)
      return;
  }
  v4 = &CAMLiquidShutterPowerCircle;
LABEL_6:
  v5 = *(double *)v4;
  -[CAMDynamicShutterControl _innerShapePowerSpring](self, "_innerShapePowerSpring");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTarget:", v5);

}

- (void)_updateInnerShapeColorIsRedTarget
{
  int v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", -[CAMDynamicShutterControl _shutterState](self, "_shutterState"));
  -[CAMDynamicShutterControl settings](self, "settings");
  -[CAMDynamicShutterControl settings](self, "settings");
  if ((v3 & (v7 == 1)) != 0)
    v4 = 1.0;
  else
    v4 = (double)((v6 == 1) & ~v3);
  -[CAMDynamicShutterControl _innerShapeColorIsRedSpring](self, "_innerShapeColorIsRedSpring");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTarget:", v4);

}

- (void)_updateInnerShapeAlphaTarget
{
  unint64_t v3;
  void *v4;
  double v5;
  id v6;

  v3 = -[CAMDynamicShutterControl _innerShapeState](self, "_innerShapeState");
  if (v3 >= 2)
  {
    if (v3 != 2)
      return;
    -[CAMDynamicShutterControl _innerShapeAlphaSpring](self, "_innerShapeAlphaSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0.0;
  }
  else
  {
    -[CAMDynamicShutterControl _innerShapeAlphaSpring](self, "_innerShapeAlphaSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1.0;
  }
  v6 = v4;
  objc_msgSend(v4, "setTarget:", v5);

}

- (void)_updateDrawLockUITarget
{
  _BOOL4 v3;
  int64_t v4;
  _BOOL4 v5;
  _BOOL4 v6;
  unint64_t v7;
  void *v8;
  double v9;
  id v10;

  v3 = -[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", -[CAMDynamicShutterControl _shutterState](self, "_shutterState"));
  v4 = -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
  v5 = -[CAMDynamicShutterControl _isExternalShutterPressed](self, "_isExternalShutterPressed");
  v6 = -[CAMDynamicShutterControl _isDraggingEnabled](self, "_isDraggingEnabled");
  if (!v3 || v4 == 5 || v5 || !v6)
    goto LABEL_8;
  v7 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
  if (v7 > 8)
    return;
  if (((1 << v7) & 0xF8) != 0)
  {
    -[CAMDynamicShutterControl _drawLockUISpring](self, "_drawLockUISpring");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1.0;
  }
  else
  {
LABEL_8:
    -[CAMDynamicShutterControl _drawLockUISpring](self, "_drawLockUISpring");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
  }
  v10 = v8;
  objc_msgSend(v8, "setTarget:", v9);

}

- (void)_updateExpandLockRingTarget
{
  unint64_t v3;
  void *v4;
  double v5;
  id v6;

  v3 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
  if (v3 - 4 >= 5)
  {
    if (v3 > 3)
      return;
    -[CAMDynamicShutterControl _expandLockRingSpring](self, "_expandLockRingSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0.0;
  }
  else
  {
    -[CAMDynamicShutterControl _expandLockRingSpring](self, "_expandLockRingSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1.0;
  }
  v6 = v4;
  objc_msgSend(v4, "setTarget:", v5);

}

- (void)_updatePauseResumeDrawTarget
{
  double v3;
  id v4;

  v3 = 0.0;
  if ((-[CAMDynamicShutterControl privateSettings](self, "privateSettings") & 1) != 0)
  {
    if ((-[CAMDynamicShutterControl _shutterState](self, "_shutterState") & 0xFFFFFFFFFFFFFFFELL) == 2)
      v3 = 1.0;
    else
      v3 = 0.0;
  }
  -[CAMDynamicShutterControl _drawPauseResumeUISpring](self, "_drawPauseResumeUISpring");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTarget:", v3);

}

- (void)_updatePausedDuringVideoTarget
{
  double v3;
  id v4;

  v3 = 0.0;
  if ((-[CAMDynamicShutterControl privateSettings](self, "privateSettings") & 1) != 0)
  {
    if (-[CAMDynamicShutterControl isPausedDuringVideo](self, "isPausedDuringVideo"))
      v3 = 1.0;
    else
      v3 = 0.0;
  }
  -[CAMDynamicShutterControl _pausedDuringVideoSpring](self, "_pausedDuringVideoSpring");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTarget:", v3);

}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_dragHandleColor
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  -[CAMDynamicShutterControl _innerShapeColor](self, "_innerShapeColor");
  CAMLiquidShutterColorForShutterColor(0);
  -[CAMDynamicShutterControl _dragHandleColorIsWhiteSpring](self, "_dragHandleColorIsWhiteSpring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");

  CEKInterpolate();
  v5 = v4;
  CEKInterpolate();
  v7 = v6;
  CEKInterpolate();
  v9 = v8;
  -[CAMDynamicShutterControl _dragHandleAlphaSpring](self, "_dragHandleAlphaSpring");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v12 = v11;

  v13 = v5;
  v14 = v7;
  v15 = v9;
  v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_innerShapeColor
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  CAMLiquidShutterColorForShutterColor(0);
  CAMLiquidShutterColorForShutterColor(1);
  -[CAMDynamicShutterControl _innerShapeColorIsRedSpring](self, "_innerShapeColorIsRedSpring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");

  CEKInterpolate();
  v5 = v4;
  CEKInterpolate();
  v7 = v6;
  CEKInterpolate();
  v9 = v8;
  -[CAMDynamicShutterControl _innerShapeAlphaSpring](self, "_innerShapeAlphaSpring");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v12 = v11;

  v13 = v5;
  v14 = v7;
  v15 = v9;
  v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)_updateRendererShapes
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  _BOOL4 v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[8];
  _QWORD v53[8];

  -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
  v4 = v3;
  v6 = v5;
  -[CAMDynamicShutterControl _dragHandleXPosition](self, "_dragHandleXPosition");
  v8 = v7;
  -[CAMDynamicShutterControl _innerShapeColor](self, "_innerShapeColor");
  v50 = v10;
  v51 = v9;
  v48 = v12;
  v49 = v11;
  -[CAMDynamicShutterControl _metalView](self, "_metalView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDynamicShutterControl convertPoint:toView:](self, "convertPoint:toView:", v13, v4, v6);
  v46 = v15;
  v47 = v14;

  -[CAMDynamicShutterControl _innerShapePowerSpring](self, "_innerShapePowerSpring");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "value");
  v45 = v17;

  -[CAMDynamicShutterControl _innerShapeWidthSpring](self, "_innerShapeWidthSpring");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "value");
  v20 = v19;

  -[CAMDynamicShutterControl _dragHandleColor](self, "_dragHandleColor");
  v44 = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[CAMDynamicShutterControl _metalView](self, "_metalView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDynamicShutterControl convertPoint:toView:](self, "convertPoint:toView:", v28, v8, v6);
  v30 = v29;
  v32 = v31;

  -[CAMDynamicShutterControl _dragHandleWidthSpring](self, "_dragHandleWidthSpring");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "value");
  v35 = v34;

  -[CAMDynamicShutterControl _liquidShutterRenderer](self, "_liquidShutterRenderer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v47;
  v53[1] = v46;
  v53[2] = v20;
  v53[3] = v51;
  v53[4] = v50;
  v53[5] = v49;
  v53[6] = v48;
  v53[7] = v45;
  objc_msgSend(v36, "setCenterShape:", v53);

  -[CAMDynamicShutterControl _liquidShutterRenderer](self, "_liquidShutterRenderer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v30;
  v52[1] = v32;
  v52[2] = v35;
  v52[3] = v44;
  v52[4] = v23;
  v52[5] = v25;
  v52[6] = v27;
  v52[7] = 0x4000000000000000;
  objc_msgSend(v37, "setDragHandleShape:", v52);

  v38 = -[CAMDynamicShutterControl _isDraggingEnabled](self, "_isDraggingEnabled");
  -[CAMDynamicShutterControl _liquidShutterRenderer](self, "_liquidShutterRenderer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setShowDragHandle:", v38);

  v40 = -[CAMDynamicShutterControl showContrastBorder](self, "showContrastBorder");
  if (v40)
  {
    -[CAMDynamicShutterControl traitCollection](self, "traitCollection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "displayScale");
    v42 = v41;
  }
  else
  {
    v42 = 0.0;
  }
  -[CAMDynamicShutterControl _liquidShutterRenderer](self, "_liquidShutterRenderer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setShadowSize:", v42);

  if (v40)
}

- (void)_updateViewsFromCurrentState
{
  -[CAMDynamicShutterControl _updateCenterButton](self, "_updateCenterButton");
  -[CAMDynamicShutterControl _updateLeftLine](self, "_updateLeftLine");
  -[CAMDynamicShutterControl _updateRightLine](self, "_updateRightLine");
  -[CAMDynamicShutterControl _updateLockUI](self, "_updateLockUI");
  -[CAMDynamicShutterControl _updatePauseResumeUI](self, "_updatePauseResumeUI");
  -[CAMDynamicShutterControl _updateCounterAlpha](self, "_updateCounterAlpha");
}

- (void)_updateLeftLine
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  double v27;

  v3 = -[CAMDynamicShutterControl _shutterState](self, "_shutterState");
  if (v3 - 2 >= 4)
  {
    if (v3 <= 1)
    {
      -[CAMDynamicShutterControl _leftLineView](self, "_leftLineView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 1.0;
      objc_msgSend(v5, "setAlpha:", 1.0);

      if (!-[CAMDynamicShutterControl showContrastBorder](self, "showContrastBorder"))
        v6 = 0.0;
      -[CAMDynamicShutterControl _leftLineLegibilityView](self, "_leftLineLegibilityView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", v6);

      -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
      v9 = v8;
      -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
      -[CAMDynamicShutterControl _dragHandleXPosition](self, "_dragHandleXPosition");
      v11 = fmax(v9 + v27 * -0.5 - v10, 0.0);
      -[CAMDynamicShutterControl _dragHandleXPosition](self, "_dragHandleXPosition");
      v13 = v12;
      -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
      v15 = v14 + -0.5;
      -[CAMDynamicShutterControl _leftLineView](self, "_leftLineView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrame:", v13, v15, v11, 1.0);

      UIRectInset();
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      -[CAMDynamicShutterControl _leftLineLegibilityView](self, "_leftLineLegibilityView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    }
  }
  else
  {
    -[CAMDynamicShutterControl _leftLineView](self, "_leftLineView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[CAMDynamicShutterControl _leftLineLegibilityView](self, "_leftLineLegibilityView");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlpha:", 0.0);

  }
}

- (void)_updateRightLine
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  double v33;

  if (-[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState") == 1
    || !-[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", -[CAMDynamicShutterControl _shutterState](self, "_shutterState")))
  {
    -[CAMDynamicShutterControl _rightLineView](self, "_rightLineView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAlpha:", 0.0);

    -[CAMDynamicShutterControl _rightLineLegibilityView](self, "_rightLineLegibilityView");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAlpha:", 0.0);

  }
  else
  {
    v3 = 4.0 - CAMPixelWidthForView(self);
    -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
    v5 = v4;
    -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
    v6 = v3 + v5 + v33 * 0.5;
    -[CAMDynamicShutterControl _dragHandleXPosition](self, "_dragHandleXPosition");
    if (v6 < v7)
      v6 = v7;
    -[CAMDynamicShutterControl _shutterButtonCenter](self, "_shutterButtonCenter");
    v9 = v8 + -0.5;
    -[CAMDynamicShutterControl _lockButtonInactiveSpec](self, "_lockButtonInactiveSpec");
    -[CAMDynamicShutterControl _lockButtonActiveSpec](self, "_lockButtonActiveSpec");
    -[CAMDynamicShutterControl _expandLockRingSpring](self, "_expandLockRingSpring");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    CEKInterpolate();
    v12 = v11;

    -[CAMDynamicShutterControl _lockButtonCenter](self, "_lockButtonCenter");
    v14 = v13 + v12 * -0.5 - v3 - v6;
    -[CAMDynamicShutterControl _drawLockUISpring](self, "_drawLockUISpring");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v17 = v16 * v14;

    -[CAMDynamicShutterControl _rightLineView](self, "_rightLineView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v6, v9, fmax(v17, 0.0), 1.0);

    UIRectInset();
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    -[CAMDynamicShutterControl _rightLineLegibilityView](self, "_rightLineLegibilityView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

    -[CAMDynamicShutterControl _rightLineView](self, "_rightLineView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAlpha:", 0.5);

    if (-[CAMDynamicShutterControl showContrastBorder](self, "showContrastBorder"))
      v29 = 0.5;
    else
      v29 = 0.0;
    -[CAMDynamicShutterControl _rightLineLegibilityView](self, "_rightLineLegibilityView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAlpha:", v29);

  }
}

- (void)_updateLockUI
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;

  -[CAMDynamicShutterControl _drawLockUISpring](self, "_drawLockUISpring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");

  -[CAMDynamicShutterControl _expandLockRingSpring](self, "_expandLockRingSpring");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");

  CEKInterpolate();
  CEKInterpolate();
  v6 = v5;
  -[CAMDynamicShutterControl _lockButtonOuterView](self, "_lockButtonOuterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  if (!-[CAMDynamicShutterControl showContrastBorder](self, "showContrastBorder"))
    v6 = 0.0;
  -[CAMDynamicShutterControl _lockButtonOuterLegibilityView](self, "_lockButtonOuterLegibilityView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v6);

  -[CAMDynamicShutterControl _lockButtonInactiveSpec](self, "_lockButtonInactiveSpec");
  -[CAMDynamicShutterControl _lockButtonActiveSpec](self, "_lockButtonActiveSpec");
  CEKInterpolate();
  CEKInterpolate();
  v10 = v9;
  v11 = v9 * 0.5;
  -[CAMDynamicShutterControl _lockButtonOuterView](self, "_lockButtonOuterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v10, v10);

  -[CAMDynamicShutterControl _lockButtonOuterView](self, "_lockButtonOuterView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v11);

  UIRectInset();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[CAMDynamicShutterControl _lockButtonOuterLegibilityView](self, "_lockButtonOuterLegibilityView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBounds:", v16, v18, v20, v22);

  -[CAMDynamicShutterControl _lockButtonOuterLegibilityView](self, "_lockButtonOuterLegibilityView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCornerRadius:", v11 + 1.0);

  -[CAMDynamicShutterControl _lockButtonInactiveSpec](self, "_lockButtonInactiveSpec");
  -[CAMDynamicShutterControl _lockButtonActiveSpec](self, "_lockButtonActiveSpec");
  CEKInterpolate();
  v27 = v26;
  -[CAMDynamicShutterControl _lockButtonOuterView](self, "_lockButtonOuterView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBorderWidth:", v27);

  -[CAMDynamicShutterControl _updateLockGlyphTransformAndAlpha](self, "_updateLockGlyphTransformAndAlpha");
}

- (void)_updatePauseResumeUI
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double InnerCircleDiameter;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
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
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  CGFloat v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  double v55[5];
  double v56[5];

  -[CAMDynamicShutterControl _drawPauseResumeUISpring](self, "_drawPauseResumeUISpring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = v4;

  -[CAMDynamicShutterControl _pausedDuringVideoSpring](self, "_pausedDuringVideoSpring");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");

  CEKInterpolateClamped();
  v8 = v7;
  CEKInterpolateClamped();
  v45 = v9;
  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  InnerCircleDiameter = CAMShutterButtonSpecGetInnerCircleDiameter(v56);
  -[CAMDynamicShutterControl _pauseResumeButtonSpec](self, "_pauseResumeButtonSpec");
  CAMShutterButtonSpecGetInnerCircleDiameter(v55);
  CEKInterpolateClamped();
  CEKProgressClamped();
  -[CAMDynamicShutterControl _pauseResumeButtonSpec](self, "_pauseResumeButtonSpec");
  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  CEKInterpolateClamped();
  CEKInterpolateClamped();
  v12 = v11;
  -[CAMDynamicShutterControl _pauseResumeButtonSpec](self, "_pauseResumeButtonSpec");
  -[CAMDynamicShutterControl _shutterButtonSpec](self, "_shutterButtonSpec");
  CEKInterpolateClamped();
  v14 = v13;
  -[CAMDynamicShutterControl _pauseResumeButtonCenter](self, "_pauseResumeButtonCenter");
  v16 = v15;
  v18 = v17;
  -[CAMDynamicShutterControl _pauseResumeButtonOuterView](self, "_pauseResumeButtonOuterView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", v16, v18);

  -[CAMDynamicShutterControl _pauseResumeButtonOuterView](self, "_pauseResumeButtonOuterView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, v12, v12);

  -[CAMDynamicShutterControl _pauseResumeButtonOuterView](self, "_pauseResumeButtonOuterView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", v12 * 0.5);

  -[CAMDynamicShutterControl _pauseResumeButtonOuterView](self, "_pauseResumeButtonOuterView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBorderWidth:", v14);

  -[CAMDynamicShutterControl _pauseResumeButtonOuterView](self, "_pauseResumeButtonOuterView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAlpha:", v5 * v5);

  -[CAMDynamicShutterControl _pauseResumeButtonLegibilityView](self, "_pauseResumeButtonLegibilityView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCenter:", v16, v18);

  -[CAMDynamicShutterControl _pauseResumeButtonLegibilityView](self, "_pauseResumeButtonLegibilityView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v12 + 2.0, v12 + 2.0);

  -[CAMDynamicShutterControl _pauseResumeButtonLegibilityView](self, "_pauseResumeButtonLegibilityView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCornerRadius:", (v12 + 2.0) * 0.5);

  if (-[CAMDynamicShutterControl showContrastBorder](self, "showContrastBorder"))
    v30 = v5 * v5;
  else
    v30 = 0.0;
  -[CAMDynamicShutterControl _pauseResumeButtonLegibilityView](self, "_pauseResumeButtonLegibilityView", v5 * v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAlpha:", v30);

  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeScale(&v54, v8, v8);
  memset(&v53, 0, sizeof(v53));
  CGAffineTransformMakeScale(&v53, v45, v45);
  memset(&v52, 0, sizeof(v52));
  CAMOrientationTransform(-[CAMDynamicShutterControl orientation](self, "orientation"), (uint64_t)&v52);
  -[CAMDynamicShutterControl _pauseImageView](self, "_pauseImageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCenter:", v16, v18);

  CEKInterpolateClamped();
  v34 = v33;
  -[CAMDynamicShutterControl _pauseImageView](self, "_pauseImageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAlpha:", v34);

  t1 = v52;
  t2 = v54;
  CGAffineTransformConcat(&v51, &t1, &t2);
  -[CAMDynamicShutterControl _pauseImageView](self, "_pauseImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v51;
  objc_msgSend(v36, "setTransform:", &v48);

  -[CAMDynamicShutterControl _resumeCircleView](self, "_resumeCircleView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setCenter:", v16, v18);

  -[CAMDynamicShutterControl _resumeCircleView](self, "_resumeCircleView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBounds:", 0.0, 0.0, InnerCircleDiameter, InnerCircleDiameter);

  -[CAMDynamicShutterControl _resumeCircleView](self, "_resumeCircleView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setCornerRadius:", InnerCircleDiameter * 0.5);

  CEKInterpolateClamped();
  v42 = v41;
  -[CAMDynamicShutterControl _resumeCircleView](self, "_resumeCircleView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAlpha:", v42);

  v47 = v53;
  -[CAMDynamicShutterControl _resumeCircleView](self, "_resumeCircleView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v47;
  objc_msgSend(v44, "setTransform:", &v46);

}

- (void)_updateLockGlyphTransformAndAlpha
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  -[CAMDynamicShutterControl _drawLockUISpring](self, "_drawLockUISpring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = v4;

  -[CAMDynamicShutterControl _expandLockRingSpring](self, "_expandLockRingSpring");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v8 = v7;

  v9 = -[CAMDynamicShutterControl _dragHandleState](self, "_dragHandleState");
  if (v9 == 6)
    v10 = v8;
  else
    v10 = 0.0;
  if (v9 == 3)
    v11 = v5 * (1.0 - v8);
  else
    v11 = v10;
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeScale(&v21, v11, v11);
  memset(&v20, 0, sizeof(v20));
  CAMOrientationTransform(-[CAMDynamicShutterControl orientation](self, "orientation"), (uint64_t)&v20);
  CEKInterpolateClamped();
  v13 = v12;
  -[CAMDynamicShutterControl _videoLockImageView](self, "_videoLockImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v13);

  t1 = v20;
  t2 = v21;
  CGAffineTransformConcat(&v19, &t1, &t2);
  -[CAMDynamicShutterControl _videoLockImageView](self, "_videoLockImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;
  objc_msgSend(v15, "setTransform:", &v16);

}

- (void)_updateCounterAlpha
{
  double v3;
  void *v4;
  double v5;
  id v6;

  v3 = 0.0;
  if (!-[CAMDynamicShutterControl _isStartStopShutterState:](self, "_isStartStopShutterState:", -[CAMDynamicShutterControl _shutterState](self, "_shutterState")))
  {
    -[CAMDynamicShutterControl _innerShapeAlphaSpring](self, "_innerShapeAlphaSpring");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v3 = 1.0 - v5;

  }
  -[CAMDynamicShutterControl _counterLabel](self, "_counterLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v3);

}

- (void)metalViewDidChangeDrawableSize:(id)a3
{
  void *v4;
  id v5;

  -[CAMDynamicShutterControl _liquidShutterRenderer](self, "_liquidShutterRenderer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markNeedsRender");

  -[CAMDynamicShutterControl _displayLink](self, "_displayLink");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaused:", 0);

}

- (CAMDynamicShutterControlDelegate)delegate
{
  return (CAMDynamicShutterControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- ($76EADD4ED24426C67044446678BAA581)settings
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[16].var2;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[16].var0;
  *(_OWORD *)&retstr->var6 = v3;
  retstr->var8 = *(_QWORD *)&self[16].var4;
  v4 = *(_OWORD *)&self[15].var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[15].var5;
  *(_OWORD *)&retstr->var2 = v4;
  return self;
}

- (BOOL)isSpinning
{
  return self->_spinning;
}

- (BOOL)isZooming
{
  return self->_zooming;
}

- (void)setZooming:(BOOL)a3
{
  self->_zooming = a3;
}

- (BOOL)showContrastBorder
{
  return self->_showContrastBorder;
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (BOOL)isPausedDuringVideo
{
  return self->_pausedDuringVideo;
}

- (void)setPausedDuringVideo:(BOOL)a3
{
  self->_pausedDuringVideo = a3;
}

- (double)lockButtonCenterRightInset
{
  return self->_lockButtonCenterRightInset;
}

- (double)pauseResumeButtonCenterLeftInset
{
  return self->_pauseResumeButtonCenterLeftInset;
}

- (void)setPauseResumeButtonCenterLeftInset:(double)a3
{
  self->_pauseResumeButtonCenterLeftInset = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CADisplayLink)_displayLink
{
  return self->__displayLink;
}

- (CEKDisplayLinkTarget)_displayLinkTarget
{
  return self->__displayLinkTarget;
}

- (CAMLiquidShutterRenderer)_liquidShutterRenderer
{
  return self->__liquidShutterRenderer;
}

- (CAMMetalView)_metalView
{
  return self->__metalView;
}

- (UIView)_centerOuterView
{
  return self->__centerOuterView;
}

- (UIImageView)_centerOuterImageView
{
  return self->__centerOuterImageView;
}

- (void)set_centerOuterImageView:(id)a3
{
  objc_storeStrong((id *)&self->__centerOuterImageView, a3);
}

- (UIView)_centerOuterLegibilityView
{
  return self->__centerOuterLegibilityView;
}

- (CAMTimelapseShutterRingView)_centerTimelapseOuterView
{
  return self->__centerTimelapseOuterView;
}

- (void)set_centerTimelapseOuterView:(id)a3
{
  objc_storeStrong((id *)&self->__centerTimelapseOuterView, a3);
}

- (UIView)_lockButtonOuterView
{
  return self->__lockButtonOuterView;
}

- (UIView)_lockButtonOuterLegibilityView
{
  return self->__lockButtonOuterLegibilityView;
}

- (UIImageView)_videoLockImageView
{
  return self->__videoLockImageView;
}

- (UIView)_pauseResumeButtonOuterView
{
  return self->__pauseResumeButtonOuterView;
}

- (UIView)_pauseResumeButtonLegibilityView
{
  return self->__pauseResumeButtonLegibilityView;
}

- (UIImageView)_pauseImageView
{
  return self->__pauseImageView;
}

- (UIView)_resumeCircleView
{
  return self->__resumeCircleView;
}

- (UIView)_leftLineView
{
  return self->__leftLineView;
}

- (UIView)_leftLineLegibilityView
{
  return self->__leftLineLegibilityView;
}

- (UIView)_rightLineView
{
  return self->__rightLineView;
}

- (UIView)_rightLineLegibilityView
{
  return self->__rightLineLegibilityView;
}

- (UILabel)_counterLabel
{
  return self->__counterLabel;
}

- (UIView)_spinnerView
{
  return self->__spinnerView;
}

- (void)set_spinnerView:(id)a3
{
  objc_storeStrong((id *)&self->__spinnerView, a3);
}

- (CAMShutterButtonSpec)_shutterButtonSpec
{
  __int128 v3;

  v3 = *(_OWORD *)&self[24].stopSquareSideLength;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[24].outerRingDiameter;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[24].interRingSpacing;
  return self;
}

- (CAMShutterButtonSpec)_lockButtonActiveSpec
{
  __int128 v3;

  v3 = *(_OWORD *)&self[25].stopSquareSideLength;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[25].outerRingDiameter;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[25].interRingSpacing;
  return self;
}

- (CAMShutterButtonSpec)_pauseResumeButtonSpec
{
  __int128 v3;

  v3 = *(_OWORD *)&self[26].stopSquareSideLength;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[26].outerRingDiameter;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[26].interRingSpacing;
  return self;
}

- (CAMShutterButtonSpec)_lockButtonInactiveSpec
{
  __int128 v3;

  v3 = *(_OWORD *)&self[27].stopSquareSideLength;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[27].outerRingDiameter;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->interRingSpacing = self[27].interRingSpacing;
  return self;
}

- (double)_touchBeganTime
{
  return self->__touchBeganTime;
}

- (void)_setTouchBeganTime:(double)a3
{
  self->__touchBeganTime = a3;
}

- (int64_t)_touchSequencePhase
{
  return self->__touchSequencePhase;
}

- (void)_setTouchSequencePhase:(int64_t)a3
{
  self->__touchSequencePhase = a3;
}

- ($E50CC26D34D0158E20D4445E4757B7F2)_firstTouch
{
  __int128 v3;

  v3 = *(_OWORD *)&self[28].var1;
  retstr->var0 = self[28].var0;
  *(_OWORD *)&retstr->var1 = v3;
  return self;
}

- ($E50CC26D34D0158E20D4445E4757B7F2)_mostRecentTouch
{
  __int128 v3;

  v3 = *(_OWORD *)&self[29].var1;
  retstr->var0 = self[29].var0;
  *(_OWORD *)&retstr->var1 = v3;
  return self;
}

- (void)_setMostRecentTouch:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var1;
  self->$2BE7AFF22295DED6A45A0E44EF7D16DF::point = a3->var0;
  *(_OWORD *)&self->$2BE7AFF22295DED6A45A0E44EF7D16DF::time = v3;
}

- (CAMDynamicShutterGestureRecognizer)_gestureRecognizer
{
  return self->__gestureRecognizer;
}

- (BOOL)_didCancelZoomForCurrentGesture
{
  return self->__didCancelZoomForCurrentGesture;
}

- (void)set_didCancelZoomForCurrentGesture:(BOOL)a3
{
  self->__didCancelZoomForCurrentGesture = a3;
}

- (double)_initalZoomGestureOffsetY
{
  return self->__initalZoomGestureOffsetY;
}

- (void)set_initalZoomGestureOffsetY:(double)a3
{
  self->__initalZoomGestureOffsetY = a3;
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (int64_t)_shutterState
{
  return self->__shutterState;
}

- (int64_t)_dragHandleState
{
  return self->__dragHandleState;
}

- (int64_t)_innerShapeState
{
  return self->__innerShapeState;
}

- (BOOL)_isExternalShutterPressed
{
  return self->__externalShutterPressed;
}

- (int64_t)_externalShutterLongPressBehavior
{
  return self->__externalShutterLongPressBehavior;
}

- (void)set_externalShutterLongPressBehavior:(int64_t)a3
{
  self->__externalShutterLongPressBehavior = a3;
}

- (BOOL)_isExternalLockButtonPressed
{
  return self->__externalLockButtonPressed;
}

- (void)_setExternalLockButtonPressed:(BOOL)a3
{
  self->__externalLockButtonPressed = a3;
}

- (int64_t)_counterValue
{
  return self->__counterValue;
}

- (BOOL)_shouldCheckTouchUpEvents
{
  return self->__shouldCheckTouchUpEvents;
}

- (void)set_shouldCheckTouchUpEvents:(BOOL)a3
{
  self->__shouldCheckTouchUpEvents = a3;
}

- (BOOL)_ignoreNextCancelledGesture
{
  return self->__ignoreNextCancelledGesture;
}

- (void)_setIgnoreNextCancelledGesture:(BOOL)a3
{
  self->__ignoreNextCancelledGesture = a3;
}

- (NSArray)_springs
{
  return self->__springs;
}

- (CAMTrackingSpring)_dragHandleOffsetSpring
{
  return self->__dragHandleOffsetSpring;
}

- (CAMSpring)_dragHandleWidthSpring
{
  return self->__dragHandleWidthSpring;
}

- (CAMSpring)_dragHandleColorIsWhiteSpring
{
  return self->__dragHandleColorIsWhiteSpring;
}

- (CAMSpring)_dragHandleAlphaSpring
{
  return self->__dragHandleAlphaSpring;
}

- (CAMSpring)_innerShapeWidthSpring
{
  return self->__innerShapeWidthSpring;
}

- (CAMSpring)_innerShapePowerSpring
{
  return self->__innerShapePowerSpring;
}

- (CAMSpring)_innerShapeColorIsRedSpring
{
  return self->__innerShapeColorIsRedSpring;
}

- (CAMSpring)_innerShapeAlphaSpring
{
  return self->__innerShapeAlphaSpring;
}

- (CAMSpring)_drawLockUISpring
{
  return self->__drawLockUISpring;
}

- (CAMSpring)_expandLockRingSpring
{
  return self->__expandLockRingSpring;
}

- (CAMSpring)_drawPauseResumeUISpring
{
  return self->__drawPauseResumeUISpring;
}

- (CAMSpring)_pausedDuringVideoSpring
{
  return self->__pausedDuringVideoSpring;
}

- (double)_longPressVideoDuration
{
  return self->__longPressVideoDuration;
}

- (void)set_longPressVideoDuration:(double)a3
{
  self->__longPressVideoDuration = a3;
}

- (double)_externalLongPressVideoDuration
{
  return self->__externalLongPressVideoDuration;
}

- (void)set_externalLongPressVideoDuration:(double)a3
{
  self->__externalLongPressVideoDuration = a3;
}

- ($E5C720D6BB068A42F0C2CD001350366C)privateSettings
{
  return ($E5C720D6BB068A42F0C2CD001350366C)self->_privateSettings.allowPauseResume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pausedDuringVideoSpring, 0);
  objc_storeStrong((id *)&self->__drawPauseResumeUISpring, 0);
  objc_storeStrong((id *)&self->__expandLockRingSpring, 0);
  objc_storeStrong((id *)&self->__drawLockUISpring, 0);
  objc_storeStrong((id *)&self->__innerShapeAlphaSpring, 0);
  objc_storeStrong((id *)&self->__innerShapeColorIsRedSpring, 0);
  objc_storeStrong((id *)&self->__innerShapePowerSpring, 0);
  objc_storeStrong((id *)&self->__innerShapeWidthSpring, 0);
  objc_storeStrong((id *)&self->__dragHandleAlphaSpring, 0);
  objc_storeStrong((id *)&self->__dragHandleColorIsWhiteSpring, 0);
  objc_storeStrong((id *)&self->__dragHandleWidthSpring, 0);
  objc_storeStrong((id *)&self->__dragHandleOffsetSpring, 0);
  objc_storeStrong((id *)&self->__springs, 0);
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__gestureRecognizer, 0);
  objc_storeStrong((id *)&self->__spinnerView, 0);
  objc_storeStrong((id *)&self->__counterLabel, 0);
  objc_storeStrong((id *)&self->__rightLineLegibilityView, 0);
  objc_storeStrong((id *)&self->__rightLineView, 0);
  objc_storeStrong((id *)&self->__leftLineLegibilityView, 0);
  objc_storeStrong((id *)&self->__leftLineView, 0);
  objc_storeStrong((id *)&self->__resumeCircleView, 0);
  objc_storeStrong((id *)&self->__pauseImageView, 0);
  objc_storeStrong((id *)&self->__pauseResumeButtonLegibilityView, 0);
  objc_storeStrong((id *)&self->__pauseResumeButtonOuterView, 0);
  objc_storeStrong((id *)&self->__videoLockImageView, 0);
  objc_storeStrong((id *)&self->__lockButtonOuterLegibilityView, 0);
  objc_storeStrong((id *)&self->__lockButtonOuterView, 0);
  objc_storeStrong((id *)&self->__centerTimelapseOuterView, 0);
  objc_storeStrong((id *)&self->__centerOuterLegibilityView, 0);
  objc_storeStrong((id *)&self->__centerOuterImageView, 0);
  objc_storeStrong((id *)&self->__centerOuterView, 0);
  objc_storeStrong((id *)&self->__metalView, 0);
  objc_storeStrong((id *)&self->__liquidShutterRenderer, 0);
  objc_storeStrong((id *)&self->__displayLinkTarget, 0);
  objc_storeStrong((id *)&self->__displayLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setShutterState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Dynamic Shutter: Attempted to enter counter mode directly from a start/stop mode", a5, a6, a7, a8, 0);
}

- (void)_setShutterState:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Dynamic Shutter: Attempted to enter a start/stop mode directly from the counter mode", a5, a6, a7, a8, 0);
}

@end
