@implementation HMDSymptomManager

- (void)updateNetworkMismatchInfoWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HMDSymptomManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8C4388);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1CDAB85A4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EFA45AC0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EFA45AC8;
  v12[5] = v11;
  v13 = self;
  sub_1CD0CC134((uint64_t)v7, (uint64_t)&unk_1EFA45AD0, (uint64_t)v12);
  swift_release();
}

- (id)obtainDiscoveryAssertion
{
  return (id)_sSo17HMDSymptomManagerC19HomeKitDaemonLegacyE24obtainDiscoveryAssertionyXlyF_0();
}

- (void)releaseDiscoveryAssertionWithAssertionHandle:(id)a3
{
  HMDSymptomManager *v5;

  swift_unknownObjectRetain();
  v5 = self;
  _sSo17HMDSymptomManagerC19HomeKitDaemonLegacyE25releaseDiscoveryAssertion15assertionHandleyyXlSg_tF_0((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (HMDSymptomManager)initWithDataSource:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  HMDSharingDeviceDiscovery *v9;
  HMDCompanionLinkClient *v10;
  void *v11;
  void *v12;
  HMDSymptomManager *v13;

  v4 = a3;
  HMDispatchQueueNameString();
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create(v6, v7);

  v9 = objc_alloc_init(HMDSharingDeviceDiscovery);
  v10 = objc_alloc_init(HMDCompanionLinkClient);
  objc_msgSend(MEMORY[0x1E0D286E8], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDSymptomManager initWithQueue:dataSource:supportsRegistering:supportsCurrentDeviceSymptoms:deviceDiscovery:companionLinkClient:wifiManager:notificationCenter:sharingClientFactory:](self, "initWithQueue:dataSource:supportsRegistering:supportsCurrentDeviceSymptoms:deviceDiscovery:companionLinkClient:wifiManager:notificationCenter:sharingClientFactory:", v8, v4, +[HMDDeviceCapabilities supportsSymptomsHandler](HMDDeviceCapabilities, "supportsSymptomsHandler"), 0, v9, v10, v11, v12, &__block_literal_global_108566);

  return v13;
}

- (HMDSymptomManager)initWithQueue:(id)a3 dataSource:(id)a4 supportsRegistering:(BOOL)a5 supportsCurrentDeviceSymptoms:(BOOL)a6 deviceDiscovery:(id)a7 companionLinkClient:(id)a8 wifiManager:(id)a9 notificationCenter:(id)a10 sharingClientFactory:(id)a11
{
  _BOOL4 v13;
  id v18;
  id v19;
  HMDSymptomManager *v20;
  HMDSymptomManager *v21;
  void *v22;
  id sharingClientFactory;
  uint64_t v24;
  NSMapTable *symptomContainerByRegisteredAccessory;
  uint64_t v26;
  NSMapTable *nearbySFDevices;
  uint64_t v28;
  NSMapTable *networkReachableRPCompanionLinkDevices;
  NSArray *nearbyAccessoryUUIDsNotOnCurrentNetwork;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v13 = a6;
  v36 = a3;
  v18 = a4;
  v35 = a7;
  v34 = a8;
  v33 = a9;
  v32 = a10;
  v19 = a11;
  v37.receiver = self;
  v37.super_class = (Class)HMDSymptomManager;
  v20 = -[HMDSymptomManager init](&v37, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workQueue, a3);
    objc_storeWeak((id *)&v21->_dataSource, v18);
    v22 = _Block_copy(v19);
    sharingClientFactory = v21->_sharingClientFactory;
    v21->_sharingClientFactory = v22;

    objc_storeStrong((id *)&v21->_deviceDiscovery, a7);
    objc_storeStrong((id *)&v21->_companionLinkClient, a8);
    objc_storeStrong((id *)&v21->_wifiManager, a9);
    objc_storeStrong((id *)&v21->_notificationCenter, a10);
    v21->_supportsRegisteringAccessories = a5;
    v21->_supportsCurrentDeviceSymptoms = v13;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v24 = objc_claimAutoreleasedReturnValue();
    symptomContainerByRegisteredAccessory = v21->_symptomContainerByRegisteredAccessory;
    v21->_symptomContainerByRegisteredAccessory = (NSMapTable *)v24;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v26 = objc_claimAutoreleasedReturnValue();
    nearbySFDevices = v21->_nearbySFDevices;
    v21->_nearbySFDevices = (NSMapTable *)v26;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v28 = objc_claimAutoreleasedReturnValue();
    networkReachableRPCompanionLinkDevices = v21->_networkReachableRPCompanionLinkDevices;
    v21->_networkReachableRPCompanionLinkDevices = (NSMapTable *)v28;

    v21->_deviceDiscoveryFlags = 0x10000;
    v21->_deviceProblemNotificationToken = -1;
    nearbyAccessoryUUIDsNotOnCurrentNetwork = v21->_nearbyAccessoryUUIDsNotOnCurrentNetwork;
    v21->_nearbyAccessoryUUIDsNotOnCurrentNetwork = (NSArray *)MEMORY[0x1E0C9AA60];

    -[NSNotificationCenter addObserver:selector:name:object:](v21->_notificationCenter, "addObserver:selector:name:object:", v21, sel_handleAccessoryRemovedNotification_, CFSTR("HMDHomeAccessoryRemovedNotification"), 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v21->_notificationCenter, "addObserver:selector:name:object:", v21, sel_handleAccessoryWiFiNetworkInfoUpdatedNotification_, CFSTR("HMDAppleMediaAccessoryWiFiNetworkInfoUpdatedNotification"), 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v21->_notificationCenter, "addObserver:selector:name:object:", v21, sel_handleCurrentNetworkDidChangeNotification_, *MEMORY[0x1E0D28538], 0);
  }
  if (v13)
    -[HMDSymptomManager _registerForCurrentDeviceSymptoms](v21, "_registerForCurrentDeviceSymptoms");

  return v21;
}

- (void)dealloc
{
  int deviceProblemNotificationToken;
  void *v4;
  void *v5;
  objc_super v6;

  deviceProblemNotificationToken = self->_deviceProblemNotificationToken;
  if (deviceProblemNotificationToken != -1)
    notify_cancel(deviceProblemNotificationToken);
  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[HMDSymptomManager companionLinkClient](self, "companionLinkClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stop");

  v6.receiver = self;
  v6.super_class = (Class)HMDSymptomManager;
  -[HMDSymptomManager dealloc](&v6, sel_dealloc);
}

- (void)registerAccessory:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HMDSymptomManager_registerAccessory_delegate___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)deregisterAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__HMDSymptomManager_deregisterAccessory___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)startDiscoveringSymptomsRequiringNearbyInfo
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSymptomManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HMDSymptomManager_startDiscoveringSymptomsRequiringNearbyInfo__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscoveringSymptomsRequiringNearbyInfo
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSymptomManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HMDSymptomManager_stopDiscoveringSymptomsRequiringNearbyInfo__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)initiateFixForAccessory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HMDSymptomManager_initiateFixForAccessory_completion___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)setDeviceDiscoveryFlags:(unint64_t)a3
{
  NSObject *v5;
  NSMapTable *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_deviceDiscoveryFlags != a3)
  {
    self->_deviceDiscoveryFlags = a3;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[HMDSymptomManager nearbySFDevices](self, "nearbySFDevices", 0);
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    NSAllMapTableValues(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          -[HMDSymptomManager _sfDeviceLostHandler:](self, "_sfDeviceLostHandler:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[HMDSymptomManager symptomContainerByRegisteredAccessory](self, "symptomContainerByRegisteredAccessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[HMDSymptomManager _stopDeviceDiscovery](self, "_stopDeviceDiscovery");
      -[HMDSymptomManager _startDeviceDiscovery](self, "_startDeviceDiscovery");
    }
  }
}

