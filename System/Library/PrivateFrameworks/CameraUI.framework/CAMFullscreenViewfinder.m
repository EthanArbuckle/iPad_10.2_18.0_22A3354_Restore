@implementation CAMFullscreenViewfinder

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMFullscreenViewfinder)initWithMetalContext:(id)a3 useCreativeCameraControls:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CAMFullscreenViewfinder *v11;
  void *v12;
  uint64_t v13;
  UIView *previewContainerView;
  UIView *v15;
  void *v16;
  CAMDynamicShutterControl *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CAMDynamicShutterControl *shutterControl;
  uint64_t v22;
  CAMFlipButton *flipButton;
  CAMPhotoVideoModeSwitch *v24;
  CAMPhotoVideoModeSwitch *photoVideoModeSwitch;
  CAMControlStatusBar *v26;
  CAMControlStatusBar *controlStatusBar;
  void *v28;
  void *v29;
  CAMBadgeTray *v30;
  CAMBadgeTray *badgeTray;
  CAMImageWell *v32;
  uint64_t v33;
  id *v34;
  void *v35;
  CAMViewfinderReticleView *v36;
  CAMViewfinderReticleView *reticleView;
  CAMNonInteractiveContainer *v38;
  UIView *contentClippingContainer;
  CAMInterfaceModulationView *v40;
  CAMInterfaceModulationView *modulatingContentView;
  CAMInterfaceModulationView *v42;
  UIView *contentView;
  CAMInterfaceModulationView *v44;
  UIView *contentViewBelowShutter;
  void *v46;
  CAMFullscreenModeSelector *v47;
  CAMFullscreenModeSelector *modeSelector;
  CAMModeIndicatorView *v49;
  CAMModeIndicatorView *modeIndicator;
  uint64_t v51;
  UILongPressGestureRecognizer *modeSelectorGestureRecognizer;
  CAMModeDial *v53;
  CAMModeDial *modeDial;
  UIView *v55;
  UIView *modeClippingView;
  CEKAdditiveAnimator *v57;
  CEKAdditiveAnimator *viewportAnimator;
  NSMutableDictionary *v59;
  NSMutableDictionary *descriptionOverlayViewByKey;
  NSMutableDictionary *v61;
  NSMutableDictionary *instructionLabelByValue;
  NSMutableArray *v63;
  NSMutableArray *createdPrimaryInstructionLabels;
  NSMutableArray *v65;
  NSMutableArray *createdSecondaryInstructionLabels;
  NSMutableDictionary *v67;
  NSMutableDictionary *badgesForSpotlightControls;
  CFIndex AppIntegerValue;
  double v70;
  double v71;
  CFIndex v72;
  objc_super v74;

  v4 = a4;
  v6 = a3;
  v74.receiver = self;
  v74.super_class = (Class)CAMFullscreenViewfinder;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[CAMFullscreenViewfinder initWithFrame:](&v74, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v8, v9, v10);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v11->_controlDrawerAllowed = 1;
    v11->_modeUIAllowed = 1;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    previewContainerView = v11->__previewContainerView;
    v11->__previewContainerView = (UIView *)v13;

    v15 = v11->__previewContainerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    v17 = [CAMDynamicShutterControl alloc];
    objc_msgSend(v6, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commandQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CAMDynamicShutterControl initWithMetalDevice:commandQueue:](v17, "initWithMetalDevice:commandQueue:", v18, v19);
    shutterControl = v11->_shutterControl;
    v11->_shutterControl = (CAMDynamicShutterControl *)v20;

    v11->_shutterControlVisible = 1;
    +[CAMFlipButton flipButtonOverContent](CAMFlipButton, "flipButtonOverContent");
    v22 = objc_claimAutoreleasedReturnValue();
    flipButton = v11->_flipButton;
    v11->_flipButton = (CAMFlipButton *)v22;

    -[CAMFlipButton setExclusiveTouch:](v11->_flipButton, "setExclusiveTouch:", 1);
    v11->_flipButtonVisible = 1;
    v24 = -[CAMPhotoVideoModeSwitch initWithFrame:]([CAMPhotoVideoModeSwitch alloc], "initWithFrame:", v7, v8, v9, v10);
    photoVideoModeSwitch = v11->_photoVideoModeSwitch;
    v11->_photoVideoModeSwitch = v24;

    -[CAMPhotoVideoModeSwitch setExclusiveTouch:](v11->_photoVideoModeSwitch, "setExclusiveTouch:", 1);
    v26 = objc_alloc_init(CAMControlStatusBar);
    controlStatusBar = v11->_controlStatusBar;
    v11->_controlStatusBar = v26;

    -[CAMControlStatusBar setDirectionIndicatorVisible:](v11->_controlStatusBar, "setDirectionIndicatorVisible:", 1);
    -[CAMControlStatusBar directionIndicator](v11->_controlStatusBar, "directionIndicator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setExclusiveTouch:", 1);

    -[CAMControlStatusBar directionIndicator](v11->_controlStatusBar, "directionIndicator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addTarget:action:forControlEvents:", v11, sel__handleDirectionIndicatorTapped, 192);

    v30 = objc_alloc_init(CAMBadgeTray);
    badgeTray = v11->_badgeTray;
    v11->_badgeTray = v30;

    -[CAMBadgeTray setUserInteractionEnabled:](v11->_badgeTray, "setUserInteractionEnabled:", 0);
    v11->__usingCreativeCameraControls = v4;
    if (v4)
    {
      v32 = -[CAMCreativeCameraButton initForOverContent]([CAMCreativeCameraButton alloc], "initForOverContent");
      v33 = 720;
    }
    else
    {
      v32 = -[CAMImageWell initWithLayoutStyle:]([CAMImageWell alloc], "initWithLayoutStyle:", 4);
      v33 = 672;
    }
    v34 = (id *)((char *)&v11->super.super.super.isa + v33);
    v35 = *(Class *)((char *)&v11->super.super.super.isa + v33);
    *v34 = v32;

    objc_msgSend(*v34, "setExclusiveTouch:", 1);
    v36 = -[CAMViewfinderReticleView initWithFrame:]([CAMViewfinderReticleView alloc], "initWithFrame:", v7, v8, v9, v10);
    reticleView = v11->__reticleView;
    v11->__reticleView = v36;

    -[CAMFullscreenViewfinder addSubview:](v11, "addSubview:", v11->__previewContainerView);
    -[CAMFullscreenViewfinder addSubview:](v11, "addSubview:", v11->__reticleView);
    v38 = objc_alloc_init(CAMNonInteractiveContainer);
    contentClippingContainer = v11->__contentClippingContainer;
    v11->__contentClippingContainer = &v38->super;

    -[UIView setClipsToBounds:](v11->__contentClippingContainer, "setClipsToBounds:", 1);
    -[CAMFullscreenViewfinder addSubview:](v11, "addSubview:", v11->__contentClippingContainer);
    v40 = -[CAMInterfaceModulationView initWithHostingView:]([CAMInterfaceModulationView alloc], "initWithHostingView:", v11);
    modulatingContentView = v11->__modulatingContentView;
    v11->__modulatingContentView = v40;

    -[UIView addSubview:](v11->__contentClippingContainer, "addSubview:", v11->__modulatingContentView);
    v42 = -[CAMInterfaceModulationView initWithHostingView:]([CAMInterfaceModulationView alloc], "initWithHostingView:", v11);
    contentView = v11->__contentView;
    v11->__contentView = &v42->super;

    v44 = -[CAMInterfaceModulationView initWithHostingView:]([CAMInterfaceModulationView alloc], "initWithHostingView:", v11);
    contentViewBelowShutter = v11->__contentViewBelowShutter;
    v11->__contentViewBelowShutter = &v44->super;

    -[CAMInterfaceModulationView addSubview:](v11->__modulatingContentView, "addSubview:", v11->__contentViewBelowShutter);
    -[CAMInterfaceModulationView addSubview:](v11->__modulatingContentView, "addSubview:", v11->_shutterControl);
    -[CAMInterfaceModulationView addSubview:](v11->__modulatingContentView, "addSubview:", v11->__contentView);
    -[UIView addSubview:](v11->__contentView, "addSubview:", v11->_badgeTray);
    -[UIView addSubview:](v11->__contentView, "addSubview:", v11->_controlStatusBar);
    -[UIView addSubview:](v11->__contentView, "addSubview:", v11->_flipButton);
    -[UIView addSubview:](v11->__contentView, "addSubview:", v11->_imageWell);
    -[UIView addSubview:](v11->__contentView, "addSubview:", v11->_creativeCameraButton);
    -[UIView addSubview:](v11->__contentView, "addSubview:", v11->_photoVideoModeSwitch);
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "useCTMModeSelector"))
    {
      v47 = objc_alloc_init(CAMFullscreenModeSelector);
      modeSelector = v11->_modeSelector;
      v11->_modeSelector = v47;

      -[UIView addSubview:](v11->__contentView, "addSubview:", v11->_modeSelector);
      v49 = -[CAMModeIndicatorView initWithFrame:]([CAMModeIndicatorView alloc], "initWithFrame:", v7, v8, v9, v10);
      modeIndicator = v11->_modeIndicator;
      v11->_modeIndicator = v49;

      -[UIView addSubview:](v11->__contentView, "addSubview:", v11->_modeIndicator);
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v11->_modeSelector, sel_handlePress_);
      modeSelectorGestureRecognizer = v11->_modeSelectorGestureRecognizer;
      v11->_modeSelectorGestureRecognizer = (UILongPressGestureRecognizer *)v51;

      -[UILongPressGestureRecognizer setMinimumPressDuration:](v11->_modeSelectorGestureRecognizer, "setMinimumPressDuration:", 0.0);
      -[UILongPressGestureRecognizer setCancelsTouchesInView:](v11->_modeSelectorGestureRecognizer, "setCancelsTouchesInView:", 0);
      -[UILongPressGestureRecognizer setDelaysTouchesEnded:](v11->_modeSelectorGestureRecognizer, "setDelaysTouchesEnded:", 0);
      -[CAMFullscreenViewfinder addGestureRecognizer:](v11, "addGestureRecognizer:", v11->_modeSelectorGestureRecognizer);
    }
    else
    {
      v53 = -[CAMModeDial initWithLayoutStyle:]([CAMModeDial alloc], "initWithLayoutStyle:", 4);
      modeDial = v11->_modeDial;
      v11->_modeDial = v53;

      -[CAMModeDial setExclusiveTouch:](v11->_modeDial, "setExclusiveTouch:", 1);
      v55 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      modeClippingView = v11->__modeClippingView;
      v11->__modeClippingView = v55;

      -[UIView setClipsToBounds:](v11->__modeClippingView, "setClipsToBounds:", 1);
      -[UIView addSubview:](v11->__contentView, "addSubview:", v11->__modeClippingView);
      -[UIView addSubview:](v11->__modeClippingView, "addSubview:", v11->_modeDial);
    }
    v57 = (CEKAdditiveAnimator *)objc_alloc_init(MEMORY[0x1E0D0D000]);
    viewportAnimator = v11->__viewportAnimator;
    v11->__viewportAnimator = v57;

    -[CEKAdditiveAnimator setDelegate:](v11->__viewportAnimator, "setDelegate:", v11);
    v59 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    descriptionOverlayViewByKey = v11->__descriptionOverlayViewByKey;
    v11->__descriptionOverlayViewByKey = v59;

    v61 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    instructionLabelByValue = v11->__instructionLabelByValue;
    v11->__instructionLabelByValue = v61;

    v63 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    createdPrimaryInstructionLabels = v11->__createdPrimaryInstructionLabels;
    v11->__createdPrimaryInstructionLabels = v63;

    v65 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    createdSecondaryInstructionLabels = v11->__createdSecondaryInstructionLabels;
    v11->__createdSecondaryInstructionLabels = v65;

    v67 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    badgesForSpotlightControls = v11->__badgesForSpotlightControls;
    v11->__badgesForSpotlightControls = v67;

    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CAMTrueVideoModeSwitchToCaptureDuration"), CFSTR("com.apple.camera"), 0);
    v70 = 0.0;
    v71 = 0.0;
    if (AppIntegerValue >= 1)
      v71 = (double)AppIntegerValue / 1000.0;
    v11->__trueVideoModeSwitchToCaptureAnimationDurationOverride = v71;
    v72 = CFPreferencesGetAppIntegerValue(CFSTR("CAMTrueVideoModeSwitchFromCaptureDuration"), CFSTR("com.apple.camera"), 0);
    if (v72 >= 1)
      v70 = (double)v72 / 1000.0;
    v11->__trueVideoModeSwitchFromCaptureAnimationDurationOverride = v70;

  }
  return v11;
}

- (void)_insertBackgroundSubview:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[CAMFullscreenViewfinder _previewContainerView](self, "_previewContainerView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v4, v5);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    -[CAMFullscreenViewfinder setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateGeometryForElapsedTimeAndInstructionLabels
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
  _BOOL4 v12;
  void *v13;
  int64_t v14;
  _BOOL8 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMFullscreenViewfinder elapsedTimeView](self, "elapsedTimeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = -[CAMFullscreenViewfinder isElapsedTimeViewVisible](self, "isElapsedTimeViewVisible");
  else
    v12 = 0;
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v14 = -[CAMFullscreenViewfinder orientation](self, "orientation");
  v15 = -[CAMFullscreenViewfinder isSystemOverlayVisible](self, "isSystemOverlayVisible");
  if (v13)
  {
    objc_msgSend(v13, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v11, v14, v15, v4, v6, v8, v10);
  }
  else
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
  }
  if (v12)
  {
    v67 = v73;
    v68 = v74;
    v69 = v75;
    v70 = v76;
    v65 = v71;
    v66 = v72;
    CAMViewSetGeometry(v11, (uint64_t)&v65);
    v67 = v73;
    v68 = v74;
    v69 = v75;
    v70 = v76;
    v16 = v71;
    v17 = v72;
  }
  else
  {
    v67 = xmmword_1DB9A77F0;
    v68 = xmmword_1DB9A7800;
    v69 = xmmword_1DB9A7810;
    v70 = xmmword_1DB9A7820;
    v16 = CAMViewGeometryZero;
    v17 = xmmword_1DB9A77E0;
  }
  v65 = v16;
  v66 = v17;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[CAMFullscreenViewfinder _createdPrimaryInstructionLabels](self, "_createdPrimaryInstructionLabels");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v62;
    v36 = xmmword_1DB9A7800;
    v37 = xmmword_1DB9A77F0;
    v34 = xmmword_1DB9A7820;
    v35 = xmmword_1DB9A7810;
    v32 = xmmword_1DB9A77E0;
    v33 = CAMViewGeometryZero;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v62 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v51 = v37;
        v52 = v36;
        v53 = v35;
        v54 = v34;
        v49 = v33;
        v50 = v32;
        v45 = v67;
        v46 = v68;
        v47 = v69;
        v48 = v70;
        v43 = v65;
        v44 = v66;
        -[CAMFullscreenViewfinder _geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:](self, "_geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:", v23, &v49, &v43, v32, v33, v34, v35, v36, v37);
        v51 = v57;
        v52 = v58;
        v53 = v59;
        v54 = v60;
        v49 = v55;
        v50 = v56;
        CAMApplyAnimationSensitiveGeometryToView((double *)&v49, v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
    }
    while (v20);
  }

  -[CAMFullscreenViewfinder _visibleInstructionLabelForInstructionLabelValue:](self, "_visibleInstructionLabelForInstructionLabelValue:", -[CAMFullscreenViewfinder visibleInstructionLabel](self, "visibleInstructionLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  if (v24)
  {
    CAMViewGetGeometry(v24, (uint64_t)&v55);
  }
  else
  {
    v57 = xmmword_1DB9A77F0;
    v58 = xmmword_1DB9A7800;
    v59 = xmmword_1DB9A7810;
    v60 = xmmword_1DB9A7820;
    v55 = CAMViewGeometryZero;
    v56 = xmmword_1DB9A77E0;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[CAMFullscreenViewfinder _createdSecondaryInstructionLabels](self, "_createdSecondaryInstructionLabels");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v77, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v45 = v57;
        v46 = v58;
        v47 = v59;
        v48 = v60;
        v43 = v55;
        v44 = v56;
        v38[2] = v67;
        v38[3] = v68;
        v38[4] = v69;
        v38[5] = v70;
        v38[0] = v65;
        v38[1] = v66;
        -[CAMFullscreenViewfinder _geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:](self, "_geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:", v31, &v43, v38);
        v45 = v51;
        v46 = v52;
        v47 = v53;
        v48 = v54;
        v43 = v49;
        v44 = v50;
        CAMApplyAnimationSensitiveGeometryToView((double *)&v43, v31);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v77, 16);
    }
    while (v28);
  }

}

- (void)_layoutViewportWithFrame:(CGRect)a3 previewFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v13;
  double v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = -[CAMFullscreenViewfinder trueVideoState](self, "trueVideoState");
  v14 = 0.0;
  if (v13 == 2)
    v14 = 1.0;
  -[CAMFullscreenViewfinder _layoutViewportWithFrame:previewFrame:trueVideoTransitionPercentComplete:](self, "_layoutViewportWithFrame:previewFrame:trueVideoTransitionPercentComplete:", v11, v10, v9, v8, x, y, width, height, *(_QWORD *)&v14);
}

- (void)_layoutViewportWithFrame:(CGRect)a3 previewFrame:(CGRect)a4 trueVideoTransitionPercentComplete:(double)a5
{
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double height;
  id v23;
  _QWORD v24[8];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  -[CAMFullscreenViewfinder _updateReticleForViewportFrame:](self, "_updateReticleForViewportFrame:");
  -[CAMFullscreenViewfinder _updatePreviewLayerForPreviewFrame:viewportFrame:trueVideoTransitionPercentComplete:](self, "_updatePreviewLayerForPreviewFrame:viewportFrame:trueVideoTransitionPercentComplete:", x, y, width, height, v11, v10, v9, v8, *(_QWORD *)&a5);
  -[CAMFullscreenViewfinder _updateModeDialClippingForViewportFrame:](self, "_updateModeDialClippingForViewportFrame:", v11, v10, v9, v8);
  -[CAMFullscreenViewfinder _updatePreviewAlignmentGuideForViewportFrame:](self, "_updatePreviewAlignmentGuideForViewportFrame:", v11, v10, v9, v8);
  -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder _updateSemanticStylePicker:forViewportFrame:](self, "_updateSemanticStylePicker:forViewportFrame:", v13, v11, v10, v9, v8);

  -[CAMFullscreenViewfinder smartStylePicker](self, "smartStylePicker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder _updateSemanticStylePicker:forViewportFrame:](self, "_updateSemanticStylePicker:forViewportFrame:", v14, v11, v10, v9, v8);

  -[CAMFullscreenViewfinder _updateDisabledModeOverlayViewportFrame:](self, "_updateDisabledModeOverlayViewportFrame:", v11, v10, v9, v8);
  -[CAMFullscreenViewfinder _overCapturePreviewLayer](self, "_overCapturePreviewLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[CAMFullscreenViewfinder previewView](self, "previewView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v11 = v17;
    v10 = v18;
    v9 = v19;
    v8 = v20;

  }
  -[CAMFullscreenViewfinder previewView](self, "previewView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setViewportFrame:", v11, v10, v9, v8);

  -[CAMFullscreenViewfinder _descriptionOverlayViewByKey](self, "_descriptionOverlayViewByKey");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __100__CAMFullscreenViewfinder__layoutViewportWithFrame_previewFrame_trueVideoTransitionPercentComplete___block_invoke;
  v24[3] = &__block_descriptor_64_e55_v32__0___NSCopying__8__CAMDescriptionOverlayView_16_B24l;
  *(double *)&v24[4] = v11;
  *(double *)&v24[5] = v10;
  *(double *)&v24[6] = v9;
  *(double *)&v24[7] = v8;
  objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v24);

}

uint64_t __100__CAMFullscreenViewfinder__layoutViewportWithFrame_previewFrame_trueVideoTransitionPercentComplete___block_invoke(double *a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setViewportFrame:", a1[4], a1[5], a1[6], a1[7]);
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
  CAMFullscreenViewfinderLayout *v12;
  CAMFullscreenViewfinderLayout *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  void *v117;
  void *v118;
  void *v119;
  char v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  void *v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  double v145;
  double v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  void *v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  void *v180;
  void *v181;
  double v182;
  double v183;
  void *v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  uint64_t v202;
  void *v203;
  _BOOL4 v204;
  void *v205;
  void *v206;
  int64_t v207;
  _BOOL8 v208;
  int64_t v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  void *v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  void *v227;
  CAMFullscreenViewfinderLayout *v228;
  double v229;
  double v230;
  void *v231;
  double v232;
  void *v233;
  double v234;
  void *v235;
  CGFloat v236;
  CGFloat v237;
  CGFloat v238;
  CGFloat v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  char v252[96];
  char v253[96];
  _QWORD v254[8];
  _BYTE v255[96];
  char v256[104];
  CGRect v257;

  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMFullscreenViewfinder shutterControl](self, "shutterControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v12 = (CAMFullscreenViewfinderLayout *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v257.origin.x = v4;
    v257.origin.y = v6;
    v257.size.width = v8;
    v257.size.height = v10;
    if (CGRectIsEmpty(v257))
    {
      v12 = 0;
    }
    else
    {
      v13 = [CAMFullscreenViewfinderLayout alloc];
      objc_msgSend(v11, "intrinsicContentSize");
      v12 = -[CAMFullscreenViewfinderLayout initWithReferenceBounds:shutterIntrinsicSize:](v13, "initWithReferenceBounds:shutterIntrinsicSize:", v4, v6, v8, v10, v14, v15);
      objc_storeStrong((id *)&self->__layout, v12);
    }
  }
  -[CAMFullscreenViewfinderLayout setReferenceBounds:](v12, "setReferenceBounds:", v4, v6, v8, v10);
  objc_msgSend(v11, "intrinsicContentSize");
  -[CAMFullscreenViewfinderLayout setShutterIntrinsicSize:](v12, "setShutterIntrinsicSize:");
  -[CAMFullscreenViewfinder window](self, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  -[CAMFullscreenViewfinderLayout setScreenScale:](v12, "setScreenScale:");

  -[CAMFullscreenViewfinder _frameForPreviewView](self, "_frameForPreviewView");
  v232 = v19;
  v234 = v18;
  v229 = v21;
  v230 = v20;
  -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
  v238 = v23;
  v239 = v22;
  v236 = v25;
  v237 = v24;
  -[CAMFullscreenViewfinder _setViewportAnimatorFrame:](self, "_setViewportAnimatorFrame:");
  -[CAMFullscreenViewfinder _previewContainerView](self, "_previewContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v4, v6, v8, v10);

  -[CAMFullscreenViewfinder _frameForContentClippingContainer](self, "_frameForContentClippingContainer");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  -[CAMFullscreenViewfinder _contentClippingContainer](self, "_contentClippingContainer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

  -[CAMFullscreenViewfinder _modulatingContentView](self, "_modulatingContentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "superview");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder convertRect:toView:](self, "convertRect:toView:", v37, v4, v6, v8, v10);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  -[CAMFullscreenViewfinder _modulatingContentView](self, "_modulatingContentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  -[CAMFullscreenViewfinder _contentView](self, "_contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBounds:", v4, v6, v8, v10);

  UIRectGetCenter();
  v49 = v48;
  v51 = v50;
  -[CAMFullscreenViewfinder _contentView](self, "_contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setCenter:", v49, v51);

  -[CAMFullscreenViewfinder _contentViewBelowShutter](self, "_contentViewBelowShutter");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setBounds:", v4, v6, v8, v10);

  UIRectGetCenter();
  v55 = v54;
  v57 = v56;
  -[CAMFullscreenViewfinder _contentViewBelowShutter](self, "_contentViewBelowShutter");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setCenter:", v55, v57);

  -[CAMFullscreenViewfinder previewView](self, "previewView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setFrame:", v234, v232, v230, v229);

  -[CAMFullscreenViewfinderLayout frameForControlStatusBar](v12, "frameForControlStatusBar");
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v67 = v66;
  -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFrame:", v61, v63, v65, v67);

  -[CAMFullscreenViewfinder _frameForFlipButton](self, "_frameForFlipButton");
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v76 = v75;
  -[CAMFullscreenViewfinder flipButton](self, "flipButton");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setFrame:", v70, v72, v74, v76);

  -[CAMFullscreenViewfinder badgeTray](self, "badgeTray");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder _geometryForBadgeTray](self, "_geometryForBadgeTray");
  CAMViewSetGeometry(v78, (uint64_t)v256);

  -[CAMFullscreenViewfinder _frameForImageWell](self, "_frameForImageWell");
  v80 = v79;
  v82 = v81;
  v84 = v83;
  v86 = v85;
  -[CAMFullscreenViewfinder imageWell](self, "imageWell");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setFrame:", v80, v82, v84, v86);

  -[CAMFullscreenViewfinder modeSelector](self, "modeSelector");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setFrame:", v4, v6, v8, v10);

  -[CAMFullscreenViewfinder _reticleView](self, "_reticleView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setFrame:", v4, v6, v8, v10);

  -[CAMFullscreenViewfinder timerIndicator](self, "timerIndicator");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewGeometryForOrientedFrame(1, (uint64_t)v255, v239, v238, v237, v236);
  CAMViewSetGeometry(v90, (uint64_t)v255);

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder creativeCameraButton](self, "creativeCameraButton");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "frameForBottomLeftControl:", v92);
  v94 = v93;
  v96 = v95;
  v98 = v97;
  v100 = v99;
  -[CAMFullscreenViewfinder creativeCameraButton](self, "creativeCameraButton");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setFrame:", v94, v96, v98, v100);

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder sharedLibraryImageWellIndicatorView](self, "sharedLibraryImageWellIndicatorView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder imageWell](self, "imageWell");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "frameForBottomControl:betweenShutterAndLeftControl:", v103, v104);
  v106 = v105;
  v108 = v107;
  v110 = v109;
  v112 = v111;
  -[CAMFullscreenViewfinder sharedLibraryImageWellIndicatorView](self, "sharedLibraryImageWellIndicatorView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setFrame:", v106, v108, v110, v112);

  -[CAMFullscreenViewfinder _descriptionOverlayViewByKey](self, "_descriptionOverlayViewByKey");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v254[0] = MEMORY[0x1E0C809B0];
  v254[1] = 3221225472;
  v254[2] = __41__CAMFullscreenViewfinder_layoutSubviews__block_invoke;
  v254[3] = &__block_descriptor_64_e55_v32__0___NSCopying__8__CAMDescriptionOverlayView_16_B24l;
  *(double *)&v254[4] = v4;
  *(double *)&v254[5] = v6;
  *(double *)&v254[6] = v8;
  *(double *)&v254[7] = v10;
  objc_msgSend(v114, "enumerateKeysAndObjectsUsingBlock:", v254);

  -[CAMFullscreenViewfinder flipButton](self, "flipButton");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "center");
  objc_msgSend(v11, "setLockButtonCenterRightInset:", v8 - v116);

  -[CAMFullscreenViewfinder imageWell](self, "imageWell");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  if (v117)
    -[CAMFullscreenViewfinder imageWell](self, "imageWell");
  else
    -[CAMFullscreenViewfinder creativeCameraButton](self, "creativeCameraButton");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "center");
  objc_msgSend(v11, "setPauseResumeButtonCenterLeftInset:");

  v228 = v12;
  -[CAMFullscreenViewfinderLayout frameForShutterControl:](v12, "frameForShutterControl:", v11);
  objc_msgSend(v11, "setFrame:");
  -[CAMFullscreenViewfinder _viewportAnimator](self, "_viewportAnimator");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "isAnimating");

  if ((v120 & 1) == 0)
    -[CAMFullscreenViewfinder _layoutViewportWithFrame:previewFrame:](self, "_layoutViewportWithFrame:previewFrame:", v239, v238, v237, v236, v234, v232, v230, v229);
  -[CAMFullscreenViewfinder previewView](self, "previewView");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder _frameForPreviewOverlaysInViewport:](self, "_frameForPreviewOverlaysInViewport:", v239, v238, v237, v236);
  objc_msgSend(v121, "convertRect:fromView:", self);
  v123 = v122;
  v125 = v124;
  v127 = v126;
  v129 = v128;
  -[CAMFullscreenViewfinder previewView](self, "previewView");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setOverlayFrame:", v123, v125, v127, v129);

  -[CAMFullscreenViewfinder _frameForModeView](self, "_frameForModeView");
  v132 = v131;
  v134 = v133;
  v136 = v135;
  v138 = v137;
  -[CAMFullscreenViewfinder modeDial](self, "modeDial");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setFrame:", v132, v134, v136, v138);

  -[CAMFullscreenViewfinder _layoutZoomControls](self, "_layoutZoomControls");
  -[CAMFullscreenViewfinder imageAnalysisButton](self, "imageAnalysisButton");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder zoomSlider](self, "zoomSlider");
  v141 = objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder zoomControl](self, "zoomControl");
  v142 = objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder traitCollection](self, "traitCollection");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "preferredContentSizeCategory");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMZoomButton circleDiameterForContentSize:](CAMZoomButton, "circleDiameterForContentSize:", v144);
  v146 = v145;

  objc_msgSend(v140, "setBackgroundDiameter:", v146);
  v235 = (void *)v142;
  -[CAMFullscreenViewfinder _imageAnalysisButtonFrameForZoomControl:zoomSlider:](self, "_imageAnalysisButtonFrameForZoomControl:zoomSlider:", v142, v141);
  objc_msgSend(v140, "setFrame:");
  -[CAMFullscreenViewfinder machineReadableCodeButton](self, "machineReadableCodeButton");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  if (v147)
  {
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v147, "setHitTestInsets:");
    -[CAMFullscreenViewfinder _geometryForMRCButton](self, "_geometryForMRCButton");
    CAMViewSetGeometry(v147, (uint64_t)v253);
  }
  -[CAMFullscreenViewfinder _textInteractionBackground](self, "_textInteractionBackground");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setFrame:", v4, v6, v8, v10);

  -[CAMFullscreenViewfinder textInteractionInsert](self, "textInteractionInsert");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder _geometryForTextInteractionInsertWithViewport:](self, "_geometryForTextInteractionInsertWithViewport:", v239, v238, v237, v236);
  CAMViewSetGeometry(v149, (uint64_t)v252);
  objc_msgSend(v140, "backgroundDiameter");
  objc_msgSend(v149, "setPreferredQuickActionButtonHeight:");
  objc_msgSend(v149, "actionInfoView");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  if (v150)
  {
    -[CAMFullscreenViewfinder _frameForActionInfoView](self, "_frameForActionInfoView");
    objc_msgSend(v150, "setFrame:");
  }
  -[CAMFullscreenViewfinder _applyTextInsertContentInsets](self, "_applyTextInsertContentInsets");
  v233 = (void *)v141;
  -[CAMFullscreenViewfinder _previewSuggestionButtonFrameForZoomControl:zoomSlider:](self, "_previewSuggestionButtonFrameForZoomControl:zoomSlider:", v235, v141);
  v152 = v151;
  v154 = v153;
  v156 = v155;
  v158 = v157;
  -[CAMFullscreenViewfinder autoMacroButton](self, "autoMacroButton");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "setFrame:", v152, v154, v156, v158);

  -[CAMFullscreenViewfinder depthEffectSuggestionButton](self, "depthEffectSuggestionButton");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "setFrame:", v152, v154, v156, v158);

  -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (v161)
  {
    -[CAMFullscreenViewfinder _frameForControlDrawer](self, "_frameForControlDrawer");
    objc_msgSend(v161, "setFrame:");
  }
  -[CAMFullscreenViewfinder _bottomLegibilityBackground](self, "_bottomLegibilityBackground");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  if (v162)
  {
    -[CAMFullscreenViewfinder _frameForBottomLegibilityBackground](self, "_frameForBottomLegibilityBackground");
    objc_msgSend(v162, "setFrame:");
  }
  -[CAMFullscreenViewfinder _updateGeometryForElapsedTimeAndInstructionLabels](self, "_updateGeometryForElapsedTimeAndInstructionLabels");
  -[CAMFullscreenViewfinder _frameForExternalStorageButton](self, "_frameForExternalStorageButton");
  v164 = v163;
  v166 = v165;
  v168 = v167;
  v170 = v169;
  -[CAMFullscreenViewfinder externalStorageButton](self, "externalStorageButton");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "setFrame:", v164, v166, v168, v170);

  -[CAMFullscreenViewfinder _frameForSpotlightControlPanel](self, "_frameForSpotlightControlPanel");
  v173 = v172;
  v175 = v174;
  v177 = v176;
  v179 = v178;
  -[CAMFullscreenViewfinder spotlightControlPanel](self, "spotlightControlPanel");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "setFrame:", v173, v175, v177, v179);

  -[CAMFullscreenViewfinder lightingControl](self, "lightingControl");
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  if (v181)
  {
    -[CAMFullscreenViewfinder _additionalBottomPaddingForLightingControl](self, "_additionalBottomPaddingForLightingControl");
    v183 = v182;
    -[CAMFullscreenViewfinder lightingControl](self, "lightingControl");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "setAdditionalBottomPadding:", v183);

    -[CAMFullscreenViewfinder _frameForLightingControl](self, "_frameForLightingControl");
    v186 = v185;
    v188 = v187;
    v190 = v189;
    v192 = v191;
    -[CAMFullscreenViewfinder lightingControl](self, "lightingControl");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "setFrame:", v186, v188, v190, v192);

    v250 = 0u;
    v251 = 0u;
    v248 = 0u;
    v249 = 0u;
    v246 = 0u;
    v247 = 0u;
    -[CAMFullscreenViewfinder _geometryForLandscapeLightingBadge](self, "_geometryForLandscapeLightingBadge");
    -[CAMFullscreenViewfinder lightingNameBadge](self, "lightingNameBadge");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = v248;
    v243 = v249;
    v244 = v250;
    v245 = v251;
    v240 = v246;
    v241 = v247;
    CAMApplyAnimationSensitiveGeometryToView((double *)&v240, v194);

  }
  -[CAMFullscreenViewfinder filterNameBadge](self, "filterNameBadge");
  v195 = (void *)objc_claimAutoreleasedReturnValue();

  if (v195)
  {
    -[CAMFullscreenViewfinder filterNameBadge](self, "filterNameBadge");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = 0u;
    v251 = 0u;
    v248 = 0u;
    v249 = 0u;
    v246 = 0u;
    v247 = 0u;
    -[CAMFullscreenViewfinder _geometryForBottomCenteredView:](self, "_geometryForBottomCenteredView:", v196);
    v242 = v248;
    v243 = v249;
    v244 = v250;
    v245 = v251;
    v240 = v246;
    v241 = v247;
    CAMApplyAnimationSensitiveGeometryToView((double *)&v240, v196);

  }
  -[CAMFullscreenViewfinder _layoutSemanticStyleMaskedBadges](self, "_layoutSemanticStyleMaskedBadges");
  -[CAMFullscreenViewfinder panoramaView](self, "panoramaView");
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  if (v197)
    -[CAMFullscreenViewfinder _layoutPanoramaView](self, "_layoutPanoramaView");
  -[CAMFullscreenViewfinder spatialCaptureButton](self, "spatialCaptureButton");
  v198 = (void *)objc_claimAutoreleasedReturnValue();

  if (v198)
  {
    -[CAMFullscreenViewfinder spatialCaptureButton](self, "spatialCaptureButton");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "setFrame:", v152, v154, v156, v158);

  }
  -[CAMFullscreenViewfinder _orientationInstructionView](self, "_orientationInstructionView");
  v200 = (void *)objc_claimAutoreleasedReturnValue();

  if (v200)
  {
    -[CAMFullscreenViewfinder _orientationInstructionView](self, "_orientationInstructionView");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "setFrame:", v239, v238, v237, v236);

  }
  -[CAMFullscreenViewfinder spatialCaptureRecordingIndicator](self, "spatialCaptureRecordingIndicator");
  v202 = objc_claimAutoreleasedReturnValue();
  if (v202)
  {
    v203 = (void *)v202;
    v204 = -[CAMFullscreenViewfinder isSpatialCaptureRecordingIndicatorVisible](self, "isSpatialCaptureRecordingIndicatorVisible");

    if (v204)
    {
      v231 = v11;
      v250 = 0u;
      v251 = 0u;
      v248 = 0u;
      v249 = 0u;
      v246 = 0u;
      v247 = 0u;
      -[CAMFullscreenViewfinder _layout](self, "_layout");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMFullscreenViewfinder elapsedTimeView](self, "elapsedTimeView");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      v207 = -[CAMFullscreenViewfinder orientation](self, "orientation");
      v208 = -[CAMFullscreenViewfinder isSystemOverlayVisible](self, "isSystemOverlayVisible");
      if (v205)
      {
        objc_msgSend(v205, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v206, v207, v208, v239, v238, v237, v236);
      }
      else
      {
        v250 = 0u;
        v251 = 0u;
        v248 = 0u;
        v249 = 0u;
        v246 = 0u;
        v247 = 0u;
      }

      v209 = -[CAMFullscreenViewfinder orientation](self, "orientation");
      v242 = v248;
      v243 = v249;
      v244 = v250;
      v245 = v251;
      v240 = v246;
      v241 = v247;
      -[CAMFullscreenViewfinder _frameForSpatialRecordingIndicatorWithElapsedTimeViewGeometry:orientation:](self, "_frameForSpatialRecordingIndicatorWithElapsedTimeViewGeometry:orientation:", &v240, v209);
      v211 = v210;
      v213 = v212;
      v215 = v214;
      v217 = v216;
      -[CAMFullscreenViewfinder spatialCaptureRecordingIndicator](self, "spatialCaptureRecordingIndicator");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "setFrame:", v211, v213, v215, v217);

      v11 = v231;
    }
  }
  -[CAMFullscreenViewfinder _frameForFlipButton](self, "_frameForFlipButton");
  v220 = v219;
  v222 = v221;
  v224 = v223;
  v226 = v225;
  -[CAMFullscreenViewfinder photoVideoModeSwitch](self, "photoVideoModeSwitch");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "setFrame:", v220, v222, v224, v226);

  -[CAMFullscreenViewfinder _layoutSmartStylesControls](self, "_layoutSmartStylesControls");
  -[CAMFullscreenViewfinder _layoutSmartStyleNameBadge](self, "_layoutSmartStyleNameBadge");
  -[CAMFullscreenViewfinder _layoutSpotlightSmartStyleStatusIndicator](self, "_layoutSpotlightSmartStyleStatusIndicator");
  -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", 0);
  -[CAMFullscreenViewfinder _updateTintColors](self, "_updateTintColors");

}

