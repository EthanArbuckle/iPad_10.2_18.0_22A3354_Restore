@implementation HMHomeManager

void __50__HMHomeManager_InstanceTracking__instanceTracker__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)instanceTracker_instanceTracker;
  instanceTracker_instanceTracker = v0;

}

- (void)fetchDevicesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMHomeManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMHomeManager *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager fetchDevicesWithCompletionHandler:]", CFSTR("completionHandler"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v27;
      v35 = 2112;
      v36 = v23;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v5 = v4;
  -[HMHomeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetching devices"));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v11;
    v35 = 2114;
    v36 = (uint64_t)v13;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching devices", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v14 = objc_alloc(MEMORY[0x1E0D285F8]);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](v9, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);
  v18 = (void *)objc_msgSend(v14, "initWithName:destination:payload:", CFSTR("HMHM.fetchDevices"), v17, 0);

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __51__HMHomeManager_fetchDevicesWithCompletionHandler___block_invoke;
  v29[3] = &unk_1E3AB4B08;
  v29[4] = v9;
  v30 = v7;
  v31 = v6;
  v32 = v5;
  v19 = v5;
  v20 = v6;
  v21 = v7;
  objc_msgSend(v18, "setResponseHandler:", v29);
  objc_msgSend(v20, "messageDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sendMessage:", v18);

}

void __24__HMHomeManager___start__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  os_unfair_lock_s *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  os_unfair_lock_s *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  os_unfair_lock_s *v20;
  NSObject *v21;
  void *v22;
  id *v23;
  id *v24;
  void *v25;
  id *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  id location;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  int v35;
  _BYTE v36[24];
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a2)
    v3 = 5;
  else
    v3 = 1;
  v4 = *(id *)(a1 + 32);
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if (*((_QWORD *)v4 + 13) == v3)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
      WeakRetained = 0;
    }
    else
    {
      *((_QWORD *)v4 + 13) = v3;
      WeakRetained = objc_loadWeakRetained((id *)v4 + 12);
      os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "context");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "delegateCaller");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v36 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v36[8] = 3221225472;
        *(_QWORD *)&v36[16] = ____HMHomeManagerSetAuthorizationStatus_block_invoke;
        v37 = &unk_1E3AB5C80;
        WeakRetained = WeakRetained;
        v38 = WeakRetained;
        v39 = v4;
        v40 = v3;
        objc_msgSend(v7, "invokeBlock:", v36);

      }
    }

  }
  v8 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  if (-[os_unfair_lock_s serverGenerationCounterToken](v8, "serverGenerationCounterToken") != -1)
    goto LABEL_11;
  *(_DWORD *)buf = 0;
  -[os_unfair_lock_s darwinNotificationProvider](v8, "darwinNotificationProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "notifyRegisterCheck:outToken:", "com.apple.HomeKit.generation-counter-updated", buf);

  if (!v18)
  {
    -[os_unfair_lock_s setServerGenerationCounterToken:](v8, "setServerGenerationCounterToken:", *(unsigned int *)buf);
LABEL_11:
    if ((-[os_unfair_lock_s shouldConnect](v8, "shouldConnect") & 1) == 0
      && -[os_unfair_lock_s serverGenerationCounterDelayedConnectionToken](v8, "serverGenerationCounterDelayedConnectionToken") == -1)
    {
      objc_initWeak(&location, v8);
      v30 = 0;
      -[os_unfair_lock_s darwinNotificationProvider](v8, "darwinNotificationProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_unfair_lock_s context](v8, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "queue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v36 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v36[8] = 3221225472;
      *(_QWORD *)&v36[16] = ____HMHomeManagerRegisterForGenerationCounterNotifications_block_invoke;
      v37 = &unk_1E3AB43D0;
      objc_copyWeak(&v38, &location);
      v12 = objc_msgSend(v9, "notifyRegisterDispatch:outToken:queue:handler:", "com.apple.HomeKit.generation-counter-updated", &v30, v11, v36);

      if (v12)
      {
        v13 = (void *)MEMORY[0x1A1AC1AAC]();
        v14 = v8;
        HMFGetOSLogHandle();
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v16;
          v34 = 1024;
          v35 = v12;
          _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for generation counter change notifications: %d", buf, 0x12u);

        }
        objc_autoreleasePoolPop(v13);
      }
      else
      {
        -[os_unfair_lock_s setServerGenerationCounterDelayedConnectionToken:](v8, "setServerGenerationCounterDelayedConnectionToken:", v30);
      }
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
    goto LABEL_24;
  }
  v19 = (void *)MEMORY[0x1A1AC1AAC]();
  v20 = v8;
  HMFGetOSLogHandle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v36 = 138543618;
    *(_QWORD *)&v36[4] = v22;
    *(_WORD *)&v36[12] = 1024;
    *(_DWORD *)&v36[14] = v18;
    _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for generation counter state: %d", v36, 0x12u);

  }
  objc_autoreleasePoolPop(v19);
LABEL_24:
  os_unfair_lock_unlock(v8 + 2);

  v23 = (id *)*(id *)(a1 + 32);
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "_registerNotificationHandlers");
    objc_initWeak((id *)buf, v24);
    objc_msgSend(v24[39], "xpcClient");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v36 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v36[8] = 3221225472;
    *(_QWORD *)&v36[16] = ____HMHomeManagerRegisterForNotifications_block_invoke;
    v37 = &unk_1E3AB61D0;
    objc_copyWeak(&v38, (id *)buf);
    objc_msgSend(v25, "registerReconnectionHandler:", v36);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }

  v27 = *(void **)(a1 + 32);
  v26 = (id *)(a1 + 32);
  objc_msgSend(v27, "_fetchHomeConfigurationWithRefreshRequested:", 0);
  objc_msgSend(*v26, "xpcEventRouterClient");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "configure");

  objc_msgSend(*v26, "predictionProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "configure");

}

- (void)_fetchHomeConfigurationWithRefreshRequested:(BOOL)a3
{
  void *v5;
  HMHomeManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_qos_class_t v11;
  id v12;
  dispatch_block_t v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((-[HMHomeManager authorizationStatus](self, "authorizationStatus") & 4) != 0)
  {
    -[HMHomeManager context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch home configuration"));
    objc_initWeak((id *)buf, self);
    determineFetchConfigurationQoS();
    v11 = HMFQOSClassFromQualityOfService();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HMHomeManager__fetchHomeConfigurationWithRefreshRequested___block_invoke;
    block[3] = &unk_1E3AB2250;
    objc_copyWeak(&v17, (id *)buf);
    v12 = v10;
    v16 = v12;
    v18 = a3;
    v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, block);
    objc_msgSend(v9, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v14, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      v21 = 2048;
      v22 = -[HMHomeManager authorizationStatus](v6, "authorizationStatus");
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@This client cannot access home data with current authorization status: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (void)setServerGenerationCounterToken:(int)a3
{
  self->_serverGenerationCounterToken = a3;
}

- (id)eventRouter
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  HMELastEventStore *lastEventStore;
  void *v8;
  HMHomeManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_eventStoreStarted)
  {
    lastEventStore = self->_lastEventStore;
    if (lastEventStore)
    {
      if (-[HMELastEventStore startup](lastEventStore, "startup"))
      {
        self->_eventStoreStarted = 1;
      }
      else
      {
        v8 = (void *)MEMORY[0x1A1AC1AAC]();
        v9 = self;
        HMFGetOSLogHandle();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138543362;
          v13 = v11;
          _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error starting event store!", (uint8_t *)&v12, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  -[HMHomeManager xpcEventRouterClient](self, "xpcEventRouterClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventRouter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMXPCEventRouterClient)xpcEventRouterClient
{
  return self->_xpcEventRouterClient;
}

- (void)_registerNotificationHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[HMHomeManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("kCurrentHomeChangedNotificationKey"), self, sel__handleCurrentHomeChangedNotification_);

  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:selector:", CFSTR("kHomesDidUpdateNotificationKey"), self, sel__handleHomesDidUpdateNotification_);

  -[HMHomeManager context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:selector:", CFSTR("kMetadataChangedNotificationKey"), self, sel__handleMetadataUpdatedNotification_);

  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:selector:", CFSTR("kUserInvitationsUpdatedNotificationKey"), self, sel__handleUserInvitationsUpdatedNotification_);

  -[HMHomeManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerForMessage:receiver:selector:", CFSTR("kResidentDeviceCapableUpdatedNotificationKey"), self, sel__handleResidentDeviceCapableUpdatedNotification_);

  -[HMHomeManager context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerForMessage:receiver:selector:", CFSTR("kResidentEnabledForThisDeviceUpdatedNotificationKey"), self, sel__handleResidentEnabledForThisDeviceUpdatedNotification_);

  -[HMHomeManager context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerForMessage:receiver:selector:", CFSTR("HMHM.devicesUpdated"), self, sel__handleDevicesUpdatedMessage_);

  -[HMHomeManager context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerForMessage:receiver:selector:", CFSTR("HM.su"), self, sel__handleStatusUpdated_);

  -[HMHomeManager context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerForMessage:receiver:selector:", CFSTR("kResidentProvisioningStatusChangedNotificationKey"), self, sel__handleResidentProvisioningStatusChanged_);

  -[HMHomeManager context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "messageDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerForMessage:receiver:selector:", CFSTR("HMHM.rtsun"), self, sel__handleRuntimeStateUpdateNotification_);

  -[HMHomeManager context](self, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerForMessage:receiver:selector:", CFSTR("HMHM.accessAllowedWhenLockedUpdatedNotificationKey"), self, sel__handleAccessAllowedWhenLockedUpdatedNotification_);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", self, sel_handleDaemonReconnectedNotification_, CFSTR("HMDaemonReconnectedNotification"), 0);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t305 != -1)
    dispatch_once(&logCategory__hmf_once_t305, &__block_literal_global_674);
  return (id)logCategory__hmf_once_v306;
}

- (HMSoftwareUpdateDocumentationManager)softwareUpdateDocumentationManager
{
  return self->_softwareUpdateDocumentationManager;
}

- (HMUserActionPredictionProvider)predictionProvider
{
  return (HMUserActionPredictionProvider *)objc_getProperty(self, a2, 360, 1);
}

- (BOOL)_isValidCachedHomeConfiguration:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  HMHomeManager *v16;
  NSObject *v17;
  void *v18;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_isValidCachedHomeConfiguration__onceToken != -1)
    dispatch_once(&_isValidCachedHomeConfiguration__onceToken, &__block_literal_global_575);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (id)_isValidCachedHomeConfiguration__requiredKeys;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10, (_QWORD)v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v15 = (void *)MEMORY[0x1A1AC1AAC]();
          v16 = self;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v29 = v18;
            v30 = 2112;
            v31 = v10;
            _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Cached home configuration does not contain required key '%@' - discarding cache", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);

          goto LABEL_16;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v7)
        continue;
      break;
    }
  }

  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("kHomeDataKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = 1;
  }
  else
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v23;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Cached home configuration contains zero length Home Data - discarding cache", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
LABEL_16:
    v14 = 0;
  }

  return v14;
}

- (void)_handleRuntimeStateUpdatePayload:(id)a3 reason:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  objc_msgSend(CFSTR("HomeManager-"), "stringByAppendingString:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager notifyDelegateOfBatchNotificationsStartWithReason:](self, "notifyDelegateOfBatchNotificationsStartWithReason:");
  -[HMHomeManager __handleHomeManagerState:](self, "__handleHomeManagerState:", v6);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
        -[HMHomeManager _homeWithUUID:](self, "_homeWithUUID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hmf_dictionaryForKey:", v12);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (!v17)
          objc_msgSend(v14, "handleRuntimeStateUpdate:reason:", v15, v19);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[HMHomeManager notifyDelegateOfBatchNotificationsEndWithReason:](self, "notifyDelegateOfBatchNotificationsEndWithReason:", v18);
}

- (void)_updateCurrentHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMHomeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  HMHomeManager *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager _homeWithUUID:](self, "_homeWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager setCurrentHome:](self, "setCurrentHome:", v5);

  -[HMHomeManager _privateDelegate](self, "_privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager currentHome](v8, "currentHome");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated current home: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMHomeManager context](v8, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__HMHomeManager__updateCurrentHome___block_invoke;
    v14[3] = &unk_1E3AB5ED8;
    v15 = v6;
    v16 = v8;
    objc_msgSend(v13, "invokeBlock:", v14);

  }
}

- (HMHome)currentHome
{
  os_unfair_lock_s *p_lock;
  HMHome *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_currentHome;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_privateDelegate
{
  void *v2;
  id v3;

  -[HMHomeManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE459AD0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return WeakRetained;
}

- (void)setCurrentHome:(id)a3
{
  id v5;
  void *v6;
  HMHomeManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  HMHomeManager *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_currentHome, a3);
  os_unfair_lock_unlock(&self->_lock);
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2112;
    v13 = v5;
    v14 = 2048;
    v15 = v7;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Set current home to: %@ with self: %p", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v6);

}

- (HMAccessory)currentAccessory
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMHomeManager homes](self, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v7, "accessories", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
              if ((objc_msgSend(v13, "isCurrentAccessory") & 1) != 0)
              {
                v14 = v13;

                goto LABEL_19;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 = 0;
    }
    while (v4);
  }
  else
  {
    v14 = 0;
  }
LABEL_19:

  return (HMAccessory *)v14;
}

- (id)_homeWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMHomeManager currentHomes](self, "currentHomes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstItemWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)homes
{
  void *v2;
  void *v3;

  -[HMHomeManager currentHomes](self, "currentHomes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (HMMutableArray)currentHomes
{
  return self->_currentHomes;
}

- (NSArray)incomingHomeInvitations
{
  void *v2;
  void *v3;

  -[HMHomeManager homeInvitations](self, "homeInvitations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (HMMutableArray)homeInvitations
{
  return self->_homeInvitations;
}

- (void)__handleHomeManagerState:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  HMHomeManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v5 = objc_msgSend(v4, "hmf_BOOLForKey:isPresent:", CFSTR("kResidentCapableDeviceKey"), &v18);
  if (v18)
  {
    v6 = v5;
    if ((_DWORD)v5 != -[HMHomeManager isThisDeviceResidentCapable](self, "isThisDeviceResidentCapable"))
    {
      -[HMHomeManager setThisDeviceResidentCapable:](self, "setThisDeviceResidentCapable:", v6);
      -[HMHomeManager notifyResidentCapableUpdated:](self, "notifyResidentCapableUpdated:", v6);
    }
  }
  v18 = 0;
  v7 = objc_msgSend(v4, "hmf_BOOLForKey:isPresent:", CFSTR("kResidentEnabledKey"), &v18);
  if (v18)
  {
    v8 = v7;
    if ((_DWORD)v7 != -[HMHomeManager isResidentEnabledForThisDevice](self, "isResidentEnabledForThisDevice"))
    {
      -[HMHomeManager setResidentEnabledForThisDevice:](self, "setResidentEnabledForThisDevice:", v8);
      -[HMHomeManager notifyResidentEnabledUpdated:](self, "notifyResidentEnabledUpdated:", v8);
    }
  }
  v18 = 0;
  v9 = objc_msgSend(v4, "hmf_BOOLForKey:isPresent:", CFSTR("kAccessAllowedWhenLockedKey"), &v18);
  if (v18)
  {
    v10 = v9;
    if ((_DWORD)v9 != -[HMHomeManager isAccessAllowedWhenLocked](self, "isAccessAllowedWhenLocked"))
    {
      -[HMHomeManager setAccessAllowedWhenLocked:](self, "setAccessAllowedWhenLocked:", v10);
      -[HMHomeManager _notifyAccessAllowedWhenLockedUpdated:](self, "_notifyAccessAllowedWhenLockedUpdated:", v10);
    }
  }
  v18 = 0;
  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("kCurrentHomeUUIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (v12 = objc_msgSend(v4, "hmf_BOOLForKey:isPresent:", CFSTR("kNoCurrentHomeKey"), &v18), v18) && v12)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC](-[HMHomeManager _updateCurrentHome:](self, "_updateCurrentHome:", v11));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager currentHome](v14, "currentHome");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Updated current home: %@ due to home manager state", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (BOOL)isThisDeviceResidentCapable
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_thisDeviceResidentCapable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isResidentEnabledForThisDevice
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_residentEnabledForThisDevice;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAccessAllowedWhenLocked
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_accessAllowedWhenLocked;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_updateAppData:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMHomeManager setApplicationData:](self, "setApplicationData:", a3);
  -[HMHomeManager context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMHomeManager__updateAppData___block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)setApplicationData:(id)a3
{
  HMApplicationData *v4;
  HMApplicationData *applicationData;

  v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_setInitialHomes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id WeakRetained;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  HMHomeManager *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager setPrimaryHome:](self, "setPrimaryHome:", 0);
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  v36 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[HMHomeManager context](self, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "__configureWithContext:homeManager:", v11, self);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v7);
  }

  -[HMHomeManager currentHomes](self, "currentHomes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setArray:", v5);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v18, "postConfigure");
        if (objc_msgSend(v18, "isPrimary"))
          -[HMHomeManager setPrimaryHome:](self, "setPrimaryHome:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v15);
  }

  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_initialMergeComplete = 1;
  os_unfair_lock_unlock(&self->_lock);
  v20 = (void *)MEMORY[0x1A1AC1AAC]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v23;
    v42 = 2112;
    v43 = WeakRetained;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client did update homes for delegate: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "markWithReason:", CFSTR("Notifying delegate homes did update"));
    -[HMHomeManager context](v21, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "delegateCaller");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __34__HMHomeManager__setInitialHomes___block_invoke;
    v28[3] = &unk_1E3AB5CD0;
    v29 = WeakRetained;
    v30 = v21;
    v31 = v24;
    v27 = v24;
    objc_msgSend(v26, "invokeBlock:", v28);

  }
}

- (void)setPrimaryHome:(id)a3
{
  HMHome *v4;
  HMHome *primaryHome;

  v4 = (HMHome *)a3;
  os_unfair_lock_lock_with_options();
  primaryHome = self->_primaryHome;
  self->_primaryHome = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)notifyDelegateOfBatchNotificationsEndWithReason:(id)a3
{
  id v4;
  HMFTimer *batchNotificationEndTimer;
  void *v6;
  HMHomeManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  HMHomeManager *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSCountedSet removeObject:](self->_batchNotificationReasons, "removeObject:", v4);
  if (-[NSCountedSet count](self->_batchNotificationReasons, "count")
    || (batchNotificationEndTimer = self->_batchNotificationEndTimer) == 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    -[HMFTimer suspend](batchNotificationEndTimer, "suspend");
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling batch notification end: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMHomeManager delegate](v7, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[HMHomeManager delegate](v7, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EE459AD0))
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      -[HMHomeManager context](v7, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __65__HMHomeManager_notifyDelegateOfBatchNotificationsEndWithReason___block_invoke;
      v18[3] = &unk_1E3AB5ED8;
      v19 = v14;
      v20 = v7;
      v17 = v14;
      objc_msgSend(v16, "invokeBlock:", v18);

    }
  }

}

uint64_t __34__HMHomeManager__setInitialHomes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "homeManagerDidUpdateHomes:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "markWithReason:", CFSTR("Notified delegate homes did update"));
}

uint64_t __29__HMHomeManager_setDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidUpdateHomes:", *(_QWORD *)(a1 + 40));
}

- (void)setAccessAllowedWhenLocked:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_accessAllowedWhenLocked = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyAccessAllowedWhenLockedUpdated:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  -[HMHomeManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE459AD0))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMHomeManager context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__HMHomeManager__notifyAccessAllowedWhenLockedUpdated___block_invoke;
    v10[3] = &unk_1E3AB57F8;
    v10[4] = self;
    v12 = a3;
    v11 = v7;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

uint64_t __67__HMHomeManager_notifyDelegateOfBatchNotificationsStartWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerWillStartBatchNotifications:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__HMHomeManager_notifyDelegateOfBatchNotificationsEndWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidEndBatchNotifications:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__HMHomeManager__updateCurrentHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidUpdateCurrentHome:", *(_QWORD *)(a1 + 40));
}

- (void)setDelegate:(id)delegate
{
  id v4;
  void *v5;
  HMHomeManager *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  _BOOL4 initialMergeComplete;
  void *v11;
  HMHomeManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  HMHomeManager *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = delegate;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v8;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting HMHomeManager delegate to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);

  if (WeakRetained == v4)
  {
    os_unfair_lock_unlock(&v6->_lock);
  }
  else
  {
    objc_storeWeak((id *)&v6->_delegate, v4);
    initialMergeComplete = v6->_initialMergeComplete;
    os_unfair_lock_unlock(&v6->_lock);
    if (initialMergeComplete)
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = v6;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        v22 = 2112;
        v23 = v4;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client did update homes for delegate: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMHomeManager context](v12, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "delegateCaller");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __29__HMHomeManager_setDelegate___block_invoke;
        v17[3] = &unk_1E3AB5ED8;
        v18 = v4;
        v19 = v12;
        objc_msgSend(v16, "invokeBlock:", v17);

      }
    }
  }

}

void __24__HMHomeManager___start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "privacySettingsProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__HMHomeManager___start__block_invoke_2;
  v5[3] = &unk_1E3AB22C8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "requestHomeKitAccessWithQueue:completion:", v4, v5);

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMHomeManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMHomeManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_HMContext)context
{
  return self->_context;
}

- (id)createAccessorySettingsDataSource
{
  void *v3;
  HMHomeManager *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMAccessorySettingsDataSource *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMAccessorySettingsDataSource *v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating accessory settings data source", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMHomeManager accessorySettingsMetricsDispatcher](v4, "accessorySettingsMetricsDispatcher");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    _HMFPreconditionFailure();
  v8 = (void *)v7;
  v9 = [HMAccessorySettingsDataSource alloc];
  -[HMHomeManager context](v4, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMLocalization sharedManager](HMLocalization, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager eventRouter](v4, "eventRouter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager lastEventStore](v4, "lastEventStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager lastEventStore](v4, "lastEventStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMAccessorySettingsDataSource initWithContext:localizationManager:messengerFactory:subscriptionProvider:lastEventStoreReadHandle:lastEventStoreWriteHandle:metricsDispatcher:](v9, "initWithContext:localizationManager:messengerFactory:subscriptionProvider:lastEventStoreReadHandle:lastEventStoreWriteHandle:metricsDispatcher:", v10, v11, v4, v12, v13, v14, v8);

  -[HMAccessorySettingsDataSource setDataSource:](v15, "setDataSource:", v4);
  return v15;
}

- (HMELastEventStore)lastEventStore
{
  os_unfair_lock_s *p_lock;
  HMELastEventStore *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lastEventStore;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMAccessorySettingsMetricsDispatcher)accessorySettingsMetricsDispatcher
{
  return (HMAccessorySettingsMetricsDispatcher *)objc_getProperty(self, a2, 280, 1);
}

- (HMApplicationData)applicationData
{
  os_unfair_lock_s *p_lock;
  HMApplicationData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

uint64_t __32__HMHomeManager__updateAppData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfAppDataUpdate");
}

void __51__HMHomeManager_fetchDevicesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMHM.devices"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v13;
      v26 = 2114;
      v27 = v15;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched devices: %@", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 56);
    v19 = v8;
    v20 = 0;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v21;
      v26 = 2114;
      v27 = v23;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch devices: %@", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 56);
    v19 = 0;
    v20 = v5;
  }
  objc_msgSend(v16, "callCompletion:obj:error:", v18, v19, v20);

}

- (void)_determineCacheFiles
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  HMHomeManager *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  HMHomeManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  HMHomeManager *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  HMHomeManager *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  HMHomeManager *v50;
  NSObject *v51;
  void *v52;
  HMHomeManager *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  HMHomeManager *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  HMHomeManager *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *contextb;
  void *context;
  void *contexta;
  HMHomeManager *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  id v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  -[HMHomeManager homeCacheDir](self, "homeCacheDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHomeManager homeCacheDir](self, "homeCacheDir");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager homeCacheDir](self, "homeCacheDir");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0;
      v9 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v79);
      v10 = v79;

      if ((v9 & 1) == 0)
      {
        v61 = (void *)MEMORY[0x1A1AC1AAC]();
        v62 = self;
        HMFGetOSLogHandle();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMHomeManager homeCacheDir](v62, "homeCacheDir");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v81 = v64;
          v82 = 2112;
          v83 = v65;
          v84 = 2112;
          v85 = (uint64_t)v10;
          _os_log_impl(&dword_19B1B0000, v63, OS_LOG_TYPE_ERROR, "%{public}@Unable to create directory %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v61);
LABEL_43:

        return;
      }

    }
    -[HMHomeManager homeCacheDir](self, "homeCacheDir");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v11, &v78);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v78;

    if (v12)
    {
      v67 = v10;
      v68 = v4;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v66 = v12;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
      if (!v14)
        goto LABEL_35;
      v15 = v14;
      v16 = self;
      v17 = *(_QWORD *)v75;
      v72 = self;
      v73 = v13;
      while (1)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v75 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("."));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("config"));

          if (v22)
          {
            objc_msgSend(v20, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("homeData"));

            if (v24)
            {
              if ((unint64_t)objc_msgSend(v20, "count") < 4)
                goto LABEL_33;
              objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)MEMORY[0x1E0CB3940];
              -[HMHomeManager configuration](v16, "configuration");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v27, "options"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v25, "isEqualToString:", v28);

              if (v29)
              {
                objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "integerValue");
                -[HMHomeManager homeCacheDir](v16, "homeCacheDir");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "stringByAppendingPathComponent:", v19);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (v31 == 4)
                {
                  -[HMHomeManager setHomeDataCache:](v16, "setHomeDataCache:", v33);

                  v34 = (void *)MEMORY[0x1A1AC1AAC]();
                  v35 = v16;
                  HMFGetOSLogHandle();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
                    HMFGetLogIdentifier();
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMHomeManager homeDataCache](v35, "homeDataCache");
                    contextb = v34;
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v81 = v37;
                    v82 = 2112;
                    v83 = v38;
                    _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Determined home data cache file: %@", buf, 0x16u);

                    v34 = contextb;
                    v16 = v72;
                  }

                  objc_autoreleasePoolPop(v34);
                }
                else
                {

                  context = (void *)MEMORY[0x1A1AC1AAC]();
                  v50 = v16;
                  HMFGetOSLogHandle();
                  v51 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v81 = v52;
                    v82 = 2112;
                    v83 = v30;
                    v84 = 2048;
                    v85 = 4;
                    v86 = 2112;
                    v87 = v33;
                    _os_log_impl(&dword_19B1B0000, v51, OS_LOG_TYPE_INFO, "%{public}@Removing home data cache file with version %@ not equal to current version %ld: %@", buf, 0x2Au);

                    v16 = v72;
                  }

                  objc_autoreleasePoolPop(context);
                  -[HMHomeManager _removeCacheFileAtPath:](v50, "_removeCacheFileAtPath:", v33);

                }
              }
              goto LABEL_32;
            }
            objc_msgSend(v20, "firstObject");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("metadata"));

            if (v40 && (unint64_t)objc_msgSend(v20, "count") >= 3)
            {
              objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v16;
              v42 = objc_msgSend(v25, "integerValue");
              -[HMHomeManager homeCacheDir](v41, "homeCacheDir");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "stringByAppendingPathComponent:", v19);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (v42 == 4)
              {
                -[HMHomeManager setMetadataCache:](v41, "setMetadataCache:", v44);

                v45 = (void *)MEMORY[0x1A1AC1AAC]();
                v46 = v41;
                HMFGetOSLogHandle();
                v47 = objc_claimAutoreleasedReturnValue();
                v16 = v41;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMHomeManager metadataCache](v46, "metadataCache");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v81 = v48;
                  v82 = 2112;
                  v83 = v49;
                  _os_log_impl(&dword_19B1B0000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Determined metadata cache file: %@", buf, 0x16u);

                  v16 = v72;
                }

                objc_autoreleasePoolPop(v45);
              }
              else
              {

                contexta = (void *)MEMORY[0x1A1AC1AAC]();
                v53 = v41;
                HMFGetOSLogHandle();
                v54 = objc_claimAutoreleasedReturnValue();
                v16 = v41;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v81 = v55;
                  v82 = 2112;
                  v83 = v25;
                  v84 = 2048;
                  v85 = 4;
                  v86 = 2112;
                  v87 = v44;
                  _os_log_impl(&dword_19B1B0000, v54, OS_LOG_TYPE_INFO, "%{public}@Removing metadata cache file with version %@ not equal to current version %ld: %@", buf, 0x2Au);

                  v16 = v72;
                }

                objc_autoreleasePoolPop(contexta);
                -[HMHomeManager _removeCacheFileAtPath:](v53, "_removeCacheFileAtPath:", v44);

              }
LABEL_32:
              v13 = v73;

            }
          }
LABEL_33:

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
        if (!v15)
        {
LABEL_35:

          v10 = v67;
          v4 = v68;
          v12 = v66;
          goto LABEL_39;
        }
      }
    }
    v56 = (void *)MEMORY[0x1A1AC1AAC]();
    v57 = self;
    HMFGetOSLogHandle();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager homeCacheDir](v57, "homeCacheDir");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v81 = v59;
      v82 = 2112;
      v83 = v60;
      v84 = 2112;
      v85 = (uint64_t)v10;
      _os_log_impl(&dword_19B1B0000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to enumerate the contents of cache directory %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v56);
LABEL_39:

    goto LABEL_43;
  }
}

