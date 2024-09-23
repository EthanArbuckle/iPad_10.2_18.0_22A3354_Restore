@implementation HMDKeyTransferAgentClient

- (unint64_t)residentProvisioningStatus
{
  return self->_residentProvisioningStatus;
}

- (HMDKeyTransferAgentClient)initWithHomeManager:(id)a3
{
  id v4;
  HMDKeyTransferAgentClient *v5;
  void *v6;
  HMDKeyTransferAgentClient *v7;
  NSObject *v8;
  void *v9;
  HMDRemoteAccountMessageFilter *v10;
  void *v11;
  HMDRemoteAccountMessageFilter *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *idsKeys;
  uint64_t v24;
  NSMutableDictionary *v25;
  HMDKeyTransferAgentClient *v26;
  NSObject *v27;
  NSObject *v28;
  HMDKeyTransferAgentClient *v29;
  uint64_t v30;
  HMFExponentialBackoffTimer *atHomeRetryTimer;
  uint64_t v32;
  NSMutableDictionary *bonjourKeys;
  uint64_t v34;
  NSMutableSet *targetsToProcess;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  HMFNetMonitor *netMonitor;
  void *v44;
  void *context;
  HMDRemoteAccountMessageFilter *v46;
  void *v47;
  _QWORD block[4];
  HMDKeyTransferAgentClient *v49;
  objc_super v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  const __CFString *v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)HMDKeyTransferAgentClient;
  v5 = -[HMDKeyTransferAgent initWithHomeManager:](&v50, sel_initWithHomeManager_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Creating KeyTransferAgent", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = [HMDRemoteAccountMessageFilter alloc];
    -[HMDKeyTransferAgent messageDestination](v7, "messageDestination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDRemoteAccountMessageFilter initWithTarget:](v10, "initWithTarget:", v11);

    objc_msgSend(v4, "msgFilterChain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addMessageFilter:", v12);

    +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRequiresSecureMessage:", 0);
    objc_msgSend(v14, "setRequiresAccountMessage:", 1);
    objc_msgSend(v14, "setTransportRestriction:", 1);
    v15 = objc_msgSend(v14, "copy");
    objc_msgSend(v4, "messageDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v15;
    v56[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerForMessage:receiver:policies:selector:", CFSTR("kKeyTransferAgentKey"), v7, v17, sel__handleKeyTransferAgentMessage_);

    +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRequiresSecureMessage:", 1);
    objc_msgSend(v18, "setRequiresAccountMessage:", 1);
    objc_msgSend(v18, "setTransportRestriction:", -1);
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v4, "messageDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerForMessage:receiver:policies:selector:", CFSTR("kResidentProvisioningStatusChangedNotificationKey"), v7, v21, sel__handleResidentProvisioningStatusChanged_);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/homed/com.apple.atvpair.plist"));
    v22 = objc_claimAutoreleasedReturnValue();
    idsKeys = v7->_idsKeys;
    v7->_idsKeys = (NSMutableDictionary *)v22;

    if (!v7->_idsKeys)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v7->_idsKeys;
      v7->_idsKeys = (NSMutableDictionary *)v24;

      if ((-[NSMutableDictionary writeToFile:atomically:](v7->_idsKeys, "writeToFile:atomically:", CFSTR("/var/mobile/Library/homed/com.apple.atvpair.plist"), 1) & 1) == 0)
      {
        v46 = v12;
        context = (void *)MEMORY[0x1D17BA0A0]();
        v26 = v7;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v44;
          v53 = 2112;
          v54 = CFSTR("/var/mobile/Library/homed/com.apple.atvpair.plist");
          _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to write key storage plist %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        v12 = v46;
      }
    }
    if (-[NSMutableDictionary count](v7->_idsKeys, "count"))
    {
      -[HMDKeyTransferAgent workQueue](v7, "workQueue");
      v28 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__HMDKeyTransferAgentClient_initWithHomeManager___block_invoke;
      block[3] = &unk_1E89C2730;
      v29 = v7;
      v49 = v29;
      dispatch_async(v28, block);

      -[HMDKeyTransferAgentClient setResidentProvisioningStatus:](v29, "setResidentProvisioningStatus:", 2);
    }
    else
    {
      -[HMDKeyTransferAgentClient setResidentProvisioningStatus:](v7, "setResidentProvisioningStatus:", 0);
    }
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D28578]), "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 4, 1, 10.0, 86400.0);
    atHomeRetryTimer = v7->_atHomeRetryTimer;
    v7->_atHomeRetryTimer = (HMFExponentialBackoffTimer *)v30;

    -[HMFExponentialBackoffTimer setDelegate:](v7->_atHomeRetryTimer, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v32 = objc_claimAutoreleasedReturnValue();
    bonjourKeys = v7->_bonjourKeys;
    v7->_bonjourKeys = (NSMutableDictionary *)v32;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v34 = objc_claimAutoreleasedReturnValue();
    targetsToProcess = v7->_targetsToProcess;
    v7->_targetsToProcess = (NSMutableSet *)v34;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v7, sel___accessoryIsReachable_, CFSTR("HMDAccessoryIsReachableNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v7, sel___deviceAddedToAccount_, CFSTR("HMDAccountAddedDeviceNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v7, sel___deviceUpdated_, CFSTR("HMDDeviceUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v7, sel___deviceRemovedFromAccount_, CFSTR("HMDAccountRemovedDeviceNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObserver:selector:name:object:", v7, sel___accountChanged_, CFSTR("HMDAppleAccountManagerAccountModifiedNotification"), 0);

    v7->_haveCulledPlist = 0;
    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0D28610]), "initWithNetAddress:", 0);
    netMonitor = v7->_netMonitor;
    v7->_netMonitor = (HMFNetMonitor *)v41;

    -[HMFNetMonitor setDelegate:](v7->_netMonitor, "setDelegate:", v7);
    v7->_tfaState = 0;
    if (-[HMFNetMonitor isReachable](v7->_netMonitor, "isReachable"))
    {
      -[HMDKeyTransferAgentClient queryPlistDevices](v7, "queryPlistDevices");
      v7->_haveCulledPlist = 1;
    }

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HMDKeyTransferAgent homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMDKeyTransferAgentClient;
  -[HMDKeyTransferAgentClient dealloc](&v6, sel_dealloc);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = a3;
  -[HMDKeyTransferAgentClient atHomeRetryTimer](self, "atHomeRetryTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HMDKeyTransferAgent workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__HMDKeyTransferAgentClient_timerDidFire___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (void)networkMonitorIsReachable:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDKeyTransferAgent workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HMDKeyTransferAgentClient_networkMonitorIsReachable___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_saveKeyPlist
{
  void *v3;
  char v4;
  void *v5;
  HMDKeyTransferAgentClient *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDKeyTransferAgentClient idsKeys](self, "idsKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "writeToFile:atomically:", CFSTR("/var/mobile/Library/homed/com.apple.atvpair.plist"), 1);

  if ((v4 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = CFSTR("/var/mobile/Library/homed/com.apple.atvpair.plist");
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to write key storage plist %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  -[HMDKeyTransferAgentClient idsKeys](self, "idsKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 2;
  }
  else
  {
    -[HMDKeyTransferAgentClient _stopBrowser](self, "_stopBrowser");
    v11 = 0;
  }
  -[HMDKeyTransferAgentClient setResidentProvisioningStatus:](self, "setResidentProvisioningStatus:", v11);
}

- (id)_deviceWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  HMDKeyTransferAgentClient *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  HMDKeyTransferAgentClient *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  HMDKeyTransferAgentClient *v30;
  NSObject *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v4, "isEqual:", v15);

      if (v16)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if (objc_msgSend(v13, "isCurrentDevice"))
    {
      v22 = MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping sending key to ourselves", buf, 0xCu);

      }
      v26 = (void *)v22;
    }
    else
    {
      objc_msgSend(v13, "capabilities");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "supportsKeyTransferServer");

      if ((v28 & 1) != 0)
      {
        v21 = v13;
LABEL_22:

        goto LABEL_23;
      }
      v29 = MEMORY[0x1D17BA0A0]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v32;
        v40 = 2112;
        v41 = v13;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Device does not support key transfer: %@", buf, 0x16u);

      }
      v26 = (void *)v29;
    }
    objc_autoreleasePoolPop(v26);
    v21 = 0;
    goto LABEL_22;
  }