uint64_t __41__CAMFullscreenViewfinder_layoutSubviews__block_invoke(double *a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_setViewportAnimatorFrame:(CGRect)a3
{
  -[CAMFullscreenViewfinder _setViewportAnimatorFrame:withDuration:timingCurve:](self, "_setViewportAnimatorFrame:withDuration:timingCurve:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (void)_setViewportAnimatorFrame:(CGRect)a3 withDuration:(double)a4 timingCurve:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  void *v12;
  id v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a5;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  if (!CGRectIsEmpty(v14))
  {
    if (-[CAMFullscreenViewfinder trueVideoState](self, "trueVideoState") - 1 >= 2)
      v11 = 0.0;
    else
      v11 = 1.0;
    -[CAMFullscreenViewfinder _viewportAnimator](self, "_viewportAnimator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:duration:timingCurve:", CFSTR("CAMViewfinderAnimatorViewportOriginXKey"), v13, x, a4);
    objc_msgSend(v12, "setValue:forKey:duration:timingCurve:", CFSTR("CAMViewfinderAnimatorViewportOriginYKey"), v13, y, a4);
    objc_msgSend(v12, "setValue:forKey:duration:timingCurve:", CFSTR("CAMViewfinderAnimatorViewportWidthKey"), v13, width, a4);
    objc_msgSend(v12, "setValue:forKey:duration:timingCurve:", CFSTR("CAMViewfinderAnimatorViewportHeightKey"), v13, height, a4);
    objc_msgSend(v12, "setValue:forKey:duration:timingCurve:", CFSTR("CAMViewfinderAnimatorTrueVideoTransitionPercentCompleteKey"), v13, v11, a4);

  }
}

- (void)animator:(id)a3 didUpdateValuesForKeys:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
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
  double v27;
  void *v28;
  void *v29;

  v5 = a3;
  objc_msgSend(v5, "valueForKey:", CFSTR("CAMViewfinderAnimatorViewportOriginXKey"));
  UIRoundToViewScale();
  v7 = v6;
  objc_msgSend(v5, "valueForKey:", CFSTR("CAMViewfinderAnimatorViewportOriginYKey"));
  UIRoundToViewScale();
  v9 = v8;
  objc_msgSend(v5, "valueForKey:", CFSTR("CAMViewfinderAnimatorViewportWidthKey"));
  UIRoundToViewScale();
  v11 = v10;
  objc_msgSend(v5, "valueForKey:", CFSTR("CAMViewfinderAnimatorViewportHeightKey"));
  UIRoundToViewScale();
  v13 = v12;
  objc_msgSend(v5, "valueForKey:", CFSTR("CAMViewfinderAnimatorTrueVideoTransitionPercentCompleteKey"));
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[CAMFullscreenViewfinder _frameForPreviewView](self, "_frameForPreviewView");
  -[CAMFullscreenViewfinder _layoutViewportWithFrame:previewFrame:trueVideoTransitionPercentComplete:](self, "_layoutViewportWithFrame:previewFrame:trueVideoTransitionPercentComplete:", v7, v9, v11, v13, v16, v17, v18, v19, v15);
  -[CAMFullscreenViewfinder _frameForModeView](self, "_frameForModeView");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[CAMFullscreenViewfinder modeDial](self, "modeDial");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  -[CAMFullscreenViewfinder previewView](self, "previewView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (BOOL)isReticleAnimating
{
  void *v2;
  char v3;

  -[CAMFullscreenViewfinder _viewportAnimator](self, "_viewportAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnimating");

  return v3;
}

- (void)_setNeedsLayoutAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CAMFullscreenViewfinder *v19;
  id v20;
  _QWORD v21[5];
  _QWORD aBlock[5];

  v3 = a3;
  -[CAMFullscreenViewfinder setNeedsLayout](self, "setNeedsLayout");
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke;
  aBlock[3] = &unk_1EA328868;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (v3)
  {
    -[CAMFullscreenViewfinder _trueVideoAnimationDuration](self, "_trueVideoAnimationDuration");
    v11 = 0.5;
    if (v8 <= 0.0)
      v12 = 0.5;
    else
      v12 = v8;
    LODWORD(v8) = 1045220557;
    LODWORD(v9) = 1041865114;
    LODWORD(v10) = 1.0;
    LODWORD(v11) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v11, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
    -[CAMFullscreenViewfinder _setViewportAnimatorFrame:withDuration:timingCurve:](self, "_setViewportAnimatorFrame:withDuration:timingCurve:", v13);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationTimingFunction:", v13);
    -[CAMFullscreenViewfinder set_inFlightLayoutAnimationCount:](self, "set_inFlightLayoutAnimationCount:", -[CAMFullscreenViewfinder _inFlightLayoutAnimationCount](self, "_inFlightLayoutAnimationCount") + 1);
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke_2;
    v21[3] = &unk_1EA328868;
    v21[4] = self;
    v15 = v5;
    v16 = 3221225472;
    v17 = __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke_3;
    v18 = &unk_1EA328890;
    v19 = self;
    v20 = v7;
    objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 2, v21, &v15, v12, 0.0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit", v15, v16, v17, v18, v19);

  }
  else
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }

}

uint64_t __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inFlightLayoutAnimationCount");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_updateForLayoutCompleted");
  return result;
}

uint64_t __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_inFlightLayoutAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "_inFlightLayoutAnimationCount") - 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (double)_trueVideoAnimationDuration
{
  _BOOL4 v3;
  unint64_t v4;
  double result;
  BOOL v6;
  double v7;
  double v8;

  v3 = -[CAMFullscreenViewfinder useSlowerTrueVideoTransitionAnimationDuration](self, "useSlowerTrueVideoTransitionAnimationDuration");
  v4 = -[CAMFullscreenViewfinder trueVideoState](self, "trueVideoState");
  if (v4 == 1)
  {
    -[CAMFullscreenViewfinder _trueVideoModeSwitchToCaptureAnimationDurationOverride](self, "_trueVideoModeSwitchToCaptureAnimationDurationOverride");
    v6 = !v3;
    v7 = 0.7;
    v8 = 0.966;
  }
  else
  {
    result = 0.0;
    if (v4 != 3)
      return result;
    -[CAMFullscreenViewfinder _trueVideoModeSwitchFromCaptureAnimationDurationOverride](self, "_trueVideoModeSwitchFromCaptureAnimationDurationOverride", 0.0);
    v6 = !v3;
    v7 = 0.586;
    v8 = 1.0;
  }
  if (!v6)
    v7 = v8;
  if (result <= 0.0)
    return v7;
  return result;
}

- (void)_updateForLayoutCompleted
{
  id v3;

  if (!-[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"))
  {
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collapseExpandableButtonsAnimated:updatePreferredDrawerControl:", 0, 0);

  }
}

- (CGRect)_currentFourThreeViewportFrame
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_frameForPreviewView
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
  int64_t v12;
  int64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMFullscreenViewfinder _overCapturePreviewLayer](self, "_overCapturePreviewLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = -[CAMFullscreenViewfinder viewportAspectRatio](self, "viewportAspectRatio");
    if ((unint64_t)(v12 - 2) >= 3)
      v13 = v12;
    else
      v13 = 0;
    -[CAMFullscreenViewfinder _layout](self, "_layout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v13, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    v4 = v15;
    v6 = v16;
    v8 = v17;
    v10 = v18;

  }
  v19 = v4;
  v20 = v6;
  v21 = v8;
  v22 = v10;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_frameForPreviewOverlaysInViewport:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  _BOOL4 IsNull;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frameForControlStatusBar");
  v27.origin.x = v8;
  v27.origin.y = v9;
  v27.size.width = v10;
  v27.size.height = v11;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v24 = CGRectIntersection(v23, v27);
  v12 = v24.origin.x;
  v13 = v24.origin.y;
  v14 = v24.size.width;
  v15 = v24.size.height;

  v25.origin.x = v12;
  v25.origin.y = v13;
  v25.size.width = v14;
  v25.size.height = v15;
  IsNull = CGRectIsNull(v25);
  v17 = 0.0;
  if (!IsNull)
    v17 = v15;
  v18 = height - v17;
  v19 = -0.0;
  if (!IsNull)
    v19 = v15;
  v20 = y + v19;
  v21 = x;
  v22 = width;
  result.size.height = v18;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v21;
  return result;
}

- (void)_updatePreviewLayerForPreviewFrame:(CGRect)a3 viewportFrame:(CGRect)a4 trueVideoTransitionPercentComplete:(double)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;
  double v11;
  double v12;
  id v13;

  height = a4.size.height;
  width = a4.size.width;
  v7 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMFullscreenViewfinder _overCapturePreviewLayer](self, "_overCapturePreviewLayer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    UIRectGetCenter();
    objc_msgSend(v13, "setPrimaryCaptureRectAspectRatio:centerPoint:trueVideoTransitionPercentComplete:", height / width, (v12 - y) / v7, (v11 - x) / v8, a5);
  }

}

- (BOOL)requestPreviewUpdateForSemanticStyleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
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
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v44;
  void *v45;
  void *v46;
  uint8_t v47;
  _BYTE v48[15];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v3 = a3;
  v54 = *MEMORY[0x1E0C80C00];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "smartStylesSupported");

  if ((v6 & 1) != 0)
    return 0;
  -[CAMFullscreenViewfinder delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fullscreenViewfinderCanUpdatePreviewSemanticStyles:", self);

  if (!v8)
    return 0;
  -[CAMFullscreenViewfinder _overCapturePreviewLayer](self, "_overCapturePreviewLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CAMFullscreenViewfinder isSemanticStyleControlVisible](self, "isSemanticStyleControlVisible");
  -[CAMFullscreenViewfinder delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "fullscreenViewfinderSemanticStyleList:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "selectedStyleIndex");

    if (v15 <= 1)
      v16 = 1;
    else
      v16 = v15;
    v17 = v16 - 1;
    v18 = objc_msgSend(v13, "count");
    if (v15 + 1 < (unint64_t)(v18 - 1))
      v19 = v15 + 1;
    else
      v19 = v18 - 1;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v16 - 1 < (unint64_t)(v19 + 1))
    {
      v21 = v16 - 2;
      do
      {
        ++v21;
        -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "presentatationStyleRectAtIndex:", v21);

        -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bounds");
        CEKNormalizeRect();
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v25, v27, v29, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v32);

      }
      while (v19 != v21);
    }
    v46 = v20;
    objc_msgSend(v13, "subarrayWithRange:", v17, v19 - v17 + 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isSemanticStyleRenderingEnabled") & 1) != 0)
    {
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v35 = v33;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v50;
        do
        {
          v39 = 0;
          do
          {
            if (*(_QWORD *)v50 != v38)
              objc_enumerationMutation(v35);
            v40 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v39);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v40, "avSemanticStyle");
              v41 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addObject:", v41);
            }
            else
            {
              v41 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                -[CAMFullscreenViewfinder requestPreviewUpdateForSemanticStyleAnimated:].cold.1(&v47, v48, v41);
            }

            ++v39;
          }
          while (v37 != v39);
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        }
        while (v37);
      }

      v42 = objc_msgSend(v34, "count");
      if (v42 == objc_msgSend(v46, "count"))
        objc_msgSend(v9, "setSemanticStyles:semanticStylesRegions:", v34, v46);

    }
  }
  else
  {
    objc_msgSend(v11, "fullscreenViewfinderSelectedSemanticStyle:", self);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isSemanticStyleRenderingEnabled"))
    {
      if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v44, "avSemanticStyle");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSemanticStyle:animated:", v45, v3);

      }
    }

  }
  return 1;
}

- (void)_updateReticleForViewportFrame:(CGRect)a3
{
  double height;
  double y;
  double v6;
  double v7;
  id v8;

  height = a3.size.height;
  y = a3.origin.y;
  -[CAMFullscreenViewfinder bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width);
  v7 = v6 - (y + height);
  -[CAMFullscreenViewfinder _reticleView](self, "_reticleView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setViewportTopInset:bottomInset:animated:", 0, y, v7);
  objc_msgSend(v8, "layoutIfNeeded");

}

- (void)_updateModeDialClippingForViewportFrame:(CGRect)a3
{
  CGFloat height;
  void *v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double MaxY;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  void *rect_24a;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  rect_16 = a3.origin.y;
  rect_24 = a3.size.width;
  rect_8 = a3.origin.x;
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 0);
  rect = v6;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alignmentRectForShutterControl");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v32.origin.x = rect_8;
  v32.origin.y = rect_16;
  v32.size.width = rect_24;
  v32.size.height = height;
  MaxY = CGRectGetMaxY(v32);
  v33.origin.x = rect;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  v23 = fmin(MaxY, CGRectGetMaxY(v33));
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v25 = v24;
  v34.origin.x = v15;
  v34.origin.y = v17;
  v34.size.width = v19;
  v34.size.height = v21;
  v26 = CGRectGetMinY(v34) - v23;
  -[CAMFullscreenViewfinder _modeClippingView](self, "_modeClippingView");
  rect_24a = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(rect_24a, "setFrame:", 0.0, v23, v25, v26);

}

- (void)_updatePreviewAlignmentGuideForViewportFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMFullscreenViewfinder previewAlignmentGuide](self, "previewAlignmentGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", x, y, width, height);

  -[CAMFullscreenViewfinder previewAlignmentGuide](self, "previewAlignmentGuide");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

}

- (void)_updateSemanticStylePicker:(id)a3 forViewportFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  int64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  if (a3)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v15 = a3;
    objc_msgSend(v15, "setFrame:", x, y, width, height);
    v9 = -[CAMFullscreenViewfinder _viewportAspectRatioForControlsOverPreview](self, "_viewportAspectRatioForControlsOverPreview");
    -[CAMFullscreenViewfinder _layout](self, "_layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v9, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    v12 = v11;
    v14 = v13;

    objc_msgSend(v15, "setContentBottomMargin:", y + height - (v12 + v14));
    objc_msgSend(v15, "layoutIfNeeded");

  }
}

- (CGRect)_frameForSpotlightControlPanel
{
  int64_t v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MaxY;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  v3 = -[CAMFullscreenViewfinder _viewportAspectRatioForControlsOverPreview](self, "_viewportAspectRatioForControlsOverPreview");
  v4 = -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls");
  v5 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v3, v4, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  MaxY = CGRectGetMaxY(v30);
  v31.origin.x = v17;
  v31.origin.y = v19;
  v31.size.width = v21;
  v31.size.height = v23;
  v25 = CGRectGetMaxY(v31);
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v27 = v25 - MaxY;
  v28 = 0.0;
  v29 = MaxY;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)_frameForReticleViewport
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = -[CAMFullscreenViewfinder viewportAspectRatio](self, "viewportAspectRatio");
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v3, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_frameForContentClippingContainer
{
  void *v3;
  double MinY;
  void *v5;
  double MaxY;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect result;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameForControlStatusBar");
  MinY = CGRectGetMinY(v12);

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer"));
  MaxY = CGRectGetMaxY(v13);

  -[CAMFullscreenViewfinder externalStorageButton](self, "externalStorageButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CAMFullscreenViewfinder _frameForExternalStorageButton](self, "_frameForExternalStorageButton");
    MaxY = CGRectGetMaxY(v14);
  }
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v10 = MaxY - MinY;
  v11 = MinY;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v11;
  result.origin.x = v8;
  return result;
}

- (void)_updateDisabledModeOverlayViewportFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMFullscreenViewfinder disabledModeOverlayView](self, "disabledModeOverlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setViewportFrame:", x, y, width, height);

  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[CAMFullscreenViewfinder disabledModeOverlayView](self, "disabledModeOverlayView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  -[CAMFullscreenViewfinder disabledModeOverlayView](self, "disabledModeOverlayView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutIfNeeded");

}

- (void)_layoutZoomControls
{
  int64_t v3;
  _BOOL8 v4;
  int64_t v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double MaxY;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double MinY;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double rect;
  CGFloat rect_8;
  double rect_16;
  CGFloat rect_24;
  double v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  void *v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v3 = -[CAMFullscreenViewfinder viewportAspectRatio](self, "viewportAspectRatio");
  v4 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  v5 = -[CAMFullscreenViewfinder _viewportAspectRatioForControlsOverPreview](self, "_viewportAspectRatioForControlsOverPreview");
  if (v5 == v3)
  {
    v6 = 0;
  }
  else
  {
    v4 = -[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer");
    v6 = -[CAMFullscreenViewfinder isZoomControlVisible](self, "isZoomControlVisible");
  }
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v3, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), v4);
  v9 = v8;
  v11 = v10;
  v54 = v13;
  v55 = v12;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v5, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), v4);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v53 = *MEMORY[0x1E0C9D648];
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v52 = v23;
  rect_24 = v16;
  v66.origin.x = v16;
  rect_8 = v18;
  v66.origin.y = v18;
  v61 = v22;
  v62 = v20;
  v66.size.width = v20;
  v66.size.height = v22;
  MaxY = CGRectGetMaxY(v66);
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v63 = v25 - MaxY;
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "alignmentRectForShutterControl");
  rect = v27;
  v29 = v28;
  v60 = v30;
  rect_16 = v31;

  v32 = v29;
  if (v4)
  {
    -[CAMFullscreenViewfinder _layout](self, "_layout");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v5, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 0);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v64 = v40;

    v67.origin.x = rect_24;
    v67.origin.y = rect_8;
    v67.size.height = v61;
    v67.size.width = v62;
    v41 = v9;
    v42 = CGRectGetMaxY(v67);
    v68.origin.x = v35;
    v68.origin.y = v37;
    v68.size.width = v39;
    v68.size.height = v64;
    v43 = v42 - CGRectGetMaxY(v68);
    v9 = v41;
    v32 = v29 + v43;
  }
  -[CAMFullscreenViewfinder zoomControl](self, "zoomControl");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMZoomControlUtilities layoutZoomControl:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:](CAMZoomControlUtilities, "layoutZoomControl:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:", v65, 4, v6, v53, MaxY, v52, v63, rect, v32, v60, rect_16, v9, v11, v55, v54);
  -[CAMFullscreenViewfinder zoomSlider](self, "zoomSlider");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  +[CAMZoomSliderUtilities layoutZoomSlider:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:viewfinderViewAlignmentRect:](CAMZoomSliderUtilities, "layoutZoomSlider:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:viewfinderViewAlignmentRect:", v44, 0, v6, v53, MaxY, v52, v63, rect, v32, v60, rect_16, v9, v11, v55, v54, v45,
    v46,
    v47,
    v48);

  objc_msgSend(v65, "frame");
  MinY = CGRectGetMinY(v69);
  if (v6 && !-[CAMFullscreenViewfinder isModeUIAllowed](self, "isModeUIAllowed"))
  {
    v50 = CAMPixelWidthForView(self) + 19.0;
    v71.origin.x = rect;
    v71.origin.y = v29;
    v71.size.width = v60;
    v71.size.height = rect_16;
    v51 = CGRectGetMinY(v71);
  }
  else
  {
    v50 = 15.0;
    v70.origin.x = rect_24;
    v70.origin.y = rect_8;
    v70.size.height = v61;
    v70.size.width = v62;
    v51 = CGRectGetMaxY(v70);
  }
  objc_msgSend(v65, "setZoomButtonMaxYWhenContracted:", v51 - MinY - v50);

}

