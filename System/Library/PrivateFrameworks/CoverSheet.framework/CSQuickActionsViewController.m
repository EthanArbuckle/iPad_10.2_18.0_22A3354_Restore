@implementation CSQuickActionsViewController

- (CSQuickActionsViewController)init
{
  id v3;
  CSQuickActionsViewController *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DA9FA8]);
  v4 = -[CSQuickActionsViewController initWithLockScreenDefaults:applicationInformer:](self, "initWithLockScreenDefaults:applicationInformer:", v3, 0);

  return v4;
}

- (CSQuickActionsViewController)initWithLockScreenDefaults:(id)a3 applicationInformer:(id)a4
{
  id v7;
  id v8;
  CSQuickActionsViewController *v9;
  CSQuickActionsViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CSLockScreenSettings *prototypeSettings;
  id v15;
  void *v16;
  uint64_t v17;
  CHSWidgetExtensionProvider *extensionProvider;
  SBMiscellaneousDefaults *v19;
  SBMiscellaneousDefaults *miscellaneousSettings;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CSQuickActionsViewController;
  v9 = -[CSQuickActionsViewController init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lockScreenDefaults, a3);
    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addMonitor:subjectMask:subscriptionOptions:", v10, 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_appProtectionSubjectMonitorSubscription, v12);

    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v13 = objc_claimAutoreleasedReturnValue();
    prototypeSettings = v10->_prototypeSettings;
    v10->_prototypeSettings = (CSLockScreenSettings *)v13;

    -[PTSettings addKeyObserver:](v10->_prototypeSettings, "addKeyObserver:", v10);
    v15 = objc_alloc(MEMORY[0x1E0D101B0]);
    objc_msgSend(MEMORY[0x1E0D101C0], "visibleControls");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithOptions:", v16);
    extensionProvider = v10->_extensionProvider;
    v10->_extensionProvider = (CHSWidgetExtensionProvider *)v17;

    -[CHSWidgetExtensionProvider registerObserver:](v10->_extensionProvider, "registerObserver:", v10);
    v19 = (SBMiscellaneousDefaults *)objc_alloc_init(MEMORY[0x1E0DA9FB0]);
    miscellaneousSettings = v10->_miscellaneousSettings;
    v10->_miscellaneousSettings = v19;

    objc_storeWeak((id *)&v10->_applicationInformer, v8);
  }

  return v10;
}

- (void)loadView
{
  CSQuickActionsView *v3;
  void *v4;
  void *v5;
  void *v6;
  CSQuickActionsView *v7;

  v3 = [CSQuickActionsView alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = -[CSQuickActionsView initWithFrame:delegate:](v3, "initWithFrame:delegate:", self);

  -[CSQuickActionsView setDelegate:](v7, "setDelegate:", self);
  -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legibilitySettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSQuickActionsView setLegibilitySettings:](v7, "setLegibilitySettings:", v6);

  -[CSQuickActionsViewController setView:](self, "setView:", v7);
  -[CSQuickActionsViewController _addStateCaptureHandlers](self, "_addStateCaptureHandlers");

}

- (void)setQuickActionsConfiguration:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  CSQuickAction *v10;
  CSQuickAction *leadingAction;
  NSObject *v12;
  CSQuickAction *v13;
  void *v14;
  void *v15;
  CSQuickAction *v16;
  CSQuickAction *trailingAction;
  NSObject *v18;
  CSQuickAction *v19;
  int v20;
  CSQuickAction *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_quickActionsConfiguration, a3);
    objc_msgSend(v5, "controls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 >= 2)
    {
      objc_msgSend(v5, "controls");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((BSEqualObjects() & 1) == 0)
      {
        objc_storeStrong((id *)&self->_leadingConfiguration, v9);
        -[CSQuickActionsViewController _quickActionForConfiguration:](self, "_quickActionForConfiguration:", self->_leadingConfiguration);
        v10 = (CSQuickAction *)objc_claimAutoreleasedReturnValue();
        leadingAction = self->_leadingAction;
        self->_leadingAction = v10;

        SBLogDashBoard();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = self->_leadingAction;
          v20 = 138543362;
          v21 = v13;
          _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, "[Quick Action] leadingConfiguration updated, new leadingAction: %{public}@", (uint8_t *)&v20, 0xCu);
        }

      }
      objc_msgSend(v5, "controls");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((BSEqualObjects() & 1) == 0)
      {
        objc_storeStrong((id *)&self->_trailingConfiguration, v15);
        -[CSQuickActionsViewController _quickActionForConfiguration:](self, "_quickActionForConfiguration:", self->_trailingConfiguration);
        v16 = (CSQuickAction *)objc_claimAutoreleasedReturnValue();
        trailingAction = self->_trailingAction;
        self->_trailingAction = v16;

        SBLogDashBoard();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = self->_trailingAction;
          v20 = 138543362;
          v21 = v19;
          _os_log_impl(&dword_1D0337000, v18, OS_LOG_TYPE_DEFAULT, "[Quick Action] trailingConfiguration updated, new trailingAction: %{public}@", (uint8_t *)&v20, 0xCu);
        }

      }
      -[CSQuickActionsViewController _validateActions](self, "_validateActions");

    }
  }

}

