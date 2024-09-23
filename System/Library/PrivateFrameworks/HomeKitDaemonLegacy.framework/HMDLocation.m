@implementation HMDLocation

- (HMDLocation)init
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *handlerQueue;
  id v6;
  void *v7;
  void *v8;
  HMDLocation *v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.homed.location", v3);
  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = v4;

  v6 = objc_alloc(MEMORY[0x1E0C9E3C8]);
  objc_msgSend((id)objc_opt_class(), "bundleForLocationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEffectiveBundle:delegate:onQueue:", v7, self, self->_handlerQueue);

  v9 = -[HMDLocation initWithLocationManager:handlerQueue:](self, "initWithLocationManager:handlerQueue:", v8, self->_handlerQueue);
  return v9;
}

- (HMDLocation)initWithLocationManager:(id)a3 handlerQueue:(id)a4
{
  id v7;
  id v8;
  HMDLocation *v9;
  HMDLocation *v10;
  uint64_t v11;
  NSHashTable *singleLocationDelegates;
  uint64_t v13;
  NSMapTable *regionStateDelegatesByRegionIdentifier;
  uint64_t v15;
  NSMapTable *pendingRegionMonitoringRequests;
  uint64_t v17;
  NSMapTable *pendingRegionCallbacks;
  uint64_t v19;
  NSMapTable *regionStates;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HMDLocation;
  v9 = -[HMDLocation init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_beingConfigured = 1;
    objc_storeStrong((id *)&v9->_handlerQueue, a4);
    objc_storeStrong((id *)&v10->_locationManager, a3);
    -[HMDCLLocationManager setDelegate:](v10->_locationManager, "setDelegate:", v10);
    -[HMDCLLocationManager setDesiredAccuracy:](v10->_locationManager, "setDesiredAccuracy:", *MEMORY[0x1E0C9E498]);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    singleLocationDelegates = v10->_singleLocationDelegates;
    v10->_singleLocationDelegates = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    regionStateDelegatesByRegionIdentifier = v10->_regionStateDelegatesByRegionIdentifier;
    v10->_regionStateDelegatesByRegionIdentifier = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    pendingRegionMonitoringRequests = v10->_pendingRegionMonitoringRequests;
    v10->_pendingRegionMonitoringRequests = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    pendingRegionCallbacks = v10->_pendingRegionCallbacks;
    v10->_pendingRegionCallbacks = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    regionStates = v10->_regionStates;
    v10->_regionStates = (NSMapTable *)v19;

    -[HMDCLLocationManager requestWhenInUseAuthorization](v10->_locationManager, "requestWhenInUseAuthorization");
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDLocation locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopUpdatingLocation");

  v4.receiver = self;
  v4.super_class = (Class)HMDLocation;
  -[HMDLocation dealloc](&v4, sel_dealloc);
}

- (BOOL)isCurrentLocationSimulated
{
  void *v2;
  char v3;

  -[HMDLocation getCurrentLocation](self, "getCurrentLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSimulated");

  return v3;
}

- (void)startUpdatingLocation
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDLocation handlerQueue](self, "handlerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HMDLocation_startUpdatingLocation__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopUpdatingLocation
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDLocation handlerQueue](self, "handlerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HMDLocation_stopUpdatingLocation__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)startExtractingSingleLocationForDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMDLocation_startExtractingSingleLocationForDelegate___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_canLocationBeExtracted
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v7;
  HMDLocation *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  HMDLocation *v12;
  HMDLocation *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDLocation locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)objc_opt_class(), "locationServicesEnabled");

  if ((v5 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v10;
    v11 = "%{public}@Can't extract location because Location Services are not enabled";
LABEL_11:
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v14, 0xCu);

    goto LABEL_12;
  }
  if (!-[HMDLocation authStatus](self, "authStatus"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v10;
    v11 = "%{public}@Waiting for initial location auth.";
    goto LABEL_11;
  }
  if ((objc_msgSend(MEMORY[0x1E0C9E3C8], "hm_isLocationAllowedForAuthorizationStatus:", -[HMDLocation authStatus](self, "authStatus")) & 1) != 0)return 1;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v10;
    v11 = "%{public}@Can't extract location because Location Services are not enabled for homed";
    goto LABEL_11;
  }
LABEL_12:

  objc_autoreleasePoolPop(v7);
  return 0;
}

