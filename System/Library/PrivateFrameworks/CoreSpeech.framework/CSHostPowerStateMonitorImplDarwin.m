@implementation CSHostPowerStateMonitorImplDarwin

- (CSHostPowerStateMonitorImplDarwin)init
{
  CSHostPowerStateMonitorImplDarwin *v2;
  CSHostPowerStateMonitorImplDarwin *v3;
  mach_port_t v4;
  const __CFDictionary *v5;
  uint64_t MatchingService;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSHostPowerStateMonitorImplDarwin;
  v2 = -[CSEventMonitor init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_serviceNotification = 0;
    v4 = *MEMORY[0x1E0CBBAA8];
    v5 = IOServiceMatching("AppleDisplayPlatformControl");
    MatchingService = IOServiceGetMatchingService(v4, v5);
    if ((_DWORD)MatchingService)
      v7 = -[CSHostPowerStateMonitorImplDarwin _fetchHostStateWithService:](v3, "_fetchHostStateWithService:", MatchingService);
    else
      v7 = -1;
    v3->_hostState = v7;
  }
  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  mach_port_t v4;
  IONotificationPort *v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  os_log_t *v8;
  io_service_t v9;
  kern_return_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  io_object_t serviceNotification;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CBBAA8];
  v5 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  self->_notificationPort = v5;
  if (v5)
  {
    v6 = IOServiceMatching("AppleDisplayPlatformControl");
    MatchingService = IOServiceGetMatchingService(v4, v6);
    v8 = (os_log_t *)MEMORY[0x1E0D18F60];
    if (MatchingService)
    {
      v9 = MatchingService;
      IONotificationPortSetDispatchQueue(self->_notificationPort, MEMORY[0x1E0C80D38]);
      v10 = IOServiceAddInterestNotification(self->_notificationPort, v9, "IOGeneralInterest", (IOServiceInterestCallback)_serviceInterestCallbackHandler, self, &self->_serviceNotification);
      v11 = *v8;
      if (v10)
      {
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          v16 = 136315138;
          v17 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
          _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Failed to register host state notification", (uint8_t *)&v16, 0xCu);
        }
      }
      else if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315138;
        v17 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
        _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Host power state update", (uint8_t *)&v16, 0xCu);
      }
      IOObjectRelease(v9);
    }
    else
    {
      v13 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v16 = 136315138;
        v17 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
        _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Failed to find matching service for AppleDisplayPlatformControl", (uint8_t *)&v16, 0xCu);
      }
    }
    if (!self->_serviceNotification)
    {
      v14 = *v8;
      serviceNotification = os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR);
      if (serviceNotification)
      {
        v16 = 136315138;
        v17 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
        _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s Invalid service notification!", (uint8_t *)&v16, 0xCu);
        serviceNotification = self->_serviceNotification;
      }
      IOObjectRelease(serviceNotification);
      self->_serviceNotification = 0;
    }
  }
  else
  {
    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[CSHostPowerStateMonitorImplDarwin _startMonitoringWithQueue:]";
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Invalid notification port!", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_stopMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSHostPowerStateMonitorImplDarwin _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Host power state update", (uint8_t *)&v3, 0xCu);
  }
}

- (int64_t)currentPowerState
{
  return -1;
}

- (int64_t)currentRawPowerState
{
  return -1;
}

- (int64_t)currentDarwinHostState
{
  return self->_hostState;
}

- (int)_fetchHostStateWithService:(unsigned int)a3
{
  int v4;
  const __CFNumber *CFProperty;
  const __CFNumber *v6;
  CFTypeID v7;
  NSObject *v8;
  int valuePtr;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = -1;
  valuePtr = -1;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a3, CFSTR("HostState"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    v7 = CFGetTypeID(CFProperty);
    if (v7 == CFNumberGetTypeID())
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
    CFRelease(v6);
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[CSHostPowerStateMonitorImplDarwin _fetchHostStateWithService:]";
      v13 = 1026;
      v14 = valuePtr;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Darwin Host State update : %{public}d", buf, 0x12u);
    }
    v4 = valuePtr;
  }
  self->_hostState = v4;
  return v4;
}

- (void)_didReceiveDarwinHostStateChangeNotification:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__CSHostPowerStateMonitorImplDarwin__didReceiveDarwinHostStateChangeNotification___block_invoke;
  v3[3] = &unk_1E7C28CD8;
  v3[4] = self;
  v3[5] = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserver:(id)a3 withDarwinHostState:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "CSHostPowerStateMonitor:didReceiveDarwinHostStateChange:", self, a4);

}

uint64_t __82__CSHostPowerStateMonitorImplDarwin__didReceiveDarwinHostStateChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:withDarwinHostState:", a2, *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17329 != -1)
    dispatch_once(&sharedInstance_onceToken_17329, &__block_literal_global_17330);
  return (id)sharedInstance__sharedInstance_17331;
}

void __51__CSHostPowerStateMonitorImplDarwin_sharedInstance__block_invoke()
{
  CSHostPowerStateMonitorImplDarwin *v0;
  void *v1;

  v0 = objc_alloc_init(CSHostPowerStateMonitorImplDarwin);
  v1 = (void *)sharedInstance__sharedInstance_17331;
  sharedInstance__sharedInstance_17331 = (uint64_t)v0;

}

@end
