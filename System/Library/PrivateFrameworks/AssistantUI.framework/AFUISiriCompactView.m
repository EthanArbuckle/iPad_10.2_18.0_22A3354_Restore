@implementation AFUISiriCompactView

+ (id)sharedSiriUISettingsDefaults
{
  if (sharedSiriUISettingsDefaults_onceToken_0 != -1)
    dispatch_once(&sharedSiriUISettingsDefaults_onceToken_0, &__block_literal_global_10);
  return (id)sharedSiriUISettingsDefaults_defaults_0;
}

void __51__AFUISiriCompactView_sharedSiriUISettingsDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.internal"));
  v1 = (void *)sharedSiriUISettingsDefaults_defaults_0;
  sharedSiriUISettingsDefaults_defaults_0 = v0;

}

- (AFUISiriCompactView)initWithFrame:(CGRect)a3 compactViewDelegate:(id)a4 edgeLightViewProvider:(id)a5 showsSensitiveUI:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  AFUISiriCompactView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AFUISiriCompactView;
  v15 = -[AFUISiriCompactView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v15)
  {
    v15->_saeEnabled = AFDeviceSupportsSystemAssistantExperience() & a6;
    v15->_remoteContentViewHidden = 0;
    v15->_lockViewHidden = 1;
    v15->_inFluidDismissal = 0;
    v15->_ignoreSiriSessionUpdates = 0;
    v15->_mode = 7;
    objc_storeWeak((id *)&v15->_compactViewDelegate, v13);
    v15->_shouldUpdatePowerLevel = 1;
    objc_storeWeak((id *)&v15->_edgeLightViewProvider, v14);
    +[AFUISiriCompactView sharedSiriUISettingsDefaults](AFUISiriCompactView, "sharedSiriUISettingsDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKey:", CFSTR("ForceOrbGraphic"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "intValue"))
      v15->_saeEnabled = 0;
    -[AFUISiriCompactView _setupContentViews](v15, "_setupContentViews");
    -[AFUISiriCompactView _setupBugReportButtonIfNeeded](v15, "_setupBugReportButtonIfNeeded");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v15, sel_keyboardWillShow_, *MEMORY[0x24BEBE580], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v15, sel_keyboardWillHide_, *MEMORY[0x24BEBE578], 0);

  }
  return v15;
}

- (AFUISiriCompactView)initWithFrame:(CGRect)a3 eyesFreeMode:(int64_t)a4 edgeLightViewProvider:(id)a5 showsSensitiveUI:(BOOL)a6
{
  AFUISiriCompactView *v7;
  AFUISiriCompactView *v8;

  v7 = -[AFUISiriCompactView initWithFrame:compactViewDelegate:edgeLightViewProvider:showsSensitiveUI:](self, "initWithFrame:compactViewDelegate:edgeLightViewProvider:showsSensitiveUI:", 0, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
    -[AFUISiriCompactView _setUpEyesFreePresentation:](v7, "_setUpEyesFreePresentation:", a4);
  return v8;
}

- (BOOL)shouldRequestStatusBar
{
  int64_t v3;

  v3 = -[AFUISiriEyesFreeView eyesFreeMode](self->_eyesFreeView, "eyesFreeMode");
  if (v3 != 1)
    LOBYTE(v3) = -[AFUISiriCompactView isBlurViewVisible](self, "isBlurViewVisible");
  return v3;
}

- (void)_orbButtonHeld:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "state");
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[AFUISiriCompactView _orbButtonHeld:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #OrbUIInteraction Mic Button Held State %@", (uint8_t *)&v11, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
  objc_msgSend(WeakRetained, "siriContentDidReceiveOrbTappedAction:", self);

  if (v4 == 1)
  {
    v10 = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    objc_msgSend(v10, "siriContentDidReceiveOrbHoldDidBeginAction:", self);
  }
  else
  {
    if ((unint64_t)(v4 - 3) > 1)
      return;
    v10 = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    objc_msgSend(v10, "siriContentDidReceiveOrbHoldDidEndAction:", self);
  }

}

- (void)setDockFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_dockFrame;
  UIView *orbViewContainer;
  AFUITouchInputView *touchInputView;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_dockFrame = &self->_dockFrame;
  if (!CGRectEqualToRect(self->_dockFrame, a3))
  {
    p_dockFrame->origin.x = x;
    p_dockFrame->origin.y = y;
    p_dockFrame->size.width = width;
    p_dockFrame->size.height = height;
    orbViewContainer = self->_orbViewContainer;
    -[AFUISiriCompactView _orbViewContainerFrame](self, "_orbViewContainerFrame");
    -[UIView setFrame:](orbViewContainer, "setFrame:");
    touchInputView = self->_touchInputView;
    -[UIView frame](self->_orbViewContainer, "frame");
    -[AFUITouchInputView setFrame:](touchInputView, "setFrame:");
  }
}

- (void)setInFluidDismissal:(BOOL)a3
{
  self->_inFluidDismissal = a3;
}

- (void)_setupContentViews
{
  AFUISiriCompactDimmingView *v3;
  AFUISiriCompactDimmingView *dimmingBackdropView;
  id v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *foregroundContainerView;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  UIView *blurringAndLockContainer;
  SiriUIBackgroundBlurViewController *v17;
  SiriUIBackgroundBlurViewController *fullScreenBlurViewController;
  void *v19;
  AFUIPasscodeContainerView *v20;
  AFUIPasscodeContainerView *lockContainerView;

  v3 = objc_alloc_init(AFUISiriCompactDimmingView);
  dimmingBackdropView = self->_dimmingBackdropView;
  self->_dimmingBackdropView = v3;

  -[AFUISiriCompactView addSubview:](self, "addSubview:", self->_dimmingBackdropView);
  v5 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[AFUISiriCompactView frame](self, "frame");
  v7 = v6;
  -[AFUISiriCompactView frame](self, "frame");
  v8 = (UIView *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7);
  foregroundContainerView = self->_foregroundContainerView;
  self->_foregroundContainerView = v8;

  -[AFUISiriCompactView addSubview:](self, "addSubview:", self->_foregroundContainerView);
  if (!self->_saeEnabled)
    -[AFUISiriCompactView _setupOrb](self, "_setupOrb");
  v10 = objc_alloc(MEMORY[0x24BEBDB00]);
  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v15 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], v12, v13, v14);
  blurringAndLockContainer = self->_blurringAndLockContainer;
  self->_blurringAndLockContainer = v15;

  -[UIView addSubview:](self->_foregroundContainerView, "addSubview:", self->_blurringAndLockContainer);
  v17 = (SiriUIBackgroundBlurViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BEA84E8]), "initWithDelegate:", self);
  fullScreenBlurViewController = self->_fullScreenBlurViewController;
  self->_fullScreenBlurViewController = v17;

  -[SiriUIBackgroundBlurViewController view](self->_fullScreenBlurViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCompactView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v19, self->_dimmingBackdropView);

  v20 = -[AFUIPasscodeContainerView initWithFrame:backdropView:mode:passcodeViewFactoryClass:]([AFUIPasscodeContainerView alloc], "initWithFrame:backdropView:mode:passcodeViewFactoryClass:", 0, self->_mode, objc_opt_class(), v11, v12, v13, v14);
  lockContainerView = self->_lockContainerView;
  self->_lockContainerView = v20;

  -[AFUIPasscodeContainerView setDelegate:](self->_lockContainerView, "setDelegate:", self);
  -[UIView addSubview:](self->_blurringAndLockContainer, "addSubview:", self->_lockContainerView);
  -[UIView setUserInteractionEnabled:](self->_blurringAndLockContainer, "setUserInteractionEnabled:", 0);
}