- (void)_extractSingleLocationForDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDLocation *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMDLocation *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDLocation *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDLocation *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDLocation handlerQueue](self, "handlerQueue");
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
    v28 = 138543618;
    v29 = v9;
    v30 = 2112;
    v31 = (uint64_t)v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Extracting single location for delegate: %@", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (-[HMDLocation _canLocationBeExtracted](v7, "_canLocationBeExtracted"))
  {
    -[HMDLocation singleLocationDelegates](v7, "singleLocationDelegates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = v7;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v15;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Requesting single location", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDLocation locationManager](v13, "locationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "requestLocation");

    }
    -[HMDLocation singleLocationDelegates](v7, "singleLocationDelegates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v4);

    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDLocation singleLocationDelegates](v19, "singleLocationDelegates");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      v28 = 138543618;
      v29 = v21;
      v30 = 2048;
      v31 = v23;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Current single location delegate count is now %ld", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  else
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v7;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v27;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Passing back nil location because locations can't be extracted", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    -[HMDLocation _notifySingleLocationDelegate:withLocation:](v25, "_notifySingleLocationDelegate:withLocation:", v4, 0);
  }

}

- (id)getCurrentLocation
{
  void *v2;
  void *v3;

  -[HMDLocation locationManager](self, "locationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)registerForRegionUpdate:(id)a3 withDelegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__HMDLocation_registerForRegionUpdate_withDelegate_completionHandler___block_invoke;
  v15[3] = &unk_1E89C0448;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (void)deregisterForRegionUpdate:(id)a3 completionHandler:(id)a4
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
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HMDLocation_deregisterForRegionUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_notifySingleLocationDelegatesWithLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDLocation singleLocationDelegates](self, "singleLocationDelegates", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[HMDLocation _notifySingleLocationDelegate:withLocation:](self, "_notifySingleLocationDelegate:withLocation:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[HMDLocation singleLocationDelegates](self, "singleLocationDelegates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (void)_notifySingleLocationDelegate:(id)a3 withLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "didDetermineLocation:", v7);

}

- (void)_updateWithLocationAuthorizationStatus:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  HMDLocation *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0](-[HMDLocation setLocationAuthorized:](self, "setLocationAuthorized:", objc_msgSend(MEMORY[0x1E0C9E3C8], "hm_hmdLocationAuthorizationFromCLAuthorizationStatus:", v3)));
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLocation locationAuthorized](v7, "locationAuthorized");
    HMDLocationAuthorizationAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Location Authorization Status Updated : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDLocation locationAuthorized](v7, "locationAuthorized", CFSTR("HMDLocationAuthorizationKey")));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("HMDLocationAuthorizationChangedNotification"), v7, v13);

}

- (id)_delegateforRegion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDLocation *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDLocation regionStateDelegatesByRegionIdentifier](self, "regionStateDelegatesByRegionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      regionAsString(v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Update received for a region %@ that was not found in the region state monitor map, stopping monitoring", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDLocation regionStates](v10, "regionStates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v4);

    -[HMDLocation locationManager](v10, "locationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stopMonitoringForRegion:", v4);

  }
  return v8;
}

- (void)_updateRegionState:(int64_t)a3 forRegion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  HMDLocation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDLocation *v18;
  NSObject *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (!-[HMDLocation beingConfigured](self, "beingConfigured"))
  {
    v13 = objc_msgSend(MEMORY[0x1E0C9E3C8], "hm_hmdRegionStateFromCLRegionState:", a3);
    -[HMDLocation regionStates](self, "regionStates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, v6);

    -[HMDLocation _delegateforRegion:](self, "_delegateforRegion:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_16:

      goto LABEL_17;
    }
    if (a3 == 2)
    {
      if (!objc_msgSend(v6, "notifyOnExit"))
      {
LABEL_9:
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543362;
          v23 = v20;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Not calling the location delegate as this event was not subscribed for", (uint8_t *)&v22, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
        goto LABEL_16;
      }
    }
    else if (a3 != 1 || (objc_msgSend(v6, "notifyOnEntry") & 1) == 0)
    {
      goto LABEL_9;
    }
    v21 = v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v21, "didDetermineState:forRegion:", a3, v6);

    goto LABEL_16;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    regionAsString(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v11;
    v24 = 2048;
    v25 = a3;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@The system is being configured, not updating region state %tu for region %@", (uint8_t *)&v22, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
LABEL_17:

}

- (void)_updateEntryForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDLocation *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDLocation *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDLocation beingConfigured](self, "beingConfigured"))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      regionAsString(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@The system is being configured, pending the entry for region %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDLocation pendingRegionCallbacks](v7, "pendingRegionCallbacks");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", &unk_1E8B33D38, v4);
  }
  else
  {
    -[HMDLocation _delegateforRegion:](self, "_delegateforRegion:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (objc_msgSend(v4, "notifyOnEntry"))
      {
        v11 = v11;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "didEnterRegion:", v4);

      }
      else
      {
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543362;
          v17 = v15;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Not calling the didEnterRegion delegate as this event was not subscribed for", (uint8_t *)&v16, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
      }
    }
  }

}