LABEL_9:

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v20;
    v40 = 2112;
    v41 = v4;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to find device with UUID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v21 = 0;
LABEL_23:

  return v21;
}

- (void)queryPlistDevices
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDKeyTransferAgentClient *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDKeyTransferAgent homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "isOwnerUser"))
        {
          objc_msgSend(v10, "accessories");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {

            -[HMDKeyTransferAgent workQueue](self, "workQueue");
            v17 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke;
            block[3] = &unk_1E89C2730;
            block[4] = self;
            dispatch_async(v17, block);

            goto LABEL_14;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v16;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@No accessories found in owned homes, skipping key transfer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
LABEL_14:

}

- (void)resetConfig
{
  void *v3;
  HMDKeyTransferAgentClient *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting Configuration (flushing any stored UUIDs that we have).", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDKeyTransferAgent workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMDKeyTransferAgentClient_resetConfig__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (void)setResidentProvisioningStatus:(unint64_t)a3
{
  void *v5;
  HMDKeyTransferAgentClient *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updating Resident Provisioning Status: %lx", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = (void *)MEMORY[0x1E0D285D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3, CFSTR("kProvisioningStatusKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entitledMessageWithName:messagePayload:", CFSTR("kResidentProvisioningStatusChangedNotificationKey"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v6->_residentProvisioningStatus = a3;
  -[HMDKeyTransferAgent homeManager](v6, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendMessage:target:", v12, v15);

}

- (void)_startBrowser
{
  void *v3;
  void *v4;
  HMDKeyTransferAgentClient *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDKeyTransferAgentClient serviceBrowser](self, "serviceBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting Bonjour browser.", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28620]), "initWithDomain:serviceType:", CFSTR("local."), CFSTR("_homekit._tcp."));
    -[HMDKeyTransferAgentClient setServiceBrowser:](v5, "setServiceBrowser:", v8);

    -[HMDKeyTransferAgentClient serviceBrowser](v5, "serviceBrowser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v5);

    -[HMDKeyTransferAgentClient serviceBrowser](v5, "serviceBrowser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShouldCache:", 1);

    -[HMDKeyTransferAgentClient setResolutionInProgress:](v5, "setResolutionInProgress:", 0);
    -[HMDKeyTransferAgentClient _beginBonjourResolution:](v5, "_beginBonjourResolution:", 0);
  }
}

- (void)_stopBrowser
{
  void *v3;
  HMDKeyTransferAgentClient *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Ending Bonjour browser.", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDKeyTransferAgentClient serviceBrowser](v4, "serviceBrowser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopBrowsing");

  -[HMDKeyTransferAgentClient setServiceBrowser:](v4, "setServiceBrowser:", 0);
  -[HMDKeyTransferAgentClient setResolutionInProgress:](v4, "setResolutionInProgress:", 0);
}

- (void)_reallyBeginBonjourResolution
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HMDKeyTransferAgentClient serviceBrowser](self, "serviceBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__HMDKeyTransferAgentClient__reallyBeginBonjourResolution__block_invoke;
  v4[3] = &unk_1E89BF250;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "startBrowsingWithCompletionHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_beginBonjourResolution:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  HMDKeyTransferAgentClient *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  HMDKeyTransferAgentClient *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *v19;
  void *v20;
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (-[HMDKeyTransferAgentClient resolutionInProgress](self, "resolutionInProgress"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v8;
      v9 = "%{public}@Bonjour discovery already in progress.";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEBUG;
LABEL_11:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, buf, 0xCu);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  -[HMDKeyTransferAgentClient serviceBrowser](self, "serviceBrowser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v8;
      v9 = "%{public}@No allocated Bonjour browser. Not attempting to start.";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_11;
    }
LABEL_12:

    objc_autoreleasePoolPop(v5);
    return;
  }
  v13 = (void *)MEMORY[0x1D17BA0A0](-[HMDKeyTransferAgentClient setResolutionInProgress:](self, "setResolutionInProgress:", 1));
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v17;
      v24 = 2048;
      v25 = 600;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Re-starting Bonjour discovery in %lu seconds", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = dispatch_time(0, 600000000000);
    -[HMDKeyTransferAgent workQueue](v14, "workQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HMDKeyTransferAgentClient__beginBonjourResolution___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = v14;
    dispatch_after(v18, v19, block);

  }
  else
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v20;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Starting Bonjour discovery.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDKeyTransferAgentClient _reallyBeginBonjourResolution](v14, "_reallyBeginBonjourResolution");
  }
}

- (void)_endPairingWithError:(id)a3 suspendingTimer:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  HMDKeyTransferAgentClient *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDKeyTransferAgentClient *v12;
  NSObject *v13;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  HMDKeyTransferAgentClient *v31;
  NSObject *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  if (v34)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v9;
      v42 = 2112;
      v43 = v34;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Pairing ended in failure: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    -[HMDKeyTransferAgentClient atHomeRetryTimer](self, "atHomeRetryTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reset");

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Pairing ended successfully", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDKeyTransferAgentClient pairingWithUUID](v12, "pairingWithUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HMDKeyTransferAgentClient bonjourKeys](v12, "bonjourKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDKeyTransferAgentClient pairingWithUUID](v12, "pairingWithUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectForKey:", v17);

      -[HMDKeyTransferAgentClient idsKeys](v12, "idsKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDKeyTransferAgentClient pairingWithUUID](v12, "pairingWithUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", v19);

    }
    -[HMDKeyTransferAgentClient _saveKeyPlist](v12, "_saveKeyPlist");
  }
  -[HMDKeyTransferAgentClient pairingWithUUID](self, "pairingWithUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HMDKeyTransferAgentClient targetsToProcess](self, "targetsToProcess");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDKeyTransferAgentClient pairingWithUUID](self, "pairingWithUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObject:", v22);

  }
  -[HMDKeyTransferAgentClient setPairingWithUUID:](self, "setPairingWithUUID:", 0);
  if (v4)
  {
    -[HMDKeyTransferAgentClient atHomeRetryTimer](self, "atHomeRetryTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "suspend");

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HMDKeyTransferAgentClient targetsToProcess](self, "targetsToProcess");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v36;
LABEL_16:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v28);
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v33;
        v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Processing remaining device in queue %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      if (-[HMDKeyTransferAgentClient _newDeviceSeen:](v31, "_newDeviceSeen:", v29))
        break;
      if (v26 == ++v28)
      {
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v26)
          goto LABEL_16;
        break;
      }
    }
  }

}

