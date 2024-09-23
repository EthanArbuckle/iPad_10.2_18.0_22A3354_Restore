@implementation HMDResidentDeviceManagerRoarV3

- (HMDResidentDeviceManagerRoarV3)init
{
  HMDDefaultResidentDeviceManagerRoarV3DataSource *v3;
  void *v4;
  HMDResidentDeviceManagerRoarV3 *v5;

  v3 = objc_alloc_init(HMDDefaultResidentDeviceManagerRoarV3DataSource);
  +[HMDFeaturesDataSource defaultDataSource](HMDFeaturesDataSource, "defaultDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDResidentDeviceManagerRoarV3 initWithDataSource:featuresDataSource:](self, "initWithDataSource:featuresDataSource:", v3, v4);

  return v5;
}

- (HMDResidentDeviceManagerRoarV3)initWithDataSource:(id)a3 featuresDataSource:(id)a4
{
  id v7;
  id v8;
  HMDResidentDeviceManagerRoarV3 *v9;
  uint64_t v10;
  OS_os_log *logger;
  uint64_t v12;
  OS_dispatch_queue *queue;
  NSString *logIdentifier;
  NSUUID *messageTargetUUID;
  uint64_t v16;
  NSMutableSet *residentDevices;
  uint64_t v18;
  NSNotificationCenter *notificationCenter;
  uint64_t v20;
  HMDAppleAccountManager *appleAccountManager;
  uint64_t v22;
  HMDPrimaryResidentDiscoveryManager *primaryDiscoveryManager;
  uint64_t v24;
  NSHashTable *primaryDiscoveryRequesters;
  uint64_t v26;
  HMFFuture *firstPrimaryResidentDiscoveryAttemptCompletionFuture;
  uint64_t v28;
  NSUserDefaults *userDefaults;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HMDResidentDeviceManagerRoarV3;
  v9 = -[HMDResidentDeviceManagerRoarV3 init](&v31, sel_init);
  if (v9)
  {
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    logger = v9->_logger;
    v9->_logger = (OS_os_log *)v10;

    objc_msgSend(v7, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v9->_featuresDataSource, a4);
    logIdentifier = v9->_logIdentifier;
    v9->_logIdentifier = (NSString *)CFSTR("<unconfigured>");

    messageTargetUUID = v9->_messageTargetUUID;
    v9->_messageTargetUUID = 0;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    residentDevices = v9->_residentDevices;
    v9->_residentDevices = (NSMutableSet *)v16;

    objc_msgSend(v7, "notificationCenter");
    v18 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v9->_notificationCenter;
    v9->_notificationCenter = (NSNotificationCenter *)v18;

    objc_msgSend(v7, "appleAccountManager");
    v20 = objc_claimAutoreleasedReturnValue();
    appleAccountManager = v9->_appleAccountManager;
    v9->_appleAccountManager = (HMDAppleAccountManager *)v20;

    v9->_residentCapable = objc_msgSend(v7, "isResidentCapable");
    objc_msgSend(v7, "createPrimaryResidentDiscoveryManagerWithQueue:", v9->_queue);
    v22 = objc_claimAutoreleasedReturnValue();
    primaryDiscoveryManager = v9->_primaryDiscoveryManager;
    v9->_primaryDiscoveryManager = (HMDPrimaryResidentDiscoveryManager *)v22;

    -[HMDPrimaryResidentDiscoveryManager setDelegate:](v9->_primaryDiscoveryManager, "setDelegate:", v9);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v24 = objc_claimAutoreleasedReturnValue();
    primaryDiscoveryRequesters = v9->_primaryDiscoveryRequesters;
    v9->_primaryDiscoveryRequesters = (NSHashTable *)v24;

    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v9->_firstPrimaryResidentDiscoveryAttemptCompletionPromise);
    v26 = objc_claimAutoreleasedReturnValue();
    firstPrimaryResidentDiscoveryAttemptCompletionFuture = v9->_firstPrimaryResidentDiscoveryAttemptCompletionFuture;
    v9->_firstPrimaryResidentDiscoveryAttemptCompletionFuture = (HMFFuture *)v26;

    v9->_configuredStatusKitForResidentSelection = 0;
    objc_msgSend(v7, "userDefaults");
    v28 = objc_claimAutoreleasedReturnValue();
    userDefaults = v9->_userDefaults;
    v9->_userDefaults = (NSUserDefaults *)v28;

    v9->_blockPrimaryTakeoverStartTime = -1.0;
  }

  return v9;
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
  block[2] = __70__HMDResidentDeviceManagerRoarV3_configureWithHome_messageDispatcher___block_invoke;
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
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 messageDispatcher](self, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v24[1] = v5;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("kResidentDeviceUpdateEnabledRequestKey"), self, v9, sel__handleResidentDeviceUpdateEnabled_);

  +[HMDRemoteMessagePolicy defaultPolicy](HMDRemoteMessagePolicy, "defaultPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (isInternalBuild())
  {
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v23[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("hm.prdisco"), self, v13, sel__handlePrimaryResidentDiscoveryXPCRequest_);

  }
  -[HMDResidentDeviceManagerRoarV3 dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isResidentCapable");

  if (v15)
  {
    v22[0] = v10;
    v22[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("primaryResidentDiscovery"), self, v16, sel__handlePrimaryResidentDiscoveryRequest_);

  }
  v17 = *MEMORY[0x24BDD62E8];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  v21[1] = v6;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", v17, self, v20, sel_handleSetPreferredResidentSelectionMessage_);

}

- (void)_registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HMDResidentDeviceManagerRoarV3 notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudChangeUpdateNotificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleCloudResidentChange_, v5, 0);

  -[HMDResidentDeviceManagerRoarV3 notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleRemoteDeviceIsReachable_, CFSTR("HMDRemoteDeviceIsReachableNotification"), 0);

  -[HMDResidentDeviceManagerRoarV3 notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleRemoteDeviceIsNotReachable_, CFSTR("HMDRemoteDeviceIsNotReachableNotification"), 0);

  -[HMDResidentDeviceManagerRoarV3 notificationCenter](self, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handleResidentSelectionVersionDidChange_, CFSTR("HMDHomeResidentSelectionVersionDidChangeNotification"), v9);

  -[HMDResidentDeviceManagerRoarV3 notificationCenter](self, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__handleDataReadyAfterBecomingPrimaryNotification_, CFSTR("HMDHomeDataReadyAfterBecomingPrimaryNotification"), 0);

  -[HMDResidentDeviceManagerRoarV3 notificationCenter](self, "notificationCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleHomeLocationChangedNotification_, CFSTR("HMDLocationForHomeChanged"), 0);

}

- (void)_configureResidentSupported
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDResidentDeviceManagerRoarV3 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  HMDResidentDeviceManagerRoarV3 *v16;
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
  -[HMDResidentDeviceManagerRoarV3 appleAccountManager](self, "appleAccountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!-[HMDResidentDeviceManagerRoarV3 isResidentSupported](self, "isResidentSupported"))
    {
      v20 = 0;
      -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "findResidents:outHasResidents:", v4, &v20);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __61__HMDResidentDeviceManagerRoarV3__configureResidentSupported__block_invoke;
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
        -[HMDResidentDeviceManagerRoarV3 residentDevices](v8, "residentDevices");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v10;
        v23 = 2114;
        v24 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Initial resident devices: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDResidentDeviceManagerRoarV3 residentDevices](v8, "residentDevices");
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
      -[HMDResidentDeviceManagerRoarV3 setResidentSupported:](v8, "setResidentSupported:", 1);
      -[HMDResidentDeviceManagerRoarV3 _updateResidentAvailability:](v8, "_updateResidentAvailability:", v14);

    }
  }
  else
  {
    -[HMDResidentDeviceManagerRoarV3 setResidentSupported:](self, "setResidentSupported:", 0);
  }

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__HMDResidentDeviceManagerRoarV3_invalidate__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setupAsAResident
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
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
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];

  v41[3] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc(MEMORY[0x24BE3F168]);
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithQueue:", v4);

  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAccessorySetupMetricDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentDeviceManagerRoarV3 appleAccountManager](self, "appleAccountManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "idsDevicesUpdated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke;
  v39[3] = &unk_24E797BE8;
  v39[4] = self;
  v12 = v8;
  v40 = v12;
  v38[0] = v11;
  v38[1] = 3221225472;
  v38[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_167;
  v38[3] = &unk_24E797A18;
  v38[4] = self;
  v13 = (id)objc_msgSend(v10, "inContext:then:orRecover:", v5, v39, v38);
  -[HMDResidentDeviceManagerRoarV3 dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstCloudKitImportFuture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = v11;
  v36[1] = 3221225472;
  v36[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_169;
  v36[3] = &unk_24E797BE8;
  v36[4] = self;
  v16 = v12;
  v37 = v16;
  v17 = (id)objc_msgSend(v15, "inContext:then:", v5, v36);
  -[HMDResidentDeviceManagerRoarV3 messageDispatcher](self, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "secureRemoteTransport");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startFuture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = v11;
  v34[1] = 3221225472;
  v34[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_170;
  v34[3] = &unk_24E797BE8;
  v34[4] = self;
  v21 = v16;
  v35 = v21;
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_171;
  v33[3] = &unk_24E797A18;
  v33[4] = self;
  v22 = (id)objc_msgSend(v20, "inContext:then:orRecover:", v5, v34, v33);
  v23 = (void *)MEMORY[0x24BE3F180];
  v41[0] = v20;
  v41[1] = v15;
  v41[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allSettled:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v29[4] = self;
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_172;
  v30[3] = &unk_24E795290;
  v30[4] = self;
  v31 = v5;
  v32 = v21;
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_180;
  v29[3] = &unk_24E797A18;
  v26 = v21;
  v27 = v5;
  v28 = (id)objc_msgSend(v25, "inContext:then:orRecover:", v27, v30, v29);

}

- (void)_handleInitialConnectionToStatusKit
{
  void *v3;
  char v4;
  HMDResidentSelectionStatusKit *v5;
  void *v6;
  void *v7;
  HMDResidentSelectionStatusKit *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDResidentDeviceManagerRoarV3 *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoarV3 setConfiguredStatusKitForResidentSelection:](self, "setConfiguredStatusKitForResidentSelection:", 1);
  -[HMDResidentDeviceManagerRoarV3 residentStatusChannel](self, "residentStatusChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConnected");

  if ((v4 & 1) != 0)
  {
    -[HMDResidentDeviceManagerRoarV3 _refreshAllResidentsReachabilityFromStatusKit](self, "_refreshAllResidentsReachabilityFromStatusKit");
    v5 = [HMDResidentSelectionStatusKit alloc];
    -[HMDResidentDeviceManagerRoarV3 residentStatusChannel](self, "residentStatusChannel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentResidentStatuses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDResidentSelectionStatusKit initWithWithContext:residentStatusList:](v5, "initWithWithContext:residentStatusList:", self, v7);
    -[HMDResidentDeviceManagerRoarV3 setPresentResidentsStatuses:](self, "setPresentResidentsStatuses:", v8);

    -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](self, "residentLocationHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "residentLocationRawValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    if (v11 == 100)
    {
      -[HMDResidentDeviceManagerRoarV3 residentStatusChannel](self, "residentStatusChannel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentResidentStatuses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerRoarV3 _electorForDeterminingResidentLocationFromPresentResidentStatuses:](self, "_electorForDeterminingResidentLocationFromPresentResidentStatuses:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](self, "residentLocationHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __69__HMDResidentDeviceManagerRoarV3__handleInitialConnectionToStatusKit__block_invoke;
      v20[3] = &unk_24E79BD80;
      v20[4] = self;
      objc_msgSend(v15, "determineHomeOrAwayUsingElector:withCompletion:", v14, v20);

    }
    else
    {
      -[HMDResidentDeviceManagerRoarV3 _startActingAsResident](self, "_startActingAsResident");
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Not connected to StatusKit, unable to determine resident location", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDResidentDeviceManagerRoarV3 _startActingAsResident](v17, "_startActingAsResident");
  }
}

- (void)_startActingAsResident
{
  void *v3;
  HMDResidentDeviceManagerRoarV3 *v4;
  NSObject *v5;
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
  uint64_t v18;
  void *v19;
  HMDResidentDeviceManagerRoarV3 *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Met conditions required to start acting as a resident.", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentDeviceManagerRoarV3 home](v4, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentAccessorySetupMetricDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markPrimaryResidentElectionJoinMesh");
  -[HMDResidentDeviceManagerRoarV3 setActingAsResident:](v4, "setActingAsResident:", 1);
  objc_msgSend(v8, "metricsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerPrimaryChangedCounterTriggerTTRforHome:", v7);

  -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](v4, "primaryResidentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMDResidentDeviceManagerRoarV3 reachabilityObserver](v4, "reachabilityObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeListener:forDeviceAddress:", v4, v13);

    -[HMDResidentDeviceManagerRoarV3 deviceMonitor](v4, "deviceMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stopMonitoringDevice:forClient:", v15, v4);

  }
  if (-[HMDResidentDeviceManagerRoarV3 homeSupportsResidentSelection](v4, "homeSupportsResidentSelection"))
  {
    -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](v4, "residentLocationHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "residentLocationRawValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    v19 = (void *)MEMORY[0x227676638]();
    v20 = v4;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18 == 100)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v23;
        v29 = 2112;
        v30 = CFSTR("Unknown");
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Resident location is: %@, scheduling retry", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      -[HMDResidentDeviceManagerRoarV3 _startRetryTimer](v20, "_startRetryTimer");
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        StringFromHMDResidentLocation(v18);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v24;
        v29 = 2112;
        v30 = v25;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Resident location determined to: %@", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }
  }
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](v4, "residentSelectionManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "currentDeviceReadyAsAResident");

}

- (double)_statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HMDResidentDeviceManagerRoarV3 idsServerBag](self, "idsServerBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 30.0;
  }

  return v5;
}

- (double)_initialConnectionToStatusKitOnResidentTimeout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  HMDResidentDeviceManagerRoarV3 *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  HMDResidentDeviceManagerRoarV3 *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  HMDResidentDeviceManagerRoarV3 *v33;
  NSObject *v34;
  void *v35;
  double v36;
  HMDResidentDeviceManagerRoarV3 *v37;
  void *v38;
  void *v39;
  int v41;
  void *v42;
  __int16 v43;
  double v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoarV3 userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TTSU.Finished"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HMDResidentDeviceManagerRoarV3 userDefaults](self, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("TTSU.Finished"));

  if (v6)
    v8 = objc_msgSend(v6, "BOOLValue");
  else
    v8 = 0;
  v9 = v8 & ~isAppleTV();
  -[HMDResidentDeviceManagerRoarV3 userDefaults](self, "userDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("rpr"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  -[HMDResidentDeviceManagerRoarV3 userDefaults](self, "userDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", CFSTR("rpr"));

  -[HMDResidentDeviceManagerRoarV3 idsServerBag](self, "idsServerBag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "statusKitInitialConnectionTimeoutSeconds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_msgSend(v16, "doubleValue");
    v19 = v18;
    if ((v9 & 1) != 0)
      goto LABEL_12;
  }
  else
  {
    v19 = 60.0;
    if ((v9 & 1) != 0)
    {
LABEL_12:
      if (v13)
      {
        v20 = (void *)MEMORY[0x227676638](v17);
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "BOOLValue");
          HMFBooleanToString();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 138543618;
          v42 = v23;
          v43 = 2112;
          v44 = *(double *)&v24;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Determining initial StatusKit timeout: using hint from controller homeHasReachableResident: %@", (uint8_t *)&v41, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        if ((objc_msgSend(v13, "BOOLValue") & 1) != 0)
        {
LABEL_16:
          HMFUptime();
          goto LABEL_24;
        }
      }
      else
      {
        -[HMDResidentDeviceManagerRoarV3 availableResidentDevices](self, "availableResidentDevices");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        v32 = (void *)MEMORY[0x227676638]();
        v33 = self;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 138543618;
          v42 = v35;
          v43 = 2048;
          v44 = *(double *)&v31;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Determining initial StatusKit timeout: using available resident devices count: %lu", (uint8_t *)&v41, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        if (v31 >= 2)
          goto LABEL_16;
      }
      -[HMDResidentDeviceManagerRoarV3 _statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds](self, "_statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds");
      v19 = v36;
      v25 = -1.0;
LABEL_24:
      v26 = (void *)MEMORY[0x227676638](-[HMDResidentDeviceManagerRoarV3 setBlockPrimaryTakeoverStartTime:](self, "setBlockPrimaryTakeoverStartTime:", v25));
      v37 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543874;
        v42 = v38;
        v43 = 2048;
        v44 = v19;
        v45 = 2112;
        v46 = v39;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Using initial StatusKit timeout of: %f seconds (blockPrimaryTakeover: %@)", (uint8_t *)&v41, 0x20u);

      }
      goto LABEL_26;
    }
  }
  v26 = (void *)MEMORY[0x227676638](v17);
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138543618;
    v42 = v29;
    v43 = 2048;
    v44 = v19;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Using initial StatusKit timeout of: %f seconds", (uint8_t *)&v41, 0x16u);

  }
