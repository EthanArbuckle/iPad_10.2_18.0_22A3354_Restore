@implementation ENOnboardingManager

void __54__ENOnboardingManager__observeCameraIrisNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cameraIrisStateChangedWithToken:", a2);

}

- (void)_cameraIrisStateChangedWithToken:(int)a3
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(a3, &state64);
  -[ENOnboardingManager setIsCaptureSessionRunning:](self, "setIsCaptureSessionRunning:", state64 == 1);
}

- (void)setIsCaptureSessionRunning:(BOOL)a3
{
  self->_isCaptureSessionRunning = a3;
}

- (ENOnboardingManager)init
{
  ENOnboardingManager *v2;
  CXCallObserver *v3;
  CXCallObserver *callObserver;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENOnboardingManager;
  v2 = -[ENOnboardingManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E0C932E8]);
    callObserver = v2->_callObserver;
    v2->_callObserver = v3;

    v2->_pendingBuddyOnboarding = 0;
    -[ENOnboardingManager _observeCameraIrisNotifications](v2, "_observeCameraIrisNotifications");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  notify_cancel(self->_cameraIrisFrontNotifyToken);
  notify_cancel(self->_cameraIrisBackNotifyToken);
  notify_cancel(self->_cameraIrisBackTeleNotifyToken);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)ENOnboardingManager;
  -[ENOnboardingManager dealloc](&v4, sel_dealloc);
}

- (BOOL)isIdealTimeForBuddy
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (-[ENOnboardingManager _isInLostMode](self, "_isInLostMode"))
    return 0;
  if (-[ENOnboardingManager isCaptureSessionRunning](self, "isCaptureSessionRunning"))
    return 0;
  -[ENOnboardingManager callObserver](self, "callObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 0;
  if (ENIsTestContext_onceToken != -1)
    dispatch_once(&ENIsTestContext_onceToken, &__block_literal_global_6);
  return ENIsTestContext__isTestingContext || (BYSetupAssistantNeedsToRun() & 1) == 0;
}

- (BOOL)isDeviceUnlocked
{
  int v2;
  int v3;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = SBSGetScreenLockStatus();
  v7 = CFSTR("ExtendedDeviceLockState");
  v8[0] = MEMORY[0x1E0C9AAA8];
  objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = MKBGetDeviceLockState();
  return v3 != 6 && (v3 - 3) < 0xFFFFFFFE && v2 == 0;
}

- (void)setShouldObserveDeviceUnlocks:(BOOL)a3
{
  void *v4;
  int *p_screenLockNotifyToken;
  int screenLockNotifyToken;
  const char *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (a3)
  {
    location = 0;
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__ENOnboardingManager_setShouldObserveDeviceUnlocks___block_invoke;
    v10[3] = &unk_1E87DB850;
    objc_copyWeak(&v11, &location);
    v4 = (void *)MEMORY[0x1D17A7E5C](v10);
    screenLockNotifyToken = self->_screenLockNotifyToken;
    p_screenLockNotifyToken = &self->_screenLockNotifyToken;
    if (notify_is_valid_token(screenLockNotifyToken))
    {
      if (gLogCategory_ENOnboardingManager > 30
        || gLogCategory_ENOnboardingManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_23;
      }
    }
    else
    {
      v7 = (const char *)*MEMORY[0x1E0DAC068];
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
      LODWORD(v7) = notify_register_dispatch(v7, p_screenLockNotifyToken, v8, v4);

      if ((_DWORD)v7)
      {
        if (gLogCategory_ENOnboardingManager <= 90
          && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        *p_screenLockNotifyToken = -1;
        goto LABEL_23;
      }
      if (gLogCategory_ENOnboardingManager > 30
        || gLogCategory_ENOnboardingManager == -1 && !_LogCategory_Initialize())
      {
LABEL_23:

        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
        return;
      }
    }
    LogPrintF_safe();
    goto LABEL_23;
  }
  if (self->_screenLockNotifyToken != -1)
  {
    if (gLogCategory_ENOnboardingManager <= 30
      && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    notify_cancel(self->_screenLockNotifyToken);
    self->_screenLockNotifyToken = -1;
  }
}

void __53__ENOnboardingManager_setShouldObserveDeviceUnlocks___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deviceLockStateChangedWithToken:", a2);

}

- (BOOL)_isInLostMode
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D21378], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "lostModeIsActive") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isManagedLostModeActive");

  return v3;
}

- (void)_deviceLockStateChangedWithToken:(int)a3
{
  void *v4;
  _QWORD block[4];
  id v6;
  ENOnboardingManager *v7;
  uint64_t state64;

  state64 = 0;
  notify_get_state(a3, &state64);
  -[ENOnboardingManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (state64 || !-[ENOnboardingManager isDeviceUnlocked](self, "isDeviceUnlocked"))
  {
    if (!CFPrefs_GetInt64())
    {
      if (gLogCategory_ENOnboardingManager <= 30
        && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      self->_pendingBuddyOnboarding = 1;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ENOnboardingManager__deviceLockStateChangedWithToken___block_invoke;
    block[3] = &unk_1E87D9DD8;
    v6 = v4;
    v7 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __56__ENOnboardingManager__deviceLockStateChangedWithToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onboardingManagerDidObserveDeviceUnlock:", *(_QWORD *)(a1 + 40));
}

- (void)_observeCameraIrisNotifications
{
  void *v3;
  NSObject *v4;
  id v5;
  uint32_t v6;
  int *p_cameraIrisBackTeleNotifyToken;
  uint32_t v8;
  _QWORD v9[4];
  id v10;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ENOnboardingManager__observeCameraIrisNotifications__block_invoke;
  v9[3] = &unk_1E87DB850;
  objc_copyWeak(&v10, &location);
  v3 = (void *)MEMORY[0x1D17A7E5C](v9);
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  LODWORD(v4) = notify_register_dispatch("com.apple.isp.frontcamerapower", &self->_cameraIrisFrontNotifyToken, v4, v3);

  if ((_DWORD)v4)
  {
    if (gLogCategory_ENOnboardingManager <= 90
      && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_cameraIrisFrontNotifyToken = -1;
  }
  else if (gLogCategory_ENOnboardingManager <= 30
         && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v6 = notify_register_dispatch("com.apple.isp.backcamerapower", &self->_cameraIrisBackNotifyToken, MEMORY[0x1E0C80D38], v3);

  if (v6)
  {
    if (gLogCategory_ENOnboardingManager <= 90
      && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_cameraIrisBackNotifyToken = -1;
  }
  else if (gLogCategory_ENOnboardingManager <= 30
         && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  p_cameraIrisBackTeleNotifyToken = &self->_cameraIrisBackTeleNotifyToken;
  v8 = notify_register_dispatch("com.apple.isp.backtelecamerapower", p_cameraIrisBackTeleNotifyToken, MEMORY[0x1E0C80D38], v3);

  if (v8)
  {
    if (gLogCategory_ENOnboardingManager <= 90
      && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    *p_cameraIrisBackTeleNotifyToken = -1;
  }
  else if (gLogCategory_ENOnboardingManager <= 30
         && (gLogCategory_ENOnboardingManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (ENOnboardingManagerDelegate)delegate
{
  return (ENOnboardingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)pendingBuddyOnboarding
{
  return self->_pendingBuddyOnboarding;
}

- (void)setPendingBuddyOnboarding:(BOOL)a3
{
  self->_pendingBuddyOnboarding = a3;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (BOOL)isCaptureSessionRunning
{
  return self->_isCaptureSessionRunning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
