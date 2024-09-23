@implementation MFPowerController

- (void)_applicationForegroundStateChanged:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MFPowerController__applicationForegroundStateChanged___block_invoke;
  v4[3] = &unk_1E4E88DF0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __56__MFPowerController__applicationForegroundStateChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationForegroundStateChanged_nts:", *(unsigned __int8 *)(a1 + 40));
}

void __35__MFPowerController_sharedInstance__block_invoke()
{
  MFPowerController *v0;
  void *v1;

  v0 = objc_alloc_init(MFPowerController);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;

}

- (MFPowerController)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  char *v10;
  void (**v11)(void *, _QWORD);
  _DWORD *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD aBlock[4];
  char *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)MFPowerController;
  v2 = -[MFPowerController init](&v27, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.message.MFPowerController.state", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_queue_create("com.apple.message.MFPowerController.power", 0);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v8 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v7;

    *((_DWORD *)v2 + 15) = -1082130432;
    *((_QWORD *)v2 + 4) = -1;
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __25__MFPowerController_init__block_invoke;
    aBlock[3] = &unk_1E4E8E2F8;
    v10 = (char *)v2;
    v26 = v10;
    v11 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v12 = v10 + 28;
    if (notify_register_dispatch("com.apple.springboard.pluggedin", (int *)v10 + 7, *((dispatch_queue_t *)v2 + 1), v11))
      *v12 = -1;
    else
      v11[2](v11, *v12);
    sRootDomainConnect = IORegisterForSystemPower(0, (IONotificationPortRef *)v10 + 9, (IOServiceInterestCallback)_powerChanged, (io_object_t *)v10 + 20);
    if (sRootDomainConnect)
    {
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v10 + 9), *((dispatch_queue_t *)v2 + 2));
    }
    else
    {
      MFPowerLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[MFPowerController init].cold.1();

    }
    objc_msgSend(v10, "_registerForBatteryLevelChanges");
    objc_msgSend(v10, "_registerForGameModeChanges");
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    +[MFAppStateMonitor sharedInstance](MFAppStateMonitor, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appIsVisibleObservable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D1EF30];
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __25__MFPowerController_init__block_invoke_13;
    v22[3] = &unk_1E4E8B6E0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v16, "observerWithResultBlock:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subscribe:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v10 + 6);
    *((_QWORD *)v10 + 6) = v18;

    objc_msgSend(MEMORY[0x1E0D46090], "sharedController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addDiagnosticsGenerator:", v10);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return (MFPowerController *)v2;
}

uint64_t __25__MFPowerController_init__block_invoke(uint64_t a1, int token)
{
  uint64_t state64;

  state64 = 0xAAAAAAAAAAAAAAAALL;
  notify_get_state(token, &state64);
  return objc_msgSend(*(id *)(a1 + 32), "_setPluggedIn:", state64);
}

- (void)_setPluggedIn:(unsigned int)a3
{
  int pluggedIn;
  int *p_pluggedIn;
  unsigned int v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_pluggedIn = &self->_pluggedIn;
  pluggedIn = self->_pluggedIn;
  if (pluggedIn != a3)
  {
    do
    {
      v6 = __ldaxr((unsigned int *)p_pluggedIn);
      if (v6 != pluggedIn)
      {
        __clrex();
        return;
      }
    }
    while (__stlxr(a3, (unsigned int *)p_pluggedIn));
    MFPowerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (*p_pluggedIn)
        v8 = CFSTR("plugged in");
      else
        v8 = CFSTR("unplugged");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Device is now %@", (uint8_t *)&v10, 0xCu);
    }

    if (*p_pluggedIn)
    {
      if (sPowerAssertion)
        -[MFPowerController _releasePowerAssertion_nts](self, "_releasePowerAssertion_nts");
    }
    else if (-[NSCountedSet count](self->_identifiers, "count") && !self->_isForeground && !sPowerAssertion)
    {
      -[MFPowerController _retainPowerAssertion_nts](self, "_retainPowerAssertion_nts");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("MFPowerStateDidChange"), self);

  }
}