- (NSString)homeCacheDir
{
  void *v2;
  void *v3;
  void *v4;

  -[HMHomeManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)__start
{
  void *v3;
  HMHomeManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMHomeManager *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id *v21;
  NSObject *v22;
  void *v23;
  id *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  id *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  int v44;
  void *v45;
  id v46;
  void *v47;
  id *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  id *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id *v58;
  NSObject *v59;
  void *v60;
  const char *v61;
  void *v62;
  id *v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  id *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  id *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  int v81;
  void *v82;
  id *v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  int v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  id *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id *v112;
  NSObject *v113;
  void *v114;
  uint64_t v115;
  id *v116;
  NSObject *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  id *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  id *v132;
  NSObject *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  NSObject *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *context;
  void *contextb;
  void *contextc;
  void *contexta;
  void *contextd;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  _QWORD block[5];
  unsigned __int8 v160;
  id v161;
  uint8_t v162[4];
  void *v163;
  __int16 v164;
  id v165;
  __int16 v166;
  void *v167;
  _BYTE buf[24];
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHomeManager configuration](v4, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting home manager with configuration: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMUserCloudShareManager configure](v4->_userCloudShareManager, "configure");
  -[HMHomeManager accessorySetupCoordinator](v4, "accessorySetupCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configure");

  -[HMHomeManager privacySettingsProvider](v4, "privacySettingsProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_authorizationStatus = objc_msgSend(v9, "queryAuthorizationStatus");

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = v4;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMHomeManager authorizationStatus](v11, "authorizationStatus");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Queried initial authorization status: %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = v11;
  if ((objc_msgSend(v16, "authorizationStatus") & 5) != 0)
  {
    objc_msgSend(v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "canUseCache");

    if ((v18 & 1) != 0)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Home Manager Load"));
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = v16;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Loading from cache", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v21, "_determineCacheFiles");
      if ((objc_msgSend(v21, "options") & 0x9701) != 0)
      {
        objc_msgSend(v19, "markWithReason:", CFSTR("Starting metadata load"));
        v24 = v21;
        buf[0] = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "metadataCache");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "fileExistsAtPath:isDirectory:", v26, buf);
        v28 = buf[0];

        v29 = 0;
        if (v27 && !v28)
        {
          v143 = v15;
          v30 = (void *)MEMORY[0x1A1AC1AAC]();
          v31 = v24;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "metadataCache");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v34;
            _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_DEBUG, "%{public}@Loading metadata from cache file: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v30);
          v35 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(v31, "metadataCache");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "dataWithContentsOfFile:", v36);
          v37 = objc_claimAutoreleasedReturnValue();

          v38 = (void *)MEMORY[0x1E0C99E60];
          *(_QWORD *)buf = objc_opt_class();
          *(_QWORD *)&buf[8] = objc_opt_class();
          *(_QWORD *)&buf[16] = objc_opt_class();
          v169 = objc_opt_class();
          v170 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 5);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setWithArray:", v39);
          v40 = objc_claimAutoreleasedReturnValue();

          v161 = 0;
          context = (void *)v40;
          v154 = (void *)v37;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v40, v37, &v161);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v161;
          v150 = v42;
          if (v41)
          {
            v43 = v41;
            objc_opt_class();
            v44 = objc_opt_isKindOfClass() & 1;
            if (v44)
              v45 = v43;
            else
              v45 = 0;
            v46 = v45;

            if (v44)
            {
              objc_msgSend(v43, "hmf_numberForKey:", CFSTR("kHAPMetadataVersionKey"));
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "hmf_dataForKey:", CFSTR("kHAPMetadataDataKey"));
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (void *)MEMORY[0x1A1AC1AAC]();
              v48 = v31;
              HMFGetOSLogHandle();
              v49 = objc_claimAutoreleasedReturnValue();
              v15 = v143;
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v140 = v46;
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v162 = 138543618;
                v163 = v50;
                v164 = 2112;
                v165 = v156;
                _os_log_impl(&dword_19B1B0000, v49, OS_LOG_TYPE_INFO, "%{public}@Loading the cached metadata with version: %@", v162, 0x16u);

                v46 = v140;
              }

              objc_autoreleasePoolPop(v47);
              +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "applyProtoBufData:", v141);

              if (v52)
              {
                v53 = (void *)MEMORY[0x1A1AC1AAC]();
                v54 = v48;
                HMFGetOSLogHandle();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v140 = v46;
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v162 = 138543618;
                  v163 = v56;
                  v164 = 2112;
                  v165 = v156;
                  _os_log_impl(&dword_19B1B0000, v55, OS_LOG_TYPE_INFO, "%{public}@Successfully loaded the cached metadata with version: %@", v162, 0x16u);

                  v46 = v140;
                }

                objc_autoreleasePoolPop(v53);
                objc_msgSend(v54, "setMetadataVersion:", objc_msgSend(v156, "unsignedIntegerValue"));
              }

              v29 = v156;
            }
            else
            {
              v71 = (void *)MEMORY[0x1A1AC1AAC]();
              v72 = v31;
              HMFGetOSLogHandle();
              v73 = objc_claimAutoreleasedReturnValue();
              v15 = v143;
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v140 = v46;
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = (void *)objc_opt_class();
                *(_DWORD *)v162 = 138543618;
                v163 = v157;
                v164 = 2112;
                v165 = v74;
                v75 = v71;
                v76 = v74;
                _os_log_impl(&dword_19B1B0000, v73, OS_LOG_TYPE_ERROR, "%{public}@Cached metadata configuration is not a dictionary but of type %@", v162, 0x16u);

                v71 = v75;
                v46 = v140;
              }

              objc_autoreleasePoolPop(v71);
              v29 = 0;
            }

          }
          else
          {
            v66 = v42;
            v67 = (void *)MEMORY[0x1A1AC1AAC]();
            v68 = v31;
            HMFGetOSLogHandle();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v162 = 138543618;
              v163 = v70;
              v164 = 2112;
              v165 = v66;
              _os_log_impl(&dword_19B1B0000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cached metadata configuration from serialized metadata configuration: %@", v162, 0x16u);

            }
            objc_autoreleasePoolPop(v67);
            v29 = 0;
            v15 = v143;
          }

        }
        objc_msgSend(v19, "markWithReason:", CFSTR("Finished metadata load"));
      }
      else
      {
        v62 = (void *)MEMORY[0x1A1AC1AAC]();
        v63 = v21;
        HMFGetOSLogHandle();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v65;
          _os_log_impl(&dword_19B1B0000, v64, OS_LOG_TYPE_DEBUG, "%{public}@Not loading cached metadata because client has not requested access to HAP accessories", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v62);
        v29 = 0;
      }
      objc_msgSend(v19, "markWithReason:", CFSTR("Starting home load"), v140);
      objc_msgSend(v21, "homeDataCache");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v77)
      {
        v105 = (void *)MEMORY[0x1A1AC1AAC]();
        v106 = v21;
        HMFGetOSLogHandle();
        v107 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v108;
          _os_log_impl(&dword_19B1B0000, v107, OS_LOG_TYPE_DEBUG, "%{public}@Not loading from cache: no cache file found", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v105);
        goto LABEL_90;
      }
      v158 = v29;
      v160 = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "homeDataCache");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v78, "fileExistsAtPath:isDirectory:", v79, &v160);
      v81 = v160;

      v82 = (void *)MEMORY[0x1A1AC1AAC]();
      v83 = v21;
      HMFGetOSLogHandle();
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = v84;
      if (!v80 || v81)
      {
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "homeDataCache");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v109;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v110;
          _os_log_impl(&dword_19B1B0000, v85, OS_LOG_TYPE_DEBUG, "%{public}@Not loading from cache: no cache file exists at cache file: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v82);
        v29 = v158;
        goto LABEL_90;
      }
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "homeDataCache");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v86;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v87;
        _os_log_impl(&dword_19B1B0000, v85, OS_LOG_TYPE_INFO, "%{public}@Loading homes from cache file: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v82);
      v88 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v83, "homeDataCache");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "dataWithContentsOfFile:", v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v90)
      {
        v111 = (void *)MEMORY[0x1A1AC1AAC]();
        v112 = v83;
        HMFGetOSLogHandle();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v114;
          _os_log_impl(&dword_19B1B0000, v113, OS_LOG_TYPE_DEBUG, "%{public}@Not loading from cache: no serialized home data exists in cache", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v111);
        v29 = v158;
        goto LABEL_89;
      }
      v91 = (void *)MEMORY[0x1E0C99E60];
      *(_QWORD *)buf = objc_opt_class();
      *(_QWORD *)&buf[8] = objc_opt_class();
      *(_QWORD *)&buf[16] = objc_opt_class();
      v169 = objc_opt_class();
      v170 = objc_opt_class();
      v171 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 6);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setWithArray:", v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      v161 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v93, v90, &v161);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = v161;
      if (v94)
      {
        v95 = v94;
        objc_opt_class();
        v96 = objc_opt_isKindOfClass() & 1;
        if (v96)
          v97 = v95;
        else
          v97 = 0;
        v98 = v97;

        if (v96)
        {
          if ((objc_msgSend(v83, "_isValidCachedHomeConfiguration:", v95) & 1) != 0)
          {
            objc_msgSend(v95, "hmf_numberForKey:", CFSTR("kHAPMetadataVersionKey"));
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v151 = v99;
            if ((objc_msgSend(v83, "options") & 0x9701) != 0 && (!v158 || objc_msgSend(v99, "compare:", v158) == 1))
            {
              v100 = (void *)MEMORY[0x1A1AC1AAC]();
              v101 = v83;
              HMFGetOSLogHandle();
              v102 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                contextb = v100;
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v162 = 138543874;
                v163 = v103;
                v164 = 2112;
                v165 = v158;
                v166 = 2112;
                v167 = v151;
                _os_log_impl(&dword_19B1B0000, v102, OS_LOG_TYPE_ERROR, "%{public}@Metadata version %@ is lower than home data version: %@", v162, 0x20u);

                v100 = contextb;
              }

              objc_autoreleasePoolPop(v100);
              objc_msgSend(v101, "_removeCacheFiles");
              v104 = v151;
            }
            else
            {
              objc_msgSend(v95, "hmf_numberForKey:", CFSTR("kConfigGenerationCounterKey"));
              v131 = objc_claimAutoreleasedReturnValue();
              contexta = (void *)MEMORY[0x1A1AC1AAC]();
              v132 = v83;
              HMFGetOSLogHandle();
              v133 = objc_claimAutoreleasedReturnValue();
              v144 = (void *)v131;
              if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v134 = v93;
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v162 = 138543618;
                v163 = v135;
                v164 = 2112;
                v165 = v144;
                _os_log_impl(&dword_19B1B0000, v133, OS_LOG_TYPE_INFO, "%{public}@Loading the cached home with generation counter: %@", v162, 0x16u);

                v93 = v134;
                v131 = (uint64_t)v144;
              }

              objc_autoreleasePoolPop(contexta);
              v142 = (void *)MEMORY[0x1A1AC1AAC]();
              objc_msgSend(v132, "_loadHH2MigrationInfoFromHMCache:", v131);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              if (v136)
              {
                contextd = v93;
                v137 = (void *)objc_msgSend(v95, "mutableCopy");
                objc_msgSend(v137, "addEntriesFromDictionary:", v136);
                v138 = objc_msgSend(v137, "copy");

                v93 = contextd;
                v95 = (id)v138;
              }
              v104 = v151;
              objc_msgSend(v132, "_processHomeConfigurationResponse:refreshRequested:", v95, 0);

              objc_autoreleasePoolPop(v142);
            }

          }
          else
          {
            v126 = (void *)MEMORY[0x1A1AC1AAC]();
            v127 = v83;
            HMFGetOSLogHandle();
            v128 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v153 = v126;
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "shortDescription");
              contextc = v93;
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v162 = 138543618;
              v163 = v129;
              v164 = 2112;
              v165 = v130;
              _os_log_impl(&dword_19B1B0000, v128, OS_LOG_TYPE_ERROR, "%{public}@Cached home configuration is not valid; removing cache: %@",
                v162,
                0x16u);

              v93 = contextc;
              v126 = v153;
            }

            objc_autoreleasePoolPop(v126);
            objc_msgSend(v127, "_removeCacheFiles");
          }

          goto LABEL_88;
        }
        v120 = MEMORY[0x1A1AC1AAC]();
        v116 = v83;
        HMFGetOSLogHandle();
        v121 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v152 = v120;
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = (void *)objc_opt_class();
          *(_DWORD *)v162 = 138543618;
          v163 = v122;
          v164 = 2112;
          v165 = v123;
          v124 = v93;
          v125 = v123;
          _os_log_impl(&dword_19B1B0000, v121, OS_LOG_TYPE_ERROR, "%{public}@Cached home configuration is not a dictionary but of type %@", v162, 0x16u);

          v93 = v124;
          v120 = v152;
        }

        v119 = (void *)v120;
      }
      else
      {
        v115 = MEMORY[0x1A1AC1AAC]();
        v116 = v83;
        HMFGetOSLogHandle();
        v117 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v162 = 138543618;
          v163 = v118;
          v164 = 2112;
          v165 = v155;
          _os_log_impl(&dword_19B1B0000, v117, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cached home configuration from serialized home configuration data: %@", v162, 0x16u);

        }
        v119 = (void *)v115;
      }
      objc_autoreleasePoolPop(v119);
      objc_msgSend(v116, "_removeCacheFiles");
LABEL_88:
      v29 = v158;

LABEL_89:
LABEL_90:
      objc_msgSend(v19, "markWithReason:", CFSTR("Finished home load"));
      objc_msgSend(v19, "invalidate");

      goto LABEL_91;
    }
    v57 = (void *)MEMORY[0x1A1AC1AAC]();
    v58 = v16;
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v60;
      v61 = "%{public}@Not loading from cache: not supported by configuration";
      goto LABEL_30;
    }
  }
  else
  {
    v57 = (void *)MEMORY[0x1A1AC1AAC]();
    v58 = v16;
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v60;
      v61 = "%{public}@Not loading from cache: client is not authorized";
LABEL_30:
      _os_log_impl(&dword_19B1B0000, v59, OS_LOG_TYPE_DEBUG, v61, buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v57);
LABEL_91:

  objc_autoreleasePoolPop(v15);
  objc_msgSend(v16[39], "queue");
  v139 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__HMHomeManager___start__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = v16;
  dispatch_async(v139, block);

}

- (unint64_t)options
{
  void *v2;
  unint64_t v3;

  -[HMHomeManager configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "options");

  return v3;
}

- (HMHomeManagerConfiguration)configuration
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[HMHomeManagerConfiguration copy](self->_configuration, "copy");
  os_unfair_lock_unlock(p_lock);
  return (HMHomeManagerConfiguration *)v4;
}

- (NSString)homeDataCache
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (NSString)metadataCache
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (_HMPrivacySettingsProvider)privacySettingsProvider
{
  return self->_privacySettingsProvider;
}

- (HMHomeManagerAuthorizationStatus)authorizationStatus
{
  os_unfair_lock_s *p_lock;
  HMHomeManagerAuthorizationStatus authorizationStatus;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  authorizationStatus = self->_authorizationStatus;
  os_unfair_lock_unlock(p_lock);
  return authorizationStatus;
}

void __74__HMHomeManager___processSyncResponse_refreshRequested_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  int8x16_t v22;
  _QWORD block[4];
  int8x16_t v24;
  char v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", CFSTR("kProvisioningStatusKey"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &unk_1E3B2E5F0;
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 40), "_setResidentProvisioningStatus:", objc_msgSend(v5, "integerValue"));
  v6 = objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", CFSTR("kCanCacheHomeConfigurationKey"));
  objc_msgSend(*(id *)(a1 + 32), "hmf_dataForKey:", CFSTR("kHomeDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v6;
  else
    v8 = 0;
  v9 = objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", CFSTR("kCanCacheHomeConfigurationKey"));
  if ((objc_msgSend(*(id *)(a1 + 40), "options") & 0x9701) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("kHAPMetadataDataKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = v9;
    else
      v11 = 0;

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMHomeManagerOptionsToString(objc_msgSend(*(id *)(a1 + 40), "options"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Client has not requested access to HAP accessories (options %@) - not going to write synced metadata to cache", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", CFSTR("runtime-update")))
  {
    objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", CFSTR("options"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_requestRuntimeUpdate:", v17);

  }
  if ((v8 | v11) == 1)
  {
    objc_msgSend(*(id *)(a1 + 48), "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__HMHomeManager___processSyncResponse_refreshRequested_completionHandler___block_invoke_541;
    block[3] = &unk_1E3AB2278;
    v22 = *(int8x16_t *)(a1 + 32);
    v19 = (id)v22.i64[0];
    v24 = vextq_s8(v22, v22, 8uLL);
    v25 = v8;
    v26 = v11;
    dispatch_async(v18, block);

  }
  v20 = (void *)MEMORY[0x1A1AC1AAC]();
  objc_msgSend(*(id *)(a1 + 40), "_processHomeConfigurationResponse:refreshRequested:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
  objc_autoreleasePoolPop(v20);
  v21 = *(_QWORD *)(a1 + 56);
  if (v21)
    (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);

}

- (HMAccessorySetupCoordinator)accessorySetupCoordinator
{
  return (HMAccessorySetupCoordinator *)objc_getProperty(self, a2, 392, 1);
}

- (void)_setResidentProvisioningStatus:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_residentProvisioningStatus = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyDelegateOfBatchNotificationsStartWithReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HMFTimer *batchNotificationEndTimer;
  void (**v8)(_QWORD, _QWORD, double);
  HMFTimer *v9;
  HMFTimer *v10;
  HMFTimer *v11;
  void *v12;
  void *v13;
  HMHomeManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  HMHomeManager *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  v6 = -[NSCountedSet count](self->_batchNotificationReasons, "count");
  -[NSCountedSet addObject:](self->_batchNotificationReasons, "addObject:", v4);
  if (v6)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    batchNotificationEndTimer = self->_batchNotificationEndTimer;
    if (!batchNotificationEndTimer)
    {
      -[HMHomeManager timerFactory](self, "timerFactory");
      v8 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      v8[2](v8, 8, 10.0);
      v9 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
      v10 = self->_batchNotificationEndTimer;
      self->_batchNotificationEndTimer = v9;

      -[HMFTimer setDelegate:](self->_batchNotificationEndTimer, "setDelegate:", self);
      v11 = self->_batchNotificationEndTimer;
      objc_msgSend(v5, "queue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFTimer setDelegateQueue:](v11, "setDelegateQueue:", v12);

      batchNotificationEndTimer = self->_batchNotificationEndTimer;
    }
    -[HMFTimer resume](batchNotificationEndTimer, "resume");
    os_unfair_lock_unlock(&self->_lock);
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v16;
      v30 = 2112;
      v31 = v4;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Calling batch notification start: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMHomeManager delegate](v14, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[HMHomeManager delegate](v14, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EE459AD0))
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      -[HMHomeManager context](v14, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "delegateCaller");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __67__HMHomeManager_notifyDelegateOfBatchNotificationsStartWithReason___block_invoke;
      v25[3] = &unk_1E3AB5ED8;
      v26 = v21;
      v27 = v14;
      v24 = v21;
      objc_msgSend(v23, "invokeBlock:", v25);

    }
  }

}

id __39__HMHomeManager_initWithConfiguration___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", a3, a1);
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setMetadataCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void)setHomeDataCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (void)_requestRuntimeUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v20 = CFSTR("options");
    v21[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_alloc(MEMORY[0x1E0D285F8]);
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);
  v11 = (void *)objc_msgSend(v7, "initWithName:destination:payload:", CFSTR("HMHM.rtsur"), v10, v6);

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("HomeManager-%@%@"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__HMHomeManager__requestRuntimeUpdate___block_invoke;
  v18[3] = &unk_1E3AB6200;
  v18[4] = self;
  v19 = v15;
  v16 = v15;
  objc_msgSend(v11, "setResponseHandler:", v18);
  objc_msgSend(v5, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v11);

}

- (void)setStatus:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  HMHomeManager *v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v6 = os_unfair_lock_lock_with_options();
  v7 = !self->_initialMergeComplete;
  v8 = (void *)MEMORY[0x1A1AC1AAC](v6);
  v9 = self;
  HMFGetOSLogHandle();
  v10 = v7 | a3;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    HMHomeManagerStatusToString(v9->_status);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    HMHomeManagerStatusToString(v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating status from %@ -> %@ (initial merge complete: %@)", (uint8_t *)&v16, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  v9->_status = v10;
  os_unfair_lock_unlock(p_lock);
}

- (void)_processHomeConfigurationResponse:(id)a3 refreshRequested:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  char v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMHomeManager *v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMHomeManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  HMHomeManager *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  HMHomeManager *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  HMHomeManager *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  HMHomeManager *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSUUID *lastRemovedCurrentAccessoryUUID;
  NSUUID *v69;
  void *v70;
  HMHomeManager *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  NSArray *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  uint64_t v82;
  void *v83;
  void *v84;
  BOOL v85;
  void *v86;
  HMHomeManager *v87;
  NSObject *v88;
  void *v89;
  uint64_t v90;
  NSArray *sharedHomeUUIDsNotYetMigrated;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t k;
  uint64_t v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  id *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id *v107;
  NSObject *v108;
  void *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t m;
  void *v114;
  unint64_t v115;
  HMApplicationData *v116;
  void *v117;
  void *context;
  void *v119;
  id v120;
  os_unfair_lock_s *lock;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t (*v130)(uint64_t, uint64_t);
  void *v131;
  id obj;
  void *v133;
  void *v134;
  void *v135;
  HMHomeManager *v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[6];
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _QWORD block[5];
  id v152;
  _QWORD v153[4];
  id v154;
  id v155;
  HMHomeManager *v156;
  id v157;
  HMApplicationData *v158;
  id v159;
  _QWORD v160[5];
  id v161;
  id v162;
  id v163;
  id v164;
  HMApplicationData *v165;
  BOOL v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  id v171;
  _QWORD v172[4];
  id v173;
  HMHomeManager *v174;
  uint64_t *v175;
  _BYTE *v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  uint64_t (*v180)(uint64_t, uint64_t);
  void (*v181)(uint64_t);
  id v182;
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _QWORD v187[2];
  uint8_t v188[4];
  void *v189;
  __int16 v190;
  uint64_t v191;
  _BYTE buf[24];
  uint64_t (*v193)(uint64_t, uint64_t);
  __int128 v194;
  uint64_t v195;

  v4 = a4;
  v195 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Process home configuration"));
  v131 = v6;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kConfigGenerationCounterKey"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kHAPMetadataVersionKey"));
  v130 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_dataForKey:", CFSTR("kIdentifierSaltKey"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  if (v135)
    v7 = v130 == 0;
  else
    v7 = 1;
  v9 = !v7 && v129 != 0;
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v136 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v135;
      *(_WORD *)&buf[22] = 2112;
      v193 = v130;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Processing home configuration response with generation counter: %@ metadata version: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMHomeManager _handleHH2StateWithPayload:](v136, "_handleHH2StateWithPayload:", v131);
    -[HMHomeManager _handleHH2ManualMigrationEnabledStateWithPayload:](v136, "_handleHH2ManualMigrationEnabledStateWithPayload:", v131);
    -[HMHomeManager _handleHomeSafetySecurityEnabledStateWithPayload:](v136, "_handleHomeSafetySecurityEnabledStateWithPayload:", v131);
    -[HMHomeManager _handleHH2MigrationProgressStateWithPayload:](v136, "_handleHH2MigrationProgressStateWithPayload:", v131);
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_setIdentifierSalt:", v129);
    objc_msgSend(v131, "hmf_dataForKey:", CFSTR("HMHM.assistantIdentifier"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    if (v127 && objc_msgSend(MEMORY[0x1E0CB3A28], "hm_setAssistantIdentifierSalt:", v127))
    {
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = v136;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v127;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Assistant identifier salt changed to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      -[HMHomeManager _recomputeAssistantIdentifiers](v15, "_recomputeAssistantIdentifiers");
    }
    if ((-[HMHomeManager options](v136, "options") & 0x9701) != 0)
    {
      v18 = objc_msgSend(v130, "unsignedIntegerValue");
      if (v18 > -[HMHomeManager metadataVersion](v136, "metadataVersion"))
      {
        -[HMHomeManager setMetadataVersion:](v136, "setMetadataVersion:", objc_msgSend(v130, "unsignedIntegerValue"));
        objc_msgSend(v131, "hmf_dataForKey:", CFSTR("kHAPMetadataDataKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "applyProtoBufData:", v19);

        }
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = v136;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        HMHomeManagerOptionsToString(-[HMHomeManager options](v23, "options"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v26;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_INFO, "%{public}@Client has not requested access to HAP accessories (options %@) - dropping synced metadata", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }
    v27 = objc_msgSend(v135, "unsignedIntegerValue");
    if (v27 == -[HMHomeManager generationCounter](v136, "generationCounter"))
    {
      if (v4)
        -[HMHomeManager _requestRefresh](v136, "_requestRefresh");
    }
    else
    {
      context = (void *)MEMORY[0x1A1AC1AAC](-[HMHomeManager setGenerationCounter:](v136, "setGenerationCounter:", objc_msgSend(v135, "unsignedIntegerValue")));
      objc_msgSend(v131, "hmf_dataForKey:", CFSTR("kHomeDataKey"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "hmf_UUIDForKey:", CFSTR("kPrimaryHomeUUIDKey"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "hmf_UUIDForKey:", CFSTR("kCurrentHomeUUIDKey"));
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "hmf_UUIDForKey:", CFSTR("HMHM.lastRemovedCurrentAccessory"));
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      if (v125)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v193 = __Block_byref_object_copy__28182;
        *(_QWORD *)&v194 = __Block_byref_object_dispose__28183;
        *((_QWORD *)&v194 + 1) = 0;
        v177 = 0;
        v178 = &v177;
        v179 = 0x3032000000;
        v180 = __Block_byref_object_copy__28182;
        v181 = __Block_byref_object_dispose__28183;
        v182 = 0;
        v28 = (void *)MEMORY[0x1E0D28540];
        v172[0] = MEMORY[0x1E0C809B0];
        v172[1] = 3221225472;
        v172[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke;
        v172[3] = &unk_1E3AB22F0;
        v29 = v125;
        v175 = &v177;
        v176 = buf;
        v173 = v29;
        v174 = v136;
        v30 = objc_msgSend(v28, "activityWithName:block:", CFSTR("Unarchive homes"), v172);
        v31 = v178[5];
        if (v31)
        {
          v32 = (void *)MEMORY[0x1A1AC1AAC](v30);
          v33 = v136;
          HMFGetOSLogHandle();
          v34 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v178[5];
            *(_DWORD *)v188 = 138543618;
            v189 = v35;
            v190 = 2112;
            v191 = v36;
            _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize homes from home configuration data: %@", v188, 0x16u);

          }
          objc_autoreleasePoolPop(v32);
          v124 = 0;
        }
        else
        {
          v37 = *(id *)(*(_QWORD *)&buf[8] + 40);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v38 = v37;
          else
            v38 = 0;
          v124 = v38;

        }
        _Block_object_dispose(&v177, 8);

        _Block_object_dispose(buf, 8);
        if (v31)
        {

          objc_autoreleasePoolPop(context);
LABEL_122:

          goto LABEL_123;
        }
      }
      else
      {
        v124 = 0;
      }
      objc_msgSend(v131, "hmf_dataForKey:", CFSTR("kIncomingHomeInvitationsKey"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      if (v119)
      {
        v39 = (void *)MEMORY[0x1E0C99E60];
        v187[0] = objc_opt_class();
        v187[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setWithArray:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v171 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v41, v119, &v171);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v171;
        if (!v42)
        {
          v44 = (void *)MEMORY[0x1A1AC1AAC]();
          v45 = v136;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v47;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v43;
            _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive incoming home invitations from encoded invites data: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v44);
        }
        v169 = 0u;
        v170 = 0u;
        v167 = 0u;
        v168 = 0u;
        v120 = v42;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v48 = v120;
        else
          v48 = 0;
        v49 = v48;

        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v167, v186, 16);
        if (v50)
        {
          v51 = *(_QWORD *)v168;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v168 != v51)
                objc_enumerationMutation(v49);
              v53 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * i);
              -[HMHomeManager context](v136, "context");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "__configureWithContext:homeManager:", v54, v136);

            }
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v167, v186, 16);
          }
          while (v50);
        }

      }
      else
      {
        v120 = 0;
      }
      objc_msgSend(v131, "hmf_dictionaryForKey:", CFSTR("kAppDataInformationKey"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = -[HMApplicationData initWithContentsOfDictionary:]([HMApplicationData alloc], "initWithContentsOfDictionary:", v117);
      if (-[HMHomeManager isInitialMergeComplete](v136, "isInitialMergeComplete"))
      {
        if (-[HMHomeManager _shouldWeMergeLatestHomeGraphFromDaemonResponse:](v136, "_shouldWeMergeLatestHomeGraphFromDaemonResponse:", v131))
        {
          v55 = (void *)MEMORY[0x1E0D28540];
          v160[0] = MEMORY[0x1E0C809B0];
          v160[1] = 3221225472;
          v160[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_559;
          v160[3] = &unk_1E3AB2318;
          v160[4] = v136;
          v161 = v124;
          v162 = v122;
          v163 = v123;
          v164 = v120;
          v165 = v116;
          v166 = v4;
          objc_msgSend(v55, "activityWithName:block:", CFSTR("Merge homes"), v160);

        }
        else
        {
          v61 = (void *)MEMORY[0x1A1AC1AAC]();
          v62 = v136;
          HMFGetOSLogHandle();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            HMHomeManagerDataSyncStateToString(-[HMHomeManager _dataSyncStateFromPayload:](v62, "_dataSyncStateFromPayload:", v131));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v64;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v65;
            _os_log_impl(&dword_19B1B0000, v63, OS_LOG_TYPE_INFO, "%{public}@Skipping framework merge as data sync state is %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v61);
        }
      }
      else
      {
        v56 = (void *)MEMORY[0x1A1AC1AAC]();
        v57 = v136;
        HMFGetOSLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v59;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v124;
          _os_log_impl(&dword_19B1B0000, v58, OS_LOG_TYPE_INFO, "%{public}@Updating homes : %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v56);
        v60 = (void *)MEMORY[0x1E0D28540];
        v153[0] = MEMORY[0x1E0C809B0];
        v153[1] = 3221225472;
        v153[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_562;
        v153[3] = &unk_1E3AB2340;
        v154 = v124;
        v155 = v122;
        v156 = v57;
        v157 = v120;
        v158 = v116;
        v159 = v123;
        objc_msgSend(v60, "activityWithName:block:", CFSTR("Update homes"), v153);

      }
      -[HMHomeManager predictionProvider](v136, "predictionProvider");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "recalculatePredictions");

      -[HMHomeManager setGenerationCounterPostHomeGraphUpdate:](v136, "setGenerationCounterPostHomeGraphUpdate:", -[HMHomeManager generationCounter](v136, "generationCounter"));
      lock = &v136->_lock;
      os_unfair_lock_lock_with_options();
      if ((-[NSUUID hmf_isEqualToUUID:](v136->_lastRemovedCurrentAccessoryUUID, "hmf_isEqualToUUID:", v126) & 1) != 0)
      {
        os_unfair_lock_unlock(lock);
      }
      else
      {
        v67 = objc_msgSend(v126, "copy");
        lastRemovedCurrentAccessoryUUID = v136->_lastRemovedCurrentAccessoryUUID;
        v136->_lastRemovedCurrentAccessoryUUID = (NSUUID *)v67;

        v69 = v136->_lastRemovedCurrentAccessoryUUID;
        os_unfair_lock_unlock(lock);
        if (v69)
        {
          v70 = (void *)MEMORY[0x1A1AC1AAC]();
          v71 = v136;
          HMFGetOSLogHandle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMHomeManager lastRemovedCurrentAccessoryUUID](v71, "lastRemovedCurrentAccessoryUUID");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v73;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v74;
            _os_log_impl(&dword_19B1B0000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@Merged current accessory removal %@.", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v70);
          -[HMHomeManager _privateDelegate](v71, "_privateDelegate");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[HMHomeManager context](v71, "context");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "queue");
            v77 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_564;
            block[3] = &unk_1E3AB5ED8;
            block[4] = v71;
            v152 = v75;
            dispatch_async(v77, block);

          }
        }
      }
      objc_msgSend(v131, "hmf_arrayForKey:", CFSTR("HMHM.SharedHomeUUIDsNotYetMigrated"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v136->_sharedHomeUUIDsNotYetMigrated, "count"));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock_with_options();
      v149 = 0u;
      v150 = 0u;
      v147 = 0u;
      v148 = 0u;
      v78 = v136->_sharedHomeUUIDsNotYetMigrated;
      v79 = -[NSArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v147, v185, 16);
      if (v79)
      {
        v80 = *(_QWORD *)v148;
        do
        {
          for (j = 0; j != v79; ++j)
          {
            if (*(_QWORD *)v148 != v80)
              objc_enumerationMutation(v78);
            v82 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * j);
            v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v82);
            -[HMHomeManager _homeWithUUID:](v136, "_homeWithUUID:", v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();

            if (v82)
              v85 = v84 == 0;
            else
              v85 = 0;
            if (v85 && (objc_msgSend(v134, "containsObject:", v82) & 1) == 0)
            {
              v86 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v133, "addObject:", v82));
              v87 = v136;
              HMFGetOSLogHandle();
              v88 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v89;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v82;
                _os_log_impl(&dword_19B1B0000, v88, OS_LOG_TYPE_INFO, "%{public}@Home %@ has been removed permanently.", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v86);
            }

          }
          v79 = -[NSArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v147, v185, 16);
        }
        while (v79);
      }

      v90 = objc_msgSend(v134, "copy");
      sharedHomeUUIDsNotYetMigrated = v136->_sharedHomeUUIDsNotYetMigrated;
      v136->_sharedHomeUUIDsNotYetMigrated = (NSArray *)v90;

      os_unfair_lock_unlock(lock);
      if (objc_msgSend(v133, "count"))
      {
        -[HMHomeManager _privateDelegate](v136, "_privateDelegate");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v145 = 0u;
          v146 = 0u;
          v143 = 0u;
          v144 = 0u;
          obj = v133;
          v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v184, 16);
          if (v93)
          {
            v94 = *(_QWORD *)v144;
            do
            {
              for (k = 0; k != v93; ++k)
              {
                if (*(_QWORD *)v144 != v94)
                  objc_enumerationMutation(obj);
                v96 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * k);
                -[HMHomeManager context](v136, "context");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "queue");
                v98 = objc_claimAutoreleasedReturnValue();
                v141[0] = MEMORY[0x1E0C809B0];
                v141[1] = 3221225472;
                v141[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_566;
                v141[3] = &unk_1E3AB5CD0;
                v141[4] = v136;
                v141[5] = v96;
                v142 = v92;
                dispatch_async(v98, v141);

              }
              v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v184, 16);
            }
            while (v93);
          }

        }
      }

      objc_autoreleasePoolPop(context);
    }
    objc_msgSend(v131, "hmf_numberForKey:", CFSTR("status"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (void *)MEMORY[0x1A1AC1AAC]();
    v101 = v136;
    HMFGetOSLogHandle();
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      HMHomeManagerStatusToString(objc_msgSend(v99, "unsignedIntegerValue"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v103;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v104;
      _os_log_impl(&dword_19B1B0000, v102, OS_LOG_TYPE_DEFAULT, "%{public}@HomeManager status from daemon is %@ after fetch/merge. Marking framework merge completed", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v100);
    objc_msgSend(v101, "_updateStatusWithPayload:sourceIsFetch:", v131, 1);
    v105 = objc_msgSend(v101, "serverGenerationCounter");
    if (objc_msgSend(v135, "unsignedIntegerValue") == v105)
    {
      v106 = (void *)MEMORY[0x1A1AC1AAC]();
      v107 = v101;
      HMFGetOSLogHandle();
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v109;
        _os_log_impl(&dword_19B1B0000, v108, OS_LOG_TYPE_INFO, "%{public}@The framework is in sync", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v106);
    }
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v110 = v101[4];
    v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v137, v183, 16);
    if (v111)
    {
      v112 = *(_QWORD *)v138;
      do
      {
        for (m = 0; m != v111; ++m)
        {
          if (*(_QWORD *)v138 != v112)
            objc_enumerationMutation(v110);
          v114 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * m);
          v115 = objc_msgSend(v135, "unsignedIntegerValue");
          if (v115 >= objc_msgSend(v114, "generationCounter"))
            objc_msgSend(v114, "finish");
        }
        v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v137, v183, 16);
      }
      while (v111);
    }

    objc_msgSend(v101, "__handleHomeManagerState:", v131);
    objc_msgSend(v128, "invalidate");

    goto LABEL_122;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v135;
    *(_WORD *)&buf[22] = 2112;
    v193 = v130;
    LOWORD(v194) = 2112;
    *(_QWORD *)((char *)&v194 + 2) = v129;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot process home configuration response missing generation counter (%@) or metadata version (%@) or identifier salt (%@)", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
LABEL_123:

}

