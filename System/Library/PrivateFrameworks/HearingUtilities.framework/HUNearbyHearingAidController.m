@implementation HUNearbyHearingAidController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  return (id)sharedInstance_NearbyController;
}

void __46__HUNearbyHearingAidController_sharedInstance__block_invoke()
{
  HUNearbyHearingAidController *v0;
  void *v1;

  v0 = objc_alloc_init(HUNearbyHearingAidController);
  v1 = (void *)sharedInstance_NearbyController;
  sharedInstance_NearbyController = (uint64_t)v0;

}

- (HUNearbyHearingAidController)init
{
  HUNearbyHearingAidController *v2;
  void *v3;
  void *v4;
  HUNearbyHearingAidController *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  AXDispatchTimer *handoffTimer;
  id v19;
  void *v20;
  uint64_t v21;
  AXDispatchTimer *sendPropertyUpdatesLowTimer;
  uint64_t v23;
  NSMutableDictionary *collectedPropertyUpdates;
  id v25;
  void *v26;
  uint64_t v27;
  AXDispatchTimer *messagesPriorityTimer;
  _QWORD v30[4];
  HUNearbyHearingAidController *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HUNearbyHearingAidController;
  v2 = -[HUDeviceController init](&v32, sel_init);
  if (v2)
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "multideviceSettingsEnabled");

    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __36__HUNearbyHearingAidController_init__block_invoke;
    v30[3] = &unk_1EA8E8220;
    v5 = v2;
    v31 = v5;
    objc_msgSend(v4, "registerUpdateBlock:forRetrieveSelector:withListener:", v30, sel_multideviceSettingsEnabled, v5);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("hu_nearby_media", v6);
    -[HUNearbyHearingAidController setMediaQueue:](v5, "setMediaQueue:", v7);

    v5->_deviceMessagePriority = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel_callStatusDidChange_, *MEMORY[0x1E0DBD4A0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel_callStatusDidChange_, *MEMORY[0x1E0DBD4F0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel_routesDidChange_, CFSTR("com.apple.accessibility.hearingaid.audio.route.changed"), 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)UserRequestedAudioTransferNotification, CFSTR("com.apple.accessibility.hearing.audio.transfer"), 0, (CFNotificationSuspensionBehavior)0);
    v12 = objc_alloc(MEMORY[0x1E0CF3978]);
    -[HUNearbyHearingAidController mediaQueue](v5, "mediaQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithTargetSerialQueue:", v13);
    -[HUNearbyHearingAidController setSendConnectionToCompanionTimer:](v5, "setSendConnectionToCompanionTimer:", v14);

    v15 = objc_alloc(MEMORY[0x1E0CF3978]);
    -[HUDeviceController deviceUpdatesQueue](v5, "deviceUpdatesQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithTargetSerialQueue:", v16);
    handoffTimer = v5->_handoffTimer;
    v5->_handoffTimer = (AXDispatchTimer *)v17;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v5->_handoffTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    v19 = objc_alloc(MEMORY[0x1E0CF3978]);
    -[HUDeviceController deviceUpdatesQueue](v5, "deviceUpdatesQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithTargetSerialQueue:", v20);
    sendPropertyUpdatesLowTimer = v5->_sendPropertyUpdatesLowTimer;
    v5->_sendPropertyUpdatesLowTimer = (AXDispatchTimer *)v21;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v5->_sendPropertyUpdatesLowTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    v23 = objc_opt_new();
    collectedPropertyUpdates = v5->_collectedPropertyUpdates;
    v5->_collectedPropertyUpdates = (NSMutableDictionary *)v23;

    v25 = objc_alloc(MEMORY[0x1E0CF3978]);
    -[HUDeviceController deviceUpdatesQueue](v5, "deviceUpdatesQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "initWithTargetSerialQueue:", v26);
    messagesPriorityTimer = v5->_messagesPriorityTimer;
    v5->_messagesPriorityTimer = (AXDispatchTimer *)v27;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v5->_messagesPriorityTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  }
  return v2;
}

void __36__HUNearbyHearingAidController_init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "availableRemoteControllersDidChange");

  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Multidevice settings change. Updated available controllers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController init]_block_invoke", 90, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v8 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)registerMediaNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Registering media"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController registerMediaNotifications]", 136, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v22 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t *)MEMORY[0x1E0D48200];
  v10 = (uint64_t *)MEMORY[0x1E0D48000];
  v11 = *MEMORY[0x1E0D48000];
  v20[0] = *MEMORY[0x1E0D48200];
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttribute:forKey:error:", v12, *MEMORY[0x1E0D48280], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *v9;
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_mediaServerDied, v14, v15);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *v10;
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_mediaPlaybackDidChange_, v17, v18);

  MRMediaRemoteSetWantsNowPlayingNotifications();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_mediaPlaybackDidChange_, *MEMORY[0x1E0D4C920], 0);

}

- (void)unregisterMediaNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unregistering media"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController unregisterMediaNotifications]", 151, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v15 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D48200];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D48000];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", self, v12, v13);

}

- (void)mediaServerDied
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media server died."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController mediaServerDied]", 159, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUNearbyHearingAidController unregisterMediaNotifications](self, "unregisterMediaNotifications");
  v8 = dispatch_time(0, 2000000000);
  -[HUNearbyHearingAidController mediaQueue](self, "mediaQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HUNearbyHearingAidController_mediaServerDied__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_after(v8, v9, block);

}

uint64_t __47__HUNearbyHearingAidController_mediaServerDied__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerMediaNotifications");
}

- (void)mediaPlaybackDidChange:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyHearingAidController mediaQueue](self, "mediaQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke;
  v6[3] = &unk_1EA8E82F0;
  v6[4] = self;
  objc_msgSend(v4, "checkAudioPlayingWithQueue:andCompletion:", v5, v6);

}

void __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  HCLogHearingHandoff();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke_cold_2(a2, v4);

  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v5, "requestConnectionForMedia");
  }
  else if (objc_msgSend(v5, "processingHandoff") == 1 && objc_msgSend(*(id *)(a1 + 32), "handoffReason") == 1)
  {
    HCLogHearingHandoff();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setHoldingMediaForConnection:", 0);
    objc_msgSend(*(id *)(a1 + 32), "sendConnectionToCompanionIfPossible");
  }
}

- (void)routesDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (hearingAidStreamSelected())
  {
    -[HUNearbyHearingAidController setHoldingPhoneForConnection:](self, "setHoldingPhoneForConnection:", 0);
    if (-[HUNearbyHearingAidController holdingMediaForConnection](self, "holdingMediaForConnection"))
    {
      -[HUNearbyHearingAidController setHoldingMediaForConnection:](self, "setHoldingMediaForConnection:", 0);
      if ((objc_msgSend(MEMORY[0x1E0D2F990], "deviceIsWatch") & 1) == 0)
      {
        HCLogHearingHandoff();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "Route changed. Resuming media", v7, 2u);
        }

        +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUNearbyHearingAidController mediaQueue](self, "mediaQueue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "pauseNowPlaying:withQueue:andCompletion:", 0, v6, 0);

      }
    }
  }
}

- (void)callStatusDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HUNearbyHearingAidController *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HCLogHearingHandoff();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1DE311000, v5, OS_LOG_TYPE_DEFAULT, "Call status changed - %@", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__HUNearbyHearingAidController_callStatusDidChange___block_invoke;
  v8[3] = &unk_1EA8E8510;
  v9 = v4;
  v10 = self;
  v7 = v4;
  -[HUNearbyHearingAidController shouldRequestAudioConnectionForCall:withCompletion:](self, "shouldRequestAudioConnectionForCall:withCompletion:", 1, v8);

}

void __52__HUNearbyHearingAidController_callStatusDidChange___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__HUNearbyHearingAidController_callStatusDidChange___block_invoke_2;
  v12[3] = &unk_1EA8E84E8;
  v12[4] = &v25;
  v12[5] = &v21;
  v12[6] = &v17;
  v12[7] = &v13;
  getCallStatus(v12);
  HCLogHearingHandoff();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *((unsigned __int8 *)v14 + 24);
    v6 = *((unsigned __int8 *)v22 + 24);
    v7 = *((unsigned __int8 *)v18 + 24);
    v8 = *((unsigned __int8 *)v26 + 24);
    v9 = hearingAidStreamAvailable();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110658;
    v30 = v5;
    v31 = 1024;
    v32 = v6;
    v33 = 1024;
    v34 = v7;
    v35 = 1024;
    v36 = v8;
    v37 = 1024;
    v38 = v9;
    v39 = 1024;
    v40 = a2;
    v41 = 2112;
    v42 = v10;
    _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "Phone call [pending = %d, active = %d, avc = %d, endpoint = %d] - [connected = %d, should request = %d] - %@", buf, 0x30u);

  }
  if (!*((_BYTE *)v22 + 24) && !*((_BYTE *)v18 + 24) && !*((_BYTE *)v14 + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "setHoldingPhoneForConnection:", 0);
    objc_msgSend(*(id *)(a1 + 40), "sendConnectionToCompanionIfPossible");
    goto LABEL_14;
  }
  if (((hearingAidStreamAvailable() | a2 ^ 1) & 1) == 0)
  {
    if (!*((_BYTE *)v22 + 24) && !*((_BYTE *)v18 + 24))
    {
      v11 = 2;
      if (!*((_BYTE *)v26 + 24))
        goto LABEL_14;
      goto LABEL_13;
    }
    if (*((_BYTE *)v26 + 24))
      v11 = 3;
    else
      v11 = 2;
    if (*((_BYTE *)v26 + 24))
    {
LABEL_13:
      objc_msgSend(*(id *)(a1 + 40), "setHoldingPhoneForConnection:", 1);
      objc_msgSend(*(id *)(a1 + 40), "requestConnectionForReason:", v11);
    }
  }
LABEL_14:
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

_QWORD *__52__HUNearbyHearingAidController_callStatusDidChange___block_invoke_2(_QWORD *result, char a2, char a3, char a4, char a5)
{
  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = a4;
  *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = a5;
  return result;
}

- (BOOL)shouldRoute:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    v6 = objc_msgSend(v4, "callAudioRoute");
  else
    v6 = objc_msgSend(v4, "mediaAudioRoute");
  v7 = v6;

  if (v7 == 1)
    return 0;
  if (v7 != 2)
    return 1;
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPickableAudioRoutes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteHeadset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARoutePicked"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToDictionary:", v11);

  v13 = v12 ^ 1;
  return v13;
}

