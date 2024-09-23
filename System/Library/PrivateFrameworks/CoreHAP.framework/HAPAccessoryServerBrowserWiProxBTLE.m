@implementation HAPAccessoryServerBrowserWiProxBTLE

- (void)retrieveStateForTrackedAccessoryWithIdentifier:(id)a3 stateNumber:(id *)a4 isReachable:(BOOL *)a5 linkQuality:(unint64_t *)a6 lastSeen:(id *)a7
{
  void *v12;
  void *v13;
  void *v14;
  double Current;
  double v16;
  id v17;

  -[HAPAccessoryServerBrowserWiProxBTLE trackedPeripheralWithIdentifier:](self, "trackedPeripheralWithIdentifier:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v17 = v12;
    if (a6)
    {
      objc_msgSend(v12, "averageRSSI");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *a6 = -[HAPAccessoryServerBrowserWiProxBTLE _getLinkQuality:](self, "_getLinkQuality:", v13);

      v12 = v17;
    }
    if (a4)
    {
      objc_msgSend(v17, "stateNumber");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v17;
    }
    if (a7)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v17, "lastSeen");
      objc_msgSend(v14, "numberWithDouble:", Current - v16);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v17;
    }
    if (a5)
    {
      *a5 = objc_msgSend(v17, "isReachable");
      v12 = v17;
    }
  }

}

- (id)trackedPeripheralWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HAPAccessoryServerBrowserWiProxBTLE _lock_trackedPeripheralWithIdentifier:](self, "_lock_trackedPeripheralWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)_lock_trackedPeripheralWithIdentifier:(id)a3
{
  id v4;
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
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_trackedPeripherals;
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
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HAPAccessoryServerBrowserWiProxBTLE)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HAPAccessoryServerBrowserWiProxBTLE *v9;
  HAPAccessoryServerBrowserWiProxBTLE *v10;
  uint64_t v11;
  WPHomeKit *wpHomeKit;
  uint64_t v13;
  NSMutableSet *trackedIdentifiers;
  uint64_t v15;
  NSMutableSet *trackedPeripherals;
  HAPAccessoryServerBrowserWiProxBTLE *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v22.receiver = self;
    v22.super_class = (Class)HAPAccessoryServerBrowserWiProxBTLE;
    v9 = -[HAPAccessoryServerBrowserWiProxBTLE init](&v22, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_workQueue, a4);
      objc_storeWeak((id *)&v10->_delegate, v6);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DD9B60]), "initWithDelegate:queue:", v10, v10->_workQueue);
      wpHomeKit = v10->_wpHomeKit;
      v10->_wpHomeKit = (WPHomeKit *)v11;

      v10->_currentScanState = 0;
      v10->_scanInBackground = 1;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = objc_claimAutoreleasedReturnValue();
      trackedIdentifiers = v10->_trackedIdentifiers;
      v10->_trackedIdentifiers = (NSMutableSet *)v13;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = objc_claimAutoreleasedReturnValue();
      trackedPeripherals = v10->_trackedPeripherals;
      v10->_trackedPeripherals = (NSMutableSet *)v15;

      v10->_routeMode = 0;
      v10->_currentScanType = -1;
    }
    self = v10;
    v17 = self;
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid arguments", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (id)trackedPeripherals
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_trackedPeripherals);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)trackedIdentifiers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_trackedIdentifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)removeTrackedPeripheralWithStableIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HAPAccessoryServerBrowserWiProxBTLE _lock_trackedPeripheralWithIdentifier:](self, "_lock_trackedPeripheralWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[NSMutableSet removeObject:](self->_trackedPeripherals, "removeObject:", v5);

  os_unfair_lock_unlock(&self->_lock);
  return v5 != 0;
}