- (unint64_t)currentDeviceProblemFlags
{
  os_unfair_lock_s *p_lock;
  unint64_t currentDeviceProblemFlags;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  currentDeviceProblemFlags = self->_currentDeviceProblemFlags;
  os_unfair_lock_unlock(p_lock);
  return currentDeviceProblemFlags;
}

- (void)setCurrentDeviceProblemFlags:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_currentDeviceProblemFlags = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_start
{
  NSObject *v3;

  -[HMDSymptomManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDSymptomManager _startDeviceDiscovery](self, "_startDeviceDiscovery");
  -[HMDSymptomManager _startCompanionLinkClient](self, "_startCompanionLinkClient");
}

- (void)_startDeviceDiscovery
{
  NSObject *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDSymptomManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDSymptomManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDSymptomManager workQueue](self, "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDispatchQueue:", v4);

  v6 = -[HMDSymptomManager deviceDiscoveryFlags](self, "deviceDiscoveryFlags");
  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDiscoveryFlags:", v6);

  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __42__HMDSymptomManager__startDeviceDiscovery__block_invoke;
  v21[3] = &unk_1E89B3348;
  objc_copyWeak(&v22, &location);
  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeviceFoundHandler:", v21);

  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __42__HMDSymptomManager__startDeviceDiscovery__block_invoke_2;
  v19[3] = &unk_1E89B3370;
  objc_copyWeak(&v20, &location);
  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDeviceChangedHandler:", v19);

  objc_copyWeak(&v18, &location);
  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery", v8, 3221225472, __42__HMDSymptomManager__startDeviceDiscovery__block_invoke_3, &unk_1E89B3348);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDeviceLostHandler:", &v17);

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v15;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Starting SFDeviceDiscovery in HMDSymptomManager", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDSymptomManager deviceDiscovery](v13, "deviceDiscovery");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "start");

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_startCompanionLinkClient
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDSymptomManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMDSymptomManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDSymptomManager workQueue](self, "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSymptomManager companionLinkClient](self, "companionLinkClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDispatchQueue:", v4);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__HMDSymptomManager__startCompanionLinkClient__block_invoke;
  v19[3] = &unk_1E89BA028;
  objc_copyWeak(&v20, &location);
  -[HMDSymptomManager companionLinkClient](self, "companionLinkClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeviceFoundHandler:", v19);

  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __46__HMDSymptomManager__startCompanionLinkClient__block_invoke_90;
  v17[3] = &unk_1E89BA050;
  objc_copyWeak(&v18, &location);
  -[HMDSymptomManager companionLinkClient](self, "companionLinkClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceChangedHandler:", v17);

  objc_copyWeak(&v16, &location);
  -[HMDSymptomManager companionLinkClient](self, "companionLinkClient", v6, 3221225472, __46__HMDSymptomManager__startCompanionLinkClient__block_invoke_92, &unk_1E89BA028);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeviceLostHandler:", &v15);

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting RPCompanionLinkClient in HMDSymptomManager", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDSymptomManager companionLinkClient](v11, "companionLinkClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "start");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_stop
{
  NSObject *v3;
  void *v4;
  HMDSymptomManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HMDSymptomManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping SFDeviceDiscovery and RPCompanionLinkClient in HMDSymptomManager.", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDSymptomManager _stopDeviceDiscovery](v5, "_stopDeviceDiscovery");
  -[HMDSymptomManager _stopCompanionLinkClient](v5, "_stopCompanionLinkClient");
  -[HMDSymptomManager nearbySFDevices](v5, "nearbySFDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[HMDSymptomManager networkReachableRPCompanionLinkDevices](v5, "networkReachableRPCompanionLinkDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (void)_stopDeviceDiscovery
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDSymptomManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceFoundHandler:", 0);

  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceChangedHandler:", 0);

  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceLostHandler:", 0);

  -[HMDSymptomManager deviceDiscovery](self, "deviceDiscovery");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stop");

}

- (void)_stopCompanionLinkClient
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDSymptomManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDSymptomManager companionLinkClient](self, "companionLinkClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceFoundHandler:", 0);

  -[HMDSymptomManager companionLinkClient](self, "companionLinkClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceChangedHandler:", 0);

  -[HMDSymptomManager companionLinkClient](self, "companionLinkClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceLostHandler:", 0);

  -[HMDSymptomManager companionLinkClient](self, "companionLinkClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stop");

}

