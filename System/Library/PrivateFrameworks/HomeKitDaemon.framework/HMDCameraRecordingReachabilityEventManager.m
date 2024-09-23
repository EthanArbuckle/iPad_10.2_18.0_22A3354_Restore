@implementation HMDCameraRecordingReachabilityEventManager

- (HMDCameraRecordingReachabilityEventManager)initWithAccessory:(id)a3 workQueue:(id)a4 identifier:(id)a5 bulletinBoard:(id)a6 logEventSubmitter:(id)a7 accountSettings:(id)a8 notificationCenter:(id)a9
{
  id v15;
  id v16;
  id v17;
  HMDCameraRecordingReachabilityEventManager *v18;
  HMDCameraRecordingReachabilityEventManager *v19;
  uint64_t v20;
  NSHashTable *clientConnections;
  uint64_t v22;
  NSDate *suppressNotificationsBeforeDate;
  NAFuture *v24;
  NAFuture *didHandleInitialReachabilityFuture;
  id initialReachabilityTimerFactory;
  id reachabilityChangeDebounceTimerFactory;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v15 = a3;
  v32 = a4;
  v31 = a5;
  v30 = a6;
  v29 = a7;
  v16 = a8;
  v17 = a9;
  v33.receiver = self;
  v33.super_class = (Class)HMDCameraRecordingReachabilityEventManager;
  v18 = -[HMDCameraRecordingReachabilityEventManager init](&v33, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uniqueIdentifier, a5);
    objc_storeWeak((id *)&v19->_hapAccessory, v15);
    objc_storeStrong((id *)&v19->_workQueue, a4);
    objc_storeStrong((id *)&v19->_bulletinBoard, a6);
    objc_storeStrong((id *)&v19->_logEventSubmitter, a7);
    objc_storeStrong((id *)&v19->_accountSettings, a8);
    objc_storeStrong((id *)&v19->_notificationCenter, a9);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable", v29, v30, v31, v32);
    v20 = objc_claimAutoreleasedReturnValue();
    clientConnections = v19->_clientConnections;
    v19->_clientConnections = (NSHashTable *)v20;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v22 = objc_claimAutoreleasedReturnValue();
    suppressNotificationsBeforeDate = v19->_suppressNotificationsBeforeDate;
    v19->_suppressNotificationsBeforeDate = (NSDate *)v22;

    v24 = (NAFuture *)objc_alloc_init(MEMORY[0x24BE6B608]);
    didHandleInitialReachabilityFuture = v19->_didHandleInitialReachabilityFuture;
    v19->_didHandleInitialReachabilityFuture = v24;

    initialReachabilityTimerFactory = v19->_initialReachabilityTimerFactory;
    v19->_initialReachabilityTimerFactory = &__block_literal_global_174720;

    reachabilityChangeDebounceTimerFactory = v19->_reachabilityChangeDebounceTimerFactory;
    v19->_reachabilityChangeDebounceTimerFactory = &__block_literal_global_11_174721;

  }
  return v19;
}

- (HMDCameraRecordingReachabilityEventManager)initWithHAPAccessory:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraRecordingReachabilityEventManager *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleAccountSettings sharedSettings](HMDAppleAccountSettings, "sharedSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDCameraRecordingReachabilityEventManager initWithAccessory:workQueue:identifier:bulletinBoard:logEventSubmitter:accountSettings:notificationCenter:](self, "initWithAccessory:workQueue:identifier:bulletinBoard:logEventSubmitter:accountSettings:notificationCenter:", v7, v6, v8, v9, v10, v11, v12);

  return v13;
}