- (void)setRouteMode:(unsigned __int8)a3
{
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if (HAPIsHH2Enabled_hh2Enabled == 1)
  {
    os_unfair_lock_lock_with_options();
    self->_routeMode = a3;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (unsigned)routeMode
{
  os_unfair_lock_s *p_lock;
  unsigned __int8 routeMode;

  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if (HAPIsHH2Enabled_hh2Enabled != 1)
    return 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  routeMode = self->_routeMode;
  os_unfair_lock_unlock(p_lock);
  return routeMode;
}

- (void)_startScanningWithScanType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  HAPAccessoryServerBrowserWiProxBTLE *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DD9B70]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0DD9B68]);

  if (!a3)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DD9B78]);
  v7 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServerBrowserWiProxBTLE setCurrentScanType:](self, "setCurrentScanType:", a3));
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Start scanning with data: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](v8, "wpHomeKit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startScanningWithData:forType:", v5, 0);

  -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](v8, "wpHomeKit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startScanningWithData:forType:", v5, 1);

}

- (void)_stopScanning
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](self, "wpHomeKit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 != 2)
  {
    -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](self, "wpHomeKit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopScanningForType:", 0);

    -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](self, "wpHomeKit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopScanningForType:", 1);

  }
  -[HAPAccessoryServerBrowserWiProxBTLE setCurrentScanType:](self, "setCurrentScanType:", -1);
}

- (void)restartScans
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HAPAccessoryServerBrowserWiProxBTLE_restartScans__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)pauseScans
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HAPAccessoryServerBrowserWiProxBTLE_pauseScans__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)startBrowsingForHAPBLEAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HAPAccessoryServerBrowserWiProxBTLE_startBrowsingForHAPBLEAccessories__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_startBrowsingForHAPBLEAccessories
{
  void *v3;
  HAPAccessoryServerBrowserWiProxBTLE *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HAPAccessoryServerBrowserWiProxBTLE *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Request to Start Browsing for HomeKit accessories", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPAccessoryServerBrowserWiProxBTLE setCurrentScanState:](v4, "setCurrentScanState:", 1);
  -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](v4, "wpHomeKit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = v4;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 == 3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Re-starting High Priority Scan", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HAPAccessoryServerBrowserWiProxBTLE _stopScanning](v10, "_stopScanning");
    -[HAPAccessoryServerBrowserWiProxBTLE _startScanningWithScanType:](v10, "_startScanningWithScanType:", 2);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Pending scan as WiProx is not powered on", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
}

- (void)stopBrowsingForHAPBLEAccessories:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__HAPAccessoryServerBrowserWiProxBTLE_stopBrowsingForHAPBLEAccessories___block_invoke;
  v6[3] = &unk_1E894D770;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)_stopBrowsingForHAPBLEAccessories:(BOOL)a3
{
  void *v5;
  HAPAccessoryServerBrowserWiProxBTLE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HAPAccessoryServerBrowserWiProxBTLE *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServerBrowserWiProxBTLE setCurrentScanState:](self, "setCurrentScanState:", 0));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v8;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Request to Stop Browsing for HomeKit accessories - force %{public}@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](v6, "wpHomeKit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "state");

  if (v11 == 3)
  {
    -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](v6, "trackedIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") && -[HAPAccessoryServerBrowserWiProxBTLE scanInBackground](v6, "scanInBackground"))
    {

      if (!a3)
      {
        -[HAPAccessoryServerBrowserWiProxBTLE _startScanningWithScanType:](v6, "_startScanningWithScanType:", 0);
        return;
      }
    }
    else
    {

    }
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB37E8];
      -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](v14, "trackedIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserWiProxBTLE scanInBackground](v14, "scanInBackground");
      HMFBooleanToString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544130;
      v23 = v16;
      v24 = 2114;
      v25 = v19;
      v26 = 2114;
      v27 = v20;
      v28 = 2114;
      v29 = v21;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Stopping Scan. Tracked Identifiers: %{public}@, Background Scan: %{public}@, Force: %{public}@", (uint8_t *)&v22, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    -[HAPAccessoryServerBrowserWiProxBTLE _stopScanning](v14, "_stopScanning");
  }
}

