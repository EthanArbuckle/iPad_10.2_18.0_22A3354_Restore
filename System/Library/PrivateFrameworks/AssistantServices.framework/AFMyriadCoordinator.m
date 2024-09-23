@implementation AFMyriadCoordinator

- (AFMyriadCoordinator)initWithDelegate:(id)a3
{
  id v4;
  char *v5;
  NSObject *v6;
  AFMyriadCoordinator *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  void *v24;
  dispatch_queue_t v25;
  void *v26;
  AFMyriadAdvertisementContextManager *v27;
  void *v28;
  void *v29;
  AFMyriadInstrumentation *v30;
  void *v31;
  AFMyriadGoodnessScoreEvaluator *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  AFMyriadPreferences *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  void *v41;
  AFPowerAssertionManager *v42;
  void *v43;
  NSObject *v44;
  int v45;
  int v46;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  AFMyriadEmergencyCallPunchout *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  char *v62;
  NSObject *v63;
  void *v64;
  AFNotifyStatePublisher *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  AFNotifyStatePublisher *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  AFNotifyStatePublisher *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  AFNotifyStatePublisher *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  AFArbitrationParticipationController *v85;
  void *v86;
  void *v87;
  _QWORD v89[4];
  char *v90;
  objc_super v91;
  uint8_t buf[4];
  const char *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  int v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)AFMyriadCoordinator;
  v5 = -[AFMyriadCoordinator init](&v91, sel_init);
  if (!v5)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_22;
  }
  if (_currentCoordinator)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v93 = "-[AFMyriadCoordinator initWithDelegate:]";
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s Attempt to initialize MyriadCoordinator when one already exists.", buf, 0xCu);
    }
    goto LABEL_5;
  }
  kdebug_trace();
  *((_QWORD *)v5 + 2) = 0;
  *((_QWORD *)v5 + 3) = 0;
  *((_QWORD *)v5 + 1) = 0;
  objc_storeWeak((id *)v5 + 11, v4);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  v9 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v8;

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  v11 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v10;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  v13 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v12;

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  v15 = (void *)*((_QWORD *)v5 + 9);
  *((_QWORD *)v5 + 9) = v14;

  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  v17 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v16;

  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  v19 = (void *)*((_QWORD *)v5 + 10);
  *((_QWORD *)v5 + 10) = v18;

  v20 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = 0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_USER_INTERACTIVE, 0);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = dispatch_queue_create((const char *)myriad_work_queue_label, v22);
  v24 = (void *)*((_QWORD *)v5 + 22);
  *((_QWORD *)v5 + 22) = v23;

  v25 = dispatch_queue_create((const char *)myriad_context_queue_label, v22);
  v26 = (void *)*((_QWORD *)v5 + 23);
  *((_QWORD *)v5 + 23) = v25;

  if (*((_QWORD *)v5 + 23))
  {
    v27 = -[AFMyriadAdvertisementContextManager initWithQueue:]([AFMyriadAdvertisementContextManager alloc], "initWithQueue:", *((_QWORD *)v5 + 23));
    v28 = (void *)*((_QWORD *)v5 + 61);
    *((_QWORD *)v5 + 61) = v27;

  }
  +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(AFMyriadInstrumentation);
  v31 = (void *)*((_QWORD *)v5 + 76);
  *((_QWORD *)v5 + 76) = v30;

  v32 = [AFMyriadGoodnessScoreEvaluator alloc];
  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[AFMyriadGoodnessScoreEvaluator initWithDeviceInstanceContext:preferences:queue:instrumentation:](v32, "initWithDeviceInstanceContext:preferences:queue:instrumentation:", v29, v33, *((_QWORD *)v5 + 22), *((_QWORD *)v5 + 76));
  v35 = (void *)*((_QWORD *)v5 + 63);
  *((_QWORD *)v5 + 63) = v34;

  objc_msgSend(*((id *)v5 + 63), "setLastActivationTime:", 0.0);
  v36 = [AFMyriadPreferences alloc];
  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[AFMyriadPreferences initWithDeviceInstanceContext:preferences:](v36, "initWithDeviceInstanceContext:preferences:", v29, v37);
  v39 = (void *)*((_QWORD *)v5 + 72);
  *((_QWORD *)v5 + 72) = v38;

  v5[318] = objc_msgSend(*((id *)v5 + 72), "coordinationEnabled");
  v5[319] = objc_msgSend(*((id *)v5 + 72), "BLEActivityEnabled");
  v5[168] = objc_msgSend(*((id *)v5 + 72), "deviceGroup");
  objc_msgSend(*((id *)v5 + 72), "deviceSlowDown");
  *((_DWORD *)v5 + 75) = (int)(v40 * 1000.0);
  *((_WORD *)v5 + 156) = 0;
  v5[418] = 0;
  v5[314] = 0;
  *(_WORD *)(v5 + 325) = 0;
  *((_WORD *)v5 + 164) = 0;
  *(_WORD *)(v5 + 321) = 0;
  v5[330] = 0;
  v41 = (void *)*((_QWORD *)v5 + 78);
  *((_QWORD *)v5 + 78) = 0;

  v5[280] = 0;
  *((_DWORD *)v5 + 74) = 0;
  v42 = -[AFPowerAssertionManager initWithIdentifier:]([AFPowerAssertionManager alloc], "initWithIdentifier:", CFSTR("com.apple.assistant.myriad"));
  v43 = (void *)*((_QWORD *)v5 + 28);
  *((_QWORD *)v5 + 28) = v42;

  v44 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v45 = v5[318];
    v46 = v5[319];
    *(_DWORD *)buf = 136315650;
    v93 = "-[AFMyriadCoordinator initWithDelegate:]";
    v94 = 1024;
    v95 = v45;
    v96 = 1024;
    v97 = v46;
    _os_log_impl(&dword_19AF50000, v44, OS_LOG_TYPE_INFO, "%s #myriad coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)notificationCallback, CFSTR("com.apple.siri.myriad.apayload"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)outputTriggerSeenCallback, CFSTR("com.apple.siri.corespeech.selftrigger"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)emergencyCallback, CFSTR("com.apple.siri.myriad.falseemergency"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)myriadDecisionRequestCallback, CFSTR("com.apple.siri.myriad.get.decision"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)inEarTriggerSeenCallback, CFSTR("com.apple.siri.myriad.in.ear"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)carplayTriggerSeenCallback, CFSTR("com.apple.siri.myriad.jarvis"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)*((_QWORD *)v5 + 45);
  *((_QWORD *)v5 + 45) = v48;

  v50 = (void *)*((_QWORD *)v5 + 30);
  *((_QWORD *)v5 + 30) = 0;

  *((_QWORD *)v5 + 31) = 0;
  *((_QWORD *)v5 + 32) = 0;
  *((_QWORD *)v5 + 33) = 0;
  objc_storeStrong((id *)&_currentCoordinator, v5);
  v5[320] = 0;
  v5[327] = 0;
  v51 = (void *)*((_QWORD *)v5 + 24);
  *((_QWORD *)v5 + 24) = &stru_1E3A37708;

  *((_QWORD *)v5 + 34) = 0;
  v52 = (void *)*((_QWORD *)v5 + 38);
  *((_QWORD *)v5 + 38) = 0;

  *((_WORD *)v5 + 201) = 0;
  v53 = (void *)*((_QWORD *)v5 + 46);
  *((_QWORD *)v5 + 46) = 0;

  *((_DWORD *)v5 + 94) = 0;
  v5[417] = 0;
  *((_QWORD *)v5 + 49) = 0;
  v5[400] = 0;
  v54 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v55 = (void *)*((_QWORD *)v5 + 43);
  *((_QWORD *)v5 + 43) = v54;

  objc_msgSend(*((id *)v5 + 43), "setDateFormat:", CFSTR("hh:mm:ss.SSS"));
  v56 = objc_alloc_init(AFMyriadEmergencyCallPunchout);
  v57 = (void *)*((_QWORD *)v5 + 48);
  *((_QWORD *)v5 + 48) = v56;

  objc_msgSend(v5, "_initDeviceClassAndAdjustments");
  *((_QWORD *)v5 + 29) = CFNotificationCenterGetDarwinNotifyCenter();
  v58 = (void *)*((_QWORD *)v5 + 26);
  *((_QWORD *)v5 + 26) = 0;

  v59 = (void *)*((_QWORD *)v5 + 64);
  *((_QWORD *)v5 + 64) = 0;

  objc_msgSend(v5, "_initializeTimer");
  *((_WORD *)v5 + 220) = 0;
  objc_msgSend(v5, "_initializeWiProxReadinessTimer");
  objc_msgSend(v5, "_resetAdvertisementTimings");
  if (v5[319])
  {
    v60 = objc_msgSend(objc_alloc((Class)getWPHeySiriClass()), "initWithDelegate:queue:", v5, *((_QWORD *)v5 + 22));
    v61 = (void *)*((_QWORD *)v5 + 44);
    *((_QWORD *)v5 + 44) = v60;
  }
  else
  {
    v61 = (void *)*((_QWORD *)v5 + 44);
    *((_QWORD *)v5 + 44) = 0;
  }

  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __40__AFMyriadCoordinator_initWithDelegate___block_invoke;
  v89[3] = &unk_1E3A36F30;
  v62 = v5;
  v90 = v62;
  objc_msgSend(v62, "waitWiProx:andExecute:", 2000, v89);
  v63 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v93 = "-[AFMyriadCoordinator initWithDelegate:]";
    _os_log_impl(&dword_19AF50000, v63, OS_LOG_TYPE_INFO, "%s Initialized MyriadCoordinator", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addObserver:selector:name:object:", v62, sel_updateRequestId_, CFSTR("RequestIdForMyriad"), 0);

  objc_storeStrong((id *)&_currentCoordinator, v5);
  *((_QWORD *)v62 + 51) = 0;
  v65 = [AFNotifyStatePublisher alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "com.apple.siri.myriad.decision.begin", 4);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[AFNotifyStatePublisher initWithName:queue:](v65, "initWithName:queue:", v66, *((_QWORD *)v5 + 22));
  v68 = (void *)*((_QWORD *)v62 + 65);
  *((_QWORD *)v62 + 65) = v67;

  v69 = [AFNotifyStatePublisher alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "com.apple.siri.myriad.decision.won", 4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[AFNotifyStatePublisher initWithName:queue:](v69, "initWithName:queue:", v70, *((_QWORD *)v5 + 22));
  v72 = (void *)*((_QWORD *)v62 + 66);
  *((_QWORD *)v62 + 66) = v71;

  v73 = [AFNotifyStatePublisher alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "com.apple.siri.myriad.decision.lost", 4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = -[AFNotifyStatePublisher initWithName:queue:](v73, "initWithName:queue:", v74, *((_QWORD *)v5 + 22));
  v76 = (void *)*((_QWORD *)v62 + 67);
  *((_QWORD *)v62 + 67) = v75;

  v77 = [AFNotifyStatePublisher alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "com.apple.siri.myriad.repost.decision.won", 4);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = -[AFNotifyStatePublisher initWithName:queue:](v77, "initWithName:queue:", v78, *((_QWORD *)v5 + 22));
  v80 = (void *)*((_QWORD *)v62 + 68);
  *((_QWORD *)v62 + 68) = v79;

  *((_QWORD *)v62 + 71) = 0;
  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", v29, 1, v62, *((void **)v5 + 22));
  v81 = objc_claimAutoreleasedReturnValue();
  v82 = (void *)*((_QWORD *)v62 + 69);
  *((_QWORD *)v62 + 69) = v81;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    AFMyriadForceNoActivityNotifyStateObserver(v29, 1, v62, *((void **)v5 + 22));
    v83 = objc_claimAutoreleasedReturnValue();
    v84 = (void *)*((_QWORD *)v62 + 70);
    *((_QWORD *)v62 + 70) = v83;

  }
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled"))
  {
    v85 = objc_alloc_init(AFArbitrationParticipationController);
    v86 = (void *)*((_QWORD *)v62 + 79);
    *((_QWORD *)v62 + 79) = v85;

  }
  v87 = (void *)*((_QWORD *)v62 + 77);
  *((_QWORD *)v62 + 77) = 0;

  kdebug_trace();
  v7 = v62;

LABEL_22:
  return v7;
}

- (void)dealloc
{
  AFArbitrationEventUpdatesDelegate *arbitrationEventsDelegate;
  void *v4;
  objc_super v5;

  -[AFMyriadCoordinator _clearWiProxReadinessTimer](self, "_clearWiProxReadinessTimer");
  -[AFPowerAssertionManager releaseAllPowerAssertions](self->_powerAssertionManager, "releaseAllPowerAssertions");
  arbitrationEventsDelegate = self->_arbitrationEventsDelegate;
  self->_arbitrationEventsDelegate = 0;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  if (self->_BLEActivityEnabled)
  {
    -[WPHeySiri stopScanningAndAdvertising](self->_heySiriBTLE, "stopScanningAndAdvertising");
    -[WPHeySiri invalidate](self->_heySiriBTLE, "invalidate");
    self->_heySiriBTLEState = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AFMyriadCoordinator;
  -[AFMyriadCoordinator dealloc](&v5, sel_dealloc);
}

- (void)updateRequestId:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AFMyriadCoordinator *v9;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__AFMyriadCoordinator_updateRequestId___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)readDefaults
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AFMyriadCoordinator_readDefaults__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)_readDefaults
{
  NSObject *v3;
  double v4;
  NSObject *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  NSString *deviceClassName;
  NSString *productTypeName;
  uint64_t deviceClass;
  uint64_t deviceAdjust;
  double deviceDelay;
  double deviceTrumpDelay;
  double deviceVTEndtimeDistanceThreshold;
  int v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v18 = 136315138;
    v19 = "-[AFMyriadCoordinator _readDefaults]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s #myriad reading defaults", (uint8_t *)&v18, 0xCu);
  }
  self->_coordinationEnabled = -[AFMyriadPreferences coordinationEnabled](self->_preferences, "coordinationEnabled");
  self->_BLEActivityEnabled = -[AFMyriadPreferences BLEActivityEnabled](self->_preferences, "BLEActivityEnabled");
  self->_constantGoodness = -[AFMyriadPreferences constantGoodnessScore](self->_preferences, "constantGoodnessScore");
  self->_deviceGroup = -[AFMyriadPreferences deviceGroup](self->_preferences, "deviceGroup");
  -[AFMyriadPreferences deviceSlowDown](self->_preferences, "deviceSlowDown");
  self->_testInducedSlowdownMsecs = (int)(v4 * 1000.0);
  if (-[AFMyriadPreferences myriadServerHasProvisioned](self->_preferences, "myriadServerHasProvisioned"))
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "-[AFMyriadCoordinator _readDefaults]";
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s #myriad reading server provisioned defaults", (uint8_t *)&v18, 0xCu);
    }
    if (-[AFMyriadPreferences deviceClass](self->_preferences, "deviceClass"))
      self->_deviceClass = -[AFMyriadPreferences deviceClass](self->_preferences, "deviceClass");
    -[AFMyriadPreferences deviceAdjust](self->_preferences, "deviceAdjust");
    self->_deviceAdjust = (int)v6;
    -[AFMyriadPreferences deviceDelay](self->_preferences, "deviceDelay");
    self->_deviceDelay = v7;
    -[AFMyriadPreferences deviceTrumpDelay](self->_preferences, "deviceTrumpDelay");
    self->_deviceTrumpDelay = v8;
    -[AFMyriadPreferences voiceTriggerEndtimeDelayThreshold](self->_preferences, "voiceTriggerEndtimeDelayThreshold");
    self->_deviceVTEndtimeDistanceThreshold = v9;
  }
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    deviceClassName = self->_deviceClassName;
    productTypeName = self->_productTypeName;
    deviceClass = self->_deviceClass;
    deviceAdjust = self->_deviceAdjust;
    deviceDelay = self->_deviceDelay;
    deviceTrumpDelay = self->_deviceTrumpDelay;
    deviceVTEndtimeDistanceThreshold = self->_deviceVTEndtimeDistanceThreshold;
    v18 = 136316930;
    v19 = "-[AFMyriadCoordinator _readDefaults]";
    v20 = 2112;
    v21 = deviceClassName;
    v22 = 2112;
    v23 = productTypeName;
    v24 = 2048;
    v25 = deviceClass;
    v26 = 2048;
    v27 = deviceAdjust;
    v28 = 2048;
    v29 = deviceDelay;
    v30 = 2048;
    v31 = deviceTrumpDelay;
    v32 = 2048;
    v33 = deviceVTEndtimeDistanceThreshold;
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s #myriad reading defaults: BTLE device class: %@ (%@) detected, category %ld, adjusting goodness by %ld, std delay %f, trump delay %f, vt_endtime threshold %f", (uint8_t *)&v18, 0x52u);
  }
}

- (void)_initDeviceClassAndAdjustments
{
  NSString *v3;
  NSString *productTypeName;
  NSString *v5;
  NSString *deviceClassName;
  unsigned __int8 v7;
  NSObject *v8;
  NSString *v9;
  NSString *v10;
  uint64_t deviceClass;
  uint64_t deviceAdjust;
  double deviceDelay;
  double deviceTrumpDelay;
  double deviceInEarInterval;
  double deviceInEarDelay;
  double deviceVTEndtimeDistanceThreshold;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;
  _BOOL4 v23;
  unsigned __int8 v24;
  int v25;
  const char *v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  self->_productType = 0;
  v3 = (NSString *)MGCopyAnswer();
  productTypeName = self->_productTypeName;
  self->_productTypeName = v3;

  v5 = (NSString *)MGCopyAnswer();
  deviceClassName = self->_deviceClassName;
  self->_deviceClassName = v5;

  *(_OWORD *)&self->_deviceDelay = xmmword_19B0EC790;
  *(_OWORD *)&self->_deviceInEarDelay = xmmword_19B0EC7A0;
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("iPhone")))
  {
    self->_deviceAdjust = 0;
    v7 = 2;
LABEL_8:
    self->_deviceClass = v7;
    goto LABEL_9;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("iPod")))
  {
    self->_deviceAdjust = 0;
LABEL_7:
    v7 = 3;
    goto LABEL_8;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("iPad")))
  {
    self->_deviceAdjust = -4;
    goto LABEL_7;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("AppleTV")))
  {
    self->_deviceAdjust = 0;
    v18 = 4;
LABEL_18:
    self->_deviceClass = v18;
    self->_deviceTrumpDelay = 0.75;
    goto LABEL_9;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("Watch")))
  {
    self->_deviceAdjust = 10;
    v19 = (void *)MGCopyAnswer();
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("watch1,1")) & 1) == 0)
    {
      AFProductType();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "isEqualToString:", CFSTR("watch1,2"));

    }
    v18 = 6;
    goto LABEL_18;
  }
  if (-[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("AudioAccessory")))
  {
    self->_deviceAdjust = 0;
    self->_deviceClass = 7;
    v21 = MGGetProductType();
    if (v21 > 3348380075)
    {
      if (v21 != 3348380076)
      {
        if (v21 == 4240173202)
        {
          v22 = 1;
          goto LABEL_29;
        }
LABEL_34:
        self->_productType = 0;
        goto LABEL_35;
      }
      v24 = 3;
    }
    else
    {
      if (v21 != 1540760353)
      {
        if (v21 == 2702125347)
        {
          v22 = 2;
LABEL_29:
          self->_productType = v22;
LABEL_35:
          self->_deviceAdjust = 0;
          goto LABEL_9;
        }
        goto LABEL_34;
      }
      v24 = 5;
    }
    self->_productType = v24;
    self->_deviceAdjust = -2;
    goto LABEL_9;
  }
  v23 = -[NSString isEqualToString:](self->_deviceClassName, "isEqualToString:", CFSTR("Bridge"));
  self->_deviceAdjust = 0;
  if (v23)
  {
    v7 = 8;
    goto LABEL_8;
  }
  self->_deviceClass = 0;
LABEL_9:
  self->_deviceVTEndtimeDistanceThreshold = 0.5;
  -[AFMyriadCoordinator _readDefaults](self, "_readDefaults");
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = self->_deviceClassName;
    v10 = self->_productTypeName;
    deviceClass = self->_deviceClass;
    deviceAdjust = self->_deviceAdjust;
    deviceDelay = self->_deviceDelay;
    deviceTrumpDelay = self->_deviceTrumpDelay;
    deviceInEarDelay = self->_deviceInEarDelay;
    deviceInEarInterval = self->_deviceInEarInterval;
    deviceVTEndtimeDistanceThreshold = self->_deviceVTEndtimeDistanceThreshold;
    v25 = 136317442;
    v26 = "-[AFMyriadCoordinator _initDeviceClassAndAdjustments]";
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    v31 = 2048;
    v32 = deviceClass;
    v33 = 2048;
    v34 = deviceAdjust;
    v35 = 2048;
    v36 = deviceDelay;
    v37 = 2048;
    v38 = deviceTrumpDelay;
    v39 = 2048;
    v40 = deviceInEarDelay;
    v41 = 2048;
    v42 = deviceInEarInterval;
    v43 = 2048;
    v44 = deviceVTEndtimeDistanceThreshold;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s BTLE device class: %@ (%@) detected, category %ld, adjusting goodness by %ld, std delay %f, trump delay %f, in_ear delay %f interval %f vt_endtime threshold %f", (uint8_t *)&v25, 0x66u);
  }
}

- (void)_setMyriadContext:(id)a3
{
  AFMyriadContext *v4;
  AFMyriadContext *currentMyriadContext;

  v4 = (AFMyriadContext *)objc_msgSend(a3, "copy");
  currentMyriadContext = self->_currentMyriadContext;
  self->_currentMyriadContext = v4;

}

- (void)_updateVoiceTriggerTimeFromFile
{
  void *v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  double v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  safelyGetAudioData();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0xC)
    objc_msgSend(v3, "getBytes:range:", &v11, 4, 8);
  v4 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
  v5 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v4 / 1000000000.0;
  v6 = AFSiriLogContextConnection;
  v7 = v5 - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v11 / 1000000000.0;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v9 = v6;
    objc_msgSend(v3, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v13 = "-[AFMyriadCoordinator _updateVoiceTriggerTimeFromFile]";
    v14 = 2112;
    v15 = *(double *)&v10;
    v16 = 2048;
    v17 = v11;
    v18 = 2048;
    v19 = v7;
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s data=%@, voiceTriggerTimeRaw=%llu, secondsSinceTrigger=%f", buf, 0x2Au);

    v6 = AFSiriLogContextConnection;
  }
  v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v7 <= 2.0)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[AFMyriadCoordinator _updateVoiceTriggerTimeFromFile]";
      v14 = 2048;
      v15 = v7;
      _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s #myriad endTime from a file is good, secondsSinceTrigger=%f", buf, 0x16u);
    }
    self->_voiceTriggerTime = v11;
  }
  else if (v8)
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFMyriadCoordinator _updateVoiceTriggerTimeFromFile]";
    v14 = 2048;
    v15 = v7;
    _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s #myriad endTime from a file is too old, secondsSinceTrigger=%f", buf, 0x16u);
  }

}

- (void)preheatWiProx
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AFMyriadCoordinator_preheatWiProx__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startAdvertisingForPHSSetupAfterDelay:(float)a3 maxInterval:(float)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[AFMyriadCoordinator startAdvertisingForPHSSetupAfterDelay:maxInterval:]";
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  -[AFMyriadCoordinator _phsSetupRecord](self, "_phsSetupRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAdvertisementData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a3;
  *(float *)&v11 = a4;
  -[AFMyriadCoordinator advertiseWith:afterDelay:maxInterval:](self, "advertiseWith:afterDelay:maxInterval:", v9, v10, v11);

}

- (void)startAdvertisingFromVoiceTrigger
{
  -[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithContext:](self, "startAdvertisingFromVoiceTriggerWithContext:", 0);
}

- (void)startAdvertisingFromVoiceTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__AFMyriadCoordinator_startAdvertisingFromVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)_startAdvertisingFromVoiceTrigger
{
  AFMyriadRecord *v3;
  AFMyriadRecord *triggerRecord;
  void *v5;
  double v6;
  NSString *deviceClassName;
  NSString *productTypeName;
  int deviceAdjust;
  int incomingAdjustment;
  AFMyriadRecord *v11;
  NSObject *v12;
  int constantGoodness;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  AFMyriadRecord *v21;
  NSObject *v22;
  int v23;
  AFMyriadRecord *overrideMyriadRecord;
  NSObject *v25;
  AFMyriadRecord *v26;
  AFMyriadRecord *v27;
  AFMyriadRecord *v28;
  int v29;
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (self->_inTask || self->_inSetupMode)
  {
    -[AFMyriadCoordinator _startAdvertisingFromInTaskVoiceTrigger](self, "_startAdvertisingFromInTaskVoiceTrigger");
  }
  else
  {
    -[AFMyriadCoordinator _initializeTimer](self, "_initializeTimer");
    -[AFMyriadCoordinator voiceTriggerRecord](self, "voiceTriggerRecord");
    v3 = (AFMyriadRecord *)objc_claimAutoreleasedReturnValue();
    triggerRecord = self->_triggerRecord;
    self->_triggerRecord = v3;

    v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      deviceClassName = self->_deviceClassName;
      productTypeName = self->_productTypeName;
      deviceAdjust = self->_deviceAdjust;
      incomingAdjustment = self->_incomingAdjustment;
      v11 = self->_triggerRecord;
      v12 = v5;
      v29 = 136316418;
      v30 = "-[AFMyriadCoordinator _startAdvertisingFromVoiceTrigger]";
      v31 = 2112;
      v32 = *(double *)&deviceClassName;
      v33 = 2112;
      v34 = productTypeName;
      v35 = 1024;
      v36 = deviceAdjust;
      v37 = 1024;
      v38 = incomingAdjustment;
      v39 = 1024;
      v40 = -[AFMyriadRecord rawAudioGoodnessScore](v11, "rawAudioGoodnessScore");
      _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s #myriad BTLE device class: %@ (%@) detected, adjusting goodness by %d incomingAdjustment %d, rawAudioGoodnessScore: %d", (uint8_t *)&v29, 0x32u);

    }
    LODWORD(v6) = 1.0;
    -[AFMyriadRecord adjustByMultiplier:adding:](self->_triggerRecord, "adjustByMultiplier:adding:", self->_deviceAdjust + self->_incomingAdjustment, v6);
    constantGoodness = self->_constantGoodness;
    if ((constantGoodness & 0x80000000) == 0)
    {
      v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v29 = 136315394;
        v30 = "-[AFMyriadCoordinator _startAdvertisingFromVoiceTrigger]";
        v31 = 1024;
        LODWORD(v32) = constantGoodness;
        _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s #myriad BTLE overriding to constant goodness %d", (uint8_t *)&v29, 0x12u);
        constantGoodness = self->_constantGoodness;
      }
      -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](self->_triggerRecord, "setRawAudioGoodnessScore:withBump:", 0, constantGoodness);
    }
    if (self->_wasEmergency)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "systemUptime");
      v17 = v16 - self->_lastEmergencyAttempt;

      if (v17 < 70.0)
      {
        v18 = -[AFMyriadRecord goodness](self->_triggerRecord, "goodness");
        v19 = v18 >= 0xC ? 12 : v18;
        -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](self->_triggerRecord, "setRawAudioGoodnessScore:withBump:", 0, v19);
        v20 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v21 = self->_triggerRecord;
          v22 = v20;
          v23 = -[AFMyriadRecord goodness](v21, "goodness");
          v29 = 136315650;
          v30 = "-[AFMyriadCoordinator _startAdvertisingFromVoiceTrigger]";
          v31 = 2048;
          v32 = v17;
          v33 = 1024;
          LODWORD(v34) = v23;
          _os_log_impl(&dword_19AF50000, v22, OS_LOG_TYPE_INFO, "%s #myriad Downgrading goodness as HS invocation too soon %f for score %d", (uint8_t *)&v29, 0x1Cu);

        }
      }
      self->_lastEmergencyAttempt = 0.0;
      self->_wasEmergency = 0;
    }
    overrideMyriadRecord = self->_overrideMyriadRecord;
    if (overrideMyriadRecord)
    {
      v25 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v29 = 136315394;
        v30 = "-[AFMyriadCoordinator _startAdvertisingFromVoiceTrigger]";
        v31 = 2112;
        v32 = *(double *)&overrideMyriadRecord;
        _os_log_impl(&dword_19AF50000, v25, OS_LOG_TYPE_INFO, "%s #myriad BTLE overriding to goodness %@", (uint8_t *)&v29, 0x16u);
        overrideMyriadRecord = self->_overrideMyriadRecord;
      }
      v26 = overrideMyriadRecord;
      v27 = self->_overrideMyriadRecord;
      self->_overrideMyriadRecord = 0;

      v28 = self->_triggerRecord;
      self->_triggerRecord = v26;

    }
    self->_clientIsDirectActivating = 0;
    self->_recordType = 10;
    -[AFMyriadCoordinator _enterState:](self, "_enterState:", 1);
  }
}

