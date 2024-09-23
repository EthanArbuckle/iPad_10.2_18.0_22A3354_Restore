@implementation HMDResidentDeviceManagerLegacy

- (BOOL)isResidentAvailable
{
  HMDResidentDeviceManagerLegacy *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_residentAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isCurrentDeviceAvailableResident
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "device");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isCurrentDevice");

        if ((v8 & 1) != 0)
        {
          LOBYTE(v3) = objc_msgSend(v6, "isEnabled");
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)residentDevices
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_residentDevices, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (HMDResidentDevice)primaryResidentDevice
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_primaryResidentUUID;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_residentDevices;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSUUID isEqual:](v4, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return (HMDResidentDevice *)v6;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerLegacy primaryResidentDevice](self, "primaryResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevice");

  return v3;
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerLegacy primaryResidentDevice](self, "primaryResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isCurrentDevice"))
    v3 = objc_msgSend(v2, "isConfirmed");
  else
    v3 = 0;

  return v3;
}

- (HMDResidentDeviceManagerLegacy)init
{
  HMDDefaultResidentDeviceManagerLegacyDataSource *v3;
  HMDResidentDeviceManagerLegacy *v4;

  v3 = objc_alloc_init(HMDDefaultResidentDeviceManagerLegacyDataSource);
  v4 = -[HMDResidentDeviceManagerLegacy initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (HMDResidentDeviceManagerLegacy)initWithDataSource:(id)a3
{
  id v5;
  HMDResidentDeviceManagerLegacy *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSString *logIdentifier;
  uint64_t v10;
  NSMutableSet *residentDevices;
  uint64_t v12;
  NSNotificationCenter *notificationCenter;
  uint64_t v14;
  NSHashTable *devicePreferenceDataSources;
  uint64_t v16;
  HMFFuture *cloudReady;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDResidentDeviceManagerLegacy;
  v6 = -[HMDResidentDeviceManagerLegacy init](&v23, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)CFSTR("<unconfigured>");

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    residentDevices = v6->_residentDevices;
    v6->_residentDevices = (NSMutableSet *)v10;

    v6->_fixupRemoteResidentDevice = 1;
    v6->_verifyCurrentResidentDevice = 1;
    objc_msgSend(v5, "notificationCenter");
    v12 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v6->_notificationCenter;
    v6->_notificationCenter = (NSNotificationCenter *)v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v14 = objc_claimAutoreleasedReturnValue();
    devicePreferenceDataSources = v6->_devicePreferenceDataSources;
    v6->_devicePreferenceDataSources = (NSHashTable *)v14;

    objc_msgSend(MEMORY[0x1E0D28588], "futureWithPromise:", &v6->_cloudReadyPromise);
    v16 = objc_claimAutoreleasedReturnValue();
    cloudReady = v6->_cloudReady;
    v6->_cloudReady = (HMFFuture *)v16;

    -[HMDResidentDeviceManagerLegacy notificationCenter](v6, "notificationCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v6, sel__handleCloudZoneReadyNotification_, CFSTR("HMDCloudZoneReadyNotification"), 0);

    -[HMDResidentDeviceManagerLegacy notificationCenter](v6, "notificationCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v6, sel_handleCurrentDeviceChanged_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), 0);

    -[HMDResidentDeviceManagerLegacy notificationCenter](v6, "notificationCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel_handleResidentDeviceIsReachable_, CFSTR("HMDRemoteDeviceIsReachableNotification"), 0);

    -[HMDResidentDeviceManagerLegacy notificationCenter](v6, "notificationCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel_handleResidentDeviceIsNotReachable_, CFSTR("HMDRemoteDeviceIsNotReachableNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDResidentDeviceManagerLegacy messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDResidentDeviceManagerLegacy;
  -[HMDResidentDeviceManagerLegacy dealloc](&v4, sel_dealloc);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  HMDHome **p_home;
  id v5;
  void *v6;
  NSString *v7;
  NSString *logIdentifier;
  void *v9;
  id v10;

  p_home = &self->_home;
  v5 = a3;
  objc_storeWeak((id *)p_home, v5);
  -[HMDResidentDeviceManagerLegacy dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logIdentifierForHome:", v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  logIdentifier = self->_logIdentifier;
  self->_logIdentifier = v7;

  -[HMDResidentDeviceManagerLegacy notificationCenter](self, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleHomeUpdatedAccessories_, CFSTR("HMDNotificationHomeAddedAccessory"), v5);

  -[HMDResidentDeviceManagerLegacy notificationCenter](self, "notificationCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleHomeUpdatedAccessories_, CFSTR("HMDHomeAccessoryRemovedNotification"), v5);

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HMDResidentDeviceManagerLegacy_invalidate__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  -[HMDResidentDeviceManagerLegacy home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerLegacy messageDispatcher](self, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("kResidentDeviceUpdateEnabledRequestKey"), self, v8, sel__handleResidentDeviceUpdateEnabled_);

  -[HMDResidentDeviceManagerLegacy localNetworkElection](self, "localNetworkElection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessages");

  -[HMDResidentDeviceManagerLegacy legacyElection](self, "legacyElection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessages");

}

- (BOOL)isResidentElectionV2Enabled
{
  void *v2;
  BOOL v3;

  -[HMDResidentDeviceManagerLegacy localNetworkElection](self, "localNetworkElection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasTrustZoneCapableResident
{
  HMDHomeKitVersion *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("6.1"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "device");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "version");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isAtLeastVersion:", v3);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)confirmWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HMDResidentDeviceManagerLegacy_confirmWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)confirmAsResident
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HMDResidentDeviceManagerLegacy_confirmAsResident__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)confirmOnAvailability
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HMDResidentDeviceManagerLegacy_confirmOnAvailability__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)atHomeLevelChanged:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__HMDResidentDeviceManagerLegacy_atHomeLevelChanged___block_invoke;
  v4[3] = &unk_1E89C0B98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)run
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HMDResidentDeviceManagerLegacy_run__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_run
{
  void *v3;
  HMDResidentDeviceManagerLegacy *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDResidentDeviceManagerLegacy *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HMDResidentDeviceManagerLegacy *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Running", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentDeviceManagerLegacy queue](v4, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDResidentDeviceManagerLegacy primaryResidentDevice](v4, "primaryResidentDevice");
  v8 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v8;
  if (!v8)
  {
    -[HMDPrimaryElectionLegacyAddOn performElectionWithReason:](v4->_legacyElection, "performElectionWithReason:", 0);
    -[HMDResidentDeviceManagerLegacy home](v4, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v9 = (void *)v8;
  -[HMDResidentDeviceManagerLegacy home](v4, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HMDResidentDeviceManagerLegacy isResidentSupported](v4, "isResidentSupported"))
  {
LABEL_11:
    -[HMDResidentDeviceManagerLegacy messageDispatcher](v4, "messageDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "remoteAccessDeviceForHome:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "capabilities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isResidentCapable");

    if (v21)
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v4;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v25;
        v53 = 2112;
        v54 = v19;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Tearing down remote access to device: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDResidentDeviceManagerLegacy _teardownSessionWithPrimaryResidentDevice](v23, "_teardownSessionWithPrimaryResidentDevice");
    }
    v43 = v10;
    goto LABEL_16;
  }
  objc_msgSend(v9, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCurrentDevice");

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = v4;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if ((v12 & 1) != 0)
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Registering for notifications from secondary residents", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v10, "subscribeForNotificationsFromRemoteGateway", v10, v45);
    if ((objc_msgSend(v9, "isConfirmed") & 1) == 0)
      -[HMDResidentDeviceManagerLegacy confirmAsResident](v14, "confirmAsResident");
    goto LABEL_17;
  }
  if (v16)
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v40;
    v53 = 2112;
    v54 = v9;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting up remote access to resident: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  if (objc_msgSend(v9, "isReachable", v10, v45))
  {
    -[HMDResidentDeviceManagerLegacy _setupSessionWithPrimaryResidentDevice](v14, "_setupSessionWithPrimaryResidentDevice");
    objc_msgSend(v10, "subscribeForNotificationsFromRemoteGateway");
  }
  -[HMDResidentDeviceManagerLegacy ourSelf](v14, "ourSelf");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isEnabled");

  if (v42)
  {
    -[HMDResidentDeviceManagerLegacy legacyElection](v14, "legacyElection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "start");
LABEL_16:

  }
LABEL_17:
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[HMDResidentDeviceManagerLegacy residentDevices](v4, "residentDevices", v43);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (objc_msgSend(v31, "isEnabled"))
        {
          -[HMDResidentDeviceManagerLegacy primaryResidentDevice](v4, "primaryResidentDevice");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqual:", v31);

          if (v33)
          {
            -[HMDResidentDeviceManagerLegacy primaryResidentInitialReachabilityManager](v4, "primaryResidentInitialReachabilityManager");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "initialReachability");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v35 = 0;
          }
          -[HMDResidentDeviceManagerLegacy messageDispatcher](v4, "messageDispatcher");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "secureRemoteTransport");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "deviceMonitor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "device");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "startMonitoringDevice:withInitialReachability:forClient:", v39, v35, v4);

        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v28);
  }

}

- (void)_setupSessionWithPrimaryResidentDevice
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDResidentDeviceManagerLegacy primaryResidentDevice](self, "primaryResidentDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDResidentDeviceManagerLegacy messageDispatcher](self, "messageDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerLegacy home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRemoteAccessDevice:forHome:", v4, v5);

  }
}

- (void)_teardownSessionWithPrimaryResidentDevice
{
  void *v3;
  id v4;

  -[HMDResidentDeviceManagerLegacy messageDispatcher](self, "messageDispatcher");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerLegacy home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteAccessDevice:forHome:", 0, v3);

}

- (void)addDataSource:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__HMDResidentDeviceManagerLegacy_addDataSource___block_invoke;
    v7[3] = &unk_1E89C2328;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (NSUUID)primaryResidentUUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_primaryResidentUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasFirstLegacyFetch
{
  HMDResidentDeviceManagerLegacy *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_firstLegacyFetch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFirstLegacyFetch:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_firstLegacyFetch = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasFirstHomeManagerZoneFetch
{
  HMDResidentDeviceManagerLegacy *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_firstHomeManagerZoneFetch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFirstHomeManagerZoneFetch:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_firstHomeManagerZoneFetch = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasFirstHomeZoneFetch
{
  HMDResidentDeviceManagerLegacy *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_firstHomeZoneFetch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFirstHomeZoneFetch:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_firstHomeZoneFetch = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)residentWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)ourSelf
{
  void *v2;
  void *v3;

  -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_objectPassingTest:", &__block_literal_global_71253);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)availableResidentDevices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEnabled", (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (HMDDevice)confirmedPrimaryResidentDevice
{
  void *v2;
  void *v3;

  -[HMDResidentDeviceManagerLegacy primaryResidentDevice](self, "primaryResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isConfirmed"))
  {
    objc_msgSend(v2, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (HMDDevice *)v3;
}

- (id)residentDeviceForDevice:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_residentDevices;
  v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "device", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)_fixUpRemoteResidentDevice:(id)a3 existingResidentDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *queue;
  _QWORD block[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_fixupRemoteResidentDevice && objc_msgSend(v7, "isCurrentDevice"))
  {
    -[HMDResidentDeviceManagerLegacy home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDResidentDevice deriveUUIDFromHomeUUID:deviceUUID:](HMDResidentDevice, "deriveUUIDFromHomeUUID:deviceUUID:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v14, "isEqual:", v13);

    if ((v10 & 1) == 0)
    {
      self->_fixupRemoteResidentDevice = 0;
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __84__HMDResidentDeviceManagerLegacy__fixUpRemoteResidentDevice_existingResidentDevice___block_invoke;
      block[3] = &unk_1E89C20C8;
      block[4] = self;
      v17 = v6;
      v18 = v8;
      dispatch_async(queue, block);

    }
  }

}

- (HMFFuture)firstPrimaryResidentDiscoveryAttemptCompletionFuture
{
  return (HMFFuture *)objc_msgSend(MEMORY[0x1E0D28588], "futureWithNoValue");
}

- (BOOL)_shouldEnableCoordinationElection
{
  void *v3;
  HMDResidentDeviceManagerLegacy *v4;
  NSObject *v5;
  void *v6;
  HMDHomeKitVersion *v7;
  void *v8;
  HMDHomeKitVersion *v9;
  char v10;
  _QWORD v12[4];
  HMDHomeKitVersion *v13;
  HMDResidentDeviceManagerLegacy *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Evaluating whether we should enable coordination election", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("9.1"));
  -[HMDResidentDeviceManagerLegacy residentDevices](v4, "residentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HMDResidentDeviceManagerLegacy__shouldEnableCoordinationElection__block_invoke;
  v12[3] = &unk_1E89B0608;
  v13 = v7;
  v14 = v4;
  v9 = v7;
  v10 = objc_msgSend(v8, "na_all:", v12);

  return v10;
}

- (void)_stopCoordinationElectionWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDResidentDeviceManagerLegacy *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentDeviceManagerLegacy localNetworkElection](self, "localNetworkElection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping coordination election: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDResidentDeviceManagerLegacy localNetworkElection](v7, "localNetworkElection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stop");

    -[HMDResidentDeviceManagerLegacy setLocalNetworkElection:](v7, "setLocalNetworkElection:", 0);
  }

}

- (void)_stopLegacyElectionWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDResidentDeviceManagerLegacy *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentDeviceManagerLegacy legacyElection](self, "legacyElection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping legacy election: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDResidentDeviceManagerLegacy legacyElection](v7, "legacyElection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stop");

    -[HMDResidentDeviceManagerLegacy setLegacyElection:](v7, "setLegacyElection:", 0);
  }

}

- (void)_startElectionAddOn
{
  void *v3;
  void *v4;
  HMDResidentDeviceManagerLegacy *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  HMDResidentDeviceManagerLegacy *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDResidentDeviceManagerLegacy *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HMDResidentDeviceManagerLegacy *v29;
  NSObject *v30;
  void *v31;
  HMDPrimaryElectionLegacyAddOn *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  __int128 buf;
  uint64_t (*v49)(uint64_t, void *);
  void *v50;
  HMDResidentDeviceManagerLegacy *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (-[HMDResidentDeviceManagerLegacy _shouldEnableCoordinationElection](self, "_shouldEnableCoordinationElection"))
  {
    -[HMDResidentDeviceManagerLegacy localNetworkElection](self, "localNetworkElection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = self;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v7;
        v8 = "%{public}@Not restarting coordination election because it's already started";
LABEL_8:
        _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&buf, 0xCu);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    v10 = (void *)MEMORY[0x1D17BA0A0](-[HMDResidentDeviceManagerLegacy _stopLegacyElectionWithReason:](self, "_stopLegacyElectionWithReason:", CFSTR("starting the coordination election")));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Starting coordination election", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDResidentDeviceManagerLegacy dataSource](v11, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createElectionAddOnWithContext:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerLegacy setLocalNetworkElection:](v11, "setLocalNetworkElection:", v15);

    -[HMDResidentDeviceManagerLegacy localNetworkElection](v11, "localNetworkElection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v11);

    -[HMDResidentDeviceManagerLegacy localNetworkElection](v11, "localNetworkElection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerForMessages");

    if (v11)
    {
      -[HMDResidentDeviceManagerLegacy localNetworkElection](v11, "localNetworkElection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        _HMFPreconditionFailure();
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = v11;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Waiting for the remote transport to start before starting the coordination election", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28570]), "initWithQueue:", v20->_queue);
      -[HMDResidentDeviceManagerLegacy messageDispatcher](v20, "messageDispatcher");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "secureRemoteTransport");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "startFuture");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v49 = __60__HMDResidentDeviceManagerLegacy__startCoordinationElection__block_invoke;
      v50 = &unk_1E89BEB00;
      v51 = v20;
      v27 = (id)objc_msgSend(v26, "inContext:then:", v23, &buf);

    }
  }
  else
  {
    -[HMDResidentDeviceManagerLegacy legacyElection](self, "legacyElection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v4 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = self;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v7;
        v8 = "%{public}@Not restarting legacy election because it's already started";
        goto LABEL_8;
      }
LABEL_9:

      objc_autoreleasePoolPop(v4);
      return;
    }
    v28 = (void *)MEMORY[0x1D17BA0A0](-[HMDResidentDeviceManagerLegacy _stopCoordinationElectionWithReason:](self, "_stopCoordinationElectionWithReason:", CFSTR("starting the legacy election")));
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Starting legacy election", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    v32 = -[HMDPrimaryElectionLegacyAddOn initWithContext:]([HMDPrimaryElectionLegacyAddOn alloc], "initWithContext:", v29);
    -[HMDResidentDeviceManagerLegacy setLegacyElection:](v29, "setLegacyElection:", v32);

    -[HMDResidentDeviceManagerLegacy legacyElection](v29, "legacyElection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDelegate:", v29);

    -[HMDResidentDeviceManagerLegacy legacyElection](v29, "legacyElection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "registerForMessages");

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[HMDResidentDeviceManagerLegacy devicePreferenceDataSources](v29, "devicePreferenceDataSources", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v44 != v38)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          -[HMDResidentDeviceManagerLegacy legacyElection](v29, "legacyElection");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addDataSource:", v40);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v37);
    }

    -[HMDResidentDeviceManagerLegacy legacyElection](v29, "legacyElection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "start");

  }
}

- (void)_addResidentDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet member:](self->_residentDevices, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDResidentDeviceManagerLegacy _fixUpRemoteResidentDevice:existingResidentDevice:](self, "_fixUpRemoteResidentDevice:existingResidentDevice:", v4, v5);

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    -[NSMutableSet addObject:](self->_residentDevices, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__HMDResidentDeviceManagerLegacy__addResidentDevice___block_invoke;
    v7[3] = &unk_1E89C2328;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)_removeResidentDevice:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_residentDevices, "containsObject:", v4))
    {
      -[NSMutableSet removeObject:](self->_residentDevices, "removeObject:", v4);
      os_unfair_lock_unlock(&self->_lock);
      queue = self->_queue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __56__HMDResidentDeviceManagerLegacy__removeResidentDevice___block_invoke;
      v6[3] = &unk_1E89C2328;
      v6[4] = self;
      v7 = v4;
      dispatch_async(queue, v6);

    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }

}