- (void)_updateExitForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDLocation *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDLocation *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDLocation beingConfigured](self, "beingConfigured"))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      regionAsString(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@The system is being configured, pending the exit for region %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDLocation pendingRegionCallbacks](v7, "pendingRegionCallbacks");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", &unk_1E8B33D50, v4);
  }
  else
  {
    -[HMDLocation _delegateforRegion:](self, "_delegateforRegion:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (objc_msgSend(v4, "notifyOnExit"))
      {
        v11 = v11;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "didExitRegion:", v4);

      }
      else
      {
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543362;
          v17 = v15;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Not calling the didExitRegion delegate as this event was not subscribed for", (uint8_t *)&v16, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
      }
    }
  }

}

- (void)beingConfigured:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HMDLocation_beingConfigured_completionHandler___block_invoke;
  block[3] = &unk_1E89B6038;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_handleDeterminedState:(int64_t)a3 forRegion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  HMDLocation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  int64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E0C9E3C8], "hm_hmdRegionStateFromCLRegionState:", a3);
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMDRegionStateString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    regionAsString(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Region state is %@ for region %@ %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    -[HMDLocation handlerQueue](v9, "handlerQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__HMDLocation__handleDeterminedState_forRegion___block_invoke;
    v16[3] = &unk_1E89B4728;
    v16[4] = v9;
    v17 = v6;
    v18 = v7;
    v19 = a3;
    dispatch_async(v15, v16);

  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDLocation *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDLocation *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Location manager updated locations: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDLocation handlerQueue](v9, "handlerQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__HMDLocation_locationManager_didUpdateLocations___block_invoke;
  v14[3] = &unk_1E89C2328;
  v15 = v7;
  v16 = v9;
  v13 = v7;
  dispatch_async(v12, v14);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDLocation *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
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
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received error for the location update: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDLocation handlerQueue](v9, "handlerQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HMDLocation_locationManager_didFailWithError___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = v9;
  dispatch_async(v12, block);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  int v5;
  void *v6;
  HMDLocation *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  int v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "authorizationStatus");
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMCLAuthorizationStatusAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Received updated authorization status %@ for location", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDLocation handlerQueue](v7, "handlerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__HMDLocation_locationManagerDidChangeAuthorization___block_invoke;
  v12[3] = &unk_1E89C0400;
  v12[4] = v7;
  v13 = v5;
  dispatch_async(v11, v12);

}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDLocation *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMCLRegionStateAsString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "radius");
    v16 = 138543874;
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    v20 = 2048;
    v21 = v15;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@LocationManager did determine region state: %@, radius : %f", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDLocation _handleDeterminedState:forRegion:](v11, "_handleDeterminedState:forRegion:", a4, v9);

}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDLocation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    regionAsString(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@LocationManager did enter the region %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDLocation _handleDeterminedState:forRegion:](v9, "_handleDeterminedState:forRegion:", 1, v7);

}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDLocation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    regionAsString(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@LocationManager did exit the region %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDLocation _handleDeterminedState:forRegion:](v9, "_handleDeterminedState:forRegion:", 2, v7);

}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDLocation handlerQueue](self, "handlerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HMDLocation_locationManager_didStartMonitoringForRegion___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)getCoreRoutineLOIForCurrentLocationWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDLocation *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v4;
  -[HMDLocation locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Asking Core Routine for LOI at current location", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__HMDLocation_getCoreRoutineLOIForCurrentLocationWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E89C0960;
    v16[4] = v10;
    v17 = v5;
    objc_msgSend(v8, "_fetchPlaceInferencesWithFidelityPolicy:handler:", 5, v16);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@looks like we do not have valid location manager instance.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v5)[2](v5, 0, 0, v15);

  }
}

- (void)requestMicroLocationRecordingScanWithMetadata:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D4DE98], "requestMicroLocationRecordingScanWithAdditionalInformation:shouldForceRecording:", a3, 0);
}