- (void)_setupOrb
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *orbViewContainer;
  double v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  SUICOrbView *v25;
  SUICOrbView *orbView;
  void *v27;
  AFUITouchInputView *v28;
  AFUITouchInputView *v29;
  AFUITouchInputView *touchInputView;
  AFUITouchInputView *v31;
  void *v32;
  void *v33;
  UILongPressGestureRecognizer *v34;
  UILongPressGestureRecognizer *longPressRecognizer;
  CGRect v36;

  -[AFUISiriCompactView _sizeForOrbViewContainer](self, "_sizeForOrbViewContainer");
  v4 = v3;
  v6 = v5;
  -[AFUISiriCompactView _sizeForOrbView](self, "_sizeForOrbView");
  v8 = v7;
  v10 = v9;
  -[AFUISiriCompactView _originXForOrbContainer](self, "_originXForOrbContainer");
  v12 = v11;
  -[AFUISiriCompactView frame](self, "frame");
  v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v12, CGRectGetHeight(v36) - v6 + -44.0, v4, v6);
  orbViewContainer = self->_orbViewContainer;
  self->_orbViewContainer = v13;

  -[UIView addSubview:](self->_foregroundContainerView, "addSubview:", self->_orbViewContainer);
  v15 = (v4 - v8) * 0.5;
  v16 = (v6 - v10) * 0.5;
  v17 = objc_alloc(MEMORY[0x24BEA85D8]);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19 < 2.0;
  v21 = ceil(v15);
  v22 = ceil(v16);
  v23 = ceil(v8);
  v24 = ceil(v10);
  if (!v20)
  {
    v21 = v15;
    v22 = v16;
    v23 = v8;
    v24 = v10;
  }
  v25 = (SUICOrbView *)objc_msgSend(v17, "initWithFrame:", v21, v22, v23, v24);
  orbView = self->_orbView;
  self->_orbView = v25;

  -[SUICOrbView layer](self->_orbView, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAllowsHitTesting:", 0);

  -[UIView addSubview:](self->_orbViewContainer, "addSubview:", self->_orbView);
  v28 = [AFUITouchInputView alloc];
  -[UIView frame](self->_orbViewContainer, "frame");
  v29 = -[AFUITouchInputView initWithFrame:](v28, "initWithFrame:");
  touchInputView = self->_touchInputView;
  self->_touchInputView = v29;

  v31 = self->_touchInputView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUITouchInputView setBackgroundColor:](v31, "setBackgroundColor:", v32);

  -[AFUITouchInputView layer](self->_touchInputView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHitTestsAsOpaque:", 1);

  -[AFUITouchInputView setDelegate:](self->_touchInputView, "setDelegate:", self);
  v34 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__orbButtonHeld_);
  longPressRecognizer = self->_longPressRecognizer;
  self->_longPressRecognizer = v34;

  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPressRecognizer, "setMinimumPressDuration:", 0.1);
  -[UILongPressGestureRecognizer setDelegate:](self->_longPressRecognizer, "setDelegate:", self);
  -[AFUITouchInputView addGestureRecognizer:](self->_touchInputView, "addGestureRecognizer:", self->_longPressRecognizer);
  -[UIView addSubview:](self->_foregroundContainerView, "addSubview:", self->_touchInputView);
}

- (double)_originXForOrbContainer
{
  int IsPad;
  void *v4;
  double v5;
  double v6;
  double Width;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v13;

  IsPad = SiriUIDeviceIsPad();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;
  -[AFUISiriCompactView frame](self, "frame");
  Width = CGRectGetWidth(v13);
  -[AFUISiriCompactView _sizeForOrbViewContainer](self, "_sizeForOrbViewContainer");
  v9 = (Width - v8) * 0.5;
  v10 = ceil(v9);
  if (v6 >= 2.0)
    v11 = v9;
  else
    v11 = v10;

  if (IsPad)
  {
    if ((SiriLanguageIsRTL() & 1) != 0)
      return 44.0;
    else
      return v11 + v11 + -44.0;
  }
  return v11;
}

- (void)requestBlurVisible:(BOOL)a3 reason:(int64_t)a4 fence:(id)a5
{
  id v8;
  id v9;
  id v10[2];
  BOOL v11;
  id location;

  v8 = a5;
  objc_initWeak(&location, self);
  objc_copyWeak(v10, &location);
  v9 = v8;
  v10[1] = (id)a4;
  v11 = a3;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

void __55__AFUISiriCompactView_requestBlurVisible_reason_fence___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  _QWORD v8[6];
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "windowScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 32));

    }
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 0.5;
    if (v6 == 4)
      v7 = 0.0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__AFUISiriCompactView_requestBlurVisible_reason_fence___block_invoke_2;
    v8[3] = &unk_24D7A3500;
    v9 = *(_BYTE *)(a1 + 56);
    v8[4] = v3;
    v8[5] = v6;
    objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v8, 0, v7, 0.0, 3.0, 1000.0, 500.0, 0.0);
  }

}

uint64_t __55__AFUISiriCompactView_requestBlurVisible_reason_fence___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "requestBackgroundBlurVisible:forReason:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)reduceOrbOpacity:(BOOL)a3
{
  double v3;
  double v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  AFUISiriCompactView *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  AFUISiriCompactView *v15;

  if (a3)
  {
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __40__AFUISiriCompactView_reduceOrbOpacity___block_invoke;
    v14 = &unk_24D7A1B30;
    v15 = self;
    v3 = 0.5;
    v4 = 0.0;
    v5 = &v11;
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __40__AFUISiriCompactView_reduceOrbOpacity___block_invoke_2;
    v9 = &unk_24D7A1B30;
    v10 = self;
    v4 = 0.2;
    v3 = 0.5;
    v5 = &v6;
  }
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 4, v5, 0, v3, v4, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t __40__AFUISiriCompactView_reduceOrbOpacity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.5);
}

uint64_t __40__AFUISiriCompactView_reduceOrbOpacity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 1.0);
}

