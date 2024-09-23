@implementation HMDWidgetTimelineRefresher

- (HMDWidgetTimelineRefresher)initWithHomeManager:(id)a3
{
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  id v9;
  HMDWidgetConfigurationReader *v10;
  HMDWidgetTimelineController *v11;
  void *v12;
  void *v13;
  HMDWidgetTimelineRefresher *v14;
  id v16;

  v4 = a3;
  HMDispatchQueueNameString();
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v16, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create(v5, v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD7608]);
  v10 = objc_alloc_init(HMDWidgetConfigurationReader);
  v11 = objc_alloc_init(HMDWidgetTimelineController);
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A0]), "initWithOptions:", 0);
  v14 = -[HMDWidgetTimelineRefresher initWithHomeManager:queue:notificationCenter:darwinNotificationProvider:widgetConfigurationReader:timelineController:logEventSubmitter:timerManager:reachabilityUpdateDispatchDelayNs:forceUpdateTimelineDispatchDelayNs:](self, "initWithHomeManager:queue:notificationCenter:darwinNotificationProvider:widgetConfigurationReader:timelineController:logEventSubmitter:timerManager:reachabilityUpdateDispatchDelayNs:forceUpdateTimelineDispatchDelayNs:", v4, v7, v8, v9, v10, v11, v12, v13, 1000000000, 333333333);

  return v14;
}

- (HMDWidgetTimelineRefresher)initWithHomeManager:(id)a3 queue:(id)a4 notificationCenter:(id)a5 darwinNotificationProvider:(id)a6 widgetConfigurationReader:(id)a7 timelineController:(id)a8 logEventSubmitter:(id)a9 timerManager:(id)a10 reachabilityUpdateDispatchDelayNs:(int64_t)a11 forceUpdateTimelineDispatchDelayNs:(int64_t)a12
{
  id v18;
  id v19;
  HMDWidgetTimelineRefresher *v20;
  HMDWidgetTimelineRefresher *v21;
  uint64_t v22;
  NSSet *widgetKindsToUpdate;
  uint64_t v24;
  NSMutableDictionary *accessoryIsReachableByUUID;
  __CFString *v26;
  uint64_t v27;
  NSString *clientIdentifier;
  uint64_t v29;
  NSSet *monitoredCharacteristics;
  uint64_t v31;
  NSString *clientIdentifierForExplicitlyMonitoredCharacteristics;
  uint64_t v33;
  NSMutableDictionary *monitoredCharacteristicsMapByWidget;
  uint64_t v35;
  NSMutableDictionary *monitoredActionSetsMapByWidget;
  uint64_t v37;
  NSMapTable *cachedValueByCharacteristic;
  uint64_t v39;
  NSMapTable *cachedIsOnStateByActionSet;
  uint64_t v41;
  NSMapTable *pendingRequestValueByUUID;
  uint64_t v43;
  NSMutableDictionary *cachedActionSetExecuteErrorByUUID;
  uint64_t v45;
  NSMutableDictionary *cachedActionSetExecuteErrorTimerContextByUUID;
  uint64_t v47;
  NSSet *activeWidgetKinds;
  uint64_t v49;
  NSMutableDictionary *characteristicsToPreviouslySeenValues;
  dispatch_source_t v51;
  OS_dispatch_source *widgetRefreshDispatchTimer;
  uint64_t v53;
  NSSet *widgetRefreshCoalesceKinds;
  uint64_t v55;
  NSMutableSet *actionSetsPendingPrimaryResidentStateUpdates;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  void *v62;
  HMDWidgetTimelineRefresher *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id forceUpdateAutobahnTimelineHandler;
  void *v73;
  id fetchAndStoreActiveWidgetKindsHandler;
  HMDWidgetTimelineRefresher *v75;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD aBlock[4];
  id v87;
  objc_super v88;
  __int128 v89;
  __int128 v90;
  _BYTE buf[18];
  __int16 v92;
  __int128 *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  __int128 *v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v19 = a4;
  v83 = a5;
  v82 = a6;
  v81 = a7;
  v80 = a8;
  v79 = a9;
  v78 = a10;
  v88.receiver = self;
  v88.super_class = (Class)HMDWidgetTimelineRefresher;
  v20 = -[HMDWidgetTimelineRefresher init](&v88, sel_init);
  v21 = v20;
  if (v20)
  {
    v77 = v19;
    objc_storeWeak((id *)&v20->_homeManager, v18);
    objc_storeStrong((id *)&v21->_workQueue, a4);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    widgetKindsToUpdate = v21->_widgetKindsToUpdate;
    v21->_widgetKindsToUpdate = (NSSet *)v22;

    v24 = objc_opt_new();
    accessoryIsReachableByUUID = v21->_accessoryIsReachableByUUID;
    v21->_accessoryIsReachableByUUID = (NSMutableDictionary *)v24;

    objc_storeStrong((id *)&v21->_notificationCenter, a5);
    objc_storeStrong((id *)&v21->_darwinNotificationProvider, a6);
    objc_storeStrong((id *)&v21->_widgetConfigurationReader, a7);
    objc_storeStrong((id *)&v21->_timelineController, a8);
    objc_storeStrong((id *)&v21->_logEventSubmitter, a9);
    objc_storeStrong((id *)&v21->_timerManager, a10);
    -[HMFTimerManager setDelegate:](v21->_timerManager, "setDelegate:", v21);
    -[HMFTimerManager setDelegateQueue:](v21->_timerManager, "setDelegateQueue:", v21->_workQueue);
    v26 = CFSTR("com.apple.HomeKitDaemon");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.HMDWidgetTimelineRefresher.Autobahn"), CFSTR("com.apple.HomeKitDaemon"));
    v27 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v21->_clientIdentifier;
    v21->_clientIdentifier = (NSString *)v27;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v29 = objc_claimAutoreleasedReturnValue();
    monitoredCharacteristics = v21->_monitoredCharacteristics;
    v21->_monitoredCharacteristics = (NSSet *)v29;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.HMDWidgetTimelineRefresher"), CFSTR("com.apple.HomeKitDaemon"));
    v31 = objc_claimAutoreleasedReturnValue();
    clientIdentifierForExplicitlyMonitoredCharacteristics = v21->_clientIdentifierForExplicitlyMonitoredCharacteristics;
    v21->_clientIdentifierForExplicitlyMonitoredCharacteristics = (NSString *)v31;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v33 = objc_claimAutoreleasedReturnValue();
    monitoredCharacteristicsMapByWidget = v21->_monitoredCharacteristicsMapByWidget;
    v21->_monitoredCharacteristicsMapByWidget = (NSMutableDictionary *)v33;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v35 = objc_claimAutoreleasedReturnValue();
    monitoredActionSetsMapByWidget = v21->_monitoredActionSetsMapByWidget;
    v21->_monitoredActionSetsMapByWidget = (NSMutableDictionary *)v35;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v37 = objc_claimAutoreleasedReturnValue();
    cachedValueByCharacteristic = v21->_cachedValueByCharacteristic;
    v21->_cachedValueByCharacteristic = (NSMapTable *)v37;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v39 = objc_claimAutoreleasedReturnValue();
    cachedIsOnStateByActionSet = v21->_cachedIsOnStateByActionSet;
    v21->_cachedIsOnStateByActionSet = (NSMapTable *)v39;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v41 = objc_claimAutoreleasedReturnValue();
    pendingRequestValueByUUID = v21->_pendingRequestValueByUUID;
    v21->_pendingRequestValueByUUID = (NSMapTable *)v41;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v43 = objc_claimAutoreleasedReturnValue();
    cachedActionSetExecuteErrorByUUID = v21->_cachedActionSetExecuteErrorByUUID;
    v21->_cachedActionSetExecuteErrorByUUID = (NSMutableDictionary *)v43;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v45 = objc_claimAutoreleasedReturnValue();
    cachedActionSetExecuteErrorTimerContextByUUID = v21->_cachedActionSetExecuteErrorTimerContextByUUID;
    v21->_cachedActionSetExecuteErrorTimerContextByUUID = (NSMutableDictionary *)v45;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v47 = objc_claimAutoreleasedReturnValue();
    activeWidgetKinds = v21->_activeWidgetKinds;
    v21->_activeWidgetKinds = (NSSet *)v47;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v49 = objc_claimAutoreleasedReturnValue();
    characteristicsToPreviouslySeenValues = v21->_characteristicsToPreviouslySeenValues;
    v21->_characteristicsToPreviouslySeenValues = (NSMutableDictionary *)v49;

    v51 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v21->_workQueue);
    widgetRefreshDispatchTimer = v21->_widgetRefreshDispatchTimer;
    v21->_widgetRefreshDispatchTimer = (OS_dispatch_source *)v51;

    v21->_homeSensingChangedNotificationToken = -1;
    v21->_selectedHomeChangedNotificationToken = -1;
    v21->_reachabilityUpdateDispatchDelayNs = a11;
    v21->_forceUpdateTimelineDispatchDelayNs = a12;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v53 = objc_claimAutoreleasedReturnValue();
    widgetRefreshCoalesceKinds = v21->_widgetRefreshCoalesceKinds;
    v21->_widgetRefreshCoalesceKinds = (NSSet *)v53;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v55 = objc_claimAutoreleasedReturnValue();
    actionSetsPendingPrimaryResidentStateUpdates = v21->_actionSetsPendingPrimaryResidentStateUpdates;
    v21->_actionSetsPendingPrimaryResidentStateUpdates = (NSMutableSet *)v55;

    objc_msgSend(v18, "currentHomeUUID");
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v57;
    if (v57)
    {
      v59 = 0;
      v60 = (void *)v57;
    }
    else
    {
      objc_msgSend(v18, "primaryHomeUUID");
      v61 = objc_claimAutoreleasedReturnValue();
      v26 = (__CFString *)v61;
      if (v61)
      {
        v59 = 0;
        v60 = (void *)v61;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 1;
      }
    }
    objc_storeStrong((id *)&v21->_currentHomeUUID, v60);
    if (v59)

    if (!v58)
    v62 = (void *)MEMORY[0x227676638]();
    v63 = v21;
    HMFGetOSLogHandle();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v18, "primaryHomeUUID");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        objc_msgSend(v18, "primaryHomeUUID");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v90 = *(_OWORD *)buf;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v18, "currentHomeUUID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68)
      {
        objc_msgSend(v18, "currentHomeUUID");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v89 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v65;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v92 = 2096;
      v93 = &v90;
      v94 = 1040;
      v95 = 16;
      v96 = 2096;
      v97 = &v89;
      _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_INFO, "%{public}@primary home is %{uuid_t}.16P, current home is %{uuid_t}.16P", buf, 0x2Cu);

    }
    objc_autoreleasePoolPop(v62);
    objc_initWeak((id *)buf, v63);
    v70 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __247__HMDWidgetTimelineRefresher_initWithHomeManager_queue_notificationCenter_darwinNotificationProvider_widgetConfigurationReader_timelineController_logEventSubmitter_timerManager_reachabilityUpdateDispatchDelayNs_forceUpdateTimelineDispatchDelayNs___block_invoke;
    aBlock[3] = &unk_24E77D6D0;
    objc_copyWeak(&v87, (id *)buf);
    v71 = _Block_copy(aBlock);
    forceUpdateAutobahnTimelineHandler = v63->_forceUpdateAutobahnTimelineHandler;
    v63->_forceUpdateAutobahnTimelineHandler = v71;

    v84[0] = v70;
    v84[1] = 3221225472;
    v84[2] = __247__HMDWidgetTimelineRefresher_initWithHomeManager_queue_notificationCenter_darwinNotificationProvider_widgetConfigurationReader_timelineController_logEventSubmitter_timerManager_reachabilityUpdateDispatchDelayNs_forceUpdateTimelineDispatchDelayNs___block_invoke_2;
    v84[3] = &unk_24E797318;
    objc_copyWeak(&v85, (id *)buf);
    v73 = _Block_copy(v84);
    fetchAndStoreActiveWidgetKindsHandler = v63->_fetchAndStoreActiveWidgetKindsHandler;
    v63->_fetchAndStoreActiveWidgetKindsHandler = v73;

    v75 = v63;
    objc_destroyWeak(&v85);
    objc_destroyWeak(&v87);
    objc_destroyWeak((id *)buf);
    v19 = v77;
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_homeSensingChangedNotificationToken != -1)
  {
    -[HMDWidgetTimelineRefresher darwinNotificationProvider](self, "darwinNotificationProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notifyCancel:", self->_homeSensingChangedNotificationToken);

  }
  if (self->_selectedHomeChangedNotificationToken != -1)
  {
    -[HMDWidgetTimelineRefresher darwinNotificationProvider](self, "darwinNotificationProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notifyCancel:", self->_selectedHomeChangedNotificationToken);

  }
  v5.receiver = self;
  v5.super_class = (Class)HMDWidgetTimelineRefresher;
  -[HMDWidgetTimelineRefresher dealloc](&v5, sel_dealloc);
}

- (void)configure
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
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  HMDWidgetTimelineRefresher *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _QWORD handler[4];
  id v39;
  _QWORD block[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE location[12];
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[HMDWidgetTimelineRefresher homeManager](self, "homeManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_processCharacteristicsChangedNotification_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleCurrentOrPrimaryHomeChangedNotification_, CFSTR("HMDNotificationCurrentHomeDidChange"), v37);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleCurrentOrPrimaryHomeChangedNotification_, CFSTR("HMDNotificationPrimaryHomeDidChange"), v37);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleHomeAddedNotification_, CFSTR("HMDHomeAddedNotification"), v37);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleHomeRemovedNotification_, CFSTR("HMDHomeRemovedNotification"), v37);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleAccessoryAddedNotification_, CFSTR("HMDNotificationHomeAddedAccessory"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleAccessoryRemovedNotification_, CFSTR("HMDHomeAccessoryRemovedNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleResidentDeviceChangedNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_handleResidentDeviceAddedOrRemovedNotification_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_handleResidentDeviceAddedOrRemovedNotification_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_handleAccessoryReachabilityChangedNotification_, CFSTR("HMDAccessoryIsRemotelyReachableNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_handleAccessoryReachabilityChangedNotification_, CFSTR("HMDAccessoryIsNotRemotelyReachableNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_handleAccessoryRemoteReachabilityChangedNotification_, CFSTR("HMDAccessoryIsRemotelyReachableNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_handleAccessoryRemoteReachabilityChangedNotification_, CFSTR("HMDAccessoryIsNotRemotelyReachableNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_handleNotifiedXPCClientsOfHomeConfigurationChangeNotification_, CFSTR("HMDHomeManagerNotifiedXPCClientsOfHomeConfigurationChangeNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_handleRestrictedGuestScheduleStartedNotification_, CFSTR("HMDUserRestrictedGuestScheduleStartedNotification"), 0);

    -[HMDWidgetTimelineRefresher notificationCenter](self, "notificationCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_handleRestrictedGuestScheduleEndedNotification_, CFSTR("HMDUserRestrictedGuestScheduleEndedNotification"), 0);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    +[HMDWidgetFetchSpecification allHomeLockScreenWidgetKinds](HMDWidgetFetchSpecification, "allHomeLockScreenWidgetKinds");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v20);
          v24 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObserver:selector:name:object:suspensionBehavior:", self, sel_handleNotificationOfPossibleNewWidget_, v24, 0, 4);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v21);
    }

    objc_msgSend(v37, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher registerForMessagesWithMessageDispatcher:](self, "registerForMessagesWithMessageDispatcher:", v26);

    -[HMDWidgetTimelineRefresher registerForDarwinNotifications](self, "registerForDarwinNotifications");
    -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__HMDWidgetTimelineRefresher_configure__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v27, block);

    -[HMDWidgetTimelineRefresher widgetRefreshDispatchTimer](self, "widgetRefreshDispatchTimer");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v29, v30, 0x68C61714000uLL, 0x8BB2C97000uLL);

    objc_initWeak((id *)location, self);
    -[HMDWidgetTimelineRefresher widgetRefreshDispatchTimer](self, "widgetRefreshDispatchTimer");
    v31 = objc_claimAutoreleasedReturnValue();
    handler[0] = v28;
    handler[1] = 3221225472;
    handler[2] = __39__HMDWidgetTimelineRefresher_configure__block_invoke_2;
    handler[3] = &unk_24E797318;
    objc_copyWeak(&v39, (id *)location);
    dispatch_source_set_event_handler(v31, handler);

    -[HMDWidgetTimelineRefresher widgetRefreshDispatchTimer](self, "widgetRefreshDispatchTimer");
    v32 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v32);

    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v36;
      v47 = 2080;
      v48 = "-[HMDWidgetTimelineRefresher configure]";
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil during %s, no widgets configured.", location, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
  }

}

- (void)registerForMessagesWithMessageDispatcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7268], self, v6, sel_handleMonitorCharacteristicsForWidget_);
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7250], self, v6, sel_handleFetchState_);
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7270], self, v6, sel_handlePerformRequests_);
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7260], self, v6, sel_handleMonitorActionSetsForWidget_);
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7258], self, v6, sel_handleFetchStateForActionSets_);

}

- (void)registerForDarwinNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  HMDWidgetTimelineRefresher *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMDWidgetTimelineRefresher *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  -[HMDWidgetTimelineRefresher darwinNotificationProvider](self, "darwinNotificationProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __60__HMDWidgetTimelineRefresher_registerForDarwinNotifications__block_invoke;
  v20[3] = &unk_24E792558;
  objc_copyWeak(&v21, &location);
  v6 = objc_msgSend(v3, "notifyRegisterDispatch:outToken:queue:handler:", "com.apple.Home.homeSensingChanged", &self->_homeSensingChangedNotificationToken, v4, v20);

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v10;
      v25 = 2080;
      v26 = "com.apple.Home.homeSensingChanged";
      v27 = 1024;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to register notification for %s with error: %d", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v7);
  }
  -[HMDWidgetTimelineRefresher darwinNotificationProvider](self, "darwinNotificationProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __60__HMDWidgetTimelineRefresher_registerForDarwinNotifications__block_invoke_139;
  v18[3] = &unk_24E792558;
  objc_copyWeak(&v19, &location);
  v13 = objc_msgSend(v11, "notifyRegisterDispatch:outToken:queue:handler:", "com.apple.Home.selectedHomeChanged", &self->_selectedHomeChangedNotificationToken, v12, v18);

  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v17;
      v25 = 2080;
      v26 = "com.apple.Home.selectedHomeChanged";
      v27 = 1024;
      v28 = v13;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to register notification for %s with error: %d", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v14);
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (id)internalMonitorCharacteristicsForCurrentHome:(id)a3 activeWidgetKinds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDWidgetTimelineRefresher *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDWidgetTimelineRefresher *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if (v6)
  {
    if (self && objc_msgSend(v6, "hasAnyResident"))
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
        *(_DWORD *)buf = 138543618;
        v39 = v12;
        v40 = 2112;
        v41 = v13;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating monitored characteristics for current home: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend((id)objc_opt_class(), "fetchSpecificationsForWidgetKinds:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWidgetTimelineRefresher monitorCharacteristicsForHome:fetchSpecifications:](v10, "monitorCharacteristicsForHome:fetchSpecifications:", v6, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unionSet:", v15);

    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v19;
        v40 = 2112;
        v41 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Not updating monitored characteristics for current home: %@ because there is no resident", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }
  }
  if (objc_msgSend(v7, "containsObject:", CFSTR("com.apple.Home.widget.security.singleAccessory")))
  {
    v32 = v7;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[HMDWidgetTimelineRefresher homeManager](self, "homeManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "homes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v26);
          v28 = HMFEqualObjects();
          if (self && (v28 & 1) == 0 && objc_msgSend(v27, "hasAnyResident"))
          {
            +[HMDWidgetFetchSpecification allOtherHomesSingleAccessorySecurityFetchSpecifications](HMDWidgetFetchSpecification, "allOtherHomesSingleAccessorySecurityFetchSpecifications");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDWidgetTimelineRefresher monitorCharacteristicsForHome:fetchSpecifications:](self, "monitorCharacteristicsForHome:fetchSpecifications:", v27, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "unionSet:", v30);
          }
          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v24);
    }

    v7 = v32;
  }

  return v8;
}