- (void)_startPairingWithKeyUUID:(id)a3 forTarget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDKeyTransferAgentClient *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDKeyTransferAgentClient *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDKeyTransferAgentClient pairingWithUUID](self, "pairingWithUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDKeyTransferAgentClient pairingWithUUID](self, "pairingWithUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v7);

    if ((v10 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDKeyTransferAgentClient pairingWithUUID](v12, "pairingWithUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v14;
        v28 = 2112;
        v29 = v15;
        v30 = 2112;
        v31 = v7;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Currently in the middle of processing a request from %@ (queueing request from %@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      -[HMDKeyTransferAgentClient targetsToProcess](v12, "targetsToProcess");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v7);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Beginning KeyTransferAgent", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDKeyTransferAgentClient setPairingWithUUID:](v18, "setPairingWithUUID:", v7);
    if (-[HMDKeyTransferAgentClient tfaState](v18, "tfaState"))
    {
      -[HMDKeyTransferAgentClient _tfaVerificationCompleteForKeyUUID:forTarget:](v18, "_tfaVerificationCompleteForKeyUUID:forTarget:", v6, v7);
    }
    else
    {
      -[HMDKeyTransferAgentClient atHomeRetryTimer](v18, "atHomeRetryTimer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "suspend");

      objc_initWeak((id *)buf, v18);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __64__HMDKeyTransferAgentClient__startPairingWithKeyUUID_forTarget___block_invoke;
      v22[3] = &unk_1E89B88D8;
      objc_copyWeak(&v25, (id *)buf);
      v23 = v6;
      v24 = v7;
      +[HMDRemoteLoginUtilities fetchIsTwoFactorAuthenticationEnabledForAccountWithReason:completionHandler:](HMDRemoteLoginUtilities, "fetchIsTwoFactorAuthenticationEnabledForAccountWithReason:completionHandler:", CFSTR("Pairing with Apple TV"), v22);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)_tfaVerificationCompleteForKeyUUID:(id)a3 forTarget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (-[HMDKeyTransferAgentClient tfaState](self, "tfaState") == 1)
  {
    -[HMDKeyTransferAgentClient atHomeRetryTimer](self, "atHomeRetryTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "suspend");

    -[HMDKeyTransferAgent homeManager](self, "homeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startLocalTransport");

    -[HMDKeyTransferAgentClient setResidentProvisioningStatus:](self, "setResidentProvisioningStatus:", -[HMDKeyTransferAgentClient residentProvisioningStatus](self, "residentProvisioningStatus") & 0xFFFFFFFFFFFFFFFELL);
    v10 = dispatch_time(0, 20000000000);
    -[HMDKeyTransferAgent workQueue](self, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__HMDKeyTransferAgentClient__tfaVerificationCompleteForKeyUUID_forTarget___block_invoke;
    block[3] = &unk_1E89C20C8;
    block[4] = self;
    v15 = v6;
    v16 = v7;
    dispatch_after(v10, v11, block);

  }
  else
  {
    -[HMDKeyTransferAgentClient setResidentProvisioningStatus:](self, "setResidentProvisioningStatus:", -[HMDKeyTransferAgentClient residentProvisioningStatus](self, "residentProvisioningStatus") | 1);
    -[HMDKeyTransferAgentClient atHomeRetryTimer](self, "atHomeRetryTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDKeyTransferAgentClient _endPairingWithError:suspendingTimer:](self, "_endPairingWithError:suspendingTimer:", v13, 0);

  }
}

- (void)_tryPairingWithAccessories:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "removeObject:", v8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__HMDKeyTransferAgentClient__tryPairingWithAccessories_completionHandler___block_invoke;
    v10[3] = &unk_1E89AD7A8;
    v10[4] = self;
    v11 = v8;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v11, "verifyPairingWithCompletionHandler:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

  }
}

- (void)_haveVerifiedTwoFactorAuthenticationWithKeyUUID:(id)a3 forTarget:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMDKeyTransferAgentClient *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  HMDKeyTransferAgentClient *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char v37;
  void *v38;
  HMDKeyTransferAgentClient *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  id v51;
  void *v52;
  id v53;
  void *v54;
  HMDKeyTransferAgentClient *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  const char *v61;
  HMDKeyTransferAgentClient *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  HMDKeyTransferAgentClient *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  HMDKeyTransferAgentClient *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  HMDKeyTransferAgentClient *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  HMDKeyTransferAgentClient *v86;
  uint64_t v87;
  id v88;
  id obj;
  id obja;
  _QWORD v91[5];
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  uint8_t v107[128];
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  id v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v83 = a3;
  v88 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
  v86 = self;
  if (!v9)
  {
LABEL_14:

LABEL_52:
    v68 = (void *)MEMORY[0x1D17BA0A0]();
    v69 = v86;
    HMFGetOSLogHandle();
    v70 = objc_claimAutoreleasedReturnValue();
    v34 = v83;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v109 = v71;
      v110 = 2112;
      v111 = v88;
      _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_ERROR, "%{public}@The device with uuid %@ does not belong to the current user (waiting for IDS notification).", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v68);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 10, 0);
    v66 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDKeyTransferAgentClient _endPairingWithError:suspendingTimer:](v69, "_endPairingWithError:suspendingTimer:", v66, 1);
    goto LABEL_59;
  }
  v10 = v9;
  v11 = *(_QWORD *)v103;