- (void)resetStateMachine
{
  -[AFMyriadCoordinator enterState:](self, "enterState:", 0);
}

- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3
{
  -[AFMyriadCoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:](self, "startAdvertisingFromVoiceTriggerAdjusted:withContext:", a3, 0);
}

- (void)startAdvertisingFromVoiceTriggerAdjusted:(char)a3 withContext:(id)a4
{
  int v4;
  id v6;
  AFMyriadGoodnessScoreOverrideContext *v7;
  NSObject *v8;
  NSObject *v9;
  AFMyriadGoodnessScoreContext *v10;
  int deviceAdjust;
  int v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init(AFMyriadGoodnessScoreOverrideContext);
  -[AFMyriadGoodnessScoreOverrideContext setOverrideContext:](v7, "setOverrideContext:", 1);
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    deviceAdjust = self->_deviceAdjust;
    v13 = 136315650;
    v14 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
    v15 = 1024;
    v16 = deviceAdjust;
    v17 = 1024;
    v18 = v4;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s #myriad _deviceAdjust=%d, adjustment= %d", (uint8_t *)&v13, 0x18u);
  }
  if (objc_msgSend(v6, "activationSource") == 13 && self->_deviceClass == 3)
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v12 = self->_deviceAdjust;
      v13 = 136315394;
      v14 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:]";
      v15 = 1024;
      v16 = v12;
      _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s #myriad removing negative iPad device boost (adding %d back) due to activationSource", (uint8_t *)&v13, 0x12u);
    }
    LOBYTE(v4) = v4 - LOBYTE(self->_deviceAdjust);
  }
  -[AFMyriadGoodnessScoreOverrideContext setOverriddenAdjustedScore:](v7, "setOverriddenAdjustedScore:", v4);
  v10 = objc_alloc_init(AFMyriadGoodnessScoreContext);
  -[AFMyriadGoodnessScoreContext setOverridingContext:](v10, "setOverridingContext:", v7);
  -[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:](self, "startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:", v10, v6);

}

- (void)startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSObject *myriadWorkQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__AFMyriadCoordinator_startAdvertisingFromVoiceTriggerWithGoodnessScoreContext_withContext___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(myriadWorkQueue, block);

}

- (void)startWatchAdvertisingFromVoiceTrigger
{
  -[AFMyriadCoordinator startWatchAdvertisingFromVoiceTriggerWithContext:](self, "startWatchAdvertisingFromVoiceTriggerWithContext:", 0);
}

- (void)startWatchAdvertisingFromVoiceTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__AFMyriadCoordinator_startWatchAdvertisingFromVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startWatchAdvertisingFromDirectTrigger
{
  -[AFMyriadCoordinator startWatchAdvertisingFromDirectTriggerWithContext:](self, "startWatchAdvertisingFromDirectTriggerWithContext:", 0);
}

- (void)startWatchAdvertisingFromDirectTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__AFMyriadCoordinator_startWatchAdvertisingFromDirectTriggerWithContext___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startAdvertisingFromDirectTrigger
{
  -[AFMyriadCoordinator startAdvertisingFromDirectTriggerWithContext:](self, "startAdvertisingFromDirectTriggerWithContext:", 0);
}

- (void)startAdvertisingFromDirectTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__AFMyriadCoordinator_startAdvertisingFromDirectTriggerWithContext___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startAdvertisingFromOutgoingTrigger
{
  -[AFMyriadCoordinator startAdvertisingFromOutgoingTriggerWithContext:](self, "startAdvertisingFromOutgoingTriggerWithContext:", 0);
}

- (void)startAdvertisingFromOutgoingTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__AFMyriadCoordinator_startAdvertisingFromOutgoingTriggerWithContext___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startAdvertisingFromInEarTrigger
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AFMyriadCoordinator_startAdvertisingFromInEarTrigger__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startAdvertisingFromCarPlayTrigger
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AFMyriadCoordinator_startAdvertisingFromCarPlayTrigger__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startAdvertisingEmergencyHandled
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AFMyriadCoordinator_startAdvertisingEmergencyHandled__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startAdvertisingEmergency
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AFMyriadCoordinator_startAdvertisingEmergency__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)_startAdvertisingFromInTaskVoiceTrigger
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  AFMyriadInstrumentation *myriadInstrumentation;
  uint64_t v10;
  void *v11;
  AFMyriadRecord *v12;
  AFMyriadRecord *triggerRecord;
  NSObject *v14;
  AFMyriadCoordinator *v15;
  uint64_t v16;
  unint64_t voiceTriggerTime;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  unint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[AFMyriadCoordinator _startAdvertisingFromInTaskVoiceTrigger]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE in-task voice trigger heard", buf, 0xCu);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_myriadState);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = CFSTR("trigger");
    v23[0] = v5;
    v23[1] = CFSTR("InTaskVoiceTrigger");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventWithType:context:", 2011, v6);

  }
  v7 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
  if (*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v7 / 1000000000.0
     - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)self->_voiceTriggerTime / 1000000000.0 > 1.45000005
    && -[AFMyriadCoordinator _inTaskTriggerWasTooSoon](self, "_inTaskTriggerWasTooSoon"))
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[AFMyriadCoordinator _startAdvertisingFromInTaskVoiceTrigger]";
      _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s BTLE ignoring in-task voice trigger and continuing with ongoing advertisement.", buf, 0xCu);
    }
  }
  else
  {
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      -[AFMyriadCoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
      myriadInstrumentation = self->_myriadInstrumentation;
      v10 = -[AFMyriadCoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
      -[AFMyriadSession sessionId](self->_myriadSession, "sessionId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadInstrumentation logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:](myriadInstrumentation, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v10, 6, v11, mach_absolute_time());

      -[AFMyriadInstrumentation updateIsTrump:withReason:](self->_myriadInstrumentation, "updateIsTrump:withReason:", 1, 7);
    }
    if (self->_myriadState == 1 && self->_inTask && !self->_clientIsDirectActivating && !self->_clientIsDeciding)
    {
      -[AFMyriadRecord generateTiebreaker](self->_triggerRecord, "generateTiebreaker");
      v15 = self;
      v16 = 1;
    }
    else
    {
      -[AFMyriadCoordinator _initializeTimer](self, "_initializeTimer");
      -[AFMyriadCoordinator directTriggerRecord](self, "directTriggerRecord");
      v12 = (AFMyriadRecord *)objc_claimAutoreleasedReturnValue();
      triggerRecord = self->_triggerRecord;
      self->_triggerRecord = v12;

      self->_clientIsDirectActivating = 0;
      self->_recordType = 3;
      v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        voiceTriggerTime = self->_voiceTriggerTime;
        *(_DWORD *)buf = 136315394;
        v19 = "-[AFMyriadCoordinator _startAdvertisingFromInTaskVoiceTrigger]";
        v20 = 2048;
        v21 = voiceTriggerTime;
        _os_log_debug_impl(&dword_19AF50000, v14, OS_LOG_TYPE_DEBUG, "%s #myriad _voiceTriggerTime: %llu", buf, 0x16u);
      }
      v15 = self;
      v16 = 14;
    }
    -[AFMyriadCoordinator _enterState:](v15, "_enterState:", v16);
  }
}

- (void)startAdvertisingFromInTaskVoiceTriggerWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *myriadWorkQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFMyriadCoordinator startAdvertisingFromInTaskVoiceTriggerWithContext:]";
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s BTLE voice trigger while inTask with context: %@", buf, 0x16u);

  }
  myriadWorkQueue = self->_myriadWorkQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__AFMyriadCoordinator_startAdvertisingFromInTaskVoiceTriggerWithContext___block_invoke;
  v10[3] = &unk_1E3A36FC8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(myriadWorkQueue, v10);

}

- (void)startAdvertisingFromInTaskVoiceTrigger
{
  -[AFMyriadCoordinator startAdvertisingFromInTaskVoiceTriggerWithContext:](self, "startAdvertisingFromInTaskVoiceTriggerWithContext:", 0);
}

- (void)startAdvertisingFromAlertFiringVoiceTrigger
{
  -[AFMyriadCoordinator startAdvertisingFromAlertFiringVoiceTriggerWithContext:](self, "startAdvertisingFromAlertFiringVoiceTriggerWithContext:", 0);
}

- (void)startAdvertisingFromAlertFiringVoiceTriggerWithContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__AFMyriadCoordinator_startAdvertisingFromAlertFiringVoiceTriggerWithContext___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)startResponseAdvertising:(unsigned __int16)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  unsigned __int16 v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__AFMyriadCoordinator_startResponseAdvertising___block_invoke;
  v4[3] = &unk_1E3A33388;
  v4[4] = self;
  v5 = a3;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)startAdvertisingSlowdown:(unsigned __int16)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  unsigned __int16 v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__AFMyriadCoordinator_startAdvertisingSlowdown___block_invoke;
  v4[3] = &unk_1E3A33388;
  v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)endAdvertisingAfterDelay:(float)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  float v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__AFMyriadCoordinator_endAdvertisingAfterDelay___block_invoke;
  v4[3] = &unk_1E3A333B0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)_endAdvertising:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  AFMyriadInstrumentation *myriadInstrumentation;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  double v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFMyriadCoordinator _endAdvertising:]";
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  kdebug_trace();
  if (self->_myriadState != 5)
  {
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("state");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_myriadState);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logEventWithType:context:", 2004, v8);

    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      v10 = -[AFMyriadCoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
      -[AFMyriadSession sessionId](self->_myriadSession, "sessionId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadInstrumentation logCDAElectionAdvertisingEnding:withCdaId:withTimestamp:](myriadInstrumentation, "logCDAElectionAdvertisingEnding:withCdaId:withTimestamp:", v10, v11, mach_absolute_time());

    }
  }
  -[AFMyriadCoordinator _stopAdvertising:](self, "_stopAdvertising:", v4);
  if (self->_clientIsDirectActivating || self->_clientIsWatchActivation)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "systemUptime");
    v14 = v13;

    -[AFMyriadGoodnessScoreEvaluator setLastActivationTime:](self->_goodnessScoreEvaluator, "setLastActivationTime:", v14);
    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[AFMyriadCoordinator _endAdvertising:]";
      v18 = 2048;
      v19 = v14;
      _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s BTLE activation time %f", buf, 0x16u);
    }
  }

}

- (void)endAdvertising:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__AFMyriadCoordinator_endAdvertising___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (id)_endAdvertisingAnalyticsContext:(BOOL)a3
{
  NSObject *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  AFMyriadRecord *maxSlowdownRecord;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  uint64_t v38;
  double v39;
  unint64_t lastDecisionTime;
  AFMyriadInstrumentation *myriadInstrumentation;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSUUID *currentRequestId;
  void *v47;
  id v48;
  AFMyriadInstrumentation *v49;
  uint64_t v50;
  _BOOL4 coordinationEnabled;
  uint64_t deviceGroup;
  void *v53;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  id v62;
  NSMutableDictionary *obj;
  id obja;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[5];
  _QWORD v77[4];
  id v78;
  _QWORD v79[2];
  uint8_t v80[128];
  __int128 buf;
  uint64_t v82;
  char v83;
  _QWORD v84[2];
  _QWORD v85[4];

  v59 = a3;
  v85[2] = *MEMORY[0x1E0C80C00];
  -[AFMyriadCoordinator _sortedReplies](self, "_sortedReplies");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v60, "count"));
  if (v60 && objc_msgSend(v60, "count"))
  {
    objc_msgSend(v60, "firstObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke;
    v77[3] = &unk_1E3A333D8;
    v78 = v58;
    objc_msgSend(v60, "enumerateObjectsUsingBlock:", v77);

  }
  else
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[AFMyriadCoordinator _endAdvertisingAnalyticsContext:]";
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Myriad decision is based on 0 replies", (uint8_t *)&buf, 0xCu);
    }
    -[AFMyriadCoordinator emptyRecord](self, "emptyRecord");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  if (self->_lastDecision)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v84[1] = CFSTR("previous_decision_time");
  v85[0] = v5;
  v84[0] = CFSTR("previous_decision");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), self->_lastDecisionTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (id)objc_msgSend(v4, "initWithDictionary:", v7);

  objc_msgSend(v62, "setObject:forKey:", v58, CFSTR("goodness_scores"));
  if (v59)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v62, "setObject:forKey:", v8, CFSTR("decision"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v60, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKey:", v9, CFSTR("device_count"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%hhu"), objc_msgSend(v61, "goodness"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKey:", v10, CFSTR("winner_goodness"));

  maxSlowdownRecord = self->_maxSlowdownRecord;
  if (maxSlowdownRecord && self->_clientIsRespondingToSlowdown && !self->_clientDoneRespondingToSlowdown)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[AFMyriadRecord slowdownDelay](maxSlowdownRecord, "slowdownDelay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKey:", v12, CFSTR("max_slowdown"));

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v82 = 0x2020000000;
  v83 = 0;
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_216;
  v76[3] = &unk_1E3A33400;
  v76[4] = &buf;
  objc_msgSend(v60, "enumerateObjectsUsingBlock:", v76);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v62, "setObject:forKey:", v13, CFSTR("homepod_involved"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v61, "deviceClass"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKey:", v14, CFSTR("winner_device_class"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v61, "productType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKey:", v15, CFSTR("winner_product_type"));

  if (!v59)
  {
    if (objc_msgSend(v61, "isATrump"))
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    objc_msgSend(v62, "setObject:forKey:", v16, CFSTR("winner_sent_suppresssion"));
  }
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal
    || (+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "shouldLogForQA"),
        v17,
        v18))
  {
    if (self->_coordinationEnabled)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    objc_msgSend(v62, "setObject:forKey:", v19, CFSTR("coordination_allowed"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_deviceGroup);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKey:", v20, CFSTR("device-group"));

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_2;
    v74[3] = &unk_1E3A33428;
    v22 = v21;
    v75 = v22;
    objc_msgSend(v60, "enumerateObjectsUsingBlock:", v74);
    objc_msgSend(v62, "setObject:forKey:", v22, CFSTR("election"));
    v56 = v22;
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = self->_replyCounts;
    v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v71 != v25)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_replyCounts, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v79[0] = v28;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_replies, "objectForKeyedSubscript:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "description");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v79[1] = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v31, v27);

        }
        v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      }
      while (v24);
    }

    objc_msgSend(v62, "setObject:forKey:", v23, CFSTR("counts"));
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    v32 = objc_alloc_init(MEMORY[0x1E0D99470]);
    objc_msgSend(v32, "setDeviceClass:", objc_msgSend(v61, "deviceClass"));
    objc_msgSend(v32, "setProductType:", objc_msgSend(v61, "productType"));
    objc_msgSend(v32, "setGoodnessScore:", objc_msgSend(v61, "goodness"));
    v33 = objc_alloc_init(MEMORY[0x1E0D99470]);
    v34 = v33;
    if (v59)
    {
      v35 = objc_msgSend(v61, "rawAudioGoodnessScore");
      v36 = v32;

      v34 = v36;
    }
    else
    {
      objc_msgSend(v33, "setDeviceClass:", self->_deviceClass);
      objc_msgSend(v34, "setProductType:", self->_productType);
      objc_msgSend(v34, "setGoodnessScore:", -[AFMyriadRecord goodness](self->_triggerRecord, "goodness"));
      v35 = 0;
    }
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_3;
    v68[3] = &unk_1E3A333D8;
    obja = v37;
    v69 = obja;
    objc_msgSend(v60, "enumerateObjectsUsingBlock:", v68);
    v38 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    v39 = *(double *)&_AFMachAbsoluteTimeRate_rate;
    lastDecisionTime = self->_lastDecisionTime;
    v57 = (void *)-[NSUUID copy](self->_currentRequestId, "copy");
    myriadInstrumentation = self->_myriadInstrumentation;
    v42 = -[AFMyriadCoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
    if (v59)
      v43 = 1;
    else
      v43 = 2;
    if (self->_lastDecision)
      v44 = 1;
    else
      v44 = 2;
    -[AFMyriadSession sessionId](self->_myriadSession, "sessionId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = v35;
    -[AFMyriadInstrumentation logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecision:withWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTimestamp:](myriadInstrumentation, "logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecision:withWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTimestamp:", v42, v43, v44, ((unint64_t)(v39 * (double)v38) - lastDecisionTime) / 0xF4240, v32, v34, obja, v55, 0, v45, v57, mach_absolute_time());

    currentRequestId = self->_currentRequestId;
    self->_currentRequestId = 0;

    if (AFIsInternalInstall_onceToken != -1)
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
    if (AFIsInternalInstall_isInternal)
    {
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_4;
      v66[3] = &unk_1E3A333D8;
      v48 = v47;
      v67 = v48;
      objc_msgSend(v60, "enumerateObjectsUsingBlock:", v66);
      v49 = self->_myriadInstrumentation;
      v50 = -[AFMyriadCoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
      coordinationEnabled = self->_coordinationEnabled;
      deviceGroup = self->_deviceGroup;
      -[AFMyriadSession sessionId](self->_myriadSession, "sessionId");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadInstrumentation logCDAElectionDecisionMadeDebug:withCrossDeviceArbitrationAllowed:advertisementData:withDeviceGroup:withCdaId:withTimestamp:](v49, "logCDAElectionDecisionMadeDebug:withCrossDeviceArbitrationAllowed:advertisementData:withDeviceGroup:withCdaId:withTimestamp:", v50, coordinationEnabled, v48, deviceGroup, v53, mach_absolute_time());

    }
  }
  _Block_object_dispose(&buf, 8);

  return v62;
}

- (void)_endAdvertisingWithDeviceProhibitions:(id)a3
{
  id v4;
  NSObject *v5;
  AFMyriadRecord *maxSlowdownRecord;
  int v7;
  const __CFString *v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  AFMyriadRecord *v12;
  NSObject *v13;
  _QWORD v14[6];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_coordinationEnabled)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[AFMyriadCoordinator _endAdvertisingWithDeviceProhibitions:]";
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s BTLE advertising is being ignored", buf, 0xCu);
    }
  }
  maxSlowdownRecord = self->_maxSlowdownRecord;
  if (maxSlowdownRecord
    && (v7 = -[AFMyriadRecord slowdownDelay](maxSlowdownRecord, "slowdownDelay")) != 0
    && self->_clientIsRespondingToSlowdown
    && !self->_clientDoneRespondingToSlowdown)
  {
    self->_slowdownMsecs = v7;
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[AFMyriadCoordinator _endAdvertisingWithDeviceProhibitions:]";
      v17 = 1024;
      v18 = v7;
      _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s BTLE detected a slowdown signal for %d msecs, resetting election for later time", buf, 0x12u);
    }
    -[AFMyriadCoordinator _advertiseTrigger](self, "_advertiseTrigger");
  }
  else
  {
    self->_clientIsDeciding = 1;
    if (-[AFMyriadCoordinator _deviceShouldContinue:](self, "_deviceShouldContinue:", v4))
    {
      if ((unint64_t)-[NSMutableDictionary count](self->_replies, "count") >= 2)
        -[AFPowerAssertionManager takePowerAssertionWithName:](self->_powerAssertionManager, "takePowerAssertionWithName:", 0);
      -[AFMyriadCoordinator _winElection](self, "_winElection");
      -[AFNotifyStatePublisher publishState:](self->_electionWinPublisher, "publishState:", -[AFMyriadCoordinator _nextElectionPublisherState](self, "_nextElectionPublisherState"));
      v8 = CFSTR("listening late");
      v9 = 0.0;
      v10 = 2;
    }
    else
    {
      -[AFMyriadCoordinator _loseElection](self, "_loseElection");
      v8 = CFSTR("wait until after suppress");
      v9 = 1.0;
      v10 = 7;
    }
    v11 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    self->_lastDecisionTime = (unint64_t)(*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v11);
    self->_clientDoneRespondingToSlowdown = 0;
    -[AFMyriadCoordinator _cancelOverallTimeout](self, "_cancelOverallTimeout");
    -[AFMyriadCoordinator _endAdvertising:](self, "_endAdvertising:", 0);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__AFMyriadCoordinator__endAdvertisingWithDeviceProhibitions___block_invoke;
    v14[3] = &unk_1E3A353C0;
    v14[4] = self;
    v14[5] = v10;
    -[AFMyriadCoordinator _startTimer:for:thenExecute:](self, "_startTimer:for:thenExecute:", v8, v14, COERCE_DOUBLE((unint64_t)LODWORD(v9)));
    -[AFMyriadCoordinator _ageWedgeFilter](self, "_ageWedgeFilter");
    -[AFMyriadCoordinator resetReplies](self, "resetReplies");
    -[AFMyriadCoordinator _resetAudioData](self, "_resetAudioData");
    *(_WORD *)&self->_clientIsDirectActivating = 0;
    v12 = self->_maxSlowdownRecord;
    self->_maxSlowdownRecord = 0;

    self->_clientIsRespondingToSlowdown = 0;
    self->_suppressLateTrigger = 0;
    -[AFMyriadCoordinator _resetAdvertisementTimings](self, "_resetAdvertisementTimings");
    if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled"))
    {
      -[AFArbitrationEventUpdatesDelegate arbitrationEndedAdvertising:](self->_arbitrationEventsDelegate, "arbitrationEndedAdvertising:", self->_myriadSession);
    }
  }

}

- (void)endAdvertisingWithDeviceProhibitions:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AFMyriadCoordinator_endAdvertisingWithDeviceProhibitions___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)endTask
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AFMyriadCoordinator_endTask__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (BOOL)inTask
{
  NSObject *myriadWorkQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  myriadWorkQueue = self->_myriadWorkQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AFMyriadCoordinator_inTask__block_invoke;
  v5[3] = &unk_1E3A36F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(myriadWorkQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setInTask:(BOOL)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  BOOL v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__AFMyriadCoordinator_setInTask___block_invoke;
  v4[3] = &unk_1E3A34D68;
  v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)setupEnabled:(BOOL)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[5];
  BOOL v5;

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__AFMyriadCoordinator_setupEnabled___block_invoke;
  v4[3] = &unk_1E3A34D68;
  v5 = a3;
  v4[4] = self;
  dispatch_async(myriadWorkQueue, v4);
}

- (void)requestWillPresentUsefulUserResult
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled"))
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[AFMyriadCoordinator requestWillPresentUsefulUserResult]";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__AFMyriadCoordinator_requestWillPresentUsefulUserResult__block_invoke;
    v4[3] = &unk_1E3A36F30;
    v4[4] = self;
    -[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:](self, "_updateArbitrationParticipationContextWithCompletion:", v4);
  }
}

- (void)instrumentationUpdateBoost:(unsigned __int8)a3 value:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  AFMyriadInstrumentation *myriadInstrumentation;
  AFMyriadInstrumentation *v8;
  AFMyriadInstrumentation *v9;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  myriadInstrumentation = self->_myriadInstrumentation;
  if (!myriadInstrumentation)
  {
    v8 = objc_alloc_init(AFMyriadInstrumentation);
    v9 = self->_myriadInstrumentation;
    self->_myriadInstrumentation = v8;

    myriadInstrumentation = self->_myriadInstrumentation;
  }
  -[AFMyriadInstrumentation updateBoost:value:](myriadInstrumentation, "updateBoost:value:", v5, v4);
}

- (void)setCurrentRequestId:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AFMyriadCoordinator_setCurrentRequestId___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)faceDetectedBoostWithMyriadContext:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__AFMyriadCoordinator_faceDetectedBoostWithMyriadContext___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)_forceLocalWinner:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  AFMyriadCoordinator *v9;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AFMyriadCoordinator__forceLocalWinner___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (BOOL)_deviceShouldContinue:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  _BOOL8 suppressLateTrigger;
  _BOOL4 v8;
  _BOOL8 clientIsDirectActivating;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 clientIsInEarActivation;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  _BOOL8 v27;
  __int16 v28;
  _BOOL8 v29;
  __int16 v30;
  _BOOL8 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v20 = 136315138;
    v21 = "-[AFMyriadCoordinator _deviceShouldContinue:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v20, 0xCu);
  }
  if (self->_coordinationEnabled)
  {
    if (self->_clientIsInEarActivation && -[AFMyriadRecord isATrump](self->_triggerRecord, "isATrump"))
      v6 = !-[AFMyriadRecord isInEarTrump](self->_triggerRecord, "isInEarTrump");
    else
      v6 = 0;
    suppressLateTrigger = self->_suppressLateTrigger;
    v8 = -[AFMyriadCoordinator _shouldContinueFor:](self, "_shouldContinueFor:", v4);
    clientIsDirectActivating = self->_clientIsDirectActivating;
    if (self->_clientIsDirectActivating)
      v10 = 1;
    else
      v10 = v6;
    v11 = v10 | v8;
    if (suppressLateTrigger)
      v12 = 0;
    else
      v12 = v11;
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      clientIsInEarActivation = self->_clientIsInEarActivation;
      v20 = 136316418;
      v21 = "-[AFMyriadCoordinator _deviceShouldContinue:]";
      v22 = 2048;
      v23 = v12;
      v24 = 2048;
      v25 = 0;
      v26 = 2048;
      v27 = clientIsDirectActivating;
      v28 = 2048;
      v29 = clientIsInEarActivation;
      v30 = 2048;
      v31 = suppressLateTrigger;
      v15 = "%s BTLE deviceShouldContinue:%ld (coordinationDisabled:%ld, isDirectlyActivating:%ld, isInEarTrigger:%ld, su"
            "ppressLateTrigger:%ld.";
      v16 = v13;
      v17 = 62;
LABEL_18:
      _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, v17);
    }
  }
  else
  {
    v18 = AFSiriLogContextConnection;
    LOBYTE(v12) = 1;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v20 = 136315138;
      v21 = "-[AFMyriadCoordinator _deviceShouldContinue:]";
      v15 = "%s Coordination disabled, continuing with the request)";
      LOBYTE(v12) = 1;
      v16 = v18;
      v17 = 12;
      goto LABEL_18;
    }
  }

  return v12;
}

- (void)_winElection
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v15 = 136315138;
    v16 = "-[AFMyriadCoordinator _winElection]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify myriad won", (uint8_t *)&v15, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained(&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v8, "shouldContinue:", self);

    }
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
      v9 = -[AFMyriadCoordinator _endAdvertisingAnalyticsContext:](self, "_endAdvertisingAnalyticsContext:", 1);
  }
  else
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFMyriadCoordinator _endAdvertisingAnalyticsContext:](self, "_endAdvertisingAnalyticsContext:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logEventWithType:context:", 2006, v11);

  }
  self->_clientIsListeningAfterRecentWin = 1;
  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemUptime");
  v14 = v13;

  -[AFMyriadGoodnessScoreEvaluator setLastActivationTime:](self->_goodnessScoreEvaluator, "setLastActivationTime:", v14);
  self->_lastDecision = 1;
}

- (void)_loseElection
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v15 = 136315138;
    v16 = "-[AFMyriadCoordinator _loseElection]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify myriad loss", (uint8_t *)&v15, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained(&self->_delegate),
        v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
        v8 = -[AFMyriadCoordinator _endAdvertisingAnalyticsContext:](self, "_endAdvertisingAnalyticsContext:", 0);
    }
    else
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadCoordinator _endAdvertisingAnalyticsContext:](self, "_endAdvertisingAnalyticsContext:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logEventWithType:context:", 2006, v13);

    }
    v14 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v14, "shouldAbortAnotherDeviceBetter:", self);

    self->_nTimesExtended = 0;
  }
  else
  {
    v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      v11 = objc_loadWeakRetained(&self->_delegate);
      v15 = 136315394;
      v16 = "-[AFMyriadCoordinator _loseElection]";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s BTLE unable to cancel against: %@", (uint8_t *)&v15, 0x16u);

    }
  }
  kdebug_trace();
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled"))
  {
    -[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:](self, "_updateArbitrationParticipationContextWithCompletion:", &__block_literal_global_29302);
  }
  -[AFNotifyStatePublisher publishState:](self->_electionLossPublisher, "publishState:", -[AFMyriadCoordinator _nextElectionPublisherState](self, "_nextElectionPublisherState"));
  -[AFMyriadGoodnessScoreEvaluator setLastActivationTime:](self->_goodnessScoreEvaluator, "setLastActivationTime:", 0.0);
  self->_lastDecision = 0;
  self->_inTask = 0;
  self->_ignoreInTaskTimer = 0;
}

