@implementation CPLBatteryMonitor

+ (void)setDelegate:(id)a3
{
  objc_storeWeak(&_delegate, a3);
}

+ (CPLBatteryMonitorDelegate)delegate
{
  return (CPLBatteryMonitorDelegate *)objc_loadWeakRetained(&_delegate);
}

+ (void)_updateBatteryWithBatteryEntry:(unsigned int)a3
{
  int v4;
  const __CFAllocator *v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  int v14;
  int v15;
  void *v16;
  id CFProperty;

  v4 = (isExternalPowerConnected | hasEnoughBattery) != 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = (id)IORegistryEntryCreateCFProperty(a3, CFSTR("MaxCapacity"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v6 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("CurrentCapacity"), v5, 0);
  v7 = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("ExternalConnected"), v5, 0);
  if (CFProperty)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v13 = 0;
    v12 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "doubleValue");
    v10 = v9;
    objc_msgSend(CFProperty, "doubleValue");
    v12 = v10 / v11 * 100.0;
    v13 = v12 >= 80.0;
  }
  batteryLevel = *(_QWORD *)&v12;
  hasEnoughBattery = v13;
  v14 = objc_msgSend(v7, "BOOLValue");
  isExternalPowerConnected = v14;
  if (hasEnoughBattery)
    v15 = 1;
  else
    v15 = v14;
  if (v4 != v15)
    +[CPLPowerAssertion setHasEnoughPower:](CPLPowerAssertion, "setHasEnoughPower:");
  +[CPLBatteryMonitor delegate](CPLBatteryMonitor, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "batteryLevelDidChangeWithLevel:", *(double *)&batteryLevel);

}

+ (void)startMonitoringPowerEvents
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CPLBatteryMonitor_startMonitoringPowerEvents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (startMonitoringPowerEvents_onceToken != -1)
    dispatch_once(&startMonitoringPowerEvents_onceToken, block);
}

+ (NSString)powerStatus
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__16267;
  v9 = __Block_byref_object_dispose__16268;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CPLBatteryMonitor_powerStatus__block_invoke;
  block[3] = &unk_1E60D7240;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)batteryQueue, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

+ (double)batteryLevel
{
  double v2;
  _QWORD block[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CPLBatteryMonitor_batteryLevel__block_invoke;
  block[3] = &unk_1E60D7240;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)batteryQueue, block);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (NSDictionary)powerStatusPlist
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__16267;
  v9 = __Block_byref_object_dispose__16268;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CPLBatteryMonitor_powerStatusPlist__block_invoke;
  block[3] = &unk_1E60D7240;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)batteryQueue, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __37__CPLBatteryMonitor_powerStatusPlist__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (isExternalPowerConnected)
  {
    v14[0] = CFSTR("plugged");
    v13[0] = CFSTR("state");
    v13[1] = CFSTR("batteryLevel");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)*(double *)&batteryLevel);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v2;
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = v14;
    v5 = v13;
    v6 = 2;
  }
  else
  {
    v11[0] = CFSTR("state");
    v11[1] = CFSTR("lowBattery");
    v7 = &unk_1E611A288;
    if (hasEnoughBattery)
      v7 = &unk_1E611A270;
    v12[0] = CFSTR("battery");
    v12[1] = v7;
    v11[2] = CFSTR("batteryLevel");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)*(double *)&batteryLevel);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v2;
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = v12;
    v5 = v11;
    v6 = 3;
  }
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

double __33__CPLBatteryMonitor_batteryLevel__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)&batteryLevel;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = batteryLevel;
  return result;
}

void __32__CPLBatteryMonitor_powerStatus__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = CFSTR("high battery level");
  if (!hasEnoughBattery)
    v2 = CFSTR("low battery level");
  if (isExternalPowerConnected)
    v3 = CFSTR("connected to power");
  else
    v3 = (__CFString *)v2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (battery level: %.0f%%)"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), batteryLevel);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __47__CPLBatteryMonitor_startMonitoringPowerEvents__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  const __CFDictionary *v5;
  uint64_t MatchingService;
  kern_return_t v7;
  kern_return_t v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  CPLCopyDefaultSerialQueueAttributes();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.cpl.powermonitor", v2);
  v4 = (void *)batteryQueue;
  batteryQueue = (uint64_t)v3;

  LODWORD(v2) = *MEMORY[0x1E0CBBAA8];
  batteryIONotifyPort = (uint64_t)IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  IONotificationPortSetDispatchQueue((IONotificationPortRef)batteryIONotifyPort, (dispatch_queue_t)batteryQueue);
  v5 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService((mach_port_t)v2, v5);
  v7 = IOServiceAddInterestNotification((IONotificationPortRef)batteryIONotifyPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)BatteryStateChanged, *(void **)(a1 + 32), batteryNotificationRef);
  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      v8 = v7;
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10[0] = 67109120;
        v10[1] = v8;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Can't monitor power: %i", (uint8_t *)v10, 8u);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateBatteryWithBatteryEntry:", MatchingService);
  }
}

@end