LABEL_26:

  objc_autoreleasePoolPop(v26);
  return v19;
}

- (BOOL)blockPrimaryTakeover
{
  double v3;
  BOOL v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  HMDResidentDeviceManagerRoarV3 *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoarV3 blockPrimaryTakeoverStartTime](self, "blockPrimaryTakeoverStartTime");
  if (v3 < 0.0)
    return 0;
  -[HMDResidentDeviceManagerRoarV3 idsServerBag](self, "idsServerBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentDeviceManagerBlockPrimaryTakeoverDurationSeconds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 300.0;
  }
  HMFUptime();
  v10 = v9;
  v11 = -[HMDResidentDeviceManagerRoarV3 blockPrimaryTakeoverStartTime](self, "blockPrimaryTakeoverStartTime");
  v13 = v10 - v12;
  v4 = v13 < v8;
  if (v13 < v8)
  {
    v14 = (void *)MEMORY[0x227676638](v11);
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerRoarV3 blockPrimaryTakeoverStartTime](v15, "blockPrimaryTakeoverStartTime");
      v20 = 138543874;
      v21 = v17;
      v22 = 2048;
      v23 = v18;
      v24 = 2048;
      v25 = v13;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Blocking primary takeover (start: %fs, duration: %fs)", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

  return v4;
}

- (void)_publishCurrentResidentStatusWithReason:(int64_t)a3 preferredResidentsList:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentDeviceManagerRoarV3 *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDResidentDeviceManagerRoarV3 residentStatusChannel](self, "residentStatusChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      v14 = "%{public}@Attempting to publish current resident status but Resident Status Channel is nil";
LABEL_8:
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v15, 0xCu);

    }
LABEL_9:

    objc_autoreleasePoolPop(v10);
    goto LABEL_10;
  }
  if (!-[HMDResidentDeviceManagerRoarV3 configuredStatusKitForResidentSelection](self, "configuredStatusKitForResidentSelection"))
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      v14 = "%{public}@Attempting to publish current resident status before Resident Status Channel is configured";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[HMDResidentDeviceManagerRoarV3 _residentStatusWithPreferredResidentsList:](self, "_residentStatusWithPreferredResidentsList:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 statusChannel](self, "statusChannel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publishResidentStatus:reason:", v8, a3);

LABEL_10:
}

- (unint64_t)ourNetworkConnectionType
{
  void *default_evaluator;
  NSObject *v3;
  unint64_t v4;

  default_evaluator = (void *)nw_path_create_default_evaluator();
  v3 = nw_path_evaluator_copy_path();
  if (nw_path_uses_interface_type(v3, nw_interface_type_wired))
  {
    v4 = 1;
  }
  else if (nw_path_uses_interface_type(v3, nw_interface_type_wifi))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_residentStatusWithPreferredResidentsList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDUnpublishedResidentStatus *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDUnpublishedResidentStatus *v12;

  v4 = a3;
  if (-[HMDResidentDeviceManagerRoarV3 isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
  {
    -[HMDResidentDeviceManagerRoarV3 primaryResidentGenerationID](self, "primaryResidentGenerationID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](self, "residentLocationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentLocationRawValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [HMDUnpublishedResidentStatus alloc];
  +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "residentSelectionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDUnpublishedResidentStatus initWithVersion:generationID:preferredResidentsList:selectionInfo:connectionType:locationRawValue:](v8, "initWithVersion:generationID:preferredResidentsList:selectionInfo:connectionType:locationRawValue:", v9, v5, v4, v11, -[HMDResidentDeviceManagerRoarV3 ourNetworkConnectionType](self, "ourNetworkConnectionType"), v7);

  return v12;
}

- (id)_electorForDeterminingResidentLocationFromPresentResidentStatuses:(id)a3
{
  id v4;
  void *v5;
  HMDResidentDeviceManagerRoarV3 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDResidentSelectionStatusKit *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hmf_isEmpty"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@No present resident statuses, returning ourselves as the elector", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDResidentDeviceManagerRoarV3 ourSelf](v6, "ourSelf");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = -[HMDResidentSelectionStatusKit initWithWithContext:residentStatusList:]([HMDResidentSelectionStatusKit alloc], "initWithWithContext:residentStatusList:", self, v4);
    -[HMDResidentSelectionStatusKit elector](v10, "elector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)_startResidentSelectionManager
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDResidentDeviceManagerRoarV3 dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createResidentSelectionManagerWithContext:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 setResidentSelectionManager:](self, "setResidentSelectionManager:", v4);

  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[HMDResidentDeviceManagerRoarV3 _checkForResidentSelectionInfoUpdate](self, "_checkForResidentSelectionInfoUpdate");
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");

}

- (HMDPreferredResidentsList)electorsPreferredResidentsList
{
  void *v2;
  void *v3;

  -[HMDResidentDeviceManagerRoarV3 presentResidentsStatuses](self, "presentResidentsStatuses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredResidentsList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDPreferredResidentsList *)v3;
}

- (id)preferredResidentUUIDs
{
  void *v2;
  void *v3;

  -[HMDResidentDeviceManagerRoarV3 electorsPreferredResidentsList](self, "electorsPreferredResidentsList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentIDSIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)residentIDSIdentifierToLocationMap
{
  void *v3;
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
  void *v15;
  void *v16;

  -[HMDResidentDeviceManagerRoarV3 presentResidentsStatuses](self, "presentResidentsStatuses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentIDSIdentifierToLocationMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HMDResidentDeviceManagerRoarV3 currentResidentDevice](self, "currentResidentDevice");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HMDResidentDeviceManagerRoarV3 currentResidentDevice](self, "currentResidentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "idsIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDResidentDeviceManagerRoarV3 myLocation](self, "myLocation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerRoarV3 currentResidentDevice](self, "currentResidentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "idsIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v15);

    }
  }
  v16 = (void *)objc_msgSend(v5, "copy");

  return v16;
}

- (void)_checkForResidentSelectionInfoUpdate
{
  void *v3;
  void *v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentSelectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __70__HMDResidentDeviceManagerRoarV3__checkForResidentSelectionInfoUpdate__block_invoke;
    v6[3] = &unk_24E79C268;
    v6[4] = self;
    v7 = v4;
    dispatch_async(queue, v6);

  }
}

- (void)_checkForResidentSelectionInfoUpdateInNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasResidentSelectionInfoUpdateInNotification:", v4);

  if (v6)
  {
    -[HMDResidentDeviceManagerRoarV3 _checkForResidentSelectionInfoUpdate](self, "_checkForResidentSelectionInfoUpdate");
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__HMDResidentDeviceManagerRoarV3__checkForResidentSelectionInfoUpdateInNotification___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (BOOL)homeSupportsResidentSelection
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") > 2;

  return v4;
}

- (HMDResidentSelectionInfo)residentSelectionInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentSelectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentDeviceManagerRoarV3 presentResidentsStatuses](self, "presentResidentsStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_msgSend(v4, "selectionTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionTimestamp");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = v7;
  if (v8)
  {
    if (!v9 || (v11 = v7, objc_msgSend(v8, "compare:", v9) == 1))
    {
      v11 = v4;

    }
  }

  return (HMDResidentSelectionInfo *)v11;
}

- (NSArray)residentsPresentOnStatusKit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 statusChannel](self, "statusChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentResidentStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__HMDResidentDeviceManagerRoarV3_residentsPresentOnStatusKit__block_invoke;
  v9[3] = &unk_24E7952B8;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (HMDResidentDevice)userSelectedPreferredResident
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDResidentDeviceManagerRoarV3 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDResidentDeviceManagerRoarV3 *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentModeType");

  if (v4 == 2)
  {
    -[HMDResidentDeviceManagerRoarV3 residentSelectionInfo](self, "residentSelectionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredResidentIDSIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HMDResidentDeviceManagerRoarV3 residentDeviceWithIDSIdentifier:](self, "residentDeviceWithIDSIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v11;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@User preferred resident: %@.", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      v7 = 0;
    }

    return (HMDResidentDevice *)v7;
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@We are not in Manual mode. Returning nil for user preferred resident.", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    return (HMDResidentDevice *)0;
  }
}

- (NSArray)autoSelectedPreferredResidents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentDeviceManagerRoarV3 *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoarV3 electorsPreferredResidentsList](self, "electorsPreferredResidentsList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentIDSIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HMDResidentDeviceManagerRoarV3 residentDevicesWithIDSIdentifiers:](self, "residentDevicesWithIDSIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "residentsNotPresentInPreferredResidentsList:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "addObjectsFromArray:", v9));
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@autoSelectedPreferredResidents: %@.", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (unint64_t)residentSelectionMode
{
  void *v2;
  unint64_t v3;

  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentModeType");

  return v3;
}

- (unint64_t)myLocation
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](self, "residentLocationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentLocationRawValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
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
  -[HMDResidentDeviceManagerRoarV3 appleAccountManager](self, "appleAccountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 residentDevicesSet](self, "residentDevicesSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleCloudResidentChange:currentResidents:isCurrentDevicePrimaryResident:currentDevice:", v4, v8, -[HMDResidentDeviceManagerRoarV3 isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentDeviceManagerRoarV3 _checkForResidentSelectionInfoUpdateInNotification:](self, "_checkForResidentSelectionInfoUpdateInNotification:", v4);
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
  v15[2] = __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke;
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
  -[HMDResidentDeviceManagerRoarV3 residentDevices](self, "residentDevices", 0);
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
  HMDResidentDeviceManagerRoarV3 *v7;
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
  HMDResidentDeviceManagerRoarV3 *v5;
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
  HMDResidentDeviceManagerRoarV3 *v5;
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
  HMDResidentDeviceManagerRoarV3 *v6;
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
  block[2] = __37__HMDResidentDeviceManagerRoarV3_run__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_run
{
  void *v3;
  HMDResidentDeviceManagerRoarV3 *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDResidentDeviceManagerRoarV3 *v14;
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
  -[HMDResidentDeviceManagerRoarV3 home](v4, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](v4, "primaryResidentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && -[HMDResidentDeviceManagerRoarV3 isResidentSupported](v4, "isResidentSupported"))
  {
    objc_msgSend(v7, "subscribeForNotificationsFromRemoteGateway");
  }
  else
  {
    -[HMDResidentDeviceManagerRoarV3 messageDispatcher](v4, "messageDispatcher");
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
      -[HMDResidentDeviceManagerRoarV3 _teardownSessionWithPrimaryResidentDevice](v14, "_teardownSessionWithPrimaryResidentDevice");
    }

  }
}

- (void)_setupSessionWithPrimaryResidentDevice
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](self, "primaryResidentDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDResidentDeviceManagerRoarV3 messageDispatcher](self, "messageDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRemoteAccessDevice:forHome:", v4, v5);

  }
}

- (void)_teardownSessionWithPrimaryResidentDevice
{
  void *v3;
  id v4;

  -[HMDResidentDeviceManagerRoarV3 messageDispatcher](self, "messageDispatcher");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteAccessDevice:forHome:", 0, v3);

}

- (HMDIDSServerBag)idsServerBag
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDResidentDeviceManagerRoarV3 dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsServerBagForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDIDSServerBag *)v5;
}