- (void)removeResidentDevice:(id)a3
{
  -[HMDResidentDeviceManagerLegacy _removeResidentDevice:reason:](self, "_removeResidentDevice:reason:", a3, CFSTR("removeResidentCapableDevice"));
}

- (void)_removeResidentDevice:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentDeviceModel *v11;
  void *v12;
  void *v13;
  HMDResidentDeviceModel *v14;
  void *v15;
  void *v16;
  HMDHomeModel *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDHomeModel *v21;
  id v22;

  v6 = a4;
  v7 = a3;
  -[HMDResidentDeviceManagerLegacy home](self, "home");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "backingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transaction:options:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [HMDResidentDeviceModel alloc];
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v11, "initWithObjectChangeType:uuid:parentUUID:", 3, v12, v13);

  objc_msgSend(v10, "add:withMessage:", v14, 0);
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentDeviceManagerLegacy primaryResidentUUID](self, "primaryResidentUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v15, "isEqual:", v16);

  if ((_DWORD)v7)
  {
    v17 = [HMDHomeModel alloc];
    objc_msgSend(v22, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "homeManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v17, "initWithObjectChangeType:uuid:parentUUID:", 2, v18, v20);

    -[HMDHomeModel setPrimaryResidentUUID:](v21, "setPrimaryResidentUUID:", 0);
    objc_msgSend(v10, "add:withMessage:", v21, 0);

  }
  objc_msgSend(v10, "run");

}

- (void)updateResidentAvailability
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HMDResidentDeviceManagerLegacy_updateResidentAvailability__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateResidentAvailability
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  id v9;

  -[HMDResidentDeviceManagerLegacy availableResidentDevices](self, "availableResidentDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  -[HMDResidentDeviceManagerLegacy setResidentAvailable:](self, "setResidentAvailable:", v4);
  -[HMDResidentDeviceManagerLegacy ourSelf](self, "ourSelf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v9 = v5;
  if (v5 && (v7 = objc_msgSend(v5, "isEnabled"), v6 = v9, v7))
  {
    -[HMDResidentDeviceManagerLegacy _startElectionAddOn](self, "_startElectionAddOn");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No longer a resident: %@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerLegacy _stopLegacyElectionWithReason:](self, "_stopLegacyElectionWithReason:", v8);
    -[HMDResidentDeviceManagerLegacy _stopCoordinationElectionWithReason:](self, "_stopCoordinationElectionWithReason:", v8);

  }
}

- (void)setResidentAvailable:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  HMDResidentDeviceManagerLegacy *v8;
  NSObject *v9;
  void *v10;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_residentAvailable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_residentAvailable = v3;
    os_unfair_lock_unlock(p_lock);
    v6 = -[HMDResidentDeviceManagerLegacy notifyResidentAvailable:](self, "notifyResidentAvailable:", v3);
    if (v3)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0](v6);
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v14 = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Resident availability became TRUE now, notifying updated primary resident", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      queue = v8->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__HMDResidentDeviceManagerLegacy_setResidentAvailable___block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = v8;
      dispatch_async(queue, block);
    }
  }
}