- (void)_setupBugReportButtonIfNeeded
{
  _QWORD v3[4];
  id v4;
  id location;

  if (-[AFUISiriCompactView _shouldShowBugReportButton](self, "_shouldShowBugReportButton"))
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __52__AFUISiriCompactView__setupBugReportButtonIfNeeded__block_invoke;
    v3[3] = &unk_24D7A3550;
    objc_copyWeak(&v4, &location);
    -[AFUISiriCompactView _loadReportBugButtonTemplateImageInBackgroundWithCompletion:](self, "_loadReportBugButtonTemplateImageInBackgroundWithCompletion:", v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __52__AFUISiriCompactView__setupBugReportButtonIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v5);
}

void __52__AFUISiriCompactView__setupBugReportButtonIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_constructAndAddBugReportButtonWithImage:", *(_QWORD *)(a1 + 32));

}

- (double)bugReportDimension
{
  double result;

  result = 50.0;
  if (!self->_isEyesFree)
    return 25.0;
  return result;
}

- (double)siriXIndicatorDimension
{
  double result;

  result = 56.0;
  if (!self->_isEyesFree)
    return 28.0;
  return result;
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  id v11;

  v11 = a3;
  self->_isKeyboardShowing = 1;
  if (-[AFUISiriCompactView _shouldShowBugReportButton](self, "_shouldShowBugReportButton"))
  {
    if (self->_reportBugButton)
    {
      objc_msgSend(v11, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBE468]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "CGRectValue");
      self->_keyboardFrame.origin.x = v6;
      self->_keyboardFrame.origin.y = v7;
      self->_keyboardFrame.size.width = v8;
      self->_keyboardFrame.size.height = v9;

      if (self->_saeEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_reportBugButton, 3, 0, self, 4, 1.0, -(self->_keyboardFrame.size.height + 90.0));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setActive:", 1);

        -[SiriUIContentButton setAlpha:](self->_reportBugButton, "setAlpha:", 0.9);
        -[SiriUIContentButton setNeedsLayout](self->_reportBugButton, "setNeedsLayout");
        -[SiriUIContentButton layoutIfNeeded](self->_reportBugButton, "layoutIfNeeded");
      }
    }
  }

}

- (void)keyboardWillHide:(id)a3
{
  self->_isKeyboardShowing = 0;
}

- (void)_constructAndAddBugReportButtonWithImage:(id)a3
{
  id v4;
  SiriUIContentButton *v5;
  SiriUIContentButton *reportBugButton;
  SiriUIContentButton *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  SiriUIContentButton *v13;
  void *v14;
  uint64_t v15;
  int v16;
  double v17;
  void *v18;
  void *v19;
  SiriUIContentButton *v20;
  double v21;
  void *v22;
  void *v23;
  SiriUIContentButton *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  SiriUIContentButton *v29;
  double v30;
  double v31;
  uint64_t v32;
  void *orbView;
  uint64_t v34;
  void *v35;
  id v36;

  v4 = a3;
  v36 = v4;
  if (self->_isEyesFree)
    objc_msgSend(MEMORY[0x24BEA84F8], "eyesFreeButtonWithImageTemplate:style:", v4, 0);
  else
    objc_msgSend(MEMORY[0x24BEA84F8], "buttonWithImageTemplate:style:", v4, 0);
  v5 = (SiriUIContentButton *)objc_claimAutoreleasedReturnValue();
  reportBugButton = self->_reportBugButton;
  self->_reportBugButton = v5;

  v7 = self->_reportBugButton;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemDarkGrayTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIContentButton setBackgroundColor:](v7, "setBackgroundColor:", v9);

  -[SiriUIContentButton layer](self->_reportBugButton, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCompactView bugReportDimension](self, "bugReportDimension");
  objc_msgSend(v10, "setCornerRadius:", v11 * 0.5);

  -[SiriUIContentButton _setTouchInsets:](self->_reportBugButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
  -[SiriUIContentButton addTarget:action:forControlEvents:](self->_reportBugButton, "addTarget:action:forControlEvents:", self, sel__reportBugButtonTapped, 64);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__reportBugButtonLongPressed);
  -[SiriUIContentButton addGestureRecognizer:](self->_reportBugButton, "addGestureRecognizer:", v12);
  -[SiriUIContentButton setHidden:](self->_reportBugButton, "setHidden:", 0);
  v13 = self->_reportBugButton;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIContentButton setDefaultColorForTemplate:](v13, "setDefaultColorForTemplate:", v14);

  -[AFUISiriCompactView addSubview:](self, "addSubview:", self->_reportBugButton);
  -[SiriUIContentButton setTranslatesAutoresizingMaskIntoConstraints:](self->_reportBugButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (AFDeviceSupportsSystemAssistantExperience())
    v15 = 1;
  else
    v15 = 2;
  v16 = AFDeviceSupportsSystemAssistantExperience();
  v17 = 15.0;
  if (!v16)
    v17 = -15.0;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_reportBugButton, v15, 0, self, v15, 1.0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  v19 = (void *)MEMORY[0x24BDD1628];
  v20 = self->_reportBugButton;
  -[AFUISiriCompactView bugReportDimension](self, "bugReportDimension");
  objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 7, 0, 0, 0, 1.0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  v23 = (void *)MEMORY[0x24BDD1628];
  v24 = self->_reportBugButton;
  -[AFUISiriCompactView bugReportDimension](self, "bugReportDimension");
  objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 8, 0, 0, 0, 1.0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  if (self->_saeEnabled)
  {
    -[AFUISiriCompactView _sizeForOrbViewContainer](self, "_sizeForOrbViewContainer");
    if (self->_isKeyboardShowing)
      v27 = self->_keyboardFrame.size.height + 90.0;
    v28 = (void *)MEMORY[0x24BDD1628];
    v29 = self->_reportBugButton;
    v30 = -v27;
    v31 = 1.0;
    v32 = 3;
    orbView = self;
    v34 = 4;
  }
  else
  {
    v28 = (void *)MEMORY[0x24BDD1628];
    v29 = self->_reportBugButton;
    orbView = self->_orbView;
    v31 = 1.0;
    v30 = 0.0;
    v32 = 10;
    v34 = 10;
  }
  objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, v32, 0, orbView, v34, v31, v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[AFUISiriCompactView _constructAndAddSiriXIndicator](self, "_constructAndAddSiriXIndicator");
}

- (void)_loadReportBugButtonTemplateImageInBackgroundWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__AFUISiriCompactView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke;
  block[3] = &unk_24D7A1BA8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __83__AFUISiriCompactView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("radarBug"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithRenderingMode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = 0;
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
LABEL_7:
    v2 = v7;
  }

}

- (void)_reportBugButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
  objc_msgSend(WeakRetained, "siriContentDidReceiveReportBugAction:", self);

}

- (void)_reportBugButtonLongPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
  objc_msgSend(WeakRetained, "siriContentDidReceiveReportBugLongPress:", self);

}

