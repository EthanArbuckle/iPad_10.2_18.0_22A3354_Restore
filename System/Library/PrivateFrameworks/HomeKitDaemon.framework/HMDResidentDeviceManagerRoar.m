@implementation HMDResidentDeviceManagerRoar

- (HMDResidentDeviceManagerRoar)init
{
  HMDDefaultResidentDeviceManagerRoarDataSource *v3;
  HMDResidentDeviceManagerRoar *v4;

  v3 = objc_alloc_init(HMDDefaultResidentDeviceManagerRoarDataSource);
  v4 = -[HMDResidentDeviceManagerRoar initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (HMDResidentDeviceManagerRoar)initWithDataSource:(id)a3
{
  id v5;
  HMDResidentDeviceManagerRoar *v6;
  uint64_t v7;
  OS_os_log *logger;
  uint64_t v9;
  OS_dispatch_queue *queue;
  NSString *logIdentifier;
  NSUUID *messageTargetUUID;
  uint64_t v13;
  NSMutableSet *residentDevices;
  uint64_t v15;
  NSNotificationCenter *notificationCenter;
  uint64_t v17;
  HMDAppleAccountManager *appleAccountManager;
  uint64_t v19;
  HMDPrimaryResidentDiscoveryManager *primaryDiscoveryManager;
  uint64_t v21;
  NSHashTable *primaryDiscoveryRequesters;
  uint64_t v23;
  HMFFuture *firstPrimaryResidentDiscoveryAttemptCompletionFuture;
  uint64_t v25;
  HMDFeaturesDataSource *featuresDataSource;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HMDResidentDeviceManagerRoar;
  v6 = -[HMDResidentDeviceManagerRoar init](&v28, sel_init);
  if (v6)
  {
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    logger = v6->_logger;
    v6->_logger = (OS_os_log *)v7;

    objc_msgSend(v5, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_dataSource, a3);
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)CFSTR("<unconfigured>");

    messageTargetUUID = v6->_messageTargetUUID;
    v6->_messageTargetUUID = 0;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    residentDevices = v6->_residentDevices;
    v6->_residentDevices = (NSMutableSet *)v13;

    objc_msgSend(v5, "notificationCenter");
    v15 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v6->_notificationCenter;
    v6->_notificationCenter = (NSNotificationCenter *)v15;

    objc_msgSend(v5, "appleAccountManager");
    v17 = objc_claimAutoreleasedReturnValue();
    appleAccountManager = v6->_appleAccountManager;
    v6->_appleAccountManager = (HMDAppleAccountManager *)v17;

    objc_msgSend(v5, "createPrimaryResidentDiscoveryManagerWithQueue:", v6->_queue);
    v19 = objc_claimAutoreleasedReturnValue();
    primaryDiscoveryManager = v6->_primaryDiscoveryManager;
    v6->_primaryDiscoveryManager = (HMDPrimaryResidentDiscoveryManager *)v19;

    -[HMDPrimaryResidentDiscoveryManager setDelegate:](v6->_primaryDiscoveryManager, "setDelegate:", v6);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    primaryDiscoveryRequesters = v6->_primaryDiscoveryRequesters;
    v6->_primaryDiscoveryRequesters = (NSHashTable *)v21;

    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v6->_firstPrimaryResidentDiscoveryAttemptCompletionPromise);
    v23 = objc_claimAutoreleasedReturnValue();
    firstPrimaryResidentDiscoveryAttemptCompletionFuture = v6->_firstPrimaryResidentDiscoveryAttemptCompletionFuture;
    v6->_firstPrimaryResidentDiscoveryAttemptCompletionFuture = (HMFFuture *)v23;

    objc_msgSend(v5, "featuresDataSource");
    v25 = objc_claimAutoreleasedReturnValue();
    featuresDataSource = v6->_featuresDataSource;
    v6->_featuresDataSource = (HMDFeaturesDataSource *)v25;

  }
  return v6;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDResidentDeviceManagerRoar_configureWithHome_messageDispatcher___block_invoke;
  block[3] = &unk_24E79BBD0;
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
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoar home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar messageDispatcher](self, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("kResidentDeviceUpdateEnabledRequestKey"), self, v8, sel__handleResidentDeviceUpdateEnabled_);

  +[HMDRemoteMessagePolicy defaultPolicy](HMDRemoteMessagePolicy, "defaultPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (isInternalBuild())
  {
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("hm.prdisco"), self, v12, sel__handlePrimaryResidentDiscoveryXPCRequest_);

  }
  -[HMDResidentDeviceManagerRoar dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isResidentCapable");

  if (v14)
  {
    v16[0] = v9;
    v16[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("primaryResidentDiscovery"), self, v15, sel__handlePrimaryResidentDiscoveryRequest_);

  }
}

- (void)_registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDResidentDeviceManagerRoar notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar backingStore](self, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudChangeUpdateNotificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleCloudResidentChange_, v5, 0);

  -[HMDResidentDeviceManagerRoar notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleRemoteDeviceIsReachable_, CFSTR("HMDRemoteDeviceIsReachableNotification"), 0);

  -[HMDResidentDeviceManagerRoar notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleRemoteDeviceIsNotReachable_, CFSTR("HMDRemoteDeviceIsNotReachableNotification"), 0);

  -[HMDResidentDeviceManagerRoar notificationCenter](self, "notificationCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__handleResidentSelectionVersionDidChange_, CFSTR("HMDHomeResidentSelectionVersionDidChangeNotification"), v8);

}

- (void)_startLocalNetworkElection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDResidentDeviceManagerRoar dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createElectionAddOnWithContext:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar setLocalNetworkElection:](self, "setLocalNetworkElection:", v4);

  -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessages");

  -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");

}

- (void)_stopLocalNetworkElection
{
  void *v3;

  -[HMDResidentDeviceManagerRoar setActingAsResident:](self, "setActingAsResident:", 0);
  -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[HMDResidentDeviceManagerRoar setLocalNetworkElection:](self, "setLocalNetworkElection:", 0);
}

