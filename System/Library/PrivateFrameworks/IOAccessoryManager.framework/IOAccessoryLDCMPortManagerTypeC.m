@implementation IOAccessoryLDCMPortManagerTypeC

- (IOAccessoryLDCMPortManagerTypeC)initWithParams:(unint64_t)a3 dryPollingIntervalNs:(unint64_t)a4
{
  char *v6;
  char *v7;
  const void *v8;
  const void *v9;
  id v10;
  dispatch_queue_t v11;
  dispatch_queue_t v12;
  HalogenTypeC *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint32_t v18;
  dispatch_time_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint32_t v23;
  dispatch_time_t v24;
  id v25;
  NSObject *v26;
  const char *v27;
  uint32_t v28;
  NSObject *v30;
  const char *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD handler[5];
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)IOAccessoryLDCMPortManagerTypeC;
  v6 = -[IOAccessoryLDCMPortManagerTypeC init](&v36, sel_init);
  v7 = v6;
  if (!v6)
    return (IOAccessoryLDCMPortManagerTypeC *)v7;
  *((_QWORD *)v6 + 12) = 1000000000 * a3;
  *((_QWORD *)v6 + 13) = 1000000000 * a4;
  *((_WORD *)v6 + 5) = 0;
  *((_WORD *)v6 + 7) = 0;
  v6[16] = 0;
  *((_DWORD *)v6 + 8) = 4;
  *(_WORD *)(v6 + 21) = 0;
  *((_DWORD *)v6 + 15) = 0;
  *((_DWORD *)v6 + 16) = 0;
  *(_QWORD *)(v6 + 44) = 0;
  *(_QWORD *)(v6 + 36) = 0;
  objc_msgSend(v6, "_controlLDCMMeasurements");
  *(_WORD *)(v7 + 17) = 0;
  *(_WORD *)(v7 + 23) = 0;
  v7[25] = 0;
  v8 = (const void *)MGCopyAnswer();
  if (v8)
  {
    v9 = v8;
    v7[11] = CFEqual(v8, CFSTR("Internal")) != 0;
    CFRelease(v9);
  }
  else
  {
    v7[11] = 0;
  }
  *((_QWORD *)v7 + 9) = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  *((_QWORD *)v7 + 20) = v10;
  if (!v10)
    return 0;
  objc_msgSend(v7, "_registerForLDCMNotifications");
  v11 = dispatch_queue_create("HalogenTypeCDispatchQueue", 0);
  *((_QWORD *)v7 + 10) = v11;
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_DWORD *)buf = 136315138;
    v38 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v30 = MEMORY[0x1E0C81028];
    v31 = "%s Failed to create HalogenTypeCDispatchQueue\n";
LABEL_38:
    _os_log_impl(&dword_1D13BF000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
    goto LABEL_39;
  }
  v12 = dispatch_queue_create("HalogenTypeCUserPromptDispatchQueue", 0);
  *((_QWORD *)v7 + 24) = v12;
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_DWORD *)buf = 136315138;
    v38 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v30 = MEMORY[0x1E0C81028];
    v31 = "%s Failed to create HalogenTypeCUserPromptDispatchQueue\n";
    goto LABEL_38;
  }
  v13 = -[HalogenTypeC initWithParams:onPort:]([HalogenTypeC alloc], "initWithParams:onPort:", 2182, 1);
  *((_QWORD *)v7 + 9) = v13;
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return (IOAccessoryLDCMPortManagerTypeC *)v7;
    *(_WORD *)buf = 0;
    v26 = MEMORY[0x1E0C81028];
    v27 = "Failed to instantiate HalogenTypeC. Exiting... \n";
    v28 = 2;
    goto LABEL_20;
  }
  v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v7 + 10));
  *((_QWORD *)v7 + 11) = v14;
  if (!v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_DWORD *)buf = 136315138;
    v38 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v30 = MEMORY[0x1E0C81028];
    v31 = "%s Failed to create HalogenTypeC Timer\n";
    goto LABEL_38;
  }
  v15 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke;
  handler[3] = &unk_1E9214120;
  handler[4] = v7;
  dispatch_source_set_event_handler(v14, handler);
  dispatch_source_set_timer(*((dispatch_source_t *)v7 + 11), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v7 + 11));
  v16 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v7 + 10));
  *((_QWORD *)v7 + 17) = v16;
  if (!v16)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_DWORD *)buf = 136315138;
    v38 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v30 = MEMORY[0x1E0C81028];
    v31 = "%s Failed to create HalogenTypeC Timer\n";
    goto LABEL_38;
  }
  v34[0] = v15;
  v34[1] = 3221225472;
  v34[2] = __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_7;
  v34[3] = &unk_1E9214120;
  v34[4] = v7;
  dispatch_source_set_event_handler(v16, v34);
  v17 = *((_QWORD *)v7 + 17);
  v18 = arc4random_uniform(0xFu);
  v19 = dispatch_walltime(0, 1000000000 * (v18 + 1));
  dispatch_source_set_timer(v17, v19, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v7 + 17));
  v20 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v7 + 10));
  *((_QWORD *)v7 + 18) = v20;
  if (!v20)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_DWORD *)buf = 136315138;
    v38 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v30 = MEMORY[0x1E0C81028];
    v31 = "%s Failed to create HalogenTypeC Timer\n";
    goto LABEL_38;
  }
  v33[0] = v15;
  v33[1] = 3221225472;
  v33[2] = __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_8;
  v33[3] = &unk_1E9214120;
  v33[4] = v7;
  dispatch_source_set_event_handler(v20, v33);
  dispatch_source_set_timer(*((dispatch_source_t *)v7 + 18), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v7 + 18));
  if (objc_msgSend(*((id *)v7 + 9), "isHWSelfTestCapable"))
  {
    v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v7 + 10));
    *((_QWORD *)v7 + 16) = v21;
    if (!v21)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
        v30 = MEMORY[0x1E0C81028];
        v31 = "%s Failed to create HalogenTypeC Timer\n";
        goto LABEL_38;
      }
      goto LABEL_39;
    }
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_9;
    v32[3] = &unk_1E9214120;
    v32[4] = v7;
    dispatch_source_set_event_handler(v21, v32);
    v22 = *((_QWORD *)v7 + 16);
    v23 = arc4random_uniform(0xFu);
    v24 = dispatch_walltime(0, 1000000000 * (v23 + 1));
    dispatch_source_set_timer(v22, v24, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v7 + 16));
  }
  v25 = objc_alloc_init(MEMORY[0x1E0CB3530]);
  *((_QWORD *)v7 + 21) = v25;
  if (!v25)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
      v30 = MEMORY[0x1E0C81028];
      v31 = "%s Failed to create HalogenTypeC NSCondition\n";
      goto LABEL_38;
    }
LABEL_39:

    return 0;
  }
  objc_msgSend(v7, "_readLDCMBootArgs");
  v7[12] = objc_msgSend(v7, "_checkIsReceptacleEmpty");
  objc_msgSend(v7, "_processLDCMDefauts:", 1);
  objc_msgSend(v7, "_manageLDCMSettings");
  *((_DWORD *)v7 + 14) = 10;
  objc_msgSend(v7, "_processLDCMAnalyticsDefauts");
  if (v7[11])
    objc_msgSend(v7, "_writeAndNotifyDefaults:value:domain:notify:notification:", CFSTR("MitigationsEnabled"), CFSTR("No"), CFSTR("com.apple.CoreAccessories.LDCMPreferences"), 1, CFSTR("com.apple.CoreAccessories.MitigationsDidChange"));
  *((_QWORD *)v7 + 19) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "_resetLDCMErrorDict");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[IOAccessoryLDCMPortManagerTypeC initWithParams:dryPollingIntervalNs:]";
    v26 = MEMORY[0x1E0C81028];
    v27 = "%s IOAccessoryLDCMPortManagerTypeC initialized.\n";
    v28 = 12;
LABEL_20:
    _os_log_impl(&dword_1D13BF000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, v28);
  }
  return (IOAccessoryLDCMPortManagerTypeC *)v7;
}

uint64_t __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performTypeCMeasurement");
}

uint64_t __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performTypeCReferenceMeasurement");
}

uint64_t __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkPortState");
}