- (id)_myriadSession
{
  return self->_myriadSession;
}

- (void)_addElectionAdvertisementDataToMyriadSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;
  AFMyriadSession **p_myriadSession;
  void *v14;
  AFMyriadSession *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFMyriadCoordinator _myriadSession](self, "_myriadSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__AFMyriadCoordinator__addElectionAdvertisementDataToMyriadSession___block_invoke;
    v18[3] = &unk_1E3A33470;
    v18[4] = self;
    v7 = v4;
    v19 = v7;
    v8 = v5;
    v20 = v8;
    objc_msgSend(v6, "mutatedCopyWithMutator:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v12, "myriadCoordinator:didAddAdvertisement:toSession:", self, v7, self->_myriadSession);

    }
    p_myriadSession = &self->_myriadSession;
    objc_storeStrong((id *)p_myriadSession, v9);
    v14 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v15 = *p_myriadSession;
      v16 = v14;
      -[AFMyriadSession sessionId](v15, "sessionId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v22 = "-[AFMyriadCoordinator _addElectionAdvertisementDataToMyriadSession:]";
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, "%s #myriad Election advertisement %@ added to myriad session %@", buf, 0x20u);

    }
  }

}

- (void)_createMyriadSessionIfRequired
{
  void *v3;
  unint64_t myriadState;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  AFMyriadSession *v11;
  AFMyriadSession *myriadSession;
  void *v13;
  AFMyriadSession *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  char v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_myriadSession
    || ((v7 = self->_myriadState, v8 = v7 > 0x11, v9 = (1 << v7) & 0x2C003, !v8) ? (v10 = v9 == 0) : (v10 = 1), v10))
  {
    v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      myriadState = self->_myriadState;
      v5 = v3;
      -[AFMyriadCoordinator _stateAsString:](self, "_stateAsString:", myriadState);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315394;
      v22 = "-[AFMyriadCoordinator _createMyriadSessionIfRequired]";
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s #myriad not initializing myriad session, myriad is in state %@", (uint8_t *)&v21, 0x16u);

    }
  }
  else
  {
    v11 = +[AFMyriadSession newWithBuilder:](AFMyriadSession, "newWithBuilder:", &__block_literal_global_252_29293);
    myriadSession = self->_myriadSession;
    self->_myriadSession = v11;

    v13 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v14 = self->_myriadSession;
      v15 = v13;
      -[AFMyriadSession sessionId](v14, "sessionId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadCoordinator _stateAsString:](self, "_stateAsString:", self->_myriadState);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315650;
      v22 = "-[AFMyriadCoordinator _createMyriadSessionIfRequired]";
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s #myriad Initialized myriad session %@ when myriad is in state %@", (uint8_t *)&v21, 0x20u);

    }
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v20 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v20, "willStartWithSession:", self->_myriadSession);

    }
    if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled"))
    {
      -[AFArbitrationEventUpdatesDelegate arbitrationSessionWillStart:](self->_arbitrationEventsDelegate, "arbitrationSessionWillStart:", self->_myriadSession);
    }
  }
}

- (void)_clearMyriadSession
{
  id *p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  AFMyriadSession *myriadSession;
  NSObject *v9;
  void *v10;
  void *v11;
  AFMyriadSession *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_myriadSession)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained(p_delegate);
      objc_msgSend(v6, "willEndSession:", self->_myriadSession);

    }
    v7 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      myriadSession = self->_myriadSession;
      v9 = v7;
      -[AFMyriadSession sessionId](myriadSession, "sessionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[AFMyriadCoordinator _clearMyriadSession]";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s #myriad Clearing myriad session %@", (uint8_t *)&v13, 0x16u);

    }
    -[AFMyriadSession electionAdvertisementDataByIds](self->_myriadSession, "electionAdvertisementDataByIds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_258);

    v12 = self->_myriadSession;
    self->_myriadSession = 0;

  }
}

- (void)_initializeTimer
{
  NSObject *v3;
  NSObject *timer;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSUUID *eventToken;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[AFMyriadCoordinator _initializeTimer]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_myriadWorkQueue);
  v6 = self->_timer;
  self->_timer = v5;

  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, &__block_literal_global_259);
  dispatch_resume((dispatch_object_t)self->_timer);
  eventToken = self->_eventToken;
  self->_eventToken = 0;

}

- (void)_createDispatchTimerWithTime:(unint64_t)a3 toExecute:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  AFMyriadCoordinator *v13;
  id v14;

  v6 = a4;
  dispatch_suspend((dispatch_object_t)self->_timer);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, a3, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_eventToken, v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__AFMyriadCoordinator__createDispatchTimerWithTime_toExecute___block_invoke;
  v11[3] = &unk_1E3A36E10;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  v10 = (void *)MEMORY[0x1A1AC0C3C](v11);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v10);
  dispatch_resume((dispatch_object_t)self->_timer);

}

- (void)_createDispatchTimerFor:(double)a3 toExecute:(id)a4
{
  int64_t v5;
  id v6;

  v5 = (uint64_t)(a3 * 1000000000.0);
  v6 = a4;
  -[AFMyriadCoordinator _createDispatchTimerWithTime:toExecute:](self, "_createDispatchTimerWithTime:toExecute:", dispatch_time(0, v5), v6);

}

- (void)_createDispatchTimerForEvent:(id)a3 toExecute:(id)a4
{
  id v6;
  double v7;
  timespec v8;

  v6 = a4;
  objc_msgSend(a3, "timeIntervalSince1970");
  v8.tv_sec = (int)v7;
  v8.tv_nsec = (uint64_t)((v7 - (double)(int)v7) * 1000000000.0);
  -[AFMyriadCoordinator _createDispatchTimerWithTime:toExecute:](self, "_createDispatchTimerWithTime:toExecute:", dispatch_walltime(&v8, 0), v6);

}

- (void)_startListenTimer
{
  double v2;

  LODWORD(v2) = 0.5;
  -[AFMyriadCoordinator _startTimer:for:thenExecute:](self, "_startTimer:for:thenExecute:", CFSTR("listen"), 0, v2);
}

- (void)_startTimer:(id)a3 for:(float)a4 thenExecute:(id)a5
{
  NSString *v8;
  id v9;
  NSObject *v10;
  double v11;
  NSString *timerLabel;
  NSString *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a5;
  v10 = AFSiriLogContextConnection;
  v11 = a4;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[AFMyriadCoordinator _startTimer:for:thenExecute:]";
    v19 = 2112;
    v20 = v8;
    v21 = 2048;
    v22 = v11;
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s BTLE starting %@ timer for %f secs", buf, 0x20u);
  }
  timerLabel = self->_timerLabel;
  self->_timerLabel = v8;
  v13 = v8;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__AFMyriadCoordinator__startTimer_for_thenExecute___block_invoke;
  v15[3] = &unk_1E3A36FA0;
  v15[4] = self;
  v16 = v9;
  v14 = v9;
  -[AFMyriadCoordinator _createDispatchTimerFor:toExecute:](self, "_createDispatchTimerFor:toExecute:", v15, v11);

}

- (void)_startTimer:(id)a3 for:(float)a4 thenEnterState:(unint64_t)a5
{
  id v8;
  double v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AFMyriadCoordinator__startTimer_for_thenEnterState___block_invoke;
  v10[3] = &unk_1E3A33538;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a5;
  *(float *)&v9 = a4;
  -[AFMyriadCoordinator _startTimer:for:thenExecute:](self, "_startTimer:for:thenExecute:", v8, v10, v9);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)_cancelTimer
{
  NSObject *timer;
  void *v4;
  NSString *timerLabel;
  unint64_t myriadState;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  timer = self->_timer;
  if (timer && !dispatch_source_testcancel((dispatch_source_t)self->_timer))
  {
    dispatch_source_cancel(timer);
    v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      timerLabel = self->_timerLabel;
      myriadState = self->_myriadState;
      v7 = v4;
      -[AFMyriadCoordinator _stateAsString:](self, "_stateAsString:", myriadState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315650;
      v10 = "-[AFMyriadCoordinator _cancelTimer]";
      v11 = 2112;
      v12 = timerLabel;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s BTLE timer %@ cancelled (%@)", (uint8_t *)&v9, 0x20u);

    }
  }
}

- (void)_setOverallTimeout
{
  NSObject *v3;
  AFWatchdogTimer *v4;
  OS_dispatch_queue *myriadWorkQueue;
  AFWatchdogTimer *v6;
  AFWatchdogTimer *overallTimeout;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_overallTimeout)
    -[AFMyriadCoordinator _cancelOverallTimeout](self, "_cancelOverallTimeout");
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFMyriadCoordinator _setOverallTimeout]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE Coordinator setting overall timeout", buf, 0xCu);
  }
  v4 = [AFWatchdogTimer alloc];
  myriadWorkQueue = self->_myriadWorkQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__AFMyriadCoordinator__setOverallTimeout__block_invoke;
  v8[3] = &unk_1E3A36F30;
  v8[4] = self;
  v6 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v4, "initWithTimeoutInterval:onQueue:timeoutHandler:", myriadWorkQueue, v8, 31.0);
  overallTimeout = self->_overallTimeout;
  self->_overallTimeout = v6;

}

- (void)_cancelOverallTimeout
{
  AFWatchdogTimer *overallTimeout;
  NSObject *v4;
  AFWatchdogTimer *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  overallTimeout = self->_overallTimeout;
  if (overallTimeout)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[AFMyriadCoordinator _cancelOverallTimeout]";
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s BTLE Coordinator cancelling overall timeout", (uint8_t *)&v9, 0xCu);
      overallTimeout = self->_overallTimeout;
    }
    -[AFWatchdogTimer cancelIfNotAlreadyCanceled](overallTimeout, "cancelIfNotAlreadyCanceled");
    v5 = self->_overallTimeout;
    self->_overallTimeout = 0;

    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v8, "myriadCoordinatorOverallTimerCancelled:", self);

    }
  }
}

- (void)_enterState:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  double v11;
  id v12;
  AFMyriadRecord *overrideMyriadRecord;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *multipleContinuations;
  NSMutableDictionary *v19;
  NSMutableDictionary *repliesBeforeDecision;
  NSUUID *eventToken;
  AFMyriadInstrumentation *myriadInstrumentation;
  uint64_t v23;
  void *v24;
  AFMyriadContext *currentMyriadContext;
  void *v26;
  void *v27;
  void *v28;
  id waitForWiproxReadinessToScan;
  NSObject *v30;
  _BOOL4 coordinationEnabled;
  _BOOL4 BLEActivityEnabled;
  NSObject *v33;
  uint64_t v34;
  double TimeInterval;
  void *v36;
  unint64_t latestRecordReceivedTime;
  AFMyriadContext *v38;
  NSObject *v39;
  uint64_t v40;
  NSMutableDictionary *replies;
  AFMyriadRecord *triggerRecord;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  AFMyriadCoordinator *v47;
  uint64_t v48;
  uint64_t v49;
  int nTimesContinued;
  AFMyriadContext *v51;
  NSObject *v52;
  int v53;
  void *v54;
  NSObject *v55;
  AFMyriadCoordinator *v56;
  uint64_t v57;
  void *v58;
  id v59;
  char v60;
  NSObject *v61;
  void *v62;
  id v63;
  char v64;
  int nTimesExtended;
  NSObject *v66;
  int v67;
  NSObject *v68;
  _BOOL4 v69;
  _BOOL4 v70;
  __CFNotificationCenter *DarwinNotifyCenter;
  AFMyriadCoordinator *v72;
  uint64_t v73;
  NSObject *myriadWorkQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  _BYTE v79[10];
  double v80;
  __int16 v81;
  unint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  const __CFString *v87;
  void *v88;
  const __CFString *v89;
  _QWORD v90[2];

  v90[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    -[AFMyriadCoordinator _stateAsString](self, "_stateAsString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFMyriadCoordinator _stateAsString:](self, "_stateAsString:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v77 = "-[AFMyriadCoordinator _enterState:]";
    v78 = 2112;
    *(_QWORD *)v79 = v7;
    *(_WORD *)&v79[8] = 2112;
    v80 = *(double *)&v8;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s BTLE Coordinator altered state: %@ -> %@", buf, 0x20u);

  }
  self->_previousState = self->_myriadState;
  self->_myriadState = a3;
  -[AFMyriadCoordinator _enteringIntoState:fromState:](self, "_enteringIntoState:fromState:", a3);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v12 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v12, "myriadCoordinator:didEnterState:fromState:", self, self->_myriadState, self->_previousState);

  }
  switch(a3)
  {
    case 0uLL:
      -[AFMyriadCoordinator _leaveBLEDiagnosticMode](self, "_leaveBLEDiagnosticMode");
      -[AFPowerAssertionManager releaseAllPowerAssertions](self->_powerAssertionManager, "releaseAllPowerAssertions");
      self->_inTask = 0;
      self->_ignoreInTaskTimer = 0;
      overrideMyriadRecord = self->_overrideMyriadRecord;
      self->_overrideMyriadRecord = 0;

      *(_WORD *)&self->_clientIsWatchActivation = 0;
      self->_clientIsInEarActivation = 0;
      *(_WORD *)&self->_clientRespondingToCarPlay = 0;
      -[AFMyriadCoordinator _stopAdvertisingAndListening](self, "_stopAdvertisingAndListening");
      -[AFMyriadCoordinator _resetActionWindows](self, "_resetActionWindows");
      if (self->_ducking)
        -[AFMyriadCoordinator _unduck](self, "_unduck");
      if (-[NSMutableDictionary count](self->_multipleContinuations, "count"))
      {
        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
        {
          +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = CFSTR("count");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[NSMutableDictionary count](self->_multipleContinuations, "count"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v90[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logEventWithType:context:", 2009, v16);

        }
        v17 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
        multipleContinuations = self->_multipleContinuations;
        self->_multipleContinuations = v17;

      }
      -[AFMyriadCoordinator _cancelTimer](self, "_cancelTimer");
      -[AFMyriadCoordinator _cancelOverallTimeout](self, "_cancelOverallTimeout");
      -[AFMyriadCoordinator _clearWiProxReadinessTimer](self, "_clearWiProxReadinessTimer");
      -[AFMyriadCoordinator resetReplies](self, "resetReplies");
      v19 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
      repliesBeforeDecision = self->_repliesBeforeDecision;
      self->_repliesBeforeDecision = v19;

      -[AFMyriadCoordinator _handleStateMachineErrorIfNeeded](self, "_handleStateMachineErrorIfNeeded");
      eventToken = self->_eventToken;
      self->_eventToken = 0;

      self->_recordType = 0;
      self->_previousState = 0;
      self->_suppressLateTrigger = 0;
      -[AFMyriadCoordinator _resetAdvertisementTimings](self, "_resetAdvertisementTimings");
      -[AFMyriadCoordinator _resetAudioData](self, "_resetAudioData");
      if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
      {
        myriadInstrumentation = self->_myriadInstrumentation;
        v23 = -[AFMyriadCoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
        -[AFMyriadSession sessionId](self->_myriadSession, "sessionId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFMyriadInstrumentation logCDADeviceStateActivityEnded:withCdaId:withTimestamp:](myriadInstrumentation, "logCDADeviceStateActivityEnded:withCdaId:withTimestamp:", v23, v24, mach_absolute_time());

      }
      -[AFMyriadCoordinator _clearMyriadSession](self, "_clearMyriadSession");
      -[AFMyriadAdvertisementContextManager reset](self->_advContextManager, "reset");
      currentMyriadContext = self->_currentMyriadContext;
      self->_currentMyriadContext = 0;

      if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
      {
        +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = CFSTR("state");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_myriadState);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logEventWithType:context:", 2012, v28);

      }
      waitForWiproxReadinessToScan = self->_waitForWiproxReadinessToScan;
      self->_waitForWiproxReadinessToScan = 0;

      return;
    case 1uLL:
      v30 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        coordinationEnabled = self->_coordinationEnabled;
        BLEActivityEnabled = self->_BLEActivityEnabled;
        *(_DWORD *)buf = 136315650;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        v78 = 1024;
        *(_DWORD *)v79 = coordinationEnabled;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = BLEActivityEnabled;
        _os_log_impl(&dword_19AF50000, v30, OS_LOG_TYPE_INFO, "%s #myriad coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
      }
      if (-[AFMyriadCoordinator _shouldStopListeningBeforeAdvertising](self, "_shouldStopListeningBeforeAdvertising"))
      {
        v33 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v77 = "-[AFMyriadCoordinator _enterState:]";
          _os_log_impl(&dword_19AF50000, v33, OS_LOG_TYPE_INFO, "%s #myriad Force stopping BTLE scan", buf, 0xCu);
        }
        -[AFMyriadCoordinator _stopListening:](self, "_stopListening:", 0);
      }
      if (-[AFMyriadContext activationSource](self->_currentMyriadContext, "activationSource") != 13
        || self->_clientIsDirectActivating)
      {
        goto LABEL_30;
      }
      v34 = mach_absolute_time();
      TimeInterval = AFMachAbsoluteTimeGetTimeInterval(v34 - self->_voiceTriggerTime);
      v36 = (void *)AFSiriLogContextMyriad;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_INFO))
      {
        latestRecordReceivedTime = self->_latestRecordReceivedTime;
        v38 = self->_currentMyriadContext;
        v39 = v36;
        v40 = -[AFMyriadContext activationExpirationTime](v38, "activationExpirationTime");
        *(_DWORD *)buf = 136316418;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        v78 = 2048;
        *(_QWORD *)v79 = 13;
        *(_WORD *)&v79[8] = 2048;
        v80 = TimeInterval;
        v81 = 2048;
        v82 = latestRecordReceivedTime;
        v83 = 2048;
        v84 = v34;
        v85 = 2048;
        v86 = v40;
        _os_log_impl(&dword_19AF50000, v39, OS_LOG_TYPE_INFO, "%s Activation source: %ld, Time since activation: %f, last election record received time: %llu, current time: %llu, activation expiration time: %llu", buf, 0x3Eu);

      }
      if (TimeInterval > 0.949999988
        && v34 < -[AFMyriadContext activationExpirationTime](self->_currentMyriadContext, "activationExpirationTime")
        && self->_latestRecordReceivedTime >= self->_voiceTriggerTime)
      {
        myriadWorkQueue = self->_myriadWorkQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __35__AFMyriadCoordinator__enterState___block_invoke;
        block[3] = &unk_1E3A36F30;
        block[4] = self;
        dispatch_async(myriadWorkQueue, block);
      }
      else
      {
LABEL_30:
        self->_inTask = 1;
        self->_ducking = 1;
        self->_nTimesContinued = 0;
        replies = self->_replies;
        triggerRecord = self->_triggerRecord;
        -[AFMyriadRecord deviceID](triggerRecord, "deviceID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "UUIDString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](replies, "setObject:forKey:", triggerRecord, v44);

        self->_lastPHash = -[AFMyriadRecord pHash](self->_triggerRecord, "pHash");
        -[AFMyriadCoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
        -[AFMyriadRecord asAdvertisementData](self->_triggerRecord, "asAdvertisementData");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFMyriadCoordinator _addElectionAdvertisementDataToMyriadSession:](self, "_addElectionAdvertisementDataToMyriadSession:", v45);

        -[AFMyriadCoordinator _setupActionWindows](self, "_setupActionWindows");
        -[AFMyriadCoordinator _setOverallTimeout](self, "_setOverallTimeout");
        -[AFMyriadCoordinator _advertiseTrigger](self, "_advertiseTrigger");
      }
      return;
    case 2uLL:
      self->_slowdownMsecs = 0;
      v46 = CFSTR("listen late");
      LODWORD(v11) = 1.0;
      v47 = self;
      v48 = 4;
      goto LABEL_77;
    case 3uLL:
      self->_recordType = 9;
      -[AFMyriadCoordinator lateSuppressionRecord](self, "lateSuppressionRecord");
      v49 = objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    case 4uLL:
      if (self->_nTimesContinued >= 5)
        -[AFPowerAssertionManager releaseAllPowerAssertions](self->_powerAssertionManager, "releaseAllPowerAssertions");
      if (!self->_inSetupMode && !self->_inTask)
        goto LABEL_43;
      nTimesContinued = self->_nTimesContinued;
      if (self->_clientRespondingToCarPlay && !nTimesContinued)
      {
        v51 = self->_currentMyriadContext;
        if (v51)
        {
          self->_currentMyriadContext = 0;

        }
        -[AFMyriadCoordinator _resetAudioData](self, "_resetAudioData");
        nTimesContinued = self->_nTimesContinued;
      }
      self->_nTimesContinued = nTimesContinued + 1;
      if (nTimesContinued < 20)
      {
        -[AFMyriadCoordinator _stopAdvertisingAndListening](self, "_stopAdvertisingAndListening");
        v56 = self;
        v57 = 5;
LABEL_80:
        -[AFMyriadCoordinator _duringNextWindowEnterState:](v56, "_duringNextWindowEnterState:", v57);
      }
      else
      {
LABEL_43:
        -[AFMyriadCoordinator _enterState:](self, "_enterState:", 0);
      }
      return;
    case 5uLL:
      v52 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v53 = self->_nTimesContinued;
        *(_DWORD *)buf = 136315394;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        v78 = 1024;
        *(_DWORD *)v79 = v53;
        _os_log_impl(&dword_19AF50000, v52, OS_LOG_TYPE_INFO, "%s BTLE task continuation: %d", buf, 0x12u);
      }
      if (AFIsHorseman_onceToken != -1)
        dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
      if (!AFIsHorseman_isHorseman)
      {
        v72 = self;
        v73 = 4;
        goto LABEL_82;
      }
      self->_recordType = 2;
      -[AFMyriadCoordinator continuationRecord](self, "continuationRecord");
      v49 = objc_claimAutoreleasedReturnValue();
LABEL_51:
      v54 = (void *)v49;
      -[AFMyriadCoordinator _advertise:andMoveTo:](self, "_advertise:andMoveTo:", v49, 4);
LABEL_69:

      break;
    case 6uLL:
      -[AFMyriadCoordinator directTriggerRecord](self, "directTriggerRecord");
      v49 = objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    case 7uLL:
      v55 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        _os_log_impl(&dword_19AF50000, v55, OS_LOG_TYPE_INFO, "%s BTLE task MYR_WAIT_EMERGENCY_OR_TASK only stopping advertising, not listening", buf, 0xCu);
      }
      -[AFMyriadCoordinator _stopAdvertising:](self, "_stopAdvertising:", 0);
      -[AFMyriadCoordinator _startListening:](self, "_startListening:", 0);
      -[AFPowerAssertionManager releaseAllPowerAssertions](self->_powerAssertionManager, "releaseAllPowerAssertions");
      self->_slowdownMsecs = 0;
      self->_inTask = 0;
      self->_ignoreInTaskTimer = 0;
      v56 = self;
      v57 = 10;
      goto LABEL_80;
    case 8uLL:
      self->_recordType = 4;
      -[AFMyriadCoordinator emergencyRecord](self, "emergencyRecord");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadCoordinator _advertise:andMoveTo:](self, "_advertise:andMoveTo:", v58, 11);

      v59 = objc_loadWeakRetained(&self->_delegate);
      v60 = objc_opt_respondsToSelector();

      if ((v60 & 1) == 0)
        return;
      v54 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v54, "myriadCoordinatorIsAdvertisingEmergency:", self);
      goto LABEL_69;
    case 9uLL:
      v61 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        _os_log_impl(&dword_19AF50000, v61, OS_LOG_TYPE_INFO, "%s BTLE emergency is being handled", buf, 0xCu);
      }
      self->_recordType = 5;
      -[AFMyriadCoordinator emergencyHandledRecord](self, "emergencyHandledRecord");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadCoordinator _advertise:andMoveTo:](self, "_advertise:andMoveTo:", v62, 4);

      -[AFMyriadEmergencyCallPunchout initiateEmergencyCallMyriad](self->_callPunchout, "initiateEmergencyCallMyriad");
      v63 = objc_loadWeakRetained(&self->_delegate);
      v64 = objc_opt_respondsToSelector();

      if ((v64 & 1) == 0)
        return;
      v54 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v54, "myriadCoordinatorWillHandleEmergency:", self);
      goto LABEL_69;
    case 0xAuLL:
      nTimesExtended = self->_nTimesExtended;
      self->_nTimesExtended = nTimesExtended + 1;
      if (nTimesExtended > 18)
        goto LABEL_78;
      -[AFMyriadCoordinator _startListening:](self, "_startListening:", 0);
      v46 = CFSTR("listen wait/emergency");
      LODWORD(v11) = 0.75;
      goto LABEL_76;
    case 0xBuLL:
      v66 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        _os_log_impl(&dword_19AF50000, v66, OS_LOG_TYPE_INFO, "%s BTLE task MYR_WAIT_EMERGENCY_HANDLED only stopping advertising, not listening", buf, 0xCu);
      }
      -[AFMyriadCoordinator _stopAdvertising:](self, "_stopAdvertising:", 0);
      v56 = self;
      v57 = 12;
      goto LABEL_80;
    case 0xCuLL:
      v67 = self->_nTimesExtended;
      self->_nTimesExtended = v67 + 1;
      if (v67 > 18)
      {
LABEL_78:
        v72 = self;
        v73 = 0;
LABEL_82:
        -[AFMyriadCoordinator enterState:](v72, "enterState:", v73);
      }
      else
      {
        -[AFMyriadCoordinator _startListening:](self, "_startListening:", 0);
        v46 = CFSTR("listen emergency handled");
        LODWORD(v11) = 0.75;
        v47 = self;
        v48 = 11;
LABEL_77:
        -[AFMyriadCoordinator _startTimer:for:thenEnterState:](v47, "_startTimer:for:thenEnterState:", v46, v48, v11);
      }
      break;
    case 0xDuLL:
      -[AFMyriadCoordinator directTriggerRecord](self, "directTriggerRecord");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadCoordinator _advertiseIndefinite:](self, "_advertiseIndefinite:", v54);
      goto LABEL_69;
    case 0xEuLL:
      v68 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v69 = self->_coordinationEnabled;
        v70 = self->_BLEActivityEnabled;
        *(_DWORD *)buf = 136315650;
        v77 = "-[AFMyriadCoordinator _enterState:]";
        v78 = 1024;
        *(_DWORD *)v79 = v69;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v70;
        _os_log_impl(&dword_19AF50000, v68, OS_LOG_TYPE_INFO, "%s #myriad coordinationEnabled=%d, BLEActivityEnabled=%d ", buf, 0x18u);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.decision.won"), 0, 0, 1u);
      -[AFMyriadCoordinator _cancelOverallTimeout](self, "_cancelOverallTimeout");
      -[AFMyriadCoordinator _advertiseSuppressTriggerInOutput](self, "_advertiseSuppressTriggerInOutput");
      return;
    case 0xFuLL:
      -[AFMyriadCoordinator resetReplies](self, "resetReplies");
      -[AFMyriadCoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
      -[AFMyriadCoordinator _startListeningAfterWiProxIsReady:inState:completion:](self, "_startListeningAfterWiProxIsReady:inState:completion:", 0, 15, 0);
      v46 = CFSTR("preheat timer");
      LODWORD(v11) = 2.0;
      goto LABEL_76;
    case 0x10uLL:
      self->_recordType = 8;
      -[AFMyriadCoordinator _advertiseSlowdown](self, "_advertiseSlowdown");
      return;
    case 0x11uLL:
      -[AFMyriadCoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
      -[AFMyriadCoordinator _startListening:](self, "_startListening:", 0);
      v46 = CFSTR("filter initialization timer");
      LODWORD(v11) = 1.0;
LABEL_76:
      v47 = self;
      v48 = 0;
      goto LABEL_77;
    default:
      return;
  }
}

- (void)enterState:(unint64_t)a3
{
  NSObject *myriadWorkQueue;
  _QWORD v4[6];

  myriadWorkQueue = self->_myriadWorkQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__AFMyriadCoordinator_enterState___block_invoke;
  v4[3] = &unk_1E3A353C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(myriadWorkQueue, v4);
}

- (id)_stateAsString
{
  return -[AFMyriadCoordinator _stateAsString:](self, "_stateAsString:", self->_myriadState);
}

- (id)_stateAsString:(unint64_t)a3
{
  if (a3 > 0x11)
    return CFSTR("<AFMYR_State_ERROR>");
  else
    return off_1E3A33878[a3];
}