- (void)requestMicroLocationLocalizationScanWithMetadata:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D4DE98], "requestCurrentMicroLocationWithAdditionalInformation:", a3);
}

- (int64_t)locationAuthorized
{
  return self->_locationAuthorized;
}

- (void)setLocationAuthorized:(int64_t)a3
{
  self->_locationAuthorized = a3;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (int)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(int)a3
{
  self->_authStatus = a3;
}

- (NSHashTable)singleLocationDelegates
{
  return self->_singleLocationDelegates;
}

- (NSMapTable)regionStateDelegatesByRegionIdentifier
{
  return self->_regionStateDelegatesByRegionIdentifier;
}

- (NSMapTable)pendingRegionMonitoringRequests
{
  return self->_pendingRegionMonitoringRequests;
}

- (NSMapTable)pendingRegionCallbacks
{
  return self->_pendingRegionCallbacks;
}

- (NSMapTable)regionStates
{
  return self->_regionStates;
}

- (BOOL)beingConfigured
{
  return self->_beingConfigured;
}

- (void)setBeingConfigured:(BOOL)a3
{
  self->_beingConfigured = a3;
}

- (int64_t)totalLocationObservingClients
{
  return self->_totalLocationObservingClients;
}

- (void)setTotalLocationObservingClients:(int64_t)a3
{
  self->_totalLocationObservingClients = a3;
}

- (HMDCLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_regionStates, 0);
  objc_storeStrong((id *)&self->_pendingRegionCallbacks, 0);
  objc_storeStrong((id *)&self->_pendingRegionMonitoringRequests, 0);
  objc_storeStrong((id *)&self->_regionStateDelegatesByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_singleLocationDelegates, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

void __72__HMDLocation_getCoreRoutineLOIForCurrentLocationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "referenceLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (+[HMDLocation isAccurateLocation:](HMDLocation, "isAccurateLocation:", v9))
      {
        objc_msgSend(v5, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_loiIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 138543362;
            v38 = v16;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@LOI Identifier is nil. Returning fallback location.", (uint8_t *)&v37, 0xCu);

          }
          objc_autoreleasePoolPop(v13);
          v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
        v17 = (void *)MEMORY[0x1D17BA0A0](v12);
        v18 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543618;
          v38 = v20;
          v39 = 2112;
          v40 = v9;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@CR LOI Location : %@", (uint8_t *)&v37, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_22;
      }
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v35;
        v39 = 2112;
        v40 = v9;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Not using CR location with low accuracy : %@", (uint8_t *)&v37, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      v29 = *(_QWORD *)(a1 + 40);
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v31 = 2;
    }
    else
    {
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543362;
        v38 = v28;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Reference location is nil.", (uint8_t *)&v37, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      v29 = *(_QWORD *)(a1 + 40);
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v31 = 20;
    }
    objc_msgSend(v30, "hmErrorWithCode:", v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v29 + 16))(v29, 0, 0, v36);

LABEL_22:
    goto LABEL_23;
  }
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543618;
    v38 = v24;
    v39 = 2112;
    v40 = v7;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Got an error or place inferences are nil while fetching location of interest. %@", (uint8_t *)&v37, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_23:

}

void __59__HMDLocation_locationManager_didStartMonitoringForRegion___block_invoke(uint64_t a1)
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
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    regionAsString(*(void **)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@did start monitoring for region: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "locationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestStateForRegion:", *(_QWORD *)(a1 + 40));

}

void __53__HMDLocation_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
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

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "authStatus");
  objc_msgSend(*(id *)(a1 + 32), "setAuthStatus:", *(unsigned int *)(a1 + 40));
  if ((objc_msgSend(MEMORY[0x1E0C9E3C8], "hm_isLocationAllowedForAuthorizationStatus:", *(unsigned int *)(a1 + 40)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_notifySingleLocationDelegatesWithLocation:", 0);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_updateWithLocationAuthorizationStatus:", *(unsigned int *)(a1 + 40));
  if (!v2)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0](v3);
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMCLAuthorizationStatusAsString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "locationAuthorized");
      HMDLocationAuthorizationAsString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Initial location auth status for homed: %@, %@", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

uint64_t __48__HMDLocation_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifySingleLocationDelegatesWithLocation:", 0);
}