- (BOOL)_shouldShowBugReportButton
{
  void *v3;
  BOOL v4;

  if (!AFIsInternalInstall())
    return 0;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "debugButtonIsEnabled"))
    v4 = self->_mode != 5;
  else
    v4 = 0;

  return v4;
}

- (void)_constructAndAddSiriXIndicator
{
  UIView *v3;
  UIView *siriXIndicator;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  double v11;
  void *v12;
  void *v13;
  UIView *v14;
  double v15;
  id v16;

  if (self->_reportBugButton)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    siriXIndicator = self->_siriXIndicator;
    self->_siriXIndicator = v3;

    -[UIView layer](self->_siriXIndicator, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriCompactView siriXIndicatorDimension](self, "siriXIndicatorDimension");
    objc_msgSend(v5, "setCornerRadius:", v6 * 0.5);

    -[UIView setAlpha:](self->_siriXIndicator, "setAlpha:", 0.6);
    -[AFUISiriCompactView insertSubview:below:](self, "insertSubview:below:", self->_siriXIndicator, self->_reportBugButton);
    -[AFUISiriCompactView setRequestHandlingStatus:](self, "setRequestHandlingStatus:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_siriXIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_siriXIndicator, 9, 0, self->_reportBugButton, 9, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_siriXIndicator, 10, 0, self->_reportBugButton, 10, 1.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    v9 = (void *)MEMORY[0x24BDD1628];
    v10 = self->_siriXIndicator;
    -[AFUISiriCompactView siriXIndicatorDimension](self, "siriXIndicatorDimension");
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 7, 0, 0, 0, 1.0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    v13 = (void *)MEMORY[0x24BDD1628];
    v14 = self->_siriXIndicator;
    -[AFUISiriCompactView siriXIndicatorDimension](self, "siriXIndicatorDimension");
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 8, 0, 0, 0, 1.0, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

  }
}

- (void)setRequestHandlingStatus:(unint64_t)a3
{
  UIView *siriXIndicator;
  id v4;

  siriXIndicator = self->_siriXIndicator;
  AFUISiriRequestHandlingStatusColor(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](siriXIndicator, "setBackgroundColor:", v4);

}