- (id)_quickActionForConfiguration:(id)a3
{
  id v4;
  CSEmptyQuickAction *v5;

  v4 = a3;
  switch(objc_msgSend(v4, "category"))
  {
    case 0:
      v5 = objc_alloc_init(CSEmptyQuickAction);
      goto LABEL_6;
    case 1:
      v5 = -[CSQuickActionsViewController _newFlashlightAction](self, "_newFlashlightAction");
      goto LABEL_6;
    case 2:
      v5 = self->_cameraAction;
      goto LABEL_6;
    case 3:
      -[CSQuickActionsViewController _actionForSystemControl:](self, "_actionForSystemControl:", v4);
      v5 = (CSEmptyQuickAction *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      self = (CSQuickActionsViewController *)v5;
      break;
    default:
      break;
  }

  return self;
}

- (void)_setupFlashlightControllerIfNecessary
{
  CSQuickAction *leadingAction;
  uint64_t v4;
  CSQuickAction *v5;
  CSQuickAction *v6;
  CSQuickAction *v7;
  CSQuickAction *v8;
  NSObject *v9;
  CSQuickAction *v10;
  CSQuickAction *trailingAction;
  uint64_t v12;
  CSQuickAction *v13;
  __int16 v14[8];

  leadingAction = self->_leadingAction;
  if (leadingAction)
  {
    v4 = objc_opt_class();
    v5 = leadingAction;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v10 = v6;

    if (v10)
    {

LABEL_18:
      -[CSQuickActionsViewController _setupFlashlightController](self, "_setupFlashlightController");
      return;
    }
    trailingAction = self->_trailingAction;
    v12 = objc_opt_class();
    v13 = trailingAction;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = (uint64_t)v13;
      else
        v12 = 0;
    }

    if (v12)
      goto LABEL_18;
  }
  else
  {
    v7 = -[CSQuickActionsViewController _newFlashlightAction](self, "_newFlashlightAction");
    v8 = self->_leadingAction;
    self->_leadingAction = v7;

    SBLogDashBoard();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 0;
      _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "[Quick Action] leading action being defaulted to flashlight", (uint8_t *)v14, 2u);
    }

  }
}

- (void)_setupFlashlightController
{
  SBUIFlashlightController *v3;
  SBUIFlashlightController *flashlight;
  void *v5;
  void *v6;

  if (objc_msgSend(MEMORY[0x1E0DAC290], "deviceSupportsFlashlight"))
  {
    if (!self->_flashlight)
    {
      objc_msgSend(MEMORY[0x1E0DAC290], "sharedInstance");
      v3 = (SBUIFlashlightController *)objc_claimAutoreleasedReturnValue();
      flashlight = self->_flashlight;
      self->_flashlight = v3;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__deviceBlockStateDidChangeNotification_, *MEMORY[0x1E0DAA050], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__featureLockStateDidChangeNotification_, *MEMORY[0x1E0DAC320], 0);

      -[CSQuickActionsViewController _updateFlashlightAction:](self, "_updateFlashlightAction:", self->_leadingAction);
      -[CSQuickActionsViewController _updateFlashlightAction:](self, "_updateFlashlightAction:", self->_trailingAction);
    }
  }
}

- (void)_updateFlashlightAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = objc_opt_class();
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "setFlashlightController:", self->_flashlight);
    -[SBUIFlashlightController addObserver:](self->_flashlight, "addObserver:", v7);
  }

}

- (id)_newFlashlightAction
{
  if (!objc_msgSend(MEMORY[0x1E0DAC290], "deviceSupportsFlashlight"))
    return 0;
  -[CSQuickActionsViewController _setupFlashlightController](self, "_setupFlashlightController");
  return -[CSFlashlightQuickAction initWithFlashlightController:]([CSFlashlightQuickAction alloc], "initWithFlashlightController:", self->_flashlight);
}