- (void)configureWithMessageDispatcher:(id)a3 currentSettings:(id)a4 isCurrentDeviceConfirmedPrimaryResident:(BOOL)a5 isCurrentDeviceConnectedToNetwork:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDCameraRecordingReachabilityEventManager *v13;
  NSObject *v14;
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
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  _BOOL4 v52;
  _QWORD v53[3];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v6 = a6;
  v52 = a5;
  v68 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v61 = v15;
    v62 = 2112;
    v63 = v10;
    v64 = 2112;
    v65 = v16;
    v66 = 2112;
    v67 = v17;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Configuring with current settings: %@, isCurrentDeviceConfirmedPrimaryResident: %@, isCurrentDeviceConnectedToNetwork: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDCameraRecordingReachabilityEventManager hapAccessory](v13, "hapAccessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager setMessageDispatcher:](v13, "setMessageDispatcher:", v9);
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 133);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", v19, 0, 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v19, 4, 0);
  v50 = v6;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager messageDispatcher](v13, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v51 = v9;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v24;
  v59[1] = v21;
  v49 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerForMessage:receiver:policies:selector:", CFSTR("HMDRemoteCameraReachabilityDidChangeMessage"), v13, v25, sel_handleRemoteCameraReachabilityChange_);

  -[HMDCameraRecordingReachabilityEventManager messageDispatcher](v13, "messageDispatcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BDD5570];
  v58[0] = v20;
  v58[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "registerForMessage:receiver:policies:selector:", v27, v13, v28, sel_handleFetchEventsMessage_);

  -[HMDCameraRecordingReachabilityEventManager messageDispatcher](v13, "messageDispatcher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x24BDD5568];
  v57[0] = v20;
  v57[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerForMessage:receiver:policies:selector:", v30, v13, v31, sel_handleFetchCountOfEventsMessage_);

  -[HMDCameraRecordingReachabilityEventManager messageDispatcher](v13, "messageDispatcher");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x24BDD55C0];
  v56[0] = v20;
  v56[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "registerForMessage:receiver:policies:selector:", v33, v13, v34, sel_handleSubscribeMessage_);

  -[HMDCameraRecordingReachabilityEventManager messageDispatcher](v13, "messageDispatcher");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x24BDD55C8];
  v55[0] = v20;
  v55[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerForMessage:receiver:policies:selector:", v36, v13, v37, sel_handleUnsubscribeMessage_);

  -[HMDCameraRecordingReachabilityEventManager messageDispatcher](v13, "messageDispatcher");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *MEMORY[0x24BDD55B8];
  v54[0] = v20;
  v54[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "registerForMessage:receiver:policies:selector:", v39, v13, v40, sel_handlePerformCloudPullMessage_);

  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager messageDispatcher](v13, "messageDispatcher");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *MEMORY[0x24BDD5558];
  v53[0] = v20;
  v53[1] = v22;
  v53[2] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "registerForMessage:receiver:policies:selector:", v43, v13, v44, sel_handleDeleteAllEventsMessage_);

  -[HMDCameraRecordingReachabilityEventManager notificationCenter](v13, "notificationCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", v13, sel_handleResidentDeviceConfirmedStateChangedNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

  -[HMDCameraRecordingReachabilityEventManager notificationCenter](v13, "notificationCenter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObserver:selector:name:object:", v13, sel_handleCameraProfileSettingsDidChange_, CFSTR("HMDCameraProfileSettingsDidChangeNotification"), v18);

  -[HMDCameraRecordingReachabilityEventManager notificationCenter](v13, "notificationCenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager accountSettings](v13, "accountSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObserver:selector:name:object:", v13, sel_handleAppleAccountSettingsHomeStateUpdated_, CFSTR("HMDAppleAccountSettingsHomeStateUpdatedNotification"), v48);

  -[HMDCameraRecordingReachabilityEventManager setCurrentSettings:](v13, "setCurrentSettings:", v49);
  -[HMDCameraRecordingReachabilityEventManager setCurrentDeviceConfirmedPrimaryResident:](v13, "setCurrentDeviceConfirmedPrimaryResident:", v52);
  -[HMDCameraRecordingReachabilityEventManager setCurrentDeviceConnectedToNetwork:](v13, "setCurrentDeviceConnectedToNetwork:", v50);

}

- (void)cleanUpEvents
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCameraRecordingReachabilityEventManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraRecordingReachabilityEventManager *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -*MEMORY[0x24BDD5550]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:", v6, v4);

  -[HMDCameraRecordingReachabilityEventManager fetchReachabilityEventsWithDateInterval:](self, "fetchReachabilityEventsWithDateInterval:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    -[HMDCameraRecordingReachabilityEventManager mostRecentReachabilityEventModelInModels:](self, "mostRecentReachabilityEventModelInModels:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDBCF20];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __59__HMDCameraRecordingReachabilityEventManager_cleanUpEvents__block_invoke;
    v26[3] = &unk_24E78CA40;
    v15 = v13;
    v27 = v15;
    objc_msgSend(v8, "na_map:", v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2048;
      v31 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Removing %lu expired records", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Remove expired camera reachability event records"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShouldEnqueueMirrorOutput:", 0);
    -[HMDCameraRecordingReachabilityEventManager localZone](v19, "localZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v24, "removeModelIDs:options:", v17, v23);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@No expired models to delete", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (BOOL)isAccessoryReachable
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingReachabilityEventManager hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isPrimary"))
      v6 = objc_msgSend(v5, "isReachable");
    else
      v6 = -[HMDCameraRecordingReachabilityEventManager currentBridgedCameraReachability](self, "currentBridgedCameraReachability");
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldHandleReachabilityChanges
{
  void *v3;
  BOOL v4;

  -[HMDCameraRecordingReachabilityEventManager currentSettings](self, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = isRecordingAllowedForSettings(v3)
    && -[HMDCameraRecordingReachabilityEventManager isCurrentDeviceConnectedToNetwork](self, "isCurrentDeviceConnectedToNetwork")&& -[HMDCameraRecordingReachabilityEventManager isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident");

  return v4;
}

- (_HMCameraUserSettings)currentSettings
{
  NSObject *v3;

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_currentSettings;
}

- (void)setCurrentSettings:(id)a3
{
  id v4;
  NSObject *v5;
  _HMCameraUserSettings *v6;
  _HMCameraUserSettings *currentSettings;
  int v8;

  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  LODWORD(v5) = isRecordingAllowedForSettings(self->_currentSettings);
  v6 = (_HMCameraUserSettings *)objc_msgSend(v4, "copy");
  currentSettings = self->_currentSettings;
  self->_currentSettings = v6;

  v8 = isRecordingAllowedForSettings(v4);
  if ((_DWORD)v5 != v8)
    -[HMDCameraRecordingReachabilityEventManager updateInitialReachabilityTimer](self, "updateInitialReachabilityTimer");
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  NSObject *v3;

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_currentDeviceConfirmedPrimaryResident;
}

- (void)setCurrentDeviceConfirmedPrimaryResident:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraRecordingReachabilityEventManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_currentDeviceConfirmedPrimaryResident != v3)
  {
    self->_currentDeviceConfirmedPrimaryResident = v3;
    -[HMDCameraRecordingReachabilityEventManager updateInitialReachabilityTimer](self, "updateInitialReachabilityTimer");
    -[HMDCameraRecordingReachabilityEventManager hapAccessory](self, "hapAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HMDCameraRecordingReachabilityEventManager notificationCenter](self, "notificationCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v3)
      {
        objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleAccessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), v6);

        -[HMDCameraRecordingReachabilityEventManager notificationCenter](self, "notificationCenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleAccessoryUnconfigured_, CFSTR("HMDAccessoryDisconnectedNotification"), v6);

        -[HMDCameraRecordingReachabilityEventManager notificationCenter](self, "notificationCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleHMDBridgedAccessoryReachableNotification_, CFSTR("HMDBridgedAccessoryReachableNotification"), v6);

        -[HMDCameraRecordingReachabilityEventManager notificationCenter](self, "notificationCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_handleHMDBridgedAccessoryUnreachableNotification_, CFSTR("HMDBridgedAccessoryUnreachableNotification"), v6);
      }
      else
      {
        objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("HMDAccessoryConnectedNotification"), v6);

        -[HMDCameraRecordingReachabilityEventManager notificationCenter](self, "notificationCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObserver:name:object:", self, CFSTR("HMDAccessoryDisconnectedNotification"), v6);

        -[HMDCameraRecordingReachabilityEventManager notificationCenter](self, "notificationCenter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObserver:name:object:", self, CFSTR("HMDBridgedAccessoryReachableNotification"), v6);

        -[HMDCameraRecordingReachabilityEventManager notificationCenter](self, "notificationCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("HMDBridgedAccessoryUnreachableNotification"), v6);
      }

    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Not updating notification registrations because accessory reference is nil", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
}

- (BOOL)isCurrentDeviceConnectedToNetwork
{
  NSObject *v3;

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_currentDeviceConnectedToNetwork;
}

- (void)setCurrentDeviceConnectedToNetwork:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;

  v3 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_currentDeviceConnectedToNetwork != v3)
  {
    self->_currentDeviceConnectedToNetwork = v3;
    -[HMDCameraRecordingReachabilityEventManager updateInitialReachabilityTimer](self, "updateInitialReachabilityTimer");
  }
}

- (void)handleUpdatedCameraReachability:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDCameraRecordingReachabilityEventManager *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingReachabilityEventManager initialReachabilityTimer](self, "initialReachabilityTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      v11 = "%{public}@Initial reachability timer active";
LABEL_9:
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!-[HMDCameraRecordingReachabilityEventManager shouldHandleReachabilityChanges](self, "shouldHandleReachabilityChanges"))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      v11 = "%{public}@Not handling reachability change";
      goto LABEL_9;
    }
LABEL_10:

    objc_autoreleasePoolPop(v7);
    return;
  }
  -[HMDCameraRecordingReachabilityEventManager setCurrentCameraReachability:](self, "setCurrentCameraReachability:", v3);
  -[HMDCameraRecordingReachabilityEventManager setReachabilityChangeDebounceCount:](self, "setReachabilityChangeDebounceCount:", -[HMDCameraRecordingReachabilityEventManager reachabilityChangeDebounceCount](self, "reachabilityChangeDebounceCount")+ 1);
  -[HMDCameraRecordingReachabilityEventManager reachabilityChangeDebounceTimer](self, "reachabilityChangeDebounceTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    -[HMDCameraRecordingReachabilityEventManager startReachabilityChangeDebounceTimerWithReachability:](self, "startReachabilityChangeDebounceTimerWithReachability:", v3);
}

- (void)handleInitialCameraReachability
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  char v10;

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  LOBYTE(v3) = -[HMDCameraRecordingReachabilityEventManager currentCameraReachability](self, "currentCameraReachability");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager setSuppressNotificationsBeforeDate:](self, "setSuppressNotificationsBeforeDate:", v4);
  -[HMDCameraRecordingReachabilityEventManager performCloudPullWithLabel:](self, "performCloudPullWithLabel:", CFSTR("Fetch initial reachability events"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__HMDCameraRecordingReachabilityEventManager_handleInitialCameraReachability__block_invoke;
  v8[3] = &unk_24E78CA68;
  v10 = (char)v3;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addSuccessBlock:", v8);

}

- (BOOL)shouldAddInitialReachabilityEventForCurrentCameraReachability:(BOOL)a3 mostRecentReachabilityEventModel:(id)a4
{
  int v4;
  id v6;
  NSObject *v7;

  v4 = a3;
  v6 = a4;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
    v4 ^= objc_msgSend(v6, "reachable");
  else
    LOBYTE(v4) = v4 ^ 1;

  return v4;
}

- (id)fetchReachabilityEventsWithDateInterval:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HMDCameraRecordingReachabilityEventManager localZone](self, "localZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryModelsOfType:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __86__HMDCameraRecordingReachabilityEventManager_fetchReachabilityEventsWithDateInterval___block_invoke;
  v16 = &unk_24E78CA90;
  v17 = v4;
  v18 = v6;
  v9 = v6;
  v10 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v13);
  v11 = (void *)objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v11;
}

