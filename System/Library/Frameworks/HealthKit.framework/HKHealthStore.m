@implementation HKHealthStore

- (void)startHealthServiceDiscovery:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startHealthServiceDiscovery:withHandler:", v7, v6);

}

- (void)endHealthServiceDiscovery:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endHealthServiceDiscovery:", v4);

}

- (void)startHealthServiceSession:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startHealthServiceSession:withHandler:", v7, v6);

}

- (void)endHealthServiceSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endHealthServiceSession:", v4);

}

- (void)registerPeripheralIdentifier:(id)a3 name:(id)a4 services:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerPeripheralIdentifier:name:services:withCompletion:", v13, v12, v11, v10);

}

- (void)unregisterPeripheralIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterPeripheralIdentifier:withCompletion:", v7, v6);

}

- (void)healthServicePairingsWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "healthServicePairingsWithHandler:", v4);

}

- (void)healthPeripheralsWithFilter:(unint64_t)a3 handler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "healthPeripheralsWithFilter:handler:", a3, v6);

}

- (void)addHealthServicePairing:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addHealthServicePairing:withCompletion:", v7, v6);

}

- (void)removeHealthServicePairing:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeHealthServicePairing:withCompletion:", v7, v6);

}

- (void)healthPeripheralsWithCustomProperties:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "healthPeripheralsWithCustomProperties:withCompletion:", v7, v6);

}

- (void)getEnabledStatusForPeripheral:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HKHealthStore healthServicesManager](self, "healthServicesManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getEnabledStatusForPeripheral:withCompletion:", v7, v6);

}

+ (BOOL)isHealthDataAvailable
{
  void *v2;
  uint64_t v3;
  char v4;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isiPad"))
  {
    v4 = HKProgramSDKAtLeast(0x7E70901FFFFFFFFLL, v3);

    if ((v4 & 1) == 0)
      return 0;
  }
  else
  {

  }
  return +[_HKBehavior isDeviceSupported](_HKBehavior, "isDeviceSupported");
}

+ (void)setRequireExplicitSystemMachServiceEnablement:(BOOL)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_classPropertyLock);
  _requireExplicitSystemMachServiceEndpoint = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_classPropertyLock);
}

+ (BOOL)requireExplicitSystemMachServiceEnablement
{
  char v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_classPropertyLock);
  v2 = _requireExplicitSystemMachServiceEndpoint;
  os_unfair_lock_unlock((os_unfair_lock_t)&_classPropertyLock);
  return v2;
}

+ (void)disallowHKHealthStoreCreation
{
  _allowHKHealthStoreCreation = 1;
}

- (HKHealthStore)init
{
  return -[HKHealthStore initWithListenerEndpoint:debugIdentifier:](self, "initWithListenerEndpoint:debugIdentifier:", 0, 0);
}

- (id)_initWithIdentifier:(id)a3
{
  id v4;
  HKHealthStore *v5;
  void *v6;

  v4 = a3;
  v5 = -[HKHealthStore init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "profileIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthStore setProfileIdentifier:](v5, "setProfileIdentifier:", v6);

  }
  return v5;
}

- (HKHealthStore)initWithIdentifier:(id)a3
{
  return -[HKHealthStore initWithListenerEndpoint:debugIdentifier:](self, "initWithListenerEndpoint:debugIdentifier:", 0, a3);
}

- (HKHealthStore)initWithListenerEndpoint:(id)a3
{
  return -[HKHealthStore initWithListenerEndpoint:debugIdentifier:](self, "initWithListenerEndpoint:debugIdentifier:", a3, 0);
}

- (HKHealthStore)initWithListenerEndpoint:(id)a3 debugIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  HKHealthStore *v24;
  HKHealthStore *v25;
  uint64_t v26;
  OS_dispatch_queue *connectionQueue;
  uint64_t v28;
  OS_dispatch_queue *clientQueue;
  uint64_t v30;
  NSString *debugIdentifier;
  uint64_t v32;
  HKProfileIdentifier *profileIdentifier;
  uint64_t v34;
  HKHealthStoreIdentifier *identifier;
  uint64_t v36;
  BOOL v37;
  void *v38;
  NSObject *v39;
  void *v41;
  void *v42;
  _QWORD block[4];
  HKHealthStore *v44;
  id v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "isHealthDataAvailable") & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "Health data is not available on this device", buf, 2u);
    }
  }
  if (_allowHKHealthStoreCreation == 1)
  {
    _HKInitializeLogging();
    v9 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
      -[HKHealthStore initWithListenerEndpoint:debugIdentifier:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols", v7, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v48;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v21);
          _HKInitializeLogging();
          v23 = HKLogDefault;
          if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v22;
            _os_log_error_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_ERROR, "    %@", buf, 0xCu);
          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v19);
    }

    v7 = v41;
    v6 = v42;
  }
  v46.receiver = self;
  v46.super_class = (Class)HKHealthStore;
  v24 = -[HKHealthStore init](&v46, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_lock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue(v24, CFSTR("connection"));
    v26 = objc_claimAutoreleasedReturnValue();
    connectionQueue = v25->_connectionQueue;
    v25->_connectionQueue = (OS_dispatch_queue *)v26;

    HKCreateSerialDispatchQueue(v25, CFSTR("client"));
    v28 = objc_claimAutoreleasedReturnValue();
    clientQueue = v25->_clientQueue;
    v25->_clientQueue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v25->_daemonLaunchDarwinNotificationName, CFSTR("kHKHealthDaemonDidFinishLaunchingNotification"));
    v30 = objc_msgSend(v7, "copy");
    debugIdentifier = v25->_debugIdentifier;
    v25->_debugIdentifier = (NSString *)v30;

    +[HKProfileIdentifier primaryProfile](HKProfileIdentifier, "primaryProfile");
    v32 = objc_claimAutoreleasedReturnValue();
    profileIdentifier = v25->_profileIdentifier;
    v25->_profileIdentifier = (HKProfileIdentifier *)v32;

    +[HKHealthStoreIdentifier primaryStoreIdentifier](HKHealthStoreIdentifier, "primaryStoreIdentifier");
    v34 = objc_claimAutoreleasedReturnValue();
    identifier = v25->_identifier;
    v25->_identifier = (HKHealthStoreIdentifier *)v34;

    v36 = HKApplicationSDKVersionToken();
    v37 = 0;
    v25->_applicationSDKVersionToken = v36;
    if (!v6)
      v37 = !+[HKHealthStore requireExplicitSystemMachServiceEnablement](HKHealthStore, "requireExplicitSystemMachServiceEnablement");
    v25->_canConnectToSystemMachService = v37;
    v25->_isUsingSystemEndpoint = v6 == 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v25, sel__applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);
    objc_msgSend(v38, "addObserver:selector:name:object:", v25, sel__applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
    -[HKHealthStore _faultIfInnappropriateHost](v25, "_faultIfInnappropriateHost");
    v39 = v25->_connectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HKHealthStore_initWithListenerEndpoint_debugIdentifier___block_invoke;
    block[3] = &unk_1E37E6980;
    v44 = v25;
    v45 = v6;
    dispatch_async(v39, block);

  }
  return v25;
}

uint64_t __58__HKHealthStore_initWithListenerEndpoint_debugIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_setUpWithEndpoint:", *(_QWORD *)(a1 + 40));
}

- (void)_faultIfInnappropriateHost
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Attempt to instantiate HKHealthStore in healthd", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __43__HKHealthStore__faultIfInnappropriateHost__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _faultIfInnappropriateHost_isHealthd = objc_msgSend(v0, "isEqualToString:", CFSTR("healthd"));

}

- (void)_connectionQueue_setUpWithEndpoint:(id)a3
{
  id v4;
  _HKXPCConnection *v5;
  uint64_t v6;
  _HKXPCConnection *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _HKXPCConnection *healthdConnection;
  _HKXPCConnection *v17;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  if (+[_HKBehavior isDeviceSupported](_HKBehavior, "isDeviceSupported"))
  {
    v5 = [_HKXPCConnection alloc];
    if (v4)
      v6 = -[_HKXPCConnection initWithListenerEndpoint:](v5, "initWithListenerEndpoint:", v4);
    else
      v6 = -[_HKXPCConnection initWithMachServiceName:options:](v5, "initWithMachServiceName:options:", CFSTR("com.apple.healthd.server"), 4096);
    v7 = (_HKXPCConnection *)v6;
    if (!v6)
    {
      _HKInitializeLogging();
      v8 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        -[HKHealthStore _connectionQueue_setUpWithEndpoint:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    healthdConnection = self->_healthdConnection;
    self->_healthdConnection = v7;
    v17 = v7;

    -[_HKXPCConnection setExportedObject:](self->_healthdConnection, "setExportedObject:", self);
    -[_HKXPCConnection resume](self->_healthdConnection, "resume");

  }
}

- (id)unitTest_replaceListenerEndpoint:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  self->_isUsingSystemEndpoint = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HKHealthStore_unitTest_replaceListenerEndpoint___block_invoke;
  block[3] = &unk_1E37E6838;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  dispatch_sync(connectionQueue, block);
  -[HKHealthStore connectionInterrupted](self, "connectionInterrupted");
  objc_msgSend((id)v13[5], "invalidate");
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __50__HKHealthStore_unitTest_replaceListenerEndpoint___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_setUpWithEndpoint:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setExportedObject:", 0);
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  void *v4;
  objc_super v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_HKXPCConnection invalidate](self->_healthdConnection, "invalidate");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HKHealthStore;
  -[HKHealthStore dealloc](&v5, sel_dealloc);
}

- (void)_setConfigurationPropertyUsingBlock:(id)a3 resumeRequired:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(void);

  v4 = a4;
  v6 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_resumed)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot configure HKHealthStore after it has been resumed"));
  }
  else
  {
    if (v4)
      self->_resumeRequired = 1;
    v6[2]();
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)unitTest_setApplicationSDKVersionToken:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__HKHealthStore_unitTest_setApplicationSDKVersionToken___block_invoke;
  v3[3] = &unk_1E37E8940;
  v3[4] = self;
  v3[5] = a3;
  -[HKHealthStore _setConfigurationPropertyUsingBlock:resumeRequired:](self, "_setConfigurationPropertyUsingBlock:resumeRequired:", v3, 1);
}

uint64_t __56__HKHealthStore_unitTest_setApplicationSDKVersionToken___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 64) = *(_QWORD *)(result + 40);
  return result;
}

- (unint64_t)applicationSDKVersionToken
{
  os_unfair_lock_s *p_lock;
  unint64_t applicationSDKVersionToken;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  applicationSDKVersionToken = self->_applicationSDKVersionToken;
  os_unfair_lock_unlock(p_lock);
  return applicationSDKVersionToken;
}

- (void)setProfileIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__HKHealthStore_setProfileIdentifier___block_invoke;
  v6[3] = &unk_1E37E6980;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKHealthStore _setConfigurationPropertyUsingBlock:resumeRequired:](self, "_setConfigurationPropertyUsingBlock:resumeRequired:", v6, 1);

}

void __38__HKHealthStore_setProfileIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  +[HKHealthStoreIdentifier identifierFromProfileIdentifier:](HKHealthStoreIdentifier, "identifierFromProfileIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 232);
  *(_QWORD *)(v3 + 232) = v2;

}

- (HKProfileIdentifier)profileIdentifier
{
  os_unfair_lock_s *p_lock;
  HKProfileIdentifier *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_profileIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__HKHealthStore_setSourceBundleIdentifier___block_invoke;
  v6[3] = &unk_1E37E8968;
  v6[4] = self;
  v8 = &v9;
  v5 = v4;
  v7 = v5;
  -[HKHealthStore _setConfigurationPropertyUsingBlock:resumeRequired:](self, "_setConfigurationPropertyUsingBlock:resumeRequired:", v6, 1);
  if (*((_BYTE *)v10 + 24))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Do not set both sourceBundleIdentifier and sourceBundle"));

  _Block_object_dispose(&v9, 8);
}

void __43__HKHealthStore_setSourceBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 32))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  else
    objc_storeStrong((id *)(v1 + 40), *(id *)(a1 + 40));
}

- (NSString)sourceBundleIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sourceBundleIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSourceBundle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__HKHealthStore_setSourceBundle___block_invoke;
  v6[3] = &unk_1E37E6980;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKHealthStore _setConfigurationPropertyUsingBlock:resumeRequired:](self, "_setConfigurationPropertyUsingBlock:resumeRequired:", v6, 1);

}

void __33__HKHealthStore_setSourceBundle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (NSBundle)sourceBundle
{
  os_unfair_lock_s *p_lock;
  NSBundle *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_sourceBundle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_sourceBundleOrDefaultBundle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HKHealthStore sourceBundle](self, "sourceBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)setDebugIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__HKHealthStore_setDebugIdentifier___block_invoke;
  v6[3] = &unk_1E37E6980;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKHealthStore _setConfigurationPropertyUsingBlock:resumeRequired:](self, "_setConfigurationPropertyUsingBlock:resumeRequired:", v6, 1);

}

void __36__HKHealthStore_setDebugIdentifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (NSString)debugIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_debugIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCanConnectToSystemMachService:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__HKHealthStore_setCanConnectToSystemMachService___block_invoke;
  v3[3] = &unk_1E37E8990;
  v3[4] = self;
  v4 = a3;
  -[HKHealthStore _setConfigurationPropertyUsingBlock:resumeRequired:](self, "_setConfigurationPropertyUsingBlock:resumeRequired:", v3, 0);
}

uint64_t __50__HKHealthStore_setCanConnectToSystemMachService___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)canConnectToSystemMachService
{
  HKHealthStore *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canConnectToSystemMachService;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HKHealthServicesManager)healthServicesManager
{
  os_unfair_lock_s *p_lock;
  HKHealthServicesManager *healthServicesManager;
  HKHealthServicesManager *v5;
  HKHealthServicesManager *v6;
  HKHealthServicesManager *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  healthServicesManager = self->_healthServicesManager;
  if (!healthServicesManager)
  {
    v5 = -[HKHealthServicesManager initWithWeakHealthStore:]([HKHealthServicesManager alloc], "initWithWeakHealthStore:", self);
    v6 = self->_healthServicesManager;
    self->_healthServicesManager = v5;

    healthServicesManager = self->_healthServicesManager;
  }
  v7 = healthServicesManager;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)resume
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_resumed = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)_discardServerProxiesForServer:(id)a3
{
  HKHealthStoreServerInterface *v4;

  v4 = (HKHealthStoreServerInterface *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serverProxy == v4)
  {
    self->_serverProxy = 0;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)_lock_connectionWithError:(id *)a3
{
  _HKXPCConnection *v6;
  _HKXPCConnection *v7;
  _HKXPCConnection *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_resumed)
  {
    if (self->_resumeRequired)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Missing call to -[HKHealthStore resume]"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v9);
        else
          _HKLogDroppedError(v9);
      }

      goto LABEL_19;
    }
    self->_resumed = 1;
  }
  if (self->_isUsingSystemEndpoint && !self->_canConnectToSystemMachService)
  {
LABEL_19:
    v7 = 0;
    return v7;
  }
  v6 = self->_healthdConnection;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else if (+[_HKBehavior isDeviceSupported](_HKBehavior, "isDeviceSupported"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("invalid connection to %@"), CFSTR("com.apple.healthd.server"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_healthDataUnavailableError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError(v11);
    }

  }
  return v7;
}

- (id)_wrappedErrorHandler:(id)a3 proxy:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD aBlock[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__HKHealthStore__wrappedErrorHandler_proxy___block_invoke;
  aBlock[3] = &unk_1E37E89B8;
  aBlock[4] = self;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  v10 = _Block_copy(aBlock);

  return v10;
}

void __44__HKHealthStore__wrappedErrorHandler_proxy___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hk_isXPCConnectionError"))
    objc_msgSend(*(id *)(a1 + 32), "_discardServerProxiesForServer:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)healthStoreConfiguration
{
  HKHealthStoreConfiguration *v3;
  NSString *sourceBundleIdentifier;
  void *v5;
  void *v6;
  HKHealthStoreConfiguration *v7;

  v3 = [HKHealthStoreConfiguration alloc];
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKHealthStoreConfiguration initWithSourceBundleIdentifier:sourceVersion:debugIdentifier:profileIdentifier:applicationSDKVersionToken:](v3, "initWithSourceBundleIdentifier:sourceVersion:debugIdentifier:profileIdentifier:applicationSDKVersionToken:", sourceBundleIdentifier, v6, self->_debugIdentifier, self->_profileIdentifier, self->_applicationSDKVersionToken);

  return v7;
}

- (void)_serverProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *connectionQueue;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthStore.m"), 515, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("proxyHandler"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthStore.m"), 516, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalErrorHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HKHealthStore__serverProxyWithHandler_errorHandler___block_invoke;
  block[3] = &unk_1E37E8A08;
  block[4] = self;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  dispatch_async(connectionQueue, block);

}

void __54__HKHealthStore__serverProxyWithHandler_errorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v2, "_lock_connectionWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "_wrappedErrorHandler:proxy:", *(_QWORD *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    if (!v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_6;
    }
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "healthStoreConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__HKHealthStore__serverProxyWithHandler_errorHandler___block_invoke_2;
    v10[3] = &unk_1E37E89E0;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "remote_serverForConfiguration:completion:", v9, v10);

  }
LABEL_6:

}