- (void)startTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__HAPAccessoryServerBrowserWiProxBTLE_startTrackingHAPBLEAccessoriesWithIdentifiers___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_startTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3 restartScan:(BOOL)a4
{
  void *v6;
  HAPAccessoryServerBrowserWiProxBTLE *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  HAPAccessoryServerBrowserWiProxBTLE *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HAPAccessoryServerBrowserWiProxBTLE *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *context;
  NSObject *oslog;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v9;
    v48 = 2114;
    v49 = v40;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Request to start tracking accessories with new Identifiers: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v40)
    v10 = v40;
  else
    v10 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](v7, "trackedIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "minusSet:", v11);

  if (objc_msgSend(v41, "count"))
    v12 = 1;
  else
    v12 = a4;
  context = (void *)MEMORY[0x1D17B7244]();
  v13 = v7;
  HMFGetOSLogHandle();
  oslog = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v14 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](v13, "trackedIdentifiers");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = v16;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v20 = v17;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, buf, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v43 != v22)
              objc_enumerationMutation(v20);
            v24 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            if ((objc_msgSend(v18, "containsObject:", v24) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [NEW]"), v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v25);

            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, buf, 16);
        }
        while (v21);
      }

      if (v18)
        objc_msgSend(v19, "addObjectsFromArray:", v18);

      *(_DWORD *)buf = 138543618;
      v47 = v37;
      v48 = 2114;
      v49 = v19;
      _os_log_impl(&dword_1CCE01000, oslog, OS_LOG_TYPE_INFO, "%{public}@Tracking Identifiers: %{public}@", buf, 0x16u);

      v14 = oslog;
    }

    objc_autoreleasePoolPop(context);
    os_unfair_lock_lock_with_options();
    -[NSMutableSet unionSet:](v13->_trackedIdentifiers, "unionSet:", v41);
    os_unfair_lock_unlock(&v13->_lock);
    -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](v13, "wpHomeKit");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "state") == 3;

    if (v27)
    {
      if (!-[HAPAccessoryServerBrowserWiProxBTLE currentScanState](v13, "currentScanState"))
      {
        -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](v13, "trackedIdentifiers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count") == 0;

        if (!v29)
          -[HAPAccessoryServerBrowserWiProxBTLE _startScanningWithScanType:](v13, "_startScanningWithScanType:", 1);
      }
    }
    else
    {
      v32 = (void *)MEMORY[0x1D17B7244]();
      v33 = v13;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v35;
        _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_ERROR, "%{public}@Pending tracking as WiProx is not powered on", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v32);
    }
  }
  else
  {
    v30 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v31;
      _os_log_impl(&dword_1CCE01000, oslog, OS_LOG_TYPE_DEBUG, "%{public}@No new identifiers to track", buf, 0xCu);

      v30 = oslog;
    }

    objc_autoreleasePoolPop(context);
  }

}

- (void)stopTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__HAPAccessoryServerBrowserWiProxBTLE_stopTrackingHAPBLEAccessoriesWithIdentifiers___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_stopTrackingHAPBLEAccessoriesWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerBrowserWiProxBTLE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HAPAccessoryServerBrowserWiProxBTLE *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HAPAccessoryServerBrowserWiProxBTLE *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v8;
    v25 = 2114;
    v26 = (uint64_t)v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Request to stop tracking accessories with Identifiers: %{public}@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerBrowserWiProxBTLE _removeTrackedPeripheral:](v6, "_removeTrackedPeripheral:", v4);
  -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](v6, "trackedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HAPAccessoryServerBrowserWiProxBTLE currentScanState](v12, "currentScanState");
      v23 = 138543618;
      v24 = v14;
      v25 = 2048;
      v26 = v15;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No more accessories to track scanState: %tu", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v16 = -[HAPAccessoryServerBrowserWiProxBTLE currentScanState](v12, "currentScanState");
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = v12;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v20)
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v21;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@No more accessories to track. Continuing to scan.", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
    }
    else
    {
      if (v20)
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v22;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@No more accessories to track. Stopping Scan.", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[HAPAccessoryServerBrowserWiProxBTLE _stopScanning](v18, "_stopScanning");
    }
  }

}

