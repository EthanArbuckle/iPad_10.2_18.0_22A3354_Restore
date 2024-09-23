@implementation AXTapticChimesScheduler

+ (void)initializeIfNeeded
{
  id v2;

  v2 = +[AXTapticChimesScheduler sharedInstance](AXTapticChimesScheduler, "sharedInstance");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  return (id)sharedInstance__Shared;
}

void __41__AXTapticChimesScheduler_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXTapticChimesScheduler _init]([AXTapticChimesScheduler alloc], "_init");
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;

}

- (id)_init
{
  AXTapticChimesScheduler *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *mediaQueue;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *pcServiceIdentifier;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[8];
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)AXTapticChimesScheduler;
  v2 = -[AXTapticChimesScheduler init](&v25, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.accessibility.AXTapticChimesScheduler", v3);
    mediaQueue = v2->_mediaQueue;
    v2->_mediaQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v2);
    if (-[AXTapticChimesScheduler processIsAllowedToScheduleChimes](v2, "processIsAllowedToScheduleChimes"))
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      AXProcessGetName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.accessibility.TapticChimesScheduler-%@"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      pcServiceIdentifier = v2->_pcServiceIdentifier;
      v2->_pcServiceIdentifier = (NSString *)v8;

      AXLogTapticTime();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22701A000, v10, OS_LOG_TYPE_DEFAULT, "Process handles chimes, registering for updates", buf, 2u);
      }

      +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x24BDAC760];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __32__AXTapticChimesScheduler__init__block_invoke;
      v21[3] = &unk_24EF4E7C8;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v11, "registerUpdateBlock:forRetrieveSelector:withListener:", v21, sel_voiceOverTapticChimesEnabled, v2);

      +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __32__AXTapticChimesScheduler__init__block_invoke_2;
      v19[3] = &unk_24EF4E7C8;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v13, "registerUpdateBlock:forRetrieveSelector:withListener:", v19, sel_voiceOverTapticChimesFrequencyEncoding, v2);

      +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __32__AXTapticChimesScheduler__init__block_invoke_192;
      v17[3] = &unk_24EF4E7C8;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v14, "registerUpdateBlock:forRetrieveSelector:withListener:", v17, sel_voiceOverTapticChimesSoundType, v2);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
    }
    else
    {
      AXLogTapticTime();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AXTapticChimesScheduler _init].cold.1();

    }
    -[AXTapticChimesScheduler _tapticChimesStateDidChange:](v2, "_tapticChimesStateDidChange:", 0);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__AXTapticChimesScheduler__init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tapticChimesStateDidChange:", 1);

}

void __32__AXTapticChimesScheduler__init__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceOverTapticChimesEnabled");

  if (v3)
  {
    AXLogTapticTime();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22701A000, v4, OS_LOG_TYPE_DEFAULT, "Taptic Chimes frequency changed, will re-schedule chimes", v6, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_scheduleChimeTimer");

  }
}

void __32__AXTapticChimesScheduler__init__block_invoke_192(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  NSObject *v5;
  id v6;
  id v7;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "voiceOverTapticChimesEnabled") & 1) != 0)
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v2);
    v4 = objc_msgSend(WeakRetained, "canPlayScheduledTapticChime");

    if (v4)
    {
      AXLogTapticTime();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22701A000, v5, OS_LOG_TYPE_DEFAULT, "Taptic Chimes sound type changed, will preview chimes", buf, 2u);
      }

      v6 = objc_loadWeakRetained(v2);
      objc_msgSend(v6, "_previewChimes");

    }
  }
  else
  {

  }
}

- (void)_registerForNotifications
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  if (AXProcessIsClockFace())
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BED2970];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52__AXTapticChimesScheduler__registerForNotifications__block_invoke;
    v8[3] = &unk_24EF4E7F0;
    objc_copyWeak(&v9, &location);
    v6 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, v8);

    objc_destroyWeak(&v9);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_ntkDefaultsChanged, CFSTR("NanoTimeKitFaceDefaultsChangedDarwinNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_destroyWeak(&location);
}