LABEL_3:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v103 != v11)
      objc_enumerationMutation(obj);
    v13 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v12);
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v109 = v17;
      v110 = 2112;
      v111 = v19;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Checking ownership of %@", buf, 0x16u);

      self = v86;
    }

    objc_autoreleasePoolPop(v14);
    objc_msgSend(v13, "capabilities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "supportsKeyTransferServer") & 1) == 0)
    {

      goto LABEL_12;
    }
    objc_msgSend(v13, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v88, "isEqual:", v22);

    if (v23)
      break;
LABEL_12:
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
      if (!v10)
        goto LABEL_14;
      goto LABEL_3;
    }
  }
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = v15;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v109 = v28;
    v110 = 2112;
    v111 = v30;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@We own device %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  v31 = v13;

  if (!v31)
    goto LABEL_52;
  v100 = 0u;
  v101 = 0u;
  v99 = 0u;
  v98 = 0u;
  -[HMDKeyTransferAgent homeManager](v25, "homeManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "homes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v83;
  v81 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
  if (v81)
  {
    v82 = *(_QWORD *)v99;
    v79 = v33;
    v80 = v31;
    v78 = v25;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v99 != v82)
          objc_enumerationMutation(v33);
        v87 = v35;
        v36 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v35);
        v37 = objc_msgSend(v36, "isOwnerUser");
        v38 = (void *)MEMORY[0x1D17BA0A0]();
        v39 = v25;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
        if ((v37 & 1) == 0)
        {
          if (v41)
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "uuid");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "UUIDString");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v109 = v63;
            v110 = 2112;
            v111 = v65;
            _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@We do not own the home %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v38);
          goto LABEL_49;
        }
        if (v41)
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "uuid");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "UUIDString");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v109 = v42;
          v110 = 2112;
          v111 = v44;
          _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@We own the home %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v38);
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        objc_msgSend(v36, "accessories");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v45, "copy");

        obja = v46;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
        if (!v47)
          goto LABEL_45;
        v48 = v47;
        v49 = *(_QWORD *)v95;
        while (2)
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v95 != v49)
              objc_enumerationMutation(obja);
            v51 = *(id *)(*((_QWORD *)&v94 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v52 = v51;
            else
              v52 = 0;
            v53 = v52;

            if (v53)
            {
              if (objc_msgSend(v53, "isSecuritySessionOpen"))
              {
                v72 = (void *)MEMORY[0x1D17BA0A0]();
                v73 = v39;
                HMFGetOSLogHandle();
                v74 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "uuid");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "UUIDString");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v109 = v75;
                  v110 = 2112;
                  v111 = v77;
                  _os_log_impl(&dword_1CD062000, v74, OS_LOG_TYPE_DEFAULT, "%{public}@%@ has an open pair verify session (how lucky).", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v72);
                v34 = v83;
                v66 = v80;
                -[HMDKeyTransferAgentClient _havePairVerifiedAccessoryWithKeyUUID:forDevice:](v73, "_havePairVerifiedAccessoryWithKeyUUID:forDevice:", v83, v80);

                v67 = v79;
                goto LABEL_58;
              }
              if (objc_msgSend(v53, "linkSpeed") < 0)
              {
                v54 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v84, "addObject:", v53));
                v62 = v39;
                HMFGetOSLogHandle();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "uuid");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "UUIDString");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v109 = v57;
                  v110 = 2112;
                  v111 = v59;
                  v60 = v56;
                  v61 = "%{public}@%@ is a slow accessory.";
LABEL_41:
                  _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_DEFAULT, v61, buf, 0x16u);

                }
              }
              else
              {
                v54 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v85, "addObject:", v53));
                v55 = v39;
                HMFGetOSLogHandle();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "uuid");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "UUIDString");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v109 = v57;
                  v110 = 2112;
                  v111 = v59;
                  v60 = v56;
                  v61 = "%{public}@%@ is a fast accessory.";
                  goto LABEL_41;
                }
              }

              objc_autoreleasePoolPop(v54);
            }

          }
          v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
          if (v48)
            continue;
          break;
        }
LABEL_45:

        v34 = v83;
        v33 = v79;
        v31 = v80;
        v25 = v78;
LABEL_49:
        v35 = v87 + 1;
      }
      while (v87 + 1 != v81);
      v81 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
    }
    while (v81);
  }

  objc_msgSend(v85, "addObjectsFromArray:", v84);
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __87__HMDKeyTransferAgentClient__haveVerifiedTwoFactorAuthenticationWithKeyUUID_forTarget___block_invoke;
  v91[3] = &unk_1E89C0DA8;
  v91[4] = v25;
  v92 = v34;
  v93 = v31;
  v66 = v31;
  -[HMDKeyTransferAgentClient _tryPairingWithAccessories:completionHandler:](v25, "_tryPairingWithAccessories:completionHandler:", v85, v91);

  v67 = v92;
LABEL_58:

LABEL_59:
}

- (void)_havePairVerifiedAccessoryWithKeyUUID:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  HMDRemoteDeviceMessageDestination *v8;
  void *v9;
  HMDRemoteDeviceMessageDestination *v10;
  HMDRemoteMessage *v11;
  void *v12;
  HMDRemoteMessage *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [HMDRemoteDeviceMessageDestination alloc];
  -[HMDKeyTransferAgent uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v8, "initWithTarget:device:", v9, v7);

  v11 = [HMDRemoteMessage alloc];
  v24[0] = CFSTR("phase");
  v24[1] = CFSTR("data");
  v25[0] = CFSTR("ping");
  v25[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:](v11, "initWithName:destination:payload:type:timeout:secure:restriction:", CFSTR("kKeyTransferAgentKey"), v10, v12, 0, 0, 2, 0.0);

  objc_initWeak(&location, self);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __77__HMDKeyTransferAgentClient__havePairVerifiedAccessoryWithKeyUUID_forDevice___block_invoke;
  v20 = &unk_1E89BF4F0;
  objc_copyWeak(&v22, &location);
  v14 = v7;
  v21 = v14;
  -[HMDRemoteMessage setResponseHandler:](v13, "setResponseHandler:", &v17);
  -[HMDKeyTransferAgent homeManager](self, "homeManager", v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendMessage:completionHandler:", v13, 0);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)_sendIOSPublicKey:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  id v12;
  HMDRemoteDeviceMessageDestination *v13;
  void *v14;
  HMDRemoteDeviceMessageDestination *v15;
  HMDRemoteMessage *v16;
  void *v17;
  HMDRemoteMessage *v18;
  void *v19;
  void *v20;
  HMDKeyTransferAgentClient *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(id *, void *, void *);
  void *v27;
  HMDKeyTransferAgentClient *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[3];
  _QWORD v35[3];
  _BYTE location[12];
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDKeyTransferAgent homeManager](self, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = 0;
  v31 = 0;
  v9 = objc_msgSend(v8, "getOrCreateControllerPublicKey:controllerUsername:error:", &v33, &v32, &v31);
  v10 = v33;
  v11 = v32;
  v12 = v31;
  if ((v9 & 1) != 0)
  {
    v13 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDKeyTransferAgent uuid](self, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v13, "initWithTarget:device:", v14, v7);

    v16 = [HMDRemoteMessage alloc];
    v34[0] = CFSTR("phase");
    v34[1] = CFSTR("kControllerKeyPairKey");
    v35[0] = CFSTR("send_public");
    v35[1] = v10;
    v34[2] = CFSTR("kControllerPairingNameKey");
    v35[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:](v16, "initWithName:destination:payload:type:timeout:secure:restriction:", CFSTR("kKeyTransferAgentKey"), v15, v17, 0, 0, 1, 0.0);

    objc_initWeak((id *)location, self);
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __58__HMDKeyTransferAgentClient__sendIOSPublicKey_withDevice___block_invoke;
    v27 = &unk_1E89C1698;
    v28 = self;
    objc_copyWeak(&v30, (id *)location);
    v29 = v7;
    -[HMDRemoteMessage setResponseHandler:](v18, "setResponseHandler:", &v24);
    objc_msgSend(v8, "messageDispatcher", v24, v25, v26, v27, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sendMessage:", v18);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v23;
      v37 = 2112;
      v38 = v12;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to get IOS controller key / name: %@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDKeyTransferAgentClient _endPairingWithError:suspendingTimer:](v21, "_endPairingWithError:suspendingTimer:", v12, 1);
  }

}