- (BOOL)scanInBackground
{
  HAPAccessoryServerBrowserWiProxBTLE *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_scanInBackground;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setScanInBackground:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_scanInBackground = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)resetLastSeenForTrackedAccessories:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HAPAccessoryServerBrowserWiProxBTLE_resetLastSeenForTrackedAccessories___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (unint64_t)_getLinkQuality:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_10;
  if (objc_msgSend(v3, "integerValue") <= -50)
  {
    if (objc_msgSend(v4, "integerValue") > -70)
    {
      v5 = 1;
      goto LABEL_11;
    }
    if (objc_msgSend(v4, "integerValue") > -80)
    {
      v5 = 2;
      goto LABEL_11;
    }
    if (objc_msgSend(v4, "integerValue") > -85)
    {
      v5 = 3;
      goto LABEL_11;
    }
LABEL_10:
    v5 = 4;
    goto LABEL_11;
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (void)updateStateForIdentifier:(id)a3 stateNumber:(id)a4
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
  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HAPAccessoryServerBrowserWiProxBTLE_updateStateForIdentifier_stateNumber___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)trackedPeripheralForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAPAccessoryServerBrowserWiProxBTLE trackedPeripheralWithIdentifier:](self, "trackedPeripheralWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)probeReachabilityForTrackedAccessoriesWithScanTuples:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__HAPAccessoryServerBrowserWiProxBTLE_probeReachabilityForTrackedAccessoriesWithScanTuples___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_probeReachabilityForTrackedAccessories
{
  void *v3;
  HAPAccessoryServerBrowserWiProxBTLE *v4;
  NSObject *v5;
  void *v6;
  double v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  HAPAccessoryServerBrowserWiProxBTLE *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double Current;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  int v25;
  void *v26;
  HAPAccessoryServerBrowserWiProxBTLE *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  HAPAccessoryServerBrowserWiProxBTLE *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](v4, "trackedIdentifiers");
    v7 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543618;
    v43 = v6;
    v44 = 2114;
    v45 = v7;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Probing reachability for tracked accessories: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](v4, "wpHomeKit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "state") != 3)
  {

    goto LABEL_12;
  }
  if (-[HAPAccessoryServerBrowserWiProxBTLE currentScanState](v4, "currentScanState"))
  {
    v9 = -[HAPAccessoryServerBrowserWiProxBTLE routeMode](v4, "routeMode");

    if ((v9 & 1) == 0)
      goto LABEL_12;
  }
  else
  {

  }
  v10 = (void *)MEMORY[0x1D17B7244]();
  v11 = v4;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](v11, "trackedIdentifiers");
    v14 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543618;
    v43 = v13;
    v44 = 2114;
    v45 = v14;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Restarting High Priority Passive Scan to probe reachability: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HAPAccessoryServerBrowserWiProxBTLE _stopScanning](v11, "_stopScanning");
  -[HAPAccessoryServerBrowserWiProxBTLE _startScanningWithScanType:](v11, "_startScanningWithScanType:", 1);