- (void)shouldRequestAudioConnectionForCall:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  if (v6)
  {
    -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__HUNearbyHearingAidController_shouldRequestAudioConnectionForCall_withCompletion___block_invoke;
    block[3] = &unk_1EA8E8538;
    block[4] = self;
    v10 = a3;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

void __83__HUNearbyHearingAidController_shouldRequestAudioConnectionForCall_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  uint8_t buf[4];
  _BYTE v43[10];
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v1 = a1;
  v54 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldRoute:", *(unsigned __int8 *)(a1 + 48));
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isConnected") & 1) != 0)
  {
    v41 = 0;
LABEL_6:

    goto LABEL_8;
  }
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPartiallyConnected");

  if ((v5 & 1) == 0 && objc_msgSend(*(id *)(v1 + 32), "isPeerConnectedToHearingDevice"))
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v3, "multideviceAudioEnabled");
    goto LABEL_6;
  }
  v41 = 0;
LABEL_8:
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v6, "isBluetoothAvailable");

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pairedHearingDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HCLogHearingHandoff();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v43 = objc_msgSend(v10, "isConnected");
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = objc_msgSend(v8, "isLeftConnected");
    v44 = 1024;
    v45 = objc_msgSend(v8, "isRightConnected");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "Connected: %d, L: %d, R: %d", buf, 0x14u);

  }
  HCLogHearingHandoff();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldStreamToLeftAid");
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldStreamToRightAid");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v43 = v13;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v15;
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "Streaming L: %d, R: %d", buf, 0xEu);

  }
  HCLogHearingHandoff();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v1 + 32), "connectedPeer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v43 = v18;
    _os_log_impl(&dword_1DE311000, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "ConnectedPeer: %@", buf, 0xCu);

  }
  HCLogHearingHandoff();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v39 = v2;
    v37 = v8;
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pairedHearingAids");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21 != 0;
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "shouldStreamToLeftAid");
    v38 = v1;
    if ((v23 & 1) != 0)
    {
      v24 = 1;
    }
    else
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v36, "shouldStreamToRightAid");
    }
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isPairedWithFakeHearingAids") ^ 1;
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isiCloudPaired");
    *(_DWORD *)buf = 67110656;
    *(_DWORD *)v43 = v39;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v21 != 0;
    v44 = 1024;
    v45 = v41;
    v46 = 1024;
    v47 = v24;
    v48 = 1024;
    v49 = v26;
    v50 = 1024;
    v51 = v28 ^ 1;
    v52 = 1024;
    v53 = v40;
    _os_log_impl(&dword_1DE311000, v19, OS_LOG_TYPE_DEFAULT, "Should request connection %d, %d, %d, %d, %d, %d, %d", buf, 0x2Cu);

    if ((v23 & 1) == 0)
    v8 = v37;
    v1 = v38;
    v2 = v39;
  }

  if (v2)
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pairedHearingAids");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = v41;
    else
      v31 = 0;
    if (v31 != 1)
      goto LABEL_36;
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "shouldStreamToLeftAid");
    if ((v33 & 1) != 0
      || (+[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance"),
          v16 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend((id)v16, "shouldStreamToRightAid")))
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v34, "isPairedWithFakeHearingAids") & 1) != 0)
      {

        if ((v33 & 1) != 0)
          goto LABEL_35;
      }
      else
      {
        +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "isiCloudPaired");

        if ((v33 & 1) != 0)
        {
LABEL_35:

LABEL_36:
          goto LABEL_37;
        }
      }
    }

    goto LABEL_35;
  }
LABEL_37:
  (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();

}

- (void)requestConnectionForMedia
{
  OUTLINED_FUNCTION_2(&dword_1DE311000, a1, a3, "Already Processing Connection, Skip", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __57__HUNearbyHearingAidController_requestConnectionForMedia__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearAudioRoutes");

  if (a2)
  {
    v5 = hearingAidStreamAvailable();
    if ((v5 & 1) != 0 || *(_BYTE *)(a1 + 40))
    {
      HCLogHearingHandoff();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 134218240;
        v13 = v5;
        v14 = 2048;
        v15 = v7;
        _os_log_impl(&dword_1DE311000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Skipping handoff, streamAvailable - %ld, holdingMedia - %ld", buf, 0x16u);
      }
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __57__HUNearbyHearingAidController_requestConnectionForMedia__block_invoke_37;
      v11[3] = &unk_1EA8E82F0;
      v11[4] = *(_QWORD *)(a1 + 32);
      v6 = MEMORY[0x1DF0EB808](v11);
      if (objc_msgSend(MEMORY[0x1E0D2F990], "deviceIsWatch"))
      {
        (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
      }
      else
      {
        +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "mediaQueue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pauseNowPlaying:withQueue:andCompletion:", 1, v10, v6);

      }
    }

  }
  else
  {
    HCLogHearingHandoff();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "sendConnectionToCompanionIfPossible", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "sendConnectionToCompanionIfPossible");
  }
}

uint64_t __57__HUNearbyHearingAidController_requestConnectionForMedia__block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  HCLogHearingHandoff();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, "Requesting connection for media", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setHoldingMediaForConnection:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "requestConnectionForReason:", 1);
}

- (void)requestConnectionForReason:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HCLogHearingHandoff();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForHandoffReason:](self, "descriptionForHandoffReason:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1DE311000, v5, OS_LOG_TYPE_DEFAULT, "Request connection reason %@", buf, 0xCu);

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HUNearbyHearingAidController_requestConnectionForReason___block_invoke;
  v7[3] = &unk_1EA8E8588;
  v7[4] = self;
  v7[5] = a3;
  -[HUNearbyHearingAidController connectedPeerWithCompletion:](self, "connectedPeerWithCompletion:", v7);
}

void __59__HUNearbyHearingAidController_requestConnectionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sendConnectionToCompanionTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  if (objc_msgSend(*(id *)(a1 + 32), "requestHandoff:reason:", 1, *(_QWORD *)(a1 + 40)))
  {
    HCLogHearingHandoff();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "descriptionForHandoffReason:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "timeStamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1DE311000, v5, OS_LOG_TYPE_DEFAULT, "HandoffState: Connecting, Sending ControllerConnectWithReason %@ to %@, time: %@", buf, 0x20u);

    }
    v14 = &unk_1EA8FF938;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 32);
    if (v3)
    {
      v13 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendMessage:toDevices:messagePriority:", v10, v12, 1);

    }
    else
    {
      objc_msgSend(v11, "sendMessageToAllDevices:messagePriority:", v10, 1);
    }

  }
}

- (void)requestConnection
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[16];

  HCLogHearingHandoff();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "Request connection", buf, 2u);
  }

  +[AXHAController sharedController](AXHAController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setListenForAvailableDeviceUpdates:", 0);

  -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HUNearbyHearingAidController_requestConnection__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v5, block);

  +[AXHAController sharedController](AXHAController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setListenForAvailableDeviceUpdates:", 1);

}

void __49__HUNearbyHearingAidController_requestConnection__block_invoke(uint64_t a1)
{
  int v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  __int16 v7;

  v1 = objc_msgSend(*(id *)(a1 + 32), "requestHandoff:reason:", 1, 1);
  HCLogHearingHandoff();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      v7 = 0;
      v4 = "Started processing connection";
      v5 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }
  else if (v3)
  {
    v6 = 0;
    v4 = "Couldn't request connection";
    v5 = (uint8_t *)&v6;
    goto LABEL_6;
  }

}

- (void)checkConnectionRequestedForMediaAfterTimeout
{
  NSObject *v3;
  _QWORD block[5];

  -[HUNearbyHearingAidController mediaQueue](self, "mediaQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HUNearbyHearingAidController_checkConnectionRequestedForMediaAfterTimeout__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v3, block);

}

void __76__HUNearbyHearingAidController_checkConnectionRequestedForMediaAfterTimeout__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "holdingMediaForConnection")
    && (objc_msgSend(MEMORY[0x1E0D2F990], "deviceIsWatch") & 1) == 0)
  {
    HCLogHearingHandoff();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, "checkConnectionRequestedForMediaAfterTimeout, Resuming Media", buf, 2u);
    }

    +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mediaQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseNowPlaying:withQueue:andCompletion:", 0, v4, 0);

  }
  if ((hearingAidStreamAvailable() & 1) == 0)
  {
    HCLogHearingHandoff();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE311000, v5, OS_LOG_TYPE_DEFAULT, "After timeout gave up on Media handoff, transiton connection to peer", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "relinquishConnection");
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.hearing.audio.transfer.complete"), 0, 0, 1u);
  v7 = dispatch_time(0, 2000000000);
  objc_msgSend(*(id *)(a1 + 32), "mediaQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HUNearbyHearingAidController_checkConnectionRequestedForMediaAfterTimeout__block_invoke_43;
  block[3] = &unk_1EA8E8220;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v7, v8, block);

}

uint64_t __76__HUNearbyHearingAidController_checkConnectionRequestedForMediaAfterTimeout__block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  HCLogHearingHandoff();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, "checkConnectionRequestedForMediaAfterTimeout setHoldingMediaForConnection: NO", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setHoldingMediaForConnection:", 0);
}

- (void)sendConnectionToCompanionIfPossible
{
  -[HUNearbyHearingAidController sendConnectionToCompanionIfPossible:](self, "sendConnectionToCompanionIfPossible:", 0);
}

- (BOOL)shouldRelinquishConnectionForReason:(int64_t)a3
{
  int v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BOOL4 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HUNearbyHearingAidController_shouldRelinquishConnectionForReason___block_invoke;
  v14[3] = &unk_1EA8E84E8;
  v14[4] = &v27;
  v14[5] = &v23;
  v14[6] = &v19;
  v14[7] = &v15;
  getCallStatus(v14);
  v5 = *((_BYTE *)v28 + 24) == 0;
  if (*((_BYTE *)v28 + 24))
    v6 = *((_BYTE *)v24 + 24) || *((_BYTE *)v20 + 24) || *((_BYTE *)v16 + 24) != 0;
  else
    v6 = 0;
  if ((unint64_t)(a3 - 1) < 2)
  {
    if (*((_BYTE *)v28 + 24))
    {
      v5 = !*((_BYTE *)v24 + 24) && !*((_BYTE *)v20 + 24) && *((_BYTE *)v16 + 24) == 0;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (a3 != 3)
  {
    if (a3 == 4)
    {
      v5 = !v6;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (!*((_BYTE *)v24 + 24) && !*((_BYTE *)v20 + 24))
LABEL_16:
    v5 = 1;
LABEL_17:
  HCLogHearingHandoff();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForHandoffReason:](self, "descriptionForHandoffReason:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *((unsigned __int8 *)v16 + 24);
    v10 = *((unsigned __int8 *)v24 + 24);
    v11 = *((unsigned __int8 *)v20 + 24);
    v12 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 67110658;
    v32 = v5;
    v33 = 2112;
    v34 = v8;
    v35 = 1024;
    v36 = v9;
    v37 = 1024;
    v38 = v10;
    v39 = 1024;
    v40 = v11;
    v41 = 1024;
    v42 = v12;
    v43 = 1024;
    v44 = v6;
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "Should relinquish: %d Reason: %@, Call: [pending: %d, active: %d, avc: %d, endpoint: %d], inCall: %d", buf, 0x30u);

  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  return v5;
}

_QWORD *__68__HUNearbyHearingAidController_shouldRelinquishConnectionForReason___block_invoke(_QWORD *result, char a2, char a3, char a4, char a5)
{
  *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = a4;
  *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = a5;
  return result;
}

- (BOOL)relinquishConnectionForReason:(int64_t)a3 toDevice:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HCLogHearingHandoff();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForHandoffReason:](self, "descriptionForHandoffReason:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "relinquishConnectionForReason: %@ to peer: %@", buf, 0x16u);

  }
  if (-[HUNearbyHearingAidController shouldRelinquishConnectionForReason:](self, "shouldRelinquishConnectionForReason:", a3)&& -[HUNearbyHearingAidController requestHandoff:reason:](self, "requestHandoff:reason:", 2, a3))
  {
    -[HUNearbyHearingAidController setConnectionState:forDevice:](self, "setConnectionState:forDevice:", 3, v6);
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x8000);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v16 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUNearbyHearingAidController sendMessage:toDevices:messagePriority:](self, "sendMessage:toDevices:messagePriority:", v12, v13, 1);

      }
      else
      {
        -[HUNearbyHearingAidController sendMessageToAllDevices:messagePriority:](self, "sendMessageToAllDevices:messagePriority:", v12, 1);
      }

    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)relinquishConnection
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  HCLogHearingHandoff();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "Relinquish connection", buf, 2u);
  }

  -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HUNearbyHearingAidController_relinquishConnection__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v4, block);

}