void __54__HKHealthStore__serverProxyWithHandler_errorHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
    v5 = a1[4];
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;
    v7 = v4;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", a1[5]);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (id)_synchronousServerProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *connectionQueue;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  _QWORD block[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = (void (**)(id, _QWORD))a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  connectionQueue = self->_connectionQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HKHealthStore__synchronousServerProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E37E8A30;
  block[4] = self;
  block[5] = &v24;
  block[6] = &v30;
  block[7] = &v18;
  dispatch_sync(connectionQueue, block);
  -[HKHealthStore _wrappedErrorHandler:proxy:](self, "_wrappedErrorHandler:proxy:", v4, v19[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v19[5];
  if (v8)
  {
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)v25[5];
    if (v10)
    {
      objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthStore healthStoreConfiguration](self, "healthStoreConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __57__HKHealthStore__synchronousServerProxyWithErrorHandler___block_invoke_2;
      v14[3] = &unk_1E37E8A58;
      v14[4] = self;
      v16 = &v18;
      v15 = v7;
      objc_msgSend(v11, "remote_serverForConfiguration:completion:", v12, v14);
      v9 = (id)v19[5];

    }
    else
    {
      v4[2](v4, v31[5]);
      v9 = 0;
    }
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v9;
}

void __57__HKHealthStore__synchronousServerProxyWithErrorHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  v2 = (void *)a1[4];
  v10 = 0;
  objc_msgSend(v2, "_lock_connectionWithError:", &v10);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;
  v9 = v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 80));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));

}

void __57__HKHealthStore__synchronousServerProxyWithErrorHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
    objc_storeStrong((id *)(a1[4] + 80), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", a1[5]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }

}

- (void)fetchPluginServiceEndpointForIdentifier:(id)a3 endpointHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  HKHealthStore *v18;
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  HKHealthStore *v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "endpointHandler");
    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "errorHandler");
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "pluginIdentifier");
  if (!v9)
    goto LABEL_6;
LABEL_3:
  if (!v10)
    goto LABEL_7;
LABEL_4:
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke;
  aBlock[3] = &unk_1E37E89B8;
  v12 = v8;
  v22 = v12;
  v23 = self;
  v24 = v10;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_2;
  v16[3] = &unk_1E37E8AA8;
  v17 = v12;
  v18 = self;
  v19 = v9;
  v20 = _Block_copy(aBlock);
  v13 = v20;
  v14 = v9;
  v15 = v12;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v16, v13);

}

void __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for plugin service \"%{public}@\": %{public}@", buf, 0x16u);
  }
  v6 = (void *)a1[6];
  v7 = *(NSObject **)(a1[5] + 216);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_246;
  v9[3] = &unk_1E37E6D40;
  v10 = v3;
  v11 = v6;
  v8 = v3;
  dispatch_async(v7, v9);

}

uint64_t __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_246(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_3;
  v6[3] = &unk_1E37E8A80;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  objc_msgSend(v5, "remote_fetchPluginServiceEndpointWithIdentifier:completion:", v4, v6);

}

void __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *v8;
  id *v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_4;
    v16[3] = &unk_1E37E6D40;
    v8 = &v18;
    v18 = *(id *)(a1 + 56);
    v9 = &v17;
    v17 = v5;
    v10 = v16;
  }
  else
  {
    _HKInitializeLogging();
    v11 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for plugin \"%{public}@\": %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(v6, "hk_isXPCConnectionError"))
      objc_msgSend(*(id *)(a1 + 32), "_discardServerProxiesForServer:", *(_QWORD *)(a1 + 48));
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_247;
    v13[3] = &unk_1E37E6D40;
    v8 = &v15;
    v15 = *(id *)(a1 + 64);
    v9 = &v14;
    v14 = v6;
    v10 = v13;
  }
  dispatch_async(v7, v10);

}

uint64_t __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __86__HKHealthStore_fetchPluginServiceEndpointForIdentifier_endpointHandler_errorHandler___block_invoke_247(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)pluginServiceEndpointForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  HKHealthStore *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "pluginIdentifier");
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__HKHealthStore_pluginServiceEndpointForIdentifier_error___block_invoke;
  v22[3] = &unk_1E37E8AD0;
  v8 = v6;
  v23 = v8;
  v24 = &v25;
  -[HKHealthStore _synchronousServerProxyWithErrorHandler:](self, "_synchronousServerProxyWithErrorHandler:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __58__HKHealthStore_pluginServiceEndpointForIdentifier_error___block_invoke_250;
  v16[3] = &unk_1E37E8AF8;
  v20 = &v31;
  v10 = v8;
  v17 = v10;
  v18 = self;
  v11 = v9;
  v19 = v11;
  v21 = &v25;
  objc_msgSend(v11, "remote_fetchPluginServiceEndpointWithIdentifier:completion:", v10, v16);
  v12 = (id)v26[5];
  v13 = v12;
  if (v12)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError(v12);
  }

  v14 = (id)v32[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v14;
}

void __58__HKHealthStore_pluginServiceEndpointForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for plugin service \"%{public}@\": %{public}@", (uint8_t *)&v8, 0x16u);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __58__HKHealthStore_pluginServiceEndpointForIdentifier_error___block_invoke_250(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v9 = a2;
  }
  else
  {
    _HKInitializeLogging();
    v10 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for plugin \"%{public}@\": %{public}@", (uint8_t *)&v12, 0x16u);
    }
    if (objc_msgSend(v7, "hk_isXPCConnectionError"))
      objc_msgSend(*(id *)(a1 + 40), "_discardServerProxiesForServer:", *(_QWORD *)(a1 + 48));
    v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v9 = a3;
  }
  objc_storeStrong(v8, v9);

}

- (void)fetchTaskServerEndpointForIdentifier:(id)a3 pluginURL:(id)a4 taskUUID:(id)a5 instanceUUID:(id)a6 configuration:(id)a7 endpointHandler:(id)a8 errorHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  HKHealthStore *v35;
  id v36;
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v15)
  {
    if (v20)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "endpointHandler");
    if (v21)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "errorHandler");
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "taskIdentifier");
  if (!v20)
    goto LABEL_6;
LABEL_3:
  if (!v21)
    goto LABEL_7;
LABEL_4:
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke;
  v29[3] = &unk_1E37E8B20;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v35 = self;
  v36 = v20;
  v37 = v21;
  v22 = v21;
  v23 = v20;
  v24 = v19;
  v25 = v18;
  v26 = v17;
  v27 = v16;
  v28 = v15;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v29, v22);

}

void __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_2;
  v10[3] = &unk_1E37E8A80;
  v8 = *(_QWORD *)(a1 + 64);
  v10[4] = *(_QWORD *)(a1 + 72);
  v13 = *(id *)(a1 + 80);
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v14 = *(id *)(a1 + 88);
  v9 = v3;
  objc_msgSend(v9, "remote_createTaskServerEndpointForIdentifier:pluginURL:taskUUID:instanceUUID:configuration:completion:", v4, v5, v6, v7, v8, v10);

}

void __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *v8;
  id *v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_3;
    v16[3] = &unk_1E37E6D40;
    v8 = &v18;
    v18 = *(id *)(a1 + 56);
    v9 = &v17;
    v17 = v5;
    v10 = v16;
  }
  else
  {
    _HKInitializeLogging();
    v11 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for task server \"%{public}@\": %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(v6, "hk_isXPCConnectionError"))
      objc_msgSend(*(id *)(a1 + 32), "_discardServerProxiesForServer:", *(_QWORD *)(a1 + 48));
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_252;
    v13[3] = &unk_1E37E6D40;
    v8 = &v15;
    v15 = *(id *)(a1 + 64);
    v9 = &v14;
    v14 = v6;
    v10 = v13;
  }
  dispatch_async(v7, v10);

}

uint64_t __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __129__HKHealthStore_fetchTaskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_endpointHandler_errorHandler___block_invoke_252(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)taskServerEndpointForIdentifier:(id)a3 pluginURL:(id)a4 taskUUID:(id)a5 instanceUUID:(id)a6 configuration:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v27[4];
  id v28;
  HKHealthStore *v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "taskIdentifier");
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3;
  v44 = __Block_byref_object_dispose__3;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3;
  v38 = __Block_byref_object_dispose__3;
  v18 = MEMORY[0x1E0C809B0];
  v39 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __101__HKHealthStore_taskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_error___block_invoke;
  v33[3] = &unk_1E37E8B48;
  v33[4] = &v34;
  -[HKHealthStore _synchronousServerProxyWithErrorHandler:](self, "_synchronousServerProxyWithErrorHandler:", v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __101__HKHealthStore_taskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_error___block_invoke_2;
  v27[3] = &unk_1E37E8AF8;
  v31 = &v40;
  v20 = v13;
  v28 = v20;
  v29 = self;
  v21 = v19;
  v30 = v21;
  v32 = &v34;
  objc_msgSend(v21, "remote_createTaskServerEndpointForIdentifier:pluginURL:taskUUID:instanceUUID:configuration:completion:", v20, v14, v15, v16, v17, v27);
  v22 = (id)v35[5];
  v23 = v22;
  if (v22)
  {
    if (a8)
      *a8 = objc_retainAutorelease(v22);
    else
      _HKLogDroppedError(v22);
  }

  v24 = (id)v41[5];
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v24;
}

void __101__HKHealthStore_taskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __101__HKHealthStore_taskServerEndpointForIdentifier_pluginURL_taskUUID_instanceUUID_configuration_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v9 = a2;
  }
  else
  {
    _HKInitializeLogging();
    v10 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_INFO, "Failed to fetch endpoint for task server \"%{public}@\": %{public}@", (uint8_t *)&v12, 0x16u);
    }
    if (objc_msgSend(v7, "hk_isXPCConnectionError"))
      objc_msgSend(*(id *)(a1 + 40), "_discardServerProxiesForServer:", *(_QWORD *)(a1 + 48));
    v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v9 = a3;
  }
  objc_storeStrong(v8, v9);

}

- (void)deleteAllSamplesWithTypes:(id)a3 sourceBundleIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "sampleTypes");
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthStore.m"), 740, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[sampleTypes count] > 0"));

  }
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__HKHealthStore_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke;
  v22[3] = &unk_1E37E8B70;
  v23 = v11;
  v24 = v12;
  v26 = a5;
  v25 = v14;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __85__HKHealthStore_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke_2;
  v20[3] = &unk_1E37E6B38;
  v21 = v25;
  v16 = v25;
  v17 = v12;
  v18 = v11;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v22, v20);

}

uint64_t __85__HKHealthStore_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteAllSamplesWithTypes:sourceBundleIdentifier:options:completion:", a1[4], a1[5], a1[7], a1[6]);
}

uint64_t __85__HKHealthStore_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteObjectsWithUUIDs:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "uuids");
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__HKHealthStore_deleteObjectsWithUUIDs_options_completion___block_invoke;
  v16[3] = &unk_1E37E8B98;
  v17 = v8;
  v19 = a4;
  v18 = v10;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __59__HKHealthStore_deleteObjectsWithUUIDs_options_completion___block_invoke_2;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v12 = v18;
  v13 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __59__HKHealthStore_deleteObjectsWithUUIDs_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteObjectsWithUUIDs:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __59__HKHealthStore_deleteObjectsWithUUIDs_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteClientSourceWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__HKHealthStore_deleteClientSourceWithCompletion___block_invoke;
  v9[3] = &unk_1E37E8BC0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __50__HKHealthStore_deleteClientSourceWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __50__HKHealthStore_deleteClientSourceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteClientSourceWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __50__HKHealthStore_deleteClientSourceWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HKInitializeLogging();
  v11 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    *(_DWORD *)buf = 134218242;
    v25 = objc_msgSend(v8, "count");
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_INFO, "Associating %llu samples to sample %{public}@", buf, 0x16u);

  }
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__HKHealthStore_associateSampleUUIDs_withSampleUUID_completion___block_invoke;
  v20[3] = &unk_1E37E8BE8;
  v21 = v8;
  v22 = v9;
  v23 = v13;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __64__HKHealthStore_associateSampleUUIDs_withSampleUUID_completion___block_invoke_2;
  v18[3] = &unk_1E37E6B38;
  v19 = v23;
  v15 = v23;
  v16 = v9;
  v17 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v20, v18);

}

uint64_t __64__HKHealthStore_associateSampleUUIDs_withSampleUUID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_associateSampleUUIDs:withSampleUUID:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __64__HKHealthStore_associateSampleUUIDs_withSampleUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveObjects:(id)a3 deleteObjects:(id)a4 associations:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD, _QWORD);
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a6);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") <= 0xC8
    && (unint64_t)objc_msgSend(v12, "count") <= 0xC8
    && (unint64_t)objc_msgSend(v13, "count") < 0xC9)
  {
    v26 = 0;
    v16 = -[HKHealthStore _prepareObjectsForSaving:errorOut:](self, "_prepareObjectsForSaving:errorOut:", v11, &v26);
    v17 = v26;
    if (v16)
    {
      v18 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __67__HKHealthStore_saveObjects_deleteObjects_associations_completion___block_invoke;
      v21[3] = &unk_1E37E8C10;
      v22 = v11;
      v23 = v12;
      v24 = v13;
      v25 = v14;
      v19[0] = v18;
      v19[1] = 3221225472;
      v19[2] = __67__HKHealthStore_saveObjects_deleteObjects_associations_completion___block_invoke_2;
      v19[3] = &unk_1E37E6B38;
      v20 = v25;
      -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v21, v19);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v14)[2](v14, 0, v17);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Current support only valid for saving, deleting and associating for %d objects or less"), 200);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v15);

  }
}

uint64_t __67__HKHealthStore_saveObjects_deleteObjects_associations_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "_remote_saveObjects:deleteObjects:associations:completion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __67__HKHealthStore_saveObjects_deleteObjects_associations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveObjects:(id)a3 associations:(id)a4 completion:(id)a5
{
  -[HKHealthStore saveObjects:deleteObjects:associations:completion:](self, "saveObjects:deleteObjects:associations:completion:", a3, 0, a4, a5);
}

- (void)recalibrateEstimatesForSampleType:(HKSampleType *)sampleType atDate:(NSDate *)date completion:(void *)completion
{
  HKSampleType *v8;
  NSDate *v9;
  void *v10;
  uint64_t v11;
  HKSampleType *v12;
  NSDate *v13;
  id v14;
  NSDate *v15;
  HKSampleType *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  HKSampleType *v20;
  NSDate *v21;
  id v22;
  _QWORD v23[4];
  HKSampleType *v24;
  NSDate *v25;
  id v26;

  v8 = sampleType;
  v9 = date;
  v10 = completion;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "sampleType");
    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "date");
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke;
  v23[3] = &unk_1E37E8C38;
  v12 = v8;
  v24 = v12;
  v13 = v9;
  v25 = v13;
  v26 = v10;
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v23);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_262;
  v19[3] = &unk_1E37E8BE8;
  v20 = v12;
  v21 = v13;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_2;
  v17[3] = &unk_1E37E6B38;
  v18 = v22;
  v14 = v22;
  v15 = v13;
  v16 = v12;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v19, v17);

}

void __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogAuthorization;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v8 = a1[5];
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "Finished recalibrate estimates request for %@ effective %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR))
  {
    __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v6);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_262(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_recalibrateEstimatesForSampleType:atDate:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clientRemote_presentRecalibrateEstimatesRequestWithRecord:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  int v9;
  void *v10;
  NSObject *clientQueue;
  _QWORD block[5];
  id v13;
  void (**v14)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isiPad");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 2, CFSTR("Estimate recalibration is not supported on this device."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);

  }
  else
  {
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__HKHealthStore_clientRemote_presentRecalibrateEstimatesRequestWithRecord_completion___block_invoke;
    block[3] = &unk_1E37E6710;
    v14 = v7;
    block[4] = self;
    v13 = v6;
    dispatch_async(clientQueue, block);

  }
}

void __86__HKHealthStore_clientRemote_presentRecalibrateEstimatesRequestWithRecord_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;

  if (_HKCurrentTaskIsAppExtension())
  {
    v2 = a1[6];
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = CFSTR("Cannot present recalibrate estimates prompt from an app extension.");
    v5 = 3;
  }
  else
  {
    v6 = a1[4];
    v7 = *(void **)(v6 + 104);
    if (v7)
      goto LABEL_6;
    _HKCreateRecalibrateEstimatesPresentationController();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = a1[4];
    v10 = *(void **)(v9 + 104);
    *(_QWORD *)(v9 + 104) = v8;

    v6 = a1[4];
    v7 = *(void **)(v6 + 104);
    if (v7)
    {
LABEL_6:
      v11 = a1[5];
      WeakRetained = objc_loadWeakRetained((id *)(v6 + 208));
      objc_msgSend(v7, "presentWithRequestRecord:authorizationViewControllerPresenter:completion:", v11, WeakRetained, a1[6]);
      goto LABEL_7;
    }
    v2 = a1[6];
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = CFSTR("Failed to create recalibrate estimates presentation controller.");
    v5 = 100;
  }
  objc_msgSend(v3, "hk_error:description:", v5, v4);
  WeakRetained = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, WeakRetained);
LABEL_7:

}

- (HKAuthorizationStatus)authorizationStatusForType:(HKObjectType *)type
{
  HKObjectType *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  HKAuthorizationStatus v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = type;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthStore.m"), 891, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[type isKindOfClass:[HKObjectType class]]"));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v21 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__HKHealthStore_authorizationStatusForType___block_invoke;
  aBlock[3] = &unk_1E37E8C60;
  aBlock[4] = &v18;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__HKHealthStore_authorizationStatusForType___block_invoke_273;
  v15[3] = &unk_1E37E6B38;
  v7 = _Block_copy(aBlock);
  v16 = v7;
  -[HKHealthStore _synchronousServerProxyWithErrorHandler:](self, "_synchronousServerProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __44__HKHealthStore_authorizationStatusForType___block_invoke_2;
  v13[3] = &unk_1E37E8C88;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "remote_authorizationStatusForType:completion:", v5, v13);
  v10 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __44__HKHealthStore_authorizationStatusForType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "integerValue");
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR))
      __44__HKHealthStore_authorizationStatusForType___block_invoke_cold_1();
  }

}

