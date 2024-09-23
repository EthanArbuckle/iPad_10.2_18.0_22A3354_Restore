@implementation CAMSystemOverlayViewController

- (CAMSystemOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CAMSystemOverlayViewController *v4;
  CAMSystemOverlayViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMSystemOverlayViewController;
  v4 = -[CAMSystemOverlayViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[CAMSystemOverlayViewController _commonInitWithMotionController:](v4, "_commonInitWithMotionController:", 0);
  return v5;
}

- (CAMSystemOverlayViewController)initWithMotionController:(id)a3
{
  id v4;
  CAMSystemOverlayViewController *v5;
  CAMSystemOverlayViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMSystemOverlayViewController;
  v5 = -[CAMSystemOverlayViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CAMSystemOverlayViewController _commonInitWithMotionController:](v5, "_commonInitWithMotionController:", v4);

  return v6;
}

- (void)_commonInitWithMotionController:(id)a3
{
  CAMMotionController *v4;
  CAMMotionController *v5;
  void *v6;
  CAMSystemOverlayStateMachine *v7;
  CAMSystemOverlayStateMachine *stateMachine;
  CFIndex AppIntegerValue;
  BOOL v10;
  BOOL v11;
  void *v12;
  int v13;
  CAMHalfPressContactRecognizer *v14;
  CAMHalfPressContactRecognizer *halfPressRecognizer;
  CAMSystemOverlayTipManager *v16;
  CAMSystemOverlayTipManager *tipManager;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (CAMMotionController *)a3;
  v5 = v4;
  if (!v4)
    v5 = objc_alloc_init(CAMMotionController);
  objc_storeStrong((id *)&self->__motionController, v5);
  if (!v4)

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__motionControllerDidChangeOrientation_, CFSTR("CAMMotionControllerCaptureOrientationChangedNotification"), 0);

  v7 = objc_alloc_init(CAMSystemOverlayStateMachine);
  stateMachine = self->__stateMachine;
  self->__stateMachine = v7;

  -[CAMSystemOverlayStateMachine setDelegate:](self->__stateMachine, "setDelegate:", self);
  self->__debugLoggingEnabled = CFPreferencesGetAppIntegerValue(CFSTR("systemOverlay.debugLoggingEnabled"), CFSTR("com.apple.camera"), 0) != 0;
  self->__ignoreScrollUnderPressure = CFPreferencesGetAppIntegerValue(CFSTR("systemOverlay.ignoreScrollUnderPressure"), CFSTR("com.apple.camera"), 0) != 0;
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("systemOverlay.doubleHalfPressOpensMenu"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v10 = AppIntegerValue == 0;
  else
    v10 = 0;
  v11 = !v10;
  self->__doubleHalfPressOpensMenu = v11;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isHalfPressSupported");

  if (v13)
  {
    v14 = objc_alloc_init(CAMHalfPressContactRecognizer);
    halfPressRecognizer = self->__halfPressRecognizer;
    self->__halfPressRecognizer = v14;

    -[CAMHalfPressContactRecognizer setDelegate:](self->__halfPressRecognizer, "setDelegate:", self);
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("systemOverlay.resetTipDataStoreOnOverlayLaunch"), CFSTR("com.apple.camera"), 0))
  {
    +[CAMSystemOverlayTipManager resetDataStore](CAMSystemOverlayTipManager, "resetDataStore");
  }
  +[CAMSystemOverlayTipManager configure](CAMSystemOverlayTipManager, "configure");
  if (+[CAMSystemOverlayTipManager anyTipPendingOrAvailable](CAMSystemOverlayTipManager, "anyTipPendingOrAvailable"))
  {
    v16 = objc_alloc_init(CAMSystemOverlayTipManager);
    tipManager = self->__tipManager;
    self->__tipManager = v16;

  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "shouldEnableUserNotifications"))
  {
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "bypassWelcomeScreens");

  }
  else
  {
    v20 = 1;
  }

  v21 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v24 = v20;
    _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "Overlay tip skipTips %d", buf, 8u);
  }

  -[CAMSystemOverlayTipManager setSkipTipParameter:](self->__tipManager, "setSkipTipParameter:", v20);
}

- (void)loadView
{
  void *v3;
  CAMSystemOverlayView *v4;

  v4 = objc_alloc_init(CAMSystemOverlayView);
  -[CAMSystemOverlayViewController _motionController](self, "_motionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayView setOrientation:](v4, "setOrientation:", objc_msgSend(v3, "captureOrientation"));

  -[CAMSystemOverlayView setDelegate:](v4, "setDelegate:", self);
  -[CAMSystemOverlayViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMSystemOverlayViewController;
  -[CAMSystemOverlayViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleTouchingGesture_);
  objc_msgSend(v3, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "_wantsGESEvents:", 1);
  -[CAMSystemOverlayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMSystemOverlayViewController;
  -[CAMSystemOverlayViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  -[CAMSystemOverlayViewController _buttonInteraction](self, "_buttonInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC42C8], "_cameraShutterConfigurationsWithOptionsProvider:", &__block_literal_global_44);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D0]), "initWithConfigurations:delegate:", v5, self);
    -[CAMSystemOverlayViewController _setPhysicalButtonInteraction:](self, "_setPhysicalButtonInteraction:", v6);
    -[CAMSystemOverlayViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addInteraction:", v6);

  }
  -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayViewController _motionController](self, "_motionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsPortraitOrientation:", objc_msgSend(v9, "captureOrientation") == 1);

  -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tipAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startTipObservationForViewController:sourceItem:", self, v12);

}

uint64_t __48__CAMSystemOverlayViewController_viewDidAppear___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC42C0], "behaviorOptions");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMSystemOverlayViewController;
  -[CAMSystemOverlayViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopTipObservation");

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  BOOL v4;

  -[CAMSystemOverlayViewController overlayView](self, "overlayView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSliderVisible"))
    v4 = objc_msgSend(v3, "sliderContent") != 1;
  else
    v4 = 0;

  return v4;
}

- (void)_handleTouchingGesture:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1)
      return;
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addReason:", 1);
  }
  else
  {
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeReason:", 1);
  }

}