LABEL_12:
  Current = CFAbsoluteTimeGetCurrent();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[HAPAccessoryServerBrowserWiProxBTLE trackedPeripherals](v4, "trackedPeripherals");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v39;
    *(_QWORD *)&v18 = 138543618;
    v36 = v18;
    do
    {
      v21 = 0;
      v37 = v19;
      do
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v21);
        objc_msgSend(v22, "lastSeen", v36);
        v24 = v23;
        v25 = objc_msgSend(v22, "isReachable");
        v26 = (void *)MEMORY[0x1D17B7244]();
        v27 = v4;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v25)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "shortDescription");
            v31 = v20;
            v32 = v4;
            v33 = v16;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v30;
            v44 = 2048;
            v45 = Current - v24;
            v46 = 2114;
            v47 = v34;
            _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_INFO, "%{public}@Tracked peripheral was seen %.3f seconds ago. Reachability probe returns tracked peripheral: %{public}@", buf, 0x20u);

            v16 = v33;
            v4 = v32;
            v20 = v31;
            v19 = v37;

          }
          objc_autoreleasePoolPop(v26);
          -[HAPAccessoryServerBrowserWiProxBTLE _reportReachabilityForHAPPeripheral:](v27, "_reportReachabilityForHAPPeripheral:", v22);
        }
        else
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v36;
            v43 = v35;
            v44 = 2114;
            v45 = *(double *)&v22;
            _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Has not recently seen: %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
          objc_msgSend(v22, "reset");
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v19);
  }

}

- (id)_parseAdvertisementData:(id)a3 forPeripheral:(id)a4 RSSI:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v18;
  char v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  HAPBLEPeripheral *v23;
  void *v24;
  HAPBLEPeripheral *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  HAPAccessoryServerBrowserWiProxBTLE *v37;
  NSObject *v38;
  void *v39;
  void *v41;
  void *v42;
  HAPAccessoryServerBrowserWiProxBTLE *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C97618]);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C97610]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBAdvDataDeviceAddress"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(objc_retainAutorelease(v14), "bytes");
    HardwareAddressToCString();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if ((unint64_t)objc_msgSend(v11, "length") >= 0x11)
  {
    v16 = *(unsigned __int8 *)(v12 + 2);
    if (v16 == 17 || v16 == 6)
    {
      v43 = self;
      v46 = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)*(unsigned __int8 *)(v12 + 3) >> 5);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v18;
      v19 = *(_BYTE *)(v12 + 3);
      if (objc_msgSend(v18, "unsignedShortValue") == 17
        && ((v19 & 0xE0) == 0x20 ? (v20 = (v19 & 0x1F) == 22) : (v20 = 0), v20))
      {
        HardwareAddressToCString();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12 + 10, objc_msgSend(v11, "length") - 10);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        v21 = 0;
        v49 = 0;
        v50 = 0;
        v22 = 0;
      }
      else
      {
        if (objc_msgSend(v18, "unsignedShortValue") == 6)
        {
          if ((unint64_t)objc_msgSend(v11, "length") < 0x11)
          {
            v23 = 0;
            v24 = &unk_1E8989638;
LABEL_41:

            goto LABEL_42;
          }
          if ((unint64_t)objc_msgSend(v11, "length") < 0x15)
            v21 = 0;
          else
            v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v12 + 17, 4);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_BYTE *)(v12 + 4) & 1);
          v22 = objc_claimAutoreleasedReturnValue();
          HardwareAddressToCString();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(unsigned __int16 *)(v12 + 11));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(v12 + 13));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(unsigned __int8 *)(v12 + 15));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(unsigned __int8 *)(v12 + 16));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0;