void __52__HUNearbyHearingAidController_relinquishConnection__block_invoke(uint64_t a1)
{
  int v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  __int16 v7;

  v1 = objc_msgSend(*(id *)(a1 + 32), "requestHandoff:reason:", 2, 0);
  HCLogHearingHandoff();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      v7 = 0;
      v4 = "Started relinquishing connection";
      v5 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }
  else if (v3)
  {
    v6 = 0;
    v4 = "Couldn't relinquish connection";
    v5 = (uint8_t *)&v6;
    goto LABEL_6;
  }

}

- (void)relinquishConnectionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  HCLogHearingHandoff();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE311000, v5, OS_LOG_TYPE_DEFAULT, "Relinquish connection with callback", buf, 2u);
  }

  -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HUNearbyHearingAidController_relinquishConnectionWithCompletion___block_invoke;
  v8[3] = &unk_1EA8E85B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __67__HUNearbyHearingAidController_relinquishConnectionWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRelinquishCompleted:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "relinquishConnection");
}

- (BOOL)shouldConnect
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[HUNearbyHearingAidController state](self, "state") != 2
    && -[HUNearbyHearingAidController state](self, "state") != 4;
  HCLogHearingHandoff();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForCurrentState](self, "descriptionForCurrentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = 67109378;
    v7[1] = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "Nearby controller shouldConnect: %d, state: %@", (uint8_t *)v7, 0x12u);

  }
  return v3;
}

- (BOOL)shouldDisconnect
{
  int64_t v3;
  NSObject *v4;
  void *v5;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[HUNearbyHearingAidController state](self, "state");
  HCLogHearingHandoff();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForCurrentState](self, "descriptionForCurrentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = 67109378;
    v7[1] = v3 != 3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "Nearby controller shouldDisconnect: %d, state: %@", (uint8_t *)v7, 0x12u);

  }
  return v3 != 3;
}

- (id)timeStamp
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("HH:mm:ss:SS"));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)disconnectFromPairedDevice
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  HCLogHearingHandoff();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, "Disconnect from paired hearing device", v7, 2u);
  }

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXHAController sharedController](AXHAController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disconnectFromHearingAidWithDeviceUUID:", v5);

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelPendingConnections");

}

- (id)descriptionForHandoffState
{
  unint64_t v2;

  v2 = -[HUNearbyHearingAidController processingHandoff](self, "processingHandoff");
  if (v2 > 2)
    return CFSTR("N/A");
  else
    return off_1EA8E87A0[v2];
}

- (id)descriptionForHandoffReason:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("N/A");
  else
    return off_1EA8E87B8[a3];
}

- (BOOL)requestHandoff:(int64_t)a3 reason:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void (**v17)(void);
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff") == a3
    && -[HUNearbyHearingAidController handoffReason](self, "handoffReason") == a4)
  {
    HCLogHearingHandoff();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[HUNearbyHearingAidController descriptionForHandoffState](self, "descriptionForHandoffState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "Already processing, skip requestHandoff: %@", (uint8_t *)&v18, 0xCu);

    }
  }
  else
  {
    -[HUNearbyHearingAidController setProcessingHandoff:](self, "setProcessingHandoff:", a3);
    -[HUNearbyHearingAidController setHandoffReason:](self, "setHandoffReason:", a4);
    HCLogHearingHandoff();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[HUNearbyHearingAidController descriptionForHandoffState](self, "descriptionForHandoffState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNearbyHearingAidController descriptionForHandoffReason:](self, "descriptionForHandoffReason:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "Start requestHandoff: %@, reason: %@", (uint8_t *)&v18, 0x16u);

    }
    -[HUNearbyHearingAidController updateStateOnDeviceQueue](self, "updateStateOnDeviceQueue");
    if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff"))
    {
      -[HUNearbyHearingAidController checkHandoffAfterTimeout](self, "checkHandoffAfterTimeout");
      return 1;
    }
    HCLogHearingHandoff();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HUNearbyHearingAidController descriptionForHandoffReason:](self, "descriptionForHandoffReason:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v14;
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't Start handoff for a reason: %@", (uint8_t *)&v18, 0xCu);

    }
    -[HUNearbyHearingAidController relinquishCompleted](self, "relinquishCompleted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      HCLogHearingHandoff();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "Invoking relinquishCompleted callback", (uint8_t *)&v18, 2u);
      }

      -[HUNearbyHearingAidController relinquishCompleted](self, "relinquishCompleted");
      v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v17[2]();

      -[HUNearbyHearingAidController setRelinquishCompleted:](self, "setRelinquishCompleted:", 0);
    }
  }
  return 0;
}

- (void)checkHandoffAfterTimeout
{
  int64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[HUNearbyHearingAidController processingHandoff](self, "processingHandoff");
  HCLogHearingHandoff();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForHandoffState](self, "descriptionForHandoffState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController descriptionForHandoffReason:](self, "descriptionForHandoffReason:", -[HUNearbyHearingAidController handoffReason](self, "handoffReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "Starting check timer for handoff %@, reason: %@", buf, 0x16u);

  }
  if (v3 == 1)
    v7 = 7.5;
  else
    v7 = 15.0;

  -[HUNearbyHearingAidController handoffTimer](self, "handoffTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HUNearbyHearingAidController_checkHandoffAfterTimeout__block_invoke;
  v9[3] = &unk_1EA8E8220;
  v9[4] = self;
  objc_msgSend(v8, "afterDelay:processBlock:", v9, v7);

}

void __56__HUNearbyHearingAidController_checkHandoffAfterTimeout__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HCLogHearingHandoff();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "descriptionForHandoffState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "descriptionForHandoffReason:", objc_msgSend(*(id *)(a1 + 32), "handoffReason"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "connectedPeer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, "Check timer fired for handoff %@, reason: %@, connectedPeer: %@", buf, 0x20u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "processingHandoff"))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "processingHandoff");
    v8 = *(void **)(a1 + 32);
    if (v7 == 1)
    {
      if (objc_msgSend(v8, "handoffReason") == 1)
        objc_msgSend(*(id *)(a1 + 32), "checkConnectionRequestedForMediaAfterTimeout");
    }
    else
    {
      objc_msgSend(v8, "mediaQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__HUNearbyHearingAidController_checkHandoffAfterTimeout__block_invoke_68;
      block[3] = &unk_1EA8E8220;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v10, block);

    }
    objc_msgSend(*(id *)(a1 + 32), "resetHandoffOnDeviceQueue");
  }
  else
  {
    HCLogHearingHandoff();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "Handoff is completed", buf, 2u);
    }

  }
}

uint64_t __56__HUNearbyHearingAidController_checkHandoffAfterTimeout__block_invoke_68(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  HCLogHearingHandoff();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, "Relinquishing connection, holdingMediaForConnection: NO", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setHoldingMediaForConnection:", 0);
}

- (void)finishHandoff
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  NSObject *v12;
  void (**v13)(void);
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  HCLogHearingHandoff();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForHandoffState](self, "descriptionForHandoffState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController descriptionForHandoffReason:](self, "descriptionForHandoffReason:", -[HUNearbyHearingAidController handoffReason](self, "handoffReason"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController connectedPeer](self, "connectedPeer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v7;
    v20 = 1024;
    v21 = -[HUNearbyHearingAidController holdingMediaForConnection](self, "holdingMediaForConnection");
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "Finish handoff %@, reason: %@, connectedPeer: %@, holding media %d", (uint8_t *)&v14, 0x26u);

  }
  -[HUNearbyHearingAidController handoffTimer](self, "handoffTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  -[HUNearbyHearingAidController relinquishCompleted](self, "relinquishCompleted");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = -[HUNearbyHearingAidController processingHandoff](self, "processingHandoff");

    if (v11 == 2)
    {
      HCLogHearingHandoff();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "Invoking relinquishCompleted callback", (uint8_t *)&v14, 2u);
      }

      -[HUNearbyHearingAidController relinquishCompleted](self, "relinquishCompleted");
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v13[2]();

      -[HUNearbyHearingAidController setRelinquishCompleted:](self, "setRelinquishCompleted:", 0);
    }
  }
  -[HUNearbyHearingAidController setProcessingHandoff:](self, "setProcessingHandoff:", 0);
  -[HUNearbyHearingAidController setHandoffReason:](self, "setHandoffReason:", 0);
}

- (void)resetHandoffOnDeviceQueue
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HCLogHearingHandoff();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForHandoffState](self, "descriptionForHandoffState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "Reset handoff from: %@", (uint8_t *)&v5, 0xCu);

  }
  if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff"))
  {
    -[HUNearbyHearingAidController finishHandoff](self, "finishHandoff");
    -[HUNearbyHearingAidController updateStateOnDeviceQueue](self, "updateStateOnDeviceQueue");
  }
}