uint64_t __71__IOAccessoryLDCMPortManagerTypeC_initWithParams_dryPollingIntervalNs___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performTypeCSelfTest");
}

- (void)dealloc
{
  NSObject *timer;
  NSObject *timerSelfTest;
  NSObject *timerReferenceMeasurement;
  NSObject *timerPortStateCheck;
  NSObject *halogenTypeCDispatchQueue;
  NSObject *halogenTypeCUserPromptDispatchQueue;
  HalogenTypeC *typeC;
  NSMutableDictionary *ldcmErrorCountDict;
  objc_super v11;

  timer = self->_timer;
  if (timer)
    dispatch_release(timer);
  timerSelfTest = self->_timerSelfTest;
  if (timerSelfTest)
    dispatch_release(timerSelfTest);
  timerReferenceMeasurement = self->_timerReferenceMeasurement;
  if (timerReferenceMeasurement)
    dispatch_release(timerReferenceMeasurement);
  timerPortStateCheck = self->_timerPortStateCheck;
  if (timerPortStateCheck)
    dispatch_release(timerPortStateCheck);
  halogenTypeCDispatchQueue = self->_halogenTypeCDispatchQueue;
  if (halogenTypeCDispatchQueue)
    dispatch_release(halogenTypeCDispatchQueue);
  halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
  if (halogenTypeCUserPromptDispatchQueue)
    dispatch_release(halogenTypeCUserPromptDispatchQueue);
  typeC = self->_typeC;
  if (typeC)

  ldcmErrorCountDict = self->_ldcmErrorCountDict;
  if (ldcmErrorCountDict)

  v11.receiver = self;
  v11.super_class = (Class)IOAccessoryLDCMPortManagerTypeC;
  -[IOAccessoryLDCMPortManagerTypeC dealloc](&v11, sel_dealloc);
}

- (void)_loadFrontBoard
{
  void *v3;

  if (!self->_FBSOpenApplicationOptionKeyPromptUnlockDevice)
  {
    v3 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 4);
    if (v3)
      self->_FBSOpenApplicationOptionKeyPromptUnlockDevice = dlsym(v3, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  }
}

- (void)_checkPortState
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_isReceptacleEmpty)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    v5 = 136315138;
    v6 = "-[IOAccessoryLDCMPortManagerTypeC _checkPortState]";
    v3 = MEMORY[0x1E0C81028];
    v4 = "%s Receptacle empty, skip checking port state";
    goto LABEL_12;
  }
  if (!self->_isWet)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    v5 = 136315138;
    v6 = "-[IOAccessoryLDCMPortManagerTypeC _checkPortState]";
    v3 = MEMORY[0x1E0C81028];
    v4 = "%s Port not wet, skipping alert";
LABEL_12:
    _os_log_impl(&dword_1D13BF000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
    return;
  }
  if (!-[IOAccessoryLDCMPortManagerTypeC _throttleUserNotification](self, "_throttleUserNotification"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[IOAccessoryLDCMPortManagerTypeC _checkPortState]";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Port has been wet for a while, reminding user", (uint8_t *)&v5, 0xCu);
    }
    -[IOAccessoryLDCMPortManagerTypeC _showWetPrompt](self, "_showWetPrompt");
    self->_followupAlertShown = 1;
  }
}

- (BOOL)_checkIsReceptacleEmpty
{
  mach_port_t v2;
  const __CFDictionary *v3;
  kern_return_t MatchingServices;
  io_object_t v5;
  BOOL v6;
  BOOL v7;
  io_object_t v8;
  io_registry_entry_t v9;
  const __CFAllocator *v10;
  const __CFNumber *CFProperty;
  const __CFNumber *v12;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  int valuePtr;
  io_iterator_t existing;

  existing = 0;
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("IOPort");
  MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  v5 = existing;
  if (MatchingServices)
    v6 = 1;
  else
    v6 = existing == 0;
  if (v6)
  {
    v7 = 1;
    if (!existing)
      return !v7;
    goto LABEL_22;
  }
  v8 = IOIteratorNext(existing);
  if (v8)
  {
    v9 = v8;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      valuePtr = 0;
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v9, CFSTR("PortType"), v10, 0);
      v12 = CFProperty;
      if (CFProperty)
      {
        CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
        if (valuePtr == 2)
        {
          v13 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v9, CFSTR("ConnectionActive"), v10, 0);
          if (v13)
          {
            v14 = v13;
            v7 = CFBooleanGetValue(v13) != 0;
            CFRelease(v14);
          }
          else
          {
            v7 = 1;
          }
          IOObjectRelease(v9);
          goto LABEL_20;
        }
      }
      v9 = IOIteratorNext(existing);
    }
    while (v9);
    v7 = 1;
    if (!v12)
      goto LABEL_21;
LABEL_20:
    CFRelease(v12);
  }
  else
  {
    v7 = 1;
  }
LABEL_21:
  v5 = existing;
  if (existing)
LABEL_22:
    IOObjectRelease(v5);
  return !v7;
}

- (void)_registerForLDCMNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__IOAccessoryLDCMPortManagerTypeC__registerForLDCMNotifications__block_invoke;
  block[3] = &unk_1E9214120;
  block[4] = self;
  if (_registerForLDCMNotifications_onceToken != -1)
    dispatch_once(&_registerForLDCMNotifications_onceToken, block);
}

void __64__IOAccessoryLDCMPortManagerTypeC__registerForLDCMNotifications__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v3;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)handleLDCMNotification, CFSTR("com.apple.CoreAccessories.LDCMPreferencesNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, *(const void **)(a1 + 32), (CFNotificationCallback)handleUserRequestedRadarNotification, CFSTR("com.apple.CoreAccessories.LDCMFileRadarNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, *(const void **)(a1 + 32), (CFNotificationCallback)handleLDCMNotification, CFSTR("com.apple.CoreAccessories.TestLDCMAnalyticsNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, *(const void **)(a1 + 32), (CFNotificationCallback)handleLDCMNotification, CFSTR("com.apple.CoreAccessories.LDCMMitigationsOverrideNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, *(const void **)(a1 + 32), (CFNotificationCallback)handleLDCMNotification, CFSTR("com.apple.CoreAccessories.LDCMSettingsDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v7, *(const void **)(a1 + 32), (CFNotificationCallback)handleLDCMNotification, CFSTR("com.apple.CoreAccessories.LDCMActiveMeasurementsDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_manageLDCMSettings
{
  const __CFBoolean *v3;

  v3 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("FakeWetMeasurements"), CFSTR("com.apple.CoreAccessories.LDCMPreferences"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v3)
    self->_fakeWetMeasurements = CFBooleanGetValue(v3) != 0;
}

- (void)_processMitigationsOverride
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to override mitigations.", v0, 2u);
}

- (void)_processLDCMDefauts:(BOOL)a3
{
  const __CFBoolean *v5;
  const __CFBoolean *v6;

  v5 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("DisablePeriodicMeasurements"), CFSTR("com.apple.CoreAccessories.LDCMPreferences"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  v6 = v5;
  if (v5 && CFBooleanGetValue(v5))
  {
    dispatch_suspend((dispatch_object_t)-[IOAccessoryLDCMPortManagerTypeC halogenTypeCDispatchQueue](self, "halogenTypeCDispatchQueue"));
LABEL_7:
    CFRelease(v6);
    return;
  }
  if (!a3)
    dispatch_resume((dispatch_object_t)-[IOAccessoryLDCMPortManagerTypeC halogenTypeCDispatchQueue](self, "halogenTypeCDispatchQueue"));
  if (v6)
    goto LABEL_7;
}

- (void)_processLDCMAnalyticsDefauts
{
  const __CFString *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  _BOOL4 isInternalBuild;
  void *v7;
  const void *v8;
  const __CFBoolean *v9;
  const __CFBoolean *v10;

  v3 = (const __CFString *)*MEMORY[0x1E0C9B250];
  v4 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("EnableAnalyticsTest"), CFSTR("com.apple.CoreAccessories.TestLDCMAnalytics"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v4)
  {
    v5 = v4;
    if (CFBooleanGetValue(v4))
      isInternalBuild = self->_isInternalBuild;
    else
      isInternalBuild = 0;
    DEBUG_ANALYTICS = isInternalBuild;
    CFRelease(v5);
  }
  if (DEBUG_ANALYTICS)
  {
    WET_TOO_LONG_THRESHOLD = 1;
    v7 = (void *)CFPreferencesCopyValue(CFSTR("AnalyticsTestEvent"), CFSTR("com.apple.CoreAccessories.TestLDCMAnalytics"), CFSTR("mobile"), v3);
    if (v7)
    {
      v8 = v7;
      self->_analyticsDebugEvent = objc_msgSend(v7, "intValue");
      CFRelease(v8);
    }
  }
  v9 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("MeasureSBU"), CFSTR("com.apple.CoreAccessories.TestLDCMAnalytics"), CFSTR("mobile"), v3);
  if (v9)
  {
    v10 = v9;
    self->_measureSBU = CFBooleanGetValue(v9) != 0;
    CFRelease(v10);
  }
}

- (void)_writeAndNotifyDefaults:(id)a3 value:(id)a4 domain:(id)a5 notify:(BOOL)a6 notification:(id)a7
{
  _BOOL4 v8;
  __CFNotificationCenter *DarwinNotifyCenter;

  v8 = a6;
  CFPreferencesSetValue((CFStringRef)a3, a4, (CFStringRef)a5, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)a7, self, 0, 1u);
  }
}