- (CGRect)_frameForExternalStorageButton
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
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
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[CAMFullscreenViewfinder externalStorageButton](self, "externalStorageButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "intrinsicContentSize");
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  CGRectGetMaxY(v25);
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  CGRectGetWidth(v26);
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  CGRectGetMaxY(v27);
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  CGRectGetMaxY(v28);
  UIRectCenteredIntegralRect();
  objc_msgSend(v3, "frameForAlignmentRect:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBadgeTray
{
  double v5;
  double v6;
  double v7;
  double MaxY;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  CGFloat *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  _BOOL8 v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  __int128 *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double MaxX;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  CGFloat v50;
  CGFloat v51;
  double v52;
  CGFloat rect;
  CGFloat recta;
  CGFloat rect2;
  double rect2a;
  _OWORD v57[6];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
  v6 = v5;
  MaxY = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[CAMFullscreenViewfinder orientation](self, "orientation");
  v14 = (CGFloat *)MEMORY[0x1E0C9D648];
  v15 = -[CAMFullscreenViewfinder isElapsedTimeViewVisible](self, "isElapsedTimeViewVisible");
  -[CAMFullscreenViewfinder _visibleInstructionLabelForInstructionLabelValue:](self, "_visibleInstructionLabelForInstructionLabelValue:", -[CAMFullscreenViewfinder visibleInstructionLabel](self, "visibleInstructionLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder _visibleInstructionLabelForInstructionLabelValue:](self, "_visibleInstructionLabelForInstructionLabelValue:", -[CAMFullscreenViewfinder visibleSecondaryInstructionLabel](self, "visibleSecondaryInstructionLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder elapsedTimeView](self, "elapsedTimeView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CAMFullscreenViewfinder orientation](self, "orientation");
  v21 = -[CAMFullscreenViewfinder isSystemOverlayVisible](self, "isSystemOverlayVisible");
  if (v18)
  {
    objc_msgSend(v18, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v19, v20, v21, v6, MaxY, v10, v12);
  }
  else
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
  }
  v22 = *v14;
  v23 = v14[1];
  v25 = v14[2];
  v24 = v14[3];

  rect2 = v24;
  if (v15)
  {
    v78 = v84;
    v79 = v85;
    v80 = v86;
    v81 = v87;
    v76 = v82;
    v77 = v83;
    if (!v16)
    {
      v26 = v24;
      v27 = v25;
      v28 = v23;
      v29 = v22;
      if (v13 - 3 > 1)
        goto LABEL_13;
      v72 = v84;
      v73 = v85;
      v74 = v86;
      v75 = v87;
      v70 = v82;
      v71 = v83;
      v30 = &v70;
      goto LABEL_12;
    }
  }
  else
  {
    v78 = xmmword_1DB9A77F0;
    v79 = xmmword_1DB9A7800;
    v80 = xmmword_1DB9A7810;
    v81 = xmmword_1DB9A7820;
    v26 = v24;
    v27 = v25;
    v28 = v23;
    v76 = CAMViewGeometryZero;
    v77 = xmmword_1DB9A77E0;
    v29 = v22;
    if (!v16)
      goto LABEL_13;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v66 = xmmword_1DB9A77F0;
  v67 = xmmword_1DB9A7800;
  v68 = xmmword_1DB9A7810;
  v69 = xmmword_1DB9A7820;
  v64 = CAMViewGeometryZero;
  v65 = xmmword_1DB9A77E0;
  v60 = v78;
  v61 = v79;
  v62 = v80;
  v63 = v81;
  v58 = v76;
  v59 = v77;
  -[CAMFullscreenViewfinder _geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:](self, "_geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:", v16, &v64, &v58);
  if (v17)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v60 = v72;
    v61 = v73;
    v62 = v74;
    v63 = v75;
    v58 = v70;
    v59 = v71;
    v57[2] = v78;
    v57[3] = v79;
    v57[4] = v80;
    v57[5] = v81;
    v57[0] = v76;
    v57[1] = v77;
    -[CAMFullscreenViewfinder _geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:](self, "_geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:", v17, &v58, v57);
    v60 = v66;
    v61 = v67;
    v62 = v68;
    v63 = v69;
    v58 = v64;
    v59 = v65;
    v30 = &v58;
  }
  else
  {
    v66 = v72;
    v67 = v73;
    v68 = v74;
    v69 = v75;
    v64 = v70;
    v65 = v71;
    v30 = &v64;
  }
LABEL_12:
  CAMFrameForGeometry((uint64_t)v30);
  v29 = v31;
LABEL_13:
  if (v13 >= 3)
  {
    if (v13 == 3)
    {
      v44 = v29;
      v96.size.width = v25;
      v45 = v27;
      v96.origin.y = v23;
      v46 = v26;
      recta = v28;
      v96.origin.x = v22;
      v96.size.height = rect2;
      v47 = 0.0;
      if (!CGRectEqualToRect(*(CGRect *)(&v28 - 1), v96))
      {
        v92.origin.x = v6;
        v92.origin.y = MaxY;
        v92.size.width = v10;
        v92.size.height = v12;
        MaxX = CGRectGetMaxX(v92);
        v93.origin.x = v29;
        v93.origin.y = recta;
        v93.size.width = v45;
        v93.size.height = v46;
        v47 = MaxX - CGRectGetMinX(v93);
      }
      v94.origin.x = v6;
      v94.origin.y = MaxY;
      v94.size.width = v10;
      v94.size.height = v12;
      v6 = CGRectGetMaxX(v94) + -40.0 - v47;
    }
    else
    {
      if (v13 != 4)
        goto LABEL_26;
      v43 = v29;
      v6 = CGRectGetMaxX(*(CGRect *)(&v28 - 1));
    }
    v10 = 40.0;
    goto LABEL_26;
  }
  rect = v28;
  rect2a = v6;
  v50 = v27;
  v51 = v26;
  v88.origin.x = v6;
  v88.origin.y = MaxY;
  v52 = v10;
  v88.size.width = v10;
  v88.size.height = v12;
  v32 = MaxY;
  MaxY = CGRectGetMinY(v88) + -40.0;
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frameForControlStatusBar");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v40 = v12;
  v42 = v41;

  v89.origin.x = v35;
  v89.origin.y = v37;
  v89.size.width = v39;
  v89.size.height = v42;
  if (MaxY >= CGRectGetMaxY(v89))
  {
LABEL_25:
    v12 = 40.0;
    v6 = rect2a;
    v10 = v52;
    goto LABEL_26;
  }
  v90.origin.x = v29;
  v90.origin.y = rect;
  v90.size.width = v50;
  v90.size.height = v51;
  if (!CGRectIsEmpty(v90))
  {
    v95.origin.x = v29;
    v95.origin.y = rect;
    v95.size.width = v50;
    v95.size.height = v51;
    MaxY = CGRectGetMaxY(v95);
    goto LABEL_25;
  }
  v6 = rect2a;
  v10 = v52;
  -[CAMFullscreenViewfinder _frameForPreviewOverlaysInViewport:](self, "_frameForPreviewOverlaysInViewport:", rect2a, v32, v52, v40);
  MaxY = CGRectGetMinY(v91);
  v12 = 40.0;
LABEL_26:
  CAMViewGeometryForOrientedFrame(v13, (uint64_t)retstr, v6, MaxY, v10, v12);

  return result;
}

- (CGRect)_frameForControlDrawer
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MaxY;
  double MinY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alignmentRectForShutterControl");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CAMFullscreenViewfinder _currentFourThreeViewportFrame](self, "_currentFourThreeViewportFrame");
  MaxY = CGRectGetMaxY(v21);
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  MinY = CGRectGetMinY(v22);
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v15 = v14;
  v16 = MinY - MaxY;
  if (-[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"))
    v17 = MaxY;
  else
    v17 = v7;
  v18 = 0.0;
  v19 = v15;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v17;
  result.origin.x = v18;
  return result;
}

- (CGRect)_frameForBottomLegibilityBackground
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MaxY;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer"));
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  MaxY = CGRectGetMaxY(v20);
  v17 = v6 - MaxY;
  v18 = 0.0;
  v19 = v4;
  result.size.height = v17;
  result.size.width = v19;
  result.origin.y = MaxY;
  result.origin.x = v18;
  return result;
}

- (CGRect)_frameForFlipButton
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder flipButton](self, "flipButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameForBottomRightControl:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_frameForImageWell
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder imageWell](self, "imageWell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameForBottomLeftControl:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_frameForModeView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double MaxY;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alignmentRectForShutterControl");
  v14 = v13;

  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  MaxY = CGRectGetMaxY(v35);
  v16 = v14 - MaxY;
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  v18 = v17;
  if (-[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer"))
  {
    -[CAMFullscreenViewfinder _currentFourThreeViewportFrame](self, "_currentFourThreeViewportFrame");
    MaxY = CGRectGetMaxY(v36) - v16;
  }
  -[CAMFullscreenViewfinder _modeClippingView](self, "_modeClippingView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder modeDial](self, "modeDial");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertRect:toView:", v22, 0.0, MaxY, v18, v16);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForMRCButton
{
  unint64_t v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidY;
  int64_t v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  double v32;
  double v33;
  id v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[CAMFullscreenViewfinder machineReadableCodeButton](self, "machineReadableCodeButton");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMFullscreenViewfinder orientation](self, "orientation");
  -[CAMFullscreenViewfinder imageAnalysisButton](self, "imageAnalysisButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  MidY = CGRectGetMidY(v35);
  -[CAMFullscreenViewfinder _imageAnalysisButtonAlignmentRectForCenterY:](self, "_imageAnalysisButtonAlignmentRectForCenterY:");
  v37 = CGRectInset(v36, -5.0, -5.0);
  if (v5 - 3 > 1)
  {
    v27 = v37.origin.x;
    -[CAMFullscreenViewfinder bounds](self, "bounds");
    v26 = v28 - v27;
    v25 = 15.0;
  }
  else
  {
    v32 = v37.origin.y;
    v12 = -[CAMFullscreenViewfinder _viewportAspectRatioForControlsOverPreview](self, "_viewportAspectRatioForControlsOverPreview", v37.origin.x);
    -[CAMFullscreenViewfinder _layout](self, "_layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v12, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    v15 = v14;
    v17 = v16;
    v33 = MidY;
    v18 = width;
    v19 = x;
    v21 = v20;
    v22 = y;
    v24 = v23;

    v38.origin.x = v15;
    v38.origin.y = v17;
    v38.size.width = v21;
    x = v19;
    width = v18;
    MidY = v33;
    v38.size.height = v24;
    y = v22;
    v25 = CGRectGetMaxY(v38) - v32;
    v26 = 15.0;
  }
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  -[CAMFullscreenViewfinder _geometryForBottomCenteredView:margins:](self, "_geometryForBottomCenteredView:margins:", v34, v26, v25);
  if (v5 >= 3)
  {
    if (v5 == 3)
    {
      -[CAMFullscreenViewfinder _previewSuggestionButton](self, "_previewSuggestionButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[CAMFullscreenViewfinder _previewSuggestionButton](self, "_previewSuggestionButton");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "frame");
        retstr->var1.x = CGRectGetMidX(v40);

      }
    }
    else if (v5 == 4)
    {
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      retstr->var1.x = CGRectGetMidX(v39);
    }
  }
  else
  {
    retstr->var1.y = MidY;
  }

  return result;
}

- (CGRect)_frameForLightingControl
{
  void *v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
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
  double v27;
  double v28;
  CGRect v29;
  CGRect result;

  -[CAMFullscreenViewfinder lightingControl](self, "lightingControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMFullscreenViewfinder viewportAspectRatio](self, "viewportAspectRatio");
  if (v4 == 1)
    v5 = 0;
  else
    v5 = v4;
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v5, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v3, "contentHeightForWidth:", v12);
  v16 = v15;
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  objc_msgSend(v3, "frameForAlignmentRect:", v8, CGRectGetMaxY(v29) - v16, v12, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)_additionalBottomPaddingForLightingControl
{
  int64_t v3;
  double result;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double Height;
  CGRect v24;
  CGRect v25;

  v3 = -[CAMFullscreenViewfinder viewportAspectRatio](self, "viewportAspectRatio");
  result = 0.0;
  if (v3 == 1)
  {
    -[CAMFullscreenViewfinder _layout](self, "_layout", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[CAMFullscreenViewfinder _layout](self, "_layout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v24.origin.x = v7;
    v24.origin.y = v9;
    v24.size.width = v11;
    v24.size.height = v13;
    Height = CGRectGetHeight(v24);
    v25.origin.x = v16;
    v25.origin.y = v18;
    v25.size.width = v20;
    v25.size.height = v22;
    return Height - CGRectGetHeight(v25) - (v18 - v9);
  }
  return result;
}

- (void)_updateLightingControlClipping
{
  uint64_t v3;
  unint64_t v4;
  id v5;

  if (-[CAMFullscreenViewfinder material](self, "material") == 4)
  {
    v3 = 0;
  }
  else
  {
    v4 = -[CAMFullscreenViewfinder viewportAspectRatio](self, "viewportAspectRatio");
    if (v4 <= 3)
      v3 = (0xDu >> (v4 & 0xF)) & 1;
    else
      v3 = 0;
  }
  -[CAMFullscreenViewfinder lightingControl](self, "lightingControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", v3);

}

- (CGRect)_imageAnalysisButtonFrameForZoomControl:(id)a3 zoomSlider:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[CAMFullscreenViewfinder _centerYForZoomControl:zoomSlider:](self, "_centerYForZoomControl:zoomSlider:", a3, a4);
  -[CAMFullscreenViewfinder _imageAnalysisButtonFrameForCenterY:](self, "_imageAnalysisButtonFrameForCenterY:");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_previewSuggestionButtonFrameForZoomControl:(id)a3 zoomSlider:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[CAMFullscreenViewfinder _centerYForZoomControl:zoomSlider:](self, "_centerYForZoomControl:zoomSlider:", a3, a4);
  -[CAMFullscreenViewfinder _previewSuggestionButtonFrameForCenterY:](self, "_previewSuggestionButtonFrameForCenterY:");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (double)_centerYForZoomControl:(id)a3 zoomSlider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MidY;
  CGRect v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    -[CAMFullscreenViewfinder traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMZoomButton circleDiameterForContentSize:](CAMZoomButton, "circleDiameterForContentSize:", v10);
    v12 = v11;

    objc_msgSend(v6, "frame");
    v14 = v13;
    objc_msgSend(v6, "zoomButtonMaxYWhenContracted");
    MidY = v15 + v14 + v12 * -0.5;
  }
  else if (v7)
  {
    objc_msgSend(v7, "frame");
    MidY = CGRectGetMidY(v18);
  }
  else
  {
    MidY = 0.0;
  }

  return MidY;
}

- (CGRect)_imageAnalysisButtonAlignmentRectForCenterY:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CAMFullscreenViewfinder imageAnalysisButton](self, "imageAnalysisButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicContentSize");
  UIRoundToViewScale();
  -[CAMFullscreenViewfinder _frameForFlipButton](self, "_frameForFlipButton");
  UIRectCenteredXInRectScale();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_imageAnalysisButtonFrameForCenterY:(double)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MaxX;
  CGFloat v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  -[CAMFullscreenViewfinder _imageAnalysisButtonAlignmentRectForCenterY:](self, "_imageAnalysisButtonAlignmentRectForCenterY:", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CAMFullscreenViewfinder bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v14);
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  v13 = -(MaxX - CGRectGetMaxX(v15));
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  return CGRectInset(v16, v13, -15.0);
}

- (CGRect)_previewSuggestionButtonFrameForCenterY:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CAMFullscreenViewfinder _imageAnalysisButtonFrameForCenterY:](self, "_imageAnalysisButtonFrameForCenterY:", a3);
  v6 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v6;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForInstructionLabel:(SEL)a3 belowInstructionLabelGeometry:(id)a4 elapsedTimeViewGeometry:(id *)a5
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  __int128 v35;
  __int128 v36;
  CGSize size;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  __int128 v42;
  __int128 v43;
  CGSize v44;
  BOOL IsEqualToViewGeometry;
  __int128 v46;
  __int128 v47;
  CGSize v48;
  _BOOL4 v49;
  __int128 v50;
  __int128 v51;
  CGSize v52;
  double y;
  double width;
  double height;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  uint64_t v63;
  double MinY;
  double v68;
  double MinX;
  double MaxX;
  double v71;
  CGFloat x;
  CGFloat v73;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  CGSize v75;
  CGRect v76;
  double v77;
  double v78;
  double v79;
  double v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  CGPoint origin;
  CGSize v88;
  CGPoint var1;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v10 = a4;
  -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[CAMFullscreenViewfinder orientation](self, "orientation");
  v20 = v19;
  *retstr = *($3B1716E7537CC2F16D6737AAC3CCCADB *)CAMViewGeometryZero;
  v21 = v19 - 3;
  if ((unint64_t)(v19 - 3) >= 2)
    v22 = v16;
  else
    v22 = v18;
  if ((unint64_t)(v19 - 3) >= 2)
    v23 = v18;
  else
    v23 = v16;
  objc_msgSend(v10, "sizeThatFits:", v22 + -25.0, v23 + -25.0);
  v25 = v24;
  v27 = v26;

  retstr->var0.size.width = v25;
  retstr->var0.size.height = v27;
  v78 = v12;
  v79 = v14;
  UIRectGetCenter();
  v80 = v28;
  v30 = v29;
  v31 = CAMPixelWidthForView(self) + 10.0;
  v77 = v30;
  if (v21 <= 1)
  {
    if (-[CAMFullscreenViewfinder _showSemanticStylePicker](self, "_showSemanticStylePicker"))
    {
      -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[CAMFullscreenViewfinder _showSmartStylePicker](self, "_showSmartStylePicker"))
        goto LABEL_13;
      -[CAMFullscreenViewfinder smartStylePicker](self, "smartStylePicker");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = v32;
    objc_msgSend(v32, "spacerWidth");
    v31 = v31 + v34 + 10.0;

  }
LABEL_13:
  v35 = *(_OWORD *)&a6->var2.a;
  var1 = a6->var1;
  v90 = v35;
  v36 = *(_OWORD *)&a6->var2.tx;
  v91 = *(_OWORD *)&a6->var2.c;
  v92 = v36;
  size = a6->var0.size;
  origin = a6->var0.origin;
  v88 = size;
  CAMFrameForGeometry((uint64_t)&origin);
  v76.origin.x = v38;
  v76.origin.y = v39;
  v76.size.width = v40;
  v76.size.height = v41;
  v42 = *(_OWORD *)&a6->var2.a;
  var1 = a6->var1;
  v90 = v42;
  v43 = *(_OWORD *)&a6->var2.tx;
  v91 = *(_OWORD *)&a6->var2.c;
  v92 = v43;
  v44 = a6->var0.size;
  origin = a6->var0.origin;
  v88 = v44;
  v83 = *(_OWORD *)&CAMViewGeometryZero[32];
  v84 = *(_OWORD *)&CAMViewGeometryZero[48];
  v85 = *(_OWORD *)&CAMViewGeometryZero[64];
  v86 = *(_OWORD *)&CAMViewGeometryZero[80];
  v81 = *(_OWORD *)CAMViewGeometryZero;
  v82 = *(_OWORD *)&CAMViewGeometryZero[16];
  IsEqualToViewGeometry = CAMViewGeometryIsEqualToViewGeometry((uint64_t)&origin, (uint64_t)&v81);
  v46 = *(_OWORD *)&a5->var2.a;
  var1 = a5->var1;
  v90 = v46;
  v47 = *(_OWORD *)&a5->var2.tx;
  v91 = *(_OWORD *)&a5->var2.c;
  v92 = v47;
  v48 = a5->var0.size;
  origin = a5->var0.origin;
  v88 = v48;
  v83 = *(_OWORD *)&CAMViewGeometryZero[32];
  v84 = *(_OWORD *)&CAMViewGeometryZero[48];
  v85 = *(_OWORD *)&CAMViewGeometryZero[64];
  v86 = *(_OWORD *)&CAMViewGeometryZero[80];
  v81 = *(_OWORD *)CAMViewGeometryZero;
  v82 = *(_OWORD *)&CAMViewGeometryZero[16];
  v49 = CAMViewGeometryIsEqualToViewGeometry((uint64_t)&origin, (uint64_t)&v81);
  v50 = *(_OWORD *)&a5->var2.a;
  var1 = a5->var1;
  v90 = v50;
  v51 = *(_OWORD *)&a5->var2.tx;
  v91 = *(_OWORD *)&a5->var2.c;
  v92 = v51;
  v52 = a5->var0.size;
  origin = a5->var0.origin;
  v88 = v52;
  CAMFrameForGeometry((uint64_t)&origin);
  v57 = v56;
  v58 = y;
  v59 = width;
  v60 = height;
  v61 = 0.25;
  if (v49)
    v61 = 0.5;
  v62 = v31 + v27 * v61;
  if (v20 < 3)
  {
    -[CAMFullscreenViewfinder _frameForPreviewOverlaysInViewport:](self, "_frameForPreviewOverlaysInViewport:", v78, v79, v16, v18);
    if (v49)
    {
      MinY = CGRectGetMinY(*(CGRect *)&v63);
    }
    else
    {
      v94.origin.x = v57;
      v94.origin.y = v58;
      v94.size.width = v59;
      v94.size.height = v60;
      MinY = CGRectGetMaxY(v94);
    }
    v68 = v62 + MinY;
    goto LABEL_29;
  }
  if (v20 == 3)
  {
    if (v49)
    {
      if (IsEqualToViewGeometry)
      {
        v95.origin.x = v78;
        v95.origin.y = v79;
        v95.size.width = v16;
        v95.size.height = v18;
        MaxX = CGRectGetMaxX(v95);
LABEL_36:
        v68 = v77;
        v71 = MaxX - v62;
        goto LABEL_37;
      }
      x = v76.origin.x;
      y = v76.origin.y;
      width = v76.size.width;
      height = v76.size.height;
    }
    else
    {
      x = v57;
    }
    MaxX = CGRectGetMinX(*(CGRect *)(&y - 1));
    goto LABEL_36;
  }
  if (v20 != 4)
  {
    v68 = v77;
LABEL_29:
    v71 = v80;
    goto LABEL_37;
  }
  if (v49)
  {
    v68 = v77;
    if (IsEqualToViewGeometry)
    {
      v93.origin.x = v78;
      v93.origin.y = v79;
      v93.size.width = v16;
      v93.size.height = v18;
      MinX = CGRectGetMinX(v93);
    }
    else
    {
      MinX = CGRectGetMaxX(v76);
    }
  }
  else
  {
    v73 = v57;
    MinX = CGRectGetMaxX(*(CGRect *)(&y - 1));
    v68 = v77;
  }
  v71 = v62 + MinX;
LABEL_37:
  retstr->var1.x = v71;
  retstr->var1.y = v68;
  result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)CAMOrientationTransform(v20, (uint64_t)&origin);
  v75 = v88;
  *(CGPoint *)&retstr->var2.a = origin;
  *(CGSize *)&retstr->var2.c = v75;
  *(CGPoint *)&retstr->var2.tx = var1;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForLandscapeLightingBadge
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  CGPoint v9;
  CGSize v10;
  CGPoint v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGRect v15;

  -[CAMFullscreenViewfinder lightingNameBadge](self, "lightingNameBadge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  if (v5)
  {
    CAMViewGetGeometry(v5, (uint64_t)retstr);
    objc_msgSend(v6, "bounds");
    v7 = CGRectEqualToRect(v15, *MEMORY[0x1E0C9D648]);
  }
  else
  {
    v7 = 0;
    retstr->var1 = *(CGPoint *)&CAMViewGeometryZero[32];
    *(_OWORD *)&retstr->var2.a = *(_OWORD *)&CAMViewGeometryZero[48];
    *(_OWORD *)&retstr->var2.c = *(_OWORD *)&CAMViewGeometryZero[64];
    *(_OWORD *)&retstr->var2.tx = *(_OWORD *)&CAMViewGeometryZero[80];
    retstr->var0.origin = *(CGPoint *)CAMViewGeometryZero;
    retstr->var0.size = *(CGSize *)&CAMViewGeometryZero[16];
  }
  if (-[CAMFullscreenViewfinder _showLandscapeLightingBadge](self, "_showLandscapeLightingBadge") || v7)
  {
    -[CAMFullscreenViewfinder _geometryForBottomCenteredView:](self, "_geometryForBottomCenteredView:", v6);
    retstr->var1 = v11;
    *(_OWORD *)&retstr->var2.a = v12;
    *(_OWORD *)&retstr->var2.c = v13;
    *(_OWORD *)&retstr->var2.tx = v14;
    retstr->var0.origin = v9;
    retstr->var0.size = v10;
  }

  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3
{
  return -[CAMFullscreenViewfinder _geometryForBottomCenteredView:margin:](self, "_geometryForBottomCenteredView:margin:", a4, 15.0);
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3 margin:(id)a4
{
  return -[CAMFullscreenViewfinder _geometryForBottomCenteredView:margins:](self, "_geometryForBottomCenteredView:margins:", a4, a5, a5);
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3 margins:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v9;
  int64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat x;
  CGFloat y;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  _OWORD v33[3];
  __int128 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v10 = -[CAMFullscreenViewfinder _viewportAspectRatioForControlsOverPreview](self, "_viewportAspectRatioForControlsOverPreview");
  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v10, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v42.origin.x = v13;
  v42.origin.y = v15;
  v42.size.width = v17;
  v42.size.height = v19;
  v43 = CGRectInset(v42, width, height);
  x = v43.origin.x;
  y = v43.origin.y;
  v22 = v43.size.width;
  v23 = v43.size.height;
  v24 = -[CAMFullscreenViewfinder orientation](self, "orientation");
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  CAMOrientationTransform(v24, (uint64_t)&v39);
  objc_msgSend(v9, "sizeThatFits:", v23 * *(double *)&v40 + *(double *)&v39 * v22, v23 * *((double *)&v40 + 1) + *((double *)&v39 + 1) * v22);
  v26 = v25;
  v28 = v27;

  UIRectGetCenter();
  v37 = v29;
  v38 = v30;
  if (v24 >= 3)
  {
    if (v24 == 3)
    {
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = v22;
      v46.size.height = v23;
      v31 = v28 * 0.5 + CGRectGetMinX(v46);
    }
    else
    {
      if (v24 != 4)
        goto LABEL_8;
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = v22;
      v45.size.height = v23;
      v31 = CGRectGetMaxX(v45) + v28 * -0.5;
    }
    v37 = v31;
    goto LABEL_8;
  }
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = v22;
  v44.size.height = v23;
  v38 = CGRectGetMaxY(v44) + v28 * -0.5;
LABEL_8:
  v34 = *MEMORY[0x1E0C9D538];
  v35 = v26;
  v36 = v28;
  +[CAMView ceilBounds:andRoundCenter:toViewScale:](CAMView, "ceilBounds:andRoundCenter:toViewScale:", &v34, &v37, self);
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  v33[0] = v39;
  v33[1] = v40;
  v33[2] = v41;
  CAMViewGeometryMake((uint64_t)v33, (uint64_t)retstr, v37, v38, *(double *)&v34, *((double *)&v34 + 1), v35, v36);
  return result;
}

- (int64_t)_viewportAspectRatioForControlsOverPreview
{
  int64_t result;
  int64_t v3;

  result = -[CAMFullscreenViewfinder viewportAspectRatio](self, "viewportAspectRatio");
  if (((1 << result) & 0x16) != 0)
    v3 = 0;
  else
    v3 = result;
  if ((unint64_t)result <= 4)
    return v3;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForTextInteractionInsertWithViewport:(SEL)a3
{
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;

  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  CAMViewGeometryForOrientedFrame(-[CAMFullscreenViewfinder orientation](self, "orientation"), (uint64_t)retstr, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return result;
}

- (void)_applyTextInsertContentInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  void *v12;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;

  -[CAMFullscreenViewfinder textInteractionInsert](self, "textInteractionInsert");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "contentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CAMFullscreenViewfinder orientation](self, "orientation");
  -[CAMFullscreenViewfinder imageAnalysisInstructionLabel](self, "imageAnalysisInstructionLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[CAMFullscreenViewfinder _frameForActionInfoView](self, "_frameForActionInfoView");
    v32 = v34;
    v33 = v41;
    if (v11 == 2)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(v33, "bounds");
    v8 = v39 + v40 - v32 + 8.0;
    goto LABEL_8;
  }
  -[CAMFullscreenViewfinder imageAnalysisInstructionLabel](self, "imageAnalysisInstructionLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[CAMFullscreenViewfinder imageAnalysisInstructionLabel](self, "imageAnalysisInstructionLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "convertRect:fromView:", v23, v15, v17, v19, v21);
  v25 = v24;
  v27 = v26;

  if (v11 != 2)
  {
    objc_msgSend(v41, "bounds");
    v4 = v25 + v27 - v37 + 8.0;
    -[CAMFullscreenViewfinder _frameForActionInfoView](self, "_frameForActionInfoView");
    v32 = v38;
    v33 = v41;
    goto LABEL_7;
  }
  objc_msgSend(v41, "bounds");
  v8 = v28 + v29 - v25 + 8.0;
  -[CAMFullscreenViewfinder _frameForActionInfoView](self, "_frameForActionInfoView");
  v32 = v31;
  v33 = v41;
LABEL_5:
  v35 = v32 + v30;
  objc_msgSend(v33, "bounds");
  v4 = v35 - v36 + 8.0;
LABEL_8:
  objc_msgSend(v41, "setContentInsets:", v4, v6, v8, v10);

}

- (CGRect)_frameForActionInfoView
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  double Width;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  CGFloat v19;
  double MidY;
  CGFloat v21;
  CGFloat MaxX;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat rect;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect result;

  -[CAMFullscreenViewfinder imageAnalysisButton](self, "imageAnalysisButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder textInteractionInsert](self, "textInteractionInsert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", v3);
  x = v39.origin.x;
  y = v39.origin.y;
  height = v39.size.height;
  rect = v39.size.width;
  Width = CGRectGetWidth(v39);
  objc_msgSend(v3, "backgroundDiameter");
  v10 = v9;
  objc_msgSend(v4, "bounds");
  v11 = CGRectGetWidth(v40);
  objc_msgSend(v3, "backgroundDiameter");
  v13 = v12;
  objc_msgSend(v4, "imageInteraction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionInfoEdgeInsets");
  v16 = v15;

  v17 = -[CAMFullscreenViewfinder orientation](self, "orientation");
  v18 = (Width - v10) * 0.5;
  switch(v17)
  {
    case 0:
    case 1:
      v19 = v18 - v16;
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = rect;
      v41.size.height = height;
      MidY = CGRectGetMidY(v41);
      v42.origin.y = 0.0;
      v42.origin.x = v19;
      v42.size.width = v11;
      v42.size.height = v13;
      v21 = MidY + CGRectGetHeight(v42) * -0.5;
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = rect;
      v43.size.height = height;
      CGRectGetMinX(v43);
      v44.origin.x = v19;
      v44.origin.y = v21;
      v44.size.width = v11;
      v44.size.height = v13;
      CGRectGetMinX(v44);
      break;
    case 2:
    case 4:
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = rect;
      v45.size.height = height;
      MaxX = CGRectGetMaxX(v45);
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = rect;
      v46.size.height = height;
      v23 = CGRectGetMidY(v46);
      v47.origin.y = 0.0;
      v47.origin.x = MaxX;
      v47.size.width = v11;
      v47.size.height = v13;
      v24 = v23 + CGRectGetHeight(v47) * -0.5;
      v48.origin.x = MaxX;
      v48.origin.y = v24;
      v48.size.width = v11;
      v48.size.height = v13;
      CGRectGetWidth(v48);
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = rect;
      v49.size.height = height;
      CGRectGetMaxX(v49);
      break;
    case 3:
      v25 = v18 - v16;
      objc_msgSend(v4, "bounds");
      CGRectGetMaxY(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = rect;
      v51.size.height = height;
      CGRectGetHeight(v51);
      v52.origin.y = 0.0;
      v52.origin.x = v25;
      v52.size.width = v11;
      v52.size.height = v13;
      CGRectGetHeight(v52);
      break;
    default:
      break;
  }
  UIRectRoundToViewScale();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v34 = v27;
  v35 = v29;
  v36 = v31;
  v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (void)_layoutPanoramaView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  -[CAMFullscreenViewfinder panoramaView](self, "panoramaView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[CAMFullscreenViewfinder previewView](self, "previewView", CAMTransformCorrectingForOrientation(-[CAMFullscreenViewfinder previewViewOrientation](self, "previewViewOrientation"), (uint64_t)&v16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");

  objc_msgSend(v3, "panoramaCaptureSize");
  +[CAMPanoramaUtilities panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:](CAMPanoramaUtilities, "panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:", 4);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "center");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v8, v10);
  objc_msgSend(v3, "setCenter:", v12, v14);
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  objc_msgSend(v3, "setTransform:", v15);

}

- (CGRect)_frameForSpatialRecordingIndicatorWithElapsedTimeViewGeometry:(id *)a3 orientation:(int64_t)a4
{
  double height;
  double width;
  double v8;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _OWORD v15[6];
  _BYTE v16[48];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGRect result;

  width = a3->var0.size.width;
  height = a3->var0.size.height;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  CAMOrientationTransform(a4, (uint64_t)v16);
  CAMViewGeometryMake((uint64_t)v16, (uint64_t)&v17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0.0, 0.0, height, height);
  if ((unint64_t)a4 >= 3)
  {
    v8 = height * 0.5 + width * 0.5 + 10.0;
    if (a4 == 3)
    {
      x = a3->var1.x;
      v10 = v8 + a3->var1.y;
    }
    else
    {
      if (a4 != 4)
        goto LABEL_8;
      x = a3->var1.x;
      v10 = a3->var1.y - v8;
    }
    *(CGFloat *)&v19 = x;
    *((double *)&v19 + 1) = v10;
    goto LABEL_8;
  }
  v19 = *(_OWORD *)&CAMViewGeometryZero[32];
  v20 = *(_OWORD *)&CAMViewGeometryZero[48];
  v21 = *(_OWORD *)&CAMViewGeometryZero[64];
  v22 = *(_OWORD *)&CAMViewGeometryZero[80];
  v17 = *(_OWORD *)CAMViewGeometryZero;
  v18 = *(_OWORD *)&CAMViewGeometryZero[16];
LABEL_8:
  v15[2] = v19;
  v15[3] = v20;
  v15[4] = v21;
  v15[5] = v22;
  v15[0] = v17;
  v15[1] = v18;
  CAMFrameForGeometry((uint64_t)v15);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_layoutSmartStyleNameBadge
{
  void *v3;
  _OWORD v4[6];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  -[CAMFullscreenViewfinder smartStyleNameBadge](self, "smartStyleNameBadge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    -[CAMFullscreenViewfinder _geometryForSmartStyleNameBadge:](self, "_geometryForSmartStyleNameBadge:", v3);
    v4[2] = v7;
    v4[3] = v8;
    v4[4] = v9;
    v4[5] = v10;
    v4[0] = v5;
    v4[1] = v6;
    CAMApplyAnimationSensitiveGeometryToView((double *)v4, v3);
  }

}

- (void)_layoutSmartStylesControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BYTE v11[96];
  _BYTE v12[96];

  -[CAMFullscreenViewfinder smartStyleSlider2D](self, "smartStyleSlider2D");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CAMFullscreenViewfinder smartStyleSlider2D](self, "smartStyleSlider2D");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder _geometryForSmartStyleSlider2DExpanded:](self, "_geometryForSmartStyleSlider2DExpanded:", -[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible"));
    CAMViewSetGeometry(v5, (uint64_t)v12);

  }
  -[CAMFullscreenViewfinder smartStyleIntensitySlider](self, "smartStyleIntensitySlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAMFullscreenViewfinder smartStyleIntensitySlider](self, "smartStyleIntensitySlider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder _geometryForSmartStyleIntensitySliderExpanded:](self, "_geometryForSmartStyleIntensitySliderExpanded:", -[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible"));
    CAMViewSetGeometry(v7, (uint64_t)v11);

  }
  -[CAMFullscreenViewfinder smartStyleValuesPlatterView](self, "smartStyleValuesPlatterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAMFullscreenViewfinder smartStyleValuesPlatterView](self, "smartStyleValuesPlatterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder _geometryForSmartStyleValuesPlatterView](self, "_geometryForSmartStyleValuesPlatterView");
    CAMViewSetGeometry(v9, (uint64_t)&v10);

  }
}

- (CGSize)_smartStyleSlider2DSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  CGSize result;
  CGRect v8;
  CGRect v9;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 1);
  CGRectGetMaxY(v8);

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 1);
  CGRectGetMaxY(v9);

  UIFloorToViewScale();
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleSlider2DExpanded:(SEL)a3
{
  return -[CAMFullscreenViewfinder _geometryForSmartStyleSlider2DExpanded:orientation:](self, "_geometryForSmartStyleSlider2DExpanded:orientation:", a4, -[CAMFullscreenViewfinder orientation](self, "orientation"));
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleSlider2DExpanded:(SEL)a3 orientation:(BOOL)a4
{
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MaxY;
  double v19;
  double v20;
  double v21;
  double v22;
  double MidX;
  __int128 v24;
  double MidY;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  CGAffineTransform v37;
  CGAffineTransform t2;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v41.origin.x = v11;
  v41.origin.y = v13;
  v41.size.width = v15;
  v41.size.height = v17;
  MaxY = CGRectGetMaxY(v41);
  -[CAMFullscreenViewfinder _smartStyleSlider2DSize](self, "_smartStyleSlider2DSize");
  v20 = v19;
  v22 = v21;
  v42.origin.x = v11;
  v42.origin.y = v13;
  v42.size.width = v15;
  v42.size.height = v17;
  MidX = CGRectGetMidX(v42);
  v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v40.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v40.c = v24;
  *(_OWORD *)&v40.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (a4)
  {
    MidY = MaxY + 10.0 + v22 * 0.5;
  }
  else
  {
    -[CAMFullscreenViewfinder _layout](self, "_layout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder shutterControl](self, "shutterControl");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frameForShutterControl:", v27);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    CGAffineTransformMakeScale(&v40, 0.5, 0.5);
    v43.origin.x = v29;
    v43.origin.y = v31;
    v43.size.width = v33;
    v43.size.height = v35;
    MidY = CGRectGetMidY(v43);
  }
  CAMOrientationTransform(a5, (uint64_t)&t2);
  v37 = v40;
  CGAffineTransformConcat(&v39, &v37, &t2);
  v40 = v39;
  CAMViewGeometryMake((uint64_t)&v39, (uint64_t)retstr, MidX, MidY, 0.0, 0.0, v20, v22);
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleIntensitySliderExpanded:(SEL)a3
{
  CGFloat Height;
  CGFloat v6;
  __int128 v7;
  CGAffineTransform v9;
  CGAffineTransform t1;
  CGAffineTransform v11;
  CGRect v12;
  CGPoint v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v13 = (CGPoint)0;
  v14 = 0u;
  memset(&v12, 0, sizeof(v12));
  -[CAMFullscreenViewfinder _geometryForSmartStyleSlider2DExpanded:orientation:](self, "_geometryForSmartStyleSlider2DExpanded:orientation:", a4, -[CAMFullscreenViewfinder _smartStyleIntensitySliderLayoutOrientationForOrientation:](self, "_smartStyleIntensitySliderLayoutOrientationForOrientation:", -[CAMFullscreenViewfinder orientation](self, "orientation")));
  memset(&v11, 0, sizeof(v11));
  Height = CGRectGetHeight(v12);
  CGAffineTransformMakeTranslation(&v11, 0.0, Height * 0.5 + 8.0 + 10.0);
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  v6 = v12.size.width + -21.0;
  retstr->var0.origin.x = 0.0;
  retstr->var0.origin.y = 0.0;
  retstr->var0.size.width = v6;
  retstr->var0.size.height = 20.0;
  v7 = v14;
  retstr->var1 = v13;
  t1 = v11;
  *(_OWORD *)&v9.a = v7;
  *(_OWORD *)&v9.c = v15;
  *(_OWORD *)&v9.tx = v16;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)CGAffineTransformConcat(&retstr->var2, &t1, &v9);
}

- (int64_t)_smartStyleIntensitySliderLayoutOrientationForOrientation:(int64_t)a3
{
  if (a3 == 2)
    return 1;
  else
    return a3;
}

- (BOOL)_shouldAnimateSmartStyleIntensitySliderChangeFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  int64_t v7;
  int64_t v8;
  BOOL v10;

  v7 = -[CAMFullscreenViewfinder _smartStyleIntensitySliderLayoutOrientationForOrientation:](self, "_smartStyleIntensitySliderLayoutOrientationForOrientation:");
  v8 = -[CAMFullscreenViewfinder _smartStyleIntensitySliderLayoutOrientationForOrientation:](self, "_smartStyleIntensitySliderLayoutOrientationForOrientation:", a4);
  v10 = v7 == a3 && v8 == a4;
  return (unint64_t)(v7 - 1) < 2 != (unint64_t)(v8 - 1) < 2 && v10;
}

- (BOOL)_shouldAnimateSmartStyleSlider2DChangeFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  return ((unint64_t)(a3 - 1) < 2) ^ ((unint64_t)(a4 - 1) < 2);
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleValuesPlatterView
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  id v18;
  CGRect v19;
  CGRect v20;

  -[CAMFullscreenViewfinder _layout](self, "_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameForControlStatusBar");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "smartStyleIndicator");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "intrinsicContentSize");
  v16 = v15 + 12.0 + 12.0;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  v20 = CGRectInset(v19, v16, 0.0);
  CAMViewGeometryForFrame((uint64_t)retstr, v20.size.width, v20.size.height);

  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleNameBadge:(SEL)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  id v10;

  v10 = a4;
  v5 = 30.0;
  if ((unint64_t)(-[CAMFullscreenViewfinder orientation](self, "orientation") - 3) <= 1)
  {
    v6 = CAMPixelWidthForView(self) + 10.0 + 10.0;
    -[CAMFullscreenViewfinder smartStylePicker](self, "smartStylePicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "spacerWidth");
    v5 = v6 + v8;

  }
  -[CAMFullscreenViewfinder _geometryForBottomCenteredView:margin:](self, "_geometryForBottomCenteredView:margin:", v10, v5);

  return result;
}