- (void)resetHandoff
{
  NSObject *v3;
  _QWORD block[5];

  -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HUNearbyHearingAidController_resetHandoff__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __44__HUNearbyHearingAidController_resetHandoff__block_invoke(uint64_t a1)
{
  NSObject *v3;
  uint8_t v4[16];

  if (objc_msgSend(*(id *)(a1 + 32), "processingHandoff"))
    return objc_msgSend(*(id *)(a1 + 32), "resetHandoffOnDeviceQueue");
  HCLogHearingHandoff();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "No handoff, just update state", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "updateStateOnDeviceQueue");
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id buf[2];

  if (!-[HUNearbyHearingAidController hasStarted](self, "hasStarted"))
  {
    -[HUNearbyHearingAidController setHasStarted:](self, "setHasStarted:", 1);
    HCLogHearingHandoff();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "Nearby start", (uint8_t *)buf, 2u);
    }

    -[HUNearbyHearingAidController registerMediaNotifications](self, "registerMediaNotifications");
    objc_initWeak(buf, self);
    +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerQueue:forDomain:", v5, CFSTR("com.apple.hearing.hearingaids"));

    +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerLoggingBlock:forDomain:withListener:", &__block_literal_global_73, CFSTR("com.apple.hearing.hearingaids"), self);

    +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __37__HUNearbyHearingAidController_start__block_invoke_76;
    v18[3] = &unk_1EA8E8640;
    objc_copyWeak(&v19, buf);
    v18[4] = self;
    objc_msgSend(v7, "registerDiscoveryBlock:forDomain:withListener:", v18, CFSTR("com.apple.hearing.hearingaids"), self);

    +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __37__HUNearbyHearingAidController_start__block_invoke_85;
    v16[3] = &unk_1EA8E8668;
    objc_copyWeak(&v17, buf);
    objc_msgSend(v9, "registerMessageBlock:forDomain:withListener:", v16, CFSTR("com.apple.hearing.hearingaids"), self);

    +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "discoverNearbyDevicesWithDomain:", CFSTR("com.apple.hearing.hearingaids"));

    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __37__HUNearbyHearingAidController_start__block_invoke_3;
    v15[3] = &unk_1EA8E8690;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v15, 60.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController setIdsMessagesTimer:](self, "setIdsMessagesTimer:", v11);

    -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __37__HUNearbyHearingAidController_start__block_invoke_90;
    block[3] = &unk_1EA8E81D0;
    objc_copyWeak(&v14, buf);
    dispatch_async(v12, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
  }
}

void __37__HUNearbyHearingAidController_start__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController start]_block_invoke", 816, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

void __37__HUNearbyHearingAidController_start__block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deviceUpdatesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HUNearbyHearingAidController_start__block_invoke_2;
  block[3] = &unk_1EA8E8618;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v11);
}

void __37__HUNearbyHearingAidController_start__block_invoke_2(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "updateStateOnDeviceQueue");

  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nearbyDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HCLogHearingHandoff();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = (uint64_t)v7;
    _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "Devices updated, available devices count: %@", buf, 0xCu);

  }
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "availableRemoteControllersDidChange");

  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nearby devices changed. Updated available controllers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController start]_block_invoke", 826, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v11);
    v14 = v12;
    v15 = objc_msgSend(v13, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v36 = v15;
    _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (objc_msgSend(a1[4], "count"))
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1[5], "descriptionForCurrentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "descriptionForCurrentMessagePriority");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Peers discovered, sending CheckIn, ControllerConnected: %@ MessagesPriority: %@ to"), v17, v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_loadWeakRetained(v2);
    objc_msgSend(v19, "logDevices:withTitle:fullInfo:", a1[4], v32, 0);

    v33[0] = &unk_1EA8FF950;
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = objc_loadWeakRetained(v2);
    objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "state"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v22;
    v33[1] = &unk_1EA8FF968;
    v23 = (void *)MEMORY[0x1E0CB37E8];
    v24 = objc_loadWeakRetained(v2);
    objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "state"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v25;
    v33[2] = &unk_1EA8FF980;
    v26 = v5;
    v27 = (void *)MEMORY[0x1E0CB37E8];
    v28 = objc_loadWeakRetained(v2);
    objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "deviceMessagePriority"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v26;
    v31 = objc_loadWeakRetained(v2);
    objc_msgSend(v31, "sendStateMessage:toDevices:isUrgent:", v30, a1[4], 1);

  }
}

void __37__HUNearbyHearingAidController_start__block_invoke_85(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "deviceUpdatesQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HUNearbyHearingAidController_start__block_invoke_2_86;
  block[3] = &unk_1EA8E8618;
  objc_copyWeak(&v14, a1);
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
}

void __37__HUNearbyHearingAidController_start__block_invoke_2_86(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "device:didReceiveMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") && *(_QWORD *)(a1 + 32))
  {
    v5 = objc_loadWeakRetained(v2);
    v7[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendMessage:toDevices:", v4, v6);

  }
}

void __37__HUNearbyHearingAidController_start__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "deviceUpdatesQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HUNearbyHearingAidController_start__block_invoke_4;
  block[3] = &unk_1EA8E8220;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __37__HUNearbyHearingAidController_start__block_invoke_4(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "idsMessagesCount");
  if (result)
  {
    HCLogHearingHandoff();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "idsMessagesCount"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "IDS messages count: %@", (uint8_t *)&v5, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "setIdsMessagesCount:", 0);
  }
  return result;
}

void __37__HUNearbyHearingAidController_start__block_invoke_90(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateStateOnDeviceQueue");

}

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HUNearbyHearingAidController setHasStarted:](self, "setHasStarted:", 0);
  HCLogHearingHandoff();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "Nearby stop", buf, 2u);
  }

  -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HUNearbyHearingAidController_stop__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v4, block);

  -[HUNearbyHearingAidController unregisterMediaNotifications](self, "unregisterMediaNotifications");
  HCLogHearingHandoff();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUNearbyHearingAidController idsMessagesCount](self, "idsMessagesCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DE311000, v5, OS_LOG_TYPE_DEFAULT, "IDS messages count: %@", buf, 0xCu);

  }
  -[HUNearbyHearingAidController idsMessagesTimer](self, "idsMessagesTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[HUNearbyHearingAidController setIdsMessagesTimer:](self, "setIdsMessagesTimer:", 0);
}

void __36__HUNearbyHearingAidController_stop__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "sendConnectionToCompanionIfPossible");
  objc_msgSend(*(id *)(a1 + 32), "relinquishConnectionForReason:toDevice:", 0, 0);
  v2 = dispatch_time(0, 12000000000);
  objc_msgSend(*(id *)(a1 + 32), "deviceUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HUNearbyHearingAidController_stop__block_invoke_2;
  block[3] = &unk_1EA8E8220;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, v3, block);

}

void __36__HUNearbyHearingAidController_stop__block_invoke_2(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasStarted") & 1) == 0)
  {
    +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stopDiscoveringDevicesWithDomain:", CFSTR("com.apple.hearing.hearingaids"));

  }
}

- (BOOL)updateStateOnDeviceQueue
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  _BOOL4 v28;
  char v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  int64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  char v39;
  BOOL v40;
  void *v41;
  char v42;
  _BOOL4 v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  int64_t v64;
  NSObject *v65;
  void *v66;
  int v67;
  void *v68;
  NSObject *v70;
  _BOOL4 v71;
  int v72;
  int v73;
  void *v74;
  int v75;
  void *v76;
  NSObject *v77;
  uint8_t buf[4];
  _BYTE v79[10];
  void *v80;
  _DWORD v81[4];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedHearingAids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isiCloudPaired") ^ 1;

  }
  else
  {
    v6 = 0;
  }

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isConnected");

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isConnecting");

  -[HUNearbyHearingAidController availableDevices](self, "availableDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v13, "isBluetoothAvailable");

  -[HUNearbyHearingAidController connectedPeer](self, "connectedPeer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyHearingAidController connectingPeer](self, "connectingPeer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HCLogHearingHandoff();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v79 = v75;
    *(_WORD *)&v79[4] = 1024;
    *(_DWORD *)&v79[6] = v6;
    LOWORD(v80) = 1024;
    *(_DWORD *)((char *)&v80 + 2) = v8;
    HIWORD(v80) = 1024;
    v81[0] = v10;
    _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "UpdateState BT: %d, Paired: %d, Connected: %d, Connecting: %d", buf, 0x1Au);
  }

  HCLogHearingHandoff();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v19 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v79 = v18;
    *(_WORD *)&v79[8] = 2112;
    v80 = v20;
    _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "connectedPeer: %@, connectingPeer: %@", buf, 0x16u);

    v15 = v19;
  }

  HCLogHearingHandoff();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForCurrentState](self, "descriptionForCurrentState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController descriptionForHandoffState](self, "descriptionForHandoffState");
    v23 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v79 = v22;
    *(_WORD *)&v79[8] = 2112;
    v80 = v24;
    _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "Processing state: %@, handoff: %@", buf, 0x16u);

    v15 = v23;
  }

  if ((-[HUNearbyHearingAidController hasStarted](self, "hasStarted") & v6 & v75) != 1 || !v12)
  {
    if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff") == 1)
    {
      HCLogHearingHandoff();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = -[HUNearbyHearingAidController hasStarted](self, "hasStarted");
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v79 = v26;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v6;
        LOWORD(v80) = 1024;
        *(_DWORD *)((char *)&v80 + 2) = v75;
        HIWORD(v80) = 1024;
        v81[0] = v12 != 0;
        _os_log_impl(&dword_1DE311000, v25, OS_LOG_TYPE_DEFAULT, "Connection request interrupted, Nearby started: %d, isPaired: %d, BT available: %d, hasPeers: %d", buf, 0x1Au);
      }

      -[HUNearbyHearingAidController finishHandoff](self, "finishHandoff");
    }
    if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff") == 2)
    {
      HCLogHearingHandoff();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = -[HUNearbyHearingAidController hasStarted](self, "hasStarted");
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v79 = v28;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v6;
        LOWORD(v80) = 1024;
        *(_DWORD *)((char *)&v80 + 2) = v75;
        HIWORD(v80) = 1024;
        v81[0] = v12 != 0;
        _os_log_impl(&dword_1DE311000, v27, OS_LOG_TYPE_DEFAULT, "Transition request interrupted, Nearby started: %d, isPaired: %d, BT available: %d, hasPeers: %d", buf, 0x1Au);
      }

      -[HUNearbyHearingAidController finishHandoff](self, "finishHandoff");
    }
  }
  v74 = v14;
  if (!-[HUNearbyHearingAidController hasStarted](self, "hasStarted"))
    goto LABEL_57;
  if (!v12)
  {
LABEL_40:
    v29 = 0;
    v73 = 0;
    v33 = 0;
    v30 = 0;
    v32 = 1;
    v31 = 1;
    goto LABEL_59;
  }
  if (v8)
  {
    if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff") == 2)
    {
LABEL_24:
      LOBYTE(v12) = 0;
      v29 = 0;
      v30 = 0;
      v31 = 1;
      v32 = 4;
      v73 = 1;
      v33 = 1;
      goto LABEL_59;
    }
    v34 = -[HUNearbyHearingAidController processingHandoff](self, "processingHandoff");
    if (!v14)
    {
      if (v34 == 1)
      {
        HCLogHearingHandoff();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DE311000, v36, OS_LOG_TYPE_DEFAULT, "Connection request has been finished", buf, 2u);
        }

        -[HUNearbyHearingAidController finishHandoff](self, "finishHandoff");
      }
      goto LABEL_50;
    }
    if (v34 == 1)
    {
      -[HUNearbyHearingAidController processingHandoff](self, "processingHandoff");
LABEL_50:
      v29 = 0;
      v33 = 0;
      v30 = 0;
      v31 = 1;
      v32 = 5;
      LOBYTE(v12) = 1;
      goto LABEL_58;
    }