- (unint64_t)generationCounter
{
  return self->_generationCounter;
}

- (unint64_t)serverGenerationCounter
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  HMHomeManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMHomeManager *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  HMHomeManager *v22;
  NSObject *v23;
  void *v24;
  unsigned int v26;
  id location;
  _BYTE buf[12];
  __int16 v29;
  int v30;
  _BYTE v31[24];
  void *v32;
  id v33[2];

  v33[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = self;
  p_lock = &v2->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMHomeManager serverGenerationCounterToken](v2, "serverGenerationCounterToken") != -1)
  {
LABEL_2:
    if (!-[HMHomeManager shouldConnect](v2, "shouldConnect")
      && -[HMHomeManager serverGenerationCounterDelayedConnectionToken](v2, "serverGenerationCounterDelayedConnectionToken") == -1)
    {
      objc_initWeak(&location, v2);
      v26 = 0;
      -[HMHomeManager darwinNotificationProvider](v2, "darwinNotificationProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager context](v2, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "queue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v31 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v31[8] = 3221225472;
      *(_QWORD *)&v31[16] = ____HMHomeManagerRegisterForGenerationCounterNotifications_block_invoke;
      v32 = &unk_1E3AB43D0;
      objc_copyWeak(v33, &location);
      v7 = objc_msgSend(v4, "notifyRegisterDispatch:outToken:queue:handler:", "com.apple.HomeKit.generation-counter-updated", &v26, v6, v31);

      if (v7)
      {
        v8 = (void *)MEMORY[0x1A1AC1AAC]();
        v9 = v2;
        HMFGetOSLogHandle();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v11;
          v29 = 1024;
          v30 = v7;
          _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for generation counter change notifications: %d", buf, 0x12u);

        }
        objc_autoreleasePoolPop(v8);
      }
      else
      {
        -[HMHomeManager setServerGenerationCounterDelayedConnectionToken:](v2, "setServerGenerationCounterDelayedConnectionToken:", v26);
      }
      objc_destroyWeak(v33);
      objc_destroyWeak(&location);
    }
    goto LABEL_15;
  }
  *(_DWORD *)buf = 0;
  -[HMHomeManager darwinNotificationProvider](v2, "darwinNotificationProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "notifyRegisterCheck:outToken:", "com.apple.HomeKit.generation-counter-updated", buf);

  if (!v13)
  {
    -[HMHomeManager setServerGenerationCounterToken:](v2, "setServerGenerationCounterToken:", *(unsigned int *)buf);
    goto LABEL_2;
  }
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = v2;
  HMFGetOSLogHandle();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v31 = 138543618;
    *(_QWORD *)&v31[4] = v17;
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = v13;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for generation counter state: %d", v31, 0x12u);

  }
  objc_autoreleasePoolPop(v14);
LABEL_15:
  os_unfair_lock_unlock(p_lock);

  os_unfair_lock_lock_with_options();
  v18 = -[HMHomeManager serverGenerationCounterToken](v2, "serverGenerationCounterToken");
  os_unfair_lock_unlock(p_lock);
  *(_QWORD *)buf = 0;
  -[HMHomeManager darwinNotificationProvider](v2, "darwinNotificationProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "notifyGetState:state:", v18, buf);

  if (!v20)
    return *(_QWORD *)buf;
  v21 = (void *)MEMORY[0x1A1AC1AAC]();
  v22 = v2;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v31 = 138543618;
    *(_QWORD *)&v31[4] = v24;
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = v20;
    _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get state for token: %d", v31, 0x12u);

  }
  objc_autoreleasePoolPop(v21);
  return 0;
}

- (int)serverGenerationCounterToken
{
  return self->_serverGenerationCounterToken;
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 240, 1);
}

- (unint64_t)metadataVersion
{
  return self->_metadataVersion;
}

- (void)_updateStatusWithPayload:(id)a3 sourceIsFetch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMHomeManager *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMHomeManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  HMHomeManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  HMHomeManager *v35;
  _BOOL4 v36;
  _QWORD v37[4];
  id v38;
  HMHomeManager *v39;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "unsignedIntegerValue");
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = self;
      v13 = v4;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HMHomeManagerStatusToString(-[HMHomeManager status](v11, "status"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMHomeManagerStatusToString(v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v14;
      v43 = 2112;
      v44 = (unint64_t)v15;
      v45 = 2112;
      v46 = (uint64_t)v16;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating status from %@ -> %@", buf, 0x20u);

      v4 = v13;
      self = v35;
    }

    objc_autoreleasePoolPop(v10);
    if (-[HMHomeManager status](v11, "status") != v9)
    {
      -[HMHomeManager setStatus:](v11, "setStatus:", v9);
      v17 = -[HMHomeManager status](v11, "status");
      v36 = v4;
      if (v17 != v9)
      {
        v18 = (void *)MEMORY[0x1A1AC1AAC]();
        v19 = v11;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v21;
          v43 = 2048;
          v44 = v9;
          v45 = 2048;
          v46 = v17;
          _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Framework merge not completed - overriding the status from daemon %tu with %tu", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
        v4 = v36;
      }
      -[HMHomeManager delegate](v11, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EE459AD0))
        v23 = v22;
      else
        v23 = 0;
      v24 = v23;

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = (void *)MEMORY[0x1A1AC1AAC]();
        v26 = v11;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          HMHomeManagerStatusToString(v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v28;
          v43 = 2112;
          v44 = (unint64_t)v29;
          _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated status: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        -[HMHomeManager context](v26, "context");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "delegateCaller");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __56__HMHomeManager__updateStatusWithPayload_sourceIsFetch___block_invoke;
        v37[3] = &unk_1E3AB5C80;
        v38 = v24;
        v39 = v26;
        v40 = v17;
        objc_msgSend(v31, "invokeBlock:", v37);

        v4 = v36;
      }

    }
  }
  -[HMHomeManager _updateDataSyncState:](self, "_updateDataSyncState:", v6);
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("multiUserStatus"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    v34 = objc_msgSend(v32, "unsignedIntegerValue");
    if (v4)
      -[HMHomeManager setMultiUserStatus:](self, "setMultiUserStatus:", v34);
  }

}

- (unint64_t)status
{
  os_unfair_lock_s *p_lock;
  unint64_t status;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  status = self->_status;
  os_unfair_lock_unlock(p_lock);
  return status;
}

- (void)setMultiUserStatus:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  HMHomeManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMHomeManager *v15;
  NSObject *v16;
  void *v17;
  _BYTE v18[24];
  void *v19;
  HMHomeManager *v20;
  id v21;
  id v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_multiUserStatus == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_multiUserStatus = a3;
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v18 = 138543618;
      *(_QWORD *)&v18[4] = v9;
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v10;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Multi user status changed to %@", v18, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMHomeManager _privateDelegate](v7, "_privateDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMHomeManager context](v7, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "delegateCaller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v18 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v18[8] = 3221225472;
      *(_QWORD *)&v18[16] = __53__HMHomeManager__notifyClientOfMultiUserStateChange___block_invoke;
      v19 = &unk_1E3AB2228;
      v20 = v7;
      v23 = a3;
      v21 = v11;
      v22 = 0;
      objc_msgSend(v13, "invokeBlock:", v18);

    }
    else
    {
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = v7;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v18 = 138543362;
        *(_QWORD *)&v18[4] = v17;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Registered client does not respond to multi-user state change delegate", v18, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
}

- (void)_updateDataSyncState:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  HMHomeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  HMHomeManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMHomeManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  HMHomeManager *v33;
  _QWORD v34[4];
  id v35;
  HMHomeManager *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMHomeManager _dataSyncStateFromPayload:](self, "_dataSyncStateFromPayload:", v4);
  if (v5 <= 6)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMHomeManagerDataSyncStateToString(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v10;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Got data sync state update from daemon: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (-[HMHomeManager dataSyncState](v8, "dataSyncState") != v6)
    {
      v12 = +[HMHomeManager dataSyncInProgressFromDataSyncState:](HMHomeManager, "dataSyncInProgressFromDataSyncState:", -[HMHomeManager dataSyncState](v8, "dataSyncState"));
      v13 = (void *)MEMORY[0x1A1AC1AAC](-[HMHomeManager setDataSyncState:](v8, "setDataSyncState:", v6));
      v14 = v8;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        HMHomeManagerDataSyncStateToString(v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v16;
        v39 = 2112;
        v40 = v17;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating data sync state to: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMHomeManager _privateDelegate](v14, "_privateDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = (void *)MEMORY[0x1A1AC1AAC]();
        v20 = v14;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v22;
          v39 = 2112;
          v40 = v18;
          _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated data sync state: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        -[HMHomeManager context](v20, "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "delegateCaller");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __38__HMHomeManager__updateDataSyncState___block_invoke;
        v34[3] = &unk_1E3AB5ED8;
        v35 = v18;
        v36 = v20;
        objc_msgSend(v24, "invokeBlock:", v34);

      }
      if (v12 != +[HMHomeManager dataSyncInProgressFromDataSyncState:](HMHomeManager, "dataSyncInProgressFromDataSyncState:", -[HMHomeManager dataSyncState](v14, "dataSyncState"))&& (objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = (void *)MEMORY[0x1A1AC1AAC]();
        v26 = v14;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v28;
          v39 = 2112;
          v40 = v18;
          _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated data sync in progress: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        -[HMHomeManager context](v26, "context");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "delegateCaller");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __38__HMHomeManager__updateDataSyncState___block_invoke_387;
        v31[3] = &unk_1E3AB5ED8;
        v32 = v18;
        v33 = v26;
        objc_msgSend(v30, "invokeBlock:", v31);

      }
    }
  }

}

- (unint64_t)dataSyncState
{
  os_unfair_lock_s *p_lock;
  unint64_t dataSyncState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  dataSyncState = self->_dataSyncState;
  os_unfair_lock_unlock(p_lock);
  return dataSyncState;
}

+ (BOOL)dataSyncInProgressFromDataSyncState:(unint64_t)a3
{
  return a3 > 1;
}

- (void)_handleHomeSafetySecurityEnabledStateWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMHomeManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMHomeManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  HMHomeManager *v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("HMHM.homeSafetySecurityEnabled"));
  if ((_DWORD)v5 != -[HMHomeManager homeSafetySecurityEnabled](self, "homeSafetySecurityEnabled"))
  {
    -[HMHomeManager setHomeSafetySecurityEnabled:](self, "setHomeSafetySecurityEnabled:", v5);
    -[HMHomeManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE459AD0))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMHomeManager homeSafetySecurityEnabled](v10, "homeSafetySecurityEnabled");
        HMFBooleanToString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v12;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client about updated Home Safety and Security enablement state : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      -[HMHomeManager context](v10, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __66__HMHomeManager__handleHomeSafetySecurityEnabledStateWithPayload___block_invoke;
      v21[3] = &unk_1E3AB57F8;
      v22 = v8;
      v23 = v10;
      v24 = v5;
      objc_msgSend(v15, "invokeBlock:", v21);

    }
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager homeSafetySecurityEnabled](v17, "homeSafetySecurityEnabled");
      HMFBooleanToString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Daemon Home Safety and Security status: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);

  }
}

- (BOOL)homeSafetySecurityEnabled
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_homeSafetySecurityEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_handleHH2StateWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMHomeManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMHomeManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  HMHomeManager *v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager setDaemonRunningWithROARFramework:](self, "setDaemonRunningWithROARFramework:", objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("HMHM.daemonROARFramework")));
  v5 = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("HMHM.userOptedToHH2"));
  if ((_DWORD)v5 != -[HMHomeManager hasOptedToHH2](self, "hasOptedToHH2"))
  {
    -[HMHomeManager setMigrationBoost:](self, "setMigrationBoost:", 0);
    -[HMHomeManager setHasOptedToHH2:](self, "setHasOptedToHH2:", v5);
    -[HMHomeManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE459AD0))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMHomeManager hasOptedToHH2](v10, "hasOptedToHH2");
        HMFBooleanToString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v12;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of HH2 updated status : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      -[HMHomeManager context](v10, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __44__HMHomeManager__handleHH2StateWithPayload___block_invoke;
      v21[3] = &unk_1E3AB57F8;
      v22 = v8;
      v23 = v10;
      v24 = v5;
      objc_msgSend(v15, "invokeBlock:", v21);

    }
  }
  v16 = (void *)MEMORY[0x1A1AC1AAC]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHomeManager isDaemonRunningWithROARFramework](v17, "isDaemonRunningWithROARFramework");
    HMFBooleanToString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2112;
    v28 = v20;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Daemon HH2 status: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);

}

- (BOOL)hasOptedToHH2
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_optedToHH2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isDaemonRunningWithROARFramework
{
  return self->_daemonRunningWithROARFramework;
}

- (void)setDaemonRunningWithROARFramework:(BOOL)a3
{
  self->_daemonRunningWithROARFramework = a3;
}

- (void)_handleHH2MigrationProgressStateWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMHomeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMHomeManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  HMHomeManager *v26;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("HMHM.HH2MigrationInProgress"));
  objc_msgSend(v4, "hmf_errorForKey:", CFSTR("HMHM.HH2MigrationFailedError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager setHh2MigrationFailedError:](self, "setHh2MigrationFailedError:", v6);

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHomeManager isHH2MigrationInProgress](v8, "isHH2MigrationInProgress");
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHomeManager hh2MigrationFailedError](v8, "hh2MigrationFailedError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@>>> MIP: %@, new MIP: %@, error: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if ((_DWORD)v5 != -[HMHomeManager isHH2MigrationInProgress](v8, "isHH2MigrationInProgress"))
  {
    -[HMHomeManager setHh2MigrationInProgress:](v8, "setHh2MigrationInProgress:", v5);
    -[HMHomeManager delegate](v8, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EE459AD0))
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = v8;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMHomeManager isHH2MigrationInProgress](v18, "isHH2MigrationInProgress");
        HMFBooleanToString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v20;
        v30 = 2112;
        v31 = v21;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Notifying client of HH2 migration updated status : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMHomeManager context](v18, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "delegateCaller");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __61__HMHomeManager__handleHH2MigrationProgressStateWithPayload___block_invoke;
      v24[3] = &unk_1E3AB57F8;
      v25 = v16;
      v26 = v18;
      v27 = v5;
      objc_msgSend(v23, "invokeBlock:", v24);

    }
  }

}

- (BOOL)isHH2MigrationInProgress
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hh2MigrationInProgress;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSError)hh2MigrationFailedError
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_hh2MigrationFailedError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHh2MigrationFailedError:(id)a3
{
  NSError *v4;
  NSError *hh2MigrationFailedError;

  v4 = (NSError *)a3;
  os_unfair_lock_lock_with_options();
  hh2MigrationFailedError = self->_hh2MigrationFailedError;
  self->_hh2MigrationFailedError = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_handleHH2ManualMigrationEnabledStateWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMHomeManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMHomeManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMHomeManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  HMHomeManager *v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("HMHM.hh2ManualMigrationEnabled"));
  if ((_DWORD)v5 == -[HMHomeManager isHH2MigrationAvailable](self, "isHH2MigrationAvailable"))
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager isHH2MigrationAvailable](v22, "isHH2MigrationAvailable");
      HMFBooleanToString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v24;
      v32 = 2112;
      v33 = v25;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@isHH2MigrationAvailable didn't change. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
  }
  else
  {
    -[HMHomeManager setIsHH2MigrationAvailable:](self, "setIsHH2MigrationAvailable:", v5);
    -[HMHomeManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE459AD0))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMHomeManager isHH2MigrationAvailable](v10, "isHH2MigrationAvailable");
        HMFBooleanToString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v12;
        v32 = 2112;
        v33 = v13;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client about updated HH2 migration enablement : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      -[HMHomeManager context](v10, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __66__HMHomeManager__handleHH2ManualMigrationEnabledStateWithPayload___block_invoke;
      v26[3] = &unk_1E3AB57F8;
      v27 = v8;
      v28 = v10;
      v29 = v5;
      objc_msgSend(v15, "invokeBlock:", v26);

    }
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager isHH2MigrationAvailable](v17, "isHH2MigrationAvailable");
      HMFBooleanToString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Daemon HH2 migration enabled status: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);

  }
}

- (BOOL)isHH2MigrationAvailable
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hh2MigrationAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)_dataSyncStateFromPayload:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "hmf_numberForKey:", CFSTR("dataSyncState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (void)setMetadataVersion:(unint64_t)a3
{
  self->_metadataVersion = a3;
}

- (void)setIsHH2MigrationAvailable:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hh2MigrationAvailable = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setHomeSafetySecurityEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_homeSafetySecurityEnabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setGenerationCounterPostHomeGraphUpdate:(unint64_t)a3
{
  self->_generationCounterPostHomeGraphUpdate = a3;
}

- (void)setGenerationCounter:(unint64_t)a3
{
  self->_generationCounter = a3;
}

- (void)setDataSyncState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_dataSyncState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInitialMergeComplete
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_initialMergeComplete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __33__HMHomeManager_sharedEventStore__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  HMCreateFrameworkCacheDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@/%@"), v1, CFSTR("EventRouterLastEventStoreCache"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D32D40]), "initWithFileName:", v4);
  v3 = (void *)sharedEventStore_eventStore;
  sharedEventStore_eventStore = v2;

}

- (HMHomeManager)initWithOptions:(unint64_t)a3
{
  HMHomeManagerConfiguration *v4;
  HMHomeManager *v5;

  v4 = -[HMHomeManagerConfiguration initWithOptions:cachePolicy:]([HMHomeManagerConfiguration alloc], "initWithOptions:cachePolicy:", a3, 0);
  v5 = -[HMHomeManager initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (void)_writeCaches:(id)a3 homeData:(BOOL)a4 metadata:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMHomeManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMHomeManager *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  HMHomeManager *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  char v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v5 = a5;
  v6 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v6 && !v5)
    _HMFPreconditionFailure();
  -[HMHomeManager configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canWriteToCache");

  if (v10)
  {
    -[HMHomeManager homeCacheDir](self, "homeCacheDir");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v56 = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v11, &v56);

      if (v13)
      {
        if (!v56)
        {
          v14 = (void *)MEMORY[0x1A1AC1AAC]();
          v15 = self;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v17;
            v61 = 2112;
            v62 = v11;
            _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@The cache location %@ is not a directory", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v14);
          goto LABEL_33;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        v19 = objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v55);
        v20 = v55;

        if ((v19 & 1) == 0)
        {
          v21 = (void *)MEMORY[0x1A1AC1AAC]();
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v60 = v23;
            v61 = 2112;
            v62 = v11;
            v63 = 2112;
            v64 = v20;
            _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to make directory %@ (%@).", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v21);
        }

      }
      if (v6)
      {
        v24 = (void *)objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v24, "removeObjectForKey:", CFSTR("kHAPMetadataDataKey"));
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, 0);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0CB3940];
        -[HMHomeManager configuration](self, "configuration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@/%@.%lu.%lu.%@"), v11, CFSTR("homeData"), 4, objc_msgSend(v27, "options"), CFSTR("config"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = 0;
        v49 = (void *)v25;
        LOBYTE(v25) = objc_msgSend((id)v25, "writeToFile:options:error:", v28, 1, &v54);
        v51 = v54;
        v29 = (void *)MEMORY[0x1A1AC1AAC]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if ((v25 & 1) != 0)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v33;
            v61 = 2112;
            v62 = v28;
            _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_INFO, "%{public}@Wrote Home Configuration cache to %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
        }
        else
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v34;
            v61 = 2112;
            v62 = v51;
            _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to write Home Configuration cache file with error %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
          -[HMHomeManager _removeCacheFiles](v30, "_removeCacheFiles");
        }

      }
      if (v5)
      {
        objc_msgSend(v8, "hmf_dataForKey:", CFSTR("kHAPMetadataDataKey"));
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmf_numberForKey:", CFSTR("kHAPMetadataVersionKey"));
        v36 = objc_claimAutoreleasedReturnValue();
        v57[0] = CFSTR("kHAPMetadataDataKey");
        v57[1] = CFSTR("kHAPMetadataVersionKey");
        v50 = (void *)v36;
        v52 = (void *)v35;
        v58[0] = v35;
        v58[1] = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v37, 1, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x1E0CB3940];
        -[HMHomeManager homeCacheDir](self, "homeCacheDir");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("%@/%@.%lu.%@"), v40, CFSTR("metadata"), 4, CFSTR("config"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = 0;
        LOBYTE(v35) = objc_msgSend(v38, "writeToFile:options:error:", v41, 1, &v53);
        v42 = v53;
        v43 = (void *)MEMORY[0x1A1AC1AAC]();
        v44 = self;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if ((v35 & 1) != 0)
        {
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v47;
            v61 = 2112;
            v62 = v41;
            _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_INFO, "%{public}@Writing metadata cache to %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v43);
        }
        else
        {
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v48;
            v61 = 2112;
            v62 = v42;
            _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to write metadata cache file with error %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v43);
          -[HMHomeManager _removeCacheFiles](v44, "_removeCacheFiles");
        }

      }
    }
LABEL_33:

  }
}