- (void)animateOrbViewDismissalWithCompletion:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  _BOOL8 ignoreSiriSessionUpdates;
  NSObject *v9;
  void *v10;
  os_log_t v11;
  void *v12;
  _BOOL8 v13;
  NSObject *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    ignoreSiriSessionUpdates = self->_ignoreSiriSessionUpdates;
    v9 = v6;
    objc_msgSend(v7, "numberWithBool:", ignoreSiriSessionUpdates);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315394;
    v19 = "-[AFUISiriCompactView animateOrbViewDismissalWithCompletion:]";
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation _ignoreSiriSessionUpdates: %@", (uint8_t *)&v18, 0x16u);

  }
  self->_ignoreSiriSessionUpdates = 1;
  v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x24BDD16E0];
    v13 = self->_ignoreSiriSessionUpdates;
    v14 = v11;
    objc_msgSend(v12, "numberWithBool:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315394;
    v19 = "-[AFUISiriCompactView animateOrbViewDismissalWithCompletion:]";
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_217514000, v14, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation _ignoreSiriSessionUpdates: %@", (uint8_t *)&v18, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);
  objc_msgSend(WeakRetained, "edgeLightMaskMetalLayerForView:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v17, "animateOffWithCompletion:", v4);
  else
    -[SUICOrbView animateToOffWithCompletion:](self->_orbView, "animateToOffWithCompletion:", v4);

}

- (CGSize)_sizeForOrbViewContainer
{
  double v2;
  double v3;
  CGSize result;

  v2 = 66.0;
  v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_sizeForOrbView
{
  double v2;
  double v3;
  CGSize result;

  v2 = 198.0;
  v3 = 198.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)_remoteContentViewFrame
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[AFUISiriCompactView bounds](self, "bounds");
  v7 = v3;
  v8 = v5;
  v9 = v6;
  if (self->_remoteContentViewHidden)
    v10 = -CGRectGetHeight(*(CGRect *)&v3);
  else
    v10 = 0.0;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (CGRect)_lockViewFrame
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[AFUISiriCompactView bounds](self, "bounds");
  v7 = v3;
  v8 = v5;
  v9 = v6;
  if (self->_lockViewHidden)
    Height = CGRectGetHeight(*(CGRect *)&v3);
  else
    Height = 0.0;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = Height;
  result.origin.x = v11;
  return result;
}

- (CGRect)_orbViewContainerFrame
{
  char IsPad;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGRect *p_orbViewContainerFrame;
  void *v12;
  char v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat Height;
  CGFloat v25;
  double v26;
  double v27;
  id WeakRetained;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  IsPad = SiriUIDeviceIsPad();
  -[AFUISiriCompactView _sizeForOrbViewContainer](self, "_sizeForOrbViewContainer");
  v5 = v4;
  v7 = v6;
  -[AFUISiriCompactView _originXForOrbContainer](self, "_originXForOrbContainer");
  v9 = v8;
  -[AFUISiriCompactView frame](self, "frame");
  v10 = CGRectGetHeight(v33) - v7 + -44.0;
  if ((IsPad & 1) != 0)
  {
    v38.origin.x = v9;
    v38.origin.y = v10;
    v38.size.width = v5;
    v38.size.height = v7;
    if (CGRectIntersectsRect(self->_dockFrame, v38) && !self->_saeEnabled)
      v10 = v10 - self->_dockFrame.size.height;
  }
  p_orbViewContainerFrame = &self->_orbViewContainerFrame;
  v34.origin.x = v9;
  v34.origin.y = v10;
  v34.size.width = v5;
  v34.size.height = v7;
  if (!CGRectEqualToRect(v34, self->_orbViewContainerFrame))
  {
    p_orbViewContainerFrame->origin.x = v9;
    self->_orbViewContainerFrame.origin.y = v10;
    self->_orbViewContainerFrame.size.width = v5;
    self->_orbViewContainerFrame.size.height = v7;
    -[AFUISiriCompactView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAmbientPresented");

    -[UIView superview](self->_orbViewContainer, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUISiriCompactView convertRect:fromView:](self, "convertRect:fromView:", v14, p_orbViewContainerFrame->origin.x, self->_orbViewContainerFrame.origin.y, self->_orbViewContainerFrame.size.width, self->_orbViewContainerFrame.size.height);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v23 = 0.0;
    if ((v13 & 1) == 0)
    {
      -[AFUISiriCompactView bounds](self, "bounds", 0.0, 0.0);
      Height = CGRectGetHeight(v35);
      v25 = v16;
      v26 = Height;
      v36.origin.x = v25;
      v36.origin.y = v18;
      v36.size.width = v20;
      v36.size.height = v22;
      v23 = v26 - CGRectGetMinY(v36);
    }
    if (self->_saeEnabled)
      v27 = 0.0;
    else
      v27 = v23;
    WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
    objc_msgSend(WeakRetained, "compactView:bottomContentInsetDidChange:", self, v27);

  }
  v29 = v9;
  v30 = v10;
  v31 = v5;
  v32 = v7;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
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
  UIView *remoteContentView;
  AFUIPasscodeContainerView *lockContainerView;
  UIView *orbViewContainer;
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
  SUICOrbView *orbView;
  void *v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  AFUITouchInputView *touchInputView;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)AFUISiriCompactView;
  -[AFUISiriCompactView layoutSubviews](&v33, sel_layoutSubviews);
  -[AFUISiriCompactView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (!self->_inFluidDismissal)
    -[UIView setFrame:](self->_foregroundContainerView, "setFrame:", v3, v4, v5, v6);
  -[AFUISiriCompactDimmingView setFrame:](self->_dimmingBackdropView, "setFrame:", v7, v8, v9, v10);
  remoteContentView = self->_remoteContentView;
  -[AFUISiriCompactView _remoteContentViewFrame](self, "_remoteContentViewFrame");
  -[UIView setFrame:](remoteContentView, "setFrame:");
  -[UIView setFrame:](self->_blurringAndLockContainer, "setFrame:", v7, v8, v9, v10);
  lockContainerView = self->_lockContainerView;
  -[AFUISiriCompactView _lockViewFrame](self, "_lockViewFrame");
  -[AFUIPasscodeContainerView setFrame:](lockContainerView, "setFrame:");
  orbViewContainer = self->_orbViewContainer;
  -[AFUISiriCompactView _orbViewContainerFrame](self, "_orbViewContainerFrame");
  -[UIView setFrame:](orbViewContainer, "setFrame:");
  if (!self->_saeEnabled)
  {
    -[AFUISiriCompactView _sizeForOrbViewContainer](self, "_sizeForOrbViewContainer");
    v15 = v14;
    v17 = v16;
    -[AFUISiriCompactView _sizeForOrbView](self, "_sizeForOrbView");
    v19 = v18;
    v21 = v20;
    v22 = (v15 - v18) * 0.5;
    v23 = (v17 - v20) * 0.5;
    orbView = self->_orbView;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v27 = v26 < 2.0;
    v28 = ceil(v22);
    v29 = ceil(v23);
    v30 = ceil(v19);
    v31 = ceil(v21);
    if (!v27)
    {
      v28 = v22;
      v29 = v23;
      v30 = v19;
      v31 = v21;
    }
    -[SUICOrbView setFrame:](orbView, "setFrame:", v28, v29, v30, v31);

  }
  touchInputView = self->_touchInputView;
  -[UIView frame](self->_orbViewContainer, "frame");
  -[AFUITouchInputView setFrame:](touchInputView, "setFrame:");
  -[UIView setFrame:](self->_voiceActivationMaskView, "setFrame:", v7, v8, v9, v10);
  -[AFUISiriEyesFreeView setFrame:](self->_eyesFreeView, "setFrame:", v7, v8, v9, v10);
}

- (void)setRemoteContentView:(id)a3
{
  UIView *v5;
  UIView **p_remoteContentView;
  UIView *remoteContentView;
  UIView *v8;
  UIView *foregroundContainerView;
  UIView *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_remoteContentView = &self->_remoteContentView;
  remoteContentView = self->_remoteContentView;
  if (remoteContentView != v5)
  {
    v11 = v5;
    -[UIView removeFromSuperview](remoteContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_remoteContentView, a3);
    v8 = *p_remoteContentView;
    if (*p_remoteContentView)
    {
      -[AFUISiriCompactView frame](self, "frame");
      -[UIView setFrame:](v8, "setFrame:");
    }
    if (self->_voiceActivationMaskView)
    {
      foregroundContainerView = self->_foregroundContainerView;
      v10 = *p_remoteContentView;
    }
    else
    {
      foregroundContainerView = self->_foregroundContainerView;
      v10 = *p_remoteContentView;
      if (!self->_orbViewContainer)
      {
        -[UIView addSubview:](foregroundContainerView, "addSubview:", v10);
        goto LABEL_8;
      }
    }
    -[UIView insertSubview:belowSubview:](foregroundContainerView, "insertSubview:belowSubview:", v10);
LABEL_8:
    v5 = v11;
  }

}

- (void)setSiriSessionState:(int64_t)a3
{
  os_log_t *v5;
  void *v6;
  void *v7;
  _BOOL8 ignoreSiriSessionUpdates;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  _BOOL8 v15;
  NSObject *v16;
  void *v17;
  os_log_t v18;
  void *v19;
  int64_t siriSessionState;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    ignoreSiriSessionUpdates = self->_ignoreSiriSessionUpdates;
    v9 = v6;
    objc_msgSend(v7, "numberWithBool:", ignoreSiriSessionUpdates);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 136315394;
    v25 = "-[AFUISiriCompactView setSiriSessionState:]";
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_217514000, v9, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation _ignoreSiriSessionUpdates: %@", (uint8_t *)&v24, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
  v12 = objc_msgSend(WeakRetained, "compactViewRequestAttendingState:", self);

  if ((self->_siriSessionState != a3 || self->_isAttending != (_DWORD)v12) && !self->_ignoreSiriSessionUpdates)
  {
    self->_isAttending = v12;
    -[SUICOrbView setMode:](self->_orbView, "setMode:", objc_msgSend(MEMORY[0x24BEA6290], "orbViewModeForSiriSessionState:isAttending:", a3, v12));
    v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x24BDD16E0];
      v15 = self->_ignoreSiriSessionUpdates;
      v16 = v13;
      objc_msgSend(v14, "numberWithBool:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315394;
      v25 = "-[AFUISiriCompactView setSiriSessionState:]";
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_217514000, v16, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation _ignoreSiriSessionUpdates: %@", (uint8_t *)&v24, 0x16u);

    }
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)MEMORY[0x24BDD16E0];
      siriSessionState = self->_siriSessionState;
      v21 = v18;
      objc_msgSend(v19, "numberWithInteger:", siriSessionState);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315650;
      v25 = "-[AFUISiriCompactView setSiriSessionState:]";
      v26 = 2112;
      v27 = v22;
      v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_217514000, v21, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation old state: %@ | new  state:  %@", (uint8_t *)&v24, 0x20u);

    }
    self->_siriSessionState = a3;
  }
}

- (void)setSiriContentDelegate:(id)a3
{
  AFUISiriContentDelegate **p_siriContentDelegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_siriContentDelegate = &self->_siriContentDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_siriContentDelegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_siriContentDelegate, obj);
    v6 = obj;
  }

}