LABEL_23:
          v45 = v9;
          v41 = (void *)v21;
          v42 = (void *)v22;
          if (objc_msgSend(v24, "integerValue") == 2)
          {
            v25 = -[HAPBLEPeripheral initWithName:peripheralUUID:identifier:hapVersion:hkType:advInterval:statusFlags:category:stateNumber:configNumber:setupHash:encryptedPayload:whbStableIdentifier:advDeviceAddress:]([HAPBLEPeripheral alloc], "initWithName:peripheralUUID:identifier:hapVersion:hkType:advInterval:statusFlags:category:stateNumber:configNumber:setupHash:encryptedPayload:whbStableIdentifier:advDeviceAddress:", v13, v9, v51, v24, v53, v52, v22, v50, v49, v48, v21, v47, 0, v15, v21, v22);
            if (HAPIsHH2Enabled_onceToken != -1)
              dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
            if ((HAPIsHH2Enabled_hh2Enabled & 1) == 0)
            {
              -[HAPAccessoryServerBrowserWiProxBTLE delegate](v43, "delegate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_opt_respondsToSelector();

              if ((v27 & 1) != 0)
              {
                -[HAPAccessoryServerBrowserWiProxBTLE delegate](v43, "delegate");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "retrieveCBPeripheralWithUUID:blePeripheral:", v45, v25);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                v44 = v29;
                objc_msgSend(v29, "name");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "length");
                if (v31 > objc_msgSend(v13, "length") && v13 && objc_msgSend(v30, "hasPrefix:", v13))
                  -[HAPBLEPeripheral setName:](v25, "setName:", v30);
                -[HAPBLEPeripheral setCbPeripheral:](v25, "setCbPeripheral:", v44);

              }
            }
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCachedAdvertisement"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v33 = v32;
            else
              v33 = 0;
            v34 = v33;

            v35 = objc_msgSend(v34, "BOOLValue");
            -[HAPBLEPeripheral setIsCached:](v25, "setIsCached:", v35);
            -[HAPBLEPeripheral setAverageRSSI:](v25, "setAverageRSSI:", v10);
          }
          else
          {
            v36 = (void *)MEMORY[0x1D17B7244]();
            v37 = v43;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v55 = v39;
              v56 = 2114;
              v57 = v24;
              v58 = 2048;
              v59 = 2;
              v60 = 2112;
              v61 = v11;
              _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Dropping, incompatible protocol version: %{public}@, expected: %ld, adv: %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v36);
            v25 = 0;
            v10 = v46;
          }
          v23 = v25;

          v9 = v45;
          goto LABEL_41;
        }
        v21 = 0;
        v47 = 0;
        v48 = 0;
        v49 = 0;
        v50 = 0;
        v22 = 0;
        v51 = 0;
      }
      v24 = &unk_1E8989638;
      goto LABEL_23;
    }
  }
  v23 = 0;
  v24 = &unk_1E8989638;
LABEL_42:

  return v23;
}

- (void)homeKitDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerBrowserWiProxBTLE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HAPWiProxScanStateString(objc_msgSend(v4, "state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Changed power state to: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](v6, "wpHomeKit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "state");

  if (v11 == 3)
  {
    if (-[HAPAccessoryServerBrowserWiProxBTLE currentScanState](v6, "currentScanState") == 1)
      -[HAPAccessoryServerBrowserWiProxBTLE _startBrowsingForHAPBLEAccessories](v6, "_startBrowsingForHAPBLEAccessories");
    -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](v6, "trackedIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
      -[HAPAccessoryServerBrowserWiProxBTLE _startTrackingHAPBLEAccessoriesWithIdentifiers:restartScan:](v6, "_startTrackingHAPBLEAccessoriesWithIdentifiers:restartScan:", 0, 1);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[HAPAccessoryServerBrowserWiProxBTLE trackedPeripherals](v6, "trackedPeripherals", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "reset");
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
}

- (void)homeKit:(id)a3 foundDevice:(id)a4 withData:(id)a5 RSSI:(id)a6 type:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v13
    || objc_msgSend(v13, "integerValue") < -127
    || (v15 = objc_msgSend(v14, "integerValue"), v16 = v14, v15 >= 21))
  {
    v16 = &unk_1E8989620;
  }
  -[HAPAccessoryServerBrowserWiProxBTLE homeKit:foundDevice:withData:RSSI:](self, "homeKit:foundDevice:withData:RSSI:", v17, v11, v12, v16);

}