void __50__HMDLocation_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && +[HMDLocation isAccurateLocation:](HMDLocation, "isAccurateLocation:", v2))
  {
    v3 = *(void **)(a1 + 40);
    v4 = v2;
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v2;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Ignoring inaccurate single location: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v3 = *(void **)(a1 + 40);
    v4 = 0;
  }
  objc_msgSend(v3, "_notifySingleLocationDelegatesWithLocation:", v4);

}

void __48__HMDLocation__handleDeterminedState_forRegion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "regionStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
    v5 = *(_QWORD *)(a1 + 48);
    if (v4 != v5)
    {
      if (v4)
      {
        v6 = (void *)MEMORY[0x1D17BA0A0]();
        v7 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
        if (v5 == 2)
        {
          if (v9)
          {
            HMFGetLogIdentifier();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            regionAsString(*(void **)(a1 + 40));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138543874;
            v30 = v10;
            v31 = 2112;
            v32 = v11;
            v33 = 2112;
            v34 = v12;
            _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Received exit for region %@ %@", (uint8_t *)&v29, 0x20u);

          }
          objc_autoreleasePoolPop(v6);
          v4 = objc_msgSend(*(id *)(a1 + 32), "_updateExitForRegion:", *(_QWORD *)(a1 + 40));
        }
        else
        {
          if (v9)
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            regionAsString(*(void **)(a1 + 40));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138543874;
            v30 = v19;
            v31 = 2112;
            v32 = v20;
            v33 = 2112;
            v34 = v21;
            _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Received entry for region %@ %@", (uint8_t *)&v29, 0x20u);

          }
          objc_autoreleasePoolPop(v6);
          v4 = objc_msgSend(*(id *)(a1 + 32), "_updateEntryForRegion:", *(_QWORD *)(a1 + 40));
        }
      }
      goto LABEL_15;
    }
  }
  else if (*(_QWORD *)(a1 + 48))
  {
LABEL_15:
    v22 = (void *)MEMORY[0x1D17BA0A0](v4);
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMDRegionStateString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HMDRegionStateString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138544130;
      v30 = v25;
      v31 = 2114;
      v32 = v26;
      v33 = 2114;
      v34 = v27;
      v35 = 2114;
      v36 = v28;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating region state from %{public}@ to %{public}@ %{public}@", (uint8_t *)&v29, 0x2Au);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(*(id *)(a1 + 32), "_updateRegionState:forRegion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    goto LABEL_18;
  }
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMDRegionStateString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543874;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Ignoring because region state did not change %@ %@", (uint8_t *)&v29, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
LABEL_18:

}