- (void)setVoiceActivationMaskViewVisible:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (a3)
  {
    -[AFUISiriCompactView _setupVoiceActivationMaskView](self, "_setupVoiceActivationMaskView");
  }
  else if (self->_voiceActivationMaskView)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x24BEBDB00];
    v4 = MEMORY[0x24BDAC760];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__AFUISiriCompactView_setVoiceActivationMaskViewVisible___block_invoke;
    v7[3] = &unk_24D7A1AB8;
    objc_copyWeak(&v8, &location);
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __57__AFUISiriCompactView_setVoiceActivationMaskViewVisible___block_invoke_2;
    v5[3] = &unk_24D7A1AE0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v3, "animateWithDuration:animations:completion:", v7, v5, 0.4);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __57__AFUISiriCompactView_setVoiceActivationMaskViewVisible___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[58], "setAlpha:", 0.0);
    WeakRetained = v2;
  }

}

void __57__AFUISiriCompactView_setVoiceActivationMaskViewVisible___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[58], "removeFromSuperview");
    v2 = v3[58];
    v3[58] = 0;

    WeakRetained = v3;
  }

}

- (void)setAuxiliaryViewsHidden:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  double v5;
  _QWORD v6[6];
  BOOL v7;

  if (self->_auxiliaryViewsHidden != a3)
  {
    self->_auxiliaryViewsHidden = a3;
    if (a3)
      v4 = 0.0;
    else
      v4 = 1.0;
    v6[1] = 3221225472;
    v5 = 0.3;
    v6[0] = MEMORY[0x24BDAC760];
    if (!a4)
      v5 = 0.0;
    v6[2] = __56__AFUISiriCompactView_setAuxiliaryViewsHidden_animated___block_invoke;
    v6[3] = &unk_24D7A3500;
    v6[4] = self;
    *(double *)&v6[5] = v4;
    v7 = a3;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v6, v5);
  }
}

uint64_t __56__AFUISiriCompactView_setAuxiliaryViewsHidden_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setHidden:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setHidden:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_setupVoiceActivationMaskView
{
  id v3;
  UIView *v4;
  UIView *voiceActivationMaskView;
  UIView *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[AFUISiriCompactView frame](self, "frame");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  voiceActivationMaskView = self->_voiceActivationMaskView;
  self->_voiceActivationMaskView = v4;

  v6 = self->_voiceActivationMaskView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UIView insertSubview:belowSubview:](self->_foregroundContainerView, "insertSubview:belowSubview:", self->_voiceActivationMaskView, self->_orbViewContainer);
}

- (void)setFullScreenDimmingLayerVisible:(BOOL)a3 animated:(BOOL)a4
{
  self->_dimmingViewVisible = a3;
  -[AFUISiriCompactDimmingView setVisible:animated:](self->_dimmingBackdropView, "setVisible:animated:");
}

- (void)backgroundBlurViewController:(id)a3 didSetBlurVisibilityTo:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  self->_blurViewVisible = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
  objc_msgSend(WeakRetained, "compactView:blurVisibilityDidChange:", self, v4);

  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("not visible");
    if (v4)
      v8 = CFSTR("visible");
    v9 = 136315394;
    v10 = "-[AFUISiriCompactView backgroundBlurViewController:didSetBlurVisibilityTo:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s #compact Blur Visibility changed to %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_setUpEyesFreePresentation:(int64_t)a3
{
  AFUISiriEyesFreeView *v5;
  AFUISiriEyesFreeView *v6;
  AFUISiriEyesFreeView *eyesFreeView;
  void *v8;
  id v9;

  self->_isEyesFree = 1;
  v5 = [AFUISiriEyesFreeView alloc];
  -[AFUISiriCompactView bounds](self, "bounds");
  v6 = -[AFUISiriEyesFreeView initWithFrame:eyesFreeMode:](v5, "initWithFrame:eyesFreeMode:", a3);
  eyesFreeView = self->_eyesFreeView;
  self->_eyesFreeView = v6;

  -[AFUISiriEyesFreeView setAlpha:](self->_eyesFreeView, "setAlpha:", 0.0);
  -[AFUISiriCompactView edgeLightViewProvider](self, "edgeLightViewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AFUISiriCompactView edgeLightViewProvider](self, "edgeLightViewProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertEyesFreeView:", self->_eyesFreeView);

  }
  else
  {
    -[AFUISiriCompactView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_eyesFreeView, self->_foregroundContainerView);
  }
}

- (void)showPasscodeUnlockWithStatusText:(id)a3 subtitle:(id)a4 completionHandler:(id)a5 unlockCompletionHandler:(id)a6
{
  -[AFUIPasscodeContainerView showPasscodeUnlockWithStatusText:subtitle:completionHandler:unlockCompletionHandler:](self->_lockContainerView, "showPasscodeUnlockWithStatusText:subtitle:completionHandler:unlockCompletionHandler:", a3, a4, a5, a6);
}

- (void)_animateLockViewIsAnimatingIn:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  double MinY;
  void *v8;
  UIView *remoteContentView;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  AFUIPasscodeContainerView *lockContainerView;
  double v15;
  uint64_t v16;
  double v17;
  UIView *orbViewContainer;
  uint64_t v19;
  SiriUIBackgroundBlurViewController *fullScreenBlurViewController;
  _QWORD v21[5];
  _QWORD v22[5];
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  if (v6)
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v6);
  -[AFUISiriCompactView _remoteContentViewFrame](self, "_remoteContentViewFrame");
  MinY = CGRectGetMinY(v23);
  self->_remoteContentViewHidden = v4;
  v8 = (void *)objc_opt_class();
  remoteContentView = self->_remoteContentView;
  -[AFUISiriCompactView _remoteContentViewFrame](self, "_remoteContentViewFrame");
  v10 = CGRectGetMinY(v24);
  if (self->_remoteContentViewHidden)
    v11 = 2;
  else
    v11 = 1;
  objc_msgSend(v8, "_animateView:fromYPosition:toYPosition:fade:completion:", remoteContentView, v11, 0, MinY, v10);
  -[AFUISiriCompactView _lockViewFrame](self, "_lockViewFrame");
  v12 = CGRectGetMinY(v25);
  self->_lockViewHidden = !v4;
  v13 = (void *)objc_opt_class();
  lockContainerView = self->_lockContainerView;
  -[AFUISiriCompactView _lockViewFrame](self, "_lockViewFrame");
  v15 = CGRectGetMinY(v26);
  if (self->_lockViewHidden)
    v16 = 2;
  else
    v16 = 1;
  objc_msgSend(v13, "_animateView:fromYPosition:toYPosition:fade:completion:", lockContainerView, v16, 0, v12, v15);
  v17 = 0.0;
  if (!self->_lockViewHidden)
    v17 = 1.0;
  -[SUICOrbView setAlpha:](self->_orbView, "setAlpha:", v17);
  orbViewContainer = self->_orbViewContainer;
  -[AFUISiriCompactView _orbViewContainerFrame](self, "_orbViewContainerFrame");
  -[UIView setFrame:](orbViewContainer, "setFrame:");
  v19 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __64__AFUISiriCompactView__animateLockViewIsAnimatingIn_completion___block_invoke;
  v22[3] = &unk_24D7A1B30;
  v22[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v22, 0, 0.3);
  -[UIView setUserInteractionEnabled:](self->_blurringAndLockContainer, "setUserInteractionEnabled:", !self->_lockViewHidden);
  fullScreenBlurViewController = self->_fullScreenBlurViewController;
  if (fullScreenBlurViewController)
  {
    if (v4)
    {
      v21[0] = v19;
      v21[1] = 3221225472;
      v21[2] = __64__AFUISiriCompactView__animateLockViewIsAnimatingIn_completion___block_invoke_2;
      v21[3] = &unk_24D7A1B30;
      v21[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v21, 0, 1.0);
    }
    else
    {
      -[SiriUIBackgroundBlurViewController requestBackgroundBlurVisible:forReason:](fullScreenBlurViewController, "requestBackgroundBlurVisible:forReason:", 1, 2);
    }
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

uint64_t __64__AFUISiriCompactView__animateLockViewIsAnimatingIn_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 1.0;
  if (!*(_BYTE *)(v1 + 657))
    v2 = 0.0;
  return objc_msgSend(*(id *)(v1 + 448), "setAlpha:", v2);
}