uint64_t __44__HKHealthStore_authorizationStatusForType___block_invoke_273(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__HKHealthStore_authorizationStatusForType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getRequestStatusForAuthorizationToShareTypes:(NSSet *)typesToShare readTypes:(NSSet *)typesToRead completion:(void *)completion
{
  NSSet *v8;
  NSSet *v9;
  void *v10;
  id v11;
  NSSet *v12;
  NSSet *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  NSSet *v17;
  NSSet *v18;
  id v19;
  _QWORD aBlock[5];
  id v21;

  v8 = typesToShare;
  v9 = typesToRead;
  v10 = completion;
  -[HKHealthStore _validateAuthorizationRequestWithShareTypes:readTypes:](self, "_validateAuthorizationRequestWithShareTypes:readTypes:", v8, v9);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke;
  aBlock[3] = &unk_1E37E8CD8;
  aBlock[4] = self;
  v21 = v10;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_3;
  v16[3] = &unk_1E37E8BE8;
  v17 = v8;
  v18 = v9;
  v19 = _Block_copy(aBlock);
  v14[0] = v16[0];
  v14[1] = 3221225472;
  v14[2] = __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_4;
  v14[3] = &unk_1E37E6B38;
  v15 = v19;
  v11 = v19;
  v12 = v9;
  v13 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v16, v14);

}

void __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_2;
  block[3] = &unk_1E37E8CB0;
  v11 = v6;
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[6], a1[4]);
  return result;
}

uint64_t __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_3(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_getRequestStatusForAuthorizationToShareTypes:readTypes:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __83__HKHealthStore_getRequestStatusForAuthorizationToShareTypes_readTypes_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestAuthorizationToShareTypes:(NSSet *)typesToShare readTypes:(NSSet *)typesToRead completion:(void *)completion
{
  -[HKHealthStore requestAuthorizationToShareTypes:readTypes:shouldPrompt:completion:](self, "requestAuthorizationToShareTypes:readTypes:shouldPrompt:completion:", typesToShare, typesToRead, 1, completion);
}

- (void)requestPerObjectReadAuthorizationForType:(HKObjectType *)objectType predicate:(NSPredicate *)predicate completion:(void *)completion
{
  HKObjectType *v8;
  NSPredicate *v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  HKObjectType *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  HKObjectType *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  HKObjectType *v28;
  HKHealthStore *v29;
  id v30;
  uint8_t buf[4];
  HKObjectType *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = objectType;
  v9 = predicate;
  v10 = completion;
  _HKInitializeLogging();
  v11 = HKLogAuthorization;
  if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "Requesting per-object authorization to read %@", buf, 0xCu);
  }
  -[HKHealthStore _throwIfPerObjectReadAuthorizationNotSupportedForType:](self, "_throwIfPerObjectReadAuthorizationNotSupportedForType:", v8);
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isAppleWatch");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 2, CFSTR("Per-object authorization presentation is not supported on this device"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v14);
  }
  else
  {
    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke;
    v27[3] = &unk_1E37E8C38;
    v16 = v8;
    v28 = v16;
    v29 = self;
    v30 = v10;
    -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPredicate hk_filterRepresentationForDataTypes:](v9, "hk_filterRepresentationForDataTypes:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_278;
    v23[3] = &unk_1E37E8BE8;
    v24 = v16;
    v25 = v19;
    v26 = v17;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_2;
    v21[3] = &unk_1E37E6B38;
    v10 = (void (**)(id, _QWORD, void *))v26;
    v22 = v10;
    v20 = v19;
    -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v23, v21);

    v14 = v28;
  }

}

void __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogAuthorization;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "Finished authorization request to read %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR))
  {
    __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_cold_1((uint64_t)a1, v6, v8, v9, v10, v11, v12, v13);
  }
  objc_msgSend(*(id *)(a1[5] + 88), "cancelPresentation");
  v14 = a1[5];
  v15 = *(void **)(v14 + 88);
  *(_QWORD *)(v14 + 88) = 0;

  v16 = a1[6];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

uint64_t __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_278(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestPerObjectReadAuthorizationForType:filter:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_validateAuthorizationRequestWithShareTypes:(id)a3 readTypes:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  if (!objc_msgSend(v6, "count") && !objc_msgSend(v7, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must request authorization for at least one data type"));
  -[HKHealthStore _throwIfClinicalTypesRequestedToShare:](self, "_throwIfClinicalTypesRequestedToShare:", v6);
  -[HKHealthStore _throwIfParentTypeNotRequestedForSharing:types:](self, "_throwIfParentTypeNotRequestedForSharing:types:", 1, v6);
  -[HKHealthStore _throwIfParentTypeNotRequestedForSharing:types:](self, "_throwIfParentTypeNotRequestedForSharing:types:", 0, v7);
  -[HKHealthStore _throwIfAuthorizationDisallowedForSharing:types:](self, "_throwIfAuthorizationDisallowedForSharing:types:", 1, v6);

  -[HKHealthStore _throwIfAuthorizationDisallowedForSharing:types:](self, "_throwIfAuthorizationDisallowedForSharing:types:", 0, v7);
  -[HKHealthStore _throwIfUsingIncorrectAuthorizationRequestType:](self, "_throwIfUsingIncorrectAuthorizationRequestType:", v7);
  -[HKHealthStore _validateAuthorizationRequiredTypes](self, "_validateAuthorizationRequiredTypes");

}

- (void)requestAuthorizationToShareTypes:(id)a3 readTypes:(id)a4 shouldPrompt:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  BOOL v30;
  _QWORD v31[4];
  id v32;
  id v33;
  HKHealthStore *v34;
  id v35;
  BOOL v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v7 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _HKInitializeLogging();
  v13 = (void *)HKLogAuthorization;
  if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v14 = "prompting";
    else
      v14 = "silent";
    v15 = v13;
    objc_msgSend(v10, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v38 = v14;
    v39 = 2112;
    v40 = v16;
    v41 = 2112;
    v42 = v17;
    _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_DEFAULT, "Requesting %s authorization to share %@, read %@", buf, 0x20u);

  }
  -[HKHealthStore _validateAuthorizationRequestWithShareTypes:readTypes:](self, "_validateAuthorizationRequestWithShareTypes:readTypes:", v10, v11);
  -[HKHealthStore _validatePurposeStringsForSharingTypes:readingTypes:](self, "_validatePurposeStringsForSharingTypes:readingTypes:", v10, v11);
  v18 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke;
  v31[3] = &unk_1E37E8D00;
  v36 = v7;
  v19 = v10;
  v32 = v19;
  v20 = v11;
  v33 = v20;
  v34 = self;
  v35 = v12;
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v31);
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_283;
  v26[3] = &unk_1E37E8D28;
  v27 = v19;
  v28 = v20;
  v30 = v7;
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_2;
  v24[3] = &unk_1E37E6B38;
  v25 = v29;
  v21 = v29;
  v22 = v20;
  v23 = v19;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v26, v24);

}

void __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)HKLogAuthorization;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 64))
        v7 = "prompting";
      else
        v7 = "silent";
      v8 = *(void **)(a1 + 32);
      v9 = v6;
      objc_msgSend(v8, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315650;
      v16 = v7;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_DEFAULT, "Finished %s authorization request to share %@, read %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR))
  {
    __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_cold_1(a1, v6, v5);
  }
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "cancelPresentation");
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(void **)(v12 + 88);
    *(_QWORD *)(v12 + 88) = 0;

  }
  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);

}

uint64_t __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_283(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestAuthorizationToShareTypes:readTypes:shouldPrompt:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_validateAuthorizationRequiredTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[HKClinicalType allTypes](HKClinicalType, "allTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_map:", &__block_literal_global_286);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthStore _sourceBundleOrDefaultBundle](self, "_sourceBundleOrDefaultBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("NSHealthRequiredReadAuthorizationTypeIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") && (unint64_t)objc_msgSend(v6, "count") < 3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Apps that specify required read authorization types (NSHealthRequiredReadAuthorizationTypeIdentifiers) must specify at least three clinical record types."));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v13) & 1) == 0)
        {
          v14 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "raise:format:", v11, CFSTR("%@ is not a valid required clinical record type. Must be one of: %@"), v13, v15, (_QWORD)v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

uint64_t __52__HKHealthStore__validateAuthorizationRequiredTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)_validatePurposeStringsForSharingTypes:(id)a3 readingTypes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  +[_HKEntitlements entitlementsForCurrentTaskWithError:](_HKEntitlements, "entitlementsForCurrentTaskWithError:", &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR))
      -[HKHealthStore _validatePurposeStringsForSharingTypes:readingTypes:].cold.1();
  }
  v10 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.private.healthkit.authorization_bypass"));
  objc_msgSend(v8, "typesForWriteAuthorizationOverride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  objc_msgSend(v8, "typesForReadAuthorizationOverride");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v15 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.private.healthkit.source.research-study"));
  if ((v10 & 1) == 0 && !v12 && !v14)
  {
    v16 = v15;
    -[HKHealthStore _validateClinicalHealthRecordsPurposeStringsForSharingTypes:readingTypes:](self, "_validateClinicalHealthRecordsPurposeStringsForSharingTypes:readingTypes:", v6, v7);
    -[HKHealthStore _validateHealthDataPurposeStringsForSharingTypes:readingTypes:isResearchStudy:](self, "_validateHealthDataPurposeStringsForSharingTypes:readingTypes:isResearchStudy:", v6, v7, v16);
  }

}

- (id)_clientWriteAuthorizationUsageDescription
{
  NSString *writeAuthorizationUsageDescriptionOverride;
  NSString *v3;
  void *v4;

  writeAuthorizationUsageDescriptionOverride = self->_writeAuthorizationUsageDescriptionOverride;
  if (writeAuthorizationUsageDescriptionOverride)
  {
    v3 = writeAuthorizationUsageDescriptionOverride;
  }
  else
  {
    -[HKHealthStore _sourceBundleOrDefaultBundle](self, "_sourceBundleOrDefaultBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_localizedWriteAuthorizationUsageDescription");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_clientReadAuthorizationUsageDescription
{
  NSString *readAuthorizationUsageDescriptionOverride;
  NSString *v3;
  void *v4;

  readAuthorizationUsageDescriptionOverride = self->_readAuthorizationUsageDescriptionOverride;
  if (readAuthorizationUsageDescriptionOverride)
  {
    v3 = readAuthorizationUsageDescriptionOverride;
  }
  else
  {
    -[HKHealthStore _sourceBundleOrDefaultBundle](self, "_sourceBundleOrDefaultBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_localizedReadAuthorizationUsageDescription");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_clientClinicalReadAuthorizationUsageDescription
{
  NSString *clinicalReadAuthorizationUsageDescriptionOverride;
  NSString *v3;
  void *v4;

  clinicalReadAuthorizationUsageDescriptionOverride = self->_clinicalReadAuthorizationUsageDescriptionOverride;
  if (clinicalReadAuthorizationUsageDescriptionOverride)
  {
    v3 = clinicalReadAuthorizationUsageDescriptionOverride;
  }
  else
  {
    -[HKHealthStore _sourceBundleOrDefaultBundle](self, "_sourceBundleOrDefaultBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_localizedClinicalReadAuthorizationUsageDescription");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_researchStudyUsageDescription
{
  NSString *researchStudyUsageDescriptionOverride;
  NSString *v3;
  void *v4;

  researchStudyUsageDescriptionOverride = self->_researchStudyUsageDescriptionOverride;
  if (researchStudyUsageDescriptionOverride)
  {
    v3 = researchStudyUsageDescriptionOverride;
  }
  else
  {
    -[HKHealthStore _sourceBundleOrDefaultBundle](self, "_sourceBundleOrDefaultBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_localizedResearchStudyUsageDescription");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_validateClinicalHealthRecordsPurposeStringsForSharingTypes:(id)a3 readingTypes:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  +[HKObjectType _clinicalTypesFromTypes:](HKObjectType, "_clinicalTypesFromTypes:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore _clientClinicalReadAuthorizationUsageDescription](self, "_clientClinicalReadAuthorizationUsageDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && objc_msgSend(v10, "count"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_msgSend(v10, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("NSHealthClinicalHealthRecordsShareUsageDescription must be set in the app's Info.plist in order to request read authorization for the following types: %@"), v9);

  }
}

- (void)_validateHealthDataPurposeStringsForSharingTypes:(id)a3 readingTypes:(id)a4 isResearchStudy:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v5 = a5;
  v27 = a3;
  v8 = a4;
  if (HKProgramSDKAtLeast(0x7E00901FFFFFFFFLL, v9))
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isAppleWatch"))
    {

      if (!v5)
        goto LABEL_12;
      goto LABEL_7;
    }
    v12 = HKProgramSDKAtLeast(0x7E30901FFFFFFFFLL, v11);

    if ((v12 & 1) != 0)
    {
      if (!v5)
        goto LABEL_12;
LABEL_7:
      -[HKHealthStore _researchStudyUsageDescription](self, "_researchStudyUsageDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "hk_isValidPurposeString") & 1) != 0)
      {
        v14 = v8;
        v15 = v27;
        goto LABEL_25;
      }
      if (v13)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The string \"%@\" is an invalid value for NSHealthResearchStudyUsageDescription"), v13);

LABEL_12:
      +[HKObjectType _nonClinicalTypesFromTypes:](HKObjectType, "_nonClinicalTypesFromTypes:", v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count"))
      {
        -[HKHealthStore _clientWriteAuthorizationUsageDescription](self, "_clientWriteAuthorizationUsageDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v18 = (void *)MEMORY[0x1E0C99DA0];
          v19 = *MEMORY[0x1E0C99778];
          objc_msgSend(v15, "allObjects");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "raise:format:", v19, CFSTR("NSHealthUpdateUsageDescription must be set in the app's Info.plist in order to request write authorization for the following types: %@"), v21);

        }
        if (HKProgramSDKAtLeast(0x7E20901FFFFFFFFLL, v16)
          && (objc_msgSend(v17, "hk_isValidPurposeString") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The string \"%@\" is an invalid value for NSHealthUpdateUsageDescription"), v17);
        }

      }
      +[HKObjectType _nonClinicalTypesFromTypes:](HKObjectType, "_nonClinicalTypesFromTypes:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v14, "count"))
        goto LABEL_26;
      -[HKHealthStore _clientReadAuthorizationUsageDescription](self, "_clientReadAuthorizationUsageDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v23 = (void *)MEMORY[0x1E0C99DA0];
        v24 = *MEMORY[0x1E0C99778];
        objc_msgSend(v14, "allObjects");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "raise:format:", v24, CFSTR("NSHealthShareUsageDescription must be set in the app's Info.plist in order to request read authorization for the following types: %@"), v26);

      }
      if (HKProgramSDKAtLeast(0x7E20901FFFFFFFFLL, v22)
        && (objc_msgSend(v13, "hk_isValidPurposeString") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The string \"%@\" is an invalid value for NSHealthShareUsageDescription"), v13);
      }
LABEL_25:

LABEL_26:
      v8 = v14;
      v27 = v15;
    }
  }

}

- (void)handleAuthorizationForExtensionWithCompletion:(void *)completion
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v4 = completion;
  _HKInitializeLogging();
  v5 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "Handling authorization for extension", buf, 2u);
  }
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__HKHealthStore_handleAuthorizationForExtensionWithCompletion___block_invoke;
  v11[3] = &unk_1E37E8BC0;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __63__HKHealthStore_handleAuthorizationForExtensionWithCompletion___block_invoke_2;
  v9[3] = &unk_1E37E6B38;
  v10 = v12;
  v8 = v12;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __63__HKHealthStore_handleAuthorizationForExtensionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_handleAuthorizationForExtensionWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__HKHealthStore_handleAuthorizationForExtensionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_throwIfAuthorizationDisallowedForSharing:(BOOL)a3 types:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[_HKEntitlements entitlementsForCurrentTaskWithError:](_HKEntitlements, "entitlementsForCurrentTaskWithError:", &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    if (!v7)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99778];
      if (v4)
        v11 = "share";
      else
        v11 = "read";
      objc_msgSend(v6, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("Failed to retrieve local task entitlements when determining authorization access for %s for %@ : %@"), v11, v13, v8);

    }
    if (v4)
    {
      if (!+[HKObjectType _allowAuthorizationForSharingWithTypes:entitlements:disallowedTypes:](HKObjectType, "_allowAuthorizationForSharingWithTypes:entitlements:disallowedTypes:", v5, v7, v6))
      {
        v14 = "share";
LABEL_12:
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        objc_msgSend(v6, "allObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "raise:format:", v16, CFSTR("Authorization to %s the following types is disallowed: %@"), v14, v18);

      }
    }
    else if (!+[HKObjectType _allowAuthorizationForReadingWithTypes:entitlements:disallowedTypes:](HKObjectType, "_allowAuthorizationForReadingWithTypes:entitlements:disallowedTypes:", v5, v7, v6))
    {
      v14 = "read";
      goto LABEL_12;
    }

  }
}

- (void)_throwIfClinicalTypesRequestedToShare:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  +[HKObjectType _clinicalTypesFromTypes:](HKObjectType, "_clinicalTypesFromTypes:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    objc_msgSend(v7, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("Authorization to share the following types is disallowed: %@"), v6);

  }
}

- (void)_throwIfParentTypeNotRequestedForSharing:(BOOL)a3 types:(id)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = *MEMORY[0x1E0C99778];
    if (v4)
      v10 = "share";
    else
      v10 = "read";
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "parentType");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v12, "parentType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v5, "containsObject:", v15);

          if ((v16 & 1) == 0)
          {
            v17 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(v12, "parentType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "raise:format:", v9, CFSTR("Authorization for %@ should also be requested when requesting authorization to %s %@"), v18, v10, v12);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

- (void)_throwIfPerObjectReadAuthorizationNotSupportedForType:(id)a3
{
  id v3;

  v3 = a3;
  if (!HKDataTypeAllowsPerObjectAuthorizationAPI(objc_msgSend(v3, "code")))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Per-Object authorization to read %@ is disallowed"), v3);

}

- (void)_throwIfUsingIncorrectAuthorizationRequestType:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "hk_filter:", &__block_literal_global_320);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    objc_msgSend(v6, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("Authorization to read the following type(s) using this API is disallowed: %@"), v5);

  }
}