- (void)addDataSource:(id)a3
{
  id v5;
  void *v6;
  HMDResidentDeviceManagerRoarV3 *v7;
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
  -[HMDResidentDeviceManagerRoarV3 residentDevicesSet](self, "residentDevicesSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 primaryResidentUUID](self, "primaryResidentUUID");
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
  -[HMDResidentDeviceManagerRoarV3 residentDevices](self, "residentDevices", 0);
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

  -[HMDResidentDeviceManagerRoarV3 residentDevices](self, "residentDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_objectPassingTest:", &__block_literal_global_223752);
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

  -[HMDResidentDeviceManagerRoarV3 ourSelf](self, "ourSelf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](self, "primaryResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevice");

  return v3;
}

- (HMDDevice)confirmedPrimaryResidentDevice
{
  void *v2;
  void *v3;

  -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](self, "primaryResidentDevice");
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
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[HMDResidentDeviceManagerRoarV3 residentDeviceWithIDSIdentifier:](self, "residentDeviceWithIDSIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (void)_addResidentDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDResidentDeviceManagerRoarV3 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDResidentDeviceManagerRoarV3 *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  -[NSMutableSet member:](self->_residentDevices, "member:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_29;
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
  -[HMDResidentDeviceManagerRoarV3 home](v8, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureWithHome:", v11);
  -[HMDResidentDeviceManagerRoarV3 primaryResidentUUID](v8, "primaryResidentUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13)
    objc_msgSend(v4, "setReachable:", 0);
  if (-[HMDResidentDeviceManagerRoarV3 isCurrentDeviceConfirmedPrimaryResident](v8, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    if ((objc_msgSend(v4, "isReachable") & 1) == 0)
    {
      -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](v8, "residentSelectionManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "currentModeType") == 1;

      if (v15)
      {
        -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](v8, "residentSelectionManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "residentIsLocallyReachable:", v4);

        if (v17)
        {
          -[HMDResidentDeviceManagerRoarV3 _updateReachability:forResidentDevice:](v8, "_updateReachability:forResidentDevice:", 1, v4);
          -[HMDResidentDeviceManagerRoarV3 backingStore](v8, "backingStore");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "updateReachabilityForResidents:", v19);

        }
      }
    }
  }
  -[HMDResidentDeviceManagerRoarV3 _updateResidentAvailability:](v8, "_updateResidentAvailability:", 0);
  -[HMDResidentDeviceManagerRoarV3 delegate](v8, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "residentDeviceManagerDidUpdateResidents:", v8);

  -[HMDResidentDeviceManagerRoarV3 _sendResidentDeviceNotificationWithName:forResidentDevice:](v8, "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerAddResidentNotification"), v4);
  objc_msgSend(v11, "reEvaluateHomeHubState");
  objc_msgSend(v11, "evaluateBulletinNotificationsSupported");
  -[HMDResidentDeviceManagerRoarV3 primaryResidentUUID](v8, "primaryResidentUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqual:", v22))
  {

  }
  else
  {
    -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](v8, "primaryResidentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "isCurrentDevice"))
    {

      goto LABEL_19;
    }
    v25 = objc_msgSend(v4, "isEnabled");

    if (!v25)
      goto LABEL_20;
  }
  objc_msgSend(v4, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enableNotificationsForDevices:", v22);
LABEL_19:

LABEL_20:
  objc_msgSend(v4, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "isCurrentDevice"))
  {
    objc_msgSend(v11, "homeManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "currentAccessorySetupMetricDispatcher");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x227676638](objc_msgSend(v28, "markSetupBeginStage:error:", 14, 0));
    v30 = v8;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "residentSelectionVersion");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v32;
      v43 = 2114;
      v44 = v33;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Current device added as resident to home with resident selection version %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    if (-[HMDResidentDeviceManagerRoarV3 homeSupportsResidentSelection](v30, "homeSupportsResidentSelection"))
    {
      -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](v30, "residentLocationHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "configure");

      -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](v30, "residentLocationHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "residentLocationRawValue");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "unsignedIntegerValue") == 100;

      if (v37)
      {
        -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](v30, "residentLocationHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "requestResidentLocation");

      }
      -[HMDResidentDeviceManagerRoarV3 residentStatusChannelManager](v30, "residentStatusChannelManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addClientWithIdentifier:", CFSTR("resident.device.manager"));

    }
    -[HMDResidentDeviceManagerRoarV3 _setupAsAResident](v30, "_setupAsAResident");

  }
LABEL_29:

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
    -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](self, "primaryResidentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_residentDevices, "containsObject:", v4))
    {
      -[NSMutableSet removeObject:](self->_residentDevices, "removeObject:", v4);
      os_unfair_lock_unlock(&self->_lock);
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__HMDResidentDeviceManagerRoarV3__removeResidentDevice___block_invoke;
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
  HMDResidentDeviceManagerRoarV3 *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[NSMutableSet count](self->_residentDevices, "count");
  v9 = objc_msgSend(v7, "isEqual:", v6);
  -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](self, "primaryResidentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Current primary got removed. There are %lu residents remaining.", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    if (!v10)
      -[HMDResidentDeviceManagerRoarV3 _handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:](v12, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", 0, v7, 0, 0);
  }

}

- (void)_handleInitialTransitionToResidentSelectionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  HMDResidentDeviceManagerRoarV3 *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HMDResidentStatusChannel *statusChannel;
  void *v17;
  HMDResidentStatusChannelManager *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HMDResidentStatusChannelManager *residentStatusChannelManager;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  HMDResidentDeviceManagerRoarV3 *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, void *);
  void *v49;
  HMDResidentDeviceManagerRoarV3 *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[HMDResidentDeviceManagerRoarV3 configuredStatusKitForResidentSelection](self, "configuredStatusKitForResidentSelection");
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Handling initial transition to resident selection - already configured, ignoring", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
LABEL_11:
    v45 = _Block_copy(v4);
    v31 = v45;
    if (v45)
      (*((void (**)(void *, _QWORD))v45 + 2))(v45, 0);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Handling initial transition to resident selection", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDResidentDeviceManagerRoarV3 setConfiguredStatusKitForResidentSelection:](v8, "setConfiguredStatusKitForResidentSelection:", 1);
  -[HMDResidentDeviceManagerRoarV3 dataSource](v8, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 home](v8, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createResidentStatusChannelForHome:queue:", v14, v8->_queue);
  v15 = objc_claimAutoreleasedReturnValue();
  statusChannel = v8->_statusChannel;
  v8->_statusChannel = (HMDResidentStatusChannel *)v15;

  -[HMDResidentDeviceManagerRoarV3 statusChannel](v8, "statusChannel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:", v8);

  v18 = [HMDResidentStatusChannelManager alloc];
  -[HMDResidentDeviceManagerRoarV3 statusChannel](v8, "statusChannel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 queue](v8, "queue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 idsServerBag](v8, "idsServerBag");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMDResidentStatusChannelManager initWithResidentStatusChannel:queue:idsServerBag:](v18, "initWithResidentStatusChannel:queue:idsServerBag:", v19, v20, v21);
  residentStatusChannelManager = v8->_residentStatusChannelManager;
  v8->_residentStatusChannelManager = (HMDResidentStatusChannelManager *)v22;

  -[HMDResidentDeviceManagerRoarV3 residentStatusChannelManager](v8, "residentStatusChannelManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 statusChannel](v8, "statusChannel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setManager:", v24);

  -[HMDResidentDeviceManagerRoarV3 residentStatusChannelManager](v8, "residentStatusChannelManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "configure");

  if (!-[HMDResidentDeviceManagerRoarV3 isActingAsResident](v8, "isActingAsResident"))
    goto LABEL_11;
  -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](v8, "residentLocationHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "configure");

  -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](v8, "residentLocationHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "requestResidentLocation");

  v29 = objc_alloc(MEMORY[0x24BE3F168]);
  -[HMDResidentDeviceManagerRoarV3 queue](v8, "queue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithQueue:", v30);

  v32 = -[HMDResidentDeviceManagerRoarV3 _statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds](v8, "_statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds");
  v34 = v33;
  v35 = (void *)MEMORY[0x227676638](v32);
  v36 = v8;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v38;
    v56 = 2048;
    v57 = v34;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Setting timeout of %f for initial connected to status kit future", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v35);
  -[HMDResidentDeviceManagerRoarV3 residentStatusChannel](v36, "residentStatusChannel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "initialConnectedToStatusKitFuture");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "timeout:", v34);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = MEMORY[0x24BDAC760];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __92__HMDResidentDeviceManagerRoarV3__handleInitialTransitionToResidentSelectionWithCompletion___block_invoke;
  v52[3] = &unk_24E795358;
  v52[4] = v36;
  v53 = v4;
  v46 = v42;
  v47 = 3221225472;
  v48 = __92__HMDResidentDeviceManagerRoarV3__handleInitialTransitionToResidentSelectionWithCompletion___block_invoke_195;
  v49 = &unk_24E795380;
  v50 = v36;
  v51 = v53;
  v43 = (id)objc_msgSend(v41, "inContext:then:orRecover:", v31, v52, &v46);
  -[HMDResidentDeviceManagerRoarV3 residentStatusChannelManager](v36, "residentStatusChannelManager", v46, v47, v48, v49, v50);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addClientWithIdentifier:", CFSTR("resident.device.manager"));

LABEL_13:
}

- (void)_stopActingAsResidentViaStatusKit
{
  void *v3;
  HMDResidentDeviceManagerRoarV3 *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping acting as a resident via StatusKit", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentDeviceManagerRoarV3 statusChannel](v4, "statusChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopPublishingAsResident");

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
  v7[2] = __55__HMDResidentDeviceManagerRoarV3_removeResidentDevice___block_invoke;
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
  block[2] = __60__HMDResidentDeviceManagerRoarV3_updateResidentAvailability__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateResidentAvailability:(BOOL)a3
{
  uint64_t v3;
  void *v5;

  LODWORD(v3) = a3;
  -[HMDResidentDeviceManagerRoarV3 availableResidentDevices](self, "availableResidentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v3 = 1;
  else
    v3 = v3;

  -[HMDResidentDeviceManagerRoarV3 setResidentAvailable:](self, "setResidentAvailable:", v3);
}

- (BOOL)isResidentAvailable
{
  HMDResidentDeviceManagerRoarV3 *v2;
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

  -[HMDResidentDeviceManagerRoarV3 residentDevicesSet](self, "residentDevicesSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEmpty");

  if (!v4)
    return 1;
  -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
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
  HMDResidentDeviceManagerRoarV3 *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDResidentDeviceManagerRoarV3 *v15;
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
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
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
        -[HMDResidentDeviceManagerRoarV3 primaryResidentUUID](self, "primaryResidentUUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          -[HMDResidentDeviceManagerRoarV3 primaryResidentUUID](self, "primaryResidentUUID");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDResidentDeviceManagerRoarV3 residentWithUUID:](self, "residentWithUUID:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            -[HMDResidentDeviceManagerRoarV3 notifyUpdatedPrimaryResident:previousPrimaryResident:](self, "notifyUpdatedPrimaryResident:previousPrimaryResident:", v8, 0);
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
              -[HMDResidentDeviceManagerRoarV3 primaryResidentUUID](v15, "primaryResidentUUID");
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
        -[HMDResidentDeviceManagerRoarV3 _discoverPrimaryResidentForRequester:](self, "_discoverPrimaryResidentForRequester:", 0);
      }
      else
      {
        -[HMDResidentDeviceManagerRoarV3 primaryDiscoveryManager](self, "primaryDiscoveryManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancel");

      }
    }
    -[HMDResidentDeviceManagerRoarV3 notifyResidentAvailable:](self, "notifyResidentAvailable:", v3);
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
  HMDResidentDeviceManagerRoarV3 *v9;
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
    -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](v9, "primaryResidentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 _notifyUpdatedGenerationIDWithPrimaryResident:](v9, "_notifyUpdatedGenerationIDWithPrimaryResident:", v12);

  }
  return v7 ^ 1;
}

- (NSDate)primaryResidentSelectionTimestamp
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_primaryResidentSelectionTimestamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_updatePrimaryResidentSelectionTimestamp:(id)a3
{
  NSDate *v4;
  NSDate *primaryResidentSelectionTimestamp;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  primaryResidentSelectionTimestamp = self->_primaryResidentSelectionTimestamp;
  self->_primaryResidentSelectionTimestamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isResidentSupported
{
  HMDResidentDeviceManagerRoarV3 *v2;
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
  HMDResidentDeviceManagerRoarV3 *v6;
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
  -[HMDResidentDeviceManagerRoarV3 notificationCenter](v6, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 appleAccountManager](v6, "appleAccountManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v10, "removeObserver:name:object:", v6, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v11);
  }
  else
  {
    objc_msgSend(v10, "removeObserver:name:object:", v6, CFSTR("HMDAppleAccountManagerResolved"), v11);

    -[HMDResidentDeviceManagerRoarV3 notificationCenter](v6, "notificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 appleAccountManager](v6, "appleAccountManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", v6, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v13);

    -[HMDResidentDeviceManagerRoarV3 notificationCenter](v6, "notificationCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 appleAccountManager](v6, "appleAccountManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, sel_accountOrDeviceDidUpdate_, CFSTR("HMDAppleAccountManagerResolved"), v15);

    -[HMDResidentDeviceManagerRoarV3 notificationCenter](v6, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 appleAccountManager](v6, "appleAccountManager");
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
  v7[2] = __59__HMDResidentDeviceManagerRoarV3_accountOrDeviceDidUpdate___block_invoke;
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
  v4[2] = __58__HMDResidentDeviceManagerRoarV3_notifyResidentAvailable___block_invoke;
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
  HMDResidentDeviceManagerRoarV3 *v9;
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
  -[HMDResidentDeviceManagerRoarV3 residentDevices](self, "residentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__HMDResidentDeviceManagerRoarV3_notifyClientsOfUpdatedResidentDevice___block_invoke;
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

- (void)_notifyUserPreferredResidentReachability:(id)a3 previousPrimaryResident:(id)a4
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
  block[2] = __99__HMDResidentDeviceManagerRoarV3__notifyUserPreferredResidentReachability_previousPrimaryResident___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

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
  block[2] = __87__HMDResidentDeviceManagerRoarV3_notifyUpdatedPrimaryResident_previousPrimaryResident___block_invoke;
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
  -[HMDResidentDeviceManagerRoarV3 _sendResidentDeviceNotificationWithName:forResidentDevice:](self, "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentGenerationIDNotification"), v5);

}

- (void)_sendResidentDeviceNotificationWithName:(id)a3 forResidentDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HMDResidentDeviceManagerRoarV3 *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDResidentDeviceManagerRoarV3 *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("HMDResidentDeviceManagerHomeUUIDNotificationKey"));

  if (objc_msgSend(v6, "isEqual:", CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification")))
  {
    if (objc_msgSend(v7, "isCurrentDevice"))
    {
      -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "currentModeType");

      if (v12 != 1)
      {
        -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](self, "residentLocationHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "residentLocationRawValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          StringFromHMDResidentLocation(objc_msgSend(v14, "unsignedIntegerValue"));
          v25 = v15;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v27 = v18;
          v28 = 2112;
          v29 = v19;
          v30 = 2112;
          v31 = CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification");
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Including current resident location: %@ in: %@", buf, 0x20u);

          v15 = v25;
        }

        objc_autoreleasePoolPop(v15);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("HMDResidentDeviceManagerResidentLocationKey"));

      }
    }
  }
  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v23;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Notifying %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  -[HMDResidentDeviceManagerRoarV3 notificationCenter](v21, "notificationCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "postNotificationName:object:userInfo:", v6, v21, v8);

}

- (void)_handlePrimaryResident:(id)a3 isReachable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  HMDResidentDeviceManagerRoarV3 *v9;
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
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
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
    -[HMDResidentDeviceManagerRoarV3 _updateReachability:forResidentDevice:](v9, "_updateReachability:forResidentDevice:", 1, v6);
    -[HMDResidentDeviceManagerRoarV3 _updateReachabilityFromWorkingStoreExceptResident:](v9, "_updateReachabilityFromWorkingStoreExceptResident:", v6);
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
    -[HMDResidentDeviceManagerRoarV3 residentDevices](v9, "residentDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 _updateReachability:forResidentDevices:](v9, "_updateReachability:forResidentDevices:", 0, v14);

    -[HMDResidentDeviceManagerRoarV3 _discoverPrimaryResidentForRequester:](v9, "_discoverPrimaryResidentForRequester:", 0);
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
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__HMDResidentDeviceManagerRoarV3_discoverPrimaryResidentForRequester___block_invoke;
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
  HMDResidentDeviceManagerRoarV3 *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDResidentDeviceManagerRoarV3 *v12;
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
  -[HMDResidentDeviceManagerRoarV3 queue](v6, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (!-[HMDResidentDeviceManagerRoarV3 isResidentSupported](v6, "isResidentSupported"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    v12 = v6;
    v13 = 0;
    v14 = v10;
    goto LABEL_7;
  }
  -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](v6, "primaryResidentDevice");
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
    -[HMDResidentDeviceManagerRoarV3 primaryDiscoveryRequesters](v6, "primaryDiscoveryRequesters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v4);

  }
  -[HMDResidentDeviceManagerRoarV3 primaryDiscoveryManager](v6, "primaryDiscoveryManager");
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
  HMDResidentDeviceManagerRoarV3 *v13;
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
    -[HMDResidentDeviceManagerRoarV3 residentDevices](self, "residentDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __94__HMDResidentDeviceManagerRoarV3_handlePrimaryResidentDiscovered_primaryResidentGenerationID___block_invoke;
    v16[3] = &unk_24E7953A8;
    v9 = v6;
    v17 = v9;
    v10 = objc_msgSend(v8, "na_any:", v16);

    if ((v10 & 1) == 0)
      -[HMDResidentDeviceManagerRoarV3 _addResidentDevice:](self, "_addResidentDevice:", v9);

    -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](self, "primaryResidentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 _handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:](self, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", v9, v11, v7, 4);

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
  HMDResidentDeviceManagerRoarV3 *v6;
  NSObject *v7;
  void *v8;
  HMDResidentDeviceManagerV3XPCDiscoveryRequester *v9;
  id v10;
  HMDResidentDeviceManagerV3XPCDiscoveryRequester *v11;
  _QWORD v12[4];
  HMDResidentDeviceManagerV3XPCDiscoveryRequester *v13;
  HMDResidentDeviceManagerRoarV3 *v14;
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
  v9 = objc_alloc_init(HMDResidentDeviceManagerV3XPCDiscoveryRequester);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__HMDResidentDeviceManagerRoarV3__handlePrimaryResidentDiscoveryXPCRequest___block_invoke;
  v12[3] = &unk_24E7953D0;
  v13 = v9;
  v14 = v6;
  v15 = v4;
  v10 = v4;
  v11 = v9;
  -[HMDResidentDeviceManagerV3XPCDiscoveryRequester setBlock:](v11, "setBlock:", v12);
  -[HMDResidentDeviceManagerRoarV3 _discoverPrimaryResidentForRequester:](v6, "_discoverPrimaryResidentForRequester:", v11);

}

- (void)_handlePrimaryResidentDiscoveryRequest:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  HMDResidentDeviceManagerRoarV3 *v7;
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
  v5 = -[HMDResidentDeviceManagerRoarV3 isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident");
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
    -[HMDResidentDeviceManagerRoarV3 currentResidentDevice](v7, "currentResidentDevice", CFSTR("uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    -[HMDResidentDeviceManagerRoarV3 primaryResidentGenerationID](v7, "primaryResidentGenerationID");
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
  HMDResidentDeviceManagerRoarV3 *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  HMDResidentDeviceManagerRoarV3 *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMDResidentDeviceManagerRoarV3 *v33;
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
    -[HMDResidentDeviceManagerRoarV3 residentDevices](self, "residentDevices");
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

- (void)handleSetPreferredResidentSelectionMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMDResidentDeviceManagerRoarV3 *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMDResidentDeviceManagerRoarV3 *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", *MEMORY[0x24BDD6240]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hmf_BOOLForKey:", *MEMORY[0x24BDD6248]);

  v9 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Going to update the selection mode to manual", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDResidentDeviceManagerRoarV3 residentDevices](v11, "residentDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __77__HMDResidentDeviceManagerRoarV3_handleSetPreferredResidentSelectionMessage___block_invoke;
    v25[3] = &unk_24E7953A8;
    v26 = v6;
    objc_msgSend(v14, "na_firstObjectPassingTest:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 2;
  }
  else
  {
    v15 = 0;
    v16 = 3;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v20;
    v29 = 2112;
    v30 = v15;
    v31 = 2048;
    v32 = v16;
    v33 = 1024;
    v34 = v8;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Handling request to set preferred resident to: %@, in mode: %lu, requireAutoUpdate: %{BOOL}d", buf, 0x26u);

    v9 = MEMORY[0x24BDAC760];
  }

  objc_autoreleasePoolPop(v17);
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](v18, "residentSelectionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __77__HMDResidentDeviceManagerRoarV3_handleSetPreferredResidentSelectionMessage___block_invoke_208;
  v23[3] = &unk_24E79B300;
  v24 = v4;
  v22 = v4;
  objc_msgSend(v21, "performSelectionInMode:preferredPrimaryResident:requireAutoUpdate:reason:completion:", v16, v15, v8, 7, v23);

}

- (void)handleCurrentDeviceChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentDeviceManagerRoarV3 *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDResidentDeviceManagerRoarV3_handleCurrentDeviceChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)foundNewPrimaryResident:(id)a3 generationID:(id)a4 selectionTimestamp:(id)a5 changeSource:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc(MEMORY[0x24BE3F168]);
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithQueue:", v14);

  v16 = (void *)MEMORY[0x24BE3F180];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __103__HMDResidentDeviceManagerRoarV3_foundNewPrimaryResident_generationID_selectionTimestamp_changeSource___block_invoke;
  v22[3] = &unk_24E7953F8;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26 = a6;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v16, "inContext:perform:", v15, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)reAssertAsTheCurrentPrimaryResident
{
  void *v3;
  char v4;
  void *v5;
  HMDResidentDeviceManagerRoarV3 *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](self, "primaryResidentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentDevice");

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Reasserting ourselves as the current primary resident", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](v6, "primaryResidentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 _sendResidentDeviceNotificationWithName:forResidentDevice:](v6, "_sendResidentDeviceNotificationWithName:forResidentDevice:", CFSTR("HMDResidentDeviceManagerReassertAsCurrentPrimaryNotification"), v10);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Ignoring the request to reassert ourselves as the current primary resident", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
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
  block[2] = __60__HMDResidentDeviceManagerRoarV3_sawGenerationID_forDevice___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDResidentDeviceManagerRoarV3 *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDResidentDeviceManagerRoarV3 residentDeviceForDevice:](self, "residentDeviceForDevice:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDResidentDeviceManagerRoarV3 isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Request for external update of the primary resident to: %{public}@ received while we are the primary", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "allowExternalUpdateOfPrimaryResidentTo:selectionTimestamp:", v8, v7);

  return v15;
}

- (void)electResidentDevice:(unint64_t)a3
{
  void *v4;
  void *v6;
  HMDResidentDeviceManagerRoarV3 *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 == 7)
  {
    if (-[HMDResidentDeviceManagerRoarV3 isActingAsResident](self, "isActingAsResident"))
    {
      -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __54__HMDResidentDeviceManagerRoarV3_electResidentDevice___block_invoke;
      v12[3] = &unk_24E79B300;
      v12[4] = self;
      objc_msgSend(v4, "performSelectionInMode:preferredPrimaryResident:requireAutoUpdate:reason:completion:", 1, 0, 0, 7, v12);

      return;
    }
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@SetPreferredPrimary - This device is not an acting resident, returning from electResidentDevice", buf, 0xCu);

    }
  }
  else
  {
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
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v6);
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
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __131__HMDResidentDeviceManagerRoarV3_discoveryManager_didCompleteDiscoveryWithPrimaryResidentDevice_primaryResidentGenerationID_error___block_invoke;
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
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__HMDResidentDeviceManagerRoarV3_discoveryManager_didCompleteInitialDiscoveryAttemptWithError___block_invoke;
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
  if (!-[HMDResidentDeviceManagerRoarV3 isActingAsResident](self, "isActingAsResident"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__HMDResidentDeviceManagerRoarV3_modernTransportDeviceReachabilityObserverDidUpdate_isReachable___block_invoke;
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
  -[HMDResidentDeviceManagerRoarV3 _updateResidentIDSReachability:withUpdatedDevice:](self, "_updateResidentIDSReachability:withUpdatedDevice:", 1, v4);

}

- (void)_handleRemoteDeviceIsNotReachable:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 _updateResidentIDSReachability:withUpdatedDevice:](self, "_updateResidentIDSReachability:withUpdatedDevice:", 0, v4);

}

- (void)_handleResidentSelectionVersionDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__HMDResidentDeviceManagerRoarV3__handleResidentSelectionVersionDidChange___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleDataReadyAfterBecomingPrimaryNotification:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleHomeDataReadyAfterBecomingPrimary:", v4);

}

- (void)_setResident:(id)a3 reachableOverIDS:(BOOL)a4 andNotify:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  int v9;
  void *v10;
  HMDResidentDeviceManagerRoarV3 *v11;
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
      -[HMDResidentDeviceManagerRoarV3 notifyClientsOfUpdatedResidentDevice:](v11, "notifyClientsOfUpdatedResidentDevice:", v8);
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
  if (!-[HMDResidentDeviceManagerRoarV3 isActingAsResident](self, "isActingAsResident"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__HMDResidentDeviceManagerRoarV3__updateResidentIDSReachability_withUpdatedDevice___block_invoke;
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
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMDResidentDeviceManagerRoarV3 *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char *v20;
  const char *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "currentModeType") == 3)
  {

  }
  else
  {
    -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "currentModeType");

    if (v9 != 2)
      goto LABEL_7;
  }
  if (-[HMDResidentDeviceManagerRoarV3 isActingAsResident](self, "isActingAsResident"))
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Running in selection mode on resident in home, not updating reachability to %@ for resident %@", (uint8_t *)&v22, 0x20u);

LABEL_15:
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_7:
  v16 = objc_msgSend(v6, "isReachable");
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (v16 == v4)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = "un";
      v22 = 138543874;
      v23 = v13;
      if (v4)
        v21 = "";
      v24 = 2112;
      v25 = v6;
      v26 = 2080;
      v27 = v21;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Resident %@ is already %sreachable", (uint8_t *)&v22, 0x20u);
      goto LABEL_15;
    }
LABEL_16:

    objc_autoreleasePoolPop(v10);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v20 = (char *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    v26 = 2112;
    v27 = v20;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Setting reachability to %@ for resident %@", (uint8_t *)&v22, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v6, "setReachable:", v4);
  -[HMDResidentDeviceManagerRoarV3 notifyClientsOfUpdatedResidentDevice:](v11, "notifyClientsOfUpdatedResidentDevice:", v6);
LABEL_17:

}

- (void)_refreshAllResidentsReachabilityFromStatusKit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDResidentDeviceManagerRoarV3 residentStatusChannel](self, "residentStatusChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentResidentStatuses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 residentDevicesSet](self, "residentDevicesSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 _residentsFromResidentStatuses:residentDevices:](self, "_residentsFromResidentStatuses:residentDevices:", v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDResidentDeviceManagerRoarV3 _updateResidentReachabilityFromReachableResidents:](self, "_updateResidentReachabilityFromReachableResidents:", v6);
}

- (void)_updateResidentReachabilityFromReachableResidents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  -[HMDResidentDeviceManagerRoarV3 residentDevicesSet](self, "residentDevicesSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 _updateReachabilityForResidentDevices:reachableResidents:](self, "_updateReachabilityForResidentDevices:reachableResidents:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__HMDResidentDeviceManagerRoarV3__updateResidentReachabilityFromReachableResidents___block_invoke;
  v8[3] = &unk_24E795420;
  v8[4] = self;
  objc_msgSend(v5, "na_each:", v8);
  if (-[HMDResidentDeviceManagerRoarV3 isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident"))
  {
    -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateReachabilityForResidents:", v7);

  }
}

- (id)_updateReachabilityForResidentDevices:(id)a3 reachableResidents:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  HMDResidentDeviceManagerRoarV3 *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = (void *)MEMORY[0x24BDBCEF0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __91__HMDResidentDeviceManagerRoarV3__updateReachabilityForResidentDevices_reachableResidents___block_invoke;
  v22[3] = &unk_24E797B98;
  v22[4] = self;
  v11 = v9;
  v23 = v11;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v22);
  objc_msgSend(v8, "hmf_removedObjectsFromSet:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v10;
  v17 = 3221225472;
  v18 = __91__HMDResidentDeviceManagerRoarV3__updateReachabilityForResidentDevices_reachableResidents___block_invoke_217;
  v19 = &unk_24E797B98;
  v20 = self;
  v21 = v11;
  v13 = v11;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v16);
  v14 = (void *)objc_msgSend(v13, "copy", v16, v17, v18, v19, v20);

  return v14;
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
  -[HMDResidentDeviceManagerRoarV3 messageTargetUUID](self, "messageTargetUUID");
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
  -[HMDResidentDeviceManagerRoarV3 residentDevices](self, "residentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Resident Devices = %@"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v9;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDResidentDeviceManagerRoarV3 descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HMDResidentDeviceManagerRoarV3 descriptionWithPointer:](self, "descriptionWithPointer:", 0);
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v35, "uuid");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](self, "primaryResidentDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 isResidentAvailable](self, "isResidentAvailable");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 isResidentSupported](self, "isResidentSupported");
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 homeSupportsResidentSelection](self, "homeSupportsResidentSelection");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("home: %@, primaryResidentDevice: %@ isResidentAvailable: %@, isResidentSupported: %@, supportsResidentSelection: %@"), v4, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("State"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[HMDResidentDeviceManagerRoarV3 residentDevices](self, "residentDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v17), "dumpState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v15);
  }

  objc_msgSend(v37, "setObject:forKeyedSubscript:", v12, CFSTR("Residents"));
  -[HMDResidentDeviceManagerRoarV3 messageDispatcher](self, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "secureRemoteTransport");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deviceMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dumpState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v22, CFSTR("Remote Device Monitor"));

  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dumpState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v24, CFSTR("Primary.Selection"));

  -[HMDResidentDeviceManagerRoarV3 electorsPreferredResidentsList](self, "electorsPreferredResidentsList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "modifiedTimestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localTimeDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v27, CFSTR("Merged Elector's Preferred Residents Timestamp"));

  -[HMDResidentDeviceManagerRoarV3 autoSelectedPreferredResidents](self, "autoSelectedPreferredResidents");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "na_map:", &__block_literal_global_240_223658);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v29, CFSTR("Merged Elector's Preferred Residents"));

  -[HMDResidentDeviceManagerRoarV3 statusChannel](self, "statusChannel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dumpState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v31, CFSTR("Status Channel"));

  return v37;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (void)channel:(id)a3 didObserveDevicesAdded:(id)a4 lost:(id)a5 updated:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMDResidentDeviceManagerRoarV3 *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  HMDResidentSelectionStatusKit *v22;
  void *v23;
  void *v24;
  HMDResidentSelectionStatusKit *v25;
  void *v26;
  HMDResidentDeviceManagerRoarV3 *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "currentModeType");

  if (v16 == 1)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v20;
      v21 = "%{public}@Ignoring Resident Status Channel update - in Coordination selection mode";
LABEL_10:
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v34, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v22 = [HMDResidentSelectionStatusKit alloc];
  -[HMDResidentDeviceManagerRoarV3 residentStatusChannel](self, "residentStatusChannel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentResidentStatuses");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HMDResidentSelectionStatusKit initWithWithContext:residentStatusList:](v22, "initWithWithContext:residentStatusList:", self, v24);
  -[HMDResidentDeviceManagerRoarV3 setPresentResidentsStatuses:](self, "setPresentResidentsStatuses:", v25);

  v26 = (void *)MEMORY[0x227676638]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138544130;
    v35 = v29;
    v36 = 2112;
    v37 = v11;
    v38 = 2112;
    v39 = v12;
    v40 = 2112;
    v41 = v13;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Status channel Observed devices added %@ \nlost %@ \nupdated %@", (uint8_t *)&v34, 0x2Au);

  }
  objc_autoreleasePoolPop(v26);
  -[HMDResidentDeviceManagerRoarV3 _refreshAllResidentsReachabilityFromStatusKit](v27, "_refreshAllResidentsReachabilityFromStatusKit");
  if (!-[HMDResidentDeviceManagerRoarV3 isActingAsResident](v27, "isActingAsResident"))
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v27;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v20;
      v21 = "%{public}@Ignoring Resident Status Channel update - not acting as a resident";
      goto LABEL_10;
    }
LABEL_11:

    objc_autoreleasePoolPop(v17);
    goto LABEL_12;
  }
  objc_msgSend(v11, "na_map:", &__block_literal_global_249_223646);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_map:", &__block_literal_global_250_223647);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](v27, "residentSelectionManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 presentResidentsStatuses](v27, "presentResidentsStatuses");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "didUpdateResidentStatus:residentsFound:residentsLost:", v33, v30, v31);

LABEL_12:
}

- (void)channel:(id)a3 didObservePrimaryResidentChange:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDResidentDeviceManagerRoarV3 *v10;
  NSObject *v11;
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
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "idsIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "generationID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v12;
      v27 = 2114;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Did observed primary resident from status channel: %{public}@, generation: %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v7, "idsIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "idsDestination");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceAddress addressWithIDSIdentifier:idsDestination:](HMDDeviceAddress, "addressWithIDSIdentifier:idsDestination:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDResidentDeviceManagerRoarV3 appleAccountManager](v10, "appleAccountManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accountRegistry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deviceForAddress:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "generationID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "selectionTimestamp");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMDResidentDeviceManagerRoarV3 foundNewPrimaryResident:generationID:selectionTimestamp:changeSource:](v10, "foundNewPrimaryResident:generationID:selectionTimestamp:changeSource:", v20, v21, v23, 7);

  }
}

