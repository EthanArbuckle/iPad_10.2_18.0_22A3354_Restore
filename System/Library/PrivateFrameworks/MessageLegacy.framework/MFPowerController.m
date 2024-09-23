@implementation MFPowerController

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
  id buf;
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
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __25__MFPowerController_init__block_invoke;
    aBlock[3] = &unk_1E81CB490;
    v10 = (char *)v2;
    v26 = v10;
    v11 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v12 = v10 + 28;
    if (notify_register_dispatch("com.apple.springboard.pluggedin", (int *)v10 + 7, *((dispatch_queue_t *)v2 + 1), v11))
      *v12 = -1;
    else
      v11[2](v11, *v12);
    __RootDomainConnect = IORegisterForSystemPower(0, (IONotificationPortRef *)v10 + 7, (IOServiceInterestCallback)_powerChanged, (io_object_t *)v10 + 16);
    if (__RootDomainConnect)
    {
      IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v10 + 7), *((dispatch_queue_t *)v2 + 2));
    }
    else
    {
      MFLogGeneral();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1C8839000, v13, OS_LOG_TYPE_DEFAULT, "#Warning could not register for power notifications", (uint8_t *)&buf, 2u);
      }

    }
    objc_initWeak(&buf, v10);
    +[MFAppStateMonitor sharedInstance](MFAppStateMonitor, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appStateObservable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D1EF30];
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __25__MFPowerController_init__block_invoke_11;
    v22[3] = &unk_1E81CB608;
    objc_copyWeak(&v23, &buf);
    objc_msgSend(v16, "observerWithResultBlock:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subscribe:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v10 + 5);
    *((_QWORD *)v10 + 5) = v18;

    objc_msgSend(MEMORY[0x1E0D46090], "sharedController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addDiagnosticsGenerator:", v10);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&buf);

  }
  return (MFPowerController *)v2;
}

uint64_t __25__MFPowerController_init__block_invoke(uint64_t a1, int token)
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  return objc_msgSend(*(id *)(a1 + 32), "_setPluggedIn:", state64);
}

void __25__MFPowerController_init__block_invoke_11(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "isForeground");

  objc_msgSend(WeakRetained, "_applicationForegroundStateChanged:", v4);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_17);
  if (!sharedInstance_instance_1)
    +[MFPowerController sharedInstance].cold.1();
  return (id)sharedInstance_instance_1;
}

void __35__MFPowerController_sharedInstance__block_invoke()
{
  MFPowerController *v0;
  void *v1;

  v0 = objc_alloc_init(MFPowerController);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;

}

- (void)dealloc
{
  int powerToken;
  objc_super v4;

  powerToken = self->_powerToken;
  if (powerToken != -1)
    notify_cancel(powerToken);
  -[EFCancelable cancel](self->_appStateCancelable, "cancel");
  if (__RootDomainConnect)
  {
    IONotificationPortSetDispatchQueue(self->_pmPort, 0);
    IODeregisterForSystemPower(&self->_pmNotifier);
    IOServiceClose(__RootDomainConnect);
    IONotificationPortDestroy(self->_pmPort);
    __RootDomainConnect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MFPowerController;
  -[MFPowerController dealloc](&v4, sel_dealloc);
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
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (*p_pluggedIn)
        v8 = CFSTR("plugged in");
      else
        v8 = CFSTR("unplugged");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_INFO, "device is now %@", (uint8_t *)&v10, 0xCu);
    }

    if (*p_pluggedIn)
    {
      if (_powerAssertion)
        -[MFPowerController _releasePowerAssertion_nts](self, "_releasePowerAssertion_nts");
    }
    else if (-[NSCountedSet count](self->_identifiers, "count") && !self->_isForeground && !_powerAssertion)
    {
      -[MFPowerController _retainPowerAssertion_nts](self, "_retainPowerAssertion_nts");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("MFPowerStateDidChange"), self);

  }
}

- (BOOL)isPluggedIn
{
  return self->_pluggedIn != 0;
}

- (BOOL)isHoldingAssertion
{
  return _powerAssertion != 0;
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

- (void)startListeningForBatterySaverNotifications
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_INFO, "listening for low-power mode notifications", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__lowPowerModeChangedNotification_, *MEMORY[0x1E0CB3048], 0);

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
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLowPowerModeEnabled");
    v6 = CFSTR("OFF");
    if (v5)
      v6 = CFSTR("ON");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_INFO, "low-power mode changed to %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("MFBatterySaverModeDidChange"), 0);

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
  if (_powerAssertionTimer)
  {
    MFLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C8839000, v5, OS_LOG_TYPE_INFO, "#Assertions [*] cancel power assertion timer", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)_powerAssertionTimer);
    v6 = (void *)_powerAssertionTimer;
    _powerAssertionTimer = 0;

  }
  if (a3 > 0.0)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v14 = (int)a3;
      _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_INFO, "#Assertions [*] schedule %d sec power assertion timer", buf, 8u);
    }

    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    v9 = (void *)_powerAssertionTimer;
    _powerAssertionTimer = (uint64_t)v8;

    -[MFPowerController _assertionTimeout](self, "_assertionTimeout");
    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)_powerAssertionTimer, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __42__MFPowerController__setupAssertionTimer___block_invoke;
    handler[3] = &unk_1E81CB468;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)_powerAssertionTimer, handler);
    dispatch_resume((dispatch_object_t)_powerAssertionTimer);
  }
}

