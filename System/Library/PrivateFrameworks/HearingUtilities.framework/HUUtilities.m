@implementation HUUtilities

- (void)clearAudioRoutes
{
  id v2;

  -[HUUtilities routesManager](self, "routesManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAudioRoutes");

}

- (unint64_t)backgroundSoundsRouteDecision
{
  void *v2;
  void *v3;
  int v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  os_log_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HUUtilities currentPickableAudioRoutes](self, "currentPickableAudioRoutes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wirelessSplitterEnabled");

  v5 = (os_log_t *)MEMORY[0x1E0D2F918];
  if (v4)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wireless splitter active."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUUtilities backgroundSoundsRouteDecision]", 123, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v7);
      v10 = v8;
      *(_DWORD *)buf = 136446210;
      v24 = objc_msgSend(v9, "UTF8String");
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v11 = 3;
  }
  else
  {
    v11 = 1;
  }
  objc_msgSend(v2, "valueForKey:", CFSTR("AXSHARoutePicked"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("BTDetails_IsHFPRoute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFP active."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUUtilities backgroundSoundsRouteDecision]", 130, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_retainAutorelease(v16);
      v19 = v17;
      v20 = objc_msgSend(v18, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v24 = v20;
      _os_log_impl(&dword_1DE311000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v11 = 2;
  }
  if (_AXSInUnitTestMode())
    v21 = 1;
  else
    v21 = v11;

  return v21;
}

- (id)currentPickableAudioRoutes
{
  void *v2;
  void *v3;

  -[HUUtilities routesManager](self, "routesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchCurrentPickableAudioRoutesIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HURoutesManager)routesManager
{
  return self->_routesManager;
}

+ (id)sharedUtilities
{
  if (sharedUtilities_onceToken != -1)
    dispatch_once(&sharedUtilities_onceToken, &__block_literal_global_15);
  return (id)sharedUtilities_UtilityProvider;
}

- (BOOL)wirelessSplitterEnabled
{
  return self->_wirelessSplitterEnabled;
}

- (BOOL)currentRouteSupportsBackgroundSounds
{
  return -[HUUtilities backgroundSoundsRouteDecision](self, "backgroundSoundsRouteDecision") == 1;
}

void __30__HUUtilities_sharedUtilities__block_invoke()
{
  HUUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(HUUtilities);
  v1 = (void *)sharedUtilities_UtilityProvider;
  sharedUtilities_UtilityProvider = (uint64_t)v0;

}

- (OS_dispatch_queue)routingQueue
{
  void *v2;
  void *v3;

  -[HUUtilities routesManager](self, "routesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routingQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (void)updateWirelessSplitterState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  state64 = -1;
  notify_get_state(self->_wirelessSplitterNotifyToken, &state64);
  self->_wirelessSplitterEnabled = state64 & 1;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wireless splitter updated %d"), self->_wirelessSplitterEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUUtilities updateWirelessSplitterState]", 109, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    v8 = objc_msgSend(v6, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v11 = v8;
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUUtilities clearAudioRoutes](self, "clearAudioRoutes");
}

- (HUUtilities)init
{
  HUUtilities *v2;
  uint64_t v3;
  HURoutesManager *routesManager;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  NSObject *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUUtilities;
  v2 = -[HUUtilities init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    routesManager = v2->_routesManager;
    v2->_routesManager = (HURoutesManager *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)UserRequestedAudioTransferCompleteNotification, CFSTR("com.apple.accessibility.hearing.audio.transfer.complete"), 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)UserRequestedAudioTransferNotification_0, CFSTR("com.apple.accessibility.hearing.audio.transfer"), 0, (CFNotificationSuspensionBehavior)0);
    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __19__HUUtilities_init__block_invoke;
    v13 = &unk_1EA8E9740;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", &v2->_wirelessSplitterNotifyToken, v7, &v10);

    -[HUUtilities updateWirelessSplitterState](v2, "updateWirelessSplitterState", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __19__HUUtilities_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateWirelessSplitterState");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.accessibility.hearing.wireless.splitter.changed"), 0);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.accessibility.hearing.audio.transfer.complete"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("com.apple.accessibility.hearing.audio.transfer"), 0);
  v5.receiver = self;
  v5.super_class = (Class)HUUtilities;
  -[HUUtilities dealloc](&v5, sel_dealloc);
}

- (BOOL)hearingAidStreamSelected
{
  HUUtilities *v2;
  void *v3;

  v2 = self;
  -[HUUtilities currentPickableAudioRoutes](self, "currentPickableAudioRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[HUUtilities hearingAidStreamSelectedForAvailableRoutes:](v2, "hearingAidStreamSelectedForAvailableRoutes:", v3);

  return (char)v2;
}

- (void)hearingAidStreamSelectedAsync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HUUtilities routesManager](self, "routesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HUUtilities_hearingAidStreamSelectedAsync___block_invoke;
  v7[3] = &unk_1EA8EA5A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchCurrentPickableAudioRoutesIfNeededAsync:", v7);

}

uint64_t __45__HUUtilities_hearingAidStreamSelectedAsync___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 40);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(*(id *)(result + 32), "hearingAidStreamSelectedForAvailableRoutes:", a2));
  return result;
}