- (void)handleAttachEvent
{
  NSObject *halogenTypeCDispatchQueue;
  _QWORD block[5];

  halogenTypeCDispatchQueue = self->_halogenTypeCDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__IOAccessoryLDCMPortManagerTypeC_handleAttachEvent__block_invoke;
  block[3] = &unk_1E9214120;
  block[4] = self;
  dispatch_async(halogenTypeCDispatchQueue, block);
}

uint64_t __52__IOAccessoryLDCMPortManagerTypeC_handleAttachEvent__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsReceptacleEmpty:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNewAccArrived:", 1);
  objc_msgSend(*(id *)(a1 + 32), "performTypeCMeasurement");
  return objc_msgSend(*(id *)(a1 + 32), "setNewAccArrived:", 0);
}

- (void)handleDetachEvent
{
  NSObject *halogenTypeCDispatchQueue;
  _QWORD block[5];

  halogenTypeCDispatchQueue = self->_halogenTypeCDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__IOAccessoryLDCMPortManagerTypeC_handleDetachEvent__block_invoke;
  block[3] = &unk_1E9214120;
  block[4] = self;
  dispatch_async(halogenTypeCDispatchQueue, block);
}

uint64_t __52__IOAccessoryLDCMPortManagerTypeC_handleDetachEvent__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInitialAlertShown:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setFollowupAlertShown:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsReceptacleEmpty:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_dismissWetPrompt");
}

- (void)_showMitigationAlert
{
  id v3;
  const __CFDictionary *v4;
  __CFUserNotification *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  CFOptionFlags responseFlags;
  SInt32 error;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = (const __CFDictionary *)objc_msgSend(v3, "initWithObjectsAndKeys:", CFSTR("Liquid Detected. Turning off Type-C Port. The port will be re-enabled automatically once dry."), *MEMORY[0x1E0C9B800], CFSTR("At your own risk, you may override this now or later from Settings > Accessories > Re-Enable Port."), *MEMORY[0x1E0C9B810], CFSTR("Override"), *MEMORY[0x1E0C9B830], CFSTR("OK"), *MEMORY[0x1E0C9B838], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0C9B820], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0DABB98], *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0DABBB0], 0);
  error = 0;
  responseFlags = 0xAAAAAAAAAAAAAAAALL;
  v5 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v4);
  error = CFUserNotificationReceiveResponse(v5, 0.0, &responseFlags);
  if (!error && responseFlags == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.CoreAccessories.LDCMMitigationsOverrideNotification"), self, 0, 1u);
  }

}

- (BOOL)_holdPowerAssertionTypeC:(BOOL)a3
{
  _BOOL4 isPowerAssertionHeld;
  _BOOL4 v5;
  uint64_t v8;
  const __CFDictionary *v9;
  IOPMAssertionID AssertionID;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  isPowerAssertionHeld = self->_isPowerAssertionHeld;
  if (isPowerAssertionHeld == a3)
    return 1;
  v5 = a3;
  if (self->_isPowerAssertionHeld || !a3)
  {
    if (!self->_isPowerAssertionHeld || a3)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:].cold.2(isPowerAssertionHeld);
    }
    else if (IOPMAssertionRelease(self->_sleepAssertionID))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:].cold.3();
    }
    else
    {
      self->_isPowerAssertionHeld = 0;
    }
  }
  else
  {
    v11[0] = CFSTR("AssertType");
    v11[1] = CFSTR("AssertLevel");
    v12[0] = CFSTR("NoIdleSleepAssertion");
    v12[1] = &unk_1E9220150;
    v11[2] = CFSTR("AssertName");
    v11[3] = CFSTR("AllowsDeviceRestart");
    v8 = *MEMORY[0x1E0C9AE50];
    v12[2] = CFSTR("com.apple.ioaccessorymanager.halogenTypeC");
    v12[3] = v8;
    v9 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
    AssertionID = self->_sleepAssertionID;
    if (IOPMAssertionCreateWithProperties(v9, &AssertionID))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:].cold.1();
    }
    else
    {
      self->_sleepAssertionID = AssertionID;
      self->_isPowerAssertionHeld = 1;
    }
  }
  return self->_isPowerAssertionHeld == v5;
}

- (void)_readLDCMBootArgs
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "%s Could not locate boot-args.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (BOOL)_setMitigations:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v5;
  BOOL v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!self->_enableMitigationsBootArgSet)
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
      -[IOAccessoryLDCMPortManagerTypeC _setMitigations:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    return 0;
  }
  v3 = a3;
  if (!a3 && !self->_isWet)
    -[HalogenTypeC setLiquidDetected:](self->_typeC, "setLiquidDetected:", 0);
  if (!-[HalogenTypeC setMitigations:](self->_typeC, "setMitigations:", v3))
    return 0;
  self->_mitigationsEnabled = v3;
  if (v3)
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  v6 = 1;
  -[IOAccessoryLDCMPortManagerTypeC _writeAndNotifyDefaults:value:domain:notify:notification:](self, "_writeAndNotifyDefaults:value:domain:notify:notification:", CFSTR("MitigationsEnabled"), v5, CFSTR("com.apple.CoreAccessories.LDCMPreferences"), 1, CFSTR("com.apple.CoreAccessories.MitigationsDidChange"));
  return v6;
}

- (void)_controlLDCMMeasurements
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "%s Could not disable mitigations.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (int)_halogenErrorToAnalyticError:(unsigned __int8)a3
{
  if ((a3 - 1) >= 0xA)
    return 0;
  else
    return a3;
}

- (int)_measurementErrorToAnalyticError:(unsigned __int8)a3
{
  if (((a3 - 3) & 0xF8) != 0)
    return 0;
  else
    return (a3 - 3) + 11;
}

