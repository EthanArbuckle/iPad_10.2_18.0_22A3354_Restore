@implementation ATXPredictionContextBuilder

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ATXPredictionContextBuilder_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_6, block);
  return (id)sharedInstance__pasExprOnceResult_7;
}

- (ATXPredictionContextBuilder)initWithAppInfoManager:(id)a3 locationManager:(id)a4 motionManagerWrapper:(id)a5 ambientLightMonitor:(id)a6 deviceStateMonitorClass:(Class)a7 contextSourcesInitialized:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  ATXPredictionContextBuilder *v19;
  uint64_t v21;

  v8 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_opt_new();
  LOBYTE(v21) = 1;
  v19 = -[ATXPredictionContextBuilder initWithAppInfoManager:locationManager:motionManagerWrapper:ambientLightMonitor:deviceStateMonitorClass:contextSourcesInitialized:contextStream:biomeStreamsInitialized:](self, "initWithAppInfoManager:locationManager:motionManagerWrapper:ambientLightMonitor:deviceStateMonitorClass:contextSourcesInitialized:contextStream:biomeStreamsInitialized:", v17, v16, v15, v14, a7, v8, v18, v21);

  return v19;
}

- (ATXPredictionContextBuilder)initWithAppInfoManager:(id)a3 locationManager:(id)a4 motionManagerWrapper:(id)a5 ambientLightMonitor:(id)a6 deviceStateMonitorClass:(Class)a7 contextSourcesInitialized:(BOOL)a8 contextStream:(id)a9 biomeStreamsInitialized:(BOOL)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ATXPredictionContextBuilder *v21;
  void *v22;
  uint64_t v23;
  _PASLock *lock;
  objc_super v26;

  v10 = a8;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ATXPredictionContextBuilder;
  v21 = -[ATXPredictionContextBuilder init](&v26, sel_init);
  if (v21)
  {
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "updateAppInfoManager:locationManager:motionManagerWrapper:ambientLightMonitor:deviceStateMonitorClass:contextSourcesInitialized:", v16, v17, v18, v19, a7, v10);
    objc_msgSend(v22, "updatePredictionContextStream:biomeStreamsInitialized:", v20, a10);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v22);
    lock = v21->_lock;
    v21->_lock = (_PASLock *)v23;

  }
  return v21;
}

void __45__ATXPredictionContextBuilder_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  objc_opt_class();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_7;
  sharedInstance__pasExprOnceResult_7 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXPredictionContextBuilder)init
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return -[ATXPredictionContextBuilder initWithAppInfoManager:locationManager:motionManagerWrapper:ambientLightMonitor:deviceStateMonitorClass:contextSourcesInitialized:contextStream:biomeStreamsInitialized:](self, "initWithAppInfoManager:locationManager:motionManagerWrapper:ambientLightMonitor:deviceStateMonitorClass:contextSourcesInitialized:contextStream:biomeStreamsInitialized:", 0, 0, 0, 0, 0, 0, 0, v3);
}

- (BOOL)tryInitContextSourcesAndReturnSuccess:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  if ((objc_msgSend(v3, "contextSourcesInitialized") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) == 0)
  {
    +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80E08], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAmbientLightMonitor sharedInstance](ATXAmbientLightMonitor, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateAppInfoManager:locationManager:motionManagerWrapper:ambientLightMonitor:deviceStateMonitorClass:contextSourcesInitialized:", v4, v5, v6, v7, objc_opt_class(), 1);

  }
  v8 = objc_msgSend(v3, "contextSourcesInitialized");

  return v8;
}

- (BOOL)tryInitBiomeStreamsAndReturnSuccess:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if ((objc_msgSend(v3, "biomeStreamsInitialized") & 1) == 0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "updatePredictionContextStream:biomeStreamsInitialized:", v4, 1);

  }
  v5 = objc_msgSend(v3, "biomeStreamsInitialized");

  return v5;
}