BOOL __64__HKHealthStore__throwIfUsingIncorrectAuthorizationRequestType___block_invoke(uint64_t a1, void *a2)
{
  return HKDataTypeAllowsPerObjectAuthorizationAPI(objc_msgSend(a2, "code"));
}

- (void)beginAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 sourceHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *clientQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "sourceHandler");
    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "errorHandler");
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "sessionIdentifier");
  if (!v9)
    goto LABEL_6;
LABEL_3:
  if (!v10)
    goto LABEL_7;
LABEL_4:
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke;
  block[3] = &unk_1E37E8E48;
  v17 = v10;
  v18 = v9;
  block[4] = self;
  v16 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(clientQueue, block);

}

void __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD aBlock[5];
  id v14;

  v2 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_2;
  aBlock[3] = &unk_1E37E8DF8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 56);
  v6 = _Block_copy(aBlock);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_4;
  v10[3] = &unk_1E37E8E20;
  v7 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_5;
  v9[3] = &unk_1E37E6A70;
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v7, "_serverProxyWithHandler:errorHandler:", v10, v9);

}

void __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 216);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_3;
  v12[3] = &unk_1E37E8DD0;
  v13 = v6;
  v14 = v7;
  v15 = v5;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

uint64_t __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_clientQueue_invokeAuthorizationDelegateTransactionErrorHandlerWithError:");
  else
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_beginAuthorizationDelegateTransactionWithSessionIdentifier:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __103__HKHealthStore_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_invokeAuthorizationDelegateTransactionErrorHandlerWithError:", a2);
}

- (void)endAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(clientQueue, block);

}

void __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_2;
  v5[3] = &unk_1E37E8E70;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_serverProxyWithHandler:errorHandler:", v5, &__block_literal_global_326);

}

uint64_t __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endAuthorizationDelegateTransactionWithSessionIdentifier:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
    __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_3_cold_1();

}

- (void)_clientQueue_invokeAuthorizationDelegateTransactionErrorHandlerWithError:(id)a3
{
  void (**authorizationDelegateTransactionErrorHandler)(id, id);
  id v5;

  authorizationDelegateTransactionErrorHandler = (void (**)(id, id))self->_authorizationDelegateTransactionErrorHandler;
  if (authorizationDelegateTransactionErrorHandler)
  {
    authorizationDelegateTransactionErrorHandler[2](authorizationDelegateTransactionErrorHandler, a3);
    v5 = self->_authorizationDelegateTransactionErrorHandler;
    self->_authorizationDelegateTransactionErrorHandler = 0;

  }
}

- (id)_clinicalAuthorizationPresentationRequestForRecord:(id)a3
{
  void *v4;
  void *v5;
  HKAuthorizationPresentationRequest *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "typesRequiringReadAuthorization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKObjectType _clinicalTypesFromTypes:](HKObjectType, "_clinicalTypesFromTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(HKAuthorizationPresentationRequest);
    -[HKAuthorizationPresentationRequest setType:](v6, "setType:", 0);
    -[HKHealthStore _clientClinicalReadAuthorizationUsageDescription](self, "_clientClinicalReadAuthorizationUsageDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationPresentationRequest setReadUsageDescription:](v6, "setReadUsageDescription:", v7);

    -[HKHealthStore _researchStudyUsageDescription](self, "_researchStudyUsageDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationPresentationRequest setResearchStudyUsageDescription:](v6, "setResearchStudyUsageDescription:", v8);

    -[HKAuthorizationPresentationRequest setTypesRequiringReadAuthorization:](v6, "setTypesRequiringReadAuthorization:", v5);
    -[HKAuthorizationPresentationRequest setDismissWhenBackgrounded:](v6, "setDismissWhenBackgrounded:", 0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_healthDataAuthorizationPresentationRequestForRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKAuthorizationPresentationRequest *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "typesRequiringReadAuthorization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKObjectType _nonClinicalTypesFromTypes:](HKObjectType, "_nonClinicalTypesFromTypes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "typesRequiringShareAuthorization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKObjectType _nonClinicalTypesFromTypes:](HKObjectType, "_nonClinicalTypesFromTypes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") || objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc_init(HKAuthorizationPresentationRequest);
    -[HKAuthorizationPresentationRequest setType:](v9, "setType:", 1);
    -[HKHealthStore _clientReadAuthorizationUsageDescription](self, "_clientReadAuthorizationUsageDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationPresentationRequest setReadUsageDescription:](v9, "setReadUsageDescription:", v10);

    -[HKHealthStore _clientWriteAuthorizationUsageDescription](self, "_clientWriteAuthorizationUsageDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationPresentationRequest setShareUsageDescription:](v9, "setShareUsageDescription:", v11);

    -[HKHealthStore _researchStudyUsageDescription](self, "_researchStudyUsageDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationPresentationRequest setResearchStudyUsageDescription:](v9, "setResearchStudyUsageDescription:", v12);

    -[HKAuthorizationPresentationRequest setTypesRequiringReadAuthorization:](v9, "setTypesRequiringReadAuthorization:", v6);
    -[HKAuthorizationPresentationRequest setTypesRequiringShareAuthorization:](v9, "setTypesRequiringShareAuthorization:", v8);
    -[HKAuthorizationPresentationRequest setDismissWhenBackgrounded:](v9, "setDismissWhenBackgrounded:", 1);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)clientRemote_presentAuthorizationWithRequestRecord:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  NSObject *clientQueue;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HKHealthStore_clientRemote_presentAuthorizationWithRequestRecord_completion___block_invoke;
  aBlock[3] = &unk_1E37E6AE8;
  v22 = v8;
  v10 = _Block_copy(aBlock);
  if (v7)
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAppleWatch");

    if (!_HKCurrentTaskIsAppExtension() || (v12 & 1) != 0)
    {
      clientQueue = self->_clientQueue;
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __79__HKHealthStore_clientRemote_presentAuthorizationWithRequestRecord_completion___block_invoke_2;
      v18[3] = &unk_1E37E67E8;
      v18[4] = self;
      v19 = v7;
      v20 = v10;
      dispatch_async(clientQueue, v18);

      goto LABEL_8;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = objc_opt_class();
    v15 = CFSTR("Cannot present authorization prompt from a non-Watch app extension.");
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = objc_opt_class();
    v15 = CFSTR("Invalid authorization request record.");
  }
  objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v14, a2, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, _QWORD, void *))v10 + 2))(v10, 0, v16);

LABEL_8:
}

uint64_t __79__HKHealthStore_clientRemote_presentAuthorizationWithRequestRecord_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__HKHealthStore_clientRemote_presentAuthorizationWithRequestRecord_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *WeakRetained;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88)
    || (_HKCreateAuthorizationPresentationController(),
        v2 = objc_claimAutoreleasedReturnValue(),
        v3 = *(_QWORD *)(a1 + 32),
        v4 = *(void **)(v3 + 88),
        *(_QWORD *)(v3 + 88) = v2,
        v4,
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88)))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "_clinicalAuthorizationPresentationRequestForRecord:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v13, "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_healthDataAuthorizationPresentationRequestForRecord:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v13, "addObject:", v6);
    if (objc_msgSend(v13, "count"))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v7 + 88);
      WeakRetained = objc_loadWeakRetained((id *)(v7 + 208));
      objc_msgSend(v9, "presentWithPresentationRequests:authorizationRequestRecord:authorizationViewControllerPresenter:completion:", v13, v8, WeakRetained, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Failed to create authorization presentation requests"));
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, WeakRetained);
    }

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Failed to create authorization presentation controller"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
  }

}

- (void)clientRemote_presentAuthorizationWithSession:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *clientQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__HKHealthStore_clientRemote_presentAuthorizationWithSession_completion___block_invoke;
  v12[3] = &unk_1E37E8EB8;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(clientQueue, v12);

}

void __73__HKHealthStore_clientRemote_presentAuthorizationWithSession_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;

  if ((_HKCurrentTaskIsAppExtension() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[7], CFSTR("Cannot present document authorization prompt from app extension."));
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1[4];
    v6 = *(void **)(v5 + 96);
    if (v6)
      goto LABEL_8;
    _HKCreateObjectPickerPresentationController();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
    v9 = *(void **)(v8 + 96);
    *(_QWORD *)(v8 + 96) = v7;

    v5 = a1[4];
    v6 = *(void **)(v5 + 96);
    if (v6)
    {
LABEL_8:
      v10 = a1[5];
      WeakRetained = objc_loadWeakRetained((id *)(v5 + 208));
      objc_msgSend(v6, "presentWithSession:authorizationViewControllerPresenter:completion:", v10, WeakRetained, a1[6]);

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Failed to create document authorization presentation controller"));
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v2;
  v4 = a1[6];
  if (v4)
  {
    if (v2)
    {
      v13 = (void *)v2;
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
      v3 = v13;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unknown error"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v12);

LABEL_10:
    v3 = 0;
  }
LABEL_11:

}

- (NSDate)earliestPermittedSampleDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
}

- (void)saveObject:(HKObject *)object withCompletion:(void *)completion
{
  void *v6;
  void *v7;
  HKObject *v8;
  void *v9;
  HKObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = object;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = completion;
  v8 = object;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthStore saveObjects:withCompletion:](self, "saveObjects:withCompletion:", v9, v7, v10, v11);
}

- (void)saveObjects:(NSArray *)objects withCompletion:(void *)completion
{
  void *v6;
  NSArray *v7;

  v6 = completion;
  v7 = objects;
  -[HKHealthStore _saveObjects:atomically:skipInsertionFilter:completion:](self, "_saveObjects:atomically:skipInsertionFilter:completion:", v7, -[NSArray count](v7, "count") < 0x5DC, 0, v6);

}

- (void)_saveObjects:(id)a3 atomically:(BOOL)a4 skipInsertionFilter:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  BOOL v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  void (**v19)(_QWORD, _QWORD, _QWORD);
  _QWORD v20[4];
  id v21;
  HKHealthStore *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  BOOL v24;
  BOOL v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  _HKInitializeLogging();
  v12 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    *(_DWORD *)buf = 134217984;
    v28 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_DEFAULT, "Saving %lu objects", buf, 0xCu);

  }
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v11);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v15 = -[HKHealthStore _prepareObjectsForSaving:errorOut:](self, "_prepareObjectsForSaving:errorOut:", v10, &v26);
  v16 = v26;
  if (v15)
  {
    v17 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __72__HKHealthStore__saveObjects_atomically_skipInsertionFilter_completion___block_invoke;
    v20[3] = &unk_1E37E8EE0;
    v24 = a4;
    v21 = v10;
    v25 = a5;
    v22 = self;
    v23 = v14;
    v18[0] = v17;
    v18[1] = 3221225472;
    v18[2] = __72__HKHealthStore__saveObjects_atomically_skipInsertionFilter_completion___block_invoke_2;
    v18[3] = &unk_1E37E6B38;
    v19 = v23;
    -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v20, v18);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v14)[2](v14, 0, v16);
  }

}

uint64_t __72__HKHealthStore__saveObjects_atomically_skipInsertionFilter_completion___block_invoke(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(a2, "remote_saveDataObjects:skipInsertionFilter:creationDateOverride:handler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 57), 0, *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 40), "_sendNextObjectBatch:skipInsertionFilter:lastRange:server:transaction:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 57), 0, 0, a2, 0, *(_QWORD *)(a1 + 48));
}

uint64_t __72__HKHealthStore__saveObjects_atomically_skipInsertionFilter_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveObjects:(id)a3 skipInsertionFilter:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[HKHealthStore _saveObjects:atomically:skipInsertionFilter:completion:](self, "_saveObjects:atomically:skipInsertionFilter:completion:", v9, (unint64_t)objc_msgSend(v9, "count") < 0x5DC, v5, v8);

}

- (void)_sendNextObjectBatch:(id)a3 skipInsertionFilter:(BOOL)a4 lastRange:(_NSRange)a5 server:(id)a6 transaction:(id)a7 completion:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  NSUInteger v31;
  uint64_t v32;
  BOOL v33;
  BOOL v34;

  length = a5.length;
  location = a5.location;
  v12 = a4;
  v14 = a3;
  v15 = a6;
  v16 = a8;
  v17 = a7;
  v18 = objc_msgSend(v14, "count");
  v19 = v18;
  v20 = location + length;
  if (v18 - v20 >= 0x5DC)
    v21 = 1500;
  else
    v21 = v18 - v20;
  objc_msgSend(v14, "subarrayWithRange:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v23 = v21 + v20 == v19;
  v27[1] = 3221225472;
  v27[2] = __98__HKHealthStore__sendNextObjectBatch_skipInsertionFilter_lastRange_server_transaction_completion___block_invoke;
  v27[3] = &unk_1E37E8F08;
  v27[4] = self;
  v28 = v14;
  v33 = v12;
  v34 = v23;
  v31 = v20;
  v32 = v21;
  v29 = v15;
  v30 = v16;
  v24 = v15;
  v25 = v16;
  v26 = v14;
  objc_msgSend(v24, "remote_saveDataObjects:skipInsertionFilter:transactionIdentifier:final:handler:", v22, v12, v17, v23, v27);

}

void __98__HKHealthStore__sendNextObjectBatch_skipInsertionFilter_lastRange_server_transaction_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a4;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_saveObjects:atomically:skipInsertionFilter:completion:", *(_QWORD *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56));
  }
  else if (v8 && !*(_BYTE *)(a1 + 81))
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendNextObjectBatch:skipInsertionFilter:lastRange:server:transaction:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v7 == 0, v7);
  }

}

- (void)deleteObject:(HKObject *)object withCompletion:(void *)completion
{
  HKObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = object;
  v7 = completion;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "dataObject");
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore _deleteObjects:options:completion:](self, "_deleteObjects:options:completion:", v8, 0, v7);

}

- (void)deleteObjects:(NSArray *)objects withCompletion:(void *)completion
{
  -[HKHealthStore _deleteObjects:options:completion:](self, "_deleteObjects:options:completion:", objects, 0, completion);
}

- (void)_deleteObjects:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  unint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _HKInitializeLogging();
  v10 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 134218240;
    v23 = objc_msgSend(v8, "count");
    v24 = 2048;
    v25 = a4;
    _os_log_impl(&dword_19A0E6000, v11, OS_LOG_TYPE_DEFAULT, "Deleting %lu objects, options %lu", buf, 0x16u);

  }
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__HKHealthStore__deleteObjects_options_completion___block_invoke;
  v18[3] = &unk_1E37E8B98;
  v19 = v8;
  v21 = a4;
  v20 = v12;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __51__HKHealthStore__deleteObjects_options_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v20;
  v14 = v20;
  v15 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __51__HKHealthStore__deleteObjects_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteDataObjects:options:handler:", a1[4], a1[6], a1[5]);
}

uint64_t __51__HKHealthStore__deleteObjects_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteObjectsOfType:(HKObjectType *)objectType predicate:(NSPredicate *)predicate withCompletion:(void *)completion
{
  -[HKHealthStore deleteObjectsOfType:predicate:options:withCompletion:](self, "deleteObjectsOfType:predicate:options:withCompletion:", objectType, predicate, 0, completion);
}

- (void)deleteObject:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthStore _deleteObjects:options:completion:](self, "_deleteObjects:options:completion:", v11, a4, v9, v12, v13);
}

- (void)deleteObjectsOfType:(id)a3 predicate:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  HKHealthStore *v26;
  id v27;
  unint64_t v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _HKInitializeLogging();
  v13 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v10;
    v31 = 2048;
    v32 = a5;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_DEFAULT, "Deleting objects of type %@ with options %lu, predicate %@", buf, 0x20u);
  }
  if (HKProgramSDKAtLeast(0x7E10901FFFFFFFFLL, v14))
  {
    if (v10)
    {
      if (v11)
        goto LABEL_6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "objectType");
      if (v11)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "predicate");
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_filterRepresentationForDataTypes:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke;
  v23[3] = &unk_1E37E8F80;
  v24 = v10;
  v25 = v16;
  v28 = a5;
  v26 = self;
  v27 = v12;
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_4;
  v21[3] = &unk_1E37E69F8;
  v21[4] = self;
  v22 = v27;
  v18 = v27;
  v19 = v16;
  v20 = v10;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v23, v21);

}

void __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v3 = a1[4];
  v4 = a1[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_2;
  v7[3] = &unk_1E37E8F58;
  v5 = (void *)a1[7];
  v6 = a1[8];
  v7[4] = a1[6];
  v8 = v5;
  objc_msgSend(a2, "remote_deleteDataObjectsOfType:matchingFilter:options:handler:", v3, v4, v6, v7);

}

void __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_2(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  char v15;

  v7 = a4;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_3;
  v11[3] = &unk_1E37E8F30;
  v15 = a2;
  v13 = v8;
  v14 = a3;
  v12 = v7;
  v10 = v7;
  dispatch_async(v9, v11);

}

uint64_t __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

void __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_5;
  v7[3] = &unk_1E37E6D40;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __70__HKHealthStore_deleteObjectsOfType_predicate_options_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_addQuery:(id)a3
{
  NSMutableSet *queries;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  queries = self->_queries;
  if (!queries)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_queries;
    self->_queries = v5;

    queries = self->_queries;
  }
  -[NSMutableSet addObject:](queries, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_removeQuery:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_queries, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)executeQuery:(HKQuery *)query
{
  -[HKHealthStore executeQuery:activationHandler:](self, "executeQuery:activationHandler:", query, 0);
}

- (void)executeQuery:(id)a3 activationHandler:(id)a4
{
  id v6;
  id v7;
  double Current;
  void (**unitTest_handleExecuteQuery)(id, id);
  OS_dispatch_queue *clientQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "query");
  Current = CFAbsoluteTimeGetCurrent();
  unitTest_handleExecuteQuery = (void (**)(id, id))self->_unitTest_handleExecuteQuery;
  if (unitTest_handleExecuteQuery)
    unitTest_handleExecuteQuery[2](unitTest_handleExecuteQuery, v6);
  -[HKHealthStore _addQuery:](self, "_addQuery:", v6);
  clientQueue = self->_clientQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__HKHealthStore_executeQuery_activationHandler___block_invoke;
  v13[3] = &unk_1E37E8C38;
  v13[4] = self;
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v11, "activateWithClientQueue:healthStore:delegate:time:completion:", clientQueue, self, self, v13, Current);

}