void __52__AXTapticChimesScheduler__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXLogTapticTime();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22701A000, v2, OS_LOG_TYPE_INFO, "VoiceOver status changed!", v3, 2u);
  }

  objc_msgSend(WeakRetained, "_scheduleChimeTimer");
}

- (void)_unregisterForNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("NanoTimeKitFaceDefaultsChangedDarwinNotification"), 0);
}

- (void)dealloc
{
  objc_super v3;

  -[AXTapticChimesScheduler _unregisterForNotifications](self, "_unregisterForNotifications");
  -[AXTapticChimesScheduler _clearChimeTimer](self, "_clearChimeTimer");
  v3.receiver = self;
  v3.super_class = (Class)AXTapticChimesScheduler;
  -[AXTapticChimesScheduler dealloc](&v3, sel_dealloc);
}

- (void)_tapticChimesStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "voiceOverTapticChimesEnabled");

  AXLogTapticTime();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22701A000, v7, OS_LOG_TYPE_DEFAULT, "Taptic Chimes enabled, will begin scheduling chimes", buf, 2u);
    }

    -[AXTapticChimesScheduler _registerForNotifications](self, "_registerForNotifications");
    if (v3)
    {
      if (-[AXTapticChimesScheduler canPlayScheduledTapticChime](self, "canPlayScheduledTapticChime"))
        -[AXTapticChimesScheduler _previewChimes](self, "_previewChimes");
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22701A000, v7, OS_LOG_TYPE_DEFAULT, "Taptic Chimes disabled, will stop scheduling chimes", v9, 2u);
    }

    -[AXTapticChimesScheduler _unregisterForNotifications](self, "_unregisterForNotifications");
    -[AXTapticChimesScheduler _clearChimeTimer](self, "_clearChimeTimer");
  }
}

- (BOOL)canPlayTapticChime
{
  char v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = AXIsBuddyCompleted();
  if ((v2 & 1) == 0)
  {
    AXLogTapticTime();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22701A000, v3, OS_LOG_TYPE_INFO, "Buddy not yet complete! suppresing chime", v5, 2u);
    }

  }
  return v2;
}

- (BOOL)processIsAllowedToScheduleChimes
{
  if ((AXProcessIsClockFace() & 1) == 0)
    JUMPOUT(0x2276A7C60);
  return 1;
}

- (BOOL)canScheduleTapticChimes
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  uint8_t v7[16];

  if (AXProcessIsClockFace() && _AXSVoiceOverTouchEnabled())
  {
    AXLogTapticTime();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22701A000, v3, OS_LOG_TYPE_INFO, "ClockFace not scheduling chimes because VoiceOver is enabled", v7, 2u);
    }

    return 0;
  }
  if (!-[AXTapticChimesScheduler processIsAllowedToScheduleChimes](self, "processIsAllowedToScheduleChimes"))
    return 0;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "voiceOverTapticChimesEnabled"))
    v5 = -[AXTapticChimesScheduler canPlayTapticChime](self, "canPlayTapticChime");
  else
    v5 = 0;

  return v5;
}

- (BOOL)canPlayScheduledTapticChime
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  if (-[AXTapticChimesScheduler canScheduleTapticChimes](self, "canScheduleTapticChimes"))
  {
    if (-[AXTapticChimesScheduler canPlayTapticChime](self, "canPlayTapticChime"))
      return 1;
    AXLogTapticTime();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v5 = "cannot play scheduled chime";
      v6 = (uint8_t *)&v7;
      goto LABEL_8;
    }
  }
  else
  {
    AXLogTapticTime();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v5 = "cannot schedule chime";
      v6 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl(&dword_22701A000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }

  return 0;
}