- (BOOL)isResidentSupported
{
  HMDResidentDeviceManagerLegacy *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_residentSupported;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setResidentSupported:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_residentSupported = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyResidentAvailable:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__HMDResidentDeviceManagerLegacy_notifyResidentAvailable___block_invoke;
  v4[3] = &unk_1E89C2758;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)notifyClientsOfUpdatedResidentDevice:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HMDResidentDeviceManagerLegacy_notifyClientsOfUpdatedResidentDevice___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)notifyUpdatedPrimaryResident:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HMDResidentDeviceManagerLegacy_notifyUpdatedPrimaryResident___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_sendResidentDeviceNotificationWithName:(id)a3 forResidentDevice:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));

  -[HMDResidentDeviceManagerLegacy home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("HMDResidentDeviceManagerHomeUUIDNotificationKey"));

  logAndPostNotification(v8, self, v11);
}

- (void)_handleResidentDeviceUpdateEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  HMDResidentDeviceModel *v21;
  void *v22;
  void *v23;
  HMDResidentDeviceModel *v24;
  void *v25;
  void *v26;
  HMDHomeModel *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDHomeModel *v31;
  void *v32;
  HMDResidentDeviceManagerLegacy *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMDResidentDeviceManagerLegacy *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  void *v47;
  HMDResidentDeviceManagerLegacy *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  int buf;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v55;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v5);

        if ((v13 & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v14 = v11;

      if (!v14)
        goto LABEL_16;
      v53 = 0;
      objc_msgSend(v4, "messagePayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hmf_BOOLForKey:isPresent:", CFSTR("kEnabledKey"), &v53);

      if (v53)
      {
        -[HMDResidentDeviceManagerLegacy home](self, "home");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "backingStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "transaction:options:", CFSTR("residentDeviceUpdateEnabled"), v19);
        v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        v21 = [HMDResidentDeviceModel alloc];
        objc_msgSend(v14, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v21, "initWithObjectChangeType:uuid:parentUUID:", 2, v22, v23);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentDeviceModel setEnabled:](v24, "setEnabled:", v25);

        objc_msgSend(v20, "add:withMessage:", v24, v4);
        -[HMDResidentDeviceManagerLegacy primaryResidentUUID](self, "primaryResidentUUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v25) = objc_msgSend(v5, "isEqual:", v26);

        if ((_DWORD)v25)
        {
          v27 = [HMDHomeModel alloc];
          objc_msgSend(v17, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "homeManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "uuid");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v27, "initWithObjectChangeType:uuid:parentUUID:", 2, v28, v30);

          -[HMDHomeModel setPrimaryResidentUUID:](v31, "setPrimaryResidentUUID:", 0);
          objc_msgSend(v20, "add:withMessage:", v31, 0);

        }
        objc_msgSend(v20, "run");

        goto LABEL_29;
      }
      v47 = (void *)MEMORY[0x1D17BA0A0]();
      v48 = self;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 138543618;
        v60 = v50;
        v61 = 2112;
        v62 = v51;
        _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_INFO, "%{public}@Invalid message paylaod, missing enabled state: %@", (uint8_t *)&buf, 0x16u);

      }
      objc_autoreleasePoolPop(v47);
      objc_msgSend(v4, "responseHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v20)[2](v20, v17, 0);
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_30;
    }
LABEL_10:

LABEL_16:
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543618;
      v60 = v35;
      v61 = 2112;
      v62 = v36;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Failed to find resident device with identifier: %@", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(v4, "responseHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v39 = 2;
LABEL_24:
      objc_msgSend(v38, "hmErrorWithCode:", v39);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "responseHandler");
      v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v46)[2](v46, v14, 0);