- (void)_sendATVPrivateKey:(id)a3 withDevice:(id)a4 retry:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  HMDRemoteDeviceMessageDestination *v15;
  void *v16;
  HMDRemoteMessage *v17;
  void *v18;
  HMDRemoteMessage *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDKeyTransferAgentClient *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDKeyTransferAgentClient *v27;
  NSObject *v28;
  void *v29;
  HMDRemoteDeviceMessageDestination *v30;
  id v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40[2];
  id v41;
  id v42;
  id v43;
  _QWORD v44[3];
  _QWORD v45[3];
  _BYTE location[12];
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "hmf_stringForKey:", CFSTR("kControllerPairingNameKey"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_dataForKey:", CFSTR("kControllerKeyPairKey"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v34);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D165A8]), "initWithIdentifier:publicKey:privateKey:permissions:", v35, v9, 0, 0);
  if (v10)
  {
    +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerIdentity:device:object:", v10, v8, self);

    objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = 0;
    v41 = 0;
    v13 = objc_msgSend(v12, "getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:", 0, 0, &v43, &v42, 0, &v41);
    v32 = v43;
    v14 = v42;
    v33 = v41;

    if ((v13 & 1) != 0)
    {
      v15 = [HMDRemoteDeviceMessageDestination alloc];
      -[HMDKeyTransferAgent uuid](self, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v15, "initWithTarget:device:", v16, v8);

      v17 = [HMDRemoteMessage alloc];
      v44[0] = CFSTR("phase");
      v44[1] = CFSTR("kControllerKeyPairKey");
      v45[0] = CFSTR("send_private");
      v45[1] = v32;
      v44[2] = CFSTR("kControllerPairingNameKey");
      v45[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:](v17, "initWithName:destination:payload:type:timeout:secure:restriction:", CFSTR("kKeyTransferAgentKey"), v30, v18, 0, 1, 2, 0.0);

      objc_initWeak((id *)location, self);
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke;
      v36[3] = &unk_1E89AD7F8;
      v36[4] = self;
      objc_copyWeak(v40, (id *)location);
      v40[1] = (id)a5;
      v37 = v8;
      v38 = v7;
      v39 = v10;
      -[HMDRemoteMessage setResponseHandler:](v19, "setResponseHandler:", v36);
      -[HMDKeyTransferAgent homeManager](self, "homeManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "messageDispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendMessage:completionHandler:", v19, 0);

      -[HMDKeyTransferAgentClient setResidentProvisioningStatus:](self, "setResidentProvisioningStatus:", 0);
      objc_destroyWeak(v40);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v29;
        v47 = 2112;
        v48 = v33;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@unable to retrieve iOS public / private key pair: %@", location, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      -[HMDKeyTransferAgentClient _endPairingWithError:suspendingTimer:](v27, "_endPairingWithError:suspendingTimer:", v33, 1);
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@did not get valid username / public key from ATV device.", location, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 3, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDKeyTransferAgentClient _endPairingWithError:suspendingTimer:](v23, "_endPairingWithError:suspendingTimer:", v14, 1);
  }

}

- (BOOL)_newDeviceSeen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDKeyTransferAgentClient *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  HMDKeyTransferAgentClient *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDKeyTransferAgentClient bonjourKeys](self, "bonjourKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDKeyTransferAgentClient idsKeys](self, "idsKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@We *DO NOT* have this device's pairing id via Bonjour", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    if (v8)
      -[HMDKeyTransferAgentClient setResidentProvisioningStatus:](v10, "setResidentProvisioningStatus:", 2);
    goto LABEL_19;
  }
  if (v12)
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@We have received this device's pairing id via Bonjour", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = v10;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v21;
      v22 = "%{public}@We *DO NOT* have this device's pairing id via IDS";
      v23 = v16;
      v24 = 12;
LABEL_17:
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v26, v24);

    }
LABEL_18:

    objc_autoreleasePoolPop(v14);
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
  if (v17)
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v18;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@We have received this device's pairing id via IDS", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  if ((objc_msgSend(v6, "isEqual:", v8) & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v15;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v21;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v8;
      v22 = "%{public}@Bonjour and IDS keys do not match (%@!=%@)";
      v23 = v16;
      v24 = 32;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  -[HMDKeyTransferAgentClient _startPairingWithKeyUUID:forTarget:](v15, "_startPairingWithKeyUUID:forTarget:", v8, v4);
  v19 = 1;
LABEL_20:

  return v19;
}

- (void)_device:(id)a3 addedToAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDKeyTransferAgentClient *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDKeyTransferAgentClient *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && v7
    && (+[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "account"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v7, "isEqual:", v11),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Got notification that %@ was added to the current account", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDKeyTransferAgentClient _newDeviceSeen:](v14, "_newDeviceSeen:", v9);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v20;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ not added / updated from current account %@.", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)__deviceAddedToAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMDKeyTransferAgentClient___deviceAddedToAccount___block_invoke;
  block[3] = &unk_1E89BE218;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)__deviceUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMDKeyTransferAgentClient___deviceUpdated___block_invoke;
  block[3] = &unk_1E89BE218;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_device:(id)a3 removedFromAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDKeyTransferAgentClient *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HMDKeyTransferAgentClient *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  HMDKeyTransferAgentClient *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && v7
    && (+[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "account"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v7, "isEqual:", v11),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v16;
      v36 = 2112;
      v37 = v18;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Got notification that %@ was removed from the current account", (uint8_t *)&v34, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDKeyTransferAgentClient pairingWithUUID](v14, "pairingWithUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", v9);

    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v14;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v24)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v25;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Ending current pairing operation with a no longer valid device.", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 10, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDKeyTransferAgentClient _endPairingWithError:suspendingTimer:](v22, "_endPairingWithError:suspendingTimer:", v26, 1);

    }
    else
    {
      if (v24)
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v32;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Removing device from list of potential pairing devices.", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[HMDKeyTransferAgentClient idsKeys](v22, "idsKeys");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeObjectForKey:", v9);

      -[HMDKeyTransferAgentClient _saveKeyPlist](v22, "_saveKeyPlist");
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543874;
      v35 = v30;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v31;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ not removed from current account %@.", (uint8_t *)&v34, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
  }

}

- (void)__deviceRemovedFromAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HMDKeyTransferAgentClient___deviceRemovedFromAccount___block_invoke;
  block[3] = &unk_1E89BE218;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)__accessoryIsReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMDKeyTransferAgentClient___accessoryIsReachable___block_invoke;
  block[3] = &unk_1E89BE218;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)__accountChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HMDKeyTransferAgentClient___accountChanged___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_restartKeyTransfer:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  HMDKeyTransferAgentClient *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDKeyTransferAgentClient *v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDKeyTransferAgentClient bonjourKeys](self, "bonjourKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v24 = v13;
          v25 = 2112;
          v26 = v9;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Trying to key transfer with device %@.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        if (-[HMDKeyTransferAgentClient _newDeviceSeen:](v11, "_newDeviceSeen:", v9))
        {
          v14 = (void *)MEMORY[0x1D17BA0A0]();
          v15 = v11;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v24 = v17;
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Found device that we can possibly pair with.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v14);
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

}