- (void)_enteringIntoState:(unint64_t)a3 fromState:(unint64_t)a4
{
  if (a4 == 1)
  {
    self->_clientIsDeciding = 0;
    -[AFMyriadCoordinator _resetAdvertisementTimings](self, "_resetAdvertisementTimings", a3);
  }
}

- (void)resetReplies
{
  NSMutableDictionary *v3;
  NSMutableDictionary *replies;
  NSMutableDictionary *v5;
  NSMutableDictionary *replyCounts;

  objc_storeStrong((id *)&self->_repliesBeforeDecision, self->_replies);
  v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  replies = self->_replies;
  self->_replies = v3;

  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  replyCounts = self->_replyCounts;
  self->_replyCounts = v5;

}

- (void)_startListening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  AFMyriadCoordinator *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[AFMyriadCoordinator _startListening:]";
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  -[AFMyriadCoordinator _enterBLEDiagnosticMode](self, "_enterBLEDiagnosticMode");
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __39__AFMyriadCoordinator__startListening___block_invoke;
  v15 = &unk_1E3A36FA0;
  v16 = self;
  v6 = v4;
  v17 = v6;
  -[AFMyriadCoordinator _waitWiProxAndExecute:](self, "_waitWiProxAndExecute:", &v12);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "listeningDidBegin:", self, v12, v13, v14, v15, v16);

    }
  }

}

- (void)_startListeningAfterWiProxIsReady:(BOOL)a3 inState:(unint64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  id waitForWiproxReadinessToScan;
  _QWORD v12[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v6 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v6 && !self->_BTLEReady)
  {
    v9 = AFSiriLogContextMyriad;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[AFMyriadCoordinator _startListeningAfterWiProxIsReady:inState:completion:]";
      v17 = 2048;
      v18 = a4;
      _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s Waiting for wiprox to be ready in state: %lu", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__AFMyriadCoordinator__startListeningAfterWiProxIsReady_inState_completion___block_invoke;
    v12[3] = &unk_1E3A33560;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = (id)a4;
    v13 = v8;
    v10 = (void *)MEMORY[0x1A1AC0C3C](v12);
    waitForWiproxReadinessToScan = self->_waitForWiproxReadinessToScan;
    self->_waitForWiproxReadinessToScan = v10;

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[AFMyriadCoordinator _startListening:](self, "_startListening:", v8);
  }

}

- (void)startListening
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AFMyriadCoordinator_startListening__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)startListening:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__AFMyriadCoordinator_startListening___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (BOOL)_shouldStopListeningBeforeAdvertising
{
  return (self->_previousState < 0x12) & (0x37FFCu >> self->_previousState);
}

- (void)_stopAdvertising:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  AFMyriadCoordinator *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[AFMyriadCoordinator _stopAdvertising:]";
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __40__AFMyriadCoordinator__stopAdvertising___block_invoke;
  v15 = &unk_1E3A36FA0;
  v16 = self;
  v6 = v4;
  v17 = v6;
  -[AFMyriadCoordinator _waitWiProxAndExecute:](self, "_waitWiProxAndExecute:", &v12);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "advertisingDidEnd:", self, v12, v13, v14, v15, v16);

    }
  }

}

- (void)_stopListening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  AFMyriadCoordinator *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[AFMyriadCoordinator _stopListening:]";
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __38__AFMyriadCoordinator__stopListening___block_invoke;
  v15 = &unk_1E3A36FA0;
  v16 = self;
  v6 = v4;
  v17 = v6;
  -[AFMyriadCoordinator _waitWiProxAndExecute:](self, "_waitWiProxAndExecute:", &v12);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v11, "listeningDidEnd:", self, v12, v13, v14, v15, v16);

    }
  }

}

- (void)stopListening
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AFMyriadCoordinator_stopListening__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (void)stopListening:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AFMyriadCoordinator_stopListening___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)_stopAdvertisingAndListening
{
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  _QWORD v13[5];

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__AFMyriadCoordinator__stopAdvertisingAndListening__block_invoke;
  v13[3] = &unk_1E3A36F30;
  v13[4] = self;
  -[AFMyriadCoordinator _waitWiProx:andExecute:](self, "_waitWiProx:andExecute:", 2000, v13);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v7, "advertisingDidEnd:", self);

    }
  }
  v8 = objc_loadWeakRetained(&self->_delegate);
  if (v8)
  {
    v9 = v8;
    v10 = objc_loadWeakRetained(&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v12, "listeningDidEnd:", self);

    }
  }
}

- (void)_unduck
{
  id *p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  if (self->_coordinationEnabled)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained(p_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained(p_delegate);
        objc_msgSend(v8, "shouldUnduck:", self);

      }
    }
  }
}

- (void)_handleStateMachineErrorIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_stateMachineEncounteredError)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[AFMyriadCoordinator _handleStateMachineErrorIfNeeded]";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE notify Myriad win due to state machine error", (uint8_t *)&v10, 0xCu);
    }
    v4 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    self->_lastDecisionTime = (unint64_t)(*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v4);
    if (AFIsInternalInstall_onceToken != -1)
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
    if (AFIsInternalInstall_isInternal)
      -[AFMyriadCoordinator _triggerABCForType:context:](self, "_triggerABCForType:context:", CFSTR("state_machine_error"), 0);
    self->_lastDecision = 1;
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained(&self->_delegate);
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        v9 = objc_loadWeakRetained(&self->_delegate);
        objc_msgSend(v9, "shouldContinue:", self);

      }
    }
    kdebug_trace();
    -[AFNotifyStatePublisher publishState:](self->_electionWinPublisher, "publishState:", -[AFMyriadCoordinator _nextElectionPublisherState](self, "_nextElectionPublisherState"));
    self->_stateMachineEncounteredError = 0;
  }
}

- (double)_contextFetchDelayForAdvertimentInterval:(double)a3 advertisementDelay:(double)a4
{
  return a3 + -0.2;
}

- (BOOL)_shouldUseContextCollector
{
  unint64_t myriadState;

  myriadState = self->_myriadState;
  return myriadState == 1 || myriadState == 14;
}

- (id)_testAndFilterAdvertisementsFromContextCollector:(id)a3 voiceTriggerEndTime:(double)a4 advertisementDispatchTime:(double)a5 advertisement:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  id v31;
  double v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __132__AFMyriadCoordinator__testAndFilterAdvertisementsFromContextCollector_voiceTriggerEndTime_advertisementDispatchTime_advertisement___block_invoke;
    v29[3] = &unk_1E3A33588;
    v32 = a4;
    v29[4] = self;
    v30 = v10;
    v12 = v11;
    v31 = v12;
    v24 = v9;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v29);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            *(_DWORD *)buf = 136315394;
            v34 = "-[AFMyriadCoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertiseme"
                  "ntDispatchTime:advertisement:]";
            v35 = 2112;
            v36 = v19;
            _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, "%s #myriad %@", buf, 0x16u);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v15);
    }

    v20 = v31;
    v21 = v13;

    v9 = v24;
  }
  else
  {
    v22 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[AFMyriadCoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDisp"
            "atchTime:advertisement:]";
      _os_log_impl(&dword_19AF50000, v22, OS_LOG_TYPE_INFO, "%s #myriad Context collector returned 0 AFMyriadAdvertisementContextRecords instances", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (void)_suppressDeviceIfNeededWithVoiceTriggerEndTime:(double)a3 adverisementDispatchTime:(double)a4
{
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *replies;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AFMyriadInstrumentation *myriadInstrumentation;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  _QWORD v24[9];
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v7 = a4 - a3;
  if (v7 >= 0.0)
    v8 = v7;
  else
    v8 = -v7;
  v9 = -[NSMutableDictionary count](self->_replies, "count");
  v10 = v9;
  if (v8 > 1.45000005 && v9 != 0)
  {
    replies = self->_replies;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __95__AFMyriadCoordinator__suppressDeviceIfNeededWithVoiceTriggerEndTime_adverisementDispatchTime___block_invoke;
    v24[3] = &unk_1E3A335B0;
    *(double *)&v24[5] = a3;
    *(double *)&v24[6] = a4;
    *(double *)&v24[7] = v8;
    v24[8] = v10;
    v24[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](replies, "enumerateKeysAndObjectsUsingBlock:", v24);
  }
  if (self->_suppressLateTrigger)
  {
    v25[0] = CFSTR("voiceTriggerEndTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v25[1] = CFSTR("advertisementDispatchTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v14;
    v25[2] = CFSTR("count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logEventWithType:context:", 2018, v16);

    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      v19 = -[AFMyriadCoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
      -[AFMyriadSession sessionId](self->_myriadSession, "sessionId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = mach_absolute_time();
      LODWORD(v22) = 0;
      LODWORD(v23) = 0.75;
      -[AFMyriadInstrumentation logCDAElectionAdvertisingStarting:withDelay:withInterval:withCdaId:withTimestamp:](myriadInstrumentation, "logCDAElectionAdvertisingStarting:withDelay:withInterval:withCdaId:withTimestamp:", v19, v20, v21, v22, v23);

    }
  }
}

- (void)_pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:(double)a3 advertisementDelay:(double)a4
{
  _BOOL4 clientIsDirectActivating;
  NSObject *v6;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  unint64_t voiceTriggerTime;
  AFMyriadAdvertisementContextRecord *v18;
  AFMyriadAdvertisementContextRecord *contextRecord;
  void *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  AFMyriadAdvertisementContext *v28;
  AFMyriadAdvertisementContext *v29;
  AFMyriadAdvertisementContextManager *advContextManager;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  double v35;
  double v36;
  _QWORD v37[4];
  id v38;
  id v39;
  double v40;
  double v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  _BYTE v45[28];
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  clientIsDirectActivating = self->_clientIsDirectActivating;
  if (self->_clientIsDirectActivating || self->_clientIsInEarActivation)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
      v44 = 1024;
      *(_DWORD *)v45 = 1;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = clientIsDirectActivating;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s #myriad Not pushing myriad advertisement context - HAL context donation enabled: %d, direct activation: %d", buf, 0x18u);
    }
  }
  else
  {
    v9 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    v10 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v9 / 1000000000.0
        - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)self->_voiceTriggerTime / 1000000000.0;
    if (v10 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      v13 = v12;
      v14 = v12 - v10;
      -[AFMyriadSession currentElectionAdvertisementData](self->_myriadSession, "currentElectionAdvertisementData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        voiceTriggerTime = self->_voiceTriggerTime;
        *(_DWORD *)buf = 136316674;
        v43 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
        v44 = 2048;
        *(double *)v45 = v13;
        *(_WORD *)&v45[8] = 2048;
        *(double *)&v45[10] = v14;
        *(_WORD *)&v45[18] = 2048;
        *(double *)&v45[20] = v10;
        v46 = 2048;
        v47 = voiceTriggerTime;
        v48 = 2048;
        v49 = v9;
        v50 = 2112;
        v51 = v15;
        _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, "%s #myriad adv dispatch time: %f, voice trigger end time: %f, time since voice trigger: %f (curr time: %llu, time since device boot: %llu), advertisement: %@", buf, 0x48u);
      }
      if (v15)
      {
        v18 = -[AFMyriadAdvertisementContextRecord initWithAdvertisementRecordType:voiceTriggerEndTime:advertisementPayload:deviceID:]([AFMyriadAdvertisementContextRecord alloc], "initWithAdvertisementRecordType:voiceTriggerEndTime:advertisementPayload:deviceID:", self->_recordType, v15, self->_designatedSelfID, v14);
        contextRecord = self->_contextRecord;
        self->_contextRecord = v18;

        -[AFMyriadAdvertisementContextRecord setAdvertisementDispatchTime:](self->_contextRecord, "setAdvertisementDispatchTime:", v13);
        -[AFMyriadAdvertisementContextRecord myriadAdvertisementContextAsData](self->_contextRecord, "myriadAdvertisementContextAsData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (AFIsInternalInstall_onceToken != -1)
          dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
        if (AFIsInternalInstall_isInternal)
        {
          -[AFMyriadAdvertisementContextRecord description](self->_contextRecord, "description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }
        -[AFMyriadSession currentElectionAdvertisementId](self->_myriadSession, "currentElectionAdvertisementId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = +[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled");
        v26 = MEMORY[0x1E0C809B0];
        if (!v25)
        {
          +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = v26;
          v37[1] = 3221225472;
          v37[2] = __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke;
          v37[3] = &unk_1E3A335D8;
          v40 = v14;
          v41 = v13;
          v38 = v24;
          v39 = v21;
          objc_msgSend(v27, "logEventWithType:contextProvider:", 2013, v37);

        }
        v28 = [AFMyriadAdvertisementContext alloc];
        -[AFMyriadCoordinator _contextFetchDelayForAdvertimentInterval:advertisementDelay:](self, "_contextFetchDelayForAdvertimentInterval:advertisementDelay:", a3, a4);
        v29 = -[AFMyriadAdvertisementContext initWithGeneration:contextData:contextFetchDelay:](v28, "initWithGeneration:contextData:contextFetchDelay:", 0, v20);
        advContextManager = self->_advContextManager;
        v32[0] = v26;
        v32[1] = 3221225472;
        v32[2] = __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_2;
        v32[3] = &unk_1E3A33628;
        v32[4] = self;
        v33 = v24;
        v35 = v14;
        v36 = v13;
        v34 = v15;
        v31 = v24;
        -[AFMyriadAdvertisementContextManager pushMyriadAdvertisementContext:completionHandler:](advContextManager, "pushMyriadAdvertisementContext:completionHandler:", v29, v32);

      }
      else
      {
        v22 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v23 = self->_voiceTriggerTime;
          *(_DWORD *)buf = 136315906;
          v43 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:]";
          v44 = 1024;
          *(_DWORD *)v45 = 1;
          *(_WORD *)&v45[4] = 2048;
          *(_QWORD *)&v45[6] = v23;
          *(_WORD *)&v45[14] = 2048;
          *(_QWORD *)&v45[16] = v9;
          _os_log_impl(&dword_19AF50000, v22, OS_LOG_TYPE_INFO, "%s #myriad Not pushing myriad advertisement context - Valid voicetrigger endtime: %d (curr time: %llu, time since device boot: %llu)", buf, 0x26u);
        }
      }

    }
  }
}

- (void)_updateArbitrationParticipationContextWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  AFArbitrationParticipationContext *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  AFMyriadSession *myriadSession;
  void *v13;
  AFMyriadInstrumentation *myriadInstrumentation;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  AFArbitrationParticipationContext *v18;
  AFMyriadCoordinator *v19;
  id v20;
  void (**v21)(_QWORD);
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled"))
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:]";
      _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback", buf, 0xCu);
    }
    v6 = objc_alloc_init(AFArbitrationParticipationContext);
    -[AFArbitrationParticipationContext setOwnAdvertisement:](v6, "setOwnAdvertisement:", self->_triggerRecord);
    if (-[NSMutableDictionary count](self->_repliesBeforeDecision, "count"))
      -[AFMyriadCoordinator _sortedReplies:](self, "_sortedReplies:", self->_repliesBeforeDecision);
    else
      -[AFMyriadCoordinator _sortedReplies](self, "_sortedReplies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[AFArbitrationParticipationContext setAdvertisements:](v6, "setAdvertisements:", v7);
    -[AFArbitrationParticipationContext setRequestStartDate:](v6, "setRequestStartDate:", self->_triggerTime);
    -[AFArbitrationParticipationContext setDecisionIsWon:](v6, "setDecisionIsWon:", self->_lastDecision);
    -[AFMyriadGoodnessScoreEvaluator lastActivationTime](self->_goodnessScoreEvaluator, "lastActivationTime");
    -[AFArbitrationParticipationContext setLastActivationTime:](v6, "setLastActivationTime:");
    -[AFMyriadCoordinator _triggerTypeForArbitrationParticipationFrom:](self, "_triggerTypeForArbitrationParticipationFrom:", self->_recordType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFArbitrationParticipationContext setTriggerType:](v6, "setTriggerType:", v8);
    v9 = mach_absolute_time();
    if (_AFMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    v10 = *(double *)&_AFMachAbsoluteTimeRate_rate;
    if (self->_recordType == 10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -(*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v9 / 1000000000.0- *(double *)&_AFMachAbsoluteTimeRate_rate * (double)self->_voiceTriggerTime / 1000000000.0));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        -[AFArbitrationParticipationContext setVoiceTriggerDate:](v6, "setVoiceTriggerDate:", v11);

    }
    myriadSession = self->_myriadSession;
    if (myriadSession)
    {
      v13 = (void *)-[AFMyriadSession copy](myriadSession, "copy", v10);
      myriadInstrumentation = self->_myriadInstrumentation;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__AFMyriadCoordinator__updateArbitrationParticipationContextWithCompletion___block_invoke;
      v17[3] = &unk_1E3A33650;
      v18 = v6;
      v19 = self;
      v20 = v13;
      v21 = v4;
      v15 = v13;
      -[AFMyriadInstrumentation getPreviousBoostsWithCompletion:](myriadInstrumentation, "getPreviousBoostsWithCompletion:", v17);

    }
    else
    {
      v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:]";
        _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s #myriad #feedback session is nil.", buf, 0xCu);
      }
      v4[2](v4);
    }

  }
}

- (id)_triggerTypeForArbitrationParticipationFrom:(int64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = self->_recordType - 1;
  if (v4 > 9)
    v5 = &unk_1E3AA6EC8;
  else
    v5 = (void *)qword_1E3A33908[v4];
  v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v6;
    objc_msgSend(v8, "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[AFMyriadCoordinator _triggerTypeForArbitrationParticipationFrom:]";
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback recordType: %@, type: %@", (uint8_t *)&v11, 0x20u);

  }
  return v5;
}

- (void)_resetAudioData
{
  self->_voiceTriggerTime = 0;
}

- (void)_setupActionWindows
{
  NSDate *v3;
  NSDate *triggerTime;
  void *v5;
  NSDateFormatter *dateFormat;
  NSDate *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  triggerTime = self->_triggerTime;
  self->_triggerTime = v3;

  self->_nDeltaTs = 0;
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    dateFormat = self->_dateFormat;
    v7 = self->_triggerTime;
    v8 = v5;
    -[NSDateFormatter stringFromDate:](dateFormat, "stringFromDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[AFMyriadCoordinator _setupActionWindows]";
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s BTLE action window trigger time: %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_resetActionWindows
{
  NSDate *triggerTime;

  triggerTime = self->_triggerTime;
  self->_triggerTime = 0;

  self->_slowdownMsecs = 0;
}

- (void)_adjustActionWindowsFromSlowdown:(int)a3
{
  NSDate *v5;
  NSDate *triggerTime;
  void *v7;
  NSDateFormatter *dateFormat;
  NSDate *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSDate dateByAddingTimeInterval:](self->_triggerTime, "dateByAddingTimeInterval:", (double)a3 / 1000.0);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    triggerTime = self->_triggerTime;
    self->_triggerTime = v5;

    v7 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      dateFormat = self->_dateFormat;
      v9 = self->_triggerTime;
      v10 = v7;
      -[NSDateFormatter stringFromDate:](dateFormat, "stringFromDate:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[AFMyriadCoordinator _adjustActionWindowsFromSlowdown:]";
      v14 = 1024;
      v15 = a3;
      v16 = 2112;
      v17 = v11;
      _os_log_debug_impl(&dword_19AF50000, v10, OS_LOG_TYPE_DEBUG, "%s BTLE action window adjusted by slowdown signal %d msecs new time: %@", (uint8_t *)&v12, 0x1Cu);

    }
  }
}

- (void)_duringNextWindowExecute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_triggerTime)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", self->_triggerTime, (float)((float)self->_nDeltaTs * 1.5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", v5) == -1)
    {
      do
      {
        v8 = self->_nDeltaTs + 1;
        self->_nDeltaTs = v8;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", self->_triggerTime, (float)((float)v8 * 1.5));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v7;
      }
      while (objc_msgSend(v7, "compare:", v5) == -1);
    }
    else
    {
      v7 = v6;
    }
    -[NSDateFormatter stringFromDate:](self->_dateFormat, "stringFromDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "-[AFMyriadCoordinator _duringNextWindowExecute:]";
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s BTLE next action window: %@", (uint8_t *)&v12, 0x16u);
    }
    -[AFMyriadCoordinator _createDispatchTimerForEvent:toExecute:](self, "_createDispatchTimerForEvent:toExecute:", v7, v4);

  }
  else
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[AFMyriadCoordinator _duringNextWindowExecute:]";
      _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s BTLE Attempt to execute time windowed action when trigger time not initialized", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void)_duringNextWindowEnterState:(unint64_t)a3
{
  _QWORD v5[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AFMyriadCoordinator__duringNextWindowEnterState___block_invoke;
  v5[3] = &unk_1E3A33538;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  -[AFMyriadCoordinator _duringNextWindowExecute:](self, "_duringNextWindowExecute:", v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)setupAdvIntervalsInDelay:(float *)a3 interval:(float *)a4 withSlowdown:(int)a5
{
  float v9;
  unint64_t voiceTriggerTime;
  double v11;
  double v12;
  uint64_t v13;
  float v14;
  NSObject *v15;
  float v16;
  float v17;
  double v18;
  NSObject *v19;
  const char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = (double)a5 / 1000.0;
  voiceTriggerTime = self->_voiceTriggerTime;
  if (_AFMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
  v11 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)voiceTriggerTime / 1000000000.0;
  v12 = v9;
  v13 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
  v14 = v11 + 1.45000005 + v12 + *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v13 / -1000000000.0;
  v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v21 = 136316162;
    v22 = "-[AFMyriadCoordinator setupAdvIntervalsInDelay:interval:withSlowdown:]";
    v23 = 2048;
    v24 = v11;
    v25 = 2048;
    v26 = v11 + 1.45000005 + v12;
    v27 = 2048;
    v28 = v14;
    v29 = 1024;
    v30 = a5;
    _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s endTime: %f targetTime: %f, advInterval: %f, slowDown: %d (ms)", (uint8_t *)&v21, 0x30u);
  }
  v16 = 1.0;
  if (v14 <= 1.0)
  {
    v17 = 0.0;
    v16 = 0.5;
    if (v14 >= 0.5)
      v16 = v14;
  }
  else if ((float)(v14 + -1.0) <= 0.45)
  {
    v17 = v14 + -1.0;
  }
  else
  {
    v17 = 0.0;
  }
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    -[AFMyriadPreferences testDeviceDelay](self->_preferences, "testDeviceDelay");
    if (v18 != 0.0)
      v17 = v18;
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v21 = 136315906;
      v22 = "-[AFMyriadCoordinator setupAdvIntervalsInDelay:interval:withSlowdown:]";
      v23 = 2048;
      v24 = v16;
      v25 = 2048;
      v26 = v17;
      v27 = 2048;
      v28 = v12;
      v20 = "%s adjusted advInterval: %f (secs) device delay: %f (secs), slowDown: %f (secs)";
LABEL_22:
      _os_log_impl(&dword_19AF50000, v19, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v21, 0x2Au);
    }
  }
  else
  {
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v21 = 136315906;
      v22 = "-[AFMyriadCoordinator setupAdvIntervalsInDelay:interval:withSlowdown:]";
      v23 = 2048;
      v24 = v16;
      v25 = 2048;
      v26 = v17;
      v27 = 2048;
      v28 = v12;
      v20 = "%s adjusted advInterval: %f (secs) adjusted delay: %f (secs), slowDown: %f (secs)";
      goto LABEL_22;
    }
  }
  *a3 = v17;
  *a4 = v16;
}

- (void)_resetAdvertisementTimings
{
  NSDate *advertTriggerAdvStartTime;
  NSDate *advertTriggerEndTime;

  advertTriggerAdvStartTime = self->_advTiming.advertTriggerAdvStartTime;
  self->_advTiming.advertTriggerAdvStartTime = 0;

  advertTriggerEndTime = self->_advTiming.advertTriggerEndTime;
  self->_advTiming.advertTriggerEndTime = 0;

}

- (void)_advertiseTrigger
{
  float deviceTrumpDelay;
  float deviceInEarDelay;
  float deviceInEarInterval;
  void *v6;
  int testInducedSlowdownMsecs;
  int slowdownMsecs;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  id WeakRetained;
  char v15;
  id v16;
  double v17;
  AFMyriadRecord *maxSlowdownRecord;
  void *v19;
  double v20;
  double v21;
  uint64_t *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  AFMyriadRecord *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  AFMyriadCoordinator *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  AFMyriadCoordinator *v38;
  int v39;
  _QWORD v40[5];
  float v41;
  float v42;
  float v43;
  float v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  _BYTE v48[10];
  double v49[3];

  v49[2] = *(double *)MEMORY[0x1E0C80C00];
  v43 = 0.5;
  v44 = 0.0;
  if (self->_clientIsWatchTrumpPromote)
    goto LABEL_32;
  if (self->_clientIsDirectActivating)
  {
    deviceTrumpDelay = self->_deviceTrumpDelay;
    v44 = deviceTrumpDelay;
    goto LABEL_9;
  }
  if (self->_clientIsInEarActivation || self->_clientRespondingToCarPlay)
  {
    deviceInEarDelay = self->_deviceInEarDelay;
    deviceInEarInterval = self->_deviceInEarInterval;
    v43 = deviceInEarInterval;
    v44 = deviceInEarDelay;
  }
  else
  {
LABEL_32:
    if (self->_voiceTriggerTime)
      -[AFMyriadCoordinator setupAdvIntervalsInDelay:interval:withSlowdown:](self, "setupAdvIntervalsInDelay:interval:withSlowdown:", &v44, &v43, 0);
  }
LABEL_9:
  if (!self->_clientIsDirectActivating)
    -[AFNotifyStatePublisher publishState:](self->_electionBeginPublisher, "publishState:", -[AFMyriadCoordinator _nextElectionPublisherState](self, "_nextElectionPublisherState"));
  v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    testInducedSlowdownMsecs = self->_testInducedSlowdownMsecs;
    slowdownMsecs = self->_slowdownMsecs;
    v9 = v6;
    -[AFMyriadCoordinator _stateAsString](self, "_stateAsString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v46 = "-[AFMyriadCoordinator _advertiseTrigger]";
    v47 = 1024;
    *(_DWORD *)v48 = testInducedSlowdownMsecs;
    *(_WORD *)&v48[4] = 1024;
    *(_DWORD *)&v48[6] = slowdownMsecs;
    LOWORD(v49[0]) = 2112;
    *(_QWORD *)((char *)v49 + 2) = v10;
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s BTLE checking if slowdown needed testmsecs=%d msecs=%d state=%@", buf, 0x22u);

  }
  v11 = self->_testInducedSlowdownMsecs;
  if (v11 < 1 || self->_clientDoneRespondingToSlowdown)
  {
    v12 = self->_slowdownMsecs;
    if ((int)v12 <= 0)
    {
      v13 = AFSiriLogContextConnection;
    }
    else
    {
      v13 = AFSiriLogContextConnection;
      if (self->_clientIsRespondingToSlowdown)
      {
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v46 = "-[AFMyriadCoordinator _advertiseTrigger]";
          _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown delay, 2nd pass seen", buf, 0xCu);
          v12 = self->_slowdownMsecs;
        }
        *(_DWORD *)buf = 0;
        v39 = 1056964608;
        -[AFMyriadCoordinator setupAdvIntervalsInDelay:interval:withSlowdown:](self, "setupAdvIntervalsInDelay:interval:withSlowdown:", buf, &v39, v12);
        -[AFMyriadCoordinator _adjustActionWindowsFromSlowdown:](self, "_adjustActionWindowsFromSlowdown:", self->_slowdownMsecs);
        WeakRetained = objc_loadWeakRetained(&self->_delegate);
        v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) != 0)
        {
          v16 = objc_loadWeakRetained(&self->_delegate);
          *(float *)&v17 = (float)self->_slowdownMsecs;
          objc_msgSend(v16, "myriadCoordinator:willStartAdvertisingWithSlowDownInterval:", self, v17);

        }
        self->_slowdownMsecs = 0;
        self->_clientIsRespondingToSlowdown = 0;
        maxSlowdownRecord = self->_maxSlowdownRecord;
        self->_maxSlowdownRecord = 0;

        -[AFMyriadRecord generateTiebreaker](self->_triggerRecord, "generateTiebreaker");
        -[AFMyriadRecord asAdvertisementData](self->_triggerRecord, "asAdvertisementData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = *(_DWORD *)buf;
        LODWORD(v21) = v39;
        v34 = MEMORY[0x1E0C809B0];
        v35 = 3221225472;
        v36 = __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_366;
        v37 = &unk_1E3A36F30;
        v38 = self;
        v22 = &v34;
LABEL_26:
        -[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:thenExecute:", v19, v22, v20, v21, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);

        return;
      }
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v46 = "-[AFMyriadCoordinator _advertiseTrigger]";
      v47 = 2048;
      *(double *)v48 = v44;
      *(_WORD *)&v48[8] = 2048;
      v49[0] = v43;
      _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s BTLE computed advertising delay: %f finished, interval: %f", buf, 0x20u);
    }
    -[AFMyriadRecord asAdvertisementData](self->_triggerRecord, "asAdvertisementData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v21 = v43;
    *(float *)&v20 = v44;
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_367;
    v32 = &unk_1E3A36F30;
    v33 = self;
    v22 = &v29;
    goto LABEL_26;
  }
  v23 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[AFMyriadCoordinator _advertiseTrigger]";
    _os_log_impl(&dword_19AF50000, v23, OS_LOG_TYPE_INFO, "%s BTLE advertising TEST INDUCED slowdown delay, 2nd pass seen", buf, 0xCu);
    v11 = self->_testInducedSlowdownMsecs;
  }
  self->_delayTarget = v44;
  self->_advertInterval = v43;
  -[AFMyriadCoordinator slowdownRecord:](self, "slowdownRecord:", (unsigned __int16)v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "asAdvertisementData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  self->_slowdownMsecs = 0;
  self->_clientIsRespondingToSlowdown = 0;
  v26 = self->_maxSlowdownRecord;
  self->_maxSlowdownRecord = 0;

  *(float *)&v27 = self->_delayTarget;
  *(float *)&v28 = self->_advertInterval;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __40__AFMyriadCoordinator__advertiseTrigger__block_invoke;
  v40[3] = &unk_1E3A353C0;
  v41 = v44;
  v42 = v43;
  v40[4] = self;
  -[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:thenExecute:", v25, v40, v27, v28);

}

- (void)_advertiseSlowdown
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  AFMyriadRecord *maxSlowdownRecord;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v12[5];
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&self->_delayTarget = 0x3F8000003EE66668;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[AFMyriadCoordinator _advertiseSlowdown]";
    v17 = 2048;
    v18 = 0x3FDCCCCD00000000;
    v19 = 2048;
    v20 = 0x3FF0000000000000;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE slowdown advertising delay: %f finished, interval: %f", buf, 0x20u);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("delay");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_slowdownMsecs);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logEventWithType:context:", 2007, v6);

  }
  self->_clientDoneRespondingToSlowdown = 0;
  maxSlowdownRecord = self->_maxSlowdownRecord;
  self->_maxSlowdownRecord = 0;

  kdebug_trace();
  -[AFMyriadCoordinator slowdownRecord:](self, "slowdownRecord:", LOWORD(self->_slowdownMsecs));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAdvertisementData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = self->_delayTarget;
  *(float *)&v11 = self->_advertInterval;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__AFMyriadCoordinator__advertiseSlowdown__block_invoke;
  v12[3] = &unk_1E3A36F30;
  v12[4] = self;
  -[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:thenExecute:", v9, v12, v10, v11);

}