+ (id)lightControlBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.11);
}

+ (id)darkControlBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
}

- (void)setPortraitControlsAllowed:(BOOL)a3
{
  -[CAMFullscreenViewfinder setPortraitControlsAllowed:animated:](self, "setPortraitControlsAllowed:animated:", a3, 0);
}

- (void)setPortraitControlsAllowed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_portraitControlsAllowed != a3)
  {
    v4 = a4;
    -[CAMFullscreenViewfinder _loadPortraitControlsIfNeeded](self, "_loadPortraitControlsIfNeeded");
    if (v4)
      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    self->_portraitControlsAllowed = a3;
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v4);
  }
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
  -[CAMFullscreenViewfinder setShallowDepthOfFieldStatus:animated:](self, "setShallowDepthOfFieldStatus:animated:", a3, 0);
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;

  if (self->_shallowDepthOfFieldStatus != a3)
  {
    v4 = a4;
    if (a4)
      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    self->_shallowDepthOfFieldStatus = a3;
    -[CAMFullscreenViewfinder portraitInstructionLabel](self, "portraitInstructionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShallowDepthOfFieldStatus:", a3);

    -[CAMFullscreenViewfinder _updatePortraitControlsHighlightAnimated:](self, "_updatePortraitControlsHighlightAnimated:", v4);
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v4);
  }
}

- (void)setLightingNameBadgesHidden:(BOOL)a3
{
  -[CAMFullscreenViewfinder setLightingNameBadgesHidden:animated:](self, "setLightingNameBadgesHidden:animated:", a3, 0);
}

- (void)setLightingNameBadgesHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_lightingNameBadgesHidden != a3)
  {
    self->_lightingNameBadgesHidden = a3;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", a4);
  }
}

- (void)_loadPortraitControlsIfNeeded
{
  void *v3;
  void *v4;
  CEKLightingControl *v5;
  CEKLightingControl *lightingControl;
  void *v7;
  CEKLightingControl *v8;
  void *v9;
  CEKLightingNameBadge *v10;
  CEKLightingNameBadge *lightingNameBadge;
  void *v12;
  id v13;

  -[CAMFullscreenViewfinder lightingControl](self, "lightingControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CAMFullscreenViewfinder _contentView](self, "_contentView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder _contentViewBelowShutter](self, "_contentViewBelowShutter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (CEKLightingControl *)objc_alloc_init(MEMORY[0x1E0D0D070]);
    lightingControl = self->_lightingControl;
    self->_lightingControl = v5;

    -[CEKLightingControl setNameBadgeFontStyle:](self->_lightingControl, "setNameBadgeFontStyle:", -[CAMFullscreenViewfinder _badgeFontStyle](self, "_badgeFontStyle"));
    -[CEKLightingControl setMaxContentWidth:](self->_lightingControl, "setMaxContentWidth:", 1.79769313e308);
    -[CEKLightingControl setOrientation:](self->_lightingControl, "setOrientation:", -[CAMFullscreenViewfinder orientation](self, "orientation"));
    -[CEKLightingControl preloadEffectChangeAnimation](self->_lightingControl, "preloadEffectChangeAnimation");
    -[CEKLightingControl setNameBadgeHidden:](self->_lightingControl, "setNameBadgeHidden:", (unint64_t)(-[CAMFullscreenViewfinder orientation](self, "orientation") - 3) < 2);
    -[CAMFullscreenViewfinder zoomControl](self, "zoomControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = self->_lightingControl;
    if (v7)
    {
      -[CAMFullscreenViewfinder zoomControl](self, "zoomControl");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertSubview:belowSubview:", v8, v9);

    }
    else
    {
      objc_msgSend(v4, "addSubview:", v8);
    }
    v10 = (CEKLightingNameBadge *)objc_alloc_init(MEMORY[0x1E0D0D080]);
    lightingNameBadge = self->_lightingNameBadge;
    self->_lightingNameBadge = v10;

    -[CEKLightingNameBadge setUserInteractionEnabled:](self->_lightingNameBadge, "setUserInteractionEnabled:", 0);
    -[CEKLightingNameBadge setFontStyle:](self->_lightingNameBadge, "setFontStyle:", -[CAMFullscreenViewfinder _badgeFontStyle](self, "_badgeFontStyle"));
    -[CEKLightingNameBadge setDelegate:](self->_lightingNameBadge, "setDelegate:", self);
    objc_msgSend(v13, "addSubview:", self->_lightingNameBadge);
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", 0);
    -[CAMFullscreenViewfinder _updatePortraitControlsHighlightAnimated:](self, "_updatePortraitControlsHighlightAnimated:", 0);
    -[CAMFullscreenViewfinder _updateLightingControlClipping](self, "_updateLightingControlClipping");
    -[CAMFullscreenViewfinder delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fullscreenViewfinderDidCreatePortraitControls:", self);

  }
}

- (void)_updatePortraitControlsHighlightAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = -[CAMFullscreenViewfinder shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus");
  v6 = (v5 < 0xF) & (0x6202u >> v5);
  -[CAMFullscreenViewfinder lightingControl](self, "lightingControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlighted:animated:", v6, v3);

  -[CAMFullscreenViewfinder lightingNameBadge](self, "lightingNameBadge");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHighlighted:", v6);

}

- (void)_loadFilterControlsIfNeeded
{
  CAMFilterNameBadge *v3;
  CAMFilterNameBadge *filterNameBadge;
  id v5;

  if (!self->_filterNameBadge)
  {
    v3 = objc_alloc_init(CAMFilterNameBadge);
    filterNameBadge = self->_filterNameBadge;
    self->_filterNameBadge = v3;

    -[CEKBadgeView setDelegate:](self->_filterNameBadge, "setDelegate:", self);
    -[CEKBadgeTextView setFontStyle:](self->_filterNameBadge, "setFontStyle:", -[CAMFullscreenViewfinder _badgeFontStyle](self, "_badgeFontStyle"));
    -[CAMFullscreenViewfinder _contentView](self, "_contentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_filterNameBadge);

  }
}

- (void)setWantsSmartStyleIntensitySlider:(BOOL)a3
{
  -[CAMFullscreenViewfinder setWantsSmartStyleIntensitySlider:animated:](self, "setWantsSmartStyleIntensitySlider:animated:", a3, 0);
}

- (void)setWantsSmartStyleIntensitySlider:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];

  if (self->_wantsSmartStyleIntensitySlider != a3)
  {
    self->_wantsSmartStyleIntensitySlider = a3;
    v4 = 0.0;
    if (a4)
      v4 = 0.25;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__CAMFullscreenViewfinder_setWantsSmartStyleIntensitySlider_animated___block_invoke;
    v5[3] = &unk_1EA328868;
    v5[4] = self;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v5, v4);
  }
}

void __70__CAMFullscreenViewfinder_setWantsSmartStyleIntensitySlider_animated___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowSmartStyleIntensitySlider"))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "smartStyleIntensitySlider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)setWantsSmartStyleResetButton:(BOOL)a3
{
  -[CAMFullscreenViewfinder setWantsSmartStyleResetButton:animated:](self, "setWantsSmartStyleResetButton:animated:", a3, 0);
}

- (void)setWantsSmartStyleResetButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  if (self->_wantsSmartStyleResetButton != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_wantsSmartStyleResetButton = a3;
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "smartStyleButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setResetButtonVisibleWhenExpanded:animated:", v5, v4);

  }
}

- (void)setWantsSmartStylePicker:(BOOL)a3
{
  -[CAMFullscreenViewfinder setWantsSmartStylePicker:animated:](self, "setWantsSmartStylePicker:animated:", a3, 0);
}

- (void)setWantsSmartStylePicker:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsSmartStylePicker != a3)
  {
    self->_wantsSmartStylePicker = a3;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", a4);
  }
}

- (BOOL)isSmartStylePickerVisible
{
  _BOOL4 v3;

  v3 = -[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible");
  if (v3)
    LOBYTE(v3) = -[CAMFullscreenViewfinder wantsSmartStylePicker](self, "wantsSmartStylePicker");
  return v3;
}

- (BOOL)_shouldShowSmartStyleIntensitySlider
{
  return -[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible")
      && -[CAMFullscreenViewfinder wantsSmartStyleIntensitySlider](self, "wantsSmartStyleIntensitySlider")
      && -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (BOOL)_shouldShowSmartStyleValuesPlatter
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible"))
    return 0;
  -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryAccessoryControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 0;
  else
    v5 = -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");

  return v5;
}

- (void)setSmartStyleControlsVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setSmartStyleControlsVisible:animated:](self, "setSmartStyleControlsVisible:animated:", a3, 0);
}

- (void)setSmartStyleControlsVisible:(BOOL)a3 animated:(BOOL)a4
{
  -[CAMFullscreenViewfinder _setSmartStyleControlsVisible:animated:notifyDelegate:](self, "_setSmartStyleControlsVisible:animated:notifyDelegate:", a3, a4, 0);
}

- (void)_setSmartStyleControlsVisible:(BOOL)a3 animated:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *smartStylesDismissalTapGestureRecognizer;
  id v11;

  if (self->_smartStyleControlsVisible != a3)
  {
    v5 = a5;
    v6 = a4;
    v7 = a3;
    if (a3)
      -[CAMFullscreenViewfinder _loadSmartStyleControlsIfNeeded](self, "_loadSmartStyleControlsIfNeeded");
    if (v6)
      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    self->_smartStyleControlsVisible = v7;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v6);
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v6);
    if (v7 && !self->__smartStylesDismissalTapGestureRecognizer)
    {
      v9 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleSmartStylesDismissalTapGestureRecognizer_);
      smartStylesDismissalTapGestureRecognizer = self->__smartStylesDismissalTapGestureRecognizer;
      self->__smartStylesDismissalTapGestureRecognizer = v9;

      -[UITapGestureRecognizer setDelegate:](self->__smartStylesDismissalTapGestureRecognizer, "setDelegate:", self);
      -[CAMFullscreenViewfinder addGestureRecognizer:](self, "addGestureRecognizer:", self->__smartStylesDismissalTapGestureRecognizer);
    }
    -[UITapGestureRecognizer setEnabled:](self->__smartStylesDismissalTapGestureRecognizer, "setEnabled:", v7);
    if (v5)
    {
      -[CAMFullscreenViewfinder delegate](self, "delegate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fullscreenViewfinder:didChangeSmartStyleControlsVisibility:animated:", self, v7, v6);

    }
  }
}

- (void)_loadSmartStyleControlsIfNeeded
{
  double v3;
  double v4;
  PEPhotoStyleDPad *v5;
  PEPhotoStyleDPad *smartStyleSlider2D;
  void *v7;
  PEPhotoStyleDPad *v8;
  void *v9;
  id v10;
  CEKColoredPaletteSlider *v11;
  CEKColoredPaletteSlider *smartStyleIntensitySlider;
  void *v13;
  PEPhotoStyleValuesPlatterView *v14;
  PEPhotoStyleValuesPlatterView *smartStyleValuesPlatterView;
  void *v16;
  CAMSmartStyleNameBadge *v17;
  CAMSmartStyleNameBadge *smartStyleNameBadge;
  void *v19;
  CAMSemanticStylePicker *v20;
  CAMSemanticStylePicker *smartStylePicker;
  void *v22;
  CAMSemanticStylePicker *v23;
  void *v24;
  void *v25;
  void *v26;
  CAMSemanticStylePicker *v27;

  if (!self->_smartStyleSlider2D)
  {
    -[CAMFullscreenViewfinder _smartStyleSlider2DSize](self, "_smartStyleSlider2DSize");
    v5 = (PEPhotoStyleDPad *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CB00]), "initWithSize:", v3, v4);
    smartStyleSlider2D = self->_smartStyleSlider2D;
    self->_smartStyleSlider2D = v5;

    -[CAMFullscreenViewfinder delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_smartStyleSlider2D;
    -[CAMFullscreenViewfinder _contentView](self, "_contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addChildViewController:toView:", v8, v9);

    v10 = objc_alloc(MEMORY[0x1E0D0D038]);
    v11 = (CEKColoredPaletteSlider *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    smartStyleIntensitySlider = self->_smartStyleIntensitySlider;
    self->_smartStyleIntensitySlider = v11;

    -[CAMFullscreenViewfinder _contentView](self, "_contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_smartStyleIntensitySlider);

    v14 = (PEPhotoStyleValuesPlatterView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CB10]), "initWithTone:color:palette:", 0.0, 0.0, 1.0);
    smartStyleValuesPlatterView = self->_smartStyleValuesPlatterView;
    self->_smartStyleValuesPlatterView = v14;

    -[CAMFullscreenViewfinder _contentView](self, "_contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", self->_smartStyleValuesPlatterView);

    v17 = objc_alloc_init(CAMSmartStyleNameBadge);
    smartStyleNameBadge = self->_smartStyleNameBadge;
    self->_smartStyleNameBadge = v17;

    -[CAMSmartStyleNameBadge setUserInteractionEnabled:](self->_smartStyleNameBadge, "setUserInteractionEnabled:", 0);
    -[CEKBadgeView setDelegate:](self->_smartStyleNameBadge, "setDelegate:", self);
    -[CEKBadgeTextView setFontStyle:](self->_smartStyleNameBadge, "setFontStyle:", -[CAMFullscreenViewfinder _badgeFontStyle](self, "_badgeFontStyle"));
    -[CAMFullscreenViewfinder _contentView](self, "_contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", self->_smartStyleNameBadge);

    v20 = objc_alloc_init(CAMSemanticStylePicker);
    smartStylePicker = self->_smartStylePicker;
    self->_smartStylePicker = v20;

    -[CAMSemanticStylePicker setScrollEnabled:](self->_smartStylePicker, "setScrollEnabled:", 0);
    -[CAMSemanticStylePicker setScrollViewUserInteractionEnabled:](self->_smartStylePicker, "setScrollViewUserInteractionEnabled:", 0);
    -[CAMSemanticStylePicker setDelegate:](self->_smartStylePicker, "setDelegate:", self);
    -[CAMSemanticStylePicker setExpanded:](self->_smartStylePicker, "setExpanded:", 0);
    -[CAMSemanticStylePicker setMaterial:](self->_smartStylePicker, "setMaterial:", -[CAMFullscreenViewfinder material](self, "material"));
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStylePicker setMaterialColor:](self->_smartStylePicker, "setMaterialColor:", v22);

    -[CAMSemanticStylePicker setPageControlMaxNumberOfDots:](self->_smartStylePicker, "setPageControlMaxNumberOfDots:", 5);
    v23 = self->_smartStylePicker;
    -[CAMFullscreenViewfinder _reticleView](self, "_reticleView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v23, v24);

    -[PEPhotoStyleDPad view](self->_smartStyleSlider2D, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", 0.0);

    -[CEKColoredPaletteSlider setAlpha:](self->_smartStyleIntensitySlider, "setAlpha:", 0.0);
    -[PEPhotoStyleValuesPlatterView setAlpha:](self->_smartStyleValuesPlatterView, "setAlpha:", 0.0);
    -[CAMSmartStyleNameBadge setAlpha:](self->_smartStyleNameBadge, "setAlpha:", 0.0);
    -[CAMFullscreenViewfinder delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fullscreenViewfinderDidCreateSmartStyleControls:", self);

    v27 = self->_smartStylePicker;
    -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
    -[CAMFullscreenViewfinder _updateSemanticStylePicker:forViewportFrame:](self, "_updateSemanticStylePicker:forViewportFrame:", v27);
    -[CAMFullscreenViewfinder setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_handleSmartStylesDismissalTapGestureRecognizer:(id)a3
{
  id v3;

  -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExpanded:forControlType:animated:updatePreferredDrawerControl:", 0, 11, 1, 1);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double MaxY;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  BOOL v26;
  CGRect v27;
  CGRect v28;

  v6 = a4;
  v7 = a3;
  -[CAMFullscreenViewfinder _smartStylesDismissalTapGestureRecognizer](self, "_smartStylesDismissalTapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[CAMFullscreenViewfinder smartStyleSlider2D](self, "smartStyleSlider2D");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CAMFullscreenViewfinder _isTouch:withinView:padding:](self, "_isTouch:withinView:padding:", v6, v11, 30.0))
    {
      -[CAMFullscreenViewfinder smartStyleIntensitySlider](self, "smartStyleIntensitySlider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[CAMFullscreenViewfinder _isTouch:withinView:padding:](self, "_isTouch:withinView:padding:", v6, v12, 30.0))
      {
        -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "smartStyleButton");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resetButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[CAMFullscreenViewfinder _isTouch:withinView:padding:](self, "_isTouch:withinView:padding:", v6, v15, 0.0))
        {
          -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "smartStyleButton");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "shutterButton");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[CAMFullscreenViewfinder _isTouch:withinView:padding:](self, "_isTouch:withinView:padding:", v6, v18, 0.0);

          if (!v26)
          {
            objc_msgSend(v6, "locationInView:", self);
            v20 = v19;
            -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
            MaxY = CGRectGetMaxY(v27);
            -[CAMFullscreenViewfinder smartStyleSlider2D](self, "smartStyleSlider2D");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "view");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "frame");
            v24 = CGRectGetMinY(v28) + 10.0;

            v9 = v20 > fmin(MaxY, v24);
            goto LABEL_10;
          }
          goto LABEL_9;
        }

      }
    }

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)_isTouch:(id)a3 withinView:(id)a4 padding:(double)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  BOOL v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGPoint v17;
  CGRect v18;
  CGRect v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "alpha"), v10 != 0.0))
  {
    objc_msgSend(v7, "locationInView:", v9);
    v13 = v12;
    v15 = v14;
    objc_msgSend(v9, "bounds");
    v19 = CGRectInset(v18, -a5, -a5);
    v17.x = v13;
    v17.y = v15;
    v11 = CGRectContainsPoint(v19, v17);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  int64_t v8;

  v5 = a3;
  -[CAMFullscreenViewfinder _smartStylesDismissalTapGestureRecognizer](self, "_smartStylesDismissalTapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    return 0;
  v8 = -[CAMFullscreenViewfinder viewportAspectRatio](self, "viewportAspectRatio");
  return v8 == 4 || v8 == 1;
}

- (void)_loadSemanticStyleControlsIfNeeded
{
  CAMSemanticStylePicker *v3;
  CAMSemanticStylePicker *semanticStylePicker;
  void *v5;
  void *v6;
  CAMSemanticStylePicker *v7;
  void *v8;
  CAMSemanticStylePicker *v9;
  void *v10;
  id v11;

  if (!self->_semanticStylePicker)
  {
    -[CAMFullscreenViewfinder reloadSemanticStyleBadgesDelayIfNeeded:](self, "reloadSemanticStyleBadgesDelayIfNeeded:", 0);
    v3 = objc_alloc_init(CAMSemanticStylePicker);
    semanticStylePicker = self->_semanticStylePicker;
    self->_semanticStylePicker = v3;

    -[CAMSemanticStylePicker setDelegate:](self->_semanticStylePicker, "setDelegate:", self);
    -[CAMFullscreenViewfinder delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullscreenViewfinderSemanticStyleList:", self);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[CAMSemanticStylePicker setNumberOfStyles:](self->_semanticStylePicker, "setNumberOfStyles:", objc_msgSend(v11, "count"));
    -[CAMSemanticStylePicker setExpanded:](self->_semanticStylePicker, "setExpanded:", 0);
    -[CAMSemanticStylePicker setMaterial:](self->_semanticStylePicker, "setMaterial:", -[CAMFullscreenViewfinder material](self, "material"));
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStylePicker setMaterialColor:](self->_semanticStylePicker, "setMaterialColor:", v6);

    v7 = self->_semanticStylePicker;
    -[CAMFullscreenViewfinder _reticleView](self, "_reticleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v7, v8);

    v9 = self->_semanticStylePicker;
    -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
    -[CAMFullscreenViewfinder _updateSemanticStylePicker:forViewportFrame:](self, "_updateSemanticStylePicker:forViewportFrame:", v9);
    -[CAMFullscreenViewfinder delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fullscreenViewfinderDidCreateSemanticStyleControls:", self);

  }
}

- (void)reloadSemanticStyleBadgesDelayIfNeeded:(BOOL)a3
{
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *semanticStyleBadges;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  CAMSemanticStyleMaskedBadge *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  _QWORD v27[5];
  BOOL v28;

  -[CAMFullscreenViewfinder delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullscreenViewfinderSemanticStyleList:", self);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->__semanticStyleBadges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    semanticStyleBadges = self->__semanticStyleBadges;
    self->__semanticStyleBadges = v6;

  }
  while (1)
  {
    -[CAMFullscreenViewfinder _semanticStyleBadges](self, "_semanticStyleBadges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = objc_msgSend(v26, "count");

    if (v12 <= v13)
      break;
    -[CAMFullscreenViewfinder _semanticStyleBadges](self, "_semanticStyleBadges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeFromSuperview");
    -[CAMFullscreenViewfinder _semanticStyleBadges](self, "_semanticStyleBadges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeLastObject");

  }
  -[CAMFullscreenViewfinder _semanticStyleBadges](self, "_semanticStyleBadges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  v16 = objc_msgSend(v26, "count");

  if (v15 < v16)
  {
    do
    {
      v17 = objc_alloc_init(CAMSemanticStyleMaskedBadge);
      -[CAMSemanticStyleMaskedBadge badgeView](v17, "badgeView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDelegate:", self);

      v19 = -[CAMFullscreenViewfinder _badgeFontStyle](self, "_badgeFontStyle");
      -[CAMSemanticStyleMaskedBadge badgeView](v17, "badgeView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFontStyle:", v19);

      -[CAMFullscreenViewfinder _semanticStyleBadges](self, "_semanticStyleBadges");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v17);

      -[CAMFullscreenViewfinder _contentView](self, "_contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v17);

      -[CAMFullscreenViewfinder _semanticStyleBadges](self, "_semanticStyleBadges");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");
      v25 = objc_msgSend(v26, "count");

    }
    while (v24 < v25);
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__CAMFullscreenViewfinder_reloadSemanticStyleBadgesDelayIfNeeded___block_invoke;
  v27[3] = &unk_1EA3288B8;
  v27[4] = self;
  v28 = a3;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v27);

}

void __66__CAMFullscreenViewfinder_reloadSemanticStyleBadgesDelayIfNeeded___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_semanticStyleBadges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSemanticStyle:delayIfNeeded:", v6, *(unsigned __int8 *)(a1 + 40));
}

- (void)semanticStylePickerDidChangeSelectedStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v8)
  {
    -[CAMFullscreenViewfinder delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullscreenViewfinderDidChangeSemanticStyle:", self);
    goto LABEL_5;
  }
  -[CAMFullscreenViewfinder smartStylePicker](self, "smartStylePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5 == v8)
  {
    -[CAMFullscreenViewfinder delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullscreenViewfinderDidChangeSelectedSmartStyle:", self);
LABEL_5:

    v6 = v8;
  }

}

- (void)semanticStylePickerDidScroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CAMFullscreenViewfinder _layoutSemanticStyleMaskedBadges](self, "_layoutSemanticStyleMaskedBadges");
    -[CAMFullscreenViewfinder requestPreviewUpdateForSemanticStyleAnimated:](self, "requestPreviewUpdateForSemanticStyleAnimated:", 0);
  }
}

- (void)_layoutSemanticStyleMaskedBadges
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[6];

  v3 = -[CAMFullscreenViewfinder orientation](self, "orientation");
  if (v3 >= 3)
  {
    if (v3 - 3 >= 2)
    {
      v7 = 0.0;
      goto LABEL_6;
    }
    -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spacerWidth");
    v7 = 10.0 + 15.0 + v8;
  }
  else
  {
    -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pageControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6 + 4.0;

  }
LABEL_6:
  -[CAMFullscreenViewfinder _semanticStyleBadges](self, "_semanticStyleBadges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CAMFullscreenViewfinder__layoutSemanticStyleMaskedBadges__block_invoke;
  v10[3] = &unk_1EA3288E0;
  v10[4] = self;
  *(double *)&v10[5] = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __59__CAMFullscreenViewfinder__layoutSemanticStyleMaskedBadges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
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
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double x;
  double v27;
  double y;
  double width;
  double height;
  _OWORD v31[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v5 = a2;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "_geometryForBottomCenteredView:margin:", v5, *(double *)(a1 + 40));
    v6 = *(void **)(a1 + 32);
  }
  objc_msgSend(v6, "semanticStylePicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentatationStyleRectAtIndex:", a3);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v5, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "semanticStylePicker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertRect:fromView:", v17, v9, v11, v13, v15);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v31[2] = v34;
  v31[3] = v35;
  v31[4] = v36;
  v31[5] = v37;
  v31[0] = v32;
  v31[1] = v33;
  CAMFrameForGeometry((uint64_t)v31);
  x = v38.origin.x;
  v40.origin.x = v19;
  v40.origin.y = v21;
  v40.size.width = v23;
  v40.size.height = v25;
  v39 = CGRectIntersection(v38, v40);
  v27 = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  if (CGRectIsNull(v39))
  {
    v27 = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  objc_msgSend(v5, "setFrame:", v27, y, width, height);
  objc_msgSend(v5, "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));
  objc_msgSend(v5, "setBadgeLeftInset:", x - v27);

}

- (void)setViewportAspectRatio:(int64_t)a3
{
  -[CAMFullscreenViewfinder setViewportAspectRatio:animated:](self, "setViewportAspectRatio:animated:", a3, 0);
}

- (void)setViewportAspectRatio:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_viewportAspectRatio != a3)
  {
    v4 = a4;
    if (a4)
      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    self->_viewportAspectRatio = a3;
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v4);
    -[CAMFullscreenViewfinder _updateLightingControlClipping](self, "_updateLightingControlClipping");
  }
}