- (id)_actionForSystemControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  CSCameraSystemQuickAction *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __objc2_class *v15;
  CSCameraSystemQuickAction *v16;

  v4 = a3;
  -[CSQuickActionsViewController _controlInstanceForSystemControl:](self, "_controlInstanceForSystemControl:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BSEqualStrings();

  if (v9)
  {
    v10 = -[CSCameraSystemQuickAction initWithQuickActionControlIdentity:instance:delegate:prewarmer:prototypeSettings:defaults:]([CSCameraSystemQuickAction alloc], "initWithQuickActionControlIdentity:instance:delegate:prewarmer:prototypeSettings:defaults:", v6, v5, self, self->_cameraPrewarmer, self->_prototypeSettings, self->_lockScreenDefaults);
  }
  else
  {
    objc_msgSend(v4, "controlIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "kind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = BSEqualStrings();

    if (v13)
    {
      v10 = -[CSQuickActionsViewController _newFlashlightAction](self, "_newFlashlightAction");
    }
    else
    {
      v14 = objc_msgSend(v4, "type");
      if (v14 == 1)
      {
        v15 = CSSystemToggleQuickAction;
      }
      else if (v14 == 2)
      {
        v15 = CSSystemButtonQuickAction;
      }
      else
      {
        v15 = CSSystemQuickAction;
      }
      v10 = (CSCameraSystemQuickAction *)objc_msgSend([v15 alloc], "initWithQuickActionControlIdentity:instance:delegate:", v6, v5, self);
    }
  }
  v16 = v10;

  return v16;
}

- (id)_configurationItemForAction:(id)a3 withIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "controlIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D10088]);
      objc_msgSend(v7, "controlIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v9, "initWithUniqueIdentifier:controlIdentity:location:", v6, v10, 4);

      objc_msgSend(v8, "setPushPolicy:", 2);
      objc_msgSend(v8, "setCanAppearInSecureEnvironment:", 1);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_controlInstanceForSystemControl:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v22;
  CSQuickActionsViewController *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "controlIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "controlType");
  v7 = objc_msgSend(v4, "position");

  if (v7 == 1)
  {
    v8 = CFSTR("Quick-Action-Leading");
    if (v5)
      goto LABEL_4;
LABEL_7:
    SBLogDashBoard();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = self;
      v12 = "[Quick Action] failed to create controlInstance for %@ due to nil controlIdentity";
LABEL_14:
      _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v22, 0xCu);
    }
LABEL_15:

LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  if (v7 != 2)
  {
    SBLogDashBoard();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CSQuickActionsViewController _controlInstanceForSystemControl:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    goto LABEL_16;
  }
  v8 = CFSTR("Quick-Action-Trailing");
  if (!v5)
    goto LABEL_7;
LABEL_4:
  if (!v6)
  {
    SBLogDashBoard();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = self;
      v12 = "[Quick Action] failed to create controlInstance for %@ due to unknown control type";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10010]), "initWithControl:contentType:hostIdentifier:configurationIdentifier:", v5, 0, CFSTR("com.apple.springboard.Quick-Actions"), v8);
  objc_msgSend(MEMORY[0x1E0D102E8], "instanceOfType:instanceIdentity:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modifyConfiguration:", &__block_literal_global);
  objc_msgSend(v10, "activate");

LABEL_17:
  return v10;
}

uint64_t __65__CSQuickActionsViewController__controlInstanceForSystemControl___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCanAppearInSecureEnvironment:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSQuickActionsViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[CSQuickActionsViewController _setupFlashlightControllerIfNecessary](self, "_setupFlashlightControllerIfNecessary");
  -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshSupportedButtons");

  -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionsVisible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSQuickActionsViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[CSQuickActionsViewController _tearDownFlashlightIfOff](self, "_tearDownFlashlightIfOff");
  -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActionsVisible:", 0);

}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  -[CSQuickActionsViewController _tearDownFlashlightIfOff](self, "_tearDownFlashlightIfOff");
  WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_msgSend(WeakRetained, "invalidate");

  -[CSQuickActionsViewController controlHost](self, "controlHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[CHSWidgetExtensionProvider unregisterObserver:](self->_extensionProvider, "unregisterObserver:", self);
  -[CHSWidgetExtensionProvider invalidate](self->_extensionProvider, "invalidate");
  -[BSDefaultObserver invalidate](self->_defaultsObserverToken, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)CSQuickActionsViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v5, sel_dealloc);
}

- (BOOL)_shouldUseControlsInPlaceOfButtons
{
  return CSFeatureEnabled(8);
}

+ (BOOL)deviceSupportsButtons
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = SBFEffectiveHomeButtonType();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1 && v2 == 2;
}

- (BOOL)interpretsLocationAsContent:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interpretsLocationAsContent:inView:", v7, x, y);

  return v9;
}

- (BOOL)interpretsLocationAsBesideButtons:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interpretsLocationAsBesideContent:inView:", v7, x, y);

  return v9;
}

- (void)_addStateCaptureHandlers
{
  id v3;
  id v4;
  id v5;
  id location;

  if (+[CSQuickActionsViewController deviceSupportsButtons](CSQuickActionsViewController, "deviceSupportsButtons"))
  {
    objc_initWeak(&location, self);
    v3 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v5, &location);
    v4 = (id)BSLogAddStateCaptureBlockWithTitle();

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

__CFString *__56__CSQuickActionsViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  __CFString *v4;
  __CFString *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "quickActionsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionEnabled");
  v4 = CFSTR("Interaction disabled\n");
  if (v3)
    v4 = CFSTR("Interaction enabled\n");
  v5 = v4;

  return v5;
}