- (BOOL)_okayToSuppressOnOutput
{
  return (self->_myriadState > 0x11) | (0x54B5u >> self->_myriadState) & 1;
}

- (void)_advertiseSuppressTriggerInOutput
{
  uint64_t v3;
  double v4;
  unint64_t voiceTriggerTime;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  unint64_t previousState;
  NSObject *v12;
  void *v13;
  void *v14;
  _BOOL4 clientIsDeciding;
  unint64_t v16;
  _QWORD v17[5];
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
  v4 = *(double *)&_AFMachAbsoluteTimeRate_rate;
  voiceTriggerTime = self->_voiceTriggerTime;
  v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v10 = v4 * (double)v3 / 1000000000.0
        - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)voiceTriggerTime / 1000000000.0;
    previousState = self->_previousState;
    v12 = v6;
    -[AFMyriadCoordinator _stateAsString:](self, "_stateAsString:", previousState);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFMyriadCoordinator _stateAsString:](self, "_stateAsString:", self->_myriadState);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    clientIsDeciding = self->_clientIsDeciding;
    v16 = self->_voiceTriggerTime;
    *(_DWORD *)buf = 136316418;
    v20 = "-[AFMyriadCoordinator _advertiseSuppressTriggerInOutput]";
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 1024;
    v26 = clientIsDeciding;
    v27 = 2048;
    v28 = v16;
    v29 = 2048;
    v30 = v10;
    _os_log_debug_impl(&dword_19AF50000, v12, OS_LOG_TYPE_DEBUG, "%s fromState: %@, myriadState: %@, is _clientIsDeciding: %d, _voiceTriggerTime: %llu, secondsSinceVoiceTrigger: %f", buf, 0x3Au);

  }
  if (-[AFMyriadCoordinator _okayToSuppressOnOutput](self, "_okayToSuppressOnOutput"))
  {
    v18 = 1056964608;
    *(_DWORD *)buf = 0;
    if (self->_voiceTriggerTime)
      -[AFMyriadCoordinator setupAdvIntervalsInDelay:interval:withSlowdown:](self, "setupAdvIntervalsInDelay:interval:withSlowdown:", buf, &v18, 0);
    -[AFMyriadRecord asAdvertisementData](self->_triggerRecord, "asAdvertisementData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFMyriadCoordinator _createMyriadSessionIfRequired](self, "_createMyriadSessionIfRequired");
    -[AFMyriadCoordinator _addElectionAdvertisementDataToMyriadSession:](self, "_addElectionAdvertisementDataToMyriadSession:", v7);
    LODWORD(v9) = v18;
    LODWORD(v8) = *(_DWORD *)buf;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__AFMyriadCoordinator__advertiseSuppressTriggerInOutput__block_invoke;
    v17[3] = &unk_1E3A36F30;
    v17[4] = self;
    -[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:thenExecute:", v7, v17, v8, v9);

  }
}

- (void)_advertise:(id)a3 andMoveTo:(unint64_t)a4
{
  double v4;
  double v5;

  LODWORD(v4) = 0;
  LODWORD(v5) = 0.75;
  -[AFMyriadCoordinator _advertise:afterDelay:maxInterval:andMoveTo:](self, "_advertise:afterDelay:maxInterval:andMoveTo:", a3, a4, v4, v5);
}

- (void)_advertise:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 andMoveTo:(unint64_t)a6
{
  void *v9;
  double v10;
  _QWORD v11[5];

  self->_nextState = a6;
  objc_msgSend(a3, "asAdvertisementData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__AFMyriadCoordinator__advertise_afterDelay_maxInterval_andMoveTo___block_invoke;
  v11[3] = &unk_1E3A36F30;
  v11[4] = self;
  *(float *)&v10 = a5;
  -[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:thenExecute:", v9, v11, COERCE_DOUBLE((unint64_t)LODWORD(a4)), v10);

}

- (void)_advertiseIndefinite:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AFMyriadCoordinator *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__AFMyriadCoordinator__advertiseIndefinite___block_invoke;
  v6[3] = &unk_1E3A36FC8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[AFMyriadCoordinator _waitWiProxAndExecute:](self, "_waitWiProxAndExecute:", v6);

}

- (void)startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  id v8;
  NSObject *myriadWorkQueue;
  id v10;
  _QWORD block[5];
  id v12;
  float v13;
  float v14;

  v8 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AFMyriadCoordinator_startAdvertising_afterDelay_maxInterval___block_invoke;
  block[3] = &unk_1E3A353E8;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(myriadWorkQueue, block);

}

- (void)_startAdvertising:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  double v8;
  double v9;
  id v10;

  self->_recordType = 7;
  objc_msgSend(a3, "asAdvertisementData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  *(float *)&v9 = a5;
  -[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:](self, "_advertiseWith:afterDelay:maxInterval:thenExecute:", v10, 0, v8, v9);

}

- (void)advertiseWith:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AFMyriadCoordinator_advertiseWith___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void)advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5
{
  id v8;
  NSObject *myriadWorkQueue;
  id v10;
  _QWORD block[5];
  id v12;
  float v13;
  float v14;

  v8 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke;
  block[3] = &unk_1E3A353E8;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(myriadWorkQueue, block);

}

- (void)_advertiseWith:(id)a3 afterDelay:(float)a4 maxInterval:(float)a5 thenExecute:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  NSData *previousAdvertisedData;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  char v20;
  id v21;
  double v22;
  double v23;
  NSObject *v24;
  double v25;
  NSData *v26;
  NSObject *v27;
  double v28;
  _QWORD v29[5];
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  id v32;
  float v33;
  float v34;
  _QWORD v35[5];
  id v36;
  float v37;
  float v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke;
  v35[3] = &unk_1E3A33678;
  v35[4] = self;
  v13 = v10;
  v36 = v13;
  v37 = a5;
  v38 = a4;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AC0C3C](v35);
  previousAdvertisedData = self->_previousAdvertisedData;
  if (previousAdvertisedData && -[NSData isEqualToData:](previousAdvertisedData, "isEqualToData:", v13))
  {
    v16 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v26 = self->_previousAdvertisedData;
      v27 = v16;
      -[NSData description](v26, "description");
      v28 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v40 = "-[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:]";
      v41 = 2112;
      v42 = v28;
      _os_log_error_impl(&dword_19AF50000, v27, OS_LOG_TYPE_ERROR, "%s BTLE error: attempting to readvertise %@", buf, 0x16u);

    }
    self->_stateMachineEncounteredError = 1;
    -[AFMyriadCoordinator _enterState:](self, "_enterState:", 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (WeakRetained)
    {
      v18 = WeakRetained;
      v19 = objc_loadWeakRetained(&self->_delegate);
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        v21 = objc_loadWeakRetained(&self->_delegate);
        *(float *)&v22 = a4;
        *(float *)&v23 = a5;
        objc_msgSend(v21, "advertisingWillBeginWithDelay:advertisingInterval:", v22, v23);

      }
    }
    v24 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:]";
      v41 = 2048;
      v42 = a4;
      _os_log_impl(&dword_19AF50000, v24, OS_LOG_TYPE_INFO, "%s BTLE starting advert delay timer for %f secs", buf, 0x16u);
    }
    if (a4 == 0.0)
    {
      ((void (**)(_QWORD, id, id))v14)[2](v14, v13, v11);
    }
    else
    {
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_388;
      v29[3] = &unk_1E3A336A0;
      v29[4] = self;
      v33 = a4;
      v34 = a5;
      v31 = v14;
      v30 = v13;
      v32 = v11;
      *(float *)&v25 = a4;
      -[AFMyriadCoordinator _startTimer:for:thenExecute:](self, "_startTimer:for:thenExecute:", CFSTR("advert delay"), v29, v25);

    }
  }

}

- (id)voiceTriggerRecord
{
  void *v3;
  void *v4;
  AFMyriadRecord *v5;
  uint64_t v6;
  unint64_t *p_voiceTriggerTime;

  -[AFMyriadContext perceptualAudioHash](self->_currentMyriadContext, "perceptualAudioHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[AFMyriadRecord initWithAudioData:]([AFMyriadRecord alloc], "initWithAudioData:", v4);
  if (objc_msgSend(v4, "length") == 12)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_voiceTriggerTime, 4, 8);
LABEL_6:
    -[AFMyriadRecord generateTiebreaker](v5, "generateTiebreaker");
    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "length");
  p_voiceTriggerTime = &self->_voiceTriggerTime;
  if (v6 != 13)
  {
    *p_voiceTriggerTime = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "getBytes:range:", p_voiceTriggerTime, 4, 8);
LABEL_7:
  -[AFMyriadRecord setIsMe:](v5, "setIsMe:", 1);
  -[AFMyriadRecord setDeviceID:](v5, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v5, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v5, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v5, "setProductType:", self->_productType);

  return v5;
}

- (id)_phsSetupRecord
{
  AFMyriadRecord *v3;

  v3 = objc_alloc_init(AFMyriadRecord);
  -[AFMyriadRecord setPHash:](v3, "setPHash:", 63993);
  -[AFMyriadRecord setIsMe:](v3, "setIsMe:", 1);
  -[AFMyriadRecord generateTiebreaker](v3, "generateTiebreaker");
  -[AFMyriadRecord generateRandomConfidence](v3, "generateRandomConfidence");
  -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 249);
  -[AFMyriadRecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)directTriggerRecord
{
  void *v3;
  void *v4;
  unint64_t *p_voiceTriggerTime;
  void *v6;
  unint64_t *v7;
  AFMyriadRecord *v8;
  uint64_t v10;
  uint64_t v11;

  -[AFMyriadContext perceptualAudioHash](self->_currentMyriadContext, "perceptualAudioHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length") == 12)
  {
    p_voiceTriggerTime = &self->_voiceTriggerTime;
    v6 = v4;
LABEL_5:
    objc_msgSend(v6, "getBytes:range:", p_voiceTriggerTime, 4, 8);
    goto LABEL_6;
  }
  v7 = &self->_voiceTriggerTime;
  if (objc_msgSend(v4, "length") == 13)
  {
    v6 = v4;
    p_voiceTriggerTime = &self->_voiceTriggerTime;
    goto LABEL_5;
  }
  if (!*v7)
    goto LABEL_11;
  v10 = mach_absolute_time();
  if (_AFMachAbsoluteTimeRate_onceToken != -1)
  {
    v11 = v10;
    dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    v10 = v11;
  }
  if (*(double *)&_AFMachAbsoluteTimeRate_rate * (double)v10 / 1000000000.0
     - *(double *)&_AFMachAbsoluteTimeRate_rate * (double)*v7 / 1000000000.0 > 1.45000005)
LABEL_11:
    *v7 = 0;
LABEL_6:
  v8 = objc_alloc_init(AFMyriadRecord);
  -[AFMyriadRecord setPHash:](v8, "setPHash:", 0xFFFFLL);
  -[AFMyriadRecord setIsMe:](v8, "setIsMe:", 1);
  -[AFMyriadRecord generateTiebreaker](v8, "generateTiebreaker");
  -[AFMyriadRecord generateRandomConfidence](v8, "generateRandomConfidence");
  -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](v8, "setRawAudioGoodnessScore:withBump:", 0, 255);
  -[AFMyriadRecord setDeviceID:](v8, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v8, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v8, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v8, "setProductType:", self->_productType);

  return v8;
}

- (id)lateSuppressionRecord
{
  AFMyriadRecord *v3;

  v3 = objc_alloc_init(AFMyriadRecord);
  -[AFMyriadRecord setPHash:](v3, "setPHash:", self->_lastPHash);
  -[AFMyriadRecord setIsMe:](v3, "setIsMe:", 1);
  -[AFMyriadRecord generateTiebreaker](v3, "generateTiebreaker");
  -[AFMyriadRecord generateRandomConfidence](v3, "generateRandomConfidence");
  -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 255);
  -[AFMyriadRecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)continuationRecord
{
  AFMyriadRecord *v3;

  v3 = objc_alloc_init(AFMyriadRecord);
  -[AFMyriadRecord setPHash:](v3, "setPHash:", 0xFFFFLL);
  -[AFMyriadRecord setIsMe:](v3, "setIsMe:", 1);
  -[AFMyriadRecord generateTiebreaker](v3, "generateTiebreaker");
  -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 0);
  -[AFMyriadRecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)emergencyRecord
{
  AFMyriadRecord *v3;

  v3 = objc_alloc_init(AFMyriadRecord);
  -[AFMyriadRecord setPHash:](v3, "setPHash:", 0);
  -[AFMyriadRecord setIsMe:](v3, "setIsMe:", 1);
  -[AFMyriadRecord generateTiebreaker](v3, "generateTiebreaker");
  -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 239);
  -[AFMyriadRecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)emergencyHandledRecord
{
  AFMyriadRecord *v3;

  v3 = objc_alloc_init(AFMyriadRecord);
  -[AFMyriadRecord setPHash:](v3, "setPHash:", 0);
  -[AFMyriadRecord setIsMe:](v3, "setIsMe:", 1);
  -[AFMyriadRecord generateTiebreaker](v3, "generateTiebreaker");
  -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 224);
  -[AFMyriadRecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (id)responseObject:(unsigned __int16)a3
{
  uint64_t v3;
  AFMyriadRecord *v5;

  v3 = a3;
  v5 = objc_alloc_init(AFMyriadRecord);
  -[AFMyriadRecord setPHash:](v5, "setPHash:", v3);
  -[AFMyriadRecord setIsMe:](v5, "setIsMe:", 1);
  -[AFMyriadRecord generateTiebreaker](v5, "generateTiebreaker");
  -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](v5, "setRawAudioGoodnessScore:withBump:", 0, 255);
  -[AFMyriadRecord setDeviceID:](v5, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v5, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v5, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v5, "setProductType:", self->_productType);
  return v5;
}

- (id)slowdownRecord:(unsigned __int16)a3
{
  uint64_t v4;
  AFMyriadRecord *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  AFMyriadRecord *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((a3 >> 3) >= 0xFF)
    v4 = 255;
  else
    v4 = a3 >> 3;
  v5 = objc_alloc_init(AFMyriadRecord);
  -[AFMyriadRecord setPHash:](v5, "setPHash:", 0);
  -[AFMyriadRecord setIsMe:](v5, "setIsMe:", 1);
  -[AFMyriadRecord setUserConfidence:](v5, "setUserConfidence:", v4);
  -[AFMyriadRecord generateTiebreaker](v5, "generateTiebreaker");
  -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](v5, "setRawAudioGoodnessScore:withBump:", 0, 208);
  -[AFMyriadRecord setDeviceID:](v5, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v5, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v5, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v5, "setProductType:", self->_productType);
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[AFMyriadCoordinator slowdownRecord:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s BTLE created slowdown record %@", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (id)emptyRecord
{
  AFMyriadRecord *v3;

  v3 = objc_alloc_init(AFMyriadRecord);
  -[AFMyriadRecord setPHash:](v3, "setPHash:", 0);
  -[AFMyriadRecord setIsMe:](v3, "setIsMe:", 1);
  -[AFMyriadRecord setTieBreaker:](v3, "setTieBreaker:", 0);
  -[AFMyriadRecord setRawAudioGoodnessScore:withBump:](v3, "setRawAudioGoodnessScore:withBump:", 0, 0);
  -[AFMyriadRecord setDeviceID:](v3, "setDeviceID:", self->_designatedSelfID);
  -[AFMyriadRecord setDeviceGroup:](v3, "setDeviceGroup:", self->_deviceGroup);
  -[AFMyriadRecord setDeviceClass:](v3, "setDeviceClass:", self->_deviceClass);
  -[AFMyriadRecord setProductType:](v3, "setProductType:", self->_productType);
  return v3;
}

- (BOOL)_shouldContinueFor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSMutableDictionary *replies;
  NSDate *lastWonBySmallAmountDate;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  char v20;
  int v21;
  void *v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  NSMutableDictionary *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AFMyriadCoordinator _sortedReplies](self, "_sortedReplies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    replies = self->_replies;
    *(_DWORD *)buf = 136315394;
    v36 = "-[AFMyriadCoordinator _shouldContinueFor:]";
    v37 = 2112;
    v38 = replies;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s BTLE end advertising summary: %@", buf, 0x16u);
  }
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_390);
  lastWonBySmallAmountDate = self->_lastWonBySmallAmountDate;
  self->_lastWonBySmallAmountDate = 0;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v31;
LABEL_5:
    v14 = 0;
    v29 = v12 + v11;
    while (1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v9);
      if (v4)
      {
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v15, "deviceClass"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v4, "containsObject:", v16);

        if (!v17)
          break;
      }
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        v12 = v29;
        if (v11)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    v20 = objc_msgSend(v15, "isATrump");
    v21 = objc_msgSend(v15, "isMe");
    v19 = v20 & v21;
    if ((v20 & 1) == 0)
    {
      v18 = v9;
      if (!v21)
        goto LABEL_29;
      if (v12 + v14 + 1 < (unint64_t)objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "objectAtIndex:", v12 + v14 + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v15, "goodness");
        if ((int)(v23 - objc_msgSend(v22, "goodness")) <= 2)
        {
          v24 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v36 = "-[AFMyriadCoordinator _shouldContinueFor:]";
            _os_log_impl(&dword_19AF50000, v24, OS_LOG_TYPE_INFO, "%s #myriad Won by a small margin, storing state to mitigate recency boost", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x1E0C99D68], "date", self);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = *(void **)(v28 + 624);
          *(_QWORD *)(v28 + 624) = v25;

        }
      }
      v19 = 1;
    }
    v18 = v9;
  }
  else
  {
LABEL_12:

    objc_msgSend(v9, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isATrump"))
      self->_clientLostDueToTrumping = 1;
    if ((objc_msgSend(v18, "isMe", self) & 1) == 0
      && objc_msgSend(v18, "isInEarTrump")
      && -[AFMyriadRecord isInEarTrump](self->_triggerRecord, "isInEarTrump"))
    {
      v19 = 1;
    }
    else
    {
      v19 = objc_msgSend(v18, "isMe");
    }
  }
LABEL_29:

  return v19;
}

- (BOOL)_shouldHandleEmergency
{
  void *v3;
  NSObject *v4;
  NSMutableDictionary *replies;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSMutableDictionary *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[AFMyriadCoordinator _sortedReplies:](self, "_sortedReplies:", self->_repliesBeforeDecision);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    replies = self->_replies;
    *(_DWORD *)buf = 136315394;
    v24 = "-[AFMyriadCoordinator _shouldHandleEmergency]";
    v25 = 2112;
    v26 = replies;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s BTLE emergencyCallSummary: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_391);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      if (-[AFMyriadCoordinator _isAPhone:](self, "_isAPhone:", objc_msgSend(v11, "deviceClass", (_QWORD)v18)))
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v13 = objc_msgSend(v11, "isMe");
    v14 = AFSiriLogContextConnection;
    v15 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[AFMyriadCoordinator _shouldHandleEmergency]";
        v16 = "%s BTLE Emergency call: this device should handle";
LABEL_19:
        _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[AFMyriadCoordinator _shouldHandleEmergency]";
      v16 = "%s BTLE Emergency call: This device should NOT handle, another is better";
      goto LABEL_19;
    }

    goto LABEL_21;
  }
LABEL_11:

  v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[AFMyriadCoordinator _shouldHandleEmergency]";
    _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s BTLE Emergency Call: No device available to handle this call", buf, 0xCu);
  }
  LOBYTE(v13) = 0;
LABEL_21:

  return v13;
}

- (BOOL)_isAPhone:(unsigned __int8)a3
{
  return a3 == 2;
}

- (id)_sortedReplies
{
  return -[AFMyriadCoordinator _sortedReplies:](self, "_sortedReplies:", self->_replies);
}

- (id)_sortedReplies:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(a3, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_393);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__AFMyriadCoordinator__sortedReplies___block_invoke_2;
    v9[3] = &unk_1E3A33768;
    v10 = v6;
    v11 = v5;
    v7 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  }
  return v5;
}

- (BOOL)_inTaskTriggerWasTooSoon
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  NSDate *v7;
  NSDate *v8;
  double v9;
  double v10;
  BOOL v11;
  _BOOL4 v12;
  int v13;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _BOOL4 v26;
  const char *v27;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (self->_ignoreInTaskTimer && AFCDAFaceDetection())
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v29 = 136315138;
      v30 = "-[AFMyriadCoordinator _inTaskTriggerWasTooSoon]";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s #myriad got attention, ignoring too-soon time limit.", (uint8_t *)&v29, 0xCu);
    }
    goto LABEL_13;
  }
  if (self->_triggerTime)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", self->_triggerTime);
    v6 = v5;
    v7 = self->_advTiming.advertTriggerAdvStartTime;
    v8 = v7;
    v9 = 3.40282347e38;
    if (v7)
      -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", v4, 3.40282347e38);
    if (v9 >= 0.0)
      v10 = v9;
    else
      v10 = 3.40282347e38;
    if (self->_clientIsDirectActivating)
    {
      v11 = 0;
      v12 = v6 < self->_deviceTrumpDelay;
    }
    else
    {
      v12 = 0;
      v11 = !self->_clientIsInEarActivation;
    }
    v15 = v10 > 0.5 || v8 == 0;
    v16 = self->_myriadState == 1 && v15;
    v17 = !v11 && v16;
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      v21 = v20;
      -[NSDate timeIntervalSinceReferenceDate](self->_triggerTime, "timeIntervalSinceReferenceDate");
      v23 = v22;
      -[NSDate timeIntervalSinceReferenceDate](v8, "timeIntervalSinceReferenceDate");
      v29 = 136317186;
      v30 = "-[AFMyriadCoordinator _inTaskTriggerWasTooSoon]";
      v31 = 2048;
      v32 = v21;
      v33 = 2048;
      v34 = v23;
      v35 = 2048;
      v36 = v24;
      v37 = 2048;
      v38 = v6;
      v39 = 2048;
      v40 = v10;
      v41 = 1024;
      v42 = v6 < 0.5;
      v43 = 1024;
      v44 = v12;
      v45 = 1024;
      v46 = v17;
      _os_log_impl(&dword_19AF50000, v19, OS_LOG_TYPE_INFO, "%s #myriad CurrentTime: %f TrigerTime: %f, ElectionAdvertisementTime: %f, triggerDelta: %f, electionAdvertisementRemainingTime: %f [isIntaskTooSoonForVoiceTriggerActivation = %d, isIntaskTooSoonForDirectActivation = %d, currentElectionAdvertisementIsSane = %d]", (uint8_t *)&v29, 0x50u);

      v18 = AFSiriLogContextConnection;
    }
    v25 = v6 < 0.5 || v12;
    v13 = v25 | v17;
    v26 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v13 == 1)
    {
      if (v26)
      {
        v29 = 136315138;
        v30 = "-[AFMyriadCoordinator _inTaskTriggerWasTooSoon]";
        v27 = "%s #myriad BTLE in-task continuous voice trigger heard too soon. Ignoring.";
LABEL_37:
        _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v29, 0xCu);
      }
    }
    else if (v26)
    {
      v29 = 136315138;
      v30 = "-[AFMyriadCoordinator _inTaskTriggerWasTooSoon]";
      v27 = "%s #myriad BTLE in-task continious voice trigger heard. NOT ignoring.";
      goto LABEL_37;
    }

    return v13;
  }
LABEL_13:
  LOBYTE(v13) = 0;
  return v13;
}

- (void)_updateRepliesWith:(id)a3 id:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  _BYTE v18[24];
  _BYTE v19[10];
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKey:](self->_replies, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isAContinuation") && (objc_msgSend(v8, "isAContinuation") & 1) == 0)
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
LABEL_12:
      *(_DWORD *)v18 = 136315650;
      *(_QWORD *)&v18[4] = "-[AFMyriadCoordinator _updateRepliesWith:id:data:]";
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v10;
      *(_WORD *)&v18[22] = 2112;
      *(_QWORD *)v19 = v9;
      _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s BTLE Updating record table, data= %@, for %@", v18, 0x20u);
    }
LABEL_13:
    -[NSMutableDictionary setObject:forKey:](self->_replies, "setObject:forKey:", v8, v9, *(_OWORD *)v18, *(_QWORD *)&v18[16], *(_QWORD *)v19);
    goto LABEL_14;
  }
  v13 = objc_msgSend(v8, "isALateSupressionTrumpFor:", v12);
  v14 = AFSiriLogContextConnection;
  v15 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      v16 = v14;
      *(_DWORD *)v18 = 136316162;
      *(_QWORD *)&v18[4] = "-[AFMyriadCoordinator _updateRepliesWith:id:data:]";
      *(_WORD *)&v18[12] = 1024;
      *(_DWORD *)&v18[14] = objc_msgSend(v12, "goodness");
      *(_WORD *)&v18[18] = 1024;
      *(_DWORD *)&v18[20] = objc_msgSend(v8, "goodness");
      *(_WORD *)v19 = 2112;
      *(_QWORD *)&v19[2] = v10;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, "%s BTLE Updating record table with a late supression(%hhu -> %hhu), data= %@, for %@", v18, 0x2Cu);

    }
    goto LABEL_13;
  }
  if (v15)
  {
    *(_DWORD *)v18 = 136315650;
    *(_QWORD *)&v18[4] = "-[AFMyriadCoordinator _updateRepliesWith:id:data:]";
    *(_WORD *)&v18[12] = 2112;
    *(_QWORD *)&v18[14] = v10;
    *(_WORD *)&v18[22] = 2112;
    *(_QWORD *)v19 = v9;
    _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s BTLE ignoring this advert because one already exists, data= %@, for %@", v18, 0x20u);
  }
LABEL_14:

}

- (void)notifyCurrentDecisionResult
{
  NSObject *myriadWorkQueue;
  _QWORD block[5];

  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AFMyriadCoordinator_notifyCurrentDecisionResult__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(myriadWorkQueue, block);
}