- (void)_configureResidentSupported
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDResidentDeviceManagerRoar *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  HMDResidentDeviceManagerRoar *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentDeviceManagerRoar appleAccountManager](self, "appleAccountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!-[HMDResidentDeviceManagerRoar isResidentSupported](self, "isResidentSupported"))
    {
      v20 = 0;
      -[HMDResidentDeviceManagerRoar backingStore](self, "backingStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "findResidents:outHasResidents:", v4, &v20);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __59__HMDResidentDeviceManagerRoar__configureResidentSupported__block_invoke;
      v19[3] = &unk_24E795268;
      v19[4] = self;
      v7 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19));
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentDeviceManagerRoar residentDevices](v8, "residentDevices");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v10;
        v23 = 2114;
        v24 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Initial resident devices: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDResidentDeviceManagerRoar residentDevices](v8, "residentDevices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
        v13 = 1;
      else
        v13 = v20 == 0;
      v14 = !v13;

      if ((_DWORD)v14 == 1)
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = v8;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v18;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@No HMDResidentDevice but has MKFResident models, force update", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
      }
      -[HMDResidentDeviceManagerRoar setResidentSupported:](v8, "setResidentSupported:", 1);
      -[HMDResidentDeviceManagerRoar _updateResidentAvailability:](v8, "_updateResidentAvailability:", v14);

    }
  }
  else
  {
    -[HMDResidentDeviceManagerRoar setResidentSupported:](self, "setResidentSupported:", 0);
  }

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HMDResidentDeviceManagerRoar_invalidate__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_joinLocalMesh
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];

  v39[3] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentDeviceManagerRoar home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "currentAccessorySetupMetricDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE3F168]);
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithQueue:", v6);

  -[HMDResidentDeviceManagerRoar appleAccountManager](self, "appleAccountManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idsDevicesUpdated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke;
  v37[3] = &unk_24E797BE8;
  v37[4] = self;
  v11 = v4;
  v38 = v11;
  v36[0] = v10;
  v36[1] = 3221225472;
  v36[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_131;
  v36[3] = &unk_24E797A18;
  v36[4] = self;
  v12 = (id)objc_msgSend(v9, "inContext:then:orRecover:", v7, v37, v36);
  -[HMDResidentDeviceManagerRoar dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstCloudKitImportFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = v10;
  v34[1] = 3221225472;
  v34[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_133;
  v34[3] = &unk_24E797BE8;
  v34[4] = self;
  v15 = v11;
  v35 = v15;
  v16 = (id)objc_msgSend(v14, "inContext:then:", v7, v34);
  -[HMDResidentDeviceManagerRoar messageDispatcher](self, "messageDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "secureRemoteTransport");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v10;
  v32[1] = 3221225472;
  v32[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_134;
  v32[3] = &unk_24E797BE8;
  v32[4] = self;
  v20 = v15;
  v33 = v20;
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_135;
  v31[3] = &unk_24E797A18;
  v31[4] = self;
  v21 = (id)objc_msgSend(v19, "inContext:then:orRecover:", v7, v32, v31);
  v22 = (void *)MEMORY[0x24BE3F180];
  v39[0] = v19;
  v39[1] = v14;
  v39[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allSettled:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v28[4] = self;
  v29[0] = v10;
  v29[1] = 3221225472;
  v29[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_136;
  v29[3] = &unk_24E797BE8;
  v29[4] = self;
  v30 = v20;
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_137;
  v28[3] = &unk_24E797A18;
  v25 = v20;
  v26 = (id)objc_msgSend(v24, "inContext:then:orRecover:", v7, v29, v28);

}

- (HMDResidentSelectionInfo)residentSelectionInfo
{
  return 0;
}

- (HMDPreferredResidentsList)electorsPreferredResidentsList
{
  return 0;
}

- (HMDResidentSelectionStatusKit)presentResidentsStatuses
{
  return 0;
}

- (id)localPreferredResidentList
{
  return 0;
}

- (id)residentDeviceWithIDSIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_residentDevices;
  v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "device", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "idsIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)residentDevicesWithIDSIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentDeviceManagerRoar availableResidentDevices](self, "availableResidentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v17[0] = v11;
        v17[1] = 3221225472;
        v17[2] = __66__HMDResidentDeviceManagerRoar_residentDevicesWithIDSIdentifiers___block_invoke;
        v17[3] = &unk_24E7953A8;
        v17[4] = v13;
        objc_msgSend(v5, "na_firstObjectPassingTest:", v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v6, "addObject:", v14);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

- (void)_handleCloudResidentChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *queue;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  -[HMDResidentDeviceManagerRoar appleAccountManager](self, "appleAccountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentDeviceManagerRoar backingStore](self, "backingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar residentDevicesSet](self, "residentDevicesSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleCloudResidentChange:currentResidents:isCurrentDevicePrimaryResident:currentDevice:", v4, v8, -[HMDResidentDeviceManagerRoar isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addedResidentDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "deletedResidentDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
    {
      objc_msgSend(v9, "reachabilityUpdates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (!v14)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke;
  v15[3] = &unk_24E79C268;
  v15[4] = self;
  v16 = v9;
  dispatch_async(queue, v15);

LABEL_6:
}

- (BOOL)isResidentElectionV2Enabled
{
  return 1;
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

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("6.1"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDResidentDeviceManagerRoar residentDevices](self, "residentDevices", 0);
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
  void (**v5)(id, _QWORD);
  void *v6;
  HMDResidentDeviceManagerRoar *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v5)
    v5[2](v5, 0);

}

- (void)confirmAsResident
{
  void *v4;
  HMDResidentDeviceManagerRoar *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)confirmOnAvailability
{
  void *v4;
  HMDResidentDeviceManagerRoar *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)atHomeLevelChanged:(int64_t)a3
{
  void *v5;
  HMDResidentDeviceManagerRoar *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2, a3);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
}

- (void)run
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDResidentDeviceManagerRoar_run__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_run
{
  void *v3;
  HMDResidentDeviceManagerRoar *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDResidentDeviceManagerRoar *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Starting", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentDeviceManagerRoar home](v4, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar primaryResidentDevice](v4, "primaryResidentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && -[HMDResidentDeviceManagerRoar isResidentSupported](v4, "isResidentSupported"))
  {
    objc_msgSend(v7, "subscribeForNotificationsFromRemoteGateway");
  }
  else
  {
    -[HMDResidentDeviceManagerRoar messageDispatcher](v4, "messageDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteAccessDeviceForHome:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "capabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isResidentCapable");

    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v4;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v16;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Tearing down remote access to device: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDResidentDeviceManagerRoar _teardownSessionWithPrimaryResidentDevice](v14, "_teardownSessionWithPrimaryResidentDevice");
    }

  }
}

- (void)_setupSessionWithPrimaryResidentDevice
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDResidentDeviceManagerRoar primaryResidentDevice](self, "primaryResidentDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDResidentDeviceManagerRoar messageDispatcher](self, "messageDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRemoteAccessDevice:forHome:", v4, v5);

  }
}

- (void)_teardownSessionWithPrimaryResidentDevice
{
  void *v3;
  id v4;

  -[HMDResidentDeviceManagerRoar messageDispatcher](self, "messageDispatcher");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteAccessDevice:forHome:", 0, v3);

}

- (void)addDataSource:(id)a3
{
  id v5;
  void *v6;
  HMDResidentDeviceManagerRoar *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

}

- (HMDResidentDevice)primaryResidentDevice
{
  void *v3;
  void *v4;
  id v5;
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

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoar residentDevicesSet](self, "residentDevicesSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar primaryResidentUUID](self, "primaryResidentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
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
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqual:", v10);

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

  return (HMDResidentDevice *)v6;
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

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDResidentDeviceManagerRoar residentDevices](self, "residentDevices", 0);
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

  -[HMDResidentDeviceManagerRoar residentDevices](self, "residentDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_objectPassingTest:", &__block_literal_global_159290);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

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

- (id)residentDevicesSet
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableSet copy](self->_residentDevices, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isCurrentDeviceAvailableResident
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerRoar ourSelf](self, "ourSelf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerRoar primaryResidentDevice](self, "primaryResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevice");

  return v3;
}

- (HMDDevice)confirmedPrimaryResidentDevice
{
  void *v2;
  void *v3;

  -[HMDResidentDeviceManagerRoar primaryResidentDevice](self, "primaryResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDDevice *)v3;
}

- (HMFFuture)cloudReady
{
  return (HMFFuture *)objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
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

  v19 = *MEMORY[0x24BDAC8D0];
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

- (void)_addResidentDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDResidentDeviceManagerRoar *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDResidentDeviceManagerRoar *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  HMDResidentDeviceManagerRoar *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  -[NSMutableSet member:](self->_residentDevices, "member:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_31;
  }
  -[NSMutableSet addObject:](self->_residentDevices, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v10;
    v43 = 2112;
    v44 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Added resident device %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDResidentDeviceManagerRoar home](v8, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureWithHome:", v11);
  -[HMDResidentDeviceManagerRoar primaryResidentUUID](v8, "primaryResidentUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13)
    objc_msgSend(v4, "setReachable:", 0);
  if (-[HMDResidentDeviceManagerRoar isCurrentDeviceConfirmedPrimaryResident](v8, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    if ((objc_msgSend(v4, "isReachable") & 1) == 0)
    {
      -[HMDResidentDeviceManagerRoar localNetworkElection](v8, "localNetworkElection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "residentIsPartOfTheCurrentMesh:", v4);

      if (v15)
      {
        -[HMDResidentDeviceManagerRoar _updateReachability:forResidentDevice:](v8, "_updateReachability:forResidentDevice:", 1, v4);
        -[HMDResidentDeviceManagerRoar backingStore](v8, "backingStore");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateReachabilityForResidents:", v17);

      }
    }
  }
  -[HMDResidentDeviceManagerRoar _updateResidentAvailability:](v8, "_updateResidentAvailability:", 0);
  -[HMDResidentDeviceManagerRoar delegate](v8, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "residentDeviceManagerDidUpdateResidents:", v8);

  -[HMDResidentDeviceManagerRoar _sendResidentDeviceNotificationWithName:forResidentDevice:](v8, "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerAddResidentNotification"), v4);
  objc_msgSend(v11, "reEvaluateHomeHubState");
  objc_msgSend(v11, "evaluateBulletinNotificationsSupported");
  -[HMDResidentDeviceManagerRoar primaryResidentUUID](v8, "primaryResidentUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqual:", v20))
  {

  }
  else
  {
    -[HMDResidentDeviceManagerRoar primaryResidentDevice](v8, "primaryResidentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "isCurrentDevice"))
    {

      goto LABEL_18;
    }
    v23 = objc_msgSend(v4, "isEnabled");

    if (!v23)
      goto LABEL_19;
  }
  objc_msgSend(v4, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enableNotificationsForDevices:", v20);
LABEL_18:

LABEL_19:
  objc_msgSend(v4, "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isCurrentDevice"))
  {
    objc_msgSend(v11, "homeManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentAccessorySetupMetricDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x227676638](objc_msgSend(v26, "markSetupBeginStage:error:", 14, 0));
    v28 = v8;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "residentSelectionVersion");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v30;
      v43 = 2114;
      v44 = v31;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Current device added as resident to home with resident selection version %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(v11, "residentSelectionVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "integerValue") > 2;

    v34 = (void *)MEMORY[0x227676638]();
    v35 = v28;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
    if (v33)
    {
      if (v37)
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v38;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Backing off from joining mesh since home's resident selection version is higher", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
    }
    else
    {
      if (v37)
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v39;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Will attempt to join mesh.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      -[HMDResidentDeviceManagerRoar _joinLocalMesh](v35, "_joinLocalMesh");
    }

  }
LABEL_31:

}

- (void)_removeResidentDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    -[HMDResidentDeviceManagerRoar primaryResidentDevice](self, "primaryResidentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_residentDevices, "containsObject:", v4))
    {
      -[NSMutableSet removeObject:](self->_residentDevices, "removeObject:", v4);
      os_unfair_lock_unlock(&self->_lock);
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__HMDResidentDeviceManagerRoar__removeResidentDevice___block_invoke;
      block[3] = &unk_24E79BBD0;
      block[4] = self;
      v8 = v4;
      v9 = v5;
      dispatch_async(queue, block);

    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }

  }
}

- (void)_checkPrimaryResidentDeviceRemoved:(id)a3 currentPrimary:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  HMDResidentDeviceManagerRoar *v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[NSMutableSet count](self->_residentDevices, "count");
  v9 = objc_msgSend(v7, "isEqual:", v6);
  -[HMDResidentDeviceManagerRoar primaryResidentDevice](self, "primaryResidentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2048;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Removed residentDevice is current device. There are %lu residents remaining.", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
    v15 = 0;
  else
    v15 = v9;
  if (v15 == 1)
    -[HMDResidentDeviceManagerRoar _handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:](v12, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", 0, v7, 0, 0);

}

- (void)removeResidentDevice:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HMDResidentDeviceManagerRoar_removeResidentDevice___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)updateResidentAvailability
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HMDResidentDeviceManagerRoar_updateResidentAvailability__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateResidentAvailability:(BOOL)a3
{
  uint64_t v3;
  void *v5;

  LODWORD(v3) = a3;
  -[HMDResidentDeviceManagerRoar availableResidentDevices](self, "availableResidentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v3 = 1;
  else
    v3 = v3;

  -[HMDResidentDeviceManagerRoar setResidentAvailable:](self, "setResidentAvailable:", v3);
}

- (BOOL)isResidentAvailable
{
  HMDResidentDeviceManagerRoar *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_residentAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)hasAnyResident
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[HMDResidentDeviceManagerRoar residentDevicesSet](self, "residentDevicesSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEmpty");

  if (!v4)
    return 1;
  -[HMDResidentDeviceManagerRoar backingStore](self, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAnyResident");

  return v6;
}

- (void)setResidentAvailable:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentDeviceManagerRoar *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDResidentDeviceManagerRoar *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  if (self->_residentSupported)
  {
    if (self->_residentAvailable == v3)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      self->_residentAvailable = v3;
      os_unfair_lock_unlock(&self->_lock);
      if (v3)
      {
        -[HMDResidentDeviceManagerRoar primaryResidentUUID](self, "primaryResidentUUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          -[HMDResidentDeviceManagerRoar primaryResidentUUID](self, "primaryResidentUUID");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDResidentDeviceManagerRoar residentWithUUID:](self, "residentWithUUID:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            -[HMDResidentDeviceManagerRoar notifyUpdatedPrimaryResident:previousPrimaryResident:](self, "notifyUpdatedPrimaryResident:previousPrimaryResident:", v8, 0);
          }
          else
          {
            v14 = (void *)MEMORY[0x227676638]();
            v15 = self;
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDResidentDeviceManagerRoar primaryResidentUUID](v15, "primaryResidentUUID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = 138543618;
              v20 = v17;
              v21 = 2114;
              v22 = v18;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Primary resident UUID is set to %{public}@, but cannot find the primary resident device", (uint8_t *)&v19, 0x16u);

            }
            objc_autoreleasePoolPop(v14);
          }

        }
        else
        {
          v10 = (void *)MEMORY[0x227676638]();
          v11 = self;
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138543362;
            v20 = v13;
            _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident UUID is not set, cannot find the primary resident device (yet)", (uint8_t *)&v19, 0xCu);

          }
          objc_autoreleasePoolPop(v10);
        }
        -[HMDResidentDeviceManagerRoar _discoverPrimaryResidentForRequester:](self, "_discoverPrimaryResidentForRequester:", 0);
      }
      else
      {
        -[HMDResidentDeviceManagerRoar primaryDiscoveryManager](self, "primaryDiscoveryManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancel");

      }
    }
    -[HMDResidentDeviceManagerRoar notifyResidentAvailable:](self, "notifyResidentAvailable:", v3);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (NSUUID)primaryResidentGenerationID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_primaryResidentGenerationID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)_updatePrimaryResidentGenerationID:(id)a3
{
  id v5;
  NSUUID *v6;
  char v7;
  void *v8;
  HMDResidentDeviceManagerRoar *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock_with_options();
  v6 = self->_primaryResidentGenerationID;
  v7 = HMFEqualObjects();
  if ((v7 & 1) != 0)
  {

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_primaryResidentGenerationID, a3);

    os_unfair_lock_unlock(&self->_lock);
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating primaryResidentGenerationID = %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDResidentDeviceManagerRoar primaryResidentDevice](v9, "primaryResidentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar _notifyUpdatedGenerationIDWithPrimaryResident:](v9, "_notifyUpdatedGenerationIDWithPrimaryResident:", v12);

  }
  return v7 ^ 1;
}

- (BOOL)isResidentSupported
{
  HMDResidentDeviceManagerRoar *v2;
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
  _BOOL4 v3;
  void *v5;
  HMDResidentDeviceManagerRoar *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@ResidentSupported = %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  v6->_residentSupported = v3;
  os_unfair_lock_unlock(&v6->_lock);
  -[HMDResidentDeviceManagerRoar notificationCenter](v6, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar appleAccountManager](v6, "appleAccountManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v10, "removeObserver:name:object:", v6, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v11);
  }
  else
  {
    objc_msgSend(v10, "removeObserver:name:object:", v6, CFSTR("HMDAppleAccountManagerResolved"), v11);

    -[HMDResidentDeviceManagerRoar notificationCenter](v6, "notificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar appleAccountManager](v6, "appleAccountManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", v6, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v13);

    -[HMDResidentDeviceManagerRoar notificationCenter](v6, "notificationCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar appleAccountManager](v6, "appleAccountManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel_accountOrDeviceDidUpdate_, CFSTR("HMDAppleAccountManagerResolved"), v15);

    -[HMDResidentDeviceManagerRoar notificationCenter](v6, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar appleAccountManager](v6, "appleAccountManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel_accountOrDeviceDidUpdate_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v11);
  }

}

- (void)accountOrDeviceDidUpdate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDResidentDeviceManagerRoar_accountOrDeviceDidUpdate___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)notifyResidentAvailable:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__HMDResidentDeviceManagerRoar_notifyResidentAvailable___block_invoke;
  v4[3] = &unk_24E7968C8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)notifyClientsOfUpdatedResidentDevice:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *queue;
  void *v8;
  HMDResidentDeviceManagerRoar *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentDeviceManagerRoar residentDevices](self, "residentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__HMDResidentDeviceManagerRoar_notifyClientsOfUpdatedResidentDevice___block_invoke;
    v12[3] = &unk_24E79C268;
    v12[4] = self;
    v13 = v4;
    dispatch_async(queue, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not notifying clients of updated resident %@ since it is not in the resident devices list", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)notifyUpdatedPrimaryResident:(id)a3 previousPrimaryResident:(id)a4
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__HMDResidentDeviceManagerRoar_notifyUpdatedPrimaryResident_previousPrimaryResident___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_notifyUpdatedGenerationIDWithPrimaryResident:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[HMDResidentDeviceManagerRoar _sendResidentDeviceNotificationWithName:forResidentDevice:](self, "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentGenerationIDNotification"), v5);

}

- (void)_sendResidentDeviceNotificationWithName:(id)a3 forResidentDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDResidentDeviceManagerRoar *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  -[HMDResidentDeviceManagerRoar home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("HMDResidentDeviceManagerHomeUUIDNotificationKey"));

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying %{public}@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDResidentDeviceManagerRoar notificationCenter](v12, "notificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:userInfo:", v6, v12, v8);

}