- (HMHomeManager)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  HMDelegateCaller *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  HMMutableXPCMessageTransportConfiguration *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMXPCClient *v21;
  _HMContext *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  HMXPCEventRouterClient *v28;
  void *v29;
  void *v30;
  HMXPCEventRouterClient *v31;
  HMDarwinNotificationProvider *v32;
  _HMPrivacySettingsProvider *v33;
  HMHomeManager *v34;
  uint64_t v36;
  HMMutableXPCMessageTransportConfiguration *v37;
  HMHomeManager *v38;
  void *v39;
  HMDelegateCaller *v40;
  _QWORD v41[3];
  _QWORD v42[4];

  v42[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v6 = -[HMDelegateCaller initWithQueue:]([HMDelegateCaller alloc], "initWithQueue:", 0);
  objc_msgSend(v4, "delegateQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  v39 = v7;
  if ((v9 & 1) == 0)
  {
    +[HMDelegateCaller delegateCallerWithOperationQueue:](HMDelegateCaller, "delegateCallerWithOperationQueue:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (HMDelegateCaller *)v10;
  }
  v11 = -[HMXPCMessageTransportConfiguration initWithMachServiceName:]([HMMutableXPCMessageTransportConfiguration alloc], "initWithMachServiceName:", CFSTR("com.apple.homed.xpc"));
  v38 = self;
  HMDispatchQueueNameString(self, 0);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create(v13, v14);
  -[HMXPCMessageTransportConfiguration setQueue:](v11, "setQueue:", v15);

  v41[0] = CFSTR("HMPrincipalClassKey");
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v17;
  v41[1] = CFSTR("adaptive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isAdaptive"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v18;
  v41[2] = CFSTR("options");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "options"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v11;
  v21 = -[HMXPCClient initWithConfiguration:userInfo:]([HMXPCClient alloc], "initWithConfiguration:userInfo:", v11, v20);
  v40 = v6;
  v22 = -[_HMContext initWithXPCClient:delegateCaller:]([_HMContext alloc], "initWithXPCClient:delegateCaller:", v21, v6);
  if (HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken != -1)
    dispatch_once(&HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken, &__block_literal_global_103);
  if (HMIsCurrentProcessSPIEntitled_spiEntitled)
  {
    if (!objc_msgSend(v4, "canUseCache"))
      goto LABEL_11;
    if (HMIsCurrentProcessAnExtension_onceToken != -1)
      dispatch_once(&HMIsCurrentProcessAnExtension_onceToken, &__block_literal_global_112);
    if (HMIsCurrentProcessAnExtension_isCurrentProcessAnExtension
      || (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "bundleIdentifier"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.AssistantServices")),
          v24,
          v23,
          (v25 & 1) != 0))
    {
LABEL_11:
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D32D40]), "initInMemoryStore");
      v27 = 0;
    }
    else
    {
      +[HMHomeManager sharedEventStore](HMHomeManager, "sharedEventStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 1;
    }
    v28 = [HMXPCEventRouterClient alloc];
    -[_HMContext queue](v22, "queue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMContext messageDispatcher](v22, "messageDispatcher");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v36) = v27;
    v31 = -[HMXPCEventRouterClient initWithMessageTargetUUID:queue:messageDispatcher:changeRegistrationsMessageName:updateMessageName:storeReadHandle:storeWriteHandle:useBackgroundTaskAssertion:](v28, "initWithMessageTargetUUID:queue:messageDispatcher:changeRegistrationsMessageName:updateMessageName:storeReadHandle:storeWriteHandle:useBackgroundTaskAssertion:", v5, v29, v30, CFSTR("hm.evt.reg.change"), CFSTR("hm.evt.updates"), v26, v26, v36);

  }
  else
  {
    v26 = 0;
    v31 = 0;
  }
  v32 = objc_alloc_init(HMDarwinNotificationProvider);
  v33 = objc_alloc_init(_HMPrivacySettingsProvider);
  v34 = -[HMHomeManager initWithUUID:configuration:context:xpcEventRouterClient:lastEventStore:timerFactory:darwinNotificationProvider:privacySettingsProvider:](v38, "initWithUUID:configuration:context:xpcEventRouterClient:lastEventStore:timerFactory:darwinNotificationProvider:privacySettingsProvider:", v5, v4, v22, v31, v26, &__block_literal_global_28352, v32, v33);

  return v34;
}

- (HMHomeManager)initWithUUID:(id)a3 configuration:(id)a4 context:(id)a5 xpcEventRouterClient:(id)a6 lastEventStore:(id)a7 timerFactory:(id)a8 darwinNotificationProvider:(id)a9 privacySettingsProvider:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char *v23;
  uint64_t v24;
  void *v25;
  id *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  HMApplicationData *v35;
  void *v36;
  HMNetworkRouterFirewallRuleManager *v37;
  void *v38;
  HMUserCloudShareManager *v39;
  void *v40;
  HMAccessorySetupCoordinator *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  HMSoftwareUpdateDocumentationManager *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  HMWidgetManager *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  HMUserActionPredictionDuetDataSource *v53;
  HMUserActionPredictionProvider *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  HMUserActionPredictionTransformer *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  char *v65;
  NSObject *v66;
  void *v67;
  id v68;
  void *v69;
  dispatch_block_t v70;
  NSObject *v71;
  id v73;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  _QWORD block[4];
  char *v83;
  objc_super v84;
  uint8_t buf[4];
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v17 = a4;
  v81 = a5;
  v79 = a6;
  v75 = a7;
  v78 = a7;
  v18 = a8;
  v19 = a9;
  v77 = a10;
  objc_msgSend(MEMORY[0x1E0D28658], "setClassMappingForNSCoder");
  v20 = objc_alloc(MEMORY[0x1E0D28540]);
  MEMORY[0x1A1AC1500](self, a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithName:", v21);

  v84.receiver = self;
  v84.super_class = (Class)HMHomeManager;
  v23 = -[HMHomeManager init](&v84, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    v25 = (void *)*((_QWORD *)v23 + 20);
    *((_QWORD *)v23 + 20) = v24;

    v23[81] = objc_msgSend(v17, "shouldConnect");
    *(_QWORD *)(v23 + 84) = -1;
    v26 = (id *)(v23 + 312);
    objc_storeStrong((id *)v23 + 39, a5);
    objc_storeStrong((id *)v23 + 30, a9);
    v27 = _Block_copy(v18);
    v28 = (void *)*((_QWORD *)v23 + 31);
    *((_QWORD *)v23 + 31) = v27;

    objc_storeStrong((id *)v23 + 26, a10);
    v73 = v18;
    if (initializeMappingsAndPaths_pred != -1)
      dispatch_once(&initializeMappingsAndPaths_pred, &__block_literal_global_22112);
    objc_storeStrong((id *)v23 + 38, a3);
    +[HMMutableArray array](HMMutableArray, "array");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v23 + 36);
    *((_QWORD *)v23 + 36) = v29;

    *((_QWORD *)v23 + 40) = -1;
    *((_WORD *)v23 + 37) = 0;
    v23[76] = 0;
    *((_QWORD *)v23 + 42) = 0;
    +[HMMutableArray array](HMMutableArray, "array");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v23 + 27);
    *((_QWORD *)v23 + 27) = v31;

    v23[82] = 0;
    *(_OWORD *)(v23 + 136) = xmmword_19B44D010;
    v33 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v34 = (void *)*((_QWORD *)v23 + 37);
    *((_QWORD *)v23 + 37) = v33;

    objc_msgSend(*((id *)v23 + 37), "setMaxConcurrentOperationCount:", 1);
    v35 = objc_alloc_init(HMApplicationData);
    v36 = (void *)*((_QWORD *)v23 + 16);
    *((_QWORD *)v23 + 16) = v35;

    v37 = -[HMNetworkRouterFirewallRuleManager initWithHomeManager:]([HMNetworkRouterFirewallRuleManager alloc], "initWithHomeManager:", v23);
    v38 = (void *)*((_QWORD *)v23 + 47);
    *((_QWORD *)v23 + 47) = v37;

    v39 = -[HMUserCloudShareManager initWithDataSource:]([HMUserCloudShareManager alloc], "initWithDataSource:", v23);
    v40 = (void *)*((_QWORD *)v23 + 48);
    *((_QWORD *)v23 + 48) = v39;

    v41 = objc_alloc_init(HMAccessorySetupCoordinator);
    v42 = (void *)*((_QWORD *)v23 + 49);
    *((_QWORD *)v23 + 49) = v41;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)*((_QWORD *)v23 + 5);
    *((_QWORD *)v23 + 5) = v43;

    *((_QWORD *)v23 + 22) = 0;
    objc_storeStrong((id *)v23 + 32, a6);
    objc_storeStrong((id *)v23 + 8, v75);
    v45 = [HMSoftwareUpdateDocumentationManager alloc];
    objc_msgSend(v23, "context");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[HMSoftwareUpdateDocumentationManager initWithContext:](v45, "initWithContext:", v46);
    v48 = (void *)*((_QWORD *)v23 + 46);
    *((_QWORD *)v23 + 46) = v47;

    v49 = -[HMWidgetManager initWithHomeManager:context:]([HMWidgetManager alloc], "initWithHomeManager:context:", v23, v81);
    v50 = (void *)*((_QWORD *)v23 + 50);
    *((_QWORD *)v23 + 50) = v49;

    if ((objc_msgSend(v17, "canUseCache") & 1) != 0 || objc_msgSend(v17, "canWriteToCache"))
    {
      +[HMFrameworkCacheManager sharedInstance](HMFrameworkCacheManager, "sharedInstance");
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)*((_QWORD *)v23 + 44);
      *((_QWORD *)v23 + 44) = v51;

    }
    if ((objc_msgSend(v17, "options") & 0x4000) != 0)
    {
      v53 = -[HMUserActionPredictionDuetDataSource initWithCacheManager:]([HMUserActionPredictionDuetDataSource alloc], "initWithCacheManager:", *((_QWORD *)v23 + 44));
      v54 = [HMUserActionPredictionProvider alloc];
      objc_msgSend(*((id *)v23 + 39), "queue");
      v76 = v17;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v23 + 39), "messageDispatcher");
      v56 = v22;
      v57 = v19;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_alloc_init(HMUserActionPredictionTransformer);
      objc_msgSend(v23, "darwinNotificationProvider");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[HMUserActionPredictionProvider initWithWorkQueue:messageDispatcher:UUID:dataSource:duetDataSource:predictionTransformer:darwinNotificationProvider:](v54, "initWithWorkQueue:messageDispatcher:UUID:dataSource:duetDataSource:predictionTransformer:darwinNotificationProvider:", v55, v58, v80, v23, v53, v59, v60);
      v62 = (void *)*((_QWORD *)v23 + 45);
      *((_QWORD *)v23 + 45) = v61;

      v19 = v57;
      v22 = v56;
      v26 = (id *)(v23 + 312);

      v17 = v76;
    }
    objc_msgSend(v23, "handleInstanceCreated");
    objc_msgSend(v23, "__preconfigure");
    if (objc_msgSend(*((id *)v23 + 20), "isDiscretionary"))
    {
      v63 = v17;
      v64 = (void *)MEMORY[0x1A1AC1AAC]();
      v65 = v23;
      HMFGetOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v67 = v22;
        v68 = v19;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v86 = v69;
        _os_log_impl(&dword_19B1B0000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@Deferring starting for discretionary client", buf, 0xCu);

        v19 = v68;
        v22 = v67;
      }

      objc_autoreleasePoolPop(v64);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __152__HMHomeManager_initWithUUID_configuration_context_xpcEventRouterClient_lastEventStore_timerFactory_darwinNotificationProvider_privacySettingsProvider___block_invoke;
      block[3] = &unk_1E3AB5E18;
      v83 = v65;
      v70 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
      objc_msgSend(*v26, "queue");
      v71 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v71, v70);

      v18 = v73;
      v17 = v63;
    }
    else
    {
      objc_msgSend(v23, "__start");
    }
  }
  objc_msgSend(v22, "invalidate");

  return (HMHomeManager *)v23;
}

void __61__HMHomeManager__fetchHomeConfigurationWithRefreshRequested___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ConfigurationQoS;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  __HMHomeDataSyncOperation *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  __HMHomeDataSyncOperation *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_17;
  v4 = objc_msgSend(WeakRetained, "generationCounter");
  v5 = objc_msgSend(v3, "serverGenerationCounter");
  ConfigurationQoS = determineFetchConfigurationQoS();
  if (v4 != v5)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = v3;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v16;
      v27 = 2048;
      v28 = v4;
      v29 = 2048;
      v30 = v5;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@The generation counter, %tu, does not match the server generation counter: %tu", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    if (v4 == -1)
      ConfigurationQoS = 25;
    goto LABEL_11;
  }
  v7 = objc_msgSend(v3, "shouldConnect");
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = v3;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Connecting and requesting configuration from the server", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
LABEL_11:
    v17 = -[__HMHomeDataSyncOperation initWithHomeManager:]([__HMHomeDataSyncOperation alloc], "initWithHomeManager:", v3);
    -[HMFOperation setQualityOfService:](v17, "setQualityOfService:", ConfigurationQoS);
    -[HMFOperation setActivity:](v17, "setActivity:", *(_QWORD *)(a1 + 32));
    v18 = (void *)MEMORY[0x1A1AC1AAC](-[__HMHomeDataSyncOperation setRefresh:](v17, "setRefresh:", *(unsigned __int8 *)(a1 + 48)));
    v19 = v3;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HMFQualityOfServiceToString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v21;
      v27 = 2048;
      v28 = v5;
      v29 = 2112;
      v30 = (uint64_t)v22;
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting home configuration with generation counter: %tu, QoS: %@, operation: %@", (uint8_t *)&v25, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v19, "syncOperationQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addOperation:", v17);

    goto LABEL_17;
  }
  if (v11)
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v24;
    v27 = 2048;
    v28 = v4;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Deferring configuration request with generation counter: %tu", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
LABEL_17:

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)checkAndLogMultipleInstanceWarning
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMHomeManager *v25;
  NSObject *v26;
  void *v27;
  HMHomeManager *v28;
  id obj;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (isInternalBuild())
  {
    os_unfair_lock_lock_with_options();
    v28 = self;
    objc_msgSend((id)objc_opt_class(), "instanceTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 >= 2)
    {
      v32 = (void *)objc_msgSend(CFSTR("Having multiple HMHomeManager instances will increase your memory usage and possibly jetsam your process. Please use 1 HMHomeManager if possible. Current home managers:\n"), "mutableCopy");
      v31 = (void *)objc_msgSend(CFSTR("Multiple HMHomeManager instances:"), "mutableCopy");
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend((id)objc_opt_class(), "instanceTracker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v6)
      {
        obj = v5;
        v30 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v34 != v30)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v8, "context");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "xpcClient");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "UUID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v8, "homeManagerCreationTimeStamp");
            objc_msgSend(v12, "numberWithDouble:");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "configuration");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            HMHomeManagerOptionsToString(objc_msgSend(v14, "options"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "appendFormat:", CFSTR("[%@/%@/%@]\n"), v11, v13, v15);

            objc_msgSend(v8, "configuration");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "options");
            v18 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v8, "homeManagerCreationTimeStamp");
            objc_msgSend(v18, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "appendFormat:", CFSTR("[o:0x%lx,t:%ld]"), v17, objc_msgSend(v19, "longValue"));

          }
          v5 = obj;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v6);
      }

      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = v28;
      HMFGetOSLogHandle();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v23;
        v39 = 2112;
        v40 = v32;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v24 = (void *)MEMORY[0x1A1AC1AAC]();
      v25 = v21;
      HMFGetOSLogHandle();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v27;
        v39 = 2112;
        v40 = v31;
        _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&instanceTrackerLock);
  }
}

- (void)handleInstanceCreated
{
  void *v3;
  void *v4;

  if (isInternalBuild())
  {
    os_unfair_lock_lock_with_options();
    objc_msgSend((id)objc_opt_class(), "instanceTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", self);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    -[HMHomeManager setHomeManagerCreationTimeStamp:](self, "setHomeManagerCreationTimeStamp:");

    os_unfair_lock_unlock((os_unfair_lock_t)&instanceTrackerLock);
    -[HMHomeManager checkAndLogMultipleInstanceWarning](self, "checkAndLogMultipleInstanceWarning");
  }
}

+ (id)instanceTracker
{
  if (instanceTracker_onceToken != -1)
    dispatch_once(&instanceTracker_onceToken, &__block_literal_global_53541);
  return (id)instanceTracker_instanceTracker;
}

- (NSOperationQueue)syncOperationQueue
{
  return self->_syncOperationQueue;
}

- (void)setHomeManagerCreationTimeStamp:(double)a3
{
  self->_homeManagerCreationTimeStamp = a3;
}

- (void)__preconfigure
{
  void *v3;
  HMHomeManager *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Pre-configuring home manager", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMHomeManager configureCoreAnalyticsMetricEventDispatcherWithFactory:](v4, "configureCoreAnalyticsMetricEventDispatcherWithFactory:", v4);
  -[HMHomeManager configureAccessorySettingsMetricsDispatcherWithFactory:](v4, "configureAccessorySettingsMetricsDispatcherWithFactory:", v4);
}

- (void)configureCoreAnalyticsMetricEventDispatcherWithFactory:(id)a3
{
  id v4;
  void *v5;
  HMHomeManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring core analytics metric event dispatcher", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "createCoreAnalyticsMetricEventDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager setCoreAnalyticsMetricEventDispatcher:](v6, "setCoreAnalyticsMetricEventDispatcher:", v9);

}

- (id)createCoreAnalyticsMetricEventDispatcher
{
  return objc_alloc_init(HMCoreAnalyticsMetricEventDispatcher);
}

- (void)configureAccessorySettingsMetricsDispatcherWithFactory:(id)a3
{
  id v4;
  void *v5;
  HMHomeManager *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring accessory settings metrics dispatcher", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMHomeManager coreAnalyticsMetricEventDispatcher](v6, "coreAnalyticsMetricEventDispatcher");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    _HMFPreconditionFailure();
  v10 = (void *)v9;
  objc_msgSend(v4, "createAccessorySettingsMetricsDispatcherWithCoreAnalyticsMetricDispatcher:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager setAccessorySettingsMetricsDispatcher:](v6, "setAccessorySettingsMetricsDispatcher:", v11);

}

- (id)createAccessorySettingsMetricsDispatcherWithCoreAnalyticsMetricDispatcher:(id)a3
{
  id v3;
  HMAccessorySettingsMetricsDispatcher *v4;

  v3 = a3;
  v4 = -[HMAccessorySettingsMetricsDispatcher initWithCoreAnalyticsMetricDispatcher:]([HMAccessorySettingsMetricsDispatcher alloc], "initWithCoreAnalyticsMetricDispatcher:", v3);

  return v4;
}

- (void)setCoreAnalyticsMetricEventDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (void)setAccessorySettingsMetricsDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (HMCoreAnalyticsMetricEventDispatcher)coreAnalyticsMetricEventDispatcher
{
  return (HMCoreAnalyticsMetricEventDispatcher *)objc_getProperty(self, a2, 272, 1);
}

+ (id)sharedEventStore
{
  if (sharedEventStore_onceToken != -1)
    dispatch_once(&sharedEventStore_onceToken, &__block_literal_global_375);
  return (id)sharedEventStore_eventStore;
}

- (unint64_t)residentProvisioningStatus
{
  os_unfair_lock_s *p_lock;
  unint64_t residentProvisioningStatus;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  residentProvisioningStatus = self->_residentProvisioningStatus;
  os_unfair_lock_unlock(p_lock);
  return residentProvisioningStatus;
}

void __28__HMHomeManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v306;
  logCategory__hmf_once_v306 = v0;

}

uint64_t __39__HMHomeManager__requestRuntimeUpdate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "_handleRuntimeStateUpdatePayload:reason:", a3, *(_QWORD *)(result + 40));
  return result;
}

- (int64_t)multiUserStatus
{
  os_unfair_lock_s *p_lock;
  int64_t multiUserStatus;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  multiUserStatus = self->_multiUserStatus;
  os_unfair_lock_unlock(p_lock);
  return multiUserStatus;
}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id obj;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3710]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  v8 = (void *)objc_msgSend(v5, "initForReadingFromData:error:", v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  objc_msgSend(v8, "_allowDecodingCyclesInSecureMode");
  v9 = *MEMORY[0x1E0CB2CD0];
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(id *)(v10 + 40);
  objc_msgSend(v8, "decodeTopLevelObjectOfClasses:forKey:error:", v4, v9, &v19);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), v19);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive homes from home data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (id)_loadHH2MigrationInfoFromHMCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  HMHomeManager *v14;
  NSObject *v15;
  void *v16;
  HMHomeManager *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  void *context;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager cacheManager](self, "cacheManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 && v5)
  {
    -[HMHomeManager cacheManager](self, "cacheManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cacheWithName:", CFSTR("HMHM.HH2MigrationCacheName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "numberForKey:", CFSTR("HMHM.HH2MigrationGenCounterValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_msgSend(v4, "isEqual:", v9) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "numberForKey:", CFSTR("HMHM.HH2MigrationInProgress"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("HMHM.HH2MigrationInProgress"));

        objc_msgSend(v8, "dataForKey:", CFSTR("HMHM.HH2MigrationFailedError"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v23 = 0;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v23;
          if (!v12)
          {
            context = (void *)MEMORY[0x1A1AC1AAC]();
            v14 = self;
            HMFGetOSLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v25 = v21;
              v26 = 2112;
              v27 = v13;
              _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive HH2 migration error from the stored cache. : %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("HMHM.HH2MigrationFailedError"));

        }
        v16 = (void *)MEMORY[0x1A1AC1AAC]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v19;
          v26 = 2112;
          v27 = v6;
          _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@HH2 Migration Status: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);

        goto LABEL_16;
      }
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("HMHM.HH2MigrationInProgress"));
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("HMHM.HH2MigrationFailedError"));
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("HMHM.HH2MigrationGenCounterValue"));
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("HMHM.HH2MigrationCacheName"));
    }
    v6 = 0;
LABEL_16:

  }
  return v6;
}

- (HMCacheManager)cacheManager
{
  return (HMCacheManager *)objc_getProperty(self, a2, 352, 1);
}

- (void)_notifyDelegateOfAppDataUpdate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  HMHomeManager *v8;

  -[HMHomeManager _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMHomeManager context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__HMHomeManager__notifyDelegateOfAppDataUpdate__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (void)__processSyncResponse:(id)a3 refreshRequested:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  HMHomeManager *v16;
  uint64_t v17;
  void *v18;
  HMHomeManager *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD block[4];
  id v24;
  HMHomeManager *v25;
  id v26;
  id v27;
  BOOL v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager __processSyncResponse:refreshRequested:completionHandler:]", CFSTR("completionHandler"));
    v16 = self;
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = v16;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v21;
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v10 = v9;
  -[HMHomeManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HMHomeManager___processSyncResponse_refreshRequested_completionHandler___block_invoke;
  block[3] = &unk_1E3AB22A0;
  v24 = v8;
  v25 = self;
  v28 = a4;
  v26 = v11;
  v27 = v10;
  v13 = v10;
  v14 = v11;
  v15 = v8;
  dispatch_async(v12, block);

}

void __49__HMHomeManager__isValidCachedHomeConfiguration___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("kConfigGenerationCounterKey");
  v2[1] = CFSTR("kHAPMetadataVersionKey");
  v2[2] = CFSTR("kIdentifierSaltKey");
  v2[3] = CFSTR("kAccessAllowedWhenLockedKey");
  v2[4] = CFSTR("kHomeCountKey");
  v2[5] = CFSTR("kHomeDataKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_isValidCachedHomeConfiguration__requiredKeys;
  _isValidCachedHomeConfiguration__requiredKeys = v0;

}

- (BOOL)deviceUnlockedSinceBootForUserActionPredictionProvider:(id)a3
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (id)createAccessorySettingsController
{
  void *v3;
  HMHomeManager *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMAccessorySettingsController *v9;
  void *v10;
  HMAccessorySettingsController *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating accessory settings controller", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMHomeManager accessorySettingsMetricsDispatcher](v4, "accessorySettingsMetricsDispatcher");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    _HMFPreconditionFailure();
  v8 = (void *)v7;
  v9 = [HMAccessorySettingsController alloc];
  -[HMHomeManager context](v4, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMAccessorySettingsController initWithContext:messengerFactory:metricsDispatcher:](v9, "initWithContext:messengerFactory:metricsDispatcher:", v10, v4, v8);

  -[HMAccessorySettingsController setDataSource:](v11, "setDataSource:", v4);
  return v11;
}

- (id)accessorySettingsController:(id)a3 homeWithHomeIdentifier:(id)a4
{
  return -[HMHomeManager homeWithUniqueIdentifier:](self, "homeWithUniqueIdentifier:", a4);
}

- (id)createMultiuserSettingsMessenger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMHomeManager *v7;
  NSObject *v8;
  void *v9;
  HMMultiuserSettingsMessenger *v10;
  void *v11;
  void *v12;
  HMMultiuserSettingsMessenger *v13;
  void *v14;
  HMHomeManager *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMHomeManager currentAccessory](self, "currentAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v9;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating multiuser settings messenger with home uuid %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v5)
  {
    v10 = [HMMultiuserSettingsMessenger alloc];
    -[HMHomeManager context](v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMMultiuserSettingsMessenger initWithMessageDispatcher:messageTargetUUID:](v10, "initWithMessageDispatcher:messageTargetUUID:", v12, v5);

  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = 0;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@No current accessory home for home uuid: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (id)createAccessoryInfoDataProvider
{
  void *v3;
  void *v4;
  HMHomeManager *v5;
  NSObject *v6;
  void *v7;
  HMAccessoryInfoDataProvider *v8;
  void *v9;
  HMAccessoryInfoDataProvider *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMHomeManager lastEventStore](self, "lastEventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating accessory info provider with last event store: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = [HMAccessoryInfoDataProvider alloc];
  -[HMHomeManager eventRouter](v5, "eventRouter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMAccessoryInfoDataProvider initWithEventStoreReadHandle:subscriptionProvider:](v8, "initWithEventStoreReadHandle:subscriptionProvider:", v3, v9);

  -[HMAccessoryInfoDataProvider setDataSource:](v10, "setDataSource:", v5);
  return v10;
}

- (BOOL)accessoryInfoDataProvider:(id)a3 transformHomeUUID:(id)a4 accessoryUUID:(id)a5 toClientHomeIdentifier:(id *)a6 clientAccessoryIdentifier:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[HMHomeManager currentHomes](self, "currentHomes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstItemWithUUID:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "accessoryWithUUID:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 != 0;
    if (v17)
    {
      if (a6)
      {
        objc_msgSend(v16, "uniqueIdentifier");
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a7)
      {
        objc_msgSend(v17, "uniqueIdentifier");
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1A1AC1AAC]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v26;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v16;
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no accessory with uuid: %@ home: %@", (uint8_t *)&v28, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no home with uuid: %@", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = 0;
  }

  return v18;
}

- (id)accessoryInfoDataProvider:(id)a3 homeWithHomeIdentifier:(id)a4
{
  return -[HMHomeManager homeWithUniqueIdentifier:](self, "homeWithUniqueIdentifier:", a4);
}

- (HMHomeManager)init
{
  void *v3;
  HMHomeManager *v4;

  +[HMHomeManagerConfiguration defaultConfiguration](HMHomeManagerConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMHomeManager initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  HMHomeManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@HMHomeManager deallocated", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMHomeManager handleInstanceDestroyed](v4, "handleInstanceDestroyed");
  -[HMHomeManager homes](v4, "homes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager incomingHomeInvitations](v4, "incomingHomeInvitations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMContext queue](v4->_context, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__HMHomeManager_dealloc__block_invoke;
  block[3] = &unk_1E3AB5ED8;
  v10 = v7;
  v14 = v10;
  v11 = v8;
  v15 = v11;
  dispatch_async(v9, block);

  if (v4->_serverGenerationCounterToken != -1)
    -[HMDarwinNotificationProvider notifyCancel:](v4->_darwinNotificationProvider, "notifyCancel:");
  if (v4->_serverGenerationCounterDelayedConnectionToken != -1)
    -[HMDarwinNotificationProvider notifyCancel:](v4->_darwinNotificationProvider, "notifyCancel:");

  v12.receiver = v4;
  v12.super_class = (Class)HMHomeManager;
  -[HMHomeManager dealloc](&v12, sel_dealloc);
}

- (void)setInitialMergeComplete:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is unavailable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (HMHome)primaryHome
{
  os_unfair_lock_s *p_lock;
  HMHome *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_primaryHome;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setThisDeviceResidentCapable:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_thisDeviceResidentCapable = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setHasOptedToHH2:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_optedToHH2 = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setHh2MigrationInProgress:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hh2MigrationInProgress = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isDataSyncInProgress
{
  HMHomeManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = +[HMHomeManager dataSyncInProgressFromDataSyncState:](HMHomeManager, "dataSyncInProgressFromDataSyncState:", v2->_dataSyncState);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_handleStatusUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMHomeManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  HMHomeManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  HMHomeManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  HMHomeManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kConfigGenerationCounterKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend(v7, "unsignedIntegerValue");
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMHomeManagerStatusToString(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v13;
      v41 = 2112;
      v42 = (uint64_t)v6;
      v43 = 2112;
      v44 = (uint64_t)v14;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling status updated message with generation counter: %@, status: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = -[HMHomeManager status](v11, "status");
    v16 = -[HMHomeManager generationCounter](v11, "generationCounter");
    if (v16 == objc_msgSend(v6, "unsignedIntegerValue") || (v15 & 0x31) == 0 || (v9 & 0x31) != 0)
    {
      v28 = -[HMHomeManager _updateStatusWithPayload:sourceIsFetch:](v11, "_updateStatusWithPayload:sourceIsFetch:", v5, 0);
      if ((v9 & 0x31) != 0)
        goto LABEL_18;
    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = v11;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v5;
        v21 = v17;
        v22 = objc_msgSend(v6, "unsignedIntegerValue");
        v23 = -[HMHomeManager generationCounter](v18, "generationCounter");
        *(_DWORD *)buf = 138543874;
        v40 = v20;
        v41 = 2048;
        v42 = v22;
        v17 = v21;
        v5 = v38;
        v43 = 2048;
        v44 = v23;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Adding busy status to updated status because home manager generation counter %lu does not match client's value of %lu", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v4, "messagePayload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 | 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("status"));

      v27 = objc_msgSend(v25, "copy");
      v28 = -[HMHomeManager _updateStatusWithPayload:sourceIsFetch:](v18, "_updateStatusWithPayload:sourceIsFetch:", v27, 0);
      v5 = (void *)v27;
    }
    v34 = (void *)MEMORY[0x1A1AC1AAC](v28);
    v35 = v11;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v37;
      _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_INFO, "%{public}@Force-fetching home configuration after homeManager status is good", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v34);
    -[HMHomeManager _fetchHomeConfigurationWithRefreshRequested:](v35, "_fetchHomeConfigurationWithRefreshRequested:", 0);
  }
  else
  {
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v32;
      v41 = 2112;
      v42 = (uint64_t)v33;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Status update message payload missing generation counter and/or status number: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
  }
LABEL_18:

}

- (void)_updateStatusWithPayload:(id)a3
{
  -[HMHomeManager _updateStatusWithPayload:sourceIsFetch:](self, "_updateStatusWithPayload:sourceIsFetch:", a3, 0);
}

- (void)notifyResidentCapableUpdated:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMHomeManager *v12;
  BOOL v13;

  -[HMHomeManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE459AD0))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMHomeManager context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__HMHomeManager_notifyResidentCapableUpdated___block_invoke;
    v10[3] = &unk_1E3AB57F8;
    v11 = v7;
    v12 = self;
    v13 = a3;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)setResidentEnabledForThisDevice:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_residentEnabledForThisDevice = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyResidentEnabledUpdated:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMHomeManager *v12;
  BOOL v13;

  -[HMHomeManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE459AD0))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMHomeManager context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__HMHomeManager_notifyResidentEnabledUpdated___block_invoke;
    v10[3] = &unk_1E3AB57F8;
    v11 = v7;
    v12 = self;
    v13 = a3;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)setResidentProvisioningStatus:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  HMHomeManager *v13;
  unint64_t v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_residentProvisioningStatus == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_residentProvisioningStatus = a3;
    os_unfair_lock_unlock(p_lock);
    -[HMHomeManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE459AD0))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMHomeManager context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delegateCaller");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __47__HMHomeManager_setResidentProvisioningStatus___block_invoke;
      v11[3] = &unk_1E3AB5C80;
      v12 = v8;
      v13 = self;
      v14 = a3;
      objc_msgSend(v10, "invokeBlock:", v11);

    }
  }
}

