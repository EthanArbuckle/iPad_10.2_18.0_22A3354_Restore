@implementation CSCameraQuickAction

- (CSCameraQuickAction)initWithDelegate:(id)a3 prewarmer:(id)a4 prototypeSettings:(id)a5 defaults:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CSCameraQuickAction *v15;
  CSCameraQuickAction *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSCameraQuickAction;
  v15 = -[CSCameraQuickAction init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_delegate, a3);
    objc_storeStrong((id *)&v16->_prewarmer, a4);
    objc_storeStrong((id *)&v16->_prototypeSettings, a5);
    objc_storeStrong((id *)&v16->_lockScreenDefaults, a6);
  }

  return v16;
}

- (id)actionIdentifier
{
  return CFSTR("CSCameraQuickAction");
}

- (id)accessibilityIdentifier
{
  return CFSTR("camera-orb-button");
}

- (id)statisticsIdentifier
{
  return CFSTR("camera");
}

- (id)accessoryTitleKey
{
  return CFSTR("CAMERA_HINT_TEXT");
}

- (id)symbolName
{
  return CFSTR("camera.fill");
}

- (id)selectedSymbolName
{
  return 0;
}

- (BOOL)showsButton
{
  return 1;
}

- (int64_t)appearance
{
  if (-[CSCameraQuickAction _allowsCamera](self, "_allowsCamera"))
    return 0;
  else
    return 2;
}

- (id)unavailableSymbolName
{
  return 0;
}

- (void)touchBegan
{
  CSCameraPrewarming *prewarmer;
  void *v4;
  void *v5;
  NSTimer *activePrewarmTimer;
  NSTimer *v7;
  void *v8;
  double v9;
  double v10;
  int IsZero;
  double v12;
  NSTimer *v13;
  NSTimer *v14;

  self->_hasFiredForTouch = 0;
  prewarmer = self->_prewarmer;
  -[CSCameraQuickAction _prewarmingIdentifier](self, "_prewarmingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCameraQuickAction _prewarmReason](self, "_prewarmReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCameraPrewarming prewarmCameraForIdentifier:prewarmReason:](prewarmer, "prewarmCameraForIdentifier:prewarmReason:", v4, v5);

  activePrewarmTimer = self->_activePrewarmTimer;
  if (activePrewarmTimer)
  {
    -[NSTimer invalidate](activePrewarmTimer, "invalidate");
    v7 = self->_activePrewarmTimer;
    self->_activePrewarmTimer = 0;

  }
  -[CSLockScreenSettings dashBoardQuickActionButtonSettings](self->_prototypeSettings, "dashBoardQuickActionButtonSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maximumTouchDuration");
  v10 = v9;

  IsZero = BSFloatIsZero();
  v12 = v10 + 0.5;
  if (!IsZero)
    v12 = 2.5;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__stopTrackingPrewarm, 0, 0, v12);
  v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v14 = self->_activePrewarmTimer;
  self->_activePrewarmTimer = v13;

}