- (BOOL)hearingAidStreamSelectedForAvailableRoutes:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("AXSHARoutePicked"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("AVAudioRouteName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("BluetoothLEOutput"));

  return v5;
}

- (BOOL)hearingAidRouteAvailable
{
  HUUtilities *v2;
  void *v3;

  v2 = self;
  -[HUUtilities currentPickableAudioRoutes](self, "currentPickableAudioRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[HUUtilities hearingAidRouteAvailableForAvailableRoutes:](v2, "hearingAidRouteAvailableForAvailableRoutes:", v3);

  return (char)v2;
}

- (void)hearingAidRouteAvailableAsync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HUUtilities routesManager](self, "routesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HUUtilities_hearingAidRouteAvailableAsync___block_invoke;
  v7[3] = &unk_1EA8EA5A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchCurrentPickableAudioRoutesIfNeededAsync:", v7);

}

uint64_t __45__HUUtilities_hearingAidRouteAvailableAsync___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 40);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(*(id *)(result + 32), "hearingAidRouteAvailableForAvailableRoutes:", a2));
  return result;
}

- (BOOL)hearingAidRouteAvailableForAvailableRoutes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("AXSHARouteHearingAid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUUtilities hearingAidRouteAvailableForAvailableRoutes:]", 224, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return v4 != 0;
}

- (BOOL)liveListenRouteSelected
{
  HUUtilities *v2;
  void *v3;

  v2 = self;
  -[HUUtilities currentPickableAudioRoutes](self, "currentPickableAudioRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[HUUtilities liveListenRouteSelectedForAvailableRoutes:](v2, "liveListenRouteSelectedForAvailableRoutes:", v3);

  return (char)v2;
}

- (void)liveListenRouteSelectedAsync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HUUtilities routesManager](self, "routesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HUUtilities_liveListenRouteSelectedAsync___block_invoke;
  v7[3] = &unk_1EA8EA5A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchCurrentPickableAudioRoutesIfNeededAsync:", v7);

}

uint64_t __44__HUUtilities_liveListenRouteSelectedAsync___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 40);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(*(id *)(result + 32), "liveListenRouteSelectedForAvailableRoutes:", a2));
  return result;
}

- (BOOL)liveListenRouteSelectedForAvailableRoutes:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUUtilities hearingAidStreamSelectedForAvailableRoutes:](self, "hearingAidStreamSelectedForAvailableRoutes:", v4);
  objc_msgSend(v4, "valueForKey:", CFSTR("AXSHARouteLiveListen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E0D481C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d, %d %@"), v5, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUUtilities liveListenRouteSelectedForAvailableRoutes:]", 251, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v10);
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    v16 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return v5 | v8;
}