LABEL_45:
    LOBYTE(v12) = 0;
    v29 = 0;
    v33 = 0;
    v31 = 1;
    v32 = 2;
    v73 = 1;
    v30 = 1;
    goto LABEL_59;
  }
  if (v14)
  {
    if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff") != 1)
    {
      if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff") == 2)
      {
        HCLogHearingHandoff();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DE311000, v35, OS_LOG_TYPE_DEFAULT, "Connection transition has been finished", buf, 2u);
        }

        -[HUNearbyHearingAidController finishHandoff](self, "finishHandoff");
      }
      goto LABEL_45;
    }
LABEL_27:
    LOBYTE(v12) = 0;
    v33 = 0;
    v30 = 0;
    v31 = 1;
    v32 = 3;
    v29 = 1;
LABEL_58:
    v73 = 1;
    goto LABEL_59;
  }
  if (!v6)
    goto LABEL_57;
  if ((v75 & 1) == 0)
  {
    HCLogHearingHandoff();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE311000, v37, OS_LOG_TYPE_DEFAULT, "Update state to Transitioning, BT is Off", buf, 2u);
    }

    goto LABEL_24;
  }
  if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff") == 1)
    goto LABEL_27;
  if (-[HUNearbyHearingAidController processingHandoff](self, "processingHandoff") == 2)
    goto LABEL_24;
  if (-[HUNearbyHearingAidController state](self, "state") == 5
    || -[HUNearbyHearingAidController state](self, "state") == 3)
  {
    goto LABEL_27;
  }
  if (!v15 || -[HUNearbyHearingAidController state](self, "state") == 4)
  {
    LOBYTE(v12) = 0;
    goto LABEL_40;
  }
  if (-[HUNearbyHearingAidController state](self, "state") != 2)
    goto LABEL_57;
  -[HUNearbyHearingAidController peerTimer](self, "peerTimer");
  v32 = objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    -[HUNearbyHearingAidController checkPeerStateAfterTimout](self, "checkPeerStateAfterTimout");
    v31 = 0;
    LOBYTE(v12) = 0;
    v29 = 0;
    v33 = 0;
    v30 = 0;
    goto LABEL_58;
  }
  -[HUNearbyHearingAidController peerTimer](self, "peerTimer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isPending");

  if ((v39 & 1) != 0)
  {
LABEL_57:
    v31 = 0;
    LOBYTE(v12) = 0;
    v29 = 0;
    v33 = 0;
    v30 = 0;
    v32 = 0;
    goto LABEL_58;
  }
  -[HUNearbyHearingAidController setPeerTimer:](self, "setPeerTimer:", 0);
  HCLogHearingHandoff();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE311000, v70, OS_LOG_TYPE_DEFAULT, "Update state to Searching, peerTimer fired", buf, 2u);
  }

  LOBYTE(v12) = 0;
  v29 = 0;
  v73 = 0;
  v33 = 0;
  v30 = 0;
  v31 = 1;
  v32 = 1;
LABEL_59:
  if (v32 == -[HUNearbyHearingAidController state](self, "state")
    || ((v31 | v6 ^ 1) & 1) == 0 && -[HUNearbyHearingAidController hasStarted](self, "hasStarted"))
  {
    v40 = 0;
LABEL_63:
    v41 = v74;
    goto LABEL_89;
  }
  -[HUNearbyHearingAidController logAvailableDevicesWithTitle:](self, "logAvailableDevicesWithTitle:", CFSTR("Available Devices"));
  v43 = (v12 & 1) != 0
     || (-[HUNearbyHearingAidController state](self, "state") == 5 ? (v42 = 1) : (v42 = v29), (v42 & 1) != 0)
     || -[HUNearbyHearingAidController state](self, "state") == 3;
  HCLogHearingHandoff();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController descriptionForState:](self, "descriptionForState:", v32);
    v71 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController descriptionForCurrentState](self, "descriptionForCurrentState");
    v72 = v30;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController descriptionForHandoffState](self, "descriptionForHandoffState");
    v47 = v15;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v79 = v45;
    *(_WORD *)&v79[8] = 2112;
    v80 = v46;
    LOWORD(v81[0]) = 2112;
    *(_QWORD *)((char *)v81 + 2) = v48;
    _os_log_impl(&dword_1DE311000, v44, OS_LOG_TYPE_DEFAULT, "Did update state new: %@, old: %@, handoff: %@", buf, 0x20u);

    v15 = v47;
    v30 = v72;

    v43 = v71;
  }

  -[HUNearbyHearingAidController setState:](self, "setState:", v32);
  HCLogHearingHandoff();
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
  if (v43)
  {
    if (v50)
    {
      -[HUNearbyHearingAidController descriptionForCurrentState](self, "descriptionForCurrentState");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v79 = v51;
      _os_log_impl(&dword_1DE311000, v49, OS_LOG_TYPE_DEFAULT, "Sending ControllerConnected: %@, isUrgent: YES", buf, 0xCu);

    }
    v76 = &unk_1EA8FF968;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HUNearbyHearingAidController state](self, "state"));
    v49 = objc_claimAutoreleasedReturnValue();
    v77 = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController sendStateMessageToAllDevices:isUrgent:](self, "sendStateMessageToAllDevices:isUrgent:", v52, 1);
    goto LABEL_79;
  }
  if (v50)
  {
    -[HUNearbyHearingAidController descriptionForCurrentState](self, "descriptionForCurrentState");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v79 = v52;
    _os_log_impl(&dword_1DE311000, v49, OS_LOG_TYPE_DEFAULT, "Skipping sending ControllerConnected: %@", buf, 0xCu);
LABEL_79:

  }
  if ((v29 & 1) != 0 || ((v73 | v75 ^ 1) & 1) == 0)
  {
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "pairedHearingDevice");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    HCLogHearingHandoff();
    v58 = objc_claimAutoreleasedReturnValue();
    v41 = v74;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v57, "name");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "name");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v79 = v59;
      *(_WORD *)&v79[8] = 2112;
      v80 = v60;
      LOWORD(v81[0]) = 2112;
      *(_QWORD *)((char *)v81 + 2) = v61;
      _os_log_impl(&dword_1DE311000, v58, OS_LOG_TYPE_DEFAULT, "Connect to %@, Connected peer: %@, Connecting Peer: %@", buf, 0x20u);

    }
    objc_msgSend(v57, "connect");

    v40 = 1;
  }
  else
  {
    if ((v33 | v30) != 1)
    {
      v40 = 1;
      goto LABEL_63;
    }
    HCLogHearingHandoff();
    v53 = objc_claimAutoreleasedReturnValue();
    v41 = v74;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v74, "name");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v79 = v54;
      *(_WORD *)&v79[8] = 2112;
      v80 = v55;
      _os_log_impl(&dword_1DE311000, v53, OS_LOG_TYPE_DEFAULT, "Disconnect, Connected peer: %@, Connecting Peer: %@", buf, 0x16u);

    }
    v40 = 1;
    -[HUNearbyHearingAidController sendConnectionToCompanionIfPossible:](self, "sendConnectionToCompanionIfPossible:", 1);
    -[HUNearbyHearingAidController disconnectFromPairedDevice](self, "disconnectFromPairedDevice");
  }
LABEL_89:
  -[HUNearbyHearingAidController peerTimer](self, "peerTimer");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    v64 = -[HUNearbyHearingAidController state](self, "state");

    if (v64 != 2 || v41)
    {
      HCLogHearingHandoff();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        -[HUNearbyHearingAidController peerTimer](self, "peerTimer");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "isPending");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v79 = v67;
        _os_log_impl(&dword_1DE311000, v65, OS_LOG_TYPE_DEFAULT, "Cancel and Destroy peerTimer, is pending %d", buf, 8u);

      }
      -[HUNearbyHearingAidController peerTimer](self, "peerTimer");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "cancel");

      -[HUNearbyHearingAidController setPeerTimer:](self, "setPeerTimer:", 0);
    }
  }

  return v40;
}

- (void)updateState
{
  NSObject *v3;
  _QWORD block[5];

  -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HUNearbyHearingAidController_updateState__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __43__HUNearbyHearingAidController_updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStateOnDeviceQueue");
}

- (id)descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("N/A");
  else
    return off_1EA8E87E8[a3];
}

- (id)descriptionForCurrentState
{
  return -[HUNearbyHearingAidController descriptionForState:](self, "descriptionForState:", -[HUNearbyHearingAidController state](self, "state"));
}

- (id)availableDevices
{
  void *v2;
  void *v3;

  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nearbyDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)logAvailableDevicesWithTitle:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall");
  HAInitializeLogging();
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController logAvailableDevicesWithTitle:]", 1158, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      *(_DWORD *)buf = 136446210;
      v37 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[HUNearbyHearingAidController availableDevices](self, "availableDevices");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v12)
    {
      v13 = v12;
      v29 = v4;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nearbyDevice: %@"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController logAvailableDevicesWithTitle:]", 1161, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)*MEMORY[0x1E0D2F928];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_retainAutorelease(v18);
            v21 = v19;
            v22 = objc_msgSend(v20, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v37 = v22;
            _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v13);
      v4 = v29;
    }
  }
  else
  {
    -[HUNearbyHearingAidController availableDevices](self, "availableDevices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ - %@"), v4, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    obj = (id)v24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController logAvailableDevicesWithTitle:]", 1166, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_retainAutorelease(v25);
      v28 = v26;
      *(_DWORD *)buf = 136446210;
      v37 = objc_msgSend(v27, "UTF8String");
      _os_log_impl(&dword_1DE311000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

- (void)logDevices:(id)a3 withTitle:(id)a4 fullInfo:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v5)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v15, "name", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v15, "name");
          else
            objc_msgSend(v15, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_msgSend(v9, "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v12);
    }

  }
  if (objc_msgSend(v9, "count", (_QWORD)v19))
  {
    HCLogHearingHandoff();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%@ devices: %@", buf, 0x16u);
    }

  }
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)connectionStateForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  objc_msgSend(v3, "stateForDomain:", CFSTR("com.apple.hearing.hearingaids.connection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEBUG))
      -[HUNearbyHearingAidController connectionStateForDevice:].cold.1((uint64_t)v4, v5);
  }
  v6 = objc_msgSend(v4, "integerValue");

  return v6;
}