- (double)_preWakeTimeInterval
{
  double v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  int Value;
  NSObject *v6;
  float valuePtr;
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = 3.0;
  if (AXIsInternalInstall())
  {
    v3 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("TapticChimesPreWakeOverride"), (CFStringRef)*MEMORY[0x24BED26B8]);
    if (v3)
    {
      v4 = v3;
      valuePtr = 0.0;
      Value = CFNumberGetValue(v3, kCFNumberFloatType, &valuePtr);
      CFRelease(v4);
      if (Value)
      {
        AXLogTapticTime();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v10 = valuePtr;
          _os_log_impl(&dword_22701A000, v6, OS_LOG_TYPE_INFO, "Using PreWakeOverride value: %f", buf, 0xCu);
        }

        return valuePtr;
      }
    }
  }
  return v2;
}

- (double)_prePlayAudioTimeInterval
{
  double v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  int Value;
  NSObject *v6;
  float valuePtr;
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = 0.0;
  if (AXIsInternalInstall())
  {
    v3 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("TapticChimesPrePlayAudioOverride"), (CFStringRef)*MEMORY[0x24BED26B8]);
    if (v3)
    {
      v4 = v3;
      valuePtr = 0.0;
      Value = CFNumberGetValue(v3, kCFNumberFloatType, &valuePtr);
      CFRelease(v4);
      if (Value)
      {
        AXLogTapticTime();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v10 = valuePtr;
          _os_log_impl(&dword_22701A000, v6, OS_LOG_TYPE_INFO, "Using PrePlayAudioOverride value: %f", buf, 0xCu);
        }

        return valuePtr;
      }
    }
  }
  return v2;
}

- (id)_currentDate
{
  void *v2;
  float v3;
  float v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CFPreferencesAppSynchronize(CFSTR("com.apple.NanoTimeKit.face"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("NTKFacePreferencesTimeOffsetKey"), CFSTR("com.apple.NanoTimeKit.face"));
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  v5 = 0.0;
  if (v4 > 0.0)
    v5 = v4;
  v6 = v5;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogTapticTime();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v8;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_22701A000, v9, OS_LOG_TYPE_INFO, "Using face display time for current date: %@, with time offset=%f", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (void)_previewChimes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[AXTapticChimesScheduler _currentDate](self, "_currentDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateWithTimeInterval:sinceDate:", v4, 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "voiceOverTapticChimesFrequencyEncoding");
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTapticChimesScheduler _previewChimesForStartDate:chimeDate:frequency:soundType:](self, "_previewChimesForStartDate:chimeDate:frequency:soundType:", v9, v5, v7, objc_msgSend(v8, "voiceOverTapticChimesSoundType"));

}

- (void)_previewChimesForStartDate:(id)a3 chimeDate:(id)a4 frequency:(int64_t)a5 soundType:(int64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  if (-[AXTapticChimesScheduler canPlayTapticChime](self, "canPlayTapticChime"))
  {
    -[AXTapticChimesScheduler _clearChimeTimer](self, "_clearChimeTimer");
    AXLogTapticTime();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22701A000, v12, OS_LOG_TYPE_INFO, "Previewing chimes", buf, 2u);
    }

    v14 = 0;
    -[AXTapticChimesScheduler nextChimeAssetForStartDate:frequency:soundType:timeIntervalUntilChime:](self, "nextChimeAssetForStartDate:frequency:soundType:timeIntervalUntilChime:", v10, a5, a6, &v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[AXTapticChimesScheduler _outputTapticChime:atDate:](self, "_outputTapticChime:atDate:", v13, v11))
      -[AXTapticChimesScheduler _scheduleChimeTimer](self, "_scheduleChimeTimer");

  }
}