- (void)_handlePrimaryResident:(id)a3 isReachable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  HMDResidentDeviceManagerRoar *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Primary resident: %@ became reachable. Updating the reachability of all residents from the working store", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDResidentDeviceManagerRoar _updateReachability:forResidentDevice:](v9, "_updateReachability:forResidentDevice:", 1, v6);
    -[HMDResidentDeviceManagerRoar _updateReachabilityFromWorkingStoreExceptResident:](v9, "_updateReachabilityFromWorkingStoreExceptResident:", v6);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Primary resident: %@ became unreachable. Marking all residents as unreachable", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDResidentDeviceManagerRoar residentDevices](v9, "residentDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar _updateReachability:forResidentDevices:](v9, "_updateReachability:forResidentDevices:", 0, v14);

    -[HMDResidentDeviceManagerRoar _discoverPrimaryResidentForRequester:](v9, "_discoverPrimaryResidentForRequester:", 0);
  }

}

- (void)discoverPrimaryResidentForRequester:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HMDResidentDeviceManagerRoar_discoverPrimaryResidentForRequester___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_discoverPrimaryResidentForRequester:(id)a3
{
  id v4;
  void *v5;
  HMDResidentDeviceManagerRoar *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDResidentDeviceManagerRoar *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Running primary resident discovery", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDResidentDeviceManagerRoar queue](v6, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (!-[HMDResidentDeviceManagerRoar isResidentSupported](v6, "isResidentSupported"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    v12 = v6;
    v13 = 0;
    v14 = v10;
    goto LABEL_7;
  }
  -[HMDResidentDeviceManagerRoar primaryResidentDevice](v6, "primaryResidentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isCurrentDevice"))
  {
    v11 = v4;
    v12 = v6;
    v13 = v10;
    v14 = 0;
LABEL_7:
    objc_msgSend(v11, "residentDeviceManager:didCompleteDiscoveryWithPrimaryResidentDevice:error:", v12, v13, v14);
    goto LABEL_11;
  }
  if (v4)
  {
    -[HMDResidentDeviceManagerRoar primaryDiscoveryRequesters](v6, "primaryDiscoveryRequesters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v4);

  }
  -[HMDResidentDeviceManagerRoar primaryDiscoveryManager](v6, "primaryDiscoveryManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "discoverPrimaryResident");

LABEL_11:
}

- (void)handlePrimaryResidentDiscovered:(id)a3 primaryResidentGenerationID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  HMDResidentDeviceManagerRoar *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMDResidentDeviceManagerRoar residentDevices](self, "residentDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __92__HMDResidentDeviceManagerRoar_handlePrimaryResidentDiscovered_primaryResidentGenerationID___block_invoke;
    v16[3] = &unk_24E7953A8;
    v9 = v6;
    v17 = v9;
    v10 = objc_msgSend(v8, "na_any:", v16);

    if ((v10 & 1) == 0)
      -[HMDResidentDeviceManagerRoar _addResidentDevice:](self, "_addResidentDevice:", v9);

    -[HMDResidentDeviceManagerRoar primaryResidentDevice](self, "primaryResidentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar _handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:](self, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", v9, v11, v7, 4);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Primary resident discovered is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)_handlePrimaryResidentDiscoveryXPCRequest:(id)a3
{
  id v4;
  void *v5;
  HMDResidentDeviceManagerRoar *v6;
  NSObject *v7;
  void *v8;
  HMDResidentDeviceManagerXPCDiscoveryRequester *v9;
  id v10;
  HMDResidentDeviceManagerXPCDiscoveryRequester *v11;
  _QWORD v12[4];
  HMDResidentDeviceManagerXPCDiscoveryRequester *v13;
  HMDResidentDeviceManagerRoar *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident discovery request", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_alloc_init(HMDResidentDeviceManagerXPCDiscoveryRequester);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__HMDResidentDeviceManagerRoar__handlePrimaryResidentDiscoveryXPCRequest___block_invoke;
  v12[3] = &unk_24E7953D0;
  v13 = v9;
  v14 = v6;
  v15 = v4;
  v10 = v4;
  v11 = v9;
  -[HMDResidentDeviceManagerXPCDiscoveryRequester setBlock:](v11, "setBlock:", v12);
  -[HMDResidentDeviceManagerRoar _discoverPrimaryResidentForRequester:](v6, "_discoverPrimaryResidentForRequester:", v11);

}