- (void)addCameraReachabilityEventForCurrentCameraReachability:(BOOL)a3 dateOfOccurrence:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDCameraRecordingReachabilityEventManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v4 = a3;
  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDCameraRecordingReachabilityEventManager reachabilityEventModelForCurrentCameraReachability:dateOfOccurrence:](self, "reachabilityEventModelForCurrentCameraReachability:dateOfOccurrence:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v33 = v12;
    v34 = 2112;
    v35 = v8;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding camera reachability event model %@ with current reachability: %@ date of occurrence: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Create camera reachability event"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager localZone](v10, "localZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "createModels:options:", v14, v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke;
  v31[3] = &unk_24E7975C0;
  v31[4] = v10;
  objc_msgSend(v15, "flatMap:", v31);
  v26 = v6;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BE6B628];
  -[HMDCameraRecordingReachabilityEventManager workQueue](v10, "workQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "schedulerWithDispatchQueue:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reschedule:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke_66;
  v30[3] = &unk_24E797628;
  v30[4] = v10;
  objc_msgSend(v21, "addSuccessBlock:", v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke_2;
  v28[3] = &unk_24E79BCC8;
  v28[4] = v10;
  v29 = v8;
  v23 = v8;
  v24 = (id)objc_msgSend(v22, "addFailureBlock:", v28);

  -[HMDCameraRecordingReachabilityEventManager submitLogEventWithCurrentModel:](v10, "submitLogEventWithCurrentModel:", v23);
  -[HMDCameraRecordingReachabilityEventManager setMostRecentReachabilityEventModel:](v10, "setMostRecentReachabilityEventModel:", v23);

}

- (void)notifySubscribersOfRemoteCameraReachabilityEvent
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraRecordingReachabilityEventManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDCameraRecordingReachabilityEventManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDCameraRecordingReachabilityEventManager *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingReachabilityEventManager hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "cameraBulletinNotificationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "devicesToNotifyForCameraReachabilityForAccessory:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "hmf_isEmpty"))
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
          v24 = v13;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@No devices need to be notified for accessory reachability event", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
      }
      else
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __94__HMDCameraRecordingReachabilityEventManager_notifySubscribersOfRemoteCameraReachabilityEvent__block_invoke;
        v22[3] = &unk_24E78CAB8;
        v22[4] = self;
        objc_msgSend(v9, "na_each:", v22);
      }

    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v21;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil when attempting to notify subscribers", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
    }

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
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory reference was nil when attempting to notify subscribers", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)notifyTransportOfUpdatedEvents:(id)a3 removedEventUUIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDCameraRecordingReachabilityEventManager *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCameraRecordingReachabilityEventManager clientConnections](self, "clientConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingReachabilityEventManager clientConnections](v12, "clientConnections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v42 = v15;
      v43 = 2048;
      v44 = objc_msgSend(v16, "count");
      v45 = 2048;
      v46 = objc_msgSend(v6, "count");
      v47 = 2048;
      v48 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribed transports of %lu updated events, %lu removed events", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v39[0] = *MEMORY[0x24BDD55A8];
    v32 = v6;
    encodeRootObjectForIncomingXPCMessage(v6, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = *MEMORY[0x24BDD5598];
    v40[0] = v17;
    v31 = v7;
    v40[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[HMDCameraRecordingReachabilityEventManager clientConnections](v12, "clientConnections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      v22 = *MEMORY[0x24BDD5560];
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v23);
          objc_msgSend(MEMORY[0x24BE3F1D0], "entitledMessageWithName:messagePayload:", v22, v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setTransport:", v24);
          v26 = objc_alloc(MEMORY[0x24BE3F1B8]);
          -[HMDCameraRecordingReachabilityEventManager messageTargetUUID](v12, "messageTargetUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v26, "initWithTarget:", v27);
          objc_msgSend(v25, "setDestination:", v28);

          objc_msgSend(v25, "setRequiresCameraClipsEntitlement");
          -[HMDCameraRecordingReachabilityEventManager messageDispatcher](v12, "messageDispatcher");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "sendMessage:", v25);

          ++v23;
        }
        while (v20 != v23);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v20);
    }

    v7 = v31;
    v6 = v32;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v30;
      v43 = 2048;
      v44 = objc_msgSend(v6, "count");
      v45 = 2048;
      v46 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed transports to notify of %lu updated events, %lu removed events", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (id)reachabilityEventModelForCurrentCameraReachability:(BOOL)a3 dateOfOccurrence:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  HMDCameraRecordingReachabilityEventModel *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCameraRecordingReachabilityEventModel *v12;

  v4 = a3;
  v6 = a4;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = [HMDCameraRecordingReachabilityEventModel alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager hapAccessory](self, "hapAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMBModel initWithModelID:parentModelID:](v8, "initWithModelID:parentModelID:", v9, v11);

  -[HMDCameraRecordingReachabilityEventModel setReachable:](v12, "setReachable:", v4);
  -[HMDCameraRecordingReachabilityEventModel setDateOfOccurrence:](v12, "setDateOfOccurrence:", v6);

  return v12;
}

- (void)submitLogEventWithCurrentModel:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  HMDCameraRecordingReachabilityEventManager *v12;
  NSObject *v13;
  void *v14;
  HMDCameraRecordingReachabilityLogEvent *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  HMDCameraRecordingReachabilityLogEvent *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = 0.0;
  if (objc_msgSend(v4, "reachable"))
  {
    -[HMDCameraRecordingReachabilityEventManager mostRecentReachabilityEventModel](self, "mostRecentReachabilityEventModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      _HMFPreconditionFailure();
    v7 = v6;
    objc_msgSend(v6, "dateOfOccurrence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "dateOfOccurrence");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v8);
      v5 = v10;

    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v14;
        v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_FAULT, "%{public}@Most recent reachability event model has no date of occurrence: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
  v15 = [HMDCameraRecordingReachabilityLogEvent alloc];
  if (v4)
    v16 = objc_msgSend(v4, "reachable");
  else
    v16 = -[HMDCameraRecordingReachabilityEventManager currentCameraReachability](self, "currentCameraReachability");
  v17 = v16;
  v18 = -[HMDCameraRecordingReachabilityEventManager reachabilityChangeDebounceCount](self, "reachabilityChangeDebounceCount");
  -[HMDCameraRecordingReachabilityEventManager hapAccessory](self, "hapAccessory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HMDCameraRecordingReachabilityLogEvent initWithReachability:didCreateEventModel:reachabilityChangeDebounceCount:offlineDuration:hapAccessory:](v15, "initWithReachability:didCreateEventModel:reachabilityChangeDebounceCount:offlineDuration:hapAccessory:", v17, v4 != 0, v18, v19, v5);

  -[HMDCameraRecordingReachabilityEventManager logEventSubmitter](self, "logEventSubmitter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "submitLogEvent:", v20);

  -[HMDCameraRecordingReachabilityEventManager setReachabilityChangeDebounceCount:](self, "setReachabilityChangeDebounceCount:", 0);
}

- (id)performCloudPullWithLabel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDCameraRecordingReachabilityEventManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingReachabilityEventManager cloudZone](self, "cloudZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingReachabilityEventManager cloudZone](self, "cloudZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performCloudPullWithOptions:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BE6B628];
    -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "schedulerWithDispatchQueue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reschedule:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __72__HMDCameraRecordingReachabilityEventManager_performCloudPullWithLabel___block_invoke;
    v22[3] = &unk_24E79BCC8;
    v22[4] = self;
    v23 = v7;
    v14 = v7;
    objc_msgSend(v13, "addFailureBlock:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

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
      v25 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform cloud pull because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v20 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (double)initialReachabilityTimeout
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("cameraInitialReachabilityTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)updateInitialReachabilityTimer
{
  NSObject *v3;
  void *v4;
  HMDCameraRecordingReachabilityEventManager *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDCameraRecordingReachabilityEventManager shouldHandleReachabilityChanges](self, "shouldHandleReachabilityChanges"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting initial reachability timer", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDCameraRecordingReachabilityEventManager setReachabilityChangeDebounceTimer:](v5, "setReachabilityChangeDebounceTimer:", 0);
    v8 = objc_alloc_init(MEMORY[0x24BE6B608]);
    -[HMDCameraRecordingReachabilityEventManager setDidHandleInitialReachabilityFuture:](v5, "setDidHandleInitialReachabilityFuture:", v8);

    -[HMDCameraRecordingReachabilityEventManager initialReachabilityTimerFactory](v5, "initialReachabilityTimerFactory");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingReachabilityEventManager initialReachabilityTimeout](v5, "initialReachabilityTimeout");
    v9[2](v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingReachabilityEventManager setInitialReachabilityTimer:](v5, "setInitialReachabilityTimer:", v10);

    -[HMDCameraRecordingReachabilityEventManager initialReachabilityTimer](v5, "initialReachabilityTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v5);

    -[HMDCameraRecordingReachabilityEventManager workQueue](v5, "workQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingReachabilityEventManager initialReachabilityTimer](v5, "initialReachabilityTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegateQueue:", v12);

    -[HMDCameraRecordingReachabilityEventManager initialReachabilityTimer](v5, "initialReachabilityTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

  }
  else
  {
    -[HMDCameraRecordingReachabilityEventManager setInitialReachabilityTimer:](self, "setInitialReachabilityTimer:", 0);
    -[HMDCameraRecordingReachabilityEventManager setReachabilityChangeDebounceTimer:](self, "setReachabilityChangeDebounceTimer:", 0);
  }
}

- (double)reachabilityChangeReachableDebounceTimeout
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("reachabilityChangeReachableDebounceTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)reachabilityChangeUnreachableDebounceTimeout
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("reachabilityChangeUnreachableDebounceTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)startReachabilityChangeDebounceTimerWithReachability:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  HMDCameraRecordingReachabilityEventManager *v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, double);
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

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v3)
    v6 = -[HMDCameraRecordingReachabilityEventManager reachabilityChangeReachableDebounceTimeout](self, "reachabilityChangeReachableDebounceTimeout");
  else
    v6 = -[HMDCameraRecordingReachabilityEventManager reachabilityChangeUnreachableDebounceTimeout](self, "reachabilityChangeUnreachableDebounceTimeout");
  v8 = v7;
  v9 = (void *)MEMORY[0x227676638](v6);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v12;
    v22 = 2048;
    v23 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting reachability change debounce timer with time interval of %fs", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCameraRecordingReachabilityEventManager reachabilityChangeDebounceTimerFactory](v10, "reachabilityChangeDebounceTimerFactory");
  v13 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v13[2](v13, 0, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager setReachabilityChangeDebounceTimer:](v10, "setReachabilityChangeDebounceTimer:", v14);

  -[HMDCameraRecordingReachabilityEventManager reachabilityChangeDebounceTimer](v10, "reachabilityChangeDebounceTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", v10);

  -[HMDCameraRecordingReachabilityEventManager workQueue](v10, "workQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager reachabilityChangeDebounceTimer](v10, "reachabilityChangeDebounceTimer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegateQueue:", v16);

  -[HMDCameraRecordingReachabilityEventManager reachabilityChangeDebounceTimer](v10, "reachabilityChangeDebounceTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resume");

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager setReachabilityChangeDebounceStartDate:](v10, "setReachabilityChangeDebounceStartDate:", v19);

}

- (id)mostRecentReachabilityEventModelInModels:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__174647;
  v11 = __Block_byref_object_dispose__174648;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__HMDCameraRecordingReachabilityEventManager_mostRecentReachabilityEventModelInModels___block_invoke;
  v6[3] = &unk_24E78CAE0;
  v6[4] = &v7;
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)handleResidentDeviceConfirmedStateChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__HMDCameraRecordingReachabilityEventManager_handleResidentDeviceConfirmedStateChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleCameraProfileSettingsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__HMDCameraRecordingReachabilityEventManager_handleCameraProfileSettingsDidChange___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryConfigured:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HMDCameraRecordingReachabilityEventManager_handleAccessoryConfigured___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleAccessoryUnconfigured:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__HMDCameraRecordingReachabilityEventManager_handleAccessoryUnconfigured___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleHMDBridgedAccessoryReachableNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__HMDCameraRecordingReachabilityEventManager_handleHMDBridgedAccessoryReachableNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleHMDBridgedAccessoryUnreachableNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__HMDCameraRecordingReachabilityEventManager_handleHMDBridgedAccessoryUnreachableNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleAppleAccountSettingsHomeStateUpdated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleRemoteCameraReachabilityChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingReachabilityEventManager *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to perform cloud pull for new reachability event", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v10 = -[HMDCameraRecordingReachabilityEventManager performCloudPullWithLabel:](v7, "performCloudPullWithLabel:", CFSTR("Fetching reachability events due to remote message"));
  objc_msgSend(v4, "respondWithSuccess");

}

- (void)handleFetchEventsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingReachabilityEventManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  unint64_t v19;
  void *v20;
  HMDCameraRecordingReachabilityEventManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDCameraRecordingReachabilityEventManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HMDCameraRecordingReachabilityEventManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

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
    *(_DWORD *)buf = 138543618;
    v49 = v9;
    v50 = 2112;
    v51 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to fetch events: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingReachabilityEventManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "dateForKey:", *MEMORY[0x24BDD5580]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateForKey:", *MEMORY[0x24BDD5588]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD5590]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD55A0]);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v12 && v13 && v14 && v15)
    {
      v44 = v13;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v12, v13);
      v18 = objc_msgSend(v16, "BOOLValue");
      v19 = objc_msgSend(v14, "unsignedIntegerValue");
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v7;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      v45 = v16;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v43 = v14;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v49 = v23;
        v50 = 2112;
        v51 = v17;
        v52 = 2048;
        v53 = v19;
        v54 = 2112;
        v55 = v24;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Fetching reachability event models with date interval: %@, limit: %lu, shouldOrderAscending: %@", buf, 0x2Au);

        v14 = v43;
      }

      objc_autoreleasePoolPop(v20);
      -[HMDCameraRecordingReachabilityEventManager fetchReachabilityEventsWithDateInterval:](v21, "fetchReachabilityEventsWithDateInterval:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");

      if (v18)
        v27 = &__block_literal_global_92_174623;
      else
        v27 = &__block_literal_global_93_174624;
      objc_msgSend(v26, "sortUsingComparator:", v27);
      v28 = v14;
      if (objc_msgSend(v26, "count") <= v19)
      {
        v29 = (void *)objc_msgSend(v26, "copy");
      }
      else
      {
        objc_msgSend(v26, "subarrayWithRange:", 0, v19);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v39 = v29;
      v13 = v44;
      objc_msgSend(v29, "na_map:", &__block_literal_global_95_174625);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = *MEMORY[0x24BDD55B0];
      encodeRootObjectForIncomingXPCMessage(v40, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v41;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v42);

      v14 = v28;
      v16 = v45;
    }
    else
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = v7;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v37;
        v50 = 2112;
        v51 = v38;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v17);
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = v7;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v33;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch events because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchCountOfEventsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingReachabilityEventManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraRecordingReachabilityEventManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraRecordingReachabilityEventManager *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  HMDCameraRecordingReachabilityEventManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDCameraRecordingReachabilityEventManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

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
    *(_DWORD *)buf = 138543618;
    v41 = v9;
    v42 = 2112;
    v43 = (uint64_t)v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to fetch count of events: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingReachabilityEventManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "messagePayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmf_dateForKey:", *MEMORY[0x24BDD5580]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "messagePayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmf_dateForKey:", *MEMORY[0x24BDD5588]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v13, v15);
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v7;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v20;
        v42 = 2112;
        v43 = (uint64_t)v16;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetching count of reachability event models with date interval: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDCameraRecordingReachabilityEventManager fetchReachabilityEventsWithDateInterval:](v18, "fetchReachabilityEventsWithDateInterval:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v18;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v21, "count");
        *(_DWORD *)buf = 138543874;
        v41 = v25;
        v42 = 2048;
        v43 = v26;
        v44 = 2112;
        v45 = v16;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched count of %lu events with date interval: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v21, "count", *MEMORY[0x24BDD5578]));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "respondWithPayload:", v28);
    }
    else
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = v7;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v36;
        v42 = 2112;
        v43 = (uint64_t)v37;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = v7;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v32;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch count of events because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (void)handleSubscribeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingReachabilityEventManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMDCameraRecordingReachabilityEventManager *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling subscribe message", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HMDCameraRecordingReachabilityEventManager clientConnections](v7, "clientConnections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v12);

    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v20);

  }
}