LABEL_30:
    }
  }
  else
  {
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543618;
      v60 = v43;
      v61 = 2112;
      v62 = v44;
      _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Invalid message paylaod, missing resident device identifier: %@", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    objc_msgSend(v4, "responseHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v39 = 20;
      goto LABEL_24;
    }
  }

}

- (void)handleHomeUpdatedAccessories:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HMDResidentDeviceManagerLegacy_handleHomeUpdatedAccessories___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)handleCurrentDeviceChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentDeviceManagerLegacy *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HMDResidentDeviceManagerLegacy_handleCurrentDeviceChanged___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)handleDeviceUpdated:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentDeviceManagerLegacy *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HMDResidentDeviceManagerLegacy_handleDeviceUpdated___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)__currentDeviceUpdated:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDResidentDeviceModel *v12;
  void *v13;
  void *v14;
  HMDResidentDeviceModel *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[HMDResidentDeviceManagerLegacy ourSelf](self, "ourSelf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDResidentDeviceManagerLegacy home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backingStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transaction:options:", CFSTR("residentUpdated"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [HMDResidentDeviceModel alloc];
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v12, "initWithObjectChangeType:uuid:parentUUID:", 2, v13, v14);

    objc_msgSend(v18, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceModel setDeviceUUID:](v15, "setDeviceUUID:", v17);

    -[HMDResidentDeviceModel setDevice:](v15, "setDevice:", v18);
    objc_msgSend(v11, "add:", v15);
    objc_msgSend(v11, "run:", v6);

  }
}

- (void)electResidentDevice:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__HMDResidentDeviceManagerLegacy_electResidentDevice___block_invoke;
  v4[3] = &unk_1E89C0B98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_electResidentDevice:(unint64_t)a3
{
  id v4;

  -[HMDResidentDeviceManagerLegacy legacyElection](self, "legacyElection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performElectionWithReason:", a3);

}

- (void)handleResidentDeviceIsReachable:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentDeviceManagerLegacy *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HMDResidentDeviceManagerLegacy_handleResidentDeviceIsReachable___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)handleResidentDeviceIsNotReachable:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentDeviceManagerLegacy *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HMDResidentDeviceManagerLegacy_handleResidentDeviceIsNotReachable___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_updateReachability:(BOOL)a3 forResidentDevice:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  HMDResidentDeviceManagerLegacy *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMDResidentDeviceManagerLegacy queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDResidentDeviceManagerLegacy primaryResidentDevice](self, "primaryResidentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCurrentDevice");

  if (v10)
  {
    if (v4 && (objc_msgSend(v8, "isReachable") & 1) == 0)
    {
      objc_msgSend(v8, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isCurrentDevice");

      if ((v12 & 1) == 0)
        -[HMDResidentDeviceManagerLegacy _electResidentDevice:](self, "_electResidentDevice:", 1);
    }
  }
  else if (objc_msgSend(v6, "isReachable") != v4)
  {
    objc_msgSend(v6, "setReachable:", v4);
    v13 = objc_msgSend(v8, "isEqual:", v6);
    if (v4)
    {
      if (v13)
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543362;
          v24 = v17;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting up session with the primary resident and subscribing for notifications", (uint8_t *)&v23, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        -[HMDResidentDeviceManagerLegacy _setupSessionWithPrimaryResidentDevice](v15, "_setupSessionWithPrimaryResidentDevice");
        -[HMDResidentDeviceManagerLegacy home](v15, "home");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "subscribeForNotificationsFromRemoteGateway");

      }
    }
    else if (v13)
    {
      -[HMDResidentDeviceManagerLegacy _teardownSessionWithPrimaryResidentDevice](self, "_teardownSessionWithPrimaryResidentDevice");
      -[HMDResidentDeviceManagerLegacy messageDispatcher](self, "messageDispatcher");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "secureRemoteTransport");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "deviceMonitor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isReachable");

      if (v22)
        -[HMDResidentDeviceManagerLegacy _electResidentDevice:](self, "_electResidentDevice:", 1);
    }
    -[HMDResidentDeviceManagerLegacy notifyClientsOfUpdatedResidentDevice:](self, "notifyClientsOfUpdatedResidentDevice:", v6);
  }

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerLegacy messageTargetUUID](self, "messageTargetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E89C3E38;
  }
  -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Resident Devices = %@"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v9;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDResidentDeviceManagerLegacy descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDResidentDeviceManagerLegacy descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)dumpState
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerLegacy legacyElection](self, "legacyElection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDResidentDeviceManagerLegacy legacyElection](self, "legacyElection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dumpState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Election.Legacy"));

  }
  -[HMDResidentDeviceManagerLegacy localNetworkElection](self, "localNetworkElection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDResidentDeviceManagerLegacy localNetworkElection](self, "localNetworkElection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dumpState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("Election.Coordination"));

  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[HMDResidentDeviceManagerLegacy home](self, "home");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "uuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerLegacy primaryResidentDevice](self, "primaryResidentDevice");
  v12 = v3;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerLegacy isResidentAvailable](self, "isResidentAvailable");
  HMFBooleanToString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerLegacy isResidentSupported](self, "isResidentSupported");
  HMFBooleanToString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("home: %@, primaryResidentDevice: %@ isResidentAvailable: %@, isResidentSupported: %@"), v11, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v12;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("State"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v25), "dumpState");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v23);
  }

  objc_msgSend(v34, "setObject:forKeyedSubscript:", v20, CFSTR("Residents"));
  -[HMDResidentDeviceManagerLegacy messageDispatcher](self, "messageDispatcher");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "secureRemoteTransport");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "deviceMonitor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dumpState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v30, CFSTR("Remote Device Monitor"));

  return v34;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDResidentDeviceManagerLegacy home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (HMDResidentDeviceManagerLegacy)initWithCoder:(id)a3
{
  id v4;
  HMDResidentDeviceManagerLegacy *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUUID *primaryResidentUUID;
  BOOL v10;
  uint64_t v11;
  NSUUID *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableSet *residentDevices;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDResidentDeviceManagerLegacy init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.home"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_home, v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.currentResidentDevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.currentResidentDeviceUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryResidentUUID = v5->_primaryResidentUUID;
    v5->_primaryResidentUUID = (NSUUID *)v8;

    if (v5->_primaryResidentUUID)
      v10 = 1;
    else
      v10 = v7 == 0;
    if (!v10)
    {
      objc_msgSend(v7, "identifier");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v5->_primaryResidentUUID;
      v5->_primaryResidentUUID = (NSUUID *)v11;

    }
    v13 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("HM.residentDevices"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    residentDevices = v5->_residentDevices;
    v5->_residentDevices = (NSMutableSet *)v17;

    v5->_verifyCurrentResidentDevice = -[NSMutableSet count](v5->_residentDevices, "count") != 0;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "isEnabled", (_QWORD)v25))
          {
            v5->_residentAvailable = 1;
            goto LABEL_17;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_17:

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDResidentDeviceManagerLegacy home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, CFSTR("HM.home"));

  -[HMDResidentDeviceManagerLegacy primaryResidentDevice](self, "primaryResidentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v6, CFSTR("HM.currentResidentDevice"));

  -[HMDResidentDeviceManagerLegacy primaryResidentUUID](self, "primaryResidentUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v7, CFSTR("HM.currentResidentDeviceUUID"));

  -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.residentDevices"));

}

- (void)_handleCloudZoneReadyNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDResidentDeviceManagerLegacy *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *queue;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HMDCR.id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_BOOLForKey:", CFSTR("HMDCR.stc"));
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Cloud manager completed initial fetch for zone %{public}@, didServerTokenChange: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  queue = v8->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke;
  v15[3] = &unk_1E89C2328;
  v15[4] = v8;
  v16 = v6;
  v14 = v6;
  dispatch_async(queue, v15);

}