- (void)_handleDirectionIndicatorTapped
{
  _BOOL4 v3;

  v3 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  if (v3 || -[CAMFullscreenViewfinder isControlDrawerAllowed](self, "isControlDrawerAllowed"))
    -[CAMFullscreenViewfinder setControlDrawerExpanded:forReason:animated:](self, "setControlDrawerExpanded:forReason:animated:", !v3, 0, 1);
}

- (void)setControlDrawerExpanded:(BOOL)a3 forReason:(int64_t)a4
{
  -[CAMFullscreenViewfinder setControlDrawerExpanded:forReason:animated:](self, "setControlDrawerExpanded:forReason:animated:", a3, a4, 0);
}

- (void)setControlDrawerExpanded:(BOOL)a3 forReason:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  void *v9;
  CAMControlDrawer *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  id v38;

  if (self->_controlDrawerExpanded != a3)
  {
    v5 = a5;
    v7 = a3;
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 && v7)
    {
      v10 = -[CAMControlDrawer initWithLayoutStyle:]([CAMControlDrawer alloc], "initWithLayoutStyle:", 4);
      -[CAMFullscreenViewfinder _setControlDrawer:](self, "_setControlDrawer:", v10);

      v11 = -[CAMFullscreenViewfinder orientation](self, "orientation");
      -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOrientation:", v11);

      -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPresentationDelegate:", self);

      -[CAMFullscreenViewfinder _contentView](self, "_contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v15);

      -[CAMFullscreenViewfinder delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fullscreenViewfinderDidCreateControlDrawer:", self);

    }
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v17;
    if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 0 || !v7)
    {
      v18 = -1;
    }
    else
    {
      v18 = -1;
      if (objc_msgSend(v17, "expandedControlType") == -1)
      {
        -[CAMFullscreenViewfinder delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "expandedControlTypeForExpandingDrawerInFullscreenViewfinder:", self);

        objc_msgSend(v38, "visibleControlTypes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "containsObject:", v22);

        if (v23)
          v18 = v20;
        else
          v18 = -1;
      }
    }
    if (v5)
      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    self->_controlDrawerExpanded = v7;
    -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "directionIndicator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDirection:animated:", v7, v5);

    -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "directionIndicator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSelected:animated:", v7, v5);

    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v5);
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v5);
    if (!v7)
    {
      -[CAMFullscreenViewfinder _setControlDrawerPresentedModally:](self, "_setControlDrawerPresentedModally:", 0);
      goto LABEL_22;
    }
    objc_msgSend(v38, "visibleControlTypes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29 == 1)
    {
      objc_msgSend(v38, "visibleControlTypes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "integerValue");

      v33 = v38;
      v34 = v32;
      v35 = 0;
    }
    else
    {
      v36 = v38;
      if (v18 == -1)
        goto LABEL_21;
      v33 = v38;
      v34 = v18;
      v35 = v5;
    }
    objc_msgSend(v33, "expandControlForType:animated:updatePreferredDrawerControl:", v34, v35, 0);
    v36 = v38;
LABEL_21:
    if (objc_msgSend(v36, "expandedControlType") != 11)
    {
LABEL_23:
      -[CAMFullscreenViewfinder delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "fullscreenViewfinder:didChangeControlDrawerVisibility:animated:forReason:", self, v7, v5, a4);

      return;
    }
LABEL_22:
    -[CAMFullscreenViewfinder _setSmartStyleControlsVisible:animated:notifyDelegate:](self, "_setSmartStyleControlsVisible:animated:notifyDelegate:", v7, v5, 1);
    goto LABEL_23;
  }
}

- (void)presentControlDrawerModally:(BOOL)a3 forReason:(int64_t)a4 controlType:(int64_t)a5
{
  _BOOL4 v7;
  _BOOL8 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a3;
  v9 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  v10 = -[CAMFullscreenViewfinder _isControlDrawerPresentedModally](self, "_isControlDrawerPresentedModally");
  if (v7 && (v10 || !v9))
  {
    -[CAMFullscreenViewfinder delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fullscreenViewFinder:willPresentControlDrawerModallyForControlType:reason:", self, a5, a4);

    -[CAMFullscreenViewfinder setControlDrawerExpanded:forReason:animated:](self, "setControlDrawerExpanded:forReason:animated:", 1, a4, 1);
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "expandControlForType:animated:updatePreferredDrawerControl:", a5, v9, a4 == 1);

    -[CAMFullscreenViewfinder _setControlDrawerPresentedModally:](self, "_setControlDrawerPresentedModally:", 1);
  }
  else
  {
    -[CAMFullscreenViewfinder setControlDrawerExpanded:forReason:animated:](self, "setControlDrawerExpanded:forReason:animated:", 1, a4, 1);
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "expandControlForType:animated:updatePreferredDrawerControl:", a5, v9, a4 == 1);

  }
}

- (BOOL)isControlDrawerPresentedModallyWithControlType:(int64_t)a3
{
  void *v5;
  char v6;

  if (!-[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded")
    || !-[CAMFullscreenViewfinder _isControlDrawerPresentedModally](self, "_isControlDrawerPresentedModally"))
  {
    return 0;
  }
  -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isControlExpandedForType:", a3);

  return v6;
}

- (void)dismissModalControlDrawerIfNeededForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (-[CAMFullscreenViewfinder _isControlDrawerPresentedModally](self, "_isControlDrawerPresentedModally"))
  {
    -[CAMFullscreenViewfinder _setControlDrawerPresentedModally:](self, "_setControlDrawerPresentedModally:", 0);
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expandedControl");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CAMFullscreenViewfinder delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fullscreenViewFinder:willDismissControlDrawerModallyForControlType:reason:", self, objc_msgSend(v7, "controlType"), a3);

    }
    -[CAMFullscreenViewfinder setControlDrawerExpanded:forReason:animated:](self, "setControlDrawerExpanded:forReason:animated:", 0, a3, 1);

  }
}

- (void)controlDrawer:(id)a3 didChangeExpanded:(BOOL)a4 forControlType:(int64_t)a5 animated:(BOOL)a6 updatePreferredDrawerControl:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v10;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v15 = a3;
  if (!v10)
    -[CAMFullscreenViewfinder _setControlDrawerPresentedModally:](self, "_setControlDrawerPresentedModally:", 0);
  switch(a5)
  {
    case 4:
      -[CAMFullscreenViewfinder _loadFilterControlsIfNeeded](self, "_loadFilterControlsIfNeeded");
      goto LABEL_8;
    case 11:
      -[CAMFullscreenViewfinder _loadSmartStyleControlsIfNeeded](self, "_loadSmartStyleControlsIfNeeded");
      -[CAMFullscreenViewfinder _setSmartStyleControlsVisible:animated:notifyDelegate:](self, "_setSmartStyleControlsVisible:animated:notifyDelegate:", v10, v10 | v8, 1);
      break;
    case 10:
      -[CAMFullscreenViewfinder _loadSemanticStyleControlsIfNeeded](self, "_loadSemanticStyleControlsIfNeeded");
      -[CAMFullscreenViewfinder requestPreviewUpdateForSemanticStyleAnimated:](self, "requestPreviewUpdateForSemanticStyleAnimated:", 0);
LABEL_8:
      -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", 1);
      break;
  }
  -[CAMFullscreenViewfinder delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fullscreenViewfinder:didChangeExpanded:forDrawerControlOfType:animated:updatePreferredDrawerControl:", self, v10, a5, v8, v7);

  if (!v10)
  {
    objc_msgSend(v15, "visibleControlTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 == 1)
      -[CAMFullscreenViewfinder setControlDrawerExpanded:forReason:animated:](self, "setControlDrawerExpanded:forReason:animated:", 0, 8, 1);
  }

}

- (BOOL)isFilterScrubberVisible
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  if (v3)
  {
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFilterScrubberExpanded");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isApertureSliderVisible
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  if (v3)
  {
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isApertureSliderExpanded");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isIntensitySliderVisible
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  if (v3)
  {
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isIntensitySliderExpanded");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isLowLightSliderVisible
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  if (v3)
  {
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLowLightSliderExpanded");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isExposureSliderVisible
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  if (v3)
  {
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isExposureSliderExpanded");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isSemanticStyleControlVisible
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  if (v3)
  {
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSemanticStyleControlExpanded");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_wantsSpotlightSmartStyleStatusIndicatorForControl:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  char v9;

  -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryDesiredIndicatorTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", &unk_1EA3AFF08);

  v8 = -[CAMFullscreenViewfinder isOverlayStyleControlActive](self, "isOverlayStyleControlActive");
  if (a3 == 1)
    v9 = v7;
  else
    v9 = 0;
  return v9 & v8;
}

- (BOOL)_wantsSpotlightControlPanelForControl:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)setSpotlightControl:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  CAMSpotlightControlPanel *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  CAMFocusLockBadge *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  if (self->_spotlightControl != a3)
  {
    v4 = a4;
    -[CAMFullscreenViewfinder spotlightControlPanel](self, "spotlightControlPanel");
    v7 = (CAMSpotlightControlPanel *)objc_claimAutoreleasedReturnValue();
    v8 = -[CAMFullscreenViewfinder _wantsSpotlightControlPanelForControl:](self, "_wantsSpotlightControlPanelForControl:", a3);
    v9 = v8;
    if (!v7 && v8)
    {
      v7 = objc_alloc_init(CAMSpotlightControlPanel);
      -[CAMSpotlightControlPanel setOrientation:](v7, "setOrientation:", -[CAMFullscreenViewfinder orientation](self, "orientation"));
      -[CAMFullscreenViewfinder _contentView](self, "_contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v7);

      -[CAMFullscreenViewfinder _setSpotlightControlPanel:](self, "_setSpotlightControlPanel:", v7);
      -[CAMFullscreenViewfinder delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fullscreenViewfinderDidCreateSpotlightControlPanel:", self);

    }
    if (v9)
    {
      v12 = -[CAMFullscreenViewfinder _wantsSpotlightControlPanelForControl:](self, "_wantsSpotlightControlPanelForControl:", self->_spotlightControl);
      -[CAMFullscreenViewfinder spotlightControlPanel](self, "spotlightControlPanel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSpotlightControl:animated:", a3, v12);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder _badgesForSpotlightControls](self, "_badgesForSpotlightControls");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v14);
    v16 = (CAMFocusLockBadge *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (v4)
      {
LABEL_9:
        -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
        self->_spotlightControl = a3;
        -[CAMFullscreenViewfinder setNeedsLayout](self, "setNeedsLayout");
        -[CAMFullscreenViewfinder _updateQuietUIAnimated:](self, "_updateQuietUIAnimated:", 1);
        -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", 1);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __56__CAMFullscreenViewfinder_setSpotlightControl_animated___block_invoke;
        v19[3] = &unk_1EA328868;
        v19[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v19, 0, 0.7, 0.0, 0.7, 1.0);
LABEL_17:

        return;
      }
    }
    else
    {
      if (a3 == 2)
      {
        v16 = objc_alloc_init(CAMFocusLockBadge);
        -[CAMFocusLockBadge setFocusLockType:](v16, "setFocusLockType:", 2);
      }
      else if (a3 == 3)
      {
        v16 = objc_alloc_init(CAMShallowDepthOfFieldBadge);
        -[CAMFocusLockBadge setShallowDepthOfFieldStatus:](v16, "setShallowDepthOfFieldStatus:", 1);
      }
      else
      {
        v16 = 0;
      }
      -[CAMFullscreenViewfinder _contentView](self, "_contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", v16);

      -[CAMFullscreenViewfinder _badgesForSpotlightControls](self, "_badgesForSpotlightControls");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, v14);

      if (v4)
        goto LABEL_9;
    }
    self->_spotlightControl = a3;
    -[CAMFullscreenViewfinder setNeedsLayout](self, "setNeedsLayout");
    -[CAMFullscreenViewfinder _updateQuietUIAnimated:](self, "_updateQuietUIAnimated:", 0);
    goto LABEL_17;
  }
}

uint64_t __56__CAMFullscreenViewfinder_setSpotlightControl_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateQuietUIAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  double v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[5];
  BOOL v18;
  _QWORD aBlock[5];
  BOOL v20;

  v3 = a3;
  v5 = -[CAMFullscreenViewfinder spotlightControl](self, "spotlightControl");
  if (v5 == 1)
  {
    -[CAMFullscreenViewfinder _contentView](self, "_contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder _ensureBlurFilterForContentView:](self, "_ensureBlurFilterForContentView:", v6);

    -[CAMFullscreenViewfinder _contentViewBelowShutter](self, "_contentViewBelowShutter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder _ensureBlurFilterForContentView:](self, "_ensureBlurFilterForContentView:", v7);

  }
  -[CAMFullscreenViewfinder _showSpotlightSmartStyleStatusIndicatorIfNeededAnimated:](self, "_showSpotlightSmartStyleStatusIndicatorIfNeededAnimated:", 0);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke;
  aBlock[3] = &unk_1EA328908;
  aBlock[4] = self;
  v20 = v5 == 1;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke_2;
  v17[3] = &unk_1EA328908;
  v18 = v5 == 1;
  v17[4] = self;
  v10 = (void (**)(_QWORD))_Block_copy(v17);
  if (v3)
  {
    if (v5 == 1)
    {
      v11 = 0.8;
      v12 = 1.0;
    }
    else
    {
      v12 = 0.4;
      v11 = 1.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3F40], "behaviorWithDampingRatio:response:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke_3;
    v15[3] = &unk_1EA328930;
    v16 = v10;
    objc_msgSend(v14, "_animateUsingSpringBehavior:tracking:animations:completion:", v13, 0, v9, v15);

  }
  else
  {
    v9[2](v9);
    v10[2](v10);
  }

}

uint64_t __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateContentView:forQuietUIActive:", v3, *(unsigned __int8 *)(a1 + 40));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "_contentViewBelowShutter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateContentView:forQuietUIActive:", v5, *(unsigned __int8 *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_updateSubviewsVisibilityAnimated:", 0);
}

uint64_t __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated:", 0);
  return result;
}

uint64_t __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_ensureBlurFilterForContentView:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("filters.gaussianBlur"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
      v9[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFilters:", v8);

    }
  }

}

- (void)_updateContentView:(id)a3 forQuietUIActive:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    if (v4)
      v8 = 1.03;
    else
      v8 = 1.0;
    if (v4)
      v9 = 10.0;
    else
      v9 = 0.0;
    v10 = (double)!v4;
    objc_msgSend(v5, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKeyPath:", v12, CFSTR("filters.gaussianBlur.inputRadius"));

    CGAffineTransformMakeScale(&v14, v8, v8);
    v13 = v14;
    objc_msgSend(v5, "setTransform:", &v13);
    objc_msgSend(v5, "setAlpha:", v10);
  }

}

- (void)_showSpotlightSmartStyleStatusIndicatorIfNeededAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  CAMSmartStyleStatusIndicator *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  _QWORD v12[5];

  v3 = a3;
  if (-[CAMFullscreenViewfinder _wantsSpotlightSmartStyleStatusIndicatorForControl:](self, "_wantsSpotlightSmartStyleStatusIndicatorForControl:", -[CAMFullscreenViewfinder spotlightControl](self, "spotlightControl")))
  {
    -[CAMFullscreenViewfinder spotlightSmartStyleStatusIndicator](self, "spotlightSmartStyleStatusIndicator");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (CAMSmartStyleStatusIndicator *)v5;
    if (!v5)
    {
      v6 = objc_alloc_init(CAMSmartStyleStatusIndicator);
      -[CAMControlStatusIndicator setOrientation:animated:](v6, "setOrientation:animated:", -[CAMFullscreenViewfinder orientation](self, "orientation"), 0);
      objc_storeStrong((id *)&self->_spotlightSmartStyleStatusIndicator, v6);
      -[CAMFullscreenViewfinder _modulatingContentView](self, "_modulatingContentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v6);

      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    }
    -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "smartStyleIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    v10 = 0.0;
    if (v3)
      v10 = 0.25;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__CAMFullscreenViewfinder__showSpotlightSmartStyleStatusIndicatorIfNeededAnimated___block_invoke;
    v12[3] = &unk_1EA328868;
    v12[4] = self;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v12, v10);
    if (!v5)
    {
      -[CAMFullscreenViewfinder delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fullscreenViewfinderDidCreateSpotlightSmartStyleStatusIndicator:", self);

    }
  }
}

void __83__CAMFullscreenViewfinder__showSpotlightSmartStyleStatusIndicatorIfNeededAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "spotlightSmartStyleStatusIndicator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  _QWORD v8[5];

  v3 = a3;
  if (!-[CAMFullscreenViewfinder _wantsSpotlightSmartStyleStatusIndicatorForControl:](self, "_wantsSpotlightSmartStyleStatusIndicatorForControl:", -[CAMFullscreenViewfinder spotlightControl](self, "spotlightControl")))
  {
    -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "smartStyleIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

    v7 = 0.0;
    if (v3)
      v7 = 0.25;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__CAMFullscreenViewfinder__hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated___block_invoke;
    v8[3] = &unk_1EA328868;
    v8[4] = self;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v8, v7);
  }
}

void __83__CAMFullscreenViewfinder__hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "spotlightSmartStyleStatusIndicator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)_layoutSpotlightSmartStyleStatusIndicator
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _OWORD v14[6];

  -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smartStyleIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMFullscreenViewfinder spotlightSmartStyleStatusIndicator](self, "spotlightSmartStyleStatusIndicator");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

    objc_msgSend(v4, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "center");
    v10 = v9;
    v12 = v11;
    -[CAMFullscreenViewfinder _contentView](self, "_contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:toView:", v13, v10, v12);
    objc_msgSend(v6, "setCenter:");

    objc_msgSend(v4, "bounds");
    objc_msgSend(v6, "setBounds:");
    objc_msgSend(v4, "transform");
    v14[0] = v14[3];
    v14[1] = v14[4];
    v14[2] = v14[5];
    objc_msgSend(v6, "setTransform:", v14);
  }

}

- (void)setOverlayStyleControlActive:(BOOL)a3
{
  -[CAMFullscreenViewfinder setOverlayStyleControlActive:animated:](self, "setOverlayStyleControlActive:animated:", a3, 0);
}

- (void)setOverlayStyleControlActive:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  _BOOL4 v7;

  if (self->_overlayStyleControlActive != a3)
  {
    v4 = a4;
    v5 = a3;
    v7 = -[CAMFullscreenViewfinder _wantsSpotlightSmartStyleStatusIndicatorForControl:](self, "_wantsSpotlightSmartStyleStatusIndicatorForControl:", -[CAMFullscreenViewfinder spotlightControl](self, "spotlightControl"));
    self->_overlayStyleControlActive = v5;
    if (v5)
    {
      -[CAMFullscreenViewfinder _showSpotlightSmartStyleStatusIndicatorIfNeededAnimated:](self, "_showSpotlightSmartStyleStatusIndicatorIfNeededAnimated:", v4);
    }
    else if (v7)
    {
      -[CAMFullscreenViewfinder _hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated:](self, "_hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated:", v4);
    }
  }
}

- (void)setSpatialCaptureRecordingIndicatorVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setSpatialCaptureRecordingIndicatorVisible:animated:](self, "setSpatialCaptureRecordingIndicatorVisible:animated:", a3, 0);
}

- (void)setSpatialCaptureRecordingIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  CAMSpatialCaptureRecordingIndicator *v7;
  void *v8;
  void *v9;

  if (self->_spatialCaptureRecordingIndicatorVisible != a3)
  {
    v4 = a4;
    self->_spatialCaptureRecordingIndicatorVisible = a3;
    if (a3)
    {
      -[CAMFullscreenViewfinder spatialCaptureRecordingIndicator](self, "spatialCaptureRecordingIndicator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = objc_alloc_init(CAMSpatialCaptureRecordingIndicator);
        -[CAMSpatialCaptureRecordingIndicator setOrientation:](v7, "setOrientation:", -[CAMFullscreenViewfinder orientation](self, "orientation"));
        -[CAMFullscreenViewfinder _contentView](self, "_contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", v7);

        if (v4)
          -[CAMSpatialCaptureRecordingIndicator setAlpha:](v7, "setAlpha:", 0.0);
        -[CAMFullscreenViewfinder _setSpatialCaptureRecordingIndicator:](self, "_setSpatialCaptureRecordingIndicator:", v7);

      }
      -[CAMFullscreenViewfinder spatialCaptureRecordingIndicator](self, "spatialCaptureRecordingIndicator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setOrientation:animated:", -[CAMFullscreenViewfinder orientation](self, "orientation"), 0);

      -[CAMFullscreenViewfinder setNeedsLayout](self, "setNeedsLayout");
    }
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);
  }
}

- (void)setOrientationInstructionVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setOrientationInstructionVisible:animated:](self, "setOrientationInstructionVisible:animated:", a3, 0);
}

- (void)setOrientationInstructionVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  CAMOrientationInstructionView *v7;

  if (self->_orientationInstructionVisible != a3)
  {
    v4 = a4;
    self->_orientationInstructionVisible = a3;
    if (a3)
    {
      -[CAMFullscreenViewfinder _orientationInstructionView](self, "_orientationInstructionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = objc_alloc_init(CAMOrientationInstructionView);
        -[CAMOrientationInstructionView setOrientation:](v7, "setOrientation:", -[CAMFullscreenViewfinder deviceOrientation](self, "deviceOrientation"));
        -[CAMOrientationInstructionView setHasBlurredBackground:animated:](v7, "setHasBlurredBackground:animated:", -[CAMFullscreenViewfinder isOrientationInstructionBackgroundBlurred](self, "isOrientationInstructionBackgroundBlurred"), 0);
        -[CAMFullscreenViewfinder _insertBackgroundSubview:](self, "_insertBackgroundSubview:", v7);
        -[CAMFullscreenViewfinder _setOrientationInstructionView:](self, "_setOrientationInstructionView:", v7);
        if (v4)
          -[CAMOrientationInstructionView setAlpha:](v7, "setAlpha:", 0.0);

      }
    }
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);
  }
}

- (void)setOrientationInstructionBackgroundBlurred:(BOOL)a3
{
  -[CAMFullscreenViewfinder setOrientationInstructionBackgroundBlurred:animated:](self, "setOrientationInstructionBackgroundBlurred:animated:", a3, 0);
}

- (void)setOrientationInstructionBackgroundBlurred:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  if (self->_orientationInstructionBackgroundBlurred != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_orientationInstructionBackgroundBlurred = a3;
    -[CAMFullscreenViewfinder _orientationInstructionView](self, "_orientationInstructionView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHasBlurredBackground:animated:", v5, v4);

  }
}

- (void)setStereoCaptureStatus:(int64_t)a3
{
  -[CAMFullscreenViewfinder setStereoCaptureStatus:animated:](self, "setStereoCaptureStatus:animated:", a3, 0);
}

- (void)setStereoCaptureStatus:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;

  if (self->_stereoCaptureStatus != a3)
  {
    v4 = a4;
    self->_stereoCaptureStatus = a3;
    -[CAMFullscreenViewfinder spatialCaptureInstructionLabel](self, "spatialCaptureInstructionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (v4)
        -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
      -[CAMFullscreenViewfinder spatialCaptureInstructionLabel](self, "spatialCaptureInstructionLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setStereoCaptureStatus:", a3);

      -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v4);
    }
  }
}

- (void)setUseHoldStillStereoLowLightInstruction:(BOOL)a3
{
  -[CAMFullscreenViewfinder setStereoCaptureStatus:useHoldStillStereoLowLightInstruction:animated:](self, "setStereoCaptureStatus:useHoldStillStereoLowLightInstruction:animated:", -[CAMFullscreenViewfinder stereoCaptureStatus](self, "stereoCaptureStatus"), a3, 0);
}

- (void)setStereoCaptureStatus:(int64_t)a3 useHoldStillStereoLowLightInstruction:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  if (self->_stereoCaptureStatus != a3 || self->_useHoldStillStereoLowLightInstruction != a4)
  {
    self->_stereoCaptureStatus = a3;
    self->_useHoldStillStereoLowLightInstruction = a4;
    -[CAMFullscreenViewfinder spatialCaptureInstructionLabel](self, "spatialCaptureInstructionLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v5)
        -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
      -[CAMFullscreenViewfinder spatialCaptureInstructionLabel](self, "spatialCaptureInstructionLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStereoCaptureStatus:", a3);

      -[CAMFullscreenViewfinder spatialCaptureInstructionLabel](self, "spatialCaptureInstructionLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUseHoldStillLowLightInstruction:", v6);

      -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v5);
    }
  }
}

- (BOOL)_shouldShowControls
{
  return 1;
}