- (void)_registerForCurrentDeviceSymptoms
{
  void (**v3)(void);
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  HMDSymptomManager *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDSymptomManager sharingClientFactory](self, "sharingClientFactory");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_opt_respondsToSelector();
  v6 = MEMORY[0x1E0C809B0];
  if ((v5 & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke;
    v13[3] = &unk_1E89C0E48;
    v13[4] = self;
    objc_msgSend(v4, "getProblemFlagsWithCompletionHandler:", v13);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Device doesn't support retrieving problem flags.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

  -[HMDSymptomManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke_97;
  v12[3] = &unk_1E89BE1B0;
  v12[4] = self;
  notify_register_dispatch("com.apple.sharing.problems", &self->_deviceProblemNotificationToken, v11, v12);

}

- (id)_symptomsForRegisteredAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDSymptomManager symptomContainerByRegisteredAccessory](self, "symptomContainerByRegisteredAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "symptoms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (void)_initiateFixForAccessory:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMDSymptomManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDSymptomManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDSymptomManager *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "idsIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDSymptomManager nearbySFDevices](self, "nearbySFDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HMDSymptomManager _symptomsForRegisteredAccessory:](self, "_symptomsForRegisteredAccessory:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 11);
      v16 = objc_msgSend(v14, "containsObject:", v15);

      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v20;
        v32 = 2112;
        v33 = v13;
        v34 = 1024;
        v35 = v16;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Asking SFClient to repair device %@ with flags %d", (uint8_t *)&v30, 0x1Cu);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDSymptomManager deviceDiscovery](v18, "deviceDiscovery");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "repairDevice:flags:completion:", v13, v16, v7);

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
        v30 = 138543618;
        v31 = v29;
        v32 = 2112;
        v33 = v6;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Sharing has not discovered SFDevice for %@, not initiating fix process.", (uint8_t *)&v30, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v14);
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
      v30 = 138543618;
      v31 = v25;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@The accessory (%@) does not have idsIdentifier, not initiating fix process.", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13);
  }

}

- (id)_registeredAccessoryWithIDSIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDSymptomManager symptomContainerByRegisteredAccessory](self, "symptomContainerByRegisteredAccessory", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[HMDSymptomManager symptomContainerByRegisteredAccessory](self, "symptomContainerByRegisteredAccessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "idsIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if ((v15 & 1) != 0)
        {
          v16 = v11;

          goto LABEL_11;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (void)_updateSymptomsForRegisteredAccessoryWithIDSIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDSymptomManager *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDSymptomManager _registeredAccessoryWithIDSIdentifier:](self, "_registeredAccessoryWithIDSIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDSymptomManager _updateSymptomsForRegisteredAccessory:](self, "_updateSymptomsForRegisteredAccessory:", v6);
    -[HMDSymptomManager nearbyAccessoryUUIDsNotOnCurrentNetwork](self, "nearbyAccessoryUUIDsNotOnCurrentNetwork");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Peforming network mismatch fetch as accessory is in list", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDSymptomManager updateNetworkMismatchInfoWithCompletionHandler:](v11, "updateNetworkMismatchInfoWithCompletionHandler:", &__block_literal_global_103);
    }
  }

}

- (void)_updateSymptomsForRegisteredAccessory:(id)a3
{
  void *v3;
  id v5;
  NSObject *v6;
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
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDSymptomManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  HMDSymptomManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDSymptomManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  HMDSymptomManager *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  HMDSymptomManager *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  HMDSymptomManager *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  HMDSymptomManager *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDSymptomManager symptomContainerByRegisteredAccessory](self, "symptomContainerByRegisteredAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_22;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSymptomManager nearbySFDevices](self, "nearbySFDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hasProblem"))
  {
    objc_msgSend((id)objc_opt_class(), "_symptomsForProblemFlags:", objc_msgSend(v12, "problemFlags"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionSet:", v13);

  }
  if (!v12)
    goto LABEL_8;
  -[HMDSymptomManager networkReachableRPCompanionLinkDevices](self, "networkReachableRPCompanionLinkDevices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idsIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

LABEL_7:
    goto LABEL_8;
  }
  -[HMDSymptomManager wifiManager](self, "wifiManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "currentNetworkSSID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSymptomManager wifiManager](v41, "wifiManager");
      v74 = v40;
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "currentNetworkSSID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v78 = v3;
      v79 = 2112;
      v80 = v39;
      v81 = 2112;
      v82 = v43;
      _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@ is not reachable over local network: %@", buf, 0x20u);

      v40 = v74;
    }

    objc_autoreleasePoolPop(v40);
    objc_msgSend(v5, "wifiNetworkInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "SSID");
    v70 = v41;
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75)
    {
      objc_msgSend(v5, "wifiNetworkInfo");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "SSID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSymptomManager wifiManager](v41, "wifiManager");
      v42 = objc_claimAutoreleasedReturnValue();
      -[NSObject currentNetworkSSID](v42, "currentNetworkSSID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqualToString:", v39))
      {

LABEL_38:
        v52 = (void *)MEMORY[0x1D17BA0A0]();
        v53 = v70;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDSymptomManager wifiManager](v53, "wifiManager");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "currentNetworkSSID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "uuid");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "wifiNetworkInfo");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "SSID");
          v71 = v52;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v78 = v76;
          v79 = 2112;
          v80 = v55;
          v81 = 2112;
          v82 = v56;
          v83 = 2112;
          v84 = v57;
          _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_INFO, "%{public}@Mismatched WiFi SSID, current: %@ accessory(%@): %@", buf, 0x2Au);

          v52 = v71;
        }

        objc_autoreleasePoolPop(v52);
        v58 = (void *)MEMORY[0x1D17BA0A0]();
        v59 = v53;
        HMFGetOSLogHandle();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "idsIdentifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v78 = v61;
          v79 = 2112;
          v80 = v62;
          _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_INFO, "%{public}@Creating WiFi network mismatch symptom for nearby IDS identifier that is not network reachable: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v58);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 11);
        objc_msgSend(v9, "addObject:", v14);
        goto LABEL_7;
      }
      v67 = v44;
    }
    else
    {
      v67 = v44;
    }
    -[HMDSymptomManager nearbyAccessoryUUIDsNotOnCurrentNetwork](v41, "nearbyAccessoryUUIDsNotOnCurrentNetwork");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v45, "containsObject:", v46);

    if (v75)
    {

    }
    if ((v64 & 1) == 0)
    {
      objc_msgSend(v5, "wifiNetworkInfo");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v47)
      {
        v48 = (void *)MEMORY[0x1D17BA0A0]();
        v49 = v70;
        HMFGetOSLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v78 = v51;
          v79 = 2112;
          v80 = v5;
          _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ WiFi info is nil", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v48);
      }
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_8:
  -[HMDSymptomManager wifiManager](self, "wifiManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isCaptive") || !objc_msgSend(v12, "hasProblem"))
    goto LABEL_16;
  v18 = objc_msgSend(v12, "problemFlags");

  if ((v18 & 0x10) == 0)
    goto LABEL_17;
  -[HMDSymptomManager wifiManager](self, "wifiManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentNetworkSSID");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