- (void)_verifyCurrentResidentDevice
{
  void *v3;
  HMDResidentDeviceManagerLegacy *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDResidentDeviceManagerLegacy *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDResidentDeviceManagerLegacy *v29;
  NSObject *v30;
  void *v31;
  __int128 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  HMDResidentDeviceManagerLegacy *v36;
  uint64_t v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!self->_verifyCurrentResidentDevice)
    return;
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Verifying resident device objects", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  self->_verifyCurrentResidentDevice = 0;
  -[HMDResidentDeviceManagerLegacy home](v4, "home");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "backingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transaction:options:", CFSTR("Remove Invalid Resident"), v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[HMDResidentDeviceManagerLegacy residentDevices](v4, "residentDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (!v37)
  {

    goto LABEL_25;
  }
  v11 = 0;
  v12 = *(_QWORD *)v40;
  *(_QWORD *)&v10 = 138543874;
  v32 = v10;
  v35 = *(_QWORD *)v40;
  v36 = v4;
  do
  {
    for (i = 0; i != v37; ++i)
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_msgSend(v14, "device", v32);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerLegacy dataSource](v4, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appleAccountManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "isCurrentDevice"))
      {
        v19 = v9;
        if ((objc_msgSend(v15, "isEqual:", v18) & 1) != 0)
        {
          objc_msgSend(v33, "uuid");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDResidentDevice deriveUUIDFromHomeUUID:deviceUUID:](HMDResidentDevice, "deriveUUIDFromHomeUUID:deviceUUID:", v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v20) = objc_msgSend(v23, "isEqual:", v22);

          if ((v20 & 1) == 0)
          {
            v24 = (void *)MEMORY[0x1D17BA0A0]();
            v25 = v36;
            HMFGetOSLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v32;
              v44 = v27;
              v45 = 2112;
              v46 = v14;
              v47 = 2114;
              v48 = v22;
              _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Current UUID of %@ does not match expected %{public}@, removing current model", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v24);

            goto LABEL_18;
          }
        }
        else
        {
          v28 = (void *)MEMORY[0x1D17BA0A0]();
          v29 = v4;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v44 = v31;
            v45 = 2112;
            v46 = v14;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Removing HMDResidentDevice referencing stale currentDevice %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v28);
LABEL_18:
          objc_msgSend(v14, "modelObjectWithChangeType:version:", 3, 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "add:", v22);
          v11 = 1;
        }
        v9 = v19;

        v12 = v35;
        v4 = v36;
      }

    }
    v37 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  }
  while (v37);

  if ((v11 & 1) != 0)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __62__HMDResidentDeviceManagerLegacy__verifyCurrentResidentDevice__block_invoke;
    v38[3] = &unk_1E89C2350;
    v38[4] = v4;
    objc_msgSend(v34, "run:", v38);
  }
LABEL_25:

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerLegacy residentWithUUID:](self, "residentWithUUID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "transactionObjectUpdated:newValues:message:", v17, v12, v9);
    }
    else
    {
      objc_msgSend(v9, "transactionResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HMDResidentDeviceManagerLegacy _createResidentDeviceWithModel:](self, "_createResidentDeviceWithModel:", v12))
      {
        objc_msgSend(v15, "markChanged");
        objc_msgSend(v9, "respondWithPayload:", 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "respondWithError:", v16);

      }
      v14 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "respondWithError:", v14);
  }

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v11;
  else
    v7 = 0;
  v8 = v7;
  if (v8)
  {
    -[HMDResidentDeviceManagerLegacy _removeResidentDeviceWithModel:message:](self, "_removeResidentDeviceWithModel:message:", v8, v6);
  }
  else
  {
    objc_msgSend(v6, "responseHandler");
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

    v6 = (id)v9;
  }

}

- (void)updatePrimaryResidentWithUUID:(id)a3 actions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[HMDResidentDeviceManagerLegacy primaryResidentUUID](self, "primaryResidentUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((HMFEqualObjects() & 1) == 0)
  {
    objc_msgSend(v7, "markChanged");
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HMDResidentDeviceManagerLegacy_updatePrimaryResidentWithUUID_actions___block_invoke;
    block[3] = &unk_1E89C20C8;
    block[4] = self;
    v11 = v7;
    v12 = v6;
    dispatch_async(queue, block);

  }
}

- (BOOL)_createResidentDeviceWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDResidentDeviceManagerLegacy dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createResidentDeviceWithModel:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDResidentDeviceManagerLegacy home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configureWithHome:", v7);

    -[HMDResidentDeviceManagerLegacy _addResidentDevice:](self, "_addResidentDevice:", v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerLegacy home](self, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v10;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to add resident device %{public}@ for home %{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

  return v6 != 0;
}

- (void)_removeResidentDeviceWithModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDResidentDeviceManagerLegacy *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDResidentDeviceManagerLegacy *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  HMDResidentDeviceManagerLegacy *v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "transactionResult");
  v47 = self;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[HMDResidentDeviceManagerLegacy residentDevices](self, "residentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v53;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v12);
      objc_msgSend(v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if ((v16 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v17 = v13;

    if (!v17)
      goto LABEL_13;
    v18 = v7;
    objc_msgSend(v7, "transactionResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "source") == 2 || objc_msgSend(v19, "source") == 3;
    v31 = v47;
    -[HMDResidentDeviceManagerLegacy dataSource](v47, "dataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "appleAccountManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "device");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "device");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = objc_msgSend(v35, "isEqual:", v34);

    if ((_DWORD)v33 && v20)
    {
      v48 = v34;
      objc_msgSend(v17, "modelObjectWithChangeType:version:", 1, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v31;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "device");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v40;
        v58 = 2112;
        v59 = v41;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Resident device was removed by another device, adding back - %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      -[HMDResidentDeviceManagerLegacy home](v38, "home");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "backingStore");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "transaction:options:", CFSTR("residentAddedPushback"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "add:", v36);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __73__HMDResidentDeviceManagerLegacy__removeResidentDeviceWithModel_message___block_invoke;
      v50[3] = &unk_1E89C21C0;
      v50[4] = v38;
      v51 = v36;
      v46 = v36;
      objc_msgSend(v45, "save:", v50);

      v34 = v48;
    }
    else
    {
      -[HMDResidentDeviceManagerLegacy _removeResidentDevice:](v47, "_removeResidentDevice:", v17);
    }
    v30 = v49;
    objc_msgSend(v49, "markChanged");
    objc_msgSend(v18, "respondWithPayload:", 0);

    goto LABEL_25;
  }
LABEL_9:

LABEL_13:
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  v18 = v7;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerLegacy home](v47, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v23;
    v58 = 2114;
    v59 = v25;
    v60 = 2114;
    v61 = v28;
    _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove resident device %{public}@ for home %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(v18, "responseHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v49;
  if (v29)
  {
    objc_msgSend(v18, "responseHandler");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v17 + 2))(v17, v19, 0);
LABEL_25:

  }
}

- (BOOL)isResidentEnabled
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerLegacy ourSelf](self, "ourSelf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)isOwnerUser
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerLegacy home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOwnerUser");

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)atHomeLevel
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v3 = objc_msgSend(WeakRetained, "atHomeLevel");

  return v3;
}