- (BOOL)_shouldShowSpotlightControlPanel
{
  return (-[CAMFullscreenViewfinder spotlightControl](self, "spotlightControl") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_showControlDrawer
{
  BOOL v3;

  if (-[CAMFullscreenViewfinder isControlDrawerAllowed](self, "isControlDrawerAllowed"))
    v3 = -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded");
  else
    v3 = 0;
  return v3 & -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (BOOL)_showModeView
{
  int v3;
  char v4;

  if (-[CAMFullscreenViewfinder isModeUIAllowed](self, "isModeUIAllowed"))
    v3 = !-[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer");
  else
    LOBYTE(v3) = 0;
  v4 = v3 & ~-[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible");
  return v4 & -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (BOOL)_shouldShowZoomControl
{
  void *v3;
  BOOL v4;
  void *v5;
  double v6;

  if (-[CAMFullscreenViewfinder isZoomControlVisible](self, "isZoomControlVisible"))
  {
    -[CAMFullscreenViewfinder machineReadableCodeButton](self, "machineReadableCodeButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (unint64_t)(-[CAMFullscreenViewfinder orientation](self, "orientation") - 3) >= 2)
    {
      -[CAMFullscreenViewfinder zoomControl](self, "zoomControl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "edgeMargin");
      v4 = v6 != 0.0;

    }
    else
    {
      v4 = 1;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4 & -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (BOOL)_showPortraitControls
{
  int v3;

  if (-[CAMFullscreenViewfinder isPortraitControlsAllowed](self, "isPortraitControlsAllowed")
    && !-[CAMFullscreenViewfinder isFilterScrubberVisible](self, "isFilterScrubberVisible"))
  {
    v3 = !-[CAMFullscreenViewfinder isSemanticStyleControlVisible](self, "isSemanticStyleControlVisible");
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3 & -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (BOOL)_showLandscapeLightingBadge
{
  BOOL v3;

  if (-[CAMFullscreenViewfinder _showPortraitControls](self, "_showPortraitControls"))
    v3 = (unint64_t)(-[CAMFullscreenViewfinder orientation](self, "orientation") - 3) < 2;
  else
    v3 = 0;
  return v3 & -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (BOOL)_showFilterNameBadge
{
  BOOL v3;

  v3 = -[CAMFullscreenViewfinder isFilterScrubberVisible](self, "isFilterScrubberVisible");
  return v3 & -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (BOOL)_showSmartStyleNameBadge
{
  BOOL v3;

  v3 = -[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible");
  return v3 & -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (BOOL)_showSemanticStylePicker
{
  BOOL v3;

  v3 = -[CAMFullscreenViewfinder isSemanticStyleControlVisible](self, "isSemanticStyleControlVisible");
  return v3 & -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (BOOL)_showSmartStylePicker
{
  int64_t v3;
  BOOL v4;
  BOOL v5;

  v3 = -[CAMFullscreenViewfinder spotlightControl](self, "spotlightControl");
  if (-[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"))
  {
    v4 = -[CAMFullscreenViewfinder isSmartStylePickerVisible](self, "isSmartStylePickerVisible");
    v5 = v3 != 1 && v4;
  }
  else
  {
    v5 = 0;
  }
  return v5 & -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
}

- (void)_updateSubviewsVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;
  void *v24;
  _BOOL4 v25;
  char v26;
  _BOOL8 v27;
  int64_t v28;
  _BOOL8 v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  void *v36;
  BOOL v37;
  id v38;
  BOOL v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  BOOL v44;
  char v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  _QWORD v49[4];
  id v50;
  id v51;
  char v52;
  char v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;

  v3 = a3;
  if (a3)
    v5 = 0.3;
  else
    v5 = 0.0;
  v6 = -[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer");
  v7 = -[CAMFullscreenViewfinder _showModeView](self, "_showModeView");
  -[CAMFullscreenViewfinder _modeClippingView](self, "_modeClippingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[CAMFullscreenViewfinder modeIndicator](self, "modeIndicator");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v40 = v12;
  if (v3 && v6 != v7)
  {
    if (v6)
      v14 = v12;
    else
      v14 = v11;
    if (v6)
      v15 = v11;
    else
      v15 = v12;
    v16 = v14;
    v17 = v15;
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v56[0] = v13;
    v56[1] = 3221225472;
    v56[2] = __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke;
    v56[3] = &unk_1EA328868;
    v57 = v17;
    v19 = v17;
    objc_msgSend(v18, "animateWithDuration:delay:options:animations:completion:", 131074, v56, 0, 0.2, 0.0);
    v20 = (void *)MEMORY[0x1E0DC3F10];
    v54[0] = v13;
    v54[1] = 3221225472;
    v54[2] = __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_2;
    v54[3] = &unk_1EA328868;
    v55 = v16;
    v21 = v16;
    objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 65538, v54, 0, 0.25, 0.05);

  }
  else
  {
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_3;
    v49[3] = &unk_1EA328958;
    v50 = v12;
    v52 = v6;
    v51 = v11;
    v53 = v7;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v49, v5);

    v19 = v50;
  }

  -[CAMFullscreenViewfinder machineReadableCodeButton](self, "machineReadableCodeButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v39 = (unint64_t)(-[CAMFullscreenViewfinder orientation](self, "orientation") - 1) < 2;
    v23 = (unint64_t)(-[CAMFullscreenViewfinder orientation](self, "orientation") - 5) < 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    v39 = 0;
    v23 = 1;
  }
  v41 = v11;
  -[CAMFullscreenViewfinder lightingControl](self, "lightingControl");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[CAMFullscreenViewfinder _showPortraitControls](self, "_showPortraitControls");
  v26 = -[CAMFullscreenViewfinder _showLandscapeLightingBadge](self, "_showLandscapeLightingBadge") && v23;
  if (v25)
  {
    v27 = (v26 & 1) != 0 || -[CAMFullscreenViewfinder lightingNameBadgesHidden](self, "lightingNameBadgesHidden");
    objc_msgSend(v24, "setNameBadgeHidden:animated:", v27, v3);
  }
  v28 = -[CAMFullscreenViewfinder spotlightControl](self, "spotlightControl");
  v29 = -[CAMFullscreenViewfinder _showSemanticStylePicker](self, "_showSemanticStylePicker");
  -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setExpanded:animated:", v29, v3);

  v31 = -[CAMFullscreenViewfinder _showSmartStylePicker](self, "_showSmartStylePicker");
  -[CAMFullscreenViewfinder smartStylePicker](self, "smartStylePicker");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  v34 = v28 == 1 || v3;
  v35 = v28 == 1 || v29 || v31;
  objc_msgSend(v32, "setExpanded:animated:", v31, v34);

  -[CAMFullscreenViewfinder _reticleView](self, "_reticleView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCornersVisible:animated:", v35 ^ 1u, v3);

  v37 = -[CAMFullscreenViewfinder _shouldShowControls](self, "_shouldShowControls");
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_4;
  v42[3] = &unk_1EA328980;
  v44 = v37;
  v45 = v26;
  v46 = v29;
  v42[4] = self;
  v43 = v24;
  v47 = v25;
  v48 = v39;
  v38 = v24;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v42, v5);

}

uint64_t __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;

  if (*(_BYTE *)(a1 + 48))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 49))
    v3 = 1.0;
  else
    v3 = 0.0;
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v3);
}

void __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  double v77;
  double v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v2 = 0.0;
  v3 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "isShutterButtonVisible"))
  {
    if (*(_BYTE *)(a1 + 48))
      v3 = 1.0;
    else
      v3 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "shutterControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  if (objc_msgSend(*(id *)(a1 + 32), "isTimerIndicatorVisible"))
  {
    if (*(_BYTE *)(a1 + 48))
      v2 = 1.0;
    else
      v2 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "timerIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v2);

  v6 = 0.0;
  v7 = 0.0;
  if (*(_BYTE *)(a1 + 49) && *(_BYTE *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "lightingNameBadgesHidden"))
      v7 = 0.0;
    else
      v7 = 1.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "lightingNameBadge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  if (objc_msgSend(*(id *)(a1 + 32), "_showFilterNameBadge"))
  {
    if (*(_BYTE *)(a1 + 48))
      v6 = 1.0;
    else
      v6 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "filterNameBadge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v6);

  v10 = 0.0;
  v11 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "_showSmartStyleNameBadge"))
  {
    if (*(_BYTE *)(a1 + 48))
      v11 = 1.0;
    else
      v11 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "smartStyleNameBadge");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", v11);

  if (objc_msgSend(*(id *)(a1 + 32), "smartStyleControlsVisible"))
  {
    if (*(_BYTE *)(a1 + 48))
      v10 = 1.0;
    else
      v10 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "smartStyleSlider2D");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v10);

  v15 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowSmartStyleIntensitySlider"))
    v16 = 1.0;
  else
    v16 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "smartStyleIntensitySlider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", v16);

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowSmartStyleValuesPlatter"))
    v18 = 1.0;
  else
    v18 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "smartStyleValuesPlatterView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", v18);

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_semanticStyleBadges");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v89 != v23)
          objc_enumerationMutation(v20);
        if (*(_BYTE *)(a1 + 50))
        {
          if (*(_BYTE *)(a1 + 48))
            v25 = 1.0;
          else
            v25 = 0.0;
        }
        else
        {
          v25 = 0.0;
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "setAlpha:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    }
    while (v22);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isFlipButtonVisible"))
  {
    if (*(_BYTE *)(a1 + 48))
      v15 = 1.0;
    else
      v15 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "flipButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAlpha:", v15);

  v27 = 0.0;
  v28 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowZoomControl"))
  {
    if (*(_BYTE *)(a1 + 48))
      v28 = 1.0;
    else
      v28 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "zoomControl");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlpha:", v28);

  if (objc_msgSend(*(id *)(a1 + 32), "isElapsedTimeViewVisible"))
    v30 = 1.0;
  else
    v30 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "elapsedTimeView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAlpha:", v30);

  if (objc_msgSend(*(id *)(a1 + 32), "visibleSuggestionButtonType") == 1)
  {
    if (*(_BYTE *)(a1 + 48))
      v27 = 1.0;
    else
      v27 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "autoMacroButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAlpha:", v27);

  v33 = 0.0;
  v34 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "visibleSuggestionButtonType") == 2)
  {
    if (*(_BYTE *)(a1 + 48))
      v34 = 1.0;
    else
      v34 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "depthEffectSuggestionButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAlpha:", v34);

  if (objc_msgSend(*(id *)(a1 + 32), "isImageAnalysisButtonVisible"))
  {
    if (*(_BYTE *)(a1 + 48))
      v33 = 1.0;
    else
      v33 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "imageAnalysisButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAlpha:", v33);

  v37 = 0.0;
  v38 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "isPreviewAlignmentGuideVisible"))
  {
    if (*(_BYTE *)(a1 + 48))
      v38 = 1.0;
    else
      v38 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "previewAlignmentGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAlpha:", v38);

  if (objc_msgSend(*(id *)(a1 + 32), "isSharedLibraryImageWellIndicatorVisible"))
  {
    if (*(_BYTE *)(a1 + 48))
      v37 = 1.0;
    else
      v37 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "sharedLibraryImageWellIndicatorView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAlpha:", v37);

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowSpotlightControlPanel"))
    v41 = 1.0;
  else
    v41 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "spotlightControlPanel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAlpha:", v41);

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowControlStatusBar"))
    v43 = 1.0;
  else
    v43 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "controlStatusBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAlpha:", v43);

  objc_msgSend(*(id *)(a1 + 32), "_legibilityBackgroundAlpha");
  v46 = v45;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "controlStatusBar");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setBackgroundColor:", v47);

  objc_msgSend(*(id *)(a1 + 32), "_bottomLegibilityBackground");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAlpha:", v46);

  objc_msgSend(*(id *)(a1 + 32), "_visibleInstructionLabelForInstructionLabelValue:", objc_msgSend(*(id *)(a1 + 32), "visibleInstructionLabel"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_createdPrimaryInstructionLabels");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v85 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
        v57 = 0.0;
        if (v56 == v50)
        {
          if (*(_BYTE *)(a1 + 48))
            v57 = 1.0;
          else
            v57 = 0.0;
        }
        objc_msgSend(v56, "setAlpha:", v57);
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
    }
    while (v53);
  }

  objc_msgSend(*(id *)(a1 + 32), "_visibleInstructionLabelForInstructionLabelValue:", objc_msgSend(*(id *)(a1 + 32), "visibleSecondaryInstructionLabel"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_createdSecondaryInstructionLabels", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v61; ++k)
      {
        if (*(_QWORD *)v81 != v62)
          objc_enumerationMutation(v59);
        v64 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * k);
        v65 = 0.0;
        if (v64 == v58)
        {
          if (*(_BYTE *)(a1 + 48))
            v65 = 1.0;
          else
            v65 = 0.0;
        }
        objc_msgSend(v64, "setAlpha:", v65);
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    }
    while (v61);
  }

  v66 = 0.0;
  v67 = 0.0;
  if (*(_BYTE *)(a1 + 51) && !*(_BYTE *)(a1 + 52))
    v67 = 1.0;
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v67);
  if (objc_msgSend(*(id *)(a1 + 32), "isExternalStorageButtonVisible"))
    v68 = 1.0;
  else
    v68 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "externalStorageButton");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setAlpha:", v68);

  if (objc_msgSend(*(id *)(a1 + 32), "isOrientationInstructionVisible"))
  {
    if (*(_BYTE *)(a1 + 48))
      v66 = 1.0;
    else
      v66 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_orientationInstructionView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAlpha:", v66);

  v71 = 0.0;
  v72 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "visibleSuggestionButtonType") == 3)
  {
    if (*(_BYTE *)(a1 + 48))
      v72 = 1.0;
    else
      v72 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "spatialCaptureButton");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setAlpha:", v72);

  if (objc_msgSend(*(id *)(a1 + 32), "isSpatialCaptureRecordingIndicatorVisible"))
  {
    if (*(_BYTE *)(a1 + 48))
      v71 = 1.0;
    else
      v71 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "spatialCaptureRecordingIndicator");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setAlpha:", v71);

  objc_msgSend(*(id *)(a1 + 32), "photoVideoModeSwitch");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "isEnabled");

  v77 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "isModeSwitchVisible"))
  {
    v78 = 0.5;
    if (v76)
      v78 = 1.0;
    if (*(_BYTE *)(a1 + 48))
      v77 = v78;
    else
      v77 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "photoVideoModeSwitch");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setAlpha:", v77);

}

- (double)_legibilityBackgroundAlpha
{
  _BOOL4 v3;
  double result;
  _BOOL4 v5;

  v3 = -[CAMFullscreenViewfinder isLegibilityBackgroundsVisible](self, "isLegibilityBackgroundsVisible");
  result = 0.0;
  if (v3)
  {
    v5 = -[CAMFullscreenViewfinder isSemanticStyleControlVisible](self, "isSemanticStyleControlVisible", 0.0);
    result = 0.3;
    if (v5)
      return 0.8;
  }
  return result;
}

- (void)_updateTintColors
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[9];

  -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CAMFullscreenViewfinder__updateTintColors__block_invoke;
  aBlock[3] = &unk_1EA3289A8;
  aBlock[5] = v3;
  aBlock[6] = v4;
  aBlock[7] = v5;
  aBlock[8] = v6;
  aBlock[4] = self;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);

  -[CAMFullscreenViewfinder flipButton](self, "flipButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9);

  -[CAMFullscreenViewfinder creativeCameraButton](self, "creativeCameraButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);

}

void __44__CAMFullscreenViewfinder__updateTintColors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  id v6;
  CGRect v7;

  v3 = a2;
  objc_msgSend(v3, "frame");
  v4 = CGRectIntersectsRect(v7, *(CGRect *)(a1 + 40));
  v5 = (void *)objc_opt_class();
  if (v4)
    objc_msgSend(v5, "darkControlBackgroundColor");
  else
    objc_msgSend(v5, "lightControlBackgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v6);

}

- (void)setVisibleInstructionLabel:(int64_t)a3
{
  -[CAMFullscreenViewfinder setVisibleInstructionLabel:animated:](self, "setVisibleInstructionLabel:animated:", a3, 0);
}

- (void)setVisibleInstructionLabel:(int64_t)a3 animated:(BOOL)a4
{
  -[CAMFullscreenViewfinder setVisibleInstructionLabel:visibleSecondaryInstructionLabel:animated:](self, "setVisibleInstructionLabel:visibleSecondaryInstructionLabel:animated:", a3, -[CAMFullscreenViewfinder visibleSecondaryInstructionLabel](self, "visibleSecondaryInstructionLabel"), a4);
}

- (void)_createViewIfNeededForInstructionLabel:(int64_t)a3 isPrimary:(BOOL)a4
{
  _BOOL4 v4;
  CAMFullscreenViewfinder *v7;
  void *v8;
  CAMPortraitModeInstructionLabel *v9;
  int64_t v10;
  void *v11;
  CAMSmartStyleCategoryInstructionLabel *v12;
  void *v13;
  CAMQRCodeInstructionLabel *v14;
  void *v15;
  CAMLowLightInstructionLabel *v16;
  void *v17;
  CAMFlashCompromisedInstructionLabel *v18;
  void *v19;
  CAMImageAnalysisInstructionLabel *v20;
  void *v21;
  CAMFullscreenViewfinder *v22;
  uint64_t v23;
  void *v24;
  CAMMaxRecordingTimeInstructionLabel *v25;
  void *v26;
  CAMFreeResourcesInstructionLabel *v27;
  void *v28;
  CAMDeviceTooHotInstructionLabel *v29;
  void *v30;
  CAMSpatialCaptureInstructionLabel *v31;
  int64_t v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  CAMSmartStyleCategoryInstructionLabel *v36;
  CAMSmartStyleCategoryInstructionLabel *smartStyleCategoryInstructionLabel;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CAMFullscreenViewfinder *v42;

  v4 = a4;
  -[CAMFullscreenViewfinder _modulatingContentView](self, "_modulatingContentView");
  v7 = (CAMFullscreenViewfinder *)objc_claimAutoreleasedReturnValue();
  v42 = v7;
  switch(a3)
  {
    case 1:
      -[CAMFullscreenViewfinder portraitInstructionLabel](self, "portraitInstructionLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_28;
      v9 = objc_alloc_init(CAMPortraitModeInstructionLabel);
      -[CAMFullscreenViewfinder _setPortraitInstructionLabel:](self, "_setPortraitInstructionLabel:", v9);

      v10 = -[CAMFullscreenViewfinder shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus");
      -[CAMFullscreenViewfinder portraitInstructionLabel](self, "portraitInstructionLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShallowDepthOfFieldStatus:", v10);

      -[CAMFullscreenViewfinder portraitInstructionLabel](self, "portraitInstructionLabel");
      v12 = (CAMSmartStyleCategoryInstructionLabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 2:
      -[CAMFullscreenViewfinder qrCodeInstructionLabel](self, "qrCodeInstructionLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_28;
      v14 = objc_alloc_init(CAMQRCodeInstructionLabel);
      -[CAMFullscreenViewfinder _setQRCodeInstructionLabel:](self, "_setQRCodeInstructionLabel:", v14);

      -[CAMFullscreenViewfinder qrCodeInstructionLabel](self, "qrCodeInstructionLabel");
      v12 = (CAMSmartStyleCategoryInstructionLabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 3:
      -[CAMFullscreenViewfinder _lowLightInstructionLabel](self, "_lowLightInstructionLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_28;
      v16 = objc_alloc_init(CAMLowLightInstructionLabel);
      -[CAMFullscreenViewfinder _setLowLightInstructionLabel:](self, "_setLowLightInstructionLabel:", v16);

      -[CAMFullscreenViewfinder _lowLightInstructionLabel](self, "_lowLightInstructionLabel");
      v12 = (CAMSmartStyleCategoryInstructionLabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 4:
      -[CAMFullscreenViewfinder flashCompromisedInstructionLabel](self, "flashCompromisedInstructionLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_28;
      v18 = objc_alloc_init(CAMFlashCompromisedInstructionLabel);
      -[CAMFullscreenViewfinder _setFlashCompromisedInstructionLabel:](self, "_setFlashCompromisedInstructionLabel:", v18);

      -[CAMFullscreenViewfinder flashCompromisedInstructionLabel](self, "flashCompromisedInstructionLabel");
      v12 = (CAMSmartStyleCategoryInstructionLabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 5:
      -[CAMFullscreenViewfinder imageAnalysisInstructionLabel](self, "imageAnalysisInstructionLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_28;
      v20 = objc_alloc_init(CAMImageAnalysisInstructionLabel);
      -[CAMFullscreenViewfinder _setImageAnalysisInstructionLabel:](self, "_setImageAnalysisInstructionLabel:", v20);

      -[CAMFullscreenViewfinder imageAnalysisInstructionLabel](self, "imageAnalysisInstructionLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self;

      v23 = 0;
      v42 = v22;
      goto LABEL_23;
    case 6:
      -[CAMFullscreenViewfinder maxRecordingTimeInstructionLabel](self, "maxRecordingTimeInstructionLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        goto LABEL_28;
      v25 = objc_alloc_init(CAMMaxRecordingTimeInstructionLabel);
      -[CAMFullscreenViewfinder _setMaxRecordingTimeInstructionLabel:](self, "_setMaxRecordingTimeInstructionLabel:", v25);

      -[CAMFullscreenViewfinder maxRecordingTimeInstructionLabel](self, "maxRecordingTimeInstructionLabel");
      v12 = (CAMSmartStyleCategoryInstructionLabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 7:
      -[CAMFullscreenViewfinder freeResourcesInstructionLabel](self, "freeResourcesInstructionLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        goto LABEL_28;
      v27 = objc_alloc_init(CAMFreeResourcesInstructionLabel);
      -[CAMFullscreenViewfinder _setFreeResourcesInstructionLabel:](self, "_setFreeResourcesInstructionLabel:", v27);

      -[CAMFullscreenViewfinder freeResourcesInstructionLabel](self, "freeResourcesInstructionLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 1;
      goto LABEL_23;
    case 8:
      -[CAMFullscreenViewfinder deviceTooHotInstructionLabel](self, "deviceTooHotInstructionLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
        goto LABEL_28;
      v29 = objc_alloc_init(CAMDeviceTooHotInstructionLabel);
      -[CAMFullscreenViewfinder _setDeviceTooHotInstructionLabel:](self, "_setDeviceTooHotInstructionLabel:", v29);

      -[CAMFullscreenViewfinder deviceTooHotInstructionLabel](self, "deviceTooHotInstructionLabel");
      v12 = (CAMSmartStyleCategoryInstructionLabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 9:
      -[CAMFullscreenViewfinder spatialCaptureInstructionLabel](self, "spatialCaptureInstructionLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        goto LABEL_28;
      v31 = objc_alloc_init(CAMSpatialCaptureInstructionLabel);
      -[CAMFullscreenViewfinder _setSpatialCaptureInstructionLabel:](self, "_setSpatialCaptureInstructionLabel:", v31);

      v32 = -[CAMFullscreenViewfinder stereoCaptureStatus](self, "stereoCaptureStatus");
      -[CAMFullscreenViewfinder spatialCaptureInstructionLabel](self, "spatialCaptureInstructionLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setStereoCaptureStatus:", v32);

      v34 = -[CAMFullscreenViewfinder useHoldStillStereoLowLightInstruction](self, "useHoldStillStereoLowLightInstruction");
      -[CAMFullscreenViewfinder spatialCaptureInstructionLabel](self, "spatialCaptureInstructionLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setUseHoldStillLowLightInstruction:", v34);

      -[CAMFullscreenViewfinder spatialCaptureInstructionLabel](self, "spatialCaptureInstructionLabel");
      v12 = (CAMSmartStyleCategoryInstructionLabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 10:
      if (self->_smartStyleCategoryInstructionLabel)
        goto LABEL_29;
      v36 = objc_alloc_init(CAMSmartStyleCategoryInstructionLabel);
      smartStyleCategoryInstructionLabel = self->_smartStyleCategoryInstructionLabel;
      self->_smartStyleCategoryInstructionLabel = v36;

      v12 = self->_smartStyleCategoryInstructionLabel;
LABEL_22:
      v21 = v12;
      v23 = 0;
LABEL_23:
      if (v21)
      {
        objc_msgSend(v21, "setUserInteractionEnabled:", v23);
        objc_msgSend(v21, "setStyle:", 1);
        objc_msgSend(v21, "setDelegate:", self);
        -[CAMFullscreenViewfinder addSubview:](v42, "addSubview:", v21);
        -[CAMFullscreenViewfinder _instructionLabelByValue](self, "_instructionLabelByValue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v21, v39);

        if (v4)
          -[CAMFullscreenViewfinder _createdPrimaryInstructionLabels](self, "_createdPrimaryInstructionLabels");
        else
          -[CAMFullscreenViewfinder _createdSecondaryInstructionLabels](self, "_createdSecondaryInstructionLabels");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v21);

        -[CAMFullscreenViewfinder delegate](self, "delegate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "fullscreenViewfinder:didCreateInstructionLabel:", self, a3);

      }
LABEL_28:
      v7 = v42;
LABEL_29:

      return;
    default:
      goto LABEL_29;
  }
}

- (id)_visibleInstructionLabelForInstructionLabelValue:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CAMFullscreenViewfinder _instructionLabelByValue](self, "_instructionLabelByValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setVisibleInstructionLabel:(int64_t)a3 visibleSecondaryInstructionLabel:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  int64_t visibleInstructionLabel;
  int64_t visibleSecondaryInstructionLabel;

  v5 = a5;
  if (*(_OWORD *)&self->_visibleInstructionLabel != __PAIR128__(a4, a3))
  {
    -[CAMFullscreenViewfinder _createViewIfNeededForInstructionLabel:isPrimary:](self, "_createViewIfNeededForInstructionLabel:isPrimary:", a3, 1);
    -[CAMFullscreenViewfinder _createViewIfNeededForInstructionLabel:isPrimary:](self, "_createViewIfNeededForInstructionLabel:isPrimary:", a4, 0);
    if (v5)
      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    visibleInstructionLabel = self->_visibleInstructionLabel;
    visibleSecondaryInstructionLabel = self->_visibleSecondaryInstructionLabel;
    self->_visibleInstructionLabel = a3;
    self->_visibleSecondaryInstructionLabel = a4;
    if (a3 && !visibleInstructionLabel || a4 && !visibleSecondaryInstructionLabel)
      -[CAMFullscreenViewfinder _updateGeometryForElapsedTimeAndInstructionLabels](self, "_updateGeometryForElapsedTimeAndInstructionLabels");
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v5);
  }
}

- (unint64_t)_badgeFontStyle
{
  void *v2;
  unint64_t v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sfCameraFontSupported");

  return v3;
}

- (void)_transitionView:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5
{
  _BOOL4 v5;
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v5 = ((a5 - 1) | (unint64_t)(a4 - 1)) < 2;
    v6 = a3;
    CAMSnapshotForFadingOrientationTransition((uint64_t)v6, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addSubview:", v8);
  }
}

- (void)_transitionView:(id)a3 isFlippingInPlace:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a4;
    v5 = a3;
    CAMSnapshotForFadingOrientationTransition((uint64_t)v5, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addSubview:", v7);
  }
}

- (void)setControlDrawerAllowed:(BOOL)a3 modeUIAllowed:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v5 = a5;
  if (self->_controlDrawerAllowed != a3 || self->_modeUIAllowed != a4)
  {
    if (a5)
      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    v9 = -[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer");
    self->_controlDrawerAllowed = a3;
    self->_modeUIAllowed = a4;
    if (v9 && -[CAMFullscreenViewfinder _showModeView](self, "_showModeView") && v5)
    {
      -[CAMFullscreenViewfinder _frameForModeView](self, "_frameForModeView");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[CAMFullscreenViewfinder modeDial](self, "modeDial");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    }
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v5);
  }
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMFullscreenViewfinder setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  int64_t orientation;
  _BOOL8 v5;
  double v8;
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
  _BOOL4 v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  _BOOL4 v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  _BOOL8 v57;
  __int128 v58;
  __int128 v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  _OWORD v80[6];
  char v81[96];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  char v98[96];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  char v103[96];
  char v104[96];
  char v105[96];
  char v106[96];
  char v107[96];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD v124[5];
  id v125;
  double v126;
  double v127;
  double v128;
  double v129;
  int64_t v130;
  _QWORD v131[5];
  BOOL v132;
  _QWORD v133[5];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  BOOL v146;
  BOOL v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  orientation = self->_orientation;
  if (orientation != a3)
  {
    v5 = a4;
    if (a4)
      v8 = 0.3;
    else
      v8 = 0.0;
    self->_orientation = a3;
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder shutterControl](self, "shutterControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder timerIndicator](self, "timerIndicator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder autoMacroButton](self, "autoMacroButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder depthEffectSuggestionButton](self, "depthEffectSuggestionButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder spotlightControlPanel](self, "spotlightControlPanel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder spotlightSmartStyleStatusIndicator](self, "spotlightSmartStyleStatusIndicator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder spatialCaptureButton](self, "spatialCaptureButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder lightingControl](self, "lightingControl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOrientation:", a3);

    -[CAMFullscreenViewfinder photoVideoModeSwitch](self, "photoVideoModeSwitch");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setOrientation:animated:", a3, v5);

    v20 = -[CAMFullscreenViewfinder _shouldAnimateSmartStyleSlider2DChangeFromOrientation:toOrientation:](self, "_shouldAnimateSmartStyleSlider2DChangeFromOrientation:toOrientation:", orientation, a3);
    v21 = -[CAMFullscreenViewfinder _shouldAnimateSmartStyleIntensitySliderChangeFromOrientation:toOrientation:](self, "_shouldAnimateSmartStyleIntensitySliderChangeFromOrientation:toOrientation:", orientation, a3);
    v159 = 0u;
    v158 = 0u;
    v157 = 0u;
    v156 = 0u;
    v155 = 0u;
    v154 = 0u;
    -[CAMFullscreenViewfinder _geometryForSmartStyleSlider2DExpanded:](self, "_geometryForSmartStyleSlider2DExpanded:", -[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible"));
    v153 = 0u;
    v152 = 0u;
    v151 = 0u;
    v150 = 0u;
    v149 = 0u;
    v148 = 0u;
    -[CAMFullscreenViewfinder _geometryForSmartStyleIntensitySliderExpanded:](self, "_geometryForSmartStyleIntensitySliderExpanded:", -[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible"));
    v22 = MEMORY[0x1E0C809B0];
    if (v20 || v21)
    {
      v133[1] = 3221225472;
      v136 = v156;
      v137 = v157;
      v138 = v158;
      v139 = v159;
      v134 = v154;
      v135 = v155;
      v145 = v153;
      v142 = v150;
      v143 = v151;
      v141 = v149;
      v140 = v148;
      v133[0] = MEMORY[0x1E0C809B0];
      v133[2] = __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke;
      v133[3] = &unk_1EA3289D0;
      v146 = v20;
      v133[4] = self;
      v147 = v21;
      v144 = v152;
      +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", 2, v133, 0, v8);
    }
    -[CAMFullscreenViewfinder _descriptionOverlayViewByKey](self, "_descriptionOverlayViewByKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v131[0] = v22;
    v131[1] = 3221225472;
    v131[2] = __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke_2;
    v131[3] = &__block_descriptor_41_e55_v32__0___NSCopying__8__CAMDescriptionOverlayView_16_B24l;
    v131[4] = a3;
    v132 = v5;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v131);

    -[CAMFullscreenViewfinder disabledModeOverlayView](self, "disabledModeOverlayView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setOrientation:animated:", a3, v5);

    -[CAMFullscreenViewfinder imageAnalysisButton](self, "imageAnalysisButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v124[0] = v22;
    v124[1] = 3221225472;
    v124[2] = __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke_3;
    v124[3] = &unk_1EA328A18;
    v124[4] = self;
    v126 = v26;
    v127 = v28;
    v128 = v30;
    v129 = v32;
    v34 = v25;
    v125 = v34;
    v130 = a3;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v124, v8);
    -[CAMFullscreenViewfinder badgeTray](self, "badgeTray");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder lightingNameBadge](self, "lightingNameBadge");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder filterNameBadge](self, "filterNameBadge");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder smartStyleNameBadge](self, "smartStyleNameBadge");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder elapsedTimeView](self, "elapsedTimeView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMFullscreenViewfinder machineReadableCodeButton](self, "machineReadableCodeButton");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v37;
    v74 = v36;
    if (v5)
    {
      v79 = v35;
      -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", v35, orientation, a3);
      if (-[CAMFullscreenViewfinder isElapsedTimeViewVisible](self, "isElapsedTimeViewVisible"))
        -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", v37, orientation, a3);
      -[CAMFullscreenViewfinder _visibleInstructionLabelForInstructionLabelValue:](self, "_visibleInstructionLabelForInstructionLabelValue:", -[CAMFullscreenViewfinder visibleInstructionLabel](self, "visibleInstructionLabel"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
        -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", v38, orientation, a3);
      -[CAMFullscreenViewfinder _visibleInstructionLabelForInstructionLabelValue:](self, "_visibleInstructionLabelForInstructionLabelValue:", -[CAMFullscreenViewfinder visibleSecondaryInstructionLabel](self, "visibleSecondaryInstructionLabel"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
        -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", v39, orientation, a3);
      if (-[CAMFullscreenViewfinder _showFilterNameBadge](self, "_showFilterNameBadge"))
        -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", v76, orientation, a3);
      if (-[CAMFullscreenViewfinder _showSmartStyleNameBadge](self, "_showSmartStyleNameBadge"))
        -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", v75, orientation, a3);
      if (-[CAMFullscreenViewfinder smartStyleControlsVisible](self, "smartStyleControlsVisible") && !v20)
      {
        -[CAMFullscreenViewfinder smartStyleSlider2D](self, "smartStyleSlider2D");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "view");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMFullscreenViewfinder _transitionView:isFlippingInPlace:](self, "_transitionView:isFlippingInPlace:", v41, 1);

        -[CAMFullscreenViewfinder smartStyleSlider2D](self, "smartStyleSlider2D");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "view");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v156;
        v121 = v157;
        v122 = v158;
        v123 = v159;
        v118 = v154;
        v119 = v155;
        CAMViewSetGeometry(v43, (uint64_t)&v118);

        v36 = v74;
      }
      if (-[CAMFullscreenViewfinder _shouldShowSmartStyleIntensitySlider](self, "_shouldShowSmartStyleIntensitySlider")
        && !v21)
      {
        -[CAMFullscreenViewfinder smartStyleIntensitySlider](self, "smartStyleIntensitySlider");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", v44, orientation, a3);

        -[CAMFullscreenViewfinder smartStyleIntensitySlider](self, "smartStyleIntensitySlider");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v150;
        v121 = v151;
        v122 = v152;
        v123 = v153;
        v118 = v148;
        v119 = v149;
        CAMViewSetGeometry(v45, (uint64_t)&v118);

      }
      if (-[CAMFullscreenViewfinder _showSemanticStylePicker](self, "_showSemanticStylePicker"))
      {
        v78 = v34;
        v117 = 0u;
        v116 = 0u;
        v115 = 0u;
        v114 = 0u;
        -[CAMFullscreenViewfinder _semanticStyleBadges](self, "_semanticStyleBadges");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v114, v162, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v115;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v115 != v49)
                objc_enumerationMutation(v46);
              -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i), orientation, a3);
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v114, v162, 16);
          }
          while (v48);
        }

        v34 = v78;
        v36 = v74;
      }
      if (v77)
        -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", v77, orientation, a3);
      v51 = -[CAMFullscreenViewfinder _showLandscapeLightingBadge](self, "_showLandscapeLightingBadge");
      if (((orientation - 3) | (unint64_t)(a3 - 3)) <= 1 && v51)
        -[CAMFullscreenViewfinder _transitionView:fromOrientation:toOrientation:](self, "_transitionView:fromOrientation:toOrientation:", v36, orientation, a3);

      v35 = v79;
      v37 = v73;
    }
    v52 = -[CAMFullscreenViewfinder isElapsedTimeViewVisible](self, "isElapsedTimeViewVisible");
    objc_msgSend(v37, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "animationForKey:", CFSTR("opacity"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
      v55 = v52;
    else
      v55 = 1;

    v123 = 0u;
    v122 = 0u;
    v121 = 0u;
    v120 = 0u;
    v119 = 0u;
    v118 = 0u;
    -[CAMFullscreenViewfinder _layout](self, "_layout");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[CAMFullscreenViewfinder isSystemOverlayVisible](self, "isSystemOverlayVisible");
    if (v56)
    {
      objc_msgSend(v56, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v37, a3, v57, v27, v29, v31, v33);
    }
    else
    {
      v123 = 0u;
      v122 = 0u;
      v121 = 0u;
      v120 = 0u;
      v119 = 0u;
      v118 = 0u;
    }

    if (v55)
    {
      v110 = v120;
      v111 = v121;
      v112 = v122;
      v113 = v123;
      v108 = v118;
      v109 = v119;
      CAMViewSetGeometry(v37, (uint64_t)&v108);
    }
    -[CAMFullscreenViewfinder _geometryForBadgeTray](self, "_geometryForBadgeTray");
    CAMViewSetGeometry(v35, (uint64_t)v107);
    -[CAMFullscreenViewfinder _geometryForLandscapeLightingBadge](self, "_geometryForLandscapeLightingBadge");
    CAMViewSetGeometry(v36, (uint64_t)v106);
    -[CAMFullscreenViewfinder _geometryForBottomCenteredView:](self, "_geometryForBottomCenteredView:", v76);
    CAMViewSetGeometry(v76, (uint64_t)v105);
    -[CAMFullscreenViewfinder _geometryForSmartStyleNameBadge:](self, "_geometryForSmartStyleNameBadge:", v75);
    CAMViewSetGeometry(v75, (uint64_t)v104);
    -[CAMFullscreenViewfinder _geometryForMRCButton](self, "_geometryForMRCButton");
    CAMViewSetGeometry(v77, (uint64_t)v103);
    -[CAMFullscreenViewfinder _layoutSemanticStyleMaskedBadges](self, "_layoutSemanticStyleMaskedBadges");
    if (v52)
    {
      v110 = v120;
      v111 = v121;
      v112 = v122;
      v113 = v123;
      v58 = v118;
      v59 = v119;
    }
    else
    {
      v110 = *(_OWORD *)&CAMViewGeometryZero[32];
      v111 = *(_OWORD *)&CAMViewGeometryZero[48];
      v112 = *(_OWORD *)&CAMViewGeometryZero[64];
      v113 = *(_OWORD *)&CAMViewGeometryZero[80];
      v58 = *(_OWORD *)CAMViewGeometryZero;
      v59 = *(_OWORD *)&CAMViewGeometryZero[16];
    }
    v108 = v58;
    v109 = v59;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    -[CAMFullscreenViewfinder _createdPrimaryInstructionLabels](self, "_createdPrimaryInstructionLabels");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v161, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v100;
      do
      {
        for (j = 0; j != v62; ++j)
        {
          if (*(_QWORD *)v100 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
          v94 = *(_OWORD *)&CAMViewGeometryZero[32];
          v95 = *(_OWORD *)&CAMViewGeometryZero[48];
          v96 = *(_OWORD *)&CAMViewGeometryZero[64];
          v97 = *(_OWORD *)&CAMViewGeometryZero[80];
          v92 = *(_OWORD *)CAMViewGeometryZero;
          v93 = *(_OWORD *)&CAMViewGeometryZero[16];
          v88 = v110;
          v89 = v111;
          v90 = v112;
          v91 = v113;
          v86 = v108;
          v87 = v109;
          -[CAMFullscreenViewfinder _geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:](self, "_geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:", v65, &v92, &v86);
          CAMViewSetGeometry(v65, (uint64_t)v98);
        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v161, 16);
      }
      while (v62);
    }

    -[CAMFullscreenViewfinder _visibleInstructionLabelForInstructionLabelValue:](self, "_visibleInstructionLabelForInstructionLabelValue:", -[CAMFullscreenViewfinder visibleInstructionLabel](self, "visibleInstructionLabel"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    CAMViewGetGeometry(v66, (uint64_t)&v92);
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    -[CAMFullscreenViewfinder _createdSecondaryInstructionLabels](self, "_createdSecondaryInstructionLabels");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v82, v160, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v83;
      do
      {
        for (k = 0; k != v69; ++k)
        {
          if (*(_QWORD *)v83 != v70)
            objc_enumerationMutation(v67);
          v72 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
          v88 = v94;
          v89 = v95;
          v90 = v96;
          v91 = v97;
          v86 = v92;
          v87 = v93;
          v80[2] = v110;
          v80[3] = v111;
          v80[4] = v112;
          v80[5] = v113;
          v80[0] = v108;
          v80[1] = v109;
          -[CAMFullscreenViewfinder _geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:](self, "_geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:", v72, &v86, v80);
          CAMViewSetGeometry(v72, (uint64_t)v81);
        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v82, v160, 16);
      }
      while (v69);
    }

    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v5);
  }
}

void __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  if (*(_BYTE *)(a1 + 232))
  {
    objc_msgSend(*(id *)(a1 + 32), "smartStyleSlider2D");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_OWORD *)(a1 + 88);
    v13 = *(_OWORD *)(a1 + 72);
    v14 = v4;
    v5 = *(_OWORD *)(a1 + 120);
    v15 = *(_OWORD *)(a1 + 104);
    v16 = v5;
    v6 = *(_OWORD *)(a1 + 56);
    v11 = *(_OWORD *)(a1 + 40);
    v12 = v6;
    CAMViewSetGeometry(v3, (uint64_t)&v11);

  }
  if (*(_BYTE *)(a1 + 233))
  {
    objc_msgSend(*(id *)(a1 + 32), "smartStyleIntensitySlider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)(a1 + 184);
    v13 = *(_OWORD *)(a1 + 168);
    v14 = v8;
    v9 = *(_OWORD *)(a1 + 216);
    v15 = *(_OWORD *)(a1 + 200);
    v16 = v9;
    v10 = *(_OWORD *)(a1 + 152);
    v11 = *(_OWORD *)(a1 + 136);
    v12 = v10;
    CAMViewSetGeometry(v7, (uint64_t)&v11);

  }
}

uint64_t __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setOrientation:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  objc_msgSend(*(id *)(a1 + 32), "textInteractionInsert");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "_geometryForTextInteractionInsertWithViewport:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
  }
  CAMViewSetGeometry(v2, (uint64_t)&v7);
  objc_msgSend(v2, "layoutIfNeeded");
  v4 = *(_QWORD *)(a1 + 80);
  switch(v4)
  {
    case 1:
      v5 = 0.0;
      break;
    case 3:
      v5 = 1.57079633;
      break;
    case 4:
      v5 = -1.57079633;
      break;
    default:
      v5 = 3.14159265;
      if (v4 != 2)
        v5 = 0.0;
      break;
  }
  objc_msgSend(*(id *)(a1 + 40), "setGlyphRotation:", v5, v7, v8, v9, v10, v11, v12);
  objc_msgSend(v2, "actionInfoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_frameForActionInfoView");
    objc_msgSend(v6, "setFrame:");
  }
  objc_msgSend(*(id *)(a1 + 32), "_applyTextInsertContentInsets");

}

- (void)setDeviceOrientation:(int64_t)a3
{
  -[CAMFullscreenViewfinder setDeviceOrientation:animated:](self, "setDeviceOrientation:animated:", a3, 0);
}

- (void)setDeviceOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v7;
  id v8;

  if (self->_deviceOrientation != a3)
  {
    v4 = a4;
    self->_deviceOrientation = a3;
    -[CAMFullscreenViewfinder _orientationInstructionView](self, "_orientationInstructionView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v4 && -[CAMFullscreenViewfinder isOrientationInstructionVisible](self, "isOrientationInstructionVisible");
    objc_msgSend(v8, "setOrientation:animated:", a3, v7);

  }
}

- (void)setShutterControlVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setShutterControlVisible:animated:](self, "setShutterControlVisible:animated:", a3, 0);
}

- (void)setShutterControlVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shutterControlVisible != a3)
  {
    self->_shutterControlVisible = a3;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", a4);
  }
}

- (void)setFlipButtonVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setFlipButtonVisible:animated:](self, "setFlipButtonVisible:animated:", a3, 0);
}

- (void)setFlipButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_flipButtonVisible != a3)
  {
    self->_flipButtonVisible = a3;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", a4);
  }
}

- (void)setPhotoVideoModeSwitchVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setPhotoVideoModeSwitchVisible:animated:](self, "setPhotoVideoModeSwitchVisible:animated:", a3, 0);
}

- (void)setPhotoVideoModeSwitchVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_photoVideoModeSwitchVisible != a3)
  {
    self->_photoVideoModeSwitchVisible = a3;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", a4);
  }
}