- (id)monitorCharacteristicsForHome:(id)a3 fetchSpecifications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  HMDWidgetTimelineRefresher *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  HMDWidgetTimelineRefresher *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  id v69;
  HMDWidgetTimelineRefresher *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id obj;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  id v83;
  uint64_t v84;
  void *v85;
  int v86;
  void *v87;
  uint64_t v88;
  HMDWidgetTimelineRefresher *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
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
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint8_t v118[128];
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  void *v126;
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v111 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
    }
    while (v10);
  }
  v68 = v8;

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v70 = v15;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v120 = v17;
    v121 = 2112;
    v122 = v18;
    v123 = 2112;
    v124 = v19;
    v125 = 2112;
    v126 = v20;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@monitorCharacteristicsForHome: '%@' [%@], fetch specifications: %@", buf, 0x2Au);

    v15 = v70;
  }

  objc_autoreleasePoolPop(v14);
  v72 = (void *)objc_opt_new();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v67 = v6;
  objc_msgSend(v6, "hapAccessories");
  v69 = (id)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
  if (v73)
  {
    v71 = *(_QWORD *)v107;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v107 != v71)
          objc_enumerationMutation(v69);
        v75 = v21;
        v79 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v21);
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v76 = obj;
        v80 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
        if (v80)
        {
          v77 = *(_QWORD *)v103;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v103 != v77)
                objc_enumerationMutation(v76);
              v82 = v23;
              v24 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)v23);
              v98 = 0u;
              v99 = 0u;
              v100 = 0u;
              v101 = 0u;
              objc_msgSend(v79, "services");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v99;
                v84 = *(_QWORD *)v99;
                do
                {
                  v29 = 0;
                  v88 = v27;
                  do
                  {
                    if (*(_QWORD *)v99 != v28)
                      objc_enumerationMutation(v25);
                    v30 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v29);
                    objc_msgSend(v24, "serviceTypes");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "type");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v31, "containsObject:", v32) & 1) != 0)
                    {
                      objc_msgSend(v24, "associatedServiceTypes");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v33, "hmf_isEmpty"))
                      {

                      }
                      else
                      {
                        objc_msgSend(v24, "associatedServiceTypes");
                        v34 = v24;
                        v35 = v25;
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v30, "associatedServiceType");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        v86 = objc_msgSend(v36, "containsObject:", v37);

                        v28 = v84;
                        v25 = v35;
                        v24 = v34;
                        v27 = v88;

                        if (!v86)
                          goto LABEL_41;
                      }
                      v96 = 0u;
                      v97 = 0u;
                      v94 = 0u;
                      v95 = 0u;
                      objc_msgSend(v24, "characteristicTypes");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v94, v115, 16);
                      if (v38)
                      {
                        v39 = v38;
                        v40 = *(_QWORD *)v95;
                        do
                        {
                          for (j = 0; j != v39; ++j)
                          {
                            if (*(_QWORD *)v95 != v40)
                              objc_enumerationMutation(v31);
                            objc_msgSend(v30, "findCharacteristicWithType:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * j));
                            v42 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v42)
                              objc_msgSend(v22, "addObject:", v42);

                          }
                          v39 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v94, v115, 16);
                        }
                        while (v39);
                        v28 = v84;
                        v27 = v88;
                      }
                    }
                    else
                    {

                    }
LABEL_41:
                    ++v29;
                  }
                  while (v29 != v27);
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
                }
                while (v27);
              }

              v23 = v82 + 1;
            }
            while (v82 + 1 != (char *)v80);
            v80 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
          }
          while (v80);
        }

        if (objc_msgSend(v22, "count"))
        {
          v43 = (void *)MEMORY[0x227676638]();
          v89 = v70;
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "home");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "name");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "name");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v120 = v45;
            v121 = 2112;
            v122 = v47;
            v123 = 2112;
            v124 = v48;
            _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Monitoring accessory: '%@:%@'", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v43);
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v83 = v22;
          v49 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v90, v114, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v91;
            v78 = *(_QWORD *)v91;
            do
            {
              v52 = 0;
              v81 = v50;
              do
              {
                if (*(_QWORD *)v91 != v51)
                  objc_enumerationMutation(v83);
                v53 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v52);
                v54 = (void *)MEMORY[0x227676638]();
                v55 = v89;
                HMFGetOSLogHandle();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "service");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "type");
                  v87 = v54;
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  HAPShortUUIDType();
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "characteristicType");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  HAPShortUUIDType();
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "characteristicTypeDescription");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v120 = v57;
                  v121 = 2112;
                  v122 = v59;
                  v123 = 2112;
                  v124 = v61;
                  v125 = 2112;
                  v126 = v62;
                  _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@+ monitoring service: '%@', characteristic: '[%@] (%@)'", buf, 0x2Au);

                  v50 = v81;
                  v54 = v87;

                  v51 = v78;
                }

                objc_autoreleasePoolPop(v54);
                ++v52;
              }
              while (v50 != v52);
              v50 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v90, v114, 16);
            }
            while (v50);
          }

          objc_msgSend(v83, "allObjects");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDWidgetTimelineRefresher clientIdentifier](v89, "clientIdentifier");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v63, v64);

        }
        objc_msgSend(v72, "unionSet:", v22);

        v21 = v75 + 1;
      }
      while (v75 + 1 != v73);
      v73 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
    }
    while (v73);
  }

  v65 = (void *)objc_msgSend(v72, "copy");
  return v65;
}

- (void)stopMonitoringOldCharacteristics
{
  void *v3;
  HMDWidgetTimelineRefresher *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  HMDWidgetTimelineRefresher *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  HMDWidgetTimelineRefresher *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __CFString *v41;
  void *v42;
  __int128 v43;
  HMDWidgetTimelineRefresher *v44;
  uint64_t v45;
  id obj;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const __CFString *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v44 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher monitoredCharacteristics](v44, "monitoredCharacteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = &stru_24E79DB48;
    if (!v8)
      v9 = CFSTR("none registered");
    *(_DWORD *)buf = 138543618;
    v59 = v6;
    v60 = 2112;
    v61 = v9;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop monitoring previous accessories: %@", buf, 0x16u);

    v4 = v44;
  }

  objc_autoreleasePoolPop(v3);
  v47 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[HMDWidgetTimelineRefresher monitoredCharacteristics](v4, "monitoredCharacteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v53 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v16, "accessory");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v17, v18);
          objc_msgSend(v10, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
            objc_msgSend(v19, "setByAddingObject:", v16);
          else
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, v18);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v13);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v47, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  v24 = v44;
  if (v22)
  {
    v25 = v22;
    *(_QWORD *)&v23 = 138543618;
    v43 = v23;
    v26 = *(_QWORD *)v49;
    do
    {
      v27 = 0;
      v45 = v25;
      do
      {
        if (*(_QWORD *)v49 != v26)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v27);
        objc_msgSend(v47, "objectForKeyedSubscript:", v28, v43);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29)
          v32 = v30 == 0;
        else
          v32 = 1;
        if (!v32)
        {
          objc_msgSend(v30, "allObjects");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDWidgetTimelineRefresher clientIdentifier](v24, "clientIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v33, v34);

          v35 = (void *)MEMORY[0x227676638]();
          v36 = v24;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = v10;
            v39 = v26;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "shortDescription");
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v43;
            v59 = v40;
            v60 = 2112;
            v61 = v41;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@- stopped monitoring accessory: %@", buf, 0x16u);

            v24 = v44;
            v26 = v39;
            v10 = v38;
            v25 = v45;
          }

          objc_autoreleasePoolPop(v35);
        }

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v25);
  }

  v42 = (void *)objc_opt_new();
  -[HMDWidgetTimelineRefresher setMonitoredCharacteristics:](v24, "setMonitoredCharacteristics:", v42);

}

- (void)processCharacteristicsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDWidgetTimelineRefresher handleAccessoryCharacteristicsChangedNotification:](self, "handleAccessoryCharacteristicsChangedNotification:", v4);
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__HMDWidgetTimelineRefresher_processCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)internalProcessChangedCharacteristics:(id)a3 activeWidgetKinds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDWidgetTimelineRefresher *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v15 = 138543618;
    v16 = v11;
    v17 = 2080;
    v18 = "-[HMDWidgetTimelineRefresher internalProcessChangedCharacteristics:activeWidgetKinds:]";
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@%s", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend((id)objc_opt_class(), "fetchSpecificationsForWidgetKinds:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWidgetTimelineRefresher widgetKindsToUpdateFromFetchSpecifications:changedCharacteristics:](v9, "widgetKindsToUpdateFromFetchSpecifications:changedCharacteristics:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWidgetTimelineRefresher forceUpdateAutobahnTimelineHandler](v9, "forceUpdateAutobahnTimelineHandler");
  v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v14)[2](v14, v13);

}

- (id)widgetKindsToUpdateFromFetchSpecifications:(id)a3 changedCharacteristics:(id)a4
{
  id v6;
  void *v7;
  HMDWidgetTimelineRefresher *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDWidgetTimelineRefresher *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  HMDWidgetTimelineRefresher *v37;
  NSObject *v38;
  _BOOL4 v39;
  char *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  HMDWidgetTimelineRefresher *v57;
  NSObject *v58;
  void *v59;
  char *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *contexta;
  void *context;
  void *contextb;
  HMDWidgetTimelineRefresher *v88;
  uint64_t v89;
  id obj;
  os_log_t log;
  NSObject *loga;
  os_log_t logb;
  os_log_t logc;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  const char *v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  NSObject *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v76 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v101 = v10;
    v102 = 2082;
    v103 = "-[HMDWidgetTimelineRefresher widgetKindsToUpdateFromFetchSpecifications:changedCharacteristics:]";
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@%{public}s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v75 = (id)objc_claimAutoreleasedReturnValue();
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v114, 16);
  if (v11)
  {
    v13 = v11;
    v95 = *(_QWORD *)v97;
    *(_QWORD *)&v12 = 138544898;
    v67 = v12;
    v88 = v8;
    do
    {
      v14 = 0;
      v89 = v13;
      do
      {
        if (*(_QWORD *)v97 != v95)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v14);
        objc_msgSend(v15, "accessory", v67);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "home");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v8)
        {
          v19 = objc_msgSend(v17, "hasAnyResident");

          if ((v19 & 1) != 0)
          {
            -[HMDWidgetTimelineRefresher characteristicsToPreviouslySeenValues](v8, "characteristicsToPreviouslySeenValues");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "serializedIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v21);
            v22 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v21) = HMFEqualObjects();

            if ((_DWORD)v21)
            {
              log = v22;
              v24 = (void *)MEMORY[0x227676638]();
              v25 = v8;
              HMFGetOSLogHandle();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "characteristicType");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                HAPShortUUIDType();
                v27 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "characteristicTypeDescription");
                v28 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "accessory");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "home");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "name");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "accessory");
                contexta = v24;
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "name");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "value");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544642;
                v101 = v69;
                v102 = 2112;
                v103 = (const char *)v27;
                v33 = (void *)v27;
                v104 = 2112;
                v105 = v28;
                v34 = (void *)v28;
                v106 = 2112;
                v107 = v29;
                v108 = 2112;
                v109 = v31;
                v110 = 2112;
                v111 = v32;
                _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@...ignoring redundant characteristic [%@] (%@) from '%@:%@', value '%@'", buf, 0x3Eu);

                v24 = contexta;
                v8 = v88;

                v13 = v89;
              }

              objc_autoreleasePoolPop(v24);
              v22 = log;
            }
            else
            {
              -[HMDWidgetTimelineRefresher widgetKindsToUpdateFromFetchSpecifications:assumingChangedCharacteristic:](v8, "widgetKindsToUpdateFromFetchSpecifications:assumingChangedCharacteristic:", v76, v15);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "unionSet:", v35);
              v36 = objc_msgSend(v35, "count");
              context = (void *)MEMORY[0x227676638]();
              v37 = v8;
              HMFGetOSLogHandle();
              v38 = objc_claimAutoreleasedReturnValue();
              v39 = os_log_type_enabled(v38, OS_LOG_TYPE_INFO);
              if (v36)
              {
                if (v39)
                {
                  HMFGetLogIdentifier();
                  v78 = v35;
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "characteristicType");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  HAPShortUUIDType();
                  v40 = (char *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "characteristicTypeDescription");
                  loga = v38;
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "accessory");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "home");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "name");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "accessory");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "name");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "value");
                  v45 = v22;
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v67;
                  v101 = v82;
                  v102 = 2112;
                  v103 = v40;
                  v104 = 2112;
                  v105 = (uint64_t)v41;
                  v106 = 2112;
                  v107 = v42;
                  v108 = 2112;
                  v109 = v44;
                  v110 = 2112;
                  v111 = v46;
                  v112 = 2112;
                  v113 = v45;
                  _os_log_impl(&dword_2218F0000, loga, OS_LOG_TYPE_INFO, "%{public}@...updating characteristic [%@] (%@) from '%@:%@', value '%@' was '%@'", buf, 0x48u);

                  v22 = v45;
                  v8 = v88;

                  v13 = v89;
                  v38 = loga;

                  v35 = v78;
                }

                objc_autoreleasePoolPop(context);
                objc_msgSend(v15, "value");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDWidgetTimelineRefresher characteristicsToPreviouslySeenValues](v37, "characteristicsToPreviouslySeenValues");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "serializedIdentifier");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, v49);

              }
              else
              {
                if (v39)
                {
                  HMFGetLogIdentifier();
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "characteristicType");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  HAPShortUUIDType();
                  v50 = (char *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "characteristicTypeDescription");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "accessory");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "home");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "name");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "accessory");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "name");
                  logb = v22;
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "value");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544642;
                  v101 = v83;
                  v102 = 2112;
                  v103 = v50;
                  v104 = 2112;
                  v105 = (uint64_t)v51;
                  v106 = 2112;
                  v107 = v52;
                  v108 = 2112;
                  v109 = v54;
                  v110 = 2112;
                  v111 = v55;
                  _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@...ignoring irrelevant characteristic [%@] (%@) from '%@:%@', value '%@'", buf, 0x3Eu);

                  v22 = logb;
                  v13 = v89;

                  v8 = v88;
                }

                objc_autoreleasePoolPop(context);
              }

            }
            goto LABEL_27;
          }
        }
        else
        {

        }
        v56 = MEMORY[0x227676638]();
        v57 = v8;
        HMFGetOSLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "characteristicType");
          contextb = (void *)objc_claimAutoreleasedReturnValue();
          HAPShortUUIDType();
          v60 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "characteristicTypeDescription");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "accessory");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "home");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "name");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "accessory");
          logc = v56;
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "name");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v101 = v59;
          v102 = 2112;
          v103 = v60;
          v104 = 2112;
          v105 = (uint64_t)v61;
          v106 = 2112;
          v107 = v62;
          v108 = 2112;
          v109 = v64;
          v110 = 2112;
          v111 = v65;
          _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@...No resident. Ignoring characteristic [%@] (%@) from '%@:%@', value '%@'", buf, 0x3Eu);

          v56 = logc;
          v8 = v88;

          v13 = v89;
        }

        objc_autoreleasePoolPop(v56);
LABEL_27:
        ++v14;
      }
      while (v13 != v14);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v114, 16);
    }
    while (v13);
  }

  return v75;
}

- (id)widgetKindsToUpdateFromFetchSpecifications:(id)a3 assumingChangedCharacteristic:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  HMDWidgetTimelineRefresher *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  __int128 v29;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id obj;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v39;
    *(_QWORD *)&v9 = 138543618;
    v29 = v9;
    v32 = *(_QWORD *)v39;
    do
    {
      v12 = 0;
      v34 = v10;
      do
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
        objc_msgSend(v13, "serviceTypes", v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "type");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "containsObject:", v15))
        {

          goto LABEL_19;
        }
        objc_msgSend(v13, "associatedServiceTypes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hmf_isEmpty");
        if ((v17 & 1) == 0)
        {
          objc_msgSend(v13, "associatedServiceTypes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "associatedServiceType");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v18;
          if (!objc_msgSend(v18, "containsObject:"))
          {
            v22 = 0;
            goto LABEL_15;
          }
        }
        v19 = v7;
        objc_msgSend(v13, "characteristicTypes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "type");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "containsObject:", v21);

        if ((v17 & 1) == 0)
        {
          v7 = v19;
          v11 = v32;
LABEL_15:
          v10 = v34;

          if ((v22 & 1) == 0)
            goto LABEL_20;
LABEL_16:
          v23 = (void *)MEMORY[0x227676638]();
          v24 = self;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "affectedWidgetKinds");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v43 = v26;
            v44 = 2112;
            v45 = v27;
            _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@...must reload widget kinds: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v23);
          objc_msgSend(v13, "affectedWidgetKinds");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "unionSet:", v14);
LABEL_19:

          goto LABEL_20;
        }

        v7 = v19;
        v11 = v32;
        v10 = v34;
        if ((v22 & 1) != 0)
          goto LABEL_16;
LABEL_20:
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v10);
  }

  return v31;
}

- (void)forceUpdateTimelineForWidgetKinds:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  HMDWidgetTimelineRefresher *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke;
    v6[3] = &unk_24E79C268;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)fetchAndStoreActiveWidgetKinds
{
  void *v3;
  HMDWidgetTimelineRefresher *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  HMDWidgetTimelineRefresher *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Reloading widgets from Chronod", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v8, "fetchedHomeWidgets", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "widget");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "kind");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v11);
  }

  v16 = (void *)MEMORY[0x227676638]();
  v17 = v4;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Active widgets are: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  -[HMDWidgetTimelineRefresher setActiveWidgetKinds:](v17, "setActiveWidgetKinds:", v7);

}

- (void)handleMonitorCharacteristicsForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HMDWidget *v11;
  void *v12;
  id v13;
  void *v14;
  HMDWidgetTimelineRefresher *v15;
  NSObject *v16;
  HMDWidget *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDWidgetTimelineRefresher *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDWidgetTimelineRefresher *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDWidgetTimelineRefresher *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDWidgetTimelineRefresher *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMDWidgetTimelineRefresher *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  HMDWidget *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  int v62;
  void *v63;
  HMDWidgetTimelineRefresher *v64;
  NSObject *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  unint64_t v73;
  void *v74;
  HMDWidgetTimelineRefresher *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void *v80;
  HMDWidgetTimelineRefresher *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  HMDWidgetTimelineRefresher *v90;
  NSObject *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  HMDWidgetTimelineRefresher *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  HMDWidget *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  _QWORD v118[4];
  id v119;
  __int128 v120;
  _QWORD v121[2];
  _QWORD v122[2];
  __int128 v123;
  __int128 v124;
  _BYTE buf[48];
  __int16 v126;
  int v127;
  __int16 v128;
  __int128 *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7240]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7248]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v4, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v4, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
        }
        v133 = *(_OWORD *)buf;
        objc_msgSend(v4, "messagePayload");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2096;
        *(_QWORD *)&buf[20] = &v133;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v52;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget kind in message payload: %@", buf, 0x26u);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v8);
      goto LABEL_87;
    }
    v7 = *MEMORY[0x24BDD7210];
    objc_msgSend(v4, "arrayForKey:", *MEMORY[0x24BDD7210]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v4, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v4, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
        }
        v132 = *(_OWORD *)buf;
        objc_msgSend(v4, "messagePayload");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2096;
        *(_QWORD *)&buf[20] = &v132;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v53;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find characteristic UUIDs in message payload: %@", buf, 0x26u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v9);
      goto LABEL_86;
    }
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD7220]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v39 = (void *)MEMORY[0x227676638]();
      v40 = self;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v4, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend(v4, "identifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
        }
        v131 = *(_OWORD *)buf;
        objc_msgSend(v4, "messagePayload");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2096;
        *(_QWORD *)&buf[20] = &v131;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v93;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find generation counter in message payload: %@", buf, 0x26u);

        v9 = 0;
      }

      objc_autoreleasePoolPop(v39);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v10);
      goto LABEL_85;
    }
    v111 = *MEMORY[0x24BDD7228];
    objc_msgSend(v4, "numberForKey:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v46 = (void *)MEMORY[0x227676638]();
      v47 = self;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v117 = v9;
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v4, "identifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          objc_msgSend(v4, "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
        }
        v130 = *(_OWORD *)buf;
        objc_msgSend(v4, "messagePayload");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2096;
        *(_QWORD *)&buf[20] = &v130;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v94;
        _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find reachability registration value in message payload: %@", buf, 0x26u);

        v9 = v117;
        v10 = 0;
      }

      objc_autoreleasePoolPop(v46);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v95);
      goto LABEL_84;
    }
    v107 = v7;
    objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD7218]);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDWidget initWithIdentifier:kind:]([HMDWidget alloc], "initWithIdentifier:kind:", v5, v6);
    v108 = v8;
    -[HMDWidgetTimelineRefresher characteristicsFromSPIClientIdentifiers:](self, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v118[0] = MEMORY[0x24BDAC760];
    v118[1] = 3221225472;
    v118[2] = __68__HMDWidgetTimelineRefresher_handleMonitorCharacteristicsForWidget___block_invoke;
    v118[3] = &unk_24E77D738;
    v110 = v10;
    v13 = v10;
    v119 = v13;
    v109 = v12;
    objc_msgSend(v12, "na_map:", v118);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v116 = v9;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = v11;
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v4, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v124 = *(_OWORD *)buf;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      v11 = v17;
      if (v112)
        objc_msgSend(v112, "getUUIDBytes:", buf);
      else
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      v123 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2096;
      *(_QWORD *)&buf[20] = &v124;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v17;
      *(_WORD *)&buf[38] = 2112;
      *(_QWORD *)&buf[40] = v116;
      v126 = 1040;
      v127 = 16;
      v128 = 2096;
      v129 = &v123;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to update characteristics for widget: %@, generation counter: %@, current home: %{uuid_t}.16P", buf, 0x40u);

      v9 = v116;
    }

    objc_autoreleasePoolPop(v14);
    objc_msgSend(v13, "BOOLValue");
    v54 = objc_msgSend(v4, "qualityOfService");
    v115 = v114;
    v55 = v11;
    v113 = v55;
    if (v15)
    {
      -[HMDWidgetTimelineRefresher workQueue](v15, "workQueue");
      v56 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v56);

      -[HMDWidgetTimelineRefresher monitoredCharacteristicsMapByWidget](v15, "monitoredCharacteristicsMapByWidget");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectForKeyedSubscript:", v55);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58;
      if (v58)
      {
        v60 = v58;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v60 = (id)objc_claimAutoreleasedReturnValue();
      }
      v61 = v60;

      v62 = objc_msgSend(v115, "isEqualToSet:", v61);
      v63 = (void *)MEMORY[0x227676638]();
      v64 = v15;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = os_log_type_enabled(v65, OS_LOG_TYPE_INFO);
      if (v62)
      {
        if (v66)
        {
          HMFGetLogIdentifier();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v67;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v113;
          _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_INFO, "%{public}@Monitored characteristics did not change for widget %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v63);
      }
      else
      {
        if (v66)
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v68;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v113;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v115;
          _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_INFO, "%{public}@Monitored characteristics changed for widget %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v63);
        -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v64);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWidgetTimelineRefresher monitoredCharacteristicsMapByWidget](v64, "monitoredCharacteristicsMapByWidget");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setObject:forKeyedSubscript:", v115, v113);

        -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v64);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWidgetTimelineRefresher updateNotificationRegistrationWithPreviousCharacteristics:currentCharacteristics:updateRequestQualityOfService:](v64, v69, v71, v54);

      }
      v9 = v116;
      v55 = v113;
    }

    v72 = objc_msgSend(v9, "unsignedIntValue");
    if (v15)
    {
      v73 = v72;
      if (!v72)
      {
        v74 = (void *)MEMORY[0x227676638]();
        v75 = v15;
        HMFGetOSLogHandle();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v77;
          _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_FAULT, "%{public}@Generation counter is unexpectedly set to zero.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v74);
      }
      -[HMDWidgetTimelineRefresher homeManager](v15, "homeManager");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "generationCounter");

      if (v79 > v73)
      {
        v80 = (void *)MEMORY[0x227676638]();
        v81 = v15;
        HMFGetOSLogHandle();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v83;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v73;
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = v79;
          _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_INFO, "%{public}@Refreshing timeline because client's generation counter is older. Client: %lu, homed: %lu", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v80);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v81, v84, CFSTR("Generation counter mismatch"), 1);
        v85 = v109;
LABEL_77:

        goto LABEL_78;
      }
      v86 = v112;
      -[HMDWidgetTimelineRefresher homeManager](v15, "homeManager");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "currentHomeUUID");
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if ((HMFEqualObjects() & 1) == 0)
      {
        v89 = (void *)MEMORY[0x227676638]();
        v90 = v15;
        HMFGetOSLogHandle();
        v91 = objc_claimAutoreleasedReturnValue();
        v85 = v109;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          v106 = v89;
          HMFGetLogIdentifier();
          v92 = (id)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          if (v86)
            objc_msgSend(v86, "getUUIDBytes:", buf);
          else
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          v136 = *(_OWORD *)buf;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          if (v88)
            objc_msgSend(v88, "getUUIDBytes:", buf);
          else
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          v135 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544386;
          *(_QWORD *)&buf[4] = v92;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2096;
          *(_QWORD *)&buf[20] = &v136;
          *(_WORD *)&buf[28] = 1040;
          *(_DWORD *)&buf[30] = 16;
          *(_WORD *)&buf[34] = 2096;
          *(_QWORD *)&buf[36] = &v135;
          _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_INFO, "%{public}@Refreshing timeline because client's currentHome UUID is different. Client: %{uuid_t}.16P, homed: %{uuid_t}.16P", buf, 0x2Cu);

          v89 = v106;
        }

        objc_autoreleasePoolPop(v89);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v90, v84, CFSTR("Current home mismatch"), 1);
        goto LABEL_77;
      }

    }
    else
    {

    }
    v85 = v109;
LABEL_78:
    v121[0] = v107;
    -[HMDWidgetTimelineRefresher valueByCharacteristicSPIClientIdentifierForCharacteristics:](v15, "valueByCharacteristicSPIClientIdentifierForCharacteristics:", v85);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v111;
    v122[0] = v96;
    -[HMDWidgetTimelineRefresher reachabilityByAccessorySPIClientIdentifierForCharacteristics:](v15, "reachabilityByAccessorySPIClientIdentifierForCharacteristics:", v85);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v97;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, v121, 2);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    v99 = (void *)MEMORY[0x227676638]();
    v100 = v15;
    HMFGetOSLogHandle();
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "identifier");
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      if (v104)
      {
        objc_msgSend(v4, "identifier");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v120 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v102;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v103;
      *(_WORD *)&buf[22] = 1040;
      *(_DWORD *)&buf[24] = 16;
      *(_WORD *)&buf[28] = 2096;
      *(_QWORD *)&buf[30] = &v120;
      *(_WORD *)&buf[38] = 2112;
      *(_QWORD *)&buf[40] = v98;
      _os_log_impl(&dword_2218F0000, v101, OS_LOG_TYPE_INFO, "%{public}@[%@] Responding to %{uuid_t}.16P with payload: %@", buf, 0x30u);

      v85 = v109;
    }

    objc_autoreleasePoolPop(v99);
    objc_msgSend(v4, "respondWithPayload:", v98);

    v8 = v108;
    v9 = v116;
    v10 = v110;
    v95 = v112;
LABEL_84:

LABEL_85:
LABEL_86:

LABEL_87:
    goto LABEL_88;
  }
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(v4, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v4, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
    }
    v134 = *(_OWORD *)buf;
    objc_msgSend(v4, "messagePayload");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    *(_WORD *)&buf[18] = 2096;
    *(_QWORD *)&buf[20] = &v134;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v45;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget identifier in message payload: %@", buf, 0x26u);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v6);
LABEL_88:

}

- (void)handleFetchState:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 *v6;
  void *v7;
  HMDWidgetTimelineRefresher *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDWidgetTimelineRefresher *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  _BYTE buf[28];
  __int16 v28;
  __int128 *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDD7210];
  objc_msgSend(v4, "arrayForKey:", *MEMORY[0x24BDD7210]);
  v6 = (__int128 *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
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
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v34 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2096;
      *(_QWORD *)&buf[20] = &v34;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to fetch state for: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDWidgetTimelineRefresher characteristicsFromSPIClientIdentifiers:](v8, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v5;
    -[HMDWidgetTimelineRefresher valueByCharacteristicSPIClientIdentifierForCharacteristics:](v8, "valueByCharacteristicSPIClientIdentifierForCharacteristics:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x227676638]();
    v20 = v8;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v4, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v26 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 1040;
      *(_DWORD *)&buf[24] = 16;
      v28 = 2096;
      v29 = &v26;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@[%@] Responding to %{uuid_t}.16P with payload: %@", buf, 0x30u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v4, "respondWithPayload:", v18);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find characteristic UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v16);
  }

}

- (void)handlePerformRequests:(id)a3
{
  _BOOL4 v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_group_t v15;
  NSObject *v16;
  void *v17;
  HMDWidgetTimelineRefresher *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  HMDWidgetTimelineRefresher *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  HMDWidgetTimelineRefresher *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  id v61;
  char v62;
  void *v63;
  void *v64;
  HMDWidgetTimelineRefresher *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  HMDWidgetTimelineRefresher *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  HMDWidgetTimelineRefresher *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  NSObject *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  id v113;
  uint64_t v114;
  id v115;
  id v116;
  uint64_t j;
  id v118;
  NSObject *group;
  dispatch_group_t groupa;
  HMDWidgetTimelineRefresher *v121;
  id obj;
  id obja;
  uint64_t v124;
  uint64_t v125;
  _QWORD block[5];
  id v127;
  _QWORD *v128;
  _QWORD *v129;
  _QWORD aBlock[4];
  NSObject *v131;
  _QWORD *v132;
  _QWORD *v133;
  _QWORD v134[3];
  char v135;
  _QWORD v136[5];
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  void (*v149)(uint64_t, void *, void *);
  void *v150;
  HMDWidgetTimelineRefresher *v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD v158[6];
  id v159;
  id v160;
  id v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  uint8_t v166[4];
  void *v167;
  __int16 v168;
  id v169;
  _BYTE buf[18];
  __int16 v171;
  __int128 *v172;
  __int16 v173;
  id v174;
  uint8_t v175[48];
  __int128 v176;
  uint64_t v177;

  v177 = *MEMORY[0x24BDAC8D0];
  v139 = 0;
  v140 = 0;
  v138 = 0;
  v104 = a3;
  v4 = -[HMDWidgetTimelineRefresher _getRequestsFromMessage:outCharacteristicWriteValueByUUUIDs:outExecuteActionSetUUUIDs:outExecuteTurnOffActionSetUUIDs:](self, "_getRequestsFromMessage:outCharacteristicWriteValueByUUUIDs:outExecuteActionSetUUUIDs:outExecuteTurnOffActionSetUUIDs:");
  v102 = 0;
  v103 = 0;
  v5 = 0;
  if (!v4)
    goto LABEL_110;
  v100 = v5;
  objc_msgSend(v104, "stringForKey:", *MEMORY[0x24BDD7248]);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v121 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v101)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf[8] = 0;
      *(_QWORD *)buf = 0;
      objc_msgSend(v104, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v104, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v147 = *(_OWORD *)buf;
      objc_msgSend(v104, "messagePayload");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v171 = 2096;
      v172 = &v147;
      v173 = 2112;
      v174 = v97;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget kind in message payload: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v107 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "respondWithError:", v107);
    goto LABEL_109;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf[8] = 0;
    *(_QWORD *)buf = 0;
    objc_msgSend(v104, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v104, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
    }
    v146 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    v171 = 2096;
    v172 = &v146;
    v173 = 2112;
    v174 = v101;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to perform requests for kind: %@", buf, 0x26u);

  }
  objc_autoreleasePoolPop(v6);
  v15 = dispatch_group_create();
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x3032000000;
  v136[3] = __Block_byref_object_copy__56158;
  v136[4] = __Block_byref_object_dispose__56159;
  v137 = 0;
  v134[0] = 0;
  v134[1] = v134;
  v134[2] = 0x2020000000;
  v135 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HMDWidgetTimelineRefresher_handlePerformRequests___block_invoke;
  aBlock[3] = &unk_24E77D760;
  v16 = v15;
  v131 = v16;
  v132 = v136;
  v133 = v134;
  v17 = _Block_copy(aBlock);
  v18 = v121;
  -[HMDWidgetTimelineRefresher writeCharacteristicsWithWriteValueBySPIClientIdentifier:widgetKind:message:completionGroup:completion:](v121, "writeCharacteristicsWithWriteValueBySPIClientIdentifier:widgetKind:message:completionGroup:completion:", v102, v101, v104, v16, v17);
  v113 = v103;
  v118 = v101;
  v19 = v104;
  group = v16;
  v116 = v17;
  if (v121)
  {
    -[HMDWidgetTimelineRefresher actionSetsFromSPIClientIdentifiers:](v121, v113);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v111, "count"))
    {
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      obj = v111;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
      if (v20)
      {
        v124 = *(_QWORD *)v142;
        v21 = *MEMORY[0x24BDD5218];
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v142 != v124)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
            objc_msgSend(v23, "type");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqualToString:", v21);

            v26 = (void *)MEMORY[0x227676638]();
            v27 = v121;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v25)
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)v175 = 0;
                *(_QWORD *)&v175[8] = 0;
                objc_msgSend(v19, "identifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (v31)
                {
                  objc_msgSend(v19, "identifier");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "getUUIDBytes:", v175);

                }
                else
                {
                  *(_OWORD *)v175 = *MEMORY[0x24BE3F2C8];
                }
                v162 = *(_OWORD *)v175;
                *(_DWORD *)v175 = 138544130;
                *(_QWORD *)&v175[4] = v30;
                *(_WORD *)&v175[12] = 1040;
                *(_DWORD *)&v175[14] = 16;
                *(_WORD *)&v175[18] = 2096;
                *(_QWORD *)&v175[20] = &v162;
                *(_WORD *)&v175[28] = 2112;
                *(_QWORD *)&v175[30] = v23;
                _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] We can't execute trigger-owned action set: %@", v175, 0x26u);

              }
              objc_autoreleasePoolPop(v26);
            }
            else
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)v175 = 0;
                *(_QWORD *)&v175[8] = 0;
                objc_msgSend(v19, "identifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (v34)
                {
                  objc_msgSend(v19, "identifier");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "getUUIDBytes:", v175);

                }
                else
                {
                  *(_OWORD *)v175 = *MEMORY[0x24BE3F2C8];
                }
                v148 = *(_OWORD *)v175;
                *(_DWORD *)v175 = 138544130;
                *(_QWORD *)&v175[4] = v33;
                *(_WORD *)&v175[12] = 1040;
                *(_DWORD *)&v175[14] = 16;
                *(_WORD *)&v175[18] = 2096;
                *(_QWORD *)&v175[20] = &v148;
                *(_WORD *)&v175[28] = 2112;
                *(_QWORD *)&v175[30] = v23;
                _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Executing action set: %@", v175, 0x26u);

              }
              objc_autoreleasePoolPop(v26);
              objc_msgSend(v23, "uuid");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDWidgetTimelineRefresher _setPendingRequestValue:forUUID:messageIdentifier:](v27, "_setPendingRequestValue:forUUID:messageIdentifier:", &unk_24E96AD18, v36, v37);

              -[HMDWidgetTimelineRefresher _clearCachedErrorForActionSet:](v27, v23);
              dispatch_group_enter(group);
              v38 = (void *)objc_msgSend(v19, "mutableCopy");
              v158[0] = MEMORY[0x24BDAC760];
              v158[1] = 3221225472;
              v158[2] = __118__HMDWidgetTimelineRefresher_executeActionSetsWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke;
              v158[3] = &unk_24E799BC0;
              v158[4] = v27;
              v158[5] = v23;
              v159 = v19;
              v160 = v118;
              v161 = v116;
              objc_msgSend(v38, "setResponseHandler:", v158);
              objc_msgSend(v23, "execute:", v38);

            }
          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
        }
        while (v20);
      }

    }
    v18 = v121;
  }

  v99 = v100;
  v105 = v118;
  v112 = v19;
  v107 = group;
  v106 = v116;
  if (!v18)
    goto LABEL_105;
  -[HMDWidgetTimelineRefresher actionSetsFromSPIClientIdentifiers:](v121, v99);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v98, "count"))
    goto LABEL_104;
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v108 = v98;
  v114 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v162, v158, 16);
  if (!v114)
    goto LABEL_103;
  v109 = *MEMORY[0x24BDD5218];
  v110 = *(_QWORD *)v163;
  v125 = *MEMORY[0x24BE1B590];
  obja = (id)*MEMORY[0x24BE1B4A8];
  do
  {
    for (j = 0; j != v114; ++j)
    {
      if (*(_QWORD *)v163 != v110)
        objc_enumerationMutation(v108);
      v39 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * j);
      objc_msgSend(v39, "type", v98);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqualToString:", v109);

      if (v41)
      {
        v42 = (void *)MEMORY[0x227676638]();
        v43 = v121;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf[8] = 0;
          *(_QWORD *)buf = 0;
          objc_msgSend(v112, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            objc_msgSend(v112, "identifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v157 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v45;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          v171 = 2096;
          v172 = &v157;
          v173 = 2112;
          v174 = v39;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] We can't execute trigger-owned action set: %@", buf, 0x26u);

        }
LABEL_80:

        objc_autoreleasePoolPop(v42);
        continue;
      }
      if (!-[HMDWidgetTimelineRefresher actionSetIsOn:](v121, "actionSetIsOn:", v39))
      {
        v42 = (void *)MEMORY[0x227676638]();
        v43 = v121;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf[8] = 0;
          *(_QWORD *)buf = 0;
          objc_msgSend(v112, "identifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (v77)
          {
            objc_msgSend(v112, "identifier");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v156 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v76;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          v171 = 2096;
          v172 = &v156;
          v173 = 2112;
          v174 = v39;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Action set cannot be turned off because it's not active: %@", buf, 0x26u);

        }
        goto LABEL_80;
      }
      v115 = v39;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      groupa = (dispatch_group_t)objc_claimAutoreleasedReturnValue();
      v176 = 0u;
      memset(v175, 0, sizeof(v175));
      objc_msgSend(v115, "actions");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", v175, buf, 16);
      if (!v49)
        goto LABEL_70;
      v50 = **(_QWORD **)&v175[16];
      do
      {
        for (k = 0; k != v49; ++k)
        {
          if (**(_QWORD **)&v175[16] != v50)
            objc_enumerationMutation(v48);
          v52 = *(id *)(*(_QWORD *)&v175[8] + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v53 = v52;
          else
            v53 = 0;
          v54 = v53;

          if (v54)
          {
            objc_msgSend(v54, "characteristic");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "type");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v56, "isEqual:", v125))
            {

LABEL_59:
              objc_msgSend(v54, "targetValue");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v60 = v59;
              else
                v60 = 0;
              v61 = v60;

              v62 = objc_msgSend(v61, "BOOLValue");
              if ((v62 & 1) != 0)
              {
                +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v55, &unk_24E96AD30, 0, 0);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](groupa, "addObject:", v63);

              }
              else
              {
                v64 = (void *)MEMORY[0x227676638]();
                v65 = v121;
                HMFGetOSLogHandle();
                v66 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v166 = 138543618;
                  v167 = v67;
                  v168 = 2112;
                  v169 = v54;
                  _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring characteristic write action for turning off because target value is NO: %@", v166, 0x16u);

                }
                objc_autoreleasePoolPop(v64);
              }
            }
            else
            {
              objc_msgSend(v55, "type");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v57, "isEqual:", obja);

              if (v58)
                goto LABEL_59;
            }

          }
        }
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", v175, buf, 16);
      }
      while (v49);