- (void)_resetLDCMErrorDict
{
  uint64_t v3;
  NSMutableDictionary *ldcmErrorCountDict;
  uint64_t v5;

  self->_didReportDisabledAnalytic = 0;
  v3 = 1;
  do
  {
    ldcmErrorCountDict = self->_ldcmErrorCountDict;
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    -[NSMutableDictionary setObject:forKey:](ldcmErrorCountDict, "setObject:forKey:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
    v3 = (v3 + 1);
  }
  while ((_DWORD)v3 != 19);
}

- (BOOL)_recordLDCMError:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  NSMutableDictionary *ldcmErrorCountDict;
  uint64_t v8;

  if (self->_didReportDisabledAnalytic)
    return 0;
  v3 = *(_QWORD *)&a3;
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_ldcmErrorCountDict, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  -[NSMutableDictionary setObject:forKey:](self->_ldcmErrorCountDict, "setObject:forKey:", v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
  if (objc_msgSend(v6, "intValue") != 50)
    return 0;
  ldcmErrorCountDict = self->_ldcmErrorCountDict;
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  -[NSMutableDictionary setObject:forKey:](ldcmErrorCountDict, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
  return 1;
}

- (void)performTypeCSelfTest
{
  HalogenTypeC *v3;
  int v4;
  NSObject *halogenTypeCUserPromptDispatchQueue;
  NSObject *timerSelfTest;
  dispatch_time_t v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD block[5];
  _DWORD buf[3];
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = -[IOAccessoryLDCMPortManagerTypeC typeC](self, "typeC");
  -[NSCondition lock](self->_condition, "lock");
  -[IOAccessoryLDCMPortManagerTypeC setIsMeasurementActive:](self, "setIsMeasurementActive:", 1);
  -[NSCondition unlock](self->_condition, "unlock");
  if (!self->_isReceptacleEmpty)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    buf[0] = 136315138;
    *(_QWORD *)&buf[1] = "-[IOAccessoryLDCMPortManagerTypeC performTypeCSelfTest]";
    v8 = MEMORY[0x1E0C81028];
    v9 = "%s Receptacle not empty, will try again in 10 minutes.\n";
    goto LABEL_13;
  }
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    buf[0] = 136315138;
    *(_QWORD *)&buf[1] = "-[IOAccessoryLDCMPortManagerTypeC performTypeCSelfTest]";
    v8 = MEMORY[0x1E0C81028];
    v9 = "%s No valid instance of HalogenTypeC\n";
LABEL_13:
    v10 = 12;
    goto LABEL_16;
  }
  if (-[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:](self, "_holdPowerAssertionTypeC:", 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 136315138;
      *(_QWORD *)&buf[1] = "-[IOAccessoryLDCMPortManagerTypeC performTypeCSelfTest]";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Performing SelfTest.\n", (uint8_t *)buf, 0xCu);
    }
    v4 = -[HalogenTypeC doLDCMMeasurement:isCalibrationNeeded:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:](v3, "doLDCMMeasurement:isCalibrationNeeded:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:", 3, 0, self->_isReceptacleEmpty, self->_isWet, 3.5, 1.0);
    if (!v4)
    {
      halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__IOAccessoryLDCMPortManagerTypeC_performTypeCSelfTest__block_invoke;
      block[3] = &unk_1E9214120;
      block[4] = self;
      dispatch_async(halogenTypeCUserPromptDispatchQueue, block);
      v20 = xmmword_1D13E8118;
      v21 = unk_1D13E8128;
      v22 = xmmword_1D13E8138;
      v23 = -1;
      v16 = xmmword_1D13E80D8;
      v17 = unk_1D13E80E8;
      v18 = xmmword_1D13E80F8;
      v19 = unk_1D13E8108;
      v12 = xmmword_1D13E8098;
      v13 = unk_1D13E80A8;
      v14 = xmmword_1D13E80B8;
      v15 = unk_1D13E80C8;
      -[HalogenTypeC getMeasurementInfo](v3, "getMeasurementInfo");
      goto LABEL_8;
    }
    v11 = v4;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    buf[0] = 136315394;
    *(_QWORD *)&buf[1] = "-[IOAccessoryLDCMPortManagerTypeC performTypeCSelfTest]";
    v26 = 1024;
    v27 = v11;
    v8 = MEMORY[0x1E0C81028];
    v9 = "%s SelfTest failed. halogenStatus: %d\n";
    v10 = 18;
LABEL_16:
    _os_log_impl(&dword_1D13BF000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)buf, v10);
  }
LABEL_8:
  -[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:](self, "_holdPowerAssertionTypeC:", 0);
  timerSelfTest = self->_timerSelfTest;
  v7 = dispatch_walltime(0, 600000000000);
  dispatch_source_set_timer(timerSelfTest, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  -[NSCondition lock](self->_condition, "lock");
  -[IOAccessoryLDCMPortManagerTypeC setIsMeasurementActive:](self, "setIsMeasurementActive:", 0);
  -[NSCondition unlock](self->_condition, "unlock");
}

_BYTE *__55__IOAccessoryLDCMPortManagerTypeC_performTypeCSelfTest__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[11])
    return (_BYTE *)objc_msgSend(result, "_generateLDCMCSVData");
  return result;
}

- (void)performTypeCReferenceMeasurement
{
  HalogenTypeC *v3;
  HalogenTypeC *v4;
  int v5;
  NSObject *halogenTypeCUserPromptDispatchQueue;
  NSObject *timerReferenceMeasurement;
  dispatch_time_t v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _QWORD block[5];
  int buf;
  const char *buf_4;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[NSCondition lock](self->_condition, "lock");
  -[IOAccessoryLDCMPortManagerTypeC setIsMeasurementActive:](self, "setIsMeasurementActive:", 1);
  -[NSCondition unlock](self->_condition, "unlock");
  if (!self->_isReceptacleEmpty)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    buf = 136315138;
    buf_4 = "-[IOAccessoryLDCMPortManagerTypeC performTypeCReferenceMeasurement]";
    v9 = MEMORY[0x1E0C81028];
    v10 = "%s Receptacle not empty, will try again in 10 minutes.\n";
    goto LABEL_13;
  }
  v3 = -[IOAccessoryLDCMPortManagerTypeC typeC](self, "typeC");
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    buf = 136315138;
    buf_4 = "-[IOAccessoryLDCMPortManagerTypeC performTypeCReferenceMeasurement]";
    v9 = MEMORY[0x1E0C81028];
    v10 = "%s No valid instance of HalogenTypeC\n";
LABEL_13:
    v11 = 12;
    goto LABEL_16;
  }
  v4 = v3;
  if (-[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:](self, "_holdPowerAssertionTypeC:", 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      buf = 136315138;
      buf_4 = "-[IOAccessoryLDCMPortManagerTypeC performTypeCReferenceMeasurement]";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Performing Reference Measurement.\n", (uint8_t *)&buf, 0xCu);
    }
    v5 = -[HalogenTypeC doLDCMMeasurement:isCalibrationNeeded:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:](v4, "doLDCMMeasurement:isCalibrationNeeded:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:", 1, 0, self->_isReceptacleEmpty, self->_isWet, 3.5, 1.0);
    if (!v5)
    {
      halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__IOAccessoryLDCMPortManagerTypeC_performTypeCReferenceMeasurement__block_invoke;
      block[3] = &unk_1E9214120;
      block[4] = self;
      dispatch_async(halogenTypeCUserPromptDispatchQueue, block);
      v21 = xmmword_1D13E8118;
      v22 = unk_1D13E8128;
      v23 = xmmword_1D13E8138;
      v24 = -1;
      v17 = xmmword_1D13E80D8;
      v18 = unk_1D13E80E8;
      v19 = xmmword_1D13E80F8;
      v20 = unk_1D13E8108;
      v13 = xmmword_1D13E8098;
      v14 = unk_1D13E80A8;
      v15 = xmmword_1D13E80B8;
      v16 = unk_1D13E80C8;
      -[HalogenTypeC getMeasurementInfo](v4, "getMeasurementInfo");
      goto LABEL_8;
    }
    v12 = v5;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    buf = 136315394;
    buf_4 = "-[IOAccessoryLDCMPortManagerTypeC performTypeCReferenceMeasurement]";
    v28 = 1024;
    v29 = v12;
    v9 = MEMORY[0x1E0C81028];
    v10 = "%s Reference measurement failed. halogenStatus: %d\n";
    v11 = 18;
LABEL_16:
    _os_log_impl(&dword_1D13BF000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&buf, v11);
  }
LABEL_8:
  -[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:](self, "_holdPowerAssertionTypeC:", 0);
  timerReferenceMeasurement = self->_timerReferenceMeasurement;
  v8 = dispatch_walltime(0, 600000000000);
  dispatch_source_set_timer(timerReferenceMeasurement, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  -[NSCondition lock](self->_condition, "lock");
  -[IOAccessoryLDCMPortManagerTypeC setIsMeasurementActive:](self, "setIsMeasurementActive:", 0);
  -[NSCondition unlock](self->_condition, "unlock");
}

_BYTE *__67__IOAccessoryLDCMPortManagerTypeC_performTypeCReferenceMeasurement__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[11])
    return (_BYTE *)objc_msgSend(result, "_generateLDCMCSVData");
  return result;
}

- (void)performTypeCMeasurement
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "%s Could not disable mitigations.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