- (void)_stopTrackingPrewarm
{
  NSTimer *activePrewarmTimer;
  CSCameraPrewarming *prewarmer;
  id v5;

  -[NSTimer invalidate](self->_activePrewarmTimer, "invalidate");
  activePrewarmTimer = self->_activePrewarmTimer;
  self->_activePrewarmTimer = 0;

  prewarmer = self->_prewarmer;
  -[CSCameraQuickAction _prewarmingIdentifier](self, "_prewarmingIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCameraPrewarming notePrewarmRequestEndedForIdentifier:](prewarmer, "notePrewarmRequestEndedForIdentifier:", v5);

}

- (void)fireAction
{
  CSCameraPrewarming *prewarmer;
  uint64_t v4;
  void *v5;
  CSCameraQuickActionDelegate *delegate;
  void *v7;
  id v8;

  self->_hasFiredForTouch = 1;
  -[CSCameraQuickAction _prewarmingIdentifier](self, "_prewarmingIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  prewarmer = self->_prewarmer;
  -[CSCameraQuickAction _prewarmReason](self, "_prewarmReason");
  v4 = objc_claimAutoreleasedReturnValue();
  -[CSCameraPrewarming prewarmCameraForIdentifier:prewarmReason:](prewarmer, "prewarmCameraForIdentifier:prewarmReason:", v8, v4);

  -[CSCameraPrewarming prewarmConfigurationForIdentifier:](self->_prewarmer, "prewarmConfigurationForIdentifier:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "prewarmForCaptureLaunch");

  delegate = self->_delegate;
  if ((v4 & 1) != 0)
  {
    -[CSCameraQuickAction _containingApplicationBundleIdentifier](self, "_containingApplicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCameraQuickActionDelegate launchCameraCapture:](delegate, "launchCameraCapture:", v7);

  }
  else
  {
    -[CSCameraQuickActionDelegate activateCameraView](self->_delegate, "activateCameraView");
  }
  -[CSCameraPrewarming notePrewarmRequestWasUsefulForIdentifier:](self->_prewarmer, "notePrewarmRequestWasUsefulForIdentifier:", v8);

}

- (void)touchEnded
{
  NSTimer *activePrewarmTimer;
  CSCameraPrewarming *prewarmer;
  id v5;

  -[NSTimer invalidate](self->_activePrewarmTimer, "invalidate");
  activePrewarmTimer = self->_activePrewarmTimer;
  self->_activePrewarmTimer = 0;

  if (!self->_hasFiredForTouch)
  {
    prewarmer = self->_prewarmer;
    -[CSCameraQuickAction _prewarmingIdentifier](self, "_prewarmingIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CSCameraPrewarming notePrewarmRequestEndedForIdentifier:](prewarmer, "notePrewarmRequestEndedForIdentifier:", v5);

  }
}

- (id)_prewarmReason
{
  return (id)*MEMORY[0x1E0C8A088];
}

- (BOOL)_shouldPrewarmOnTouch
{
  if (-[SBLockScreenDefaults useDefaultsValuesForCameraPrewarm](self->_lockScreenDefaults, "useDefaultsValuesForCameraPrewarm"))return -[SBLockScreenDefaults prewarmCameraOnButtonTouch](self->_lockScreenDefaults, "prewarmCameraOnButtonTouch");
  else
    return -[CSLockScreenSettings prewarmsCameraHardwareOnTap](self->_prototypeSettings, "prewarmsCameraHardwareOnTap");
}

- (BOOL)_shouldPrelaunchOnTouch
{
  if (-[SBLockScreenDefaults useDefaultsValuesForCameraPrewarm](self->_lockScreenDefaults, "useDefaultsValuesForCameraPrewarm"))return -[SBLockScreenDefaults prelaunchCameraOnButtonTouch](self->_lockScreenDefaults, "prelaunchCameraOnButtonTouch");
  else
    return -[CSLockScreenSettings prelaunchesCameraAppOnTap](self->_prototypeSettings, "prelaunchesCameraAppOnTap");
}

- (BOOL)_allowsCamera
{
  CSCameraQuickActionDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    return -[CSCameraQuickActionDelegate isCameraRestricted](delegate, "isCameraRestricted") ^ 1;
  else
    return 1;
}

- (id)_containingApplicationBundleIdentifier
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("SBCameraContainingApplicationBundleIdentifier"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("com.apple.camera");
  v5 = v4;

  return v5;
}

- (id)_prewarmingIdentifier
{
  uint64_t v3;
  CSCameraPrewarmingIdentifier *v4;
  void *v5;
  CSCameraPrewarmingIdentifier *v6;

  if (-[CSCameraQuickAction _shouldPrelaunchOnTouch](self, "_shouldPrelaunchOnTouch"))
    v3 = 0;
  else
    v3 = 2;
  v4 = [CSCameraPrewarmingIdentifier alloc];
  -[CSCameraQuickAction _containingApplicationBundleIdentifier](self, "_containingApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CSCameraPrewarmingIdentifier initWithCameraPrewarmType:applicationBundleIdentifier:](v4, "initWithCameraPrewarmType:applicationBundleIdentifier:", v3, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePrewarmTimer, 0);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_prewarmer, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