- (id)_residentsFromResidentStatuses:(id)a3 residentDevices:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__HMDResidentDeviceManagerRoarV3__residentsFromResidentStatuses_residentDevices___block_invoke;
  v9[3] = &unk_24E7954E8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_handleCloudZoneReadyNotification:(id)a3
{
  id v5;
  void *v6;
  HMDResidentDeviceManagerRoarV3 *v7;
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
  HMDResidentDeviceManagerRoarV3 *v10;
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

  -[HMDResidentDeviceManagerRoarV3 ourSelf](self, "ourSelf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)isOwnerUser
{
  void *v2;
  char v3;

  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
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
  HMDResidentDeviceManagerRoarV3 *v8;
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
  -[HMDResidentDeviceManagerRoarV3 residentDevicesSet](self, "residentDevicesSet");
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
  -[HMDResidentDeviceManagerRoarV3 queue](v8, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithQueue:", v12);

  -[HMDResidentDeviceManagerRoarV3 backingStore](v8, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "residentsRequiringReachabilityUpdate:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__HMDResidentDeviceManagerRoarV3__updateReachabilityFromWorkingStoreExceptResident___block_invoke;
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
        -[HMDResidentDeviceManagerRoarV3 _updateReachability:forResidentDevice:](self, "_updateReachability:forResidentDevice:", v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_submitLogeventForPrimaryResident:(id)a3 previousPrimaryResident:(id)a4 changeSource:(unint64_t)a5
{
  id v8;
  void *v9;
  HMDResidentDeviceManagerRoarV3 *v10;
  NSObject *v11;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDResidentDeviceManagerRoarV3 *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  _BOOL4 v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  unsigned int v67;
  void *v68;
  void *v69;
  HMDResidentSelectionPrimaryResidentChangedLogEvent *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  HMDResidentSelectionPrimaryResidentChangedLogEvent *v76;
  void *v77;
  HMDResidentDeviceManagerRoarV3 *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  id v85;
  HMDResidentDeviceManagerRoarV3 *v86;
  void *v87;
  id v88;
  id obj;
  void *v90;
  uint64_t v91;
  _BOOL4 v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  unsigned int v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE buf[24];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v88 = a3;
  v8 = a4;
  if (!v8 && a5 != 6)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Skip not a resident selection primary changed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    goto LABEL_64;
  }
  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 residentSelectionInfo](self, "residentSelectionInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minimumHomeKitVersionForResidentSelection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "version");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v17, "isAtLeastVersion:", v15) ^ 1;

  }
  else
  {
    v84 = 0;
  }
  v86 = self;
  v87 = v13;
  if (objc_msgSend(v13, "currentModeType") == 2)
  {
    -[HMDResidentDeviceManagerRoarV3 currentResidentDevice](self, "currentResidentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "idsIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredResidentIDSIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v20, "isEqual:", v21);

    objc_msgSend(v88, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "idsIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredResidentIDSIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    v26 = v24;
  }
  else
  {
    -[HMDResidentDeviceManagerRoarV3 preferredResidentUUIDs](self, "preferredResidentUUIDs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDResidentDeviceManagerRoarV3 currentResidentDevice](self, "currentResidentDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "device");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "idsIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v30, "isEqual:", v22);

    objc_msgSend(v88, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "idsIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v25;
    v26 = v22;
  }
  v82 = objc_msgSend(v25, "isEqual:", v26);

  +[HMDFeaturesDataSource defaultDataSource](HMDFeaturesDataSource, "defaultDataSource");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "uuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "isResidentSelectionEnabledForHomeUUID:", v32))
  {
    v33 = v86;
    v92 = -[HMDResidentDeviceManagerRoarV3 homeSupportsResidentSelection](v86, "homeSupportsResidentSelection");
  }
  else
  {
    v92 = 0;
    v33 = v86;
  }

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  -[HMDResidentDeviceManagerRoarV3 residentDevices](v33, "residentDevices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
  v85 = v8;
  v34 = 0;
  if (!v94)
  {
    v102 = 0;
    v103 = 0;
    v35 = 0;
    v99 = 0;
    v100 = 0;
    v98 = 0;
    goto LABEL_61;
  }
  v102 = 0;
  v103 = 0;
  v35 = 0;
  v99 = 0;
  v100 = 0;
  v98 = 0;
  v90 = v15;
  v91 = *(_QWORD *)v111;
  do
  {
    v36 = 0;
    do
    {
      if (*(_QWORD *)v111 != v91)
        objc_enumerationMutation(obj);
      v101 = v36;
      v37 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v36);
      objc_msgSend(v37, "device");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "productInfo");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "softwareVersion");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      objc_msgSend(v93, "appleMediaAccessories");
      v104 = (id)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
      if (v41)
      {
        v42 = v41;
        v95 = v40;
        v96 = v34;
        v97 = v35;
        v43 = *(_QWORD *)v107;
        while (2)
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v107 != v43)
              objc_enumerationMutation(v104);
            v45 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
            objc_msgSend(v45, "device");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "identifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v37;
            objc_msgSend(v37, "device");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "identifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v47, "isEqual:", v50);

            if (v51)
            {
              objc_msgSend(v45, "softwareVersion");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = v90;
              v34 = v96;
              v35 = v97;
              v37 = v48;
              goto LABEL_30;
            }
            v37 = v48;
          }
          v42 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
          if (v42)
            continue;
          break;
        }
        v15 = v90;
        v34 = v96;
        v35 = v97;
        v40 = v95;
      }
LABEL_30:

      if (v40)
        objc_msgSend(v40, "operatingSystemVersion");
      *(_OWORD *)buf = *MEMORY[0x24BE3EF70];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x24BE3EF70] + 16);
      v52 = HMFOperatingSystemVersionCompare();
      if (v92)
      {
        if (v40)
          objc_msgSend(v40, "operatingSystemVersion");
        *(_OWORD *)buf = *MEMORY[0x24BE3F008];
        *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x24BE3F008] + 16);
        v53 = HMFOperatingSystemVersionCompare() != 1;
        if (v35)
        {
LABEL_38:
          if (!objc_msgSend(v35, "isGreaterThanVersion:", v40))
            goto LABEL_40;
        }
      }
      else
      {
        v53 = 0;
        if (v35)
          goto LABEL_38;
      }
      v54 = v40;

      v35 = v54;
LABEL_40:
      if (v52 == 1)
      {
        if (!v53)
          goto LABEL_54;
        v55 = v99;
        if (v99)
        {
          v56 = v98;
          v57 = v40;
          if (!objc_msgSend(v99, "isGreaterThanVersion:", v40))
            goto LABEL_44;
        }
        else
        {
          v56 = v98;
          v57 = v40;
        }
      }
      else
      {
        v55 = v98;
        if (v98)
        {
          v56 = v40;
          v57 = v99;
          if ((objc_msgSend(v98, "isGreaterThanVersion:", v40) & 1) == 0)
          {
LABEL_44:
            if (!v100)
              goto LABEL_53;
            goto LABEL_52;
          }
        }
        else
        {
          v56 = v40;
          v57 = v99;
        }
      }
      v58 = v40;

      v98 = v56;
      v99 = v57;
      if (!v100)
        goto LABEL_53;
LABEL_52:
      if (objc_msgSend(v100, "isGreaterThanVersion:", v40))
      {
LABEL_53:
        v59 = v40;

        v100 = v59;
      }
LABEL_54:
      if (!v34
        || (objc_msgSend(v37, "device"),
            v60 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v60, "version"),
            v61 = (void *)objc_claimAutoreleasedReturnValue(),
            v62 = objc_msgSend(v61, "isGreaterThanVersion:", v34),
            v61,
            v60,
            v62))
      {
        objc_msgSend(v37, "device");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "version");
        v64 = objc_claimAutoreleasedReturnValue();

        v34 = (void *)v64;
      }
      objc_msgSend(v37, "device");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "version");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "isAtLeastVersion:", v15);

      v102 += v67 ^ 1;
      v103 += v67;

      v36 = v101 + 1;
    }
    while (v101 + 1 != v94);
    v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
  }
  while (v94);
LABEL_61:

  objc_msgSend(v88, "device");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "version");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v69, "isAtLeastVersion:", v34);

  v70 = [HMDResidentSelectionPrimaryResidentChangedLogEvent alloc];
  v71 = objc_msgSend(v88, "isCurrentDevice");
  v72 = objc_msgSend(v87, "currentModeType");
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](v86, "residentSelectionManager");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "primaryChangedReason");
  objc_msgSend(v93, "uuid");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[HMDResidentSelectionPrimaryResidentChangedLogEvent initWithPrimaryResidentDidChange:isElectedDevicePreferred:isCurrentDevicePrimary:isCurrentDevicePreferred:isPreviousPrimaryRev2:isElectedDeviceLatestSWVersionInHome:residentSelectionMode:triggerReason:numResidentsREV3Capable:numResidentsREV3Incompatible:minimumVersionInHome:minimumParticipatingtvOS17Version:minimumParticipatingAllVersion:minimumParticipatingtvOS18Version:homeUUID:](v70, "initWithPrimaryResidentDidChange:isElectedDevicePreferred:isCurrentDevicePrimary:isCurrentDevicePreferred:isPreviousPrimaryRev2:isElectedDeviceLatestSWVersionInHome:residentSelectionMode:triggerReason:numResidentsREV3Capable:numResidentsREV3Incompatible:minimumVersionInHome:minimumParticipatingtvOS17Version:minimumParticipatingAllVersion:minimumParticipatingtvOS18Version:homeUUID:", 1, v82, v71, v83, v84, v105, v72, v74, v103, v102, v35, v99, v100, v98,
          v75);

  v77 = (void *)MEMORY[0x227676638]();
  v78 = v86;
  HMFGetOSLogHandle();
  v79 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v80;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v76;
    _os_log_impl(&dword_2218F0000, v79, OS_LOG_TYPE_INFO, "%{public}@Primary resident changed logEvent: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v77);
  objc_msgSend(v93, "logEventSubmitter");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "submitLogEvent:", v76);

  v8 = v85;
LABEL_64:

}

- (void)_notifyPrimaryResidentChanged:(id)a3 previousPrimaryResident:(id)a4 changeSource:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  HMDResidentDeviceManagerRoarV3 *v18;
  NSObject *v19;
  void *v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  id v24[2];
  id location;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__HMDResidentDeviceManagerRoarV3__notifyPrimaryResidentChanged_previousPrimaryResident_changeSource___block_invoke;
  aBlock[3] = &unk_24E795538;
  objc_copyWeak(v24, &location);
  v10 = v8;
  v22 = v10;
  v11 = v9;
  v23 = v11;
  v24[1] = (id)a5;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[HMDResidentDeviceManagerRoarV3 residentSelectionInfo](self, "residentSelectionInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectionTimestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 primaryResidentSelectionTimestamp](self, "primaryResidentSelectionTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "compare:", v15) == -1;

  if (v16)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@ResidentSelectionInfo is out of date submit the logevent when it is synced", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDResidentDeviceManagerRoarV3 setPendingNotifyPrimaryChanged:](v18, "setPendingNotifyPrimaryChanged:", v12);
  }
  else
  {
    v12[2](v12);
  }

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

}