- (void)homeKit:(id)a3 foundDevice:(id)a4 withData:(id)a5 RSSI:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  HAPAccessoryServerBrowserWiProxBTLE *v21;
  NSObject *v22;
  void *v23;
  void *context;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HAPAccessoryServerBrowserWiProxBTLE _parseAdvertisementData:forPeripheral:RSSI:](self, "_parseAdvertisementData:forPeripheral:RSSI:", v12, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[HAPAccessoryServerBrowserWiProxBTLE trackedIdentifiers](self, "trackedIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "containsObject:", v16);

    if (v17)
    {
      objc_msgSend(v14, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserWiProxBTLE trackedPeripheralWithIdentifier:](self, "trackedPeripheralWithIdentifier:", v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if (!objc_msgSend(v19, "updateWithPeripheral:", v14))
        {

          goto LABEL_12;
        }
      }
      else
      {
        v19 = v14;
        objc_msgSend(v19, "encryptedPayload");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          os_unfair_lock_lock_with_options();
          -[NSMutableSet addObject:](self->_trackedPeripherals, "addObject:", v19);
          os_unfair_lock_unlock(&self->_lock);
        }
      }
      context = (void *)MEMORY[0x1D17B7244]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v23;
        v27 = 2114;
        v28 = v14;
        _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Reporting tracked peripheral: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);

    }
    -[HAPAccessoryServerBrowserWiProxBTLE _reportHAPPeripheral:](self, "_reportHAPPeripheral:", v14);
  }
LABEL_12:

}

- (void)homeKitStartedScanning:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerBrowserWiProxBTLE *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Started Scanning", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)homeKitStoppedScanning:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerBrowserWiProxBTLE *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Stopped Scanning", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)homeKit:(id)a3 failedToStartScanningWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HAPAccessoryServerBrowserWiProxBTLE *v9;
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
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Failed to start scanning with error: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)_removeTrackedPeripheral:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
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
  v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[HAPAccessoryServerBrowserWiProxBTLE _lock_trackedPeripheralWithIdentifier:](self, "_lock_trackedPeripheralWithIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);
        -[NSMutableSet removeObject:](self->_trackedIdentifiers, "removeObject:", v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        -[NSMutableSet removeObject:](self->_trackedPeripherals, "removeObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_reportHAPPeripheral:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HAPAccessoryServerBrowserWiProxBTLE workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HAPAccessoryServerBrowserWiProxBTLE delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "accessoryServerBrowserBTLE:didDiscoverHAPPeripheral:", self, v6);

  -[HAPAccessoryServerBrowserWiProxBTLE _reportReachabilityForHAPPeripheral:](self, "_reportReachabilityForHAPPeripheral:", v7);
}

- (void)_reportReachabilityForHAPPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[HAPAccessoryServerBrowserWiProxBTLE reachabilityScanTuples](self, "reachabilityScanTuples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPAccessoryServerBrowserWiProxBTLE reachabilityScanTuples](self, "reachabilityScanTuples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

  objc_msgSend(v7, "completion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__HAPAccessoryServerBrowserWiProxBTLE__reportReachabilityForHAPPeripheral___block_invoke;
    v12[3] = &unk_1E894E0F8;
    v13 = v7;
    v14 = v4;
    dispatch_async(v11, v12);

  }
}

- (id)logIdentifier
{
  void *v3;
  int v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  int64_t v9;
  int64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HAPAccessoryServerBrowserWiProxBTLE routeMode](self, "routeMode");
  v5 = CFSTR("Local");
  v6 = CFSTR("-");
  v7 = CFSTR("WHBS");
  if ((v4 & 2) == 0)
    v7 = CFSTR("WHB");
  if ((v4 & 1) != 0)
    v6 = v7;
  if (v4)
    v5 = (__CFString *)v6;
  v8 = v5;
  v9 = -[HAPAccessoryServerBrowserWiProxBTLE currentScanState](self, "currentScanState");
  if (v9)
  {
    v10 = v9;
    if (v9 == 1)
    {
      v11 = CFSTR("BROWSE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = CFSTR("IDLE");
  }
  -[HAPAccessoryServerBrowserWiProxBTLE wpHomeKit](self, "wpHomeKit", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HAPWiProxScanStateString(objc_msgSend(v13, "state"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HAPAccessoryServerBrowserWiProxBTLE currentScanType](self, "currentScanType");
  if (v15 > 2)
    v16 = CFSTR("N");
  else
    v16 = off_1E894CEE8[v15];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HAPWiProxBLE-%@ %@(%@-%@)"), v8, v11, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HAPAccessoryServerBrowserWiProxBTLEDelegate)delegate
{
  return (HAPAccessoryServerBrowserWiProxBTLEDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (WPHomeKit)wpHomeKit
{
  return self->_wpHomeKit;
}

- (int64_t)currentScanState
{
  return self->_currentScanState;
}

- (void)setCurrentScanState:(int64_t)a3
{
  self->_currentScanState = a3;
}

- (int64_t)currentScanType
{
  return self->_currentScanType;
}

- (void)setCurrentScanType:(int64_t)a3
{
  self->_currentScanType = a3;
}

- (NSMapTable)reachabilityScanTuples
{
  return (NSMapTable *)objc_loadWeakRetained((id *)&self->_reachabilityScanTuples);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reachabilityScanTuples);
  objc_storeStrong((id *)&self->_wpHomeKit, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_trackedIdentifiers, 0);
  objc_storeStrong((id *)&self->_trackedPeripherals, 0);
}

void __75__HAPAccessoryServerBrowserWiProxBTLE__reportReachabilityForHAPPeripheral___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v3 = (void (**)(id, void *, uint64_t))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, 1);

}

uint64_t __92__HAPAccessoryServerBrowserWiProxBTLE_probeReachabilityForTrackedAccessoriesWithScanTuples___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_probeReachabilityForTrackedAccessories");
}

void __76__HAPAccessoryServerBrowserWiProxBTLE_updateStateForIdentifier_stateNumber___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "trackedPeripheralWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStateNumber:", *(_QWORD *)(a1 + 48));

}

void __74__HAPAccessoryServerBrowserWiProxBTLE_resetLastSeenForTrackedAccessories___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "trackedPeripheralForIdentifier:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");

}