- (id)_refreshBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  HMHomeManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __HMHomeManagerRefreshRequest *v16;
  __HMHomeManagerRefreshRequest *v17;
  uint64_t v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __HMHomeManagerRefreshRequest *v25;
  __HMHomeManagerRefreshRequest *v26;
  _QWORD block[5];
  __HMHomeManagerRefreshRequest *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id from;
  id location;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  double v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 0.0;
  if (!v6)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToDate:", v9))
  {

LABEL_10:
    v17 = -[__HMHomeManagerRefreshRequest initWithGenerationCounter:timeout:]([__HMHomeManagerRefreshRequest alloc], "initWithGenerationCounter:timeout:", -[HMHomeManager serverGenerationCounter](self, "serverGenerationCounter"), v8);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v17);
    v18 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke;
    v30[3] = &unk_1E3AB21D8;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    v31 = v7;
    v19 = (void *)MEMORY[0x1A1AC1AAC](-[__HMHomeManagerRefreshRequest setCompletionBlock:](v17, "setCompletionBlock:", v30));
    v20 = self;
    HMFGetOSLogHandle();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v22;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting refresh request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    -[HMFOperation start](v17, "start");
    -[HMHomeManager context](v20, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "queue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_481;
    block[3] = &unk_1E3AB5ED8;
    block[4] = v20;
    v25 = v17;
    v29 = v25;
    dispatch_async(v24, block);

    v26 = v29;
    v16 = v25;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = v10;

  if (v8 >= 0.0)
    goto LABEL_10;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v14;
    v38 = 2048;
    v39 = v8;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot refresh before date %fs in the past: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, 0, CFSTR("The date is invalid"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (void)updatePrimaryHome:(HMHome *)home completionHandler:(void *)completion
{
  HMHome *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMHomeManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMHomeManager *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  HMHomeManager *v35;
  id v36;
  id v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = home;
  v7 = completion;
  -[HMHomeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager updatePrimaryHome:completionHandler:]", CFSTR("completion"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1A1AC1AAC]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v31;
      v42 = 2112;
      v43 = v27;
      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v27, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  v9 = v8;
  if (!v6)
  {
    objc_msgSend(v8, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v15 = v7;
    v16 = v14;
    goto LABEL_7;
  }
  -[HMHome uuid](v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager currentHomes](self, "currentHomes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstItemWithUUID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v9, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", v7, v17);
LABEL_14:

    goto LABEL_15;
  }
  if (!-[HMHomeManager isDaemonRunningWithROARFramework](self, "isDaemonRunningWithROARFramework"))
  {
    -[HMHome currentUser](v6, "currentUser");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHome homeAccessControlForUser:](v6, "homeAccessControlForUser:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isAccessAllowed") & 1) != 0)
    {
      -[HMHomeManager uuid](self, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("kHomeUUID");
      v39 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __53__HMHomeManager_updatePrimaryHome_completionHandler___block_invoke;
      v33[3] = &unk_1E3AB4B08;
      v34 = v9;
      v37 = v7;
      v35 = self;
      v36 = v10;
      -[_HMContext sendMessage:target:payload:responseHandler:](v34, CFSTR("kSetPrimaryHomeRequestKey"), v19, v20, v33);

      v17 = v34;
    }
    else
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "accessNotAllowedReasonCode"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v24;
        v42 = 2112;
        v43 = (uint64_t)v6;
        v44 = 2112;
        v45 = v25;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the primary home. Access to the home [%@] is not allowed due to reason: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v9, "delegateCaller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "callCompletion:error:", v7, v26);

    }
    goto LABEL_14;
  }
  -[HMHomeManager setPrimaryHome:](self, "setPrimaryHome:", v6);
  objc_msgSend(v9, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v7;
  v16 = 0;
LABEL_7:
  objc_msgSend(v13, "callCompletion:error:", v15, v16);
LABEL_15:

}

- (void)addHomeWithName:(NSString *)homeName completionHandler:(void *)completion
{
  NSString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HMHomeManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  HMHomeManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMHomeManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMHomeManager *v41;
  NSObject *v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  const __CFString *v49;
  NSString *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  NSString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = homeName;
  v7 = completion;
  -[HMHomeManager context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager addHomeWithName:completionHandler:]", CFSTR("completion"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1A1AC1AAC]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v43;
      v53 = 2112;
      v54 = v39;
      _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v39, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  v9 = (void *)v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Add home"));
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v52 = v14;
    v53 = 2114;
    v54 = (uint64_t)v16;
    v55 = 2112;
    v56 = v6;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding home with name: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  if (v6)
  {
    v17 = -[NSString length](v6, "length");
    if (HMMaxLengthForNaming__hmf_once_t5 != -1)
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
    if (v17 <= HMMaxLengthForNaming__hmf_once_v6)
    {
      v32 = (void *)MEMORY[0x1E0D285F8];
      v33 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMHomeManager uuid](v12, "uuid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithTarget:", v34);
      v49 = CFSTR("kHomeName");
      v50 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "messageWithName:destination:payload:", CFSTR("kAddHomeRequestKey"), v35, v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __51__HMHomeManager_addHomeWithName_completionHandler___block_invoke;
      v45[3] = &unk_1E3AB4B08;
      v45[4] = v12;
      v46 = v10;
      v37 = v9;
      v47 = v37;
      v48 = v7;
      objc_msgSend(v22, "setResponseHandler:", v45);
      objc_msgSend(v37, "messageDispatcher");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "sendMessage:", v22);

      goto LABEL_16;
    }
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = v12;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v21;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Home name is longer than the pre-defined max length", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v9, "delegateCaller");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = 46;
  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = v12;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shortDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v28;
      v53 = 2114;
      v54 = (uint64_t)v30;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to add home with nil name", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(v9, "delegateCaller");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = 20;
  }
  objc_msgSend(v23, "hmErrorWithCode:", v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "callCompletion:home:error:", v7, 0, v31);

LABEL_16:
}

- (void)removeHome:(HMHome *)home completionHandler:(void *)completion
{
  HMHome *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HMHomeManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  HMHomeManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMHomeManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMHome *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  HMHomeManager *v50;
  NSObject *v51;
  void *v52;
  id v53;
  HMHome *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  HMHome *v59;
  id v60;
  const __CFString *v61;
  void *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  HMHome *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = home;
  v7 = completion;
  -[HMHomeManager context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager removeHome:completionHandler:]", CFSTR("completion"));
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)MEMORY[0x1A1AC1AAC]();
    v50 = self;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v52;
      v65 = 2112;
      v66 = v48;
      _os_log_impl(&dword_19B1B0000, v51, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v49);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v48, 0);
    v53 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v53);
  }
  v9 = (void *)v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Remove home"));
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v64 = v14;
    v65 = 2114;
    v66 = (uint64_t)v16;
    v67 = 2112;
    v68 = v6;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing home: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  if (!v6)
  {
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = v12;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "shortDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v35;
      v65 = 2114;
      v66 = (uint64_t)v37;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to remove nil home", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(v9, "delegateCaller");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v39 = 20;
    goto LABEL_13;
  }
  -[HMHomeManager currentHomes](v12, "currentHomes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v6);

  if ((v18 & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1A1AC1AAC]();
    v41 = v12;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "shortDescription");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager currentHomes](v41, "currentHomes");
      v55 = v40;
      v46 = (HMHome *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v64 = v43;
      v65 = 2114;
      v66 = (uint64_t)v45;
      v67 = 2112;
      v68 = v46;
      _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to remove home that doesn't exist in current homes: %@", buf, 0x20u);

      v40 = v55;
    }

    objc_autoreleasePoolPop(v40);
    objc_msgSend(v9, "delegateCaller");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v39 = 2;
LABEL_13:
    objc_msgSend(v38, "hmErrorWithCode:", v39);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "callCompletion:error:", v7, v47);

    goto LABEL_14;
  }
  v19 = (void *)MEMORY[0x1E0D285F8];
  v20 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](v12, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithTarget:", v21);
  v61 = CFSTR("kHomeUUID");
  -[HMHome uuid](v6, "uuid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
  v54 = v6;
  v25 = v7;
  v26 = v10;
  v27 = v9;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageWithName:destination:payload:", CFSTR("kRemoveHomeRequestKey"), v22, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __46__HMHomeManager_removeHome_completionHandler___block_invoke;
  v56[3] = &unk_1E3AB2FA8;
  v56[4] = v12;
  v57 = v26;
  v30 = v27;
  v58 = v30;
  v60 = v25;
  v59 = v54;
  objc_msgSend(v29, "setResponseHandler:", v56);
  objc_msgSend(v30, "messageDispatcher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sendMessage:", v29);

  v9 = v27;
  v10 = v26;
  v7 = v25;
  v6 = v54;

LABEL_14:
}

- (void)resetConfiguration:(BOOL)a3 withoutPopup:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v8 = v6;
  -[HMHomeManager eraseHomeDataWithCompletionHandler:](self, "eraseHomeDataWithCompletionHandler:", v6);

}

- (void)eraseHomeDataWithCompletionHandler:(id)a3
{
  -[HMHomeManager eraseHomeDataAndDeleteMetadata:completionHandler:](self, "eraseHomeDataAndDeleteMetadata:completionHandler:", 0, a3);
}

- (void)eraseHomeDataAndDeleteMetadata:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  const __CFString *v27;
  void *v28;
  _BYTE location[12];
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMHomeManager context](self, "context");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager eraseHomeDataAndDeleteMetadata:completionHandler:]", CFSTR("completion"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v22;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v8 = (void *)v7;
  v9 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

  v12 = (void *)MEMORY[0x1E0D285D0];
  v27 = CFSTR("kResetConfigMetadataKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageWithName:qualityOfService:destination:payload:", CFSTR("kResetConfigRequestKey"), 25, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)location, self);
  objc_msgSend(v8, "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66__HMHomeManager_eraseHomeDataAndDeleteMetadata_completionHandler___block_invoke;
  v24[3] = &unk_1E3AB54A0;
  objc_copyWeak(&v26, (id *)location);
  v17 = v6;
  v25 = v17;
  objc_msgSend(v16, "sendMessage:completionHandler:", v15, v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)location);

}

- (void)queryHomeKitUsageStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMHomeManager *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager queryHomeKitUsageStateWithCompletionHandler:]", CFSTR("completion"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v5 = v4;
  v6 = objc_alloc(MEMORY[0x1E0D285F8]);
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);
  v10 = (void *)objc_msgSend(v6, "initWithName:destination:payload:", CFSTR("kQueryHomeKitUsageStateRequestKey"), v9, 0);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__HMHomeManager_queryHomeKitUsageStateWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E3AB59B8;
  v20[4] = self;
  v21 = v5;
  v11 = v5;
  objc_msgSend(v10, "setResponseHandler:", v20);
  -[HMHomeManager context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v10);

}

- (void)queryVersionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMHomeManager *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _BYTE location[12];
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager queryVersionWithCompletionHandler:]", CFSTR("completion"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v17;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v5 = v4;
  v6 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager messageTargetUUID](self, "messageTargetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMHM.qv"), v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__HMHomeManager_queryVersionWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v21, (id *)location);
  v10 = v5;
  v20 = v10;
  objc_msgSend(v9, "setResponseHandler:", v19);
  -[HMHomeManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:", v9);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)location);

}

- (void)dumpState:(id)a3 payload:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE location[12];
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager dumpState:payload:completion:]", CFSTR("completion"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v26;
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("kDumpStateRequestedConfigurationKey"));
  v13 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);

  v16 = (void *)MEMORY[0x1E0D285F8];
  v17 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v16, "messageWithName:destination:payload:", CFSTR("HMHM.ds"), v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)location, self);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __46__HMHomeManager_dumpState_payload_completion___block_invoke;
  v28[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v30, (id *)location);
  v19 = v11;
  v29 = v19;
  objc_msgSend(v18, "setResponseHandler:", v28);
  -[HMHomeManager context](self, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "messageDispatcher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendMessage:", v18);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)location);

}

- (void)readCountersForGroup:(id)a3 homeUUIDString:(id)a4 accessoryUUIDString:(id)a5 counter:(id)a6 statistics:(id)a7 datePartition:(id)a8 ephemeralContainerName:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id location;

  v15 = a3;
  v40 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v39 = a10;
  v21 = objc_alloc(MEMORY[0x1E0D285D8]);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v23 = (void *)objc_msgSend(v21, "initWithTarget:", v22);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v15;
  v25 = v15;
  v26 = v16;
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("groupName"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v40, CFSTR("homeUUID"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v16, CFSTR("accessoryUUID"));
  v36 = v17;
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, CFSTR("counter"));
  v35 = v18;
  v27 = v18;
  v28 = v19;
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("statistics"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, CFSTR("partition"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v20, CFSTR("ephemeralContainerName"));
  v29 = (void *)MEMORY[0x1E0D285F8];
  v30 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v29, "messageWithName:destination:payload:", CFSTR("readCounters"), v23, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __140__HMHomeManager_readCountersForGroup_homeUUIDString_accessoryUUIDString_counter_statistics_datePartition_ephemeralContainerName_completion___block_invoke;
  v41[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v43, &location);
  v32 = v39;
  v42 = v32;
  objc_msgSend(v31, "setResponseHandler:", v41);
  -[HMHomeManager context](self, "context");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "messageDispatcher");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sendMessage:", v31);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

}

- (void)saveCountersWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D285D8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("saveCounters"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__HMHomeManager_saveCountersWithCompletion___block_invoke;
  v12[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "setResponseHandler:", v12);
  -[HMHomeManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)deleteCountersBeforeDate:(id)a3 afterDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0D285D8]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("beforeDate"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("afterDate"));
  v15 = (void *)MEMORY[0x1E0D285F8];
  v16 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v15, "messageWithName:destination:payload:", CFSTR("deleteCounters"), v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__HMHomeManager_deleteCountersBeforeDate_afterDate_completion___block_invoke;
  v21[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v23, &location);
  v18 = v10;
  v22 = v18;
  objc_msgSend(v17, "setResponseHandler:", v21);
  -[HMHomeManager context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendMessage:", v17);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)addEphemeralContainerWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("ephemeralContainerName"));
  v12 = (void *)MEMORY[0x1E0D285F8];
  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("addEphemeralContainer"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__HMHomeManager_addEphemeralContainerWithName_completion___block_invoke;
  v18[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v20, &location);
  v15 = v7;
  v19 = v15;
  objc_msgSend(v14, "setResponseHandler:", v18);
  -[HMHomeManager context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)deactivateEphemeralContainerWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("ephemeralContainerName"));
  v12 = (void *)MEMORY[0x1E0D285F8];
  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("deactivateEphemeralContainer"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__HMHomeManager_deactivateEphemeralContainerWithName_completion___block_invoke;
  v18[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v20, &location);
  v15 = v7;
  v19 = v15;
  objc_msgSend(v14, "setResponseHandler:", v18);
  -[HMHomeManager context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)deleteEphemeralContainerWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("ephemeralContainerName"));
  v12 = (void *)MEMORY[0x1E0D285F8];
  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("deleteEphemeralContainer"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__HMHomeManager_deleteEphemeralContainerWithName_completion___block_invoke;
  v18[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v20, &location);
  v15 = v7;
  v19 = v15;
  objc_msgSend(v14, "setResponseHandler:", v18);
  -[HMHomeManager context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)startupEphemeralContainerWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("ephemeralContainerName"));
  v12 = (void *)MEMORY[0x1E0D285F8];
  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("startupEphemeralContainer"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__HMHomeManager_startupEphemeralContainerWithName_completion___block_invoke;
  v18[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v20, &location);
  v15 = v7;
  v19 = v15;
  objc_msgSend(v14, "setResponseHandler:", v18);
  -[HMHomeManager context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)listEphemeralContainersWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D285D8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("listEphemeralContainers"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HMHomeManager_listEphemeralContainersWithCompletion___block_invoke;
  v12[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "setResponseHandler:", v12);
  -[HMHomeManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)fetchEventCounters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D285D8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("fetchEventCounters"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__HMHomeManager_fetchEventCounters___block_invoke;
  v12[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "setResponseHandler:", v12);
  -[HMHomeManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)resetEventCounters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D285D8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("resetEventCounters"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__HMHomeManager_resetEventCounters___block_invoke;
  v12[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "setResponseHandler:", v12);
  -[HMHomeManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)requestLogEventDailySchedulerStatusWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D285D8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("logEventDailySchedulerRequestStatus"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HMHomeManager_requestLogEventDailySchedulerStatusWithCompletion___block_invoke;
  v12[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "setResponseHandler:", v12);
  -[HMHomeManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)submitLogEventDailySchedulerRegisteredBlocksWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D285D8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"));
  v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("logEventDailySchedulerRunRegisteredBlocks"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__HMHomeManager_submitLogEventDailySchedulerRegisteredBlocksWithCompletion___block_invoke;
  v12[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "setResponseHandler:", v12);
  -[HMHomeManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)presentTTRDialog:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("B4FFBCEC-B0A2-4660-B1B2-4B484FE76D74"));
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("category"));
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("presentTTRDialog"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__HMHomeManager_presentTTRDialog_completionHandler___block_invoke;
  v16[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v18, &location);
  v13 = v7;
  v17 = v13;
  objc_msgSend(v12, "setResponseHandler:", v16);
  -[HMHomeManager context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:", v12);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)resetLastTTRTimeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D285D8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("B4FFBCEC-B0A2-4660-B1B2-4B484FE76D74"));
  v7 = (void *)objc_msgSend(v5, "initWithTarget:", v6);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("resetLastTTRTime"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HMHomeManager_resetLastTTRTimeWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "setResponseHandler:", v12);
  -[HMHomeManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessage:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)queryMetadata:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  HMHomeManager *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager messageTargetUUID](self, "messageTargetUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMHM.qm"), v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__HMHomeManager_queryMetadata_completionHandler___block_invoke;
  v16[3] = &unk_1E3AB60C8;
  v17 = v6;
  v18 = self;
  v19 = v7;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v11, "setResponseHandler:", v16);
  -[HMHomeManager context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:", v11);

}

- (void)setMetadata:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMHomeManager *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  const __CFString *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager setMetadata:completionHandler:]", CFSTR("completion"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v23;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v8 = v7;
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v33 = CFSTR("kMetadataPlistPathKey");
    v34 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager messageTargetUUID](self, "messageTargetUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMHM.sm"), v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pendingRequests");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = _Block_copy(v8);
  objc_msgSend(v16, "addCompletionBlock:forIdentifier:", v18, v17);

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __47__HMHomeManager_setMetadata_completionHandler___block_invoke;
  v29[3] = &unk_1E3AB5C08;
  v30 = v16;
  v31 = v17;
  v32 = v9;
  v19 = v9;
  v20 = v17;
  v21 = v16;
  objc_msgSend(v14, "setResponseHandler:", v29);
  objc_msgSend(v19, "messageDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sendMessage:completionHandler:", v14, 0);

}

- (void)queryiCloudSwitchStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMHomeManager *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager queryiCloudSwitchStateWithCompletionHandler:]", CFSTR("completion"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v5 = v4;
  -[HMHomeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D285F8]);
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);
  v11 = (void *)objc_msgSend(v7, "initWithName:destination:payload:", CFSTR("HMHM.queryiCloudSwitchState"), v10, 0);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__HMHomeManager_queryiCloudSwitchStateWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E3AB3A50;
  v21 = v5;
  v12 = v5;
  objc_msgSend(v11, "setResponseHandler:", v20);
  objc_msgSend(v6, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v11);

}

- (void)updateiCloudSwitchState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager updateiCloudSwitchState:completionHandler:]", CFSTR("completion"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v7 = v6;
  -[HMHomeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = CFSTR("kiCloudSwitchStateKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D285F8]);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);
  v15 = (void *)objc_msgSend(v11, "initWithName:destination:payload:", CFSTR("HMHM.updateiCloudSwitchState"), v14, v10);

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __59__HMHomeManager_updateiCloudSwitchState_completionHandler___block_invoke;
  v24[3] = &unk_1E3AB3A50;
  v25 = v7;
  v16 = v7;
  objc_msgSend(v15, "setResponseHandler:", v24);
  objc_msgSend(v8, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v15);

}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HMHomeManager *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD aBlock[4];
  id v42;
  id v43;
  id v44;
  _BYTE location[12];
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager updateApplicationData:completionHandler:]", CFSTR("completion"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1A1AC1AAC]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v33;
      v46 = 2112;
      v47 = v29;
      _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v29, 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v34);
  }
  v8 = v7;
  -[HMHomeManager context](self, "context");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("kAppDataInformationKey"));

  }
  v11 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager messageTargetUUID](self, "messageTargetUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "initWithTarget:", v12);

  v14 = (void *)MEMORY[0x1E0D285F8];
  v15 = (void *)objc_msgSend(v9, "copy");
  v35 = (void *)v13;
  objc_msgSend(v14, "messageWithName:destination:payload:", CFSTR("kSetHomeManagerAppDataRequestKey"), v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)location, self);
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HMHomeManager_updateApplicationData_completionHandler___block_invoke;
  aBlock[3] = &unk_1E3AB5538;
  objc_copyWeak(&v44, (id *)location);
  v18 = v6;
  v42 = v18;
  v19 = v8;
  v43 = v19;
  v20 = _Block_copy(aBlock);
  -[HMHomeManager context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pendingRequests");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = _Block_copy(v20);
  objc_msgSend(v22, "addCompletionBlock:forIdentifier:", v24, v23);

  v37[0] = v17;
  v37[1] = 3221225472;
  v37[2] = __57__HMHomeManager_updateApplicationData_completionHandler___block_invoke_2;
  v37[3] = &unk_1E3AB60C8;
  v25 = v22;
  v38 = v25;
  v26 = v23;
  v39 = v26;
  v27 = v20;
  v40 = v27;
  objc_msgSend(v16, "setResponseHandler:", v37);
  objc_msgSend(v36, "messageDispatcher");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sendMessage:completionHandler:", v16, 0);

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)location);

}

- (void)updateResidentEnabledForThisDevice:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMHomeManager *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  const __CFString *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager updateResidentEnabledForThisDevice:completionHandler:]", CFSTR("completionHandler"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v23;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v7 = v6;
  -[HMHomeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = CFSTR("kResidentEnabledKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D285F8]);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);
  v15 = (void *)objc_msgSend(v11, "initWithName:destination:payload:", CFSTR("kUpdateResidentEnabledOnThisDeviceRequestKey"), v14, v10);

  objc_msgSend(v8, "pendingRequests");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = _Block_copy(v7);
  objc_msgSend(v16, "addCompletionBlock:forIdentifier:", v18, v17);

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __70__HMHomeManager_updateResidentEnabledForThisDevice_completionHandler___block_invoke;
  v29[3] = &unk_1E3AB5C08;
  v30 = v16;
  v31 = v17;
  v32 = v8;
  v19 = v8;
  v20 = v17;
  v21 = v16;
  objc_msgSend(v15, "setResponseHandler:", v29);
  objc_msgSend(v19, "messageDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sendMessage:", v15);

}

- (void)updateAccessAllowedWhenLocked:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  BOOL v26;
  const __CFString *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager updateAccessAllowedWhenLocked:completionHandler:]", CFSTR("completionHandler"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v7 = v6;
  -[HMHomeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

  v12 = (void *)MEMORY[0x1E0D285F8];
  v27 = CFSTR("kAccessAllowedWhenLockedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("kUpdateAccessAllowedWhenLockedRequestKey"), v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __65__HMHomeManager_updateAccessAllowedWhenLocked_completionHandler___block_invoke;
  v24[3] = &unk_1E3AB2200;
  v24[4] = self;
  v25 = v7;
  v26 = v4;
  v16 = v7;
  objc_msgSend(v15, "setResponseHandler:", v24);
  objc_msgSend(v8, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:completionHandler:", v15, 0);

}

- (void)generateFirewallRuleTLVsFromNetworkDeclarations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  _BYTE location[12];
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager generateFirewallRuleTLVsFromNetworkDeclarations:completionHandler:]", CFSTR("completionHandler"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v22;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v8 = v7;
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager messageTargetUUID](self, "messageTargetUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);

  v13 = objc_alloc(MEMORY[0x1E0D285F8]);
  v27 = CFSTR("jsonData");
  v28 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:destination:payload:", CFSTR("HMHM.convertFirewallRules"), v12, v14);

  objc_initWeak((id *)location, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83__HMHomeManager_generateFirewallRuleTLVsFromNetworkDeclarations_completionHandler___block_invoke;
  v24[3] = &unk_1E3AB4AE0;
  objc_copyWeak(&v26, (id *)location);
  v16 = v8;
  v25 = v16;
  objc_msgSend(v15, "setResponseHandler:", v24);
  objc_msgSend(v9, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v15);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)location);

}

- (void)checkName:(id)a3 inHome:(id)a4 withValidationOptions:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  HMHomeManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMHomeManager *v35;
  NSObject *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager checkName:inHome:withValidationOptions:completionHandler:]", CFSTR("completionHandler"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1A1AC1AAC]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v37;
      v43 = 2112;
      v44 = v33;
      _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v33, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v38);
  }
  v13 = v12;
  -[HMHomeManager context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[HMHomeManager context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "delegateCaller");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "callCompletion:value:conflictName:error:", v13, 0, 0, v22);

LABEL_10:
    goto LABEL_14;
  }
  v15 = objc_msgSend(v10, "length");
  if (HMMaxLengthForNaming__hmf_once_t5 != -1)
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
  if (v15 > HMMaxLengthForNaming__hmf_once_v6)
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v19;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Home name is longer than the pre-defined max length", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v14, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:value:conflictName:error:", v13, 0, 0, v21);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("kHomeUUID"));

  }
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v10, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("options"));

  v27 = objc_alloc(MEMORY[0x1E0D285F8]);
  v28 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithTarget:", v29);
  v31 = (void *)objc_msgSend(v27, "initWithName:destination:payload:", CFSTR("HMHM.qns"), v30, v23);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __74__HMHomeManager_checkName_inHome_withValidationOptions_completionHandler___block_invoke;
  v39[3] = &unk_1E3AB3A50;
  v40 = v13;
  objc_msgSend(v31, "setResponseHandler:", v39);
  objc_msgSend(v14, "messageDispatcher");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sendMessage:", v31);

LABEL_14:
}

- (BOOL)isiPhoneOnlyPairingSupportedForMatterAccessories
{
  int AppBooleanValue;

  if ((_os_feature_enabled_impl() & 1) != 0
    || (AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)) != 0)
  {
    LOBYTE(AppBooleanValue) = -[HMHomeManager isDaemonRunningWithROARFramework](self, "isDaemonRunningWithROARFramework");
  }
  return AppBooleanValue;
}

- (void)__resolveAccountHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  const __CFString *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager __resolveAccountHandle:completionHandler:]", CFSTR("accountHandle"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
LABEL_7:
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v23;
    v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager __resolveAccountHandle:completionHandler:]", CFSTR("completionHandler"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_7;
  }
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = CFSTR("destination");
  v29 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D285F8]);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);
  v15 = (void *)objc_msgSend(v11, "initWithName:destination:payload:", CFSTR("HMHM.rsa"), v14, v10);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __58__HMHomeManager___resolveAccountHandle_completionHandler___block_invoke;
  v25[3] = &unk_1E3AB59B8;
  v26 = v9;
  v27 = v8;
  v16 = v8;
  v17 = v9;
  objc_msgSend(v15, "setResponseHandler:", v25);
  objc_msgSend(v17, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendMessage:", v15);

}

- (void)__removeAccountWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMHomeManager *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  const __CFString *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager __removeAccountWithIdentifier:completionHandler:]", CFSTR("accountIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
LABEL_7:
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v24;
    v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager __removeAccountWithIdentifier:completionHandler:]", CFSTR("completionHandler"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_7;
  }
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = CFSTR("kIdentifierKey");
  objc_msgSend(v6, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D285F8]);
  v13 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);
  v16 = (void *)objc_msgSend(v12, "initWithName:destination:payload:", CFSTR("HMHM.rma"), v15, v11);

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __65__HMHomeManager___removeAccountWithIdentifier_completionHandler___block_invoke;
  v26[3] = &unk_1E3AB59B8;
  v27 = v9;
  v28 = v8;
  v17 = v8;
  v18 = v9;
  objc_msgSend(v16, "setResponseHandler:", v26);
  objc_msgSend(v18, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendMessage:", v16);

}

- (void)__removeAccountWithHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  const __CFString *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager __removeAccountWithHandle:completionHandler:]", CFSTR("accountHandle"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
LABEL_7:
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v23;
    v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager __removeAccountWithHandle:completionHandler:]", CFSTR("completionHandler"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_7;
  }
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = CFSTR("destination");
  v29 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D285F8]);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);
  v15 = (void *)objc_msgSend(v11, "initWithName:destination:payload:", CFSTR("HMHM.rma"), v14, v10);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __61__HMHomeManager___removeAccountWithHandle_completionHandler___block_invoke;
  v25[3] = &unk_1E3AB59B8;
  v26 = v9;
  v27 = v8;
  v16 = v8;
  v17 = v9;
  objc_msgSend(v15, "setResponseHandler:", v25);
  objc_msgSend(v17, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendMessage:", v15);

}

- (void)_pingDeviceWithUUID:(id)a3 monitor:(BOOL)a4 secure:(BOOL)a5 restrictToLocalNetwork:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HMHomeManager *v31;
  NSObject *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  _QWORD v39[4];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager _pingDeviceWithUUID:monitor:secure:restrictToLocalNetwork:completionHandler:]", CFSTR("deviceUUID"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1A1AC1AAC]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
LABEL_7:
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v33;
    v42 = 2112;
    v43 = v29;
    _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v29, 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v34);
  }
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager _pingDeviceWithUUID:monitor:secure:restrictToLocalNetwork:completionHandler:]", CFSTR("completionHandler"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1A1AC1AAC]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_7;
  }
  -[HMHomeManager context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = CFSTR("kIdentifierKey");
  objc_msgSend(v12, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v16;
  v38[1] = CFSTR("monitor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v17;
  v38[2] = CFSTR("secure");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v18;
  v38[3] = CFSTR("localNetwork");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x1E0D285F8]);
  v22 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithTarget:", v23);
  v25 = (void *)objc_msgSend(v21, "initWithName:destination:payload:", CFSTR("kPingInternalRequestKey"), v24, v20);

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __93__HMHomeManager__pingDeviceWithUUID_monitor_secure_restrictToLocalNetwork_completionHandler___block_invoke;
  v35[3] = &unk_1E3AB59B8;
  v36 = v15;
  v37 = v14;
  v26 = v14;
  v27 = v15;
  objc_msgSend(v25, "setResponseHandler:", v35);
  objc_msgSend(v27, "messageDispatcher");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sendMessage:", v25);

}

- (void)_requestRefresh
{
  void *v3;
  HMHomeManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Refresh requested - re-enabling notifications/media accessory control for client", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMHomeManager homes](v4, "homes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v12, "reEnableNotifications");
        objc_msgSend(v12, "reRegisterHMMMHandlers");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_recomputeAssistantIdentifiers
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_group_create();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMHomeManager homes](self, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        dispatch_group_enter(v3);
        v16[0] = v6;
        v16[1] = 3221225472;
        v16[2] = __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke;
        v16[3] = &unk_1E3AB5E18;
        v17 = v3;
        objc_msgSend(v10, "recomputeAssistantIdentifiersWithCompletion:", v16);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  -[HMHomeManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke_2;
  block[3] = &unk_1E3AB5ED8;
  block[4] = self;
  v15 = v11;
  v13 = v11;
  dispatch_group_notify(v3, v12, block);

}

- (BOOL)_shouldWeMergeLatestHomeGraphFromDaemonResponse:(id)a3
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[HMHomeManager _dataSyncStateFromPayload:](self, "_dataSyncStateFromPayload:", a3);
  if (HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken != -1)
    dispatch_once(&HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken, &__block_literal_global_103);
  if (HMIsCurrentProcessSPIEntitled_spiEntitled)
    v4 = v3;
  else
    v4 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  return v4 == 1;
}