- (void)_handleUpdatedPrimaryResidentDevice:(id)a3 previousPrimaryResident:(id)a4 generationID:(id)a5 changeSource:(unint64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  HMDResidentDeviceManagerRoarV3 *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDResidentDeviceManagerRoarV3 *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  HMDResidentDeviceManagerRoarV3 *v28;
  NSObject *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSUUID *primaryResidentUUID;
  char v36;
  void *v37;
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
  uint64_t v50;
  void *v51;
  HMDResidentDeviceManagerRoarV3 *v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *logger;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  HMDResidentDeviceManagerRoarV3 *v68;
  NSObject *v69;
  void *v70;
  __CFString *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id obj;
  id obja;
  char v78;
  int v79;
  __CFString *v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  const __CFString *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  obj = a5;
  v81 = (__CFString *)a5;
  v11 = objc_msgSend(v9, "isCurrentDevice");
  v79 = v11;
  if (v9)
    v12 = v11;
  else
    v12 = 1;
  if (v9)
  {
    v11 = objc_msgSend(v9, "isReachable", a5);
    v13 = v11 ^ 1;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13 ^ 1;
  if (!v10)
    v14 = 0;
  if (((v14 | v12) & 1) == 0)
    v11 = -[HMDResidentDeviceManagerRoarV3 _updateReachabilityFromWorkingStoreExceptResident:](self, "_updateReachabilityFromWorkingStoreExceptResident:", v9);
  v78 = v12;
  if (v13)
  {
    v15 = (void *)MEMORY[0x227676638](v11);
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Marking new primary resident as reachable", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDResidentDeviceManagerRoarV3 _updateReachability:forResidentDevice:](v16, "_updateReachability:forResidentDevice:", 1, v9);
  }
  else if (!v9)
  {
    v19 = (void *)MEMORY[0x227676638](v11);
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@There is no primary resident. Marking all residents as unreachable", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDResidentDeviceManagerRoarV3 residentDevices](v20, "residentDevices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 _updateReachability:forResidentDevices:](v20, "_updateReachability:forResidentDevices:", 0, v23);

  }
  objc_msgSend(v10, "identifier", obj);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = HMFEqualObjects();

  if ((v26 & 1) != 0)
  {
    -[HMDResidentDeviceManagerRoarV3 _updatePrimaryResidentGenerationID:](self, "_updatePrimaryResidentGenerationID:", v81);
  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6 - 1 > 6)
        v31 = CFSTR("resident removed");
      else
        v31 = off_24E795558[a6 - 1];
      objc_msgSend(v10, "shortDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v83 = v30;
      v84 = 2112;
      v85 = v31;
      v86 = 2112;
      v87 = v32;
      v88 = 2112;
      v89 = v33;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Updating primary resident due to %@, from %@ to %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v27);
    os_unfair_lock_lock_with_options();
    objc_msgSend(v9, "identifier");
    v34 = objc_claimAutoreleasedReturnValue();
    primaryResidentUUID = v28->_primaryResidentUUID;
    v28->_primaryResidentUUID = (NSUUID *)v34;

    v36 = HMFEqualObjects();
    if ((v36 & 1) == 0)
      objc_storeStrong((id *)&v28->_primaryResidentGenerationID, obja);
    os_unfair_lock_unlock(&v28->_lock);
    if (!-[HMDResidentDeviceManagerRoarV3 isActingAsResident](v28, "isActingAsResident"))
    {
      if (v10)
      {
        -[HMDResidentDeviceManagerRoarV3 reachabilityObserver](v28, "reachabilityObserver");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "device");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "deviceAddress");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "removeListener:forDeviceAddress:", v28, v39);

        -[HMDResidentDeviceManagerRoarV3 deviceMonitor](v28, "deviceMonitor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "device");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stopMonitoringDevice:forClient:", v41, v28);

      }
      if (v9)
      {
        -[HMDResidentDeviceManagerRoarV3 reachabilityObserver](v28, "reachabilityObserver");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "device");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "deviceAddress");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addListener:forDeviceAddress:", v28, v44);

        -[HMDResidentDeviceManagerRoarV3 deviceMonitor](v28, "deviceMonitor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "device");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "startMonitoringDevice:withInitialReachability:forClient:", v46, 0, v28);

        -[HMDResidentDeviceManagerRoarV3 deviceMonitor](v28, "deviceMonitor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "unreachableDevices");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "device");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDResidentDeviceManagerRoarV3 _setResident:reachableOverIDS:andNotify:](v28, "_setResident:reachableOverIDS:andNotify:", v9, objc_msgSend(v48, "containsObject:", v49) ^ 1, 0);

      }
    }
    -[HMDResidentDeviceManagerRoarV3 _updatePrimaryResidentTransactionWithPrimaryResidentDevice:](v28, "_updatePrimaryResidentTransactionWithPrimaryResidentDevice:", v9);
    if ((-[HMDResidentDeviceManagerRoarV3 homeSupportsResidentSelection](v28, "homeSupportsResidentSelection") & v79) == 1)
      -[HMDResidentDeviceManagerRoarV3 _refreshAllResidentsReachabilityFromStatusKit](v28, "_refreshAllResidentsReachabilityFromStatusKit");
    v50 = -[HMDResidentDeviceManagerRoarV3 notifyUpdatedPrimaryResident:previousPrimaryResident:](v28, "notifyUpdatedPrimaryResident:previousPrimaryResident:", v9, v10);
    if ((v36 & 1) == 0)
    {
      v51 = (void *)MEMORY[0x227676638](v50);
      v52 = v28;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = os_log_type_enabled(v53, OS_LOG_TYPE_INFO);
      if (v79)
      {
        if (v54)
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v83 = v55;
          v84 = 2114;
          v85 = v81;
          _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Using newly generated primaryResidentGenerationID = %{public}@", buf, 0x16u);

        }
      }
      else if (v54)
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v56;
        v84 = 2114;
        v85 = v81;
        _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Updating primaryResidentGenerationID = %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v51);
    }
    if ((v78 & 1) != 0)
      -[HMDResidentDeviceManagerRoarV3 _teardownSessionWithPrimaryResidentDevice](v28, "_teardownSessionWithPrimaryResidentDevice");
    else
      -[HMDResidentDeviceManagerRoarV3 _setupSessionWithPrimaryResidentDevice](v28, "_setupSessionWithPrimaryResidentDevice");
    -[HMDResidentDeviceManagerRoarV3 _notifyPrimaryResidentChanged:previousPrimaryResident:changeSource:](v28, "_notifyPrimaryResidentChanged:previousPrimaryResident:changeSource:", v9, v10, a6);
  }
  if (v9)
  {
    -[HMDResidentDeviceManagerRoarV3 primaryDiscoveryManager](self, "primaryDiscoveryManager");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "cancel");

    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      v59 = logger;
      objc_msgSend(v9, "identifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v83 = v60;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v59, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HH2ElectedPrimaryResident", "electedPrimaryResidentIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);

    }
  }
  -[HMDResidentDeviceManagerRoarV3 _handleReachabilityAfterPrimaryResidentChangedTo:previousPrimaryResident:](self, "_handleReachabilityAfterPrimaryResidentChangedTo:previousPrimaryResident:", v9, v10);
  objc_msgSend(v9, "device");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDResidentDeviceManagerRoarV3 isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident")&& objc_msgSend(v61, "isCurrentDevice"))
  {
    -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 availableResidentDevices](self, "availableResidentDevices");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "updateIdentifiersForAvailableResidentDevices:", v63);

  }
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v64, "currentModeType") == 3)
  {

  }
  else
  {
    -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "currentModeType") == 2;

    if (!v66)
      goto LABEL_65;
  }
  if ((objc_msgSend(v9, "isCurrentDevice") & 1) != 0
    || objc_msgSend(v10, "isCurrentDevice")
    && -[HMDResidentDeviceManagerRoarV3 isActingAsResident](self, "isActingAsResident"))
  {
    v67 = (void *)MEMORY[0x227676638]();
    v68 = self;
    HMFGetOSLogHandle();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isCurrentDevice");
      HMFBooleanToString();
      v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "isCurrentDevice");
      HMFBooleanToString();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v83 = v70;
      v84 = 2112;
      v85 = v71;
      v86 = 2112;
      v87 = v72;
      _os_log_impl(&dword_2218F0000, v69, OS_LOG_TYPE_INFO, "%{public}@Publishing updated resident status because became primary: %@ was previous primary: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v67);
    if (objc_msgSend(v9, "isCurrentDevice"))
      v73 = 2;
    else
      v73 = 3;
    -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](v68, "residentSelectionManager");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "localPreferredResidentsList");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 _publishCurrentResidentStatusWithReason:preferredResidentsList:](v68, "_publishCurrentResidentStatusWithReason:preferredResidentsList:", v73, v75);

  }
  -[HMDResidentDeviceManagerRoarV3 _updatePrimaryResidentPeriodicReassertionTimerWithPrimaryResidentDevice:](self, "_updatePrimaryResidentPeriodicReassertionTimerWithPrimaryResidentDevice:", v9);
LABEL_65:

}

- (BOOL)hasActivePrimaryResidentTransaction
{
  return self->_primaryResidentTransaction != 0;
}

- (void)_updatePrimaryResidentTransactionWithPrimaryResidentDevice:(id)a3
{
  id v4;
  void *v5;
  HMDResidentDeviceManagerRoarV3 *v6;
  NSObject *v7;
  void *v8;
  HMFOSTransaction *primaryResidentTransaction;
  void *v10;
  HMDResidentDeviceManagerRoarV3 *v11;
  NSObject *v12;
  void *v13;
  HMFOSTransaction *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isCurrentDevice") && !self->_primaryResidentTransaction)
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
    v14 = (HMFOSTransaction *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("com.apple.homed.primary-resident"));
    primaryResidentTransaction = self->_primaryResidentTransaction;
    self->_primaryResidentTransaction = v14;
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "isCurrentDevice") & 1) == 0 && self->_primaryResidentTransaction)
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
    primaryResidentTransaction = self->_primaryResidentTransaction;
    self->_primaryResidentTransaction = 0;
LABEL_11:

  }
}

- (void)_updatePrimaryResidentPeriodicReassertionTimerWithPrimaryResidentDevice:(id)a3
{
  int v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "isCurrentDevice");
  -[HMDResidentDeviceManagerRoarV3 primaryResidentPeriodicReassertTimer](self, "primaryResidentPeriodicReassertTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {

    if (!v6)
      -[HMDResidentDeviceManagerRoarV3 _startPrimaryResidentPeriodicReassertionTimer](self, "_startPrimaryResidentPeriodicReassertionTimer");
  }
  else
  {

    if (v6)
      -[HMDResidentDeviceManagerRoarV3 _stopPrimaryResidentPeriodicReassertionTimer](self, "_stopPrimaryResidentPeriodicReassertionTimer");
  }
}

- (void)_startPrimaryResidentPeriodicReassertionTimer
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  HMDResidentDeviceManagerRoarV3 *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDResidentDeviceManagerRoarV3 _primaryResidentPeriodicReassertionTimeInterval](self, "_primaryResidentPeriodicReassertionTimeInterval");
  v5 = v4;
  v6 = fabs(v4);
  v7 = (void *)MEMORY[0x227676638](v3);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6 >= 2.22044605e-16)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v12;
      v22 = 2048;
      v23 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Starting primary resident periodic re-assert timer with interval: %f seconds", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentDeviceManagerRoarV3 dataSource](v8, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timerProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timerWithTimeInterval:options:", 0, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 setPrimaryResidentPeriodicReassertTimer:](v8, "setPrimaryResidentPeriodicReassertTimer:", v15);

    -[HMDResidentDeviceManagerRoarV3 primaryResidentPeriodicReassertTimer](v8, "primaryResidentPeriodicReassertTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v8);

    -[HMDResidentDeviceManagerRoarV3 queue](v8, "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 primaryResidentPeriodicReassertTimer](v8, "primaryResidentPeriodicReassertTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegateQueue:", v17);

    -[HMDResidentDeviceManagerRoarV3 primaryResidentPeriodicReassertTimer](v8, "primaryResidentPeriodicReassertTimer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resume");

  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident periodic re-assert interval is 0, not starting timer", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

- (void)_stopPrimaryResidentPeriodicReassertionTimer
{
  void *v3;
  HMDResidentDeviceManagerRoarV3 *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping primary resident periodic re-assert timer", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentDeviceManagerRoarV3 primaryResidentPeriodicReassertTimer](v4, "primaryResidentPeriodicReassertTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suspend");

  -[HMDResidentDeviceManagerRoarV3 setPrimaryResidentPeriodicReassertTimer:](v4, "setPrimaryResidentPeriodicReassertTimer:", 0);
}

- (double)_primaryResidentPeriodicReassertionTimeInterval
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  HMDResidentDeviceManagerRoarV3 *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  HMDResidentDeviceManagerRoarV3 *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  double v18;
  void *v19;
  HMDResidentDeviceManagerRoarV3 *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  HMDResidentDeviceManagerRoarV3 *v26;
  int v28;
  void *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoarV3 dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryResidentPeriodicReassertDurationSeconds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedIntValue");
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v9;
      v30 = 2048;
      v31 = *(double *)&v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Using primaryResidentPeriodicReassertDurationSeconds from server bag: %lu", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    *(double *)&v5 = 0.0;
  }
  -[HMDResidentDeviceManagerRoarV3 dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryResidentPeriodicReassertSlopDurationSeconds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    *(_QWORD *)&v12 = objc_msgSend(v11, "unsignedIntValue");
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v16;
      v30 = 2048;
      v31 = v12;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Using primaryResidentPeriodicReassertSlopDurationSeconds from server bag: %lu", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    if (*(double *)&v5 != 0.0)
    {
      if (LODWORD(v12))
      {
        v17 = v5 + arc4random() % LODWORD(v12);
        goto LABEL_14;
      }
LABEL_13:
      v12 = 0.0;
      v17 = v5;
LABEL_14:
      v18 = (double)v17;
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138544130;
        v29 = v22;
        v30 = 2048;
        v31 = v18;
        v32 = 2048;
        v33 = v5;
        v34 = 2048;
        v35 = v12;
        v23 = "%{public}@Determined reassert interval: %f seconds (base: %lu seconds, slop: %lu seconds)";
        v24 = v21;
        v25 = 42;
LABEL_18:
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v28, v25);

        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else if (*(double *)&v5 != 0.0)
  {
    goto LABEL_13;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v26 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v18 = 0.0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v22;
    v23 = "%{public}@Primary resident periodic re-assert duration is 0, defaulting to 0";
    v24 = v21;
    v25 = 12;
    goto LABEL_18;
  }
LABEL_19:

  objc_autoreleasePoolPop(v19);
  return v18;
}

- (void)_handleReachabilityAfterPrimaryResidentChangedTo:(id)a3 previousPrimaryResident:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDResidentDeviceManagerRoarV3 *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@There is no primary resident. Marking all residents as unreachable", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDResidentDeviceManagerRoarV3 residentDevices](v15, "residentDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 _updateReachability:forResidentDevices:](v15, "_updateReachability:forResidentDevices:", 0, v13);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isCurrentDevice"))
  {
    -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "currentModeType");

    if (v9 == 1)
    {
      v10 = (void *)MEMORY[0x24BDBCEF0];
      -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "locallyReachableResidents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithSet:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "addObject:", v6);
      -[HMDResidentDeviceManagerRoarV3 _updateResidentReachabilityFromReachableResidents:](self, "_updateResidentReachabilityFromReachableResidents:", v13);
LABEL_8:

    }
  }

}

- (void)_handleUpdatedPrimaryFromSelection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDResidentDeviceManagerRoarV3 *v11;
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
  -[HMDResidentDeviceManagerRoarV3 primaryResidentUUID](self, "primaryResidentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    -[HMDResidentDeviceManagerRoarV3 residentWithUUID:](self, "residentWithUUID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](self, "primaryResidentDevice");
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
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Selection notified that we are the primary. Becoming the primary resident.", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerRoarV3 _handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:](v11, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", v7, v8, v15, 6);

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
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Selection notified a new primary resident: %{public}@. Current Primary: %{public}@. Kicking off a primary resident discovery", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDResidentDeviceManagerRoarV3 _discoverPrimaryResidentForRequester:](v11, "_discoverPrimaryResidentForRequester:", 0);
    }

  }
}

- (void)residentSelectionManager:(id)a3 didSelectPrimaryResident:(id)a4 selectionInfo:(id)a5 electionLogEvent:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  HMDResidentDeviceManagerRoarV3 *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v21;
    v34 = 2112;
    v35 = v22;
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@residentSelectionManager didSelectPrimaryResident: %@ selectionInfo: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  if (objc_msgSend(v13, "isCurrentDevice"))
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  else
    -[HMDResidentDeviceManagerRoarV3 primaryResidentGenerationID](v19, "primaryResidentGenerationID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectionTimestamp");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 _updatePrimaryResidentSelectionTimestamp:](v19, "_updatePrimaryResidentSelectionTimestamp:", v24);

  if (!v14)
  {
    -[HMDResidentDeviceManagerRoarV3 backingStore](v19, "backingStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateResidentSelectionInfoTo:completion:", 0, v16);

    goto LABEL_10;
  }
  v25 = -[HMDResidentDeviceManagerRoarV3 homeSupportsResidentSelection](v19, "homeSupportsResidentSelection");
  -[HMDResidentDeviceManagerRoarV3 backingStore](v19, "backingStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "updateResidentSelectionInfoTo:completion:", v14, v16);

  if (v25)
  {
LABEL_10:
    -[HMDResidentDeviceManagerRoarV3 primaryResidentDevice](v19, "primaryResidentDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 _handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:](v19, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", v13, v28, v23, 1);

    goto LABEL_11;
  }
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __126__HMDResidentDeviceManagerRoarV3_residentSelectionManager_didSelectPrimaryResident_selectionInfo_electionLogEvent_completion___block_invoke;
  v29[3] = &unk_24E799FD0;
  v29[4] = v19;
  v30 = v13;
  v31 = v23;
  -[HMDResidentDeviceManagerRoarV3 _handleInitialTransitionToResidentSelectionWithCompletion:](v19, "_handleInitialTransitionToResidentSelectionWithCompletion:", v29);

LABEL_11:
}

- (void)residentSelectionManager:(id)a3 didFailToSelectWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDResidentDeviceManagerRoarV3 *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
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
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Selection failed with error: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

}

- (void)residentSelectionManagerReadyAsResident:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localPreferredResidentsList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 _publishCurrentResidentStatusWithReason:preferredResidentsList:](self, "_publishCurrentResidentStatusWithReason:preferredResidentsList:", 1, v5);

}

- (void)residentSelectionManager:(id)a3 didReceivePrimaryResidentIdsIdentifier:(id)a4 selectionTimestamp:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDResidentDeviceManagerRoarV3 _updatePrimaryResidentSelectionTimestamp:](self, "_updatePrimaryResidentSelectionTimestamp:", v7);
  -[HMDResidentDeviceManagerRoarV3 residentDeviceWithIDSIdentifier:](self, "residentDeviceWithIDSIdentifier:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 _handleUpdatedPrimaryFromSelection:](self, "_handleUpdatedPrimaryFromSelection:", v10);

}