- (BOOL)headphoneStreamSelected
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HUUtilities currentPickableAudioRoutes](self, "currentPickableAudioRoutes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("AXSHARouteHeadset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("AXSHARoutePicked"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToDictionary:", v4);

  return v5;
}

- (id)currentPickableAudioRoutesIfExist
{
  void *v2;
  void *v3;

  -[HUUtilities routesManager](self, "routesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPickableAudioRoutes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)requestCurrentRoutesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUUtilities routesManager](self, "routesManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchCurrentPickableAudioRoutesIfNeededAsync:", v4);

}

- (void)checkAudioPlayingWithQueue:(id)a3 origin:(void *)a4 andCompletion:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a5;
  if (v7)
  {
    if (!v6)
    {
      dispatch_get_global_queue(0, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();

  }
}

uint64_t __63__HUUtilities_checkAudioPlayingWithQueue_origin_andCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkAudioPlayingWithQueue:(id)a3 andCompletion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[HUUtilities checkAudioPlayingWithQueue:origin:andCompletion:](self, "checkAudioPlayingWithQueue:origin:andCompletion:", v7, MRMediaRemoteGetLocalOrigin(), v6);

}

- (void)pauseNowPlaying:(BOOL)a3 withQueue:(id)a4 andCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HUUtilities *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    dispatch_get_global_queue(0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke;
  v12[3] = &unk_1EA8EA640;
  v16 = a3;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[HUUtilities checkAudioPlayingWithQueue:andCompletion:](self, "checkAudioPlayingWithQueue:andCompletion:", v11, v12);

}

void __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke(int8x16_t *a1, int a2)
{
  dispatch_time_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_time_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int8x16_t v18;
  int8x16_t v19;
  _QWORD v20[4];
  int8x16_t v21;
  uint64_t *v22;
  _QWORD block[4];
  int8x16_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a1[3].i8[8])
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 0;
      v29 = MRMediaRemoteSendCommandToApp() != 0;
      v3 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_2;
      block[3] = &unk_1EA8EA618;
      v18 = a1[2];
      v24 = vextq_s8(v18, v18, 8uLL);
      v25 = &v26;
      dispatch_after(v3, (dispatch_queue_t)(id)v18.i64[0], block);
      HAInitializeLogging();
      if (*((_BYTE *)v27 + 24))
        v4 = CFSTR("success");
      else
        v4 = CFSTR("fail");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media Pause command %@"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUUtilities pauseNowPlaying:withQueue:andCompletion:]_block_invoke", 338, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
        *(_DWORD *)buf = 136446210;
        v31 = v8;
        _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }

      v9 = a1[3].i64[0];
      if (v9)
        (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, *((unsigned __int8 *)v27 + 24));

LABEL_22:
      _Block_object_dispose(&v26, 8);
      return;
    }
LABEL_14:
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v29 = MRMediaRemoteSendCommandToApp() != 0;
    v11 = dispatch_time(0, 500000000);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_38;
    v20[3] = &unk_1EA8EA618;
    v19 = a1[2];
    v21 = vextq_s8(v19, v19, 8uLL);
    v22 = &v26;
    dispatch_after(v11, (dispatch_queue_t)(id)v19.i64[0], v20);
    HAInitializeLogging();
    if (*((_BYTE *)v27 + 24))
      v12 = CFSTR("success");
    else
      v12 = CFSTR("fail");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media Play command %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUUtilities pauseNowPlaying:withQueue:andCompletion:]_block_invoke", 359, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v31 = v16;
      _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v17 = a1[3].i64[0];
    if (v17)
      (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, *((unsigned __int8 *)v27 + 24));

    goto LABEL_22;
  }
  if (!a1[3].i8[8])
    goto LABEL_14;
  v10 = a1[3].i64[0];
  if (v10)
    (*(void (**)(void))(v10 + 16))();
}