LABEL_70:

      if (-[NSObject count](groupa, "count"))
      {
        objc_msgSend(v115, "home");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)MEMORY[0x227676638]();
        v70 = v121;
        HMFGetOSLogHandle();
        v71 = objc_claimAutoreleasedReturnValue();
        v72 = v71;
        if (v68)
        {
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf[8] = 0;
            *(_QWORD *)buf = 0;
            objc_msgSend(v112, "identifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            if (v74)
            {
              objc_msgSend(v112, "identifier");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "getUUIDBytes:", buf);

            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
            }
            v153 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v73;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            v171 = 2096;
            v172 = &v153;
            v173 = 2112;
            v174 = v115;
            _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Executing turning off action set: %@", buf, 0x26u);

          }
          objc_autoreleasePoolPop(v69);
          objc_msgSend(v115, "uuid");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "identifier");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDWidgetTimelineRefresher _setPendingRequestValue:forUUID:messageIdentifier:](v70, "_setPendingRequestValue:forUUID:messageIdentifier:", &unk_24E96AD30, v88, v89);

          -[HMDWidgetTimelineRefresher _clearCachedErrorForActionSet:](v70, v115);
          dispatch_group_enter(v107);
          *(_QWORD *)&v141 = MEMORY[0x24BDAC760];
          *((_QWORD *)&v141 + 1) = 3221225472;
          *(_QWORD *)&v142 = __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke;
          *((_QWORD *)&v142 + 1) = &unk_24E7969B8;
          *(_QWORD *)&v143 = v70;
          *((_QWORD *)&v143 + 1) = v115;
          v90 = v112;
          *(_QWORD *)&v144 = v90;
          *((_QWORD *)&v144 + 1) = v105;
          v145 = v106;
          v91 = _Block_copy(&v141);
          *(_QWORD *)&v148 = MEMORY[0x24BDAC760];
          *((_QWORD *)&v148 + 1) = 3221225472;
          v149 = __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_183;
          v150 = &unk_24E7961A0;
          v151 = v70;
          v152 = v91;
          v92 = v91;
          v93 = _Block_copy(&v148);
          v94 = parseMessageSource(v90);
          objc_msgSend(v90, "identifier");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "writeCharacteristicValues:source:identifier:qualityOfService:withCompletionHandler:", groupa, v94, v95, objc_msgSend(v90, "qualityOfService"), v93);

        }
        else
        {
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf[8] = 0;
            *(_QWORD *)buf = 0;
            objc_msgSend(v112, "identifier");
            v86 = (void *)objc_claimAutoreleasedReturnValue();

            if (v86)
            {
              objc_msgSend(v112, "identifier");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "getUUIDBytes:", buf);

            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
            }
            v154 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v85;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            v171 = 2096;
            v172 = &v154;
            v173 = 2112;
            v174 = v115;
            _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Home is nil for action set: %@", buf, 0x26u);

          }
          objc_autoreleasePoolPop(v69);
        }

      }
      else
      {
        v79 = (void *)MEMORY[0x227676638]();
        v80 = v121;
        HMFGetOSLogHandle();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf[8] = 0;
          *(_QWORD *)buf = 0;
          objc_msgSend(v112, "identifier");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          if (v83)
          {
            objc_msgSend(v112, "identifier");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v155 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v82;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          v171 = 2096;
          v172 = &v155;
          v173 = 2112;
          v174 = v115;
          _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Action set doesn't contain actions that can be turned off: %@", buf, 0x26u);

        }
        objc_autoreleasePoolPop(v79);
      }

    }
    v114 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v162, v158, 16);
  }
  while (v114);
LABEL_103:

LABEL_104:
LABEL_105:

  -[HMDWidgetTimelineRefresher workQueue](v121, "workQueue");
  v96 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMDWidgetTimelineRefresher_handlePerformRequests___block_invoke_2;
  block[3] = &unk_24E795A98;
  v128 = v136;
  block[4] = v121;
  v127 = v112;
  v129 = v134;
  dispatch_group_notify(v107, v96, block);

  _Block_object_dispose(v134, 8);
  _Block_object_dispose(v136, 8);

LABEL_109:
  v5 = v100;
LABEL_110:

}

- (void)handleMonitorActionSetsForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDWidget *v8;
  void *v9;
  void *v10;
  HMDWidgetTimelineRefresher *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDWidgetTimelineRefresher *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDWidgetTimelineRefresher *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDWidgetTimelineRefresher *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDWidget *v34;
  uint64_t v35;
  HMDWidget *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDWidgetTimelineRefresher *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDWidget *v61;
  HMDWidget *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  _BYTE buf[28];
  __int16 v69;
  HMDWidget *v70;
  __int16 v71;
  void *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7240]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7248]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "arrayForKey:", *MEMORY[0x24BDD71E8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = -[HMDWidget initWithIdentifier:kind:]([HMDWidget alloc], "initWithIdentifier:kind:", v5, v6);
        v65 = v7;
        -[HMDWidgetTimelineRefresher actionSetsFromSPIClientIdentifiers:](self, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x227676638]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v4, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v4, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v75 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2096;
          *(_QWORD *)&buf[20] = &v75;
          v69 = 2112;
          v70 = v8;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to update action sets for widget: %@", buf, 0x26u);

        }
        objc_autoreleasePoolPop(v10);
        v35 = objc_msgSend(v4, "qualityOfService");
        v36 = v8;
        v66 = v9;
        if (v11)
        {
          v37 = v9;
          -[HMDWidgetTimelineRefresher monitoredActionSetsMapByWidget](v11, "monitoredActionSetsMapByWidget");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKey:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          v63 = v35;
          if (v39)
          {
            v41 = v39;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCF20], "set");
            v41 = (id)objc_claimAutoreleasedReturnValue();
          }
          v42 = v41;

          -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v11);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDWidgetTimelineRefresher monitoredActionSetsMapByWidget](v11, "monitoredActionSetsMapByWidget");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v37, v36);

          -[HMDWidgetTimelineRefresher monitoredActionSetsMapByWidget](v11, "monitoredActionSetsMapByWidget");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKey:", v36);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (v46)
          {
            v48 = v46;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCF20], "set");
            v48 = (id)objc_claimAutoreleasedReturnValue();
          }
          v49 = v48;

          -[HMDWidgetTimelineRefresher updateMonitoredActionSetsWithPreviousActionSets:currentActionSets:]((uint64_t)v11, v42, v49);
          -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v11);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDWidgetTimelineRefresher updateNotificationRegistrationWithPreviousCharacteristics:currentCharacteristics:updateRequestQualityOfService:](v11, v43, v50, v63);

          v9 = v66;
        }

        -[HMDWidgetTimelineRefresher updateCachedIsOnStateForActionSets:](v11, v9);
        v73[0] = *MEMORY[0x24BDD71F8];
        -[HMDWidgetTimelineRefresher cachedIsOnStateBySPIClientIdentifierForActionSets:](v11, v9);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = v51;
        v73[1] = *MEMORY[0x24BDD71F0];
        -[HMDWidgetTimelineRefresher didExecuteFailBySPIClientIdentifierForActionSets:](v11, v9);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v74[1] = v52;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = (void *)MEMORY[0x227676638]();
        v55 = v11;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v64 = v5;
          HMFGetLogIdentifier();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "name");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v4, "identifier");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v59)
          {
            objc_msgSend(v4, "identifier");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v67 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544386;
          *(_QWORD *)&buf[4] = v57;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v58;
          *(_WORD *)&buf[22] = 1040;
          *(_DWORD *)&buf[24] = 16;
          v69 = 2096;
          v70 = (HMDWidget *)&v67;
          v71 = 2112;
          v72 = v53;
          _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@[%@] Responding to %{uuid_t}.16P with payload: %@", buf, 0x30u);

          v5 = v64;
        }

        objc_autoreleasePoolPop(v54);
        objc_msgSend(v4, "respondWithPayload:", v53);

        v7 = v65;
      }
      else
      {
        v28 = (void *)MEMORY[0x227676638]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v4, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v4, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v76 = *(_OWORD *)buf;
          objc_msgSend(v4, "messagePayload");
          v62 = (HMDWidget *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2096;
          *(_QWORD *)&buf[20] = &v76;
          v69 = 2112;
          v70 = v62;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find action set UUIDs in message payload: %@", buf, 0x26u);

        }
        objc_autoreleasePoolPop(v28);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v36 = (HMDWidget *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v36);
      }

    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v4, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v4, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
        }
        v77 = *(_OWORD *)buf;
        objc_msgSend(v4, "messagePayload");
        v61 = (HMDWidget *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2096;
        *(_QWORD *)&buf[20] = &v77;
        v69 = 2112;
        v70 = v61;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget kind in message payload: %@", buf, 0x26u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v7);
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
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v4, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v78 = *(_OWORD *)buf;
      objc_msgSend(v4, "messagePayload");
      v34 = (HMDWidget *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2096;
      *(_QWORD *)&buf[20] = &v78;
      v69 = 2112;
      v70 = v34;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find widget identifier in message payload: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

}

- (void)handleFetchStateForActionSets:(id)a3
{
  id v4;
  void *v5;
  __int128 *v6;
  void *v7;
  HMDWidgetTimelineRefresher *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDWidgetTimelineRefresher *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDWidgetTimelineRefresher *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 *v29;
  __int128 v30;
  _BYTE buf[28];
  __int16 v32;
  __int128 *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "arrayForKey:", *MEMORY[0x24BDD71E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDWidgetTimelineRefresher actionSetsFromSPIClientIdentifiers:](self, v5);
    v6 = (__int128 *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v38 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2096;
      *(_QWORD *)&buf[20] = &v38;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Received message to fetch action sets for: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDWidgetTimelineRefresher updateCachedIsOnStateForActionSets:](v8, v6);
    v36[0] = *MEMORY[0x24BDD71F8];
    -[HMDWidgetTimelineRefresher cachedIsOnStateBySPIClientIdentifierForActionSets:](v8, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v19;
    v36[1] = *MEMORY[0x24BDD71F0];
    -[HMDWidgetTimelineRefresher didExecuteFailBySPIClientIdentifierForActionSets:](v8, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x227676638]();
    v23 = v8;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v4, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v30 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 1040;
      *(_DWORD *)&buf[24] = 16;
      v32 = 2096;
      v33 = &v30;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@[%@] Responding to %{uuid_t}.16P with payload: %@", buf, 0x30u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(v4, "respondWithPayload:", v21);

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v4, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v39 = *(_OWORD *)buf;
      objc_msgSend(v4, "messagePayload");
      v29 = (__int128 *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2096;
      *(_QWORD *)&buf[20] = &v39;
      v32 = 2112;
      v33 = v29;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Could not find action set UUIDs in message payload: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v6 = (__int128 *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

}

- (id)valueByCharacteristicSPIClientIdentifierForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDWidgetTimelineRefresher *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  uint64_t v26;
  HMDWidgetTimelineRefresher *v27;
  void *v28;
  id obj;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE buf[18];
  __int16 v41;
  __int128 *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v4;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
  if (v34)
  {
    v7 = *(_QWORD *)v36;
    *(_QWORD *)&v6 = 138545154;
    v25 = v6;
    v27 = self;
    v28 = v5;
    v26 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "spiClientIdentifier", v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWidgetTimelineRefresher _getPendingWriteValueForUUID:](self, "_getPendingWriteValueForUUID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x227676638]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v15 = objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v9, "spiClientIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = (void *)v15;
          v33 = v12;
          if (v16)
          {
            objc_msgSend(v9, "spiClientIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v39 = *(_OWORD *)buf;
          objc_msgSend(v9, "instanceID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "type");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          HAPShortUUIDType();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "characteristicTypeDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v25;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          v41 = 2096;
          v42 = &v39;
          v43 = 2112;
          v44 = v18;
          v45 = 2112;
          v46 = v19;
          v47 = 2112;
          v48 = v20;
          v49 = 2112;
          v50 = v21;
          v51 = 2112;
          v52 = v11;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic spiClientIdentifier: %{uuid_t}.16P, IID: %@, Type/Desc: %@/%@, value: %@, pendingWriteValue: %@", buf, 0x4Eu);

          self = v27;
          v5 = v28;
          v7 = v26;
          v12 = v33;
        }

        objc_autoreleasePoolPop(v12);
        v22 = (uint64_t)v11;
        if (!v11)
        {
          objc_msgSend(v9, "value");
          v22 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v22;
        }
        objc_msgSend(v9, "spiClientIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, v23);

        if (!v11)
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
    }
    while (v34);
  }

  return v5;
}

- (id)reachabilityByAccessorySPIClientIdentifierForCharacteristics:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDWidgetTimelineRefresher *v12;
  NSObject *v13;
  void *v14;
  HMDWidgetTimelineRefresher *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE buf[18];
  __int16 v34;
  __int128 *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_msgSend(v24, "na_map:", &__block_literal_global_163_56140);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v25 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      v26 = v7;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x227676638]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = v5;
          v15 = self;
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v10, "spiClientIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v10, "spiClientIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v32 = *(_OWORD *)buf;
          objc_msgSend(v10, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "isRemotelyReachable");
          HMFBooleanToString();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          *(_QWORD *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          v34 = 2096;
          v35 = &v32;
          v36 = 2112;
          v37 = v19;
          v38 = 2112;
          v39 = v20;
          _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Accessory spiClientIdentifier %{uuid_t}.16P, Name: %@, isRemotelyReachable: %@", buf, 0x30u);

          self = v15;
          v5 = v14;
          v8 = v25;
          v7 = v26;
        }

        objc_autoreleasePoolPop(v11);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "isRemotelyReachable"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "spiClientIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, v22);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v7);
  }

  return v5;
}

- (BOOL)_getRequestsFromMessage:(id)a3 outCharacteristicWriteValueByUUUIDs:(id *)a4 outExecuteActionSetUUUIDs:(id *)a5 outExecuteTurnOffActionSetUUIDs:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  HMDWidgetTimelineRefresher *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDWidgetTimelineRefresher *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDWidgetTimelineRefresher *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  const char *v59;
  NSObject *v60;
  uint32_t v61;
  void *v62;
  void *v63;
  id *v65;
  id *v66;
  id *v67;
  void *v68;
  HMDWidgetTimelineRefresher *v69;
  void *v70;
  void *v71;
  id v72;
  id obj;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE buf[18];
  __int16 v81;
  __int128 *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (!a4)
  {
    _HMFPreconditionFailure();
    goto LABEL_60;
  }
  if (!a5)
  {
LABEL_60:
    _HMFPreconditionFailure();
LABEL_61:
    _HMFPreconditionFailure();
  }
  if (!a6)
    goto LABEL_61;
  v11 = v10;
  v65 = a4;
  v66 = a5;
  v67 = a6;
  v69 = self;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v72 = (id)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v11, "arrayForKey:", *MEMORY[0x24BDD7238]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v76;
    v17 = *MEMORY[0x24BDD7230];
    v18 = *MEMORY[0x24BDD71E0];
    v19 = *MEMORY[0x24BDD7200];
    v20 = *MEMORY[0x24BDD7208];
    v68 = v11;
    v70 = v12;
    v71 = v13;
LABEL_6:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v76 != v16)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v21);
      v74 = 0;
      v23 = objc_msgSend(v22, "hmf_integerForKey:error:", v17, &v74);
      v24 = v74;
      if (v24)
      {
        v34 = v24;
        v35 = (void *)MEMORY[0x227676638]();
        v36 = v69;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        v11 = v68;
        v12 = v70;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v68, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(v68, "identifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v90 = *(_OWORD *)buf;
          objc_msgSend(v68, "messagePayload");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          v81 = 2096;
          v82 = &v90;
          v83 = 2112;
          v84 = (uint64_t)v57;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] request type is not set in payload: %@", buf, 0x26u);

        }
        objc_autoreleasePoolPop(v35);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "respondWithError:", v25);
LABEL_49:
        v32 = v72;
        goto LABEL_57;
      }
      if (v23 == 2)
        break;
      if (v23 == 1)
      {
        objc_msgSend(v22, "hmf_UUIDForKey:", v18);
        v31 = objc_claimAutoreleasedReturnValue();
        if (!v31)
        {
          v41 = (void *)MEMORY[0x227676638]();
          v42 = v69;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          v11 = v68;
          v12 = v70;
          v32 = v72;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            objc_msgSend(v68, "identifier");
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if (v55)
            {
              objc_msgSend(v68, "identifier");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "getUUIDBytes:", buf);

            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
            }
            v88 = *(_OWORD *)buf;
            objc_msgSend(v68, "messagePayload");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v44;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            v81 = 2096;
            v82 = &v88;
            v83 = 2112;
            v84 = (uint64_t)v58;
            v59 = "%{public}@[%{uuid_t}.16P] execute request missing UUID: %@";
            goto LABEL_54;
          }
LABEL_56:

          objc_autoreleasePoolPop(v41);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "respondWithError:", v25);
          v34 = 0;
LABEL_57:

          v33 = 0;
          v13 = v71;
          goto LABEL_58;
        }
        v25 = (void *)v31;
        v30 = v71;
LABEL_22:
        objc_msgSend(v30, "addObject:", v25);
        goto LABEL_23;
      }
      if (v23)
      {
        v41 = (void *)MEMORY[0x227676638]();
        v42 = v69;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        v11 = v68;
        v12 = v70;
        v32 = v72;
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          goto LABEL_56;
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v68, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          objc_msgSend(v68, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
        }
        v79 = *(_OWORD *)buf;
        objc_msgSend(v68, "messagePayload");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        v81 = 2096;
        v82 = &v79;
        v83 = 2048;
        v84 = v23;
        v85 = 2112;
        v86 = v58;
        v59 = "%{public}@[%{uuid_t}.16P] unknown request type (%ld) in payload: %@";
        v60 = v43;
        v61 = 48;
LABEL_55:
        _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);

        goto LABEL_56;
      }
      objc_msgSend(v22, "hmf_UUIDForKey:", v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v20);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v25)
        v28 = v26 == 0;
      else
        v28 = 1;
      if (v28)
      {
        v47 = (void *)MEMORY[0x227676638]();
        v48 = v69;
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        v11 = v68;
        v12 = v70;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v68, "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            objc_msgSend(v68, "identifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
          }
          v89 = *(_OWORD *)buf;
          objc_msgSend(v68, "messagePayload");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          v81 = 2096;
          v82 = &v89;
          v83 = 2112;
          v84 = (uint64_t)v62;
          _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] characteristic write request missing UUID or write value: %@", buf, 0x26u);

        }
        objc_autoreleasePoolPop(v47);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "respondWithError:", v63);

        v34 = 0;
        goto LABEL_49;
      }
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v26, v25);

LABEL_23:
      if (v15 == ++v21)
      {
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
        v11 = v68;
        v12 = v70;
        v13 = v71;
        if (v15)
          goto LABEL_6;
        goto LABEL_25;
      }
    }
    objc_msgSend(v22, "hmf_UUIDForKey:", v18);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v41 = (void *)MEMORY[0x227676638]();
      v42 = v69;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      v11 = v68;
      v12 = v70;
      v32 = v72;
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_56;
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v68, "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        objc_msgSend(v68, "identifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v87 = *(_OWORD *)buf;
      objc_msgSend(v68, "messagePayload");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v81 = 2096;
      v82 = &v87;
      v83 = 2112;
      v84 = (uint64_t)v58;
      v59 = "%{public}@[%{uuid_t}.16P] execute off request missing UUID: %@";