- (void)overlayViewSliderDidChangeCurrentValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (!objc_msgSend(a3, "sliderContent"))
  {
    if (-[CAMSystemOverlayViewController _overlayEnabled](self, "_overlayEnabled"))
    {
      -[CAMSystemOverlayViewController overlayView](self, "overlayView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHandleBarVisible:animated:", 0, 1);

      -[CAMSystemOverlayViewController _selectedControlIdentifier](self, "_selectedControlIdentifier");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMSystemOverlayViewController overlayView](self, "overlayView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "slider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[CAMSystemOverlayViewController controlsByID](self, "controlsByID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[CAMSystemOverlayViewController _updateForControl:displayValue:](self, "_updateForControl:displayValue:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSystemOverlayViewController _updatesByID](self, "_updatesByID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v13);

      -[CAMSystemOverlayViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemOverlayViewController:didUpdateControl:", self, v10);

    }
  }
}

- (void)overlayViewSliderWillBeginScrolling:(id)a3
{
  id v3;

  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addReason:", 2);

}

- (void)overlayViewSliderDidEndScrolling:(id)a3
{
  id v3;

  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeReason:", 2);

}

- (void)overlayView:(id)a3 menuWillChangePresented:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = a4;
  objc_msgSend(a3, "menu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    -[CAMSystemOverlayViewController _controlImageNames](self, "_controlImageNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImageNames:", v8);

    objc_msgSend(v7, "setSelectedControlIndex:", -[CAMSystemOverlayViewController _selectedControlIndex](self, "_selectedControlIndex"));
    -[CAMSystemOverlayViewController _disabledControlsIndices](self, "_disabledControlsIndices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisabledMenuItemsIndices:", v9);
  }
  else
  {
    v10 = objc_msgSend(v6, "selectedControlIndex");
    -[CAMSystemOverlayViewController controls](self, "controls");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 >= objc_msgSend(v9, "count"))
    {
      v13 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CAMSystemOverlayViewController overlayView:menuWillChangePresented:].cold.1(v9);

    }
    else
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEnabled")
        && v10 != -[CAMSystemOverlayViewController _selectedControlIndex](self, "_selectedControlIndex"))
      {
        -[CAMSystemOverlayViewController _setSelectedControlIndex:](self, "_setSelectedControlIndex:", v10);
        -[CAMSystemOverlayViewController _updateNumberFormatterRounding](self, "_updateNumberFormatterRounding");
        -[CAMSystemOverlayViewController _updateSliderDataIfNeeded](self, "_updateSliderDataIfNeeded");
        -[CAMSystemOverlayViewController _setActiveControl:](self, "_setActiveControl:", v11);
        -[CAMSystemOverlayViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "systemOverlayViewController:didChangeActiveControl:", self, v11);

      }
    }
  }

}

- (void)overlayView:(id)a3 menuDidChangePresented:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if (v4)
  {
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addReason:", 3);

    objc_msgSend(v12, "slider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactEndedWithAction:", 0);

    -[CAMSystemOverlayViewController _cancelHandleBarTimerIfNeeded](self, "_cancelHandleBarTimerIfNeeded");
    -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordMenuVisibleEvent");
  }
  else
  {
    if (!-[CAMSystemOverlayViewController isControlEnabledAtIndex:](self, "isControlEnabledAtIndex:", -[CAMSystemOverlayViewController _selectedControlIndex](self, "_selectedControlIndex")))
    {
      -[CAMSystemOverlayViewController dismissOverlayForced:](self, "dismissOverlayForced:", 1);
      goto LABEL_7;
    }
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeReason:", 3);

    objc_msgSend(v12, "menu");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactEndedWithAction:", 0);

  }
LABEL_7:

}

- (void)overlayView:(id)a3 menuDidSelectControlAtIndex:(unint64_t)a4
{
  id v6;

  -[CAMSystemOverlayViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemOverlayViewController:menuDidScrollToControlAtIndex:", self, a4);

}

- (id)overlayView:(id)a3 cellConfigurationForNumber:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[CAMSystemOverlayViewController _selectedControl](self, "_selectedControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayViewController _updateForControl:displayValue:](self, "_updateForControl:displayValue:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMSystemOverlayViewController _valueTextForControl:update:useLeadingZero:](self, "_valueTextForControl:update:useLeadingZero:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D0D0A8]);
  +[CAMFont cameraMonospacedFontOfSize:weight:](CAMFont, "cameraMonospacedFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1448]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithText:font:", v8, v10);

  return v11;
}

- (id)valueTextForCurrentControl
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];

  v3 = -[CAMSystemOverlayViewController _selectedControlIndex](self, "_selectedControlIndex");
  -[CAMSystemOverlayViewController controls](self, "controls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
  {
    -[CAMSystemOverlayViewController controls](self, "controls");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = os_log_create("com.apple.camera.overlay", "Angel");
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CAMSystemOverlayViewController valueTextForCurrentControl].cold.1(self);
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "OverlayVC: Attempt to request text for control when there are no controls", v16, 2u);
    }

    return &stru_1EA3325A0;
  }
  else
  {
    -[CAMSystemOverlayViewController _selectedControl](self, "_selectedControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayViewController _updatesByID](self, "_updatesByID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMSystemOverlayViewController _valueTextForControl:update:useLeadingZero:](self, "_valueTextForControl:update:useLeadingZero:", v6, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
}

- (id)_valueTextForControl:(id)a3 update:(id)a4 useLeadingZero:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[CAMSystemOverlayViewController _displayValueRangeForControl:](self, "_displayValueRangeForControl:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "valueFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v10, "isFloatingPoint"))
  {
    -[CAMSystemOverlayViewController _displayNumberForControl:update:](self, "_displayNumberForControl:update:", v8, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayViewController _numberFormatter](self, "_numberFormatter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMinimumIntegerDigits:", v5);
    if (v12)
    {
      objc_msgSend(v13, "stringFromNumber:", v12);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = &stru_1EA3325A0;
    }
    objc_msgSend(v13, "stringFromNumber:", &unk_1EA3B3B60);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v14, "isEqualToString:", v16))
    {
      objc_msgSend(v13, "stringFromNumber:", &unk_1EA3B1B70);
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (__CFString *)v17;
    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;

        v14 = v20;
      }

    }
    goto LABEL_24;
  }
  if (objc_msgSend(v10, "valueType") == 1)
  {
    objc_msgSend(v8, "valueTitles");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v9, "indexValue"));
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v14 = (__CFString *)v15;
LABEL_24:

    goto LABEL_25;
  }
  if (objc_msgSend(v10, "valueType") == 3)
  {
    v12 = v8;
    if ((objc_msgSend(v9, "BOOLeanValue") & 1) != 0)
      objc_msgSend(v12, "onTitle");
    else
      objc_msgSend(v12, "offTitle");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v14 = &stru_1EA3325A0;
LABEL_25:

  return v14;
}

- (id)menuTitleForControlAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CAMSystemOverlayViewController controls](self, "controls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isControlEnabledAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  -[CAMSystemOverlayViewController controls](self, "controls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  -[CAMSystemOverlayViewController controls](self, "controls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");

  return v9;
}