- (void)_validateActions
{
  void *v3;
  CSQuickAction **p_validatedTrailingAction;
  void *v5;
  void *v6;
  id obj;

  -[CSQuickActionsViewController _validActionForAction:](self, "_validActionForAction:", self->_leadingAction);
  obj = (id)objc_claimAutoreleasedReturnValue();
  -[CSQuickActionsViewController _validActionForAction:](self, "_validActionForAction:", self->_trailingAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects())
  {
    p_validatedTrailingAction = &self->_validatedTrailingAction;
    if ((BSEqualObjects() & 1) != 0)
      goto LABEL_7;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->_validatedLeadingAction, obj);
  p_validatedTrailingAction = &self->_validatedTrailingAction;
  if ((BSEqualObjects() & 1) == 0)
LABEL_5:
    objc_storeStrong((id *)p_validatedTrailingAction, v3);
  -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSQuickActionsViewController _actions](self, "_actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonActions:", v6);

  -[CSQuickActionsViewController _updateControlHost](self, "_updateControlHost");
LABEL_7:

}

- (void)_updateControlHost
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  CHSControlHost *controlHost;
  NSObject *v9;
  CHSControlHost *v10;
  CHSControlHost *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CSQuickActionsViewController _configurationItemForAction:withIdentifier:](self, "_configurationItemForAction:withIdentifier:", self->_validatedLeadingAction, CFSTR("Quick-Action-Leading"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSQuickActionsViewController _configurationItemForAction:withIdentifier:](self, "_configurationItemForAction:withIdentifier:", self->_validatedTrailingAction, CFSTR("Quick-Action-Trailing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "addObject:", v3);
  if (v4)
    objc_msgSend(v6, "addObject:", v4);
  v7 = objc_msgSend(v6, "count");
  controlHost = self->_controlHost;
  if (v7)
  {
    if (!controlHost)
    {
      SBLogDashBoard();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "[Quick Action] activating control host", (uint8_t *)&v15, 2u);
      }

      v10 = (CHSControlHost *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0FFF8]), "initWithIdentifier:", CFSTR("com.apple.springboard.Quick-Actions"));
      v11 = self->_controlHost;
      self->_controlHost = v10;

      -[CHSControlHost activate](self->_controlHost, "activate");
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0FFC8]), "initWithControlItems:", v6);
    SBLogDashBoard();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1D0337000, v13, OS_LOG_TYPE_DEFAULT, "[Quick Action] updating control host configuration %@", (uint8_t *)&v15, 0xCu);
    }

    -[CHSControlHost setConfiguration:](self->_controlHost, "setConfiguration:", v12);
  }
  else if (controlHost)
  {
    SBLogDashBoard();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D0337000, v14, OS_LOG_TYPE_DEFAULT, "[Quick Action] deactivating control host", (uint8_t *)&v15, 2u);
    }

    -[CHSControlHost deactivate](self->_controlHost, "deactivate");
    -[CHSControlHost invalidate](self->_controlHost, "invalidate");
    -[CSQuickActionsViewController setControlHost:](self, "setControlHost:", 0);
  }

}