void __48__HKHealthStore_executeQuery_activationHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeQuery:", *(_QWORD *)(a1 + 40));
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

- (void)stopQuery:(HKQuery *)query
{
  HKQuery *v4;

  if (query)
  {
    v4 = query;
    -[HKHealthStore _removeQuery:](self, "_removeQuery:", v4);
    -[HKQuery deactivate](v4, "deactivate");

  }
}

- (NSSet)_queries
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_queries, "copy");
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSSet *)v6;
}

- (void)_dateOfBirthWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierDateOfBirth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HKHealthStore__dateOfBirthWithCompletion___block_invoke;
  v7[3] = &unk_1E37E8FA8;
  v8 = v4;
  v6 = v4;
  -[HKHealthStore _characteristicForDataType:withCompletion:](self, "_characteristicForDataType:withCompletion:", v5, v7);

}

uint64_t __44__HKHealthStore__dateOfBirthWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSDate)dateOfBirthWithError:(NSError *)error
{
  void *v3;
  void *v4;
  void *v5;

  -[HKHealthStore dateOfBirthComponentsWithError:](self, "dateOfBirthComponentsWithError:", error);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFromComponents:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSDateComponents)dateOfBirthComponentsWithError:(NSError *)error
{
  void *v5;
  void *v6;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierDateOfBirth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v6;
}

- (BOOL)_setDateOfBirthComponents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierDateOfBirth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v6, v7, a4);

  return (char)a4;
}

- (void)_biologicalSexWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierBiologicalSex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HKHealthStore__biologicalSexWithCompletion___block_invoke;
  v7[3] = &unk_1E37E8C88;
  v8 = v4;
  v6 = v4;
  -[HKHealthStore _characteristicForDataType:withCompletion:](self, "_characteristicForDataType:withCompletion:", v5, v7);

}

void __46__HKHealthStore__biologicalSexWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    if (v8)
      v7 = objc_msgSend(v8, "integerValue");
    else
      v7 = 0;
    v6 = -[HKBiologicalSexObject _initWithBiologicalSex:]([HKBiologicalSexObject alloc], "_initWithBiologicalSex:", v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (HKBiologicalSexObject)biologicalSexWithError:(NSError *)error
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v13;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierBiologicalSex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    if (error)
    {
      v10 = 0;
      *error = (NSError *)objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError(v9);
      v10 = 0;
    }
  }
  else
  {
    if (v6)
      v11 = objc_msgSend(v6, "integerValue");
    else
      v11 = 0;
    v10 = -[HKBiologicalSexObject _initWithBiologicalSex:]([HKBiologicalSexObject alloc], "_initWithBiologicalSex:", v11);
  }

  return (HKBiologicalSexObject *)v10;
}

- (BOOL)_setBiologicalSex:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierBiologicalSex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v8, v7, a4);

  return (char)a4;
}

- (void)_bloodTypeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierBloodType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HKHealthStore__bloodTypeWithCompletion___block_invoke;
  v7[3] = &unk_1E37E8C88;
  v8 = v4;
  v6 = v4;
  -[HKHealthStore _characteristicForDataType:withCompletion:](self, "_characteristicForDataType:withCompletion:", v5, v7);

}

void __42__HKHealthStore__bloodTypeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    if (v8)
      v7 = objc_msgSend(v8, "integerValue");
    else
      v7 = 0;
    v6 = -[HKBloodTypeObject _initWithBloodType:]([HKBloodTypeObject alloc], "_initWithBloodType:", v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (HKBloodTypeObject)bloodTypeWithError:(NSError *)error
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v13;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierBloodType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    if (error)
    {
      v10 = 0;
      *error = (NSError *)objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError(v9);
      v10 = 0;
    }
  }
  else
  {
    if (v6)
      v11 = objc_msgSend(v6, "integerValue");
    else
      v11 = 0;
    v10 = -[HKBloodTypeObject _initWithBloodType:]([HKBloodTypeObject alloc], "_initWithBloodType:", v11);
  }

  return (HKBloodTypeObject *)v10;
}

- (BOOL)_setBloodType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierBloodType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v8, v7, a4);

  return (char)a4;
}

- (void)_fitzpatrickSkinTypeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierFitzpatrickSkinType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HKHealthStore__fitzpatrickSkinTypeWithCompletion___block_invoke;
  v7[3] = &unk_1E37E8C88;
  v8 = v4;
  v6 = v4;
  -[HKHealthStore _characteristicForDataType:withCompletion:](self, "_characteristicForDataType:withCompletion:", v5, v7);

}

void __52__HKHealthStore__fitzpatrickSkinTypeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    if (v8)
      v7 = objc_msgSend(v8, "integerValue");
    else
      v7 = 0;
    v6 = -[HKFitzpatrickSkinTypeObject _initWithSkinType:]([HKFitzpatrickSkinTypeObject alloc], "_initWithSkinType:", v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (HKFitzpatrickSkinTypeObject)fitzpatrickSkinTypeWithError:(NSError *)error
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v13;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierFitzpatrickSkinType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    if (error)
    {
      v10 = 0;
      *error = (NSError *)objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError(v9);
      v10 = 0;
    }
  }
  else
  {
    if (v6)
      v11 = objc_msgSend(v6, "integerValue");
    else
      v11 = 0;
    v10 = -[HKFitzpatrickSkinTypeObject _initWithSkinType:]([HKFitzpatrickSkinTypeObject alloc], "_initWithSkinType:", v11);
  }

  return (HKFitzpatrickSkinTypeObject *)v10;
}

- (BOOL)_setFitzpatrickSkinType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierFitzpatrickSkinType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v8, v7, a4);

  return (char)a4;
}

- (void)_wheelchairUseWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierWheelchairUse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HKHealthStore__wheelchairUseWithCompletion___block_invoke;
  v7[3] = &unk_1E37E8C88;
  v8 = v4;
  v6 = v4;
  -[HKHealthStore _characteristicForDataType:withCompletion:](self, "_characteristicForDataType:withCompletion:", v5, v7);

}

void __46__HKHealthStore__wheelchairUseWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    if (v8)
      v7 = objc_msgSend(v8, "integerValue");
    else
      v7 = 0;
    v6 = -[HKWheelchairUseObject _initWithWheelchairUse:]([HKWheelchairUseObject alloc], "_initWithWheelchairUse:", v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (HKWheelchairUseObject)wheelchairUseWithError:(NSError *)error
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v13;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierWheelchairUse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    if (error)
    {
      v10 = 0;
      *error = (NSError *)objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError(v9);
      v10 = 0;
    }
  }
  else
  {
    if (v6)
      v11 = objc_msgSend(v6, "integerValue");
    else
      v11 = 0;
    v10 = -[HKWheelchairUseObject _initWithWheelchairUse:]([HKWheelchairUseObject alloc], "_initWithWheelchairUse:", v11);
  }

  return (HKWheelchairUseObject *)v10;
}

- (BOOL)_setWheelchairUse:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierWheelchairUse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v8, v7, a4);

  return (char)a4;
}

- (id)_cardioFitnessMedicationsUseWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v13;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierCardioFitnessMedicationsUse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    if (a3)
    {
      v10 = 0;
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError(v9);
      v10 = 0;
    }
  }
  else
  {
    if (v6)
      v11 = objc_msgSend(v6, "unsignedIntValue");
    else
      v11 = 0;
    v10 = -[HKCardioFitnessMedicationsUseObject _initWithCardioFitnessMedicationsUseOptions:]([HKCardioFitnessMedicationsUseObject alloc], "_initWithCardioFitnessMedicationsUseOptions:", v11);
  }

  return v10;
}

- (BOOL)_setCardioFitnessMedicationsUse:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierCardioFitnessMedicationsUse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v8, v7, a4);

  return (char)a4;
}

- (id)_bodyMassCharacteristicQuantityWithError:(id *)a3
{
  void *v5;
  void *v6;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierBodyMass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_setBodyMassCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierBodyMass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v6, v7, a4);

  return (char)a4;
}

- (id)_leanBodyMassCharacteristicQuantityWithError:(id *)a3
{
  void *v5;
  void *v6;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierLeanBodyMass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_setLeanBodyMassCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierLeanBodyMass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v6, v7, a4);

  return (char)a4;
}

- (id)_heightCharacteristicQuantityWithError:(id *)a3
{
  void *v5;
  void *v6;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierHeight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_setHeightCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierHeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v6, v7, a4);

  return (char)a4;
}

- (id)_userEnteredMenstrualCycleLengthCharacteristicQuantityWithError:(id *)a3
{
  void *v5;
  void *v6;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierUserEnteredMenstrualCycleLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_setUserEnteredMenstrualCycleLengthCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierUserEnteredMenstrualCycleLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v6, v7, a4);

  return (char)a4;
}

- (id)_userEnteredMenstrualPeriodLengthCharacteristicQuantityWithError:(id *)a3
{
  void *v5;
  void *v6;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierUserEnteredMenstrualPeriodLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_setUserEnteredMenstrualPeriodLengthCharacteristicQuantity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierUserEnteredMenstrualPeriodLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v6, v7, a4);

  return (char)a4;
}

- (void)_activityMoveModeObjectWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierActivityMoveMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HKHealthStore__activityMoveModeObjectWithCompletion___block_invoke;
  v7[3] = &unk_1E37E8C88;
  v8 = v4;
  v6 = v4;
  -[HKHealthStore _characteristicForDataType:withCompletion:](self, "_characteristicForDataType:withCompletion:", v5, v7);

}

void __55__HKHealthStore__activityMoveModeObjectWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    if (v8)
      v7 = objc_msgSend(v8, "integerValue");
    else
      v7 = 0;
    v6 = -[HKActivityMoveModeObject _initWithActivityMoveMode:]([HKActivityMoveModeObject alloc], "_initWithActivityMoveMode:", v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (HKActivityMoveModeObject)activityMoveModeWithError:(NSError *)error
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v13;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierActivityMoveMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    if (error)
    {
      v10 = 0;
      *error = (NSError *)objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError(v9);
      v10 = 0;
    }
  }
  else
  {
    if (v6)
      v11 = objc_msgSend(v6, "integerValue");
    else
      v11 = 1;
    v10 = -[HKActivityMoveModeObject _initWithActivityMoveMode:]([HKActivityMoveModeObject alloc], "_initWithActivityMoveMode:", v11);
  }

  return (HKActivityMoveModeObject *)v10;
}

- (id)_activityMoveModeWithError:(id *)a3
{
  void *v5;
  void *v6;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierActivityMoveMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthStore _characteristicForDataType:error:](self, "_characteristicForDataType:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_setActivityMoveMode:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  +[HKObjectType characteristicTypeForIdentifier:](HKObjectType, "characteristicTypeForIdentifier:", CFSTR("HKCharacteristicTypeIdentifierActivityMoveMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HKHealthStore _setCharacteristic:forDataType:error:](self, "_setCharacteristic:forDataType:error:", v8, v7, a4);

  return (char)a4;
}

- (void)_characteristicForDataType:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("%@: Invalid data type %@, expected data type of class %@ in %@"), v11, v7, v12, v13);

  }
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__HKHealthStore__characteristicForDataType_withCompletion___block_invoke;
  v19[3] = &unk_1E37E8E20;
  v20 = v7;
  v21 = v8;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __59__HKHealthStore__characteristicForDataType_withCompletion___block_invoke_2;
  v17[3] = &unk_1E37E6B38;
  v18 = v21;
  v15 = v21;
  v16 = v7;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v19, v17);

}

uint64_t __59__HKHealthStore__characteristicForDataType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCharacteristicWithDataType:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __59__HKHealthStore__characteristicForDataType_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_characteristicForDataType:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("%@: Invalid data type %@, expected data type of class %@ in %@"), v10, v7, v11, v12);

  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3;
  v33 = __Block_byref_object_dispose__3;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HKHealthStore__characteristicForDataType_error___block_invoke;
  aBlock[3] = &unk_1E37E8FD0;
  aBlock[4] = &v29;
  aBlock[5] = &v23;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__HKHealthStore__characteristicForDataType_error___block_invoke_2;
  v20[3] = &unk_1E37E6B38;
  v13 = _Block_copy(aBlock);
  v21 = v13;
  -[HKHealthStore _synchronousServerProxyWithErrorHandler:](self, "_synchronousServerProxyWithErrorHandler:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remote_fetchCharacteristicWithDataType:handler:", v7, v13);
  v15 = (void *)v30[5];
  if (!v15)
  {
    v16 = (id)v24[5];
    v17 = v16;
    if (v16)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError(v16);
    }

    v15 = (void *)v30[5];
  }
  v18 = v15;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

void __50__HKHealthStore__characteristicForDataType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __50__HKHealthStore__characteristicForDataType_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_setCharacteristic:(id)a3 forDataType:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  _QWORD v22[6];
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("%@: Invalid data type %@, expected data type of class %@ in %@"), v13, v10, v14, v15);

  }
  if (objc_msgSend(v10, "_validateCharacteristic:error:", v9, a5))
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__3;
    v32 = __Block_byref_object_dispose__3;
    v33 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __54__HKHealthStore__setCharacteristic_forDataType_error___block_invoke;
    v23[3] = &unk_1E37E8FF8;
    v23[4] = &v28;
    v23[5] = &v24;
    -[HKHealthStore _synchronousServerProxyWithErrorHandler:](self, "_synchronousServerProxyWithErrorHandler:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __54__HKHealthStore__setCharacteristic_forDataType_error___block_invoke_2;
    v22[3] = &unk_1E37E9020;
    v22[4] = &v24;
    v22[5] = &v28;
    objc_msgSend(v17, "remote_setCharacteristic:forDataType:handler:", v9, v10, v22);
    v18 = (id)v29[5];
    v19 = v18;
    if (v18)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError(v18);
    }

    v20 = *((_BYTE *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __54__HKHealthStore__setCharacteristic_forDataType_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __54__HKHealthStore__setCharacteristic_forDataType_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (id)_modificationDateForCharacteristicWithType:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("%@: Invalid data type %@, expected data type of class %@ in %@"), v10, v7, v11, v12);

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__HKHealthStore__modificationDateForCharacteristicWithType_error___block_invoke;
  v20[3] = &unk_1E37E8FF8;
  v20[4] = &v27;
  v20[5] = &v21;
  -[HKHealthStore _synchronousServerProxyWithErrorHandler:](self, "_synchronousServerProxyWithErrorHandler:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __66__HKHealthStore__modificationDateForCharacteristicWithType_error___block_invoke_2;
  v19[3] = &unk_1E37E9048;
  v19[4] = &v21;
  v19[5] = &v27;
  objc_msgSend(v14, "remote_fetchModificationDateForCharacteristicWithDataType:handler:", v7, v19);
  v15 = (id)v28[5];
  v16 = v15;
  if (v15)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError(v15);
  }

  v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __66__HKHealthStore__modificationDateForCharacteristicWithType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __66__HKHealthStore__modificationDateForCharacteristicWithType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)supportsHealthRecords
{
  return -[HKHealthStore _supportsFeature:](self, "_supportsFeature:", 1);
}

- (BOOL)_supportsFeature:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__HKHealthStore__supportsFeature___block_invoke;
  v8[3] = &unk_1E37E9070;
  v8[4] = &v9;
  v8[5] = a3;
  -[HKHealthStore _synchronousServerProxyWithErrorHandler:](self, "_synchronousServerProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __34__HKHealthStore__supportsFeature___block_invoke_365;
  v7[3] = &unk_1E37E9098;
  v7[4] = &v9;
  v7[5] = v3;
  objc_msgSend(v5, "remote_getIsFeatureSetAvailable:completion:", v3, v7);
  LOBYTE(v3) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v3;
}

void __34__HKHealthStore__supportsFeature___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    __34__HKHealthStore__supportsFeature___block_invoke_cold_1();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;

}

void __34__HKHealthStore__supportsFeature___block_invoke_365(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 == 1;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      __34__HKHealthStore__supportsFeature___block_invoke_cold_1();
  }

}

- (void)addSamples:(NSArray *)samples toWorkout:(HKWorkout *)workout completion:(void *)completion
{
  NSArray *v8;
  HKWorkout *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  HKWorkout *v19;
  NSArray *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  NSArray *v24;
  HKWorkout *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = samples;
  v9 = workout;
  v10 = completion;
  _HKInitializeLogging();
  v11 = (void *)HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = -[NSArray count](v8, "count");
    -[HKObject UUID](v9, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v28 = v13;
    v29 = 2114;
    v30 = v15;
    _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "Adding %lu samples to workout %{public}@", buf, 0x16u);

  }
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __49__HKHealthStore_addSamples_toWorkout_completion___block_invoke;
  v23[3] = &unk_1E37E8BE8;
  v24 = v8;
  v25 = v9;
  v26 = v16;
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __49__HKHealthStore_addSamples_toWorkout_completion___block_invoke_2;
  v21[3] = &unk_1E37E6B38;
  v22 = v26;
  v18 = v26;
  v19 = v9;
  v20 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v23, v21);

}

uint64_t __49__HKHealthStore_addSamples_toWorkout_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addSamples:toWorkout:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __49__HKHealthStore_addSamples_toWorkout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_replaceWorkout:(id)a3 withWorkout:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__HKHealthStore__replaceWorkout_withWorkout_completion___block_invoke;
  v17[3] = &unk_1E37E8BE8;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __56__HKHealthStore__replaceWorkout_withWorkout_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __56__HKHealthStore__replaceWorkout_withWorkout_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_replaceWorkout:withWorkout:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __56__HKHealthStore__replaceWorkout_withWorkout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startWorkoutSession:(HKWorkoutSession *)workoutSession
{
  HKWorkoutSession *v4;
  id v5;

  v4 = workoutSession;
  -[HKWorkoutSession _setupWithHealthStore:](v4, "_setupWithHealthStore:", self);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKWorkoutSession startActivityWithDate:completion:](v4, "startActivityWithDate:completion:", v5, &__block_literal_global_366);

}