- (void)overlayView:(id)a3 performedDismissGesture:(id)a4
{
  -[CAMSystemOverlayViewController dismissOverlayForced:](self, "dismissOverlayForced:", 1, a4);
}

- (void)dismissOverlayForced:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (a3
    || (-[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "currentStage"),
        v4,
        !v5))
  {
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endAllStages");

    -[CAMSystemOverlayViewController _cancelHandleBarTimerIfNeeded](self, "_cancelHandleBarTimerIfNeeded");
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hideImmediately");

    -[CAMSystemOverlayViewController _updateSliderStateAnimated:](self, "_updateSliderStateAnimated:", 1);
    -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSliderVisibleParameter:", 0);

  }
}

- (void)updateUIForCapturingMovieRecording:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSliderFeedbackDisabled:", v3);

  -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecordingParameter:", v3);

  if (v3)
  {
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "currentStage");

    if (v8 == 4)
      -[CAMSystemOverlayViewController dismissOverlayForced:](self, "dismissOverlayForced:", 1);
  }
}

- (void)_motionControllerDidChangeOrientation:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[CAMSystemOverlayViewController _motionController](self, "_motionController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSliderVisible");

  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOrientation:animated:", objc_msgSend(v8, "captureOrientation"), v5);

  -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsPortraitOrientation:", objc_msgSend(v8, "captureOrientation") == 1);

}

- (void)setControls:(id)a3 updatesByID:(id)a4 activeControl:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int AppBooleanValue;
  void *v35;
  int v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  void *v47;
  Boolean keyExistsAndHasValidFormat;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  const __CFString *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAMSystemOverlayViewController controls](self, "controls");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToArray:", v11) & 1) != 0)
  {
    -[CAMSystemOverlayViewController _updatesByID](self, "_updatesByID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqualToDictionary:", v12);

    if ((v13 & 1) != 0)
      goto LABEL_37;
  }
  else
  {

  }
  v14 = v9;
  v15 = (void *)objc_msgSend(v9, "mutableCopy");
  -[CAMSystemOverlayViewController _setUpdatesByID:](self, "_setUpdatesByID:", v15);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v46 = v8;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v50 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v22, "identifier", v46);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v19);
  }

  -[CAMSystemOverlayViewController _setControlsByID:](self, "_setControlsByID:", v16);
  -[CAMSystemOverlayViewController _setControls:](self, "_setControls:", v17);
  -[CAMSystemOverlayViewController _setSelectedControlIndex:](self, "_setSelectedControlIndex:", 0);
  if (v10)
  {
    v24 = objc_msgSend(v17, "indexOfObject:", v10);
    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CAMSystemOverlayViewController _setSelectedControlIndex:](self, "_setSelectedControlIndex:", v24);
      -[CAMSystemOverlayViewController _setActiveControl:](self, "_setActiveControl:", v10);
    }
  }
  -[CAMSystemOverlayViewController activeControl](self, "activeControl", v46);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    objc_msgSend(v17, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayViewController _setActiveControl:](self, "_setActiveControl:", v26);

  }
  v27 = objc_msgSend(v17, "count");
  v9 = v14;
  if ((v27 != 0) != -[CAMSystemOverlayViewController _overlayEnabled](self, "_overlayEnabled"))
  {
    v28 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = CFSTR("disabled");
      if (v27)
        v29 = CFSTR("enabled");
      *(_DWORD *)buf = 138543362;
      v54 = v29;
      _os_log_impl(&dword_1DB760000, v28, OS_LOG_TYPE_DEFAULT, "OverlayVC: %{public}@", buf, 0xCu);
    }

    -[CAMSystemOverlayViewController _setOverlayEnabled:](self, "_setOverlayEnabled:", v27 != 0);
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "endAllStages");

  }
  -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayViewController controls](self, "controls");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setControlsCountParameter:", objc_msgSend(v32, "count"));

  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "hideImmediately");

  -[CAMSystemOverlayViewController _updateSliderStateAnimated:](self, "_updateSliderStateAnimated:", 1);
  -[CAMSystemOverlayViewController _updateNumberFormatterRounding](self, "_updateNumberFormatterRounding");
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("systemOverlay.halfPressGestureEnabled"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isHalfPressSupported");

  if (!v36)
  {
    -[CAMSystemOverlayViewController _halfPressRecognizer](self, "_halfPressRecognizer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setEnabled:", 0);

    -[CAMSystemOverlayViewController overlayView](self, "overlayView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setHalfPressEnabled:", 0);

    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setHalfPressEnabled:", 0);

    v8 = v47;
    goto LABEL_33;
  }
  if (keyExistsAndHasValidFormat)
    v37 = AppBooleanValue == 0;
  else
    v37 = 0;
  v38 = !v37;
  -[CAMSystemOverlayViewController _halfPressRecognizer](self, "_halfPressRecognizer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setEnabled:", v38);

  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setHalfPressEnabled:", v38);

  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setHalfPressEnabled:", v38);

  v8 = v47;
  if ((v38 & 1) == 0)
  {
LABEL_33:
    v45 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v45, OS_LOG_TYPE_DEFAULT, "OverlayVC: Half press disabled via defaults write.", buf, 2u);
    }

  }
LABEL_37:

}

- (void)applyControlUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "controlIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayViewController controlsByID](self, "controlsByID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v4, "isValueUpdate"))
    {
      -[CAMSystemOverlayViewController _updatesByID](self, "_updatesByID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, v5);
    }
    else
    {
      if (objc_msgSend(v4, "valueType") != 5)
        goto LABEL_13;
      v12 = objc_msgSend(v4, "isEnabled");
      objc_msgSend(v7, "setEnabled:", v12);
      -[CAMSystemOverlayViewController overlayView](self, "overlayView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isSliderVisible"))
      {
        if (objc_msgSend(v8, "sliderContent") == 1)
        {
          -[CAMSystemOverlayViewController _disabledControlsIndices](self, "_disabledControlsIndices");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "menu");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setDisabledMenuItemsIndices:", v13);

          objc_msgSend(v8, "reloadValueLabel");
        }
        else if (!objc_msgSend(v8, "sliderContent"))
        {
          -[CAMSystemOverlayViewController _selectedControl](self, "_selectedControl");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7 != v15)
            LOBYTE(v12) = 1;

          if ((v12 & 1) == 0)
          {
            -[CAMSystemOverlayViewController overlayView](self, "overlayView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "performMenuPresentation:", 1);

          }
        }
      }
    }

    -[CAMSystemOverlayViewController _selectedControlIdentifier](self, "_selectedControlIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqualToString:", v9);

    if (v10)
      -[CAMSystemOverlayViewController _updateSliderDataIfNeeded](self, "_updateSliderDataIfNeeded");
  }
  else
  {
    v11 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAMSystemOverlayViewController applyControlUpdate:].cold.1((uint64_t)v5, v11);

  }