- (unint64_t)_nextElectionPublisherState
{
  unint64_t electionPublisherState;
  unint64_t v3;

  electionPublisherState = self->_electionPublisherState;
  if (electionPublisherState)
    v3 = (electionPublisherState + 1) % 0x3D;
  else
    v3 = 1;
  self->_electionPublisherState = v3;
  return v3;
}

- (int)_myriadStateForSelf:(unint64_t)a3
{
  if (a3 < 0x12)
    return a3 + 1;
  else
    return 0;
}

- (BOOL)_testAndUpdateWedgeFilter:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *incomingTrumps;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "userConfidence") | (objc_msgSend(v4, "tieBreaker") << 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isATrump"))
  {
    incomingTrumps = self->_incomingTrumps;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](incomingTrumps, "setObject:forKey:", v7, v5);

    v8 = objc_msgSend(v4, "deviceClass");
    if (AFIsHorseman_onceToken != -1)
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
    if (AFIsHorseman_isHorseman && v8 == 6)
    {
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v16 = 136315394;
        v17 = "-[AFMyriadCoordinator _testAndUpdateWedgeFilter:]";
        v18 = 2112;
        v19 = v4;
        v10 = "%s BTLE ignoring incoming event bad device class for Horseman %@";
LABEL_11:
        _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 0x16u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_previousTrumps, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v16 = 136315394;
        v17 = "-[AFMyriadCoordinator _testAndUpdateWedgeFilter:]";
        v18 = 2112;
        v19 = v4;
        v10 = "%s BTLE ignoring as wedged suppress %@";
        goto LABEL_11;
      }
LABEL_12:
      v12 = 0;
      goto LABEL_16;
    }
  }
  v13 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v16 = 136315650;
    v17 = "-[AFMyriadCoordinator _testAndUpdateWedgeFilter:]";
    v18 = 2112;
    v19 = v4;
    v20 = 1024;
    v21 = objc_msgSend(v4, "isSane");
    _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s BTLE record %@  isSane: %d", (uint8_t *)&v16, 0x1Cu);

  }
  v12 = objc_msgSend(v4, "isSane");
LABEL_16:

  return v12;
}

- (void)_ageWedgeFilter
{
  NSMutableDictionary *previousTrumps;
  NSMutableDictionary **p_previousTrumps;
  NSMutableDictionary *v5;
  NSMutableDictionary *incomingTrumps;
  _QWORD v7[5];

  p_previousTrumps = &self->_previousTrumps;
  previousTrumps = self->_previousTrumps;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__AFMyriadCoordinator__ageWedgeFilter__block_invoke;
  v7[3] = &unk_1E3A34B58;
  v7[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](previousTrumps, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_storeStrong((id *)p_previousTrumps, self->_incomingTrumps);
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  incomingTrumps = self->_incomingTrumps;
  self->_incomingTrumps = v5;

}

- (void)_initializeWiProxReadinessTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *waitTimer;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[AFMyriadCoordinator _initializeWiProxReadinessTimer]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s #myriad WiProx readiness timer initialized", (uint8_t *)&v6, 0xCu);
  }
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_myriadWorkQueue);
  waitTimer = self->_wiproxReadinessTimer.waitTimer;
  self->_wiproxReadinessTimer.waitTimer = v4;

  dispatch_source_set_event_handler((dispatch_source_t)self->_wiproxReadinessTimer.waitTimer, &__block_literal_global_396);
  -[AFMyriadCoordinator _resumeWiProxReadinessTimer](self, "_resumeWiProxReadinessTimer");
}

- (void)_resumeWiProxReadinessTimer
{
  dispatch_resume((dispatch_object_t)self->_wiproxReadinessTimer.waitTimer);
  self->_wiproxReadinessTimer.isWaitTimerSuspended = 0;
}

- (void)_suspendWiProxReadinessTimer
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self->_wiproxReadinessTimer.isWaitTimerSuspended)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[AFMyriadCoordinator _suspendWiProxReadinessTimer]";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s #myriad WiProx readiness timer suspended", (uint8_t *)&v4, 0xCu);
    }
    self->_wiproxReadinessTimer.isWaitTimerSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_wiproxReadinessTimer.waitTimer);
  }
}

- (void)_clearWiProxReadinessTimer
{
  NSObject *v3;
  id waitBlock;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_wiproxReadinessTimer.waitTimer)
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "-[AFMyriadCoordinator _clearWiProxReadinessTimer]";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s #myriad WiProx readiness timer wait block cleared", (uint8_t *)&v5, 0xCu);
    }
    waitBlock = self->_wiproxReadinessTimer.waitBlock;
    self->_wiproxReadinessTimer.waitBlock = 0;

  }
}

- (void)_createWaitWiProxTimer:(int64_t)a3 waitBlock:(id)a4
{
  id v6;
  NSObject *waitTimer;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id waitBlock;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[5];

  v6 = a4;
  -[AFMyriadCoordinator _suspendWiProxReadinessTimer](self, "_suspendWiProxReadinessTimer");
  waitTimer = self->_wiproxReadinessTimer.waitTimer;
  v8 = dispatch_time(0, 1000000 * a3);
  dispatch_source_set_timer(waitTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__AFMyriadCoordinator__createWaitWiProxTimer_waitBlock___block_invoke;
  v19[3] = &unk_1E3A36F30;
  v19[4] = self;
  v10 = (void *)MEMORY[0x1A1AC0C3C](v19);
  dispatch_source_set_event_handler((dispatch_source_t)self->_wiproxReadinessTimer.waitTimer, v10);
  v14 = v9;
  v15 = 3221225472;
  v16 = __56__AFMyriadCoordinator__createWaitWiProxTimer_waitBlock___block_invoke_397;
  v17 = &unk_1E3A36BB8;
  v18 = v6;
  v11 = v6;
  v12 = (void *)MEMORY[0x1A1AC0C3C](&v14);
  waitBlock = self->_wiproxReadinessTimer.waitBlock;
  self->_wiproxReadinessTimer.waitBlock = v12;

  -[AFMyriadCoordinator _resumeWiProxReadinessTimer](self, "_resumeWiProxReadinessTimer", v14, v15, v16, v17);
}

- (void)_waitWiProx:(int64_t)a3 andExecute:(id)a4
{
  id v6;
  _BOOL4 BTLEReady;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  AFMyriadCoordinator *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BTLEReady = self->_BTLEReady;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __46__AFMyriadCoordinator__waitWiProx_andExecute___block_invoke;
  v16 = &unk_1E3A36FA0;
  v17 = self;
  v8 = v6;
  v18 = v8;
  v9 = MEMORY[0x1A1AC0C3C](&v13);
  v10 = (void *)v9;
  if (BTLEReady || !self->_BLEActivityEnabled)
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    v11 = -[WPHeySiri state](self->_heySiriBTLE, "state", v13, v14, v15, v16, v17);
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "-[AFMyriadCoordinator _waitWiProx:andExecute:]";
      v21 = 2048;
      v22 = a3;
      v23 = 2048;
      v24 = v11;
      _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s #myriad BTLE not ready, waiting to execute for up to %ld msecs (current HeySiri WPState %ld)", buf, 0x20u);
    }
    -[AFMyriadCoordinator _createWaitWiProxTimer:waitBlock:](self, "_createWaitWiProxTimer:waitBlock:", a3, v10);
  }

}

- (void)waitWiProx:(int64_t)a3 andExecute:(id)a4
{
  id v6;
  NSObject *myriadWorkQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  myriadWorkQueue = self->_myriadWorkQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AFMyriadCoordinator_waitWiProx_andExecute___block_invoke;
  block[3] = &unk_1E3A35410;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(myriadWorkQueue, block);

}

- (void)_waitWiProxAndExecute:(id)a3
{
  -[AFMyriadCoordinator _waitWiProx:andExecute:](self, "_waitWiProx:andExecute:", 100, a3);
}

- (void)_enterBLEDiagnosticMode
{
  NSObject *v3;
  SFDiagnostics *v4;
  SFDiagnostics *sfdiagnostics;
  uint64_t v6;
  SFDiagnostics *v7;
  void *v8;
  AFWatchdogTimer *v9;
  AFWatchdogTimer *sfDiagnosticsTimer;
  NSObject *v11;
  AFWatchdogTimer *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  AFWatchdogTimer *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_myriadWorkQueue)
    __assert_rtn("-[AFMyriadCoordinator _enterBLEDiagnosticMode]", "AFMyriadCoordinator.m", 3913, "_myriadWorkQueue");
  if (AFIsHorseman_onceToken != -1)
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
  if (!AFIsHorseman_isHorseman)
  {
    -[AFMyriadCoordinator _leaveBLEDiagnosticMode](self, "_leaveBLEDiagnosticMode");
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[AFMyriadCoordinator _enterBLEDiagnosticMode]";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE entering diagnostic mode", buf, 0xCu);
    }
    v4 = (SFDiagnostics *)objc_alloc_init((Class)getSFDiagnosticsClass());
    sfdiagnostics = self->_sfdiagnostics;
    self->_sfdiagnostics = v4;

    -[SFDiagnostics setDispatchQueue:](self->_sfdiagnostics, "setDispatchQueue:", self->_myriadWorkQueue);
    v6 = MEMORY[0x1E0C809B0];
    v7 = self->_sfdiagnostics;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__AFMyriadCoordinator__enterBLEDiagnosticMode__block_invoke;
    v14[3] = &unk_1E3A36A00;
    v14[4] = self;
    -[SFDiagnostics diagnosticBLEModeWithCompletion:](v7, "diagnosticBLEModeWithCompletion:", v14);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __46__AFMyriadCoordinator__enterBLEDiagnosticMode__block_invoke_404;
    v13[3] = &unk_1E3A36F30;
    v13[4] = self;
    v8 = (void *)MEMORY[0x1A1AC0C3C](v13);
    v9 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]([AFWatchdogTimer alloc], "initWithTimeoutInterval:onQueue:timeoutHandler:", self->_myriadWorkQueue, v8, 1.45000005);
    sfDiagnosticsTimer = self->_sfDiagnosticsTimer;
    self->_sfDiagnosticsTimer = v9;

    -[AFWatchdogTimer start](self->_sfDiagnosticsTimer, "start");
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v12 = self->_sfDiagnosticsTimer;
      *(_DWORD *)buf = 136315650;
      v16 = "-[AFMyriadCoordinator _enterBLEDiagnosticMode]";
      v17 = 2048;
      v18 = 0x3FF7333340000000;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s BTLE added diagnostic mode timer for %f seconds %@", buf, 0x20u);
    }

  }
}

- (void)_leaveBLEDiagnosticMode
{
  NSObject *v3;
  SFDiagnostics *sfdiagnostics;
  NSObject *v5;
  AFWatchdogTimer *sfDiagnosticsTimer;
  AFWatchdogTimer *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  AFWatchdogTimer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_myriadWorkQueue)
    __assert_rtn("-[AFMyriadCoordinator _leaveBLEDiagnosticMode]", "AFMyriadCoordinator.m", 3943, "_myriadWorkQueue");
  if (self->_sfdiagnostics)
  {
    if (AFIsHorseman_onceToken != -1)
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
    if (!AFIsHorseman_isHorseman)
    {
      v3 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v8 = 136315138;
        v9 = "-[AFMyriadCoordinator _leaveBLEDiagnosticMode]";
        _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE leaving diagnostic mode", (uint8_t *)&v8, 0xCu);
      }
      -[SFDiagnostics invalidate](self->_sfdiagnostics, "invalidate");
      sfdiagnostics = self->_sfdiagnostics;
      self->_sfdiagnostics = 0;

      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        sfDiagnosticsTimer = self->_sfDiagnosticsTimer;
        v8 = 136315650;
        v9 = "-[AFMyriadCoordinator _leaveBLEDiagnosticMode]";
        v10 = 2048;
        v11 = 0x3FF7333340000000;
        v12 = 2112;
        v13 = sfDiagnosticsTimer;
        _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s BTLE cancelling diagnostic mode timer for %f seconds %@", (uint8_t *)&v8, 0x20u);
      }
      -[AFWatchdogTimer cancel](self->_sfDiagnosticsTimer, "cancel");
      v7 = self->_sfDiagnosticsTimer;
      self->_sfDiagnosticsTimer = 0;

    }
  }
}

- (void)_triggerABCForType:(id)a3 context:(id)a4
{
  AFMyriadAdvertisementContextManager *advContextManager;

  advContextManager = self->_advContextManager;
  if (advContextManager)
    -[AFMyriadAdvertisementContextManager triggerABCForType:subType:context:](advContextManager, "triggerABCForType:subType:context:", CFSTR("Myriad"), a3, a4);
}

- (void)heySiriDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *myriadWorkQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    *(_DWORD *)buf = 136315394;
    v12 = "-[AFMyriadCoordinator heySiriDidUpdateState:]";
    v13 = 2048;
    v14 = objc_msgSend(v4, "state");
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s BTLE daemon state changed to: %ld", buf, 0x16u);

  }
  myriadWorkQueue = self->_myriadWorkQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__AFMyriadCoordinator_heySiriDidUpdateState___block_invoke;
  v9[3] = &unk_1E3A36FC8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(myriadWorkQueue, v9);

}

- (void)heySiri:(id)a3 foundDevice:(id)a4 withInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  AFMyriadRecord *v11;
  id WeakRetained;
  char v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *myriadWorkQueue;
  NSObject *v18;
  void *v19;
  _QWORD block[4];
  AFMyriadRecord *v21;
  AFMyriadCoordinator *v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  getWPHeySiriKeyManufacturerData();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = -[AFMyriadRecord initWithDeviceID:data:]([AFMyriadRecord alloc], "initWithDeviceID:data:", v7, v10);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v14, "myriadCoordinator:didReceiveAdvertisement:", self, v11);

  }
  if (-[AFMyriadRecord deviceGroup](v11, "deviceGroup") == self->_deviceGroup)
  {
    -[AFMyriadRecord deviceID](v11, "deviceID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    myriadWorkQueue = self->_myriadWorkQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__AFMyriadCoordinator_heySiri_foundDevice_withInfo___block_invoke;
    block[3] = &unk_1E3A337D8;
    v21 = v11;
    v22 = self;
    v23 = v7;
    v24 = v10;
    v25 = v16;
    v18 = v16;
    dispatch_async(myriadWorkQueue, block);

LABEL_10:
    goto LABEL_11;
  }
  v19 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v18 = v19;
    *(_DWORD *)buf = 136315906;
    v27 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]";
    v28 = 1024;
    v29 = -[AFMyriadRecord deviceGroup](v11, "deviceGroup");
    v30 = 2112;
    v31 = v7;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, "%s BTLE ignoring advert from other deviceGroup %d: %@ data= %@", buf, 0x26u);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)heySiriStartedAdvertisingAt:(id)a3 timeStamp:(unint64_t)a4
{
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  unint64_t Milliseconds;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (AFIsHorseman_onceToken != -1)
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
  v6 = AFIsHorseman_isHorseman;
  v7 = AFSiriLogContextConnection;
  v8 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v9 = v7;
      v10 = 136315394;
      v11 = "-[AFMyriadCoordinator heySiriStartedAdvertisingAt:timeStamp:]";
      v12 = 2048;
      Milliseconds = AFMachAbsoluteTimeGetMilliseconds(a4);
      _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising begins at: %lld", (uint8_t *)&v10, 0x16u);

    }
    -[AFMyriadCoordinator _trackHeySiriStartedAdvertisingAt:](self, "_trackHeySiriStartedAdvertisingAt:", a4);
  }
  else if (v8)
  {
    v10 = 136315138;
    v11 = "-[AFMyriadCoordinator heySiriStartedAdvertisingAt:timeStamp:]";
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s Not yet supported on this device.", (uint8_t *)&v10, 0xCu);
  }
}

- (void)heySiriStartedAdvertising:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t Milliseconds;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (AFIsHorseman_onceToken != -1)
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
  if (AFIsHorseman_isHorseman)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[AFMyriadCoordinator heySiriStartedAdvertising:]";
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s No longer used by this device.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v5 = mach_absolute_time();
    v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = 136315394;
      v9 = "-[AFMyriadCoordinator heySiriStartedAdvertising:]";
      v10 = 2048;
      Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v5);
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising begins at: %lld", (uint8_t *)&v8, 0x16u);

    }
    -[AFMyriadCoordinator _trackHeySiriStartedAdvertisingAt:](self, "_trackHeySiriStartedAdvertisingAt:", v5);
  }
}

- (void)_trackHeySiriStartedAdvertisingAt:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  AFMyriadInstrumentation *myriadInstrumentation;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  if (self->_myriadState != 5)
  {
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_myriadState, CFSTR("state"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logEventWithType:context:", 2003, v7);

    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      v9 = -[AFMyriadCoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
      -[AFMyriadSession sessionId](self->_myriadSession, "sessionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadInstrumentation logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:](myriadInstrumentation, "logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:", v9, v10, a3);

    }
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v13, "myriadCoordinatorBTLEDidStartAdvertising:", self);

  }
}

- (void)heySiriAdvertisingPending:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFMyriadCoordinator heySiriAdvertisingPending:]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising overridden and now pending", (uint8_t *)&v4, 0xCu);
  }
}

- (void)heySiriStoppedAdvertising:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  AFMyriadInstrumentation *myriadInstrumentation;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id WeakRetained;
  char v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  unint64_t Milliseconds;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  if (self->_myriadState != 5)
  {
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("state");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_myriadState);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logEventWithType:context:", 2005, v6);

    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      v8 = -[AFMyriadCoordinator _myriadStateForSelf:](self, "_myriadStateForSelf:", self->_myriadState);
      -[AFMyriadSession sessionId](self->_myriadSession, "sessionId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadInstrumentation logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:](myriadInstrumentation, "logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:", v8, v9, mach_absolute_time());

    }
  }
  v10 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = mach_absolute_time();
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFMyriadCoordinator heySiriStoppedAdvertising:]";
    v18 = 2048;
    Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v12);
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s BTLE daemon advertising ends at: %lld", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v15, "myriadCoordinatorBTLEDidEndAdvertising:", self);

  }
}

- (void)heySiri:(id)a3 failedToStartAdvertisingWithError:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[AFMyriadCoordinator heySiri:failedToStartAdvertisingWithError:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon failed to start advertising with error %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)heySiriStartedScanning:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[AFMyriadCoordinator heySiriStartedScanning:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon scanning begins", (uint8_t *)&v9, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v8, "myriadCoordinatorBTLEDidStartScanning:", self);

  }
}

- (void)heySiriStoppedScanning:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[AFMyriadCoordinator heySiriStoppedScanning:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s BTLE daemon scanning ends", (uint8_t *)&v9, 0xCu);
  }
  -[AFMyriadCoordinator _leaveBLEDiagnosticMode](self, "_leaveBLEDiagnosticMode");
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v8, "myriadCoordinatorBTLEDidEndScanning:", self);

  }
}

- (void)heySiri:(id)a3 failedToStartScanningWithError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  kdebug_trace();
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFMyriadCoordinator heySiri:failedToStartScanningWithError:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s BTLE daemon failed to start scanning with error %@", (uint8_t *)&v7, 0x16u);
  }
  -[AFMyriadCoordinator _leaveBLEDiagnosticMode](self, "_leaveBLEDiagnosticMode");

}

- (void)_signalEmergencyCallHandled
{
  NSObject *v3;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[AFMyriadCoordinator _signalEmergencyCallHandled]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v6, "myriadCoordinatorDidHandleEmergency:", self);

  }
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  AFNotifyObserver *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (AFNotifyObserver *)a3;
  v7 = (void *)AFSiriLogContextMyriad;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[AFNotifyObserver name](v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[AFMyriadCoordinator notifyObserver:didReceiveNotificationWithToken:]";
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = a4;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEFAULT, "%s Notification received: %@ (%d)", (uint8_t *)&v10, 0x1Cu);

  }
  if (self->_preferencesChangedNotification == v6)
  {
    -[AFMyriadCoordinator _readDefaults](self, "_readDefaults");
  }
  else if (self->_myriadStateMachineForceNoActivityObserver == v6)
  {
    if (AFIsInternalInstall_onceToken != -1)
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
    if (AFIsInternalInstall_isInternal)
      -[AFMyriadCoordinator _enterState:](self, "_enterState:", 0);
  }

}

- (void)injectAdvertisementForTesting:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    getWPHeySiriKeyManufacturerData();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v12 = v9;
      v13[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFMyriadCoordinator heySiri:foundDevice:withInfo:](self, "heySiri:foundDevice:withInfo:", self->_heySiriBTLE, v8, v11);

    }
  }

}

- (void)startListeningToEmergencySignal
{
  -[AFMyriadCoordinator _setupActionWindows](self, "_setupActionWindows");
  -[AFMyriadCoordinator _enterState:](self, "_enterState:", 7);
}

- (void)startAdvertisingEmergencySignal
{
  -[AFMyriadCoordinator _setupActionWindows](self, "_setupActionWindows");
  -[AFMyriadCoordinator _enterState:](self, "_enterState:", 8);
}

- (float)deviceTrumpDelay
{
  return self->_deviceTrumpDelay;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (void)myriadSession:(id)a3
{
  if (a3)
    (*((void (**)(id, AFMyriadSession *))a3 + 2))(a3, self->_myriadSession);
}

- (void)resetMyriadCoordinator:(id)a3
{
  id v4;
  NSObject *myriadWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadWorkQueue = self->_myriadWorkQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AFMyriadCoordinator_resetMyriadCoordinator___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadWorkQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arbitrationEventsDelegate, 0);
  objc_storeStrong((id *)&self->_lastWonBySmallAmountDate, 0);
  objc_storeStrong((id *)&self->_currentRequestId, 0);
  objc_storeStrong((id *)&self->_myriadInstrumentation, 0);
  objc_storeStrong((id *)&self->_currentMyriadContext, 0);
  objc_storeStrong(&self->_waitForWiproxReadinessToScan, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_myriadStateMachineForceNoActivityObserver, 0);
  objc_storeStrong((id *)&self->_preferencesChangedNotification, 0);
  objc_storeStrong((id *)&self->_electionRepostWinDecisionPublisher, 0);
  objc_storeStrong((id *)&self->_electionLossPublisher, 0);
  objc_storeStrong((id *)&self->_electionWinPublisher, 0);
  objc_storeStrong((id *)&self->_electionBeginPublisher, 0);
  objc_storeStrong((id *)&self->_myriadSession, 0);
  objc_storeStrong((id *)&self->_goodnessScoreEvaluator, 0);
  objc_storeStrong((id *)&self->_contextRecord, 0);
  objc_storeStrong((id *)&self->_advContextManager, 0);

  objc_storeStrong((id *)&self->_sfDiagnosticsTimer, 0);
  objc_storeStrong((id *)&self->_sfdiagnostics, 0);
  objc_storeStrong((id *)&self->_callPunchout, 0);
  objc_storeStrong((id *)&self->_triggerTime, 0);
  objc_storeStrong((id *)&self->_designatedSelfID, 0);
  objc_storeStrong((id *)&self->_heySiriBTLE, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_maxSlowdownRecord, 0);
  objc_storeStrong((id *)&self->_overrideMyriadRecord, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_storeStrong((id *)&self->_powerAssertionManager, 0);
  objc_storeStrong((id *)&self->_overallTimeout, 0);
  objc_storeStrong((id *)&self->_eventToken, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_timerLabel, 0);
  objc_storeStrong((id *)&self->_myriadAdvertisementContextQueue, 0);
  objc_storeStrong((id *)&self->_myriadWorkQueue, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_deviceClassName, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_multipleContinuations, 0);
  objc_storeStrong((id *)&self->_incomingTrumps, 0);
  objc_storeStrong((id *)&self->_previousTrumps, 0);
  objc_storeStrong((id *)&self->_repliesBeforeDecision, 0);
  objc_storeStrong((id *)&self->_replyCounts, 0);
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_previousAdvertisedData, 0);
}

uint64_t __46__AFMyriadCoordinator_resetMyriadCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_enterState:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__AFMyriadCoordinator_heySiri_foundDevice_withInfo___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int i;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "pHash");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 40);
  objc_msgSend(*(id *)(v3 + 360), "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  for (i = objc_msgSend(v6, "pHash") ^ v2; i; i &= i - 1)
    ++v7;

  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
    v66 = 2048;
    v67 = v11;
    v68 = 2112;
    v69 = v10;
    v70 = 2112;
    v71 = v12;
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s BTLE processing advert in state: %lu from: %@ data= %@", buf, 0x2Au);
  }
  v13 = *(_QWORD **)(a1 + 40);
  switch(v13[1])
  {
    case 0:
    case 3:
    case 4:
    case 6:
    case 9:
    case 0xBLL:
    case 0xDLL:
    case 0x10:
      v14 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        objc_msgSend(v13, "_stateAsString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 48);
        v18 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v66 = 2112;
        v67 = v16;
        v68 = 2112;
        v69 = v17;
        v70 = 2112;
        v71 = v18;
        _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s BTLE ignoring advert while in state %@: %@ data= %@", buf, 0x2Au);

      }
      return;
    case 1:
    case 0xELL:
    case 0xFLL:
      if (!objc_msgSend(*(id *)(a1 + 40), "_testAndUpdateWedgeFilter:", *(_QWORD *)(a1 + 32)))
        return;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", *(_QWORD *)(a1 + 64));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "objectForKey:", *(_QWORD *)(a1 + 64));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "integerValue") + 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v23, *(_QWORD *)(a1 + 64));

      }
      else
      {
        v41 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v42 = *(void **)(a1 + 48);
          v43 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 136315650;
          v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          v66 = 2112;
          v67 = v42;
          v68 = 2112;
          v69 = v43;
          _os_log_impl(&dword_19AF50000, v41, OS_LOG_TYPE_INFO, "%s BTLE heard advert from: %@ data= %@", buf, 0x20u);
        }
        v44 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v22, *(_QWORD *)(a1 + 64));
      }

      if (!objc_msgSend(*(id *)(a1 + 32), "isSlowdown"))
        goto LABEL_43;
      v45 = *(_QWORD *)(a1 + 40);
      v46 = *(void **)(v45 + 304);
      if (!v46)
        goto LABEL_39;
      v47 = objc_msgSend(v46, "slowdownDelay");
      if (v47 < (int)objc_msgSend(*(id *)(a1 + 32), "slowdownDelay"))
      {
        v45 = *(_QWORD *)(a1 + 40);
LABEL_39:
        objc_storeStrong((id *)(v45 + 304), *(id *)(a1 + 32));
        *(_BYTE *)(*(_QWORD *)(a1 + 40) + 327) = 1;
        v48 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v50 = *(void **)(a1 + 48);
          v49 = *(_QWORD *)(a1 + 56);
          v51 = *(void **)(*(_QWORD *)(a1 + 40) + 304);
          v52 = v48;
          v53 = objc_msgSend(v51, "slowdownDelay");
          *(_DWORD *)buf = 136315906;
          v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          v66 = 2112;
          v67 = v50;
          v68 = 2112;
          v69 = v49;
          v70 = 1024;
          LODWORD(v71) = v53;
          _os_log_impl(&dword_19AF50000, v52, OS_LOG_TYPE_INFO, "%s BTLE heard slowdown advert from: %@ data= %@, max delay is now %d msecs", buf, 0x26u);

        }
        kdebug_trace();
        if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
        {
          +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = CFSTR("delay");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), (int)objc_msgSend(*(id *)(a1 + 32), "slowdownDelay"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v62[1] = CFSTR("max");
          v63[0] = v55;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), (int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "slowdownDelay"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v63[1] = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "logEventWithType:context:", 2008, v57);

        }
      }