- (void)_clearChimeTimer
{
  OUTLINED_FUNCTION_4(&dword_22701A000, a2, a3, "failed to deactivate audio session due to: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_scheduleChimeTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  AXTapticChimeAsset *v8;
  AXTapticChimeAsset *currentChimeAsset;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  NSObject *v18;
  PCSimpleTimer *v19;
  PCSimpleTimer *chimeTimer;
  PCSimpleTimer *v21;
  void *v22;
  double v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[AXTapticChimesScheduler _clearChimeTimer](self, "_clearChimeTimer");
  if (-[AXTapticChimesScheduler canScheduleTapticChimes](self, "canScheduleTapticChimes"))
  {
    AXLogTapticTime();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22701A000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling chime timer", buf, 2u);
    }

    -[AXTapticChimesScheduler _currentDate](self, "_currentDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0.0;
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "voiceOverTapticChimesFrequencyEncoding");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXTapticChimesScheduler nextChimeAssetForStartDate:frequency:soundType:timeIntervalUntilChime:](self, "nextChimeAssetForStartDate:frequency:soundType:timeIntervalUntilChime:", v4, v6, objc_msgSend(v7, "voiceOverTapticChimesSoundType"), &v23);
    v8 = (AXTapticChimeAsset *)objc_claimAutoreleasedReturnValue();
    currentChimeAsset = self->_currentChimeAsset;
    self->_currentChimeAsset = v8;

    v10 = v23;
    -[AXTapticChimesScheduler _preWakeTimeInterval](self, "_preWakeTimeInterval");
    v12 = v10 - v11;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDBCE60];
    v15 = v23;
    -[AXTapticChimesScheduler _prePlayAudioTimeInterval](self, "_prePlayAudioTimeInterval");
    objc_msgSend(v14, "dateWithTimeIntervalSinceNow:", v15 - v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_lastExpectedWakeTime, v13);
    objc_storeStrong((id *)&self->_lastExpectedChimeTime, v17);
    AXLogTapticTime();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v25 = v13;
      v26 = 2048;
      v27 = v12;
      v28 = 2112;
      v29 = v17;
      v30 = 2048;
      v31 = v23;
      _os_log_impl(&dword_22701A000, v18, OS_LOG_TYPE_INFO, "Scheduling wake!! Wake time: %@ (%f seconds), Chime time: %@ (%f seconds)", buf, 0x2Au);
    }

    v19 = (PCSimpleTimer *)objc_msgSend(objc_alloc(MEMORY[0x24BE71A10]), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", self->_pcServiceIdentifier, self, sel__chimeWakeTimerFired_, 0, v12);
    chimeTimer = self->_chimeTimer;
    self->_chimeTimer = v19;

    -[PCSimpleTimer setUserVisible:](self->_chimeTimer, "setUserVisible:", 1);
    v21 = self->_chimeTimer;
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCSimpleTimer scheduleInRunLoop:](v21, "scheduleInRunLoop:", v22);

  }
}