LABEL_13:

}

- (id)_selectedControl
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[CAMSystemOverlayViewController controls](self, "controls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMSystemOverlayViewController _selectedControlIndex](self, "_selectedControlIndex");
  if (v4 >= objc_msgSend(v3, "count"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSString)_selectedControlIdentifier
{
  void *v2;
  void *v3;

  -[CAMSystemOverlayViewController _selectedControl](self, "_selectedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_controlImageNames
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CAMSystemOverlayViewController controls](self, "controls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "imageName", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_disabledControlsIndices
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[CAMSystemOverlayViewController controls](self, "controls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__CAMSystemOverlayViewController__disabledControlsIndices__block_invoke;
  v6[3] = &unk_1EA32E278;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

uint64_t __58__CAMSystemOverlayViewController__disabledControlsIndices__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEnabled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  return result;
}

- (NSNumberFormatter)_numberFormatter
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;

  numberFormatter = self->__numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = self->__numberFormatter;
    self->__numberFormatter = v4;

    -[NSNumberFormatter setNumberStyle:](self->__numberFormatter, "setNumberStyle:", 1);
    -[NSNumberFormatter setMinimumFractionDigits:](self->__numberFormatter, "setMinimumFractionDigits:", 0);
    -[NSNumberFormatter setMaximumFractionDigits:](self->__numberFormatter, "setMaximumFractionDigits:", 1);
    -[NSNumberFormatter setRoundingIncrement:](self->__numberFormatter, "setRoundingIncrement:", &unk_1EA3B1B80);
    -[CAMSystemOverlayViewController _updateNumberFormatterRounding](self, "_updateNumberFormatterRounding");
    numberFormatter = self->__numberFormatter;
  }
  return numberFormatter;
}

- (void)_updateNumberFormatterRounding
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[CAMSystemOverlayViewController _selectedControl](self, "_selectedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9 = v3;
    v5 = objc_msgSend(v3, "controlType");
    v4 = v9;
    if (!v5)
    {
      -[CAMSystemOverlayViewController _valueRangeForControl:](self, "_valueRangeForControl:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isDiscrete"))
        v7 = 5;
      else
        v7 = 1;
      -[CAMSystemOverlayViewController _numberFormatter](self, "_numberFormatter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRoundingMode:", v7);

      v4 = v9;
    }
  }

}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  char v16;
  char v17;
  BOOL v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __CFString *v39;
  id v40;
  _BOOL4 v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v42 = a5;
  v43 = objc_msgSend(v9, "_button");
  v10 = objc_msgSend(v9, "_stage");
  v11 = objc_msgSend(v9, "_numberOfStages");
  objc_msgSend(v9, "_contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "_stagePhase");
  v14 = 3;
  if (!v13)
    v14 = 0;
  v15 = v13 == 1;
  if (v13 == 1)
    v14 = 1;
  if (v13 == 2)
    v15 = 0;
  v41 = v15;
  if (v13 == 2)
    v14 = 2;
  v44 = v14;
  v16 = objc_msgSend(v12, "touchPositionHints");
  v17 = v16;
  v18 = (v16 & 0xC) != 0;
  if ((v16 & 1) != 0)
    v18 = 0;
  v19 = 0.0;
  v20 = 0.0;
  if ((v16 & 0x10) == 0 && !v18)
  {
    objc_msgSend(v9, "_contact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "positionDelta");
    v19 = v22;

    objc_msgSend(v12, "position");
    v20 = v23;
  }
  v24 = objc_msgSend(v12, "isTouching");
  v25 = 4;
  v26 = 3;
  v27 = 2;
  if (v10 == 1)
    v28 = 1;
  else
    v28 = v24;
  if (v10 <= 1)
    v27 = v28;
  if (v10 != 3)
    v26 = v27;
  if (v10 <= 3)
    v25 = v26;
  if (v11 <= 1)
    v29 = 4 * (v10 != 0);
  else
    v29 = v25;
  if (-[CAMSystemOverlayViewController _debugLoggingEnabled](self, "_debugLoggingEnabled"))
  {
    v30 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringFromUIPhysicalButton();
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_state");
      _NSStringFromUIPhysicalButtonState();
      v40 = v8;
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v39 = off_1EA32E298[v44];
      _NSStringFromUITouchSenstiveButtonPositionHint();
      *(_DWORD *)buf = 138544898;
      v46 = v31;
      v47 = 2114;
      v48 = v32;
      v49 = 1024;
      v50 = v10;
      v51 = 1024;
      v52 = v11;
      v53 = 2114;
      v54 = v39;
      v55 = 2114;
      v56 = v12;
      v57 = 2114;
      v58 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v58;
      _os_log_impl(&dword_1DB760000, v30, OS_LOG_TYPE_DEFAULT, "Observed physical button: %{public}@; state: %{public}@; stage: %d/%d; stagePhase: %{public}@; contact: %{public"
        "}@; hints: %{public}@",
        buf,
        0x40u);

      v8 = v40;
    }

  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", v39);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "isSwipeToOverlaySupported"))
  {
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "isVisible"))
    {

    }
    else
    {

      if ((v17 & 2) == 0)
        goto LABEL_36;
      -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addReason:", 0);
    }
  }

LABEL_36:
  -[CAMSystemOverlayViewController _handleButton:stage:phase:position:delta:](self, "_handleButton:stage:phase:position:delta:", v43, v29, v44, v20, v19);
  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "currentStage");

  if (v37)
  {
    if (v41)
      -[CAMSystemOverlayViewController _currentPositionApplicatorApplyAction:](self, "_currentPositionApplicatorApplyAction:", v9);
  }
  else
  {
    -[CAMSystemOverlayViewController _currentPositionDeltaApplicator](self, "_currentPositionDeltaApplicator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "contactEndedWithAction:", v9);

  }
  -[CAMSystemOverlayViewController _handleContact:action:stage:phase:position:delta:](self, "_handleContact:action:stage:phase:position:delta:", v12, v9, v29, v44, v20, v19);
  -[CAMSystemOverlayViewController _notifyDelegateIfNeededForButtonAction:](self, "_notifyDelegateIfNeededForButtonAction:", v9);

}