void __49__HMDLocation_beingConfigured_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  __int128 v81;
  id obj;
  id obja;
  id objb;
  uint64_t v85;
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
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v85 = a1;
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v100 = v5;
    v101 = 2112;
    v102 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Being configured is changing to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = objc_msgSend(*(id *)(a1 + 32), "beingConfigured");
  v8 = *(unsigned __int8 *)(a1 + 48);
  if (v8 == v7)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "beingConfigured");
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v100 = v12;
      v101 = 2112;
      v102 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Being configured is not changing from %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    goto LABEL_8;
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "setBeingConfigured:", v8 != 0);
  if (*(_BYTE *)(a1 + 48))
  {
LABEL_8:
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(void))(v15 + 16))();
    return;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0](v14);
  v17 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v100 = v19;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Being configured is changing to NO, submitting the pending monitor requests", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pendingRegionMonitoringRequests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v95 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        objc_msgSend(*(id *)(v85 + 32), "pendingRegionMonitoringRequests");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(*(id *)(v85 + 32), "regionStateDelegatesByRegionIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKey:", v26, v28);

          v29 = (void *)MEMORY[0x1D17BA0A0]();
          v30 = *(id *)(v85 + 32);
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            regionAsString(v24);
            v33 = v21;
            v34 = v22;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v100 = v32;
            v101 = 2112;
            v102 = v35;
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@After configured, submitting start monitor request for region: %@", buf, 0x16u);

            v22 = v34;
            v21 = v33;

          }
          objc_autoreleasePoolPop(v29);
          objc_msgSend(*(id *)(v85 + 32), "locationManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "startMonitoringForRegion:", v24);

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
    }
    while (v21);
  }

  objc_msgSend(*(id *)(v85 + 32), "pendingRegionMonitoringRequests");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "removeAllObjects");

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  objc_msgSend(*(id *)(v85 + 32), "pendingRegionCallbacks");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
  if (v38)
  {
    v40 = v38;
    v41 = *(_QWORD *)v91;
    *(_QWORD *)&v39 = 138543874;
    v81 = v39;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v91 != v41)
          objc_enumerationMutation(obja);
        v43 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
        objc_msgSend(*(id *)(v85 + 32), "pendingRegionCallbacks", v81);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKey:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = objc_msgSend(v45, "unsignedIntegerValue");
        if (v46)
        {
          if (v46 == 1)
          {
            v51 = (void *)MEMORY[0x1D17BA0A0]();
            v52 = *(id *)(v85 + 32);
            HMFGetOSLogHandle();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v100 = v54;
              v101 = 2112;
              v102 = v43;
              _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_INFO, "%{public}@Calling pending entry callback for region %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v51);
            objc_msgSend(*(id *)(v85 + 32), "_updateEntryForRegion:", v43);
          }
          else if (v46 == 2)
          {
            v47 = (void *)MEMORY[0x1D17BA0A0]();
            v48 = *(id *)(v85 + 32);
            HMFGetOSLogHandle();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v100 = v50;
              v101 = 2112;
              v102 = v43;
              _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_INFO, "%{public}@Calling pending exit callback for region %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v47);
            objc_msgSend(*(id *)(v85 + 32), "_updateExitForRegion:", v43);
          }
        }
        else
        {
          v55 = (void *)MEMORY[0x1D17BA0A0]();
          v56 = *(id *)(v85 + 32);
          HMFGetOSLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v81;
            v100 = v58;
            v101 = 2112;
            v102 = v45;
            v103 = 2112;
            v104 = v43;
            _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_INFO, "%{public}@Unknown region state %@ for region %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v55);
        }

      }
      v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
    }
    while (v40);
  }

  objc_msgSend(*(id *)(v85 + 32), "pendingRegionCallbacks");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "removeAllObjects");

  objc_msgSend(*(id *)(v85 + 32), "locationManager");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "monitoredRegions");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v62 = v61;
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v87;
    do
    {
      v66 = 0;
      objb = (id)v64;
      do
      {
        if (*(_QWORD *)v87 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v66);
        objc_msgSend(*(id *)(v85 + 32), "regionStateDelegatesByRegionIdentifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "identifier");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "objectForKey:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v70)
        {
          v71 = (void *)MEMORY[0x1D17BA0A0]();
          v72 = *(id *)(v85 + 32);
          HMFGetOSLogHandle();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            regionAsString(v67);
            v75 = v65;
            v76 = v62;
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v100 = v74;
            v101 = 2112;
            v102 = v77;
            _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_ERROR, "%{public}@Region %@ was not found in the region state monitor map, stopping monitoring", buf, 0x16u);

            v62 = v76;
            v65 = v75;

          }
          objc_autoreleasePoolPop(v71);
          objc_msgSend(*(id *)(v85 + 32), "regionStates");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "removeObjectForKey:", v67);

          objc_msgSend(*(id *)(v85 + 32), "locationManager");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "stopMonitoringForRegion:", v67);

          v64 = (uint64_t)objb;
        }

        ++v66;
      }
      while (v64 != v66);
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
    }
    while (v64);
  }

  v80 = *(_QWORD *)(v85 + 40);
  if (v80)
    (*(void (**)(void))(v80 + 16))();

}

void __59__HMDLocation_deregisterForRegionUpdate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  __int128 v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 48))
  {
    v31 = (void *)MEMORY[0x1D17BA0A0]();
    v32 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v34;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Completion handler is invalid", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v35);
  }
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v27;
      v28 = "%{public}@Monitored regions are nil";
LABEL_23:
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);

    }
LABEL_24:

    objc_autoreleasePoolPop(v24);
    v29 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 3, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);

    return;
  }
  if (!objc_msgSend(v2, "count"))
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v27;
      v28 = "%{public}@Monitored regions are empty";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v40;
    *(_QWORD *)&v4 = 138543618;
    v36 = v4;
    v37 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "regionStates", v36);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectForKey:", v8);

        objc_msgSend(*(id *)(a1 + 32), "regionStateDelegatesByRegionIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1D17BA0A0]();
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
            regionAsString(v8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v36;
            v44 = v17;
            v45 = 2112;
            v46 = v18;
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Submitting stop monitor request for region: %@", buf, 0x16u);

            v6 = v37;
          }

          objc_autoreleasePoolPop(v13);
          objc_msgSend(*(id *)(a1 + 32), "locationManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stopMonitoringForRegion:", v8);

          objc_msgSend(*(id *)(a1 + 32), "regionStateDelegatesByRegionIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObjectForKey:", v21);

        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            regionAsString(v8);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v36;
            v44 = v22;
            v45 = 2112;
            v46 = v23;
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Region %@ was not found in the region state monitor map, cannot deregister", buf, 0x16u);

            v6 = v37;
          }

          objc_autoreleasePoolPop(v13);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __70__HMDLocation_registerForRegionUpdate_withDelegate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  __int128 v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 56))
  {
    v48 = (void *)MEMORY[0x1D17BA0A0]();
    v49 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v51;
      _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Completion handler is invalid", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v48);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v52);
  }
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v65 = v19;
    v20 = "%{public}@Monitored regions are nil";