- (void)_registerForBatteryLevelChanges
{
  OUTLINED_FUNCTION_0_0(&dword_1A4F90000, a2, a3, "#BatteryLevel Could not register for battery change notification due to status (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (EFObservable)lowPowerModeObservable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EF28], "observableOnDefaultNotificationCenterWithName:object:", CFSTR("MFBatterySaverModeDidChange"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__MFPowerController_lowPowerModeObservable__block_invoke;
  v9[3] = &unk_1E4E8E770;
  v9[4] = self;
  objc_msgSend(v3, "map:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFPowerController isBatterySaverModeEnabled](self, "isBatterySaverModeEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v7;
}

- (BOOL)isBatterySaverModeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  return v3;
}

- (EFObservable)pluggedInObservable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[MFPowerController powerObservable](self, "powerObservable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startWith:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "map:", &__block_literal_global_64);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v6;
}

- (id)powerObservable
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D1EF28], "observableOnDefaultNotificationCenterWithName:object:", CFSTR("MFPowerStateDidChange"), self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "map:", &__block_literal_global_61);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (MFPowerController)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_56);
  if (!sharedInstance_instance_1)
    +[MFPowerController sharedInstance].cold.1();
  return (MFPowerController *)(id)sharedInstance_instance_1;
}

- (void)_batteryInformationChanged
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "#BatteryLevel No internal battery found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)retainAssertionWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  MFPowerController *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MFPowerController_retainAssertionWithIdentifier___block_invoke;
  block[3] = &unk_1E4E88EE8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)releaseAssertionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MFPowerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "#Assertions [-] %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__MFPowerController_releaseAssertionWithIdentifier___block_invoke;
  v8[3] = &unk_1E4E88EE8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(queue, v8);

}

- (void)startListeningForBatterySaverNotifications
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  MFPowerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "Listening for low-power mode notifications", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__lowPowerModeChangedNotification_, *MEMORY[0x1E0CB3048], 0);

}

+ (void)powerlog:(id)a3 eventData:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (softLinkPLShouldLogRegisteredEvent(12, (uint64_t)v6))
    softLinkPLLogRegisteredEvent(12, (uint64_t)v6, (uint64_t)v5, MEMORY[0x1E0C9AA60]);

}

void __52__MFPowerController_releaseAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    if (sPowerAssertion)
      objc_msgSend(*(id *)(a1 + 32), "_releasePowerAssertion_nts");
    if (sTaskAssertion)
      objc_msgSend(*(id *)(a1 + 32), "_releaseTaskAssertion_nts");
  }
  MFPowerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_DEFAULT, "#Assertions Active Assertions: %lu", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_applicationForegroundStateChanged_nts:(BOOL)a3
{
  if (self->_isForeground != a3)
  {
    self->_isForeground = a3;
    if (a3)
    {
      if (sPowerAssertion)
        -[MFPowerController _releasePowerAssertion_nts](self, "_releasePowerAssertion_nts");
    }
    else if (-[NSCountedSet count](self->_identifiers, "count")
           && !-[MFPowerController isPluggedIn](self, "isPluggedIn")
           && !sPowerAssertion)
    {
      -[MFPowerController _retainPowerAssertion_nts](self, "_retainPowerAssertion_nts");
    }
  }
}

void __51__MFPowerController_retainAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  char v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MFPowerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_DEFAULT, "#Assertions [+] %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 56))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "isPluggedIn");
    v5 = sPowerAssertion ? 1 : v4;
    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_retainPowerAssertion_nts");
  }
  if (!sTaskAssertion)
    objc_msgSend(*(id *)(a1 + 40), "_retainTaskAssertion_nts");
  MFPowerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count");
    v8 = 134217984;
    v9 = v7;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "#Assertions Active Assertions: %lu", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_retainTaskAssertion_nts
{
  void *v4;
  int v5;
  NSObject *v6;
  MFTaskAssertion *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MFUserAgent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMobileMail");

  if (v5)
  {
    if (sTaskAssertion)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPowerController.m"), 291, CFSTR("task assertion IS NOT NULL"));

    }
    MFPowerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = CFSTR("com.apple.message.backgroundTaskAssertion");
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "#Assertions [+] %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = -[MFTaskAssertion initWithName:]([MFTaskAssertion alloc], "initWithName:", CFSTR("com.apple.message.backgroundTaskAssertion"));
    v8 = (void *)sTaskAssertion;
    sTaskAssertion = (uint64_t)v7;

  }
}

id __40__MFPowerController_pluggedInObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isPluggedIn"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPluggedIn
{
  return self->_pluggedIn != 0;
}