- (void)_handlePrimaryResidentDiscoveryRequest:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  HMDResidentDeviceManagerRoar *v7;
  NSObject *v8;
  NSObject *v9;
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
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDResidentDeviceManagerRoar isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident");
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received query for primary resident, responding", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDResidentDeviceManagerRoar currentResidentDevice](v7, "currentResidentDevice", CFSTR("uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    -[HMDResidentDeviceManagerRoar primaryResidentGenerationID](v7, "primaryResidentGenerationID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("gen"));

    v18 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v4, "respondWithPayload:", v18);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v19;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received query for primary but we are standby, ignoring", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

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
  void *v16;
  HMDResidentDeviceManagerRoar *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  HMDResidentDeviceManagerRoar *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMDResidentDeviceManagerRoar *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  int buf;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[HMDResidentDeviceManagerRoar residentDevices](self, "residentDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v40;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v5);

        if ((v13 & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v14 = v11;

      if (!v14)
        goto LABEL_17;
      v38 = 0;
      objc_msgSend(v4, "messagePayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmf_BOOLForKey:isPresent:", CFSTR("kEnabledKey"), &v38);

      if (!v38)
      {
        v16 = (void *)MEMORY[0x227676638]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messagePayload");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          buf = 138543618;
          v45 = v19;
          v46 = 2112;
          v47 = v20;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Invalid message payload, missing enabled state: %@", (uint8_t *)&buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v4, "responseHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
          v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "responseHandler");
          v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v23[2](v23, v22, 0);

          goto LABEL_26;
        }
      }
      goto LABEL_27;
    }
LABEL_10:

LABEL_17:
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543618;
      v45 = v27;
      v46 = 2114;
      v47 = v28;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to find resident device with identifier: %{public}@", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(v4, "responseHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v31 = 2;
      goto LABEL_25;
    }
  }
  else
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543618;
      v45 = v35;
      v46 = 2112;
      v47 = v36;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Invalid message payload, missing resident device identifier: %@", (uint8_t *)&buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(v4, "responseHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v31 = 20;
LABEL_25:
      objc_msgSend(v30, "hmErrorWithCode:", v31);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "responseHandler");
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v22)[2](v22, v14, 0);
LABEL_26:

LABEL_27:
    }
  }

}

- (void)handleCurrentDeviceChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentDeviceManagerRoar *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDResidentDeviceManagerRoar_handleCurrentDeviceChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)foundNewPrimaryResident:(id)a3 generationID:(id)a4 selectionTimestamp:(id)a5 changeSource:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;

  v9 = a3;
  v10 = a4;
  v11 = objc_alloc(MEMORY[0x24BE3F168]);
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithQueue:", v12);

  v14 = (void *)MEMORY[0x24BE3F180];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __101__HMDResidentDeviceManagerRoar_foundNewPrimaryResident_generationID_selectionTimestamp_changeSource___block_invoke;
  v19[3] = &unk_24E78A778;
  v19[4] = self;
  v20 = v9;
  v21 = v10;
  v22 = a6;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v14, "inContext:perform:", v13, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)sawGenerationID:(id)a3 forDevice:(id)a4
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HMDResidentDeviceManagerRoar_sawGenerationID_forDevice___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDResidentDeviceManagerRoar *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentDeviceManagerRoar residentDeviceForDevice:](self, "residentDeviceForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDResidentDeviceManagerRoar isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Request for external update of the primary resident to: %{public}@ received while we are the primary", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "allowExternalUpdateOfPrimaryResidentTo:", v5);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void)electResidentDevice:(unint64_t)a3
{
  void *v5;
  HMDResidentDeviceManagerRoar *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 == 7)
  {
    if (-[HMDResidentDeviceManagerRoar isActingAsResident](self, "isActingAsResident"))
    {
      -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectPrimaryResidentWithReason:", 7);

      return;
    }
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@SetPreferredPrimary - This device is not an acting resident, returning from electResidentDevice", buf, 0xCu);

    }
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)discoveryManager:(id)a3 didCompleteDiscoveryWithPrimaryResidentDevice:(id)a4 primaryResidentGenerationID:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __129__HMDResidentDeviceManagerRoar_discoveryManager_didCompleteDiscoveryWithPrimaryResidentDevice_primaryResidentGenerationID_error___block_invoke;
  v16[3] = &unk_24E79A910;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)discoveryManager:(id)a3 didCompleteInitialDiscoveryAttemptWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __93__HMDResidentDeviceManagerRoar_discoveryManager_didCompleteInitialDiscoveryAttemptWithError___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)modernTransportDeviceReachabilityObserverDidUpdate:(id)a3 isReachable:(BOOL)a4
{
  id v6;
  NSObject *queue;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  if (!-[HMDResidentDeviceManagerRoar isActingAsResident](self, "isActingAsResident"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __95__HMDResidentDeviceManagerRoar_modernTransportDeviceReachabilityObserverDidUpdate_isReachable___block_invoke;
    block[3] = &unk_24E799CF0;
    block[4] = self;
    v9 = v6;
    v10 = a4;
    dispatch_async(queue, block);

  }
}

- (void)_handleRemoteDeviceIsReachable:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar _updateResidentIDSReachability:withUpdatedDevice:](self, "_updateResidentIDSReachability:withUpdatedDevice:", 1, v4);

}