- (id)_validActionForAction:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  CSEmptyQuickAction *v14;
  char v15;
  CHSWidgetExtensionProvider *extensionProvider;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id WeakRetained;
  void *v23;
  NSObject *v24;
  CSEmptyQuickAction *v25;
  NSObject *v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "controlIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isLocked") & 1) != 0 || objc_msgSend(v12, "isHidden"))
    {
      SBLogDashBoard();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v32 = v6;
        v33 = 2114;
        v34 = v11;
        _os_log_impl(&dword_1D0337000, v13, OS_LOG_TYPE_DEFAULT, "[Quick Action] removing button for %{public}@ with containerBundleIdentifier %{public}@ because app was hidden or locked", buf, 0x16u);
      }

      v14 = objc_alloc_init(CSEmptyQuickAction);
      goto LABEL_32;
    }
    v15 = objc_opt_respondsToSelector();
    extensionProvider = self->_extensionProvider;
    if ((v15 & 1) != 0)
    {
      -[CHSWidgetExtensionProvider controlDescriptorForControl:](extensionProvider, "controlDescriptorForControl:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
LABEL_15:
        v14 = (CSEmptyQuickAction *)v6;
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
    }
    else
    {
      objc_msgSend(v10, "extensionBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetExtensionProvider widgetExtensionContainerForExtensionBundleIdentifier:](extensionProvider, "widgetExtensionContainerForExtensionBundleIdentifier:", v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "extensionForExtensionIdentity:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "orderedControlDescriptors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __54__CSQuickActionsViewController__validActionForAction___block_invoke;
      v29[3] = &unk_1E8E2DCD0;
      v30 = v9;
      objc_msgSend(v20, "bs_firstObjectPassingTest:", v29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_15;
    }
    SBLogDashBoard();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v6;
      v33 = 2114;
      v34 = v11;
      _os_log_impl(&dword_1D0337000, v21, OS_LOG_TYPE_DEFAULT, "[Quick Action] no descriptor found for %{public}@ with containerBundleIdentifier %{public}@", buf, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_applicationInformer);
    v23 = WeakRetained;
    if (WeakRetained)
    {
      if (objc_msgSend(WeakRetained, "isSystemRestoringFromBackup"))
      {
LABEL_26:
        v25 = (CSEmptyQuickAction *)v6;
LABEL_30:
        v14 = v25;

        goto LABEL_31;
      }
      if ((objc_msgSend(v23, "isInstallingApplicationWithBundleIdentifier:", v11) & 1) != 0
        || objc_msgSend(v23, "applicationExistsForBundleIdentifier:", v11))
      {
        SBLogDashBoard();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[CSQuickActionsViewController _validActionForAction:].cold.1((uint64_t)v6, (uint64_t)v11, v24);

        goto LABEL_26;
      }
    }
    SBLogDashBoard();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v6;
      v33 = 2114;
      v34 = v11;
      _os_log_impl(&dword_1D0337000, v26, OS_LOG_TYPE_DEFAULT, "[Quick Action] removing button for %{public}@ because no control descriptor found and could not find application with containerBundleIdentifier %{public}@", buf, 0x16u);
    }

    v25 = objc_alloc_init(CSEmptyQuickAction);
    goto LABEL_30;
  }
  v14 = (CSEmptyQuickAction *)v6;
LABEL_33:

  return v14;
}

uint64_t __54__CSQuickActionsViewController__validActionForAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (int64_t)presentationPriority
{
  return 7;
}

- (int64_t)presentationStyle
{
  return 1;
}

- (int64_t)presentationType
{
  return 1;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSQuickActionsViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v16, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    v5 = 0;
    if (v6 > 23)
    {
      if (v6 == 24)
      {
        -[CSQuickActionsViewController _setupFlashlightControllerIfNecessary](self, "_setupFlashlightControllerIfNecessary");
        -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setUserInteractionEnabled:", 1);

        -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9;
        v10 = 1;
      }
      else
      {
        if (v6 != 25)
          goto LABEL_16;
        -[CSQuickActionsViewController _tearDownFlashlightIfOff](self, "_tearDownFlashlightIfOff");
        -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setUserInteractionEnabled:", 0);

        -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9;
        v10 = 0;
      }
      objc_msgSend(v9, "setActionsVisible:", v10);
    }
    else
    {
      if (v6 == 1)
      {
        -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "legibilitySettings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setLegibilitySettings:", v13);

LABEL_15:
        v5 = 0;
        goto LABEL_16;
      }
      if (v6 != 2)
        goto LABEL_16;
      -[CSQuickActionsViewController quickActionsView](self, "quickActionsView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "refreshSupportedButtons");
    }

    goto LABEL_15;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_16:

  return v5;
}

- (void)setCameraPrewarmer:(id)a3
{
  CSCameraPrewarming *v5;
  CSCameraQuickAction *v6;
  CSCameraQuickAction *cameraAction;
  NSObject *v8;
  uint8_t v9[16];

  v5 = (CSCameraPrewarming *)a3;
  if (self->_cameraPrewarmer != v5)
  {
    objc_storeStrong((id *)&self->_cameraPrewarmer, a3);
    if (!self->_cameraAction)
    {
      v6 = -[CSCameraQuickAction initWithDelegate:prewarmer:prototypeSettings:defaults:]([CSCameraQuickAction alloc], "initWithDelegate:prewarmer:prototypeSettings:defaults:", self, self->_cameraPrewarmer, self->_prototypeSettings, self->_lockScreenDefaults);
      cameraAction = self->_cameraAction;
      self->_cameraAction = v6;

      if (!self->_trailingAction)
      {
        objc_storeStrong((id *)&self->_trailingAction, self->_cameraAction);
        SBLogDashBoard();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1D0337000, v8, OS_LOG_TYPE_DEFAULT, "[Quick Action] trailing action being defaulted to camera", v9, 2u);
        }

      }
      -[CSQuickActionsViewController _validateActions](self, "_validateActions");
    }
  }

}

- (BOOL)isCameraRestricted
{
  void *v2;
  char v3;

  -[CSCoverSheetViewControllerBase activeBehavior](self, "activeBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areRestrictedCapabilities:", 4);

  return v3;
}