void __25__MFPowerController_init__block_invoke_13(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_applicationForegroundStateChanged:", objc_msgSend(v4, "BOOLValue"));

}

- (void)dealloc
{
  int powerToken;
  objc_super v4;

  powerToken = self->_powerToken;
  if (powerToken != -1)
    notify_cancel(powerToken);
  -[EFCancelable cancel](self->_appStateCancelable, "cancel");
  if (sRootDomainConnect)
  {
    IONotificationPortSetDispatchQueue(self->_pmPort, 0);
    IODeregisterForSystemPower(&self->_pmNotifier);
    IOServiceClose(sRootDomainConnect);
    IONotificationPortDestroy(self->_pmPort);
    sRootDomainConnect = 0;
  }
  -[MFPowerController _unregisterForBatteryLevelChanges](self, "_unregisterForBatteryLevelChanges");
  -[MFPowerController _unregisterForGameModeChanges](self, "_unregisterForGameModeChanges");
  v4.receiver = self;
  v4.super_class = (Class)MFPowerController;
  -[MFPowerController dealloc](&v4, sel_dealloc);
}

- (BOOL)isHoldingAssertion
{
  return sPowerAssertion != 0;
}

- (BOOL)_isHoldingTaskAssertion
{
  return sTaskAssertion != 0;
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MFPowerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLowPowerModeEnabled");
    v6 = CFSTR("OFF");
    if (v5)
      v6 = CFSTR("ON");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "Low-power mode changed to %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("MFBatterySaverModeDidChange"), 0);

}

- (double)_assertionTimeout
{
  return 120.0;
}

- (void)_setupAssertionTimer:(double)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_source_t v8;
  void *v9;
  double v10;
  dispatch_time_t v11;
  _QWORD handler[5];
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (sPowerAssertionTimer)
  {
    MFPowerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "#Assertions [*] cancel power assertion timer", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)sPowerAssertionTimer);
    v6 = (void *)sPowerAssertionTimer;
    sPowerAssertionTimer = 0;

  }
  if (a3 > 0.0)
  {
    MFPowerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = (int)a3;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "#Assertions [*] schedule %d sec power assertion timer", buf, 8u);
    }

    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    v9 = (void *)sPowerAssertionTimer;
    sPowerAssertionTimer = (uint64_t)v8;

    -[MFPowerController _assertionTimeout](self, "_assertionTimeout");
    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)sPowerAssertionTimer, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __42__MFPowerController__setupAssertionTimer___block_invoke;
    handler[3] = &unk_1E4E88DC8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)sPowerAssertionTimer, handler);
    dispatch_resume((dispatch_object_t)sPowerAssertionTimer);
  }
}

void __42__MFPowerController__setupAssertionTimer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  MFPowerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_DEFAULT, "#Assertions [*] power assertion timer expired", v3, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_releasePowerAssertion_nts");
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_35);
}

uint64_t __42__MFPowerController__setupAssertionTimer___block_invoke_34()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("MFPowerAssertionDidExpire"), 0);

  return objc_msgSend((id)sObservers, "makeObjectsPerformSelector:", sel_assertionDidExpire);
}

- (void)_retainPowerAssertion_nts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "#Assertions Could not create power assertion.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_releasePowerAssertion_nts
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!sPowerAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPowerController.m"), 273, CFSTR("assertion IS NULL"));

  }
  if (!sPowerAssertionTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPowerController.m"), 274, CFSTR("assertion timer IS nil"));

  }
  MFPowerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = CFSTR("com.apple.message.preventSleep");
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "#Assertions [-] %@", (uint8_t *)&v7, 0xCu);
  }

  -[MFPowerController _setupAssertionTimer:](self, "_setupAssertionTimer:", 0.0);
  CFRelease((CFTypeRef)sPowerAssertion);
  sPowerAssertion = 0;
}

- (void)_releaseTaskAssertion_nts
{
  NSObject *v2;
  void *v3;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!sTaskAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPowerController.m"), 298, CFSTR("task assertion IS NULL"));

  }
  MFPowerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = CFSTR("com.apple.message.backgroundTaskAssertion");
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_DEFAULT, "#Assertions [-] %@", (uint8_t *)&v7, 0xCu);
  }

  v3 = (void *)sTaskAssertion;
  sTaskAssertion = 0;

}

