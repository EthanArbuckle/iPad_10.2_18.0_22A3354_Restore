@implementation GEOSystemMonitor

+ (GEOSystemMonitor)sharedInstance
{
  if (_MergedGlobals_338 != -1)
    dispatch_once(&_MergedGlobals_338, &__block_literal_global_207);
  return (GEOSystemMonitor *)(id)qword_1ECDBCC50;
}

void __34__GEOSystemMonitor_sharedInstance__block_invoke()
{
  GEOSystemMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(GEOSystemMonitor);
  v1 = (void *)qword_1ECDBCC50;
  qword_1ECDBCC50 = (uint64_t)v0;

}

- (GEOSystemMonitor)init
{
  GEOSystemMonitor *v2;
  uint64_t v3;
  geo_isolater *isolater;
  uint64_t v5;
  OS_dispatch_queue *queue;
  GEOSystemMonitor *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOSystemMonitor;
  v2 = -[GEOSystemMonitor init](&v9, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    v5 = geo_dispatch_queue_create();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    *(_QWORD *)&v2->_powerAdapterNotifyToken = -1;
    v7 = v2;
  }

  return v2;
}

- (BOOL)isBackgroundAppRefreshEnabledForBundleIdentifier:(id)a3 isDisabledGlobally:(BOOL *)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  if (objc_opt_class()
    && (objc_msgSend(MEMORY[0x1E0D47228], "sharedConnection"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isAutomaticAppUpdatesAllowed"),
        v6,
        (v7 & 1) != 0))
  {
    if (a4)
      *a4 = 0;
    v8 = (void *)CFPreferencesCopyAppValue(CFSTR("KeepAppsUpToDateAppList"), CFSTR("com.apple.mt"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v10 = objc_msgSend(v9, "BOOLValue");
      else
        v10 = 1;

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
    if (a4)
      *a4 = 1;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  GEOSystemMonitor *v8;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __27__GEOSystemMonitor_dealloc__block_invoke;
  v7 = &unk_1E1BFF6F8;
  v8 = self;
  geo_isolate_sync();
  v3.receiver = self;
  v3.super_class = (Class)GEOSystemMonitor;
  -[GEOSystemMonitor dealloc](&v3, sel_dealloc);
}

uint64_t __27__GEOSystemMonitor_dealloc__block_invoke(uint64_t a1)
{
  -[GEOSystemMonitor _disablePowerNotifications](*(_QWORD *)(a1 + 32));
  -[GEOSystemMonitor _disableBatteryPercentageNotifications](*(_QWORD *)(a1 + 32));
  return -[GEOSystemMonitor _disablePowerAdapterNotifications](*(_QWORD *)(a1 + 32));
}

- (void)_disablePowerNotifications
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    geo_assert_isolated();
    if (_rootPort)
    {
      GEOGetSystemMonitorLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Unregistering for IOKit power notifications", v3, 2u);
      }

      IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 32), 0);
      IODeregisterForSystemPower((io_object_t *)(a1 + 40));
      IOServiceClose(_rootPort);
      IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 32));
      _rootPort = 0;
    }
  }
}

- (uint64_t)_disableBatteryPercentageNotifications
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (result)
  {
    v1 = result;
    result = geo_assert_isolated();
    if (*(_DWORD *)(v1 + 76) != -1)
    {
      GEOGetSystemMonitorLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Unregistering for IOKit battery percentage notifications", v3, 2u);
      }

      result = notify_cancel(*(_DWORD *)(v1 + 76));
      *(_DWORD *)(v1 + 76) = -1;
      *(_QWORD *)(v1 + 88) = 0;
    }
  }
  return result;
}

- (uint64_t)_disablePowerAdapterNotifications
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (result)
  {
    v1 = result;
    result = geo_assert_isolated();
    if (*(_DWORD *)(v1 + 72) != -1)
    {
      GEOGetSystemMonitorLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Unregistering for IOKit power adapter notifications", v3, 2u);
      }

      result = notify_cancel(*(_DWORD *)(v1 + 72));
      *(_DWORD *)(v1 + 72) = -1;
      *(_BYTE *)(v1 + 80) = 0;
    }
  }
  return result;
}

void __36__GEOSystemMonitor__systemCanSleep___block_invoke(uint64_t a1)
{
  BOOL v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "hasObservers");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v2 = 1;
  else
    v2 = _rootPort == 0;
  if (!v2)
    -[GEOSystemMonitor _disablePowerNotifications](*(_QWORD *)(a1 + 32));
}