- (void)_chimeWakeTimerFired:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *lastActualWakeTime;
  NSObject *v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  NSObject *v12;
  double v13;
  id v14;
  int v15;
  uint8_t buf[4];
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastActualWakeTime = self->_lastActualWakeTime;
  self->_lastActualWakeTime = v5;

  AXLogTapticTime();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = *(double *)&v4;
    _os_log_impl(&dword_22701A000, v7, OS_LOG_TYPE_DEFAULT, "chime wake timer fired: %@", buf, 0xCu);
  }

  -[AXTapticChimesScheduler _preWakeTimeInterval](self, "_preWakeTimeInterval");
  v9 = -[AXTapticChimesScheduler _createPowerAssertionWithName:timeout:](self, "_createPowerAssertionWithName:timeout:", CFSTR("chime-wake-fired"), v8 + v8);
  if (-[AXTapticChimesScheduler canPlayScheduledTapticChime](self, "canPlayScheduledTapticChime")
    && -[AXTapticChimesScheduler _outputTapticChime:atDate:](self, "_outputTapticChime:atDate:", self->_currentChimeAsset, self->_lastExpectedChimeTime))
  {
    -[AXTapticChimesScheduler _releasePowerAssertionIfPossible:](self, "_releasePowerAssertionIfPossible:", v9);
  }
  else
  {
    -[AXTapticChimesScheduler _preWakeTimeInterval](self, "_preWakeTimeInterval");
    v11 = v10;
    AXLogTapticTime();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v11 + 0.5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v13;
      _os_log_impl(&dword_22701A000, v12, OS_LOG_TYPE_INFO, "scheduling NEXT chime in %f seconds", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    objc_copyWeak(&v14, (id *)buf);
    v15 = v9;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

void __48__AXTapticChimesScheduler__chimeWakeTimerFired___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleChimeTimer");

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_releasePowerAssertionIfPossible:", *(unsigned int *)(a1 + 40));

}

- (unsigned)_createPowerAssertionWithName:(id)a3 timeout:(double)a4
{
  id v5;
  void *v6;
  const __CFDictionary *v7;
  NSObject *v8;
  IOPMAssertionID v9;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  double v15;
  __int16 v16;
  IOPMAssertionID v17;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v18[0] = CFSTR("AssertType");
  v18[1] = CFSTR("AssertName");
  AssertionID = 0;
  v18[2] = CFSTR("FrameworkBundleID");
  v18[3] = CFSTR("TimeoutAction");
  v19[2] = CFSTR("com.apple.AXTapToSpeakTime.TapticChimesScheduler");
  v19[3] = CFSTR("TimeoutActionRelease");
  v18[4] = CFSTR("TimeoutSeconds");
  v19[0] = CFSTR("PreventUserIdleSystemSleep");
  v19[1] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4 + 2.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (IOPMAssertionCreateWithProperties(v7, &AssertionID))
    AssertionID = 0;
  AXLogTapticTime();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v13 = v5;
    v14 = 2048;
    v15 = a4;
    v16 = 1024;
    v17 = AssertionID;
    _os_log_impl(&dword_22701A000, v8, OS_LOG_TYPE_INFO, "created power assertion with name: %@, timeout: %f, ID: %d", buf, 0x1Cu);
  }

  v9 = AssertionID;
  return v9;
}

- (void)_releasePowerAssertionIfPossible:(unsigned int)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    AXLogTapticTime();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = a3;
      _os_log_impl(&dword_22701A000, v4, OS_LOG_TYPE_INFO, "releasing power assertion with ID: %d", (uint8_t *)v5, 8u);
    }

    IOPMAssertionRelease(a3);
  }
}