uint64_t __84__HAPAccessoryServerBrowserWiProxBTLE_stopTrackingHAPBLEAccessoriesWithIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopTrackingHAPBLEAccessoriesWithIdentifiers:", *(_QWORD *)(a1 + 40));
}

uint64_t __85__HAPAccessoryServerBrowserWiProxBTLE_startTrackingHAPBLEAccessoriesWithIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startTrackingHAPBLEAccessoriesWithIdentifiers:restartScan:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __72__HAPAccessoryServerBrowserWiProxBTLE_stopBrowsingForHAPBLEAccessories___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopBrowsingForHAPBLEAccessories:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __72__HAPAccessoryServerBrowserWiProxBTLE_startBrowsingForHAPBLEAccessories__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startBrowsingForHAPBLEAccessories");
}

uint64_t __49__HAPAccessoryServerBrowserWiProxBTLE_pauseScans__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopScanning");
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentScanState:", 0);
}

void __51__HAPAccessoryServerBrowserWiProxBTLE_restartScans__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "wpHomeKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  if (v3 == 3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "currentScanType");
    objc_msgSend(*(id *)(a1 + 32), "_stopScanning");
    objc_msgSend(*(id *)(a1 + 32), "_startScanningWithScanType:", v4);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t46 != -1)
    dispatch_once(&logCategory__hmf_once_t46, &__block_literal_global_19270);
  return (id)logCategory__hmf_once_v47;
}

void __50__HAPAccessoryServerBrowserWiProxBTLE_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v47;
  logCategory__hmf_once_v47 = v0;

}

@end