_BYTE *__58__IOAccessoryLDCMPortManagerTypeC_performTypeCMeasurement__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[11])
    return (_BYTE *)objc_msgSend(result, "_generateLDCMCSVData");
  return result;
}

uint64_t __58__IOAccessoryLDCMPortManagerTypeC_performTypeCMeasurement__block_invoke_112(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showMitigationAlert");
}

- (void)_generateLDCMCSVData
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  _QWORD v20[5];
  char v21;
  uint64_t v22;
  _BYTE buf[12];
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = -[HalogenTypeC getMeasurementOutputString](self->_typeC, "getMeasurementOutputString");
  if (!v2 || (v3 = v2, !objc_msgSend(v2, "length")))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E0C81028];
    v18 = "Nothing to write to csv file.\n";
    v19 = 2;
    goto LABEL_16;
  }
  v22 = 0;
  v21 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", CFSTR("/var/logs/ldcm/"), &v21) & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/logs/ldcm/"), 1, 0, &v22);
    v4 = v22;
    if (v22)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[IOAccessoryLDCMPortManagerTypeC _generateLDCMCSVData]";
      v24 = 2112;
      v25 = v4;
      v17 = MEMORY[0x1E0C81028];
      v18 = "%s Error in creating directory. %@\n";
      v19 = 22;
LABEL_16:
      _os_log_impl(&dword_1D13BF000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
      return;
    }
  }
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  v6 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@%@%@.csv"), CFSTR("/var/logs/ldcm/"), CFSTR("internalMeasurementData"), v5);
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", CFSTR("/var/logs/ldcm/"), 0);
  v8 = (void *)objc_msgSend(v7, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH[cd] 'internalMeasurementData'")));
  if (objc_msgSend(v8, "count"))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__IOAccessoryLDCMPortManagerTypeC__generateLDCMCSVData__block_invoke;
    v20[3] = &unk_1E9214420;
    v20[4] = CFSTR("/var/logs/ldcm/");
    v9 = (void *)objc_msgSend(v8, "sortedArrayUsingComparator:", v20);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_msgSend(v10, "attributesOfItemAtPath:error:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/var/logs/ldcm/"), objc_msgSend(v9, "lastObject")), 0);
    v12 = (void *)objc_msgSend(v11, "valueForKey:", *MEMORY[0x1E0CB2AF0]);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 10485760);
    v14 = objc_msgSend(v12, "unsignedLongLongValue");
    if (v14 <= objc_msgSend(v13, "unsignedLongLongValue"))
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/var/logs/ldcm/"), objc_msgSend(v9, "lastObject"));
    }
    else if ((unint64_t)objc_msgSend(v8, "count") >= 0xA)
    {
      *(_QWORD *)buf = 0;
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/var/logs/ldcm/"), objc_msgSend(v9, "firstObject"));
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v15, buf);
    }
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v6);
  if (!v16)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createFileAtPath:contents:attributes:", v6, 0, 0);
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v6);
  }
  objc_msgSend(v16, "seekToEndOfFile");
  objc_msgSend(v16, "writeData:error:", objc_msgSend(v3, "dataUsingEncoding:", 4), &v22);
  objc_msgSend(v16, "closeFile");
}

uint64_t __55__IOAccessoryLDCMPortManagerTypeC__generateLDCMCSVData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;

  v13 = 0;
  v14 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_msgSend(v6, "attributesOfItemAtPath:error:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 32), a2), &v14);
  if (v14)
  {
    NSLog(CFSTR("Error fetching fileA attritbutes. File ordering could be out of order. Error:%@ File:%@"), objc_msgSend(v14, "localizedDescription"), a2);

  }
  v8 = *MEMORY[0x1E0CB2A38];
  v9 = (void *)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB2A38]);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_msgSend(v10, "attributesOfItemAtPath:error:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 32), a3), &v13);
  if (v13)
  {
    NSLog(CFSTR("Error fetching fileB attritbutes. File ordering could be out of order. Error:%@ File:%@"), objc_msgSend(v13, "localizedDescription"), a3);

  }
  return objc_msgSend(v9, "compare:", objc_msgSend(v11, "objectForKey:", v8));
}

- (id)_fetchFilesToUpload:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  v5 = objc_msgSend(v4, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH[cd] 'internalMeasurementData'")));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v5);
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    v8 = 1;
    do
    {
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), a3, objc_msgSend(v6, "objectAtIndex:", v7)));
      v7 = v8;
    }
    while (objc_msgSend(v6, "count") > (unint64_t)v8++);
  }
  return v6;
}

- (void)_fileRadarHalogenTypeC:(id)a3 TTRCategory:(int)a4
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = "Unkown measurement state\n\n";
  if (a4 == 1)
    v8 = "MANUAL RADAR REQUESTED\n\n";
  if (a4)
    v9 = v8;
  else
    v9 = "LIQUID DETECTION REPORT (detected via HalogenTypeC)\n\n";
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", v9);
  objc_msgSend(v10, "appendString:", CFSTR("Has your iPad or charging cable been near liquid in the past 5 hours? \n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("If yes:\n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("- Cable or iPad?\n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("- What kind of liquid? (e.g. tap water, rain, sweat, soda, beer, etc.)\n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("- What kind of exposure? (e.g. submersion, splash, droplet, sitting in puddle, using device with wet/sweaty hands, etc)\n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("- If the exposure was limited to a certain part of the device, where was it?\n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("- How long was the exposure?\n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("- Time since exposure\n"));
  objc_msgSend(v10, "appendString:", CFSTR("\n\nIf no:\n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("Please describe what happened just before seeing the dialog. For example… Did you just connect an accessory? Did you drop your device? Are you in a humid environment?\n\n\n"));
  objc_msgSend(v10, "appendString:", a3);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("tap-to-radar://new?ComponentName=LDCM&ComponentVersion=AutofilledBugs&ComponentID=750390&Classification=Other Bug&Reproducibility=Not Applicable&"));
  v12 = -[IOAccessoryLDCMPortManagerTypeC _fetchFilesToUpload:](self, "_fetchFilesToUpload:", CFSTR("/var/logs/ldcm/"));
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v11, "appendFormat:", CFSTR("Attachments=%@"), objc_msgSend(v12, "componentsJoinedByString:", CFSTR(",")));

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", CFSTR("/var/logs/ldcm/halogenTypeC_ttr_temp.wav")))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtPath:toPath:error:", CFSTR("/var/logs/ldcm/halogenTypeC_ttr_temp.wav"), CFSTR("/var/logs/ldcm/halogenTypeC_ttr.wav"), 0);
    objc_msgSend(v11, "appendFormat:", CFSTR(",%@"), CFSTR("/var/logs/ldcm/halogenTypeC_ttr.wav"));
  }
  objc_msgSend(v11, "appendString:", CFSTR("&"));
  objc_msgSend(v11, "appendFormat:", CFSTR("Description=%@"), v10);
  v13 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet")));
  -[IOAccessoryLDCMPortManagerTypeC _loadFrontBoard](self, "_loadFrontBoard");
  if (self->_FBSOpenApplicationOptionKeyPromptUnlockDevice)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", self->_FBSOpenApplicationOptionKeyPromptUnlockDevice, 8, 1);
    if (v14)
    {
      v15 = (id)v14;
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), v14);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "openSensitiveURL:withOptions:", v13, v7);

    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "openURL:configuration:completionHandler:", v13, 0, &__block_literal_global_1);
  }
}

void __70__IOAccessoryLDCMPortManagerTypeC__fileRadarHalogenTypeC_TTRCategory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315394;
      v5 = "-[IOAccessoryLDCMPortManagerTypeC _fileRadarHalogenTypeC:TTRCategory:]_block_invoke";
      v6 = 2112;
      v7 = a3;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Error while filing radar. %@\n", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (BOOL)_setInitialUserNotificationTimestamp
{
  __uint64_t v3;
  unint64_t v4;

  v3 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v4 = v3 - 5000000000;
  if (v3 < 0x12A05F200)
    v4 = 0;
  self->_lastUserNotificationTimeNS = v4;
  return 1;
}