LABEL_24:
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    goto LABEL_25;
  }
  if (!objc_msgSend(v2, "count"))
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v65 = v19;
    v20 = "%{public}@Monitored regions are empty";
    goto LABEL_24;
  }
  if (!*(_QWORD *)(a1 + 48))
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v19;
      v20 = "%{public}@Delegate is nil";
      goto LABEL_24;
    }
LABEL_25:

    objc_autoreleasePoolPop(v16);
    v21 = *(_QWORD *)(a1 + 56);
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB8C70];
    v24 = 3;
LABEL_26:
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v25);

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "locationServicesEnabled");

  if ((v4 & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v29;
      v30 = "%{public}@Location services are not enabled, cannot submit region monitoring";
      v31 = v28;
      v32 = OS_LOG_TYPE_INFO;
LABEL_31:
      _os_log_impl(&dword_1CD062000, v31, v32, v30, buf, 0xCu);

    }
LABEL_32:

    objc_autoreleasePoolPop(v26);
    v21 = *(_QWORD *)(a1 + 56);
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB8C70];
    v24 = 84;
    goto LABEL_26;
  }
  if ((objc_msgSend(MEMORY[0x1E0C9E3C8], "hm_isLocationAllowedForAuthorizationStatus:", objc_msgSend(*(id *)(a1 + 32), "authStatus")) & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v29;
      v30 = "%{public}@Location is not authorized for homed, cannot submit region monitoring";
      v31 = v28;
      v32 = OS_LOG_TYPE_ERROR;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "beingConfigured"))
  {
    v61 = 0uLL;
    v62 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    obj = *(id *)(a1 + 40);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v60 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x1D17BA0A0]();
          v11 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            regionAsString(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v65 = v13;
            v66 = 2112;
            v67 = v14;
            _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@The system is being configured, holding onto region %@ monitoring requests until complete", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          objc_msgSend(*(id *)(a1 + 32), "pendingRegionMonitoringRequests");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", *(_QWORD *)(a1 + 48), v9);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v6);
    }
  }
  else
  {
    v57 = 0uLL;
    v58 = 0uLL;
    v55 = 0uLL;
    v56 = 0uLL;
    obj = *(id *)(a1 + 40);
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v33)
    {
      v35 = v33;
      v36 = *(_QWORD *)v56;
      *(_QWORD *)&v34 = 138543618;
      v53 = v34;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v56 != v36)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 32), "regionStateDelegatesByRegionIdentifier", v53);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v38, "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKey:", v40, v41);

          v42 = (void *)MEMORY[0x1D17BA0A0]();
          v43 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            regionAsString(v38);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v53;
            v65 = v45;
            v66 = 2112;
            v67 = v46;
            _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Submitting start monitor request for region: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v42);
          objc_msgSend(*(id *)(a1 + 32), "locationManager");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "startMonitoringForRegion:", v38);

        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v35);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __56__HMDLocation_startExtractingSingleLocationForDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_extractSingleLocationForDelegate:", *(_QWORD *)(a1 + 40));
}

void __35__HMDLocation_stopUpdatingLocation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "totalLocationObservingClients"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Processing stop updating location request: totalClients: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v7, "totalLocationObservingClients") - 1;
  objc_msgSend(v7, "setTotalLocationObservingClients:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setTotalLocationObservingClients:", v8 & ~(v8 >> 63));
  if (!objc_msgSend(*(id *)(a1 + 32), "totalLocationObservingClients"))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Requesting CLLocationManager to stop updating location", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopUpdatingLocation");

  }
}

uint64_t __36__HMDLocation_startUpdatingLocation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "totalLocationObservingClients"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Processing start updating location request: totalClients: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (!objc_msgSend(*(id *)(a1 + 32), "totalLocationObservingClients"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Requesting CLLocationManager to start updating location", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startUpdatingLocation");

  }
  return objc_msgSend(*(id *)(a1 + 32), "setTotalLocationObservingClients:", objc_msgSend(*(id *)(a1 + 32), "totalLocationObservingClients") + 1);
}