- (void)setConnectionState:(int64_t)a3 forDevice:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:forDomain:", v6, CFSTR("com.apple.hearing.hearingaids.connection"));

  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEBUG))
    -[HUNearbyHearingAidController setConnectionState:forDevice:].cold.1(v7, v5);

}

- (unint64_t)messagePriorityForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "stateForDomain:", CFSTR("com.apple.hearing.hearingaids.priority"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEBUG))
      -[HUNearbyHearingAidController messagePriorityForDevice:].cold.1((uint64_t)v4, v5);
  }
  v6 = objc_msgSend(v4, "integerValue");

  return v6;
}

- (void)setMessagePriority:(unint64_t)a3 forDevice:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  os_log_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HAInitializeLogging();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("setMessagePriority: %@ for device: %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController setMessagePriority:forDevice:]", 1235, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_log_t *)MEMORY[0x1E0D2F928];
  v12 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v10);
    v14 = v12;
    *(_DWORD *)buf = 136446210;
    v18 = objc_msgSend(v13, "UTF8String");
    _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:forDomain:", v15, CFSTR("com.apple.hearing.hearingaids.priority"));

  v16 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
    -[HUNearbyHearingAidController setMessagePriority:forDevice:].cold.1(v16, v5);

}

- (id)peerWithState:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];

  -[HUNearbyHearingAidController availableDevices](self, "availableDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__HUNearbyHearingAidController_peerWithState___block_invoke;
  v9[3] = &unk_1EA8E86B8;
  v9[4] = self;
  v9[5] = a3;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

BOOL __46__HUNearbyHearingAidController_peerWithState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "connectionStateForDevice:", v3);
  if (v4 == 3)
  {
    HCLogHearingHandoff();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __46__HUNearbyHearingAidController_peerWithState___block_invoke_cold_1(v3, v5);

  }
  v6 = v4 == *(_QWORD *)(a1 + 40);

  return v6;
}

- (id)connectedPeer
{
  return -[HUNearbyHearingAidController peerWithState:](self, "peerWithState:", 5);
}

- (id)connectingPeer
{
  return -[HUNearbyHearingAidController peerWithState:](self, "peerWithState:", 3);
}

- (BOOL)isPeerConnectedToHearingDevice
{
  HUNearbyHearingAidController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HUNearbyHearingAidController connectedPeer](self, "connectedPeer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Checking connection %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyHearingAidController logAvailableDevicesWithTitle:](v2, "logAvailableDevicesWithTitle:", v5);

  -[HUNearbyHearingAidController connectedPeer](v2, "connectedPeer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v6 != 0;

  return (char)v2;
}

- (void)checkPeerStateAfterTimout
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD v10[5];

  -[HUNearbyHearingAidController peerTimer](self, "peerTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CF3978]);
    -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithTargetSerialQueue:", v5);
    -[HUNearbyHearingAidController setPeerTimer:](self, "setPeerTimer:", v6);

    -[HUNearbyHearingAidController peerTimer](self, "peerTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__HUNearbyHearingAidController_checkPeerStateAfterTimout__block_invoke;
    v10[3] = &unk_1EA8E8220;
    v10[4] = self;
    objc_msgSend(v7, "afterDelay:processBlock:", v10, 7.5);

    HCLogHearingHandoff();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "Starting peerTimer for Peer state", v9, 2u);
    }

  }
}

uint64_t __57__HUNearbyHearingAidController_checkPeerStateAfterTimout__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  HCLogHearingHandoff();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_DEFAULT, "peerTimer fired, We want to check the state", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "updateStateOnDeviceQueue");
}

- (void)connectedPeerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__HUNearbyHearingAidController_connectedPeerWithCompletion___block_invoke;
    v6[3] = &unk_1EA8E86E0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __60__HUNearbyHearingAidController_connectedPeerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "connectedPeer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)urgentDevicesFromDevices:(id)a3
{
  return -[HUNearbyHearingAidController devicesFromDevices:withMessagePriority:](self, "devicesFromDevices:withMessagePriority:", a3, 0);
}

- (id)defaultDevicesFromDevices:(id)a3
{
  return -[HUNearbyHearingAidController devicesFromDevices:withMessagePriority:](self, "devicesFromDevices:withMessagePriority:", a3, 1);
}

- (id)devicesFromDevices:(id)a3 withMessagePriority:(unint64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__HUNearbyHearingAidController_devicesFromDevices_withMessagePriority___block_invoke;
  v5[3] = &unk_1EA8E86B8;
  v5[4] = self;
  v5[5] = a4;
  objc_msgSend(a3, "ax_filteredArrayUsingBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __71__HUNearbyHearingAidController_devicesFromDevices_withMessagePriority___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  _BOOL8 v8;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "connectionStateForDevice:", v3);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    v6 = 0;
  else
    v6 = v4 == 5;
  if (v6)
    v8 = 1;
  else
    v8 = (v5 != 1 || v4 != 5) && objc_msgSend(*(id *)(a1 + 32), "messagePriorityForDevice:", v3) == *(_QWORD *)(a1 + 40);

  return v8;
}

- (id)hearingDevice
{
  void *v3;
  void *v4;
  void *v5;
  AXRemoteHearingAidDevice *v6;

  -[HUNearbyHearingAidController localDevice](self, "localDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairedHearingAids");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[AXRemoteHearingAidDevice initWithPersistentRepresentation:]([AXRemoteHearingAidDevice alloc], "initWithPersistentRepresentation:", v5);
      -[AXRemoteHearingAidDevice setUpdateDelegate:](v6, "setUpdateDelegate:", self);
      -[HUNearbyHearingAidController setLocalDevice:](self, "setLocalDevice:", v6);

    }
  }
  return v3;
}

- (void)sendMessagesPriorityHigh
{
  NSObject *v3;
  _QWORD block[5];

  -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HUNearbyHearingAidController_sendMessagesPriorityHigh__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __56__HUNearbyHearingAidController_sendMessagesPriorityHigh__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagesPriorityTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  result = objc_msgSend(*(id *)(a1 + 32), "deviceMessagePriority");
  if (result)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC received MessagesPriority High"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController sendMessagesPriorityHigh]_block_invoke", 1365, v4);
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
    return objc_msgSend(*(id *)(a1 + 32), "sendMessagesPriority:", 0);
  }
  return result;
}

- (void)sendMessagesPriorityDefault
{
  NSObject *v3;
  _QWORD block[5];

  -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HUNearbyHearingAidController_sendMessagesPriorityDefault__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(v3, block);

}

void __59__HUNearbyHearingAidController_sendMessagesPriorityDefault__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "deviceMessagePriority") != 1)
  {
    HAInitializeLogging();
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "messagesPriorityTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isPending"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("XPC received MessagesPriority Default, push scheduled: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController sendMessagesPriorityDefault]_block_invoke", 1376, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v7);
      v10 = v8;
      *(_DWORD *)buf = 136446210;
      v16 = objc_msgSend(v9, "UTF8String");
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "messagesPriorityTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isPending");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "messagesPriorityTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__HUNearbyHearingAidController_sendMessagesPriorityDefault__block_invoke_122;
      v14[3] = &unk_1EA8E8220;
      v14[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v13, "afterDelay:processBlock:", v14, 6.0);

    }
  }
}

uint64_t __59__HUNearbyHearingAidController_sendMessagesPriorityDefault__block_invoke_122(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendMessagesPriority:", 1);
}

- (void)sendMessagesPriority:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HUNearbyHearingAidController setDeviceMessagePriority:](self, "setDeviceMessagePriority:", a3);
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedHearingAids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    HAInitializeLogging();
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[HUNearbyHearingAidController descriptionForCurrentMessagePriority](self, "descriptionForCurrentMessagePriority");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("IDS Sending MessagesPriority %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController sendMessagesPriority:]", 1392, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v9);
      v12 = v10;
      *(_DWORD *)buf = 136446210;
      v18 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v15 = &unk_1EA8FF980;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUNearbyHearingAidController deviceMessagePriority](self, "deviceMessagePriority"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController sendMessageToAllDevices:messagePriority:](self, "sendMessageToAllDevices:messagePriority:", v14, 1);

  }
}

- (id)descriptionForCurrentMessagePriority
{
  if (self->_deviceMessagePriority)
    return CFSTR("Default");
  else
    return CFSTR("High");
}

- (void)sendConnectionUpdateToPeers
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedHearingAids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__HUNearbyHearingAidController_sendConnectionUpdateToPeers__block_invoke;
    block[3] = &unk_1EA8E8220;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __59__HUNearbyHearingAidController_sendConnectionUpdateToPeers__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sendConnectionToCompanionIfPossible");
  objc_msgSend(*(id *)(a1 + 32), "updateStateOnDeviceQueue");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableRemoteControllersDidChange");

}

- (void)sendStateMessageToAllDevices:(id)a3 isUrgent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[HUNearbyHearingAidController setIdsMessagesCount:](self, "setIdsMessagesCount:", -[HUNearbyHearingAidController idsMessagesCount](self, "idsMessagesCount") + 1);
  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v4)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(v7, "sendMessage:toDevicesWithDomain:withPriority:", v6, CFSTR("com.apple.hearing.hearingaids"), v8);

}

- (void)sendMessageToAllDevices:(id)a3 messagePriority:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendMessage:toDevicesWithDomain:withPriority:", v5, CFSTR("com.apple.hearing.hearingaids"), a4);

}

- (void)sendStateMessage:(id)a3 toDevices:(id)a4 isUrgent:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[HUNearbyHearingAidController setIdsMessagesCount:](self, "setIdsMessagesCount:", -[HUNearbyHearingAidController idsMessagesCount](self, "idsMessagesCount") + 1);
  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v5)
    v11 = 1;
  else
    v11 = 2;
  objc_msgSend(v10, "sendMessage:withDomain:toDevices:withPriority:", v9, CFSTR("com.apple.hearing.hearingaids"), v8, v11);

}

- (void)sendMessage:(id)a3 toDevices:(id)a4 messagePriority:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMessage:withDomain:toDevices:withPriority:", v8, CFSTR("com.apple.hearing.hearingaids"), v7, a5);

}

- (void)sendMessage:(id)a3 toDevices:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessage:withDomain:toDevices:withPriority:", v6, CFSTR("com.apple.hearing.hearingaids"), v5, 1);

}

- (void)sendWriteToAllDevices:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke;
  v7[3] = &unk_1EA8E81F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "lastSentPropertyUpdates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToDictionary:", *(_QWORD *)(a1 + 40));

  v4 = *MEMORY[0x1E0D2F928];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEBUG);
  if ((v3 & 1) != 0)
  {
    if (v5)
      __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    if (v5)
      __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke_cold_2((uint64_t *)(a1 + 40), v4, v7);
    objc_msgSend(*(id *)(a1 + 32), "setLastSentPropertyUpdates:", *(_QWORD *)(a1 + 40));
    v14 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v14, "availableDevices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendWrite:toDevices:", v13, v15);

  }
}

