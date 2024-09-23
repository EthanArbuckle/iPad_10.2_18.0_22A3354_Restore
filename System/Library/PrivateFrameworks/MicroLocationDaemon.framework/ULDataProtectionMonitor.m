@implementation ULDataProtectionMonitor

- (ULDataProtectionMonitor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULDataProtectionMonitor)initWithNotificationHelper:(id)a3
{
  id v4;
  ULDataProtectionMonitor *v5;
  ULDataProtectionMonitor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULDataProtectionMonitor;
  v5 = -[ULEventMonitor init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ULDataProtectionMonitor setNotificationHelper:](v5, "setNotificationHelper:", v4);

  return v6;
}

- (void)startMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  _QWORD v11[4];
  id v12;
  _BYTE location[12];
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[ULDataProtectionMonitor _checkHasContentProtection](self, "_checkHasContentProtection") == 1)
  {
    objc_initWeak((id *)location, self);
    -[ULDataProtectionMonitor notificationHelper](self, "notificationHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43__ULDataProtectionMonitor_startMonitoring___block_invoke;
    v11[3] = &unk_2511D2C80;
    objc_copyWeak(&v12, (id *)location);
    objc_msgSend(v6, "addObserverForNotificationName:handler:", CFSTR("com.apple.mobile.keybagd.lock_status"), v11);

    -[ULDataProtectionMonitor setDataAvailable:](self, "setDataAvailable:", -[ULDataProtectionMonitor _checkDataAvailable](self, "_checkDataAvailable"));
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
  }
  else
  {
    -[ULDataProtectionMonitor setDataAvailable:](self, "setDataAvailable:", 1);
  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_94);
  v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = -[ULDataProtectionMonitor dataAvailable](self, "dataAvailable");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = v4;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, dataAvailable: %@", location, 0x16u);

  }
}

void __43__ULDataProtectionMonitor_startMonitoring___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleKeyBagLockStatusChangeNotification");
    WeakRetained = v2;
  }

}

- (void)stopMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_94);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }
  -[ULDataProtectionMonitor notificationHelper](self, "notificationHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserverForNotificationName:", CFSTR("com.apple.mobile.keybagd.lock_status"));

  -[ULDataProtectionMonitor setDataAvailable:](self, "setDataAvailable:", 0);
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  ULDataProtectionMonitorEventDataAvailable *v8;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ULEvent eventName](ULDataProtectionMonitorEventDataAvailable, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_alloc_init(ULDataProtectionMonitorEventDataAvailable);
    -[ULDataProtectionMonitorEventDataAvailable setDataAvailable:](v8, "setDataAvailable:", -[ULDataProtectionMonitor dataAvailable](self, "dataAvailable"));
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_handleKeyBagLockStatusChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[ULEventMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ULDataProtectionMonitor__handleKeyBagLockStatusChangeNotification__block_invoke;
  block[3] = &unk_2511D2C58;
  block[4] = self;
  dispatch_async(v3, block);

}

void __68__ULDataProtectionMonitor__handleKeyBagLockStatusChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  ULDataProtectionMonitorEventDataAvailable *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_checkDataAvailable");
  if ((_DWORD)v2 != objc_msgSend(*(id *)(a1 + 32), "dataAvailable"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDataAvailable:", v2);
    v3 = objc_alloc_init(ULDataProtectionMonitorEventDataAvailable);
    -[ULDataProtectionMonitorEventDataAvailable setDataAvailable:](v3, "setDataAvailable:", v2);
    objc_msgSend(*(id *)(a1 + 32), "postEvent:", v3);

  }
}

- (BOOL)_checkDataAvailable
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = MKBGetDeviceLockState();
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_94);
  v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = v3;
    objc_msgSend(v4, "numberWithInt:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "Lock state: %@", (uint8_t *)&v9, 0xCu);

  }
  return (_DWORD)v2 == 3 || (_DWORD)v2 == 0;
}

- (int)_checkHasContentProtection
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = MKBDeviceFormattedForContentProtection();
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_94);
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    if (!v2)
      v4 = CFSTR("NO");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "Init, content protection: %@", (uint8_t *)&v6, 0xCu);
  }
  return v2;
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (BOOL)dataAvailable
{
  return self->_dataAvailable;
}

- (void)setDataAvailable:(BOOL)a3
{
  self->_dataAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

@end