- (void)_removeCacheFiles
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMHomeManager *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  HMHomeManager *v24;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager homeCacheDir](self, "homeCacheDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, &v32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v32;

  if (v5)
  {
    v25 = v6;
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[HMHomeManager configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%lu.%@"), objc_msgSend(v8, "options"), CFSTR("config"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (!v10)
      goto LABEL_19;
    v11 = v10;
    v12 = *(_QWORD *)v29;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasPrefix:", CFSTR("homeData"))
          && objc_msgSend(v14, "hasSuffix:", v27))
        {
          -[HMHomeManager homeCacheDir](self, "homeCacheDir");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByAppendingPathComponent:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)MEMORY[0x1A1AC1AAC]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v34 = v20;
            v35 = 2112;
            v36 = v16;
            v21 = v19;
            v22 = "%{public}@Removing home data cache file: %@";
            goto LABEL_15;
          }
          goto LABEL_16;
        }
        if (objc_msgSend(v14, "hasPrefix:", CFSTR("metadata"))
          && objc_msgSend(v14, "hasSuffix:", CFSTR("config")))
        {
          -[HMHomeManager homeCacheDir](self, "homeCacheDir");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByAppendingPathComponent:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)MEMORY[0x1A1AC1AAC]();
          v24 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v34 = v20;
            v35 = 2112;
            v36 = v16;
            v21 = v19;
            v22 = "%{public}@Removing metadata cache file: %@";
LABEL_15:
            _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, v22, buf, 0x16u);

          }
LABEL_16:

          objc_autoreleasePoolPop(v17);
          -[HMHomeManager _removeCacheFileAtPath:](self, "_removeCacheFileAtPath:", v16);

          continue;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (!v11)
      {
LABEL_19:

        v6 = v25;
        v5 = v26;
        break;
      }
    }
  }

}

- (void)_removeCacheFileAtPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  HMHomeManager *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v5, "removeItemAtPath:error:", v4, &v12);
  v7 = v12;

  if ((v6 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove cache file %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_dumpCaches:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  HMHomeManager *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  HMHomeManager *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMHomeManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMHomeManager *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  id v44;
  HMHomeManager *v45;
  void *context;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44 = a4;
  if (_dumpCaches_metadata__onceToken != -1)
    dispatch_once(&_dumpCaches_metadata__onceToken, &__block_literal_global_576);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  v47 = v7;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    v11 = (id *)&unk_1EE3F4000;
    v45 = self;
    do
    {
      v12 = 0;
      v48 = v9;
      do
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(v7);
        v13 = *(const __CFString **)(*((_QWORD *)&v49 + 1) + 8 * v12);
        if (objc_msgSend(v11[387], "containsObject:", v13, v44))
        {
          v14 = v10;
          objc_msgSend(v7, "valueForKey:", v13);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
          v17 = v16;

          if (v17)
          {
            v18 = (void *)MEMORY[0x1A1AC1AAC]();
            v19 = self;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v17, "length");
              *(_DWORD *)buf = 138543874;
              v54 = v21;
              v55 = 2112;
              v56 = v13;
              v57 = 2048;
              v58 = v22;
              _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@  %@ = <NSData: %lu bytes>", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v18);
            v10 = v14;
            v11 = (id *)&unk_1EE3F4000;
          }
          else
          {
            v23 = v15;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v24 = v23;
            else
              v24 = 0;
            v25 = v24;

            context = (void *)MEMORY[0x1A1AC1AAC]();
            v26 = self;
            HMFGetOSLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
            if (v25)
            {
              if (v28)
              {
                HMFGetLogIdentifier();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v25, "count");
                *(_DWORD *)buf = 138543874;
                v54 = v29;
                v55 = 2112;
                v56 = v13;
                v57 = 2048;
                v58 = v30;
                _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@  %@ = <NSDictionary: %lu entries>", buf, 0x20u);

                v11 = (id *)&unk_1EE3F4000;
              }

              objc_autoreleasePoolPop(context);
              self = v45;
              v10 = v14;
            }
            else
            {
              v10 = v14;
              if (v28)
              {
                HMFGetLogIdentifier();
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v54 = v31;
                v55 = 2112;
                v56 = v13;
                v57 = 2112;
                v58 = (uint64_t)v23;
                _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@  %@ = %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(context);
              self = v45;
            }
          }

          v7 = v47;
          v9 = v48;
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v9);
  }

  v32 = v44;
  if (v44)
  {
    objc_msgSend(v44, "hmf_numberForKey:", CFSTR("kHAPMetadataVersionKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "hmf_dataForKey:", CFSTR("kHAPMetadataDataKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v38;
      v55 = 2112;
      v56 = CFSTR("kHAPMetadataVersionKey");
      v57 = 2112;
      v58 = (uint64_t)v33;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_INFO, "%{public}@  %@ = %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v35);
    v39 = (void *)MEMORY[0x1A1AC1AAC]();
    v40 = v36;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v34, "length");
      *(_DWORD *)buf = 138543874;
      v54 = v42;
      v55 = 2112;
      v56 = CFSTR("kHAPMetadataDataKey");
      v57 = 2048;
      v58 = v43;
      _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_INFO, "%{public}@  %@ = <NSData: %lu bytes>", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v39);

    v32 = v44;
  }

}

- (void)_handleRuntimeStateUpdateNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("HomeManager-%@%@"), v6, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMHomeManager _handleRuntimeStateUpdatePayload:reason:](self, "_handleRuntimeStateUpdatePayload:reason:", v9, v10);
}

- (void)_updatePrimaryHome:(id)a3 notifyDelegate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v4 = a4;
  v6 = a3;
  -[HMHomeManager primaryHome](self, "primaryHome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMHomeManager currentHomes](self, "currentHomes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstItemWithUUID:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (v9 != v7)
  {
    objc_msgSend(v7, "setPrimary:", 0);
    objc_msgSend(v9, "setPrimary:", 1);
    -[HMHomeManager setPrimaryHome:](self, "setPrimaryHome:", v9);
    if (v4)
    {
      -[HMHomeManager delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMHomeManager context](self, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "queue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __51__HMHomeManager__updatePrimaryHome_notifyDelegate___block_invoke;
        block[3] = &unk_1E3AB5CD0;
        block[4] = self;
        v15 = v11;
        v16 = v10;
        v13 = v11;
        dispatch_async(v12, block);

      }
    }
  }

}

- (void)_forceBatchNotificationsEnd
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  HMHomeManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  HMHomeManager *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSCountedSet allObjects](self->_batchNotificationReasons, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet removeAllObjects](self->_batchNotificationReasons, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Batch notifications '%@' did not complete - force-ending", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMHomeManager delegate](v6, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[HMHomeManager delegate](v6, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EE459AD0))
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    -[HMHomeManager context](v6, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __44__HMHomeManager__forceBatchNotificationsEnd__block_invoke;
    v18[3] = &unk_1E3AB5ED8;
    v19 = v14;
    v20 = v6;
    v17 = v14;
    objc_msgSend(v16, "invokeBlock:", v18);

  }
}

- (void)_mergeCurrentHomesWithNewHomes:(id)a3 newPrimaryHome:(id)a4 newCurrentHome:(id)a5 newInvitations:(id)a6 newAppData:(id)a7 refreshRequested:(BOOL)a8
{
  void *v13;
  HMHomeManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMObjectMergeCollection *v20;
  void *v21;
  void *v22;
  HMObjectMergeCollection *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  HMHomeManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  double v56;
  _BOOL4 v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  _QWORD v68[5];
  id v69;
  _QWORD v70[5];
  _QWORD v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD block[5];
  id v79;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  double v86;
  _BYTE v87[128];
  uint64_t v88;

  v57 = a8;
  v88 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v60 = a4;
  v59 = a5;
  v63 = a6;
  v62 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMHomeManager generationCounter](v14, "generationCounter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v82 = v16;
    v83 = 2112;
    v84 = v17;
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Framework merge started for generation counter: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke;
  aBlock[3] = &unk_1E3AB23A8;
  aBlock[4] = v14;
  v19 = _Block_copy(aBlock);
  v20 = [HMObjectMergeCollection alloc];
  -[HMHomeManager currentHomes](v14, "currentHomes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v19;
  v23 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:commonObjectPredicate:](v20, "initWithCurrentObjects:newObjects:commonObjectPredicate:", v22, v64, v19);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Merge-"), "stringByAppendingString:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMHomeManager context](v14, "context");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "queue");
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_603;
  block[3] = &unk_1E3AB5ED8;
  block[4] = v14;
  v29 = v26;
  v79 = v29;
  dispatch_async(v28, block);

  -[HMObjectMergeCollection removedObjects](v23, "removedObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v18;
  v77[1] = 3221225472;
  v77[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2;
  v77[3] = &unk_1E3AB23D0;
  v77[4] = v14;
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", v77);

  -[HMObjectMergeCollection addedObjects](v23, "addedObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v18;
  v76[1] = 3221225472;
  v76[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_605;
  v76[3] = &unk_1E3AB23D0;
  v76[4] = v14;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v76);

  -[HMObjectMergeCollection mergeCommonObjectsNoMergeCount](v23, "mergeCommonObjectsNoMergeCount");
  -[HMObjectMergeCollection finalObjects](v23, "finalObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager currentHomes](v14, "currentHomes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setArray:", v32);

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  -[HMHomeManager homes](v14, "homes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v73 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "postConfigure");
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    }
    while (v36);
  }

  -[HMObjectMergeCollection removedObjects](v23, "removedObjects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v18;
  v71[1] = 3221225472;
  v71[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_606;
  v71[3] = &unk_1E3AB23D0;
  v71[4] = v14;
  objc_msgSend(v39, "enumerateObjectsUsingBlock:", v71);

  -[HMObjectMergeCollection addedObjects](v23, "addedObjects");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v18;
  v70[1] = 3221225472;
  v70[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_609;
  v70[3] = &unk_1E3AB23D0;
  v70[4] = v14;
  objc_msgSend(v40, "enumerateObjectsUsingBlock:", v70);

  -[HMHomeManager _mergeHomeInvitations:](v14, "_mergeHomeInvitations:", v63);
  -[HMHomeManager _mergeNewAppData:](v14, "_mergeNewAppData:", v62);
  -[HMHomeManager _updatePrimaryHome:notifyDelegate:](v14, "_updatePrimaryHome:notifyDelegate:", v60, 1);
  -[HMHomeManager currentHome](v14, "currentHome");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "uuid");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = HMFEqualObjects();

  if ((v43 & 1) == 0)
  {
    -[HMHomeManager context](v14, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "queue");
    v45 = objc_claimAutoreleasedReturnValue();
    v68[0] = v18;
    v68[1] = 3221225472;
    v68[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_613;
    v68[3] = &unk_1E3AB5ED8;
    v68[4] = v14;
    v69 = v59;
    dispatch_async(v45, v68);

  }
  if (v57)
  {
    -[HMHomeManager context](v14, "context");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "queue");
    v47 = objc_claimAutoreleasedReturnValue();
    v67[0] = v18;
    v67[1] = 3221225472;
    v67[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_615;
    v67[3] = &unk_1E3AB5E18;
    v67[4] = v14;
    dispatch_async(v47, v67);

  }
  -[HMHomeManager context](v14, "context");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "queue");
  v49 = objc_claimAutoreleasedReturnValue();
  v65[0] = v18;
  v65[1] = 3221225472;
  v65[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_616;
  v65[3] = &unk_1E3AB5ED8;
  v65[4] = v14;
  v50 = v29;
  v66 = v50;
  dispatch_async(v49, v65);

  v51 = (void *)MEMORY[0x1A1AC1AAC]();
  v52 = v14;
  HMFGetOSLogHandle();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMHomeManager generationCounter](v52, "generationCounter"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138543874;
    v82 = v54;
    v83 = 2112;
    v84 = v55;
    v85 = 2048;
    v86 = -v56;
    _os_log_impl(&dword_19B1B0000, v53, OS_LOG_TYPE_INFO, "%{public}@Framework merge finished for generation counter: %@, %f seconds", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v51);

}

- (void)_mergeHomeInvitations:(id)a3
{
  id v4;
  HMObjectMergeCollection *v5;
  void *v6;
  void *v7;
  HMObjectMergeCollection *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[5];
  id v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];

  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[HMHomeManager homeInvitations](self, "homeInvitations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v7, v4);

  -[HMObjectMergeCollection removedObjects](v8, "removedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __39__HMHomeManager__mergeHomeInvitations___block_invoke;
  v25[3] = &unk_1E3AB23F8;
  v25[4] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v25);

  -[HMObjectMergeCollection addedObjects](v8, "addedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __39__HMHomeManager__mergeHomeInvitations___block_invoke_618;
  v24[3] = &unk_1E3AB23F8;
  v24[4] = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v24);

  -[HMObjectMergeCollection mergeCommonObjects](v8, "mergeCommonObjects");
  -[HMObjectMergeCollection finalObjects](v8, "finalObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager homeInvitations](self, "homeInvitations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setArray:", v12);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMObjectMergeCollection addedObjects](v8, "addedObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v15);

  -[HMObjectMergeCollection removedObjects](v8, "removedObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v16);

  -[HMObjectMergeCollection updatedObjects](v8, "updatedObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v17);

  -[HMHomeManager _privateDelegate](self, "_privateDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMHomeManager context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __39__HMHomeManager__mergeHomeInvitations___block_invoke_620;
    block[3] = &unk_1E3AB5CD0;
    block[4] = self;
    v22 = v18;
    v23 = v14;
    dispatch_async(v20, block);

  }
}

- (void)_mergeNewAppData:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[HMHomeManager applicationData](self, "applicationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HMFEqualObjects();

  if ((v5 & 1) == 0)
    -[HMHomeManager _updateAppData:](self, "_updateAppData:", v6);

}

- (id)homeWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMHomeManager currentHomes](self, "currentHomes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstItemWithUniqueIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_processHomeAddedPayload:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  HMHomeManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMHomeManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMHomeManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  HMHomeManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
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
  id v67;
  void *v68;
  id aBlock;
  id v70;
  id v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  _QWORD v90[4];

  v90[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  aBlock = a4;
  -[HMHomeManager context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("HMHM.isPrimaryHome"));
  objc_msgSend(v6, "hmf_dataForKey:", CFSTR("kHomeDataKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v71 = 0;
    v68 = v10;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v10, &v71);
    v12 = v71;
    objc_msgSend(v11, "_allowDecodingCyclesInSecureMode");
    v13 = (void *)MEMORY[0x1E0C99E60];
    v90[0] = objc_opt_class();
    v90[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CB2CD0];
    v70 = v12;
    objc_msgSend(v11, "decodeTopLevelObjectOfClasses:forKey:error:", v15, v16, &v70);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v70;

    v18 = v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      objc_msgSend(v20, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager _homeWithUUID:](self, "_homeWithUUID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = (void *)MEMORY[0x1A1AC1AAC]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "currentUser");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "currentUser");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "uuid");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "currentUser");
          v61 = v11;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "currentUser");
          v65 = v23;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138545410;
          v73 = v59;
          v74 = 2048;
          v75 = v20;
          v76 = 2112;
          v77 = v20;
          v78 = 2048;
          v79 = v22;
          v80 = 2112;
          v81 = v22;
          v82 = 2112;
          v83 = v57;
          v84 = 2112;
          v85 = v56;
          v86 = 2112;
          v87 = v26;
          v88 = 2112;
          v89 = v28;
          _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@Not adding unarchived home %p/%@ to the home graph as a matching home already exist: %p/%@, [%@/%@] [%@/%@]", buf, 0x5Cu);

          v23 = v65;
          v11 = v61;

        }
        objc_autoreleasePoolPop(v23);
        -[HMHomeManager context](v24, "context");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "delegateCaller");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v32 = aBlock;
        v33 = aBlock;
        v34 = v22;
      }
      else
      {
        -[HMHomeManager context](self, "context");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "__configureWithContext:homeManager:", v44, self);

        -[HMHomeManager currentHomes](self, "currentHomes");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObject:", v20);

        v46 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v20, "postConfigure"));
        v47 = self;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "currentUser");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "currentUser");
          v66 = v46;
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "uuid");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v73 = v63;
          v74 = 2048;
          v75 = v20;
          v76 = 2112;
          v77 = v20;
          v78 = 2112;
          v79 = v60;
          v80 = 2112;
          v81 = v58;
          v82 = 2112;
          v83 = v49;
          _os_log_impl(&dword_19B1B0000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully added home %p/%@ with isPrimary: %@, current user: %@/%@", buf, 0x3Eu);

          v46 = v66;
        }

        objc_autoreleasePoolPop(v46);
        if (v9)
        {
          objc_msgSend(v20, "uuid");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMHomeManager _updatePrimaryHome:notifyDelegate:](v47, "_updatePrimaryHome:notifyDelegate:", v50, 1);

        }
        v51 = (void *)MEMORY[0x1A1AC1AAC]();
        v52 = v47;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = _Block_copy(aBlock);
          *(_DWORD *)buf = 138543874;
          v73 = v54;
          v74 = 2112;
          v75 = v55;
          v76 = 2112;
          v77 = v20;
          _os_log_impl(&dword_19B1B0000, v53, OS_LOG_TYPE_INFO, "%{public}@Calling completion %@ with newly added Home: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v51);
        -[HMHomeManager context](v52, "context");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "delegateCaller");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v32 = aBlock;
        v33 = aBlock;
        v34 = v20;
      }
      objc_msgSend(v30, "callCompletion:home:error:", v33, v34, 0);

      v39 = v67;
    }
    else
    {
      v40 = (void *)MEMORY[0x1A1AC1AAC]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      v39 = v67;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v43;
        v74 = 2112;
        v75 = v67;
        _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive home from home data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      -[HMHomeManager context](v41, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "delegateCaller");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = aBlock;
      objc_msgSend(v29, "callCompletion:home:error:", aBlock, 0, v67);
    }

    v10 = v68;
  }
  else
  {
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v38;
      v74 = 2112;
      v75 = v6;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not find home data in add home response payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    -[HMHomeManager context](v36, "context");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v32 = aBlock;
    objc_msgSend(v11, "callCompletion:home:error:", aBlock, 0, v18);
  }

}

- (void)_handleCurrentHomeChangedNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  HMHomeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kCurrentHomeUUIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (LOBYTE(v12) = 0, v6 = objc_msgSend(v4, "BOOLForKey:keyPresent:", CFSTR("kNoCurrentHomeKey"), &v12), (_BYTE)v12)
    && v6)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC](-[HMHomeManager _updateCurrentHome:](self, "_updateCurrentHome:", v5));
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeManager currentHome](v8, "currentHome");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Updated current home: %@ due to current home changed notification", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)_handleHomesDidUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  HMHomeManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching home configuration in response to homes did update message: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMHomeManager _fetchHomeConfigurationWithRefreshRequested:](v6, "_fetchHomeConfigurationWithRefreshRequested:", 0);

}

- (void)_handleUserInvitationsUpdatedNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  HMHomeManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  HMHomeManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMHomeManager *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id obj;
  uint64_t v41;
  HMHomeManager *v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  HMHomeManager *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  objc_msgSend(v38, "dataForKey:", CFSTR("kInvitationsDataKey"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = self;
  +[HMIncomingHomeInvitation incomingHomeInvitationFromEncodedData:homeManager:](HMIncomingHomeInvitation, "incomingHomeInvitationFromEncodedData:homeManager:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = (id)objc_msgSend(v5, "copy");
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v43)
  {
    v41 = *(_QWORD *)v49;
    v39 = v5;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v49 != v41)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1A1AC1AAC]();
        v9 = v42;
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v11;
          v54 = 2112;
          v55 = v7;
          _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Processing invitation: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v8);
        -[HMHomeManager homeInvitations](v9, "homeInvitations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstItemWithValue:forKey:", v13, CFSTR("identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v7, "invitationState");
        v16 = v15;
        if (v14)
        {
          if (v15 <= 7 && ((1 << v15) & 0x9A) != 0)
          {
            -[HMHomeManager homeInvitations](v9, "homeInvitations");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeObject:", v14);

            v18 = (void *)MEMORY[0x1A1AC1AAC]();
            v19 = v9;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "uniqueIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v53 = v21;
              v54 = 2112;
              v55 = v22;
              _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Removed invitation %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v18);
            v5 = v39;
          }
          objc_msgSend(v14, "_updateInvitationState:", v16);
          objc_msgSend(v5, "removeObject:", v7);
          v23 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v5, "addObject:", v14));
          v24 = v9;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "uniqueIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMHomeInvitationData homeInvitationStateDescription:](HMHomeInvitationData, "homeInvitationStateDescription:", objc_msgSend(v14, "invitationState"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v53 = v26;
            v54 = 2112;
            v55 = v27;
            v56 = 2112;
            v57 = v28;
            _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@Updated invitation state for invitation %@ to %@", buf, 0x20u);

          }
LABEL_20:

          objc_autoreleasePoolPop(v23);
          goto LABEL_21;
        }
        if (v15 == 5 || v15 == 2)
        {
          -[HMHomeManager context](v9, "context");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "__configureWithContext:homeManager:", v29, v9);

          -[HMHomeManager homeInvitations](v9, "homeInvitations");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v7);

          v23 = (void *)MEMORY[0x1A1AC1AAC]();
          v31 = v9;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "uniqueIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v53 = v32;
            v54 = 2112;
            v55 = v33;
            _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@Added invitation: %@", buf, 0x16u);

          }
          goto LABEL_20;
        }
LABEL_21:

      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v43);
  }

  -[HMHomeManager _privateDelegate](v42, "_privateDelegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMHomeManager context](v42, "context");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "delegateCaller");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __59__HMHomeManager__handleUserInvitationsUpdatedNotification___block_invoke;
    v44[3] = &unk_1E3AB5CD0;
    v45 = v34;
    v46 = v42;
    v47 = v5;
    objc_msgSend(v36, "invokeBlock:", v44);

  }
}

- (void)_handleMetadataUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMHomeManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeCompletionBlockForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberForKey:", CFSTR("kMetadataInfoVersionKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kMetadataInfoSchemaVersionKey"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    if ((-[HMHomeManager options](self, "options") & 0x9701) != 0)
    {
      if (objc_msgSend(v11, "unsignedIntegerValue") == 1)
      {
        v12 = objc_msgSend(v9, "unsignedIntegerValue");
        if (v12 >= -[HMHomeManager metadataVersion](self, "metadataVersion"))
        {
          -[HMHomeManager setMetadataVersion:](self, "setMetadataVersion:", objc_msgSend(v9, "unsignedIntegerValue"));
          objc_msgSend(v4, "dataForKey:", CFSTR("kHAPMetadataDataKey"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "applyProtoBufData:", v25);

            v22 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1002);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }

          if (!v8)
            goto LABEL_14;
          goto LABEL_13;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1003);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HMHomeManagerOptionsToString(-[HMHomeManager options](v18, "options"));
        v27 = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v20;
        v30 = 2112;
        v31 = v21;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Client has not requested access to HAP accessories (options %@) - dropping metadata update", buf, 0x16u);

        v17 = v27;
      }

      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v13;
    if (!v8)
    {
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    -[HMHomeManager context](self, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegateCaller");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "callCompletion:error:", v8, v22);

    goto LABEL_14;
  }
  if (v8)
  {
    -[HMHomeManager context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1002);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "callCompletion:error:", v8, v16);

  }
LABEL_15:

}

- (void)_handleQueryHomeKitUsageStateResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v8 = objc_msgSend(v6, "hmf_BOOLForKey:isPresent:", CFSTR("kHomeKitInUseKey"), &v16);
  if (v16)
  {
    v9 = v8;
    v10 = objc_msgSend(v6, "hmf_BOOLForKey:isPresent:", CFSTR("kHomeKitUsingCloudKey"), &v16);
    if (v16)
    {
      if (v7)
      {
        v11 = v10;
        -[HMHomeManager context](self, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "delegateCaller");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "callCompletion:isUsingHomeKit:isUsingCloudServices:error:", v7, v9, v11, 0);
LABEL_9:

      }
    }
    else if (v7)
    {
      -[HMHomeManager context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "delegateCaller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 58, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "callCompletion:isUsingHomeKit:isUsingCloudServices:error:", v7, v9, 0, v15);

      goto LABEL_9;
    }
  }
  else if (v7)
  {
    -[HMHomeManager context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 58, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "callCompletion:isUsingHomeKit:isUsingCloudServices:error:", v7, 0, 0, v14);

    goto LABEL_9;
  }

}

- (void)_declineInvitation:(id)a3 completionHandler:(id)a4
{
  -[HMHomeManager _updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:](self, "_updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:", a3, 0, 4, 0, a4);
}

- (void)_reportJunkInvitation:(id)a3 completionHandler:(id)a4
{
  -[HMHomeManager _updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:](self, "_updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:", a3, 0, 7, 1, a4);
}

- (void)_ignoreInvitation:(id)a3 completionHandler:(id)a4
{
  -[HMHomeManager _updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:](self, "_updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:", a3, 0, 7, 0, a4);
}

- (void)_acceptInvitation:(id)a3 completionHandler:(id)a4
{
  -[HMHomeManager _updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:](self, "_updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:", a3, 1, 3, 0, a4);
}

- (void)_acceptInvitation:(id)a3 presenceAuthStatus:(unint64_t)a4 completionHandler:(id)a5
{
  -[HMHomeManager _updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:](self, "_updateInvitation:presenceAuthStatus:invitationState:invitationOptions:completionHandler:", a3, a4, 3, 0, a5);
}

- (void)_updateInvitation:(id)a3 presenceAuthStatus:(unint64_t)a4 invitationState:(int64_t)a5 invitationOptions:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  HMHomeManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[7];

  v43[5] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v34 = a7;
  -[HMHomeManager context](self, "context");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = CFSTR("kInvitationIdentifierKey");
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v14;
  v42[1] = CFSTR("kInvitationStateKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v15;
  v42[2] = CFSTR("kInvitationResponseOptionsKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v16;
  v42[3] = CFSTR("kUserPresenceAuthorizationStatusKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v17;
  v42[4] = CFSTR("kHomeUUID");
  objc_msgSend(v12, "homeUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x1E0D285F8]);
  v22 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithTarget:", v23);
  v25 = (void *)objc_msgSend(v21, "initWithName:destination:payload:", CFSTR("kUpdateInvitationStateRequestKey"), v24, v20);

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __106__HMHomeManager__updateInvitation_presenceAuthStatus_invitationState_invitationOptions_completionHandler___block_invoke;
  v35[3] = &unk_1E3AB59B8;
  v26 = v33;
  v36 = v26;
  v27 = v34;
  v37 = v27;
  v28 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v25, "setResponseHandler:", v35));
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v31;
    v40 = 2112;
    v41 = v25;
    _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_INFO, "%{public}@update invitation: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  objc_msgSend(v26, "messageDispatcher");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sendMessage:", v25);

}

- (void)_handleResidentDeviceCapableUpdatedNotification:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "BOOLForKey:", CFSTR("kResidentCapableDeviceKey"));
  if ((_DWORD)v4 != -[HMHomeManager isThisDeviceResidentCapable](self, "isThisDeviceResidentCapable"))
  {
    -[HMHomeManager setThisDeviceResidentCapable:](self, "setThisDeviceResidentCapable:", v4);
    if ((v4 & 1) == 0)
    {
      if (-[HMHomeManager isResidentEnabledForThisDevice](self, "isResidentEnabledForThisDevice"))
      {
        -[HMHomeManager setResidentEnabledForThisDevice:](self, "setResidentEnabledForThisDevice:", 0);
        -[HMHomeManager notifyResidentEnabledUpdated:](self, "notifyResidentEnabledUpdated:", 0);
      }
    }
    -[HMHomeManager notifyResidentCapableUpdated:](self, "notifyResidentCapableUpdated:", v4);
  }
}

- (void)_handleResidentEnabledForThisDeviceUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeCompletionBlockForIdentifier:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "BOOLForKey:", CFSTR("kResidentEnabledKey"));
  if ((_DWORD)v8 != -[HMHomeManager isResidentEnabledForThisDevice](self, "isResidentEnabledForThisDevice"))
  {
    -[HMHomeManager setResidentEnabledForThisDevice:](self, "setResidentEnabledForThisDevice:", v8);
    if (!v12)
    {
      -[HMHomeManager notifyResidentEnabledUpdated:](self, "notifyResidentEnabledUpdated:", v8);
LABEL_6:
      v9 = v12;
      goto LABEL_7;
    }
LABEL_5:
    -[HMHomeManager context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v12, 0);

    goto LABEL_6;
  }
  v9 = v12;
  if (v12)
    goto LABEL_5;
LABEL_7:

}

- (void)_handleDevicesUpdatedMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMHomeManager *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  HMHomeManager *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMHM.devices"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Devices updated", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMHomeManager delegate](v8, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EE459AD0))
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMHomeManager context](v8, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __46__HMHomeManager__handleDevicesUpdatedMessage___block_invoke;
      v19[3] = &unk_1E3AB5CD0;
      v20 = v14;
      v21 = v8;
      v22 = v6;
      objc_msgSend(v16, "invokeBlock:", v19);

    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find devices in devices updated message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)_handleAccessAllowedWhenLockedUpdatedNotification:(id)a3
{
  uint64_t v4;
  char v5;

  v5 = 0;
  v4 = objc_msgSend(a3, "BOOLForKey:keyPresent:", CFSTR("kAccessAllowedWhenLockedKey"), &v5);
  if ((_DWORD)v4 != -[HMHomeManager isAccessAllowedWhenLocked](self, "isAccessAllowedWhenLocked"))
  {
    -[HMHomeManager setAccessAllowedWhenLocked:](self, "setAccessAllowedWhenLocked:", v4);
    -[HMHomeManager _notifyAccessAllowedWhenLockedUpdated:](self, "_notifyAccessAllowedWhenLockedUpdated:", v4);
  }
}

- (void)_handleResidentProvisioningStatusChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "numberForKey:", CFSTR("kProvisioningStatusKey"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager setResidentProvisioningStatus:](self, "setResidentProvisioningStatus:", objc_msgSend(v4, "integerValue"));

}

- (void)pairingIdentityForAccessoryWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  const __CFString *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager pairingIdentityForAccessoryWithIdentifier:completionHandler:]", CFSTR("accessoryIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
LABEL_7:
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v23;
    v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager pairingIdentityForAccessoryWithIdentifier:completionHandler:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_7;
  }
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = CFSTR("kIdentifierKey");
  v29 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D285F8]);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);
  v15 = (void *)objc_msgSend(v11, "initWithName:destination:payload:", CFSTR("HMHM.acpi"), v14, v10);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__HMHomeManager_pairingIdentityForAccessoryWithIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E3AB60C8;
  v25[4] = self;
  v26 = v6;
  v27 = v8;
  v16 = v8;
  v17 = v6;
  objc_msgSend(v15, "setResponseHandler:", v25);
  objc_msgSend(v9, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendMessage:", v15);

}

- (void)currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  const __CFString *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:]", CFSTR("accessoryUniqueIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
LABEL_7:
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v23;
    v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_7;
  }
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = CFSTR("kIdentifierKey");
  v29 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D285F8]);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);
  v15 = (void *)objc_msgSend(v11, "initWithName:destination:payload:", CFSTR("HMHM.cuacpi"), v14, v10);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __108__HMHomeManager_currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E3AB60C8;
  v25[4] = self;
  v26 = v6;
  v27 = v8;
  v16 = v8;
  v17 = v6;
  objc_msgSend(v15, "setResponseHandler:", v25);
  objc_msgSend(v9, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendMessage:", v15);

}

- (void)fetchAllPairingIdentitiesForRepairFlowWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HMHomeManager allPairingIdentitiesInRankOrderWithError:](self, "allPairingIdentitiesInRankOrderWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)allPairingIdentitiesInRankOrderWithError:(id *)a3
{
  void *v4;
  HMHomeManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HMHomeManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMHomeManager *v33;
  NSObject *v34;
  void *v35;
  uint64_t v37;
  HMHomeManager *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t i;
  void *v44;
  HMHomeManager *v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE v61[128];
  uint8_t v62[128];
  _BYTE buf[24];
  void *v64;
  uint64_t *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (CFPreferencesGetAppBooleanValue(CFSTR("kHMDDemoModeStatusKey"), CFSTR("com.apple.homed"), 0))
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@allPairingIdentitiesInRankOrderWithError returning empty array because demo mode is on.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v57 = 0;
    v58 = &v57;
    v59 = 0x2050000000;
    v9 = (void *)getHAPSystemKeychainStoreClass_softClass;
    v60 = getHAPSystemKeychainStoreClass_softClass;
    if (!getHAPSystemKeychainStoreClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getHAPSystemKeychainStoreClass_block_invoke;
      v64 = &unk_1E3AB4620;
      v65 = &v57;
      __getHAPSystemKeychainStoreClass_block_invoke((uint64_t)buf);
      v9 = (void *)v58[3];
    }
    v38 = self;
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v57, 8);
    objc_msgSend(v10, "systemStore");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v54 = 0u;
    v53 = 0u;
    v40 = objc_msgSend(&unk_1E3B30928, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v40)
    {
      v37 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v54 != v37)
            objc_enumerationMutation(&unk_1E3B30928);
          v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          v52 = 0;
          v44 = v11;
          objc_msgSend(v39, "allKeysForType:error:");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v52;
          v12 = (void *)MEMORY[0x1A1AC1AAC]();
          v45 = v38;
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
          if (v41)
          {
            if (v14)
            {
              HMFGetLogIdentifier();
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v15;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v44;
              *(_WORD *)&buf[22] = 2112;
              v64 = v41;
              _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Unable to find pairing identity for type %@: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v12);
          }
          else
          {
            if (v14)
            {
              HMFGetLogIdentifier();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v42;
              *(_WORD *)&buf[22] = 2112;
              v64 = v44;
              _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Found [%@] of type : %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v12);
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v17 = v42;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v49;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v49 != v19)
                    objc_enumerationMutation(v17);
                  v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                  v22 = objc_alloc(MEMORY[0x1E0D28650]);
                  objc_msgSend(v21, "identifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "publicKey");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "privateKey");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = (void *)objc_msgSend(v22, "initWithIdentifier:publicKey:privateKey:", v23, v24, v25);

                  v46[0] = MEMORY[0x1E0C809B0];
                  v46[1] = 3221225472;
                  v46[2] = __58__HMHomeManager_allPairingIdentitiesInRankOrderWithError___block_invoke;
                  v46[3] = &unk_1E3AB2420;
                  v27 = v26;
                  v47 = v27;
                  if (objc_msgSend(v8, "na_any:", v46))
                  {
                    v28 = (void *)MEMORY[0x1A1AC1AAC]();
                    v29 = v45;
                    HMFGetOSLogHandle();
                    v30 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v31;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v27;
                      *(_WORD *)&buf[22] = 2112;
                      v64 = v44;
                      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_INFO, "%{public}@Not adding key [%@] [%@] as it already exist in final list", buf, 0x20u);

                    }
                    objc_autoreleasePoolPop(v28);
                  }
                  else
                  {
                    objc_msgSend(v8, "addObject:", v27);
                  }

                }
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
              }
              while (v18);
            }

          }
        }
        v40 = objc_msgSend(&unk_1E3B30928, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v40);
    }
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = v38;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_INFO, "%{public}@Returning pairing identities: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);

  }
  return v8;
}

- (void)_addKeysToRepairListIfUnique:(id)a3 includePrivateKeys:(BOOL)a4 repairList:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HMHomeManager__addKeysToRepairListIfUnique_includePrivateKeys_repairList___block_invoke;
  v9[3] = &unk_1E3AB2448;
  v11 = a4;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v9);

}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  void *v5;
  NSObject *v6;
  HMFTimer *batchNotificationEndTimer;

  v4 = (HMFTimer *)a3;
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  batchNotificationEndTimer = self->_batchNotificationEndTimer;
  if (batchNotificationEndTimer == v4)
    -[HMHomeManager _forceBatchNotificationsEnd](self, "_forceBatchNotificationsEnd");
}

- (void)upgradeToROARWithCompletionHandler:(id)a3
{
  -[HMHomeManager _upgradeToHH2WithCompletionHandler:payload:](self, "_upgradeToHH2WithCompletionHandler:payload:", a3, 0);
}

- (void)_upgradeToHH2WithCompletionHandler:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager _upgradeToHH2WithCompletionHandler:payload:]", CFSTR("completion"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v8 = v7;
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D285F8];
  v11 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);
  objc_msgSend(v10, "messageWithName:destination:payload:", CFSTR("HMHM.upgradeToHH2"), v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__HMHomeManager__upgradeToHH2WithCompletionHandler_payload___block_invoke;
  v24[3] = &unk_1E3AB60C8;
  v24[4] = self;
  v25 = v9;
  v26 = v6;
  v15 = v6;
  v16 = v9;
  objc_msgSend(v14, "setResponseHandler:", v24);
  objc_msgSend(v16, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:completionHandler:", v14, 0);

}

- (void)_testHH2MigrationWithCompletionHandler:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HMHomeManager *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager _testHH2MigrationWithCompletionHandler:payload:]", CFSTR("completion"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v26;
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v8 = v7;
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (isInternalBuild())
  {
    v10 = (void *)MEMORY[0x1E0D285F8];
    v11 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMHomeManager uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);
    objc_msgSend(v10, "messageWithName:destination:payload:", CFSTR("HMHM.testHH2Migration"), v13, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __64__HMHomeManager__testHH2MigrationWithCompletionHandler_payload___block_invoke;
    v28[3] = &unk_1E3AB59B8;
    v15 = v9;
    v29 = v15;
    v30 = v6;
    objc_msgSend(v14, "setResponseHandler:", v28);
    objc_msgSend(v15, "messageDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendMessage:completionHandler:", v14, 0);

    v17 = v29;
  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_FAULT, "%{public}@Not allowed to run in production / customer builds", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v9, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", v6, v17);
  }

}

- (void)fetchDiagnosticInfoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  HMHomeManager *v15;
  uint64_t v16;
  void *v17;
  HMHomeManager *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager fetchDiagnosticInfoWithCompletionHandler:]", CFSTR("completionHandler"));
    v15 = self;
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = v15;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v5 = v4;
  -[HMHomeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D285F8];
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);
  objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("HMHM.currentDeviceDiagnosticInfo"), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__HMHomeManager_fetchDiagnosticInfoWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E3AB59B8;
  v23 = v6;
  v24 = v5;
  v12 = v5;
  v13 = v6;
  objc_msgSend(v11, "setResponseHandler:", v22);
  objc_msgSend(v13, "messageDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendMessage:completionHandler:", v11, 0);

}

- (void)fetchNetworkMismatchInfoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  HMHomeManager *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMHomeManager *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager fetchNetworkMismatchInfoWithCompletionHandler:]", CFSTR("completionHandler"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        v28 = 2112;
        v29 = (const char *)v17;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v22);
    }
    v6 = (void *)MEMORY[0x1E0D285F8];
    v7 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMHomeManager uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);
    objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMHM.networkMismatchInfo"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __63__HMHomeManager_fetchNetworkMismatchInfoWithCompletionHandler___block_invoke;
    v23[3] = &unk_1E3AB59B8;
    v11 = v5;
    v24 = v11;
    v25 = v4;
    objc_msgSend(v10, "setResponseHandler:", v23);
    objc_msgSend(v11, "messageDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendMessage:completionHandler:", v10, 0);

  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v16;
      v28 = 2080;
      v29 = "-[HMHomeManager fetchNetworkMismatchInfoWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)fetchCachedWiFiInfosForHomesWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  HMHomeManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMHomeManager *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMHomeManager *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager fetchCachedWiFiInfosForHomesWithCompletionHandler:]", CFSTR("completionHandler"));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v19;
        v23 = 2112;
        v24 = (const char *)v15;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v20);
    }
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Not yet implemented", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, MEMORY[0x1E0C9AA70], v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2080;
      v24 = "-[HMHomeManager fetchCachedWiFiInfosForHomesWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)fetchWiFiInfosForHomesWithTimeout:(double)a3 partialResultHandler:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  HMHomeManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMHomeManager *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
        v10 = (void *)MEMORY[0x1A1AC1AAC]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v13;
          _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not yet implemented", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v14);

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager fetchWiFiInfosForHomesWithTimeout:partialResultHandler:completion:]", CFSTR("completionHandler"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_15:

        objc_autoreleasePoolPop(v20);
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v24);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager fetchWiFiInfosForHomesWithTimeout:partialResultHandler:completion:]", CFSTR("partialResultHandler"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
    }
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v23;
    v27 = 2112;
    v28 = (const char *)v19;
    _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    goto LABEL_15;
  }
  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v18;
    v27 = 2080;
    v28 = "-[HMHomeManager fetchWiFiInfosForHomesWithTimeout:partialResultHandler:completion:]";
    _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
LABEL_10:

}

- (void)updateMobileAssetsAndForce:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager updateMobileAssetsAndForce:completion:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v7 = v6;
  -[HMHomeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D285F8];
  v10 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);
  v28 = CFSTR("HMHomeManagerForceUpdateMobileAssetMessageKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageWithName:destination:payload:", CFSTR("HMHM.updateMobileAssets"), v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __55__HMHomeManager_updateMobileAssetsAndForce_completion___block_invoke;
  v25[3] = &unk_1E3AB59B8;
  v26 = v8;
  v27 = v7;
  v16 = v7;
  v17 = v8;
  objc_msgSend(v15, "setResponseHandler:", v25);
  objc_msgSend(v17, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendMessage:completionHandler:", v15, 0);

}

- (void)clearMobileAssetsLocalInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  HMHomeManager *v15;
  uint64_t v16;
  void *v17;
  HMHomeManager *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager clearMobileAssetsLocalInfoWithCompletion:]", CFSTR("completion"));
    v15 = self;
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = v15;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v5 = v4;
  -[HMHomeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D285F8];
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);
  objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("HMHM.clearMobileAssetsInfo"), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__HMHomeManager_clearMobileAssetsLocalInfoWithCompletion___block_invoke;
  v22[3] = &unk_1E3AB59B8;
  v23 = v6;
  v24 = v5;
  v12 = v5;
  v13 = v6;
  objc_msgSend(v11, "setResponseHandler:", v22);
  objc_msgSend(v13, "messageDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendMessage:completionHandler:", v11, 0);

}

- (void)fetchAppleMediaAccesoryDiagnosticInfo:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMHomeManager *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager fetchAppleMediaAccesoryDiagnosticInfo:options:completion:]", CFSTR("completionHandler"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1A1AC1AAC]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v31;
      v40 = 2112;
      v41 = v27;
      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v27, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  v10 = v9;
  -[HMHomeManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0D285F8];
    v14 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMHomeManager uuid](self, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);
    v36[0] = CFSTR("options");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = CFSTR("accessoryUUID");
    v37[0] = v17;
    v37[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("HMHM.accessoryDiagnosticInfo"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __74__HMHomeManager_fetchAppleMediaAccesoryDiagnosticInfo_options_completion___block_invoke;
    v33[3] = &unk_1E3AB59B8;
    v20 = v11;
    v34 = v20;
    v35 = v10;
    objc_msgSend(v19, "setResponseHandler:", v33);
    objc_msgSend(v20, "messageDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendMessage:completionHandler:", v19, 0);

    v22 = v34;
  }
  else
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v26;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not determine accessory UUID", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v11, "delegateCaller");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "callCompletion:obj:error:", v10, 0, v22);
  }

}

- (void)_saveMigrationProgressToHMCache:(BOOL)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMHomeManager *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMHomeManager cacheManager](self, "cacheManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMHomeManager cacheManager](self, "cacheManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__HMHomeManager__saveMigrationProgressToHMCache_error___block_invoke;
    v13[3] = &unk_1E3AB2498;
    v13[4] = self;
    v15 = a3;
    v14 = v6;
    objc_msgSend(v8, "cacheWithName:completion:", CFSTR("HMHM.HH2MigrationCacheName"), v13);

  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@This client is not running with cache configuration so not going to store migration info.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)attemptHH2AutoMigrationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D285F8];
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);
  objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMHM.attemptHH2AutoMigration"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __62__HMHomeManager_attemptHH2AutoMigrationWithCompletionHandler___block_invoke;
  v17 = &unk_1E3AB59B8;
  v18 = v5;
  v19 = v4;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v10, "setResponseHandler:", &v14);
  objc_msgSend(v12, "messageDispatcher", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v10);

}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  id v4;
  void *v5;
  unint64_t pendingChangeSetupMode;
  void *v7;
  HMHomeManager *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = _Block_copy(self->_pendingChangeSetupModeOperation);
  pendingChangeSetupMode = self->_pendingChangeSetupMode;
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Sending setup mode message on reconnecting", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMHomeManager sendSetupModeMessage:](v8, "sendSetupModeMessage:", pendingChangeSetupMode);
  }

}

- (void)_handleSetupModeMessageResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMHomeManager *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id pendingChangeSetupModeOperation;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMHomeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  v9 = _Block_copy(self->_pendingChangeSetupModeOperation);
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("mode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v14)
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@A setup mode number was returned", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
    }
    else
    {
      if (v14)
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v18;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Calling setup mode completion", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v8, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "callCompletion:error:", v9, v7);

      os_unfair_lock_lock_with_options();
      pendingChangeSetupModeOperation = self->_pendingChangeSetupModeOperation;
      self->_pendingChangeSetupModeOperation = 0;

      os_unfair_lock_unlock(&self->_lock);
    }

  }
}

- (void)setSetupMode:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  char v8;
  void *v9;
  HMHomeManager *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMHomeManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id pendingChangeSetupModeOperation;
  uint64_t v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager setSetupMode:completion:]", CFSTR("completion"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v26;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v7 = (void (**)(_QWORD, _QWORD))v6;
  v8 = _os_feature_enabled_impl();
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      v30 = 2048;
      v31 = a3;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Attempt to set setup mode %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    os_unfair_lock_lock_with_options();
    if (v10->_pendingChangeSetupModeOperation)
    {
      os_unfair_lock_unlock(&v10->_lock);
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = v10;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v17;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Can only have one operation in flight", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v7)[2](v7, v18);

    }
    else
    {
      v20 = _Block_copy(v7);
      pendingChangeSetupModeOperation = v10->_pendingChangeSetupModeOperation;
      v10->_pendingChangeSetupModeOperation = v20;

      v10->_pendingChangeSetupMode = a3;
      os_unfair_lock_unlock(&v10->_lock);
      -[HMHomeManager sendSetupModeMessage:](v10, "sendSetupModeMessage:", a3);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Setup mode switch is not enabled short circuiting as success", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v7[2](v7, 0);
  }

}

- (void)sendSetupModeMessage:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D285F8];
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);
  v17 = CFSTR("mode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMHM.setupMode"), v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__HMHomeManager_sendSetupModeMessage___block_invoke;
  v14[3] = &unk_1E3AB47E0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v12, "setResponseHandler:", v14);
  objc_msgSend(v5, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)addAndSetupAccessoriesWithPayload:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMHomeManager *v11;
  NSObject *v12;
  void *v13;
  HMAccessorySetupRequest *v14;
  HMAccessorySetupPayload *v15;
  HMAccessorySetupManager *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  HMHomeManager *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager addAndSetupAccessoriesWithPayload:completionHandler:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v8 = v7;
  -[HMHomeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v13;
    v30 = 2112;
    v31 = (uint64_t)v6;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding and setting up accessories with setup accessory payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v14 = objc_alloc_init(HMAccessorySetupRequest);
  v15 = -[HMAccessorySetupPayload initWithInternalSetupPayload:ownershipToken:]([HMAccessorySetupPayload alloc], "initWithInternalSetupPayload:ownershipToken:", v6, 0);
  -[HMAccessorySetupRequest setPayload:](v14, "setPayload:", v15);

  v16 = objc_alloc_init(HMAccessorySetupManager);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __69__HMHomeManager_addAndSetupAccessoriesWithPayload_completionHandler___block_invoke;
  v25[3] = &unk_1E3AB24E8;
  v25[4] = v11;
  v26 = v9;
  v27 = v8;
  v17 = v8;
  v18 = v9;
  -[HMAccessorySetupManager performAccessorySetupUsingRequest:completionHandler:](v16, "performAccessorySetupUsingRequest:completionHandler:", v14, v25);

}

- (void)launchHomeUIServiceToResumeSetupWithUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMHomeManager *v9;
  NSObject *v10;
  void *v11;
  HMAccessorySetupManager *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService with userInfo: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = objc_alloc_init(HMAccessorySetupManager);
  -[HMAccessorySetupManager resumeAccessorySetupWithUserInfo:completionHandler:](v12, "resumeAccessorySetupWithUserInfo:completionHandler:", v6, v7);

}

- (BOOL)needsOSUpdateToRunHH2
{
  return 0;
}

- (BOOL)isHomeRemovedPermanently:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMHomeManager *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HMHomeManager homes](self, "homes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", v4);

        if ((v11 & 1) != 0)
        {

          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[HMHomeManager sharedHomeUUIDsNotYetMigrated](self, "sharedHomeUUIDsNotYetMigrated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if (v14)
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Home: %@ is not removed permanently", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
LABEL_14:
    v19 = 0;
  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (id)shareManager:(id)a3 homeWithUUID:(id)a4
{
  return -[HMHomeManager _homeWithUUID:](self, "_homeWithUUID:", a4);
}

- (NSUUID)lastRemovedCurrentAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 184, 1);
}

- (NSArray)sharedHomeUUIDsNotYetMigrated
{
  return self->_sharedHomeUUIDsNotYetMigrated;
}

- (void)setSharedHomeUUIDsNotYetMigrated:(id)a3
{
  objc_storeStrong((id *)&self->_sharedHomeUUIDsNotYetMigrated, a3);
}

- (void)setHomeInvitations:(id)a3
{
  objc_storeStrong((id *)&self->_homeInvitations, a3);
}

- (BOOL)shouldConnect
{
  return self->_shouldConnect;
}

- (void)setShouldConnect:(BOOL)a3
{
  self->_shouldConnect = a3;
}

- (int)serverGenerationCounterDelayedConnectionToken
{
  return self->_serverGenerationCounterDelayedConnectionToken;
}

- (void)setServerGenerationCounterDelayedConnectionToken:(int)a3
{
  self->_serverGenerationCounterDelayedConnectionToken = a3;
}

- (void)setXpcEventRouterClient:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEventRouterClient, a3);
}

- (HMMigrationBoost)migrationBoost
{
  return self->_migrationBoost;
}

- (void)setMigrationBoost:(id)a3
{
  objc_storeStrong((id *)&self->_migrationBoost, a3);
}

- (unint64_t)generationCounterPostHomeGraphUpdate
{
  return self->_generationCounterPostHomeGraphUpdate;
}

- (double)homeManagerCreationTimeStamp
{
  return self->_homeManagerCreationTimeStamp;
}

- (BOOL)isViewServiceActive
{
  return self->_viewServiceActive;
}

- (void)setViewServiceActive:(BOOL)a3
{
  self->_viewServiceActive = a3;
}

- (void)setCacheManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (void)setPredictionProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (void)setSoftwareUpdateDocumentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateDocumentationManager, a3);
}

- (HMNetworkRouterFirewallRuleManager)firewallRuleManager
{
  return self->_firewallRuleManager;
}

- (HMUserCloudShareManager)userCloudShareManager
{
  return (HMUserCloudShareManager *)objc_getProperty(self, a2, 384, 1);
}

- (HMWidgetManager)widgetManager
{
  return (HMWidgetManager *)objc_getProperty(self, a2, 400, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetManager, 0);
  objc_storeStrong((id *)&self->_accessorySetupCoordinator, 0);
  objc_storeStrong((id *)&self->_userCloudShareManager, 0);
  objc_storeStrong((id *)&self->_firewallRuleManager, 0);
  objc_storeStrong((id *)&self->_softwareUpdateDocumentationManager, 0);
  objc_storeStrong((id *)&self->_predictionProvider, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncOperationQueue, 0);
  objc_storeStrong((id *)&self->_currentHomes, 0);
  objc_storeStrong((id *)&self->_accessorySettingsMetricsDispatcher, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsMetricEventDispatcher, 0);
  objc_storeStrong((id *)&self->_migrationBoost, 0);
  objc_storeStrong((id *)&self->_xpcEventRouterClient, 0);
  objc_storeStrong(&self->_timerFactory, 0);
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_homeDataCache, 0);
  objc_storeStrong((id *)&self->_homeInvitations, 0);
  objc_storeStrong((id *)&self->_privacySettingsProvider, 0);
  objc_storeStrong((id *)&self->_sharedHomeUUIDsNotYetMigrated, 0);
  objc_storeStrong((id *)&self->_hh2MigrationFailedError, 0);
  objc_storeStrong((id *)&self->_lastRemovedCurrentAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_primaryHome, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastEventStore, 0);
  objc_storeStrong((id *)&self->_batchNotificationEndTimer, 0);
  objc_storeStrong((id *)&self->_batchNotificationReasons, 0);
  objc_storeStrong((id *)&self->_refreshRequests, 0);
  objc_storeStrong(&self->_pendingChangeSetupModeOperation, 0);
}

void __69__HMHomeManager_addAndSetupAccessoriesWithPayload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "accessoryUniqueIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __69__HMHomeManager_addAndSetupAccessoriesWithPayload_completionHandler___block_invoke_671;
    v18 = &unk_1E3AB24C0;
    v19 = *(_QWORD *)(a1 + 32);
    v20 = v5;
    objc_msgSend(v7, "na_map:", &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "delegateCaller", v15, v16, v17, v18, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callCompletion:error:array:", *(_QWORD *)(a1 + 48), 0, v8);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup with suggested room name: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:array:", *(_QWORD *)(a1 + 48), v6, 0);

  }
}

id __69__HMHomeManager_addAndSetupAccessoriesWithPayload_completionHandler___block_invoke_671(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "homeUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeWithUniqueIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessoryWithUniqueIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __38__HMHomeManager_sendSetupModeMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleSetupModeMessageResponse:error:", v5, v8);

}

void __62__HMHomeManager_attemptHH2AutoMigrationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __55__HMHomeManager__saveMigrationProgressToHMCache_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
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
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v7;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Got a new cache with [%@]", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumber:forKey:", v8, CFSTR("HMHM.HH2MigrationInProgress"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "generationCounter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumber:forKey:", v9, CFSTR("HMHM.HH2MigrationGenCounterValue"));

  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    encodeRootObject(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 40);
        v18 = 138543618;
        v19 = v15;
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@HH2 Migration failed error code: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v3, "setData:forKey:", v11, CFSTR("HMHM.HH2MigrationFailedError"));
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "cacheManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "forceFlushToDisk");

}

void __74__HMHomeManager_fetchAppleMediaAccesoryDiagnosticInfo_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HMAccessoryDiagnosticInfo *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "hmf_dataForKey:", CFSTR("accessoryDiagnosticData"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
    v6 = -[HMAccessoryDiagnosticInfo initWithProtoData:]([HMAccessoryDiagnosticInfo alloc], "initWithProtoData:", v8);
  else
    v6 = 0;
  objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:obj:error:", *(_QWORD *)(a1 + 40), v6, v5);

}

void __58__HMHomeManager_clearMobileAssetsLocalInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMHomeManager_clearMobileAssetsLocalInfoWithCompletion___block_invoke_2;
  v7[3] = &unk_1E3AB60A0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "invokeBlock:", v7);

}

uint64_t __58__HMHomeManager_clearMobileAssetsLocalInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __55__HMHomeManager_updateMobileAssetsAndForce_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  if (v5)
  {
    v6 = 0;
    v7 = 0;
  }
  else
  {
    v8 = a3;
    v6 = objc_msgSend(v8, "hmf_integerForKey:error:", CFSTR("HMHomeManagerOldVersionMessageKey"), 0);
    v7 = objc_msgSend(v8, "hmf_integerForKey:error:", CFSTR("HMHomeManagerNewVersionMessageKey"), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HMHomeManager_updateMobileAssetsAndForce_completion___block_invoke_2;
  v12[3] = &unk_1E3AB2470;
  v10 = *(id *)(a1 + 40);
  v15 = v6;
  v16 = v7;
  v13 = v5;
  v14 = v10;
  v11 = v5;
  objc_msgSend(v9, "invokeBlock:", v12);

}

uint64_t __55__HMHomeManager_updateMobileAssetsAndForce_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[7], a1[4]);
}

void __63__HMHomeManager_fetchNetworkMismatchInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __58__HMHomeManager_fetchDiagnosticInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "delegateCaller");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callCompletion:obj:error:", *(_QWORD *)(a1 + 40), v6, v7);

}

void __64__HMHomeManager__testHH2MigrationWithCompletionHandler_payload___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __60__HMHomeManager__upgradeToHH2WithCompletionHandler_payload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMMigrationBoost *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMMigrationBoost *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v10;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Upgrade to HH2 request finished with error : %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "setHh2MigrationInProgress:", v5 == 0);
  objc_msgSend(*(id *)(a1 + 32), "setHh2MigrationFailedError:", v5);
  v11 = *(void **)(a1 + 32);
  v12 = objc_msgSend(v11, "isHH2MigrationInProgress");
  objc_msgSend(*(id *)(a1 + 32), "hh2MigrationFailedError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_saveMigrationProgressToHMCache:error:", v12, v13);

  objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

  v15 = [HMMigrationBoost alloc];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messageReceiveQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HMMigrationBoost initWithMessageTarget:notificationCenter:messageDispatcher:queue:](v15, "initWithMessageTarget:notificationCenter:messageDispatcher:queue:", v16, v17, v18, v19);
  objc_msgSend(*(id *)(a1 + 32), "setMigrationBoost:", v20);

  objc_msgSend(*(id *)(a1 + 32), "migrationBoost");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startBoost");

}

void __76__HMHomeManager__addKeysToRepairListIfUnique_includePrivateKeys_repairList___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D28650]);
  objc_msgSend(v10, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "publicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v10, "privateKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithIdentifier:publicKey:privateKey:", v4, v5, v6);

  }
  else
  {
    v7 = (void *)objc_msgSend(v3, "initWithIdentifier:publicKey:privateKey:", v4, v5, 0);
  }

  v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__HMHomeManager__addKeysToRepairListIfUnique_includePrivateKeys_repairList___block_invoke_2;
  v11[3] = &unk_1E3AB2420;
  v9 = v7;
  v12 = v9;
  if ((objc_msgSend(v8, "na_any:", v11) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

uint64_t __76__HMHomeManager__addKeysToRepairListIfUnique_includePrivateKeys_repairList___block_invoke_2()
{
  return HMFEqualObjects();
}

uint64_t __58__HMHomeManager_allPairingIdentitiesInRankOrderWithError___block_invoke()
{
  return HMFEqualObjects();
}

void __108__HMHomeManager_currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v34 = v11;
      v35 = 2112;
      v36 = v12;
      v37 = 2112;
      v38 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@There was an error while retrieving pairing identity for a user in the home with accessory %@ : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HM.pairingIdentity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, &v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v32;
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v14)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v34 = v20;
          v35 = 2112;
          v36 = v14;
          v37 = 2112;
          v38 = v21;
          _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@HM: Fetched pairing identity [%@] for a user in the home with accessory : %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v34 = v28;
          v35 = 2112;
          v36 = v29;
          v37 = 2112;
          v38 = v15;
          _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identity a user in the home with accessory from encoded pairing identity: %@, %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        v30 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v30 + 16))(v30, 0, v31);

      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v34 = v25;
        v35 = 2112;
        v36 = v26;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@HomeKitDaemon did not send any pairing identity a user in the home with accessory : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v27 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v27 + 16))(v27, 0, v15);
    }

  }
}

void __77__HMHomeManager_pairingIdentityForAccessoryWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v34 = v11;
      v35 = 2112;
      v36 = v12;
      v37 = 2112;
      v38 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@There was an error while retrieving pairing identity for %@ : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HM.pairingIdentity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v32 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, &v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v32;
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v14)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v34 = v20;
          v35 = 2112;
          v36 = v14;
          v37 = 2112;
          v38 = v21;
          _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@HM: Fetched pairing identity [%@] for accessory : %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v34 = v28;
          v35 = 2112;
          v36 = v29;
          v37 = 2112;
          v38 = v15;
          _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identity from encoded pairing identity: %@, %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        v30 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v30 + 16))(v30, 0, v31);

      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v34 = v25;
        v35 = 2112;
        v36 = v26;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@HomeKitDaemon did not send any pairing identity for accessory : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v27 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v27 + 16))(v27, 0, v15);
    }

  }
}

uint64_t __46__HMHomeManager__handleDevicesUpdatedMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateDevices:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __106__HMHomeManager__updateInvitation_presenceAuthStatus_invitationState_invitationOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