- (void)handleUnsubscribeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingReachabilityEventManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMDCameraRecordingReachabilityEventManager *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling unsubscribe message", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HMDCameraRecordingReachabilityEventManager clientConnections](v7, "clientConnections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v12);

    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unsubscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v20);

  }
}

- (void)handlePerformCloudPullMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingReachabilityEventManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling perform cloud pull message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingReachabilityEventManager performCloudPullWithLabel:](v7, "performCloudPullWithLabel:", CFSTR("Fetching reachability events due to client request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __76__HMDCameraRecordingReachabilityEventManager_handlePerformCloudPullMessage___block_invoke;
  v18[3] = &unk_24E79BCF0;
  v12 = v4;
  v19 = v12;
  objc_msgSend(v10, "addSuccessBlock:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __76__HMDCameraRecordingReachabilityEventManager_handlePerformCloudPullMessage___block_invoke_2;
  v16[3] = &unk_24E79BD80;
  v17 = v12;
  v14 = v12;
  v15 = (id)objc_msgSend(v13, "addFailureBlock:", v16);

}

- (void)handleDeleteAllEventsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingReachabilityEventManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HMDCameraRecordingReachabilityEventManager *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling delete all reachability events message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingReachabilityEventManager localZone](v7, "localZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDCameraRecordingReachabilityEventManager localZone](v7, "localZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BE4ED10];
    objc_msgSend(v4, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "optionsWithLabel:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllModelsOfTypes:options:", v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __75__HMDCameraRecordingReachabilityEventManager_handleDeleteAllEventsMessage___block_invoke;
    v23[3] = &unk_24E78FE58;
    v24 = v4;
    v17 = (id)objc_msgSend(v16, "addCompletionBlock:", v23);

    v18 = v24;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v7;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot delete clips because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);
  }

}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HMDCameraRecordingReachabilityEventManager *v11;

  v5 = a4;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__HMDCameraRecordingReachabilityEventManager_localZone_didProcessModelCreation___block_invoke;
  v9[3] = &unk_24E79C268;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HMDCameraRecordingReachabilityEventManager *v11;

  v5 = a4;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__HMDCameraRecordingReachabilityEventManager_localZone_didProcessModelDeletion___block_invoke;
  v9[3] = &unk_24E79C268;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraRecordingReachabilityEventManager *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received model update: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

  return 0;
}