- (void)primaryElectionAddOn:(id)a3 didElectPrimaryResident:(id)a4 confirmed:(BOOL)a5 electionLogEvent:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  HMDResidentDeviceManagerLegacy *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  HMDResidentDeviceModel *v25;
  void *v26;
  void *v27;
  HMDResidentDeviceModel *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDHomeModel *v32;
  void *v33;
  void *v34;
  HMDResidentDeviceManagerLegacy *v35;
  NSObject *v36;
  void *v37;
  HMDResidentDeviceModel *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDHomeModel *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  HMDResidentDeviceManagerLegacy *v53;
  NSObject *v54;
  void *v55;
  int v56;
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v7 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HMDResidentDeviceManagerLegacy queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[HMDResidentDeviceManagerLegacy localNetworkElection](self, "localNetworkElection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 != v10)
  {

    goto LABEL_4;
  }
  v15 = objc_msgSend(v11, "isCurrentDevice");

  if ((v15 & 1) != 0)
  {
LABEL_4:
    -[HMDResidentDeviceManagerLegacy primaryResidentDevice](self, "primaryResidentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((HMFEqualObjects() & 1) != 0)
    {
      v17 = objc_msgSend(v16, "isConfirmed");
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if (v17 == v7)
      {
        if (v21)
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 138543362;
          v57 = v51;
          _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Resident device did not change after election.", (uint8_t *)&v56, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        -[HMDResidentDeviceManagerLegacy _run](v19, "_run");
        goto LABEL_19;
      }
      if (v21)
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 138543618;
        v57 = v22;
        v58 = 2112;
        v59 = v23;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating current resident confirmed to %@", (uint8_t *)&v56, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDResidentDeviceManagerLegacy home](v19, "home");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = [HMDResidentDeviceModel alloc];
      objc_msgSend(v11, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v25, "initWithObjectChangeType:uuid:parentUUID:", 2, v26, v27);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceModel setConfirmed:](v28, "setConfirmed:", v29);

      objc_msgSend(v24, "backingStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultResidenceOptions](HMDBackingStoreTransactionOptions, "defaultResidenceOptions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "transaction:options:", CFSTR("residentConfirmed"), v31);
      v32 = (HMDHomeModel *)objc_claimAutoreleasedReturnValue();

      -[HMDHomeModel add:withMessage:](v32, "add:withMessage:", v28, 0);
      -[HMDHomeModel run](v32, "run");
      if (!v12)
      {
LABEL_15:

LABEL_19:
        goto LABEL_20;
      }
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "submitLogEvent:", v12);
    }
    else
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 138543874;
        v57 = v37;
        v58 = 2112;
        v59 = v16;
        v60 = 2112;
        v61 = v11;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Resident device changed from %@ to %@ after election. Confirming...", (uint8_t *)&v56, 0x20u);

      }
      objc_autoreleasePoolPop(v34);
      -[HMDResidentDeviceManagerLegacy home](v35, "home");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = [HMDResidentDeviceModel alloc];
      objc_msgSend(v11, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uuid");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v38, "initWithObjectChangeType:uuid:parentUUID:", 2, v39, v40);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceModel setConfirmed:](v28, "setConfirmed:", v41);

      v42 = [HMDHomeModel alloc];
      objc_msgSend(v24, "uuid");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "homeManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "uuid");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v42, "initWithObjectChangeType:uuid:parentUUID:", 2, v43, v45);

      objc_msgSend(v11, "identifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "UUIDString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeModel setPrimaryResidentUUID:](v32, "setPrimaryResidentUUID:", v47);

      objc_msgSend(v24, "backingStore");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultResidenceOptions](HMDBackingStoreTransactionOptions, "defaultResidenceOptions");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "transaction:options:", CFSTR("electResidentDevice"), v49);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "add:withMessage:", v32, 0);
      objc_msgSend(v33, "add:withMessage:", v28, 0);
      objc_msgSend(v33, "run");
      if (v12)
      {
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "submitLogEvent:", v12);

      }
    }

    goto LABEL_15;
  }
  v52 = (void *)MEMORY[0x1D17BA0A0]();
  v53 = self;
  HMFGetOSLogHandle();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 138543618;
    v57 = v55;
    v58 = 2112;
    v59 = v11;
    _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@Coordination add-on elected %@ as primary resident by local mesh, but we're not the primary resident so waiting for its cloud push", (uint8_t *)&v56, 0x16u);

  }
  objc_autoreleasePoolPop(v52);
LABEL_20:

}

- (void)primaryElectionAddOn:(id)a3 didUpdateResidentDevice:(id)a4
{
  -[HMDResidentDeviceManagerLegacy notifyClientsOfUpdatedResidentDevice:](self, "notifyClientsOfUpdatedResidentDevice:", a4);
}

- (void)primaryElectionAddOn:(id)a3 didFailToElectWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDResidentDeviceManagerLegacy *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Election %@ failed: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)primaryElectionAddOn:(id)a3 didUpdateActiveNodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDResidentDeviceManagerLegacy *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received updated active nodes: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (HMDMessageDispatcher)messageDispatcher
{
  return (HMDMessageDispatcher *)objc_getProperty(self, a2, 64, 1);
}

- (HMFFuture)cloudReady
{
  return (HMFFuture *)objc_getProperty(self, a2, 72, 1);
}