- (void)_handleKeyTransferAgentMessage:(id)a3
{
  __CFString *v4;
  void *v5;
  HMDKeyTransferAgentClient *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDKeyTransferAgentClient *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  HMDKeyTransferAgentClient *v31;
  NSObject *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  HMDKeyTransferAgentClient *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  HMDKeyTransferAgentClient *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  _QWORD block[5];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringForKey:](v4, "stringForKey:", CFSTR("phase"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v51 = v8;
    v52 = 2112;
    v53 = v4;
    v54 = 2112;
    v55 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Got Message: %@ / %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringForKey:](v4, "stringForKey:", CFSTR("phase"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportIncomingLoxyMessage:", v11);

  -[__CFString stringForKey:](v4, "stringForKey:", CFSTR("phase"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("broadcast"));

  if (v13)
  {
    -[__CFString destination](v4, "destination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      objc_msgSend(v16, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[__CFString messagePayload](v4, "messagePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hmf_UUIDForKey:", CFSTR("data"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v6;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v26)
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = v27;
          v52 = 2112;
          v53 = v19;
          v54 = 2112;
          v55 = v22;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@HMDHomeManager %@ advertised key transfer UUID %@ (IDS)", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v23);
        -[HMDKeyTransferAgentClient idsKeys](v24, "idsKeys");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v22, v19);

        -[HMDKeyTransferAgent workQueue](v24, "workQueue");
        v29 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __60__HMDKeyTransferAgentClient__handleKeyTransferAgentMessage___block_invoke;
        block[3] = &unk_1E89C2730;
        block[4] = v24;
        dispatch_async(v29, block);
      }
      else
      {
        if (v26)
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v35;
          v52 = 2112;
          v53 = v19;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@HMDHomeManager %@ no longer advertising key transfer UUID (IDS)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        -[HMDKeyTransferAgentClient idsKeys](v24, "idsKeys");
        v29 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeObjectForKey:](v29, "removeObjectForKey:", v19);
      }

      -[HMDKeyTransferAgentClient idsKeys](v24, "idsKeys");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "writeToFile:atomically:", CFSTR("/var/mobile/Library/homed/com.apple.atvpair.plist"), 1);

      if ((v37 & 1) == 0)
      {
        v38 = (void *)MEMORY[0x1D17BA0A0]();
        v39 = v24;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v41;
          v52 = 2112;
          v53 = CFSTR("/var/mobile/Library/homed/com.apple.atvpair.plist");
          _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to write key storage plist %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v38);
      }
      if (v22)
      {
        -[HMDKeyTransferAgentClient _newDeviceSeen:](v24, "_newDeviceSeen:", v19);
      }
      else
      {
        -[HMDKeyTransferAgentClient pairingWithUUID](v24, "pairingWithUUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqual:", v19);

        if (v43)
        {
          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = v24;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v51 = v47;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Ending current pairing operation with a no longer valid device.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v44);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 10, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDKeyTransferAgentClient _endPairingWithError:suspendingTimer:](v45, "_endPairingWithError:suspendingTimer:", v48, 1);

        }
      }

    }
    -[__CFString respondWithPayload:](v4, "respondWithPayload:", 0);
  }
  else
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = v6;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringForKey:](v4, "stringForKey:", CFSTR("phase"));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v33;
      v52 = 2112;
      v53 = v34;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unknown message key %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[__CFString respondWithError:](v4, "respondWithError:", v16);
  }

}

- (void)_handleResidentProvisioningStatusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDKeyTransferAgentClient *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDKeyTransferAgentClient *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("data"));
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
      v20 = 138543618;
      v21 = v9;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Got broadcast info that %@ has been successfully peered with.", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDKeyTransferAgentClient idsKeys](v7, "idsKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v5);

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v7;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDKeyTransferAgentClient idsKeys](v12, "idsKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Current list of IDS received keys:%@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDKeyTransferAgentClient _saveKeyPlist](v12, "_saveKeyPlist");
    -[HMDKeyTransferAgentClient idsKeys](v12, "idsKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      -[HMDKeyTransferAgentClient atHomeRetryTimer](v12, "atHomeRetryTimer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reset");

      -[HMDKeyTransferAgentClient atHomeRetryTimer](v12, "atHomeRetryTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resume");

    }
  }
  objc_msgSend(v4, "respondWithPayload:", 0);

}

- (void)receivedBonjourTXTFrom:(id)a3 withUUIDData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  HMDKeyTransferAgentClient *v14;

  v6 = a3;
  v7 = a4;
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HMDKeyTransferAgentClient_receivedBonjourTXTFrom_withUUIDData___block_invoke;
  block[3] = &unk_1E89C20C8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)netServiceBrowser:(id)a3 didStopBrowsingWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDKeyTransferAgentClient *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Browsing got stop delegate with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDKeyTransferAgent workQueue](v9, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HMDKeyTransferAgentClient_netServiceBrowser_didStopBrowsingWithError___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = v9;
    dispatch_async(v13, block);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Browsing stopped.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)netService:(id)a3 didUpdateTXTRecord:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("uuid"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDKeyTransferAgentClient receivedBonjourTXTFrom:withUUIDData:](self, "receivedBonjourTXTFrom:withUUIDData:", v6, v7);

}

- (void)netServiceBrowser:(id)a3 didAddService:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "TXTRecord");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDKeyTransferAgentClient receivedBonjourTXTFrom:withUUIDData:](self, "receivedBonjourTXTFrom:withUUIDData:", v5, v6);

}

- (HMFNetServiceBrowser)serviceBrowser
{
  return self->_serviceBrowser;
}

- (void)setServiceBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_serviceBrowser, a3);
}

- (NSMutableDictionary)idsKeys
{
  return self->_idsKeys;
}

- (void)setIdsKeys:(id)a3
{
  objc_storeStrong((id *)&self->_idsKeys, a3);
}

- (NSMutableDictionary)bonjourKeys
{
  return self->_bonjourKeys;
}

- (void)setBonjourKeys:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourKeys, a3);
}

- (NSMutableSet)targetsToProcess
{
  return self->_targetsToProcess;
}

- (void)setTargetsToProcess:(id)a3
{
  objc_storeStrong((id *)&self->_targetsToProcess, a3);
}

- (BOOL)resolutionInProgress
{
  return self->_resolutionInProgress;
}

- (void)setResolutionInProgress:(BOOL)a3
{
  self->_resolutionInProgress = a3;
}

- (NSString)pairingWithUUID
{
  return self->_pairingWithUUID;
}

- (void)setPairingWithUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pairingWithUUID, a3);
}

- (HMFExponentialBackoffTimer)atHomeRetryTimer
{
  return self->_atHomeRetryTimer;
}

- (void)setAtHomeRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_atHomeRetryTimer, a3);
}