- (void)_handleRemoteDeviceIsNotReachable:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar _updateResidentIDSReachability:withUpdatedDevice:](self, "_updateResidentIDSReachability:withUpdatedDevice:", 0, v4);

}

- (void)_handleResidentSelectionVersionDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentDeviceManagerRoar queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HMDResidentDeviceManagerRoar__handleResidentSelectionVersionDidChange___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_setResident:(id)a3 reachableOverIDS:(BOOL)a4 andNotify:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  int v9;
  void *v10;
  HMDResidentDeviceManagerRoar *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v5 = a5;
  v6 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_msgSend(v8, "isReachableByIDS");
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 == v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = "un";
      v21 = 138543874;
      v22 = v17;
      if (v6)
        v20 = "";
      v23 = 2112;
      v24 = v18;
      v25 = 2080;
      v26 = v20;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@resident %@ is already %sreachable by IDS", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v14;
      v23 = 2112;
      v24 = (uint64_t)v15;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Setting IDS reachability to %@ for resident %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v8, "setReachableByIDS:", v6);
    if (v5)
      -[HMDResidentDeviceManagerRoar notifyClientsOfUpdatedResidentDevice:](v11, "notifyClientsOfUpdatedResidentDevice:", v8);
  }

}

- (void)_updateResidentIDSReachability:(BOOL)a3 withUpdatedDevice:(id)a4
{
  id v6;
  NSObject *queue;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  if (!-[HMDResidentDeviceManagerRoar isActingAsResident](self, "isActingAsResident"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__HMDResidentDeviceManagerRoar__updateResidentIDSReachability_withUpdatedDevice___block_invoke;
    block[3] = &unk_24E799CF0;
    block[4] = self;
    v9 = v6;
    v10 = a3;
    dispatch_async(queue, block);

  }
}

- (void)_updateReachability:(BOOL)a3 forResidentDevice:(id)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  void *v8;
  HMDResidentDeviceManagerRoar *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(v6, "isReachable");
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 == v4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = "un";
      v16 = 138543874;
      v17 = v14;
      if (v4)
        v15 = "";
      v18 = 2112;
      v19 = v6;
      v20 = 2080;
      v21 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Resident %@ is already %sreachable", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = (const char *)v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Setting reachability to %@ for resident %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "setReachable:", v4);
    -[HMDResidentDeviceManagerRoar notifyClientsOfUpdatedResidentDevice:](v9, "notifyClientsOfUpdatedResidentDevice:", v6);
  }

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar messageTargetUUID](self, "messageTargetUUID");
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
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24E79DB48;
  }
  -[HMDResidentDeviceManagerRoar residentDevices](self, "residentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Resident Devices = %@"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v9;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDResidentDeviceManagerRoar descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDResidentDeviceManagerRoar descriptionWithPointer:](self, "descriptionWithPointer:", 0);
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dumpState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Election.Coordination"));

  }
  -[HMDResidentDeviceManagerRoar home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  v31 = v7;
  objc_msgSend(v7, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar primaryResidentDevice](self, "primaryResidentDevice");
  v10 = v3;
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar isResidentAvailable](self, "isResidentAvailable");
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar isResidentSupported](self, "isResidentSupported");
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("home: %@, primaryResidentDevice: %@ isResidentAvailable: %@, isResidentSupported: %@"), v9, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v10;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("State"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HMDResidentDeviceManagerRoar residentDevices](self, "residentDevices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v23), "dumpState");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v21);
  }

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v18, CFSTR("Residents"));
  -[HMDResidentDeviceManagerRoar messageDispatcher](self, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "secureRemoteTransport");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "deviceMonitor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dumpState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v28, CFSTR("Remote Device Monitor"));

  return v32;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (void)_handleCloudZoneReadyNotification:(id)a3
{
  id v5;
  void *v6;
  HMDResidentDeviceManagerRoar *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

}

- (void)updatePrimaryResidentWithUUID:(id)a3 actions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDResidentDeviceManagerRoar *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

}

- (BOOL)isResidentEnabled
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerRoar ourSelf](self, "ourSelf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)isOwnerUser
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerRoar home](self, "home");
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

- (void)_updateReachabilityFromWorkingStoreExceptResident:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDResidentDeviceManagerRoar *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentDeviceManagerRoar residentDevicesSet](self, "residentDevicesSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "removeObject:", v4));
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating resident reachability from database", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = objc_alloc(MEMORY[0x24BE3F168]);
  -[HMDResidentDeviceManagerRoar queue](v8, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithQueue:", v12);

  -[HMDResidentDeviceManagerRoar backingStore](v8, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "residentsRequiringReachabilityUpdate:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__HMDResidentDeviceManagerRoar__updateReachabilityFromWorkingStoreExceptResident___block_invoke;
  v17[3] = &unk_24E795510;
  v17[4] = v8;
  v16 = (id)objc_msgSend(v15, "inContext:then:", v13, v17);

}

- (void)_updateReachability:(BOOL)a3 forResidentDevices:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[HMDResidentDeviceManagerRoar _updateReachability:forResidentDevice:](self, "_updateReachability:forResidentDevice:", v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_handleUpdatedPrimaryResidentDevice:(id)a3 previousPrimaryResident:(id)a4 generationID:(id)a5 changeSource:(unint64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  HMDResidentDeviceManagerRoar *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDResidentDeviceManagerRoar *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  HMDResidentDeviceManagerRoar *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  NSUUID *primaryResidentUUID;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  HMDResidentDeviceManagerRoar *v53;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *logger;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  __CFString *v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v66 = (__CFString *)a5;
  v12 = objc_msgSend(v10, "isCurrentDevice");
  v13 = v12;
  if (v10)
    v14 = v12;
  else
    v14 = 1;
  if (v10)
  {
    v12 = objc_msgSend(v10, "isReachable");
    v15 = v12 ^ 1;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15 ^ 1;
  if (!v11)
    v16 = 0;
  if (((v16 | v14) & 1) == 0)
    v12 = -[HMDResidentDeviceManagerRoar _updateReachabilityFromWorkingStoreExceptResident:](self, "_updateReachabilityFromWorkingStoreExceptResident:", v10);
  v65 = v14;
  if (v15)
  {
    v17 = (void *)MEMORY[0x227676638](v12);
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = (uint64_t)v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Marking new primary resident as reachable", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDResidentDeviceManagerRoar _updateReachability:forResidentDevice:](v18, "_updateReachability:forResidentDevice:", 1, v10);
  }
  else if (!v10)
  {
    v21 = (void *)MEMORY[0x227676638](v12);
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = (uint64_t)v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@There is no primary resident. Marking all residents as unreachable", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDResidentDeviceManagerRoar residentDevices](v22, "residentDevices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar _updateReachability:forResidentDevices:](v22, "_updateReachability:forResidentDevices:", 0, v25);

  }
  objc_msgSend(v11, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = HMFEqualObjects();

  if ((v28 & 1) != 0)
  {
    -[HMDResidentDeviceManagerRoar _updatePrimaryResidentGenerationID:](self, "_updatePrimaryResidentGenerationID:", v66);
    goto LABEL_42;
  }
  v29 = (void *)MEMORY[0x227676638]();
  v30 = self;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (a6 - 1 > 6)
      v34 = CFSTR("resident removed");
    else
      v34 = off_24E78A7B8[a6 - 1];
    *(_DWORD *)buf = 138544130;
    v68 = v32;
    v69 = 2112;
    v70 = v34;
    v71 = 2112;
    v72 = v11;
    v73 = 2112;
    v74 = v10;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Updating primary resident due to %@, from %@ to %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v29);
  os_unfair_lock_lock_with_options();
  objc_msgSend(v10, "identifier");
  v35 = objc_claimAutoreleasedReturnValue();
  primaryResidentUUID = v30->_primaryResidentUUID;
  v30->_primaryResidentUUID = (NSUUID *)v35;

  v37 = HMFEqualObjects();
  if ((v37 & 1) == 0)
    objc_storeStrong((id *)&v30->_primaryResidentGenerationID, a5);
  os_unfair_lock_unlock(&v30->_lock);
  if (!-[HMDResidentDeviceManagerRoar isActingAsResident](v30, "isActingAsResident"))
  {
    if (v11)
    {
      -[HMDResidentDeviceManagerRoar reachabilityObserver](v30, "reachabilityObserver");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "device");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "deviceAddress");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeListener:forDeviceAddress:", v30, v40);

      -[HMDResidentDeviceManagerRoar deviceMonitor](v30, "deviceMonitor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "device");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stopMonitoringDevice:forClient:", v42, v30);

    }
    if (v10)
    {
      -[HMDResidentDeviceManagerRoar reachabilityObserver](v30, "reachabilityObserver");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "device");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "deviceAddress");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addListener:forDeviceAddress:", v30, v45);

      -[HMDResidentDeviceManagerRoar deviceMonitor](v30, "deviceMonitor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "device");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "startMonitoringDevice:withInitialReachability:forClient:", v47, 0, v30);

      -[HMDResidentDeviceManagerRoar deviceMonitor](v30, "deviceMonitor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "unreachableDevices");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "device");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerRoar _setResident:reachableOverIDS:andNotify:](v30, "_setResident:reachableOverIDS:andNotify:", v10, objc_msgSend(v49, "containsObject:", v50) ^ 1, 0);

    }
  }
  -[HMDResidentDeviceManagerRoar _updatePrimaryResidentTransactionWithPrimaryResidentDevice:](v30, "_updatePrimaryResidentTransactionWithPrimaryResidentDevice:", v10);
  v51 = -[HMDResidentDeviceManagerRoar notifyUpdatedPrimaryResident:previousPrimaryResident:](v30, "notifyUpdatedPrimaryResident:previousPrimaryResident:", v10, v11);
  if ((v37 & 1) == 0)
  {
    v52 = (void *)MEMORY[0x227676638](v51);
    v53 = v30;
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v55)
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = (uint64_t)v56;
        v69 = 2114;
        v70 = v66;
        _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@Using newly generated primaryResidentGenerationID = %{public}@", buf, 0x16u);

      }
    }
    else if (v55)
    {
      HMFGetLogIdentifier();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = (uint64_t)v57;
      v69 = 2114;
      v70 = v66;
      _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@Updating primaryResidentGenerationID = %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v52);
  }
  if ((v65 & 1) != 0)
  {
    -[HMDResidentDeviceManagerRoar _teardownSessionWithPrimaryResidentDevice](v30, "_teardownSessionWithPrimaryResidentDevice");
LABEL_42:
    if (!v10)
      goto LABEL_47;
    goto LABEL_45;
  }
  -[HMDResidentDeviceManagerRoar _setupSessionWithPrimaryResidentDevice](v30, "_setupSessionWithPrimaryResidentDevice");