LABEL_16:

    goto LABEL_17;
  }
  v20 = (void *)v19;
  objc_msgSend(v5, "wifiNetworkInfo");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "SSID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSymptomManager wifiManager](self, "wifiManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentNetworkSSID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v21, "isEqualToString:", v23);

  if (v69)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wifiNetworkInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "SSID");
      v73 = v24;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v78 = v27;
      v79 = 2112;
      v80 = v29;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Creating captive lease renewal symptom, WiFi SSID: %@", buf, 0x16u);

      v24 = v73;
    }

    objc_autoreleasePoolPop(v24);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 19);
    objc_msgSend(v9, "addObject:", v17);
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(v8, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "symptoms");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToSet:", v9);

  if ((v32 & 1) == 0)
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "idsIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v78 = v36;
      v79 = 2112;
      v80 = v37;
      v81 = 2112;
      v82 = v9;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Updating symptoms for accessory with IDS identifier %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(v8, "setSymptoms:", v9);
    objc_msgSend(v30, "symptomManager:didChangeSymptoms:", v34, v9);
  }

LABEL_22:
}

- (void)_updateSymptomsForAllRegisteredAccessories
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDSymptomManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDSymptomManager symptomContainerByRegisteredAccessory](self, "symptomContainerByRegisteredAccessory", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HMDSymptomManager _updateSymptomsForRegisteredAccessory:](self, "_updateSymptomsForRegisteredAccessory:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_isNearbyDiscoveryActive
{
  return -[HMDSymptomManager deviceDiscoveryFlags](self, "deviceDiscoveryFlags") & 1;
}

- (void)_sfDeviceFoundHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDSymptomManager *v7;
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
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v9;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Found new SFDevice: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDSymptomManager nearbySFDevices](v7, "nearbySFDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v4, v11);

  objc_msgSend(v4, "idsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSymptomManager _registeredAccessoryWithIDSIdentifier:](v7, "_registeredAccessoryWithIDSIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDSymptomManager _updateSymptomsForRegisteredAccessory:](v7, "_updateSymptomsForRegisteredAccessory:", v13);
    -[HMDSymptomManager symptomContainerByRegisteredAccessory](v7, "symptomContainerByRegisteredAccessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "symptomManager:didChangeSFDeviceIdentifier:", v7, v17);

  }
}

- (void)_sfDeviceChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDSymptomManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDSymptomManager *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDSymptomManager nearbySFDevices](self, "nearbySFDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDSymptomManager nearbySFDevices](self, "nearbySFDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v4, v10);

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v14;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@SFDevice %@ changed", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v4, "idsIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSymptomManager _updateSymptomsForRegisteredAccessoryWithIDSIdentifier:](v12, "_updateSymptomsForRegisteredAccessoryWithIDSIdentifier:", v15);

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v19;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Did not find SFDevice %@ in the nearby SFDevices, so treating it as a found device", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDSymptomManager _sfDeviceFoundHandler:](v17, "_sfDeviceFoundHandler:", v4);
  }

}

- (void)_sfDeviceLostHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDSymptomManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Lost SFDevice: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDSymptomManager nearbySFDevices](v7, "nearbySFDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v11);

  objc_msgSend(v4, "idsIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSymptomManager _registeredAccessoryWithIDSIdentifier:](v7, "_registeredAccessoryWithIDSIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDSymptomManager _updateSymptomsForRegisteredAccessory:](v7, "_updateSymptomsForRegisteredAccessory:", v13);
    -[HMDSymptomManager symptomContainerByRegisteredAccessory](v7, "symptomContainerByRegisteredAccessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "symptomManager:didChangeSFDeviceIdentifier:", v7, 0);

  }
}

- (void)_rpDeviceFoundHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDSymptomManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Found new RPCompanionLinkDevice: %@)", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDSymptomManager networkReachableRPCompanionLinkDevices](v7, "networkReachableRPCompanionLinkDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsDeviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v4, v11);

  objc_msgSend(v4, "idsDeviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSymptomManager _updateSymptomsForRegisteredAccessoryWithIDSIdentifier:](v7, "_updateSymptomsForRegisteredAccessoryWithIDSIdentifier:", v12);

}