- (void)activateCameraView
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  objc_msgSend(WeakRetained, "activateCameraViewAnimated:sendingActions:completion:", 1, 0, 0);

}

- (void)launchCameraCapture:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CSQuickActionsViewController coverSheetViewController](self, "coverSheetViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationLauncher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchCaptureApplication:", v4);

}

- (BOOL)systemQuickActionLaunchCaptureApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CSQuickActionsViewController coverSheetViewController](self, "coverSheetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationLauncher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "launchCaptureApplication:", v4);

  return v7;
}

- (BOOL)_captureExtensionsEnabled
{
  return LCSFeatureEnabled();
}

- (BOOL)_prewarmingForCaptureExtensionLaunch
{
  int v2;

  v2 = -[CSQuickActionsViewController _captureExtensionsEnabled](self, "_captureExtensionsEnabled");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

- (BOOL)isPortrait
{
  return (unint64_t)(-[CSQuickActionsViewController interfaceOrientation](self, "interfaceOrientation") - 1) < 2;
}

- (BOOL)shouldTouchesBeginForClick:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v8[16];

  -[CSQuickActionsViewController coverSheetViewController](self, "coverSheetViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "areRestrictedCapabilities:", 0x2000000);

  if (v5)
  {
    SBLogDashBoard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "[Quick Action] New touch dropped for restriction", v8, 2u);
    }

  }
  return v5 ^ 1;
}

- (void)touchBeganForButton:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSObject *v7;
  NSTimer *buttonTouchTimer;
  void *v9;
  NSTimer *v10;
  NSTimer *v11;
  NSDate *v12;
  NSDate *timerStartTime;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[8];
  id location;

  v4 = a3;
  -[CSQuickActionsViewController _actionTimeoutDuration](self, "_actionTimeoutDuration");
  v6 = v5;
  if ((BSFloatIsZero() & 1) == 0)
  {
    objc_initWeak(&location, self);
    if (self->_buttonTouchTimer)
    {
      SBLogDashBoard();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[Quick Action] Previous timeout zombified?", buf, 2u);
      }

      -[NSTimer invalidate](self->_buttonTouchTimer, "invalidate");
      buttonTouchTimer = self->_buttonTouchTimer;
      self->_buttonTouchTimer = 0;

    }
    v9 = (void *)MEMORY[0x1E0C99E88];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__CSQuickActionsViewController_touchBeganForButton___block_invoke;
    v16[3] = &unk_1E8E2DCF8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v9, "timerWithTimeInterval:repeats:block:", 0, v16, v6);
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v11 = self->_buttonTouchTimer;
    self->_buttonTouchTimer = v10;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    timerStartTime = self->_timerStartTime;
    self->_timerStartTime = v12;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addTimer:forMode:", self->_buttonTouchTimer, *MEMORY[0x1E0C99860]);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  self->_buttonActionAllowedForTimer = 1;
  objc_msgSend(v4, "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "touchBegan");

}

void __52__CSQuickActionsViewController_touchBeganForButton___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0337000, v2, OS_LOG_TYPE_DEFAULT, "[Quick Action] Timeout fired.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *((_BYTE *)WeakRetained + 1152) = 0;
  objc_msgSend(*((id *)WeakRetained + 142), "invalidate");
  v4 = (void *)*((_QWORD *)WeakRetained + 142);
  *((_QWORD *)WeakRetained + 142) = 0;

}