LABEL_54:
      v60 = v43;
      v61 = 38;
      goto LABEL_55;
    }
    v25 = (void *)v29;
    v30 = v72;
    goto LABEL_22;
  }
LABEL_25:

  *v65 = objc_retainAutorelease(v12);
  *v66 = objc_retainAutorelease(v13);
  v32 = v72;
  *v67 = objc_retainAutorelease(v72);
  v33 = 1;
LABEL_58:

  return v33;
}

- (void)writeCharacteristicsWithWriteValueBySPIClientIdentifier:(id)a3 widgetKind:(id)a4 message:(id)a5 completionGroup:(id)a6 completion:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDWidgetTimelineRefresher *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDWidgetTimelineRefresher *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  __int128 v56;
  id obj;
  id v58;
  NSObject *group;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  id v75;
  _QWORD aBlock[5];
  id v77;
  id v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE buf[18];
  __int16 v107;
  __int128 *v108;
  __int16 v109;
  void *v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v62 = a3;
  v60 = a4;
  v12 = a5;
  group = a6;
  v58 = a7;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  -[HMDWidgetTimelineRefresher homeManager](self, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v14;
  v63 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
  if (v63)
  {
    v61 = *(_QWORD *)v86;
    *(_QWORD *)&v15 = 138544130;
    v56 = v15;
    v67 = v12;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v86 != v61)
          objc_enumerationMutation(obj);
        v64 = v16;
        v17 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v16);
        v18 = v62;
        v19 = v17;
        v65 = v19;
        if (self)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = 0u;
          v98 = 0u;
          v99 = 0u;
          v100 = 0u;
          objc_msgSend(v19, "hapAccessories");
          v66 = (id)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v97, buf, 16);
          if (v69)
          {
            v68 = *(_QWORD *)v98;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v98 != v68)
                  objc_enumerationMutation(v66);
                v70 = v21;
                v22 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v21);
                v93 = 0u;
                v94 = 0u;
                v95 = 0u;
                v96 = 0u;
                objc_msgSend(v22, "services", v56);
                v71 = (id)objc_claimAutoreleasedReturnValue();
                v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
                if (v73)
                {
                  v72 = *(_QWORD *)v94;
                  do
                  {
                    v23 = 0;
                    do
                    {
                      if (*(_QWORD *)v94 != v72)
                        objc_enumerationMutation(v71);
                      v74 = v23;
                      v24 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v23);
                      v89 = 0u;
                      v90 = 0u;
                      v91 = 0u;
                      v92 = 0u;
                      objc_msgSend(v24, "characteristics");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
                      if (v26)
                      {
                        v27 = v26;
                        v28 = *(_QWORD *)v90;
                        do
                        {
                          for (i = 0; i != v27; ++i)
                          {
                            if (*(_QWORD *)v90 != v28)
                              objc_enumerationMutation(v25);
                            v30 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
                            objc_msgSend(v30, "spiClientIdentifier");
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v18, "objectForKeyedSubscript:", v31);
                            v32 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v32)
                            {
                              +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", v30, v32, 0, 0);
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v20, "addObject:", v33);

                            }
                          }
                          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
                        }
                        while (v27);
                      }

                      v23 = v74 + 1;
                    }
                    while (v74 + 1 != (char *)v73);
                    v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
                  }
                  while (v73);
                }

                v21 = v70 + 1;
              }
              while (v70 + 1 != v69);
              v69 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v97, buf, 16);
            }
            while (v69);
          }

          v12 = v67;
          v19 = v65;
        }
        else
        {
          v20 = 0;
        }

        if (objc_msgSend(v20, "count"))
        {
          v34 = (void *)MEMORY[0x227676638]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            objc_msgSend(v12, "identifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              objc_msgSend(v12, "identifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "getUUIDBytes:", buf);

            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
            }
            v102 = *(_OWORD *)buf;
            *(_DWORD *)buf = v56;
            *(_QWORD *)&buf[4] = v37;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            v107 = 2096;
            v108 = &v102;
            v109 = 2112;
            v110 = v20;
            _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Writing characteristics: %@", buf, 0x26u);

          }
          v40 = v35;

          objc_autoreleasePoolPop(v34);
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v75 = v20;
          v41 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v82;
            do
            {
              for (j = 0; j != v42; ++j)
              {
                if (*(_QWORD *)v82 != v43)
                  objc_enumerationMutation(v75);
                v45 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
                objc_msgSend(v45, "value", v56);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "characteristic");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "spiClientIdentifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "identifier");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDWidgetTimelineRefresher _setPendingRequestValue:forUUID:messageIdentifier:](v40, "_setPendingRequestValue:forUUID:messageIdentifier:", v46, v48, v49);

              }
              v42 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
            }
            while (v42);
          }

          dispatch_group_enter(group);
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 3221225472;
          aBlock[2] = __132__HMDWidgetTimelineRefresher_writeCharacteristicsWithWriteValueBySPIClientIdentifier_widgetKind_message_completionGroup_completion___block_invoke;
          aBlock[3] = &unk_24E799BC0;
          aBlock[4] = v40;
          v50 = v75;
          v77 = v50;
          v12 = v67;
          v51 = v67;
          v78 = v51;
          v79 = v60;
          v80 = v58;
          v52 = _Block_copy(aBlock);
          v53 = parseMessageSource(v51);
          objc_msgSend(v51, "identifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "writeCharacteristicValues:source:identifier:qualityOfService:withCompletionHandler:", v50, v53, v54, objc_msgSend(v51, "qualityOfService"), v52);

        }
        v16 = v64 + 1;
      }
      while (v64 + 1 != v63);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
      v63 = v55;
    }
    while (v55);
  }

}

- (void)_startActionSetPrimaryStateUpdateCoalesceTimerContextForActionSetUUID:(id)a3 expectedState:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BDD1880], "zeroUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher _setPendingRequestValue:forUUID:messageIdentifier:](self, "_setPendingRequestValue:forUUID:messageIdentifier:", v6, v12, v8);

    -[HMDWidgetTimelineRefresher actionSetsPendingPrimaryResidentStateUpdates](self, "actionSetsPendingPrimaryResidentStateUpdates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

    -[HMDWidgetTimelineRefresher timerManager](self, "timerManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startTimerWithTimeInterval:andReplaceObject:", CFSTR("304578fe-8218-4be9-8afb-14ec282ab45b"), 30.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher setActionSetPrimaryStateUpdateCoalesceTimerContext:](self, "setActionSetPrimaryStateUpdateCoalesceTimerContext:", v11);

  }
}

- (void)_clearExpiredActionSetPrimaryStateUpdates
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
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (_os_feature_enabled_impl())
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[HMDWidgetTimelineRefresher actionSetsPendingPrimaryResidentStateUpdates](self, "actionSetsPendingPrimaryResidentStateUpdates", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          objc_msgSend(MEMORY[0x24BDD1880], "zeroUUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDWidgetTimelineRefresher _removePendingRequestValueForUUID:messageIdentifier:](self, "_removePendingRequestValueForUUID:messageIdentifier:", v9, v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    -[HMDWidgetTimelineRefresher actionSetsPendingPrimaryResidentStateUpdates](self, "actionSetsPendingPrimaryResidentStateUpdates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher _refreshWidgetsIfActionSetsHaveChanged:](self, "_refreshWidgetsIfActionSetsHaveChanged:", v11);

    -[HMDWidgetTimelineRefresher actionSetsPendingPrimaryResidentStateUpdates](self, "actionSetsPendingPrimaryResidentStateUpdates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

  }
}

- (id)_firstErrorFromCharacteristicWriteResponsePayload:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  HMDWidgetTimelineRefresher *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  HMDWidgetTimelineRefresher *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id obj;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v38 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v57;
      v39 = self;
      v32 = *(_QWORD *)v57;
      do
      {
        v7 = 0;
        v31 = v5;
        do
        {
          if (*(_QWORD *)v57 != v6)
            objc_enumerationMutation(obj);
          v40 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v7);
          objc_msgSend(obj, "hmf_dictionaryForKey:", v31);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v9 = v8;
          v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
          if (v35)
          {
            v10 = *(_QWORD *)v53;
            v33 = *(_QWORD *)v53;
            v34 = v7;
            v37 = v9;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v53 != v10)
                {
                  v12 = v11;
                  objc_enumerationMutation(v9);
                  v11 = v12;
                }
                v36 = v11;
                v41 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v11);
                objc_msgSend(v9, "hmf_dictionaryForKey:");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = 0u;
                v49 = 0u;
                v50 = 0u;
                v51 = 0u;
                v14 = v13;
                v46 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
                if (v46)
                {
                  v15 = *(_QWORD *)v49;
                  v44 = *(_QWORD *)v49;
                  v45 = v14;
                  while (2)
                  {
                    for (i = 0; i != v46; ++i)
                    {
                      if (*(_QWORD *)v49 != v15)
                        objc_enumerationMutation(v14);
                      v17 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
                      objc_msgSend(v14, "hmf_dictionaryForKey:", v17);
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v18, "hmf_dataForKey:", CFSTR("kCharacteristicErrorDataKey"));
                      v19 = objc_claimAutoreleasedReturnValue();
                      if (v19)
                      {
                        v20 = (void *)v19;
                        v21 = (void *)MEMORY[0x24BDD1620];
                        v22 = objc_opt_class();
                        v47 = 0;
                        objc_msgSend(v21, "unarchivedObjectOfClass:fromData:error:", v22, v20, &v47);
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        v24 = v47;
                        if (v24)
                        {
                          v25 = (void *)MEMORY[0x227676638]();
                          v26 = self;
                          HMFGetOSLogHandle();
                          v27 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                          {
                            HMFGetLogIdentifier();
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138544642;
                            v61 = v28;
                            v62 = 2112;
                            v63 = v24;
                            v64 = 2112;
                            v65 = v40;
                            v66 = 2112;
                            v67 = v41;
                            v68 = 2112;
                            v69 = v17;
                            v70 = 2112;
                            v71 = obj;
                            _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Error deserializing NSError: %@, for accessoryUUID: %@, serviceID: %@, characteristicID: %@, in payload: %@", buf, 0x3Eu);

                            self = v39;
                          }

                          objc_autoreleasePoolPop(v25);
                          v15 = v44;
                          v14 = v45;
                        }
                        else
                        {
                          v42 = v23;
                        }

                        if (!v24)
                        {

                          v29 = v42;
                          goto LABEL_35;
                        }
                      }
                      else
                      {

                      }
                    }
                    v46 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
                    if (v46)
                      continue;
                    break;
                  }
                }

                v11 = v36 + 1;
                v10 = v33;
                v7 = v34;
                v9 = v37;
              }
              while (v36 + 1 != v35);
              v35 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
            }
            while (v35);
          }

          ++v7;
          v6 = v32;
        }
        while (v7 != v31);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
        v6 = v32;
        v29 = 0;
      }
      while (v5);
    }
    else
    {
      v29 = 0;
    }
LABEL_35:

    v4 = v38;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)_getPendingWriteValueForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HMDWidgetTimelineRefresher pendingRequestValueByUUID](self, "pendingRequestValueByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setPendingRequestValue:(id)a3 forUUID:(id)a4 messageIdentifier:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15[0] = a3;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDWidgetTimelineRefresher pendingRequestValueByUUID](self, "pendingRequestValueByUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v12, v10);

}

- (void)_removePendingRequestValueForUUID:(id)a3 messageIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[HMDWidgetTimelineRefresher pendingRequestValueByUUID](self, "pendingRequestValueByUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDWidgetTimelineRefresher pendingRequestValueByUUID](self, "pendingRequestValueByUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

  }
}

- (id)modifiedCharacteristicsFromNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("HMDModifiedPreviouslyNilValuedCharacteristicsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") || objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v8, "addObjectsFromArray:", v5);
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v8, "addObjectsFromArray:", v7);
    v9 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)handleAccessoryCharacteristicsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDWidgetTimelineRefresher *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[6];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDWidgetTimelineRefresher modifiedCharacteristicsFromNotification:](self, "modifiedCharacteristicsFromNotification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = self;
    block[5] = v5;
    v13 = v4;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Characteristics changed notification does not include modified characteristics: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)handleAccessoryRemoteReachabilityChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDWidgetTimelineRefresher *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = self;
    v16 = v7;
    v17 = v4;
    dispatch_async(v8, block);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "object");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Notification %@ is not from an HMDAccessory object: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)handleCurrentHomeChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HMDWidgetTimelineRefresher_handleCurrentHomeChangeNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleNotifiedXPCClientsOfHomeConfigurationChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __92__HMDWidgetTimelineRefresher_handleNotifiedXPCClientsOfHomeConfigurationChangeNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomeSensingChangedNotification
{
  NSObject *v3;
  void *v4;
  HMDWidgetTimelineRefresher *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling home sensing changed notification. Refreshing timeline for configured widgets", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](v5, CFSTR("Home sensing changed"));
}

- (void)handleSelectedHomeChangedNotification
{
  NSObject *v3;
  void *v4;
  HMDWidgetTimelineRefresher *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling selected home changed notification. Refreshing timeline for configured widgets", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](v5, CFSTR("Selected home changed"));
}

- (id)actionSetsByHome:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "home", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v13, v11);

          }
          objc_msgSend(v4, "objectForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (id)thresholdForCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  char v14;
  void *v15;
  char v16;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_16;
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1B520]) & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE1B860]) & 1) == 0)
  {
    objc_msgSend(v4, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B870]))
    {

      goto LABEL_6;
    }
    objc_msgSend(v4, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE1B7D0]);

    if ((v14 & 1) != 0)
      goto LABEL_7;
LABEL_9:
    objc_msgSend(v3, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE1B510]) & 1) != 0)
    {
      objc_msgSend(v4, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE1B860]) & 1) != 0)
      {
LABEL_13:

LABEL_14:
        v8 = &unk_24E96AD48;
        goto LABEL_17;
      }
      objc_msgSend(v4, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE1B870]))
      {

        goto LABEL_13;
      }
      objc_msgSend(v4, "type");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE1B7D8]);

      if ((v16 & 1) != 0)
        goto LABEL_14;
    }
    else
    {

    }
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
LABEL_6:

LABEL_7:
  v8 = &unk_24E971468;
LABEL_17:

  return v8;
}

- (BOOL)actionSetIsOn:(id)a3
{
  id v4;
  uint64_t i;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v24;
  void *v25;
  id obj;
  HMDWidgetTimelineRefresher *v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "home");
  v27 = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HMDWidgetTimelineRefresher evaluateActionSetStateOnPrimaryEnabledForHome:](self, "evaluateActionSetStateOnPrimaryEnabledForHome:");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = v4;
  objc_msgSend(v4, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
        v8 = v7;

        if (v8)
        {
          objc_msgSend(v8, "characteristic");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "targetValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "metadata");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "minimumValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "metadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "maximumValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[HMDWidgetTimelineRefresher _value:isApproximatelyEqualToValue:forMinimumValue:maximumValue:](v27, "_value:isApproximatelyEqualToValue:forMinimumValue:maximumValue:", v10, v11, v13, v15)|| v28;

          if (v16 != 1
            || (objc_msgSend(v9, "accessory"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "isRemotelyReachable"),
                v17,
                (v18 & 1) == 0))
          {

            v22 = 0;
            v19 = v24;
            v21 = v25;
            goto LABEL_18;
          }

        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v30)
        continue;
      break;
    }
  }

  if (v28)
  {
    v19 = v24;
    objc_msgSend(v24, "actionSetStateSubscriptionManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v25;
    objc_msgSend(v25, "uuid");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    obj = v20;
    v22 = objc_msgSend(v20, "isActionSetOn:", v8);
LABEL_18:

  }
  else
  {
    v22 = 1;
    v19 = v24;
    v21 = v25;
  }

  return v22;
}

- (BOOL)_value:(id)a3 isApproximatelyEqualToValue:(id)a4 forMinimumValue:(id)a5 maximumValue:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  char v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;
  v15 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v14)
    v18 = v17 == 0;
  else
    v18 = 1;
  if (v18)
    goto LABEL_21;
  v19 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  v22 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  if (!v21 || !v24)
  {

LABEL_21:
    v32 = objc_msgSend(v9, "isEqual:", v10);
    goto LABEL_22;
  }
  objc_msgSend(v21, "floatValue");
  v26 = v25;
  objc_msgSend(v24, "floatValue");
  v28 = vabds_f32(v26, v27);
  objc_msgSend(v17, "floatValue");
  v30 = v29;
  objc_msgSend(v14, "floatValue");
  v32 = v28 <= (float)((float)(v30 - v31) * 0.02);

LABEL_22:
  return v32;
}

- (void)handleCurrentOrPrimaryHomeChangedNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDWidgetTimelineRefresher *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  _BYTE buf[18];
  __int16 v20;
  __int128 *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  __int128 *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HMDNotificationCurrentHomeDidChange"));

  if (v6)
    -[HMDWidgetTimelineRefresher handleCurrentHomeChangeNotification:](self, "handleCurrentHomeChangeNotification:", v4);
  -[HMDWidgetTimelineRefresher homeManager](self, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentHomeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "primaryHomeUUID"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[HMDWidgetTimelineRefresher currentHomeUUID](self, "currentHomeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HMFEqualObjects();

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
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        -[HMDWidgetTimelineRefresher currentHomeUUID](v12, "currentHomeUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[HMDWidgetTimelineRefresher currentHomeUUID](v12, "currentHomeUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
        }
        v18 = *(_OWORD *)buf;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v8, "getUUIDBytes:", buf);
        v17 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        v20 = 2096;
        v21 = &v18;
        v22 = 1040;
        v23 = 16;
        v24 = 2096;
        v25 = &v17;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Current home changed from %{uuid_t}.16P to %{uuid_t}.16P, resetting all characteristic notifications", buf, 0x2Cu);

      }
      objc_autoreleasePoolPop(v11);
      -[HMDWidgetTimelineRefresher setCurrentHomeUUID:](v12, "setCurrentHomeUUID:", v8);
      -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v12);
    }
  }

}

- (void)handleHomeAddedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDWidgetTimelineRefresher *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDHomeNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Home '%@' was added, resetting all characteristic notifications", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v10);

}

- (void)handleHomeRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDWidgetTimelineRefresher *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDHomeNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Home '%@' was removed, resetting all characteristic notifications", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v10);

}

- (void)handleAccessoryAddedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDWidgetTimelineRefresher *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDNotificationAddedAccessoryKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v4, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Accessory '%@:%@' was added, resetting all characteristic notifications", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v13);

}

- (void)handleAccessoryRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDWidgetTimelineRefresher *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDAccessoryNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v4, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Accessory '%@:%@' was removed, resetting all characteristic notifications", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v13);

}

- (void)handleResidentDeviceChangedNotification:(id)a3
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
  void *v13;
  HMDWidgetTimelineRefresher *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerHomeUUIDNotificationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher homeManager](v14, "homeManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_homeWithUUID:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v24 = v4;
    v20 = v12;
    v21 = v13;
    v22 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v16;
    v27 = 2112;
    v28 = v17;
    v29 = 2112;
    v30 = v23;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Resident has changed to %@ for home %@, resetting all characteristic notifications", buf, 0x20u);

    v8 = v22;
    v13 = v21;
    v12 = v20;
    v4 = v24;

  }
  objc_autoreleasePoolPop(v13);
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v14);

}

- (void)handleResidentDeviceAddedOrRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDWidgetTimelineRefresher *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerHomeUUIDNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher homeManager](v10, "homeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_homeWithUUID:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v12;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident was added or removed for home %@, resetting all characteristic notifications", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v10);

}

- (void)handleNotificationOfPossibleNewWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMDWidgetTimelineRefresher *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWidgetTimelineRefresher activeWidgetKinds](self, "activeWidgetKinds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((v7 & 1) != 0)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Duplicate widget '%@' with payload '%@' ignored", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "object");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@New widget '%@' has been spotted, with payload '%@'", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDWidgetTimelineRefresher fetchAndStoreActiveWidgetKinds](v9, "fetchAndStoreActiveWidgetKinds");
    -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](v9);
  }

}

- (void)handleAccessoryReachabilityChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDWidgetTimelineRefresher *v9;

  v4 = a3;
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMDWidgetTimelineRefresher_handleAccessoryReachabilityChangedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleRestrictedGuestScheduleStartedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v7 = v5;

  v6 = v7;
  if (v7)
  {
    -[HMDWidgetTimelineRefresher handleRestrictedGuestScheduleEventForUser:](self, "handleRestrictedGuestScheduleEventForUser:", v7);
    v6 = v7;
  }

}

- (void)handleRestrictedGuestScheduleEndedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v7 = v5;

  v6 = v7;
  if (v7)
  {
    -[HMDWidgetTimelineRefresher handleRestrictedGuestScheduleEventForUser:](self, "handleRestrictedGuestScheduleEventForUser:", v7);
    v6 = v7;
  }

}

- (void)handleRestrictedGuestScheduleEventForUser:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (objc_msgSend(a3, "isCurrentUser"))
  {
    -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__HMDWidgetTimelineRefresher_handleRestrictedGuestScheduleEventForUser___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (BOOL)evaluateActionSetStateOnPrimaryEnabledForHome:(id)a3
{
  void *v3;
  BOOL v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "primaryResident");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "capabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsResidentActionSetStateEvaluation");

  }
  return v6;
}

- (void)didUpdateStateWithActionSetUUID:(id)a3 state:(BOOL)a4
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__HMDWidgetTimelineRefresher_didUpdateStateWithActionSetUUID_state___block_invoke;
    v7[3] = &unk_24E79C268;
    v7[4] = self;
    v8 = v5;
    dispatch_async(v6, v7);

  }
}

- (void)_refreshWidgetsIfActionSetsHaveChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  HMDWidgetTimelineRefresher *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  id v18;
  _QWORD v19[4];
  id v20;
  HMDWidgetTimelineRefresher *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWidgetTimelineRefresher monitoredActionSetsMapByWidget](self, "monitoredActionSetsMapByWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke;
  v19[3] = &unk_24E77D7F0;
  v9 = v4;
  v20 = v9;
  v21 = self;
  v22 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v19);

  v10 = objc_msgSend(v6, "count");
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v15;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling action set change (%@) and refreshing timeline for widgets: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_239;
    v17[3] = &unk_24E77DB28;
    v17[4] = v12;
    v17[5] = v6;
    v18 = v9;
    -[HMDWidgetTimelineRefresher cleanUpRemovedWidgetsFromWidgets:completion:](v12, v6, v17);

  }
  else
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@No widgets need to be refreshed from this action set change: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDWidgetTimelineRefresher *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDWidgetTimelineRefresher *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDWidgetTimelineRefresher workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDWidgetTimelineRefresher widgetRefreshCoalesceTimerContext](self, "widgetRefreshCoalesceTimerContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    v14 = (void *)MEMORY[0x227676638](-[HMDWidgetTimelineRefresher setWidgetRefreshCoalesceTimerContext:](self, "setWidgetRefreshCoalesceTimerContext:", 0));
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Widget refresh coalescing timer fired.", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDWidgetTimelineRefresher widgetRefreshCoalesceKinds](v15, "widgetRefreshCoalesceKinds");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher widgetRefreshCoalesceReason](v15, "widgetRefreshCoalesceReason");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher _refreshTimelineForWidgetKinds:withReason:](v15, v13, v18);

    goto LABEL_15;
  }
  -[HMDWidgetTimelineRefresher actionSetPrimaryStateUpdateCoalesceTimerContext](self, "actionSetPrimaryStateUpdateCoalesceTimerContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v7)
  {
    objc_msgSend(v7, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      -[HMDWidgetTimelineRefresher handleTimerFiredForActionSet:](self, "handleTimerFiredForActionSet:", v13);
    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "object");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v22;
        v26 = 2112;
        v27 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Timer manager fired with object that is unexpected: %@", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }
LABEL_15:

    goto LABEL_16;
  }
  -[HMDWidgetTimelineRefresher _clearExpiredActionSetPrimaryStateUpdates](self, "_clearExpiredActionSetPrimaryStateUpdates");
LABEL_16:

}

- (void)handleTimerFiredForActionSet:(id)a3
{
  id v4;
  void *v5;
  HMDWidgetTimelineRefresher *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Clearing cached error for action set: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWidgetTimelineRefresher cachedActionSetExecuteErrorByUUID](v6, "cachedActionSetExecuteErrorByUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v9);

  -[HMDWidgetTimelineRefresher cachedActionSetExecuteErrorTimerContextByUUID](v6, "cachedActionSetExecuteErrorTimerContextByUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v9);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWidgetTimelineRefresher monitoredActionSetsMapByWidget](v6, "monitoredActionSetsMapByWidget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__HMDWidgetTimelineRefresher_handleTimerFiredForActionSet___block_invoke;
  v16[3] = &unk_24E77D8F0;
  v17 = v12;
  v18 = v4;
  v14 = v4;
  v15 = v12;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v16);

  -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v6, v15, CFSTR("Action Set Error Cleared"), 1);
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDWidgetTimelineRefresher homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSSet)monitoredCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMonitoredCharacteristics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSSet)activeWidgetKinds
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActiveWidgetKinds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 64, 1);
}

- (HMDWidgetConfigurationReader)widgetConfigurationReader
{
  return (HMDWidgetConfigurationReader *)objc_getProperty(self, a2, 72, 1);
}

- (HMDWidgetTimelineController)timelineController
{
  return (HMDWidgetTimelineController *)objc_getProperty(self, a2, 80, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 88, 1);
}

- (HMFTimerManager)timerManager
{
  return self->_timerManager;
}

- (NSUUID)currentHomeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentHomeUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSSet)widgetKindsToUpdate
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWidgetKindsToUpdate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSMutableDictionary)accessoryIsReachableByUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (OS_dispatch_source)widgetRefreshDispatchTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)clientIdentifierForExplicitlyMonitoredCharacteristics
{
  return self->_clientIdentifierForExplicitlyMonitoredCharacteristics;
}

- (NSMutableDictionary)monitoredCharacteristicsMapByWidget
{
  return self->_monitoredCharacteristicsMapByWidget;
}

- (NSMutableDictionary)monitoredActionSetsMapByWidget
{
  return self->_monitoredActionSetsMapByWidget;
}

- (NSMapTable)cachedValueByCharacteristic
{
  return self->_cachedValueByCharacteristic;
}

- (NSMapTable)cachedIsOnStateByActionSet
{
  return self->_cachedIsOnStateByActionSet;
}

- (NSMapTable)pendingRequestValueByUUID
{
  return self->_pendingRequestValueByUUID;
}

- (NSMutableDictionary)cachedActionSetExecuteErrorByUUID
{
  return self->_cachedActionSetExecuteErrorByUUID;
}

- (NSMutableDictionary)cachedActionSetExecuteErrorTimerContextByUUID
{
  return self->_cachedActionSetExecuteErrorTimerContextByUUID;
}

- (HMFTimerManagerTimerContext)actionSetPrimaryStateUpdateCoalesceTimerContext
{
  return self->_actionSetPrimaryStateUpdateCoalesceTimerContext;
}

- (void)setActionSetPrimaryStateUpdateCoalesceTimerContext:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetPrimaryStateUpdateCoalesceTimerContext, a3);
}

- (NSMutableSet)actionSetsPendingPrimaryResidentStateUpdates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 208, 1);
}

- (HMFTimerManagerTimerContext)widgetRefreshCoalesceTimerContext
{
  return self->_widgetRefreshCoalesceTimerContext;
}

- (void)setWidgetRefreshCoalesceTimerContext:(id)a3
{
  objc_storeStrong((id *)&self->_widgetRefreshCoalesceTimerContext, a3);
}

- (NSString)widgetRefreshCoalesceReason
{
  return self->_widgetRefreshCoalesceReason;
}

- (void)setWidgetRefreshCoalesceReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSSet)widgetRefreshCoalesceKinds
{
  return self->_widgetRefreshCoalesceKinds;
}

- (void)setWidgetRefreshCoalesceKinds:(id)a3
{
  objc_storeStrong((id *)&self->_widgetRefreshCoalesceKinds, a3);
}

- (int64_t)reachabilityUpdateDispatchDelayNs
{
  return self->_reachabilityUpdateDispatchDelayNs;
}

- (int64_t)forceUpdateTimelineDispatchDelayNs
{
  return self->_forceUpdateTimelineDispatchDelayNs;
}

- (id)forceUpdateAutobahnTimelineHandler
{
  return self->_forceUpdateAutobahnTimelineHandler;
}

- (void)setForceUpdateAutobahnTimelineHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSMutableDictionary)characteristicsToPreviouslySeenValues
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (id)fetchAndStoreActiveWidgetKindsHandler
{
  return self->_fetchAndStoreActiveWidgetKindsHandler;
}

- (void)setFetchAndStoreActiveWidgetKindsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchAndStoreActiveWidgetKindsHandler, 0);
  objc_storeStrong((id *)&self->_characteristicsToPreviouslySeenValues, 0);
  objc_storeStrong(&self->_forceUpdateAutobahnTimelineHandler, 0);
  objc_storeStrong((id *)&self->_widgetRefreshCoalesceKinds, 0);
  objc_storeStrong((id *)&self->_widgetRefreshCoalesceReason, 0);
  objc_storeStrong((id *)&self->_widgetRefreshCoalesceTimerContext, 0);
  objc_storeStrong((id *)&self->_actionSetsPendingPrimaryResidentStateUpdates, 0);
  objc_storeStrong((id *)&self->_actionSetPrimaryStateUpdateCoalesceTimerContext, 0);
  objc_storeStrong((id *)&self->_cachedActionSetExecuteErrorTimerContextByUUID, 0);
  objc_storeStrong((id *)&self->_cachedActionSetExecuteErrorByUUID, 0);
  objc_storeStrong((id *)&self->_pendingRequestValueByUUID, 0);
  objc_storeStrong((id *)&self->_cachedIsOnStateByActionSet, 0);
  objc_storeStrong((id *)&self->_cachedValueByCharacteristic, 0);
  objc_storeStrong((id *)&self->_monitoredActionSetsMapByWidget, 0);
  objc_storeStrong((id *)&self->_monitoredCharacteristicsMapByWidget, 0);
  objc_storeStrong((id *)&self->_clientIdentifierForExplicitlyMonitoredCharacteristics, 0);
  objc_storeStrong((id *)&self->_widgetRefreshDispatchTimer, 0);
  objc_storeStrong((id *)&self->_accessoryIsReachableByUUID, 0);
  objc_storeStrong((id *)&self->_widgetKindsToUpdate, 0);
  objc_storeStrong((id *)&self->_currentHomeUUID, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_timelineController, 0);
  objc_storeStrong((id *)&self->_widgetConfigurationReader, 0);
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_activeWidgetKinds, 0);
  objc_storeStrong((id *)&self->_monitoredCharacteristics, 0);
}

void __59__HMDWidgetTimelineRefresher_handleTimerFiredForActionSet___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v7, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

  if ((v9 & 1) == 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "isEqual:", *(_QWORD *)(a1 + 40), (_QWORD)v18))
          {
            v16 = *(void **)(a1 + 32);
            objc_msgSend(v7, "kind");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v17);

            *a4 = 1;
            goto LABEL_12;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)refreshTimelineForWidgetKinds:(void *)a3 withReason:(int)a4 shouldCoalesce:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    if (objc_msgSend(v7, "count"))
    {
      if (!a4)
      {
        objc_msgSend(a1, "widgetRefreshCoalesceKinds");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setByAddingObjectsFromSet:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWidgetTimelineRefresher _refreshTimelineForWidgetKinds:withReason:](a1, v24, v8);
LABEL_11:

        goto LABEL_12;
      }
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = v13;
        v27 = 2112;
        v28 = v8;
        v29 = 2112;
        v30 = v15;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Coalescing and delaying widget refresh due to %@ for kinds: %@", (uint8_t *)&v25, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11, "widgetRefreshCoalesceKinds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setByAddingObjectsFromSet:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWidgetRefreshCoalesceKinds:", v17);

      objc_msgSend(v11, "widgetRefreshCoalesceTimerContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = (void *)MEMORY[0x227676638]();
        v20 = v11;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v22;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting coalescing timer", (uint8_t *)&v25, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(v20, "setWidgetRefreshCoalesceReason:", v8);
        objc_msgSend(v20, "timerManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "startTimerWithTimeInterval:object:", CFSTR("AF927200-D9B8-4498-9175-6620DB053CC6"), 1.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setWidgetRefreshCoalesceTimerContext:", v24);
        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

- (void)_refreshTimelineForWidgetKinds:(void *)a3 withReason:
{
  id v5;
  id v6;
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
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "widgetRefreshCoalesceTimerContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "timerManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "widgetRefreshCoalesceTimerContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancelTimerForContext:", v9);

    }
    objc_msgSend(a1, "setWidgetRefreshCoalesceReason:", 0);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setWidgetRefreshCoalesceKinds:", v10);

    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v14;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Refreshing widget due to %@ for kinds: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v12, "workQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__HMDWidgetTimelineRefresher__refreshTimelineForWidgetKinds_withReason___block_invoke;
    block[3] = &unk_24E79BBD0;
    v19 = v5;
    v20 = v12;
    v21 = v6;
    dispatch_async(v17, block);

  }
}

void __72__HMDWidgetTimelineRefresher__refreshTimelineForWidgetKinds_withReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  void *v18;
  void *v19;
  HMDWidgetTimelineRefresherLogEvent *v20;
  __int128 v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v24;
    *(_QWORD *)&v3 = 138543874;
    v21 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "timelineController", v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "reloadTimelineWithExtensionBundleIdentifier:kind:reason:", CFSTR("com.apple.Home.HomeWidget.Interactive"), v7, *(_QWORD *)(a1 + 48));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)MEMORY[0x227676638]();
        v11 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v9)
        {
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_12;
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v21;
          v28 = v14;
          v29 = 2114;
          v30 = v7;
          v31 = 2112;
          v32 = v9;
          v15 = v13;
          v16 = OS_LOG_TYPE_ERROR;
          v17 = "%{public}@Failed reload of timeline for '%{public}@': %@";
        }
        else
        {
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            goto LABEL_12;
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 48);
          *(_DWORD *)buf = v21;
          v28 = v14;
          v29 = 2114;
          v30 = v7;
          v31 = 2114;
          v32 = v18;
          v15 = v13;
          v16 = OS_LOG_TYPE_DEFAULT;
          v17 = "%{public}@Successfully reloaded timeline for '%{public}@' due to %{public}@";
        }
        _os_log_impl(&dword_2218F0000, v15, v16, v17, buf, 0x20u);

LABEL_12:
        objc_autoreleasePoolPop(v10);
        objc_msgSend(*(id *)(a1 + 40), "logEventSubmitter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[HMDWidgetTimelineRefresherLogEvent initWithKind:reason:]([HMDWidgetTimelineRefresherLogEvent alloc], "initWithKind:reason:", v7, *(_QWORD *)(a1 + 48));
        objc_msgSend(v19, "submitLogEvent:error:", v20, v9);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v4);
  }

}

void __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke(id *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_2;
  v26[3] = &unk_24E786FD0;
  v27 = a1[4];
  v9 = objc_msgSend(v8, "na_any:", v26);

  if (v9)
  {
    v21 = a4;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(a1[5], "cachedIsOnStateByActionSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_msgSend(a1[5], "actionSetIsOn:", v15);
          if (!v17 || (_DWORD)v18 != objc_msgSend(v17, "BOOLValue"))
          {
            objc_msgSend(a1[5], "cachedIsOnStateByActionSet");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKey:", v20, v15);

            objc_msgSend(a1[6], "addObject:", v7);
            *v21 = 1;

            goto LABEL_13;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

void __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_239(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "minusSet:", v3));
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v12 = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing timeline due to action set (%@) change for configured widgets: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 40), "na_map:", &__block_literal_global_241);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](*(void **)(a1 + 32), v11, CFSTR("Action set state changed"), 0);

}

- (void)cleanUpRemovedWidgetsFromWidgets:(void *)a3 completion:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "widgetConfigurationReader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74__HMDWidgetTimelineRefresher_cleanUpRemovedWidgetsFromWidgets_completion___block_invoke;
    v8[3] = &unk_24E795030;
    v8[4] = a1;
    v10 = v6;
    v9 = v5;
    objc_msgSend(v7, "fetchHomeWidgetsWithCompletion:", v8);

  }
}

void __74__HMDWidgetTimelineRefresher_cleanUpRemovedWidgetsFromWidgets_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__HMDWidgetTimelineRefresher_cleanUpRemovedWidgetsFromWidgets_completion___block_invoke_2;
  block[3] = &unk_24E799A68;
  v8 = a1[4];
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v16 = a1[6];
  v15 = a1[5];
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __74__HMDWidgetTimelineRefresher_cleanUpRemovedWidgetsFromWidgets_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_setByRemovingObjectsFromSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 40);
    v35 = v4;
    if (v5)
    {
      objc_msgSend(v5, "workQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v6);

      if (objc_msgSend(v35, "count"))
      {
        v7 = (void *)MEMORY[0x227676638]();
        v8 = v5;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v10;
          v42 = 2112;
          v43 = v35;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing old widgets and updating monitored characteristics and action sets: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWidgetTimelineRefresher actionSetsMonitoredForWidgets](v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "monitoredCharacteristicsMapByWidget");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeObjectsForKeys:", v13);

        objc_msgSend(v8, "monitoredActionSetsMapByWidget");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectsForKeys:", v13);

        -[HMDWidgetTimelineRefresher characteristicsMonitoredForWidgets](v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWidgetTimelineRefresher actionSetsMonitoredForWidgets](v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWidgetTimelineRefresher updateMonitoredActionSetsWithPreviousActionSets:currentActionSets:]((uint64_t)v8, v12, v17);
        v34 = v11;
        v32 = v16;
        -[HMDWidgetTimelineRefresher updateNotificationRegistrationWithPreviousCharacteristics:currentCharacteristics:updateRequestQualityOfService:](v8, v11, v16, 33);
        v33 = v12;
        objc_msgSend(v12, "na_setByRemovingObjectsFromSet:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v37;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v37 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v22);
              objc_msgSend(v8, "cachedIsOnStateByActionSet", v32);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "removeObjectForKey:", v23);

              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
          }
          while (v20);
        }

      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v41 = v28;
      v42 = 2112;
      v43 = v29;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch configured widgets with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v30 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v31);

  }
}

- (id)characteristicsMonitoredForWidgets
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "monitoredCharacteristicsMapByWidget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke;
  v9[3] = &unk_24E77D9B8;
  v9[4] = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_msgSend(a1, "monitoredActionSetsMapByWidget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke_2;
  v8[3] = &unk_24E77D8F0;
  v8[4] = a1;
  v8[5] = v2;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  v6 = v2;
  return v6;
}

- (id)actionSetsMonitoredForWidgets
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "monitoredActionSetsMapByWidget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_224_56057);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateMonitoredActionSetsWithPreviousActionSets:(void *)a3 currentActionSets:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v5, "na_setByRemovingObjectsFromSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_setByRemovingObjectsFromSet:", v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v13, "home", v26);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "actionSetStateSubscriptionManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stopMonitoringActionSetUUID:observer:", v16, a1);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v10);
    }
    v27 = v5;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v26;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v22, "home", v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "actionSetStateSubscriptionManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "startMonitoringActionSetUUID:observer:", v25, a1);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v19);
    }

    v5 = v27;
  }

}