- (void)_rpDeviceChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDSymptomManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDSymptomManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDSymptomManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v9;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@RPCompanionLinkDevice %@ changed", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDSymptomManager networkReachableRPCompanionLinkDevices](v7, "networkReachableRPCompanionLinkDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsDeviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDSymptomManager networkReachableRPCompanionLinkDevices](v7, "networkReachableRPCompanionLinkDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsDeviceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v4, v14);

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v18;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@RPCompanionLinkDevice %@ changed", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v4, "idsDeviceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSymptomManager _updateSymptomsForRegisteredAccessoryWithIDSIdentifier:](v16, "_updateSymptomsForRegisteredAccessoryWithIDSIdentifier:", v19);

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSymptomManager networkReachableRPCompanionLinkDevices](v21, "networkReachableRPCompanionLinkDevices");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v23;
      v27 = 2112;
      v28 = v4;
      v29 = 2112;
      v30 = v24;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Did not find RPCompanionLinkDevice %@ in the network reachable RPCompanionLinkDevices: %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDSymptomManager _rpDeviceFoundHandler:](v21, "_rpDeviceFoundHandler:", v4);
  }

}

- (void)_rpDeviceLostHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDSymptomManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSymptomManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Lost RPCompanionLinkDevice: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDSymptomManager networkReachableRPCompanionLinkDevices](v7, "networkReachableRPCompanionLinkDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsDeviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v11);

  objc_msgSend(v4, "idsDeviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSymptomManager _updateSymptomsForRegisteredAccessoryWithIDSIdentifier:](v7, "_updateSymptomsForRegisteredAccessoryWithIDSIdentifier:", v12);

}

- (void)handleAccessoryRemovedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDAccessoryNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    -[HMDSymptomManager deregisterAccessory:](self, "deregisterAccessory:", v7);

}

- (void)handleAccessoryWiFiNetworkInfoUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDSymptomManager *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
    -[HMDSymptomManager workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__HMDSymptomManager_handleAccessoryWiFiNetworkInfoUpdatedNotification___block_invoke;
    v13[3] = &unk_1E89C2328;
    v13[4] = self;
    v14 = v7;
    dispatch_async(v8, v13);

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain accessory from WiFi network info change notification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)handleCurrentNetworkDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDSymptomManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HMDSymptomManager_handleCurrentNetworkDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (HMDSharingDeviceDiscovery)deviceDiscovery
{
  return self->_deviceDiscovery;
}

- (HMDCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (HMFWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)supportsCurrentDeviceSymptoms
{
  return self->_supportsCurrentDeviceSymptoms;
}

- (NSMapTable)symptomContainerByRegisteredAccessory
{
  return self->_symptomContainerByRegisteredAccessory;
}

- (NSMapTable)nearbySFDevices
{
  return self->_nearbySFDevices;
}

- (NSMapTable)networkReachableRPCompanionLinkDevices
{
  return self->_networkReachableRPCompanionLinkDevices;
}

- (unint64_t)deviceDiscoveryFlags
{
  return self->_deviceDiscoveryFlags;
}

- (id)sharingClientFactory
{
  return objc_getProperty(self, a2, 96, 1);
}

- (id)discoveryAssertion
{
  return self->_discoveryAssertion;
}

- (void)setDiscoveryAssertion:(id)a3
{
  objc_storeStrong(&self->_discoveryAssertion, a3);
}

- (BOOL)supportsRegisteringAccessories
{
  return self->_supportsRegisteringAccessories;
}

- (void)setSupportsRegisteringAccessories:(BOOL)a3
{
  self->_supportsRegisteringAccessories = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDSymptomManagerDataSource)dataSource
{
  return (HMDSymptomManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSArray)nearbyAccessoryUUIDsNotOnCurrentNetwork
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNearbyAccessoryUUIDsNotOnCurrentNetwork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyAccessoryUUIDsNotOnCurrentNetwork, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_discoveryAssertion, 0);
  objc_storeStrong(&self->_sharingClientFactory, 0);
  objc_storeStrong((id *)&self->_networkReachableRPCompanionLinkDevices, 0);
  objc_storeStrong((id *)&self->_nearbySFDevices, 0);
  objc_storeStrong((id *)&self->_symptomContainerByRegisteredAccessory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
}

uint64_t __63__HMDSymptomManager_handleCurrentNetworkDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSymptomsForAllRegisteredAccessories");
}

uint64_t __71__HMDSymptomManager_handleAccessoryWiFiNetworkInfoUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSymptomsForRegisteredAccessory:", *(_QWORD *)(a1 + 40));
}