- (id)deviceStateContextForCurrentContext:(id)a3
{
  id v3;
  ATXPredictionDeviceStateContext *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ATXPredictionDeviceStateContext *v8;

  v3 = a3;
  v4 = [ATXPredictionDeviceStateContext alloc];
  objc_msgSend((id)objc_msgSend(v3, "deviceStateMonitorClass"), "SSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_msgSend(v3, "deviceStateMonitorClass"), "onWifi");
  v7 = (void *)objc_msgSend(v3, "deviceStateMonitorClass");

  v8 = -[ATXPredictionDeviceStateContext initWithWifiSSID:onWifi:inAirplaneMode:](v4, "initWithWifiSSID:onWifi:inAirplaneMode:", v5, v6, objc_msgSend(v7, "airplaneMode"));
  return v8;
}

- (id)timeContextForCurrentContext:(id)a3
{
  ATXPredictionTimeContext *v4;
  void *v5;
  ATXPredictionTimeContext *v6;

  v4 = [ATXPredictionTimeContext alloc];
  -[ATXPredictionContextBuilder now](self, "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXPredictionTimeContext initWithDate:](v4, "initWithDate:", v5);

  return v6;
}

- (id)locationMotionContextForCurrentContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXPredictionLocationMotionContext *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  ATXPredictionLocationMotionContext *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = a3;
  objc_msgSend(v3, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousLOIAndCurrentLOI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "motionManagerWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCurrentActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [ATXPredictionLocationMotionContext alloc];
  v29 = v5;
  objc_msgSend(v5, "second");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v7, "motiontype");
  objc_msgSend(v3, "locationManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "getCurrentLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "locationEnabled");
  objc_msgSend(v3, "locationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "distanceFromHomeOfCurrentLocationInMeters");
  v14 = v13;
  objc_msgSend(v3, "locationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "distanceFromWorkOfCurrentLocationInMeters");
  v17 = v16;
  objc_msgSend(v3, "locationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "distanceFromSchoolOfCurrentLocationInMeters");
  v20 = v19;
  objc_msgSend(v3, "locationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "distanceFromGymOfCurrentLocationInMeters");
  v23 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](v8, "initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v27, v26, v25, v9, v11, objc_msgSend(v7, "canPredictClipsGivenRecentMotion"), v14, v17, v20, v22);

  return v23;
}

- (id)ambientLightContextForCurrentContext:(id)a3
{
  id v3;
  ATXPredictionAmbientLightContext *v4;
  void *v5;
  ATXPredictionAmbientLightContext *v6;

  v3 = a3;
  v4 = [ATXPredictionAmbientLightContext alloc];
  objc_msgSend(v3, "ambientLightMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXPredictionAmbientLightContext initWithAmbientLightType:](v4, "initWithAmbientLightType:", objc_msgSend(v5, "getCurrentAmbientLightType"));
  return v6;
}

- (id)userContextForCurrentContext:(id)a3
{
  id v3;
  ATXPredictionUserContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXPredictionUserContext *v14;
  void *v16;

  v3 = a3;
  v4 = [ATXPredictionUserContext alloc];
  objc_msgSend(v3, "appInfoManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastUnlockDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appInfoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastAppLaunch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appInfoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastAppLaunchDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appInfoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondMostRecentAppLaunch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appInfoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "lastAppActionLaunch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXPredictionUserContext initWithLastUnlockDate:lastAppLaunch:lastAppLaunchDate:secondMostRecentAppLaunch:lastAppActionLaunch:](v4, "initWithLastUnlockDate:lastAppLaunch:lastAppLaunchDate:secondMostRecentAppLaunch:lastAppActionLaunch:", v5, v7, v9, v11, v13);

  return v14;
}

- (id)predictionContextForCurrentContext
{
  _PASLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__ATXPredictionContextBuilder_predictionContextForCurrentContext__block_invoke;
  v5[3] = &unk_1E82DDB00;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __65__ATXPredictionContextBuilder_predictionContextForCurrentContext__block_invoke(uint64_t a1, void *a2)
{
  ATXPredictionContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tryInitContextSourcesAndReturnSuccess:"))
  {
    v3 = [ATXPredictionContext alloc];
    objc_msgSend(*(id *)(a1 + 32), "deviceStateContextForCurrentContext:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "timeContextForCurrentContext:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "locationMotionContextForCurrentContext:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ambientLightContextForCurrentContext:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userContextForCurrentContext:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXPredictionContext initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:](v3, "initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:", v4, v5, v6, v7, v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (id)updateContextStreamAndReturnPredictionContextForCurrentContext
{
  void *v3;
  uint64_t v4;
  _PASLock *lock;
  _PASLock *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;

  -[ATXPredictionContextBuilder predictionContextForCurrentContext](self, "predictionContextForCurrentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__22;
  v14[4] = __Block_byref_object_dispose__22;
  v15 = 0;
  v4 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__ATXPredictionContextBuilder_updateContextStreamAndReturnPredictionContextForCurrentContext__block_invoke;
  v13[3] = &unk_1E82DDB28;
  v13[4] = v14;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  v6 = self->_lock;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __93__ATXPredictionContextBuilder_updateContextStreamAndReturnPredictionContextForCurrentContext__block_invoke_2;
  v11[3] = &unk_1E82DDB50;
  v11[4] = self;
  v7 = v3;
  v12 = v7;
  -[_PASLock runWithLockAcquired:](v6, "runWithLockAcquired:", v11);
  v8 = v12;
  v9 = v7;

  _Block_object_dispose(v14, 8);
  return v9;
}

void __93__ATXPredictionContextBuilder_updateContextStreamAndReturnPredictionContextForCurrentContext__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "locationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getCurrentLocation");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __93__ATXPredictionContextBuilder_updateContextStreamAndReturnPredictionContextForCurrentContext__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CLLocationCoordinate2D v4;
  void *v5;
  void *v6;
  CLLocationCoordinate2D v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tryInitBiomeStreamsAndReturnSuccess:", v3) && *(_QWORD *)(a1 + 40))
  {
    v4 = CLLocationCoordinate2DMake(0.0, 0.0);
    objc_msgSend(*(id *)(a1 + 40), "locationMotionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentLOI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCoordinate:", v4.latitude, v4.longitude);

    v7 = CLLocationCoordinate2DMake(0.0, 0.0);
    objc_msgSend(*(id *)(a1 + 40), "locationMotionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previousLOI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCoordinate:", v7.latitude, v7.longitude);

    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%@ - updating prediction context Biome stream.", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(v3, "predictionContextStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:", *(_QWORD *)(a1 + 40));

  }
}

- (NSDate)now
{
  NSDate *now;

  now = self->_now;
  if (now)
    return now;
  else
    return (NSDate *)(id)objc_opt_new();
}

- (id)_getContextForOverrideKey:(id)a3 fromContextOverride:(id)a4 withDefaultContext:(id)a5 allowNilValues:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  id v25;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11 && !v6)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  objc_msgSend(v10, "objectForKey:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if (v6)
    v23 = 0;
  else
    v23 = v11;
  if (v20)
    v24 = v20;
  else
    v24 = v11;
  if (!v22)
    v23 = v24;
  v25 = v23;

  return v25;
}

- (id)deviceStateContextForContextOverride:(id)a3 guardedData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXPredictionDeviceStateContext *v14;

  v6 = a3;
  -[ATXPredictionContextBuilder deviceStateContextForCurrentContext:](self, "deviceStateContextForCurrentContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wifiSSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideWifiSSID"), v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "onWifi"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideOnWifi"), v6, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "inAirplaneMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideInAirplaneMode"), v6, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ATXPredictionDeviceStateContext initWithWifiSSID:onWifi:inAirplaneMode:]([ATXPredictionDeviceStateContext alloc], "initWithWifiSSID:onWifi:inAirplaneMode:", v9, objc_msgSend(v11, "BOOLValue"), objc_msgSend(v13, "BOOLValue"));
  return v14;
}

- (id)timeContextForContextOverride:(id)a3 guardedData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ATXPredictionTimeContext *v10;

  v6 = a3;
  -[ATXPredictionContextBuilder timeContextForCurrentContext:](self, "timeContextForCurrentContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideDate"), v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ATXPredictionTimeContext initWithDate:]([ATXPredictionTimeContext alloc], "initWithDate:", v9);
  return v10;
}

- (id)locationMotionContextForContextOverride:(id)a3 guardedData:(id)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  dispatch_semaphore_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  double v32;
  void *v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t i;
  void *v41;
  id v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  id v49;
  double v50;
  double v51;
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  ATXPredictionLocationMotionContext *v58;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  ATXPredictionLocationMotionContext *v71;
  uint64_t v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id obj;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  NSObject *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  char v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v79 = a4;
  -[ATXPredictionContextBuilder locationMotionContextForCurrentContext:](self, "locationMotionContextForCurrentContext:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v80, "locationEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideLocationEnabled"), v81, v6, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80E10], "stringForMotionType:", objc_msgSend(v80, "motionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideMotionType"), v81, v7, 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = 0;
  v73 = objc_msgSend(MEMORY[0x1E0D80E10], "motionTypeForString:found:", v77, &v97);
  if (!v97)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXPredictionContextBuilder locationMotionContextForContextOverride:guardedData:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

    v73 = 4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v80, "canPredictClipsGivenRecentMotion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverridecanPredictClipsGivenRecentMotion"), v81, v16, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v79, "locationManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "getCurrentLocation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideCurrentLocation"), v81, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v79, "locationManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "previousLOIAndCurrentLOI");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "first");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    v22 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v78, "coordinate");
    v24 = v23;
    objc_msgSend(v78, "coordinate");
    v26 = (void *)objc_msgSend(v22, "initWithLatitude:longitude:", v24, v25);
    -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverridePreviousLocation"), v81, v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverridePreviousLocation"), v81, 0, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v91 = 0;
  v92 = &v91;
  v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__22;
  v95 = __Block_byref_object_dispose__22;
  v96 = 0;
  v28 = dispatch_semaphore_create(0);
  objc_msgSend(v79, "locationManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __83__ATXPredictionContextBuilder_locationMotionContextForContextOverride_guardedData___block_invoke;
  v88[3] = &unk_1E82DC280;
  v90 = &v91;
  v76 = v28;
  v89 = v76;
  objc_msgSend(v29, "fetchAllLocationsOfInterest:", v88);

  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v76, 5.0) == 1)
  {
    __atxlog_handle_default();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[ATXPredictionContextBuilder locationMotionContextForContextOverride:guardedData:].cold.1(v30);

  }
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideLocationsOfInterest"), v81, v92[5], 1);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
  v32 = *MEMORY[0x1E0D80EA0];
  if (v31)
  {
    v83 = 0;
    v33 = 0;
    v34 = *MEMORY[0x1E0C9E318];
    v35 = *(_QWORD *)v85;
    v36 = *MEMORY[0x1E0C9E318];
    v37 = *MEMORY[0x1E0D80EA0];
    v38 = *MEMORY[0x1E0D80EA0];
    v39 = *MEMORY[0x1E0D80EA0];
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v85 != v35)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        v42 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v41, "coordinate");
        v44 = v43;
        objc_msgSend(v41, "coordinate");
        v45 = (void *)objc_msgSend(v42, "initWithLatitude:longitude:", v44);
        objc_msgSend(v19, "distanceFromLocation:", v45);
        if (v19)
        {
          v47 = v46;
          if (v46 < 400.0 && v46 < v34)
          {
            v49 = v41;

            v83 = v49;
            v34 = v47;
          }
        }
        objc_msgSend(v27, "distanceFromLocation:", v45);
        if (v27)
        {
          v51 = v50;
          if (v50 < 400.0 && v50 < v36)
          {
            v53 = v41;

            v33 = v53;
            v36 = v51;
          }
        }
        if (v19)
        {
          if (!objc_msgSend(v41, "type"))
          {
            objc_msgSend(v19, "distanceFromLocation:", v45);
            v32 = v54;
          }
          if (objc_msgSend(v41, "type") == 1)
          {
            objc_msgSend(v19, "distanceFromLocation:", v45);
            v37 = v55;
          }
          if (objc_msgSend(v41, "type") == 2)
          {
            objc_msgSend(v19, "distanceFromLocation:", v45);
            v38 = v56;
          }
          if (objc_msgSend(v41, "type") == 3)
          {
            objc_msgSend(v19, "distanceFromLocation:", v45);
            v39 = v57;
          }
        }

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
    }
    while (v31);
  }
  else
  {
    v83 = 0;
    v33 = 0;
    v37 = *MEMORY[0x1E0D80EA0];
    v38 = *MEMORY[0x1E0D80EA0];
    v39 = *MEMORY[0x1E0D80EA0];
  }

  v58 = [ATXPredictionLocationMotionContext alloc];
  v59 = objc_msgSend(v75, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "doubleValue");
  v62 = v61;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "doubleValue");
  v65 = v64;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "doubleValue");
  v68 = v67;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "doubleValue");
  v71 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](v58, "initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v83, v33, v73, v19, v59, objc_msgSend(v74, "BOOLValue"), v62, v65, v68, v70);

  _Block_object_dispose(&v91, 8);
  return v71;
}