LABEL_43:
      if (v7 <= 16)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 592) = mach_absolute_time();
        goto LABEL_53;
      }
      v58 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v66 = 1024;
        LODWORD(v67) = v7;
        _os_log_impl(&dword_19AF50000, v58, OS_LOG_TYPE_INFO, "%s BTLE editDist: %d > allowed, ignoring this advert ", buf, 0x12u);
      }
      return;
    case 2:
      v31 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v32 = *(void **)(a1 + 48);
        v33 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315650;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v66 = 2112;
        v67 = v32;
        v68 = 2112;
        v69 = v33;
        _os_log_impl(&dword_19AF50000, v31, OS_LOG_TYPE_INFO, "%s BTLE suppressing straggler response to: %@ data= %@", buf, 0x20u);
        v13 = *(_QWORD **)(a1 + 40);
      }
      v29 = v13;
      v30 = 3;
      goto LABEL_52;
    case 5:
      if (objc_msgSend(*(id *)(a1 + 32), "isAContinuation"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKey:", *(_QWORD *)(a1 + 64));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          v35 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            v36 = *(void **)(a1 + 48);
            v37 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 136315650;
            v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
            v66 = 2112;
            v67 = v36;
            v68 = 2112;
            v69 = v37;
            _os_log_impl(&dword_19AF50000, v35, OS_LOG_TYPE_INFO, "%s BTLE heard another device sending continuation: %@ data= %@", buf, 0x20u);
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
      }
      return;
    case 7:
      if (objc_msgSend(*(id *)(a1 + 32), "isAnEmergency"))
        goto LABEL_50;
      return;
    case 8:
    case 0xCLL:
      v24 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v25 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v66 = 2112;
        v67 = v25;
        _os_log_impl(&dword_19AF50000, v24, OS_LOG_TYPE_INFO, "%s BTLE heard a record waiting for a emergency handled notice: %@ ", buf, 0x16u);
      }
      if (!objc_msgSend(*(id *)(a1 + 32), "isAnEmergencyHandled"))
        return;
      v26 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v27 = *(void **)(a1 + 48);
        v28 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315650;
        v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
        v66 = 2112;
        v67 = v27;
        v68 = 2112;
        v69 = v28;
        _os_log_impl(&dword_19AF50000, v26, OS_LOG_TYPE_INFO, "%s BTLE heard an emergency declaration was handled: %@ data= %@", buf, 0x20u);
      }
      objc_msgSend(*(id *)(a1 + 40), "_signalEmergencyCallHandled");
      v29 = *(void **)(a1 + 40);
      v30 = 4;
      goto LABEL_52;
    case 0xALL:
      if (objc_msgSend(*(id *)(a1 + 32), "isAContinuation"))
      {
        v38 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v39 = *(void **)(a1 + 48);
          v40 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 136315650;
          v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          v66 = 2112;
          v67 = v39;
          v68 = 2112;
          v69 = v40;
          _os_log_impl(&dword_19AF50000, v38, OS_LOG_TYPE_INFO, "%s BTLE heard a continuation: %@ data= %@", buf, 0x20u);
        }
        objc_msgSend(*(id *)(a1 + 40), "_stopListening:", 0);
        objc_msgSend(*(id *)(a1 + 40), "_enterState:", 7);
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isAnEmergency"))
      {
        v59 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v60 = *(void **)(a1 + 48);
          v61 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 136315650;
          v65 = "-[AFMyriadCoordinator heySiri:foundDevice:withInfo:]_block_invoke";
          v66 = 2112;
          v67 = v60;
          v68 = 2112;
          v69 = v61;
          _os_log_impl(&dword_19AF50000, v59, OS_LOG_TYPE_INFO, "%s BTLE heard an emergency declaration: %@ data= %@", buf, 0x20u);
        }
LABEL_50:
        if (objc_msgSend(*(id *)(a1 + 40), "_shouldHandleEmergency"))
        {
          v29 = *(void **)(a1 + 40);
          v30 = 9;
LABEL_52:
          objc_msgSend(v29, "enterState:", v30);
        }
      }
      else
      {
LABEL_53:
        objc_msgSend(*(id *)(a1 + 40), "_updateRepliesWith:id:data:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
      }
      return;
    case 0x11:
      objc_msgSend(*(id *)(a1 + 40), "_testAndUpdateWedgeFilter:", *(_QWORD *)(a1 + 32));
      return;
    default:
      return;
  }
}

void __45__AFMyriadCoordinator_heySiriDidUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 312) = objc_msgSend(*(id *)(a1 + 40), "state") == 3;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 312))
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[AFMyriadCoordinator heySiriDidUpdateState:]_block_invoke";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE daemon wiprox state signalling", (uint8_t *)&v8, 0xCu);
      v2 = *(_QWORD *)(a1 + 32);
    }
    v4 = (void (**)(_QWORD))MEMORY[0x1A1AC0C3C](*(_QWORD *)(v2 + 456));
    objc_msgSend(*(id *)(a1 + 32), "_clearWiProxReadinessTimer");
    if (v4)
      v4[2](v4);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 584))
    {
      v5 = (void (**)(_QWORD))MEMORY[0x1A1AC0C3C]();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 584);
      *(_QWORD *)(v6 + 584) = 0;

      if (v5)
        v5[2](v5);

    }
  }
}

void __46__AFMyriadCoordinator__enterBLEDiagnosticMode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v5 = 136315394;
      v6 = "-[AFMyriadCoordinator _enterBLEDiagnosticMode]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s BTLE failed to enter diagnostic mode %@", (uint8_t *)&v5, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_leaveBLEDiagnosticMode");
  }

}

uint64_t __46__AFMyriadCoordinator__enterBLEDiagnosticMode__block_invoke_404(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFMyriadCoordinator _enterBLEDiagnosticMode]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE diagnostic mode timer fired", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_leaveBLEDiagnosticMode");
}

uint64_t __45__AFMyriadCoordinator_waitWiProx_andExecute___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_waitWiProx:andExecute:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __46__AFMyriadCoordinator__waitWiProx_andExecute___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  const char *label;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int v16;
  const char *v17;
  const char *v18;
  _QWORD block[5];
  id v20;
  char v21;
  char v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 440);
  v4 = *(unsigned __int8 *)(v2 + 441);
  label = dispatch_queue_get_label(0);
  v6 = label;
  if (label && !strcmp(label, (const char *)myriad_work_queue_label))
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v12 = "YES";
      if (v4)
        v13 = "YES";
      else
        v13 = "NO";
      v14 = *(_QWORD *)(a1 + 32);
      v24 = "-[AFMyriadCoordinator _waitWiProx:andExecute:]_block_invoke";
      v15 = *(unsigned __int8 *)(v14 + 441);
      v16 = *(unsigned __int8 *)(v14 + 440);
      if (v15)
        v17 = "YES";
      else
        v17 = "NO";
      *(_DWORD *)buf = 136316162;
      if (v3)
        v18 = "YES";
      else
        v18 = "NO";
      v25 = 2080;
      v26 = v13;
      if (!v16)
        v12 = "NO";
      v27 = 2080;
      v28 = (uint64_t)v17;
      v29 = 2080;
      v30 = v18;
      v31 = 2080;
      v32 = v12;
      _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s #myriad didRequestForBTLEAdvertisement: %s -> %s, didRequestForBTLEScan: %s -> %s", buf, 0x34u);
    }
  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315651;
      v24 = "-[AFMyriadCoordinator _waitWiProx:andExecute:]_block_invoke";
      v25 = 2081;
      v26 = v6;
      v27 = 2081;
      v28 = myriad_work_queue_label;
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s #myriad Method called on unexpected thread (curr:%{private}s expected:%{private}s)", buf, 0x20u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    v8 = *(NSObject **)(v2 + 176);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__AFMyriadCoordinator__waitWiProx_andExecute___block_invoke_398;
    block[3] = &unk_1E3A337B0;
    v9 = *(id *)(a1 + 40);
    v21 = v4;
    block[4] = *(_QWORD *)(a1 + 32);
    v20 = v9;
    v22 = v3;
    dispatch_async(v8, block);

  }
}

void __46__AFMyriadCoordinator__waitWiProx_andExecute___block_invoke_398(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = "YES";
    if (*(_BYTE *)(a1 + 48))
      v5 = "YES";
    else
      v5 = "NO";
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v6 + 441))
      v7 = "YES";
    else
      v7 = "NO";
    if (*(_BYTE *)(a1 + 49))
      v8 = "YES";
    else
      v8 = "NO";
    if (!*(_BYTE *)(v6 + 440))
      v4 = "NO";
    v9 = 136316162;
    v10 = "-[AFMyriadCoordinator _waitWiProx:andExecute:]_block_invoke";
    v11 = 2080;
    v12 = v5;
    v13 = 2080;
    v14 = v7;
    v15 = 2080;
    v16 = v8;
    v17 = 2080;
    v18 = v4;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s #myriad didRequestForBTLEAdvertisement: %s -> %s, didRequestForBTLEScan: %s -> %s", (uint8_t *)&v9, 0x34u);
  }
}

uint64_t __56__AFMyriadCoordinator__createWaitWiProxTimer_waitBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[AFMyriadCoordinator _createWaitWiProxTimer:waitBlock:]_block_invoke";
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s #myriad BTLE WiProx readiness timer timed out, WiProx not called", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_clearWiProxReadinessTimer");
}

uint64_t __56__AFMyriadCoordinator__createWaitWiProxTimer_waitBlock___block_invoke_397(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFMyriadCoordinator _createWaitWiProxTimer:waitBlock:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s #myriad BTLE done waiting on WiProx to execute", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __38__AFMyriadCoordinator__ageWedgeFilter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(a3, "intValue");
  if (v5 >= 2)
  {
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v6 - 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, v10);

    }
  }

}

void __50__AFMyriadCoordinator_notifyCurrentDecisionResult__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (v2 == 14 || v2 == 1)
  {
    v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v5 = v4;
      objc_msgSend((id)v1, "_stateAsString:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[AFMyriadCoordinator notifyCurrentDecisionResult]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s BTLE ignoring decision result callback (state = %@)", (uint8_t *)&v11, 0x16u);

    }
  }
  else if (*(_BYTE *)(v1 + 400))
  {
    v8 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      objc_msgSend((id)v1, "_stateAsString:", v2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[AFMyriadCoordinator notifyCurrentDecisionResult]_block_invoke";
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s BTLE reposting result win (state = %@)", (uint8_t *)&v11, 0x16u);

      v1 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v1 + 544), "publishState:", objc_msgSend((id)v1, "_nextElectionPublisherState"));
  }
}

void __38__AFMyriadCoordinator__sortedReplies___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "asAdvertisementData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isCollectedFromContextCollector"))
  {
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
LABEL_4:

}

uint64_t __38__AFMyriadCoordinator__sortedReplies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "deviceClass");
  if ((v8 == 10 || v8 == 6)
    && objc_msgSend(v6, "isATrump")
    && objc_msgSend(v7, "deviceClass") == 7
    && (objc_msgSend(v7, "isATrump") & 1) != 0)
  {
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "deviceClass") == 7)
  {
    if (objc_msgSend(v6, "isATrump"))
    {
      v9 = objc_msgSend(v7, "deviceClass");
      if ((v9 == 10 || v9 == 6) && (objc_msgSend(v7, "isATrump") & 1) != 0)
      {
        v10 = -1;
        goto LABEL_22;
      }
    }
  }
  v11 = objc_msgSend(v6, "goodness");
  if (v11 == objc_msgSend(v7, "goodness"))
  {
    v12 = objc_msgSend(v6, "userConfidence");
    v13 = objc_msgSend(v7, "userConfidence");
  }
  else
  {
    v12 = objc_msgSend(v6, "goodness");
    v13 = objc_msgSend(v7, "goodness");
  }
  v14 = v13;
  if (v12 == v13)
  {
    v12 = objc_msgSend(v6, "tieBreaker");
    v14 = objc_msgSend(v7, "tieBreaker");
    if (objc_msgSend(v6, "hasEqualAdvertisementData:", v7))
    {
      if (objc_msgSend(v6, "isCollectedFromContextCollector")
        && !objc_msgSend(v7, "isCollectedFromContextCollector"))
      {
LABEL_23:
        v10 = 1;
        goto LABEL_22;
      }
    }
  }
  if (v12 < v14)
    v10 = 1;
  else
    v10 = -1;
LABEL_22:

  return v10;
}

void __45__AFMyriadCoordinator__shouldHandleEmergency__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[AFMyriadCoordinator _shouldHandleEmergency]_block_invoke";
    v8 = 2048;
    v9 = a3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s BTLE EmergencyCallSummary %lu: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __42__AFMyriadCoordinator__shouldContinueFor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[AFMyriadCoordinator _shouldContinueFor:]_block_invoke";
    v8 = 2048;
    v9 = a3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s BTLE summary %lu: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  int v28;
  int v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  char v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[3];
  _QWORD v49[3];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 323) = 0;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v51 = "-[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:]_block_invoke";
    v52 = 2112;
    v53 = v8;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s BTLE delay finished, advertising: %@", buf, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
    objc_msgSend(v11, "myriadCoordinator:willStartAdvertisingUsingData:", *(_QWORD *)(a1 + 32), v5);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldUseContextCollector"))
    objc_msgSend(*(id *)(a1 + 32), "_pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisementDelay:", *(float *)(a1 + 48), *(float *)(a1 + 52));
  v12 = *(void **)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v14 = *(_DWORD *)(a1 + 48);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_374;
  v46[3] = &unk_1E3A36FA0;
  v46[4] = v12;
  v15 = v6;
  v47 = v15;
  LODWORD(v16) = v14;
  objc_msgSend(v12, "_startTimer:for:thenExecute:", CFSTR("advertise"), v46, v16);
  kdebug_trace();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v17 != 5)
  {
    v48[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v18;
    v48[1] = CFSTR("adv-delay");
    LODWORD(v19) = *(_DWORD *)(a1 + 52);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v20;
    v48[2] = CFSTR("adv-interval");
    LODWORD(v21) = *(_DWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logEventWithType:context:", 2002, v23);

    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      v25 = *(_QWORD **)(a1 + 32);
      v26 = (void *)v25[76];
      v27 = objc_msgSend(v25, "_myriadStateForSelf:", v25[1]);
      v29 = *(_DWORD *)(a1 + 48);
      v28 = *(_DWORD *)(a1 + 52);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = mach_absolute_time();
      LODWORD(v32) = v28;
      LODWORD(v33) = v29;
      objc_msgSend(v26, "logCDAElectionAdvertisingStarting:withDelay:withInterval:withCdaId:withTimestamp:", v27, v30, v31, v32, v33);

    }
  }
  getWPHeySiriAdvertisingData();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = v35;
  if (v34)
    objc_msgSend(v35, "setObject:forKey:", v5, v34);
  objc_msgSend(*(id *)(a1 + 32), "_enterBLEDiagnosticMode");
  v37 = *(void **)(a1 + 32);
  v44[0] = v13;
  v44[1] = 3221225472;
  v44[2] = __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_2;
  v44[3] = &unk_1E3A36FC8;
  v44[4] = v37;
  v38 = v36;
  v45 = v38;
  objc_msgSend(v37, "_waitWiProxAndExecute:", v44);
  v39 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if (v39)
  {
    v40 = v39;
    v41 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
    v42 = objc_opt_respondsToSelector();

    if ((v42 & 1) != 0)
    {
      v43 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
      objc_msgSend(v43, "advertisingDidBegin:", *(_QWORD *)(a1 + 32));

    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));

}

uint64_t __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_388(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 320) || *(_BYTE *)(v2 + 321)) && *(_QWORD *)(v2 + 8) == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingTimeInterval:", *(float *)(a1 + 64));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 472);
    *(_QWORD *)(v5 + 472) = v4;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", (float)(*(float *)(a1 + 64) + *(float *)(a1 + 68)));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 480);
    *(_QWORD *)(v9 + 480) = v8;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_374(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t result;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("state"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("unixTime");
    v14[0] = v3;
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logEventWithType:context:", 2010, v7);

  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    v8 = *(_QWORD **)(a1 + 32);
    if (v8[1] == 1)
    {
      v9 = (void *)v8[76];
      v10 = objc_msgSend(v8, "_myriadStateForSelf:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logCDAElectionTimerEnded:withCdaId:withTimestamp:", v10, v11, mach_absolute_time());

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__AFMyriadCoordinator__advertiseWith_afterDelay_maxInterval_thenExecute___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t Milliseconds;
  uint64_t v10;

  v1 = result;
  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 319) || *(_BYTE *)(v2 + 314))
  {
    v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      v5 = mach_absolute_time();
      v6 = 136315394;
      v7 = "-[AFMyriadCoordinator _advertiseWith:afterDelay:maxInterval:thenExecute:]_block_invoke_2";
      v8 = 2048;
      Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v5);
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s BTLE daemon asked to start advertise at: %lld", (uint8_t *)&v6, 0x16u);

      v2 = *(_QWORD *)(v1 + 32);
    }
    result = objc_msgSend(*(id *)(v2 + 352), "startScanningAndAdvertisingWithData:", *(_QWORD *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 440) = 1;
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 441) = 1;
  }
  return result;
}

uint64_t __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 7;
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_2;
  v6[3] = &unk_1E3A36F30;
  v6[4] = v4;
  return objc_msgSend(v4, "_advertiseWith:afterDelay:maxInterval:thenExecute:", v3, v6, a2, a3);
}

void __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 176);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_3;
  block[3] = &unk_1E3A36F30;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __60__AFMyriadCoordinator_advertiseWith_afterDelay_maxInterval___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAdvertisingAndListening");
}

uint64_t __37__AFMyriadCoordinator_advertiseWith___block_invoke(uint64_t a1, double a2, double a3)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 7;
  LODWORD(a2) = 0;
  LODWORD(a3) = 0.5;
  return objc_msgSend(*(id *)(a1 + 32), "_advertiseWith:afterDelay:maxInterval:thenExecute:", *(_QWORD *)(a1 + 40), 0, a2, a3);
}

uint64_t __63__AFMyriadCoordinator_startAdvertising_afterDelay_maxInterval___block_invoke(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  return objc_msgSend(*(id *)(a1 + 32), "_startAdvertising:afterDelay:maxInterval:", *(_QWORD *)(a1 + 40), a2, a3);
}

void __44__AFMyriadCoordinator__advertiseIndefinite___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t Milliseconds;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  getWPHeySiriAdvertisingData();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "asAdvertisementData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, v2);

  }
  objc_msgSend(*(id *)(a1 + 40), "_enterBLEDiagnosticMode");
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v5 + 319))
  {
    v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = mach_absolute_time();
      v9 = 136315394;
      v10 = "-[AFMyriadCoordinator _advertiseIndefinite:]_block_invoke";
      v11 = 2048;
      Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v8);
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s BTLE daemon asked to start advertise at: %lld", (uint8_t *)&v9, 0x16u);

      v5 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(*(id *)(v5 + 352), "startScanningAndAdvertisingWithData:", v3);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 440) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 441) = 1;
  }

}

uint64_t __67__AFMyriadCoordinator__advertise_afterDelay_maxInterval_andMoveTo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enterState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __56__AFMyriadCoordinator__advertiseSuppressTriggerInOutput__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_endAdvertising:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_resetAudioData");
  v2 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 24);
  switch(v4)
  {
    case 0:
      goto LABEL_8;
    case 1:
    case 14:
      v5 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v7 = v5;
        objc_msgSend((id)v3, "_stateAsString:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_stateAsString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 330);
        v11 = 136315906;
        v12 = "-[AFMyriadCoordinator _advertiseSuppressTriggerInOutput]_block_invoke";
        v13 = 2112;
        v14 = v8;
        v15 = 2112;
        v16 = v9;
        v17 = 1024;
        v18 = v10;
        _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s fromState: %@, myriadState: %@, is _clientIsDeciding: %d", (uint8_t *)&v11, 0x26u);

        v3 = *(_QWORD *)(a1 + 32);
      }
      if (*(_BYTE *)(v3 + 330))
        objc_msgSend((id)v3, "_winElection");
LABEL_8:
      v2 = 2;
      break;
    case 2:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
      v2 = *(_QWORD *)(v3 + 24);
      break;
    case 3:
    case 4:
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "_winElection", 0);
      v2 = 4;
      break;
    case 7:
      v2 = 10;
      break;
    default:
      return objc_msgSend(*(id *)(a1 + 32), "enterState:", v2);
  }
  return objc_msgSend(*(id *)(a1 + 32), "enterState:", v2);
}

uint64_t __41__AFMyriadCoordinator__advertiseSlowdown__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[AFMyriadCoordinator _advertiseSlowdown]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE ending slowdown advertising, 2nd pass not seen", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_endAdvertising:", 0);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 327) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 304);
  *(_QWORD *)(v3 + 304) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "enterState:", 0);
}

void __40__AFMyriadCoordinator__advertiseTrigger__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  id *v4;
  void *v5;
  double v6;
  double v7;
  _QWORD v8[5];
  int v9;
  int v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 40);
  v9 = *(_DWORD *)(a1 + 44);
  v10 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setupAdvIntervalsInDelay:interval:withSlowdown:", &v10, &v9, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 300));
  objc_msgSend(*(id *)(a1 + 32), "_adjustActionWindowsFromSlowdown:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 300));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "generateTiebreaker");
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[AFMyriadCoordinator _advertiseTrigger]_block_invoke";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown finished, advertising delayed trigger", buf, 0xCu);
  }
  v4 = *(id **)(a1 + 32);
  objc_msgSend(v4[30], "asAdvertisementData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v9;
  LODWORD(v6) = v10;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_362;
  v8[3] = &unk_1E3A36F30;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "_advertiseWith:afterDelay:maxInterval:thenExecute:", v5, v8, v6, v7);

}

void __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_366(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v1, "_endAdvertisingWithDeviceProhibitions:", v2);

}

void __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_367(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v1, "_endAdvertisingWithDeviceProhibitions:", v2);

}

void __40__AFMyriadCoordinator__advertiseTrigger__block_invoke_362(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v1, "_endAdvertisingWithDeviceProhibitions:", v2);

}

void __51__AFMyriadCoordinator__duringNextWindowEnterState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enterState:", *(_QWORD *)(a1 + 40));

}

void __76__AFMyriadCoordinator__updateArbitrationParticipationContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback getPreviousBoostsWithCompletion", buf, 0xCu);
  }
  v5 = *(void **)(a1 + 32);
  v6 = objc_alloc(MEMORY[0x1E0D99478]);
  objc_msgSend(v3, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithData:", v7);
  objc_msgSend(v5, "setScoreBoosters:", v8);

  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 632) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 632);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__AFMyriadCoordinator__updateArbitrationParticipationContextWithCompletion___block_invoke_353;
    v13[3] = &unk_1E3A36BB8;
    v11 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v10, "arbitrationDidUpdateWithContext:session:completion:", v9, v11, v13);

  }
  else
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[AFMyriadCoordinator _updateArbitrationParticipationContextWithCompletion:]_block_invoke_2";
      _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s #myriad #feedback arbitration event delgate failed.", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __76__AFMyriadCoordinator__updateArbitrationParticipationContextWithCompletion___block_invoke_353(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("voiceTriggerEndTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("advertisementDispatchTime"));

  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("contextAdvertisementId"));

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("advertisementContext"));
  v8 = (void *)objc_msgSend(v2, "copy");

  return v8;
}

void __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_3;
  block[3] = &unk_1E3A33600;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 176);
  block[1] = 3221225472;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  v16 = v5;
  v18 = *(_OWORD *)(a1 + 56);
  v17 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, block);

}

void __117__AFMyriadCoordinator__pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval_advertisementDelay___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  const __CFString *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisement"
          "Delay:]_block_invoke_3";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s #myriad Pushing Myriad advertisement context is complete", buf, 0xCu);
  }
  v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 512), "currentElectionAdvertisementId");
    v6 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v6;
    v7 = *(void **)(a1 + 48);
    if (v7 && v6)
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "isEqual:", v6) & 1) != 0)
      {
        if (objc_msgSend(*(id *)(a1 + 40), "_shouldUseContextCollector"))
        {
          v26 = v5;
          v8 = objc_msgSend(*(id *)(a1 + 56), "count");
          if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
          {
            +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = CFSTR("count");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v10;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "logEventWithType:context:", 2015, v11);

          }
          objc_msgSend(*(id *)(a1 + 40), "_testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisementDispatchTime:advertisement:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v28 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                if (objc_msgSend(*(id *)(a1 + 40), "_testAndUpdateWedgeFilter:", v17))
                {
                  v18 = *(void **)(a1 + 40);
                  objc_msgSend(v17, "deviceID");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "UUIDString");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "asAdvertisementData");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "_updateRepliesWith:id:data:", v17, v20, v21);

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            }
            while (v14);
          }
          objc_msgSend(*(id *)(a1 + 40), "_suppressDeviceIfNeededWithVoiceTriggerEndTime:adverisementDispatchTime:", *(double *)(a1 + 72), *(double *)(a1 + 80));
          v5 = v26;
        }
        else
        {
          if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
            goto LABEL_40;
          +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "logEventWithType:context:", 2017, 0);
        }
        goto LABEL_39;
      }
      v7 = *(void **)(a1 + 48);
    }
    v22 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertiseme"
            "ntDelay:]_block_invoke";
      v38 = 2112;
      v39 = v7;
      v40 = 2112;
      v41 = v5;
      _os_log_impl(&dword_19AF50000, v22, OS_LOG_TYPE_INFO, "%s #myriad current advId: %@ is different from the advId for which the myriad context was dispatched: %@", buf, 0x20u);
      v7 = *(void **)(a1 + 48);
    }
    v34[0] = CFSTR("contextAdvertisementId");
    if (v7)
    {
      objc_msgSend(v7, "UUIDString");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = &stru_1E3A37708;
    }
    v34[1] = CFSTR("currentAdvertisementId");
    v35[0] = v23;
    if (v5)
    {
      objc_msgSend(v5, "UUIDString");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = &stru_1E3A37708;
    }
    v35[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)

    if (v7)
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logEventWithType:context:contextNoCopy:", 2016, v12, 0);

    }
LABEL_39:

    goto LABEL_40;
  }
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[AFMyriadCoordinator _pushMyriadAdvertisementContextToContextCollectorWithAdvertisementInterval:advertisement"
          "Delay:]_block_invoke";
    v38 = 2112;
    v39 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s #myriad Error: %@", buf, 0x16u);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logEventWithType:context:", 2014, 0);
LABEL_40:

  }
}

void __95__AFMyriadCoordinator__suppressDeviceIfNeededWithVoiceTriggerEndTime_adverisementDispatchTime___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isMe") & 1) == 0)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v7 = a1[5];
      v8 = a1[6];
      v9 = a1[7];
      v10 = a1[8];
      v11 = 136316162;
      v12 = "-[AFMyriadCoordinator _suppressDeviceIfNeededWithVoiceTriggerEndTime:adverisementDispatchTime:]_block_invoke";
      v13 = 2048;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2048;
      v18 = v9;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s #myriad Suppressing the current device due to late trigger (voicetrigger endtime: %f, advertisement dispatch time: %f, advertisement delay: %f, myriad record count: %ld)", (uint8_t *)&v11, 0x34u);
    }
    *(_BYTE *)(a1[4] + 417) = 1;
    *a4 = 1;
  }
}

void __132__AFMyriadCoordinator__testAndFilterAdvertisementsFromContextCollector_voiceTriggerEndTime_advertisementDispatchTime_advertisement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:", *(double *)(a1 + 56), *(double *)(*(_QWORD *)(a1 + 32) + 144)))
  {
    objc_msgSend(v6, "recordForDeviceId:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "deviceGroup") == *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 168))
      {
        objc_msgSend(v8, "deviceID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360)) & 1) != 0)
        {

        }
        else
        {
          v15 = objc_msgSend(v6, "compareAdvertisementPayload:", *(_QWORD *)(a1 + 40));

          if ((v15 & 1) == 0)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
        }
      }
      else
      {
        v10 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v11 = v10;
          v12 = objc_msgSend(v8, "deviceGroup");
          objc_msgSend(v8, "deviceID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "advertisementPayload");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 136315906;
          v17 = "-[AFMyriadCoordinator _testAndFilterAdvertisementsFromContextCollector:voiceTriggerEndTime:advertisement"
                "DispatchTime:advertisement:]_block_invoke";
          v18 = 1024;
          v19 = v12;
          v20 = 2112;
          v21 = v13;
          v22 = 2112;
          v23 = v14;
          _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s #myriad ignoring advert from other deviceGroup %d: %@ data=%@", (uint8_t *)&v16, 0x26u);

        }
      }
    }

  }
}

void __51__AFMyriadCoordinator__stopAdvertisingAndListening__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFMyriadCoordinator _stopAdvertisingAndListening]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping advertising and scanning of HeySiri advertisements", (uint8_t *)&v4, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 319))
  {
    objc_msgSend(*(id *)(v3 + 352), "stopScanningAndAdvertising");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 440) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 441) = 0;
  }
}

uint64_t __37__AFMyriadCoordinator_stopListening___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopListening:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__AFMyriadCoordinator_stopListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopListening:", 0);
}