- (void)fireActionForButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  int v15;
  int v16;
  _BOOL4 buttonActionAllowedForTimer;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  double v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSQuickActionsViewController coverSheetViewController](self, "coverSheetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "areRestrictedCapabilities:", 0x2000000);

  if (v7)
  {
    SBLogDashBoard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0337000, v8, OS_LOG_TYPE_DEFAULT, "[Quick Action] Firing dropped for restriction", buf, 2u);
    }

    objc_msgSend(v4, "setSelected:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", self->_timerStartTime);
    v11 = v10;

    -[CSQuickActionsViewController _actionTimeoutDuration](self, "_actionTimeoutDuration");
    v13 = v12;
    v14 = vcvtmd_s64_f64(v11 * 10.0);
    v15 = BSFloatGreaterThanOrEqualToFloat();
    v16 = v15;
    buttonActionAllowedForTimer = self->_buttonActionAllowedForTimer;
    if (!self->_buttonActionAllowedForTimer && (v15 & 1) == 0)
    {
      SBLogDashBoard();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CSQuickActionsViewController fireActionForButton:].cold.1(v18, v13, v11, v19, v20);

      buttonActionAllowedForTimer = self->_buttonActionAllowedForTimer;
    }
    if (buttonActionAllowedForTimer)
      v21 = 0;
    else
      v21 = v16;
    objc_msgSend(v4, "action");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 == 1)
    {
      if (objc_msgSend(v22, "supportsSelection"))
        v24 = objc_msgSend(v4, "isSelected") ^ 1;
      else
        v24 = 0;
      objc_msgSend(v4, "setSelected:", v24);

      SBLogDashBoard();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v43 = v13;
        v44 = 2048;
        v45 = v11;
        _os_log_impl(&dword_1D0337000, v31, OS_LOG_TYPE_DEFAULT, "[Quick Action] Action failed for timeout. Timeout: %f. Elapsed: %f", buf, 0x16u);
      }

      v40 = *MEMORY[0x1E0DABD78];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0DA9D78];
      v35 = v33;
      objc_msgSend(v34, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "emitEvent:withPayload:", 43, v35);

      +[CSAction actionWithType:](CSAction, "actionWithType:", 6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v37);

    }
    else
    {
      objc_msgSend(v22, "fireAction");
      if ((objc_msgSend(v23, "supportsSelection") & 1) == 0)
        objc_msgSend(v4, "setSelected:", 0);
      -[CSQuickActionsViewController _resetIdleTimer](self, "_resetIdleTimer");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14, *MEMORY[0x1E0DABD78]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0DA9D78];
      v28 = v26;
      objc_msgSend(v27, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "emitEvent:withPayload:", 42, v28);

      +[CSAction actionWithType:](CSAction, "actionWithType:", 5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v30);

    }
  }

}

- (void)touchEndedForButton:(id)a3
{
  void *v4;
  NSTimer *buttonTouchTimer;

  objc_msgSend(a3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "touchEnded");

  -[NSTimer invalidate](self->_buttonTouchTimer, "invalidate");
  buttonTouchTimer = self->_buttonTouchTimer;
  self->_buttonTouchTimer = 0;

  self->_buttonActionAllowedForTimer = 0;
}

- (void)_resetIdleTimer
{
  id WeakRetained;
  id v4;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  objc_msgSend(WeakRetained, "handleAction:fromSender:", v4, self);

}

- (double)_actionTimeoutDuration
{
  void *v2;
  double v3;
  double v4;

  -[CSLockScreenSettings dashBoardQuickActionButtonSettings](self->_prototypeSettings, "dashBoardQuickActionButtonSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumTouchDuration");
  v4 = v3;

  return v4;
}

- (void)_tearDownFlashlightIfOff
{
  if (!-[CSQuickActionsViewController _isFlashlightOn](self, "_isFlashlightOn"))
    -[CSQuickActionsViewController _tearDownFlashlight](self, "_tearDownFlashlight");
}

- (void)_tearDownFlashlight
{
  void *v3;
  void *v4;
  SBUIFlashlightController *flashlight;

  -[SBUIFlashlightController coolDown](self->_flashlight, "coolDown");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DAA050], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC320], 0);

  flashlight = self->_flashlight;
  self->_flashlight = 0;

}

- (id)_actions
{
  CSQuickAction *v3;
  CSCameraQuickAction *v4;
  CSQuickAction *leadingAction;
  uint64_t v6;
  CSQuickAction *v7;
  CSQuickAction *v8;
  CSQuickAction *v9;
  CSQuickAction *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v31[8];

  if (-[CSQuickActionsViewController _shouldUseControlsInPlaceOfButtons](self, "_shouldUseControlsInPlaceOfButtons"))
  {
    v3 = self->_validatedLeadingAction;
    v4 = self->_validatedTrailingAction;
  }
  else
  {
    leadingAction = self->_leadingAction;
    v6 = objc_opt_class();
    v7 = leadingAction;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    if (v9)
      v10 = self->_leadingAction;
    else
      v10 = -[CSQuickActionsViewController _newFlashlightAction](self, "_newFlashlightAction");
    v3 = v10;

    v4 = self->_cameraAction;
    SBLogDashBoard();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v31[0] = 0;
      _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, "[Quick Action] ignoring customization because LockPick has been disabled", (uint8_t *)v31, 2u);
    }

  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = v12;
  if (v3)
  {
    objc_msgSend(v12, "addObject:", v3);
    if (v4)
    {
LABEL_16:
      objc_msgSend(v13, "addObject:", v4);
      goto LABEL_23;
    }
  }
  else
  {
    SBLogDashBoard();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CSQuickActionsViewController _actions].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

    if (v4)
      goto LABEL_16;
  }
  SBLogDashBoard();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[CSQuickActionsViewController _actions].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

LABEL_23:
  return v13;
}

- (BOOL)_isFlashlightOn
{
  return -[SBUIFlashlightController level](self->_flashlight, "level") != 0;
}