void __37__HKHealthStore_startWorkoutSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __37__HKHealthStore_startWorkoutSession___block_invoke_cold_1();
  }

}

- (void)endWorkoutSession:(HKWorkoutSession *)workoutSession
{
  HKWorkoutSession *v4;

  v4 = workoutSession;
  -[HKWorkoutSession _setupWithHealthStore:](v4, "_setupWithHealthStore:", self);
  -[HKWorkoutSession endWithCompletion:](v4, "endWithCompletion:", &__block_literal_global_367);

}

void __35__HKHealthStore_endWorkoutSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __35__HKHealthStore_endWorkoutSession___block_invoke_cold_1();
  }

}

- (void)pauseWorkoutSession:(HKWorkoutSession *)workoutSession
{
  HKWorkoutSession *v4;

  v4 = workoutSession;
  -[HKWorkoutSession _setupWithHealthStore:](v4, "_setupWithHealthStore:", self);
  -[HKWorkoutSession pauseWithCompletion:](v4, "pauseWithCompletion:", &__block_literal_global_368);

}

void __37__HKHealthStore_pauseWorkoutSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __35__HKHealthStore_endWorkoutSession___block_invoke_cold_1();
  }

}

- (void)resumeWorkoutSession:(HKWorkoutSession *)workoutSession
{
  HKWorkoutSession *v4;

  v4 = workoutSession;
  -[HKWorkoutSession _setupWithHealthStore:](v4, "_setupWithHealthStore:", self);
  -[HKWorkoutSession resumeWithCompletion:](v4, "resumeWithCompletion:", &__block_literal_global_369);

}

void __38__HKHealthStore_resumeWorkoutSession___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __35__HKHealthStore_endWorkoutSession___block_invoke_cold_1();
  }

}

- (void)startWatchAppWithWorkoutConfiguration:(HKWorkoutConfiguration *)workoutConfiguration completion:(void *)completion
{
  HKWorkoutConfiguration *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  HKWorkoutConfiguration *v18;
  id v19;
  uint8_t buf[16];

  v6 = workoutConfiguration;
  v7 = completion;
  _HKInitializeLogging();
  v8 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_DEFAULT, "Requesting watch workout app launch with configuration", buf, 2u);
  }
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isiPad"))
  {

  }
  else
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRealityDevice");

    if (!v11)
    {
      -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __66__HKHealthStore_startWatchAppWithWorkoutConfiguration_completion___block_invoke;
      v17[3] = &unk_1E37E8E20;
      v18 = v6;
      v19 = v13;
      v15[0] = v14;
      v15[1] = 3221225472;
      v15[2] = __66__HKHealthStore_startWatchAppWithWorkoutConfiguration_completion___block_invoke_2;
      v15[3] = &unk_1E37E6B38;
      v7 = v19;
      v16 = v7;
      -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v17, v15);

      v12 = v18;
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 2, CFSTR("Starting a workout from this device is not supported."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);
LABEL_8:

}

uint64_t __66__HKHealthStore_startWatchAppWithWorkoutConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startWatchAppWithWorkoutConfiguration:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__HKHealthStore_startWatchAppWithWorkoutConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_startWatchAppWithWorkoutPlanData:(id)a3 processIdentifier:(int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  int v22;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  _HKInitializeLogging();
  v10 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "Requesting Apple watch workout app launch with configuration", buf, 2u);
  }
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isiPad"))
  {

  }
  else
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isRealityDevice");

    if (!v13)
    {
      -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __80__HKHealthStore__startWatchAppWithWorkoutPlanData_processIdentifier_completion___block_invoke;
      v19[3] = &unk_1E37E9140;
      v20 = v8;
      v22 = a4;
      v21 = v15;
      v17[0] = v16;
      v17[1] = 3221225472;
      v17[2] = __80__HKHealthStore__startWatchAppWithWorkoutPlanData_processIdentifier_completion___block_invoke_2;
      v17[3] = &unk_1E37E6B38;
      v9 = v21;
      v18 = v9;
      -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v19, v17);

      v14 = v20;
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 2, CFSTR("Starting a workout from this device is not supported."));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v14);
LABEL_8:

}

uint64_t __80__HKHealthStore__startWatchAppWithWorkoutPlanData_processIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startWatchAppWithWorkoutPlanData:processIdentifier:completion:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __80__HKHealthStore__startWatchAppWithWorkoutPlanData_processIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recoverActiveWorkoutSessionWithCompletion:(void *)completion
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  -[HKHealthStore _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", completion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke;
  v9[3] = &unk_1E37E91B8;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_5;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v9, v7);

}

void __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_2;
  v5[3] = &unk_1E37E9190;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "remote_recoverActiveWorkoutSessionWithCompletion:", v5);

}

void __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  HKWorkoutSession *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    objc_msgSend(v7, "setRequiresRecovery:", 1);
    v10 = [HKWorkoutSession alloc];
    v11 = *(_QWORD *)(a1 + 32);
    v22 = 0;
    v12 = -[HKWorkoutSession _initWithHealthStore:taskConfiguration:error:](v10, "_initWithHealthStore:taskConfiguration:error:", v11, v7, &v22);
    v13 = v22;
    if (v12)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_3;
      v16[3] = &unk_1E37E9168;
      v21 = *(id *)(a1 + 40);
      v17 = v8;
      v14 = v12;
      v15 = *(_QWORD *)(a1 + 32);
      v18 = v14;
      v19 = v15;
      v20 = v9;
      objc_msgSend(v14, "_recoverWithCompletion:", v16);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  HKLiveWorkoutBuilder *v7;
  void (*v8)(void);
  _QWORD v9[4];
  id v10;
  HKLiveWorkoutBuilder *v11;
  id v12;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_7:
    v8();
    goto LABEL_10;
  }
  v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_7;
  }
  objc_msgSend(v6, "setRequiresRecovery:", 1);
  v7 = -[HKLiveWorkoutBuilder initWithHealthStore:session:builderConfiguration:builderIdentifier:]([HKLiveWorkoutBuilder alloc], "initWithHealthStore:session:builderConfiguration:builderIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_4;
    v9[3] = &unk_1E37E8C38;
    v10 = *(id *)(a1 + 40);
    v11 = v7;
    v12 = *(id *)(a1 + 64);
    -[HKWorkoutBuilder _recoverWithCompletion:](v11, "_recoverWithCompletion:", v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

LABEL_10:
}

uint64_t __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setAssociatedWorkoutBuilder:", *(_QWORD *)(a1 + 40));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

uint64_t __59__HKHealthStore_recoverActiveWorkoutSessionWithCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setWorkoutSessionMirroringStartHandler:(void *)workoutSessionMirroringStartHandler
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id mirroredSessionHandler;
  id v10;
  _QWORD aBlock[4];
  id v12;
  uint8_t buf[16];

  v4 = workoutSessionMirroringStartHandler;
  _HKInitializeLogging();
  v5 = HKLogWorkouts;
  v6 = os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[mirroring] Client setting mirrored session handler.", buf, 2u);
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_377;
    aBlock[3] = &unk_1E37E9220;
    v12 = v4;
    v7 = _Block_copy(aBlock);
    os_unfair_lock_lock(&self->_lock);
    v8 = _Block_copy(v7);
    mirroredSessionHandler = self->_mirroredSessionHandler;
    self->_mirroredSessionHandler = v8;

    os_unfair_lock_unlock(&self->_lock);
    -[HKHealthStore _setMirroredWorkoutSessionObserverStateToEnabled:handler:](self, "_setMirroredWorkoutSessionObserverStateToEnabled:handler:", 1, v7);

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "[mirroring] Mirrored session handler set to nil by the client.", buf, 2u);
    }
    os_unfair_lock_lock(&self->_lock);
    v10 = self->_mirroredSessionHandler;
    self->_mirroredSessionHandler = 0;

    os_unfair_lock_unlock(&self->_lock);
    -[HKHealthStore _setMirroredWorkoutSessionObserverStateToEnabled:handler:](self, "_setMirroredWorkoutSessionObserverStateToEnabled:handler:", 0, &__block_literal_global_376);
  }

}

void __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_cold_1();
  }

}

void __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_377(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = HKLogWorkouts;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "[mirroring] Client received remote session", v10, 2u);
    }
    v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v9 = (void *)v8;
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);

  }
  else if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
  {
    __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_377_cold_1();
  }

}

- (void)_setMirroredWorkoutSessionObserverStateToEnabled:(BOOL)a3 handler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke;
  v11[3] = &unk_1E37E9248;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke_3;
  v9[3] = &unk_1E37E6B38;
  v10 = v12;
  v8 = v12;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v11, v9);

}

void __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke_2;
  v4[3] = &unk_1E37E6AE8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_setMirroredWorkoutSessionObserverStateToEnabled:completion:", v3, v4);

}

uint64_t __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __74__HKHealthStore__setMirroredWorkoutSessionObserverStateToEnabled_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)_applicationHasRunningWorkout
{
  return +[HKWorkoutSession _applicationHasRunningWorkout](HKWorkoutSession, "_applicationHasRunningWorkout");
}

- (void)_ratingOfExertionSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  HKWorkoutEffortRelationshipQuery *v21;
  HKWorkoutEffortRelationshipQuery *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, void *, uint64_t, void *);
  void *v27;
  HKHealthStore *v28;
  id v29;
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  -[HKHealthStore _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  +[_HKEntitlements entitlementsForCurrentTaskWithError:](_HKEntitlements, "entitlementsForCurrentTaskWithError:", &v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v31;
  if (v12)
  {
    if ((objc_msgSend(v12, "hasEntitlement:", CFSTR("com.apple.private.healthkit")) & 1) != 0)
    {
      if (v9)
      {
        objc_msgSend(v8, "workoutActivities");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v9);

        if (v15)
        {
          objc_msgSend(v8, "workoutActivityType");
LABEL_12:
          objc_msgSend(v8, "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKQuery predicateForObjectWithUUID:](HKQuery, "predicateForObjectWithUUID:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = [HKWorkoutEffortRelationshipQuery alloc];
          v24 = MEMORY[0x1E0C809B0];
          v25 = 3221225472;
          v26 = __79__HKHealthStore__ratingOfExertionSamplesForWorkout_workoutActivity_completion___block_invoke;
          v27 = &unk_1E37E9270;
          v28 = self;
          v30 = v11;
          v29 = v9;
          v22 = -[HKWorkoutEffortRelationshipQuery initWithPredicate:anchor:options:resultsHandler:](v21, "initWithPredicate:anchor:options:resultsHandler:", v20, 0, 0, &v24);
          -[HKHealthStore executeQuery:](self, "executeQuery:", v22, v24, v25, v26, v27, v28);

          goto LABEL_16;
        }
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = CFSTR("Activity must be inside workout activities.");
      }
      else
      {
        if (objc_msgSend(v8, "workoutActivityType") != 82)
          goto LABEL_12;
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = CFSTR("Activity must be set for HKWorkoutActivityTypeSwimBikeRun workouts.");
      }
      objc_msgSend(v17, "hk_error:description:", 3, v18);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 4, CFSTR("Missing private entitlement."));
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v16;
    v10[2](v10, 0, v16);

    goto LABEL_16;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogAuthorization, OS_LOG_TYPE_ERROR))
    -[HKHealthStore _ratingOfExertionSamplesForWorkout:workoutActivity:completion:].cold.1();
  v10[2](v10, 0, (uint64_t)v13);
LABEL_16:

}

void __79__HKHealthStore__ratingOfExertionSamplesForWorkout_workoutActivity_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
  if (v8)
  {
    v23 = v9;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v16, "samples");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17 || (v18 = *(_QWORD *)(a1 + 40), v17, v18))
          {
            v19 = *(void **)(a1 + 40);
            if (!v19)
              continue;
            objc_msgSend(v16, "activity");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if (!v21)
              continue;
          }
          objc_msgSend(v16, "samples");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v22);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v9 = v23;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_relateReplaceRatingOfExertionSample:(id)a3 toWorkout:(id)a4 forActivity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke;
  v18[3] = &unk_1E37E92C0;
  v21 = v12;
  v22 = v13;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  -[HKHealthStore _ratingOfExertionSamplesForWorkout:workoutActivity:completion:](self, "_ratingOfExertionSamplesForWorkout:workoutActivity:completion:", v15, v14, v18);

}

void __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke_2;
    v8[3] = &unk_1E37E9298;
    v5 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v12 = v3;
    v13 = *(id *)(a1 + 64);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke_3;
    v6[3] = &unk_1E37E6B38;
    v7 = *(id *)(a1 + 64);
    objc_msgSend(v5, "_serverProxyWithHandler:errorHandler:", v8, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_relateReplaceRatingOfExertionSample:toWorkout:workoutActivity:samples:completion:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

uint64_t __87__HKHealthStore__relateReplaceRatingOfExertionSample_toWorkout_forActivity_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)relateWorkoutEffortSample:(id)a3 withWorkout:(id)a4 activity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (v12
    && (objc_msgSend(v11, "workoutActivities"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "containsObject:", v12),
        v14,
        (v15 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Activity must be inside workout activities."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v19);

  }
  else
  {
    -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__HKHealthStore_relateWorkoutEffortSample_withWorkout_activity_completion___block_invoke;
    v22[3] = &unk_1E37E8C10;
    v23 = v10;
    v24 = v11;
    v25 = v12;
    v26 = v16;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __75__HKHealthStore_relateWorkoutEffortSample_withWorkout_activity_completion___block_invoke_2;
    v20[3] = &unk_1E37E6B38;
    v21 = v26;
    v18 = v26;
    -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v22, v20);

  }
}

void __75__HKHealthStore_relateWorkoutEffortSample_withWorkout_activity_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = a1[4];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_relateSamples:withObject:subObject:type:completion:", v5, a1[5], a1[6], 1, a1[7], v6, v7);

}

uint64_t __75__HKHealthStore_relateWorkoutEffortSample_withWorkout_activity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unrelateWorkoutEffortSample:(id)a3 fromWorkout:(id)a4 activity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (v12
    && (objc_msgSend(v11, "workoutActivities"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "containsObject:", v12),
        v14,
        (v15 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Activity must be inside workout activities."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v19);

  }
  else
  {
    -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__HKHealthStore_unrelateWorkoutEffortSample_fromWorkout_activity_completion___block_invoke;
    v22[3] = &unk_1E37E8C10;
    v23 = v10;
    v24 = v11;
    v25 = v12;
    v26 = v16;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __77__HKHealthStore_unrelateWorkoutEffortSample_fromWorkout_activity_completion___block_invoke_2;
    v20[3] = &unk_1E37E6B38;
    v21 = v26;
    v18 = v26;
    -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v22, v20);

  }
}

void __77__HKHealthStore_unrelateWorkoutEffortSample_fromWorkout_activity_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = a1[4];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_unrelateSamples:withObject:subObject:type:completion:", v5, a1[5], a1[6], 1, a1[7], v6, v7);

}

uint64_t __77__HKHealthStore_unrelateWorkoutEffortSample_fromWorkout_activity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setBackgroundDeliveryFrequencyDataType:(id)a3 frequency:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;

  v8 = a3;
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__HKHealthStore__setBackgroundDeliveryFrequencyDataType_frequency_withCompletion___block_invoke;
  v15[3] = &unk_1E37E8B98;
  v18 = a4;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __82__HKHealthStore__setBackgroundDeliveryFrequencyDataType_frequency_withCompletion___block_invoke_2;
  v13[3] = &unk_1E37E6B38;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __82__HKHealthStore__setBackgroundDeliveryFrequencyDataType_frequency_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setBackgroundDeliveryFrequency:forDataType:handler:", a1[6], a1[4], a1[5]);
}

uint64_t __82__HKHealthStore__setBackgroundDeliveryFrequencyDataType_frequency_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableBackgroundDeliveryForType:(HKObjectType *)type withCompletion:(void *)completion
{
  -[HKHealthStore _setBackgroundDeliveryFrequencyDataType:frequency:withCompletion:](self, "_setBackgroundDeliveryFrequencyDataType:frequency:withCompletion:", type, 0, completion);
}

- (void)disableAllBackgroundDeliveryWithCompletion:(void *)completion
{
  -[HKHealthStore _setBackgroundDeliveryFrequencyDataType:frequency:withCompletion:](self, "_setBackgroundDeliveryFrequencyDataType:frequency:withCompletion:", 0, 0, completion);
}

- (void)_closeTransactionWithTypes:(id)a3 anchor:(id)a4 ackTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke;
  v14[3] = &unk_1E37E9308;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v14, &__block_literal_global_390);

}

uint64_t __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_closeTransactionWithDataTypes:anchor:ackTime:completion:", a1[4], a1[5], a1[6], &__block_literal_global_388);
}

void __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_2_cold_1();
  }

}

void __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_389(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
    __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_2_cold_1();

}

- (void)preferredUnitsForQuantityTypes:(NSSet *)quantityTypes completion:(void *)completion
{
  void *v6;
  uint64_t v7;
  NSSet *v8;

  v6 = completion;
  v8 = quantityTypes;
  -[HKHealthStore preferredUnitsForQuantityTypes:version:completion:](self, "preferredUnitsForQuantityTypes:version:completion:", v8, HKSupportedUnitPreferencesVersion((uint64_t)v8, v7), v6);

}

- (void)preferredUnitsForQuantityTypes:(id)a3 version:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;

  v8 = a3;
  -[HKHealthStore _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HKHealthStore_preferredUnitsForQuantityTypes_version_completion___block_invoke;
  v15[3] = &unk_1E37E8B98;
  v16 = v8;
  v18 = a4;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __67__HKHealthStore_preferredUnitsForQuantityTypes_version_completion___block_invoke_2;
  v13[3] = &unk_1E37E6B38;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __67__HKHealthStore_preferredUnitsForQuantityTypes_version_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchUnitPreferencesForTypes:version:withCompletion:", a1[4], a1[6], a1[5]);
}