- (void)clipManagerDidStart:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDCameraRecordingReachabilityEventManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager setLocalZone:](self, "setLocalZone:", v6);

  objc_msgSend(v4, "cloudZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingReachabilityEventManager setCloudZone:](self, "setCloudZone:", v7);

  -[HMDCameraRecordingReachabilityEventManager localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserverForAllModels:", self);

  -[HMDCameraRecordingReachabilityEventManager cleanUpEvents](self, "cleanUpEvents");
  -[HMDCameraRecordingReachabilityEventManager cloudZone](self, "cloudZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPerformedInitialFetch");

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingReachabilityEventManager suppressNotificationsBeforeDate](v12, "suppressNotificationsBeforeDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Suppressing all reachability notifications before %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingReachabilityEventManager setSuppressNotificationsBeforeDate:](v12, "setSuppressNotificationsBeforeDate:", v16);

  }
}

- (void)clipManagerDidStop:(id)a3
{
  NSObject *v4;

  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDCameraRecordingReachabilityEventManager setLocalZone:](self, "setLocalZone:", 0);
  -[HMDCameraRecordingReachabilityEventManager setCloudZone:](self, "setCloudZone:", 0);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  HMDCameraRecordingReachabilityEventManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL8 v18;
  void *v19;
  HMDCameraRecordingReachabilityEventManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingReachabilityEventManager initialReachabilityTimer](self, "initialReachabilityTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v18 = -[HMDCameraRecordingReachabilityEventManager isAccessoryReachable](self, "isAccessoryReachable");
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Initial reachability timer fired with isReachable: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDCameraRecordingReachabilityEventManager setLastKnownCameraReachability:](v20, "setLastKnownCameraReachability:", v18);
    -[HMDCameraRecordingReachabilityEventManager setCurrentCameraReachability:](v20, "setCurrentCameraReachability:", v18);
    -[HMDCameraRecordingReachabilityEventManager setInitialReachabilityTimer:](v20, "setInitialReachabilityTimer:", 0);
    -[HMDCameraRecordingReachabilityEventManager handleInitialCameraReachability](v20, "handleInitialCameraReachability");
  }
  else
  {
    -[HMDCameraRecordingReachabilityEventManager reachabilityChangeDebounceTimer](self, "reachabilityChangeDebounceTimer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraRecordingReachabilityEventManager lastKnownCameraReachability](v9, "lastKnownCameraReachability");
        HMFBooleanToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraRecordingReachabilityEventManager currentCameraReachability](v9, "currentCameraReachability");
        HMFBooleanToString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v11;
        v27 = 2114;
        v28 = v12;
        v29 = 2114;
        v30 = v13;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Reachability change debounce timer fired with last known reachability %{public}@ and current reachability %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      v14 = -[HMDCameraRecordingReachabilityEventManager lastKnownCameraReachability](v9, "lastKnownCameraReachability");
      if (v14 == -[HMDCameraRecordingReachabilityEventManager currentCameraReachability](v9, "currentCameraReachability"))
      {
        -[HMDCameraRecordingReachabilityEventManager submitLogEventWithCurrentModel:](v9, "submitLogEventWithCurrentModel:", 0);
      }
      else
      {
        -[HMDCameraRecordingReachabilityEventManager setLastKnownCameraReachability:](v9, "setLastKnownCameraReachability:", -[HMDCameraRecordingReachabilityEventManager currentCameraReachability](v9, "currentCameraReachability"));
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __59__HMDCameraRecordingReachabilityEventManager_timerDidFire___block_invoke;
        aBlock[3] = &unk_24E79BCF0;
        aBlock[4] = v9;
        v15 = _Block_copy(aBlock);
        -[HMDCameraRecordingReachabilityEventManager didHandleInitialReachabilityFuture](v9, "didHandleInitialReachabilityFuture");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id)objc_msgSend(v16, "addSuccessBlock:", v15);

      }
      -[HMDCameraRecordingReachabilityEventManager setReachabilityChangeDebounceTimer:](v9, "setReachabilityChangeDebounceTimer:", 0);
    }
  }

}