- (void)_deviceBlockStateDidChangeNotification:(id)a3
{
  if (-[CSQuickActionsViewController _isFlashlightOn](self, "_isFlashlightOn", a3))
  {
    if (-[SBFLockOutStatusProvider isBlocked](self->_lockOutController, "isBlocked"))
      -[SBUIFlashlightController turnFlashlightOffForReason:](self->_flashlight, "turnFlashlightOffForReason:", CFSTR("Lock Out Status Changed"));
  }
}

- (void)_featureLockStateDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAC438]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (-[CSQuickActionsViewController _isFlashlightOn](self, "_isFlashlightOn"))
  {
    if (v6)
      -[SBUIFlashlightController turnFlashlightOffForReason:](self->_flashlight, "turnFlashlightOffForReason:", CFSTR("Lock Out Status Changed"));
  }
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CSQuickActionsViewController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__CSQuickActionsViewController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E8E2DC00;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __77__CSQuickActionsViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "appProtectionSubjectMonitorSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 40), "_validateActions");
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CSQuickActionsViewController_extensionsDidChangeForExtensionProvider___block_invoke;
  block[3] = &unk_1E8E2DB38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __72__CSQuickActionsViewController_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_validateActions");
}

- (CSCoverSheetViewController)coverSheetViewController
{
  return (CSCoverSheetViewController *)objc_loadWeakRetained((id *)&self->_coverSheetViewController);
}

- (void)setCoverSheetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_coverSheetViewController, a3);
}

- (SBFLockOutStatusProvider)lockOutController
{
  return self->_lockOutController;
}

- (void)setLockOutController:(id)a3
{
  objc_storeStrong((id *)&self->_lockOutController, a3);
}

- (CSCameraPrewarming)cameraPrewarmer
{
  return self->_cameraPrewarmer;
}

- (BOOL)suppressingVisibleChanges
{
  return self->_suppressingVisibleChanges;
}

- (void)setSuppressingVisibleChanges:(BOOL)a3
{
  self->_suppressingVisibleChanges = a3;
}

- (BOOL)captureExtensionsEnabled
{
  return self->_captureExtensionsEnabled;
}

- (CSQuickActionsConfiguration)quickActionsConfiguration
{
  return self->_quickActionsConfiguration;
}

- (BOOL)animatingToCamera
{
  return self->_animatingToCamera;
}

- (void)setAnimatingToCamera:(BOOL)a3
{
  self->_animatingToCamera = a3;
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
}

- (void)setAppProtectionSubjectMonitorSubscription:(id)a3
{
  objc_storeWeak((id *)&self->_appProtectionSubjectMonitorSubscription, a3);
}

- (CHSControlHost)controlHost
{
  return self->_controlHost;
}

- (void)setControlHost:(id)a3
{
  objc_storeStrong((id *)&self->_controlHost, a3);
}

- (CSApplicationInforming)applicationInformer
{
  return (CSApplicationInforming *)objc_loadWeakRetained((id *)&self->_applicationInformer);
}

- (void)setApplicationInformer:(id)a3
{
  objc_storeWeak((id *)&self->_applicationInformer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationInformer);
  objc_storeStrong((id *)&self->_controlHost, 0);
  objc_destroyWeak((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_quickActionsConfiguration, 0);
  objc_storeStrong((id *)&self->_cameraPrewarmer, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_destroyWeak((id *)&self->_coverSheetViewController);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_timerStartTime, 0);
  objc_storeStrong((id *)&self->_buttonTouchTimer, 0);
  objc_storeStrong((id *)&self->_validatedTrailingAction, 0);
  objc_storeStrong((id *)&self->_validatedLeadingAction, 0);
  objc_storeStrong((id *)&self->_trailingAction, 0);
  objc_storeStrong((id *)&self->_leadingAction, 0);
  objc_storeStrong((id *)&self->_trailingConfiguration, 0);
  objc_storeStrong((id *)&self->_leadingConfiguration, 0);
  objc_storeStrong((id *)&self->_cameraAction, 0);
  objc_storeStrong((id *)&self->_defaultsObserverToken, 0);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_miscellaneousSettings, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_flashlight, 0);
}

- (void)_controlInstanceForSystemControl:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0337000, a1, a3, "[Quick Action] not being created for unrecognized position", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_validActionForAction:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_1(&dword_1D0337000, a3, (uint64_t)a3, "[Quick Action] keeping button for %{public}@ with nil control descriptor because found application with containerBundleIdentifier %{public}@", (uint8_t *)&v3);
}

- (void)fireActionForButton:(double)a3 .cold.1(NSObject *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  int v5;
  double v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  OUTLINED_FUNCTION_1(&dword_1D0337000, a1, a5, "[Quick Action] Timeout flag was incorrect! Timeout: %f. Elapsed: %f", (uint8_t *)&v5);
}

- (void)_actions
{
  OUTLINED_FUNCTION_0(&dword_1D0337000, a1, a3, "[Quick Action] leadingAction is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