uint64_t __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_3;
  v4[3] = &unk_1EA8EA5F0;
  v4[4] = a1[6];
  return objc_msgSend(v2, "checkAudioPlayingWithQueue:andCompletion:", v1, v4);
}

void __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_3(uint64_t a1, int a2)
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MRMediaRemoteSendCommandToApp() != 0;
    HAInitializeLogging();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      v3 = CFSTR("success");
    else
      v3 = CFSTR("fail");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Retried media pause, %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUUtilities pauseNowPlaying:withQueue:andCompletion:]_block_invoke_3", 333, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v10 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

uint64_t __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_38(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_2_39;
  v4[3] = &unk_1EA8EA5F0;
  v4[4] = a1[6];
  return objc_msgSend(v2, "checkAudioPlayingWithQueue:andCompletion:", v1, v4);
}

void __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_2_39(uint64_t a1, char a2)
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MRMediaRemoteSendCommandToApp() != 0;
    HAInitializeLogging();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      v3 = CFSTR("success");
    else
      v3 = CFSTR("fail");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Retried media play, %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUUtilities pauseNowPlaying:withQueue:andCompletion:]_block_invoke_2", 354, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v10 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

- (id)liveListenDevice
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v3 = dispatch_semaphore_create(0);
  -[HUUtilities currentPickableAudioRoutes](self, "currentPickableAudioRoutes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AXSHARouteLiveListen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D481F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __31__HUUtilities_liveListenDevice__block_invoke;
  v15[3] = &unk_1EA8EA668;
  v8 = v6;
  v16 = v8;
  v17 = &v18;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __31__HUUtilities_liveListenDevice__block_invoke_2;
  v13[3] = &unk_1EA8E82F0;
  v9 = v3;
  v14 = v9;
  iteratePairedBluetoothDevicesOnQueueCBv1(v15, v13);
  v10 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v9, v10);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __31__HUUtilities_liveListenDevice__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsString:", v6);

  if ((_DWORD)v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

  return v7;
}

intptr_t __31__HUUtilities_liveListenDevice__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addHearingFeatureUsage:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usedHearingFeatures");

  v6 = compoundAttributeByAddingAttribute(v5, a3);
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsedHearingFeatures:", v6);

}

- (void)updateHearingFeatureUsage
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usedHearingFeatures");

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPairedWithRealHearingAids"))
    v5 = compoundAttributeByAddingAttribute(v3, 2);
  else
    v5 = compoundAttributeByRemovingAttribute(v3, 2);
  v6 = v5;

  if (AXHACHearingAidComplianceEnabled())
    v7 = compoundAttributeByAddingAttribute(v6, 4);
  else
    v7 = compoundAttributeByRemovingAttribute(v6, 4);
  v8 = v7;
  objc_msgSend(getRTTSettingsClass_0(), "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "TTYHardwareEnabled") & 1) != 0)
  {
    v10 = compoundAttributeByAddingAttribute(v8, 16);
  }
  else
  {
    objc_msgSend(getRTTSettingsClass_0(), "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "TTYSoftwareEnabled"))
      v12 = compoundAttributeByAddingAttribute(v8, 16);
    else
      v12 = compoundAttributeByRemovingAttribute(v8, 16);
    v10 = v12;

  }
  if (_AXSMonoAudioEnabled())
    v13 = compoundAttributeByAddingAttribute(v10, 32);
  else
    v13 = compoundAttributeByRemovingAttribute(v10, 32);
  v14 = v13;
  if (_AXSEarpieceNoiseCancellationEnabled())
    v15 = compoundAttributeByAddingAttribute(v14, 64);
  else
    v15 = compoundAttributeByRemovingAttribute(v14, 64);
  v16 = v15;
  _AXSLeftRightAudioBalance();
  if (v17 == 0.0)
    v18 = compoundAttributeByRemovingAttribute(v16, 128);
  else
    v18 = compoundAttributeByAddingAttribute(v16, 128);
  v19 = v18;
  if (_AXSVisualAlertEnabled())
    v20 = compoundAttributeByAddingAttribute(v19, 256);
  else
    v20 = compoundAttributeByRemovingAttribute(v19, 256);
  v21 = v20;
  if (_AXSClosedCaptionsEnabled())
    v22 = compoundAttributeByAddingAttribute(v21, 512);
  else
    v22 = compoundAttributeByRemovingAttribute(v21, 512);
  v23 = v22;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v24 = (void *)getPASettingsClass_softClass_0;
  v38 = getPASettingsClass_softClass_0;
  if (!getPASettingsClass_softClass_0)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __getPASettingsClass_block_invoke_0;
    v34[3] = &unk_1EA8E8270;
    v34[4] = &v35;
    __getPASettingsClass_block_invoke_0((uint64_t)v34);
    v24 = (void *)v36[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v35, 8);
  objc_msgSend(v25, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "personalMediaConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    v28 = compoundAttributeByAddingAttribute(v23, 1024);
  else
    v28 = compoundAttributeByRemovingAttribute(v23, 1024);
  v29 = v28;

  +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "comfortSoundsEnabled"))
    v31 = compoundAttributeByAddingAttribute(v29, 2048);
  else
    v31 = compoundAttributeByRemovingAttribute(v29, 2048);
  v32 = v31;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setUsedHearingFeatures:", v32);

}