void __36__GEOSystemMonitor__systemCanSleep___block_invoke_10(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  if (a2)
  {
    v3 = *(NSObject **)(a1 + 32);
    v4 = a2;
    dispatch_group_enter(v3);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__GEOSystemMonitor__systemCanSleep___block_invoke_2;
    v7[3] = &unk_1E1C04340;
    v6 = *(_OWORD *)(a1 + 32);
    v5 = (id)v6;
    v8 = v6;
    objc_msgSend(v4, "systemCanSleep:", v7);

  }
}

void __36__GEOSystemMonitor__systemCanSleep___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __36__GEOSystemMonitor__systemCanSleep___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __37__GEOSystemMonitor__systemWillSleep___block_invoke(uint64_t a1)
{
  BOOL v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "hasObservers");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v2 = 1;
  else
    v2 = _rootPort == 0;
  if (!v2)
    -[GEOSystemMonitor _disablePowerNotifications](*(_QWORD *)(a1 + 32));
}

void __37__GEOSystemMonitor__systemWillSleep___block_invoke_13(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    v3 = *(NSObject **)(a1 + 32);
    v4 = a2;
    dispatch_group_enter(v3);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__GEOSystemMonitor__systemWillSleep___block_invoke_2;
    v5[3] = &unk_1E1BFF6F8;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "systemWillSleep:", v5);

  }
}

void __37__GEOSystemMonitor__systemWillSleep___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __34__GEOSystemMonitor__systemDidWake__block_invoke(uint64_t a1)
{
  BOOL v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "hasObservers");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v2 = 1;
  else
    v2 = _rootPort == 0;
  if (!v2)
    -[GEOSystemMonitor _disablePowerNotifications](*(_QWORD *)(a1 + 32));
}

- (void)addSystemSleepObserver:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  geo_isolate_sync();

}

void __49__GEOSystemMonitor_addSystemSleepObserver_queue___block_invoke(_QWORD *a1)
{
  void *v2;
  GEOObserverHashTable *v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = *(void **)(a1[4] + 24);
  if (!v2)
  {
    v3 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EDFBE9A0, 0);
    v4 = a1[4];
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(a1[4] + 24);
  }
  v6 = objc_msgSend(v2, "hasObservers");
  objc_msgSend(*(id *)(a1[4] + 24), "registerObserver:queue:", a1[5], a1[6]);
  if ((v6 & 1) == 0)
  {
    v7 = a1[4];
    if (v7)
    {
      geo_assert_isolated();
      if (!_rootPort)
      {
        GEOGetSystemMonitorLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Registering for IOKit power notifications", buf, 2u);
        }

        _rootPort = IORegisterForSystemPower(0, (IONotificationPortRef *)(v7 + 32), (IOServiceInterestCallback)_GEOSystemMonitorPowerNotification, (io_object_t *)(v7 + 40));
        if (_rootPort)
        {
          IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(v7 + 32), *(dispatch_queue_t *)(v7 + 8));
        }
        else
        {
          GEOGetSystemMonitorLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_FAULT, "IORegisterForSystemPower failed", v10, 2u);
          }

        }
      }
    }
  }
}

- (void)removeSystemSleepObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

void __46__GEOSystemMonitor_removeSystemSleepObserver___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "hasObservers"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unregisterObserver:", *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "hasObservers") & 1) == 0)
      -[GEOSystemMonitor _disablePowerNotifications](*(_QWORD *)(a1 + 32));
  }
}

- (void)addPowerAdapterObserver:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  geo_isolate_sync();

}

void __50__GEOSystemMonitor_addPowerAdapterObserver_queue___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  GEOObserverHashTable *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 48))
  {
    v3 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EDF739A0, 0);
    v4 = a1[4];
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = a1[4];
  }
  v6 = objc_msgSend(*(id *)(v2 + 56), "hasObservers");
  v7 = *(void **)(a1[4] + 48);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "registerObserver:queue:", a1[5], a1[6]);
  }
  else
  {
    v8 = objc_msgSend(v7, "hasObservers");
    objc_msgSend(*(id *)(a1[4] + 48), "registerObserver:queue:", a1[5], a1[6]);
    if ((v8 & 1) == 0)
      -[GEOSystemMonitor _enablePowerAdapterNotifications](a1[4]);
  }
}

- (void)_enablePowerAdapterNotifications
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD handler[4];
  id v7;
  id buf[2];

  if (a1)
  {
    geo_assert_isolated();
    if (*(_DWORD *)(a1 + 72) == -1)
    {
      GEOGetSystemMonitorLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Registering for IOKit power adapter notifications", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, (id)a1);
      v3 = *(NSObject **)(a1 + 8);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __52__GEOSystemMonitor__enablePowerAdapterNotifications__block_invoke;
      handler[3] = &unk_1E1C05280;
      objc_copyWeak(&v7, buf);
      if (notify_register_dispatch("com.apple.system.powermanagement.poweradapter", (int *)(a1 + 72), v3, handler))
      {
        GEOGetSystemMonitorLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v5 = 0;
          _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_FAULT, "Registering for power adapter changes failed", v5, 2u);
        }

      }
      else
      {
        -[GEOSystemMonitor _updatePowerAdapterState](a1);
      }
      objc_destroyWeak(&v7);
      objc_destroyWeak(buf);
    }
  }
}