- (BOOL)_outputTapticChime:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  float v14;
  float v15;
  NSObject *v16;
  NSString *v17;
  NSString *previousAudioSessionCategory;
  NSObject *v19;
  char v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  AVAudioPlayer *v26;
  AVAudioPlayer *audioPlayer;
  double v28;
  NSObject *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  double v34;
  double v35;
  NSObject *v36;
  AVAudioPlayer *v37;
  double v38;
  BOOL v39;
  NSObject *v40;
  void *v41;
  double v42;
  double v43;
  NSObject *v44;
  NSObject *v45;
  double v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  __int16 v56;
  _QWORD inCompletionBlock[5];
  int v58;
  char v59;
  int inPropertyData;
  id v61;
  id v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  const __CFString *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogTapticTime();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22701A000, v8, OS_LOG_TYPE_DEFAULT, "chime output start", buf, 2u);
  }

  v9 = -[AXTapticChimesScheduler canPlayTapticChime](self, "canPlayTapticChime");
  AXLogTapticTime();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22701A000, v11, OS_LOG_TYPE_DEFAULT, "cannot play chime output", buf, 2u);
    }
    goto LABEL_47;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v64 = v6;
    v65 = 2112;
    v66 = CFSTR("NO");
    _os_log_impl(&dword_22701A000, v11, OS_LOG_TYPE_INFO, "chime starting: %@, isRingerMuted=%@", buf, 0x16u);
  }

  AXLogTapticTime();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22701A000, v12, OS_LOG_TYPE_INFO, "ringer NOT muted, setting up audio session", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v11 = objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "volume");
  v15 = v14;
  if (MEMORY[0x2276A7C60](v13))
  {
    AXLogTapticTime();
    v16 = objc_claimAutoreleasedReturnValue();
    v15 = 1.0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22701A000, v16, OS_LOG_TYPE_INFO, "Using VoiceOver's current audio session", buf, 2u);
    }
  }
  else
  {
    -[NSObject category](v11, "category");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    previousAudioSessionCategory = self->_previousAudioSessionCategory;
    self->_previousAudioSessionCategory = v17;

    -[AXTapticChimesScheduler _normalizeVolumeIfNecessary](self, "_normalizeVolumeIfNecessary");
    v19 = (id)*MEMORY[0x24BDB1598];
    v62 = 0;
    v20 = -[NSObject setCategory:error:](v11, "setCategory:error:", v19, &v62);
    v16 = v62;
    if ((v20 & 1) == 0)
    {
      AXLogTapticTime();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        -[AXTapticChimesScheduler _outputTapticChime:atDate:].cold.4((uint64_t)v19, (uint64_t)v16, v54);

      goto LABEL_46;
    }

  }
  v61 = 0;
  v21 = -[NSObject setActive:error:](v11, "setActive:error:", 1, &v61);
  v16 = v61;
  if ((v21 & 1) == 0)
  {
    AXLogTapticTime();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[AXTapticChimesScheduler _outputTapticChime:atDate:].cold.3((uint64_t)v16, v19, v48, v49, v50, v51, v52, v53);
    goto LABEL_46;
  }
  v22 = objc_alloc(MEMORY[0x24BDB1848]);
  v23 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v6, "audioFilePath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLWithString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (AVAudioPlayer *)objc_msgSend(v22, "initWithContentsOfURL:error:", v25, 0);
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = v26;

  -[AVAudioPlayer setDelegate:](self->_audioPlayer, "setDelegate:", self);
  *(float *)&v28 = v15;
  -[AVAudioPlayer setVolume:](self->_audioPlayer, "setVolume:", v28);
  AXLogTapticTime();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    *(_DWORD *)buf = 134217984;
    v64 = v30;
    _os_log_impl(&dword_22701A000, v29, OS_LOG_TYPE_INFO, "[START] prewarming audio player: (%f seconds away)", buf, 0xCu);
  }

  v31 = -[AVAudioPlayer prepareToPlay](self->_audioPlayer, "prepareToPlay");
  AXLogTapticTime();
  v32 = objc_claimAutoreleasedReturnValue();
  v19 = v32;
  if (!v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      -[AXTapticChimesScheduler _outputTapticChime:atDate:].cold.2();
    goto LABEL_46;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    *(_DWORD *)buf = 134217984;
    v64 = v33;
    _os_log_impl(&dword_22701A000, v19, OS_LOG_TYPE_INFO, "[END] prewarming audio player: (%f seconds away)", buf, 0xCu);
  }

  objc_msgSend(v7, "timeIntervalSinceNow");
  if (v34 >= 0.0)
    v35 = v34;
  else
    v35 = 0.0;
  AXLogTapticTime();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v64 = v7;
    v65 = 2048;
    v66 = *(const __CFString **)&v35;
    _os_log_impl(&dword_22701A000, v36, OS_LOG_TYPE_INFO, "[START] schedule chime time: %@ (%f seconds away)", buf, 0x16u);
  }

  v37 = self->_audioPlayer;
  -[AVAudioPlayer deviceCurrentTime](v37, "deviceCurrentTime");
  v39 = -[AVAudioPlayer playAtTime:](v37, "playAtTime:", v35 + v38);
  AXLogTapticTime();
  v40 = objc_claimAutoreleasedReturnValue();
  v19 = v40;
  if (!v39)
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      -[AXTapticChimesScheduler _outputTapticChime:atDate:].cold.1();
LABEL_46:

LABEL_47:
    v47 = 0;
    goto LABEL_48;
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    *(_DWORD *)buf = 134217984;
    v64 = v41;
    _os_log_impl(&dword_22701A000, v19, OS_LOG_TYPE_INFO, "[END] schedule chime time: (%f seconds away)", buf, 0xCu);
  }

  objc_msgSend(v7, "timeIntervalSinceNow");
  if (v42 >= 0.0)
    v43 = v42;
  else
    v43 = 0.0;
  AXLogTapticTime();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v64 = v7;
    v65 = 2048;
    v66 = *(const __CFString **)&v43;
    _os_log_impl(&dword_22701A000, v44, OS_LOG_TYPE_INFO, "expected haptic time: %@ (%f seconds away)", buf, 0x16u);
  }

  *(_DWORD *)buf = objc_msgSend(v6, "createSystemSoundIDForStartTime:", v43);
  inPropertyData = 1;
  AudioServicesSetProperty(0x61637421u, 4u, buf, 4u, &inPropertyData);
  inCompletionBlock[0] = MEMORY[0x24BDAC760];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __53__AXTapticChimesScheduler__outputTapticChime_atDate___block_invoke;
  inCompletionBlock[3] = &unk_24EF4E868;
  v58 = *(_DWORD *)buf;
  v59 = 0;
  inCompletionBlock[4] = self;
  AudioServicesPlaySystemSoundWithCompletion(*(SystemSoundID *)buf, inCompletionBlock);
  AXLogTapticTime();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v45))
  {
    v56 = 0;
    _os_signpost_emit_with_name_impl(&dword_22701A000, v45, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TapticChime-Output", (const char *)&unk_22702354E, (uint8_t *)&v56, 2u);
  }

  kdebug_trace();
  objc_storeStrong((id *)&self->_lastActualChimeTime, a4);
  -[AXTapticChimesScheduler _preWakeTimeInterval](self, "_preWakeTimeInterval");
  self->_audioPlaybackPowerAssertionID = -[AXTapticChimesScheduler _createPowerAssertionWithName:timeout:](self, "_createPowerAssertionWithName:timeout:", CFSTR("chime-playback"), v46 + v46);
  v47 = 1;
LABEL_48:

  return v47;
}

void __53__AXTapticChimesScheduler__outputTapticChime_atDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t buf[12];
  int inPropertyData;

  inPropertyData = 0;
  AudioServicesSetProperty(0x61637421u, 4u, (const void *)(a1 + 40), 4u, &inPropertyData);
  AudioServicesDisposeSystemSoundID(*(_DWORD *)(a1 + 40));
  AXLogTapticTime();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22701A000, v2, OS_LOG_TYPE_DEFAULT, "chimes haptics completed", buf, 2u);
  }

  if (*(_BYTE *)(a1 + 44))
    AXPerformBlockOnMainThread();
}

uint64_t __53__AXTapticChimesScheduler__outputTapticChime_atDate___block_invoke_242(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  AXLogTapticTime();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22701A000, v2, OS_LOG_TYPE_DEFAULT, "ringer IS muted, not waiting for audio player callback", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_chimeDidFinishPlaying");
}