LABEL_45:
  -[HMDResidentDeviceManagerRoar primaryDiscoveryManager](self, "primaryDiscoveryManager");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "cancel");

  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    v60 = logger;
    objc_msgSend(v10, "identifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v68 = (uint64_t)v61;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v60, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HH2ElectedPrimaryResident", "electedPrimaryResidentIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);

  }
LABEL_47:
  -[HMDResidentDeviceManagerRoar _handleReachabilityAfterPrimaryResidentChangedTo:previousPrimaryResident:](self, "_handleReachabilityAfterPrimaryResidentChangedTo:previousPrimaryResident:", v10, v11);
  objc_msgSend(v10, "device");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDResidentDeviceManagerRoar isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident")&& objc_msgSend(v62, "isCurrentDevice"))
  {
    -[HMDResidentDeviceManagerRoar backingStore](self, "backingStore");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar availableResidentDevices](self, "availableResidentDevices");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "updateIdentifiersForAvailableResidentDevices:", v64);

  }
}

- (BOOL)hasActivePrimaryResidentTransaction
{
  return self->_primaryResidentTransaction != 0;
}

- (void)_updatePrimaryResidentTransactionWithPrimaryResidentDevice:(id)a3
{
  id v4;
  void *v5;
  HMDResidentDeviceManagerRoar *v6;
  NSObject *v7;
  void *v8;
  HMFOSTransaction *primaryResidentTransaction;
  void *v10;
  HMDResidentDeviceManagerRoar *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isCurrentDevice")
    && !-[HMDResidentDeviceManagerRoar hasActivePrimaryResidentTransaction](self, "hasActivePrimaryResidentTransaction"))
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Taking OS transaction since this device is now the primary resident", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("com.apple.homed.primary-resident"));
    primaryResidentTransaction = v11->_primaryResidentTransaction;
    v11->_primaryResidentTransaction = (HMFOSTransaction *)v14;
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "isCurrentDevice") & 1) == 0
    && -[HMDResidentDeviceManagerRoar hasActivePrimaryResidentTransaction](self, "hasActivePrimaryResidentTransaction"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Releasing OS transaction since this device is no longer the primary resident", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    primaryResidentTransaction = v6->_primaryResidentTransaction;
    v6->_primaryResidentTransaction = 0;
LABEL_11:

  }
}

- (void)_handleReachabilityAfterPrimaryResidentChangedTo:(id)a3 previousPrimaryResident:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDResidentDeviceManagerRoar *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@There is no primary resident. Marking all residents as unreachable", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDResidentDeviceManagerRoar residentDevices](v13, "residentDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar _updateReachability:forResidentDevices:](v13, "_updateReachability:forResidentDevices:", 0, v11);
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isCurrentDevice"))
  {
    v8 = (void *)MEMORY[0x24BDBCEF0];
    -[HMDResidentDeviceManagerRoar localNetworkElection](self, "localNetworkElection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "residentsInMesh");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObject:", v6);
    -[HMDResidentDeviceManagerRoar _updateResidentReachabilityWithResidents:](self, "_updateResidentReachabilityWithResidents:", v11);
LABEL_7:

  }
}

- (void)_updateResidentReachabilityWithResidents:(id)a3
{
  id v4;
  void *v5;
  HMDResidentDeviceManagerRoar *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HMDResidentDeviceManagerRoar isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing resident reachability update: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v9 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__HMDResidentDeviceManagerRoar__updateResidentReachabilityWithResidents___block_invoke;
    v14[3] = &unk_24E7952E0;
    v14[4] = v6;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
    -[HMDResidentDeviceManagerRoar residentDevicesSet](v6, "residentDevicesSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_removedObjectsFromSet:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __73__HMDResidentDeviceManagerRoar__updateResidentReachabilityWithResidents___block_invoke_2;
    v13[3] = &unk_24E7952E0;
    v13[4] = v6;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
    -[HMDResidentDeviceManagerRoar backingStore](v6, "backingStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateReachabilityForResidents:", v4);

  }
}

- (void)_handleUpdatedPrimaryFromLeader:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDResidentDeviceManagerRoar *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentDeviceManagerRoar primaryResidentUUID](self, "primaryResidentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    -[HMDResidentDeviceManagerRoar residentWithUUID:](self, "residentWithUUID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoar primaryResidentDevice](self, "primaryResidentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isCurrentDevice");
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Leader notified that we are the primary. Becoming the primary resident.", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerRoar _handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:](v11, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", v7, v8, v15, 2);

    }
    else
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v16;
        v21 = 2114;
        v22 = v17;
        v23 = 2114;
        v24 = v18;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Leader notified a new primary resident in the ping notification: %{public}@. Current Primary: %{public}@. Kicking off a primary resident discovery", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDResidentDeviceManagerRoar _discoverPrimaryResidentForRequester:](v11, "_discoverPrimaryResidentForRequester:", 0);
    }

  }
}

- (void)primaryElectionAddOn:(id)a3 didElectPrimaryResident:(id)a4 confirmed:(BOOL)a5 electionLogEvent:(id)a6
{
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend(v10, "isCurrentDevice"))
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  else
    -[HMDResidentDeviceManagerRoar primaryResidentGenerationID](self, "primaryResidentGenerationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar primaryResidentDevice](self, "primaryResidentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoar _handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:](self, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", v10, v9, v8, 1);

}

- (void)primaryElectionAddOn:(id)a3 didUpdateResidentDevice:(id)a4
{
  NSObject *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a4;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentDeviceManagerRoar residentDevices](self, "residentDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v8);

  if ((v7 & 1) == 0)
    -[HMDResidentDeviceManagerRoar _addResidentDevice:](self, "_addResidentDevice:", v8);
  -[HMDResidentDeviceManagerRoar notifyClientsOfUpdatedResidentDevice:](self, "notifyClientsOfUpdatedResidentDevice:", v8);

}