- (void)_handleButton:(unint64_t)a3 stage:(unint64_t)a4 phase:(unint64_t)a5 position:(double)a6 delta:(double)a7
{
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  unint64_t v17;
  NSObject *v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[CAMSystemOverlayViewController _overlayEnabled](self, "_overlayEnabled", a6))
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayViewController overlayView](self, "overlayView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSystemOverlayViewController _updateCurrentPositionDeltaApplicatorForDelta:](self, "_updateCurrentPositionDeltaApplicatorForDelta:", a7);
    if (!objc_msgSend(v12, "allowHalfPressSimulation"))
      goto LABEL_6;
    if (a3 == 1)
    {
      a4 = 4;
      goto LABEL_9;
    }
    if (a3 == 2)
    {
      a4 = 3;
    }
    else
    {
LABEL_6:
      if (!a4)
      {
LABEL_31:

        return;
      }
    }
LABEL_9:
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "wantsOverlayVisible");
    objc_msgSend(v14, "handleStage:phase:", a4, a5);
    v16 = objc_msgSend(v14, "wantsOverlayVisible");
    v17 = objc_msgSend(v14, "currentStage");
    if (v15 != v16)
    {
      v18 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (v17 > 4)
          v19 = 0;
        else
          v19 = off_1EA32E2B8[v17];
        v20 = CFSTR("hidden");
        if (v16)
          v20 = CFSTR("visible");
        v25 = 138543618;
        v26 = v19;
        v27 = 2114;
        v28 = v20;
        _os_log_impl(&dword_1DB760000, v18, OS_LOG_TYPE_DEFAULT, "OverlayVC: Button stage %{public}@ wants overlay %{public}@", (uint8_t *)&v25, 0x16u);
      }

    }
    if (v16)
    {
      objc_msgSend(v14, "addReason:", 0);
    }
    else
    {
      objc_msgSend(v14, "removeReason:", 0);
      objc_msgSend(v13, "performMenuPresentation:", 0);
    }
    -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isVisible");

    v23 = objc_msgSend(v13, "sliderContent");
    if (a7 != 0.0 || v17 == 4 || v23 || !v22)
    {
      -[CAMSystemOverlayViewController _cancelHandleBarTimerIfNeeded](self, "_cancelHandleBarTimerIfNeeded");
      -[CAMSystemOverlayViewController overlayView](self, "overlayView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHandleBarVisible:animated:", 0, 1);

      if (!a5 && v17 == 4)
        -[CAMSystemOverlayViewController _selectCurrentMenuItemIfMenuVisible](self, "_selectCurrentMenuItemIfMenuVisible");
    }
    else if (v17)
    {
      -[CAMSystemOverlayViewController _startHandleBarTimerIfNeeded](self, "_startHandleBarTimerIfNeeded");
    }
    objc_msgSend(v13, "updateUIForButtonStage:", a4);

    goto LABEL_31;
  }
}

- (void)_handleContact:(id)a3 action:(id)a4 stage:(unint64_t)a5 phase:(unint64_t)a6 position:(double)a7 delta:(double)a8
{
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v14 = a4;
  if (-[CAMSystemOverlayViewController _overlayEnabled](self, "_overlayEnabled"))
  {
    if (a5 != 1 || a6)
    {
      if (a5 == 1 && a6 == 2)
      {
        -[CAMSystemOverlayViewController _halfPressRecognizer](self, "_halfPressRecognizer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "contactEnded:action:", v17, v14);
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      -[CAMSystemOverlayViewController _halfPressRecognizer](self, "_halfPressRecognizer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contactBegan:action:", v17, v14);

    }
    -[CAMSystemOverlayViewController _halfPressRecognizer](self, "_halfPressRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contactUpdated:action:filteredPosition:filteredDelta:", v17, v14, a7, a8);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_notifyDelegateIfNeededForButtonAction:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "_button");
  v5 = 0;
  v6 = 0;
  switch(v4)
  {
    case 1:
    case 2:
      v6 = 1;
      v5 = v4;
      break;
    case 3:
      v6 = 1;
      v5 = 5;
      break;
    case 5:
      v6 = 1;
      v5 = 6;
      break;
    default:
      break;
  }
  v7 = objc_msgSend(v15, "_state");
  if (v7 >= 3)
    v8 = 3;
  else
    v8 = v7;
  if (v5 == 6)
  {
    v12 = objc_msgSend(v15, "_stage");
    if ((unint64_t)objc_msgSend(v15, "_numberOfStages") >= 2)
      v6 = v12 > 3;
    else
      v6 = v12 != 0;
    v13 = objc_msgSend(v15, "_stagePhase");
    if (v13 == 2)
    {
      v11 = v15;
      if (!v6)
        goto LABEL_32;
LABEL_29:
      -[CAMSystemOverlayViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "systemOverlayViewController:pressEndedForButton:", self, v5);
      goto LABEL_31;
    }
    v11 = v15;
    if (v13 == 1)
      goto LABEL_32;
    if (!v13)
    {
      if (!v6)
        goto LABEL_32;
      goto LABEL_28;
    }
    v8 = 3;
  }
  else
  {
    if (v5 == 2)
    {
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "allowHalfPressSimulation");

      v11 = v15;
      if ((v10 & 1) != 0)
        goto LABEL_32;
      goto LABEL_25;
    }
    v11 = v15;
  }
  if (!v6)
    goto LABEL_32;
LABEL_25:
  switch(v8)
  {
    case 3:
      -[CAMSystemOverlayViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "systemOverlayViewController:pressCancelledForButton:", self, v5);
      goto LABEL_31;
    case 2:
      goto LABEL_29;
    case 0:
LABEL_28:
      -[CAMSystemOverlayViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "systemOverlayViewController:pressBeganForButton:", self, v5);
LABEL_31:

      v11 = v15;
      break;
  }
LABEL_32:

}

- (void)_updateSliderStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;

  v3 = a3;
  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
  v5 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isVisible](v5, "isVisible"))
  {
LABEL_5:

    goto LABEL_6;
  }
  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wantsOverlayHint");

  if (v7)
  {
    v5 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CAMSystemOverlayViewController _updateSliderStateAnimated:].cold.1(v5);
    goto LABEL_5;
  }
LABEL_6:
  -[CAMSystemOverlayViewController _updateSliderStateWithOffset:animated:](self, "_updateSliderStateWithOffset:animated:", v3, 0.0);
}