- (void)updateNotificationRegistrationWithPreviousCharacteristics:(void *)a3 currentCharacteristics:(uint64_t)a4 updateRequestQualityOfService:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t n;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t ii;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  __int128 v91;
  __int128 v92;
  __int128 v93;
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
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint8_t v109[128];
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  id v113;
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v89 = v6;
  objc_msgSend(v6, "na_map:", &__block_literal_global_215);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v7;
  objc_msgSend(v7, "na_map:", &__block_literal_global_216);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_setByRemovingObjectsFromSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v104 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        objc_msgSend(a1, "clientIdentifierForExplicitlyMonitoredCharacteristics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "registerForAccessoryReachabilityNotifications:registrationIdentifier:", 0, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
    }
    while (v14);
  }

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v19 = v11;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v100;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v100 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
        objc_msgSend(a1, "clientIdentifierForExplicitlyMonitoredCharacteristics");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "registerForAccessoryReachabilityNotifications:registrationIdentifier:", 1, v25);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
    }
    while (v21);
  }

  objc_msgSend(v89, "na_map:", &__block_literal_global_218_56046);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "na_map:", &__block_literal_global_218_56046);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "na_setByRemovingObjectsFromSet:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v27;
  objc_msgSend(v27, "na_setByRemovingObjectsFromSet:", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count") || objc_msgSend(v29, "count"))
  {
    v86 = v29;
    if (objc_msgSend(v28, "count"))
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = a1;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v111 = v33;
        v112 = 2112;
        v113 = v28;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Disabling notifications and removing cached value for characteristics: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(v31, "clientIdentifierForExplicitlyMonitoredCharacteristics");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWidgetTimelineRefresher setNotificationEnabled:forCharacteristics:clientIdentifier:](v31, 0, v28, v34);

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v35 = v28;
      v36 = v28;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v96;
        do
        {
          for (k = 0; k != v38; ++k)
          {
            if (*(_QWORD *)v96 != v39)
              objc_enumerationMutation(v36);
            v41 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * k);
            objc_msgSend(v31, "cachedValueByCharacteristic");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "removeObjectForKey:", v41);

          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
        }
        while (v38);
      }

      v28 = v35;
      v29 = v86;
    }
    if (objc_msgSend(v29, "count"))
    {
      v84 = v28;
      v43 = (void *)MEMORY[0x227676638]();
      v44 = a1;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v111 = v46;
        v112 = 2112;
        v113 = v29;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Enabling notifications and storing cached value for characteristics: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v43);
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v47 = v29;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v92;
        do
        {
          for (m = 0; m != v49; ++m)
          {
            if (*(_QWORD *)v92 != v50)
              objc_enumerationMutation(v47);
            v52 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * m);
            objc_msgSend(v44, "cachedValueByCharacteristic");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "value");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setObject:forKey:", v54, v52);

          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
        }
        while (v49);
      }
      v85 = v26;

      objc_msgSend(v44, "clientIdentifierForExplicitlyMonitoredCharacteristics");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWidgetTimelineRefresher setNotificationEnabled:forCharacteristics:clientIdentifier:](v44, 1u, v47, v55);

      v56 = v47;
      v57 = (void *)MEMORY[0x227676638]();
      v58 = v44;
      HMFGetOSLogHandle();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v111 = v60;
        v112 = 2112;
        v113 = v56;
        _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Reading characteristics: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v57);
      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v62 = v56;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v104;
        do
        {
          for (n = 0; n != v64; ++n)
          {
            if (*(_QWORD *)v104 != v65)
              objc_enumerationMutation(v62);
            v67 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * n);
            objc_msgSend(v67, "accessory");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "home");
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if (v69)
            {
              objc_msgSend(v61, "objectForKey:", v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = v70;
              if (v70)
                objc_msgSend(v70, "setByAddingObject:", v67);
              else
                objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v67);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setObject:forKey:", v72, v69);

            }
          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
        }
        while (v64);
      }
      v83 = v62;

      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v73 = v61;
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
      if (v74)
      {
        v75 = v74;
        v76 = *(_QWORD *)v100;
        do
        {
          for (ii = 0; ii != v75; ++ii)
          {
            if (*(_QWORD *)v100 != v76)
              objc_enumerationMutation(v73);
            v78 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * ii);
            objc_msgSend(v73, "objectForKey:", v78, v83);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "allObjects");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "na_map:", &__block_literal_global_228);
            v81 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v58, "description");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "readCharacteristicValues:source:sourceForLogging:qualityOfService:withCompletionHandler:", v81, 7, v82, a4, 0);

          }
          v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
        }
        while (v75);
      }

      v28 = v84;
      v26 = v85;
      v29 = v86;
    }
  }

}

- (void)setNotificationEnabled:(void *)a3 forCharacteristics:(void *)a4 clientIdentifier:
{
  id v5;
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
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  HMDCharacteristicNotificationChangeThreshold *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31 = a4;
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v11, "accessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v6, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
            objc_msgSend(v13, "setByAddingObject:", v11);
          else
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v15, v12);

          objc_msgSend(v11, "service");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            v17 = a2 == 0;
          else
            v17 = 1;
          if (!v17)
          {
            objc_msgSend(a1, "thresholdForCharacteristic:", v11);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v35, "objectForKey:", v12);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v19)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "setObject:forKey:", v19, v12);
              }
              v20 = -[HMDCharacteristicNotificationChangeThreshold initWithCharacteristic:threshold:]([HMDCharacteristicNotificationChangeThreshold alloc], "initWithCharacteristic:threshold:", v11, v18);
              objc_msgSend(v19, "addObject:", v20);

            }
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v8);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = v6;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "copy");

        objc_msgSend(v27, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setNotificationsEnabled:forCharacteristics:notificationChangeThresholds:clientIdentifier:", a2, v30, v29, v31);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v23);
  }

}

HMDCharacteristicRequest *__67__HMDWidgetTimelineRefresher_readCharacteristics_qualityOfService___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", a2);
}

uint64_t __73__HMDWidgetTimelineRefresher_characteristicsForMonitoredCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

id __101__HMDWidgetTimelineRefresher_updateMonitoredHomesWithPreviousCharacteristics_currentCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "reachabilityMonitored"))
  {
    objc_msgSend(v2, "characteristic");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __101__HMDWidgetTimelineRefresher_updateMonitoredHomesWithPreviousCharacteristics_currentCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "reachabilityMonitored"))
  {
    objc_msgSend(v2, "characteristic");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __59__HMDWidgetTimelineRefresher_actionSetsMonitoredForWidgets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "allObjects");
}

uint64_t __64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

void __64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "actionSetsByHome:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "evaluateActionSetStateOnPrimaryEnabledForHome:", v7) & 1) == 0)
        {
          -[HMDWidgetTimelineRefresher characteristicsFromActionSets:](*(void **)(a1 + 32), v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "na_map:", &__block_literal_global_219);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "unionSet:", v10);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (id)characteristicsFromActionSets:(void *)a1
{
  _QWORD v3[5];

  if (a1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __60__HMDWidgetTimelineRefresher_characteristicsFromActionSets___block_invoke;
    v3[3] = &unk_24E77DA20;
    v3[4] = a1;
    objc_msgSend(a2, "na_flatMap:", v3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

_TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic *__64__HMDWidgetTimelineRefresher_characteristicsMonitoredForWidgets__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  _TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic *v3;

  v2 = a2;
  v3 = -[HMDWidgetMonitoredCharacteristic initWithCharacteristic:reachabilityMonitored:]([_TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic alloc], "initWithCharacteristic:reachabilityMonitored:", v2, 0);

  return v3;
}

id __60__HMDWidgetTimelineRefresher_characteristicsFromActionSets___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(a2, "actions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_map:", &__block_literal_global_222);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id __59__HMDWidgetTimelineRefresher_characteristicsFromActionSet___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_240(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kind");
}

uint64_t __69__HMDWidgetTimelineRefresher__refreshWidgetsIfActionSetsHaveChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __68__HMDWidgetTimelineRefresher_didUpdateStateWithActionSetUUID_state___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1880], "zeroUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removePendingRequestValueForUUID:messageIdentifier:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "actionSetsPendingPrimaryResidentStateUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_refreshWidgetsIfActionSetsHaveChanged:", v7);

}

void __72__HMDWidgetTimelineRefresher_handleRestrictedGuestScheduleEventForUser___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Refreshing all Home widgets because of current user RG schedule changes", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "forceUpdateAutobahnTimelineHandler");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeWidgetKinds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v7);

  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](*(void **)(a1 + 32), CFSTR("RG schedule"));
}

- (void)refreshTimelineForConfiguredWidgetsWithReason:(void *)a1
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "widgetConfigurationReader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke;
    v5[3] = &unk_24E799F40;
    v5[4] = a1;
    v6 = v3;
    objc_msgSend(v4, "fetchHomeWidgetsWithCompletion:", v5);

  }
}

void __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke_2;
  v12[3] = &unk_24E79A910;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

void __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v2, "na_map:", &__block_literal_global_231);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](*(void **)(a1 + 40), v10, *(void **)(a1 + 56), 0);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch configured widgets to refresh with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
}

uint64_t __76__HMDWidgetTimelineRefresher_refreshTimelineForConfiguredWidgetsWithReason___block_invoke_230(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kind");
}

void __77__HMDWidgetTimelineRefresher_handleAccessoryReachabilityChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  dispatch_time_t v40;
  NSObject *v41;
  void (**v42)(_QWORD, _QWORD);
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  _QWORD block[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
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
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      v8 = objc_msgSend(v6, "hasAnyResident");

      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "accessoryIsReachableByUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          v12 = objc_msgSend(v11, "BOOLValue");
        else
          v12 = 1;
        v13 = objc_msgSend(v4, "isRemotelyReachable");
        if (v12 != v13)
        {
          v45 = v13;
          v46 = v11;
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_opt_class();
          objc_msgSend(*(id *)(a1 + 40), "activeWidgetKinds");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fetchSpecificationsForWidgetKinds:", v16);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v17 = a1;
          objc_msgSend(*(id *)(a1 + 40), "monitoredCharacteristics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v51;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v51 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                objc_msgSend(v23, "accessory");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "isEqual:", v4);

                if (v25)
                {
                  objc_msgSend(*(id *)(v17 + 40), "widgetKindsToUpdateFromFetchSpecifications:assumingChangedCharacteristic:", v47, v23);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "unionSet:", v26);

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
            }
            while (v20);
          }

          v27 = v14;
          if (objc_msgSend(v14, "count"))
          {
            v28 = (void *)MEMORY[0x227676638]();
            v29 = v17;
            v30 = *(id *)(v17 + 40);
            HMFGetOSLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "home");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "name");
              v44 = v28;
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              HMFBooleanToString();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v55 = v32;
              v56 = 2112;
              v57 = v33;
              v58 = 2112;
              v59 = v34;
              v60 = 2112;
              v61 = v35;
              _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Accessory '%@:%@' reachability changed to %@.", buf, 0x2Au);

              v28 = v44;
            }

            objc_autoreleasePoolPop(v28);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v45);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v29 + 40), "accessoryIsReachableByUUID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "uuid");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v38);

            v39 = *(void **)(v29 + 40);
            if (v45)
            {
              v40 = dispatch_time(0, objc_msgSend(v39, "reachabilityUpdateDispatchDelayNs"));
              objc_msgSend(*(id *)(v29 + 40), "workQueue");
              v41 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __77__HMDWidgetTimelineRefresher_handleAccessoryReachabilityChangedNotification___block_invoke_235;
              block[3] = &unk_24E79C268;
              block[4] = *(_QWORD *)(v29 + 40);
              v49 = v14;
              dispatch_after(v40, v41, block);

              v27 = v14;
            }
            else
            {
              objc_msgSend(v39, "forceUpdateAutobahnTimelineHandler");
              v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v42)[2](v42, v14);

            }
          }

          v11 = v46;
        }

      }
    }
    else
    {

    }
  }

}

void __77__HMDWidgetTimelineRefresher_handleAccessoryReachabilityChangedNotification___block_invoke_235(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "forceUpdateAutobahnTimelineHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)updateMonitoredCharacteristicsAndRefreshWidgetTimelines
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__HMDWidgetTimelineRefresher_updateMonitoredCharacteristicsAndRefreshWidgetTimelines__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = a1;
    dispatch_async(v2, block);

  }
}

void __85__HMDWidgetTimelineRefresher_updateMonitoredCharacteristicsAndRefreshWidgetTimelines__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "monitoredCharacteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "stopMonitoringOldCharacteristics");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "homeManager");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentHomeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "_homeWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeWidgetKinds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalMonitorCharacteristicsForCurrentHome:activeWidgetKinds:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMonitoredCharacteristics:", v9);

  objc_msgSend(*(id *)(a1 + 32), "monitoredCharacteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v3, "isEqualToSet:", v10);

  if ((v5 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Refreshing all Home widgets because of major changes / daemon restart", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 32), "forceUpdateAutobahnTimelineHandler");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "activeWidgetKinds");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v16);

  }
}

void __92__HMDWidgetTimelineRefresher_handleNotifiedXPCClientsOfHomeConfigurationChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
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
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2048;
    v13 = objc_msgSend(v7, "generationCounter");
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %{public}@. Generation counter: %lu. Refreshing timeline for configured widgets", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](*(void **)(a1 + 32), CFSTR("Home config changed"));
}

void __66__HMDWidgetTimelineRefresher_handleCurrentHomeChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  _BYTE buf[22];
  __int16 v18;
  int v19;
  __int16 v20;
  __int128 *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  __int128 *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_UUIDForKey:", CFSTR("HMDPreviousHomeUUIDKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmf_UUIDForKey:", CFSTR("HMDPreviousHomeUUIDKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
    }
    v16 = *(_OWORD *)buf;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_UUIDForKey:", CFSTR("HMDCurrentHomeUUIDKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmf_UUIDForKey:", CFSTR("HMDCurrentHomeUUIDKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
    }
    v15 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138544642;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    v18 = 1040;
    v19 = 16;
    v20 = 2096;
    v21 = &v16;
    v22 = 1040;
    v23 = 16;
    v24 = 2096;
    v25 = &v15;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling %{public}@. Previous: %{uuid_t}.16P, Current %{uuid_t}.16P. Refreshing timeline for configured widgets", buf, 0x36u);

  }
  objc_autoreleasePoolPop(v2);
  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](*(void **)(a1 + 32), CFSTR("Current home changed"));
}

void __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke(id *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _BYTE buf[24];
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v3 = a1[5];
  v4 = MEMORY[0x24BDAC760];
  if (v2)
  {
    objc_msgSend(v2, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "monitoredCharacteristicsMapByWidget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __58__HMDWidgetTimelineRefresher_relevantWidgetsForAccessory___block_invoke;
    v24[3] = &unk_24E77D8F0;
    v8 = v3;
    v25 = v8;
    v9 = v6;
    v26 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v24);

    objc_msgSend(v2, "monitoredActionSetsMapByWidget");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v4;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __58__HMDWidgetTimelineRefresher_relevantWidgetsForAccessory___block_invoke_2;
    v28 = &unk_24E77D7F0;
    v29 = v2;
    v30 = v8;
    v11 = v9;
    v31 = v11;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", buf);

    v12 = v31;
    v2 = v11;

  }
  v13 = (void *)objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(v13, "count"))
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1[4];
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling reachability change for relevant widgets: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke_197;
    v19[3] = &unk_24E77D8A0;
    v18 = a1[5];
    v20 = a1[4];
    v21 = v13;
    v22 = v18;
    v23 = a1[6];
    -[HMDWidgetTimelineRefresher cleanUpRemovedWidgetsFromWidgets:completion:](v20, v13, v19);

  }
}

void __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke_197(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  _BYTE buf[38];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x227676638](objc_msgSend(a1[5], "minusSet:", v3));
  v6 = a1[4];
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(a1[6], "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(a1[6], "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
    }
    v20 = *(_OWORD *)buf;
    v11 = a1[5];
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    *(_WORD *)&buf[18] = 2096;
    *(_QWORD *)&buf[20] = &v20;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing timeline due to accessory (%{uuid_t}.16P) reachability change for configured widgets: %@", buf, 0x26u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(a1[5], "na_map:", &__block_literal_global_199);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1[4];
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v19;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling %{public}@. Refreshing timeline for widget kinds: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](a1[4], v12, CFSTR("Accessory Reachability Changed"), 0);
  }

}

uint64_t __83__HMDWidgetTimelineRefresher_handleAccessoryRemoteReachabilityChangedNotification___block_invoke_198(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kind");
}

void __58__HMDWidgetTimelineRefresher_relevantWidgetsForAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "characteristic", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 32));

        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

void __58__HMDWidgetTimelineRefresher_relevantWidgetsForAccessory___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionSetsByHome:", a3);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v23 = v5;
    v21 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      v22 = v8;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "evaluateActionSetStateOnPrimaryEnabledForHome:", v11) & 1) == 0)
        {
          -[HMDWidgetTimelineRefresher characteristicsFromActionSets:](*(void **)(a1 + 32), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v25;
            while (2)
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v25 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "accessory");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "isEqual:", *(_QWORD *)(a1 + 40));

                if ((v20 & 1) != 0)
                {
                  v5 = v23;
                  objc_msgSend(*(id *)(a1 + 48), "addObject:", v23);

                  goto LABEL_20;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v16)
                continue;
              break;
            }
          }

          v9 = v21;
          v8 = v22;
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v5 = v23;
    }
    while (v8);
  }
LABEL_20:

}

void __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _BYTE buf[24];
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  if (v2)
  {
    objc_msgSend(v2, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "monitoredCharacteristicsMapByWidget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v4;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __91__HMDWidgetTimelineRefresher_relevantWidgetsForCharacteristics_outRelevantCharacteristics___block_invoke;
    v37 = &unk_24E77D8C8;
    v38 = v2;
    v9 = v3;
    v39 = v9;
    v10 = v6;
    v40 = v10;
    v11 = v7;
    v41 = v11;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", buf);

    objc_msgSend(v2, "monitoredActionSetsMapByWidget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v4;
    v32[1] = 3221225472;
    v32[2] = __91__HMDWidgetTimelineRefresher_relevantWidgetsForCharacteristics_outRelevantCharacteristics___block_invoke_2;
    v32[3] = &unk_24E77D8C8;
    v32[4] = v2;
    v33 = v9;
    v13 = v10;
    v34 = v13;
    v35 = v11;
    v14 = v11;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v32);

    v15 = objc_retainAutorelease(v14);
    v16 = v35;
    v2 = v13;

  }
  else
  {
    v15 = 0;
  }

  v17 = v15;
  v18 = objc_msgSend(v2, "count");
  v19 = (void *)MEMORY[0x227676638]();
  v20 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v22)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v2;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Handling characteristic change for relevant widgets: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v24 = *(void **)(a1 + 32);
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_188;
    v27[3] = &unk_24E77D858;
    v27[4] = v24;
    v28 = v17;
    v29 = v2;
    v25 = *(void **)(a1 + 48);
    v30 = *(_QWORD *)(a1 + 40);
    v31 = v25;
    -[HMDWidgetTimelineRefresher cleanUpRemovedWidgetsFromWidgets:completion:](v24, v2, v27);

  }
  else
  {
    if (v22)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Not handling characteristics changed notification because it is not relevant for current widgets", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }

}

void __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_2;
  v24[3] = &unk_24E798C68;
  v7 = *(void **)(a1 + 40);
  v24[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "na_filter:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "monitoredCharacteristicsMapByWidget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_3;
    v23[3] = &unk_24E77D7F0;
    v23[4] = *(_QWORD *)(a1 + 32);
    v23[5] = v8;
    v23[6] = v5;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v23);

  }
  objc_msgSend(*(id *)(a1 + 32), "monitoredActionSetsMapByWidget");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_4;
  v22[3] = &unk_24E77D7F0;
  v11 = *(_QWORD *)(a1 + 32);
  v22[4] = *(_QWORD *)(a1 + 48);
  v22[5] = v11;
  v22[6] = v5;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v22);

  v12 = objc_msgSend(v5, "count");
  v13 = (void *)MEMORY[0x227676638]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling %{public}@ and refreshing timeline. Updated characteristics: %@, for widgets: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v5, "na_map:", &__block_literal_global_193);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](*(void **)(a1 + 32), v19, CFSTR("Characteristics changed"), 0);

  }
  else
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@No widgets need to be refreshed from this characteristics changed notification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