- (void)networkMonitorIsReachable:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingReachabilityEventManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received network monitor is reachable", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingReachabilityEventManager setCurrentDeviceConnectedToNetwork:](v7, "setCurrentDeviceConnectedToNetwork:", 1);

}

- (void)networkMonitorIsUnreachable:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingReachabilityEventManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingReachabilityEventManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received network monitor is unreachable", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingReachabilityEventManager setCurrentDeviceConnectedToNetwork:](v7, "setCurrentDeviceConnectedToNetwork:", 0);

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDCameraRecordingReachabilityEventManager hapAccessory](self, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isInternalBuild() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingReachabilityEventManager uniqueIdentifier](self, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@/%@"), v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDCameraRecordingReachabilityEventManager uniqueIdentifier](self, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (HMDHAPAccessory)hapAccessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_hapAccessory);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)objc_getProperty(self, a2, 48, 1);
}

- (HMDAppleAccountSettings)accountSettings
{
  return (HMDAppleAccountSettings *)objc_getProperty(self, a2, 56, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSHashTable)clientConnections
{
  return (NSHashTable *)objc_getProperty(self, a2, 80, 1);
}

- (void)setClientConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLogEventSubmitter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NAFuture)didHandleInitialReachabilityFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDidHandleInitialReachabilityFuture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)lastKnownCameraReachability
{
  return self->_lastKnownCameraReachability;
}