uint64_t __64__AFUISiriCompactView__animateLockViewIsAnimatingIn_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "requestBackgroundBlurVisible:forReason:", 1, 2);
}

+ (void)_animateView:(id)a3 fromYPosition:(double)a4 toYPosition:(double)a5 fade:(int64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  _BOOL8 v17;
  uint64_t v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v11 = a7;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  if (v11)
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v11);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = objc_alloc_init(MEMORY[0x24BDE5760]);
  objc_msgSend(v13, "setKeyPath:", CFSTR("position.y"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromValue:", v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToValue:", v15);

  objc_msgSend(v13, "setMass:", 4.0);
  objc_msgSend(v13, "setStiffness:", 600.0);
  objc_msgSend(v13, "setDamping:", 800.0);
  objc_msgSend(v12, "addObject:", v13);
  if (a6)
  {
    v16 = a6 == 2;
    v17 = a6 != 2;
    v18 = v16;
    if (v16)
      v19 = 0.1;
    else
      v19 = 32.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
    a6 = objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x24BDE5760]);
    objc_msgSend(v21, "setKeyPath:", CFSTR("opacity"));
    objc_msgSend(v21, "setFromValue:", v20);
    objc_msgSend(v21, "setToValue:", a6);
    objc_msgSend(v21, "setMass:", v19);
    objc_msgSend(v21, "setStiffness:", 600.0);
    objc_msgSend(v21, "setDamping:", 800.0);
    objc_msgSend(v12, "addObject:", v21);

  }
  v22 = objc_alloc_init(MEMORY[0x24BDE5638]);
  objc_msgSend(v22, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x24BEA6268], "defaultTimingFunction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTimingFunction:", v23);

  objc_msgSend(MEMORY[0x24BEA6268], "defaultAnimationDuration");
  objc_msgSend(v22, "setDuration:");
  objc_msgSend(v22, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v22, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v22, "setAnimations:", v12);
  objc_msgSend(v28, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAnimation:forKey:", v22, CFSTR("Animation Group"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  if (a6)
  {
    objc_msgSend(v28, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a6, "floatValue");
    objc_msgSend(v25, "setOpacity:");

  }
  objc_msgSend(v28, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAnchorPoint:", 0.0, 0.0);

  objc_msgSend(v28, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPosition:", 0.0, a5);

}

- (void)passcodeView:(id)a3 hideLockViewWithResult:(int64_t)a4 unlockCompletionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  double v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  _QWORD block[4];
  id v13;
  int64_t v14;

  v7 = (void *)MEMORY[0x219A0D984](a5, a2, a3);
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEA6268], "defaultAnimationDuration");
    v10 = dispatch_time(0, (uint64_t)(v9 * 0.15 * 1000000000.0));
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __83__AFUISiriCompactView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke;
    block[3] = &unk_24D7A1BD0;
    v13 = v7;
    v14 = a4;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

  }
  self->_inHideUnlockViewAnimation = 1;
  self->_inShowUnlockViewAnimation = 0;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __83__AFUISiriCompactView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke_2;
  v11[3] = &unk_24D7A1B30;
  v11[4] = self;
  -[AFUISiriCompactView _animateLockViewIsAnimatingIn:completion:](self, "_animateLockViewIsAnimatingIn:completion:", 0, v11);

}

uint64_t __83__AFUISiriCompactView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __83__AFUISiriCompactView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 660) = 0;
  return result;
}

- (BOOL)passcodeView:(id)a3 attemptUnlockWithPassword:(id)a4
{
  AFUISiriCompactView *v4;
  AFUISiriContentDelegate **p_siriContentDelegate;
  id v6;
  id WeakRetained;

  v4 = self;
  p_siriContentDelegate = &self->_siriContentDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_siriContentDelegate);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "siriView:attemptUnlockWithPassword:", v4, v6);

  return (char)v4;
}

- (void)passcodeView:(id)a3 animateShowPasscodeWithCompletionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  double v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v5 = a4;
  self->_inShowUnlockViewAnimation = 1;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__AFUISiriCompactView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke;
  v12[3] = &unk_24D7A1B30;
  v12[4] = self;
  -[AFUISiriCompactView _animateLockViewIsAnimatingIn:completion:](self, "_animateLockViewIsAnimatingIn:completion:", 1, v12);
  objc_msgSend(MEMORY[0x24BEA6268], "defaultAnimationDuration");
  v8 = dispatch_time(0, (uint64_t)(v7 * 0.15 * 1000000000.0));
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __77__AFUISiriCompactView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_24D7A1BA8;
  v11 = v5;
  v9 = v5;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], v10);

}

void __77__AFUISiriCompactView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 659) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logEventWithType:context:", 1433, 0);

}

uint64_t __77__AFUISiriCompactView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SUICOrbView invalidate](self->_orbView, "invalidate");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriCompactView;
  -[AFUISiriCompactView dealloc](&v4, sel_dealloc);
}

- (void)updateVolumeInputdB:(float)a3
{
  void *v5;
  double v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);
  objc_msgSend(WeakRetained, "edgeLightMaskMetalLayerForView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  objc_msgSend(v5, "updateVolumeInputdB:", v6);

}

- (void)setInputPowerLevel:(float)a3
{
  void *v5;
  int64_t siriSessionState;
  id WeakRetained;
  uint64_t v8;
  double v9;

  if (self->_shouldUpdatePowerLevel)
  {
    v5 = (void *)MEMORY[0x24BEA6290];
    siriSessionState = self->_siriSessionState;
    WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
    v8 = objc_msgSend(v5, "orbViewModeForSiriSessionState:isAttending:", siriSessionState, objc_msgSend(WeakRetained, "compactViewRequestAttendingState:", self));

    if (v8 == 1)
    {
      *(float *)&v9 = a3;
      -[SUICOrbView setPowerLevel:](self->_orbView, "setPowerLevel:", v9);
    }
  }
}