void __42__MFPowerController__setupAssertionTimer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  MFLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C8839000, v2, OS_LOG_TYPE_INFO, "#Assertions [*] power assertion timer expired", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_releasePowerAssertion_nts");
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_33);
  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, &__block_literal_global_34);

}

void __42__MFPowerController__setupAssertionTimer___block_invoke_32()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("MFPowerAssertionDidExpire"), 0);

}

uint64_t __42__MFPowerController__setupAssertionTimer___block_invoke_2()
{
  return objc_msgSend((id)_observers_0, "makeObjectsPerformSelector:", sel_assertionDidExpire);
}

- (void)_retainPowerAssertion_nts
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_powerAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPowerController.m"), 238, CFSTR("assertion IS NOT NULL"));

  }
  if (_powerAssertionTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPowerController.m"), 239, CFSTR("assertion timer IS NOT nil"));

  }
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = CFSTR("com.apple.messageLegacy.preventSleep");
    _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_INFO, "#Assertions [+] %@", (uint8_t *)&v7, 0xCu);
  }

  _powerAssertion = CPPowerAssertionCreate();
  -[MFPowerController _assertionTimeout](self, "_assertionTimeout");
  -[MFPowerController _setupAssertionTimer:](self, "_setupAssertionTimer:");
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
  if (!_powerAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPowerController.m"), 249, CFSTR("assertion IS NULL"));

  }
  if (!_powerAssertionTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPowerController.m"), 250, CFSTR("assertion timer IS nil"));

  }
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = CFSTR("com.apple.messageLegacy.preventSleep");
    _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_INFO, "#Assertions [-] %@", (uint8_t *)&v7, 0xCu);
  }

  -[MFPowerController _setupAssertionTimer:](self, "_setupAssertionTimer:", 0.0);
  CFRelease((CFTypeRef)_powerAssertion);
  _powerAssertion = 0;
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
  block[3] = &unk_1E81CAB10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __51__MFPowerController_retainAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MFLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1C8839000, v2, OS_LOG_TYPE_INFO, "#Assertions [+] %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(result + 48))
  {
    result = objc_msgSend((id)result, "isPluggedIn");
    if ((result & 1) == 0 && !_powerAssertion)
      return objc_msgSend(*(id *)(a1 + 40), "_retainPowerAssertion_nts");
  }
  return result;
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
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1C8839000, v5, OS_LOG_TYPE_INFO, "#Assertions [-] %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__MFPowerController_releaseAssertionWithIdentifier___block_invoke;
  v8[3] = &unk_1E81CAB10;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(queue, v8);

}

uint64_t __52__MFPowerController_releaseAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  if (result)
    v3 = 1;
  else
    v3 = _powerAssertion == 0;
  if (!v3)
    return objc_msgSend(*(id *)(a1 + 32), "_releasePowerAssertion_nts");
  return result;
}

- (void)_applicationForegroundStateChanged_nts:(BOOL)a3
{
  if (self->_isForeground != a3)
  {
    self->_isForeground = a3;
    if (a3)
    {
      if (_powerAssertion)
        -[MFPowerController _releasePowerAssertion_nts](self, "_releasePowerAssertion_nts");
    }
    else if (-[NSCountedSet count](self->_identifiers, "count")
           && !-[MFPowerController isPluggedIn](self, "isPluggedIn")
           && !_powerAssertion)
    {
      -[MFPowerController _retainPowerAssertion_nts](self, "_retainPowerAssertion_nts");
    }
  }
}

- (void)_applicationForegroundStateChanged:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__MFPowerController__applicationForegroundStateChanged___block_invoke;
  v4[3] = &unk_1E81CB268;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __56__MFPowerController__applicationForegroundStateChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applicationForegroundStateChanged_nts:", *(unsigned __int8 *)(a1 + 40));
}

- (id)powerObservable
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D1EF28], "observableOnDefaultNotificationCenterWithName:object:", CFSTR("MFPowerStateDidChange"), self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "map:", &__block_literal_global_53);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __36__MFPowerController_powerObservable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
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
  objc_msgSend(v5, "map:", &__block_literal_global_56);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v6;
}

uint64_t __40__MFPowerController_pluggedInObservable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isPluggedIn"));
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
  v9[3] = &unk_1E81CB710;
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

uint64_t __43__MFPowerController_lowPowerModeObservable__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isBatterySaverModeEnabled"));
}

- (id)copyDiagnosticInformation
{
  id v3;
  const __CFString *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  NSObject *queue;
  id v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v15;

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

  if (_powerAssertion)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("  holding assertion: %@\n"), v8);
  objc_msgSend(v3, "appendString:", CFSTR("\n==== Internal Assertions ====\n"));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MFPowerController_copyDiagnosticInformation__block_invoke;
  block[3] = &unk_1E81CAB10;
  block[4] = self;
  v10 = v3;
  v15 = v10;
  dispatch_sync(queue, block);
  v11 = v15;
  v12 = v10;

  return v12;
}

void __46__MFPowerController_copyDiagnosticInformation__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
          v8 = *(void **)(a1 + 40);
          v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "countForObject:", v7);
          objc_msgSend(v8, "appendFormat:", CFSTR("  %@: %d\n"), v7, v9, (_QWORD)v10);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("(empty)\n"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStateCancelable, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_powerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)sharedInstance
{
  __assert_rtn("+[MFPowerController sharedInstance]", "MFPowerController.m", 125, "instance != nil");
}

@end