- (HMFNetMonitor)netMonitor
{
  return self->_netMonitor;
}

- (void)setNetMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_netMonitor, a3);
}

- (BOOL)haveCulledPlist
{
  return self->_haveCulledPlist;
}

- (void)setHaveCulledPlist:(BOOL)a3
{
  self->_haveCulledPlist = a3;
}

- (int64_t)tfaState
{
  return self->_tfaState;
}

- (void)setTfaState:(int64_t)a3
{
  self->_tfaState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netMonitor, 0);
  objc_storeStrong((id *)&self->_atHomeRetryTimer, 0);
  objc_storeStrong((id *)&self->_pairingWithUUID, 0);
  objc_storeStrong((id *)&self->_targetsToProcess, 0);
  objc_storeStrong((id *)&self->_bonjourKeys, 0);
  objc_storeStrong((id *)&self->_idsKeys, 0);
  objc_storeStrong((id *)&self->_serviceBrowser, 0);
}

uint64_t __72__HMDKeyTransferAgentClient_netServiceBrowser_didStopBrowsingWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginBonjourResolution:", 1);
}

void __65__HMDKeyTransferAgentClient_receivedBonjourTXTFrom_withUUIDData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40)
    && (v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", *(_QWORD *)(a1 + 40), 4)) != 0)
  {
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v8;
      v16 = 2112;
      v17 = v2;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@HMDHomeManager %@ advertised key transfer UUID %@ (Bonjour)", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 48), "bonjourKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v4, v2);

    objc_msgSend(*(id *)(a1 + 48), "_newDeviceSeen:", v2);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v2;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@HMDHomeManager %@ no longer advertising key transfer UUID (Bonjour)", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 48), "bonjourKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v2);
  }

}

uint64_t __60__HMDKeyTransferAgentClient__handleKeyTransferAgentMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startBrowser");
}

uint64_t __46__HMDKeyTransferAgentClient___accountChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Account status changed. Re-trying key transfer.: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setTfaState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "atHomeRetryTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reset");

  return objc_msgSend(*(id *)(a1 + 32), "_restartKeyTransfer:", 0);
}

void __52__HMDKeyTransferAgentClient___accessoryIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_restartKeyTransfer:", v4);

}

void __56__HMDKeyTransferAgentClient___deviceRemovedFromAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_device:removedFromAccount:", v5, v8);

}

void __45__HMDKeyTransferAgentClient___deviceUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_device:addedToAccount:", v4, v5);

}

void __52__HMDKeyTransferAgentClient___deviceAddedToAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_device:addedToAccount:", v5, v8);

}

void __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12[2];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke_2;
  v7[3] = &unk_1E89AD7D0;
  objc_copyWeak(v12, (id *)(a1 + 64));
  v5 = *(void **)(a1 + 72);
  v8 = v3;
  v12[1] = v5;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v4, v7);

  objc_destroyWeak(v12);
}

void __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = *(_QWORD *)(a1 + 72);
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      v6 = v3;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v4 < 4)
      {
        if (v8)
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          v29 = v16;
          v30 = 2112;
          v31 = v18;
          v32 = 2112;
          v33 = v19;
          v34 = 2048;
          v35 = 180;
          _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Send Private Key to %@ failed with error: %@ (retrying in %lu seconds)", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v5);
        v20 = dispatch_time(0, 180000000000);
        objc_msgSend(v6, "workQueue");
        v21 = objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke_60;
        v24[3] = &unk_1E89BE790;
        v24[4] = v6;
        v25 = *(id *)(a1 + 48);
        v22 = *(id *)(a1 + 40);
        v23 = *(_QWORD *)(a1 + 72);
        v26 = v22;
        v27 = v23;
        dispatch_after(v20, v21, v24);

      }
      else
      {
        if (v8)
        {
          HMFGetLogIdentifier();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(a1 + 32);
          v13 = *(_QWORD *)(a1 + 72);
          *(_DWORD *)buf = 138544130;
          v29 = v9;
          v30 = 2112;
          v31 = v11;
          v32 = 2112;
          v33 = v12;
          v34 = 2048;
          v35 = v13;
          _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Send Private Key to %@ failed with error: %@ (timed out after %lu retries)", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v5);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 10, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_endPairingWithError:suspendingTimer:", v14, 1);

      }
    }
    else
    {
      objc_msgSend(WeakRetained, "_endPairingWithError:suspendingTimer:", 0, 1);
      if (*(_QWORD *)(a1 + 56))
      {
        +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deregisterIdentity:object:", *(_QWORD *)(a1 + 56), v3);

      }
    }
  }

}

uint64_t __65__HMDKeyTransferAgentClient__sendATVPrivateKey_withDevice_retry___block_invoke_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendATVPrivateKey:withDevice:retry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56) + 1);
}

void __58__HMDKeyTransferAgentClient__sendIOSPublicKey_withDevice___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HMDKeyTransferAgentClient__sendIOSPublicKey_withDevice___block_invoke_2;
  v10[3] = &unk_1E89BF278;
  objc_copyWeak(&v14, a1 + 6);
  v11 = v5;
  v12 = a1[5];
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __58__HMDKeyTransferAgentClient__sendIOSPublicKey_withDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = v3;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 32);
        v12 = 138543874;
        v13 = v7;
        v14 = 2112;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Send public key to %@ failed with error: %@", (uint8_t *)&v12, 0x20u);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_endPairingWithError:suspendingTimer:", v11, 1);

    }
    else
    {
      objc_msgSend(WeakRetained, "_sendATVPrivateKey:withDevice:retry:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1);
    }
  }

}

void __77__HMDKeyTransferAgentClient__havePairVerifiedAccessoryWithKeyUUID_forDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__HMDKeyTransferAgentClient__havePairVerifiedAccessoryWithKeyUUID_forDevice___block_invoke_2;
    v10[3] = &unk_1E89C07B8;
    v11 = v5;
    v12 = v8;
    v13 = *(id *)(a1 + 32);
    v14 = v6;
    dispatch_async(v9, v10);

  }
}

void __77__HMDKeyTransferAgentClient__havePairVerifiedAccessoryWithKeyUUID_forDevice___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "remoteDestinationString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138543874;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_ERROR, "%{public}@Ping to %@ failed with error: %@", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 10, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_endPairingWithError:suspendingTimer:", v9, 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_sendIOSPublicKey:withDevice:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
}

void __87__HMDKeyTransferAgentClient__haveVerifiedTwoFactorAuthenticationWithKeyUUID_forTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__HMDKeyTransferAgentClient__haveVerifiedTwoFactorAuthenticationWithKeyUUID_forTarget___block_invoke_2;
  v8[3] = &unk_1E89C07B8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v4, v8);

}

void __87__HMDKeyTransferAgentClient__haveVerifiedTwoFactorAuthenticationWithKeyUUID_forTarget___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_ERROR, "%{public}@No currently paired devices.", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 40), "setResidentProvisioningStatus:", 2);
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 10, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_endPairingWithError:suspendingTimer:", v7, 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_havePairVerifiedAccessoryWithKeyUUID:forDevice:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