void __83__ATXPredictionContextBuilder_locationMotionContextForContextOverride_guardedData___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)ambientLightContextForContextOverride:(id)a3 guardedData:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  ATXPredictionAmbientLightContext *v13;

  v6 = a3;
  -[ATXPredictionContextBuilder ambientLightContextForCurrentContext:](self, "ambientLightContextForCurrentContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ambientLightType");
  if (v8 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E82DDB98[(int)v8];
  }
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideAmbientLightType"), v6, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  v12 = 0;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeDark")) & 1) == 0)
  {
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeIndoorDark")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeOutdoorDark")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeIndoorArtificialLight")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeIndoorBrightArtificialLight")) & 1) != 0)
    {
      v12 = 4;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeOutdoor")) & 1) != 0)
    {
      v12 = 5;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeOutdoorDirectSun")) & 1) != 0)
    {
      v12 = 6;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ProactiveAppPredictionAmbientLightTypeUnknown")))
    {
      v12 = 7;
    }
    else
    {
      v12 = 0;
    }
  }

  v13 = -[ATXPredictionAmbientLightContext initWithAmbientLightType:]([ATXPredictionAmbientLightContext alloc], "initWithAmbientLightType:", v12);
  return v13;
}

- (id)userContextForContextOverride:(id)a3 guardedData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ATXPredictionUserContext *v18;

  v6 = a3;
  -[ATXPredictionContextBuilder userContextForCurrentContext:](self, "userContextForCurrentContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastUnlockDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideLastUnlockDate"), v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastAppLaunch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideLastAppLaunch"), v6, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastAppLaunchDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideLastAppLaunchDate"), v6, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "secondMostRecentAppLaunch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideSecondMostRecentAppLaunch"), v6, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastAppActionLaunch");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideLastAppActionLaunch"), v6, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[ATXPredictionUserContext initWithLastUnlockDate:lastAppLaunch:lastAppLaunchDate:secondMostRecentAppLaunch:lastAppActionLaunch:]([ATXPredictionUserContext alloc], "initWithLastUnlockDate:lastAppLaunch:lastAppLaunchDate:secondMostRecentAppLaunch:lastAppActionLaunch:", v9, v11, v13, v15, v17);
  return v18;
}