- (void)removePowerAdapterObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

uint64_t __47__GEOSystemMonitor_removePowerAdapterObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "hasObservers");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "unregisterObserver:", *(_QWORD *)(a1 + 40));
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "hasObservers");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "hasObservers");
      if ((result & 1) == 0)
        return -[GEOSystemMonitor _disablePowerAdapterNotifications](*(_QWORD *)(a1 + 32));
    }
  }
  return result;
}

- (void)addBatteryLevelObserver:(id)a3 onlyWhenCharging:(BOOL)a4 queue:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  geo_isolate_sync();

}

void __67__GEOSystemMonitor_addBatteryLevelObserver_onlyWhenCharging_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  GEOObserverHashTable *v5;
  uint64_t v6;
  void *v7;
  GEOObserverHashTable *v8;
  uint64_t v9;
  _BOOL4 v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56) && !*(_QWORD *)(v2 + 56))
  {
    v8 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EDF73A20, 0);
    v9 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v9 + 56);
    *(_QWORD *)(v9 + 56) = v8;
  }
  else
  {
    if (*(_QWORD *)(v2 + 64))
    {
      if (*(_BYTE *)(a1 + 56))
        goto LABEL_5;
LABEL_13:
      v3 = 0;
      goto LABEL_14;
    }
    v5 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EDF73A20, 0);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = v5;
  }

  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_13;
LABEL_5:
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "hasObservers") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "hasObservers") ^ 1;
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = 56;
    goto LABEL_15;
  }
LABEL_14:
  v4 = 64;
LABEL_15:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v4), "registerObserver:queue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasObservers") & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "hasObservers")
       && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "hasObservers")
       && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) != 0;
  if (v3)
    -[GEOSystemMonitor _enablePowerAdapterNotifications](*(_QWORD *)(a1 + 32));
  if (v10)
    -[GEOSystemMonitor _enableBatteryPercentageNotifications](*(_QWORD *)(a1 + 32));
}

- (void)_enableBatteryPercentageNotifications
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD handler[4];
  id v7;
  id buf[2];

  if (a1)
  {
    geo_assert_isolated();
    if (*(_DWORD *)(a1 + 76) == -1)
    {
      GEOGetSystemMonitorLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Registering for IOKit battery percentage notifications", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, (id)a1);
      v3 = *(NSObject **)(a1 + 8);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __57__GEOSystemMonitor__enableBatteryPercentageNotifications__block_invoke;
      handler[3] = &unk_1E1C05280;
      objc_copyWeak(&v7, buf);
      if (notify_register_dispatch("com.apple.system.powersources.percent", (int *)(a1 + 76), v3, handler))
      {
        GEOGetSystemMonitorLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v5 = 0;
          _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_FAULT, "Registering for battery percentage changes failed", v5, 2u);
        }

      }
      else
      {
        -[GEOSystemMonitor _updateBatteryPercentage](a1);
      }
      objc_destroyWeak(&v7);
      objc_destroyWeak(buf);
    }
  }
}

- (void)removeBatteryLevelObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

uint64_t __47__GEOSystemMonitor_removeBatteryLevelObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "hasObservers") & 1) != 0
    || (result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasObservers"), (_DWORD)result))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "unregisterObserver:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "unregisterObserver:", *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "hasObservers") & 1) == 0
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "hasObservers") & 1) == 0)
    {
      -[GEOSystemMonitor _disablePowerAdapterNotifications](*(_QWORD *)(a1 + 32));
    }
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hasObservers");
    if ((result & 1) == 0)
    {
      v3 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v3 + 80))
      {
        result = objc_msgSend(*(id *)(v3 + 56), "hasObservers");
        if ((result & 1) != 0)
          return result;
        v3 = *(_QWORD *)(a1 + 32);
      }
      return -[GEOSystemMonitor _disableBatteryPercentageNotifications](v3);
    }
  }
  return result;
}

- (BOOL)isPowerAdapterConnected
{
  GEOSystemMonitor *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_isolater;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_powerPluggedIn;
  _geo_isolate_unlock();

  return (char)v2;
}

- (unint64_t)batteryLevel
{
  unint64_t batteryLevel;
  geo_isolater *v5;

  v5 = self->_isolater;
  _geo_isolate_lock_data();
  batteryLevel = self->_batteryLevel;
  _geo_isolate_unlock();

  return batteryLevel;
}