- (HMDResidentDeviceManagerDelegate)delegate
{
  return (HMDResidentDeviceManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (HMDResidentDeviceManagerLegacyDataSource)dataSource
{
  return (HMDResidentDeviceManagerLegacyDataSource *)objc_getProperty(self, a2, 96, 1);
}

- (NSHashTable)devicePreferenceDataSources
{
  return self->_devicePreferenceDataSources;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 112, 1);
}

- (HMDHomePrimaryResidentInitialReachabilityManager)primaryResidentInitialReachabilityManager
{
  return (HMDHomePrimaryResidentInitialReachabilityManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPrimaryResidentInitialReachabilityManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (HMFPromise)cloudReadyPromise
{
  return (HMFPromise *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCloudReadyPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (HMDPrimaryElectionLegacyAddOn)legacyElection
{
  return (HMDPrimaryElectionLegacyAddOn *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLegacyElection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (HMDPrimaryElectionCoordinationAddOn)localNetworkElection
{
  return (HMDPrimaryElectionCoordinationAddOn *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLocalNetworkElection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localNetworkElection, 0);
  objc_storeStrong((id *)&self->_legacyElection, 0);
  objc_storeStrong((id *)&self->_cloudReadyPromise, 0);
  objc_storeStrong((id *)&self->_primaryResidentInitialReachabilityManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_devicePreferenceDataSources, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudReady, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_primaryResidentUUID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_residentDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __73__HMDResidentDeviceManagerLegacy__removeResidentDeviceWithModel_message___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveWithReason:information:postSyncNotification:objectChange:", CFSTR("residentAddedPushback"), 0, 0, *(_QWORD *)(a1 + 40) != 0);

}

void __72__HMDResidentDeviceManagerLegacy_updatePrimaryResidentWithUUID_actions___block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL4 v24;
  int v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_teardownSessionWithPrimaryResidentDevice");
  v2 = objc_msgSend(*(id *)(a1 + 40), "source") == 2 || objc_msgSend(*(id *)(a1 + 40), "source") == 3;
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = v5;
  if (v4)
  {
    v24 = v2;
    os_unfair_lock_lock_with_options();
    v7 = *((id *)v4 + 7);
    v25 = objc_msgSend(v7, "isEqual:", v6);
    if ((v25 & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_storeStrong((id *)v4 + 7, v3);
      v9 = (void *)*((_QWORD *)v4 + 3);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke;
      v30[3] = &unk_1E89AE5D0;
      v31 = v7;
      objc_msgSend(v9, "objectsPassingTest:", v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = (void *)*((_QWORD *)v4 + 3);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke_2;
    v28[3] = &unk_1E89AE5D0;
    v23 = v6;
    v29 = v23;
    objc_msgSend(v11, "objectsPassingTest:", v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
    objc_msgSend(v4, "legacyElection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(v4, "localNetworkElection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v14, "primaryResidentChanged:previousResidentDevice:", v13, v8));
    v16 = v4;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v18;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = v8;
      v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident changed (from cloud: %@): %@ -> %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    if ((v25 & 1) == 0)
    {
      if (v8)
        objc_msgSend(v16, "notifyClientsOfUpdatedResidentDevice:", v8);
      objc_msgSend(v16, "notifyUpdatedPrimaryResident:", v13);
      objc_msgSend(v16, "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "backingStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke_458;
      v26[3] = &unk_1E89C2350;
      v27 = v16;
      objc_msgSend(v21, "submitBlock:", v26);

    }
    if (((v25 | !v24) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "legacyElection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "confirmPrimaryResident");

    }
  }
  else
  {

  }
}

void __62__HMDResidentDeviceManagerLegacy__verifyCurrentResidentDevice__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "verifyCurrentDeviceResidentStatus");

}

void __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v2, "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "setFirstHomeZoneFetch:", 1);
      if (objc_msgSend(*(id *)(a1 + 32), "hasFirstLegacyFetch")
        && objc_msgSend(*(id *)(a1 + 32), "hasFirstHomeManagerZoneFetch"))
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "hasFirstHomeZoneFetch");
      }
      else
      {
        v7 = 0;
      }
      objc_msgSend(v3, "backingStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_2;
      v19[3] = &unk_1E89C2350;
      v19[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "submitBlock:", v19);

      if ((v7 & 1) == 0)
        goto LABEL_21;
    }
    else
    {
      v8 = *(void **)(a1 + 40);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5"));
      LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

      if (!(_DWORD)v8)
        goto LABEL_21;
      objc_msgSend(*(id *)(a1 + 32), "setFirstHomeManagerZoneFetch:", 1);
      if (!objc_msgSend(*(id *)(a1 + 32), "hasFirstLegacyFetch")
        || !objc_msgSend(*(id *)(a1 + 32), "hasFirstHomeManagerZoneFetch")
        || !objc_msgSend(*(id *)(a1 + 32), "hasFirstHomeZoneFetch"))
      {
        goto LABEL_21;
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setFirstLegacyFetch:", 1);
    if (!objc_msgSend(*(id *)(a1 + 32), "hasFirstLegacyFetch")
      || !objc_msgSend(*(id *)(a1 + 32), "hasFirstHomeManagerZoneFetch")
      || (objc_msgSend(*(id *)(a1 + 32), "hasFirstHomeZoneFetch") & 1) == 0)
    {
      goto LABEL_21;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isResidentCapable");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Confirming primary resident after first fetch", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v3, "backingStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_188;
    v18[3] = &unk_1E89C2350;
    v18[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v17, "submitBlock:", v18);

  }
LABEL_21:

}

void __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cloudReadyPromise");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fulfillWithNoValue");

}

void __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_188(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_2_189;
  block[3] = &unk_1E89C2730;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_2_189(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "legacyElection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "confirmPrimaryResident");

  return objc_msgSend(*(id *)(a1 + 32), "_verifyCurrentResidentDevice");
}

void __69__HMDResidentDeviceManagerLegacy_handleResidentDeviceIsNotReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "residentDeviceForDevice:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v9;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that resident device is not reachable: %@", (uint8_t *)&v10, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(*(id *)(a1 + 40), "_updateReachability:forResidentDevice:", 0, v5);
    }

  }
}

void __66__HMDResidentDeviceManagerLegacy_handleResidentDeviceIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "residentDeviceForDevice:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v9;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that resident device is reachable: %@", (uint8_t *)&v10, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(*(id *)(a1 + 40), "_updateReachability:forResidentDevice:", 1, v5);
    }

  }
}

uint64_t __54__HMDResidentDeviceManagerLegacy_electResidentDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_electResidentDevice:", *(_QWORD *)(a1 + 40));
}

void __54__HMDResidentDeviceManagerLegacy_handleDeviceUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    if (objc_msgSend(v4, "isCurrentDevice"))
      objc_msgSend(*(id *)(a1 + 40), "__currentDeviceUpdated:completion:", v4, 0);
    objc_msgSend(*(id *)(a1 + 40), "ourSelf");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "isEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_startElectionAddOn");
    }
    else
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Resident device is nil or not enabled", (uint8_t *)&v11, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
}

void __61__HMDResidentDeviceManagerLegacy_handleCurrentDeviceChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = *(void **)(a1 + 40);
  if (v5)
  {
    v7 = objc_msgSend(v6, "isResidentSupported");
    objc_msgSend(*(id *)(a1 + 40), "setResidentSupported:", 1);
    objc_msgSend(v5, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isResidentCapable");

    if (v9)
    {
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 40), sel_handleDeviceUpdated_, CFSTR("HMDDeviceUpdatedNotification"), 0);

      }
      v11 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__HMDResidentDeviceManagerLegacy_handleCurrentDeviceChanged___block_invoke_2;
      v12[3] = &unk_1E89C2350;
      v12[4] = v11;
      objc_msgSend(v11, "__currentDeviceUpdated:completion:", v5, v12);
    }
  }
  else
  {
    objc_msgSend(v6, "setResidentSupported:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_teardownSessionWithPrimaryResidentDevice");
    objc_msgSend(*(id *)(a1 + 40), "run");
  }

}

uint64_t __61__HMDResidentDeviceManagerLegacy_handleCurrentDeviceChanged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

void __63__HMDResidentDeviceManagerLegacy_handleHomeUpdatedAccessories___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v1 = a1;
  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOwnerUser");

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(v1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v28 = v1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification that accessories changed in home, auditing residents", buf, 0xCu);

      v1 = v28;
    }

    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(v1 + 32), "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appleAccountManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(*(id *)(v1 + 32), "residentDevices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v12)
      {
        v14 = v12;
        v15 = *(_QWORD *)v30;
        *(_QWORD *)&v13 = 138543618;
        v27 = v13;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v17, "device", v27);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isCurrentDevice");

            if ((v19 & 1) == 0)
            {
              objc_msgSend(v10, "devices");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "device");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v20, "containsObject:", v21);

              if ((v22 & 1) == 0)
              {
                v23 = (void *)MEMORY[0x1D17BA0A0]();
                v24 = *(id *)(v1 + 32);
                HMFGetOSLogHandle();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v27;
                  v34 = v26;
                  v35 = 2112;
                  v36 = v17;
                  _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Removing stale resident: %@", buf, 0x16u);

                  v1 = v28;
                }

                objc_autoreleasePoolPop(v23);
                objc_msgSend(*(id *)(v1 + 32), "removeResidentDevice:", v17);
              }
            }
          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v14);
      }

    }
  }
}

uint64_t __63__HMDResidentDeviceManagerLegacy_notifyUpdatedPrimaryResident___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManager:didUpdatePrimaryResident:previousPrimaryResident:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

  return objc_msgSend(*(id *)(a1 + 32), "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), *(_QWORD *)(a1 + 40));
}

void __71__HMDResidentDeviceManagerLegacy_notifyClientsOfUpdatedResidentDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated resident: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "residentDeviceManagerDidUpdateResidents:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("ResidentDeviceUpdated"), v10, 1);

  objc_msgSend(v8, "reEvaluateHomeHubState");
  objc_msgSend(v8, "evaluateResidentUpdate");

}

void __58__HMDResidentDeviceManagerLegacy_notifyResidentAvailable___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManager:didUpdateResidentAvailable:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __55__HMDResidentDeviceManagerLegacy_setResidentAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "primaryResidentUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "primaryResidentUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "residentWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "notifyUpdatedPrimaryResident:", v5);
    }
    else
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "primaryResidentUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v13;
        v17 = 2112;
        v18 = v14;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Primary resident UUID is set to %@, cannot find the primary resident device", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Primary resident UUID is not set, cannot find the primary resident device", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
}

uint64_t __60__HMDResidentDeviceManagerLegacy_updateResidentAvailability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateResidentAvailability");
}