- (void)_updateSliderStateWithOffset:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a4;
  v7 = -[CAMSystemOverlayViewController _overlayEnabled](self, "_overlayEnabled");
  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isVisible") & v7;

  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  if ((_DWORD)v9)
  {
    +[CAMOverlaySliderState presentedState](CAMOverlaySliderState, "presentedState");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "wantsOverlayHint");

  if (v12)
  {
    +[CAMOverlaySliderState hintWithNormalizedButtonOffset:](CAMOverlaySliderState, "hintWithNormalizedButtonOffset:", a3 + 0.5, a3 + 0.5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    +[CAMOverlaySliderState hiddenState](CAMOverlaySliderState, "hiddenState");
    v10 = objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  v13 = (void *)v10;
  v14 = objc_msgSend(v18, "isSliderVisible");
  objc_msgSend(v18, "setSliderState:animated:", v13, v4);
  if ((_DWORD)v9 != v14)
  {
    v15 = -[CAMSystemOverlayViewController isControlEnabledAtIndex:](self, "isControlEnabledAtIndex:", -[CAMSystemOverlayViewController _selectedControlIndex](self, "_selectedControlIndex"));
    if ((_DWORD)v9 && !v15)
    {
      -[CAMSystemOverlayViewController overlayView](self, "overlayView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "performMenuPresentation:", 1);

    }
    -[CAMSystemOverlayViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "systemOverlayViewController:didChangeSliderVisible:", self, v9);

  }
}

- (void)_currentPositionApplicatorApplyAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMSystemOverlayViewController _currentPositionDeltaApplicator](self, "_currentPositionDeltaApplicator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactBeganWithAction:", v4);
  objc_msgSend(v5, "contactUpdatedWithAction:", v4);

}

- (void)_updateCurrentPositionDeltaApplicatorForDelta:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  -[CAMSystemOverlayViewController overlayView](self, "overlayView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentStage");

  if (objc_msgSend(v4, "isSliderPresented")
    && (v6 == 1 || !-[CAMSystemOverlayViewController _ignoreScrollUnderPressure](self, "_ignoreScrollUnderPressure")))
  {
    v7 = objc_msgSend(v4, "sliderContent");
    if (!v7)
    {
      objc_msgSend(v4, "slider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (v7 == 1)
    {
      objc_msgSend(v4, "menu");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = v8;
      objc_msgSend(v8, "contactRecognizer");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v11;
      goto LABEL_10;
    }
  }
  v9 = 0;
LABEL_10:
  v12 = v9;
  -[CAMSystemOverlayViewController _setCurrentPositionDeltaApplicator:](self, "_setCurrentPositionDeltaApplicator:", v9);

}

- (void)_setCurrentPositionDeltaApplicator:(id)a3
{
  CEKContactRecognizer *currentPositionDeltaApplicator;

  currentPositionDeltaApplicator = self->__currentPositionDeltaApplicator;
  if (currentPositionDeltaApplicator != a3)
  {
    -[CEKContactRecognizer contactEndedWithAction:](currentPositionDeltaApplicator, "contactEndedWithAction:", 0);
    self->__currentPositionDeltaApplicator = (CEKContactRecognizer *)a3;
  }
}

- (void)_updateSliderDataIfNeeded
{
  void *v3;
  int v4;

  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSliderVisible");

  if (v4)
    -[CAMSystemOverlayViewController _forceUpdateSliderData](self, "_forceUpdateSliderData");
}

- (void)_forceUpdateSliderData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slider");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMSystemOverlayViewController controls](self, "controls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", -[CAMSystemOverlayViewController _selectedControlIndex](self, "_selectedControlIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMSystemOverlayViewController _displayValueRangeForControl:](self, "_displayValueRangeForControl:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayViewController _updatesByID](self, "_updatesByID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CAMSystemOverlayViewController _styleForControl:](self, "_styleForControl:", v5);
  v11 = 0;
  if (!CFPreferencesGetAppIntegerValue(CFSTR("systemOverlay.magneticRangeDisabled"), CFSTR("com.apple.camera"), 0))
  {
    -[CAMSystemOverlayViewController _primaryValuesForControl:](self, "_primaryValuesForControl:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "configureWithRange:magneticRange:style:", v6, v11, v10);
  -[CAMSystemOverlayViewController _displayNumberForControl:update:](self, "_displayNumberForControl:update:", v5, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurrentNumber:", v12);

}

- (id)_valueRangeForControl:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "controlType");
  if (v4 == 2)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D0D130]);
  }
  else
  {
    if (v4 == 1)
    {
      v7 = objc_alloc(MEMORY[0x1E0D0D158]);
      objc_msgSend(v3, "valueTitles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "initWithCount:", objc_msgSend(v8, "count"));

      goto LABEL_9;
    }
    if (v4)
    {
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v3, "valueRange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_9:

  return v6;
}

- (id)_displayValueRangeForControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "controlType"))
  {
    -[CAMSystemOverlayViewController _valueRangeForControl:](self, "_valueRangeForControl:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "displayValueRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v4, "valueRange");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (int64_t)_rangeScaleForControl:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "controlType"))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "rangeScale");

  return v4;
}

- (id)_primaryValuesForControl:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "controlType"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "primaryValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_numberForUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "valueType");
  if (v5 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "BOOLeanValue"));
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = (void *)v13;
    goto LABEL_13;
  }
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "indexValue"));
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v5)
  {
    v12 = &unk_1EA3B1330;
  }
  else
  {
    -[CAMSystemOverlayViewController controlsByID](self, "controlsByID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controlIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMSystemOverlayViewController _valueRangeForControl:](self, "_valueRangeForControl:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isDiscrete") && !objc_msgSend(v9, "count"))
    {
      v12 = 0;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "floatValue");
      objc_msgSend(v9, "valueClosestToValue:", v11);
      objc_msgSend(v10, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_13:

  return v12;
}

- (id)_displayNumberForControl:(id)a3 update:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;

  v6 = a4;
  if (objc_msgSend(a3, "controlType"))
    goto LABEL_6;
  -[CAMSystemOverlayViewController controlsByID](self, "controlsByID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controlIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "values");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count") || !objc_msgSend(v11, "count"))
  {

LABEL_6:
    -[CAMSystemOverlayViewController _numberForUpdate:](self, "_numberForUpdate:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "floatValue");
  +[CAMZoomControlUtilities piecewiseLinearMappingForX:fromXValues:toYValues:](CAMZoomControlUtilities, "piecewiseLinearMappingForX:fromXValues:toYValues:", v10, v11, v13);
  objc_msgSend(v12, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v14;
}

- (id)_updateForControl:(id)a3 displayValue:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "controlType");
  if (v7 == 2)
  {
    objc_msgSend(v5, "updateWithBooleanValue:", objc_msgSend(v6, "BOOLValue"));
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v14 = (void *)v15;
    goto LABEL_12;
  }
  if (v7 == 1)
  {
    objc_msgSend(v5, "updateWithIndexValue:", objc_msgSend(v6, "integerValue"));
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v7)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v6, "doubleValue");
    v9 = v8;
    v10 = v5;
    objc_msgSend(v10, "values");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") && objc_msgSend(v12, "count"))
    {
      +[CAMZoomControlUtilities piecewiseLinearMappingForX:fromXValues:toYValues:](CAMZoomControlUtilities, "piecewiseLinearMappingForX:fromXValues:toYValues:", v12, v11, v9);
      v9 = v13;
    }
    *(float *)&v13 = v9;
    objc_msgSend(v10, "updateWithFloatValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_12:

  return v14;
}

- (unint64_t)_styleForControl:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "controlType");
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4)
    {
      v5 = 0;
    }
    else
    {
      v6 = v3;
      v5 = 5;
      switch(objc_msgSend(v6, "sliderType"))
      {
        case 0:
        case 2:
        case 3:
        case 4:
          v5 = 0;
          break;
        case 1:
          v5 = 2;
          break;
        case 5:
        case 6:
          objc_msgSend(v6, "displayValueRange");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "maximum");
          v9 = v8;
          objc_msgSend(v7, "minimum");
          if (v9 - v10 < 5.0)
            v5 = 1;
          else
            v5 = 3;

          break;
        case 7:
          break;
        default:

          goto LABEL_2;
      }

    }
  }
  else
  {
LABEL_2:
    v5 = 4;
  }

  return v5;
}