- (void)residentSelectionManager:(id)a3 didUpdateActiveNodes:(id)a4
{
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;

  v9 = a4;
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](self, "residentSelectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "currentModeType") == 1)
  {
    v7 = -[HMDResidentDeviceManagerRoarV3 isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident");

    v8 = v9;
    if (!v7)
      goto LABEL_6;
  }
  else
  {

  }
  -[HMDResidentDeviceManagerRoarV3 _updateResidentReachabilityFromReachableResidents:](self, "_updateResidentReachabilityFromReachableResidents:", v9);
  v8 = v9;
LABEL_6:

}

- (void)residentSelectionManager:(id)a3 didUpdateResidentDevice:(id)a4
{
  NSObject *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a4;
  -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentDeviceManagerRoarV3 residentDevices](self, "residentDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v8);

  if ((v7 & 1) == 0)
    -[HMDResidentDeviceManagerRoarV3 _addResidentDevice:](self, "_addResidentDevice:", v8);
  -[HMDResidentDeviceManagerRoarV3 notifyClientsOfUpdatedResidentDevice:](self, "notifyClientsOfUpdatedResidentDevice:", v8);

}

- (void)residentSelectionManager:(id)a3 reassertAsTheCurrentPrimaryWithSelectionTimestamp:(id)a4
{
  -[HMDResidentDeviceManagerRoarV3 _updatePrimaryResidentSelectionTimestamp:](self, "_updatePrimaryResidentSelectionTimestamp:", a4);
  -[HMDResidentDeviceManagerRoarV3 reAssertAsTheCurrentPrimaryResident](self, "reAssertAsTheCurrentPrimaryResident");
}

- (void)residentSelectionManager:(id)a3 didUpdateResidentSelectionInfo:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[HMDResidentDeviceManagerRoarV3 backingStore](self, "backingStore");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateResidentSelectionInfoTo:completion:", v8, v7);

}

- (void)residentSelectionManager:(id)a3 didUpdatePreferredResidentsList:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDResidentDeviceManagerRoarV3 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Publishing updated resident status because preferred residents list was updated", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](v9, "residentSelectionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localPreferredResidentsList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentDeviceManagerRoarV3 _publishCurrentResidentStatusWithReason:preferredResidentsList:](v9, "_publishCurrentResidentStatusWithReason:preferredResidentsList:", 4, v13);

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDResidentDeviceManagerRoarV3 *v10;
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
  HMDResidentDeviceManagerRoarV3 *v13;
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

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  HMDResidentDeviceManagerRoarV3 *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDResidentDeviceManagerRoarV3 *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDResidentDeviceManagerRoarV3 residentLocationRetryTimer](self, "residentLocationRetryTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Determining resident location due to retry timer firing", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDResidentDeviceManagerRoarV3 _determineResidentLocationWithCompletion:](v14, "_determineResidentLocationWithCompletion:", 0);
  }
  else
  {
    -[HMDResidentDeviceManagerRoarV3 primaryResidentPeriodicReassertTimer](self, "primaryResidentPeriodicReassertTimer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident periodic re-assert timer fired", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDResidentDeviceManagerRoarV3 _startPrimaryResidentPeriodicReassertionTimer](v8, "_startPrimaryResidentPeriodicReassertionTimer");
      -[HMDResidentDeviceManagerRoarV3 residentSelectionManager](v8, "residentSelectionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localPreferredResidentsList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerRoarV3 _publishCurrentResidentStatusWithReason:preferredResidentsList:](v8, "_publishCurrentResidentStatusWithReason:preferredResidentsList:", 5, v12);

    }
  }

}

- (void)_handleHomeLocationChangedNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (-[HMDResidentDeviceManagerRoarV3 isActingAsResident](self, "isActingAsResident", a3))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__HMDResidentDeviceManagerRoarV3__handleHomeLocationChangedNotification___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (id)_createBackoffTimer
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F170]), "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 4, 0, 300.0, 43200.0);
}

- (void)_startRetryTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDResidentDeviceManagerRoarV3 residentLocationRetryTimer](self, "residentLocationRetryTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMDResidentDeviceManagerRoarV3 _createBackoffTimer](self, "_createBackoffTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 setResidentLocationRetryTimer:](self, "setResidentLocationRetryTimer:", v4);

    -[HMDResidentDeviceManagerRoarV3 residentLocationRetryTimer](self, "residentLocationRetryTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[HMDResidentDeviceManagerRoarV3 queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 residentLocationRetryTimer](self, "residentLocationRetryTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegateQueue:", v6);

  }
  -[HMDResidentDeviceManagerRoarV3 residentLocationRetryTimer](self, "residentLocationRetryTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

- (void)_removeRetryTimer
{
  void *v3;

  -[HMDResidentDeviceManagerRoarV3 residentLocationRetryTimer](self, "residentLocationRetryTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDResidentDeviceManagerRoarV3 setResidentLocationRetryTimer:](self, "setResidentLocationRetryTimer:", 0);
}

- (void)_determineResidentLocationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDResidentDeviceManagerRoarV3 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDResidentDeviceManagerRoarV3 *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Determining resident location", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDResidentDeviceManagerRoarV3 residentLocationRetryTimer](v6, "residentLocationRetryTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suspend");

  -[HMDResidentDeviceManagerRoarV3 residentStatusChannel](v6, "residentStatusChannel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isConnected");

  if ((v11 & 1) != 0)
  {
    -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](v6, "residentLocationHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestResidentLocation");

    -[HMDResidentDeviceManagerRoarV3 residentStatusChannel](v6, "residentStatusChannel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentResidentStatuses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentDeviceManagerRoarV3 _electorForDeterminingResidentLocationFromPresentResidentStatuses:](v6, "_electorForDeterminingResidentLocationFromPresentResidentStatuses:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](v6, "residentLocationHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __75__HMDResidentDeviceManagerRoarV3__determineResidentLocationWithCompletion___block_invoke;
    v22[3] = &unk_24E79B3A0;
    v22[4] = v6;
    v23 = v4;
    objc_msgSend(v16, "determineHomeOrAwayUsingElector:withCompletion:", v15, v22);

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Not connected to StatusKit, unable to determine resident location", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDResidentDeviceManagerRoarV3 _checkForUnknownLocationAndRetry](v18, "_checkForUnknownLocationAndRetry");
    v21 = _Block_copy(v4);
    v15 = v21;
    if (v21)
      (*((void (**)(void *, _QWORD))v21 + 2))(v21, 0);
  }

}

- (void)_checkForUnknownLocationAndRetry
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HMDResidentDeviceManagerRoarV3 *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentDeviceManagerRoarV3 residentLocationHandler](self, "residentLocationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentLocationRawValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 == 100)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDeviceManagerRoarV3 residentLocationRetryTimer](v7, "residentLocationRetryTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fireDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceNow");
      v16 = 138543874;
      v17 = v10;
      v18 = 2112;
      v19 = CFSTR("Unknown");
      v20 = 2048;
      v21 = v13;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Resident location is: %@, retrying after %.03f seconds", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDResidentDeviceManagerRoarV3 _startRetryTimer](v7, "_startRetryTimer");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      StringFromHMDResidentLocation(v5);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Resident location determined to: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDResidentDeviceManagerRoarV3 _removeRetryTimer](v7, "_removeRetryTimer");
  }
}

- (id)_residentDeviceDisplayName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMDResidentDeviceManagerRoarV3 home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appleMediaAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "device");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEqual:", v15);

        if ((v16 & 1) != 0)
        {
          objc_msgSend(v11, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v4, "device");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(v4, "name");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

LABEL_14:
  return v20;
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

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (HMFFuture)firstPrimaryResidentDiscoveryAttemptCompletionFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 112, 1);
}

- (HMDAppleAccountManager)appleAccountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)residentCapable
{
  return self->_residentCapable;
}

- (HMDResidentDeviceManagerDelegate)delegate
{
  return (HMDResidentDeviceManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 136, 1);
}

- (HMDResidentDeviceManagerRoarV3DataSource)dataSource
{
  return (HMDResidentDeviceManagerRoarV3DataSource *)objc_getProperty(self, a2, 144, 1);
}

- (HMDResidentDeviceManagerRoarBackingStore)backingStore
{
  return (HMDResidentDeviceManagerRoarBackingStore *)objc_getProperty(self, a2, 152, 1);
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return (HMDRemoteDeviceMonitor *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeviceMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (HMDResidentSelectionManager)residentSelectionManager
{
  return (HMDResidentSelectionManager *)objc_getProperty(self, a2, 168, 1);
}

- (void)setResidentSelectionManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (HMDPrimaryResidentDiscoveryManager)primaryDiscoveryManager
{
  return (HMDPrimaryResidentDiscoveryManager *)objc_getProperty(self, a2, 176, 1);
}

- (NSHashTable)primaryDiscoveryRequesters
{
  return self->_primaryDiscoveryRequesters;
}

- (HMFPromise)firstPrimaryResidentDiscoveryAttemptCompletionPromise
{
  return (HMFPromise *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFirstPrimaryResidentDiscoveryAttemptCompletionPromise:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (HMDResidentStatusChannel)statusChannel
{
  return (HMDResidentStatusChannel *)objc_getProperty(self, a2, 200, 1);
}

- (HMDResidentStatusChannelManager)residentStatusChannelManager
{
  return (HMDResidentStatusChannelManager *)objc_getProperty(self, a2, 208, 1);
}

- (HMDResidentSelectionStatusKit)presentResidentsStatuses
{
  return (HMDResidentSelectionStatusKit *)objc_getProperty(self, a2, 216, 1);
}

- (void)setPresentResidentsStatuses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 224, 1);
}

- (HMFTimer)residentLocationRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 232, 1);
}

- (void)setResidentLocationRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (HMFTimer)primaryResidentPeriodicReassertTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPrimaryResidentPeriodicReassertTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (id)pendingNotifyPrimaryChanged
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setPendingNotifyPrimaryChanged:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (HMDResidentLocationHandler)residentLocationHandler
{
  return (HMDResidentLocationHandler *)objc_getProperty(self, a2, 256, 1);
}

- (BOOL)configuredStatusKitForResidentSelection
{
  return self->_configuredStatusKitForResidentSelection;
}

- (void)setConfiguredStatusKitForResidentSelection:(BOOL)a3
{
  self->_configuredStatusKitForResidentSelection = a3;
}

- (double)blockPrimaryTakeoverStartTime
{
  return self->_blockPrimaryTakeoverStartTime;
}

- (void)setBlockPrimaryTakeoverStartTime:(double)a3
{
  self->_blockPrimaryTakeoverStartTime = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
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
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_residentLocationHandler, 0);
  objc_storeStrong(&self->_pendingNotifyPrimaryChanged, 0);
  objc_storeStrong((id *)&self->_primaryResidentPeriodicReassertTimer, 0);
  objc_storeStrong((id *)&self->_residentLocationRetryTimer, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_presentResidentsStatuses, 0);
  objc_storeStrong((id *)&self->_residentStatusChannelManager, 0);
  objc_storeStrong((id *)&self->_statusChannel, 0);
  objc_storeStrong((id *)&self->_firstPrimaryResidentDiscoveryAttemptCompletionPromise, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryRequesters, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_residentSelectionManager, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_firstPrimaryResidentDiscoveryAttemptCompletionFuture, 0);
  objc_storeStrong((id *)&self->_primaryResidentSelectionTimestamp, 0);
  objc_storeStrong((id *)&self->_primaryResidentGenerationID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_reachabilityObserver, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_primaryResidentUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_primaryResidentTransaction, 0);
  objc_storeStrong((id *)&self->_residentDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __75__HMDResidentDeviceManagerRoarV3__determineResidentLocationWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Determining resident home/away state encountered error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "_checkForUnknownLocationAndRetry");
  v8 = _Block_copy(*(const void **)(a1 + 40));
  v9 = v8;
  if (v8)
    (*((void (**)(void *, id))v8 + 2))(v8, v3);

}

uint64_t __73__HMDResidentDeviceManagerRoarV3__handleHomeLocationChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Determining resident location due to home location change", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_determineResidentLocationWithCompletion:", 0);
}

void __126__HMDResidentDeviceManagerRoarV3_residentSelectionManager_didSelectPrimaryResident_selectionInfo_electionLogEvent_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(v2, "primaryResidentDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", v3, v4, a1[6], 1);

}

void __101__HMDResidentDeviceManagerRoarV3__notifyPrimaryResidentChanged_previousPrimaryResident_changeSource___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_msgSend(WeakRetained, "isActingAsResident");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    objc_msgSend(WeakRetained, "_submitLogeventForPrimaryResident:previousPrimaryResident:changeSource:", v3, v4, *(_QWORD *)(a1 + 56));
  else
    objc_msgSend(WeakRetained, "_notifyUserPreferredResidentReachability:previousPrimaryResident:", v3, v4);

}

uint64_t __84__HMDResidentDeviceManagerRoarV3__updateReachabilityFromWorkingStoreExceptResident___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __84__HMDResidentDeviceManagerRoarV3__updateReachabilityFromWorkingStoreExceptResident___block_invoke_2;
  v3[3] = &unk_24E7952E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
  return 1;
}

void __84__HMDResidentDeviceManagerRoarV3__updateReachabilityFromWorkingStoreExceptResident___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v3, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating resident reachability from database to %@ for: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "_updateReachability:forResidentDevice:", v4, v3);

}

uint64_t __81__HMDResidentDeviceManagerRoarV3__residentsFromResidentStatuses_residentDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchingDeviceFromResidentDevices:", *(_QWORD *)(a1 + 32));
}

uint64_t __78__HMDResidentDeviceManagerRoarV3_channel_didObserveDevicesAdded_lost_updated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "idsIdentifier");
}

uint64_t __78__HMDResidentDeviceManagerRoarV3_channel_didObserveDevicesAdded_lost_updated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "idsIdentifier");
}

uint64_t __43__HMDResidentDeviceManagerRoarV3_dumpState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortDescription");
}

void __91__HMDResidentDeviceManagerRoarV3__updateReachabilityForResidentDevices_reachableResidents___block_invoke(uint64_t a1, void *a2)
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
  if ((objc_msgSend(v3, "isReachable") & 1) == 0)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Setting reachability to %@ for resident %@", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setReachable:", 1);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

void __91__HMDResidentDeviceManagerRoarV3__updateReachabilityForResidentDevices_reachableResidents___block_invoke_217(uint64_t a1, void *a2)
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
  if (objc_msgSend(v3, "isReachable"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Setting reachability to %@ for resident %@", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setReachable:", 0);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

uint64_t __84__HMDResidentDeviceManagerRoarV3__updateResidentReachabilityFromReachableResidents___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientsOfUpdatedResidentDevice:", a2);
}

void __83__HMDResidentDeviceManagerRoarV3__updateResidentIDSReachability_withUpdatedDevice___block_invoke(uint64_t a1)
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

void __75__HMDResidentDeviceManagerRoarV3__handleResidentSelectionVersionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentSelectionVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Home's resident selection version changed to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = objc_msgSend(*(id *)(a1 + 32), "homeSupportsResidentSelection");
  v9 = *(void **)(a1 + 32);
  if ((v8 & 1) == 0)
    goto LABEL_9;
  v10 = objc_msgSend(v9, "configuredStatusKitForResidentSelection");
  v9 = *(void **)(a1 + 32);
  if (v10)
    goto LABEL_9;
  if (objc_msgSend(v9, "isCurrentDeviceAvailableResident")
    && (objc_msgSend(*(id *)(a1 + 32), "isActingAsResident") & 1) == 0)
  {
    v9 = *(void **)(a1 + 32);
LABEL_9:
    objc_msgSend(v9, "residentSelectionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didUpdateResidentSelectionVersion");

    goto LABEL_10;
  }
  v11 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__HMDResidentDeviceManagerRoarV3__handleResidentSelectionVersionDidChange___block_invoke_213;
  v13[3] = &unk_24E79BD80;
  v13[4] = v11;
  objc_msgSend(v11, "_handleInitialTransitionToResidentSelectionWithCompletion:", v13);