- (void)primaryElectionAddOn:(id)a3 didUpdateActiveNodes:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentDeviceManagerRoar _updateResidentReachabilityWithResidents:](self, "_updateResidentReachabilityWithResidents:", v6);
}

- (void)primaryElectionAddOn:(id)a3 didFailToElectWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDResidentDeviceManagerRoar *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v12;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Election %@ failed: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v9);

}

- (void)primaryElectionAddOn:(id)a3 didReceivePrimaryResidentUUIDFromLeader:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  -[HMDResidentDeviceManagerRoar queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentDeviceManagerRoar _handleUpdatedPrimaryFromLeader:](self, "_handleUpdatedPrimaryFromLeader:", v6);
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDResidentDeviceManagerRoar *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDResidentDeviceManagerRoar *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v12);

}

- (HMDMessageDispatcher)messageDispatcher
{
  return (HMDMessageDispatcher *)objc_getProperty(self, a2, 64, 1);
}

- (HMDModernTransportDeviceReachabilityObserver)reachabilityObserver
{
  return (HMDModernTransportDeviceReachabilityObserver *)objc_getProperty(self, a2, 72, 1);
}

- (void)setReachabilityObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)isActingAsResident
{
  return self->_actingAsResident;
}

- (void)setActingAsResident:(BOOL)a3
{
  self->_actingAsResident = a3;
}

- (HMDPrimaryElectionCoordinationAddOn)localNetworkElection
{
  return (HMDPrimaryElectionCoordinationAddOn *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLocalNetworkElection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (HMFFuture)firstPrimaryResidentDiscoveryAttemptCompletionFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 112, 1);
}

- (HMDResidentDeviceManagerDelegate)delegate
{
  return (HMDResidentDeviceManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)residentCapable
{
  return self->_residentCapable;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 128, 1);
}

- (NSDate)primaryResidentSelectionTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)homeSupportsResidentSelection
{
  return self->_homeSupportsResidentSelection;
}

- (HMDResidentDevice)userSelectedPreferredResident
{
  return (HMDResidentDevice *)objc_getProperty(self, a2, 144, 1);
}

- (NSArray)autoSelectedPreferredResidents
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (NSArray)residentsPresentOnStatusKit
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (HMDResidentStatusChannel)residentStatusChannel
{
  return (HMDResidentStatusChannel *)objc_getProperty(self, a2, 168, 1);
}

- (unint64_t)residentSelectionMode
{
  return self->_residentSelectionMode;
}

- (BOOL)blockPrimaryTakeover
{
  return self->_blockPrimaryTakeover;
}

- (unint64_t)myLocation
{
  return self->myLocation;
}

- (unint64_t)ourNetworkConnectionType
{
  return self->ourNetworkConnectionType;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 200, 1);
}

- (HMDResidentDeviceManagerRoarDataSource)dataSource
{
  return (HMDResidentDeviceManagerRoarDataSource *)objc_getProperty(self, a2, 208, 1);
}

- (HMDResidentDeviceManagerRoarBackingStore)backingStore
{
  return (HMDResidentDeviceManagerRoarBackingStore *)objc_getProperty(self, a2, 216, 1);
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return (HMDRemoteDeviceMonitor *)objc_getProperty(self, a2, 224, 1);
}

- (void)setDeviceMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (HMDPrimaryResidentDiscoveryManager)primaryDiscoveryManager
{
  return (HMDPrimaryResidentDiscoveryManager *)objc_getProperty(self, a2, 232, 1);
}

- (NSHashTable)primaryDiscoveryRequesters
{
  return self->_primaryDiscoveryRequesters;
}

- (HMFPromise)firstPrimaryResidentDiscoveryAttemptCompletionPromise
{
  return (HMFPromise *)objc_getProperty(self, a2, 248, 1);
}

- (void)setFirstPrimaryResidentDiscoveryAttemptCompletionPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 256, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_firstPrimaryResidentDiscoveryAttemptCompletionPromise, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryRequesters, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_residentStatusChannel, 0);
  objc_storeStrong((id *)&self->_residentsPresentOnStatusKit, 0);
  objc_storeStrong((id *)&self->_autoSelectedPreferredResidents, 0);
  objc_storeStrong((id *)&self->_userSelectedPreferredResident, 0);
  objc_storeStrong((id *)&self->_primaryResidentSelectionTimestamp, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_firstPrimaryResidentDiscoveryAttemptCompletionFuture, 0);
  objc_storeStrong((id *)&self->_primaryResidentGenerationID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_localNetworkElection, 0);
  objc_storeStrong((id *)&self->_reachabilityObserver, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_primaryResidentUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_primaryResidentTransaction, 0);
  objc_storeStrong((id *)&self->_residentDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __73__HMDResidentDeviceManagerRoar__updateResidentReachabilityWithResidents___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isReachable") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateReachability:forResidentDevice:", 1, v3);

}

void __73__HMDResidentDeviceManagerRoar__updateResidentReachabilityWithResidents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isReachable"))
    objc_msgSend(*(id *)(a1 + 32), "_updateReachability:forResidentDevice:", 0, v3);

}

uint64_t __82__HMDResidentDeviceManagerRoar__updateReachabilityFromWorkingStoreExceptResident___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __82__HMDResidentDeviceManagerRoar__updateReachabilityFromWorkingStoreExceptResident___block_invoke_2;
  v3[3] = &unk_24E7952E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
  return 1;
}

void __82__HMDResidentDeviceManagerRoar__updateReachabilityFromWorkingStoreExceptResident___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "isReachable") ^ 1;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating resident reachability from database to %@ for: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "_updateReachability:forResidentDevice:", v4, v3);

}

void __81__HMDResidentDeviceManagerRoar__updateResidentIDSReachability_withUpdatedDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "residentDeviceForDevice:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Notified that resident device %@ IDS reachability changed: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_setResident:reachableOverIDS:andNotify:", v2, *(unsigned __int8 *)(a1 + 48), 1);
  }

}

void __73__HMDResidentDeviceManagerRoar__handleResidentSelectionVersionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "isActingAsResident");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Device is acting as resident %@, home's resident selection version changed to %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  if (objc_msgSend(*(id *)(a1 + 32), "isActingAsResident") && objc_msgSend(v3, "integerValue") >= 3)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v3;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Exiting mesh since home's resident selection version changed to %{public}@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 32), "_stopLocalNetworkElection");
  }

}

void __95__HMDResidentDeviceManagerRoar_modernTransportDeviceReachabilityObserverDidUpdate_isReachable___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "primaryResidentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isDeviceEquivalentToDeviceAddress:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "_handlePrimaryResident:isReachable:", v2, *(unsigned __int8 *)(a1 + 48));

}

void __93__HMDResidentDeviceManagerRoar_discoveryManager_didCompleteInitialDiscoveryAttemptWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Account message phase of the primary resident discovery operation completed. Error: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "firstPrimaryResidentDiscoveryAttemptCompletionPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "rejectWithError:", *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v8, "fulfillWithNoValue");

}

void __129__HMDResidentDeviceManagerRoar_discoveryManager_didCompleteDiscoveryWithPrimaryResidentDevice_primaryResidentGenerationID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "primaryDiscoveryRequesters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "primaryDiscoveryRequesters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "handlePrimaryResidentDiscovered:primaryResidentGenerationID:", v5, *(_QWORD *)(a1 + 48));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "residentDeviceManager:didCompleteDiscoveryWithPrimaryResidentDevice:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __58__HMDResidentDeviceManagerRoar_sawGenerationID_forDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "residentDeviceForDevice:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      v14 = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device %@ is unknown, ignoring generation ID", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "primaryResidentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v2;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@New generation ID is for a resident that isn't the primary: %@ ignoring it.", (uint8_t *)&v14, 0x16u);

    }
LABEL_10:
    objc_autoreleasePoolPop(v6);
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "_updatePrimaryResidentGenerationID:", *(_QWORD *)(a1 + 48));
LABEL_11:

}

