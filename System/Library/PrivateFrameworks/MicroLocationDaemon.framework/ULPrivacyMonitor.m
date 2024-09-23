@implementation ULPrivacyMonitor

- (ULPrivacyMonitor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULPrivacyMonitor)initWithNotificationHelper:(id)a3
{
  id v4;
  ULPrivacyMonitor *v5;
  ULPrivacyMonitor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULPrivacyMonitor;
  v5 = -[ULEventMonitor init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ULPrivacyMonitor setNotificationHelper:](v5, "setNotificationHelper:", v4);

  return v6;
}

- (void)startMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  int v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc(MEMORY[0x24BDBFA88]);
  -[ULEventMonitor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/Routine.bundle"), self, v7);
  -[ULPrivacyMonitor setLocationManager:](self, "setLocationManager:", v8);

  -[ULPrivacyMonitor setLocationServicesEnabled:](self, "setLocationServicesEnabled:", 1);
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_119);
  v9 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = -[ULPrivacyMonitor locationServicesEnabled](self, "locationServicesEnabled");
    v12 = CFSTR("NO");
    if (v11)
      v12 = CFSTR("YES");
    v13 = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, locationServicesEnabled: %@", (uint8_t *)&v13, 0x16u);

  }
}

- (void)stopMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_119);
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v7, 0xCu);
  }
  -[ULPrivacyMonitor setLocationManager:](self, "setLocationManager:", 0);
  -[ULPrivacyMonitor setLocationServicesEnabled:](self, "setLocationServicesEnabled:", 0);

}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  ULPrivacyMonitorEventLocationServices *v8;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[ULEvent eventName](ULPrivacyMonitorEventLocationServices, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_alloc_init(ULPrivacyMonitorEventLocationServices);
    -[ULPrivacyMonitorEventLocationServices setLocationServicesEnabled:](v8, "setLocationServicesEnabled:", -[ULPrivacyMonitor locationServicesEnabled](self, "locationServicesEnabled"));
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)_checkLocationServicesEnabledForAuthorizationStatus:(int)a3
{
  return a3 == 3;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (BOOL)locationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL8 v10;
  ULPrivacyMonitorEventLocationServices *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[ULEventMonitor queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[ULPrivacyMonitor locationManager](self, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "authorizationStatus");

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_119);
  v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[ULPrivacyMonitor _locationAuthorizationStatusToString:](self, "_locationAuthorizationStatusToString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "location manager did change auth status: %@", (uint8_t *)&v12, 0xCu);

  }
  v10 = -[ULPrivacyMonitor _checkLocationServicesEnabledForAuthorizationStatus:](self, "_checkLocationServicesEnabledForAuthorizationStatus:", v6);
  if (v10 != -[ULPrivacyMonitor locationServicesEnabled](self, "locationServicesEnabled"))
  {
    -[ULPrivacyMonitor setLocationServicesEnabled:](self, "setLocationServicesEnabled:", v10);
    v11 = objc_alloc_init(ULPrivacyMonitorEventLocationServices);
    -[ULPrivacyMonitorEventLocationServices setLocationServicesEnabled:](v11, "setLocationServicesEnabled:", v10);
    -[ULEventMonitor postEvent:](self, "postEvent:", v11);

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[ULEventMonitor queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_119);
  v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_ERROR, "Location manager failed with error: %@", (uint8_t *)&v8, 0xCu);
  }

}

- (id)_locationAuthorizationStatusToString:(int)a3
{
  if (a3 > 4)
    return CFSTR("Unkown");
  else
    return off_2511DBC20[a3];
}

@end