uint64_t __67__HKHealthStore_preferredUnitsForQuantityTypes_version_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setPreferredUnit:(id)a3 forType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__HKHealthStore__setPreferredUnit_forType_completion___block_invoke;
  v17[3] = &unk_1E37E8BE8;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __54__HKHealthStore__setPreferredUnit_forType_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __54__HKHealthStore__setPreferredUnit_forType_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setPreferredUnit:forType:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __54__HKHealthStore__setPreferredUnit_forType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_removePreferredUnitForType:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__HKHealthStore__removePreferredUnitForType_completion___block_invoke;
  v13[3] = &unk_1E37E8E20;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __56__HKHealthStore__removePreferredUnitForType_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __56__HKHealthStore__removePreferredUnitForType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removePreferredUnitForType:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __56__HKHealthStore__removePreferredUnitForType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)splitTotalEnergy:(HKQuantity *)totalEnergy startDate:(NSDate *)startDate endDate:(NSDate *)endDate resultsHandler:(void *)resultsHandler
{
  HKQuantity *v11;
  NSDate *v12;
  NSDate *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  NSObject *clientQueue;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31[3];
  _QWORD block[4];
  id v33;
  id v34;

  v11 = totalEnergy;
  v12 = startDate;
  v13 = endDate;
  v14 = resultsHandler;
  -[NSDate timeIntervalSinceDate:](v12, "timeIntervalSinceDate:", v13);
  if (v15 <= 0.00000011920929)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("startDate (%@) cannot occur after endDate (%@)"), v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HKQuantity isCompatibleWithUnit:](v11, "isCompatibleWithUnit:", v17);

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("totalEnergy (%@) quantity unit is not compatible with kilocalories"), v11);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
  }
  if (v16)
  {
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke;
    block[3] = &unk_1E37E6D40;
    v21 = &v34;
    v34 = v14;
    v33 = v16;
    dispatch_async(clientQueue, block);
    v22 = v33;
  }
  else
  {
    +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantity doubleValueForUnit:](v11, "doubleValueForUnit:", v23);
    v25 = v24;

    -[NSDate timeIntervalSinceDate:](v13, "timeIntervalSinceDate:", v12);
    v26 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_2;
    v30[3] = &unk_1E37E9378;
    v31[1] = v25;
    v31[2] = v27;
    v21 = v31;
    v31[0] = v14;
    v28[0] = v26;
    v28[1] = 3221225472;
    v28[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4;
    v28[3] = &unk_1E37E69F8;
    v28[4] = self;
    v29 = v31[0];
    -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v30, v28);
    v22 = v29;
  }

}

uint64_t __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  _QWORD v5[4];
  id v6;
  double v7;

  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_3;
  v5[3] = &unk_1E37E9350;
  v7 = v3;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_splitTotalCalories:timeInterval:withCompletion:", v5, v3, v4);

}

void __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_3(uint64_t a1, double a2)
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(double *)(a1 + 40) >= a2)
    v3 = a2;
  else
    v3 = *(double *)(a1 + 40);
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v4, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v5, *(double *)(a1 + 40) - v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if ((HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4_cold_1();
  }
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_398;
  v7[3] = &unk_1E37E6D40;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_398(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)connectionInterrupted
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HKHealthStoreServerInterface *serverProxy;
  void *v6;
  void *v7;
  NSObject *clientQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_queries, "copy");
  serverProxy = self->_serverProxy;
  self->_serverProxy = 0;

  v6 = (void *)objc_msgSend(self->_mirroredSessionHandler, "copy");
  -[HKHealthStore invalidateAllDatabaseAccessibilityAssertions](self, "invalidateAllDatabaseAccessibilityAssertions");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("connection interrupted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  clientQueue = self->_clientQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__HKHealthStore_connectionInterrupted__block_invoke;
  v12[3] = &unk_1E37E68A0;
  v12[4] = self;
  v13 = v7;
  v14 = v4;
  v15 = v6;
  v9 = v6;
  v10 = v4;
  v11 = v7;
  dispatch_async(clientQueue, v12);

}

void __38__HKHealthStore_connectionInterrupted__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "_clientQueue_invokeAuthorizationDelegateTransactionErrorHandlerWithError:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v2 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__HKHealthStore_connectionInterrupted__block_invoke_2;
    v5[3] = &unk_1E37E8E70;
    v3 = *(id *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v6 = v3;
    v7 = v4;
    objc_msgSend(v2, "_serverProxyWithHandler:errorHandler:", v5, &__block_literal_global_401);

  }
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "_setMirroredWorkoutSessionObserverStateToEnabled:handler:", 1);
}

void __38__HKHealthStore_connectionInterrupted__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reactivateWithHealthStore:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)connectionConfigured
{
  os_unfair_lock_s *p_lock;
  HKDatabaseAccessibilityAssertionStoreKeeper *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_databaseAccessibilityAssertionStoreKeeper;
  os_unfair_lock_unlock(p_lock);
  -[HKDatabaseAccessibilityAssertionStoreKeeper connectionConfigured](v4, "connectionConfigured");

}

- (void)_applicationWillResignActive:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _HKInitializeLogging();
  v4 = HKLogProcessState;
  if (os_log_type_enabled((os_log_t)HKLogProcessState, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "App will resign active", v5, 2u);
  }
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", &__block_literal_global_402, &__block_literal_global_404);
}

uint64_t __46__HKHealthStore__applicationWillResignActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_clientWillSuspendWithCompletion:", &__block_literal_global_403);
}

void __46__HKHealthStore__applicationWillResignActive___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
    __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4_cold_1();

}

- (void)_applicationDidBecomeActive:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _HKInitializeLogging();
  v4 = HKLogProcessState;
  if (os_log_type_enabled((os_log_t)HKLogProcessState, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "App did become active", v5, 2u);
  }
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", &__block_literal_global_405, &__block_literal_global_407);
}

uint64_t __45__HKHealthStore__applicationDidBecomeActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_clientResumedWithCompletion:", &__block_literal_global_406);
}

void __45__HKHealthStore__applicationDidBecomeActive___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
    __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4_cold_1();

}

- (id)_actionCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HKHealthStore__actionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E37E67C0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __48__HKHealthStore__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKHealthStore__actionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E37E6798;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __48__HKHealthStore__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (id)_multiActionCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HKHealthStore__multiActionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E37E94C8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __53__HKHealthStore__multiActionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;
  char v15;

  v7 = a4;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HKHealthStore__multiActionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E37E94A0;
  v14 = a2;
  v15 = a3;
  v12 = v7;
  v13 = v8;
  v10 = v7;
  dispatch_async(v9, block);

}

uint64_t __53__HKHealthStore__multiActionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));
  return result;
}

- (id)_objectCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HKHealthStore__objectCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E37E94F0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __48__HKHealthStore__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKHealthStore__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E37E6710;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __48__HKHealthStore__objectCompletionOnClientQueue___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (BOOL)_prepareObjectsForSaving:(id)a3 errorOut:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "prepareForSaving:", a4, (_QWORD)v12))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (void)setHealthLiteValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "key");
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__HKHealthStore_setHealthLiteValue_forKey_completion___block_invoke;
  v18[3] = &unk_1E37E8BE8;
  v19 = v8;
  v20 = v9;
  v21 = v11;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __54__HKHealthStore_setHealthLiteValue_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __54__HKHealthStore_setHealthLiteValue_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setHealthLiteValue:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __54__HKHealthStore_setHealthLiteValue_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getHealthLiteValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "key");
  -[HKHealthStore _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__HKHealthStore_getHealthLiteValueForKey_completion___block_invoke;
  v14[3] = &unk_1E37E8E20;
  v15 = v6;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __53__HKHealthStore_getHealthLiteValueForKey_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __53__HKHealthStore_getHealthLiteValueForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getHealthLiteValueForKey:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __53__HKHealthStore_getHealthLiteValueForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAllHealthDataAccessForSiri:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HKHealthStore_setAllHealthDataAccessForSiri_completion___block_invoke;
  v11[3] = &unk_1E37E9518;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __58__HKHealthStore_setAllHealthDataAccessForSiri_completion___block_invoke_2;
  v9[3] = &unk_1E37E6B38;
  v10 = v12;
  v8 = v12;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __58__HKHealthStore_setAllHealthDataAccessForSiri_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setAllHealthDataAccessForSiri:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __58__HKHealthStore_setAllHealthDataAccessForSiri_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAllHealthDataAccessForSiriWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke;
  v10[3] = &unk_1E37E8CD8;
  v10[4] = self;
  v11 = v4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_3;
  v8[3] = &unk_1E37E8BC0;
  v9 = (id)objc_msgSend(v10, "copy");
  v6[0] = v8[0];
  v6[1] = 3221225472;
  v6[2] = __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_4;
  v6[3] = &unk_1E37E6B38;
  v7 = v9;
  v5 = v9;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v8, v6);

}

void __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_2;
  block[3] = &unk_1E37E8CB0;
  v11 = v6;
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[6], a1[4]);
  return result;
}

uint64_t __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getAllHealthDataAccessForSiriWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __61__HKHealthStore_getAllHealthDataAccessForSiriWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchServerURLForAssetType:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[HKHealthStore _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__HKHealthStore_fetchServerURLForAssetType_completion___block_invoke;
  v13[3] = &unk_1E37E8E20;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __55__HKHealthStore_fetchServerURLForAssetType_completion___block_invoke_2;
  v11[3] = &unk_1E37E6B38;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v13, v11);

}

uint64_t __55__HKHealthStore_fetchServerURLForAssetType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchServerURLForAssetType:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __55__HKHealthStore_fetchServerURLForAssetType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setServerURL:(id)a3 forAssetType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__HKHealthStore_setServerURL_forAssetType_completion___block_invoke;
  v17[3] = &unk_1E37E8BE8;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __54__HKHealthStore_setServerURL_forAssetType_completion___block_invoke_2;
  v15[3] = &unk_1E37E6B38;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __54__HKHealthStore_setServerURL_forAssetType_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setServerURL:forAssetType:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __54__HKHealthStore_setServerURL_forAssetType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clientRemote_unitPreferencesDidUpdate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("HKUserPreferencesDidChangeNotification"), self);

}

- (void)clientRemote_conceptIndexManagerDidBecomeQuiescentWithSamplesProcessedCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("processedSampleCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("HKConceptIndexManagerDidBecomeQuiescentNotification"), self, v7);

}

- (void)clientRemote_didCreateRemoteSessionWithConfiguration:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  HKWorkoutSession *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 144));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (v2)
  {
    v3 = [HKWorkoutSession alloc];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v13 = 0;
    v6 = -[HKWorkoutSession _initWithHealthStore:taskConfiguration:error:](v3, "_initWithHealthStore:taskConfiguration:error:", v4, v5, &v13);
    v7 = v13;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke_411;
    v10[3] = &unk_1E37E9540;
    v11 = v6;
    v12 = v2;
    v8 = v6;
    objc_msgSend(v8, "_setupMirroredSessionTaskServerWithCompletion:", v10);

  }
  else
  {
    _HKInitializeLogging();
    v9 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
      __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke_cold_1(v9);
  }

}

uint64_t __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke_411(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (void)fetchMedicalIDDataWithCompletion:(id)a3
{
  id v4;
  HKMedicalIDStore *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[HKMedicalIDStore initWithHealthStore:]([HKMedicalIDStore alloc], "initWithHealthStore:", self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HKHealthStore_fetchMedicalIDDataWithCompletion___block_invoke;
  v7[3] = &unk_1E37E9568;
  v8 = v4;
  v6 = v4;
  -[HKMedicalIDStore fetchMedicalIDDataWithCompletion:](v5, "fetchMedicalIDDataWithCompletion:", v7);

}

uint64_t __50__HKHealthStore_fetchMedicalIDDataWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMedicalIDDataCreateIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  HKMedicalIDStore *v7;
  HKMedicalIDStore *v8;

  v4 = a3;
  v6 = a4;
  v7 = -[HKMedicalIDStore initWithHealthStore:]([HKMedicalIDStore alloc], "initWithHealthStore:", self);
  v8 = v7;
  if (v4)
    -[HKMedicalIDStore fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:](v7, "fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:", v6);
  else
    -[HKMedicalIDStore fetchMedicalIDDataWithCompletion:](v7, "fetchMedicalIDDataWithCompletion:", v6);

}

- (void)fetchMedicalIDEmergencyContactsWithCompletion:(id)a3
{
  id v4;
  HKMedicalIDStore *v5;

  v4 = a3;
  v5 = -[HKMedicalIDStore initWithHealthStore:]([HKMedicalIDStore alloc], "initWithHealthStore:", self);
  -[HKMedicalIDStore fetchMedicalIDEmergencyContactsWithCompletion:](v5, "fetchMedicalIDEmergencyContactsWithCompletion:", v4);

}

- (void)updateMedicalIDData:(id)a3
{
  -[HKHealthStore updateMedicalIDData:completion:](self, "updateMedicalIDData:completion:", a3, 0);
}

- (void)updateMedicalIDData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKMedicalIDStore *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HKMedicalIDStore initWithHealthStore:]([HKMedicalIDStore alloc], "initWithHealthStore:", self);
  -[HKMedicalIDStore updateMedicalIDData:completion:](v8, "updateMedicalIDData:completion:", v7, v6);

}

- (void)deleteMedicalIDData
{
  -[HKHealthStore deleteMedicalIDDataWithCompletion:](self, "deleteMedicalIDDataWithCompletion:", 0);
}

- (void)deleteMedicalIDDataWithCompletion:(id)a3
{
  id v4;
  HKMedicalIDStore *v5;

  v4 = a3;
  v5 = -[HKMedicalIDStore initWithHealthStore:]([HKMedicalIDStore alloc], "initWithHealthStore:", self);
  -[HKMedicalIDStore deleteMedicalIDDataWithCompletion:](v5, "deleteMedicalIDDataWithCompletion:", v4);

}

- (id)_getDatabaseAccessibilityAssertionStoreKeeper
{
  int64_t *p_databaseAccessibilityAssertionStoreKeeperDispatchOnceToken;
  int64_t databaseAccessibilityAssertionStoreKeeperDispatchOnceToken;
  _QWORD block[5];

  databaseAccessibilityAssertionStoreKeeperDispatchOnceToken = self->_databaseAccessibilityAssertionStoreKeeperDispatchOnceToken;
  p_databaseAccessibilityAssertionStoreKeeperDispatchOnceToken = &self->_databaseAccessibilityAssertionStoreKeeperDispatchOnceToken;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HKHealthStore__getDatabaseAccessibilityAssertionStoreKeeper__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  if (databaseAccessibilityAssertionStoreKeeperDispatchOnceToken != -1)
    dispatch_once(p_databaseAccessibilityAssertionStoreKeeperDispatchOnceToken, block);
  return self->_databaseAccessibilityAssertionStoreKeeper;
}

void __62__HKHealthStore__getDatabaseAccessibilityAssertionStoreKeeper__block_invoke(uint64_t a1)
{
  HKDatabaseAccessibilityAssertionStoreKeeper *v2;
  uint64_t v3;
  void *v4;

  v2 = -[HKDatabaseAccessibilityAssertionStoreKeeper initWithHealthStore:]([HKDatabaseAccessibilityAssertionStoreKeeper alloc], "initWithHealthStore:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 160);
  *(_QWORD *)(v3 + 160) = v2;

}

- (void)requestDatabaseAccessibilityAssertion:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[HKHealthStore _getDatabaseAccessibilityAssertionStoreKeeper](self, "_getDatabaseAccessibilityAssertionStoreKeeper");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchDatabaseAccessibilityAssertionForOwnerIdentifier:timeout:completion:", v9, v8, a4);

}

- (void)invalidateDatabaseAccessibilityAssertion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKHealthStore _getDatabaseAccessibilityAssertionStoreKeeper](self, "_getDatabaseAccessibilityAssertionStoreKeeper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateDatabaseAccessibilityAssertionWithAssertion:", v4);

}

- (void)invalidateAllDatabaseAccessibilityAssertions
{
  id v2;

  -[HKHealthStore _getDatabaseAccessibilityAssertionStoreKeeper](self, "_getDatabaseAccessibilityAssertionStoreKeeper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAllDatabaseAccessibilityAssertions");

}

- (void)isProtectedDataAvailableWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKHealthStore _multiActionCompletionOnClientQueue:](self, "_multiActionCompletionOnClientQueue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HKHealthStore_isProtectedDataAvailableWithCompletion___block_invoke;
  v9[3] = &unk_1E37E8BC0;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __56__HKHealthStore_isProtectedDataAvailableWithCompletion___block_invoke_2;
  v7[3] = &unk_1E37E6B38;
  v8 = v10;
  v6 = v10;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __56__HKHealthStore_isProtectedDataAvailableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_isProtectedDataAvailable:", *(_QWORD *)(a1 + 32));
}

uint64_t __56__HKHealthStore_isProtectedDataAvailableWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dropEntitlement:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__HKHealthStore_dropEntitlement___block_invoke;
  v11[3] = &unk_1E37E6A70;
  v6 = v4;
  v12 = v6;
  -[HKHealthStore _synchronousServerProxyWithErrorHandler:](self, "_synchronousServerProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __33__HKHealthStore_dropEntitlement___block_invoke_415;
  v9[3] = &unk_1E37E6BD8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "remote_dropEntitlement:completion:", v8, v9);

}