uint64_t __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cachedValueByCharacteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cachedValueByCharacteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "setObject:forKey:", v4, v3);
  else
    objc_msgSend(v7, "removeObjectForKey:", v3);

  v9 = HMFEqualObjects() ^ 1;
  return v9;
}

void __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  -[HMDWidgetTimelineRefresher characteristicsForMonitoredCharacteristics:](*(void **)(a1 + 32), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

}

void __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_4(id *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BYTE *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (objc_msgSend(a1[4], "containsObject:", v7))
  {
    v20 = a4;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(a1[5], "cachedIsOnStateByActionSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(a1[5], "actionSetIsOn:", v14);
          if (!v16 || (_DWORD)v17 != objc_msgSend(v16, "BOOLValue"))
          {
            objc_msgSend(a1[5], "cachedIsOnStateByActionSet");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKey:", v19, v14);

            objc_msgSend(a1[6], "addObject:", v7);
            *v20 = 1;

            goto LABEL_13;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

uint64_t __80__HMDWidgetTimelineRefresher_handleAccessoryCharacteristicsChangedNotification___block_invoke_191(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kind");
}

- (id)characteristicsForMonitoredCharacteristics:(void *)a1
{
  if (a1)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_218_56046);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __91__HMDWidgetTimelineRefresher_relevantWidgetsForCharacteristics_outRelevantCharacteristics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  -[HMDWidgetTimelineRefresher characteristicsForMonitoredCharacteristics:](*(void **)(a1 + 32), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
    objc_msgSend(*(id *)(a1 + 56), "unionSet:", v6);
  }

}

void __91__HMDWidgetTimelineRefresher_relevantWidgetsForCharacteristics_outRelevantCharacteristics___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionSetsByHome:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "evaluateActionSetStateOnPrimaryEnabledForHome:", v11) & 1) == 0)
        {
          -[HMDWidgetTimelineRefresher characteristicsFromActionSets:](*(void **)(a1 + 32), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 40));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "count"))
          {

            goto LABEL_13;
          }
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
          objc_msgSend(*(id *)(a1 + 56), "unionSet:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

}

void __132__HMDWidgetTimelineRefresher_writeCharacteristicsWithWriteValueBySPIClientIdentifier_widgetKind_message_completionGroup_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __132__HMDWidgetTimelineRefresher_writeCharacteristicsWithWriteValueBySPIClientIdentifier_widgetKind_message_completionGroup_completion___block_invoke_2;
  v8[3] = &unk_24E799C60;
  v5 = a1[5];
  v6 = a1[4];
  v9 = v5;
  v10 = v6;
  v11 = a1[6];
  v12 = v3;
  v13 = a1[7];
  v14 = a1[8];
  v7 = v3;
  dispatch_async(v4, v8);

}

uint64_t __132__HMDWidgetTimelineRefresher_writeCharacteristicsWithWriteValueBySPIClientIdentifier_widgetKind_message_completionGroup_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE buf[18];
  __int16 v35;
  __int128 *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v6), "characteristic", (_QWORD)v28);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "spiClientIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_removePendingRequestValueForUUID:messageIdentifier:", v9, v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    }
    while (v4);
  }

  v11 = *(_QWORD *)(a1 + 56);
  v12 = (void *)MEMORY[0x227676638]();
  v13 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v33 = *(_OWORD *)buf;
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v35 = 2096;
      v36 = &v33;
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v23;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Failed to write characteristics: %@, with error: %@", buf, 0x30u);

    }
    objc_autoreleasePoolPop(v12);
    v24 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 64));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v24, v25, CFSTR("Characteristic Write Request Failed"), 1);

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v32 = *(_OWORD *)buf;
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v35 = 2096;
      v36 = &v32;
      v37 = 2112;
      v38 = v26;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Successfully wrote characteristics: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v12);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __91__HMDWidgetTimelineRefresher_reachabilityByAccessorySPIClientIdentifierForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

- (id)actionSetsFromSPIClientIdentifiers:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "homeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__HMDWidgetTimelineRefresher_actionSetsFromSPIClientIdentifiers___block_invoke;
    v8[3] = &unk_24E77D7C8;
    v9 = v3;
    objc_msgSend(v5, "na_flatMap:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

- (void)updateCachedIsOnStateForActionSets:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          objc_msgSend(a1, "cachedIsOnStateByActionSet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "actionSetIsOn:", v9));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v11, v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
  }

}

- (id)cachedIsOnStateBySPIClientIdentifierForActionSets:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE buf[18];
  __int16 v35;
  __int128 *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  __int128 *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v23 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v4;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v29;
      v24 = v5;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v29 != v26)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v7, "uuid");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_getPendingWriteValueForUUID:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "cachedIsOnStateByActionSet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = (void *)MEMORY[0x227676638]();
          v13 = a1;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v15 = (id)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            objc_msgSend(v7, "spiClientIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v7, "spiClientIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "getUUIDBytes:", buf);

            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
            }
            v33 = *(_OWORD *)buf;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            objc_msgSend(v7, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(v7, "uuid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "getUUIDBytes:", buf);

            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
            }
            v32 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544898;
            *(_QWORD *)&buf[4] = v15;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = 16;
            v35 = 2096;
            v36 = &v33;
            v37 = 1040;
            v38 = 16;
            v39 = 2096;
            v40 = &v32;
            v41 = 2112;
            v42 = v9;
            v43 = 2112;
            v44 = v11;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Action Set spiClientIdentifier: %{uuid_t}.16P, UUID: %{uuid_t}.16P, pendingState: %@, cachedState: %@", buf, 0x40u);

            v5 = v24;
          }

          objc_autoreleasePoolPop(v12);
          if (v9)
            v20 = v9;
          else
            v20 = v11;
          objc_msgSend(v7, "spiClientIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v21);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
      }
      while (v27);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)didExecuteFailBySPIClientIdentifierForActionSets:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v17 = v3;
  if (a1)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
          objc_msgSend(a1, "cachedActionSetExecuteErrorByUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v11, "spiClientIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_24E96AD18, v15);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __65__HMDWidgetTimelineRefresher_actionSetsFromSPIClientIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "actionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__HMDWidgetTimelineRefresher_actionSetsFromSPIClientIdentifiers___block_invoke_2;
  v6[3] = &unk_24E786FD0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __65__HMDWidgetTimelineRefresher_actionSetsFromSPIClientIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "spiClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __52__HMDWidgetTimelineRefresher_handlePerformRequests___block_invoke(_QWORD *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a1[4];
  v9 = a2;
  dispatch_group_leave(v3);
  v4 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v8 = v9;
  if (v7)
    v8 = v6;
  objc_storeStrong(v5, v8);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

}

uint64_t __52__HMDWidgetTimelineRefresher_handlePerformRequests___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE buf[18];
  __int16 v25;
  __int128 *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v23 = *(_OWORD *)buf;
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v25 = 2096;
      v26 = &v23;
      v27 = 2112;
      v28 = v14;
      v15 = "%{public}@[%{uuid_t}.16P] Failed with error: %@";
      v16 = v4;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 38;
LABEL_16:
      _os_log_impl(&dword_2218F0000, v16, v17, v15, buf, v18);
LABEL_17:

    }
  }
  else
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
        }
        v21 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        v25 = 2096;
        v26 = &v21;
        v15 = "%{public}@[%{uuid_t}.16P] Successfully completed requests";
        v16 = v4;
        v17 = OS_LOG_TYPE_INFO;
        v18 = 28;
        goto LABEL_16;
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v22 = *(_OWORD *)buf;
      objc_msgSend(*(id *)(a1 + 40), "messagePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v25 = 2096;
      v26 = &v22;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Did not execute any request from payload: %@", buf, 0x26u);

      goto LABEL_17;
    }
  }

  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:error:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (void)_clearCachedErrorForActionSet:(void *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "uuid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cachedActionSetExecuteErrorByUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v8);

  objc_msgSend(a1, "cachedActionSetExecuteErrorTimerContextByUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "cachedActionSetExecuteErrorTimerContextByUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v8);

    objc_msgSend(a1, "timerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelTimerForContext:", v5);

  }
}

void __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  _BYTE buf[18];
  __int16 v26;
  __int128 *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removePendingRequestValueForUUID:messageIdentifier:", v6, v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v24 = *(_OWORD *)buf;
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v26 = 2096;
      v27 = &v24;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v3;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Failed to turn off action set: %@, with error: %@", buf, 0x30u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDWidgetTimelineRefresher _setCachedError:forActionSet:](*(void **)(a1 + 32), v3, *(void **)(a1 + 40));
    v19 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v19, v20, CFSTR("Turn Off Action Set Execution Failed"), 1);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v23 = *(_OWORD *)buf;
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v26 = 2096;
      v27 = &v23;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Successfully turned off action set: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v8);
    v22 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_startActionSetPrimaryStateUpdateCoalesceTimerContextForActionSetUUID:expectedState:", v20, &unk_24E96AD30);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_2;
  v12[3] = &unk_24E79B3F0;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v6;
  v16 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

void __127__HMDWidgetTimelineRefresher_executeActionSetsToTurnOffWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD))(v1 + 16))(*(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_firstErrorFromCharacteristicWriteResponsePayload:", *(_QWORD *)(a1 + 48));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)_setCachedError:(void *)a3 forActionSet:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v5, "uuid");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cachedActionSetExecuteErrorByUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v11);

    objc_msgSend(a1, "timerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startTimerWithTimeInterval:andReplaceObject:", v5, 8.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "cachedActionSetExecuteErrorTimerContextByUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
}

void __118__HMDWidgetTimelineRefresher_executeActionSetsWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  __int128 v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __118__HMDWidgetTimelineRefresher_executeActionSetsWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_2;
  v6[3] = &unk_24E799C60;
  v7 = *((_OWORD *)a1 + 2);
  v8 = a1[6];
  v9 = v3;
  v10 = a1[7];
  v11 = a1[8];
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __118__HMDWidgetTimelineRefresher_executeActionSetsWithSPIClientIdentifiers_widgetKind_message_completionGroup_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  _BYTE buf[18];
  __int16 v26;
  __int128 *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removePendingRequestValueForUUID:messageIdentifier:", v3, v4);

  v5 = *(_QWORD *)(a1 + 56);
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v24 = *(_OWORD *)buf;
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v26 = 2096;
      v27 = &v24;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{uuid_t}.16P] Failed to execute action set: %@, with error: %@", buf, 0x30u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDWidgetTimelineRefresher _setCachedError:forActionSet:](*(void **)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 40));
    v18 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 64));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWidgetTimelineRefresher refreshTimelineForWidgetKinds:withReason:shouldCoalesce:](v18, v19, CFSTR("Action Set Execution Failed"), 1);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 48), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v23 = *(_OWORD *)buf;
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v26 = 2096;
      v27 = &v23;
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{uuid_t}.16P] Successfully executed action set: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v6);
    v21 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_startActionSetPrimaryStateUpdateCoalesceTimerContextForActionSetUUID:expectedState:", v19, &unk_24E96AD18);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

- (id)characteristicsFromSPIClientIdentifiers:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(a1, "homeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v57;
      v37 = v6;
      v32 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v57 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          objc_msgSend(v11, "accessories", v32);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          if (v43)
          {
            v13 = *(_QWORD *)v53;
            v33 = i;
            v34 = v8;
            do
            {
              for (j = 0; j != v43; ++j)
              {
                if (*(_QWORD *)v53 != v13)
                  objc_enumerationMutation(v12);
                v15 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v16 = v15;
                else
                  v16 = 0;
                v17 = v16;

                if (v17)
                {
                  v50 = 0u;
                  v51 = 0u;
                  v48 = 0u;
                  v49 = 0u;
                  objc_msgSend(v15, "services");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
                  if (v38)
                  {
                    v19 = *(_QWORD *)v49;
                    v41 = v17;
                    v42 = v12;
                    v35 = *(_QWORD *)v49;
                    v36 = v13;
                    v40 = v18;
                    do
                    {
                      v20 = 0;
                      do
                      {
                        if (*(_QWORD *)v49 != v19)
                          objc_enumerationMutation(v18);
                        v39 = v20;
                        v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v20);
                        v44 = 0u;
                        v45 = 0u;
                        v46 = 0u;
                        v47 = 0u;
                        objc_msgSend(v21, "characteristics");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
                        if (v23)
                        {
                          v24 = v23;
                          v25 = *(_QWORD *)v45;
                          while (2)
                          {
                            for (k = 0; k != v24; ++k)
                            {
                              if (*(_QWORD *)v45 != v25)
                                objc_enumerationMutation(v22);
                              v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
                              objc_msgSend(v27, "spiClientIdentifier");
                              v28 = (void *)objc_claimAutoreleasedReturnValue();
                              v29 = objc_msgSend(v3, "containsObject:", v28);

                              if (v29)
                              {
                                objc_msgSend(v4, "addObject:", v27);
                                v30 = objc_msgSend(v4, "count");
                                if (v30 == objc_msgSend(v3, "count"))
                                {

                                  v6 = v37;
                                  goto LABEL_39;
                                }
                              }
                            }
                            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
                            if (v24)
                              continue;
                            break;
                          }
                        }

                        v20 = v39 + 1;
                        v17 = v41;
                        v12 = v42;
                        v19 = v35;
                        v13 = v36;
                        v18 = v40;
                      }
                      while (v39 + 1 != v38);
                      v38 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
                    }
                    while (v38);
                  }

                }
              }
              v6 = v37;
              v9 = v32;
              i = v33;
              v8 = v34;
              v43 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
            }
            while (v43);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v8);
    }
LABEL_39:

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

_TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic *__68__HMDWidgetTimelineRefresher_handleMonitorCharacteristicsForWidget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic *v4;

  v3 = a2;
  v4 = -[HMDWidgetMonitoredCharacteristic initWithCharacteristic:reachabilityMonitored:]([_TtC13HomeKitDaemon32HMDWidgetMonitoredCharacteristic alloc], "initWithCharacteristic:reachabilityMonitored:", v3, objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));

  return v4;
}

void __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetKindsToUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isSubsetOfSet:", v3);

  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "widgetKindsToUpdate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    objc_msgSend(*(id *)(a1 + 40), "widgetKindsToUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setWidgetKindsToUpdate:", v7);

    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "widgetKindsToUpdate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_56204);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@More kinds to reload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if (!v5)
    {
      v16 = dispatch_time(0, objc_msgSend(*(id *)(a1 + 40), "forceUpdateTimelineDispatchDelayNs"));
      objc_msgSend(*(id *)(a1 + 40), "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke_148;
      block[3] = &unk_24E79C240;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_after(v16, v17, block);

    }
  }
}

void __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke_148(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  uint32_t v17;
  void *v18;
  uint64_t v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v1 = a1;
  v32 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "widgetKindsToUpdate");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v22;
    v19 = v1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE16A10]), "initWithExtensionBundleIdentifier:kind:", CFSTR("com.apple.Home.HomeWidget"), v6);
        objc_msgSend(v7, "reloadTimelineWithReason:", CFSTR("new data"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x227676638]();
        v10 = *(id *)(v1 + 32);
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v8)
        {
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            goto LABEL_12;
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v26 = v13;
          v27 = 2112;
          v28 = v6;
          v29 = 2112;
          v30 = v8;
          v14 = v12;
          v15 = OS_LOG_TYPE_ERROR;
          v16 = "%{public}@Failed reload of timeline for '%@': %@";
          v17 = 32;
        }
        else
        {
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            goto LABEL_12;
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v26 = v13;
          v27 = 2112;
          v28 = v6;
          v14 = v12;
          v15 = OS_LOG_TYPE_DEFAULT;
          v16 = "%{public}@Successfully reloaded timeline for '%@'";
          v17 = 22;
        }
        _os_log_impl(&dword_2218F0000, v14, v15, v16, buf, v17);

        v1 = v19;
LABEL_12:

        objc_autoreleasePoolPop(v9);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v3);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "setWidgetKindsToUpdate:", v18);

}

uint64_t __64__HMDWidgetTimelineRefresher_forceUpdateTimelineForWidgetKinds___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __72__HMDWidgetTimelineRefresher_processCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Processing characteristics changed notification", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "modifiedCharacteristicsFromNotification:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "activeWidgetKinds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalProcessChangedCharacteristics:activeWidgetKinds:", v6, v8);

}

void __60__HMDWidgetTimelineRefresher_registerForDarwinNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleHomeSensingChangedNotification");

}

void __60__HMDWidgetTimelineRefresher_registerForDarwinNotifications__block_invoke_139(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleSelectedHomeChangedNotification");

}

void __39__HMDWidgetTimelineRefresher_configure__block_invoke(uint64_t a1)
{
  -[HMDWidgetTimelineRefresher refreshTimelineForConfiguredWidgetsWithReason:](*(void **)(a1 + 32), CFSTR("homed launch"));
}

void __39__HMDWidgetTimelineRefresher_configure__block_invoke_2(uint64_t a1)
{
  void (**v1)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchAndStoreActiveWidgetKindsHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

  -[HMDWidgetTimelineRefresher updateMonitoredCharacteristicsAndRefreshWidgetTimelines](WeakRetained);
}

void __247__HMDWidgetTimelineRefresher_initWithHomeManager_queue_notificationCenter_darwinNotificationProvider_widgetConfigurationReader_timelineController_logEventSubmitter_timerManager_reachabilityUpdateDispatchDelayNs_forceUpdateTimelineDispatchDelayNs___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "forceUpdateTimelineForWidgetKinds:", v3);

}

void __247__HMDWidgetTimelineRefresher_initWithHomeManager_queue_notificationCenter_darwinNotificationProvider_widgetConfigurationReader_timelineController_logEventSubmitter_timerManager_reachabilityUpdateDispatchDelayNs_forceUpdateTimelineDispatchDelayNs___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchAndStoreActiveWidgetKinds");

}

+ (id)fetchSpecificationsForWidgetKinds:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "containsObject:", CFSTR("com.apple.Home.widget.summary.category")))
  {
    +[HMDWidgetFetchSpecification lightsFetchSpecifications](HMDWidgetFetchSpecification, "lightsFetchSpecifications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

    +[HMDWidgetFetchSpecification mainHomeSecurityFetchSpecifications](HMDWidgetFetchSpecification, "mainHomeSecurityFetchSpecifications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v6);

  }
  if (objc_msgSend(v3, "containsObject:", CFSTR("com.apple.Home.widget.lights.category")))
  {
    +[HMDWidgetFetchSpecification lightsFetchSpecifications](HMDWidgetFetchSpecification, "lightsFetchSpecifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v7);

  }
  if (objc_msgSend(v3, "containsObject:", CFSTR("com.apple.Home.widget.security.category")))
  {
    +[HMDWidgetFetchSpecification mainHomeSecurityFetchSpecifications](HMDWidgetFetchSpecification, "mainHomeSecurityFetchSpecifications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v8);

  }
  if (objc_msgSend(v3, "containsObject:", CFSTR("com.apple.Home.widget.security.singleAccessory")))
  {
    +[HMDWidgetFetchSpecification allOtherHomesSingleAccessorySecurityFetchSpecifications](HMDWidgetFetchSpecification, "allOtherHomesSingleAccessorySecurityFetchSpecifications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v9);

  }
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t141 != -1)
    dispatch_once(&logCategory__hmf_once_t141, &__block_literal_global_247);
  return (id)logCategory__hmf_once_v142;
}

void __41__HMDWidgetTimelineRefresher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v142;
  logCategory__hmf_once_v142 = v0;

}

@end