void __56__HMDResidentDeviceManagerLegacy__removeResidentDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManagerDidUpdateResidents:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reEvaluateHomeHubState");
  v4 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "_updateResidentAvailability"));
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations with resident due to resident device removal", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableNotificationsForDevices:", v9);

  if (objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice"))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Removed residentDevice is current device, clean up reachability event notification registry if there is any", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v3, "notificationRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllReachabilityEventNotificationRegistrations");

  }
}

void __53__HMDResidentDeviceManagerLegacy__addResidentDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManagerDidUpdateResidents:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerAddResidentNotification"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reEvaluateHomeHubState");
  objc_msgSend(*(id *)(a1 + 32), "_updateResidentAvailability");
  objc_msgSend(*(id *)(a1 + 32), "primaryResidentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {

LABEL_5:
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations with resident due to resident device addition", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 40), "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enableNotificationsForDevices:", v5);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "primaryResidentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isCurrentDevice"))
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "isEnabled");

    if (!v8)
      goto LABEL_10;
    goto LABEL_5;
  }

LABEL_9:
LABEL_10:
  objc_msgSend(*(id *)(a1 + 40), "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCurrentDevice");

  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Adding ourselves as a resident device, starting election", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(a1 + 32), "_electResidentDevice:", 3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_run");
  }

}

uint64_t __60__HMDResidentDeviceManagerLegacy__startCoordinationElection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Starting coordination election", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "localNetworkElection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "start");

  return 1;
}

BOOL __67__HMDResidentDeviceManagerLegacy__shouldEnableCoordinationElection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", *(_QWORD *)(a1 + 32));

  if (v6 == -1)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Not enabling coordination election because device %@ has too low a version", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v6 != -1;
}

void __84__HMDResidentDeviceManagerLegacy__fixUpRemoteResidentDevice_existingResidentDevice___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a1[4], "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transaction:options:", CFSTR("Removing Invalid Resident Model"), v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "modelObjectWithChangeType:version:", 3, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "add:", v5);
  objc_msgSend(a1[6], "modelObjectWithChangeType:version:", 2, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setChangeToken:", v8);

  objc_msgSend(v9, "add:", v6);
  objc_msgSend(v9, "run");

}

uint64_t __41__HMDResidentDeviceManagerLegacy_ourSelf__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevice");

  return v3;
}

void __48__HMDResidentDeviceManagerLegacy_addDataSource___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "devicePreferenceDataSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "legacyElection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDataSource:", *(_QWORD *)(a1 + 40));

}

uint64_t __37__HMDResidentDeviceManagerLegacy_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

void __53__HMDResidentDeviceManagerLegacy_atHomeLevelChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "legacyElection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "atHomeLevelChanged:", *(_QWORD *)(a1 + 40));

}

void __55__HMDResidentDeviceManagerLegacy_confirmOnAvailability__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "legacyElection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "confirmOnAvailability");

}

void __51__HMDResidentDeviceManagerLegacy_confirmAsResident__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "legacyElection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "confirmAsResident");

}

void __63__HMDResidentDeviceManagerLegacy_confirmWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "legacyElection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "confirmWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

void __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  HMDBackingStoreCacheFetchModelObjects *v32;
  void *v33;
  void *v34;
  HMDBackingStoreCacheFetchModelObjects *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  _QWORD aBlock[4];
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "setHome:", a1[5]);
  objc_msgSend(a1[4], "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createInitialReachabilityManagerWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setPrimaryResidentInitialReachabilityManager:", v4);

  objc_msgSend(a1[4], "primaryResidentInitialReachabilityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureWithHome:", a1[5]);

  objc_storeStrong((id *)a1[4] + 8, a1[6]);
  objc_msgSend(a1[4], "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appleAccountManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(a1[4], "residentDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v15, "configureWithHome:", a1[5]);
        objc_msgSend(v15, "device");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v8);

        if (v17)
        {
          v18 = v15;

          v12 = v18;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(a1[4], "_registerForMessages");
  v19 = a1[4];
  if (v8)
  {
    objc_msgSend(v19, "setResidentSupported:", 1);
    objc_msgSend(v8, "capabilities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isResidentCapable");

    if (v21)
    {
      objc_msgSend(a1[4], "notificationCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:selector:name:object:", a1[4], sel_handleDeviceUpdated_, CFSTR("HMDDeviceUpdatedNotification"), 0);

    }
    if (v12)
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = a1[4];
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = a1[5];
        *(_DWORD *)buf = 138543618;
        v52 = v27;
        v53 = 2112;
        v54 = v28;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Current device is a resident in home %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke_112;
      aBlock[3] = &unk_1E89AE548;
      v29 = v12;
      v30 = a1[4];
      v43 = v29;
      v44 = v30;
      v45 = v8;
      v31 = _Block_copy(aBlock);
      v32 = [HMDBackingStoreCacheFetchModelObjects alloc];
      objc_msgSend(v29, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[HMDBackingStoreCacheFetchModelObjects initWithUUIDs:fetchResult:](v32, "initWithUUIDs:fetchResult:", v34, v31);

      objc_msgSend(a1[5], "backingStore");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "submit:", v35);

      goto LABEL_23;
    }
  }
  else
  {
    v22 = objc_msgSend(v19, "setResidentSupported:", 0);
  }
  v37 = (void *)MEMORY[0x1D17BA0A0](v22);
  v38 = a1[4];
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = a1[5];
    *(_DWORD *)buf = 138543618;
    v52 = v40;
    v53 = 2112;
    v54 = v41;
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Current device is not a resident in home %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v37);
LABEL_23:
  if ((objc_msgSend(v12, "isEnabled") & 1) != 0 || (objc_msgSend(a1[4], "_shouldEnableCoordinationElection") & 1) == 0)
    objc_msgSend(a1[4], "_startElectionAddOn");
  objc_msgSend(a1[4], "_run");

}

uint64_t __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v37;
  id obj;
  _QWORD v39[5];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v37 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v10, "object", v37);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v13))
        {
          objc_msgSend(v10, "object");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
          v16 = v15;

          if (v16)
          {

            objc_msgSend(v14, "device");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = (void *)MEMORY[0x1D17BA0A0]();
            v25 = *(id *)(a1 + 40);
            HMFGetOSLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v23)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = *(_QWORD *)(a1 + 48);
                objc_msgSend(*(id *)(a1 + 40), "home");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v46 = v28;
                v47 = 2112;
                v48 = v29;
                v49 = 2112;
                v50 = v30;
                _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Current device %@ is in the cloud for home %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v24);
            }
            else
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = *(_QWORD *)(a1 + 48);
                objc_msgSend(*(id *)(a1 + 40), "home");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v46 = v31;
                v47 = 2112;
                v48 = v32;
                v49 = 2112;
                v50 = v33;
                _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Current device %@ should be updated in the cloud for home %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v24);
              v35 = *(void **)(a1 + 40);
              v34 = *(_QWORD *)(a1 + 48);
              v39[0] = MEMORY[0x1E0C809B0];
              v39[1] = 3221225472;
              v39[2] = __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke_114;
              v39[3] = &unk_1E89C21C0;
              v39[4] = v35;
              v40 = v14;
              v14 = v14;
              objc_msgSend(v35, "__currentDeviceUpdated:completion:", v34, v39);

            }
            goto LABEL_26;
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (v7)
        continue;
      break;
    }
  }

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v20;
    v47 = 2112;
    v48 = v21;
    v49 = 2112;
    v50 = v22;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Model not detected for current device %@ for home %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
LABEL_26:

  return 1;
}

void __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke_114(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveWithReason:information:postSyncNotification:objectChange:", CFSTR("residentUpdated"), 0, 0, *(_QWORD *)(a1 + 40) != 0);

}

void __44__HMDResidentDeviceManagerLegacy_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "legacyElection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t59 != -1)
    dispatch_once(&logCategory__hmf_once_t59, &__block_literal_global_175);
  return (id)logCategory__hmf_once_v60;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __45__HMDResidentDeviceManagerLegacy_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v60;
  logCategory__hmf_once_v60 = v0;

}

@end