- (void)sendWrite:(id)a3 toDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "count"))
  {
    v9 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithObject:forKey:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUNearbyHearingAidController urgentDevicesFromDevices:](self, "urgentDevicesFromDevices:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending Properties to urgent devices: %@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController sendWrite:toDevices:]", 1471, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_retainAutorelease(v14);
        v17 = v15;
        *(_DWORD *)buf = 136446210;
        v22 = objc_msgSend(v16, "UTF8String");
        _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      -[HUNearbyHearingAidController sendMessage:toDevices:](self, "sendMessage:toDevices:", v11, v12);
    }
    -[HUNearbyHearingAidController collectPropertyUpdatesFromPayload:](self, "collectPropertyUpdatesFromPayload:", v6);
    -[HUNearbyHearingAidController sendPropertyUpdatesLowTimer](self, "sendPropertyUpdatesLowTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__HUNearbyHearingAidController_sendWrite_toDevices___block_invoke;
    v19[3] = &unk_1EA8E81F8;
    v19[4] = self;
    v20 = v8;
    objc_msgSend(v18, "afterDelay:processBlock:", v19, 4.0);

  }
}

void __52__HUNearbyHearingAidController_sendWrite_toDevices___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "defaultDevicesFromDevices:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectedPropertyUpdates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(*(id *)(a1 + 32), "collectedPropertyUpdates");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 8);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dictionaryWithObject:forKey:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "sendMessage:toDevices:messagePriority:", v9, v2, 2);
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending Properties:\n%@\nto default devices:\n%@"), v9, v2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController sendWrite:toDevices:]_block_invoke", 1482, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_retainAutorelease(v11);
        v14 = v12;
        *(_DWORD *)buf = 136446210;
        v17 = objc_msgSend(v13, "UTF8String");
        _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "collectedPropertyUpdates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeAllObjects");

    }
  }

}

- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5 toDevices:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10 && objc_msgSend(v11, "length"))
  {
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController sendWrite:toDevices:](self, "sendWrite:toDevices:", v15, v12);

  }
}

- (void)collectPropertyUpdatesFromPayload:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__HUNearbyHearingAidController_collectPropertyUpdatesFromPayload___block_invoke;
  v3[3] = &unk_1EA8E8708;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __66__HUNearbyHearingAidController_collectPropertyUpdatesFromPayload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "collectedPropertyUpdates");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      if (!v8)
        v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "addEntriesFromDictionary:", v5);
      objc_msgSend(*(id *)(a1 + 32), "collectedPropertyUpdates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v10);

    }
  }

}

- (id)device:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  HUNearbyHearingAidController *v22;
  __int128 *p_buf;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  id v29;
  __int128 buf;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld== %@ - %@"), -[HUNearbyHearingAidController state](self, "state"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController device:didReceiveMessage:]", 1520, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__HUNearbyHearingAidController_device_didReceiveMessage___block_invoke;
  v20[3] = &unk_1EA8E8730;
  v14 = v6;
  v21 = v14;
  v22 = self;
  p_buf = &buf;
  v24 = &v25;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v20);
  if (v14 && *(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUNearbyHearingAidController deviceMessagePriority](self, "deviceMessagePriority"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, &unk_1EA8FF980);

    if (!*((_BYTE *)v26 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HUNearbyHearingAidController state](self, "state"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v17, &unk_1EA8FF968);

    }
    v29 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController sendStateMessage:toDevices:isUrgent:](self, "sendStateMessage:toDevices:isUrgent:", v15, v18, 1);

  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&buf, 8);

  return v13;
}

void __57__HUNearbyHearingAidController_device_didReceiveMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedLongLongValue");
  if (v6 < 0x8000)
  {
    if (v6 == 8)
    {
      objc_msgSend(*(id *)(a1 + 40), "processWriteMessageWithValue:", v5);
      goto LABEL_20;
    }
    if (v6 == 16)
    {
      objc_msgSend(*(id *)(a1 + 40), "processReadMessageFromPeerDevice:value:", *(_QWORD *)(a1 + 32), v5);
      goto LABEL_20;
    }
    if (v6 != 4096)
      goto LABEL_20;
    goto LABEL_12;
  }
  switch(v6)
  {
    case 0x8000:
      objc_msgSend(*(id *)(a1 + 40), "processHandoffMessageFromPeer:state:", *(_QWORD *)(a1 + 32), v5);
      break;
    case 0x20000:
      HAInitializeLogging();
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("IDS Received HCMessageIdentifierMessagesPriority: %@ from device: %@"), v5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController device:didReceiveMessage:]_block_invoke", 1557, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_retainAutorelease(v13);
        v16 = v14;
        *(_DWORD *)buf = 136446210;
        v18 = objc_msgSend(v15, "UTF8String");
        _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(*(id *)(a1 + 40), "setMessagePriority:forDevice:", objc_msgSend(v5, "integerValue"), *(_QWORD *)(a1 + 32));
      break;
    case 0x80000:
      HCLogHearingHandoff();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "descriptionForCurrentState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = (uint64_t)v8;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "Received CheckIn from device: %@, current state: %@", buf, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_12:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "processStateMessageFromPeer:state:", *(_QWORD *)(a1 + 32), v5);
      break;
  }
LABEL_20:

}

- (void)updateResponse:(id)a3 withState:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(v6, "objectForKey:", &unk_1EA8FF968);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[HUNearbyHearingAidController setIdsMessagesCount:](self, "setIdsMessagesCount:", -[HUNearbyHearingAidController idsMessagesCount](self, "idsMessagesCount") + 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, &unk_1EA8FF968);

}

- (void)validateResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", &unk_1EA8FF968);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
    if (v7 != -[HUNearbyHearingAidController state](self, "state"))
      -[HUNearbyHearingAidController updateResponse:withState:](self, "updateResponse:withState:", v4, -[HUNearbyHearingAidController state](self, "state"));
    HCLogHearingHandoff();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[HUNearbyHearingAidController descriptionForCurrentState](self, "descriptionForCurrentState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "Response ControllerConnected state: %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)processHandoffMessageFromPeer:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  dispatch_time_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HCLogHearingHandoff();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNearbyHearingAidController timeStamp](self, "timeStamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = (uint64_t)v7;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "Received ControllerConnectWithReason: %@, time: %@, from device: %@", buf, 0x20u);

  }
  v11 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 1;
    goto LABEL_8;
  }
  v12 = objc_msgSend(v11, "integerValue");
  v13 = v12;
  if ((unint64_t)(v12 - 1) < 5)
  {
LABEL_8:
    -[HUNearbyHearingAidController relinquishConnectionForReason:toDevice:](self, "relinquishConnectionForReason:toDevice:", v13, v6);
    goto LABEL_9;
  }
  if (!v12)
  {
    v14 = dispatch_time(0, 1000000000);
    -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HUNearbyHearingAidController_processHandoffMessageFromPeer_state___block_invoke;
    block[3] = &unk_1EA8E8220;
    block[4] = self;
    dispatch_after(v14, v15, block);

  }
LABEL_9:
  -[HUNearbyHearingAidController delegate](self, "delegate", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HUNearbyHearingAidController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "availableRemoteControllersDidChange");

    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Handoff requested. Updated available controllers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController processHandoffMessageFromPeer:state:]", 1645, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_retainAutorelease(v19);
      v22 = v20;
      v23 = objc_msgSend(v21, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v26 = v23;
      _os_log_impl(&dword_1DE311000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

uint64_t __68__HUNearbyHearingAidController_processHandoffMessageFromPeer_state___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestConnection");
}

- (BOOL)processStateMessageFromPeer:(id)a3 state:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(a4, "integerValue");
  HCLogHearingHandoff();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyHearingAidController descriptionForState:](self, "descriptionForState:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = (uint64_t)v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "Received ControllerConnected peer: %@, peer state: %@", buf, 0x16u);

  }
  -[HUNearbyHearingAidController setConnectionState:forDevice:](self, "setConnectionState:forDevice:", v7, v6);
  v11 = -[HUNearbyHearingAidController updateStateOnDeviceQueue](self, "updateStateOnDeviceQueue");
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isConnected");

  if ((v13 & 1) == 0)
  {
    -[HUNearbyHearingAidController hearingDevice](self, "hearingDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "didLoadRequiredPeerProperties");

    if ((v15 & 1) == 0)
    {
      -[HUNearbyHearingAidController hearingDevice](self, "hearingDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "loadRequiredProperties");

    }
  }
  -[HUNearbyHearingAidController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HUNearbyHearingAidController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "availableRemoteControllersDidChange");

    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Controller state changed. Updated available controllers"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController processStateMessageFromPeer:state:]", 1672, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_retainAutorelease(v20);
      v23 = v21;
      v24 = objc_msgSend(v22, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v27 = v24;
      _os_log_impl(&dword_1DE311000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

  return v11;
}

- (void)processReadMessageFromPeerDevice:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[AXHAController sharedController](AXHAController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairedDeviceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[HUNearbyHearingAidController state](self, "state") == 5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __71__HUNearbyHearingAidController_processReadMessageFromPeerDevice_value___block_invoke;
        v18[3] = &unk_1EA8E8758;
        v18[4] = self;
        v19 = v6;
        objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v18);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[HUNearbyHearingAidController processReadProperty:fromPeerDevice:](self, "processReadProperty:fromPeerDevice:", v7, v6);
      }
    }
    else if (-[HUNearbyHearingAidController state](self, "state") == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "integerValue") == 0x1000000)
      {
        -[HUNearbyHearingAidController hearingDevice](self, "hearingDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueForProperty:", 0x1000000);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUNearbyHearingAidController writeValue:forProperty:andDeviceID:toDevices:](self, "writeValue:forProperty:andDeviceID:toDevices:", v16, 0x1000000, v9, v17);

      }
    }
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asking for device property read but device is nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController processReadMessageFromPeerDevice:value:]", 1686, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v11);
      v14 = v12;
      *(_DWORD *)buf = 136446210;
      v22 = objc_msgSend(v13, "UTF8String");
      _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

uint64_t __71__HUNearbyHearingAidController_processReadMessageFromPeerDevice_value___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processReadProperty:fromPeerDevice:", a2, *(_QWORD *)(a1 + 40));
}

- (void)processReadProperty:(id)a3 fromPeerDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[AXHAController sharedController](AXHAController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairedDeviceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "unsignedLongLongValue");
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForProperty:forDeviceID:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUNearbyHearingAidController writeValue:forProperty:andDeviceID:toDevices:](self, "writeValue:forProperty:andDeviceID:toDevices:", v12, v10, v9, v13);
}