- (void)setSystemOverlayVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setSystemOverlayVisible:animated:](self, "setSystemOverlayVisible:animated:", a3, 0);
}

- (void)setSystemOverlayVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_systemOverlayVisible != a3)
  {
    self->_systemOverlayVisible = a3;
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", a4);
  }
}

- (void)setZoomControlVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setZoomControlVisible:animated:](self, "setZoomControlVisible:animated:", a3, 0);
}

- (void)setZoomControlVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_zoomControlVisible != a3)
  {
    v4 = a4;
    if (a4)
      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    self->_zoomControlVisible = a3;
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v4);
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);
  }
}

- (void)setZoomStyle:(unint64_t)a3
{
  void *v4;
  CAMZoomSlider *v5;
  void *v6;
  void *v7;
  CAMZoomControl *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_zoomStyle != a3)
  {
    self->_zoomStyle = a3;
    if (a3 == 1)
    {
      v8 = -[CAMZoomControl initWithLayoutStyle:]([CAMZoomControl alloc], "initWithLayoutStyle:", 4);
      -[CAMFullscreenViewfinder _setZoomControl:](self, "_setZoomControl:", v8);

      self->_zoomControlVisible = 1;
      -[CAMFullscreenViewfinder _contentViewBelowShutter](self, "_contentViewBelowShutter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMFullscreenViewfinder zoomControl](self, "zoomControl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);

    }
    else
    {
      if (a3 == 2)
      {
        -[CAMFullscreenViewfinder zoomControl](self, "zoomControl");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeFromSuperview");

        -[CAMFullscreenViewfinder _setZoomControl:](self, "_setZoomControl:", 0);
        v5 = -[CAMZoomSlider initWithLayoutStyle:]([CAMZoomSlider alloc], "initWithLayoutStyle:", 0);
        -[CAMFullscreenViewfinder _setZoomSlider:](self, "_setZoomSlider:", v5);

        -[CAMFullscreenViewfinder _contentView](self, "_contentView");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        -[CAMFullscreenViewfinder zoomSlider](self, "zoomSlider");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMFullscreenViewfinder _modeClippingView](self, "_modeClippingView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "insertSubview:belowSubview:", v6, v7);

        return;
      }
      -[CAMFullscreenViewfinder zoomControl](self, "zoomControl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      -[CAMFullscreenViewfinder _setZoomControl:](self, "_setZoomControl:", 0);
    }
    -[CAMFullscreenViewfinder zoomSlider](self, "zoomSlider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[CAMFullscreenViewfinder _setZoomSlider:](self, "_setZoomSlider:", 0);
  }
}

- (void)setVisiblePreviewSuggestionButton:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  CAMSpatialCaptureButton *v9;

  if (self->_visibleSuggestionButtonType != a3)
  {
    v4 = a4;
    self->_visibleSuggestionButtonType = a3;
    -[CAMFullscreenViewfinder _previewSuggestionButton](self, "_previewSuggestionButton");
    v9 = (CAMSpatialCaptureButton *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_13:
      -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);

      return;
    }
    switch(a3)
    {
      case 3:
        v9 = objc_alloc_init(CAMSpatialCaptureButton);
        -[CAMFullscreenViewfinder _setSpatialCaptureButton:](self, "_setSpatialCaptureButton:");
        -[CAMFullscreenViewfinder delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fullscreenViewfinderDidCreateSpatialCaptureButton:", self);
        break;
      case 2:
        v9 = objc_alloc_init(CAMDepthEffectSuggestionButton);
        -[CAMFullscreenViewfinder _setDepthEffectSuggestionButton:](self, "_setDepthEffectSuggestionButton:");
        -[CAMFullscreenViewfinder delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fullscreenViewfinderDidCreateDepthEffectSuggestionButton:", self);
        break;
      case 1:
        v9 = objc_alloc_init(CAMAutoMacroButton);
        -[CAMFullscreenViewfinder _setAutoMacroButton:](self, "_setAutoMacroButton:");
        -[CAMFullscreenViewfinder delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fullscreenViewfinderDidCreateAutoMacroButton:", self);
        break;
      default:
        v9 = 0;
LABEL_11:
        -[CAMCircleButton setOrientation:](v9, "setOrientation:", -[CAMFullscreenViewfinder orientation](self, "orientation"));
        -[CAMFullscreenViewfinder _contentView](self, "_contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", v9);

        if (v4)
          -[CAMSpatialCaptureButton setAlpha:](v9, "setAlpha:", 0.0);
        goto LABEL_13;
    }

    goto LABEL_11;
  }
}

- (CAMCircleButton)_previewSuggestionButton
{
  int64_t v3;
  void *v4;

  v3 = -[CAMFullscreenViewfinder visibleSuggestionButtonType](self, "visibleSuggestionButtonType");
  switch(v3)
  {
    case 3:
      -[CAMFullscreenViewfinder spatialCaptureButton](self, "spatialCaptureButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[CAMFullscreenViewfinder depthEffectSuggestionButton](self, "depthEffectSuggestionButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[CAMFullscreenViewfinder autoMacroButton](self, "autoMacroButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return (CAMCircleButton *)v4;
}

- (void)setElapsedTimeViewVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setElapsedTimeViewVisible:animated:](self, "setElapsedTimeViewVisible:animated:", a3, 0);
}

- (void)setElapsedTimeViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  CAMElapsedTimeView *v8;
  CAMElapsedTimeView *elapsedTimeView;
  void *v10;
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
  CAMElapsedTimeView *v21;
  int64_t v22;
  _BOOL8 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  if (self->_elapsedTimeViewVisible != a3)
  {
    v4 = a4;
    if (a3)
    {
      -[CAMFullscreenViewfinder elapsedTimeView](self, "elapsedTimeView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = objc_alloc_init(CAMElapsedTimeView);
        elapsedTimeView = self->_elapsedTimeView;
        self->_elapsedTimeView = v8;

        -[CAMFullscreenViewfinder _modulatingContentView](self, "_modulatingContentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", self->_elapsedTimeView);

        if (v4)
          -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", 0);
      }
      -[CAMFullscreenViewfinder _frameForReticleViewport](self, "_frameForReticleViewport");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[CAMFullscreenViewfinder elapsedTimeView](self, "elapsedTimeView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMFullscreenViewfinder _layout](self, "_layout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_elapsedTimeView;
      v22 = -[CAMFullscreenViewfinder orientation](self, "orientation");
      v23 = -[CAMFullscreenViewfinder isSystemOverlayVisible](self, "isSystemOverlayVisible");
      if (v20)
      {
        objc_msgSend(v20, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v21, v22, v23, v12, v14, v16, v18);
      }
      else
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
      }
      CAMViewSetGeometry(v19, (uint64_t)&v24);

    }
    if (v4)
      -[CAMFullscreenViewfinder layoutIfNeeded](self, "layoutIfNeeded");
    self->_elapsedTimeViewVisible = a3;
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v4, v24, v25, v26, v27, v28, v29);
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);
  }
}

- (void)setTimerIndicatorVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setTimerIndicatorVisible:animated:](self, "setTimerIndicatorVisible:animated:", a3, 0);
}

- (void)setTimerIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  CAMTimerIndicatorView *v8;

  if (self->_timerIndicatorVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    -[CAMFullscreenViewfinder timerIndicator](self, "timerIndicator");
    v8 = (CAMTimerIndicatorView *)objc_claimAutoreleasedReturnValue();
    if (!v8 && v5)
    {
      v8 = objc_alloc_init(CAMTimerIndicatorView);
      -[CAMTimerIndicatorView setOrientation:animated:](v8, "setOrientation:animated:", -[CAMFullscreenViewfinder orientation](self, "orientation"), 0);
      -[CAMFullscreenViewfinder _contentView](self, "_contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v8);

      -[CAMFullscreenViewfinder _setTimerIndicator:](self, "_setTimerIndicator:", v8);
      if (v4)
        -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", 0);
    }
    self->_timerIndicatorVisible = v5;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);

  }
}

- (void)setPreviewAlignmentGuideVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setPreviewAlignmentGuideVisible:animated:](self, "setPreviewAlignmentGuideVisible:animated:", a3, 0);
}

- (void)setPreviewAlignmentGuideVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CAMPreviewAlignmentGuide *v7;
  void *v8;

  if (self->_previewAlignmentGuideVisible != a3)
  {
    v4 = a4;
    if (a3 && !self->_previewAlignmentGuide)
    {
      v7 = objc_alloc_init(CAMPreviewAlignmentGuide);
      -[CAMFullscreenViewfinder _setPreviewAlignmentGuide:](self, "_setPreviewAlignmentGuide:", v7);
      -[CAMFullscreenViewfinder _contentView](self, "_contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v7);

      if (v4)
        -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", 0);

    }
    self->_previewAlignmentGuideVisible = a3;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);
  }
}

- (void)setLegibilityBackgroundsVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setLegibilityBackgroundsVisible:animated:](self, "setLegibilityBackgroundsVisible:animated:", a3, 0);
}

- (void)setLegibilityBackgroundsVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  if (self->_legibilityBackgroundsVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    -[CAMFullscreenViewfinder _bottomLegibilityBackground](self, "_bottomLegibilityBackground");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v5 && !v7)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v8);

      -[CAMFullscreenViewfinder _frameForBottomLegibilityBackground](self, "_frameForBottomLegibilityBackground");
      objc_msgSend(v9, "setFrame:");
      -[CAMFullscreenViewfinder _setBottomLegibilityBackground:](self, "_setBottomLegibilityBackground:", v9);
      -[CAMFullscreenViewfinder _insertBackgroundSubview:](self, "_insertBackgroundSubview:", v9);
      if (v4)
        -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", 0);
      v7 = (uint64_t)v9;
    }
    v10 = (id)v7;
    self->_legibilityBackgroundsVisible = v5;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);

  }
}

- (void)setSharedLibraryImageWellIndicatorVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setSharedLibraryImageWellIndicatorVisible:animated:](self, "setSharedLibraryImageWellIndicatorVisible:animated:", a3, 0);
}

- (void)setSharedLibraryImageWellIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  CAMSharedLibraryImageWellIndicatorView *v7;
  void *v8;
  CAMSharedLibraryImageWellIndicatorView *v9;

  if (self->_sharedLibraryImageWellIndicatorVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    -[CAMFullscreenViewfinder sharedLibraryImageWellIndicatorView](self, "sharedLibraryImageWellIndicatorView");
    v9 = (CAMSharedLibraryImageWellIndicatorView *)objc_claimAutoreleasedReturnValue();
    if (!v9 && v5)
    {
      v7 = [CAMSharedLibraryImageWellIndicatorView alloc];
      v9 = -[CAMSharedLibraryImageWellIndicatorView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CAMInstructionLabel setDelegate:](v9, "setDelegate:", self);
      -[CAMFullscreenViewfinder _contentView](self, "_contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      -[CAMFullscreenViewfinder _setSharedLibraryImageWellIndicatorView:](self, "_setSharedLibraryImageWellIndicatorView:", v9);
      if (v4)
        -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", 0);
    }
    self->_sharedLibraryImageWellIndicatorVisible = v5;
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);

  }
}

- (void)setPreviewView:(id)a3
{
  CAMPreviewView *v5;
  CAMPreviewView **p_previewView;
  CAMPreviewView *previewView;
  CAMFullscreenViewfinder *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CAMPreviewView *v14;

  v5 = (CAMPreviewView *)a3;
  p_previewView = &self->_previewView;
  previewView = self->_previewView;
  if (previewView != v5)
  {
    v14 = v5;
    -[CAMPreviewView superview](previewView, "superview");
    v8 = (CAMFullscreenViewfinder *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CAMPreviewView removeFromSuperview](*p_previewView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_previewView, a3);
    v9 = -[CAMFullscreenViewfinder interfaceModulation](self, "interfaceModulation");
    -[CAMPreviewView indicatorContainerView](*p_previewView, "indicatorContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInterfaceModulation:", v9);

    -[CAMPreviewView videoPreviewLayer](v14, "videoPreviewLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    -[CAMFullscreenViewfinder _setOverCapturePreviewLayer:](self, "_setOverCapturePreviewLayer:", v12);
    -[CAMFullscreenViewfinder _previewContainerView](self, "_previewContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    v5 = v14;
  }

}

- (void)setPanoramaView:(id)a3
{
  CAMPanoramaView *v5;
  CAMPanoramaView *panoramaView;
  CAMFullscreenViewfinder *v7;
  CAMFullscreenModeSelector *modeSelector;
  void *v9;
  void *v10;
  void *v11;
  CAMPanoramaView *v12;

  v5 = (CAMPanoramaView *)a3;
  panoramaView = self->_panoramaView;
  if (panoramaView != v5)
  {
    v12 = v5;
    -[CAMPanoramaView superview](panoramaView, "superview");
    v7 = (CAMFullscreenViewfinder *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[CAMPanoramaView removeFromSuperview](self->_panoramaView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_panoramaView, a3);
    modeSelector = self->_modeSelector;
    -[CAMFullscreenViewfinder _modulatingContentView](self, "_modulatingContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (modeSelector)
    {
      -[CAMFullscreenViewfinder modeSelector](self, "modeSelector");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:belowSubview:", v12, v11);

    }
    else
    {
      objc_msgSend(v9, "addSubview:", v12);
    }

    v5 = v12;
  }

}

- (void)setPanoramaCaptureSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;

  height = a3.height;
  width = a3.width;
  -[CAMFullscreenViewfinder panoramaView](self, "panoramaView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPanoramaCaptureSize:", width, height);

  -[CAMFullscreenViewfinder setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)panoramaCaptureSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CAMFullscreenViewfinder panoramaView](self, "panoramaView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "panoramaCaptureSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setTrueVideoState:(unint64_t)a3
{
  __CFString *v3;
  NSObject *v4;
  int v5;
  __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_trueVideoState != a3)
  {
    self->_trueVideoState = a3;
    if (a3 > 3)
      v3 = 0;
    else
      v3 = off_1EA328AD8[a3];
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "True Video state updated to: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)setDescriptionOverlayView:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  CAMFullscreenViewfinder *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CAMFullscreenViewfinder _descriptionOverlayViewByKey](self, "_descriptionOverlayViewByKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v10)
  {
    objc_msgSend(v8, "superview");
    v9 = (CAMFullscreenViewfinder *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      objc_msgSend(v8, "removeFromSuperview");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v6);
    objc_msgSend(v10, "setOrientation:", -[CAMFullscreenViewfinder orientation](self, "orientation"));
    objc_msgSend(v10, "setBlackoutFrameVisible:", 0);
    -[CAMFullscreenViewfinder _insertBackgroundSubview:](self, "_insertBackgroundSubview:", v10);
  }

}

- (id)descriptionOverlayViewForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAMFullscreenViewfinder _descriptionOverlayViewByKey](self, "_descriptionOverlayViewByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDisabledModeOverlayView:(id)a3
{
  CAMDisabledModeOverlayView *v5;
  CAMDisabledModeOverlayView **p_disabledModeOverlayView;
  CAMDisabledModeOverlayView *disabledModeOverlayView;
  CAMFullscreenViewfinder *v8;
  CAMDisabledModeOverlayView *v9;

  v5 = (CAMDisabledModeOverlayView *)a3;
  p_disabledModeOverlayView = &self->_disabledModeOverlayView;
  disabledModeOverlayView = self->_disabledModeOverlayView;
  if (disabledModeOverlayView != v5)
  {
    v9 = v5;
    -[CAMDisabledModeOverlayView superview](disabledModeOverlayView, "superview");
    v8 = (CAMFullscreenViewfinder *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CAMDisabledModeOverlayView removeFromSuperview](*p_disabledModeOverlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_disabledModeOverlayView, a3);
    -[CAMDisabledModeOverlayView setOrientation:](*p_disabledModeOverlayView, "setOrientation:", -[CAMFullscreenViewfinder orientation](self, "orientation"));
    -[CAMFullscreenViewfinder _insertBackgroundSubview:](self, "_insertBackgroundSubview:", v9);
    v5 = v9;
  }

}

- (void)setMaterial:(int64_t)a3
{
  -[CAMFullscreenViewfinder setMaterial:withDuration:](self, "setMaterial:withDuration:", a3, 0.0);
}

- (void)setMaterial:(int64_t)a3 withDuration:(double)a4
{
  void *v7;
  void *v8;
  void *v9;

  if (self->_material != a3)
  {
    self->_material = a3;
    -[CAMFullscreenViewfinder _reticleView](self, "_reticleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaterial:withDuration:", a3, a4);

    -[CAMFullscreenViewfinder semanticStylePicker](self, "semanticStylePicker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaterial:withDuration:", a3, a4);

    -[CAMFullscreenViewfinder smartStylePicker](self, "smartStylePicker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaterial:withDuration:", a3, a4);

    -[CAMFullscreenViewfinder _updateLightingControlClipping](self, "_updateLightingControlClipping");
  }
}

- (unint64_t)interfaceModulation
{
  void *v2;
  unint64_t v3;

  -[CAMFullscreenViewfinder _modulatingContentView](self, "_modulatingContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interfaceModulation");

  return v3;
}

- (void)setInterfaceModulation:(unint64_t)a3
{
  -[CAMFullscreenViewfinder setInterfaceModulation:animated:](self, "setInterfaceModulation:animated:", a3, 0);
}

- (void)setInterfaceModulation:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v4 = a4;
  -[CAMFullscreenViewfinder _modulatingContentView](self, "_modulatingContentView");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3 - 1 <= 1 && !v7)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAMFullscreenViewfinder setInterfaceModulation:animated:].cold.1((uint64_t)self, v9);

  }
  objc_msgSend(v8, "setInterfaceModulation:animated:", a3, v4);
  -[CAMFullscreenViewfinder previewView](self, "previewView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indicatorContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterfaceModulation:animated:", a3, v4);

}

- (void)setImageAnalysisButtonVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setImageAnalysisButtonVisible:animated:](self, "setImageAnalysisButtonVisible:animated:", a3, 0);
}

- (void)setImageAnalysisButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  if (self->_imageAnalysisButtonVisible != a3)
  {
    v4 = a4;
    self->_imageAnalysisButtonVisible = a3;
    -[CAMFullscreenViewfinder imageAnalysisButton](self, "imageAnalysisButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);
  }
}

- (void)setImageAnalysisButton:(id)a3
{
  CAMFullscreenViewfinder *v5;
  id *p_imageAnalysisButton;
  id imageAnalysisButton;
  CAMFullscreenViewfinder *v8;
  CAMFullscreenViewfinder *v9;
  id v10;
  id v11;

  v11 = a3;
  v5 = self;
  p_imageAnalysisButton = (id *)&v5->_imageAnalysisButton;
  imageAnalysisButton = v5->_imageAnalysisButton;
  if (imageAnalysisButton == v11)
  {
    objc_msgSend(v11, "superview");
    v8 = (CAMFullscreenViewfinder *)objc_claimAutoreleasedReturnValue();

    if (v8 == v5)
      goto LABEL_9;
    imageAnalysisButton = *p_imageAnalysisButton;
  }
  objc_msgSend(imageAnalysisButton, "superview");
  v9 = (CAMFullscreenViewfinder *)objc_claimAutoreleasedReturnValue();
  if (v9 == v5)
  {
    v10 = *p_imageAnalysisButton;

    if (v10 != v11)
      objc_msgSend(*p_imageAnalysisButton, "removeFromSuperview");
  }
  else
  {

  }
  objc_storeStrong(p_imageAnalysisButton, a3);
  objc_msgSend(*p_imageAnalysisButton, "setCameraModeBackgroundColor:", objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5));
  -[CAMFullscreenViewfinder addSubview:](v5, "addSubview:", v11);
  -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](v5, "_updateSubviewsVisibilityAnimated:", 0);
LABEL_9:

}

- (void)setExternalStorageButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  if (self->_externalStorageButtonVisible != a3)
  {
    v4 = a4;
    self->_externalStorageButtonVisible = a3;
    if (a3)
    {
      -[CAMFullscreenViewfinder externalStorageButton](self, "externalStorageButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        -[CAMFullscreenViewfinder _createExternalStorageButton](self, "_createExternalStorageButton");
    }
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v4);
  }
}