uint64_t __59__HMHomeManager__handleUserInvitationsUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateStateForIncomingInvitations:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __39__HMHomeManager__mergeHomeInvitations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed invitation via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __39__HMHomeManager__mergeHomeInvitations___block_invoke_618(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added invitation via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __39__HMHomeManager__mergeHomeInvitations___block_invoke_620(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__HMHomeManager__mergeHomeInvitations___block_invoke_2;
  v6[3] = &unk_1E3AB5CD0;
  v4 = a1[5];
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  v9 = a1[6];
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __39__HMHomeManager__mergeHomeInvitations___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateStateForIncomingInvitations:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if (!v9)
    goto LABEL_10;
  if (objc_msgSend(*(id *)(a1 + 32), "isDaemonRunningWithROARFramework"))
  {
    objc_msgSend(v5, "currentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeAccessControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isOwner"))
    {

      goto LABEL_6;
    }
    objc_msgSend(v5, "currentUser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HMFEqualObjects();

    if ((v16 & 1) != 0)
      goto LABEL_6;
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v21;
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Found different current user unique identifiers, so not considering homes to be the same even though they have the same unique identifier. Current home: %@, new home: %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
LABEL_6:
  v17 = 1;
LABEL_11:

  return v17;
}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_603(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfBatchNotificationsStartWithReason:", *(_QWORD *)(a1 + 40));
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    v12 = 2048;
    v13 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed home via merge: %@ (%p)", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "unconfigure");

}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_605(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    v13 = 2048;
    v14 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added home via merge: %@ (%p)", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__configureWithContext:homeManager:", v8, *(_QWORD *)(a1 + 32));

}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_606(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_608;
    block[3] = &unk_1E3AB5CD0;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v4;
    dispatch_async(v6, block);

  }
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_609(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_611;
    block[3] = &unk_1E3AB5CD0;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v4;
    dispatch_async(v6, block);

  }
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_613(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_614;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_615(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestRefresh");
}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_616(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfBatchNotificationsEndWithReason:", *(_QWORD *)(a1 + 40));
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_614(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(*(id *)(a1 + 32), "_updateCurrentHome:", *(_QWORD *)(a1 + 40)));
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentHome");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Updated current home: %@ due to current home merge", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_611(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_3_612;
  v5[3] = &unk_1E3AB5CD0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_3_612(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    v7 = a1[6];
    objc_msgSend(v6, "currentUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "currentUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544642;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did add home: %p/%@ delegate: %@ with current user : %@ / %@", (uint8_t *)&v12, 0x3Eu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(a1[6], "homeManager:didAddHome:", a1[4], a1[5]);
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_608(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_3;
  v5[3] = &unk_1E3AB5CD0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed home: %p / %@", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "homeManager:didRemoveHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __44__HMHomeManager__forceBatchNotificationsEnd__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidEndBatchNotifications:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__HMHomeManager__notifyDelegateOfAppDataUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidUpdateApplicationData:", *(_QWORD *)(a1 + 40));
}

void __51__HMHomeManager__updatePrimaryHome_notifyDelegate___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated primary home", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(a1[5], "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HMHomeManager__updatePrimaryHome_notifyDelegate___block_invoke_590;
  v9[3] = &unk_1E3AB5ED8;
  v7 = a1[6];
  v8 = a1[4];
  v10 = v7;
  v11 = v8;
  objc_msgSend(v6, "invokeBlock:", v9);

}

uint64_t __51__HMHomeManager__updatePrimaryHome_notifyDelegate___block_invoke_590(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidUpdatePrimaryHome:", *(_QWORD *)(a1 + 40));
}

void __38__HMHomeManager__dumpCaches_metadata___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];

  v2[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("kAccessAllowedWhenLockedKey");
  v2[1] = CFSTR("kCanUseCachedHomeConfigurationKey");
  v2[2] = CFSTR("kConfigGenerationCounterKey");
  v2[3] = CFSTR("kHAPMetadataVersionKey");
  v2[4] = CFSTR("kHomeCountKey");
  v2[5] = CFSTR("kHomeDataKey");
  v2[6] = CFSTR("kPrimaryHomeUUIDKey");
  v2[7] = CFSTR("dataSyncState");
  v2[8] = CFSTR("status");
  v2[9] = CFSTR("kProvisioningStatusKey");
  v2[10] = CFSTR("multiUserStatus");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_dumpCaches_metadata__keysToDump;
  _dumpCaches_metadata__keysToDump = v0;

}

uint64_t __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_559(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mergeCurrentHomesWithNewHomes:newPrimaryHome:newCurrentHome:newInvitations:newAppData:refreshRequested:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80));
}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_562(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v7, "uuid", (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setPrimary:", objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 40)));

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 48), "homeInvitations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setArray:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 48), "_updateAppData:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "_setInitialHomes:", *(_QWORD *)(a1 + 32));
  v10 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(*(id *)(a1 + 48), "_updateCurrentHome:", *(_QWORD *)(a1 + 72)));
  v11 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "currentHome");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Updated current home: %@ due to home configuration request", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_564(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_2;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_566(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  __int128 v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_2_567;
  v4[3] = &unk_1E3AB5CD0;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v4);

}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_2_567(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client that home: %@ has been removed permanently.", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "homeManager:didRemoveHomePermanently:", v8, v9);

}

uint64_t __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client that current accessory was removed.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "homeManagerDidRemoveCurrentAccessory:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__HMHomeManager__handleHomeSafetySecurityEnabledStateWithPayload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateHomeSafetySecurityEnabled:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __66__HMHomeManager__handleHH2ManualMigrationEnabledStateWithPayload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateHH2MigrationAvailableState:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __61__HMHomeManager__handleHH2MigrationProgressStateWithPayload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateHH2MigrationInProgressState:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __44__HMHomeManager__handleHH2StateWithPayload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateHH2State:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_privateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1A1AC1AAC]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying client of assistant identifier update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke_544;
    v10[3] = &unk_1E3AB5ED8;
    v8 = v2;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v7, "invokeBlock:", v10);

  }
}

uint64_t __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke_544(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidUpdateAssistantIdentifiers:", *(_QWORD *)(a1 + 40));
}

uint64_t __74__HMHomeManager___processSyncResponse_refreshRequested_completionHandler___block_invoke_541(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeCaches:homeData:metadata:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
}

void __93__HMHomeManager__pingDeviceWithUUID_monitor_secure_restrictToLocalNetwork_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __61__HMHomeManager___removeAccountWithHandle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __65__HMHomeManager___removeAccountWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __58__HMHomeManager___resolveAccountHandle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __74__HMHomeManager_checkName_inHome_withValidationOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "hmf_stringForKey:", CFSTR("conflictName"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__HMHomeManager_generateFirewallRuleTLVsFromNetworkDeclarations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v5, "hmf_dataForKey:", CFSTR("fileString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callCompletion:obj:error:", *(_QWORD *)(a1 + 32), v7, v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v7);
  }

LABEL_6:
}

void __65__HMHomeManager_updateAccessAllowedWhenLocked_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _Block_copy(*(const void **)(a1 + 40));
    v17 = 138544130;
    v18 = v10;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Update access allowed when locked : %@, completionHandler: %@ error %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 40);
    v16 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setAccessAllowedWhenLocked:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 40);
    v16 = 0;
  }
  objc_msgSend(v13, "callCompletion:error:", v15, v16);

}

void __70__HMHomeManager_updateResidentEnabledForThisDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v3, "removeCompletionBlockForIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", v7, v5);

  }
}

void __57__HMHomeManager_updateApplicationData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v8 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "setApplicationData:", *(_QWORD *)(a1 + 32));
    WeakRetained = v8;
  }
  objc_msgSend(WeakRetained, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __57__HMHomeManager_updateApplicationData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __59__HMHomeManager_updateiCloudSwitchState_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__HMHomeManager_queryiCloudSwitchStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (!v5)
    objc_msgSend(a3, "hmf_BOOLForKey:", CFSTR("kiCloudSwitchStateKey"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __47__HMHomeManager_setMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v3, "removeCompletionBlockForIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", v7, v5);

  }
}

void __49__HMHomeManager_queryMetadata_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 138543874;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@queryMetadata '%@' failed with error %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(*(id *)(a1 + 40), "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegateCaller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("kMetadataDictionaryKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "callCompletion:error:dictionary:", v13, v5, v14);

}

void __55__HMHomeManager_resetLastTTRTimeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __52__HMHomeManager_presentTTRDialog_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __76__HMHomeManager_submitLogEventDailySchedulerRegisteredBlocksWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __67__HMHomeManager_requestLogEventDailySchedulerStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callCompletion:error:dictionary:", *(_QWORD *)(a1 + 32), v7, v6);

}

void __36__HMHomeManager_resetEventCounters___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __36__HMHomeManager_fetchEventCounters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callCompletion:error:dictionary:", *(_QWORD *)(a1 + 32), v7, v6);

}

void __55__HMHomeManager_listEphemeralContainersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callCompletion:error:dictionary:", *(_QWORD *)(a1 + 32), v7, v6);

}

void __62__HMHomeManager_startupEphemeralContainerWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __61__HMHomeManager_deleteEphemeralContainerWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __65__HMHomeManager_deactivateEphemeralContainerWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __58__HMHomeManager_addEphemeralContainerWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __63__HMHomeManager_deleteCountersBeforeDate_afterDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __44__HMHomeManager_saveCountersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __140__HMHomeManager_readCountersForGroup_homeUUIDString_accessoryUUIDString_counter_statistics_datePartition_ephemeralContainerName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callCompletion:error:dictionary:", *(_QWORD *)(a1 + 32), v7, v6);

}

void __46__HMHomeManager_dumpState_payload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callCompletion:error:dictionary:", *(_QWORD *)(a1 + 32), v7, v6);

}

void __51__HMHomeManager_queryVersionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
  }
  else
  {
    objc_msgSend(a3, "hmf_stringForKey:", CFSTR("kHomeKitVersionStringKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegateCaller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__HMHomeManager_queryVersionWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E3AB5C58;
  v11 = *(id *)(a1 + 32);
  v16 = v6;
  v17 = v11;
  v15 = v7;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v10, "invokeBlock:", v14);

}

uint64_t __51__HMHomeManager_queryVersionWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __61__HMHomeManager_queryHomeKitUsageStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v9 = v5;
  if (v5)
  {
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateCaller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "callCompletion:isUsingHomeKit:isUsingCloudServices:error:", *(_QWORD *)(a1 + 40), 0, 0, v9);

  }
  else
  {
    objc_msgSend(v6, "_handleQueryHomeKitUsageStateResponse:completionHandler:", a3, *(_QWORD *)(a1 + 40));
  }

}

void __66__HMHomeManager_eraseHomeDataAndDeleteMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 32), v4);

}

void __46__HMHomeManager_removeHome_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      v23 = 2114;
      v24 = v12;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to remove home: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "callCompletion:error:", a1[8], v5);

  }
  else
  {
    objc_msgSend(a1[6], "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__HMHomeManager_removeHome_completionHandler___block_invoke_494;
    block[3] = &unk_1E3AB52E0;
    v15 = a1[5];
    block[4] = a1[4];
    v17 = v15;
    v18 = a1[7];
    v19 = a1[6];
    v20 = a1[8];
    dispatch_async(v14, block);

  }
}

void __46__HMHomeManager_removeHome_completionHandler___block_invoke_494(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully removed home", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "currentHomes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 48), "unconfigure");
  objc_msgSend(*(id *)(a1 + 56), "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callCompletion:error:", *(_QWORD *)(a1 + 64), 0);

}

void __51__HMHomeManager_addHomeWithName_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      v21 = 2114;
      v22 = v12;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add home: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "callCompletion:home:error:", a1[7], 0, v5);

  }
  else
  {
    objc_msgSend(a1[4], "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__HMHomeManager_addHomeWithName_completionHandler___block_invoke_491;
    block[3] = &unk_1E3AB5C58;
    block[4] = a1[4];
    v17 = v6;
    v18 = a1[7];
    dispatch_async(v15, block);

  }
}

uint64_t __51__HMHomeManager_addHomeWithName_completionHandler___block_invoke_491(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processHomeAddedPayload:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __53__HMHomeManager_updatePrimaryHome_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 56);
    v6 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_updatePrimaryHome:notifyDelegate:", *(_QWORD *)(a1 + 48), 0);
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 56);
    v6 = 0;
  }
  objc_msgSend(v3, "callCompletion:error:", v5, v6);

}

void __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  dispatch_qos_class_t v16;
  uint64_t v17;
  id v18;
  dispatch_block_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (v4 && (objc_msgSend(v4, "isHMError") & 1) == 0)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D27FC8]);

    if (v7)
    {
      v8 = objc_msgSend(v4, "code");
      v9 = 52;
      if (v8 == 13)
        v9 = 8;
      if (v8 == 12)
        v10 = 23;
      else
        v10 = v9;
    }
    else
    {
      v10 = 52;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", v10, 0, 0, 0, v4);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v11;
  }
  v12 = (void *)MEMORY[0x1A1AC1AAC]();
  v13 = WeakRetained;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v15;
    v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Completed refresh request with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v3, "qualityOfService");
  v16 = HMFQOSClassFromQualityOfService();
  v17 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_480;
  block[3] = &unk_1E3AB60A0;
  v29 = a1[4];
  v18 = v4;
  v28 = v18;
  v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, block);
  v20 = v19;
  if (v13)
  {
    objc_msgSend(v13, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "delegateCaller");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "invokeBlock:", v20);

    if (v3)
    {
      objc_msgSend(v13, "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "queue");
      v24 = objc_claimAutoreleasedReturnValue();
      v25[0] = v17;
      v25[1] = 3221225472;
      v25[2] = __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_2;
      v25[3] = &unk_1E3AB5ED8;
      v25[4] = v13;
      v26 = v3;
      dispatch_async(v24, v25);

    }
  }
  else
  {
    (*((void (**)(dispatch_block_t))v19 + 2))(v19);
  }

}

void __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_481(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "generationCounter");
  v3 = objc_msgSend(*(id *)(a1 + 32), "serverGenerationCounter");
  if (v2 != -1 && v2 >= v3)
  {
    v6 = v3;
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v10;
      v16 = 2048;
      v17 = v2;
      v18 = 2048;
      v19 = v6;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Informing client a refresh is not needed (%tu-%tu)", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "finish");
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v5)
    {
      objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(a1 + 40));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 32);
      *(_QWORD *)(v12 + 32) = v11;

    }
  }
}

uint64_t __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_480(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "hmf_isEmpty"))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 32);
      *(_QWORD *)(v3 + 32) = 0;

    }
  }
}

uint64_t __47__HMHomeManager_setResidentProvisioningStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:residentProvisioningStatusChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __55__HMHomeManager__notifyAccessAllowedWhenLockedUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateAccessAllowedWhenLocked with : %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "homeManager:didUpdateAccessAllowedWhenLocked:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __46__HMHomeManager_notifyResidentEnabledUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateResidentEnabledForThisDevice:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __46__HMHomeManager_notifyResidentCapableUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateThisDeviceIsResidentCapable:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __56__HMHomeManager__updateStatusWithPayload_sourceIsFetch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManager:didUpdateStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __38__HMHomeManager__updateDataSyncState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidUpdateDataSyncState:", *(_QWORD *)(a1 + 40));
}

uint64_t __38__HMHomeManager__updateDataSyncState___block_invoke_387(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeManagerDidUpdateDataSyncInProgress:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__HMHomeManager__notifyClientOfMultiUserStateChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client of multi user state change %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "homeManager:didUpdateMultiUserStatus:reason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __24__HMHomeManager_dealloc__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "_unconfigure");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_unconfigure", (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

uint64_t __152__HMHomeManager_initWithUUID_configuration_context_xpcEventRouterClient_lastEventStore_timerFactory_darwinNotificationProvider_privacySettingsProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__start");
}

+ (void)fetchSetupModeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _HMContext *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "+[HMHomeManager fetchSetupModeWithCompletion:]", CFSTR("completion"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v5 = v4;
  v6 = -[_HMContext initWithName:]([_HMContext alloc], "initWithName:", CFSTR("com.apple.HomeKit.SetupMode"));
  v7 = (void *)MEMORY[0x1E0D285F8];
  v8 = objc_alloc(MEMORY[0x1E0D285D8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);
  objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("HMHM.fetchSetupMode"), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__HMHomeManager_fetchSetupModeWithCompletion___block_invoke;
  v20[3] = &unk_1E3AB3A50;
  v21 = v5;
  v12 = v5;
  objc_msgSend(v11, "setResponseHandler:", v20);
  -[_HMContext messageDispatcher](v6, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v11);

}

void __46__HMHomeManager_fetchSetupModeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "hmf_numberForKey:", CFSTR("mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && v5)
    objc_msgSend(v5, "BOOLValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)removeAllHomeKitPairingIdentities
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMHomeManager *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  HMHomeManager *v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  void *v22;
  HMHomeManager *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _QWORD v29[5];
  NSObject *v30;
  __int128 *p_buf;
  uint8_t v32[4];
  void *v33;
  __int128 buf;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[HMHomeManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to delete all the HomeKit Pairing Identities before TTSU... Start", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v35 = 0x2020000000;
    v36 = 0;
    v9 = objc_alloc(MEMORY[0x1E0D285F8]);
    v10 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMHomeManager uuid](v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithTarget:", v11);
    v13 = (void *)objc_msgSend(v9, "initWithName:destination:payload:", CFSTR("HMHM.RemoveAllPairingIdentities"), v12, MEMORY[0x1E0C9AA70]);

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __67__HMHomeManager_PairingIdentity__removeAllHomeKitPairingIdentities__block_invoke;
    v29[3] = &unk_1E3AB2530;
    v29[4] = v6;
    p_buf = &buf;
    v14 = v4;
    v30 = v14;
    objc_msgSend(v13, "setResponseHandler:", v29);
    objc_msgSend(v3, "messageDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendMessage:", v13);

    v16 = dispatch_time(0, 20000000000);
    LOBYTE(v12) = dispatch_group_wait(v14, v16) == 0;
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = v6;
    if ((v12 & 1) != 0)
    {
      HMFGetOSLogHandle();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v32 = 138543362;
        v33 = v27;
        _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_INFO, "%{public}@Going to delete all the HomeKit Pairing Identities before TTSU... End", v32, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v21 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
    }
    else
    {
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v32 = 138543362;
        v33 = v20;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Timed out while deleting the HomeKit pairing identities.", v32, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v21 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context. Please initialize HomeKit properly", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 0;
  }

  return v21;
}

void __67__HMHomeManager_PairingIdentity__removeAllHomeKitPairingIdentities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Removing of all the HomeKit Pairing Identities finished with error : %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully removed all the HomeKit Pairing Identities.", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (id)_beginActiveAssertionWithReason:(id)a3
{
  __HMActiveAssertion *v4;
  void *v5;
  HMHomeManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  __HMActiveAssertion *v10;
  void *v11;
  void *v12;
  __HMActiveAssertion *v13;
  void *v14;
  HMHomeManager *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  __HMActiveAssertion *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (__HMActiveAssertion *)a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Taking active assertion with reason: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.HomeKit.ActiveAssertion.%@"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [__HMActiveAssertion alloc];
  -[HMHomeManager context](v6, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager messageTargetUUID](v6, "messageTargetUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[__HMActiveAssertion initWithName:context:messageTargetUUID:](v10, "initWithName:context:messageTargetUUID:", v9, v11, v12);

  v14 = (void *)MEMORY[0x1A1AC1AAC](-[__HMActiveAssertion acquire:](v13, "acquire:", 0));
  v15 = v6;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v17;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Took active assertion: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);

  return v13;
}

- (void)_endActiveAssertion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMHomeManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid assertion object"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Ending active assertion: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "invalidate");

}

- (void)enableUARPPacketCapture:(BOOL)a3 capturePath:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMHomeManager *v27;
  NSObject *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v6 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager(HMHomeManagerAdaptive) enableUARPPacketCapture:capturePath:completionHandler:]", CFSTR("completion"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v29;
      v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v25, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v10 = v9;
  v33[0] = CFSTR("HMHomeManagerEnableUARPPacketCaptureEnableMessageKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = CFSTR("HMHomeManagerEnableUARPPacketCapturePathMessageKey");
  v34[0] = v11;
  v34[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0D285F8]);
  v14 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);
  v17 = (void *)objc_msgSend(v13, "initWithName:destination:payload:", CFSTR("HMHomeManagerEnableUARPPacketCaptureMessage"), v16, v12);

  -[HMHomeManager context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pendingRequests");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = _Block_copy(v10);
  objc_msgSend(v19, "addCompletionBlock:forIdentifier:", v21, v20);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __94__HMHomeManager_HMHomeManagerAdaptive__enableUARPPacketCapture_capturePath_completionHandler___block_invoke;
  v31[3] = &unk_1E3AB59B8;
  v31[4] = self;
  v32 = v10;
  v22 = v10;
  objc_msgSend(v17, "setResponseHandler:", v31);
  -[HMHomeManager context](self, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendMessage:", v17);

}

- (void)dumpCloudDatabase:(BOOL)a3 localDatabase:(BOOL)a4 workingDatabase:(BOOL)a5 fakeCloudModels:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMHomeManager *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  _QWORD v38[4];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager(HMHomeManagerAdaptive) dumpCloudDatabase:localDatabase:workingDatabase:fakeCloudModels:completion:]", CFSTR("completion"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1A1AC1AAC]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v31;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v27, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  v13 = v12;
  -[HMHomeManager context](self, "context");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D285F8];
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);
  v37[0] = CFSTR("c");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v18;
  v37[1] = CFSTR("f");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v19;
  v37[2] = CFSTR("l");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v20;
  v37[3] = CFSTR("w");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageWithName:destination:payload:", CFSTR("HMHM.dumpDatabase"), v17, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __115__HMHomeManager_HMHomeManagerAdaptive__dumpCloudDatabase_localDatabase_workingDatabase_fakeCloudModels_completion___block_invoke;
  v34[3] = &unk_1E3AB59B8;
  v35 = v33;
  v36 = v13;
  v24 = v13;
  v25 = v33;
  objc_msgSend(v23, "setResponseHandler:", v34);
  objc_msgSend(v25, "messageDispatcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendMessage:completionHandler:", v23, 0);

}

- (void)checkIsUsingProductionObjectModelWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMHomeManager *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager(HMHomeManagerAdaptive) checkIsUsingProductionObjectModelWithCompletion:]", CFSTR("completion"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = (const char *)v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v6 = (void *)v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0D285F8];
    v8 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMHomeManager uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);
    objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("HMHM.checkIsUsingProductionObjectModel"), v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88__HMHomeManager_HMHomeManagerAdaptive__checkIsUsingProductionObjectModelWithCompletion___block_invoke;
    v24[3] = &unk_1E3AB59B8;
    v12 = v6;
    v25 = v12;
    v26 = v4;
    objc_msgSend(v11, "setResponseHandler:", v24);
    objc_msgSend(v12, "messageDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendMessage:completionHandler:", v11, 0);

  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      v29 = 2080;
      v30 = "-[HMHomeManager(HMHomeManagerAdaptive) checkIsUsingProductionObjectModelWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v11);
  }

}

- (void)deleteDatabaseEntityWithModelID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMHomeManager *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  const __CFString *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMHomeManager context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMHomeManager(HMHomeManagerAdaptive) deleteDatabaseEntityWithModelID:completion:]", CFSTR("completion"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v26;
      v35 = 2112;
      v36 = (const char *)v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0D285F8];
    v11 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMHomeManager uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);
    v31 = CFSTR("modelId");
    v32 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageWithName:destination:payload:", CFSTR("HMHM.deleteHH2Entity"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __83__HMHomeManager_HMHomeManagerAdaptive__deleteDatabaseEntityWithModelID_completion___block_invoke;
    v28[3] = &unk_1E3AB59B8;
    v16 = v9;
    v29 = v16;
    v30 = v7;
    objc_msgSend(v15, "setResponseHandler:", v28);
    objc_msgSend(v16, "messageDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendMessage:completionHandler:", v15, 0);

  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v21;
      v35 = 2080;
      v36 = "-[HMHomeManager(HMHomeManagerAdaptive) deleteDatabaseEntityWithModelID:completion:]";
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);
  }

}

void __83__HMHomeManager_HMHomeManagerAdaptive__deleteDatabaseEntityWithModelID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callCompletion:obj:error:", *(_QWORD *)(a1 + 40), 0, v7);
  }
  else
  {
    objc_msgSend(a3, "hmf_stringForKey:", CFSTR("entity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:obj:error:", *(_QWORD *)(a1 + 40), v5, 0);

  }
}

void __88__HMHomeManager_HMHomeManagerAdaptive__checkIsUsingProductionObjectModelWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 0;
    v9 = v11;
  }
  else
  {
    v10 = objc_msgSend(a3, "hmf_BOOLForKey:", CFSTR("usingProductionObjectModel"));
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v10;
    v9 = 0;
  }
  objc_msgSend(v5, "callCompletion:value:error:", v7, v8, v9);

}

void __115__HMHomeManager_HMHomeManagerAdaptive__dumpCloudDatabase_localDatabase_workingDatabase_fakeCloudModels_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a3, "hmf_dataForKey:", CFSTR("d"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:obj:error:", *(_QWORD *)(a1 + 40), v6, v8);

}

void __94__HMHomeManager_HMHomeManagerAdaptive__enableUARPPacketCapture_capturePath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

- (void)prepareForDiagnosticExtensionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  -[HMHomeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D285F8];
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMHomeManager uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);
  objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMHM.prepareForDiagnosticExtension"), v9, MEMORY[0x1E0C9AA70]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __82__HMHomeManager_DiagnosticExtension__prepareForDiagnosticExtensionWithCompletion___block_invoke;
  v17 = &unk_1E3AB59B8;
  v18 = v5;
  v19 = v4;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v10, "setResponseHandler:", &v14);
  objc_msgSend(v12, "messageDispatcher", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:completionHandler:", v10, 0);

}

void __82__HMHomeManager_DiagnosticExtension__prepareForDiagnosticExtensionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

- (id)accessorySettingsDataSource:(id)a3 homeWithHomeIdentifier:(id)a4
{
  return -[HMHomeManager homeWithUniqueIdentifier:](self, "homeWithUniqueIdentifier:", a4);
}

- (BOOL)accessorySettingsDataSource:(id)a3 transformHomeUUID:(id)a4 accessoryUUID:(id)a5 toClientHomeIdentifier:(id *)a6 clientAccessoryIdentifier:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[HMHomeManager currentHomes](self, "currentHomes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstItemWithUUID:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "accessoryWithUUID:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 != 0;
    if (v17)
    {
      if (a6)
      {
        objc_msgSend(v16, "uniqueIdentifier");
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a7)
      {
        objc_msgSend(v17, "uniqueIdentifier");
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1A1AC1AAC]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v26;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v16;
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no accessory with uuid: %@ home: %@", (uint8_t *)&v28, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no home with uuid: %@", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = 0;
  }

  return v18;
}

- (BOOL)accessorySettingsDataSource:(id)a3 transformHomeUUID:(id)a4 mediaSystemUUID:(id)a5 toClientHomeIdentifier:(id *)a6 clientMediaSystemIdentifier:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  HMHomeManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMHomeManager *v24;
  NSObject *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[HMHomeManager currentHomes](self, "currentHomes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstItemWithUUID:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "mediaSystemWithUUID:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 != 0;
    if (v17)
    {
      if (a6)
      {
        objc_msgSend(v16, "uniqueIdentifier");
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a7)
      {
        objc_msgSend(v17, "uniqueIdentifier");
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1A1AC1AAC]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v26;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v16;
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no media system with uuid: %@ home: %@", (uint8_t *)&v28, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no home with uuid: %@", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v18 = 0;
  }

  return v18;
}

- (id)createAccessorySettingsMessengerWithHomeUUID:(id)a3
{
  id v4;
  void *v5;
  HMHomeManager *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMAccessorySettingsMessenger *v12;
  void *v13;
  void *v14;
  HMAccessorySettingsMessenger *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating accessory settings messenger with home uuid: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMHomeManager accessorySettingsMetricsDispatcher](v6, "accessorySettingsMetricsDispatcher");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    _HMFPreconditionFailure();
  v10 = (void *)v9;
  +[HMAccessorySettingsMessenger messageTargetUUIDWithHomeUUID:](HMAccessorySettingsMessenger, "messageTargetUUIDWithHomeUUID:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [HMAccessorySettingsMessenger alloc];
  -[HMHomeManager context](v6, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMAccessorySettingsMessenger initWithMessageDispatcher:messageTargetUUID:metricsDispatcher:](v12, "initWithMessageDispatcher:messageTargetUUID:metricsDispatcher:", v14, v11, v10);

  return v15;
}

- (void)createAutoAddWalletKeySupressionAssertionWithIncomingInvitation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMAutoAddWalletKeySupressionAssertion *v10;
  void *v11;
  HMHomeManager *v12;
  NSObject *v13;
  void *v14;
  HMAutoAddWalletKeySupressionAssertion *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  HMAutoAddWalletKeySupressionAssertion *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "homeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMAutoAddWalletKeySupressionAssertion initWithHomeManager:homeUUID:]([HMAutoAddWalletKeySupressionAssertion alloc], "initWithHomeManager:homeUUID:", self, v8);
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v14;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Acquiring auto add wallet key suppression assertion for home: %@ invitation: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __100__HMHomeManager_Wallet__createAutoAddWalletKeySupressionAssertionWithIncomingInvitation_completion___block_invoke;
  v18[3] = &unk_1E3AB4210;
  v18[4] = v12;
  v19 = v9;
  v20 = v10;
  v21 = v7;
  v15 = v10;
  v16 = v7;
  v17 = v9;
  -[HMAutoAddWalletKeySupressionAssertion acquireWithCompletion:](v15, "acquireWithCompletion:", v18);

}

void __100__HMHomeManager_Wallet__createAutoAddWalletKeySupressionAssertionWithIncomingInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to acquire auto add wallet key suppression assertion for invitation %@:%@", (uint8_t *)&v12, 0x20u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully acquired auto add wallet key suppression assertion for invitation: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)handleInstanceDestroyed
{
  void *v3;

  if (isInternalBuild())
  {
    os_unfair_lock_lock_with_options();
    objc_msgSend((id)objc_opt_class(), "instanceTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", self);

    os_unfair_lock_unlock((os_unfair_lock_t)&instanceTrackerLock);
  }
}

@end
