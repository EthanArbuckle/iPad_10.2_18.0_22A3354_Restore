@implementation CMContinuityCaptureBatteryStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_17);
  return (id)_batteryStateMonitor;
}

void __56__CMContinuityCaptureBatteryStateMonitor_sharedInstance__block_invoke()
{
  CMContinuityCaptureBatteryStateMonitor *v0;
  dispatch_queue_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v0 = [CMContinuityCaptureBatteryStateMonitor alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.continuitycapture.batterymonitor", v4);
  v2 = -[CMContinuityCaptureBatteryStateMonitor initWithQueue:](v0, "initWithQueue:", v1);
  v3 = (void *)_batteryStateMonitor;
  _batteryStateMonitor = v2;

}

- (CMContinuityCaptureBatteryStateMonitor)initWithQueue:(id)a3
{
  id v5;
  CMContinuityCaptureBatteryStateMonitor *v6;
  CMContinuityCaptureBatteryStateMonitor *v7;
  NSNumber *batteryLevel;
  CMContinuityCaptureBatteryStateMonitor *v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CMContinuityCaptureBatteryStateMonitor;
  v6 = -[CMContinuityCaptureBatteryStateMonitor init](&v19, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_queue, a3);
  batteryLevel = v7->_batteryLevel;
  v7->_batteryLevel = (NSNumber *)&unk_24F07FCE8;

  v7->_batteryState = 0;
  if (!-[CMContinuityCaptureBatteryStateMonitor setupNotification](v7, "setupNotification"))
  {
    CMContinuityCaptureLog(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureBatteryStateMonitor initWithQueue:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_8;
  }
  v9 = v7;
LABEL_4:

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)invalidated
{
  CMContinuityCaptureBatteryStateMonitor *v2;
  BOOL invalidated;

  v2 = self;
  objc_sync_enter(v2);
  invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  CMContinuityCaptureBatteryStateMonitor *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_invalidated = a3;
  objc_sync_exit(obj);

}

+ (void)invalidate
{
  if ((objc_msgSend((id)_batteryStateMonitor, "invalidated") & 1) == 0)
  {
    objc_msgSend((id)_batteryStateMonitor, "invalidate");
    objc_msgSend((id)_batteryStateMonitor, "setInvalidated:", 1);
  }
}

- (void)invalidate
{
  IONotificationPort *ioNotificationPort;
  io_object_t serviceNotification;

  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  serviceNotification = self->_serviceNotification;
  if (serviceNotification)
  {
    IOObjectRelease(serviceNotification);
    self->_serviceNotification = 0;
  }
}

+ (int64_t)resolveBatteryState:(BOOL)a3 isBatteryChargingThermallyLimited:(BOOL)a4 batteryCapacity:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  int64_t v9;

  v5 = a4;
  v6 = a3;
  v7 = a5;
  v8 = v7;
  if (v6)
  {
    if ((int)objc_msgSend(v7, "intValue") > 74 || v5)
    {
      if ((int)objc_msgSend(v8, "intValue") <= 74 && v5)
        v9 = 4;
      else
        v9 = 4 * ((int)objc_msgSend(v8, "intValue") > 74);
    }
    else
    {
      v9 = 2;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)handleBatteryInfoChanged
{
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_registry_entry_t v6;
  const __CFAllocator *v7;
  void *CFProperty;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int64_t v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  int v19;
  CMContinuityCaptureBatteryStateMonitor *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = *MEMORY[0x24BDD8B18];
  v4 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    v6 = MatchingService;
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("CurrentCapacity"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v9 = (void *)IORegistryEntryCreateCFProperty(v6, CFSTR("ExternalConnected"), v7, 0);
    v10 = (void *)IORegistryEntryCreateCFProperty(v6, CFSTR("ChargerData"), v7, 0);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TimeChargingThermallyLimited"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v11, "intValue") < 1)
      v12 = 0;
    else
      v12 = objc_msgSend(v9, "BOOLValue");

    if (CMContinityCaptureDebugLogEnabled())
    {
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v19 = 138413058;
        v20 = self;
        v21 = 2112;
        v22 = CFProperty;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v10;
        _os_log_debug_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEBUG, "%@ currentBatteryCapacity %@ externalACConnected %@ chargerDataDict %@", (uint8_t *)&v19, 0x2Au);
      }

    }
    v14 = +[CMContinuityCaptureBatteryStateMonitor resolveBatteryState:isBatteryChargingThermallyLimited:batteryCapacity:](CMContinuityCaptureBatteryStateMonitor, "resolveBatteryState:isBatteryChargingThermallyLimited:batteryCapacity:", objc_msgSend(v9, "BOOLValue"), v12, CFProperty);
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(CFProperty, "floatValue");
    *(float *)&v17 = v16 / 100.0;
    objc_msgSend(v15, "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_batteryState != v14)
    {
      -[CMContinuityCaptureBatteryStateMonitor willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("batteryState"));
      self->_batteryState = v14;
      -[CMContinuityCaptureBatteryStateMonitor didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("batteryState"));
    }
    if (!-[NSNumber isEqualToNumber:](self->_batteryLevel, "isEqualToNumber:", v18))
    {
      -[CMContinuityCaptureBatteryStateMonitor willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("batteryLevel"));
      objc_storeStrong((id *)&self->_batteryLevel, v18);
      -[CMContinuityCaptureBatteryStateMonitor didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("batteryLevel"));
    }
    IOObjectRelease(v6);

  }
}

- (BOOL)setupNotification
{
  void *v3;
  mach_port_t v4;
  IONotificationPort *v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  IONotificationPort *ioNotificationPort;
  id v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id location;
  uint8_t buf[24];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __59__CMContinuityCaptureBatteryStateMonitor_setupNotification__block_invoke;
  v33 = &unk_24F06AE60;
  objc_copyWeak(&v34, &location);
  v3 = (void *)MEMORY[0x22E2A7CB0](&v30);
  v4 = *MEMORY[0x24BDD8B18];
  v5 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  self->_ioNotificationPort = v5;
  if (!v5)
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureBatteryStateMonitor setupNotification].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_11;
  }
  v6 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(v4, v6);
  if (!MatchingService)
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureBatteryStateMonitor setupNotification].cold.2(v13, v21, v22, v23, v24, v25, v26, v27);
LABEL_11:

    v11 = 0;
    goto LABEL_6;
  }
  ioNotificationPort = self->_ioNotificationPort;
  v9 = objc_loadWeakRetained(&location);
  v10 = IOServiceAddInterestNotification(ioNotificationPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)handleBatteryInfoChanged, v9, &self->_serviceNotification);

  v11 = (_DWORD)v10 == 0;
  if ((_DWORD)v10)
  {
    CMContinuityCaptureLog(2);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10, v30, v31, v32, v33);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMContinuityCaptureBatteryStateMonitor setupNotification].cold.3(v29, buf, v28);
    }

  }
  else
  {
    IONotificationPortSetDispatchQueue(self->_ioNotificationPort, (dispatch_queue_t)self->_queue);
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    dispatch_async_and_wait((dispatch_queue_t)self->_queue, v3);
  }
  IOObjectRelease(MatchingService);
LABEL_6:

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
  return v11;
}

void __59__CMContinuityCaptureBatteryStateMonitor_setupNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "handleBatteryInfoChanged");
    WeakRetained = v2;
  }

}

- (int64_t)batteryState
{
  return self->_batteryState;
}

- (NSNumber)batteryLevel
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithQueue:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9_0(&dword_227C5D000, a1, a3, "Unable to setup battery state monitor", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_14();
}

- (void)setupNotification
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_227C5D000, log, OS_LOG_TYPE_ERROR, "Failed to register notification at root domain service. error %@.", buf, 0xCu);

}

@end