- (BOOL)_throttleUserNotification
{
  BOOL result;
  uint8_t v4[16];

  if (self->_lastUserNotificationTimeNS)
  {
    result = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - self->_lastUserNotificationTimeNS < 0x12A05F200;
    if (self->_initialAlertShown && self->_followupAlertShown)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Too many alerts shown, skipping", v4, 2u);
      }
      return 1;
    }
  }
  else
  {
    -[IOAccessoryLDCMPortManagerTypeC _setInitialUserNotificationTimestamp](self, "_setInitialUserNotificationTimestamp");
    return 0;
  }
  return result;
}

- (void)_showWetPrompt
{
  NSObject *halogenTypeCUserPromptDispatchQueue;
  _QWORD block[5];

  halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__IOAccessoryLDCMPortManagerTypeC__showWetPrompt__block_invoke;
  block[3] = &unk_1E9214120;
  block[4] = self;
  dispatch_async(halogenTypeCUserPromptDispatchQueue, block);
}

void __49__IOAccessoryLDCMPortManagerTypeC__showWetPrompt__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFAllocator *v20;
  __CFUserNotification *v21;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v23;
  __CFRunLoop *Main;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  if (gWetNotificationContext)
    return;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Showing wet prompt", buf, 2u);
  }
  v28 = 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v2)
  {
    v3 = v2;
    v4 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("legacy"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("typeC"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("chargerConnected"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("reinsertion"));
    v5 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "setUserInfo:", v3);
      v33[0] = v6;
      v7 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1), 1, &v28);
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("com.apple.IOAccessoryManagerFramework.WetNotification"), *MEMORY[0x1E0DABBB8]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DABBC0]);
        v10 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0DABB98]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DABBB0]);
        v11 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.IOAccessoryManagerFramework"));
        v12 = v11;
        if (v11)
        {
          v13 = objc_msgSend(v11, "pathForResource:ofType:", CFSTR("PlugIns/WetNotification.appex/Assets.car"), &stru_1E92146F8);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v30 = "-[IOAccessoryLDCMPortManagerTypeC _showWetPrompt]_block_invoke";
            v31 = 2112;
            v32 = v13;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Setting asset path for LDCM wet icon:%@", buf, 0x16u);
          }
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0DABC00]);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("lockScreenLiquidDetection"), *MEMORY[0x1E0DABBF8]);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("YES"), *MEMORY[0x1E0DABBF0]);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0DABBD8]);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("lockScreenLiquidDetection"), *MEMORY[0x1E0DABBD0]);
          v14 = objc_msgSend(v12, "resourceURL");
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B860]);
          v15 = CFSTR("WETMSG_DIALOG_HEADER_LOCKSCREEN");
          v16 = CFSTR("WETMSG_DIALOG_BODY_LOCKSCREEN_TYPEC_PASSIVE");
          v17 = CFSTR("WETMSG_BUTTON_DISMISS");
        }
        else
        {
          v15 = CFSTR("LIQUID DETECTED");
          v16 = CFSTR("Liquid has been detected in the USB-C connector. Disconnect to allow the connector to dry.");
          v17 = CFSTR("Dismiss");
        }
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DABC18]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0DABC28]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C9B838]);
        v18 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v18 + 11) && !*(_BYTE *)(v18 + 25))
        {
          if (v12)
            v19 = CFSTR("WETMSG_BUTTON_RADAR");
          else
            v19 = CFSTR("Radar");
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0C9B830]);
        }
        v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v21 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, (CFDictionaryRef)v9);
        if (!v21)
          goto LABEL_22;
        RunLoopSource = CFUserNotificationCreateRunLoopSource(v20, v21, (CFUserNotificationCallBack)handleWetPromptResponse, 0);
        if (!RunLoopSource)
          goto LABEL_22;
        v23 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v23, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        v25 = *(_QWORD *)(a1 + 32);
        gWetNotificationContext = (uint64_t)v21;
        qword_1EFC5BAA8 = (uint64_t)v23;
        qword_1EFC5BAB0 = v25;
      }
      v21 = 0;
LABEL_22:

      if (v9)
      if (v21)
        CFRelease(v21);
      goto LABEL_26;
    }

  }
LABEL_26:
  v26 = v28;
  if (v28)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend((id)objc_msgSend(v26, "localizedDescription"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      v30 = "-[IOAccessoryLDCMPortManagerTypeC _showWetPrompt]_block_invoke";
      v31 = 2080;
      v32 = v27;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s err: %s", buf, 0x16u);
      v26 = v28;
    }

  }
}

- (void)_dismissWetPrompt
{
  NSObject *halogenTypeCUserPromptDispatchQueue;
  _QWORD block[5];

  halogenTypeCUserPromptDispatchQueue = self->_halogenTypeCUserPromptDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__IOAccessoryLDCMPortManagerTypeC__dismissWetPrompt__block_invoke;
  block[3] = &unk_1E9214120;
  block[4] = self;
  dispatch_async(halogenTypeCUserPromptDispatchQueue, block);
}

void __52__IOAccessoryLDCMPortManagerTypeC__dismissWetPrompt__block_invoke()
{
  uint8_t v0[16];

  if (gWetNotificationContext)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v0 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Dismissing wet prompt", v0, 2u);
    }
    clearNotificationContext();
  }
}

- (void)_generateAlternateMeasurementAnalytics:(BOOL)a3 measurementInfo:(id *)a4 intervalSinceLastPass:(double)a5
{
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  int var0;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  int v22;
  _BYTE v23[14];
  __int16 v24;
  id v25;
  uint64_t v26;

  v7 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (self->_isInternalBuild)
  {
    v8 = (void *)MGGetStringAnswer();
    if ((objc_msgSend(v8, "hasPrefix:", CFSTR("iPad13,8")) & 1) != 0
      || (objc_msgSend(v8, "hasPrefix:", CFSTR("iPad13,9")) & 1) != 0
      || (objc_msgSend(v8, "hasPrefix:", CFSTR("iPad13,10")) & 1) != 0
      || (objc_msgSend(v8, "hasPrefix:", CFSTR("iPad13,11")) & 1) != 0)
    {
      return;
    }
  }
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    v22 = 136315138;
    *(_QWORD *)v23 = "-[IOAccessoryLDCMPortManagerTypeC _generateAlternateMeasurementAnalytics:measurementInfo:intervalSinceLastPass:]";
    v19 = MEMORY[0x1E0C81028];
    v20 = "%s Failed to initialize analytcs event string.\n";
    v21 = 12;
LABEL_21:
    _os_log_impl(&dword_1D13BF000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v22, v21);
    return;
  }
  v10 = v9;
  objc_msgSend(v9, "setString:", &stru_1E92146F8);
  var0 = a4->var0;
  if (a4->var0 == 2)
  {
    v12 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.referenceMeasurementFailure");
    v13 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.referenceMeasurement");
    v14 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.referenceMeasurementFailToPassDuration");
    goto LABEL_11;
  }
  if (var0 != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return;
    v22 = 136315394;
    *(_QWORD *)v23 = "-[IOAccessoryLDCMPortManagerTypeC _generateAlternateMeasurementAnalytics:measurementInfo:intervalSinceLastPass:]";
    *(_WORD *)&v23[8] = 1024;
    *(_DWORD *)&v23[10] = var0;
    v19 = MEMORY[0x1E0C81028];
    v20 = "%s Measurement type is neither SelfTest or Reference. Type:%d\n";
    v21 = 18;
    goto LABEL_21;
  }
  v12 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.selfTestFailure");
  v13 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.selfTest");
  v14 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.selfTestFailToPassDuration");
LABEL_11:
  if (a5 > 0.0)
    v13 = v14;
  if (v7)
    v15 = v13;
  else
    v15 = v12;
  objc_msgSend(v10, "setString:", v15);
  if (objc_msgSend(v10, "length"))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a5 <= 0.0)
    {
      objc_msgSend(v16, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4->var14), CFSTR("resistance"));
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4->var15);
      v18 = CFSTR("capacitance");
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", floor(a5 / 60.0));
      v18 = CFSTR("duration");
    }
    objc_msgSend(v16, "setObject:forKey:", v17, v18);
    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v22 = 67109634;
      *(_DWORD *)v23 = 2095;
      *(_WORD *)&v23[4] = 2112;
      *(_QWORD *)&v23[6] = v10;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%d Analytics event for %@:%@\n", (uint8_t *)&v22, 0x1Cu);
    }

  }
}