- (BOOL)deviceIsTinker
{
  return 0;
}

+ (BOOL)shouldUseMultideviceV3
{
  return _os_feature_enabled_impl();
}

+ (id)XDCObjectFromObject:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__6;
    v12 = __Block_byref_object_dispose__6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__HUUtilities_XDCObjectFromObject___block_invoke;
    v7[3] = &unk_1EA8EA690;
    v7[4] = &v8;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
LABEL_5:
    v4 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
    goto LABEL_6;
  }
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__6;
    v12 = __Block_byref_object_dispose__6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__HUUtilities_XDCObjectFromObject___block_invoke_2;
    v6[3] = &unk_1EA8EA6B8;
    v6[4] = &v8;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

void __35__HUUtilities_XDCObjectFromObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  +[HUUtilities XDCObjectFromObject:](HUUtilities, "XDCObjectFromObject:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hai.%@"), v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  objc_msgSend(v7, "setObject:forKey:", v9, v5);

}

void __35__HUUtilities_XDCObjectFromObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  +[HUUtilities XDCObjectFromObject:](HUUtilities, "XDCObjectFromObject:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)objectFromXDCObject:(id)a3
{
  id v3;
  void *v4;
  id *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __35__HUUtilities_objectFromXDCObject___block_invoke;
    v12[3] = &unk_1EA8E8708;
    v5 = &v13;
    v6 = v4;
    v13 = v6;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v12);
LABEL_5:
    v7 = v6;

    goto LABEL_6;
  }
  objc_opt_class();
  v7 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __35__HUUtilities_objectFromXDCObject___block_invoke_2;
    v10[3] = &unk_1EA8EA558;
    v5 = &v11;
    v6 = v8;
    v11 = v6;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

void __35__HUUtilities_objectFromXDCObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  +[HUUtilities objectFromXDCObject:](HUUtilities, "objectFromXDCObject:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("hai."));
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("hai."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, v9);

    v5 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, v5);
  }

}

void __35__HUUtilities_objectFromXDCObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[HUUtilities objectFromXDCObject:](HUUtilities, "objectFromXDCObject:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)setRoutingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_routingQueue, a3);
}

- (BOOL)takingConnection
{
  return self->_takingConnection;
}

- (void)setTakingConnection:(BOOL)a3
{
  self->_takingConnection = a3;
}

- (void)setRoutesManager:(id)a3
{
  objc_storeStrong((id *)&self->_routesManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routesManager, 0);
  objc_storeStrong((id *)&self->_routingQueue, 0);
}

@end