void __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2048;
    v13 = a2;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Setting current device problem flags on start %llu, error: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentDeviceProblemFlags:", a2);

}

void __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke_97(uint64_t a1)
{
  void (**v2)(void);
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sharingClientFactory");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Current device problem flags changed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke_98;
    v12[3] = &unk_1E89C0E48;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "getProblemFlagsWithCompletionHandler:", v12);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Device doesn't support retrieving problem flags.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke_98(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2048;
    v13 = a2;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Setting current device problem flags to %llu, error: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentDeviceProblemFlags:", a2);

}

void __46__HMDSymptomManager__startCompanionLinkClient__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = WeakRetained;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Found RPCompanionLinkDevice: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v3, "idsDeviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v7, "_rpDeviceFoundHandler:", v3);

}

void __46__HMDSymptomManager__startCompanionLinkClient__block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = WeakRetained;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@RPCompanionLinkDevice %@ changed", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v3, "idsDeviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v7, "_rpDeviceChangedHandler:", v3);

}

void __46__HMDSymptomManager__startCompanionLinkClient__block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = WeakRetained;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Lost RPCompanionLinkDevice: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v3, "idsDeviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v7, "_rpDeviceLostHandler:", v3);

}

void __42__HMDSymptomManager__startDeviceDiscovery__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(v6, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(WeakRetained, "_sfDeviceFoundHandler:", v6);

}

void __42__HMDSymptomManager__startDeviceDiscovery__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(v6, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(WeakRetained, "_sfDeviceChangedHandler:", v6);

}

void __42__HMDSymptomManager__startDeviceDiscovery__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(v6, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(WeakRetained, "_sfDeviceLostHandler:", v6);

}

uint64_t __56__HMDSymptomManager_initiateFixForAccessory_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initiateFixForAccessory:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63__HMDSymptomManager_stopDiscoveringSymptomsRequiringNearbyInfo__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery for symptoms requiring nearby info", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setDeviceDiscoveryFlags:", 0x10000);
  objc_msgSend(*(id *)(a1 + 32), "setNearbyAccessoryUUIDsNotOnCurrentNetwork:", MEMORY[0x1E0C9AA60]);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "discoveryAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "releaseDiscoveryAssertionWithAssertionHandle:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "setDiscoveryAssertion:", 0);
}

uint64_t __64__HMDSymptomManager_startDiscoveringSymptomsRequiringNearbyInfo__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for symptoms requiring nearby info", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setDeviceDiscoveryFlags:", 65537);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "discoveryAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "releaseDiscoveryAssertionWithAssertionHandle:", v7);

  objc_msgSend(*(id *)(a1 + 32), "obtainDiscoveryAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDiscoveryAssertion:", v8);

  v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__HMDSymptomManager_startDiscoveringSymptomsRequiringNearbyInfo__block_invoke_86;
  v11[3] = &unk_1E89C2730;
  v11[4] = v9;
  return objc_msgSend(v9, "updateNetworkMismatchInfoWithCompletionHandler:", v11);
}

void __64__HMDSymptomManager_startDiscoveringSymptomsRequiringNearbyInfo__block_invoke_86(uint64_t a1)
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
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nearbyAccessoryUUIDsNotOnCurrentNetwork");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Updated network mismatch accessories to %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

void __41__HMDSymptomManager_deregisterAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "symptomContainerByRegisteredAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Deregistering accessory: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "symptomContainerByRegisteredAccessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "symptomContainerByRegisteredAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
      objc_msgSend(*(id *)(a1 + 32), "_stop");
  }
}

void __48__HMDSymptomManager_registerAccessory_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  HMDSymptomContainer *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsRegisteringAccessories") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "idsIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "symptomContainerByRegisteredAccessory");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (!v5)
      {
        if (v9)
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(a1 + 40);
          v32 = 138543874;
          v33 = v20;
          v34 = 2112;
          v35 = v21;
          v36 = 2112;
          v37 = v3;
          _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering accessory (%@) for idsIdentifier %@", (uint8_t *)&v32, 0x20u);

        }
        objc_autoreleasePoolPop(v6);
        v22 = -[HMDSymptomContainer initWithIDSIdentifier:]([HMDSymptomContainer alloc], "initWithIDSIdentifier:", v3);
        -[HMDSymptomContainer setDelegate:](v22, "setDelegate:", *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 32), "symptomContainerByRegisteredAccessory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v22, *(_QWORD *)(a1 + 40));

        objc_msgSend(*(id *)(a1 + 32), "symptomContainerByRegisteredAccessory");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        v26 = *(void **)(a1 + 32);
        if (v25 == 1)
        {
          objc_msgSend(v26, "_start");
        }
        else
        {
          objc_msgSend(v26, "_updateSymptomsForRegisteredAccessory:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 32), "nearbySFDevices");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            v29 = *(void **)(a1 + 48);
            v30 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v28, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "symptomManager:didChangeSFDeviceIdentifier:", v30, v31);

          }
        }

        goto LABEL_21;
      }
      if (v9)
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        v32 = 138543618;
        v33 = v10;
        v34 = 2112;
        v35 = v11;
        v12 = "%{public}@The accessory (%@) is already registered.";
        v13 = v8;
        v14 = OS_LOG_TYPE_INFO;