- (void)_cancelHandleBarTimerIfNeeded
{
  NSObject *v3;
  NSObject *v4;

  -[CAMSystemOverlayViewController _handleBarTimer](self, "_handleBarTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    dispatch_source_cancel(v3);
    -[CAMSystemOverlayViewController _setHandleBarTimer:](self, "_setHandleBarTimer:", 0);
    v3 = v4;
  }

}

- (void)_startHandleBarTimerIfNeeded
{
  void *v3;
  CFIndex AppIntegerValue;
  int64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id from;
  id location;

  -[CAMSystemOverlayViewController _handleBarTimer](self, "_handleBarTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("systemOverlay.sliderHandleAppearAfterMilliseconds"), CFSTR("com.apple.camera"), 0);
    if (AppIntegerValue <= 0)
      v5 = 3000000000;
    else
      v5 = (uint64_t)((double)AppIntegerValue * 1000000.0);
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v7 = dispatch_time(0, v5);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)v5 * 0.1));
    -[CAMSystemOverlayViewController _setHandleBarTimer:](self, "_setHandleBarTimer:", v6);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__CAMSystemOverlayViewController__startHandleBarTimerIfNeeded__block_invoke;
    v8[3] = &unk_1EA32B390;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    dispatch_source_set_event_handler(v6, v8);
    dispatch_resume(v6);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __62__CAMSystemOverlayViewController__startHandleBarTimerIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleBarTimerFired:", v2);

}

- (void)_handleBarTimerFired:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CAMSystemOverlayViewController _handleBarTimer](self, "_handleBarTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSystemOverlayViewController _stateMachine](self, "_stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentStage");

  if (v8 && v8 == v4 && v6)
  {
    -[CAMSystemOverlayViewController overlayView](self, "overlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHandleBarVisible:animated:", 1, 1);

  }
  -[CAMSystemOverlayViewController _cancelHandleBarTimerIfNeeded](self, "_cancelHandleBarTimerIfNeeded");

}

- (void)systemOverlayVisibility:(id)a3 changedForReason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CAMSystemOverlayViewController _forceUpdateSliderData](self, "_forceUpdateSliderData");
  -[CAMSystemOverlayViewController _updateSliderStateAnimated:](self, "_updateSliderStateAnimated:", 1);
  if ((objc_msgSend(v10, "isVisible") & 1) != 0)
  {
    -[CAMSystemOverlayViewController activeControl](self, "activeControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CAMSystemOverlayViewController _selectedControl](self, "_selectedControl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSystemOverlayViewController _setActiveControl:](self, "_setActiveControl:", v6);
      -[CAMSystemOverlayViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemOverlayViewController:didChangeActiveControl:", self, v6);

    }
    -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordSliderVisibleEvent");

  }
  else
  {
    -[CAMSystemOverlayViewController _cancelHandleBarTimerIfNeeded](self, "_cancelHandleBarTimerIfNeeded");
  }
  -[CAMSystemOverlayViewController _tipManager](self, "_tipManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSliderVisibleParameter:", objc_msgSend(v10, "isVisible"));

}