void __33__HKHealthStore_dropEntitlement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogTesting();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "Failed to drop '%{public}@' entitlement: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __33__HKHealthStore_dropEntitlement___block_invoke_415(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogTesting();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "Failed to drop '%{public}@' entitlement: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)restoreEntitlement:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__HKHealthStore_restoreEntitlement___block_invoke;
  v11[3] = &unk_1E37E6A70;
  v6 = v4;
  v12 = v6;
  -[HKHealthStore _synchronousServerProxyWithErrorHandler:](self, "_synchronousServerProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __36__HKHealthStore_restoreEntitlement___block_invoke_416;
  v9[3] = &unk_1E37E6BD8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "remote_restoreEntitlement:completion:", v8, v9);

}

void __36__HKHealthStore_restoreEntitlement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogTesting();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "Failed to restore '%{public}@' entitlement: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __36__HKHealthStore_restoreEntitlement___block_invoke_416(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogTesting();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "Failed to restore '%{public}@' entitlement: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (NSString)writeAuthorizationUsageDescriptionOverride
{
  return self->_writeAuthorizationUsageDescriptionOverride;
}

- (void)setWriteAuthorizationUsageDescriptionOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)readAuthorizationUsageDescriptionOverride
{
  return self->_readAuthorizationUsageDescriptionOverride;
}

- (void)setReadAuthorizationUsageDescriptionOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)clinicalReadAuthorizationUsageDescriptionOverride
{
  return self->_clinicalReadAuthorizationUsageDescriptionOverride;
}

- (void)setClinicalReadAuthorizationUsageDescriptionOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)researchStudyUsageDescriptionOverride
{
  return self->_researchStudyUsageDescriptionOverride;
}

- (void)setResearchStudyUsageDescriptionOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)daemonLaunchDarwinNotificationName
{
  return self->_daemonLaunchDarwinNotificationName;
}

- (void)setDaemonLaunchDarwinNotificationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)_hkui_authorizationViewControllerPresenter
{
  return objc_loadWeakRetained(&self->__hkui_authorizationViewControllerPresenter);
}

- (void)set_hkui_authorizationViewControllerPresenter:(id)a3
{
  objc_storeWeak(&self->__hkui_authorizationViewControllerPresenter, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (id)unitTest_handleExecuteQuery
{
  return self->_unitTest_handleExecuteQuery;
}

- (void)setUnitTest_handleExecuteQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (HKHealthStoreIdentifier)identifier
{
  return (HKHealthStoreIdentifier *)objc_getProperty(self, a2, 232, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_unitTest_handleExecuteQuery, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak(&self->__hkui_authorizationViewControllerPresenter);
  objc_storeStrong((id *)&self->_daemonLaunchDarwinNotificationName, 0);
  objc_storeStrong((id *)&self->_researchStudyUsageDescriptionOverride, 0);
  objc_storeStrong((id *)&self->_clinicalReadAuthorizationUsageDescriptionOverride, 0);
  objc_storeStrong((id *)&self->_readAuthorizationUsageDescriptionOverride, 0);
  objc_storeStrong((id *)&self->_writeAuthorizationUsageDescriptionOverride, 0);
  objc_storeStrong((id *)&self->_databaseAccessibilityAssertionStoreKeeper, 0);
  objc_storeStrong(&self->_mirroredSessionHandler, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_healthServicesManager, 0);
  objc_storeStrong(&self->_authorizationDelegateTransactionErrorHandler, 0);
  objc_storeStrong((id *)&self->_recalibrateEstimatesPresentationController, 0);
  objc_storeStrong((id *)&self->_objectPickerPresentationController, 0);
  objc_storeStrong((id *)&self->_authorizationPresentationController, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceBundle, 0);
  objc_storeStrong((id *)&self->_healthdConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (NSString)firstName
{
  HKProfileStore *v2;
  void *v3;

  v2 = -[HKProfileStore initWithHealthStore:]([HKProfileStore alloc], "initWithHealthStore:", self);
  -[HKProfileStore synchronouslyFetchFirstName](v2, "synchronouslyFetchFirstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)profileIdentifierForNRDeviceUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HKProfileStore *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HKProfileStore initWithHealthStore:]([HKProfileStore alloc], "initWithHealthStore:", self);
  -[HKProfileStore fetchProfileIdentifierForNRDeviceUUID:completion:](v8, "fetchProfileIdentifierForNRDeviceUUID:completion:", v7, v6);

}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8;
  HKCloudSyncControl *v9;

  v8 = a5;
  v9 = -[HKCloudSyncControl initWithHealthStore:]([HKCloudSyncControl alloc], "initWithHealthStore:", self);
  -[HKCloudSyncControl forceCloudSyncWithOptions:reason:completion:](v9, "forceCloudSyncWithOptions:reason:completion:", a3, a4, v8);

}

- (void)forceCloudSyncWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  HKCloudSyncControl *v7;

  v6 = a4;
  v7 = -[HKCloudSyncControl initWithHealthStore:]([HKCloudSyncControl alloc], "initWithHealthStore:", self);
  -[HKCloudSyncControl forceCloudSyncWithOptions:completion:](v7, "forceCloudSyncWithOptions:completion:", a3, v6);

}

- (void)forceCloudSyncDataUploadForProfileWithCompletion:(id)a3
{
  id v4;
  HKCloudSyncControl *v5;

  v4 = a3;
  v5 = -[HKCloudSyncControl initWithHealthStore:]([HKCloudSyncControl alloc], "initWithHealthStore:", self);
  -[HKCloudSyncControl forceCloudSyncDataUploadForProfileWithCompletion:](v5, "forceCloudSyncDataUploadForProfileWithCompletion:", v4);

}

- (void)fetchCloudSyncRequiredWithCompletion:(id)a3
{
  id v4;
  HKCloudSyncControl *v5;

  v4 = a3;
  v5 = -[HKCloudSyncControl initWithHealthStore:]([HKCloudSyncControl alloc], "initWithHealthStore:", self);
  -[HKCloudSyncControl fetchCloudSyncRequiredWithCompletion:](v5, "fetchCloudSyncRequiredWithCompletion:", v4);

}

- (void)disableCloudSyncAndDeleteAllCloudDataWithCompletion:(id)a3
{
  id v4;
  HKCloudSyncControl *v5;

  v4 = a3;
  v5 = -[HKCloudSyncControl initWithHealthStore:]([HKCloudSyncControl alloc], "initWithHealthStore:", self);
  -[HKCloudSyncControl disableCloudSyncAndDeleteAllCloudDataWithCompletion:](v5, "disableCloudSyncAndDeleteAllCloudDataWithCompletion:", v4);

}

- (BOOL)requiresWeakRetention
{
  return 0;
}

- (id)featureAvailabilityProvidingForFeatureIdentifier:(id)a3
{
  id v4;
  id v5;
  HKHealthStore *v6;
  id v7;
  void (*v8)(id, HKHealthStore *, id);
  HKFeatureAvailabilityStore *v9;
  void *v10;

  v4 = a3;
  if (HKFeatureIdentifierIsProvidedBySleepDaemon(v4))
  {
    if (!SleepLibraryCore_frameworkLibrary)
      SleepLibraryCore_frameworkLibrary = _sl_dlopen();
    if (SleepLibraryCore_frameworkLibrary && getgetSleepFeatureAvailabilityProvidingSymbolLoc())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HKHealthStore<HKFeatureAvailabilityHealthDataSource> (%@)"), v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = self;
      v7 = v4;
      v8 = (void (*)(id, HKHealthStore *, id))getgetSleepFeatureAvailabilityProvidingSymbolLoc();
      if (!v8)
        -[HKHealthStore(HKFeatureAvailabilityHealthDataSource) featureAvailabilityProvidingForFeatureIdentifier:].cold.2();
      v8(v5, v6, v7);
      v9 = (HKFeatureAvailabilityStore *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _HKInitializeLogging();
      v10 = (void *)HKLogSleep;
      if (os_log_type_enabled((os_log_t)HKLogSleep, OS_LOG_TYPE_ERROR))
        -[HKHealthStore(HKFeatureAvailabilityHealthDataSource) featureAvailabilityProvidingForFeatureIdentifier:].cold.1(v10);
      v9 = 0;
    }
  }
  else
  {
    v9 = -[HKFeatureAvailabilityStore initWithFeatureIdentifier:healthStore:]([HKFeatureAvailabilityStore alloc], "initWithFeatureIdentifier:healthStore:", v4, self);
  }

  return v9;
}

- (id)sharedRequirementEvaluationDataSource
{
  return 0;
}

- (id)healthDataRequirementEvaluationProvider
{
  return -[HKFeatureAvailabilityHealthDataRequirementStore initWithHealthStore:]([HKFeatureAvailabilityHealthDataRequirementStore alloc], "initWithHealthStore:", self);
}

- (id)requirementSatisfactionOverridesDataSource
{
  return +[HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource requirementSatisfactionOverridesDataSource](HKFeatureAvailabilityRequirementSatisfactionOverridesDataSource, "requirementSatisfactionOverridesDataSource");
}

- (id)watchLowPowerModeDataSource
{
  return 0;
}

- (id)wristDetectionSettingManager
{
  return objc_alloc_init(HKWristDetectionSettingManager);
}

- (id)ageWithCurrentDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[HKHealthStore dateOfBirthComponentsWithError:](self, "dateOfBirthComponentsWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "hk_ageWithCurrentDate:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)featureStatusProviderForIdentifier:(id)a3
{
  id v4;
  HKFeatureStatusManager *v5;

  v4 = a3;
  v5 = -[HKFeatureStatusManager initWithFeatureIdentifier:healthStore:countryCodeSource:]([HKFeatureStatusManager alloc], "initWithFeatureIdentifier:healthStore:countryCodeSource:", v4, self, 0);

  return v5;
}

- (void)isImproveHealthRecordsAnalyticsSubmissionAllowedWithCompletion:(id)a3
{
  id v4;
  HKHealthRecordsStore *v5;

  v4 = a3;
  v5 = -[HKHealthRecordsStore initWithHealthStore:]([HKHealthRecordsStore alloc], "initWithHealthStore:", self);
  -[HKHealthRecordsStore fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:](v5, "fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:", v4);

}

- (void)generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5
{
  id v8;
  HKWorkoutControl *v9;

  v8 = a5;
  v9 = -[HKWorkoutControl initWithHealthStore:]([HKWorkoutControl alloc], "initWithHealthStore:", self);
  -[HKWorkoutControl generateFakeDataForActivityType:minutes:completion:](v9, "generateFakeDataForActivityType:minutes:completion:", a3, v8, a4);

}

- (void)_activeWorkoutApplicationIdentifierWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__HKHealthStore_Deprecated___activeWorkoutApplicationIdentifierWithCompletion___block_invoke;
  v6[3] = &unk_1E37EE2D8;
  v7 = v4;
  v5 = v4;
  -[HKHealthStore _currentWorkoutSnapshotWithCompletion:](self, "_currentWorkoutSnapshotWithCompletion:", v6);

}

void __79__HKHealthStore_Deprecated___activeWorkoutApplicationIdentifierWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "applicationIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)_firstPartyWorkoutSnapshotWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__HKHealthStore_Deprecated___firstPartyWorkoutSnapshotWithCompletion___block_invoke;
  v6[3] = &unk_1E37EE2D8;
  v7 = v4;
  v5 = v4;
  -[HKHealthStore _currentWorkoutSnapshotWithCompletion:](self, "_currentWorkoutSnapshotWithCompletion:", v6);

}

void __70__HKHealthStore_Deprecated___firstPartyWorkoutSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "isFirstPartyWorkout"))
  {
    +[_HKFirstPartyWorkoutSnapshot firstPartyWorkoutSnapshotWithCurrentWorkoutSnapshot:](_HKFirstPartyWorkoutSnapshot, "firstPartyWorkoutSnapshotWithCurrentWorkoutSnapshot:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_currentWorkoutSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  _HKWorkoutObserver *v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__21;
  v14 = __Block_byref_object_dispose__21;
  v15 = -[_HKWorkoutObserver initWithHealthStore:]([_HKWorkoutObserver alloc], "initWithHealthStore:", self);
  v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HKHealthStore_Deprecated___currentWorkoutSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_1E37EE300;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "currentWorkoutSnapshotWithCompletion:", v7);

  _Block_object_dispose(&v10, 8);
}

void __67__HKHealthStore_Deprecated___currentWorkoutSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)_shouldGenerateDemoDataPreferenceIsSet:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke;
  v6[3] = &unk_1E37E9540;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKHealthStore _fetchBoolDaemonPreferenceForKey:completion:](self, "_fetchBoolDaemonPreferenceForKey:completion:", CFSTR("HealthUseDemoDataDatabaseKey"), v6);

}

void __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
    {
      __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
      if ((a2 & 1) != 0)
        goto LABEL_4;
LABEL_6:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_7;
    }
  }
  if ((a2 & 1) == 0)
    goto LABEL_6;
LABEL_4:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_28;
  v14[3] = &unk_1E37E6AE8;
  v13 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v13, "_fetchBoolDaemonPreferenceForKey:completion:", CFSTR("HealthDemoDataGenerateKey"), v14);

LABEL_7:
}

void __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_28_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_fetchBoolDaemonPreferenceForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__HKHealthStore__HKDaemonPreferences___fetchBoolDaemonPreferenceForKey_completion___block_invoke;
  v10[3] = &unk_1E37E8C88;
  v11 = v6;
  v9 = v6;
  -[HKHealthStore _safeFetchDaemonPreferenceForKey:expectedReturnClass:completion:](self, "_safeFetchDaemonPreferenceForKey:expectedReturnClass:completion:", v7, v8, v10);

}

void __83__HKHealthStore__HKDaemonPreferences___fetchBoolDaemonPreferenceForKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(a2, "BOOLValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_safeFetchDaemonPreferenceForKey:(id)a3 expectedReturnClass:(Class)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  Class v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__HKHealthStore__HKDaemonPreferences___safeFetchDaemonPreferenceForKey_expectedReturnClass_completion___block_invoke;
  v10[3] = &unk_1E37F7DF8;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  -[HKHealthStore _fetchDaemonPreferenceForKey:completion:](self, "_fetchDaemonPreferenceForKey:completion:", a3, v10);

}

void __103__HKHealthStore__HKDaemonPreferences___safeFetchDaemonPreferenceForKey_expectedReturnClass_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a2;
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v7;
  }
  else
  {

    v6 = 0;
  }
  v8 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_fetchDaemonPreferenceForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "key");
    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  -[HKHealthStore _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__HKHealthStore__HKDaemonPreferences___fetchDaemonPreferenceForKey_completion___block_invoke;
  v14[3] = &unk_1E37E8E20;
  v15 = v6;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __79__HKHealthStore__HKDaemonPreferences___fetchDaemonPreferenceForKey_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __79__HKHealthStore__HKDaemonPreferences___fetchDaemonPreferenceForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchDaemonPreferenceForKey:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __79__HKHealthStore__HKDaemonPreferences___fetchDaemonPreferenceForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setDaemonPreferenceValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "key");
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  -[HKHealthStore _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__HKHealthStore__HKDaemonPreferences___setDaemonPreferenceValue_forKey_completion___block_invoke;
  v18[3] = &unk_1E37E8BE8;
  v19 = v8;
  v20 = v9;
  v21 = v11;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __83__HKHealthStore__HKDaemonPreferences___setDaemonPreferenceValue_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E37E6B38;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HKHealthStore _serverProxyWithHandler:errorHandler:](self, "_serverProxyWithHandler:errorHandler:", v18, v16);

}

uint64_t __83__HKHealthStore__HKDaemonPreferences___setDaemonPreferenceValue_forKey_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDaemonPreferenceValue:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __83__HKHealthStore__HKDaemonPreferences___setDaemonPreferenceValue_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initWithListenerEndpoint:(uint64_t)a3 debugIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "HKHealthStore creation is blocked inside healthd", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_connectionQueue_setUpWithEndpoint:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a1, a3, "Could not establish connection with %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __69__HKHealthStore_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "FAILED recalibrate estimates request for %@ effective %@: %{public}@", (uint8_t *)&v5, 0x20u);
}

void __44__HKHealthStore_authorizationStatusForType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Failed to determine authorization status: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __79__HKHealthStore_requestPerObjectReadAuthorizationForType_predicate_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "FAILED authorization request to read %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __84__HKHealthStore_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
    v5 = "prompting";
  else
    v5 = "silent";
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 136315906;
  v12 = v5;
  v13 = 2112;
  v14 = v8;
  v15 = 2112;
  v16 = v9;
  v17 = 2112;
  v18 = v10;
  _os_log_error_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_ERROR, "FAILED %s authorization request to share %@, read %@, error %@", (uint8_t *)&v11, 0x2Au);

}

- (void)_validatePurposeStringsForSharingTypes:readingTypes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Failed to fetch entitlements when validating purpose strings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__HKHealthStore_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Failed to end delegate transaction: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __34__HKHealthStore__supportsFeature___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "Failed to determine availability of feature %lu with error: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __37__HKHealthStore_startWorkoutSession___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Failed to start workout session: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __35__HKHealthStore_endWorkoutSession___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Failed to end workout session: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "[mirroring] Failed to disable remote session observer with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__HKHealthStore_setWorkoutSessionMirroringStartHandler___block_invoke_377_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "[mirroring] Failed to set remote session observer with XPC error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_ratingOfExertionSamplesForWorkout:workoutActivity:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Failed to fetch entitlements: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59__HKHealthStore__closeTransactionWithTypes_anchor_ackTime___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "Failed to close observer query transaction: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __67__HKHealthStore_splitTotalEnergy_startDate_endDate_resultsHandler___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "connection error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __70__HKHealthStore_clientRemote_didCreateRemoteSessionWithConfiguration___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "[mirroring] Client received a new mirrored session but the handler is not set up.", v1, 2u);
  OUTLINED_FUNCTION_6();
}

void __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Error fetching demo data database preferences: %{public}@", a5, a6, a7, a8, 2u);
}

void __78__HKHealthStore__HKDaemonPreferences___shouldGenerateDemoDataPreferenceIsSet___block_invoke_28_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Error fetching demo data generation preferences: %{public}@", a5, a6, a7, a8, 2u);
}

@end