- (void)setLastKnownCameraReachability:(BOOL)a3
{
  self->_lastKnownCameraReachability = a3;
}

- (BOOL)currentCameraReachability
{
  return self->_currentCameraReachability;
}

- (void)setCurrentCameraReachability:(BOOL)a3
{
  self->_currentCameraReachability = a3;
}

- (BOOL)currentBridgedCameraReachability
{
  return self->_currentBridgedCameraReachability;
}

- (void)setCurrentBridgedCameraReachability:(BOOL)a3
{
  self->_currentBridgedCameraReachability = a3;
}

- (unint64_t)reachabilityChangeDebounceCount
{
  return self->_reachabilityChangeDebounceCount;
}

- (void)setReachabilityChangeDebounceCount:(unint64_t)a3
{
  self->_reachabilityChangeDebounceCount = a3;
}

- (HMDCameraRecordingReachabilityEventModel)mostRecentReachabilityEventModel
{
  return (HMDCameraRecordingReachabilityEventModel *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMostRecentReachabilityEventModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLocalZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCloudZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (HMFTimer)initialReachabilityTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInitialReachabilityTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (HMFTimer)reachabilityChangeDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setReachabilityChangeDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDate)reachabilityChangeDebounceStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setReachabilityChangeDebounceStartDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSDate)suppressNotificationsBeforeDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSuppressNotificationsBeforeDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (id)initialReachabilityTimerFactory
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setInitialReachabilityTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (id)reachabilityChangeDebounceTimerFactory
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setReachabilityChangeDebounceTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reachabilityChangeDebounceTimerFactory, 0);
  objc_storeStrong(&self->_initialReachabilityTimerFactory, 0);
  objc_storeStrong((id *)&self->_suppressNotificationsBeforeDate, 0);
  objc_storeStrong((id *)&self->_reachabilityChangeDebounceStartDate, 0);
  objc_storeStrong((id *)&self->_reachabilityChangeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_initialReachabilityTimer, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_mostRecentReachabilityEventModel, 0);
  objc_storeStrong((id *)&self->_didHandleInitialReachabilityFuture, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountSettings, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_currentSettings, 0);
}

void __59__HMDCameraRecordingReachabilityEventManager_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "currentCameraReachability");
  objc_msgSend(*(id *)(a1 + 32), "reachabilityChangeDebounceStartDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCameraReachabilityEventForCurrentCameraReachability:dateOfOccurrence:", v3, v4);

}

void __80__HMDCameraRecordingReachabilityEventManager_localZone_didProcessModelDeletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "debugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received deleted reachability event model: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "hmbModelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notifyTransportOfUpdatedEvents:removedEventUUIDs:", v12, v15);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(a1 + 32);
      v18 = 138543874;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      v22 = 2112;
      v23 = objc_opt_class();
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Deletion model %@ is not of expected type: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __80__HMDCameraRecordingReachabilityEventManager_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
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
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
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
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543618;
      v43 = v8;
      v44 = 2112;
      v45 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received new reachability event model: %@", (uint8_t *)&v42, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "createEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "debugDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138543618;
        v43 = v34;
        v44 = 2112;
        v45 = v35;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert reachability model into event: %@", (uint8_t *)&v42, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notifyTransportOfUpdatedEvents:removedEventUUIDs:", v11, v13);

    objc_msgSend(v10, "dateOfOccurrence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "suppressNotificationsBeforeDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "compare:", v15);

    if (v16 == -1)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dateOfOccurrence");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "suppressNotificationsBeforeDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138543874;
        v43 = v36;
        v44 = 2112;
        v45 = v37;
        v46 = 2112;
        v47 = v38;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Ignoring created event with date of occurrence %@ because it is before %@", (uint8_t *)&v42, 0x20u);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "currentSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "notificationSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isReachabilityEventNotificationEnabled");

      objc_msgSend(*(id *)(a1 + 40), "accountSettings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isHomeEnabled");

      v22 = (void *)MEMORY[0x227676638]();
      v23 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v19 && v21)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 138543618;
          v43 = v26;
          v44 = 2114;
          v45 = v10;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Inserting bulletin for new reachability event: %{public}@", (uint8_t *)&v42, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(*(id *)(a1 + 40), "bulletinBoard");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "hapAccessory");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v10, "isReachable");
        objc_msgSend(v10, "dateOfOccurrence");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "insertReachabilityEventBulletinForAccessory:reachable:date:", v28, v29, v30);

        goto LABEL_22;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138544130;
        v43 = v39;
        v44 = 2112;
        v45 = v10;
        v46 = 2112;
        v47 = v40;
        v48 = 2112;
        v49 = v41;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Not inserting bulletin for new reachability event: %@ due to reachabilityEventNotificationEnabled: %@ and isHomeEnabled: %@", (uint8_t *)&v42, 0x2Au);

      }
    }

    objc_autoreleasePoolPop(v22);
LABEL_22:

LABEL_23:
  }

}

uint64_t __75__HMDCameraRecordingReachabilityEventManager_handleDeleteAllEventsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __76__HMDCameraRecordingReachabilityEventManager_handlePerformCloudPullMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __76__HMDCameraRecordingReachabilityEventManager_handlePerformCloudPullMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

uint64_t __71__HMDCameraRecordingReachabilityEventManager_handleFetchEventsMessage___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createEvent");
}

uint64_t __71__HMDCameraRecordingReachabilityEventManager_handleFetchEventsMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __71__HMDCameraRecordingReachabilityEventManager_handleFetchEventsMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accountSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received notification of an updated home state with account settings - %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "accountSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHomeEnabled");

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSuppressNotificationsBeforeDate:", v9);

    objc_msgSend(*(id *)(a1 + 32), "performCloudPullWithLabel:", CFSTR("Fetching reachability events due to account settings changed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke_87;
    v15[3] = &unk_24E79BCF0;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "addSuccessBlock:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke_88;
    v14[3] = &unk_24E79BD80;
    v14[4] = *(_QWORD *)(a1 + 32);
    v13 = (id)objc_msgSend(v12, "addFailureBlock:", v14);

  }
}

void __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched the reachability events due to account settings changed", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