void __74__HMDKeyTransferAgentClient__tryPairingWithAccessories_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
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
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v11;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to pair verify with accessory %@ (%@)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[4], "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__HMDKeyTransferAgentClient__tryPairingWithAccessories_completionHandler___block_invoke_52;
    block[3] = &unk_1E89C1B48;
    block[4] = a1[4];
    v19 = a1[6];
    v20 = a1[7];
    dispatch_sync(v14, block);

  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v15;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Successful pair verify with accessory %@ (%@)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(void))a1[7] + 2))();
  }

}

uint64_t __74__HMDKeyTransferAgentClient__tryPairingWithAccessories_completionHandler___block_invoke_52(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tryPairingWithAccessories:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __74__HMDKeyTransferAgentClient__tfaVerificationCompleteForKeyUUID_forTarget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_haveVerifiedTwoFactorAuthenticationWithKeyUUID:forTarget:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __64__HMDKeyTransferAgentClient__startPairingWithKeyUUID_forTarget___block_invoke(id *a1, char a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__HMDKeyTransferAgentClient__startPairingWithKeyUUID_forTarget___block_invoke_2;
    v7[3] = &unk_1E89BCF10;
    v10 = a2;
    v7[4] = v5;
    v8 = a1[4];
    v9 = a1[5];
    dispatch_async(v6, v7);

  }
}

uint64_t __64__HMDKeyTransferAgentClient__startPairingWithKeyUUID_forTarget___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
    v4 = 1;
  else
    v4 = 2;
  objc_msgSend(v3, "setTfaState:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "_tfaVerificationCompleteForKeyUUID:forTarget:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __53__HMDKeyTransferAgentClient__beginBonjourResolution___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyBeginBonjourResolution");
}

void __58__HMDKeyTransferAgentClient__reallyBeginBonjourResolution__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HMDKeyTransferAgentClient__reallyBeginBonjourResolution__block_invoke_2;
  v6[3] = &unk_1E89BE218;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __58__HMDKeyTransferAgentClient__reallyBeginBonjourResolution__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "setResolutionInProgress:", 0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x1D17BA0A0](v4);
    v7 = v3;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 32);
        v13 = 138543618;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Bonjour search failed to start with error: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(v7, "_beginBonjourResolution:", 1);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Bonjour search started.", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }
  }

}

void __40__HMDKeyTransferAgentClient_resetConfig__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setPairingWithUUID:", 0);
  objc_msgSend(*(id *)(a1 + 32), "idsKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "_saveKeyPlist");
  objc_msgSend(*(id *)(a1 + 32), "atHomeRetryTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  objc_msgSend(*(id *)(a1 + 32), "atHomeRetryTimer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

}

void __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDRemoteDeviceMessageDestination *v14;
  void *v15;
  HMDRemoteDeviceMessageDestination *v16;
  HMDRemoteMessage *v17;
  void *v18;
  HMDRemoteMessage *v19;
  HMDRemoteDeviceMessageDestination *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  char v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  HMDRemoteDeviceMessageDestination *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Looking for stale items in the IDS Plist", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "idsKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v31)
  {
    v28 = 0;
    v30 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_deviceWithUUID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)MEMORY[0x1D17BA0A0]();
          v11 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v13;
            v44 = 2112;
            v45 = v9;
            _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Querying device %@ for UUID.", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          v14 = [HMDRemoteDeviceMessageDestination alloc];
          objc_msgSend(*(id *)(a1 + 32), "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v14, "initWithTarget:device:", v15, v9);

          v17 = [HMDRemoteMessage alloc];
          v40[0] = CFSTR("phase");
          v40[1] = CFSTR("uuid");
          v41[0] = CFSTR("request_uuid");
          v41[1] = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:](v17, "initWithName:destination:payload:type:timeout:secure:restriction:", CFSTR("kKeyTransferAgentKey"), v16, v18, 0, 0, 1, 0.0);

          objc_initWeak((id *)buf, *(id *)(a1 + 32));
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke_41;
          v32[3] = &unk_1E89C1698;
          objc_copyWeak(&v35, (id *)buf);
          v20 = v16;
          v33 = v20;
          v34 = v8;
          -[HMDRemoteMessage setResponseHandler:](v19, "setResponseHandler:", v32);
          objc_msgSend(*(id *)(a1 + 32), "homeManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "messageDispatcher");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "sendMessage:completionHandler:", v19, 0);

          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "idsKeys");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObjectForKey:", v8);

          v24 = (void *)MEMORY[0x1D17BA0A0]();
          v25 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v27;
            v44 = 2112;
            v45 = v8;
            _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Probably never should have gotten a broadcast from UUID %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v24);
          v28 = 1;
        }

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v31);

    if ((v28 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_saveKeyPlist");
  }
  else
  {

  }
}

void __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke_2;
    block[3] = &unk_1E89C1710;
    v13 = v5;
    v14 = v8;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v15 = v10;
    v16 = v11;
    v17 = v6;
    dispatch_async(v9, block);

  }
}

void __46__HMDKeyTransferAgentClient_queryPlistDevices__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 48);
      v7 = *(void **)(a1 + 32);
      v24 = 138543874;
      v25 = v5;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to send UUID request message to %@ (%@)", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "idsKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "hmf_stringForKey:", CFSTR("uuid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_msgSend(v9, "isEqual:", v10);
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if ((v11 & 1) != 0)
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543362;
          v25 = v16;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Remote host still waiting for key transfer.", (uint8_t *)&v24, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
      }
      else
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543874;
          v25 = v22;
          v26 = 2112;
          v27 = v9;
          v28 = 2112;
          v29 = v10;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Transfer key changed from %@ to %@ (using new key).", (uint8_t *)&v24, 0x20u);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(*(id *)(a1 + 40), "idsKeys");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setValue:forKey:", v10, *(_QWORD *)(a1 + 56));

        objc_msgSend(*(id *)(a1 + 40), "_saveKeyPlist");
      }
      objc_msgSend(*(id *)(a1 + 40), "_startBrowser");
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v20;
        v26 = 2112;
        v27 = v9;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Remote %@ has already transferred key.", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(*(id *)(a1 + 40), "idsKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:", *(_QWORD *)(a1 + 56));

      objc_msgSend(*(id *)(a1 + 40), "_saveKeyPlist");
    }

  }
}

uint64_t __55__HMDKeyTransferAgentClient_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "haveCulledPlist");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHaveCulledPlist:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "queryPlistDevices");
  }
  return result;
}

void __42__HMDKeyTransferAgentClient_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pairingWithUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Got request to retry key transfer, but we are in the middle of one.", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Got request to retry key transfer.", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_restartKeyTransfer:", 0);
  }
}

uint64_t __49__HMDKeyTransferAgentClient_initWithHomeManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startBrowser");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t83 != -1)
    dispatch_once(&logCategory__hmf_once_t83, &__block_literal_global_63814);
  return (id)logCategory__hmf_once_v84;
}

void __40__HMDKeyTransferAgentClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v84;
  logCategory__hmf_once_v84 = v0;

}

@end