uint64_t __38__AFMyriadCoordinator__stopListening___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[AFMyriadCoordinator _stopListening:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping to scan HeySiri advertisements", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 319))
  {
    objc_msgSend(*(id *)(v3 + 352), "stopScanning");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 440) = 0;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __40__AFMyriadCoordinator__stopAdvertising___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[AFMyriadCoordinator _stopAdvertising:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE stopping advertising HeySiri advertisements", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 319))
  {
    objc_msgSend(*(id *)(v3 + 352), "stopAdvertising");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 441) = 0;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __38__AFMyriadCoordinator_startListening___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListening:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__AFMyriadCoordinator_startListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListening:", 0);
}

void __76__AFMyriadCoordinator__startListeningAfterWiProxIsReady_inState_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((_QWORD *)WeakRetained + 1);
    if (v4 == *(_QWORD *)(a1 + 48))
    {
      v5 = AFSiriLogContextMyriad;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_INFO))
      {
        v6 = 136315394;
        v7 = "-[AFMyriadCoordinator _startListeningAfterWiProxIsReady:inState:completion:]_block_invoke";
        v8 = 2048;
        v9 = v4;
        _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s starting to scan in state: %lu", (uint8_t *)&v6, 0x16u);
      }
      objc_msgSend(v3, "_startListening:", *(_QWORD *)(a1 + 32));
    }
  }

}

uint64_t __39__AFMyriadCoordinator__startListening___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 319))
  {
    objc_msgSend(*(id *)(v2 + 352), "startScanning");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 440) = 1;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __34__AFMyriadCoordinator_enterState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", *(_QWORD *)(a1 + 40));
}

uint64_t __35__AFMyriadCoordinator__enterState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loseElection");
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 0);
}

uint64_t __41__AFMyriadCoordinator__setOverallTimeout__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[AFMyriadCoordinator _setOverallTimeout]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE Coordinator hitting overall timeout, resetting to NoActivity and declaring loss", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[1])
  {
    objc_msgSend(v3, "_loseElection");
    v3 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v3, "_enterState:", 0);
}

void __54__AFMyriadCoordinator__startTimer_for_thenEnterState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_enterState:", *(_QWORD *)(a1 + 40));

}

uint64_t __51__AFMyriadCoordinator__startTimer_for_thenExecute___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
    v5 = 136315394;
    v6 = "-[AFMyriadCoordinator _startTimer:for:thenExecute:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE %@ timer fires", (uint8_t *)&v5, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__AFMyriadCoordinator__createDispatchTimerWithTime_toExecute___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208);
    v6 = 136315650;
    v7 = "-[AFMyriadCoordinator _createDispatchTimerWithTime:toExecute:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s #myriad Event token: %@, current event token: %@", (uint8_t *)&v6, 0x20u);
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 208) && objc_msgSend(*(id *)(a1 + 32), "isEqual:"))
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
}

void __42__AFMyriadCoordinator__clearMyriadSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "-[AFMyriadCoordinator _clearMyriadSession]_block_invoke";
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s #myriad Election advertisement %@ -> %@", (uint8_t *)&v7, 0x20u);
  }

}

void __53__AFMyriadCoordinator__createMyriadSessionIfRequired__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  objc_msgSend(v2, "UUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionId:", v4);

}

void __68__AFMyriadCoordinator__addElectionAdvertisementDataToMyriadSession___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "_myriadSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "electionAdvertisementDataByIds");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v7);
  objc_msgSend(v6, "setObject:forKey:", a1[5], a1[6]);
  objc_msgSend(v4, "setCurrentElectionAdvertisementId:", a1[6]);
  objc_msgSend(v4, "setCurrentElectionAdvertisementData:", a1[5]);
  objc_msgSend(v4, "setElectionAdvertisementDataByIds:", v6);

}

uint64_t __41__AFMyriadCoordinator__forceLocalWinner___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 240);
    v15 = 136315650;
    v16 = "-[AFMyriadCoordinator _forceLocalWinner:]_block_invoke";
    v17 = 2112;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s #myriad force win on this device with context: %@, triggerRecord: %@", (uint8_t *)&v15, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_winElection");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 330) = 0;
  objc_msgSend(*(id *)(a1 + 40), "_setMyriadContext:", *(_QWORD *)(a1 + 32));
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    v5 = *(_QWORD **)(a1 + 40);
    v6 = (void *)v5[76];
    v7 = objc_msgSend(v5, "_myriadStateForSelf:", v5[1]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 512), "sessionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v7, 5, v8, mach_absolute_time());

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 608), "updateIsTrump:withReason:", 1, 5);
  }
  v9 = *(id **)(a1 + 40);
  v10 = v9[30];
  if (v10)
  {
    objc_msgSend(v10, "setRawAudioGoodnessScore:withBump:", objc_msgSend(v9[30], "rawAudioGoodnessScore"), 255);
  }
  else
  {
    objc_msgSend(v9, "directTriggerRecord");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 240);
    *(_QWORD *)(v12 + 240) = v11;

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 320) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248) = 3;
  return objc_msgSend(*(id *)(a1 + 40), "_enterState:", 14);
}

uint64_t __58__AFMyriadCoordinator_faceDetectedBoostWithMyriadContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 418) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "rawAudioGoodnessScore"), 255);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "generateTiebreaker");
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
    v5 = v2;
    LODWORD(v4) = objc_msgSend(v4, "rawAudioGoodnessScore");
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "goodness");
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "bump");
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "tieBreaker");
    objc_msgSend(*(id *)(a1 + 32), "_stateAsString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136316418;
    v11 = "-[AFMyriadCoordinator faceDetectedBoostWithMyriadContext:]_block_invoke";
    v12 = 1024;
    v13 = (int)v4;
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    v18 = 1024;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s #myriad attention is boosting goodness score, rawAudioGoodnessScore %u, goodness:%u bump: %u, tieBreaker:%u, _myriadState: %@", (uint8_t *)&v10, 0x2Eu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_forceLocalWinner:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "updateIsTrump:withReason:", 1, 8);
}

void __43__AFMyriadCoordinator_setCurrentRequestId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 616), *(id *)(a1 + 40));
}

uint64_t __57__AFMyriadCoordinator_requestWillPresentUsefulUserResult__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "requestWillPresentUsefulUserResult:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
}

void __36__AFMyriadCoordinator_setupEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "_stateAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[AFMyriadCoordinator setupEnabled:]_block_invoke";
    v10 = 1024;
    v11 = v3;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s #myriad setupEnabled: %d, current state: %@", (uint8_t *)&v8, 0x1Cu);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(v7 + 318) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 314) = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 318) = objc_msgSend(*(id *)(v7 + 576), "coordinationEnabled");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 314) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_enterState:", 0);
  }
}

void __33__AFMyriadCoordinator_setInTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = 136315394;
    v5 = "-[AFMyriadCoordinator setInTask:]_block_invoke";
    v6 = 1024;
    v7 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s inTask=%d", (uint8_t *)&v4, 0x12u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = *(_BYTE *)(a1 + 40);
}

uint64_t __29__AFMyriadCoordinator_inTask__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 313);
  return result;
}

uint64_t __30__AFMyriadCoordinator_endTask__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFMyriadCoordinator endTask]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 418) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "releaseAllPowerAssertions");
  result = +[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled");
  if ((_DWORD)result)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __30__AFMyriadCoordinator_endTask__block_invoke_243;
    v5[3] = &unk_1E3A36F30;
    v5[4] = v4;
    return objc_msgSend(v4, "_updateArbitrationParticipationContextWithCompletion:", v5);
  }
  return result;
}

uint64_t __30__AFMyriadCoordinator_endTask__block_invoke_243(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "arbitrationEndedTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
}

uint64_t __60__AFMyriadCoordinator_endAdvertisingWithDeviceProhibitions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endAdvertisingWithDeviceProhibitions:", *(_QWORD *)(a1 + 40));
}

uint64_t __61__AFMyriadCoordinator__endAdvertisingWithDeviceProhibitions___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 330) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", *(_QWORD *)(a1 + 40));
}

void __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = [v3 alloc];
  v13[0] = CFSTR("dc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "deviceClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v13[1] = CFSTR("pt");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "productType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("goodness");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v4, "goodness");

  objc_msgSend(v8, "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithDictionary:", v11);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
}

uint64_t __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_216(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "deviceClass");
  if ((_DWORD)result == 7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_3(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  objc_class *v7;
  id v8;
  uint64_t v9;
  id v10;

  v7 = (objc_class *)MEMORY[0x1E0D99470];
  v8 = a2;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setDeviceClass:", objc_msgSend(v8, "deviceClass"));
  objc_msgSend(v10, "setProductType:", objc_msgSend(v8, "productType"));
  v9 = objc_msgSend(v8, "goodness");

  objc_msgSend(v10, "setGoodnessScore:", v9);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  if (a3 >= 9)
    *a4 = 1;

}

void __55__AFMyriadCoordinator__endAdvertisingAnalyticsContext___block_invoke_4(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  objc_class *v7;
  id v8;
  uint64_t v9;
  id v10;

  v7 = (objc_class *)MEMORY[0x1E0D993F8];
  v8 = a2;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setAudioHash:", objc_msgSend(v8, "pHash"));
  objc_msgSend(v10, "setGoodnessScore:", objc_msgSend(v8, "goodness"));
  objc_msgSend(v10, "setConfidenceScore:", objc_msgSend(v8, "userConfidence"));
  objc_msgSend(v10, "setDeviceClass:", objc_msgSend(v8, "deviceClass"));
  objc_msgSend(v10, "setDeviceGroup:", objc_msgSend(v8, "deviceGroup"));
  objc_msgSend(v10, "setProductType:", objc_msgSend(v8, "productType"));
  objc_msgSend(v10, "setTieBreaker:", objc_msgSend(v8, "tieBreaker"));
  objc_msgSend(v10, "setIsFromContextCollector:", objc_msgSend(v8, "isCollectedFromContextCollector") != 0);
  v9 = objc_msgSend(v8, "isMe");

  objc_msgSend(v10, "setIsSelf:", v9);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  if (a3 >= 9)
    *a4 = 1;

}

uint64_t __38__AFMyriadCoordinator_endAdvertising___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endAdvertising:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__AFMyriadCoordinator_endAdvertisingAfterDelay___block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  _QWORD v4[5];
  int v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__AFMyriadCoordinator_endAdvertisingAfterDelay___block_invoke_2;
  v4[3] = &unk_1E3A333B0;
  v5 = v2;
  v4[4] = v1;
  return objc_msgSend(v1, "_startTimer:for:thenExecute:", CFSTR("end advert delay"), v4);
}

uint64_t __48__AFMyriadCoordinator_endAdvertisingAfterDelay___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  double v3;
  int v5;
  const char *v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(float *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[AFMyriadCoordinator endAdvertisingAfterDelay:]_block_invoke_2";
    v7 = 2048;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE ending advertising after %f secs delay", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "enterState:", 0);
}

uint64_t __48__AFMyriadCoordinator_startAdvertisingSlowdown___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int16 *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[AFMyriadCoordinator startAdvertisingSlowdown:]_block_invoke";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE advertising slowdown: %d msecs", (uint8_t *)&v5, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = *(unsigned __int16 *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 327) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 16);
}

void __48__AFMyriadCoordinator_startResponseAdvertising___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  double v4;
  double v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[AFMyriadCoordinator startResponseAdvertising:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE suppressing stragglers", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "responseObject:", *(unsigned __int16 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 324) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "_startAdvertising:afterDelay:maxInterval:", v3, v4, v5);

}

uint64_t __78__AFMyriadCoordinator_startAdvertisingFromAlertFiringVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFMyriadCoordinator startAdvertisingFromAlertFiringVoiceTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE voice trigger during alert heard", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("trigger");
    v15[0] = v4;
    v15[1] = CFSTR("AlertFiringVoiceTrigger");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:context:", 2011, v5);

  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[76];
    v8 = objc_msgSend(v6, "_myriadStateForSelf:", v6[1]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v8, 8, v9, mach_absolute_time());

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "updateIsTrump:withReason:", 1, 2);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 240);
  *(_QWORD *)(v11 + 240) = v10;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);
}

uint64_t __73__AFMyriadCoordinator_startAdvertisingFromInTaskVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateVoiceTriggerTimeFromFile");
  return objc_msgSend(*(id *)(a1 + 32), "_startAdvertisingFromInTaskVoiceTrigger");
}

uint64_t __48__AFMyriadCoordinator_startAdvertisingEmergency__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[AFMyriadCoordinator startAdvertisingEmergency]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE sending emergency beacon", buf, 0xCu);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("trigger");
    v14[0] = v4;
    v14[1] = CFSTR("Emergency");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:context:", 2011, v5);

  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[76];
    v8 = objc_msgSend(v6, "_myriadStateForSelf:", v6[1]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v8, 7, v9, mach_absolute_time());

  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 416) = 1;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemUptime");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408) = v11;

  return objc_msgSend(*(id *)(a1 + 32), "_duringNextWindowEnterState:", 8);
}

uint64_t __55__AFMyriadCoordinator_startAdvertisingEmergencyHandled__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFMyriadCoordinator startAdvertisingEmergencyHandled]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE handling emergency beacon", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 313) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 9);
}

uint64_t __57__AFMyriadCoordinator_startAdvertisingFromCarPlayTrigger__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[AFMyriadCoordinator startAdvertisingFromCarPlayTrigger]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping from in CarPlay trigger", buf, 0xCu);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("trigger");
    v16[0] = v4;
    v16[1] = CFSTR("CarPlayTrigger");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:context:", 2011, v5);

  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[76];
    v8 = objc_msgSend(v6, "_myriadStateForSelf:", v6[1]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v8, 4, v9, mach_absolute_time());

  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 240);
  *(_QWORD *)(v11 + 240) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", 0, 244);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 329) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 1;
  v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[AFMyriadCoordinator startAdvertisingFromCarPlayTrigger]_block_invoke";
    _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s #myriad CarPlay override", buf, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_forceLocalWinner:", 0);
}

uint64_t __55__AFMyriadCoordinator_startAdvertisingFromInEarTrigger__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[AFMyriadCoordinator startAdvertisingFromInEarTrigger]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping from in ear voice trigger", buf, 0xCu);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = CFSTR("trigger");
    v16[0] = v4;
    v16[1] = CFSTR("InEarTrigger");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:context:", 2011, v5);

  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[76];
    v8 = objc_msgSend(v6, "_myriadStateForSelf:", v6[1]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v8, 3, v9, mach_absolute_time());

  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 240);
  *(_QWORD *)(v11 + 240) = v10;

  v13 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v13 + 313))
  {
    objc_msgSend(*(id *)(v13 + 240), "setRawAudioGoodnessScore:withBump:", 0, 248);
    v13 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v13 + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 321) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 6;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);
}

uint64_t __70__AFMyriadCoordinator_startAdvertisingFromOutgoingTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFMyriadCoordinator startAdvertisingFromOutgoingTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE suppressing trigger in audio output", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("trigger");
    v15[0] = v4;
    v15[1] = CFSTR("OutgoingTrigger");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:context:", 2011, v5);

  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[76];
    v8 = objc_msgSend(v6, "_myriadStateForSelf:", v6[1]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v8, 5, v9, mach_absolute_time());

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "updateIsTrump:withReason:", 1, 5);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 240);
  *(_QWORD *)(v11 + 240) = v10;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 14);
}

uint64_t __68__AFMyriadCoordinator_startAdvertisingFromDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFMyriadCoordinator startAdvertisingFromDirectTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("trigger");
    v15[0] = v4;
    v15[1] = CFSTR("DirectTrigger");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:context:", 2011, v5);

  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[76];
    v8 = objc_msgSend(v6, "_myriadStateForSelf:", v6[1]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v8, 1, v9, mach_absolute_time());

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "updateIsTrump:withReason:", 1, 6);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 240);
  *(_QWORD *)(v11 + 240) = v10;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);
}

uint64_t __73__AFMyriadCoordinator_startWatchAdvertisingFromDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFMyriadCoordinator startWatchAdvertisingFromDirectTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s BTLE trumping", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("trigger");
    v15[0] = v4;
    v15[1] = CFSTR("DirectTrigger");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:context:", 2011, v5);

  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[76];
    v8 = objc_msgSend(v6, "_myriadStateForSelf:", v6[1]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v8, 1, v9, mach_absolute_time());

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "updateIsTrump:withReason:", 1, 6);
  }
  objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
  objc_msgSend(*(id *)(a1 + 32), "directTriggerRecord");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 240);
  *(_QWORD *)(v11 + 240) = v10;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 325) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);
}

void __72__AFMyriadCoordinator_startWatchAdvertisingFromVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _BYTE *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  AFMyriadGoodnessScoreContext *v19;
  void *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[AFMyriadCoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "_inTaskTriggerWasTooSoon"))
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[AFMyriadCoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE ignoring watch voice trigger and continuing with ongoing advertisement.", buf, 0xCu);
    }
    return;
  }
  v4 = *(_BYTE **)(a1 + 32);
  if (!v4[313])
  {
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = CFSTR("state");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = CFSTR("trigger");
      v36[0] = v10;
      v36[1] = CFSTR("VoiceTrigger");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logEventWithType:context:", 2011, v11);

    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
      v12 = *(_QWORD **)(a1 + 32);
      v13 = (void *)v12[76];
      v14 = objc_msgSend(v12, "_myriadStateForSelf:", v12[1]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v14, 2, v15, mach_absolute_time());

    }
    objc_msgSend(*(id *)(a1 + 32), "_initializeTimer");
    objc_msgSend(*(id *)(a1 + 32), "voiceTriggerRecord");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 240);
    *(_QWORD *)(v17 + 240) = v16;

    v19 = objc_alloc_init(AFMyriadGoodnessScoreContext);
    v20 = *(void **)(*(_QWORD *)(a1 + 32) + 624);
    if (v20)
    {
      objc_msgSend(v20, "timeIntervalSinceNow");
      if (v21 > -180.0)
        -[AFMyriadGoodnessScoreContext setRecentlyWonBySmallAmount:](v19, "setRecentlyWonBySmallAmount:", 1);
    }
    v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "getMyriadAdjustedBoostForGoodnessScoreContext:", v19);
    v23 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "rawAudioGoodnessScore");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", v23, v22);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
    if ((v23 - 25) > 0xE7u)
      goto LABEL_26;
    v24 = AFSiriLogContextConnection;
    v25 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    if ((_DWORD)v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[AFMyriadCoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
        v31 = 1024;
        v32 = v23;
        v33 = 1024;
        v34 = 25;
        v26 = "%s #myriad watch trumping due to threshold for rawAudioGoodnessScore: %u >= %u";
        v27 = v24;
        v28 = 24;
LABEL_22:
        _os_log_impl(&dword_19AF50000, v27, OS_LOG_TYPE_INFO, v26, buf, v28);
      }
    }
    else if (v25)
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[AFMyriadCoordinator startWatchAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      v26 = "%s #myriad watch trumping due to score being 0";
      v27 = v24;
      v28 = 12;
      goto LABEL_22;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setPHash:", 0xFFFFLL);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRawAudioGoodnessScore:withBump:", 0, 244);
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "updateIsTrump:withReason:", 1, 3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 326) = 1;
LABEL_26:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 325) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 10;
    objc_msgSend(*(id *)(a1 + 32), "_enterState:", 1);

    return;
  }
  objc_msgSend(v4, "_startAdvertisingFromInTaskVoiceTrigger");
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
    v5 = *(_QWORD **)(a1 + 32);
    v6 = (void *)v5[76];
    v7 = objc_msgSend(v5, "_myriadStateForSelf:", v5[1]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v7, 6, v8, mach_absolute_time());

  }
}

void __92__AFMyriadCoordinator_startAdvertisingFromVoiceTriggerWithGoodnessScoreContext_withContext___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  double v6;
  NSObject *v7;
  int v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  NSObject *v17;
  unsigned __int8 *v18;
  id v19;
  int v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _BYTE *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  NSObject *v37;
  uint64_t v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[2];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  _BYTE v48[10];
  _BYTE v49[6];
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_setMyriadContext:", a1[5]);
  objc_msgSend(a1[6], "getOverridingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "overriddenAdjustedScore");
  }
  else
  {
    v5 = (void *)*((_QWORD *)a1[4] + 78);
    if (v5)
    {
      objc_msgSend(v5, "timeIntervalSinceNow");
      if (v6 > -180.0)
        objc_msgSend(a1[6], "setRecentlyWonBySmallAmount:", 1);
    }
    v4 = objc_msgSend(*((id *)a1[4] + 63), "getMyriadAdjustedBoostForGoodnessScoreContext:", a1[6]);
  }
  *((_BYTE *)a1[4] + 280) = v4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = *((unsigned __int8 *)a1[4] + 280);
    *(_DWORD *)buf = 136315650;
    v46 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    v47 = 2112;
    *(_QWORD *)v48 = v3;
    *(_WORD *)&v48[8] = 1024;
    *(_DWORD *)v49 = v8;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s #myriad overrideContext: %@, _incomingAdjustment %d", buf, 0x1Cu);
  }
  v9 = a1[4];
  v10 = (void *)v9[36];
  v9[36] = 0;

  objc_msgSend(a1[5], "overrideState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
      v47 = 2112;
      *(_QWORD *)v48 = v11;
      _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s #myriad Goodness score override state %@", buf, 0x16u);
    }
    v13 = objc_msgSend(v11, "overrideOption");
    if (v13 == 2)
    {
      objc_msgSend(a1[4], "startAdvertisingFromInEarTrigger");
    }
    else if (v13 == 1)
    {
      objc_msgSend(a1[4], "directTriggerRecord");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = a1[4];
      v16 = (void *)v15[36];
      v15[36] = v14;

      if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
        objc_msgSend(*((id *)a1[4] + 76), "updateIsTrump:withReason:", 1, 6);
    }
  }
  v17 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v18 = (unsigned __int8 *)a1[4];
    v19 = a1[5];
    v20 = v18[313];
    v21 = v18[314];
    LODWORD(v18) = v18[280];
    v22 = a1[6];
    *(_DWORD *)buf = 136316418;
    v46 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    v47 = 1024;
    *(_DWORD *)v48 = v20;
    *(_WORD *)&v48[4] = 1024;
    *(_DWORD *)&v48[6] = v21;
    *(_WORD *)v49 = 1024;
    *(_DWORD *)&v49[2] = (_DWORD)v18;
    v50 = 2112;
    v51 = v19;
    v52 = 2112;
    v53 = v22;
    _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s BTLE startFromVoiceTrigger inTask=%d, inSetupMode=%d, incomingAdjustment=%d,  context=%@, goodnessScoreContext=%@", buf, 0x32u);
  }
  if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *((_QWORD *)a1[4] + 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = CFSTR("trigger");
    v44[0] = v24;
    v44[1] = CFSTR("VoiceTrigger");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logEventWithType:context:", 2011, v25);

  }
  v26 = a1[4];
  if (v26[313] || v26[314])
  {
    objc_msgSend(v26, "_startAdvertisingFromInTaskVoiceTrigger");
    goto LABEL_24;
  }
  if (!v11 || !a1[5])
    goto LABEL_40;
  objc_msgSend(v11, "reason");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("CarPlay request"));

  if ((v36 & 1) == 0)
  {
    v26 = a1[4];
LABEL_40:
    objc_msgSend(v26, "_startAdvertisingFromVoiceTrigger");
    goto LABEL_24;
  }
  v37 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:]_block_invoke";
    v47 = 2112;
    *(_QWORD *)v48 = v11;
    _os_log_impl(&dword_19AF50000, v37, OS_LOG_TYPE_INFO, "%s #myriad CarPlay override %@", buf, 0x16u);
  }
  objc_msgSend(a1[4], "_initializeTimer");
  objc_msgSend(a1[4], "voiceTriggerRecord");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = a1[4];
  v40 = (void *)v39[30];
  v39[30] = v38;

  if (!objc_msgSend(*((id *)a1[4] + 30), "pHash"))
    objc_msgSend(*((id *)a1[4] + 30), "setPHash:", 0xFFFFLL);
  objc_msgSend(a1[4], "_forceLocalWinner:", a1[5]);
LABEL_24:
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    objc_msgSend(a1[4], "_createMyriadSessionIfRequired");
    v27 = a1[4];
    if (*((_BYTE *)v27 + 313) || *((_BYTE *)v27 + 314))
    {
      v28 = (void *)v27[76];
      v29 = objc_msgSend(v27, "_myriadStateForSelf:", v27[1]);
      objc_msgSend(*((id *)a1[4] + 64), "sessionId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = mach_absolute_time();
      v32 = v28;
      v33 = v29;
      v34 = 6;
    }
    else
    {
      v41 = (void *)v27[76];
      v42 = objc_msgSend(v27, "_myriadStateForSelf:", v27[1]);
      objc_msgSend(*((id *)a1[4] + 64), "sessionId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = mach_absolute_time();
      v32 = v41;
      v33 = v42;
      v34 = 2;
    }
    objc_msgSend(v32, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v33, v34, v30, v31);

  }
}

void __67__AFMyriadCoordinator_startAdvertisingFromVoiceTriggerWithContext___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_setMyriadContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateVoiceTriggerTimeFromFile");
  v2 = *(unsigned __int8 **)(a1 + 32);
  if (v2[329])
  {
    v2[329] = 0;
  }
  else
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v4 = v2[313];
      v5 = v2[314];
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v24 = "-[AFMyriadCoordinator startAdvertisingFromVoiceTriggerWithContext:]_block_invoke";
      v25 = 1024;
      v26 = v4;
      v27 = 1024;
      v28 = v5;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s BTLE startFromVoiceTrigger inTask=%d, inSetupMode=%d, context=%@", buf, 0x22u);
    }
    if (!+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = CFSTR("state");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = CFSTR("trigger");
      v22[0] = v8;
      v22[1] = CFSTR("VoiceTrigger");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logEventWithType:context:", 2011, v9);

    }
    v10 = *(_BYTE **)(a1 + 32);
    if (v10[313] || v10[314])
      objc_msgSend(v10, "_startAdvertisingFromInTaskVoiceTrigger");
    else
      objc_msgSend(v10, "_startAdvertisingFromVoiceTrigger");
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_createMyriadSessionIfRequired");
      v11 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v11 + 313) || *(_BYTE *)(v11 + 314))
      {
        v12 = *(void **)(v11 + 608);
        v13 = objc_msgSend((id)v11, "_myriadStateForSelf:", *(_QWORD *)(v11 + 8));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = mach_absolute_time();
        v16 = v12;
        v17 = v13;
        v18 = 6;
      }
      else
      {
        v19 = *(void **)(v11 + 608);
        v20 = objc_msgSend((id)v11, "_myriadStateForSelf:", *(_QWORD *)(v11 + 8));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "sessionId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = mach_absolute_time();
        v16 = v19;
        v17 = v20;
        v18 = 2;
      }
      objc_msgSend(v16, "logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:", v17, v18, v14, v15);

    }
  }
}

uint64_t __36__AFMyriadCoordinator_preheatWiProx__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 8))
  {
    v2 = result;
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v4 = *(_DWORD *)(v1 + 300);
      v5 = 136315394;
      v6 = "-[AFMyriadCoordinator preheatWiProx]_block_invoke";
      v7 = 1024;
      v8 = v4;
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Preheat shows slowdown for this device as %d msecs", (uint8_t *)&v5, 0x12u);
      v1 = *(_QWORD *)(v2 + 32);
    }
    if (*(_DWORD *)(v1 + 300))
    {
      return objc_msgSend((id)v1, "startAdvertisingSlowdown:", (unsigned __int16)*(_DWORD *)(v1 + 300));
    }
    else
    {
      objc_msgSend((id)v1, "_initializeTimer");
      return objc_msgSend(*(id *)(v2 + 32), "enterState:", 15);
    }
  }
  return result;
}

uint64_t __35__AFMyriadCoordinator_readDefaults__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readDefaults");
}

void __39__AFMyriadCoordinator_updateRequestId___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "-[AFMyriadCoordinator updateRequestId:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s #myriad requestIdNotification: %@", (uint8_t *)&v9, 0x16u);
  }
  v4 = *(void **)(a1 + 40);
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithUUIDString:", v7);
  objc_msgSend(v4, "setCurrentRequestId:", v8);

}

uint64_t __40__AFMyriadCoordinator_initWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 319))
  {
    objc_msgSend(*(id *)(v2 + 352), "stopScanningAndAdvertising");
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 440) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 441) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "enterState:", 17);
}

+ (id)currentCoordinator
{
  return (id)_currentCoordinator;
}

+ (void)didChangeDefaults
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.readdefaults"), 0, 0, 1u);
}

+ (void)clearCurrentCoordinator
{
  void *v2;

  v2 = (void *)_currentCoordinator;
  _currentCoordinator = 0;

}

@end