uint64_t __101__HMDResidentDeviceManagerRoar_foundNewPrimaryResident_generationID_selectionTimestamp_changeSource___block_invoke(uint64_t a1)
{
  HMDResidentDevice *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  HMDResidentDevice *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "residentDeviceForDevice:", *(_QWORD *)(a1 + 40));
  v2 = (HMDResidentDevice *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v19 = 138543618;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@New resident device %@ is not known as a resident device, creating one", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v8 = [HMDResidentDevice alloc];
    v9 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 264));
    v2 = -[HMDResidentDevice initWithDevice:home:](v8, "initWithDevice:home:", v9, WeakRetained);

    objc_msgSend(*(id *)(a1 + 32), "_addResidentDevice:", v2);
  }
  objc_msgSend(*(id *)(a1 + 32), "primaryResidentUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDevice identifier](v2, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "hmf_isEqualToUUID:", v12);

  v14 = *(void **)(a1 + 32);
  if (v13)
  {
    objc_msgSend(v14, "_updatePrimaryResidentGenerationID:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "primaryDiscoveryManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cancel");
    v16 = 0;
  }
  else
  {
    if (!objc_msgSend(v14, "allowExternalUpdateOfPrimaryResidentTo:", *(_QWORD *)(a1 + 40)))
    {
      v16 = 1;
      goto LABEL_11;
    }
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v17, "primaryResidentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", v2, v15, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v16 = 2;
  }

LABEL_11:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
  objc_claimAutoreleasedReturnValue();

  return 1;
}

void __59__HMDResidentDeviceManagerRoar_handleCurrentDeviceChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_opt_isKindOfClass();

  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), CFSTR("HMDDeviceUpdatedNotification"), 0);

}

void __74__HMDResidentDeviceManagerRoar__handlePrimaryResidentDiscoveryXPCRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "setBlock:", 0);
  if (v5)
  {
    v14 = CFSTR("uuid");
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 40), "primaryResidentGenerationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("uuid"));

  }
  else
  {
    v10 = 0;
  }
  v12 = *(void **)(a1 + 48);
  v13 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v12, "respondWithPayload:error:", v13, v7);

}

uint64_t __92__HMDResidentDeviceManagerRoar_handlePrimaryResidentDiscovered_primaryResidentGenerationID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

uint64_t __68__HMDResidentDeviceManagerRoar_discoverPrimaryResidentForRequester___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoverPrimaryResidentForRequester:", *(_QWORD *)(a1 + 40));
}

void __85__HMDResidentDeviceManagerRoar_notifyUpdatedPrimaryResident_previousPrimaryResident___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "localNetworkElection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryResidentChanged:previousResidentDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "residentDeviceManager:didUpdatePrimaryResident:previousPrimaryResident:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of resident device confirmed state changing to YES", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = CFSTR("HMDResidentDeviceHomeUUIDNotificationKey");
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "home", CFSTR("HMDResidentDeviceHomeUUIDNotificationKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("HMDResidentDeviceResidentNotificationKey");
    v14[0] = v11;
    v14[1] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), v9, v12);

    objc_msgSend(*(id *)(a1 + 32), "_notifyUpdatedGenerationIDWithPrimaryResident:", *(_QWORD *)(a1 + 40));
  }
}

void __69__HMDResidentDeviceManagerRoar_notifyClientsOfUpdatedResidentDevice___block_invoke(uint64_t a1)
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

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated resident: %@", (uint8_t *)&v11, 0x16u);

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
  objc_msgSend(v8, "evaluateBulletinNotificationsSupported");

}

void __56__HMDResidentDeviceManagerRoar_notifyResidentAvailable___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManager:didUpdateResidentAvailable:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

uint64_t __57__HMDResidentDeviceManagerRoar_accountOrDeviceDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "isResidentSupported");
    v9 = 138543874;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling notification: %{public}@. self.isResidentSupported: %d", (uint8_t *)&v9, 0x1Cu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_configureResidentSupported");
}

uint64_t __58__HMDResidentDeviceManagerRoar_updateResidentAvailability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateResidentAvailability:", 0);
}

uint64_t __53__HMDResidentDeviceManagerRoar_removeResidentDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeResidentDevice:", *(_QWORD *)(a1 + 40));
}

void __54__HMDResidentDeviceManagerRoar__removeResidentDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManagerDidUpdateResidents:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reEvaluateHomeHubState");
  objc_msgSend(v3, "evaluateResidentUpdate");
  objc_msgSend(v3, "evaluateBulletinNotificationsSupported");
  objc_msgSend(*(id *)(a1 + 32), "_updateResidentAvailability:", 0);
  objc_msgSend(*(id *)(a1 + 40), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableNotificationsForDevices:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_checkPrimaryResidentDeviceRemoved:currentPrimary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice"))
  {
    objc_msgSend(*(id *)(a1 + 32), "localNetworkElection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");

  }
}

uint64_t __39__HMDResidentDeviceManagerRoar_ourSelf__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevice");

  return v3;
}

uint64_t __35__HMDResidentDeviceManagerRoar_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

void __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addedResidentDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(*(id *)(a1 + 40), "deletedResidentDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(*(id *)(a1 + 40), "reachabilityUpdates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v5;
    v20 = 2048;
    v21 = v7;
    v22 = 2048;
    v23 = v9;
    v24 = 2048;
    v25 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Residents changed, added: %lu; removed: %lu; reachability: %lu",
      buf,
      0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "deletedResidentDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_140;
  v17[3] = &unk_24E7952E0;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);

  objc_msgSend(*(id *)(a1 + 40), "addedResidentDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_142;
  v16[3] = &unk_24E7952E0;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);

  objc_msgSend(*(id *)(a1 + 40), "reachabilityUpdates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_143;
  v15[3] = &unk_24E7952E0;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);

}

void __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud removed resident: %@ (%{public}@)", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_removeResidentDevice:", v3);

}

void __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_142(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud added resident: %@ (%{public}@)", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_addResidentDevice:", v3);

}

void __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "isReachable") ^ 1;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Cloud updated resident reachability: %@ (%{public}@) -> %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "_updateReachability:forResidentDevice:", v4, v3);

}

uint64_t __66__HMDResidentDeviceManagerRoar_residentDevicesWithIDSIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Peer devices settled.", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "markPrimaryResidentElectionPeerDeviceFutureResolved");

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Peer devices settled with error: %@.", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@First CloudKit import promise resolved.", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "markPrimaryResidentElectionFirstCloudKitImportFutureResolved");

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Modern Transport Started.", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "markPrimaryResidentElectionModernTransportStartedFutureResolved");

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_135(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Modern Transport start returned error: %@.", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_136(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "badCDPState");

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Operating in bad CDP state. Not joining the mesh", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "isActingAsResident") & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Met conditions required to join mesh, starting join.", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 40), "markPrimaryResidentElectionJoinMesh");
    objc_msgSend(*(id *)(a1 + 32), "setActingAsResident:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_startLocalNetworkElection");
    objc_msgSend(*(id *)(a1 + 32), "primaryResidentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "reachabilityObserver");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v15, "messageAddress");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeListener:forDeviceAddress:", v17, v18);

      objc_msgSend(*(id *)(a1 + 32), "deviceMonitor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stopMonitoringDevice:forClient:", v20, *(_QWORD *)(a1 + 32));

    }
  }

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_137(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not join the mesh. One of the conditions to join was not met", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

  return 1;
}

uint64_t __42__HMDResidentDeviceManagerRoar_invalidate__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "_stopLocalNetworkElection");
}

void __59__HMDResidentDeviceManagerRoar__configureResidentSupported__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 264);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "configureWithHome:", WeakRetained);

  objc_msgSend(*(id *)(a1 + 32), "_addResidentDevice:", v5);
}

uint64_t __68__HMDResidentDeviceManagerRoar_configureWithHome_messageDispatcher___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
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
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "setHome:", a1[5]);
  objc_msgSend(a1[4], "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifierForHome:", a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = (void *)v4[12];
  v4[12] = v3;

  objc_msgSend(a1[5], "uuid");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = (void *)v7[11];
  v7[11] = v6;

  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1[4];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isInternalBuild();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "isResidentCapable");
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543874;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring and registering for messages, isInternal: %@, isResidentEnabled: %@", (uint8_t *)&v26, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(a1[4], "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createBackingStoreForHome:", a1[5]);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = a1[4];
  v19 = (void *)v18[27];
  v18[27] = v17;

  objc_storeStrong((id *)a1[4] + 8, a1[6]);
  objc_msgSend(a1[6], "secureRemoteTransport");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "modernReachabilityObserver");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setReachabilityObserver:", v21);

  objc_msgSend(a1[6], "secureRemoteTransport");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "deviceMonitor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setDeviceMonitor:", v23);

  objc_msgSend(a1[4], "_registerForMessages");
  objc_msgSend(a1[4], "_registerForNotifications");
  objc_msgSend(a1[4], "primaryDiscoveryManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configureWithContext:", a1[4]);

  return objc_msgSend(a1[4], "_configureResidentSupported");
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t75 != -1)
    dispatch_once(&logCategory__hmf_once_t75, &__block_literal_global_180);
  return (id)logCategory__hmf_once_v76;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __43__HMDResidentDeviceManagerRoar_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v76;
  logCategory__hmf_once_v76 = v0;

}

@end