- (id)predictionContextForContextOverride:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__22;
    v15 = __Block_byref_object_dispose__22;
    v16 = 0;
    lock = self->_lock;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__ATXPredictionContextBuilder_predictionContextForContextOverride___block_invoke;
    v8[3] = &unk_1E82DDB78;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    -[ATXPredictionContextBuilder predictionContextForCurrentContext](self, "predictionContextForCurrentContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __67__ATXPredictionContextBuilder_predictionContextForContextOverride___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXPredictionContext *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tryInitContextSourcesAndReturnSuccess:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceStateContextForContextOverride:guardedData:", *(_QWORD *)(a1 + 40), v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "timeContextForContextOverride:guardedData:", *(_QWORD *)(a1 + 40), v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "locationMotionContextForContextOverride:guardedData:", *(_QWORD *)(a1 + 40), v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ambientLightContextForContextOverride:guardedData:", *(_QWORD *)(a1 + 40), v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userContextForContextOverride:guardedData:", *(_QWORD *)(a1 + 40), v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ATXPredictionContext initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:isOverridden:]([ATXPredictionContext alloc], "initWithDeviceStateContext:timeContext:locationMotionContext:ambientLightContext:userContext:isOverridden:", v3, v4, v5, v6, v7, 1);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

+ (id)loadContextOverrideFromJSONFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  float v26;
  double v27;
  void *v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  ATXBluetoothDuetEvent *v67;
  void *v68;
  void *v69;
  ATXMicrolocationVisitDuetEvent *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  ATXMicrolocationVisitDuetEvent *v75;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v3;
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("json"));
  v6 = objc_claimAutoreleasedReturnValue();

  v79 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v9, "valueForKey:", CFSTR("ATXContextOverrideDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ATXContextOverrideDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v11, "integerValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("ATXContextOverrideDate"));

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("ATXContextOverrideCurrentLocation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ATXContextOverrideCurrentLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v21 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:", v18, v20);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("ATXContextOverrideCurrentLocation"));

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("ATXContextOverridePreviousLocation"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ATXContextOverridePreviousLocation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    v27 = v26;
    objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    v30 = (void *)objc_msgSend(v24, "initWithLatitude:longitude:", v27, v29);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("ATXContextOverridePreviousLocation"));

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("ATXContextOverrideInferredModeEvent"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ATXContextOverrideInferredModeEvent"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc(MEMORY[0x1E0D02338]);
    v34 = (void *)objc_opt_new();
    v35 = (void *)objc_opt_new();
    objc_msgSend(v35, "UUIDString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v77) = BMUserFocusInferredModeTypeFromString();
    v37 = (void *)objc_msgSend(v33, "initWithAbsoluteTimestamp:modeIdentifier:origin:originBundleID:isAutomationEnabled:isStart:uuid:originAnchorType:uiLocation:confidenceScore:serializedTriggers:modeType:shouldSuggestTriggers:userModeName:", v34, 0, 1, 0, v36, 0, &unk_1E83CC040, &unk_1E83CC058, MEMORY[0x1E0C9AA60], v77, MEMORY[0x1E0C9AAA0], 0);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v37, CFSTR("ATXContextOverrideInferredModeEvent"));

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("ATXContextOverrideUserFocusComputedModeEvent"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ATXContextOverrideUserFocusComputedModeEvent"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_alloc(MEMORY[0x1E0D02340]);
    v41 = (void *)objc_msgSend(v40, "initWithMode:starting:updateReason:semanticType:updateSource:semanticModeIdentifier:", v39, MEMORY[0x1E0C9AAB0], 0, 0, 0, 0);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v41, CFSTR("ATXContextOverrideUserFocusComputedModeEvent"));

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("ATXContextOverridePoiCategory"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ATXContextOverridePoiCategory"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_alloc(MEMORY[0x1E0D02090]);
    v45 = (void *)objc_opt_new();
    v46 = (void *)objc_msgSend(v44, "initWithPoiCategory:rank:timestamp:", v43, &unk_1E83CC070, v45);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v46, CFSTR("ATXContextOverridePoiCategory"));

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("ATXContextOverrideCandidateIdentifiersLaunchAge"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v78 = v7;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ATXContextOverrideCandidateIdentifiersLaunchAge"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_opt_new();
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v50 = v48;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v82 != v53)
            objc_enumerationMutation(v50);
          v55 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
          v56 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v50, "objectForKeyedSubscript:", v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v57, "integerValue"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v58, v55);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
      }
      while (v52);
    }

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v49, CFSTR("ATXContextOverrideCandidateIdentifiersLaunchAge"));
    v7 = v78;
  }
  objc_msgSend(v9, "valueForKey:", CFSTR("ATXContextOverrideBluetoothEvent"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ATXContextOverrideBluetoothEvent"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v62, "integerValue"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v65, "integerValue"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = -[ATXBluetoothDuetEvent initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:]([ATXBluetoothDuetEvent alloc], "initWithBluetoothState:deviceType:deviceName:hardwareAddress:startDate:endDate:", 1, 3, &stru_1E82FDC98, &stru_1E82FDC98, v63, v66);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v67, CFSTR("ATXContextOverrideBluetoothEvent"));

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("ATXContextOverrideMicrolocationVisitEvent"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ATXContextOverrideMicrolocationVisitEvent"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = [ATXMicrolocationVisitDuetEvent alloc];
    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v69);
    v72 = (void *)objc_opt_new();
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -20.0);
    v74 = (void *)objc_opt_new();
    v75 = -[ATXMicrolocationVisitDuetEvent initWithDominantMicrolocationUUID:microlocationProbabilities:startDate:endDate:](v70, "initWithDominantMicrolocationUUID:microlocationProbabilities:startDate:endDate:", v71, v72, v73, v74);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v75, CFSTR("ATXContextOverrideMicrolocationVisitEvent"));

  }
  return v9;
}

