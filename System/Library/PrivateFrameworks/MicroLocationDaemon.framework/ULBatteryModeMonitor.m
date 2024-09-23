@implementation ULBatteryModeMonitor

- (ULBatteryModeMonitor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULBatteryModeMonitor)initWithNotificationHelper:(id)a3
{
  id v4;
  ULBatteryModeMonitor *v5;
  ULBatteryModeMonitor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULBatteryModeMonitor;
  v5 = -[ULEventMonitor init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ULBatteryModeMonitor setNotificationHelper:](v5, "setNotificationHelper:", v4);

  return v6;
}

- (void)startMonitoring:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[ULEventMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ULEvent eventName](ULBatteryModeMonitorEventUnlimitedPower, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqual:", v5);

  if (v6)
  {
    -[ULBatteryModeMonitor _startMonitoringForUnlimitedPower](self, "_startMonitoringForUnlimitedPower");
  }
  else
  {
    +[ULEvent eventName](ULBatteryModeMonitorEventLowPowerMode, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", v7);

    if (v8)
      -[ULBatteryModeMonitor _startMonitoringForLowPowerMode](self, "_startMonitoringForLowPowerMode");
  }

}

- (void)stopMonitoring:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[ULEventMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ULEvent eventName](ULBatteryModeMonitorEventUnlimitedPower, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqual:", v5);

  if (v6)
  {
    -[ULBatteryModeMonitor _stopMonitoringForUnlimitedPower](self, "_stopMonitoringForUnlimitedPower");
  }
  else
  {
    +[ULEvent eventName](ULBatteryModeMonitorEventLowPowerMode, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", v7);

    if (v8)
      -[ULBatteryModeMonitor _stopMonitoringForLowPowerMode](self, "_stopMonitoringForLowPowerMode");
  }

}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  ULBatteryModeMonitorEventUnlimitedPower *v8;
  void *v9;
  int v10;
  ULBatteryModeMonitorEventLowPowerMode *v11;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ULEvent eventName](ULBatteryModeMonitorEventUnlimitedPower, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_alloc_init(ULBatteryModeMonitorEventUnlimitedPower);
    -[ULBatteryModeMonitorEventUnlimitedPower setUnlimitedPower:](v8, "setUnlimitedPower:", -[ULBatteryModeMonitor unlimitedPower](self, "unlimitedPower"));
  }
  else
  {
    +[ULEvent eventName](ULBatteryModeMonitorEventLowPowerMode, "eventName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqual:", v9);

    if (v10)
    {
      v11 = objc_alloc_init(ULBatteryModeMonitorEventLowPowerMode);
      -[ULBatteryModeMonitorEventLowPowerMode setLowPowerMode:](v11, "setLowPowerMode:", -[ULBatteryModeMonitor lowPowerMode](self, "lowPowerMode"));

    }
    v8 = 0;
  }

  return v8;
}

- (void)_startMonitoringForUnlimitedPower
{
  void *v3;
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  -[ULBatteryModeMonitor notificationHelper](self, "notificationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __57__ULBatteryModeMonitor__startMonitoringForUnlimitedPower__block_invoke;
  v11 = &unk_2511D2C80;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "addObserverForNotificationName:handler:", CFSTR("com.apple.system.powermanagement.poweradapter"), &v8);

  -[ULBatteryModeMonitor setUnlimitedPower:](self, "setUnlimitedPower:", -[ULBatteryModeMonitor _checkUnlimitedPower](self, "_checkUnlimitedPower", v8, v9, v10, v11));
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_20);
  v4 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[ULEvent eventName](ULBatteryModeMonitorEventUnlimitedPower, "eventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ULBatteryModeMonitor unlimitedPower](self, "unlimitedPower");
    v7 = CFSTR("NO");
    if (v6)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, unlimitedPower: %@", buf, 0x16u);

  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __57__ULBatteryModeMonitor__startMonitoringForUnlimitedPower__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleIOPSNotifyAdapterChangeNotification");
    WeakRetained = v2;
  }

}