void __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke_88(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch the reachability events due to account settings changed with error - %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __95__HMDCameraRecordingReachabilityEventManager_handleHMDBridgedAccessoryUnreachableNotification___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
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
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrimary");

  if ((v3 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@HMDBridgedAccessoryUnreachableNotification for bridged camera %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentBridgedCameraReachability:", 0);
    objc_msgSend(*(id *)(a1 + 32), "handleUpdatedCameraReachability:", 0);
  }
}

void __93__HMDCameraRecordingReachabilityEventManager_handleHMDBridgedAccessoryReachableNotification___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
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
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrimary");

  if ((v3 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@HMDBridgedAccessoryReachableNotification for bridged camera %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentBridgedCameraReachability:", 1);
    objc_msgSend(*(id *)(a1 + 32), "handleUpdatedCameraReachability:", 1);
  }
}

uint64_t __74__HMDCameraRecordingReachabilityEventManager_handleAccessoryUnconfigured___block_invoke(uint64_t a1)
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

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Unconfigured camera %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "handleUpdatedCameraReachability:", 0);
}

uint64_t __72__HMDCameraRecordingReachabilityEventManager_handleAccessoryConfigured___block_invoke(uint64_t a1)
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

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Configured camera %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "handleUpdatedCameraReachability:", 1);
}

void __83__HMDCameraRecordingReachabilityEventManager_handleCameraProfileSettingsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543362;
    v31 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received camera profile settings did change notification", (uint8_t *)&v30, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "currentSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HMDCameraProfileSettingsNotificationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentSettings:", v10);
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hmf_BOOLForKey:", CFSTR("HMDCameraProfileSettingsIsInitialSettingsUpdateNotificationKey"));

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v6, "notificationSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isReachabilityEventNotificationEnabled");

      objc_msgSend(v10, "notificationSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isReachabilityEventNotificationEnabled");

      if ((v14 & 1) == 0)
      {
        if (v16)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 138543362;
            v31 = v20;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Reachability event notifications are now enabled", (uint8_t *)&v30, 0xCu);

          }
          objc_autoreleasePoolPop(v17);
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setSuppressNotificationsBeforeDate:", v21);

          v22 = (id)objc_msgSend(*(id *)(a1 + 32), "performCloudPullWithLabel:", CFSTR("Fetching reachability events due to enabling notifications"));
        }
      }
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "userInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("HMDCameraProfileSettingsNotificationKey"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138544130;
      v31 = v26;
      v32 = 2112;
      v33 = CFSTR("HMDCameraProfileSettingsNotificationKey");
      v34 = 2112;
      v35 = v27;
      v36 = 2112;
      v37 = v29;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Object for key %@ is not of expected type %@: %@", (uint8_t *)&v30, 0x2Au);

    }
    objc_autoreleasePoolPop(v23);
  }

}

uint64_t __100__HMDCameraRecordingReachabilityEventManager_handleResidentDeviceConfirmedStateChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentDeviceConfirmedPrimaryResident");

  result = objc_msgSend(*(id *)(a1 + 32), "isCurrentDeviceConfirmedPrimaryResident");
  if ((_DWORD)v4 != (_DWORD)result)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "isCurrentDeviceConfirmedPrimaryResident");
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notified that isCurrentDeviceConfirmedPrimaryResident changed from %@ to %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    return objc_msgSend(*(id *)(a1 + 32), "setCurrentDeviceConfirmedPrimaryResident:", v4);
  }
  return result;
}

void __87__HMDCameraRecordingReachabilityEventManager_mostRecentReachabilityEventModelInModels___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  v10 = v4;
  if (!v6)
    goto LABEL_4;
  objc_msgSend(v6, "dateOfOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (v9 == -1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v5 + 40), a2);
  }

}

void __72__HMDCameraRecordingReachabilityEventManager_performCloudPullWithLabel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform cloud pull with options %@ due to error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __94__HMDCameraRecordingReachabilityEventManager_notifySubscribersOfRemoteCameraReachabilityEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDRemoteMessage *v4;
  HMDRemoteDeviceMessageDestination *v5;
  void *v6;
  HMDRemoteDeviceMessageDestination *v7;
  HMDRemoteMessage *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = [HMDRemoteMessage alloc];
  v5 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v5, "initWithTarget:device:", v6, v3);
  v8 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:](v4, "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDRemoteCameraReachabilityDidChangeMessage"), v7, 0, 0, 1, 86400.0);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentCameraReachability");
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFObject shortDescription](v8, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying device %@ for camera reachability change to %@ using message: %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(*(id *)(a1 + 32), "messageDispatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendMessage:", v8);

}

id __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "mirrorOutputResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "mirrorOutputResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@No mirrorOutputResult future provided", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke_66(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifySubscribersOfRemoteCameraReachabilityEvent");
}

void __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to push event %@ to the cloud due to error: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __86__HMDCameraRecordingReachabilityEventManager_fetchReachabilityEventsWithDateInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsDate:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __77__HMDCameraRecordingReachabilityEventManager_handleInitialCameraReachability__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "fetchReachabilityEventsWithDateInterval:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mostRecentReachabilityEventModelInModels:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMostRecentReachabilityEventModel:", v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v11;
    v15 = v9;
    v16 = v8;
    v17 = v3;
    v18 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "mostRecentReachabilityEventModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createEvent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v14;
    v28 = 1024;
    v29 = v18;
    v3 = v17;
    v8 = v16;
    v9 = v15;
    v11 = v25;
    v30 = 2112;
    v31 = v20;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Determining should add initial reachability event using current reachability: %{BOOL}d, most recent reachability event: %@", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v11);
  v21 = *(void **)(a1 + 32);
  v22 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(v21, "mostRecentReachabilityEventModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v21, "shouldAddInitialReachabilityEventForCurrentCameraReachability:mostRecentReachabilityEventModel:", v22, v23);

  if ((_DWORD)v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "setReachabilityChangeDebounceCount:", 1);
    objc_msgSend(*(id *)(a1 + 32), "addCameraReachabilityEventForCurrentCameraReachability:dateOfOccurrence:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "didHandleInitialReachabilityFuture");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "finishWithNoResult");

}

id __59__HMDCameraRecordingReachabilityEventManager_cleanUpEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "hmbModelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hmbModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "hmbModelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __152__HMDCameraRecordingReachabilityEventManager_initWithAccessory_workQueue_identifier_bulletinBoard_logEventSubmitter_accountSettings_notificationCenter___block_invoke_2(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

id __152__HMDCameraRecordingReachabilityEventManager_initWithAccessory_workQueue_identifier_bulletinBoard_logEventSubmitter_accountSettings_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t67_174725 != -1)
    dispatch_once(&logCategory__hmf_once_t67_174725, &__block_literal_global_101_174726);
  return (id)logCategory__hmf_once_v68_174727;
}

void __57__HMDCameraRecordingReachabilityEventManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v68_174727;
  logCategory__hmf_once_v68_174727 = v0;

}

@end