- (void)systemOverlayVisibilityBeganHidingTimer:(id)a3
{
  id v4;

  -[CAMSystemOverlayViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemOverlayViewControllerWillHideSlider:", self);

}

- (void)systemOverlayVisibilityCancelledHidingTimer:(id)a3
{
  id v4;

  -[CAMSystemOverlayViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemOverlayViewControllerCancelledHidingSlider:", self);

}

- (void)halfPressContactRecognizerSingleHalfPressDidBegin:(id)a3 timestamp:(double)a4
{
  void *v6;
  CFIndex AppIntegerValue;
  double v8;
  double v9;
  void *v10;
  void *v11;
  Boolean keyExistsAndHasValidFormat;

  -[CAMSystemOverlayViewController overlayView](self, "overlayView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("systemOverlay.debounceIntervalAfterDoubleHalfPressInMS"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (AppIntegerValue <= 0)
    v8 = 200.0;
  else
    v8 = (double)AppIntegerValue;
  -[CAMSystemOverlayViewController _doubleHalfPressTimestamp](self, "_doubleHalfPressTimestamp");
  if (v9 * -1000.0 + a4 * 1000.0 >= v8)
  {
    -[CAMSystemOverlayViewController _setDebounceHalfPress:](self, "_setDebounceHalfPress:", 0);
    if (objc_msgSend(v6, "isSliderVisible") && objc_msgSend(v6, "sliderContent") == 1)
    {
      objc_msgSend(v6, "menu");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHighlightCurrentSelectedIndex:animated:", 1, 1);

    }
  }
  else
  {
    objc_msgSend(v6, "menu");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHighlightCurrentSelectedIndex:animated:", 0, 1);

    -[CAMSystemOverlayViewController _setDebounceHalfPress:](self, "_setDebounceHalfPress:", 1);
  }

}

- (void)halfPressContactRecognizerSingleHalfPressDidCancel:(id)a3 timestamp:(double)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  -[CAMSystemOverlayViewController overlayView](self, "overlayView", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSliderVisible"))
    v4 = objc_msgSend(v6, "sliderContent") == 1;
  else
    v4 = 0;
  objc_msgSend(v6, "menu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightCurrentSelectedIndex:animated:", 0, v4);

}

- (void)halfPressContactRecognizerSingleHalfPressDidEnd:(id)a3 timestamp:(double)a4
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSliderVisible"))
    v6 = objc_msgSend(v5, "sliderContent") == 1;
  else
    v6 = 0;
  if (-[CAMSystemOverlayViewController _debounceHalfPress](self, "_debounceHalfPress"))
  {
    objc_msgSend(v5, "menu");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlightCurrentSelectedIndex:animated:", 0, v6);

  }
  else if (-[CAMSystemOverlayViewController _selectCurrentMenuItemIfMenuVisible](self, "_selectCurrentMenuItemIfMenuVisible"))
  {
    objc_msgSend(v8, "reset");
  }

}

- (BOOL)_selectCurrentMenuItemIfMenuVisible
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  void *v11;

  -[CAMSystemOverlayViewController overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSliderVisible") && objc_msgSend(v3, "sliderContent") == 1)
  {
    objc_msgSend(v3, "menu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "selectedControlIndex");

    -[CAMSystemOverlayViewController controls](self, "controls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= objc_msgSend(v6, "count"))
    {
      v10 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CAMSystemOverlayViewController _selectCurrentMenuItemIfMenuVisible].cold.1(v6);

    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEnabled");

      if (v8)
      {
        objc_msgSend(v3, "performMenuPresentation:", 2);
        v9 = 1;
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v3, "menu");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHighlightCurrentSelectedIndex:animated:", 0, 1);

    }
    v9 = 0;
    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (void)halfPressContactRecognizerDoubleHalfPressDidEnd:(id)a3 timestamp:(double)a4
{
  void *v6;
  int v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;

  if (!-[CAMSystemOverlayViewController _debounceHalfPress](self, "_debounceHalfPress", a3))
  {
    if (-[CAMSystemOverlayViewController _doubleHalfPressOpensMenu](self, "_doubleHalfPressOpensMenu"))
    {
      -[CAMSystemOverlayViewController overlayView](self, "overlayView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isSliderVisible");

      if (v7)
      {
        -[CAMSystemOverlayViewController overlayView](self, "overlayView");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isSliderVisible"))
          v8 = objc_msgSend(v11, "sliderContent") == 1;
        else
          v8 = 0;
        objc_msgSend(v11, "menu");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHighlightCurrentSelectedIndex:animated:", 0, v8);

        -[CAMSystemOverlayViewController _setDoubleHalfPressTimestamp:](self, "_setDoubleHalfPressTimestamp:", a4);
        -[CAMSystemOverlayViewController overlayView](self, "overlayView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "performMenuPresentation:", 1);

      }
    }
  }
}

- (CAMSystemOverlayViewControllerDelegate)delegate
{
  return (CAMSystemOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAMAbstractOverlayServiceControl)activeControl
{
  return self->_activeControl;
}

- (void)_setActiveControl:(id)a3
{
  objc_storeStrong((id *)&self->_activeControl, a3);
}

- (NSArray)controls
{
  return self->_controls;
}

- (void)_setControls:(id)a3
{
  objc_storeStrong((id *)&self->_controls, a3);
}

- (NSDictionary)controlsByID
{
  return self->_controlsByID;
}

- (void)_setControlsByID:(id)a3
{
  objc_storeStrong((id *)&self->_controlsByID, a3);
}

- (NSMutableDictionary)_updatesByID
{
  return self->__updatesByID;
}

- (void)_setUpdatesByID:(id)a3
{
  objc_storeStrong((id *)&self->__updatesByID, a3);
}

- (unint64_t)_selectedControlIndex
{
  return self->__selectedControlIndex;
}

- (void)_setSelectedControlIndex:(unint64_t)a3
{
  self->__selectedControlIndex = a3;
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (CAMSystemOverlayStateMachine)_stateMachine
{
  return self->__stateMachine;
}

- (BOOL)_overlayEnabled
{
  return self->__overlayEnabled;
}

- (void)_setOverlayEnabled:(BOOL)a3
{
  self->__overlayEnabled = a3;
}

- (BOOL)_debugLoggingEnabled
{
  return self->__debugLoggingEnabled;
}

- (BOOL)_doubleHalfPressOpensMenu
{
  return self->__doubleHalfPressOpensMenu;
}

- (_UIPhysicalButtonInteraction)_buttonInteraction
{
  return self->__buttonInteraction;
}

- (void)_setPhysicalButtonInteraction:(id)a3
{
  objc_storeStrong((id *)&self->__buttonInteraction, a3);
}

- (CEKContactRecognizer)_currentPositionDeltaApplicator
{
  return self->__currentPositionDeltaApplicator;
}

- (OS_dispatch_source)_handleBarTimer
{
  return self->__handleBarTimer;
}

- (void)_setHandleBarTimer:(id)a3
{
  objc_storeStrong((id *)&self->__handleBarTimer, a3);
}

- (CAMHalfPressContactRecognizer)_halfPressRecognizer
{
  return self->__halfPressRecognizer;
}

- (double)_doubleHalfPressTimestamp
{
  return self->__doubleHalfPressTimestamp;
}

- (void)_setDoubleHalfPressTimestamp:(double)a3
{
  self->__doubleHalfPressTimestamp = a3;
}

- (BOOL)_debounceHalfPress
{
  return self->__debounceHalfPress;
}

- (void)_setDebounceHalfPress:(BOOL)a3
{
  self->__debounceHalfPress = a3;
}

- (BOOL)_ignoreScrollUnderPressure
{
  return self->__ignoreScrollUnderPressure;
}

- (CAMSystemOverlayTipManager)_tipManager
{
  return self->__tipManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tipManager, 0);
  objc_storeStrong((id *)&self->__halfPressRecognizer, 0);
  objc_storeStrong((id *)&self->__handleBarTimer, 0);
  objc_storeStrong((id *)&self->__buttonInteraction, 0);
  objc_storeStrong((id *)&self->__stateMachine, 0);
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->__updatesByID, 0);
  objc_storeStrong((id *)&self->_controlsByID, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_activeControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__numberFormatter, 0);
}

- (void)overlayView:(void *)a1 menuWillChangePresented:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v1, v2, "Menu hiding on item index %lu; %lu available", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)valueTextForCurrentControl
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "controls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  objc_msgSend(a1, "_selectedControlIndex");
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v3, v4, "OverlayVC: Attempt to request text for control out of bounds. There are %lu controls, current index is %lu", v5, v6, v7, v8, 0);

}

- (void)applyControlUpdate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "OverlayVC: Attempt to set value for nil control %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateSliderStateAnimated:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Using default position for hint while updating slider with missing position", v1, 2u);
}

- (void)_selectCurrentMenuItemIfMenuVisible
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v1, v2, "Half press attempted selecting control at index %lu; %lu available",
    v3,
    v4,
    v5,
    v6,
    v7);
  OUTLINED_FUNCTION_1();
}

@end