- (void)_startMonitoringForLowPowerMode
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleNSProcessInfoPowerStateDidChangeNotification_, *MEMORY[0x24BDD1160], 0);

  -[ULBatteryModeMonitor setLowPowerMode:](self, "setLowPowerMode:", -[ULBatteryModeMonitor _checkLowPowerMode](self, "_checkLowPowerMode"));
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_20);
  v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    +[ULEvent eventName](ULBatteryModeMonitorEventLowPowerMode, "eventName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ULBatteryModeMonitor lowPowerMode](self, "lowPowerMode");
    v8 = CFSTR("NO");
    if (v7)
      v8 = CFSTR("YES");
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, lowPowerMode: %@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)_stopMonitoringForUnlimitedPower
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_20);
  v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    +[ULEvent eventName](ULBatteryModeMonitorEventUnlimitedPower, "eventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v7, 0xCu);

  }
  -[ULBatteryModeMonitor notificationHelper](self, "notificationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserverForNotificationName:", CFSTR("com.apple.system.powermanagement.poweradapter"));

  -[ULBatteryModeMonitor setUnlimitedPower:](self, "setUnlimitedPower:", 0);
}

- (void)_stopMonitoringForLowPowerMode
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_20);
  v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    +[ULEvent eventName](ULBatteryModeMonitorEventLowPowerMode, "eventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDD1160], 0);

  -[ULBatteryModeMonitor setLowPowerMode:](self, "setLowPowerMode:", 0);
}

- (void)_handleIOPSNotifyAdapterChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ULBatteryModeMonitor__handleIOPSNotifyAdapterChangeNotification__block_invoke;
  block[3] = &unk_2511D2C58;
  block[4] = self;
  dispatch_async(v3, block);

}

void __66__ULBatteryModeMonitor__handleIOPSNotifyAdapterChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  ULBatteryModeMonitorEventUnlimitedPower *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_checkUnlimitedPower");
  if ((_DWORD)v2 != objc_msgSend(*(id *)(a1 + 32), "unlimitedPower"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setUnlimitedPower:", v2);
    v3 = objc_alloc_init(ULBatteryModeMonitorEventUnlimitedPower);
    -[ULBatteryModeMonitorEventUnlimitedPower setUnlimitedPower:](v3, "setUnlimitedPower:", v2);
    objc_msgSend(*(id *)(a1 + 32), "postEvent:", v3);

  }
}

- (void)_handleNSProcessInfoPowerStateDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[ULEventMonitor queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__ULBatteryModeMonitor__handleNSProcessInfoPowerStateDidChangeNotification___block_invoke;
  block[3] = &unk_2511D2C58;
  block[4] = self;
  dispatch_async(v4, block);

}

void __76__ULBatteryModeMonitor__handleNSProcessInfoPowerStateDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  ULBatteryModeMonitorEventLowPowerMode *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_checkLowPowerMode");
  if ((_DWORD)v2 != objc_msgSend(*(id *)(a1 + 32), "lowPowerMode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLowPowerMode:", v2);
    v3 = objc_alloc_init(ULBatteryModeMonitorEventLowPowerMode);
    -[ULBatteryModeMonitorEventLowPowerMode setLowPowerMode:](v3, "setLowPowerMode:", v2);
    objc_msgSend(*(id *)(a1 + 32), "postEvent:", v3);

  }
}

- (BOOL)_checkLowPowerMode
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  return v3;
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (BOOL)unlimitedPower
{
  return self->_unlimitedPower;
}

- (void)setUnlimitedPower:(BOOL)a3
{
  self->_unlimitedPower = a3;
}

- (BOOL)lowPowerMode
{
  return self->_lowPowerMode;
}

- (void)setLowPowerMode:(BOOL)a3
{
  self->_lowPowerMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

@end