- (void)processWriteMessageWithValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUNearbyHearingAidController *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  HUNearbyHearingAidController *v24;
  _QWORD v25[4];
  HUNearbyHearingAidController *v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AXHAController sharedController](AXHAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairedDeviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count") == 1)
  {
    if (-[HUNearbyHearingAidController state](self, "state") == 5)
    {
      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hearingAidForDeviceID:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v9 = (HUNearbyHearingAidController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUNearbyHearingAidController hearingDevice](self, "hearingDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      if (-[HUNearbyHearingAidController isPeerConnectedToHearingDevice](v9, "isPeerConnectedToHearingDevice"))
        v10 = &unk_1EA8FF9B0;
      else
        v10 = &unk_1EA8FF998;
      objc_msgSend(v8, "setValue:forProperty:", v10, 0x200000);
    }
    v11 = v4;
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (v15)
    {
      objc_msgSend(v8, "deviceUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v17;
    }
    else
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown device ID %@ - %@"), v8, v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController processWriteMessageWithValue:]", 1750, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_retainAutorelease(v19);
        v22 = v20;
        *(_DWORD *)buf = 136446210;
        v29 = objc_msgSend(v21, "UTF8String");
        _os_log_impl(&dword_1DE311000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __61__HUNearbyHearingAidController_processWriteMessageWithValue___block_invoke;
    v25[3] = &unk_1EA8E8758;
    v26 = v9;
    v27 = v8;
    v23 = v8;
    v24 = v9;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v25);

  }
}

void __61__HUNearbyHearingAidController_processWriteMessageWithValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedLongLongValue");
  if (v6 != 0x200000)
  {
    v7 = v6;
    v8 = v5;
    if (propertyContainsProperty(v7, 0x200000))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "removeObjectForKey:", &unk_1EA8FF9C8);
        v8 = v9;
      }
    }
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating controller %@"), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController processWriteMessageWithValue:]_block_invoke", 1765, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v11);
      v14 = v12;
      *(_DWORD *)buf = 136446210;
      v16 = objc_msgSend(v13, "UTF8String");
      _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "setValue:forProperty:", v8, v7);
    objc_msgSend(*(id *)(a1 + 32), "device:didUpdateProperty:", *(_QWORD *)(a1 + 40), v7);

  }
}

- (id)hearingAidForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  -[HUNearbyHearingAidController hearingDevice](self, "hearingDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    -[HUNearbyHearingAidController hearingDevice](self, "hearingDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)updateProperty:(unint64_t)a3 forDeviceID:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  objc_super v14;
  _QWORD v15[6];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isiCloudPaired");

  if ((v8 & 1) != 0)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Don't request properties, iCloudPaired"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController updateProperty:forDeviceID:]", 1801, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v10);
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__HUNearbyHearingAidController_updateProperty_forDeviceID___block_invoke;
    v15[3] = &unk_1EA8E8588;
    v15[4] = self;
    v15[5] = a3;
    -[HUNearbyHearingAidController connectedPeerWithCompletion:](self, "connectedPeerWithCompletion:", v15);
  }
  v14.receiver = self;
  v14.super_class = (Class)HUNearbyHearingAidController;
  -[HUDeviceController updateProperty:forDeviceID:](&v14, sel_updateProperty_forDeviceID_, a3, v6);

}

void __59__HUNearbyHearingAidController_updateProperty_forDeviceID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && *(_QWORD *)(a1 + 40) != 0x1000000)
  {
    HAInitializeLogging();
    v4 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(*(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("IDS Requesting property %@ from device %@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController updateProperty:forDeviceID:]_block_invoke", 1794, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      *(_DWORD *)buf = 136446210;
      v22 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "deviceMessagePriority"))
      v17 = 2;
    else
      v17 = 1;
    objc_msgSend(v12, "sendMessage:toDevices:messagePriority:", v15, v16, v17);

  }
}

- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD block[5];
  id v27;
  id v28;
  unint64_t v29;
  objc_super v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[HUNearbyHearingAidController hearingAidForDeviceID:](self, "hearingAidForDeviceID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForProperty:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v8);

  HAInitializeLogging();
  v13 = (void *)MEMORY[0x1E0CB3940];
  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping write because value didn't change"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController writeValue:forProperty:andDeviceID:]", 1821, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v15);
      v18 = v16;
      *(_DWORD *)buf = 136446210;
      v32 = objc_msgSend(v17, "UTF8String");
      _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v10, "valueForProperty:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Writing %@ = %@"), v19, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNearbyHearingAidController writeValue:forProperty:andDeviceID:]", 1813, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_retainAutorelease(v21);
      v24 = v22;
      *(_DWORD *)buf = 136446210;
      v32 = objc_msgSend(v23, "UTF8String");
      _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v30.receiver = self;
    v30.super_class = (Class)HUNearbyHearingAidController;
    -[HUDeviceController writeValue:forProperty:andDeviceID:](&v30, sel_writeValue_forProperty_andDeviceID_, v8, a4, v9);
    -[HUDeviceController deviceUpdatesQueue](self, "deviceUpdatesQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HUNearbyHearingAidController_writeValue_forProperty_andDeviceID___block_invoke;
    block[3] = &unk_1EA8E8780;
    block[4] = self;
    v27 = v8;
    v29 = a4;
    v28 = v9;
    dispatch_async(v25, block);

  }
}

void __67__HUNearbyHearingAidController_writeValue_forProperty_andDeviceID___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v4 = a1[6];
  v3 = a1[7];
  objc_msgSend(v1, "availableDevices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "writeValue:forProperty:andDeviceID:toDevices:", v2, v3, v4, v5);

}

- (BOOL)representsLocalDevices
{
  return 0;
}

- (int64_t)state
{
  return self->_state;
}

- (HUNearbyHearingAidControllerDelegate)delegate
{
  return (HUNearbyHearingAidControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (AXRemoteHearingAidDevice)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_localDevice, a3);
}

- (OS_dispatch_queue)mediaQueue
{
  return self->_mediaQueue;
}

- (void)setMediaQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mediaQueue, a3);
}

- (AXDispatchTimer)sendConnectionToCompanionTimer
{
  return self->_sendConnectionToCompanionTimer;
}

- (void)setSendConnectionToCompanionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sendConnectionToCompanionTimer, a3);
}

- (BOOL)holdingMediaForConnection
{
  return self->_holdingMediaForConnection;
}

- (void)setHoldingMediaForConnection:(BOOL)a3
{
  self->_holdingMediaForConnection = a3;
}

- (BOOL)holdingPhoneForConnection
{
  return self->_holdingPhoneForConnection;
}

- (void)setHoldingPhoneForConnection:(BOOL)a3
{
  self->_holdingPhoneForConnection = a3;
}

- (unint64_t)idsMessagesCount
{
  return self->_idsMessagesCount;
}

- (void)setIdsMessagesCount:(unint64_t)a3
{
  self->_idsMessagesCount = a3;
}

- (NSTimer)idsMessagesTimer
{
  return self->_idsMessagesTimer;
}

- (void)setIdsMessagesTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idsMessagesTimer, a3);
}

- (int64_t)processingHandoff
{
  return self->_processingHandoff;
}

- (void)setProcessingHandoff:(int64_t)a3
{
  self->_processingHandoff = a3;
}

- (int64_t)handoffReason
{
  return self->_handoffReason;
}

- (void)setHandoffReason:(int64_t)a3
{
  self->_handoffReason = a3;
}

- (AXDispatchTimer)handoffTimer
{
  return self->_handoffTimer;
}

- (void)setHandoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_handoffTimer, a3);
}

- (id)relinquishCompleted
{
  return self->_relinquishCompleted;
}

- (void)setRelinquishCompleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (AXDispatchTimer)peerTimer
{
  return self->_peerTimer;
}

- (void)setPeerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_peerTimer, a3);
}

- (unint64_t)deviceMessagePriority
{
  return self->_deviceMessagePriority;
}

- (void)setDeviceMessagePriority:(unint64_t)a3
{
  self->_deviceMessagePriority = a3;
}

- (HUSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_sessionManager, a3);
}

- (NSDictionary)lastSentPropertyUpdates
{
  return self->_lastSentPropertyUpdates;
}

- (void)setLastSentPropertyUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_lastSentPropertyUpdates, a3);
}

- (AXDispatchTimer)sendPropertyUpdatesLowTimer
{
  return self->_sendPropertyUpdatesLowTimer;
}

- (void)setSendPropertyUpdatesLowTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sendPropertyUpdatesLowTimer, a3);
}

- (NSMutableDictionary)collectedPropertyUpdates
{
  return self->_collectedPropertyUpdates;
}

- (void)setCollectedPropertyUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_collectedPropertyUpdates, a3);
}

- (AXDispatchTimer)messagesPriorityTimer
{
  return self->_messagesPriorityTimer;
}

- (void)setMessagesPriorityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_messagesPriorityTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesPriorityTimer, 0);
  objc_storeStrong((id *)&self->_collectedPropertyUpdates, 0);
  objc_storeStrong((id *)&self->_sendPropertyUpdatesLowTimer, 0);
  objc_storeStrong((id *)&self->_lastSentPropertyUpdates, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_peerTimer, 0);
  objc_storeStrong(&self->_relinquishCompleted, 0);
  objc_storeStrong((id *)&self->_handoffTimer, 0);
  objc_storeStrong((id *)&self->_idsMessagesTimer, 0);
  objc_storeStrong((id *)&self->_sendConnectionToCompanionTimer, 0);
  objc_storeStrong((id *)&self->_mediaQueue, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DE311000, a1, a3, "Processing handoff for Media", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __55__HUNearbyHearingAidController_mediaPlaybackDidChange___block_invoke_cold_2(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DE311000, a2, OS_LOG_TYPE_DEBUG, "mediaPlaybackDidChange isPlaying %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)connectionStateForDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_5(), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DE311000, v2, v6, "connectionStateForDevice %@ %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_0();
}

- (void)setConnectionState:(void *)a1 forDevice:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v2;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  objc_msgSend(a2, "stateForDomain:", CFSTR("com.apple.hearing.hearingaids.connection"));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5(), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v2;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DE311000, v4, v6, "setConnectionState %@ %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_0();
}

- (void)messagePriorityForDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_5(), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DE311000, v2, v6, "messagePriorityForDevice %@ %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_0();
}

- (void)setMessagePriority:(void *)a1 forDevice:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v2;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  objc_msgSend(a2, "stateForDomain:", CFSTR("com.apple.hearing.hearingaids.priority"));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5(), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v2;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1DE311000, v4, v6, "setMessagePriority %@ %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_0();
}

void __46__HUNearbyHearingAidController_peerWithState___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_6(&dword_1DE311000, a2, v4, "PeerConnecting: %@", (uint8_t *)&v5);

}

void __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DE311000, a1, a3, "sendWriteToAllDevices Skip", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __54__HUNearbyHearingAidController_sendWriteToAllDevices___block_invoke_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_6(&dword_1DE311000, a2, a3, "sendWriteToAllDevices payload:\n%@", (uint8_t *)&v4);
}

@end