LABEL_10:

}

void __75__HMDResidentDeviceManagerRoarV3__handleResidentSelectionVersionDidChange___block_invoke_213(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "residentSelectionManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didUpdateResidentSelectionVersion");

}

void __97__HMDResidentDeviceManagerRoarV3_modernTransportDeviceReachabilityObserverDidUpdate_isReachable___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "primaryResidentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isDeviceEquivalentToDeviceAddress:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "_handlePrimaryResident:isReachable:", v2, *(unsigned __int8 *)(a1 + 48));

}

void __95__HMDResidentDeviceManagerRoarV3_discoveryManager_didCompleteInitialDiscoveryAttemptWithError___block_invoke(uint64_t a1)
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

void __131__HMDResidentDeviceManagerRoarV3_discoveryManager_didCompleteDiscoveryWithPrimaryResidentDevice_primaryResidentGenerationID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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

  v5 = *(void **)(a1 + 40);
  if (v5 && (objc_msgSend(v5, "isCurrentDevice") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "handlePrimaryResidentDiscovered:primaryResidentGenerationID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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

void __54__HMDResidentDeviceManagerRoarV3_electResidentDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@SetPreferredPrimary completed with error: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

}

void __60__HMDResidentDeviceManagerRoarV3_sawGenerationID_forDevice___block_invoke(uint64_t a1)
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

uint64_t __103__HMDResidentDeviceManagerRoarV3_foundNewPrimaryResident_generationID_selectionTimestamp_changeSource___block_invoke(uint64_t a1)
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
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
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
    if (!objc_msgSend(v14, "allowExternalUpdateOfPrimaryResidentTo:selectionTimestamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56)))
    {
      v16 = 1;
      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 32), "_updatePrimaryResidentSelectionTimestamp:", *(_QWORD *)(a1 + 56));
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v17, "primaryResidentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_handleUpdatedPrimaryResidentDevice:previousPrimaryResident:generationID:changeSource:", v2, v15, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    v16 = 2;
  }

LABEL_11:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
  objc_claimAutoreleasedReturnValue();

  return 1;
}

void __61__HMDResidentDeviceManagerRoarV3_handleCurrentDeviceChanged___block_invoke(uint64_t a1)
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

uint64_t __77__HMDResidentDeviceManagerRoarV3_handleSetPreferredResidentSelectionMessage___block_invoke(uint64_t a1, void *a2)
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

uint64_t __77__HMDResidentDeviceManagerRoarV3_handleSetPreferredResidentSelectionMessage___block_invoke_208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "respondWithError:");
  else
    return objc_msgSend(v3, "respondWithSuccess");
}

void __76__HMDResidentDeviceManagerRoarV3__handlePrimaryResidentDiscoveryXPCRequest___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __94__HMDResidentDeviceManagerRoarV3_handlePrimaryResidentDiscovered_primaryResidentGenerationID___block_invoke(uint64_t a1, void *a2)
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

uint64_t __70__HMDResidentDeviceManagerRoarV3_discoverPrimaryResidentForRequester___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoverPrimaryResidentForRequester:", *(_QWORD *)(a1 + 40));
}

void __87__HMDResidentDeviceManagerRoarV3_notifyUpdatedPrimaryResident_previousPrimaryResident___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "residentSelectionManager");
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

void __99__HMDResidentDeviceManagerRoarV3__notifyUserPreferredResidentReachability_previousPrimaryResident___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "isOwnerUser") & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "residentSelectionInfo");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "preferredResidentIDSIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3 && (v4 = *(_QWORD *)(a1 + 48), v3, v4))
      {
        objc_msgSend(*(id *)(a1 + 32), "home");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_msgSend(*(id *)(a1 + 48), "device");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "idsIdentifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "preferredResidentIDSIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v7, "isEqual:", v8);

          objc_msgSend(*(id *)(a1 + 32), "_residentDeviceDisplayName:", *(_QWORD *)(a1 + 40));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_residentDeviceDisplayName:", *(_QWORD *)(a1 + 48));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("HMDResidentDeviceHomeUUIDNotificationKey"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("HMDResidentDeviceManagerUserPreferredResidentReachabilityKey"));

          if (v10)
            v15 = objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("HMDResidentDeviceManagerUserPreferredResidentNameKey"));
          if (v11)
            v15 = objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("HMDResidentDeviceManagerBackupResidentNameKey"));
          v16 = (void *)MEMORY[0x227676638](v15);
          v17 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 138543362;
            v38 = v19;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Notify user preferred resident reachability is changed", (uint8_t *)&v37, 0xCu);

          }
          objc_autoreleasePoolPop(v16);
          objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(a1 + 32);
          v22 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v20, "postNotificationName:object:userInfo:", CFSTR("HMDResidentDeviceManagerUserPreferredResidentReachabilityNotification"), v21, v22);

        }
        else
        {
          v33 = (void *)MEMORY[0x227676638]();
          v34 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 138543362;
            v38 = v36;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@No home to notify user preferred change", (uint8_t *)&v37, 0xCu);

          }
          objc_autoreleasePoolPop(v33);
        }

      }
      else
      {
        v27 = (void *)MEMORY[0x227676638]();
        v28 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "preferredResidentIDSIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = "no elected primary";
          if (!v31)
            v32 = "in auto mode";
          v37 = 138543618;
          v38 = v30;
          v39 = 2080;
          v40 = v32;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Do not notify user preferred change: %s", (uint8_t *)&v37, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
      }

    }
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543362;
      v38 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Not owner do not notify user perferred resident reachability is changed.", (uint8_t *)&v37, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }
}

void __71__HMDResidentDeviceManagerRoarV3_notifyClientsOfUpdatedResidentDevice___block_invoke(uint64_t a1)
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

void __58__HMDResidentDeviceManagerRoarV3_notifyResidentAvailable___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManager:didUpdateResidentAvailable:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

uint64_t __59__HMDResidentDeviceManagerRoarV3_accountOrDeviceDidUpdate___block_invoke(uint64_t a1)
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

uint64_t __60__HMDResidentDeviceManagerRoarV3_updateResidentAvailability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateResidentAvailability:", 0);
}

uint64_t __55__HMDResidentDeviceManagerRoarV3_removeResidentDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeResidentDevice:", *(_QWORD *)(a1 + 40));
}

uint64_t __92__HMDResidentDeviceManagerRoarV3__handleInitialTransitionToResidentSelectionWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Handling initial transition to resident selection - Received initial Resident Status Channel state.", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_determineResidentLocationWithCompletion:", *(_QWORD *)(a1 + 40));

  return 1;
}

uint64_t __92__HMDResidentDeviceManagerRoarV3__handleInitialTransitionToResidentSelectionWithCompletion___block_invoke_195(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Handling initial transition to resident selection - Initial Resident Status Channel state returned error: %@.", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_determineResidentLocationWithCompletion:", *(_QWORD *)(a1 + 40));

  return 1;
}

void __56__HMDResidentDeviceManagerRoarV3__removeResidentDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
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
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableNotificationsForDevices:", v5);

  if (objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setActingAsResident:", 0);
    objc_msgSend(*(id *)(a1 + 32), "residentSelectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");

    if (objc_msgSend(*(id *)(a1 + 32), "homeSupportsResidentSelection"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_stopActingAsResidentViaStatusKit");
      objc_msgSend(*(id *)(a1 + 32), "residentStatusChannelManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeClientWithIdentifier:", CFSTR("resident.device.manager"));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_checkPrimaryResidentDeviceRemoved:currentPrimary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __41__HMDResidentDeviceManagerRoarV3_ourSelf__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDevice");

  return v3;
}

uint64_t __37__HMDResidentDeviceManagerRoarV3_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

void __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke(uint64_t a1)
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
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
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
    v33 = v5;
    v34 = 2048;
    v35 = v7;
    v36 = 2048;
    v37 = v9;
    v38 = 2048;
    v39 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Residents changed, added: %lu; removed: %lu; reachability: %lu",
      buf,
      0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "deletedResidentDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_186;
  v31[3] = &unk_24E7952E0;
  v31[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);

  objc_msgSend(*(id *)(a1 + 40), "addedResidentDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_188;
  v30[3] = &unk_24E7952E0;
  v30[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);

  objc_msgSend(*(id *)(a1 + 40), "reachabilityUpdates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_189;
  v29[3] = &unk_24E7952E0;
  v29[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);

  objc_msgSend(*(id *)(a1 + 40), "addedResidentDevices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "residentSelectionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addedResidentDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didAddResidentsToHome:", v18);

    if (objc_msgSend(*(id *)(a1 + 32), "homeSupportsResidentSelection"))
    {
      objc_msgSend(*(id *)(a1 + 32), "residentStatusChannel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isConnected");

      if (v20)
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v24;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Cloud added resident refresh residents reachability", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
        objc_msgSend(*(id *)(a1 + 32), "_refreshAllResidentsReachabilityFromStatusKit");
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "deletedResidentDevices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 32), "residentSelectionManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "deletedResidentDevices");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "didRemoveResidentsFromHome:", v28);

  }
}

void __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_186(uint64_t a1, void *a2)
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

void __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_188(uint64_t a1, void *a2)
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

void __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_189(uint64_t a1, void *a2)
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

void __61__HMDResidentDeviceManagerRoarV3_residentsPresentOnStatusKit__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "idsIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __85__HMDResidentDeviceManagerRoarV3__checkForResidentSelectionInfoUpdateInNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "pendingNotifyPrimaryChanged");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingNotifyPrimaryChanged");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setPendingNotifyPrimaryChanged:", 0);
  }
}

void __70__HMDResidentDeviceManagerRoarV3__checkForResidentSelectionInfoUpdate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "residentSelectionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdateResidentSelectionModelTo:", *(_QWORD *)(a1 + 40));

}

void __69__HMDResidentDeviceManagerRoarV3__handleInitialConnectionToStatusKit__block_invoke(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Determining resident home/away state encountered error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "_startActingAsResident");

}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke(uint64_t a1, void *a2)
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

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_167(uint64_t a1, void *a2)
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

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_169(uint64_t a1, void *a2)
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

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_170(uint64_t a1, void *a2)
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

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_171(uint64_t a1, void *a2)
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

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_172(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDAssertionLogEvent *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138543362;
      v39 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Operating in bad CDP state. Not joining the mesh", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "isActingAsResident") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "appleAccountManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Constructing all known resident devices in the home", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(a1 + 32), "backingStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "findResidents:outHasResidents:", v12, 0);
      v19 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();

      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_173;
      v37[3] = &unk_24E795268;
      v37[4] = *(_QWORD *)(a1 + 32);
      -[HMDAssertionLogEvent hmf_enumerateWithAutoreleasePoolUsingBlock:](v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v37);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v20;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: No current device to add resident devices", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v19 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("No current device to add resident devices"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "submitLogEvent:", v19);

    }
    objc_msgSend(*(id *)(a1 + 32), "residentSelectionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "currentModeType");

    v24 = *(void **)(a1 + 32);
    if (v23 == 1)
    {
      objc_msgSend(v24, "_startActingAsResident");
    }
    else if (objc_msgSend(v24, "homeSupportsResidentSelection"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_initialConnectionToStatusKitOnResidentTimeout");
      v26 = v25;
      objc_msgSend(*(id *)(a1 + 32), "residentStatusChannel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "initialConnectedToStatusKitFuture");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeout:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_178;
      v35[3] = &unk_24E797BE8;
      v31 = *(_QWORD *)(a1 + 40);
      v35[4] = *(_QWORD *)(a1 + 32);
      v36 = *(id *)(a1 + 48);
      v34[0] = v30;
      v34[1] = 3221225472;
      v34[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_179;
      v34[3] = &unk_24E797A18;
      v34[4] = *(_QWORD *)(a1 + 32);
      v32 = (id)objc_msgSend(v29, "inContext:then:orRecover:", v31, v35, v34);

    }
  }

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_180(uint64_t a1, void *a2)
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

void __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_173(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 280);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "configureWithHome:", WeakRetained);

  objc_msgSend(*(id *)(a1 + 32), "_addResidentDevice:", v5);
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_178(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Received initial Resident Status Channel state.", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "markPrimaryResidentSelectionConnectedToStatusKitFutureResolved");
  objc_msgSend(*(id *)(a1 + 32), "_handleInitialConnectionToStatusKit");

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_179(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Initial Resident Status Channel state returned error: %@.", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_handleInitialConnectionToStatusKit");

  return 1;
}

void __44__HMDResidentDeviceManagerRoarV3_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "residentSelectionManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

}

void __61__HMDResidentDeviceManagerRoarV3__configureResidentSupported__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 280);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "configureWithHome:", WeakRetained);

  objc_msgSend(*(id *)(a1 + 32), "_addResidentDevice:", v5);
}

uint64_t __70__HMDResidentDeviceManagerRoarV3_configureWithHome_messageDispatcher___block_invoke(id *a1)
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
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  HMDResidentStatusChannelManager *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD *v42;
  void *v43;
  int v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "setHome:", a1[5]);
  objc_msgSend(a1[4], "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifierForHome:", a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = (void *)v4[11];
  v4[11] = v3;

  objc_msgSend(a1[5], "uuid");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = (void *)v7[10];
  v7[10] = v6;

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
    v45 = 138543874;
    v46 = v12;
    v47 = 2112;
    v48 = v13;
    v49 = 2112;
    v50 = v15;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring and registering for messages, isInternal: %@, isResidentEnabled: %@", (uint8_t *)&v45, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(a1[4], "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createBackingStoreForHome:", a1[5]);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = a1[4];
  v19 = (void *)v18[19];
  v18[19] = v17;

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
  objc_msgSend(a1[4], "_startResidentSelectionManager");
  objc_msgSend(a1[4], "primaryDiscoveryManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configureWithContext:", a1[4]);

  if (objc_msgSend(a1[4], "homeSupportsResidentSelection"))
  {
    objc_msgSend(a1[4], "dataSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "createResidentStatusChannelForHome:queue:", a1[5], *((_QWORD *)a1[4] + 2));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = a1[4];
    v28 = (void *)v27[25];
    v27[25] = v26;

    objc_msgSend(a1[4], "statusChannel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:", a1[4]);

    v30 = [HMDResidentStatusChannelManager alloc];
    objc_msgSend(a1[4], "statusChannel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "queue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "idsServerBag");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[HMDResidentStatusChannelManager initWithResidentStatusChannel:queue:idsServerBag:](v30, "initWithResidentStatusChannel:queue:idsServerBag:", v31, v32, v33);
    v35 = a1[4];
    v36 = (void *)v35[26];
    v35[26] = v34;

    objc_msgSend(a1[4], "residentStatusChannelManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "statusChannel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setManager:", v37);

    objc_msgSend(a1[4], "residentStatusChannelManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "configure");

  }
  objc_msgSend(a1[4], "setPendingNotifyPrimaryChanged:", 0);
  objc_msgSend(a1[4], "dataSource");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "createResidentLocationHandlerForHome:queue:messageDispatcher:", a1[5], *((_QWORD *)a1[4] + 2), a1[6]);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = a1[4];
  v43 = (void *)v42[32];
  v42[32] = v41;

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
  if (logCategory__hmf_once_t119 != -1)
    dispatch_once(&logCategory__hmf_once_t119, &__block_literal_global_245_223825);
  return (id)logCategory__hmf_once_v120;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __45__HMDResidentDeviceManagerRoarV3_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v120;
  logCategory__hmf_once_v120 = v0;

}

@end