- (void)setNow:(id)a3
{
  objc_storeStrong((id *)&self->_now, a3);
}

- (_PASLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)predictionContextForCurrentContextAndCandidatePublisher:(id)a3 contextOverride:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = a4;
  -[ATXPredictionContextBuilder predictionContextForContextOverride:](self, "predictionContextForContextOverride:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__79;
  v29 = __Block_byref_object_dispose__79;
  v30 = (id)objc_opt_new();
  v23[4] = &v25;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke;
  v24[3] = &unk_1E82E67E0;
  v24[4] = self;
  v24[5] = &v25;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke_4;
  v23[3] = &unk_1E82E7248;
  v9 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", v24, v23);
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideCandidateIdentifiersLaunchAge"), v7, v26[5], 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCandidateIdentifiersLaunchAge:", v10);

  objc_msgSend(MEMORY[0x1E0D80E50], "currentMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideInferredModeEvent"), v7, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInferredModeEvent:", v12);

  objc_msgSend(MEMORY[0x1E0D80E48], "currentMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideUserFocusComputedModeEvent"), v7, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserFocusComputedModeEvent:", v14);

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "currentPoiCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverridePoiCategory"), v7, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPoiCategory:", v17);

  +[ATXBluetoothDuetEvent mostRecentOrActiveBluetoothConnectedEventFromCurrentContextStoreValues](ATXBluetoothDuetEvent, "mostRecentOrActiveBluetoothConnectedEventFromCurrentContextStoreValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideBluetoothEvent"), v7, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBluetoothEvent:", v19);

  v20 = (void *)objc_msgSend(objc_alloc(+[ATXMicrolocationVisitDuetDataProvider supportedDuetEventClass](ATXMicrolocationVisitDuetDataProvider, "supportedDuetEventClass")), "initWithCurrentContextStoreValuesWithTwoHourLimit:", 0);
  -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](self, "_getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:", CFSTR("ATXContextOverrideMicrolocationVisitEvent"), v7, v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMicrolocationVisitEvent:", v21);

  if (objc_msgSend(v7, "count"))
    objc_msgSend(v8, "setIsOverridden:", 1);
  _Block_object_dispose(&v25, 8);

  return v8;
}

void __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (objc_msgSend(a2, "state"))
  {
    __atxlog_handle_relevance_model();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke_cold_1(a1, v3);

    v4 = objc_opt_new();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v4, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)_getContextForOverrideKey:(uint64_t)a3 fromContextOverride:(uint64_t)a4 withDefaultContext:(uint64_t)a5 allowNilValues:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "_getContextForOverrideKey invoked with nil defaultContext, but allowNilValues is NO", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)locationMotionContextForContextOverride:(os_log_t)log guardedData:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "fetchAllLocationsOfInterest in locationMotionContextForContextOverride timed out", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)locationMotionContextForContextOverride:(uint64_t)a3 guardedData:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "contextOverride in locationMotionContextForContextOverride supplied with invalid ATXMotionType", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%@ - Error when querying for recently launched candidate. Returning empty set.", (uint8_t *)&v5, 0xCu);

}

@end