id __36__MFPowerController_powerObservable__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "object");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __43__MFPowerController_lowPowerModeObservable__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isBatterySaverModeEnabled"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)batteryLevelStateChangeNotificationObservable
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D1EF28], "observableOnDefaultNotificationCenterWithName:object:", CFSTR("MFBatteryLevelDidChange"), self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "map:", &__block_literal_global_67);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __66__MFPowerController_batteryLevelStateChangeNotificationObservable__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "object");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (EFObservable)batteryLevelObservable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[MFPowerController batteryLevelStateChangeNotificationObservable](self, "batteryLevelStateChangeNotificationObservable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startWith:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "map:", &__block_literal_global_68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v6;
}

id __43__MFPowerController_batteryLevelObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "batteryLevel");
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __52__MFPowerController__registerForBatteryLevelChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_batteryInformationChanged");
}

- (void)_unregisterForBatteryLevelChanges
{
  int batteryNotificationToken;

  batteryNotificationToken = self->_batteryNotificationToken;
  if (batteryNotificationToken != -1)
  {
    notify_cancel(batteryNotificationToken);
    self->_batteryNotificationToken = -1;
  }
}

- (void)_gameModeInformationChanged
{
  int gameModeNotificationToken;
  uint32_t state;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  gameModeNotificationToken = self->_gameModeNotificationToken;
  if (gameModeNotificationToken == -1)
  {
    MFPowerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Invalid Game Mode notify token";
      v8 = v5;
      v9 = 2;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  state = notify_get_state(gameModeNotificationToken, &state64);
  MFPowerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (state)
  {
    if (v6)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = state;
      v7 = "notify_get_state() for Game Mode failed with error %u";
      v8 = v5;
      v9 = 8;
LABEL_7:
      _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v6)
  {
    *(_DWORD *)buf = 134217984;
    v12 = state64;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Game Mode Status is now %llu", buf, 0xCu);
  }

  self->_gameModeEnabled = state64 != 0;
}

- (void)_registerForGameModeChanges
{
  OUTLINED_FUNCTION_0_0(&dword_1A4F90000, a2, a3, "Could not register for game mode change notification due to status (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

uint64_t __48__MFPowerController__registerForGameModeChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gameModeInformationChanged");
}

uint64_t __48__MFPowerController__registerForGameModeChanges__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gameModeInformationChanged");
}

- (void)_unregisterForGameModeChanges
{
  int gameModeNotificationToken;

  gameModeNotificationToken = self->_gameModeNotificationToken;
  if (gameModeNotificationToken != -1)
  {
    notify_cancel(gameModeNotificationToken);
    self->_gameModeNotificationToken = -1;
  }
}

- (id)copyDiagnosticInformation
{
  id v3;
  const __CFString *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *queue;
  id v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", CFSTR("==== Power State ====\n"));
  if (-[MFPowerController isPluggedIn](self, "isPluggedIn"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("  charging: %@\n"), v4);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLowPowerModeEnabled");
  v7 = CFSTR("OFF");
  if (v6)
    v7 = CFSTR("ON");
  objc_msgSend(v3, "appendFormat:", CFSTR("  low-power mode: %@\n"), v7);

  if (-[MFPowerController gameModeEnabled](self, "gameModeEnabled"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("  Game Mode: %@\n"), v8);
  if (sPowerAssertion)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("  holding assertion: %@\n"), v9);
  objc_msgSend(v3, "appendString:", CFSTR("\n==== Internal Assertions ====\n"));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MFPowerController_copyDiagnosticInformation__block_invoke;
  block[3] = &unk_1E4E88EE8;
  block[4] = self;
  v11 = v3;
  v16 = v11;
  dispatch_sync(queue, block);
  v12 = v16;
  v13 = v11;

  return v13;
}

void __46__MFPowerController_copyDiagnosticInformation__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v10 != v4)
            objc_enumerationMutation(v2);
          v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
          v7 = *(void **)(a1 + 40);
          v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "countForObject:", v6);
          objc_msgSend(v7, "appendFormat:", CFSTR("  %@: %d\n"), v6, v8, (_QWORD)v9);
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v3);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("(empty)\n"));
  }
}

- (BOOL)gameModeEnabled
{
  return self->_gameModeEnabled;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStateCancelable, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_powerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "Could not register for power notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)sharedInstance
{
  __assert_rtn("+[MFPowerController sharedInstance]", "MFPowerController.m", 143, "instance != nil");
}

@end