- (void)setExternalStorageButtonVisible:(BOOL)a3
{
  -[CAMFullscreenViewfinder setExternalStorageButtonVisible:animated:](self, "setExternalStorageButtonVisible:animated:", a3, 0);
}

- (void)_createExternalStorageButton
{
  CAMExternalStorageButton *v3;
  CAMExternalStorageButton *v4;
  CAMExternalStorageButton *externalStorageButton;
  CAMExternalStorageButton *v6;
  void *v7;
  id v8;

  v3 = [CAMExternalStorageButton alloc];
  v4 = -[CAMExternalStorageButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  externalStorageButton = self->_externalStorageButton;
  self->_externalStorageButton = v4;
  v6 = v4;

  -[CAMFullscreenViewfinder _contentView](self, "_contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  -[CAMFullscreenViewfinder delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullscreenViewfinderDidCreateExternalStorageButton:", self);

}

- (void)setTextInteractionInsert:(id)a3
{
  VKTextLiftingView *v4;
  VKTextLiftingView *textInteractionInsert;
  CAMFullscreenViewfinder *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (VKTextLiftingView *)a3;
  textInteractionInsert = self->_textInteractionInsert;
  if (textInteractionInsert != v4)
  {
    -[VKTextLiftingView removeFromSuperview](textInteractionInsert, "removeFromSuperview");
    self->_textInteractionInsert = v4;
    v6 = self;
    -[CAMFullscreenViewfinder imageAnalysisButton](v6, "imageAnalysisButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CAMFullscreenViewfinder insertSubview:belowSubview:](v6, "insertSubview:belowSubview:", v4, v7);
      -[CAMFullscreenViewfinder _frameForReticleViewport](v6, "_frameForReticleViewport");
      -[CAMFullscreenViewfinder _geometryForTextInteractionInsertWithViewport:](v6, "_geometryForTextInteractionInsertWithViewport:");
      CAMViewSetGeometry(v4, (uint64_t)&v9);
      objc_msgSend(v7, "backgroundDiameter");
      -[VKTextLiftingView setPreferredQuickActionButtonHeight:](v4, "setPreferredQuickActionButtonHeight:");
      -[VKTextLiftingView actionInfoView](v4, "actionInfoView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[CAMFullscreenViewfinder _frameForActionInfoView](v6, "_frameForActionInfoView");
        objc_msgSend(v8, "setFrame:");
      }
      -[CAMFullscreenViewfinder _applyTextInsertContentInsets](v6, "_applyTextInsertContentInsets");

    }
  }

}

- (void)adoptMachineReadableCodeButton:(id)a3 fromOriginalParent:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  CAMFullscreenViewfinder *v18;
  _QWORD v19[5];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[CAMFullscreenViewfinder machineReadableCodeButton](self, "machineReadableCodeButton");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if ((id)v10 == v8)
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CAMFullscreenViewfinder adoptMachineReadableCodeButton:fromOriginalParent:animated:].cold.1(v13, v14, v15);
  }
  else
  {
    if (v10)
      -[CAMFullscreenViewfinder dismissMachineReadableCodeButtonAnimated:](self, "dismissMachineReadableCodeButtonAnimated:", v5);
    -[CAMFullscreenViewfinder _setMachineReadableCodeButton:](self, "_setMachineReadableCodeButton:", v8);
    if (v9)
      v12 = v5;
    else
      v12 = 0;
    -[CAMFullscreenViewfinder _contentView](self, "_contentView");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "center");
      objc_msgSend(v9, "convertPoint:toView:", v13);
      objc_msgSend(v8, "setCenter:");
    }
    else if (v5)
    {
      objc_msgSend(v8, "setAlpha:", 0.0);
    }
    objc_msgSend(v8, "setDismissable:", 1);
    objc_msgSend(v8, "setDelegate:", self);
    -[NSObject addSubview:](v13, "addSubview:", v8);
    if (v12)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __86__CAMFullscreenViewfinder_adoptMachineReadableCodeButton_fromOriginalParent_animated___block_invoke;
      v19[3] = &unk_1EA328868;
      v19[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v19, 0, 0.5, 0.0, 1.0, 1.0);
    }
    else if (v5)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __86__CAMFullscreenViewfinder_adoptMachineReadableCodeButton_fromOriginalParent_animated___block_invoke_2;
      v16[3] = &unk_1EA328A40;
      v17 = v8;
      v18 = self;
      +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v16, 0.3);

    }
  }

}

uint64_t __86__CAMFullscreenViewfinder_adoptMachineReadableCodeButton_fromOriginalParent_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __86__CAMFullscreenViewfinder_adoptMachineReadableCodeButton_fromOriginalParent_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "_updateSubviewsVisibilityAnimated:", 0);
}

- (void)dismissMachineReadableCodeButtonAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  -[CAMFullscreenViewfinder machineReadableCodeButton](self, "machineReadableCodeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CAMFullscreenViewfinder _setMachineReadableCodeButton:](self, "_setMachineReadableCodeButton:", 0);
    if (v3)
      v6 = 0.3;
    else
      v6 = 0.0;
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__CAMFullscreenViewfinder_dismissMachineReadableCodeButtonAnimated___block_invoke;
    v13[3] = &unk_1EA328868;
    v14 = v5;
    v8 = v7;
    v9 = 3221225472;
    v10 = __68__CAMFullscreenViewfinder_dismissMachineReadableCodeButtonAnimated___block_invoke_2;
    v11 = &unk_1EA328A68;
    v12 = v14;
    +[CAMView animateIfNeededWithDuration:animations:completion:](CAMView, "animateIfNeededWithDuration:animations:completion:", v13, &v8, v6);
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v3, v8, v9, v10, v11);

  }
}

uint64_t __68__CAMFullscreenViewfinder_dismissMachineReadableCodeButtonAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __68__CAMFullscreenViewfinder_dismissMachineReadableCodeButtonAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)machineReadableCodeButtonDidTapDismiss:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[CAMFullscreenViewfinder machineReadableCodeButton](self, "machineReadableCodeButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Tapped to dismiss MRC button", v7, 2u);
    }

    -[CAMFullscreenViewfinder dismissMachineReadableCodeButtonAnimated:](self, "dismissMachineReadableCodeButtonAnimated:", 1);
  }
}

- (void)removeInflightBlurAnimations
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CAMFullscreenViewfinder _previewContainerView](self, "_previewContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v2, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "removeInflightBlurAnimations");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)prepareForResumingUsingCrossfade
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CAMFullscreenViewfinder _previewContainerView](self, "_previewContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v2, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "prepareForResumingUsingCrossfade");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)touchingRecognizersToCancel
{
  void *v2;
  void *v3;

  -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchingRecognizersToCancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_iterateViewsForHUDManager:(id)a3 withItemFoundBlock:(id)a4
{
  void (**v6)(id, void *);
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGPoint v30;
  CGRect v31;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(a3, "locationOfAccessibilityGestureInView:", self);
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFullscreenViewfinder controlStatusBar](self, "controlStatusBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  if (-[CAMFullscreenViewfinder isFlipButtonVisible](self, "isFlipButtonVisible"))
  {
    -[CAMFullscreenViewfinder flipButton](self, "flipButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  if (-[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer"))
  {
    -[CAMFullscreenViewfinder controlDrawer](self, "controlDrawer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

  }
  if (-[CAMFullscreenViewfinder _showModeView](self, "_showModeView"))
  {
    -[CAMFullscreenViewfinder modeDial](self, "modeDial");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v15);

  }
  -[CAMFullscreenViewfinder creativeCameraButton](self, "creativeCameraButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CAMFullscreenViewfinder creativeCameraButton](self, "creativeCameraButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v17);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v23, "bounds", (_QWORD)v24);
        -[CAMFullscreenViewfinder convertRect:fromView:](self, "convertRect:fromView:", v23);
        v30.x = v8;
        v30.y = v10;
        if (CGRectContainsPoint(v31, v30))
        {
          v6[2](v6, v23);
          goto LABEL_19;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_19:

}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__CAMFullscreenViewfinder_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_1EA328A90;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[CAMFullscreenViewfinder _iterateViewsForHUDManager:withItemFoundBlock:](self, "_iterateViewsForHUDManager:withItemFoundBlock:", v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __61__CAMFullscreenViewfinder_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "hudItemForAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__CAMFullscreenViewfinder_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_1EA328AB8;
  v7 = v4;
  v5 = v4;
  -[CAMFullscreenViewfinder _iterateViewsForHUDManager:withItemFoundBlock:](self, "_iterateViewsForHUDManager:withItemFoundBlock:", v5, v6);

}

uint64_t __61__CAMFullscreenViewfinder_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectedByAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
}

- (BOOL)shouldAccessibilityGestureBeginForHUDManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__CAMFullscreenViewfinder_shouldAccessibilityGestureBeginForHUDManager___block_invoke;
  v7[3] = &unk_1EA328A90;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[CAMFullscreenViewfinder _iterateViewsForHUDManager:withItemFoundBlock:](self, "_iterateViewsForHUDManager:withItemFoundBlock:", v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __72__CAMFullscreenViewfinder_shouldAccessibilityGestureBeginForHUDManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 != 0;
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "shouldAccessibilityGestureBeginForHUDManager:", *(_QWORD *)(a1 + 32));

}

- (CAMFullscreenViewfinderDelegate)delegate
{
  return (CAMFullscreenViewfinderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isControlDrawerAllowed
{
  return self->_controlDrawerAllowed;
}

- (BOOL)isModeUIAllowed
{
  return self->_modeUIAllowed;
}

- (BOOL)isControlDrawerExpanded
{
  return self->_controlDrawerExpanded;
}

- (void)setControlDrawerExpanded:(BOOL)a3
{
  self->_controlDrawerExpanded = a3;
}

- (BOOL)isShutterButtonVisible
{
  return self->_shutterControlVisible;
}

- (BOOL)isFlipButtonVisible
{
  return self->_flipButtonVisible;
}

- (BOOL)isZoomControlVisible
{
  return self->_zoomControlVisible;
}

- (unint64_t)zoomStyle
{
  return self->_zoomStyle;
}

- (BOOL)isElapsedTimeViewVisible
{
  return self->_elapsedTimeViewVisible;
}

- (BOOL)isTimerIndicatorVisible
{
  return self->_timerIndicatorVisible;
}

- (BOOL)isPreviewAlignmentGuideVisible
{
  return self->_previewAlignmentGuideVisible;
}

- (BOOL)isLegibilityBackgroundsVisible
{
  return self->_legibilityBackgroundsVisible;
}

- (BOOL)isSharedLibraryImageWellIndicatorVisible
{
  return self->_sharedLibraryImageWellIndicatorVisible;
}

- (BOOL)isModeSwitchVisible
{
  return self->_photoVideoModeSwitchVisible;
}

- (BOOL)isSystemOverlayVisible
{
  return self->_systemOverlayVisible;
}

- (int64_t)visibleInstructionLabel
{
  return self->_visibleInstructionLabel;
}

- (int64_t)visibleSecondaryInstructionLabel
{
  return self->_visibleSecondaryInstructionLabel;
}

- (void)setVisibleSecondaryInstructionLabel:(int64_t)a3
{
  self->_visibleSecondaryInstructionLabel = a3;
}

- (CAMPortraitModeInstructionLabel)portraitInstructionLabel
{
  return self->_portraitInstructionLabel;
}

- (void)_setPortraitInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_portraitInstructionLabel, a3);
}

- (CAMQRCodeInstructionLabel)qrCodeInstructionLabel
{
  return self->_qrCodeInstructionLabel;
}

- (void)_setQRCodeInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_qrCodeInstructionLabel, a3);
}

- (CAMFlashCompromisedInstructionLabel)flashCompromisedInstructionLabel
{
  return self->_flashCompromisedInstructionLabel;
}

- (void)_setFlashCompromisedInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_flashCompromisedInstructionLabel, a3);
}

- (CAMImageAnalysisInstructionLabel)imageAnalysisInstructionLabel
{
  return self->_imageAnalysisInstructionLabel;
}

- (void)_setImageAnalysisInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalysisInstructionLabel, a3);
}

- (CAMMaxRecordingTimeInstructionLabel)maxRecordingTimeInstructionLabel
{
  return self->_maxRecordingTimeInstructionLabel;
}

- (void)_setMaxRecordingTimeInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_maxRecordingTimeInstructionLabel, a3);
}

- (CAMFreeResourcesInstructionLabel)freeResourcesInstructionLabel
{
  return self->_freeResourcesInstructionLabel;
}

- (void)_setFreeResourcesInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_freeResourcesInstructionLabel, a3);
}

- (CAMSharedLibraryBadge)sharedLibraryInstructionLabel
{
  return self->_sharedLibraryInstructionLabel;
}

- (CAMDeviceTooHotInstructionLabel)deviceTooHotInstructionLabel
{
  return self->_deviceTooHotInstructionLabel;
}

- (void)_setDeviceTooHotInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceTooHotInstructionLabel, a3);
}

- (CAMPreviewView)previewView
{
  return self->_previewView;
}

- (int64_t)previewViewOrientation
{
  return self->_previewViewOrientation;
}

- (void)setPreviewViewOrientation:(int64_t)a3
{
  self->_previewViewOrientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (int64_t)material
{
  return self->_material;
}

- (CAMPreviewAlignmentGuide)previewAlignmentGuide
{
  return self->_previewAlignmentGuide;
}

- (void)_setPreviewAlignmentGuide:(id)a3
{
  objc_storeStrong((id *)&self->_previewAlignmentGuide, a3);
}

- (CAMSemanticStylePicker)semanticStylePicker
{
  return self->_semanticStylePicker;
}

- (CAMControlDrawer)controlDrawer
{
  return self->_controlDrawer;
}

- (void)_setControlDrawer:(id)a3
{
  objc_storeStrong((id *)&self->_controlDrawer, a3);
}

- (CAMDynamicShutterControl)shutterControl
{
  return self->_shutterControl;
}

- (CAMControlStatusBar)controlStatusBar
{
  return self->_controlStatusBar;
}

- (CAMBadgeTray)badgeTray
{
  return self->_badgeTray;
}

- (CAMModeDial)modeDial
{
  return self->_modeDial;
}

- (CAMModeIndicatorView)modeIndicator
{
  return self->_modeIndicator;
}

- (CAMFullscreenModeSelector)modeSelector
{
  return self->_modeSelector;
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (CAMPhotoVideoModeSwitch)photoVideoModeSwitch
{
  return self->_photoVideoModeSwitch;
}

- (CAMImageWell)imageWell
{
  return self->_imageWell;
}

- (CAMZoomControl)zoomControl
{
  return self->_zoomControl;
}

- (void)_setZoomControl:(id)a3
{
  objc_storeStrong((id *)&self->_zoomControl, a3);
}

- (CAMZoomSlider)zoomSlider
{
  return self->_zoomSlider;
}

- (void)_setZoomSlider:(id)a3
{
  objc_storeStrong((id *)&self->_zoomSlider, a3);
}

- (CAMElapsedTimeView)elapsedTimeView
{
  return self->_elapsedTimeView;
}

- (CAMTimerIndicatorView)timerIndicator
{
  return self->_timerIndicator;
}

- (void)_setTimerIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_timerIndicator, a3);
}

- (CAMPanoramaView)panoramaView
{
  return self->_panoramaView;
}

- (CAMCreativeCameraButton)creativeCameraButton
{
  return self->_creativeCameraButton;
}

- (CAMSharedLibraryImageWellIndicatorView)sharedLibraryImageWellIndicatorView
{
  return self->_sharedLibraryImageWellIndicatorView;
}

- (void)_setSharedLibraryImageWellIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryImageWellIndicatorView, a3);
}

- (CAMDisabledModeOverlayView)disabledModeOverlayView
{
  return self->_disabledModeOverlayView;
}

- (CAMFilterNameBadge)filterNameBadge
{
  return self->_filterNameBadge;
}

- (CAMSmartStyleNameBadge)smartStyleNameBadge
{
  return self->_smartStyleNameBadge;
}

- (PEPhotoStyleDPad)smartStyleSlider2D
{
  return self->_smartStyleSlider2D;
}

- (CEKColoredPaletteSlider)smartStyleIntensitySlider
{
  return self->_smartStyleIntensitySlider;
}

- (PEPhotoStyleValuesPlatterView)smartStyleValuesPlatterView
{
  return self->_smartStyleValuesPlatterView;
}

- (CAMSemanticStylePicker)smartStylePicker
{
  return self->_smartStylePicker;
}

- (BOOL)smartStyleControlsVisible
{
  return self->_smartStyleControlsVisible;
}

- (BOOL)wantsSmartStyleIntensitySlider
{
  return self->_wantsSmartStyleIntensitySlider;
}

- (BOOL)wantsSmartStyleResetButton
{
  return self->_wantsSmartStyleResetButton;
}

- (BOOL)wantsSmartStylePicker
{
  return self->_wantsSmartStylePicker;
}

- (CAMSmartStyleCategoryInstructionLabel)smartStyleCategoryInstructionLabel
{
  return self->_smartStyleCategoryInstructionLabel;
}

- (CAMSmartStyleStatusIndicator)spotlightSmartStyleStatusIndicator
{
  return self->_spotlightSmartStyleStatusIndicator;
}

- (BOOL)isOverlayStyleControlActive
{
  return self->_overlayStyleControlActive;
}

- (BOOL)isPortraitControlsAllowed
{
  return self->_portraitControlsAllowed;
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (CEKLightingControl)lightingControl
{
  return self->_lightingControl;
}

- (CEKLightingNameBadge)lightingNameBadge
{
  return self->_lightingNameBadge;
}

- (BOOL)lightingNameBadgesHidden
{
  return self->_lightingNameBadgesHidden;
}

- (int64_t)viewportAspectRatio
{
  return self->_viewportAspectRatio;
}

- (UILongPressGestureRecognizer)modeSelectorGestureRecognizer
{
  return self->_modeSelectorGestureRecognizer;
}

- (CAMImageAnalysisButton)imageAnalysisButton
{
  return self->_imageAnalysisButton;
}

- (BOOL)isImageAnalysisButtonVisible
{
  return self->_imageAnalysisButtonVisible;
}

- (VKTextLiftingView)textInteractionInsert
{
  return self->_textInteractionInsert;
}

- (CAMMachineReadableCodeButton)machineReadableCodeButton
{
  return self->_machineReadableCodeButton;
}

- (void)_setMachineReadableCodeButton:(id)a3
{
  objc_storeStrong((id *)&self->_machineReadableCodeButton, a3);
}

- (CAMExternalStorageButton)externalStorageButton
{
  return self->_externalStorageButton;
}

- (BOOL)isExternalStorageButtonVisible
{
  return self->_externalStorageButtonVisible;
}

- (CAMAutoMacroButton)autoMacroButton
{
  return self->_autoMacroButton;
}

- (void)_setAutoMacroButton:(id)a3
{
  objc_storeStrong((id *)&self->_autoMacroButton, a3);
}

- (CAMDepthEffectSuggestionButton)depthEffectSuggestionButton
{
  return self->_depthEffectSuggestionButton;
}

- (void)_setDepthEffectSuggestionButton:(id)a3
{
  objc_storeStrong((id *)&self->_depthEffectSuggestionButton, a3);
}

- (int64_t)visibleSuggestionButtonType
{
  return self->_visibleSuggestionButtonType;
}

- (void)setVisibleSuggestionButtonType:(int64_t)a3
{
  self->_visibleSuggestionButtonType = a3;
}

- (int64_t)spotlightControl
{
  return self->_spotlightControl;
}

- (CAMSpotlightControlPanel)spotlightControlPanel
{
  return self->_spotlightControlPanel;
}

- (void)_setSpotlightControlPanel:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightControlPanel, a3);
}

- (CAMSpatialCaptureButton)spatialCaptureButton
{
  return self->_spatialCaptureButton;
}

- (void)_setSpatialCaptureButton:(id)a3
{
  objc_storeStrong((id *)&self->_spatialCaptureButton, a3);
}

- (BOOL)isOrientationInstructionVisible
{
  return self->_orientationInstructionVisible;
}

- (BOOL)isOrientationInstructionBackgroundBlurred
{
  return self->_orientationInstructionBackgroundBlurred;
}

- (CAMSpatialCaptureRecordingIndicator)spatialCaptureRecordingIndicator
{
  return self->_spatialCaptureRecordingIndicator;
}

- (void)_setSpatialCaptureRecordingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_spatialCaptureRecordingIndicator, a3);
}

- (BOOL)isSpatialCaptureRecordingIndicatorVisible
{
  return self->_spatialCaptureRecordingIndicatorVisible;
}

- (CAMSpatialCaptureInstructionLabel)spatialCaptureInstructionLabel
{
  return self->_spatialCaptureInstructionLabel;
}

- (void)_setSpatialCaptureInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_spatialCaptureInstructionLabel, a3);
}

- (int64_t)stereoCaptureStatus
{
  return self->_stereoCaptureStatus;
}

- (BOOL)useHoldStillStereoLowLightInstruction
{
  return self->_useHoldStillStereoLowLightInstruction;
}

- (unint64_t)trueVideoState
{
  return self->_trueVideoState;
}

- (BOOL)useSlowerTrueVideoTransitionAnimationDuration
{
  return self->_useSlowerTrueVideoTransitionAnimationDuration;
}

- (void)setUseSlowerTrueVideoTransitionAnimationDuration:(BOOL)a3
{
  self->_useSlowerTrueVideoTransitionAnimationDuration = a3;
}

- (UIView)_previewContainerView
{
  return self->__previewContainerView;
}

- (UIView)_modeClippingView
{
  return self->__modeClippingView;
}

- (CAMViewfinderReticleView)_reticleView
{
  return self->__reticleView;
}

- (NSMutableDictionary)_badgesForSpotlightControls
{
  return self->__badgesForSpotlightControls;
}

- (UIView)_textInteractionBackground
{
  return self->__textInteractionBackground;
}

- (void)_setTextInteractionBackground:(id)a3
{
  objc_storeStrong((id *)&self->__textInteractionBackground, a3);
}

- (CAMLowLightInstructionLabel)_lowLightInstructionLabel
{
  return self->__lowLightInstructionLabel;
}

- (void)_setLowLightInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->__lowLightInstructionLabel, a3);
}

- (UIView)_bottomLegibilityBackground
{
  return self->__bottomLegibilityBackground;
}

- (void)_setBottomLegibilityBackground:(id)a3
{
  objc_storeStrong((id *)&self->__bottomLegibilityBackground, a3);
}

- (CAMFullscreenViewfinderLayout)_layout
{
  return self->__layout;
}

- (BOOL)_isUsingCreativeCameraControls
{
  return self->__usingCreativeCameraControls;
}

- (BOOL)_isControlDrawerPresentedModally
{
  return self->__controlDrawerPresentedModally;
}

- (void)_setControlDrawerPresentedModally:(BOOL)a3
{
  self->__controlDrawerPresentedModally = a3;
}

- (AVSpatialOverCaptureVideoPreviewLayer)_overCapturePreviewLayer
{
  return self->__overCapturePreviewLayer;
}

- (void)_setOverCapturePreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->__overCapturePreviewLayer, a3);
}

- (CEKAdditiveAnimator)_viewportAnimator
{
  return self->__viewportAnimator;
}

- (unint64_t)_inFlightLayoutAnimationCount
{
  return self->__inFlightLayoutAnimationCount;
}

- (void)set_inFlightLayoutAnimationCount:(unint64_t)a3
{
  self->__inFlightLayoutAnimationCount = a3;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (UIView)_contentViewBelowShutter
{
  return self->__contentViewBelowShutter;
}

- (CAMInterfaceModulationView)_modulatingContentView
{
  return self->__modulatingContentView;
}

- (NSMutableDictionary)_descriptionOverlayViewByKey
{
  return self->__descriptionOverlayViewByKey;
}

- (UIView)_contentClippingContainer
{
  return self->__contentClippingContainer;
}

- (NSMutableArray)_semanticStyleBadges
{
  return self->__semanticStyleBadges;
}

- (NSMutableDictionary)_instructionLabelByValue
{
  return self->__instructionLabelByValue;
}

- (NSMutableArray)_createdPrimaryInstructionLabels
{
  return self->__createdPrimaryInstructionLabels;
}

- (NSMutableArray)_createdSecondaryInstructionLabels
{
  return self->__createdSecondaryInstructionLabels;
}

- (CAMOrientationInstructionView)_orientationInstructionView
{
  return self->__orientationInstructionView;
}

- (void)_setOrientationInstructionView:(id)a3
{
  objc_storeStrong((id *)&self->__orientationInstructionView, a3);
}

- (UITapGestureRecognizer)_smartStylesDismissalTapGestureRecognizer
{
  return self->__smartStylesDismissalTapGestureRecognizer;
}

- (void)set_smartStylesDismissalTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__smartStylesDismissalTapGestureRecognizer, a3);
}

- (double)_trueVideoModeSwitchToCaptureAnimationDurationOverride
{
  return self->__trueVideoModeSwitchToCaptureAnimationDurationOverride;
}

- (double)_trueVideoModeSwitchFromCaptureAnimationDurationOverride
{
  return self->__trueVideoModeSwitchFromCaptureAnimationDurationOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__smartStylesDismissalTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__orientationInstructionView, 0);
  objc_storeStrong((id *)&self->__createdSecondaryInstructionLabels, 0);
  objc_storeStrong((id *)&self->__createdPrimaryInstructionLabels, 0);
  objc_storeStrong((id *)&self->__instructionLabelByValue, 0);
  objc_storeStrong((id *)&self->__semanticStyleBadges, 0);
  objc_storeStrong((id *)&self->__contentClippingContainer, 0);
  objc_storeStrong((id *)&self->__descriptionOverlayViewByKey, 0);
  objc_storeStrong((id *)&self->__modulatingContentView, 0);
  objc_storeStrong((id *)&self->__contentViewBelowShutter, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__viewportAnimator, 0);
  objc_storeStrong((id *)&self->__overCapturePreviewLayer, 0);
  objc_storeStrong((id *)&self->__layout, 0);
  objc_storeStrong((id *)&self->__bottomLegibilityBackground, 0);
  objc_storeStrong((id *)&self->__lowLightInstructionLabel, 0);
  objc_storeStrong((id *)&self->__textInteractionBackground, 0);
  objc_storeStrong((id *)&self->__badgesForSpotlightControls, 0);
  objc_storeStrong((id *)&self->__reticleView, 0);
  objc_storeStrong((id *)&self->__modeClippingView, 0);
  objc_storeStrong((id *)&self->__previewContainerView, 0);
  objc_storeStrong((id *)&self->_spatialCaptureInstructionLabel, 0);
  objc_storeStrong((id *)&self->_spatialCaptureRecordingIndicator, 0);
  objc_storeStrong((id *)&self->_spatialCaptureButton, 0);
  objc_storeStrong((id *)&self->_spotlightControlPanel, 0);
  objc_storeStrong((id *)&self->_depthEffectSuggestionButton, 0);
  objc_storeStrong((id *)&self->_autoMacroButton, 0);
  objc_storeStrong((id *)&self->_externalStorageButton, 0);
  objc_storeStrong((id *)&self->_machineReadableCodeButton, 0);
  objc_storeStrong((id *)&self->_imageAnalysisButton, 0);
  objc_storeStrong((id *)&self->_modeSelectorGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lightingNameBadge, 0);
  objc_storeStrong((id *)&self->_lightingControl, 0);
  objc_storeStrong((id *)&self->_spotlightSmartStyleStatusIndicator, 0);
  objc_storeStrong((id *)&self->_smartStyleCategoryInstructionLabel, 0);
  objc_storeStrong((id *)&self->_smartStylePicker, 0);
  objc_storeStrong((id *)&self->_smartStyleValuesPlatterView, 0);
  objc_storeStrong((id *)&self->_smartStyleIntensitySlider, 0);
  objc_storeStrong((id *)&self->_smartStyleSlider2D, 0);
  objc_storeStrong((id *)&self->_smartStyleNameBadge, 0);
  objc_storeStrong((id *)&self->_filterNameBadge, 0);
  objc_storeStrong((id *)&self->_disabledModeOverlayView, 0);
  objc_storeStrong((id *)&self->_sharedLibraryImageWellIndicatorView, 0);
  objc_storeStrong((id *)&self->_creativeCameraButton, 0);
  objc_storeStrong((id *)&self->_panoramaView, 0);
  objc_storeStrong((id *)&self->_timerIndicator, 0);
  objc_storeStrong((id *)&self->_elapsedTimeView, 0);
  objc_storeStrong((id *)&self->_zoomSlider, 0);
  objc_storeStrong((id *)&self->_zoomControl, 0);
  objc_storeStrong((id *)&self->_imageWell, 0);
  objc_storeStrong((id *)&self->_photoVideoModeSwitch, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_modeSelector, 0);
  objc_storeStrong((id *)&self->_modeIndicator, 0);
  objc_storeStrong((id *)&self->_modeDial, 0);
  objc_storeStrong((id *)&self->_badgeTray, 0);
  objc_storeStrong((id *)&self->_controlStatusBar, 0);
  objc_storeStrong((id *)&self->_shutterControl, 0);
  objc_storeStrong((id *)&self->_controlDrawer, 0);
  objc_storeStrong((id *)&self->_semanticStylePicker, 0);
  objc_storeStrong((id *)&self->_previewAlignmentGuide, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_deviceTooHotInstructionLabel, 0);
  objc_storeStrong((id *)&self->_sharedLibraryInstructionLabel, 0);
  objc_storeStrong((id *)&self->_freeResourcesInstructionLabel, 0);
  objc_storeStrong((id *)&self->_maxRecordingTimeInstructionLabel, 0);
  objc_storeStrong((id *)&self->_imageAnalysisInstructionLabel, 0);
  objc_storeStrong((id *)&self->_flashCompromisedInstructionLabel, 0);
  objc_storeStrong((id *)&self->_qrCodeInstructionLabel, 0);
  objc_storeStrong((id *)&self->_portraitInstructionLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)requestPreviewUpdateForSemanticStyleAnimated:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_1DB760000, a3, (uint64_t)a3, "Expecting a CAMSemanticStyle", a1);
}

- (void)setInterfaceModulation:(uint64_t)a1 animated:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Attempted to apply interface modulation to %{public}@ without configuring properly during initialization", (uint8_t *)&v5, 0xCu);

}

- (void)adoptMachineReadableCodeButton:(NSObject *)a1 fromOriginalParent:(uint64_t)a2 animated:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_1DB760000, a1, a3, "FSVF attempted to adopt its own MRC button.", v3);
}

@end