- (id)nextChimeAssetForStartDate:(id)a3 frequency:(int64_t)a4 soundType:(int64_t)a5 timeIntervalUntilChime:(double *)a6
{
  _BOOL4 v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  int v30;
  void *v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v9 = a4 == 2;
  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (a4 == 3)
    v11 = 900.0;
  else
    v11 = dbl_2270225F0[v9];
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", 60, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateFromComponents:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogTapticTime();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 138412290;
    v31 = v14;
    _os_log_impl(&dword_22701A000, v15, OS_LOG_TYPE_DEFAULT, "starting hour date: %@", (uint8_t *)&v30, 0xCu);
  }

  objc_msgSend(v14, "dateByAddingTimeInterval:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v10);
  if (v17 <= 0.0)
  {
    do
    {
      objc_msgSend(v16, "dateByAddingTimeInterval:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "timeIntervalSinceDate:", v10);
      v16 = v18;
    }
    while (v19 <= 0.0);
  }
  else
  {
    v18 = v16;
  }
  AXLogTapticTime();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v18, "timeIntervalSinceDate:", v10);
    v30 = 134218240;
    v31 = v21;
    v32 = 2048;
    v33 = v11;
    _os_log_impl(&dword_22701A000, v20, OS_LOG_TYPE_DEFAULT, "start date to chime date interval: %f seconds (next interval: %f seconds)", (uint8_t *)&v30, 0x16u);
  }

  objc_msgSend(v12, "components:fromDate:", 96, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hour");
  if (objc_msgSend(v22, "minute"))
    +[AXTapticChimeAsset quarterHourAssetForType:](AXTapticChimeAsset, "quarterHourAssetForType:", a5);
  else
    +[AXTapticChimeAsset hourAssetForType:hour:](AXTapticChimeAsset, "hourAssetForType:hour:", a5, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v10);
  v26 = v25;
  objc_msgSend(v24, "prePlayTimeInterval");
  *a6 = v26 - v27;
  AXLogTapticTime();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v30 = 138412546;
    v31 = v24;
    v32 = 2112;
    v33 = *(double *)&v18;
    _os_log_impl(&dword_22701A000, v28, OS_LOG_TYPE_INFO, "chimeAsset: %@, for chime date: %@", (uint8_t *)&v30, 0x16u);
  }

  return v24;
}

- (void)_chimeDidFinishPlaying
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 134218496;
  v4 = 0x4014000000000000;
  v5 = 2048;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  _os_log_fault_impl(&dword_22701A000, log, OS_LOG_TYPE_FAULT, "wake to chime start took over %f seconds! actual time: %f seconds. wake delta: %f seconds", (uint8_t *)&v3, 0x20u);
}

uint64_t __49__AXTapticChimesScheduler__chimeDidFinishPlaying__block_invoke()
{
  return AnalyticsSendEvent();
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  AXLogTapticTime();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_22701A000, v6, OS_LOG_TYPE_INFO, "audioPlayerDidFinishPlaying: successfully: %@", (uint8_t *)&v10, 0xCu);
  }

  if (!v4)
  {
    AXLogTapticTime();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[AXTapticChimesScheduler audioPlayerDidFinishPlaying:successfully:].cold.1();

  }
  -[AXTapticChimesScheduler _chimeDidFinishPlaying](self, "_chimeDidFinishPlaying");
  if (AXIsInternalInstall())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AXChimesFinishedPlaying"), 0, 0, 1u);
  }
}

- (float)lastMediaVolume
{
  return self->_lastMediaVolume;
}

- (void)setLastMediaVolume:(float)a3
{
  self->_lastMediaVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaQueue, 0);
  objc_storeStrong((id *)&self->_lastActualChimeTime, 0);
  objc_storeStrong((id *)&self->_lastExpectedChimeTime, 0);
  objc_storeStrong((id *)&self->_lastActualWakeTime, 0);
  objc_storeStrong((id *)&self->_lastExpectedWakeTime, 0);
  objc_storeStrong((id *)&self->_currentChimeAsset, 0);
  objc_storeStrong((id *)&self->_previousAudioSessionCategory, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_chimeTimer, 0);
  objc_storeStrong((id *)&self->_pcServiceIdentifier, 0);
}

- (void)_init
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22701A000, v0, OS_LOG_TYPE_ERROR, "Process DOES NOT handles chimes, this call was probably in error", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_outputTapticChime:atDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22701A000, v0, v1, "failed to schedule chime playback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_outputTapticChime:atDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22701A000, v0, v1, "failed to prepare audio player", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_outputTapticChime:(uint64_t)a3 atDate:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_22701A000, a2, a3, "failed to set audio session active due to: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_outputTapticChime:(NSObject *)a3 atDate:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_22701A000, a2, a3, "failed to set audio session category (%@) due to: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

- (void)audioPlayerDidFinishPlaying:successfully:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22701A000, v0, v1, "chime failed to play successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