- (void)setOutputPowerLevel:(float)a3
{
  void *v5;
  int64_t siriSessionState;
  id WeakRetained;
  uint64_t v8;
  double v9;

  if (self->_shouldUpdatePowerLevel)
  {
    v5 = (void *)MEMORY[0x24BEA6290];
    siriSessionState = self->_siriSessionState;
    WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
    v8 = objc_msgSend(v5, "orbViewModeForSiriSessionState:isAttending:", siriSessionState, objc_msgSend(WeakRetained, "compactViewRequestAttendingState:", self));

    if (v8 == 3)
    {
      *(float *)&v9 = a3;
      -[SUICOrbView setPowerLevel:](self->_orbView, "setPowerLevel:", v9);
    }
  }
}

- (void)animateOrbViewToOffWithCompletion:(id)a3
{
  AFUISiriEdgelightViewProvider **p_edgeLightViewProvider;
  id v5;
  id WeakRetained;
  id v7;

  p_edgeLightViewProvider = &self->_edgeLightViewProvider;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_edgeLightViewProvider);
  objc_msgSend(WeakRetained, "edgeLightMaskMetalLayerForView:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "animateOffWithCompletion:", v5);
  else
    -[SUICOrbView animateToOffWithCompletion:](self->_orbView, "animateToOffWithCompletion:", v5);

}

- (void)setContentViewsAlpha:(double)a3
{
  -[UIView setAlpha:](self->_remoteContentView, "setAlpha:");
  -[AFUISiriEyesFreeView setAlpha:](self->_eyesFreeView, "setAlpha:", a3);
}

- (void)touchesBeganForInputView:(id)a3
{
  id WeakRetained;
  int v5;
  double v6;
  _QWORD v7[5];
  CATransform3D v8;
  CATransform3D v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
  v5 = objc_msgSend(WeakRetained, "compactViewRequestAttendingState:", self);

  if (v5)
  {
    self->_shouldUpdatePowerLevel = 0;
    LODWORD(v6) = -1039400960;
    -[SUICOrbView setPowerLevel:](self->_orbView, "setPowerLevel:", v6);
    -[AFUISiriCompactView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__playHaptic, 0, 0.2);
    -[AFUISiriCompactView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_touchesEndedForInputView_, 0, 0.2);
    memset(&v9, 0, sizeof(v9));
    CATransform3DMakeScale(&v9, 1.12, 1.12, 1.0);
    v7[1] = 3221225472;
    v8 = v9;
    v7[0] = MEMORY[0x24BDAC760];
    v7[2] = __48__AFUISiriCompactView_touchesBeganForInputView___block_invoke;
    v7[3] = &unk_24D7A3578;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v7, 0, 0.4, 0.5, 0.0, 0.0, 0.0, 0.0, 0.008);
  }
}

void __48__AFUISiriCompactView_touchesBeganForInputView___block_invoke(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  _OWORD v6[8];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v1 = *(_OWORD *)(a1 + 120);
  v11 = *(_OWORD *)(a1 + 104);
  v12 = v1;
  v2 = *(_OWORD *)(a1 + 152);
  v13 = *(_OWORD *)(a1 + 136);
  v14 = v2;
  v3 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v4 = *(_OWORD *)(a1 + 88);
  v9 = *(_OWORD *)(a1 + 72);
  v10 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = v11;
  v6[5] = v12;
  v6[6] = v13;
  v6[7] = v14;
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  v6[3] = v10;
  objc_msgSend(v5, "setTransform:", v6);

}

- (void)touchesEndedForInputView:(id)a3
{
  id WeakRetained;
  char v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
  v5 = objc_msgSend(WeakRetained, "compactViewRequestAttendingState:", self);

  if ((v5 & 1) != 0)
  {
    self->_shouldUpdatePowerLevel = 1;
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__playHaptic, 0);
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_touchesEndedForInputView_, 0);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__AFUISiriCompactView_touchesEndedForInputView___block_invoke;
    v6[3] = &unk_24D7A1B30;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v6, 0, 0.4, 0.5, 0.0, 0.0, 0.0, 0.0, 0.008);
  }
  else
  {
    -[AFUISiriCompactView _handleTouchEndedForNonAttendingConfiguration](self, "_handleTouchEndedForNonAttendingConfiguration");
  }
}

void __48__AFUISiriCompactView_touchesEndedForInputView___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[8];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v6[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v6[5] = v2;
  v3 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v6[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v6[7] = v3;
  v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v6[0] = *MEMORY[0x24BDE5598];
  v6[1] = v4;
  v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v6[3] = v5;
  objc_msgSend(v1, "setTransform:", v6);

}

- (void)_handleTouchEndedForNonAttendingConfiguration
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
  objc_msgSend(WeakRetained, "siriContentDidReceiveOrbTappedAction:", self);

}

- (void)_playHaptic
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD670]), "initWithStyle:", 2);
  objc_msgSend(v2, "_setOutputMode:", 5);
  objc_msgSend(v2, "prepare");
  objc_msgSend(v2, "impactOccurred");

}

- (UIView)remoteContentView
{
  return self->_remoteContentView;
}

- (int64_t)siriSessionState
{
  return self->_siriSessionState;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (UIView)foregroundContainerView
{
  return self->_foregroundContainerView;
}

- (BOOL)isBlurViewVisible
{
  return self->_blurViewVisible;
}

- (BOOL)isDimmingViewVisible
{
  return self->_dimmingViewVisible;
}

- (int64_t)currentInterfaceOrientation
{
  return self->_currentInterfaceOrientation;
}

- (void)setCurrentInterfaceOrientation:(int64_t)a3
{
  self->_currentInterfaceOrientation = a3;
}

- (AFUISiriEdgelightViewProvider)edgeLightViewProvider
{
  return (AFUISiriEdgelightViewProvider *)objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);
}

- (void)setEdgeLightViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_edgeLightViewProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_edgeLightViewProvider);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
  objc_storeStrong((id *)&self->_lockContainerView, 0);
  objc_storeStrong((id *)&self->_fullScreenBlurViewController, 0);
  objc_storeStrong((id *)&self->_blurringAndLockContainer, 0);
  objc_storeStrong((id *)&self->_eyesFreeView, 0);
  objc_storeStrong((id *)&self->_siriXIndicator, 0);
  objc_storeStrong((id *)&self->_reportBugButton, 0);
  objc_destroyWeak((id *)&self->_compactViewDelegate);
  objc_destroyWeak((id *)&self->_siriContentDelegate);
  objc_storeStrong((id *)&self->_dimmingBackdropView, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_voiceActivationMaskView, 0);
  objc_storeStrong((id *)&self->_touchInputView, 0);
  objc_storeStrong((id *)&self->_orbView, 0);
  objc_storeStrong((id *)&self->_orbViewContainer, 0);
  objc_storeStrong((id *)&self->_remoteContentView, 0);
}

@end