- (void)_generateFailureAnalytics:(int)a3 recordLDCMDisabled:(BOOL)a4 analyticsError:(int)a5
{
  _BOOL4 v6;
  id v8;

  v6 = a4;
  if (a3 == 1 || a3 == 10 || a3 == 3)
    AnalyticsSendEvent();
  if (v6)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5), CFSTR("disable_reason"));
    AnalyticsSendEvent();

    self->_didReportDisabledAnalytic = 1;
  }
}

- (void)_generateAnalytics:(BOOL)a3 dryToWetTransition:(BOOL)a4 measurementInfo:(id *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  unsigned int drySinceWetCount;
  void *v11;
  double v12;
  _BOOL4 isReceptacleEmpty;
  const __CFString *v14;
  const __CFString *v15;
  double v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  double v20;
  double v21;
  double v22;
  _DWORD v23[2];
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  if (a3 && !-[IOAccessoryLDCMPortManagerTypeC _throttleUserNotification](self, "_throttleUserNotification"))
  {
    -[IOAccessoryLDCMPortManagerTypeC _showWetPrompt](self, "_showWetPrompt");
    self->_initialAlertShown = 1;
    AnalyticsSendEvent();
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  switch(a5->var2)
  {
    case 0:
      v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      objc_msgSend(v9, "setString:", CFSTR("NONE"));
      drySinceWetCount = self->_drySinceWetCount;
      if (drySinceWetCount == 3)
      {
        -[IOAccessoryLDCMPortManagerTypeC _dismissWetPrompt](self, "_dismissWetPrompt");
        ++self->_drySinceWetCount;
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_wetMeasurementInfo.intialImpedance), CFSTR("initialImpedance"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_wetMeasurementInfo.intialResistance), CFSTR("initialResistance"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_wetMeasurementInfo.intialCapacitance), CFSTR("initialCapacitance"));
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(v11, "numberWithDouble:", v12 - self->_wetMeasurementInfo.initialWetWallTime), CFSTR("wetDuration"));
        isReceptacleEmpty = self->_isReceptacleEmpty;
        v14 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.wetToDryTransition");
        v15 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.wetToDryTransitionPortNotEmpty");
      }
      else
      {
        if (drySinceWetCount < 4)
          goto LABEL_37;
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var14), CFSTR("resistance"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var22), CFSTR("impedance"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var15), CFSTR("capacitance"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var23), CFSTR("impedancePhase"));
        isReceptacleEmpty = self->_isReceptacleEmpty;
        v14 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.dryMeasurement");
        v15 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.dryMeasurementPortNotEmpty");
      }
      if (isReceptacleEmpty)
        v19 = v14;
      else
        v19 = v15;
      objc_msgSend(v9, "setString:", v19);
LABEL_37:
      AnalyticsSendEvent();

LABEL_30:
      return;
    case 1:
      goto LABEL_30;
    case 2:
      if (v6)
      {
        *(_OWORD *)&self->_wetMeasurementInfo.intialResistance = *(_OWORD *)&a5->var14;
        self->_wetMeasurementInfo.intialImpedance = a5->var22;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
        self->_wetMeasurementInfo.initialWetWallTime = v16;
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var14), CFSTR("resistance"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var22), CFSTR("impedance"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var15), CFSTR("capacitance"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var23), CFSTR("impedancePhase"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var16), CFSTR("measurementVoltageSNR"));
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var17), CFSTR("measurementCurrentSNR"));
        goto LABEL_29;
      }
      if (!self->_wetTooLongRecorded)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
        v21 = v20 - self->_wetMeasurementInfo.initialWetWallTime;
        v22 = 28800.0;
        if (WET_TOO_LONG_THRESHOLD)
          v22 = 120.0;
        if (v21 > v22)
        {
          -[IOAccessoryLDCMPortManagerTypeC setWetTooLongRecorded:](self, "setWetTooLongRecorded:", 1);
          -[HalogenTypeC setWetTooLong:](self->_typeC, "setWetTooLong:", 1);
          goto LABEL_29;
        }
      }
      goto LABEL_30;
    case 6:
      if (a5->var7 < 24.0)
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("badCalCurrentSNR"));
      if (a5->var6 >= 24.0)
        goto LABEL_29;
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v18 = CFSTR("badCalVoltageSNR");
      goto LABEL_28;
    case 7:
      if (a5->var9 < 0.07)
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("badCalCurrentAmp"));
      if (a5->var8 >= 0.07)
        goto LABEL_29;
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v18 = CFSTR("badCalVoltageAmp");
      goto LABEL_28;
    case 8:
      if (a5->var17 < 24.0)
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("badMeasurementCurrentSNR"));
      if (a5->var16 >= 24.0)
        goto LABEL_29;
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v18 = CFSTR("badMeasurementVoltageSNR");
      goto LABEL_28;
    case 9:
      if (a5->var19 < 0.14)
        objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("badMeasurementCurrentAmp"));
      if (a5->var18 >= 0.14)
        goto LABEL_29;
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v18 = CFSTR("badMeasurementVoltageAmp");
LABEL_28:
      objc_msgSend(v8, "setObject:forKey:", v17, v18);
LABEL_29:
      AnalyticsSendEvent();
      goto LABEL_30;
    case 0xA:
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5->var15);
      v18 = CFSTR("badMeasurementNegativeCap");
      goto LABEL_28;
    default:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v23[0] = 67109120;
        v23[1] = 2307;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%d No analytics event generated.\n", (uint8_t *)v23, 8u);
      }
      goto LABEL_30;
  }
}

- (HalogenTypeC)typeC
{
  return self->_typeC;
}

- (void)setTypeC:(id)a3
{
  self->_typeC = (HalogenTypeC *)a3;
}

- (OS_dispatch_queue)halogenTypeCDispatchQueue
{
  return self->_halogenTypeCDispatchQueue;
}

- (void)setHalogenTypeCDispatchQueue:(id)a3
{
  self->_halogenTypeCDispatchQueue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  self->_timer = (OS_dispatch_source *)a3;
}

- (unint64_t)wetPollingIntervalNs
{
  return self->_wetPollingIntervalNs;
}

- (void)setWetPollingIntervalNs:(unint64_t)a3
{
  self->_wetPollingIntervalNs = a3;
}

- (unint64_t)dryPollingIntervalNs
{
  return self->_dryPollingIntervalNs;
}

- (void)setDryPollingIntervalNs:(unint64_t)a3
{
  self->_dryPollingIntervalNs = a3;
}

- (BOOL)isPowerAssertionHeld
{
  return self->_isPowerAssertionHeld;
}

- (void)setIsPowerAssertionHeld:(BOOL)a3
{
  self->_isPowerAssertionHeld = a3;
}

- (BOOL)isMeasurementActive
{
  return self->_isMeasurementActive;
}

- (void)setIsMeasurementActive:(BOOL)a3
{
  self->_isMeasurementActive = a3;
}

- (BOOL)isWet
{
  return self->_isWet;
}