void __52__GEOSystemMonitor__enablePowerAdapterNotifications__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  int v3;
  id *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    geo_isolate_sync();
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    geo_isolate_sync();
    if (*((_BYTE *)v6 + 24))
    {
      GEOGetSystemMonitorLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = *((unsigned __int8 *)v10 + 24);
        *(_DWORD *)buf = 67109120;
        v14 = v3;
        _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Power adapter state did change (%i). Notifying observers", buf, 8u);
      }

      objc_msgSend(v4[6], "deviceDidChangePowerAdapterState:", *((unsigned __int8 *)v10 + 24));
    }
    _Block_object_dispose(&v5, 8);
    _Block_object_dispose(&v9, 8);
    WeakRetained = v4;
  }

}

void __52__GEOSystemMonitor__enablePowerAdapterNotifications__block_invoke_2(uint64_t a1)
{
  -[GEOSystemMonitor _updatePowerAdapterState](*(_QWORD *)(a1 + 32));
}

- (void)_updatePowerAdapterState
{
  int v2;

  if (a1)
  {
    geo_assert_isolated();
    if (*(_DWORD *)(a1 + 72) != -1)
    {
      v2 = IOPSDrawingUnlimitedPower();
      *(_BYTE *)(a1 + 80) = v2;
      if (v2
        && objc_msgSend(*(id *)(a1 + 56), "hasObservers")
        && (objc_msgSend(*(id *)(a1 + 64), "hasObservers") & 1) == 0)
      {
        -[GEOSystemMonitor _enableBatteryPercentageNotifications](a1);
      }
      else if ((objc_msgSend(*(id *)(a1 + 64), "hasObservers") & 1) == 0
             && (!*(_BYTE *)(a1 + 80) || (objc_msgSend(*(id *)(a1 + 56), "hasObservers") & 1) == 0))
      {
        -[GEOSystemMonitor _disableBatteryPercentageNotifications](a1);
      }
    }
  }
}

uint64_t __58__GEOSystemMonitor__postPowerAdapterDidChangeNotification__block_invoke(uint64_t *a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 80);
  if ((objc_msgSend(*(id *)(a1[4] + 48), "hasObservers") & 1) != 0)
    result = 1;
  else
    result = objc_msgSend(*(id *)(a1[4] + 56), "hasObservers");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return -[GEOSystemMonitor _disablePowerAdapterNotifications](a1[4]);
  return result;
}

void __57__GEOSystemMonitor__enableBatteryPercentageNotifications__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    geo_isolate_sync();
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    geo_isolate_sync();
    if (*((_BYTE *)v6 + 24))
    {
      GEOGetSystemMonitorLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = v10[3];
        *(_DWORD *)buf = 134283521;
        v14 = v3;
        _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Battery level did change (%{private}llu). Notifying observers", buf, 0xCu);
      }

      objc_msgSend(v4[8], "deviceDidChangeBatteryLevel:", v10[3]);
      if (*((_BYTE *)v4 + 80))
        objc_msgSend(v4[7], "deviceDidChangeBatteryLevel:", v10[3]);
    }
    _Block_object_dispose(&v5, 8);
    _Block_object_dispose(&v9, 8);
    WeakRetained = v4;
  }

}

uint64_t __57__GEOSystemMonitor__enableBatteryPercentageNotifications__block_invoke_2(uint64_t a1)
{
  return -[GEOSystemMonitor _updateBatteryPercentage](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_updateBatteryPercentage
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    geo_assert_isolated();
    result = IOPSGetPercentRemaining();
    if (!(_DWORD)result)
      *(_QWORD *)(v1 + 88) = 0;
  }
  return result;
}

uint64_t __61__GEOSystemMonitor__postBatteryPercentageChangedNotification__block_invoke(uint64_t *a1)
{
  char v2;
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 88);
  if ((objc_msgSend(*(id *)(a1[4] + 64), "hasObservers") & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(*(id *)(a1[4] + 56), "hasObservers");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    -[GEOSystemMonitor _disableBatteryPercentageNotifications](a1[4]);
  result = objc_msgSend(*(id *)(a1[4] + 56), "hasObservers");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1[4] + 48), "hasObservers");
    if ((result & 1) == 0)
      return -[GEOSystemMonitor _disablePowerAdapterNotifications](a1[4]);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryObservers, 0);
  objc_storeStrong((id *)&self->_chargingOnlyBatteryObservers, 0);
  objc_storeStrong((id *)&self->_powerAdapterObservers, 0);
  objc_storeStrong((id *)&self->_systemSleepObservers, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