LABEL_11:
        _os_log_impl(&dword_1CD062000, v13, v14, v12, (uint8_t *)&v32, 0x16u);

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
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 40);
        v32 = 138543618;
        v33 = v10;
        v34 = 2112;
        v35 = v19;
        v12 = "%{public}@The accessory (%@) does not have idsIdentifier, not registering for the discovery.";
        v13 = v8;
        v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_11;
      }
    }

    objc_autoreleasePoolPop(v6);
LABEL_21:

    return;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v18;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@This device doesn't support registering accessories", (uint8_t *)&v32, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
}

id __40__HMDSymptomManager_initWithDataSource___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0D973E8]);
}

+ (id)_symptomsForProblemFlags:(unint64_t)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
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
  int v31;
  void *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](a1, a2);
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543618;
    v32 = v8;
    v33 = 2048;
    v34 = a3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Parsing problem flags %llu to HMSymptoms", (uint8_t *)&v31, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 2) != 0)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 1);
    objc_msgSend(v9, "addObject:", v15);

    if ((a3 & 4) == 0)
    {
LABEL_5:
      if ((a3 & 8) == 0)
        goto LABEL_6;
      goto LABEL_27;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_5;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 2);
  objc_msgSend(v9, "addObject:", v16);

  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 3);
  objc_msgSend(v9, "addObject:", v17);

  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 4);
  objc_msgSend(v9, "addObject:", v18);

  if ((a3 & 0x40) == 0)
  {
LABEL_8:
    if ((a3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 5);
  objc_msgSend(v9, "addObject:", v19);

  if ((a3 & 0x80) == 0)
  {
LABEL_9:
    if ((a3 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 6);
  objc_msgSend(v9, "addObject:", v20);

  if ((a3 & 0x100) == 0)
  {
LABEL_10:
    if ((a3 & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 7);
  objc_msgSend(v9, "addObject:", v21);

  if ((a3 & 0x2000) == 0)
  {
LABEL_11:
    if ((a3 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 8);
  objc_msgSend(v9, "addObject:", v22);

  if ((a3 & 0x1000) == 0)
  {
LABEL_12:
    if ((a3 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 9);
  objc_msgSend(v9, "addObject:", v23);

  if ((a3 & 0x4000) == 0)
  {
LABEL_13:
    if ((a3 & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 10);
  objc_msgSend(v9, "addObject:", v24);

  if ((a3 & 0x8000) == 0)
  {
LABEL_14:
    if ((a3 & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 13);
  objc_msgSend(v9, "addObject:", v25);

  if ((a3 & 0x10000) == 0)
  {
LABEL_15:
    if ((a3 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 14);
  objc_msgSend(v9, "addObject:", v26);

  if ((a3 & 0x40000) == 0)
  {
LABEL_16:
    if ((a3 & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 16);
  objc_msgSend(v9, "addObject:", v27);

  if ((a3 & 0x100000) == 0)
  {
LABEL_17:
    if ((a3 & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 17);
  objc_msgSend(v9, "addObject:", v28);

  if ((a3 & 0x80000) == 0)
  {
LABEL_18:
    if ((a3 & 0x20000) == 0)
      goto LABEL_19;
LABEL_40:
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 20);
    objc_msgSend(v9, "addObject:", v30);

    if ((a3 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_39:
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 18);
  objc_msgSend(v9, "addObject:", v29);

  if ((a3 & 0x20000) != 0)
    goto LABEL_40;
LABEL_19:
  if ((a3 & 0x400000) != 0)
  {
LABEL_20:
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 21);
    objc_msgSend(v9, "addObject:", v10);

  }
LABEL_21:
  v11 = objc_msgSend(v9, "count");
  if ((a3 & 0x20) != 0 && v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 1000);
    objc_msgSend(v9, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v9, "copy");

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t44 != -1)
    dispatch_once(&logCategory__hmf_once_t44, &__block_literal_global_106_108572);
  return (id)logCategory__hmf_once_v45;
}

void __32__HMDSymptomManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v45;
  logCategory__hmf_once_v45 = v0;

}

@end