- (void)setIsWet:(BOOL)a3
{
  self->_isWet = a3;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (BOOL)isReceptacleEmpty
{
  return self->_isReceptacleEmpty;
}

- (void)setIsReceptacleEmpty:(BOOL)a3
{
  self->_isReceptacleEmpty = a3;
}

- (BOOL)newAccArrived
{
  return self->_newAccArrived;
}

- (void)setNewAccArrived:(BOOL)a3
{
  self->_newAccArrived = a3;
}

- (BOOL)userNotified
{
  return self->_userNotified;
}

- (void)setUserNotified:(BOOL)a3
{
  self->_userNotified = a3;
}

- (BOOL)measureSBU
{
  return self->_measureSBU;
}

- (void)setMeasureSBU:(BOOL)a3
{
  self->_measureSBU = a3;
}

- (BOOL)wetTooLongRecorded
{
  return self->_wetTooLongRecorded;
}

- (void)setWetTooLongRecorded:(BOOL)a3
{
  self->_wetTooLongRecorded = a3;
}

- (BOOL)mitigationsEnabled
{
  return self->_mitigationsEnabled;
}

- (void)setMitigationsEnabled:(BOOL)a3
{
  self->_mitigationsEnabled = a3;
}

- (BOOL)mitigationsOverrideEnabled
{
  return self->_mitigationsOverrideEnabled;
}

- (void)setMitigationsOverrideEnabled:(BOOL)a3
{
  self->_mitigationsOverrideEnabled = a3;
}

- (BOOL)fakeWetMeasurements
{
  return self->_fakeWetMeasurements;
}

- (void)setFakeWetMeasurements:(BOOL)a3
{
  self->_fakeWetMeasurements = a3;
}

- (BOOL)measurementsEnabled
{
  return self->_measurementsEnabled;
}

- (void)setMeasurementsEnabled:(BOOL)a3
{
  self->_measurementsEnabled = a3;
}

- (BOOL)selfTestFailed
{
  return self->_selfTestFailed;
}

- (void)setSelfTestFailed:(BOOL)a3
{
  self->_selfTestFailed = a3;
}

- (BOOL)refMeasurementFailed
{
  return self->_refMeasurementFailed;
}

- (void)setRefMeasurementFailed:(BOOL)a3
{
  self->_refMeasurementFailed = a3;
}

- (BOOL)sbuBootArgSet
{
  return self->_sbuBootArgSet;
}

- (void)setSbuBootArgSet:(BOOL)a3
{
  self->_sbuBootArgSet = a3;
}

- (BOOL)enableMitigationsBootArgSet
{
  return self->_enableMitigationsBootArgSet;
}

- (void)setEnableMitigationsBootArgSet:(BOOL)a3
{
  self->_enableMitigationsBootArgSet = a3;
}

- (BOOL)skipTTRBootArgSet
{
  return self->_skipTTRBootArgSet;
}

- (void)setSkipTTRBootArgSet:(BOOL)a3
{
  self->_skipTTRBootArgSet = a3;
}

- (BOOL)didReportDisabledAnalytic
{
  return self->_didReportDisabledAnalytic;
}

- (void)setDidReportDisabledAnalytic:(BOOL)a3
{
  self->_didReportDisabledAnalytic = a3;
}

- (BOOL)initialAlertShown
{
  return self->_initialAlertShown;
}

- (void)setInitialAlertShown:(BOOL)a3
{
  self->_initialAlertShown = a3;
}

- (BOOL)followupAlertShown
{
  return self->_followupAlertShown;
}

- (void)setFollowupAlertShown:(BOOL)a3
{
  self->_followupAlertShown = a3;
}

- (unsigned)drySinceWetCount
{
  return self->_drySinceWetCount;
}

- (void)setDrySinceWetCount:(unsigned int)a3
{
  self->_drySinceWetCount = a3;
}

- (unsigned)selfTestFailureCount
{
  return self->_selfTestFailureCount;
}

- (void)setSelfTestFailureCount:(unsigned int)a3
{
  self->_selfTestFailureCount = a3;
}

- (unsigned)selfTestPassCount
{
  return self->_selfTestPassCount;
}

- (void)setSelfTestPassCount:(unsigned int)a3
{
  self->_selfTestPassCount = a3;
}

- (unsigned)referenceMeasurementFailureCount
{
  return self->_referenceMeasurementFailureCount;
}

- (void)setReferenceMeasurementFailureCount:(unsigned int)a3
{
  self->_referenceMeasurementFailureCount = a3;
}

- (unsigned)referenceMeasurementPassCount
{
  return self->_referenceMeasurementPassCount;
}

- (void)setReferenceMeasurementPassCount:(unsigned int)a3
{
  self->_referenceMeasurementPassCount = a3;
}

- (unint64_t)lastUserNotificationTimeNS
{
  return self->_lastUserNotificationTimeNS;
}

- (void)setLastUserNotificationTimeNS:(unint64_t)a3
{
  self->_lastUserNotificationTimeNS = a3;
}

- (void)FBSOpenApplicationOptionKeyPromptUnlockDevice
{
  return self->_FBSOpenApplicationOptionKeyPromptUnlockDevice;
}

- (void)setFBSOpenApplicationOptionKeyPromptUnlockDevice:(void *)a3
{
  self->_FBSOpenApplicationOptionKeyPromptUnlockDevice = a3;
}

- (OS_dispatch_source)timerSelfTest
{
  return self->_timerSelfTest;
}

- (void)setTimerSelfTest:(id)a3
{
  self->_timerSelfTest = (OS_dispatch_source *)a3;
}

- (OS_dispatch_source)timerReferenceMeasurement
{
  return self->_timerReferenceMeasurement;
}

- (void)setTimerReferenceMeasurement:(id)a3
{
  self->_timerReferenceMeasurement = (OS_dispatch_source *)a3;
}

- (OS_dispatch_source)timerPortStateCheck
{
  return self->_timerPortStateCheck;
}

- (void)setTimerPortStateCheck:(id)a3
{
  self->_timerPortStateCheck = (OS_dispatch_source *)a3;
}

- (NSMutableDictionary)ldcmErrorCountDict
{
  return self->_ldcmErrorCountDict;
}

- (void)setLdcmErrorCountDict:(id)a3
{
  self->_ldcmErrorCountDict = (NSMutableDictionary *)a3;
}

- (NSLock)defaultsRWLock
{
  return self->_defaultsRWLock;
}

- (void)setDefaultsRWLock:(id)a3
{
  self->_defaultsRWLock = (NSLock *)a3;
}

- (unsigned)sleepAssertionID
{
  return self->_sleepAssertionID;
}

- (void)setSleepAssertionID:(unsigned int)a3
{
  self->_sleepAssertionID = a3;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  self->_condition = (NSCondition *)a3;
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  self->_notification = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)wetMeasurementInfo
{
  double intialResistance;
  double intialCapacitance;
  double intialImpedance;
  double initialWetWallTime;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  intialResistance = self->_wetMeasurementInfo.intialResistance;
  intialCapacitance = self->_wetMeasurementInfo.intialCapacitance;
  intialImpedance = self->_wetMeasurementInfo.intialImpedance;
  initialWetWallTime = self->_wetMeasurementInfo.initialWetWallTime;
  result.var3 = initialWetWallTime;
  result.var2 = intialImpedance;
  result.var1 = intialCapacitance;
  result.var0 = intialResistance;
  return result;
}

- (void)setWetMeasurementInfo:(id)a3
{
  self->_wetMeasurementInfo = ($D0D2D8461CFC6534DBDFCF9919D87D60)a3;
}

- (int)analyticsDebugEvent
{
  return self->_analyticsDebugEvent;
}

- (void)setAnalyticsDebugEvent:(int)a3
{
  self->_analyticsDebugEvent = a3;
}

- (mach_timebase_info)timeBase
{
  return self->_timeBase;
}

- (void)setTimeBase:(mach_timebase_info)a3
{
  self->_timeBase = a3;
}

- (OS_dispatch_queue)halogenTypeCUserPromptDispatchQueue
{
  return self->_halogenTypeCUserPromptDispatchQueue;
}

- (void)setHalogenTypeCUserPromptDispatchQueue:(id)a3
{
  self->_halogenTypeCUserPromptDispatchQueue = (OS_dispatch_queue *)a3;
}

- (int)lastMeasurementResult
{
  return self->_lastMeasurementResult;
}

- (void)setLastMeasurementResult:(int)a3
{
  self->_lastMeasurementResult = a3;
}

- (int)lastMeasurementStatus
{
  return self->_lastMeasurementStatus;
}

- (void)setLastMeasurementStatus:(int)a3
{
  self->_lastMeasurementStatus = a3;
}

- (void)_holdPowerAssertionTypeC:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v0, "%s failed to acquire power assertion. Error 0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_holdPowerAssertionTypeC:(unsigned __int8)a1 .cold.2(unsigned __int8 a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[IOAccessoryLDCMPortManagerTypeC _holdPowerAssertionTypeC:]";
  v3 = 1024;
  v4 = a1;
  _os_log_debug_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s halogen power assertion already in the correct state: %d.\n", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_3();
}

- (void)_holdPowerAssertionTypeC:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1D13BF000, MEMORY[0x1E0C81028], v0, "%s failed to release power assertion. Error 0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_setMitigations:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "%s Skipping mitigations enableMitigations:%d", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