+ (HMDLocation)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__HMDLocation_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_117222 != -1)
    dispatch_once(&sharedManager_onceToken_117222, block);
  return (HMDLocation *)(id)sharedManager_sharedLocation;
}

+ (NSBundle)bundleForLocationManager
{
  return (NSBundle *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/HomeKitDaemon.framework"));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_117214 != -1)
    dispatch_once(&logCategory__hmf_once_t25_117214, &__block_literal_global_117215);
  return (id)logCategory__hmf_once_v26_117216;
}

+ (id)_getAlmanacWithLocation:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = (objc_class *)MEMORY[0x1E0D26ED0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "coordinate");
  v7 = v6;
  objc_msgSend(v4, "coordinate");
  v9 = v8;

  objc_msgSend(v5, "calculateAstronomicalTimeForLocation:altitudeInDegrees:", v7, v9, *MEMORY[0x1E0D26430]);
  return v5;
}

+ (id)_getAlmanacWithLocation:(id)a3 date:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = (objc_class *)MEMORY[0x1E0D26ED0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "coordinate");
  v8 = v7;
  objc_msgSend(v5, "coordinate");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:", v8, v10, v11, *MEMORY[0x1E0D26430]);
  return v6;
}

+ (id)findEvent:(id)a3 withGeo:(id)a4
{
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
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char *v23;
  id v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_dateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHour:", 12);
  objc_msgSend(v7, "setMinute:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromComponents:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "previousSunrise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  objc_msgSend(v5, "previousSunset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(v5, "sunrise");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v12;
  objc_msgSend(v5, "sunset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v13;
  objc_msgSend(v5, "nextSunrise");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v14;
  objc_msgSend(v5, "nextSunset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v15;
  v26[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_149_117212);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  if (objc_msgSend(v17, "count"))
  {
    v19 = v25;
    while (1)
    {
      objc_msgSend(v17, "objectAtIndex:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 == v9)
        break;
      if ((unint64_t)++v18 >= objc_msgSend(v17, "count"))
      {
        v18 = 0;
        goto LABEL_11;
      }
    }
    objc_msgSend(v17, "objectAtIndex:", v18 - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v25, "containsObject:", v21);

    if (v22)
      v23 = v18 + 1;
    else
      v23 = v18 - 1;
    objc_msgSend(v17, "objectAtIndex:", v23);
    v18 = (char *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v25;
  }
LABEL_11:

  return v18;
}

+ (id)sunriseTimeForLocation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  +[HMDLocation _getAlmanacWithLocation:](HMDLocation, "_getAlmanacWithLocation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousSunset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sunset", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(v3, "nextSunset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDLocation findEvent:withGeo:](HMDLocation, "findEvent:withGeo:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)nextSunriseTimeForLocation:(id)a3 date:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  +[HMDLocation _getAlmanacWithLocation:](HMDLocation, "_getAlmanacWithLocation:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousSunrise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sunrise", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(v4, "nextSunrise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sunsetTimeForLocation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  +[HMDLocation _getAlmanacWithLocation:](HMDLocation, "_getAlmanacWithLocation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousSunrise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sunrise", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(v3, "nextSunrise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDLocation findEvent:withGeo:](HMDLocation, "findEvent:withGeo:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)nextSunsetTimeForLocation:(id)a3 date:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  +[HMDLocation _getAlmanacWithLocation:](HMDLocation, "_getAlmanacWithLocation:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousSunset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sunset", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(v4, "nextSunset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isAccurateLocation:(id)a3
{
  id v3;
  double v4;
  BOOL v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "horizontalAccuracy");
  if (v4 >= 0.0)
  {
    objc_msgSend(v3, "horizontalAccuracy");
    v5 = v6 <= 500.0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)timeZoneISOCountryCodeForCLLocationAsync:(id)a3 withCompletion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *, void *);

  v7 = (void (**)(id, void *, void *))_Block_copy(a4);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v4, v6);

  }
}

uint64_t __33__HMDLocation_findEvent_withGeo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __26__HMDLocation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v26_117216;
  logCategory__hmf_once_v26_117216 = v0;

}

void __28__HMDLocation_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedLocation;
  sharedManager_sharedLocation = (uint64_t)v1;

}

@end
