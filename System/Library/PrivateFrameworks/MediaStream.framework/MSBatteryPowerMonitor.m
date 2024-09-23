@implementation MSBatteryPowerMonitor

- (MSBatteryPowerMonitor)init
{
  MSBatteryPowerMonitor *v2;
  MSBatteryPowerMonitor *v3;
  mach_port_t v4;
  IONotificationPort *v5;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoop *Current;
  const __CFDictionary *v8;
  uint64_t MatchingService;
  NSObject *v10;
  const char *v11;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MSBatteryPowerMonitor;
  v2 = -[MSBatteryPowerMonitor init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSBatteryPowerMonitor setCurrentLevel:](v2, "setCurrentLevel:", -1.0);
    v4 = *MEMORY[0x1E0CBBAA8];
    v5 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
    v3->_batteryIONotifyPort = v5;
    RunLoopSource = IONotificationPortGetRunLoopSource(v5);
    v3->_batteryRunLoopSource = RunLoopSource;
    if (!RunLoopSource)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        v10 = MEMORY[0x1E0C81028];
        v11 = "Cannot retrieve runloop source for battery monitor.";
        goto LABEL_13;
      }
LABEL_7:

      return 0;
    }
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v3->_batteryRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    v8 = IOServiceMatching("IOPMPowerSource");
    MatchingService = IOServiceGetMatchingService(v4, v8);
    if (IOServiceAddInterestNotification(v3->_batteryIONotifyPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)BatteryStateChanged, v3, &v3->_batteryNotificationRef))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        v10 = MEMORY[0x1E0C81028];
        v11 = "Cannot listen to battery level change notification.";
LABEL_13:
        _os_log_error_impl(&dword_1D51BF000, v10, OS_LOG_TYPE_ERROR, v11, v13, 2u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Listening to battery level changes.", v13, 2u);
    }
    -[MSBatteryPowerMonitor updateBatteryLevelWithBatteryEntry:](v3, "updateBatteryLevelWithBatteryEntry:", MatchingService);
    -[MSBatteryPowerMonitor _updateBatteryConnectedStateWithBatteryEntry:](v3, "_updateBatteryConnectedStateWithBatteryEntry:", MatchingService);
  }
  return v3;
}

- (void)dealloc
{
  __CFRunLoop *Current;
  const __CFString *v4;
  __CFRunLoop *v5;
  IONotificationPort *batteryIONotifyPort;
  io_object_t batteryNotificationRef;
  objc_super v8;

  Current = CFRunLoopGetCurrent();
  v4 = (const __CFString *)*MEMORY[0x1E0C9B280];
  if (CFRunLoopContainsSource(Current, self->_batteryRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]))
  {
    v5 = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(v5, self->_batteryRunLoopSource, v4);
  }
  batteryIONotifyPort = self->_batteryIONotifyPort;
  if (batteryIONotifyPort)
  {
    IONotificationPortDestroy(batteryIONotifyPort);
    self->_batteryIONotifyPort = 0;
  }
  batteryNotificationRef = self->_batteryNotificationRef;
  if (batteryNotificationRef)
  {
    IOObjectRelease(batteryNotificationRef);
    self->_batteryNotificationRef = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)MSBatteryPowerMonitor;
  -[MSBatteryPowerMonitor dealloc](&v8, sel_dealloc);
}

- (void)updateBatteryLevelWithBatteryEntry:(unsigned int)a3
{
  const __CFAllocator *v5;
  void *CFProperty;
  void *v7;
  const void *v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("MaxCapacity"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v7 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("CurrentCapacity"), v5, 0);
  v8 = v7;
  v9 = -1.0;
  if (CFProperty)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    objc_msgSend(v7, "doubleValue", -1.0);
    v12 = v11;
    objc_msgSend(CFProperty, "doubleValue");
    v9 = v12 / v13;
  }
  -[MSBatteryPowerMonitor setCurrentLevel:](self, "setCurrentLevel:", v9);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[MSBatteryPowerMonitor currentLevel](self, "currentLevel");
    v15 = 134217984;
    v16 = v14 * 100.0;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Battery level: %.1f%%.", (uint8_t *)&v15, 0xCu);
  }
  if (CFProperty)
    CFRelease(CFProperty);
  if (v8)
    CFRelease(v8);
}

- (BOOL)_updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3
{
  void *CFProperty;
  const void *v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v13;
  __int16 v14;

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("ExternalConnected"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = objc_msgSend(CFProperty, "BOOLValue");
    v7 = v6 ^ -[MSBatteryPowerMonitor isExternalPowerConnected](self, "isExternalPowerConnected");
    if (v7 != 1)
    {
LABEL_11:
      CFRelease(v5);
      return v7;
    }
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
    if ((_DWORD)v6)
    {
      if (v8)
      {
        v14 = 0;
        v9 = MEMORY[0x1E0C81028];
        v10 = "External power connected.";
        v11 = (uint8_t *)&v14;
LABEL_9:
        _os_log_impl(&dword_1D51BF000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
      }
    }
    else if (v8)
    {
      LOWORD(v13) = 0;
      v9 = MEMORY[0x1E0C81028];
      v10 = "External power disconnected.";
      v11 = (uint8_t *)&v13;
      goto LABEL_9;
    }
    -[MSBatteryPowerMonitor setExternalPowerConnected:](self, "setExternalPowerConnected:", v6, v13);
    goto LABEL_11;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (void)updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3
{
  id v4;

  if (-[MSBatteryPowerMonitor _updateBatteryConnectedStateWithBatteryEntry:](self, "_updateBatteryConnectedStateWithBatteryEntry:", *(_QWORD *)&a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MSBatteryPowerMonitorExternalPowerSourceChangedNotification"), self);

  }
}

- (double)currentLevel
{
  return self->_currentLevel;
}

- (void)setCurrentLevel:(double)a3
{
  self->_currentLevel = a3;
}

- (BOOL)isExternalPowerConnected
{
  return self->_isExteralPowerConnected;
}

- (void)setExternalPowerConnected:(BOOL)a3
{
  self->_isExteralPowerConnected = a3;
}

+ (id)defaultMonitor
{
  if (defaultMonitor_onceToken != -1)
    dispatch_once(&defaultMonitor_onceToken, &__block_literal_global_353);
  return (id)defaultMonitor_monitor;
}

void __39__MSBatteryPowerMonitor_defaultMonitor__block_invoke()
{
  MSBatteryPowerMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(MSBatteryPowerMonitor);
  v1 = (void *)defaultMonitor_monitor;
  defaultMonitor_monitor = (uint64_t)v0;

}

@end
