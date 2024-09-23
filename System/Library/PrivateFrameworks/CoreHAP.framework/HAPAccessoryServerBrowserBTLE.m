@implementation HAPAccessoryServerBrowserBTLE

- (void)retrieveCurrentStateForIdentifier:(id)a3 stateNumber:(id *)a4 isReachable:(BOOL *)a5 linkQuality:(unint64_t *)a6 lastSeen:(id *)a7
{
  id v12;
  id v13;

  v12 = a3;
  -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](self, "hapWiProxBLEBrowser");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "retrieveStateForTrackedAccessoryWithIdentifier:stateNumber:isReachable:linkQuality:lastSeen:", v12, a4, a5, a6, a7);

}

- (HAPAccessoryServerBrowserWiProxBTLE)hapWiProxBLEBrowser
{
  os_unfair_lock_s *p_lock;
  HAPAccessoryServerBrowserWiProxBTLE *hapWiProxBLEBrowser;
  HAPAccessoryServerBrowserWiProxBTLE *v5;
  void *v6;
  HAPAccessoryServerBrowserWiProxBTLE *v7;
  HAPAccessoryServerBrowserWiProxBTLE *v8;
  HAPAccessoryServerBrowserWiProxBTLE *v9;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  hapWiProxBLEBrowser = self->_hapWiProxBLEBrowser;
  if (!hapWiProxBLEBrowser)
  {
    v5 = [HAPAccessoryServerBrowserWiProxBTLE alloc];
    -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HAPAccessoryServerBrowserWiProxBTLE initWithDelegate:queue:](v5, "initWithDelegate:queue:", self, v6);
    v8 = self->_hapWiProxBLEBrowser;
    self->_hapWiProxBLEBrowser = v7;

    hapWiProxBLEBrowser = self->_hapWiProxBLEBrowser;
  }
  v9 = hapWiProxBLEBrowser;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)connectToBTLEAccessoryServer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPAccessoryServerBrowserBTLE *v9;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HAPAccessoryServerBrowserBTLE_connectToBTLEAccessoryServer___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)disconnectFromBTLEAccessoryServer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPAccessoryServerBrowserBTLE *v9;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (unint64_t)_parseAdvertisementData:(id)a3 forPeripheral:(id)a4 name:(id *)a5 pairingUsername:(id *)a6 statusFlags:(id *)a7 stateNumber:(id *)a8 category:(id *)a9 configNumber:(id *)a10 setupHash:(id *)a11
{
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  _BYTE v32[18];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0C97610]);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");
  v20 = -[__CFString length](v17, "length");

  if (v19 > v20)
  {
    objc_msgSend(v16, "name");
    v21 = objc_claimAutoreleasedReturnValue();

    v17 = (__CFString *)v21;
  }
  if (!v17)
    v17 = CFSTR("Unknown");
  if (a5)
    *a5 = objc_retainAutorelease(v17);
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0C97620]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED4"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "length") == 9)
  {
    v25 = objc_retainAutorelease(v24);
    objc_msgSend(v25, "bytes");
    HardwareAddressToCString();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a6)
      *a6 = objc_retainAutorelease(v26);
    v28 = objc_msgSend(objc_retainAutorelease(v25), "bytes");
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned __int8 *)(v28 + 8));
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a9)
    {
      if (*(_WORD *)(v28 + 6))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v29 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = &unk_1E8989548;
      }
      *a9 = v29;
    }

    v30 = 1;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)setConnectionLatency:(int64_t)a3 forPeripheral:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  HAPAccessoryServerBrowserBTLE *v11;
  int64_t v12;

  v6 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HAPAccessoryServerBrowserBTLE_setConnectionLatency_forPeripheral___block_invoke;
  block[3] = &unk_1E894B6C0;
  v11 = self;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (id)cachedAccessoryForIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[5];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6128;
  v19 = __Block_byref_object_dispose__6129;
  v20 = 0;
  -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__HAPAccessoryServerBrowserBTLE_cachedAccessoryForIdentifier___block_invoke;
    v12[3] = &unk_1E894A768;
    v14 = &v15;
    v12[4] = self;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "accessoryServerBrowser:getCacheForAccessoryWithIdentifier:withCompletion:", self, v4, v12);

    dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)removeCachedAccessoryWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryServerBrowser:removeCacheForAccessoryWithIdentifier:", self, v4);

}

- (void)saveCacheToDisk:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HAPAccessoryServerBrowserBTLE *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (v5)
  {
    -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessoryServerBrowser:saveCache:serverIdentifier:", self, v5, v8);

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pairingIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create BLE cache archive for %{public}@ with error: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)updateBroadcastKeyForIdentifier:(id)a3 key:(id)a4 keyUpdatedStateNumber:(id)a5 keyUpdatedTime:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  double v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__HAPAccessoryServerBrowserBTLE_updateBroadcastKeyForIdentifier_key_keyUpdatedStateNumber_keyUpdatedTime___block_invoke;
  v17[3] = &unk_1E894A790;
  v17[4] = self;
  v18 = v10;
  v19 = v12;
  v20 = v11;
  v21 = a6;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  objc_msgSend(v13, "accessoryServerBrowser:getCacheForAccessoryWithIdentifier:withCompletion:", self, v16, v17);

}

- (void)updateCachedStateForIdentifier:(id)a3 stateNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HAPAccessoryServerBrowserBTLE *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[HAPAccessoryServerBrowserBTLE cachedAccessoryForIdentifier:](self, "cachedAccessoryForIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "peripheralInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stateNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = HAPCompareStateNumberWithRollover(v11, v7, 0xFFuLL);

      if (v12 == -1)
      {
        v13 = (void *)MEMORY[0x1D17B7244]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "pairingIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "peripheralInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stateNumber");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138544130;
          v22 = v16;
          v23 = 2114;
          v24 = v17;
          v25 = 2114;
          v26 = v19;
          v27 = 2114;
          v28 = v7;
          _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating cached s# for: %{public}@ from %{public}@ to %{public}@", (uint8_t *)&v21, 0x2Au);

        }
        objc_autoreleasePoolPop(v13);
        objc_msgSend(v9, "peripheralInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "updateStateNumber:", v7);

        -[HAPAccessoryServerBrowserBTLE saveCacheToDisk:](v14, "saveCacheToDisk:", v9);
      }
    }

  }
}

- (void)setPerformingGeneralScan:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_performingGeneralScan = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isPerformingGeneralScan
{
  HAPAccessoryServerBrowserBTLE *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_performingGeneralScan;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HAPAccessoryServerBrowserBTLE)initWithQueue:(id)a3
{
  HAPAccessoryServerBrowserBTLE *v3;
  uint64_t v4;
  NSMapTable *discoveredPeripheralsWithAccessories;
  uint64_t v6;
  NSMapTable *recentlySeenPairedPeripherals;
  uint64_t v8;
  NSMutableArray *powerOnCentralManagerCompletions;
  uint64_t v10;
  NSMutableOrderedSet *peripheralsWithConnectionRequests;
  uint64_t v12;
  NSMutableOrderedSet *peripheralsPendingConnection;
  uint64_t v14;
  NSMutableArray *targetedScanAccessoryIdentifiers;
  uint64_t v16;
  NSMapTable *identifiersWithReachabilityScanTuples;
  uint64_t v18;
  NSMapTable *peripheralDisconnectionMonitorMap;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HAPAccessoryServerBrowserBTLE;
  v3 = -[HAPAccessoryServerBrowser initWithQueue:](&v21, sel_initWithQueue_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    discoveredPeripheralsWithAccessories = v3->_discoveredPeripheralsWithAccessories;
    v3->_discoveredPeripheralsWithAccessories = (NSMapTable *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    recentlySeenPairedPeripherals = v3->_recentlySeenPairedPeripherals;
    v3->_recentlySeenPairedPeripherals = (NSMapTable *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    powerOnCentralManagerCompletions = v3->_powerOnCentralManagerCompletions;
    v3->_powerOnCentralManagerCompletions = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v10 = objc_claimAutoreleasedReturnValue();
    peripheralsWithConnectionRequests = v3->_peripheralsWithConnectionRequests;
    v3->_peripheralsWithConnectionRequests = (NSMutableOrderedSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v12 = objc_claimAutoreleasedReturnValue();
    peripheralsPendingConnection = v3->_peripheralsPendingConnection;
    v3->_peripheralsPendingConnection = (NSMutableOrderedSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    targetedScanAccessoryIdentifiers = v3->_targetedScanAccessoryIdentifiers;
    v3->_targetedScanAccessoryIdentifiers = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    identifiersWithReachabilityScanTuples = v3->_identifiersWithReachabilityScanTuples;
    v3->_identifiersWithReachabilityScanTuples = (NSMapTable *)v16;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    peripheralDisconnectionMonitorMap = v3->_peripheralDisconnectionMonitorMap;
    v3->_peripheralDisconnectionMonitorMap = (NSMapTable *)v18;

    v3->_peripheralDisconnectionTimeout = 10;
    v3->_scanState = 0;
    v3->_qosLimits = 0;
  }
  return v3;
}

- (int64_t)linkType
{
  return 2;
}

- (void)setDelegate:(id)a3 queue:(id)a4
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HAPAccessoryServerBrowserBTLE_setDelegate_queue___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)_canStartScan
{
  void *v3;
  char v4;

  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if (HAPIsHH2Enabled_hh2Enabled != 1)
    return 1;
  -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isServerLinkTypeBrowseable:", 2);

  return v4;
}

- (int64_t)scanState
{
  os_unfair_lock_s *p_lock;
  int64_t scanState;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  scanState = self->_scanState;
  os_unfair_lock_unlock(p_lock);
  return scanState;
}

- (void)setScanState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_scanState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)startDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HAPAccessoryServerBrowserBTLE_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_startDiscoveringAccessoryServers
{
  void *v3;
  _QWORD v4[5];

  -[HAPAccessoryServerBrowserBTLE setPerformingGeneralScan:](self, "setPerformingGeneralScan:", 1);
  -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](self, "hapWiProxBLEBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startBrowsingForHAPBLEAccessories");

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HAPAccessoryServerBrowserBTLE__startDiscoveringAccessoryServers__block_invoke;
  v4[3] = &unk_1E894DD58;
  v4[4] = self;
  -[HAPAccessoryServerBrowserBTLE _powerOnCentralManagerWithCompletion:](self, "_powerOnCentralManagerWithCompletion:", v4);
}

- (void)stopDiscoveringAccessoryServers
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HAPAccessoryServerBrowserBTLE_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)updateRemoteBrowsing:(BOOL)a3 shouldScan:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  void *v8;
  HAPAccessoryServerBrowserBTLE *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](self, "hapWiProxBLEBrowser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "routeMode");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v12 = CFSTR("WHB");
      else
        v12 = CFSTR("LOCAL");
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting BTLE discovery to '%{public}@'. WHB Scan: %{public}@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](v9, "hapWiProxBLEBrowser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRouteMode:", 0);

    -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](v9, "hapWiProxBLEBrowser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "restartScans");

  }
}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__HAPAccessoryServerBrowserBTLE_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E894D6D0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  HAPAccessoryServerBrowserBTLE *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  if (v10)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "accessoryServer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "matchesSetupID:serverIdentifier:", v8, v9))
          break;

        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HAPAccessoryServerBrowser isPaired:](self, "isPaired:", v18);

      v20 = objc_msgSend(v17, "hasPairings");
      v21 = v20;
      if (!v19 && !(_DWORD)v20)
        goto LABEL_13;
      v23 = (void *)MEMORY[0x1D17B7244]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v34 = v28;
        v35 = 2114;
        v36 = v17;
        v37 = 2114;
        v38 = v8;
        v39 = 2114;
        v40 = v26;
        v41 = 2114;
        v42 = v27;
        _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_INFO, "%{public}@BTLE Accessory server %{public}@ matches setupID %{public}@ and is paired/hasPairings: (%{public}@/%{public}@)", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v23);
      v22 = 1;
    }
    else
    {
LABEL_10:
      v17 = 0;
LABEL_13:
      v22 = 0;
    }

    v10[2](v10, v22, v17);
  }

}

- (void)pauseScans
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HAPAccessoryServerBrowserBTLE_pauseScans__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)remoteBrowsingEnabled
{
  void *v2;
  BOOL v3;

  -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](self, "hapWiProxBLEBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeMode") & 1;

  return v3;
}

- (BOOL)remoteBrowsingAndScanEnabled
{
  void *v2;
  BOOL v3;

  -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](self, "hapWiProxBLEBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (~objc_msgSend(v2, "routeMode") & 3) == 0;

  return v3;
}

- (void)_stopActiveScanWithForce:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HAPAccessoryServerBrowserBTLE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD block[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  if (-[HAPAccessoryServerBrowserBTLE scanState](self, "scanState")
    || -[HAPAccessoryServerBrowserBTLE remoteBrowsingEnabled](self, "remoteBrowsingEnabled"))
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v8;
      v45 = 2048;
      v46 = -[HAPAccessoryServerBrowserBTLE scanState](v6, "scanState");
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping scans: Scan State: %tu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HAPAccessoryServerBrowserBTLE centralManager](v6, "centralManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopScan");

    -[HAPAccessoryServerBrowserBTLE setScanState:](v6, "setScanState:", 0);
  }
  -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](self, "hapWiProxBLEBrowser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopBrowsingForHAPBLEAccessories:", v3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](self, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "accessoryServer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[HAPAccessoryServerBrowser isPaired:](self, "isPaired:", v21);

          if (!v22)
          {
            objc_msgSend(v11, "addObject:", v18);
            if (-[HAPAccessoryServerBrowserBTLE _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didRemoveAccessoryServer_error_))
            {
              -[HAPAccessoryServerBrowserBTLE delegateQueue](self, "delegateQueue");
              v23 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __58__HAPAccessoryServerBrowserBTLE__stopActiveScanWithForce___block_invoke;
              block[3] = &unk_1E894E0F8;
              block[4] = self;
              v36 = v20;
              dispatch_async(v23, block);

            }
          }
        }
        else
        {
          objc_msgSend(v11, "addObject:", v18);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v15);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = v11;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeObjectForKey:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v26);
  }

}

- (void)_startBrowsingForLegacyHAPBTLE100Accessories
{
  void *v3;
  void *v4;
  HAPAccessoryServerBrowserBTLE *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerBrowserBTLE centralManager](self, "centralManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopScan");

  v4 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServerBrowserBTLE setScanState:](self, "setScanState:", 1));
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting scan for HomeKit 1.0 accessories...", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED4"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBrowserBTLE centralManager](v5, "centralManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C97658];
  v16[0] = *MEMORY[0x1E0C97690];
  v16[1] = v11;
  v12 = *MEMORY[0x1E0C97668];
  v16[2] = *MEMORY[0x1E0C97650];
  v16[3] = v12;
  v17[0] = MEMORY[0x1E0C9AAB0];
  v17[1] = MEMORY[0x1E0C9AAB0];
  v17[2] = MEMORY[0x1E0C9AAB0];
  v17[3] = &unk_1E8989560;
  v16[4] = *MEMORY[0x1E0C97660];
  v17[4] = &unk_1E8989578;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scanForPeripheralsWithServices:options:", v10, v13);

  if (-[HAPAccessoryServerBrowserBTLE _delegateRespondsToSelector:](v5, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStartDiscoveringWithError_))
  {
    -[HAPAccessoryServerBrowserBTLE delegateQueue](v5, "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__HAPAccessoryServerBrowserBTLE__startBrowsingForLegacyHAPBTLE100Accessories__block_invoke;
    v15[3] = &unk_1E894DD08;
    v15[4] = v5;
    dispatch_async(v14, v15);

  }
}

- (BOOL)_hasPairedAccessoriesOfType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](self, "recentlySeenPairedPeripherals", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "advertisementFormat") == a3)
        {
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[HAPAccessoryServerBrowser isPaired:](self, "isPaired:", v12);

          if (v13)
          {
            v14 = 1;
            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)_hasRecentlySeenAccessoriesWithIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](self, "recentlySeenPairedPeripherals", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = objc_msgSend(v4, "isSubsetOfSet:", v5);
  return v13;
}

- (void)_startScanningForReachability:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  HAPAccessoryServerBrowserBTLE *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HAPAccessoryServerBrowserBTLE *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HAPAccessoryServerBrowserBTLE *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HAPAccessoryServerBrowserBTLE _hasRecentlySeenAccessoriesWithIdentifiers:](self, "_hasRecentlySeenAccessoriesWithIdentifiers:", v4))
  {
    v5 = -[HAPAccessoryServerBrowserBTLE _hasPairedAccessoriesOfType:](self, "_hasPairedAccessoriesOfType:", 1);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Not all accessories are in recently seen", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 1;
  }
  if (-[HAPAccessoryServerBrowserBTLE scanState](self, "scanState") || !v5)
  {
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[HAPAccessoryServerBrowserBTLE scanState](v22, "scanState");
      HMFBooleanToString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v24;
      v31 = 2048;
      v32 = v25;
      v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%{public}@Skip 1.0 reachability: Scan State: %tu, 1.0 Accessories: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
  }
  else
  {
    -[HAPAccessoryServerBrowserBTLE centralManager](self, "centralManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopScan");

    v11 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServerBrowserBTLE setScanState:](self, "setScanState:", 2));
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting scan for 1.0 reachability", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FED4"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE centralManager](v12, "centralManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0C97658];
    v35[0] = *MEMORY[0x1E0C97690];
    v35[1] = v18;
    v19 = *MEMORY[0x1E0C97668];
    v35[2] = *MEMORY[0x1E0C97650];
    v35[3] = v19;
    v36[0] = MEMORY[0x1E0C9AAB0];
    v36[1] = MEMORY[0x1E0C9AAA0];
    v36[2] = MEMORY[0x1E0C9AAA0];
    v36[3] = &unk_1E8989560;
    v35[4] = *MEMORY[0x1E0C97660];
    v36[4] = &unk_1E8989578;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scanForPeripheralsWithServices:options:", v17, v20);

  }
  if (-[HAPAccessoryServerBrowserBTLE _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStartDiscoveringWithError_))
  {
    -[HAPAccessoryServerBrowserBTLE delegateQueue](self, "delegateQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__HAPAccessoryServerBrowserBTLE__startScanningForReachability___block_invoke;
    block[3] = &unk_1E894DD08;
    block[4] = self;
    dispatch_async(v27, block);

  }
}

- (void)_powerOnCentralManagerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  CBConnectionsObserver *v16;
  void *v17;
  void *v18;
  CBConnectionsObserver *v19;
  id v20;
  void *v21;
  HAPAccessoryServerBrowserBTLE *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  HAPAccessoryServerBrowserBTLE *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAPAccessoryServerBrowserBTLE centralManager](self, "centralManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HAPAccessoryServerBrowserBTLE centralManager](self, "centralManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    switch(v8)
    {
      case 2uLL:
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v29 = CFSTR("Failed to power on Bluetooth because Bluetooth LE is unsupported on this system.");
        v30 = 48;
        break;
      case 4uLL:
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v29 = CFSTR("Failed to power on Bluetooth because the Bluetooth is turned off in Settings.");
        v30 = 57;
        break;
      case 5uLL:
        v9 = MEMORY[0x1D17B7400](v4);
        v10 = (void *)v9;
        if (v9)
          (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
        goto LABEL_24;
      default:
        v33 = (void *)MEMORY[0x1D17B7244]();
        v34 = self;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = (void *)v36;
          if (v8 > 5)
            v38 = CFSTR("Unenumerated State?");
          else
            v38 = off_1E894A898[v8];
          *(_DWORD *)buf = 138543874;
          v42 = v36;
          v43 = 2048;
          v44 = v8;
          v45 = 2112;
          v46 = v38;
          _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_INFO, "%{public}@Central Manager has state %ld (%@), adding block to be called when the state is updated.", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v33);
        -[HAPAccessoryServerBrowserBTLE powerOnCentralManagerCompletions](v34, "powerOnCentralManagerCompletions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1D17B7400](v4);
        objc_msgSend(v10, "addObject:", v32);
LABEL_23:

LABEL_24:
        goto LABEL_25;
    }
    objc_msgSend(v28, "errorWithHMErrorCode:reason:underlyingError:", v30, v29, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x1D17B7400](v4);
    v32 = (void *)v31;
    if (v31)
      (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v10);
    goto LABEL_23;
  }
  -[HAPAccessoryServerBrowserBTLE powerOnCentralManagerCompletions](self, "powerOnCentralManagerCompletions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1D17B7400](v4);
  objc_msgSend(v11, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x1E0C97728]);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithDelegate:queue:", self, v14);
  -[HAPAccessoryServerBrowserBTLE setCentralManager:](self, "setCentralManager:", v15);

  v16 = [CBConnectionsObserver alloc];
  -[HAPAccessoryServerBrowserBTLE centralManager](self, "centralManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v19 = -[CBConnectionsObserver initWithCentralManager:Queue:Error:](v16, "initWithCentralManager:Queue:Error:", v17, v18, &v40);
  v20 = v40;
  -[HAPAccessoryServerBrowserBTLE setConnectionsObserver:](self, "setConnectionsObserver:", v19);

  if (v20)
  {
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = (uint64_t)v24;
      v43 = 2114;
      v44 = (unint64_t)v20;
      _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Connections Observer failed to initialize, error (%{public}@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    -[HAPAccessoryServerBrowserBTLE connectionsObserver](v22, "connectionsObserver");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[HAPAccessoryServerBrowserBTLE connectionsObserver](v22, "connectionsObserver");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v20;
      objc_msgSend(v26, "cleanupWithError:", &v39);
      v27 = v39;

      -[HAPAccessoryServerBrowserBTLE setConnectionsObserver:](v22, "setConnectionsObserver:", 0);
      v20 = v27;
    }
  }

LABEL_25:
}

- (void)_callPowerOnCompletionsWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HAPAccessoryServerBrowserBTLE powerOnCentralManagerCompletions](self, "powerOnCentralManagerCompletions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        v11 = MEMORY[0x1D17B7400](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v12 = (void *)v11;
        if (v11)
          (*(void (**)(uint64_t, id))(v11 + 16))(v11, v4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[HAPAccessoryServerBrowserBTLE powerOnCentralManagerCompletions](self, "powerOnCentralManagerCompletions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HAPAccessoryServerBrowserBTLE_discoverAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__HAPAccessoryServerBrowserBTLE__discoverAccessoryServerWithIdentifier___block_invoke;
  v6[3] = &unk_1E894DB00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HAPAccessoryServerBrowserBTLE _powerOnCentralManagerWithCompletion:](self, "_powerOnCentralManagerWithCompletion:", v6);

}

- (void)setReachabilityCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HAPAccessoryServerBrowserBTLE_setReachabilityCompletionHandler___block_invoke;
  v7[3] = &unk_1E894D5E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)probeReachabilityForAccessoryServersWithIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __110__HAPAccessoryServerBrowserBTLE_probeReachabilityForAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke;
  v13[3] = &unk_1E894CF58;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_probeReachabilityForAccessoryServersWithIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __111__HAPAccessoryServerBrowserBTLE__probeReachabilityForAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke;
  v12[3] = &unk_1E894C078;
  v13 = v8;
  v14 = v9;
  v12[4] = self;
  v15 = a4;
  v10 = v8;
  v11 = v9;
  -[HAPAccessoryServerBrowserBTLE _powerOnCentralManagerWithCompletion:](self, "_powerOnCentralManagerWithCompletion:", v12);

}

- (void)resetLastSeenForAccessoryServersWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPAccessoryServerBrowserBTLE *v9;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HAPAccessoryServerBrowserBTLE_resetLastSeenForAccessoryServersWithIdentifiers___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)configureAccessoryWithIdentifier:(id)a3 trackState:(BOOL)a4 connectionPriority:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v8 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__HAPAccessoryServerBrowserBTLE_configureAccessoryWithIdentifier_trackState_connectionPriority___block_invoke;
  v11[3] = &unk_1E894A7B8;
  v11[4] = self;
  v12 = v8;
  v14 = a4;
  v13 = a5;
  v10 = v8;
  dispatch_async(v9, v11);

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
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HAPAccessoryServerBrowserBTLE_updateStateForIdentifier_stateNumber___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)stopTrackingBTLEAccessoriesWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HAPAccessoryServerBrowserBTLE_stopTrackingBTLEAccessoriesWithIdentifiers___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateScanInBackground:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HAPAccessoryServerBrowserBTLE_updateScanInBackground___block_invoke;
  v6[3] = &unk_1E894D770;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)configureBTLEQoSLimits:(unint64_t)a3
{
  void *v5;
  HAPAccessoryServerBrowserBTLE *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17B7244](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring browser for qosLimits: %tu", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerBrowserBTLE setQosLimits:](v6, "setQosLimits:", a3);
}

- (void)setQosLimits:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_qosLimits = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)qosLimits
{
  unint64_t qosLimits;
  os_unfair_lock_s *p_lock;

  if (-[HAPAccessoryServerBrowserBTLE remoteBrowsingAndScanEnabled](self, "remoteBrowsingAndScanEnabled"))
    return 2;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  qosLimits = self->_qosLimits;
  os_unfair_lock_unlock(p_lock);
  return qosLimits;
}

- (void)markNotifyingCharacteristicUpdatedForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HAPAccessoryServerBrowserBTLE_markNotifyingCharacteristicUpdatedForIdentifier___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)deRegisterAccessoryWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPAccessoryServerBrowserBTLE;
  -[HAPAccessoryServerBrowser deRegisterAccessoryWithIdentifier:](&v9, sel_deRegisterAccessoryWithIdentifier_, v4);
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HAPAccessoryServerBrowserBTLE_deRegisterAccessoryWithIdentifier___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)resetPairedAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HAPAccessoryServerBrowserBTLE_resetPairedAccessories__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_forgetPairedAccessoryWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HAPAccessoryServerBrowserBTLE *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HAPAccessoryServerBrowserBTLE *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  objc_super v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryServerBrowser:removeCacheForAccessoryWithIdentifier:", self, v4);

  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2114;
    v24 = v4;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Request to forget accessory with Id %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](v7, "hapWiProxBLEBrowser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopTrackingHAPBLEAccessoriesWithIdentifiers:", v11);

  -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](v7, "recentlySeenPairedPeripherals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Forgetting paired peripheral %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](v15, "recentlySeenPairedPeripherals");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", v4);

  }
  v19.receiver = v7;
  v19.super_class = (Class)HAPAccessoryServerBrowserBTLE;
  -[HAPAccessoryServerBrowser deRegisterAccessoryWithIdentifier:](&v19, sel_deRegisterAccessoryWithIdentifier_, v4);

}

- (id)_recentlySeenPairedPeripheralTupleWithPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](self, "recentlySeenPairedPeripherals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__HAPAccessoryServerBrowserBTLE__recentlySeenPairedPeripheralTupleWithPeripheral___block_invoke;
  v11[3] = &unk_1E894A7E0;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "hmf_objectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_removeIdentifiersForReachabilityScan
{
  uint64_t i;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  HAPAccessoryServerBrowserBTLE *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HAPAccessoryServerBrowserBTLE *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[4];
  id v27;
  BOOL v28;
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

  v38 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](self, "identifiersWithReachabilityScanTuples");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](self, "identifiersWithReachabilityScanTuples");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = (void *)MEMORY[0x1D17B7244]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v10;
          v35 = 2114;
          v36 = v11;
          _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Reachability scan timed out for %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        -[HAPAccessoryServerBrowserBTLE _blePeripheralForAccessoryServerIdentifier:](v8, "_blePeripheralForAccessoryServerIdentifier:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cbPeripheral");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "state");
        if (v14 == 2)
        {
          v15 = (void *)MEMORY[0x1D17B7244]();
          v16 = v8;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v34 = v18;
            v35 = 2114;
            v36 = v19;
            _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Marking accessory as we are connected to %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);
        }
        objc_msgSend(v6, "completion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v6, "queue");
          v21 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __70__HAPAccessoryServerBrowserBTLE__removeIdentifiersForReachabilityScan__block_invoke;
          block[3] = &unk_1E894D770;
          v27 = v6;
          v28 = v14 == 2;
          dispatch_async(v21, block);

        }
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v25);
  }

  -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](self, "identifiersWithReachabilityScanTuples");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeAllObjects");

}

- (void)_performTimedScanForIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5
{
  id v7;
  void *v8;
  HAPAccessoryServerBrowserBTLE *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  HAPAccessoryServerBrowserBTLE *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HAPAccessoryServerBrowserBTLE *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  id obj;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v39 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v41 = a5;
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v11;
    v49 = 2114;
    v50 = v12;
    v51 = 2114;
    v52 = v13;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to perform reachability scan for %{public}@ accessories. Force Scan: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v7;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1D17B7244]();
        v20 = v9;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v22;
          v49 = 2114;
          v50 = v18;
          _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Performing reachability scan for %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        -[HAPAccessoryServerBrowserBTLE _blePeripheralForAccessoryServerIdentifier:](v20, "_blePeripheralForAccessoryServerIdentifier:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "cbPeripheral");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v24, "state") == 2)
        {
          v25 = (void *)MEMORY[0x1D17B7244]();
          v26 = v20;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v48 = v28;
            v49 = 2114;
            v50 = v18;
            _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_INFO, "%{public}@Skipping reachability scan as we are connected to %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v25);
          v29 = MEMORY[0x1D17B7400](v41);
          v30 = (void *)v29;
          if (v29)
            (*(void (**)(uint64_t, void *, uint64_t))(v29 + 16))(v29, v18, 1);
        }
        else
        {
          -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](v20, "identifiersWithReachabilityScanTuples");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKey:", v18);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
          {
            -[HAPAccessoryServerBrowser workQueue](v20, "workQueue");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[HAPBTLEReachabilityScanTuple reachabilityScanTupleWithCompletion:workQueue:identifier:](HAPBTLEReachabilityScanTuple, "reachabilityScanTupleWithCompletion:workQueue:identifier:", v41, v32, v18);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](v20, "identifiersWithReachabilityScanTuples");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKey:", v30, v18);

            if (v39)
            {
              -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](v20, "hapWiProxBLEBrowser");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "resetLastSeenForTrackedAccessories:", v18);

            }
          }
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v15);
  }

  -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](v9, "identifiersWithReachabilityScanTuples");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36)
  {
    -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](v9, "hapWiProxBLEBrowser");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](v9, "identifiersWithReachabilityScanTuples");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "probeReachabilityForTrackedAccessoriesWithScanTuples:", v38);

    -[HAPAccessoryServerBrowserBTLE _updateTargetedScanTimer](v9, "_updateTargetedScanTimer");
  }

}

- (void)_notifyDelegatesOfRemovedAccessoryServer:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (-[HAPAccessoryServerBrowserBTLE _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didRemoveAccessoryServer_error_))
    {
      -[HAPAccessoryServerBrowserBTLE delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__HAPAccessoryServerBrowserBTLE__notifyDelegatesOfRemovedAccessoryServer_error___block_invoke;
      block[3] = &unk_1E894E120;
      block[4] = self;
      v11 = v6;
      v12 = v7;
      dispatch_async(v8, block);

    }
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE _removeDiscoveredPeripheralsWithIdentifier:](self, "_removeDiscoveredPeripheralsWithIdentifier:", v9);

  }
}

- (void)_removeDiscoveredPeripheralsWithIdentifier:(id)a3
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
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  HAPAccessoryServerBrowserBTLE *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *obj;
  uint64_t obja;
  id v30;
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
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](self, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessoryServer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v4))
        {

        }
        else
        {
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v4);

          if (!v16)
            goto LABEL_10;
        }
        objc_msgSend(v30, "addObject:", v11);
LABEL_10:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v8);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v31 = v30;
  v17 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    obja = 138543618;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v31);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories", obja);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeObjectForKey:", v21);

        v23 = (void *)MEMORY[0x1D17B7244]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "shortDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = obja;
          v41 = v26;
          v42 = 2114;
          v43 = v27;
          _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_INFO, "%{public}@Browser removed discovered peripheral: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
      }
      v18 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v18);
  }

}

- (id)_discoveredAccessoryServerTupleForBLEPeripheral:(id)a3 shouldMerge:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v6, "isEqual:", v14))
        {
          -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4)
            objc_msgSend(v14, "mergeWithPeripheral:", v6);
          goto LABEL_12;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (void)_didDiscoverPeripheral:(id)a3 accessoryName:(id)a4 pairingIdentifier:(id)a5 format:(unint64_t)a6 statusFlags:(id)a7 stateNumber:(id)a8 category:(id)a9 configNumber:(id)a10 setupHash:(id)a11 encryptedPayload:(id)a12 whbStableIdentifier:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  HAPAccessoryServerBrowserBTLE *v24;
  HAPAccessoryServerBrowserBTLE *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  HAPAccessoryServerBrowserBTLE *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  HAPAccessoryServerBrowserBTLE *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  unint64_t v71;
  void *v72;
  unint64_t v73;
  void *v74;
  HAPAccessoryServerBrowserBTLE *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  HAPAccessoryServerBrowserBTLE *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  HAPAccessoryServerBrowserBTLE *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  void *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  __int16 v107;
  _QWORD block[5];
  id v109;
  id v110;
  _QWORD v111[4];
  id v112;
  HAPAccessoryServerBrowserBTLE *v113;
  id v114;
  char v115;
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  id v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  id v125;
  __int16 v126;
  id v127;
  __int16 v128;
  unint64_t v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  void *v133;
  __int16 v134;
  id v135;
  __int16 v136;
  void *v137;
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v105 = a7;
  v21 = a8;
  v104 = a9;
  v22 = a10;
  v103 = a11;
  v106 = a12;
  v102 = a13;
  objc_msgSend(v18, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self;
  v25 = self;
  v26 = v21;
  -[HAPAccessoryServerBrowserBTLE _blePeripheralForAccessoryServerIdentifier:](v25, "_blePeripheralForAccessoryServerIdentifier:", v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    v28 = a6;
    objc_msgSend(v18, "cbPeripheral");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "state"))
    {

      goto LABEL_37;
    }
    objc_msgSend(v27, "cbPeripheral");
    v99 = v19;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "state");

    v19 = v99;
    if (v31)
      goto LABEL_37;
    v115 = 0;
    -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](v24, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v18, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v22;
    if (!v32)
    {
      v107 = 0;
      v47 = v105;
      if (v106
        || -[HAPAccessoryServerBrowserBTLE _shouldCreateHAPAccessoryServerWithIdentifier:statusFlags:stateNumber:category:configNumber:name:forPeripheral:advertisementFormat:setupHash:stateChanged:connectReason:](v24, "_shouldCreateHAPAccessoryServerWithIdentifier:statusFlags:stateNumber:category:configNumber:name:forPeripheral:advertisementFormat:setupHash:stateChanged:connectReason:", v20, v105, v26, v104, v22, v99, v18, a6, v103, (char *)&v107 + 1, &v107))
      {
        v48 = (void *)MEMORY[0x1D17B7244]();
        v49 = v24;
        HMFGetOSLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v92 = v48;
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "name");
          v91 = v49;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v107);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138545922;
          v117 = v51;
          v118 = 2112;
          v119 = v52;
          v120 = 2114;
          v121 = v20;
          v122 = 2114;
          v123 = v26;
          v124 = 2114;
          v125 = v104;
          v126 = 2114;
          v127 = v105;
          v128 = 2048;
          v129 = a6;
          v130 = 2114;
          v131 = v53;
          v132 = 2114;
          v133 = v54;
          v134 = 2114;
          v135 = v98;
          v136 = 2114;
          v137 = v55;
          _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_INFO, "%{public}@Discovered new accessory '%@/%{public}@/%{public}@' C: '%{public}@' SF: '%{public}@' V: '%tu' ENC: '%{public}@' ST: '%{public}@' C#: '%{public}@', CR: '%{public}@'", buf, 0x70u);

          v48 = v92;
          v49 = v91;

          v28 = a6;
          v47 = v105;

        }
        objc_autoreleasePoolPop(v48);
        objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "reportIncomingAdvertisementChange:accessoryCategory:", v20, v104);

        LOBYTE(v90) = HIBYTE(v107);
        v22 = v98;
        v19 = v99;
        LOBYTE(v89) = v107;
        -[HAPAccessoryServerBrowserBTLE _createHAPAccessoryAndNotifyDelegateWithPeripheral:name:pairingUsername:statusFlags:stateNumber:stateChanged:connectReason:configNumber:category:connectionIdleTime:format:setupHash:encryptedPayload:whbStableIdentifier:](v49, "_createHAPAccessoryAndNotifyDelegateWithPeripheral:name:pairingUsername:statusFlags:stateNumber:stateChanged:connectReason:configNumber:category:connectionIdleTime:format:setupHash:encryptedPayload:whbStableIdentifier:", v18, v99, v20, v47, v26, v89, v98, v104, v90, v28, v103, v106, v102);
        v32 = 0;
      }
      goto LABEL_36;
    }
    -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](v24, "recentlySeenPairedPeripherals");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "updateWithPeripheral:", v18);

    -[HAPAccessoryServerBrowserBTLE _reportReachabilityForAccessoryWithIdentifier:](v24, "_reportReachabilityForAccessoryWithIdentifier:", v20);
    v36 = -[HAPAccessoryServerBrowser isPaired:](v24, "isPaired:", v20);
    if (v106 && v36 && (objc_msgSend(v18, "isCached") & 1) == 0)
    {
      -[HAPAccessoryServerBrowserBTLE hapCharacteristicsForEncryptedPayload:identifier:shouldConnect:](v24, "hapCharacteristicsForEncryptedPayload:identifier:shouldConnect:", v106, v20, &v115);
      v37 = objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        v22 = v98;
        v19 = v99;
        if (v115
          && -[HAPAccessoryServerBrowserBTLE _delegateRespondsToSelector:](v24, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
        {
          -[HAPAccessoryServerBrowserBTLE delegateQueue](v24, "delegateQueue");
          v88 = objc_claimAutoreleasedReturnValue();
          v111[0] = MEMORY[0x1E0C809B0];
          v111[1] = 3221225472;
          v111[2] = __188__HAPAccessoryServerBrowserBTLE__didDiscoverPeripheral_accessoryName_pairingIdentifier_format_statusFlags_stateNumber_category_configNumber_setupHash_encryptedPayload_whbStableIdentifier___block_invoke;
          v111[3] = &unk_1E894E120;
          v112 = v32;
          v113 = v24;
          v114 = v26;
          dispatch_async(v88, v111);

          v22 = v98;
        }
        goto LABEL_36;
      }
      v38 = (void *)v37;
      -[HAPAccessoryServerBrowserBTLE delegate](v24, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "accessoryServer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "firstObject");
      v94 = v32;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stateNumber");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "accessoryServerBrowser:accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v24, v40, v38, v42, 1);

      v32 = v94;
      objc_msgSend(v38, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stateNumber");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserBTLE updateStateForIdentifier:stateNumber:](v24, "updateStateForIdentifier:stateNumber:", v20, v44);

    }
    objc_msgSend(v32, "accessoryServer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "identifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "isEqualToString:", v20))
    {

      v19 = v99;
    }
    else
    {
      objc_msgSend(v32, "accessoryServer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "identifier");
      v95 = v32;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[HAPAccessoryServerBrowser isPaired:](v24, "isPaired:", v58);

      v32 = v95;
      v19 = v99;
      if (!v59)
      {
        v81 = (void *)MEMORY[0x1D17B7244]();
        v82 = v24;
        HMFGetOSLogHandle();
        v83 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "accessoryServer");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "identifier");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v117 = v84;
          v118 = 2114;
          v119 = v86;
          v120 = 2114;
          v121 = v20;
          _os_log_impl(&dword_1CCE01000, v83, OS_LOG_TYPE_INFO, "%{public}@Unpaired Accessory updated its identifier from %{public}@ to %{public}@", buf, 0x20u);

          v32 = v95;
        }

        objc_autoreleasePoolPop(v81);
        objc_msgSend(v32, "accessoryServer");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessoryServerBrowserBTLE _notifyDelegatesOfRemovedAccessoryServer:error:](v82, "_notifyDelegatesOfRemovedAccessoryServer:error:", v87, 0);

        v22 = v98;
        v19 = v99;
        goto LABEL_36;
      }
    }
    objc_msgSend(v32, "setLastSeen:", CFAbsoluteTimeGetCurrent());
    objc_msgSend(v32, "accessoryServer");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v32, "accessoryServer");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "stateNumber");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "isEqualToNumber:", v26);

      v19 = v99;
      if ((v62 & 1) == 0)
      {
        v63 = (void *)MEMORY[0x1D17B7244]();
        v64 = v24;
        HMFGetOSLogHandle();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "shortDescription");
          v93 = v63;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "shortDescription");
          v96 = v32;
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v117 = v66;
          v118 = 2114;
          v119 = v67;
          v120 = 2114;
          v121 = v26;
          v122 = 2114;
          v123 = v68;
          _os_log_impl(&dword_1CCE01000, v65, OS_LOG_TYPE_INFO, "%{public}@Discovered accessory: %{public}@ updated State Number to %{public}@ for %{public}@", buf, 0x2Au);

          v32 = v96;
          v63 = v93;

          v19 = v99;
        }

        objc_autoreleasePoolPop(v63);
        objc_msgSend(v32, "accessoryServer");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setStateNumber:", v26);

        if (-[HAPAccessoryServerBrowserBTLE _delegateRespondsToSelector:](v64, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
        {
          -[HAPAccessoryServerBrowserBTLE delegateQueue](v64, "delegateQueue");
          v70 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __188__HAPAccessoryServerBrowserBTLE__didDiscoverPeripheral_accessoryName_pairingIdentifier_format_statusFlags_stateNumber_category_configNumber_setupHash_encryptedPayload_whbStableIdentifier___block_invoke_151;
          block[3] = &unk_1E894E120;
          block[4] = v64;
          v109 = v101;
          v110 = v26;
          dispatch_async(v70, block);

        }
      }
    }
    if (v19)
    {
      v71 = objc_msgSend(v19, "length");
      objc_msgSend(v101, "name");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "length");

      v19 = v99;
      if (v71 > v73)
      {
        v74 = (void *)MEMORY[0x1D17B7244]();
        v75 = v24;
        HMFGetOSLogHandle();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "identifier");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "name");
          v97 = v32;
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v117 = v77;
          v118 = 2114;
          v119 = v78;
          v120 = 2112;
          v121 = v79;
          v122 = 2112;
          v123 = v99;
          _os_log_impl(&dword_1CCE01000, v76, OS_LOG_TYPE_INFO, "%{public}@Discovered accessory: %{public}@ updated name from %@ to %@", buf, 0x2Au);

          v32 = v97;
          v19 = v99;
        }

        objc_autoreleasePoolPop(v74);
        objc_msgSend(v32, "accessoryServer");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "setName:", v19);

      }
    }
    if (v105)
      objc_msgSend(v101, "setHasPairings:", (objc_msgSend(v105, "unsignedCharValue") & 1) == 0);

    v22 = v98;
LABEL_36:

  }
LABEL_37:

}

- (void)centralManagerDidUpdateState:(id)a3
{
  unint64_t v4;
  void *v5;
  HAPAccessoryServerBrowserBTLE *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  HAPAccessoryServerBrowserBTLE *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  HAPAccessoryServerBrowserBTLE *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  HAPAccessoryServerBrowserBTLE *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  unint64_t v76;
  __int16 v77;
  const __CFString *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v4 = objc_msgSend(v54, "state");
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v4 > 5)
      v10 = CFSTR("Unenumerated State?");
    else
      v10 = off_1E894A8C8[v4];
    *(_DWORD *)buf = 138543874;
    v74 = v8;
    v75 = 2048;
    v76 = v4;
    v77 = 2112;
    v78 = v10;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Central manager changed state: %ld (%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  switch(v4)
  {
    case 1uLL:
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 57, CFSTR("Bluetooth was turned off or reset"), 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserBTLE _callPowerOnCompletionsWithError:](v6, "_callPowerOnCompletionsWithError:", v55);
      -[HAPAccessoryServerBrowserBTLE reachabilityCompletion](v6, "reachabilityCompletion");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v55);

      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      -[HAPAccessoryServerBrowser pairedAccessoryIdentifiers](v6, "pairedAccessoryIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");

      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v68 != v16)
              objc_enumerationMutation(v14);
            v18 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
            v19 = (void *)MEMORY[0x1D17B7244]();
            v20 = v6;
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v74 = (uint64_t)v22;
              _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Reporting reachability changed to NO for all paired BLE accessories on Bluetooth Power OFF", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v19);
            -[HAPAccessoryServerBrowserBTLE delegate](v20, "delegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "accessoryServerBrowser:didChangeReachability:forAccessoryServerWithIdentifier:", v20, 0, v18);

          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        }
        while (v15);
      }

      v24 = (void *)MEMORY[0x1E0C99D20];
      -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](v6, "discoveredPeripheralsWithAccessories");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "keyEnumerator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "allObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "arrayWithArray:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, v6);
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke;
      v65[3] = &unk_1E894A808;
      objc_copyWeak(&v66, (id *)buf);
      v29 = (void *)MEMORY[0x1D17B7400](v65);
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v30 = v28;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v62;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v62 != v32)
              objc_enumerationMutation(v30);
            v34 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
            -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](v6, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v34, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "accessoryServer");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              v56[0] = MEMORY[0x1E0C809B0];
              v56[1] = 3221225472;
              v56[2] = __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke_2;
              v56[3] = &unk_1E894A830;
              v56[4] = v6;
              v37 = v36;
              v57 = v37;
              v38 = v55;
              v58 = v38;
              v39 = v29;
              v59 = v34;
              v60 = v39;
              objc_msgSend(v37, "handleDisconnectionWithError:completionHandler:", v38, v56);

            }
            else
            {
              v40 = MEMORY[0x1D17B7400](v29);
              v41 = (void *)v40;
              if (v40)
                (*(void (**)(uint64_t, uint64_t))(v40 + 16))(v40, v34);

            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
        }
        while (v31);
      }

      objc_destroyWeak(&v66);
      objc_destroyWeak((id *)buf);

      v42 = v55;
      goto LABEL_42;
    case 2uLL:
      v43 = (void *)MEMORY[0x1D17B7244]();
      v44 = v6;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v74 = (uint64_t)v46;
        _os_log_impl(&dword_1CCE01000, v45, OS_LOG_TYPE_ERROR, "%{public}@BTLE is unsupported on this system", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v43);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:reason:underlyingError:", 48, CFSTR("Failed to power on Bluetooth because Bluetooth LE is unsupported on this system."), 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserBTLE _callPowerOnCompletionsWithError:](v44, "_callPowerOnCompletionsWithError:", v42);
      -[HAPAccessoryServerBrowserBTLE reachabilityCompletion](v44, "reachabilityCompletion");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v47;
      if (v47)
        (*(void (**)(uint64_t, _QWORD, void *))(v47 + 16))(v47, 0, v42);

      goto LABEL_42;
    case 5uLL:
      -[HAPAccessoryServerBrowserBTLE _callPowerOnCompletionsWithError:](v6, "_callPowerOnCompletionsWithError:", 0);
      if (-[HAPAccessoryServerBrowserBTLE isPerformingGeneralScan](v6, "isPerformingGeneralScan"))
      {
        v49 = (void *)MEMORY[0x1D17B7244]();
        v50 = v6;
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v74 = (uint64_t)v52;
          _os_log_impl(&dword_1CCE01000, v51, OS_LOG_TYPE_INFO, "%{public}@Central manager was powered on and there is an outstanding accessory server discovery request so start actively scanning", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v49);
        -[HAPAccessoryServerBrowserBTLE _startBrowsingForLegacyHAPBTLE100Accessories](v50, "_startBrowsingForLegacyHAPBTLE100Accessories");
      }
      -[HAPAccessoryServerBrowserBTLE reachabilityCompletion](v6, "reachabilityCompletion");
      v53 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v53;
      if (v53)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v53 + 16))(v53, 1, 0);
LABEL_42:

      break;
    default:
      break;
  }

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HAPBLEPeripheral *v18;
  void *v19;
  void *v20;
  HAPBLEPeripheral *v21;
  id v22;
  void *v23;
  HAPAccessoryServerBrowserBTLE *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[5];
  id v34;

  v8 = a4;
  v9 = a5;
  if (-[HAPAccessoryServerBrowserBTLE _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_accessoryServerBrowserBTLE_didDiscoverAccessoryWithAdvertisementData_))
  {
    -[HAPAccessoryServerBrowserBTLE delegateQueue](self, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__HAPAccessoryServerBrowserBTLE_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke;
    block[3] = &unk_1E894E0F8;
    block[4] = self;
    v34 = v9;
    dispatch_async(v10, block);

  }
  v32 = 0;
  v30 = 0;
  v31 = 0;
  v28 = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  v24 = self;
  v25 = v9;
  v11 = -[HAPAccessoryServerBrowserBTLE _parseAdvertisementData:forPeripheral:name:pairingUsername:statusFlags:stateNumber:category:configNumber:setupHash:](self, "_parseAdvertisementData:forPeripheral:name:pairingUsername:statusFlags:stateNumber:category:configNumber:setupHash:", v9, v8, &v32, &v31, &v30, &v29, &v28, &v27, &v26);
  v12 = v32;
  v13 = v31;
  v14 = v30;
  v15 = v29;
  v16 = v28;
  v17 = v27;
  v22 = v26;
  v18 = [HAPBLEPeripheral alloc];
  v23 = v8;
  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HAPBLEPeripheral initWithName:peripheralUUID:identifier:hapVersion:hkType:advInterval:statusFlags:category:stateNumber:configNumber:setupHash:encryptedPayload:whbStableIdentifier:advDeviceAddress:](v18, "initWithName:peripheralUUID:identifier:hapVersion:hkType:advInterval:statusFlags:category:stateNumber:configNumber:setupHash:encryptedPayload:whbStableIdentifier:advDeviceAddress:", v12, v19, v13, v20, 0, 0, v14, v16, v15, v17, 0, 0, 0, 0);

  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  if ((HAPIsHH2Enabled_hh2Enabled & 1) == 0)
    -[HAPBLEPeripheral setCbPeripheral:](v21, "setCbPeripheral:", v23);
  -[HAPAccessoryServerBrowserBTLE _didDiscoverPeripheral:accessoryName:pairingIdentifier:format:statusFlags:stateNumber:category:configNumber:setupHash:encryptedPayload:whbStableIdentifier:](v24, "_didDiscoverPeripheral:accessoryName:pairingIdentifier:format:statusFlags:stateNumber:category:configNumber:setupHash:encryptedPayload:whbStableIdentifier:", v21, v12, v13, v11, v14, v15, v16, v17, v22, 0, 0);

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  -[HAPAccessoryServerBrowserBTLE connectedHAPPeripheral:](self, "connectedHAPPeripheral:", a4);
}

- (void)connectedHAPPeripheral:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HAPAccessoryServerBrowserBTLE *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HAPAccessoryServerBrowserBTLE *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAPAccessoryServerBrowserBTLE _blePeripheralForCBPeripheral:](self, "_blePeripheralForCBPeripheral:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "connectedToCBPeripheral:error:", v4, 0),
        -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](self, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v7, 0), v8 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v8, "accessoryServer"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v8, v9))
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully connected to BLE Peripheral: %{public}@ with CB Peripheral: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConnectionStartTime:", v15);

    -[HAPAccessoryServerBrowserBTLE peripheralsPendingConnection](v11, "peripheralsPendingConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
      objc_msgSend(v9, "updateConnectionIdleTime:", 1);
    objc_msgSend(v9, "handleConnectionWithPeripheral:withError:", v4, 0);

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v21;
      v24 = 2114;
      v25 = v7;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@unexpected connection complete without server: %{public}@ for CB peripheral: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    -[HAPAccessoryServerBrowserBTLE _disconnectFromHAPBLEPeripheral:cbPeripheral:](v19, "_disconnectFromHAPBLEPeripheral:cbPeripheral:", v7, v4);
  }

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HAPAccessoryServerBrowserBTLE *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HAPAccessoryServerBrowserBTLE _blePeripheralForCBPeripheral:](self, "_blePeripheralForCBPeripheral:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1D17B7244]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v15;
    v19 = 2114;
    v20 = v16;
    v21 = 2112;
    v22 = v9;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@Did fail to connect BLE peripheral: %{public}@ with CBPeripheral: %@ with error %{public}@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HAPAccessoryServerBrowserBTLE failedToConnectHAPPeripheral:error:](v13, "failedToConnectHAPPeripheral:error:", v11, v10);

}

- (void)failedToConnectHAPPeripheral:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HAPAccessoryServerBrowserBTLE *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HAPAccessoryServerBrowserBTLE *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6
    && (-[HAPAccessoryServerBrowserBTLE _removeFromActiveConnections:](self, "_removeFromActiveConnections:", v6),
        -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](self, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v6, 0), v8 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v8, "accessoryServer"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v8, v9))
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v13;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to connect to accessory %{public}@ with error %{public}@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v6, "cbPeripheral");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleConnectionWithPeripheral:withError:", v14, v7);

    -[HAPAccessoryServerBrowserBTLE _notifyDelegatesOfRemovedAccessoryServer:error:](v11, "_notifyDelegatesOfRemovedAccessoryServer:error:", v9, v7);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v18;
      v23 = 2114;
      v24 = v19;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@unexpected disconnection without server from peripheral: %{public}@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }
  objc_msgSend(v6, "cbPeripheral");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedToCBPeripheral:error:", v20, v7);

  -[HAPAccessoryServerBrowserBTLE _connectPendingConnections](self, "_connectPendingConnections");
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  if (v9)
    -[HAPAccessoryServerBrowserBTLE _stopMonitorDisconnectionOfCBPeripheral:](self, "_stopMonitorDisconnectionOfCBPeripheral:", v9);
  -[HAPAccessoryServerBrowserBTLE _blePeripheralForCBPeripheral:](self, "_blePeripheralForCBPeripheral:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryServerBrowserBTLE disconnectedHAPPeripheral:error:](self, "disconnectedHAPPeripheral:error:", v8, v7);

}

- (void)disconnectedHAPPeripheral:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HAPAccessoryServerBrowserBTLE *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HAPAccessoryServerBrowserBTLE *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cbPeripheral");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HAPAccessoryServerBrowserBTLE _removeFromActiveConnections:](self, "_removeFromActiveConnections:", v6);
    -[HAPAccessoryServerBrowserBTLE _recentlySeenPairedPeripheralTupleWithPeripheral:](self, "_recentlySeenPairedPeripheralTupleWithPeripheral:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](self, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessoryServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  v12 = (void *)MEMORY[0x1D17B7244](-[HAPAccessoryServerBrowserBTLE _stopMonitorDisconnectionOfCBPeripheral:](self, "_stopMonitorDisconnectionOfCBPeripheral:", v8));
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v31 = v15;
    v32 = 2114;
    v33 = v16;
    v34 = 2112;
    v35 = v8;
    v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@Disconnected from BLE peripheral: %{public}@, CB Peripheral: %@ with error %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  if (v7 && v9)
  {
    -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](v13, "hapWiProxBLEBrowser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resetLastSeenForTrackedAccessories:", v18);

    -[HAPAccessoryServerBrowserBTLE delegate](v13, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accessoryServerBrowser:didChangeReachability:forAccessoryServerWithIdentifier:", v13, 0, v20);

  }
  v21 = objc_msgSend(v9, "setNotifyingCharacteristicUpdated:", 0);
  if (v11)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__HAPAccessoryServerBrowserBTLE_disconnectedHAPPeripheral_error___block_invoke;
    v27[3] = &unk_1E894A740;
    v27[4] = v13;
    v28 = v11;
    v29 = v7;
    objc_msgSend(v28, "handleDisconnectionWithError:completionHandler:", v29, v27);
    objc_msgSend(v6, "disconnectedFromCBPeripheral:shouldRemove:", v8, 0);
    -[HAPAccessoryServerBrowserBTLE _connectPendingConnections](v13, "_connectPendingConnections");

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B7244](v21);
    v23 = v13;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v25;
      v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to find accessory for disconnected peripheral: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    if (v6)
    {
      objc_msgSend(v6, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserBTLE _removeDiscoveredPeripheralsWithIdentifier:](v23, "_removeDiscoveredPeripheralsWithIdentifier:", v26);

    }
  }

}

- (void)_disconnectFromHAPBLEPeripheral:(id)a3 cbPeripheral:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  HAPAccessoryServerBrowserBTLE *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HAPAccessoryServerBrowserBTLE *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6 | v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v13;
      v27 = 2114;
      v28 = (unint64_t)v14;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Disconnecting from Peripheral: %{public}@ (%@)", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    if (v6)
      -[HAPAccessoryServerBrowserBTLE _removeFromActiveConnections:](v10, "_removeFromActiveConnections:", v6);
    v15 = objc_msgSend((id)v7, "state");
    v16 = (void *)MEMORY[0x1D17B7244]();
    v17 = v10;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v20;
        v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_INFO, "%{public}@Cancelling connection to peripheral: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      -[HAPAccessoryServerBrowserBTLE _monitorDisconnectionOfHAPPeripheral:peripheral:](v17, "_monitorDisconnectionOfHAPPeripheral:peripheral:", v6, v7);
      -[HAPAccessoryServerBrowserBTLE centralManager](v17, "centralManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "cancelPeripheralConnection:", v7);

    }
    else
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v23;
        v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_INFO, "%{public}@Peripheral: %@ is already disconnected", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserBTLE disconnectedHAPPeripheral:error:](v17, "disconnectedHAPPeripheral:error:", v6, v24);

    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v22;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid blePeripheral / cbPeripheral", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_stopMonitorDisconnectionOfCBPeripheral:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[HAPAccessoryServerBrowserBTLE peripheralDisconnectionMonitorMap](self, "peripheralDisconnectionMonitorMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v8);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      dispatch_source_cancel(v6);
      -[HAPAccessoryServerBrowserBTLE peripheralDisconnectionMonitorMap](self, "peripheralDisconnectionMonitorMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v8);

    }
    v4 = v8;
  }

}

- (void)_monitorDisconnectionOfHAPPeripheral:(id)a3 peripheral:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    -[HAPAccessoryServerBrowserBTLE peripheralDisconnectionMonitorMap](self, "peripheralDisconnectionMonitorMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v11);

      -[HAPAccessoryServerBrowserBTLE peripheralDisconnectionMonitorMap](self, "peripheralDisconnectionMonitorMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v12, v7);

      objc_initWeak(&location, self);
      v14 = dispatch_time(0, 1000000000* -[HAPAccessoryServerBrowserBTLE peripheralDisconnectionTimeout](self, "peripheralDisconnectionTimeout"));
      dispatch_source_set_timer(v12, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __81__HAPAccessoryServerBrowserBTLE__monitorDisconnectionOfHAPPeripheral_peripheral___block_invoke;
      v15[3] = &unk_1E894DFD8;
      objc_copyWeak(&v18, &location);
      v16 = v7;
      v17 = v6;
      dispatch_source_set_event_handler(v12, v15);
      dispatch_resume(v12);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

    }
  }

}

- (id)_cbPeripheralForHAPBLEPeripheral:(id)a3 routeMode:(unsigned __int8 *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "peripheralUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whbStableIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HAPAccessoryServerBrowserBTLE _cbPeripheralForPeripheralUUID:stableIdentifier:routeMode:](self, "_cbPeripheralForPeripheralUUID:stableIdentifier:routeMode:", v8, v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE _cbPeripheralForPeripheralUUID:stableIdentifier:routeMode:](self, "_cbPeripheralForPeripheralUUID:stableIdentifier:routeMode:", v8, v11, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_cbPeripheralForPeripheralUUID:(id)a3 stableIdentifier:(id)a4 routeMode:(unsigned __int8 *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (a5)
    *a5 = 0;
  v6 = a3;
  -[HAPAccessoryServerBrowserBTLE centralManager](self, "centralManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retrievePeripheralsWithIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_blePeripheralForCBPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  HAPAccessoryServerBrowserBTLE *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  double v33;
  double v34;
  double v35;
  id v36;
  void *v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v26 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  v38 = v6;
  if (!v10)
    goto LABEL_14;
  v11 = v10;
  v40 = *(_QWORD *)v46;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v46 != v40)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      v14 = self;
      -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessoryServer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v13, "cbPeripheral");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqual:", v4))
        {

        }
        else
        {
          objc_msgSend(v13, "peripheralUUIDs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v20 = v4;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v19, "containsObject:", v21);

          v4 = v20;
          v6 = v38;

          if (!v22)
            goto LABEL_12;
        }
        objc_msgSend(v6, "addObject:", v13);
      }
LABEL_12:

      self = v14;
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  }
  while (v11);
LABEL_14:

  v23 = objc_msgSend(v6, "count");
  objc_msgSend(v6, "firstObject");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v6;
  v26 = (void *)v24;
  if (v23 >= 2)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v27 = v25;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v32, "lastSeen");
          v34 = v33;
          objc_msgSend(v26, "lastSeen");
          if (v34 - v35 > 0.0)
          {
            v36 = v32;

            v26 = v36;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v29);
    }

  }
LABEL_27:

  return v26;
}

- (id)_blePeripheralForAccessoryServerIdentifier:(id)a3
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
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
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
        -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v13, "accessoryServer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v15, "isEqual:", v4);

        if ((v13 & 1) != 0)
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

- (id)_bleAccessoryServerTupleForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HAPAccessoryServerBrowserBTLE _blePeripheralForAccessoryServerIdentifier:](self, "_blePeripheralForAccessoryServerIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](self, "discoveredPeripheralsWithAccessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)accessoryServerBrowserBTLE:(id)a3 didDiscoverHAPPeripheral:(id)a4
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v16)
  {
    objc_msgSend(v16, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v16, "advertisementFormat");
    objc_msgSend(v16, "statusFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stateNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setupHash");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encryptedPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "whbStableIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE _didDiscoverPeripheral:accessoryName:pairingIdentifier:format:statusFlags:stateNumber:category:configNumber:setupHash:encryptedPayload:whbStableIdentifier:](self, "_didDiscoverPeripheral:accessoryName:pairingIdentifier:format:statusFlags:stateNumber:category:configNumber:setupHash:encryptedPayload:whbStableIdentifier:", v16, v15, v6, v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (id)retrieveCBPeripheralWithUUID:(id)a3 blePeripheral:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "whbStableIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HAPAccessoryServerBrowserBTLE _cbPeripheralForPeripheralUUID:stableIdentifier:routeMode:](self, "_cbPeripheralForPeripheralUUID:stableIdentifier:routeMode:", v6, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE _cbPeripheralForPeripheralUUID:stableIdentifier:routeMode:](self, "_cbPeripheralForPeripheralUUID:stableIdentifier:routeMode:", v6, v10, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_cachedCharacteristicForInstanceID:(id)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HAPAccessoryServerBrowserBTLE cachedAccessoryForIdentifier:](self, "cachedAccessoryForIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v7, "cachedServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v24)
  {
    v9 = *(_QWORD *)v30;
    v22 = *(_QWORD *)v30;
    v23 = v7;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v8);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v11, "cachedCharacteristics");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v17, "characteristicInstanceId");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqual:", v6);

              if ((v19 & 1) != 0)
              {
                v20 = v17;

                v7 = v23;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v14)
              continue;
            break;
          }
        }

        v9 = v22;
      }
      v20 = 0;
      v7 = v23;
      v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v24);
  }
  else
  {
    v20 = 0;
  }
LABEL_19:

  return v20;
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HAPAccessoryServerBrowserBTLE delegateQueue](self, "delegateQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (id)hapCharacteristicsForEncryptedPayload:(id)a3 identifier:(id)a4 shouldConnect:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int16 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  HAPAccessoryServerBrowserBTLE *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HAPAccessoryServerBrowserBTLE *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HAPCharacteristic *v41;
  void *v42;
  void *v43;
  HAPAccessoryServerBrowserBTLE *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  HAPAccessoryServerBrowserBTLE *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  HAPAccessoryServerBrowserBTLE *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HAPAccessoryServerBrowserBTLE *v58;
  NSObject *v59;
  void *v60;
  id v61;
  unsigned __int16 *v62;
  uint64_t v63;
  void *v64;
  HAPAccessoryServerBrowserBTLE *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v76;
  HAPAccessoryServerBrowserBTLE *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  HAPAccessoryServerBrowserBTLE *v82;
  NSObject *v83;
  void *v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  HAPAccessoryServerBrowserBTLE *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  HAPAccessoryServerBrowserBTLE *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  HAPAccessoryServerBrowserBTLE *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  HAPAccessoryServerBrowserBTLE *v105;
  NSObject *v106;
  void *v107;
  HAPCharacteristic *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  HAPAccessoryServerBrowserBTLE *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  HAPAccessoryServerBrowserBTLE *v118;
  NSObject *v119;
  void *v120;
  uint64_t v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  id v129;
  HAPAccessoryServerBrowserBTLE *v130;
  void *v131;
  void *v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  uint64_t v143;
  unsigned __int16 v144;
  char v145[6];
  HAPCharacteristic *v146;
  uint8_t buf[4];
  void *v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  _BYTE v152[24];
  __int16 v153;
  id v154;
  __int16 v155;
  void *v156;
  __int16 v157;
  id v158;
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_retainAutorelease(a4);
  objc_msgSend(v8, "cStringUsingEncoding:", 4);
  objc_msgSend(v8, "length");
  TextToHardwareAddress();
  -[HAPAccessoryServerBrowserBTLE cachedAccessoryForIdentifier:](self, "cachedAccessoryForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v130 = self;
    objc_msgSend(v9, "peripheralInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stateNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedShortValue") + 1;

    v144 = v13;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v144, 2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "peripheralInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "broadcastKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "subdataWithRange:", objc_msgSend(v7, "length") - 4, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subdataWithRange:", 0, objc_msgSend(v7, "length") - 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v18, "length"));
    v20 = (void *)v19;
    v128 = v17;
    v129 = v7;
    if (!v16)
    {
      v47 = (void *)v19;
      v48 = (void *)MEMORY[0x1D17B7244]();
      v49 = v130;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v51 = v18;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v148 = v52;
        v149 = 2114;
        v150 = (uint64_t)v8;
        _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Enc Adv] No keys to decrypt for accessory: %{public}@", buf, 0x16u);

        v18 = v51;
      }

      objc_autoreleasePoolPop(v48);
      v41 = 0;
      v42 = 0;
      if (a5)
        *a5 = 1;
      goto LABEL_42;
    }
    v123 = v16;
    v124 = v10;
    v126 = v8;
    v138 = objc_retainAutorelease(v16);
    objc_msgSend(v138, "bytes");
    v14 = objc_retainAutorelease(v14);
    objc_msgSend(v14, "bytes");
    v127 = v18;
    v21 = objc_retainAutorelease(v18);
    objc_msgSend(v21, "bytes");
    v136 = v21;
    objc_msgSend(v21, "length");
    v125 = v20;
    v140 = objc_retainAutorelease(v20);
    objc_msgSend(v140, "mutableBytes");
    v22 = objc_retainAutorelease(v17);
    objc_msgSend(v22, "bytes");
    v134 = v22;
    v121 = objc_msgSend(v22, "length");
    v23 = chacha20_poly1305_decrypt_all_64x64_ex();
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      do
      {
        v26 = v25 - 1;
        v143 = v25 - 1 + v144;
        if (v25 != 1)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v143, 8, v121);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(objc_retainAutorelease(v138), "bytes");
          v28 = objc_retainAutorelease(v27);
          objc_msgSend(v28, "bytes");
          v29 = objc_retainAutorelease(v21);
          objc_msgSend(v29, "bytes");
          objc_msgSend(v29, "length");
          objc_msgSend(objc_retainAutorelease(v140), "mutableBytes");
          v30 = objc_retainAutorelease(v134);
          objc_msgSend(v30, "bytes");
          v121 = objc_msgSend(v30, "length");
          v31 = chacha20_poly1305_decrypt_all_64x64_ex();
          if (!(_DWORD)v31)
          {
            v53 = (void *)MEMORY[0x1D17B7244](v31);
            v54 = v130;
            HMFGetOSLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            v8 = v126;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v148 = v56;
              v149 = 2048;
              v150 = v143;
              v151 = 2114;
              *(_QWORD *)v152 = v126;
              _os_log_impl(&dword_1CCE01000, v55, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv] Decrypted with State Number: %llu for accessory: %{public}@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v53);
            v14 = v28;
            v18 = v127;
            if (a5 && v26 >= 1)
              *a5 = 1;
            goto LABEL_31;
          }
          v24 = v31;
          v14 = v28;
        }
        ++v25;
      }
      while ((_DWORD)v25 != 6);
      v32 = (void *)MEMORY[0x1D17B7244]();
      v33 = v130;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v148 = v35;
        v149 = 2048;
        v150 = v24;
        v151 = 1024;
        *(_DWORD *)v152 = v144;
        *(_WORD *)&v152[4] = 2114;
        *(_QWORD *)&v152[6] = v126;
        _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Enc Adv] Failed to decrypt status: %ld, expected s#: %d for accessory: %{public}@", buf, 0x26u);

      }
      objc_autoreleasePoolPop(v32);
      v36 = (void *)MEMORY[0x1D17B7244]();
      v37 = v33;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v145, 6);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v148 = v39;
        v149 = 2112;
        v150 = (uint64_t)v136;
        v151 = 1024;
        *(_DWORD *)v152 = v24;
        *(_WORD *)&v152[4] = 2112;
        *(_QWORD *)&v152[6] = v138;
        *(_WORD *)&v152[14] = 2112;
        *(_QWORD *)&v152[16] = v136;
        v153 = 2112;
        v154 = v14;
        v155 = 2112;
        v156 = v40;
        v157 = 2112;
        v158 = v134;
        _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv] Failed to decrypt: %@, status: %d, key: %@, enc data: %@, nonce: %@, aad: %@ authTag: %@", buf, 0x4Eu);

      }
      objc_autoreleasePoolPop(v36);
      v8 = v126;
      -[HAPAccessoryServerBrowserBTLE updateBroadcastKeyForIdentifier:key:keyUpdatedStateNumber:keyUpdatedTime:](v37, "updateBroadcastKeyForIdentifier:key:keyUpdatedStateNumber:keyUpdatedTime:", v126, 0, 0, 0.0);
      v18 = v127;
      if (a5)
      {
        v41 = 0;
        v42 = 0;
        *a5 = 1;
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    v18 = v127;
LABEL_31:
    v57 = (void *)MEMORY[0x1D17B7244]();
    v58 = v130;
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v148 = v60;
      v149 = 2114;
      v150 = (uint64_t)v8;
      v151 = 2112;
      *(_QWORD *)v152 = v140;
      _os_log_impl(&dword_1CCE01000, v59, OS_LOG_TYPE_INFO, "%{public}@[Enc Adv]: Decrypted data from %{public}@: %@", buf, 0x20u);

      v18 = v127;
    }

    objc_autoreleasePoolPop(v57);
    v61 = objc_retainAutorelease(v140);
    v62 = (unsigned __int16 *)objc_msgSend(v61, "bytes");
    if ((unint64_t)objc_msgSend(v61, "length") < 5)
    {
LABEL_39:
      v41 = 0;
      v42 = 0;
LABEL_40:
      v16 = v123;
      v10 = v124;
      goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *v62);
    v141 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v62[1]);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = (void *)MEMORY[0x1D17B7244]();
    v65 = v58;
    HMFGetOSLogHandle();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v148 = v67;
      v149 = 2114;
      v150 = (uint64_t)v141;
      v151 = 2114;
      *(_QWORD *)v152 = v63;
      *(_WORD *)&v152[8] = 2114;
      *(_QWORD *)&v152[10] = v8;
      _os_log_impl(&dword_1CCE01000, v66, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: State Num: %{public}@ Instance Id: %{public}@ for accessory: %{public}@", buf, 0x2Au);

      v18 = v127;
    }

    objc_autoreleasePoolPop(v64);
    -[HAPAccessoryServerBrowserBTLE _cachedCharacteristicForInstanceID:identifier:](v65, "_cachedCharacteristicForInstanceID:identifier:", v63, v8);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    v139 = (id)v63;
    if (!v68)
    {
      v76 = (void *)MEMORY[0x1D17B7244]();
      v77 = v65;
      HMFGetOSLogHandle();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v148 = v79;
        v149 = 2114;
        v150 = (uint64_t)v8;
        v151 = 2114;
        *(_QWORD *)v152 = v63;
        _os_log_impl(&dword_1CCE01000, v78, OS_LOG_TYPE_INFO, "%{public}@[Enc Adv] No Cached signature for accessory: %{public}@ instanceid: %{public}@", buf, 0x20u);

        v18 = v127;
      }

      objc_autoreleasePoolPop(v76);
      v16 = v123;
      v10 = v124;
      v73 = 0;
      v80 = v141;
      goto LABEL_78;
    }
    v135 = v14;
    objc_msgSend(v68, "characteristicMetadata");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "format");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = HAPCharacteristicFormatFromString(v71);
    v73 = v69;
    if ((unint64_t)(v72 - 1) > 9)
      v74 = 0;
    else
      v74 = qword_1CCFA33F8[v72 - 1];

    v81 = (void *)MEMORY[0x1D17B7244]();
    v82 = v65;
    HMFGetOSLogHandle();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v148 = v84;
      v149 = 2048;
      v150 = v74;
      _os_log_impl(&dword_1CCE01000, v83, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: Value Length %lu", buf, 0x16u);

      v18 = v127;
    }

    objc_autoreleasePoolPop(v81);
    v85 = objc_msgSend(v61, "length");
    if (!v74 || (v86 = v74 + 4, v85 < v74 + 4))
    {
      v96 = (void *)MEMORY[0x1D17B7244](v85);
      v97 = v82;
      HMFGetOSLogHandle();
      v98 = objc_claimAutoreleasedReturnValue();
      v8 = v126;
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v148 = v99;
        v149 = 2048;
        v150 = v74;
        v151 = 2114;
        *(_QWORD *)v152 = v126;
        _os_log_impl(&dword_1CCE01000, v98, OS_LOG_TYPE_ERROR, "%{public}@[Enc Adv] Failed to extract value with length: %lu for accessory: %{public}@", buf, 0x20u);

        v18 = v127;
      }

      objc_autoreleasePoolPop(v96);
      v41 = 0;
      v42 = 0;
      v16 = v123;
      v10 = v124;
      v14 = v135;
      v80 = v141;
      goto LABEL_77;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v62 + 2, v74);
    v87 = objc_claimAutoreleasedReturnValue();
    +[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v73;
    objc_msgSend(v73, "characteristicMetadata");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "format");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = 0;
    v131 = (void *)v87;
    objc_msgSend(v88, "reverseTransformedValue:format:error:", v87, HAPCharacteristicFormatFromString(v90), &v142);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v142;

    v91 = (void *)MEMORY[0x1D17B7244]();
    v92 = v82;
    HMFGetOSLogHandle();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v148 = v94;
      v149 = 2112;
      v150 = (uint64_t)v131;
      v151 = 2112;
      *(_QWORD *)v152 = v133;
      *(_WORD *)&v152[8] = 2114;
      *(_QWORD *)&v152[10] = v126;
      _os_log_impl(&dword_1CCE01000, v93, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: Value Data: %@, Value: %@ for accessory: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v91);
    if ((objc_msgSend(v137, "characteristicProperties") & 0x100) != 0)
    {
      if (objc_msgSend(v61, "length") <= v86)
      {
        v100 = (void *)MEMORY[0x1D17B7244]();
        v101 = v92;
        HMFGetOSLogHandle();
        v102 = objc_claimAutoreleasedReturnValue();
        v16 = v123;
        v10 = v124;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v148 = v103;
          _os_log_impl(&dword_1CCE01000, v102, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: Notification context is not included in payload", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v100);
        v95 = 0;
LABEL_69:
        v108 = [HAPCharacteristic alloc];
        objc_msgSend(v137, "characteristicUUID");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "UUIDString");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v137, "characteristicProperties");
        objc_msgSend(v137, "characteristicMetadata");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v121) = 1;
        v41 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v108, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v110, v139, v133, v141, v111, 0, v121, v112);

        if (v41)
        {
          v113 = (void *)MEMORY[0x1D17B7244](-[HAPCharacteristic setNotificationContext:](v41, "setNotificationContext:", v95));
          v114 = v92;
          HMFGetOSLogHandle();
          v115 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v148 = v116;
            v149 = 2112;
            v150 = (uint64_t)v41;
            v151 = 2114;
            *(_QWORD *)v152 = v126;
            _os_log_impl(&dword_1CCE01000, v115, OS_LOG_TYPE_INFO, "%{public}@[Enc Adv]: Returning characteristic: %@ for accessory: %{public}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v113);
          v146 = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v127;
          v80 = v141;
          v73 = v137;
        }
        else
        {
          v117 = (void *)MEMORY[0x1D17B7244]();
          v118 = v92;
          HMFGetOSLogHandle();
          v119 = objc_claimAutoreleasedReturnValue();
          v73 = v137;
          if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v148 = v120;
            v149 = 2112;
            v150 = (uint64_t)v137;
            v151 = 2114;
            *(_QWORD *)v152 = v126;
            _os_log_impl(&dword_1CCE01000, v119, OS_LOG_TYPE_INFO, "%{public}@[Enc Adv]: Failed to create HAPCharacteristic from: %@ for accessory: %{public}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v117);
          v42 = 0;
          v18 = v127;
          v80 = v141;
        }

        v8 = v126;
        v14 = v135;
        if (v41)
        {
LABEL_77:

LABEL_41:
          v47 = v125;
LABEL_42:

          v7 = v129;
          goto LABEL_43;
        }
LABEL_78:

        v41 = 0;
        v42 = 0;
        goto LABEL_41;
      }
      if (*((_BYTE *)v62 + v86) == 1)
      {
        _notificationContextTLVDataFromPayload((uint64_t)v62, objc_msgSend(v61, "length"), v74 + 5, v92);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_68:
        v16 = v123;
        v10 = v124;
        goto LABEL_69;
      }
      v104 = (void *)MEMORY[0x1D17B7244]();
      v105 = v92;
      HMFGetOSLogHandle();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v148 = v107;
        _os_log_impl(&dword_1CCE01000, v106, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: Notification context is not present in payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v104);
    }
    v95 = 0;
    goto LABEL_68;
  }
  v43 = (void *)MEMORY[0x1D17B7244]();
  v44 = self;
  HMFGetOSLogHandle();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v148 = v46;
    v149 = 2114;
    v150 = (uint64_t)v8;
    _os_log_impl(&dword_1CCE01000, v45, OS_LOG_TYPE_ERROR, "%{public}@[Enc Adv] No cached accessory for: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v43);
  v42 = 0;
  if (a5)
    *a5 = 1;
LABEL_43:

  return v42;
}

- (void)_createHAPAccessoryAndNotifyDelegateWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 connectionIdleTime:(unsigned __int8)a12 format:(unint64_t)a13 setupHash:(id)a14 encryptedPayload:(id)a15 whbStableIdentifier:(id)a16
{
  _BOOL8 v16;
  id v21;
  id v22;
  void *v23;
  HAPAccessoryServerBrowserBTLE *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  HAPAccessoryServerBrowserBTLE *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  HAPAccessoryServerBrowserBTLE *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  HAPAccessoryServerBrowserBTLE *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HAPAccessoryServerBrowserBTLE *v66;
  NSObject *v67;
  void *v68;
  double Current;
  void *v70;
  double v71;
  double v72;
  unsigned __int8 v73;
  void *v74;
  HAPAccessoryServerBrowserBTLE *v75;
  NSObject *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  _BOOL8 v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  _BOOL8 v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  objc_class *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  HAPAccessoryServerBrowserBTLE *v104;
  NSObject *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  id v110;
  unsigned __int8 v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  void *v119;
  id v120;
  _QWORD block[4];
  id v122;
  HAPAccessoryServerBrowserBTLE *v123;
  id v124;
  id v125;
  id v126;
  char v127;
  BOOL v128;
  char v129;
  uint8_t buf[4];
  void *v131;
  __int16 v132;
  id v133;
  __int16 v134;
  unint64_t v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  void *v141;
  uint64_t v142;

  v16 = a8;
  v111 = a9;
  v142 = *MEMORY[0x1E0C80C00];
  v120 = a3;
  v117 = a4;
  v21 = a5;
  v112 = a6;
  v22 = a7;
  v116 = a10;
  v115 = a11;
  v110 = a14;
  v114 = a15;
  v113 = a16;
  v23 = (void *)MEMORY[0x1D17B7244]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  v119 = v21;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "shortDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v28 = v16;
    v29 = v22;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v131 = v26;
    v132 = 2114;
    v133 = v27;
    v134 = 2048;
    v135 = a13;
    v136 = 2114;
    v137 = v30;
    v138 = 2114;
    v139 = v31;
    v140 = 2114;
    v141 = v32;
    _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_INFO, "%{public}@Creating a HAPAccessoryServerBTLE instance for discovered peripheral: '%{public}@' V: '%tu', ST: '%{public}@' ENC: '%{public}@' CT: '%{public}@'", buf, 0x3Eu);

    v22 = v29;
    v16 = v28;

    v21 = v119;
  }

  objc_autoreleasePoolPop(v23);
  v129 = 0;
  if (!-[HAPAccessoryServerBrowser isPaired:](v24, "isPaired:", v21))
  {
    v43 = v22;
    v44 = (void *)MEMORY[0x1D17B7244]();
    v45 = v24;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    v35 = v112;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v131 = v47;
      _os_log_impl(&dword_1CCE01000, v46, OS_LOG_TYPE_INFO, "%{public}@This accessory is unpaired", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v44);
    v41 = 0;
    v42 = v110;
    v22 = v43;
    goto LABEL_64;
  }
  -[HAPAccessoryServerBrowserBTLE cachedAccessoryForIdentifier:](v24, "cachedAccessoryForIdentifier:", v21);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  v35 = v112;
  if (v114)
  {
    if (objc_msgSend(v120, "isCached"))
    {
      v36 = v22;
      v37 = (void *)MEMORY[0x1D17B7244]();
      v38 = v24;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v131 = v40;
        _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_DEBUG, "%{public}@The advertisement data is from the WiProxBTLE cache, so ignore and don't decrypt.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
      v41 = 0;
      v21 = v119;
      v42 = v110;
      v22 = v36;
    }
    else
    {
      -[HAPAccessoryServerBrowserBTLE hapCharacteristicsForEncryptedPayload:identifier:shouldConnect:](v24, "hapCharacteristicsForEncryptedPayload:identifier:shouldConnect:", v114, v21, &v129);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        v41 = v48;
        objc_msgSend(v48, "firstObject");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stateNumber");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v129)
        {
          v22 = v50;
        }
        else
        {
          objc_msgSend(v34, "peripheralInfo");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stateNumber");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v50, "isEqual:", v54);

          if ((v55 & 1) != 0)
          {
            if (!v129)
            {
              v56 = (void *)MEMORY[0x1D17B7244]();
              v57 = v24;
              HMFGetOSLogHandle();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v131 = v59;
                v132 = 2114;
                v133 = v119;
                _os_log_impl(&dword_1CCE01000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring duplicate broadcast notification for accessory: %{public}@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v56);
              v35 = v112;
              v42 = v110;
              goto LABEL_76;
            }
          }
          else
          {
            v129 = 1;
            v111 = 2;
          }
          v22 = v50;
          v35 = v112;
        }
        v21 = v119;
      }
      else
      {
        if (!v34)
        {
          v74 = (void *)MEMORY[0x1D17B7244]();
          v75 = v24;
          HMFGetOSLogHandle();
          v76 = objc_claimAutoreleasedReturnValue();
          v42 = v110;
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v77 = v22;
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v131 = v78;
            v132 = 2114;
            v133 = v21;
            _os_log_impl(&dword_1CCE01000, v76, OS_LOG_TYPE_INFO, "%{public}@No accessory cache found for: %{public}@", buf, 0x16u);

            v22 = v77;
          }

          objc_autoreleasePoolPop(v74);
          -[HAPAccessoryServerBrowserBTLE _performTimedConnectionRequestForIdentifier:](v75, "_performTimedConnectionRequestForIdentifier:", v21);
          v34 = 0;
          v41 = 0;
          goto LABEL_72;
        }
        v41 = 0;
        v16 = 1;
      }
      v42 = v110;
    }
    -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](v24, "recentlySeenPairedPeripherals");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectForKey:", v21);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v117)
    {
      if (v35)
        goto LABEL_44;
    }
    else
    {
      objc_msgSend(v34, "peripheralInfo");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "accessoryName");
      v117 = (id)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
LABEL_44:
        if (!v22)
          goto LABEL_48;
        goto LABEL_52;
      }
    }
    objc_msgSend(v34, "peripheralInfo");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "statusFlags");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
LABEL_48:
      objc_msgSend(v80, "stateNumber");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v83;
      if (v83)
      {
        v85 = v83;
      }
      else
      {
        objc_msgSend(v34, "peripheralInfo");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "stateNumber");
        v85 = (id)objc_claimAutoreleasedReturnValue();

      }
      v22 = v85;
    }
LABEL_52:
    if (!v116)
    {
      v87 = v16;
      v88 = v22;
      objc_msgSend(v80, "configNumber");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v89;
      if (v89)
      {
        v116 = v89;
      }
      else
      {
        objc_msgSend(v34, "peripheralInfo");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "configNumber");
        v116 = (id)objc_claimAutoreleasedReturnValue();

      }
      v22 = v88;
      v16 = v87;
    }
    if (!v115)
    {
      v92 = v16;
      v93 = v22;
      objc_msgSend(v80, "category");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v94;
      if (v94)
      {
        v115 = v94;
      }
      else
      {
        objc_msgSend(v34, "peripheralInfo");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "categoryIdentifier");
        v115 = (id)objc_claimAutoreleasedReturnValue();

      }
      v22 = v93;
      v16 = v92;
    }

    v21 = v119;
    goto LABEL_63;
  }
  if (v33 && (objc_msgSend(v120, "isCached") & 1) == 0)
  {
    objc_msgSend(v34, "peripheralInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stateNumber");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqual:", v52))
    {

      v41 = 0;
      v21 = v119;
      goto LABEL_15;
    }
    v109 = v22;
    objc_msgSend(v34, "peripheralInfo");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "broadcastKey");
    v61 = objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      v62 = (void *)v61;
      objc_msgSend(v34, "peripheralInfo");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "keyUpdatedStateNumber");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        v65 = (void *)MEMORY[0x1D17B7244]();
        v66 = v24;
        HMFGetOSLogHandle();
        v67 = objc_claimAutoreleasedReturnValue();
        v35 = v112;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v131 = v68;
          v132 = 2114;
          v133 = v119;
          _os_log_impl(&dword_1CCE01000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory: %{public}@ should be broadcast notifying.", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v65);
        Current = CFAbsoluteTimeGetCurrent();
        objc_msgSend(v34, "peripheralInfo");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "keyUpdatedTime");
        v72 = Current - v71;

        v41 = 0;
        v73 = a9;
        if (v72 > 86400.0)
          v73 = 3;
        v111 = v73;
        v129 = 1;
        goto LABEL_79;
      }
    }
    else
    {

    }
    v41 = 0;
    v35 = v112;
LABEL_79:
    v21 = v119;
    v22 = v109;
    v42 = v110;
    goto LABEL_63;
  }
  v41 = 0;
LABEL_15:
  v42 = v110;
LABEL_63:

LABEL_64:
  if (a13 == 1 || a13 == 2)
    v97 = (objc_class *)objc_opt_class();
  else
    v97 = 0;
  v98 = [v97 alloc];
  -[HAPAccessoryServerBrowser keyStore](v24, "keyStore");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v108) = a12;
  LOBYTE(v107) = v111;
  v34 = (void *)objc_msgSend(v98, "initWithPeripheral:name:pairingUsername:statusFlags:stateNumber:stateChanged:connectReason:configNumber:category:setupHash:connectionIdleTime:browser:keyStore:whbStableIdentifier:", v120, v117, v21, v35, v22, v16, v107, v116, v115, v42, v108, v24, v99, v113);

  if (v34)
  {
    +[HAPDiscoveredBTLEAccessoryServerTuple discoveredAccessoryServerTupleWithAccessoryServer:](HAPDiscoveredBTLEAccessoryServerTuple, "discoveredAccessoryServerTupleWithAccessoryServer:", v34);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE discoveredPeripheralsWithAccessories](v24, "discoveredPeripheralsWithAccessories");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setObject:forKey:", v100, v120);

    if (-[HAPAccessoryServerBrowserBTLE _delegateRespondsToSelector:](v24, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_))
    {
      -[HAPAccessoryServerBrowserBTLE delegateQueue](v24, "delegateQueue");
      v102 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __251__HAPAccessoryServerBrowserBTLE__createHAPAccessoryAndNotifyDelegateWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_connectionIdleTime_format_setupHash_encryptedPayload_whbStableIdentifier___block_invoke;
      block[3] = &unk_1E894A858;
      v122 = v41;
      v123 = v24;
      v124 = v34;
      v125 = v119;
      v127 = v129;
      v128 = v16;
      v126 = v22;
      dispatch_async(v102, block);

    }
LABEL_72:
    v50 = v22;
    goto LABEL_76;
  }
  v50 = v22;
  v103 = (void *)MEMORY[0x1D17B7244]();
  v104 = v24;
  HMFGetOSLogHandle();
  v105 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v131 = v106;
    v132 = 2114;
    v133 = v120;
    _os_log_impl(&dword_1CCE01000, v105, OS_LOG_TYPE_ERROR, "%{public}@Failed to create a HAPAccessoryServerBTLE instance for discovered peripheral %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v103);
  v34 = 0;
LABEL_76:

}

- (void)_performTimedConnectionRequestForIdentifier:(id)a3
{
  id v4;
  void *v5;
  HAPAccessoryServerBrowserBTLE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HAPAccessoryServerBrowserBTLE *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HAPAccessoryServerBrowserBTLE *v21;
  NSObject *v22;
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
  _BOOL4 v33;
  void *v34;
  HAPAccessoryServerBrowserBTLE *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  HAPAccessoryServerBrowserBTLE *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  HAPAccessoryServerBrowserBTLE *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = v8;
    v61 = 2114;
    v62 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to perform a timed connection request for accessory with identifier %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerBrowserBTLE _bleAccessoryServerTupleForIdentifier:](v6, "_bleAccessoryServerTupleForIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "blePeripheral");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v14;
      v61 = 2114;
      v62 = v15;
      v63 = 2114;
      v64 = v17;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@Found Accessory Server: %{public}@. Requesting discovery via peripheral: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v10, "discoverAccessories");
    goto LABEL_29;
  }
  -[HAPAccessoryServerBrowserBTLE _removeDiscoveredPeripheralsWithIdentifier:](v6, "_removeDiscoveredPeripheralsWithIdentifier:", v4);
  -[HAPAccessoryServerBrowserBTLE targetedScanAccessoryIdentifiers](v6, "targetedScanAccessoryIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v4);

  if (!v19)
  {
    -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](v6, "hapWiProxBLEBrowser");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trackedPeripheralForIdentifier:", v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](v6, "recentlySeenPairedPeripherals");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27 && objc_msgSend(v25, "isReachable"))
    {
      v28 = (void *)objc_msgSend(v25, "copy");
      objc_msgSend(v27, "stateNumber");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setStateNumber:", v29);

      objc_msgSend(v27, "configNumber");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setConfigNumber:", v30);

      objc_msgSend(v27, "category");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setCategory:", v31);

    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(v28, "statusFlags");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "integerValue"))
    {
      v33 = -[HAPAccessoryServerBrowser isPaired:](v6, "isPaired:", v4);

      if (v33)
      {
        v34 = (void *)MEMORY[0x1D17B7244]();
        v35 = v6;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v37 = v27;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v38;
          v61 = 2114;
          v62 = v4;
          _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_INFO, "%{public}@Found recently seen paired peripheral has invalid pairing status. %{public}@ - Finding it again", buf, 0x16u);

          v27 = v37;
        }

        objc_autoreleasePoolPop(v34);
        goto LABEL_25;
      }
    }
    else
    {

    }
    if (v28)
    {
      v58 = v27;
      v39 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v28, "setIsCached:", 1));
      v40 = v6;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v42;
        v61 = 2114;
        v62 = v28;
        _os_log_impl(&dword_1CCE01000, v41, OS_LOG_TYPE_INFO, "%{public}@Found accessory in recently seen tuple. Creating a new accessory server from peripheral: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(v28, "name");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "statusFlags");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stateNumber");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "configNumber");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "category");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v28, "advertisementFormat");
      objc_msgSend(v28, "setupHash");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "whbStableIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v53) = 0;
      LOBYTE(v52) = 1;
      -[HAPAccessoryServerBrowserBTLE _createHAPAccessoryAndNotifyDelegateWithPeripheral:name:pairingUsername:statusFlags:stateNumber:stateChanged:connectReason:configNumber:category:connectionIdleTime:format:setupHash:encryptedPayload:whbStableIdentifier:](v40, "_createHAPAccessoryAndNotifyDelegateWithPeripheral:name:pairingUsername:statusFlags:stateNumber:stateChanged:connectReason:configNumber:category:connectionIdleTime:format:setupHash:encryptedPayload:whbStableIdentifier:", v28, v57, v56, v55, v43, 0, v52, v54, v44, v53, v45, v46, 0, v47);

      v27 = v58;
      goto LABEL_28;
    }
LABEL_25:
    v48 = (void *)MEMORY[0x1D17B7244]();
    v49 = v6;
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v51;
      v61 = 2114;
      v62 = v4;
      v63 = 2114;
      v64 = v27;
      _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_INFO, "%{public}@Peripheral identifier without server %{public}@ - Finding it again. %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v48);
    -[HAPAccessoryServerBrowserBTLE _performTargetedScanForAccessoryWithIdentifier:](v49, "_performTargetedScanForAccessoryWithIdentifier:", v4);
LABEL_28:

    goto LABEL_29;
  }
  v20 = (void *)MEMORY[0x1D17B7244]();
  v21 = v6;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = v23;
    v61 = 2114;
    v62 = v4;
    _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%{public}@Targeted scan is in progress for server identifier: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
LABEL_29:

}

- (id)peripheralsWithConnectionRequests
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1E0C99D20];
  -[NSMutableOrderedSet array](self->_peripheralsWithConnectionRequests, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_addToActiveConnections:(id)a3
{
  id v4;
  NSMutableOrderedSet *peripheralsWithConnectionRequests;
  void *v6;
  NSMutableOrderedSet *v7;
  void *v8;
  void *v9;
  HAPAccessoryServerBrowserBTLE *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  peripheralsWithConnectionRequests = self->_peripheralsWithConnectionRequests;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(peripheralsWithConnectionRequests) = -[NSMutableOrderedSet containsObject:](peripheralsWithConnectionRequests, "containsObject:", v6);

  if ((peripheralsWithConnectionRequests & 1) != 0)
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    v7 = self->_peripheralsWithConnectionRequests;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet addObject:](v7, "addObject:", v8);

    os_unfair_lock_unlock(&self->super._lock);
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding active connection for peripheral: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_removeFromActiveConnections:(id)a3
{
  id v4;
  NSMutableOrderedSet *peripheralsWithConnectionRequests;
  void *v6;
  NSMutableOrderedSet *v7;
  void *v8;
  void *v9;
  HAPAccessoryServerBrowserBTLE *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  peripheralsWithConnectionRequests = self->_peripheralsWithConnectionRequests;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(peripheralsWithConnectionRequests) = -[NSMutableOrderedSet containsObject:](peripheralsWithConnectionRequests, "containsObject:", v6);

  if ((_DWORD)peripheralsWithConnectionRequests)
  {
    v7 = self->_peripheralsWithConnectionRequests;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet removeObject:](v7, "removeObject:", v8);

    os_unfair_lock_unlock(&self->super._lock);
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Removed active connection for peripheral: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->super._lock);
  }

}

- (id)peripheralsPendingConnection
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1E0C99D20];
  -[NSMutableOrderedSet array](self->_peripheralsPendingConnection, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_addToPendingConnections:(id)a3
{
  id v4;
  NSMutableOrderedSet *peripheralsPendingConnection;
  void *v6;
  NSMutableOrderedSet *v7;
  void *v8;
  void *v9;
  HAPAccessoryServerBrowserBTLE *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  peripheralsPendingConnection = self->_peripheralsPendingConnection;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(peripheralsPendingConnection) = -[NSMutableOrderedSet containsObject:](peripheralsPendingConnection, "containsObject:", v6);

  if ((peripheralsPendingConnection & 1) != 0)
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    v7 = self->_peripheralsPendingConnection;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet addObject:](v7, "addObject:", v8);

    os_unfair_lock_unlock(&self->super._lock);
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Pending connection to peripheral: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_removeFromPendingConnections:(id)a3
{
  id v4;
  NSMutableOrderedSet *peripheralsPendingConnection;
  void *v6;
  NSMutableOrderedSet *v7;
  void *v8;
  void *v9;
  HAPAccessoryServerBrowserBTLE *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  peripheralsPendingConnection = self->_peripheralsPendingConnection;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(peripheralsPendingConnection) = -[NSMutableOrderedSet containsObject:](peripheralsPendingConnection, "containsObject:", v6);

  if ((_DWORD)peripheralsPendingConnection)
  {
    v7 = self->_peripheralsPendingConnection;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet removeObject:](v7, "removeObject:", v8);

    os_unfair_lock_unlock(&self->super._lock);
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Removed pending connection for peripheral: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->super._lock);
  }

}

- (void)_connectHAPPeripheralWhenAllowed:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  HAPAccessoryServerBrowserBTLE *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  HAPAccessoryServerBrowserBTLE *v18;
  NSObject *v19;
  void *v20;
  int v21;
  int v22;
  unint64_t v23;
  void *v24;
  HAPAccessoryServerBrowserBTLE *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HAPAccessoryServerBrowserBTLE *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  HAPAccessoryServerBrowserBTLE *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HAPAccessoryServerBrowserBTLE *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  HAPAccessoryServerBrowserBTLE *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  char v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HAPAccessoryServerBrowserBTLE qosLimits](self, "qosLimits");
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE peripheralsWithConnectionRequests](v7, "peripheralsWithConnectionRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    -[HAPAccessoryServerBrowserBTLE peripheralsPendingConnection](v7, "peripheralsPendingConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v57 = v9;
    v58 = 2114;
    v59 = v10;
    v60 = 2048;
    v61 = v12;
    v62 = 2048;
    v63 = objc_msgSend(v13, "count");
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Connection request to peripheral: %{public}@, Current connection count : %tu, Pending: %tu", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v6);
  if (v5 == 2)
    goto LABEL_22;
  if (v5 == 1)
  {
    -[HAPAccessoryServerBrowserBTLE connectionsObserver](v7, "connectionsObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HAPAccessoryServerBrowserBTLE connectionsObserver](v7, "connectionsObserver");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "getAvailableHAPConnections");

      v17 = (void *)MEMORY[0x1D17B7244]();
      v18 = v7;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v20;
        v58 = 1024;
        LODWORD(v59) = v16;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@: Coex Recommendation = %d", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v17);
      v21 = v16 >= 3 ? 3 : v16;
      v22 = v16 >= 1 ? v21 : 3;
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17B7244]();
      v25 = v7;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v27;
        _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_DEBUG, "%{public}@: Not attached to connection observer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      v22 = 3;
    }
    v28 = (void *)MEMORY[0x1D17B7244]();
    v29 = v7;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v31;
      v58 = 1024;
      LODWORD(v59) = v22;
      _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_DEBUG, "%{public}@: Current available HAP BLE connections: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v28);
    v23 = v22;
  }
  else
  {
    v23 = 3;
  }
  -[HAPAccessoryServerBrowserBTLE peripheralsWithConnectionRequests](v7, "peripheralsWithConnectionRequests");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33 < v23)
  {
LABEL_22:
    -[HAPAccessoryServerBrowserBTLE _addToActiveConnections:](v7, "_addToActiveConnections:", v4);
    v55 = 0;
    -[HAPAccessoryServerBrowserBTLE _cbPeripheralForHAPBLEPeripheral:routeMode:](v7, "_cbPeripheralForHAPBLEPeripheral:routeMode:", v4, &v55);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v4, "setCbPeripheral:", v34));
      v36 = v7;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v55 & 1) != 0)
          v40 = CFSTR("WHB");
        else
          v40 = CFSTR("Local");
        v41 = (void *)MEMORY[0x1E0CB37E8];
        -[HAPAccessoryServerBrowserBTLE peripheralsWithConnectionRequests](v36, "peripheralsWithConnectionRequests");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v57 = v38;
        v58 = 2114;
        v59 = v39;
        v60 = 2114;
        v61 = (uint64_t)v40;
        v62 = 2114;
        v63 = (uint64_t)v43;
        _os_log_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_INFO, "%{public}@Connecting accessory: %{public}@ - route %{public}@. Connections #: %{public}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v35);
      -[HAPAccessoryServerBrowserBTLE centralManager](v36, "centralManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "connectPeripheral:options:", v34, 0);
    }
    else
    {
      v50 = (void *)MEMORY[0x1D17B7244]();
      v51 = v7;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v53;
        v58 = 2114;
        v59 = v54;
        _os_log_impl(&dword_1CCE01000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve a CBPeripheral for accessory: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v50);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryServerBrowserBTLE failedToConnectHAPPeripheral:error:](v51, "failedToConnectHAPPeripheral:error:", v4, v44);
    }

  }
  else
  {
    v45 = (void *)MEMORY[0x1D17B7244]();
    v46 = v7;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v48;
      v58 = 2114;
      v59 = v49;
      _os_log_impl(&dword_1CCE01000, v47, OS_LOG_TYPE_DEBUG, "%{public}@: Pending connection to peripheral: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v45);
    -[HAPAccessoryServerBrowserBTLE _addToPendingConnections:](v46, "_addToPendingConnections:", v4);
  }

}

- (void)_connectPendingConnections
{
  void *v3;
  HAPAccessoryServerBrowserBTLE *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  HAPAccessoryServerBrowserBTLE *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE peripheralsPendingConnection](v4, "peripheralsPendingConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    -[HAPAccessoryServerBrowserBTLE peripheralsWithConnectionRequests](v4, "peripheralsWithConnectionRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v6;
    v41 = 2048;
    v42 = v8;
    v43 = 2048;
    v44 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Current pending connections: %tu, Connected/Connecting: %tu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPAccessoryServerBrowserBTLE peripheralsPendingConnection](v4, "peripheralsPendingConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[HAPAccessoryServerBrowserBTLE peripheralsPendingConnection](v4, "peripheralsPendingConnection", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[HAPAccessoryServerBrowserBTLE _blePeripheralForAccessoryServerIdentifier:](v4, "_blePeripheralForAccessoryServerIdentifier:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](v4, "recentlySeenPairedPeripherals");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v21, "connectionPriority") == 1 && v15 == 0)
            v15 = v19;
          -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](v4, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v19, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "accessoryServer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "updateConnectionIdleTime:", 2);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v14);

      if (v15)
        goto LABEL_23;
    }
    else
    {

    }
    -[HAPAccessoryServerBrowserBTLE peripheralsPendingConnection](v4, "peripheralsPendingConnection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryServerBrowserBTLE _blePeripheralForAccessoryServerIdentifier:](v4, "_blePeripheralForAccessoryServerIdentifier:", v33);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
LABEL_23:
      -[HAPAccessoryServerBrowserBTLE _removeFromPendingConnections:](v4, "_removeFromPendingConnections:", v15);
      -[HAPAccessoryServerBrowserBTLE _connectHAPPeripheralWhenAllowed:](v4, "_connectHAPPeripheralWhenAllowed:", v15);

      return;
    }
    v25 = (void *)MEMORY[0x1D17B7244]();
    v26 = v4;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      v29 = "%{public}@No peripheral to connect";
      v30 = v27;
      v31 = OS_LOG_TYPE_ERROR;
      goto LABEL_26;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17B7244]();
    v26 = v4;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      v29 = "%{public}@No more pending connections";
      v30 = v27;
      v31 = OS_LOG_TYPE_DEBUG;
LABEL_26:
      _os_log_impl(&dword_1CCE01000, v30, v31, v29, buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v25);
}

- (void)_performTargetedScanForAccessoryWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HAPAccessoryServerBrowserBTLE targetedScanAccessoryIdentifiers](self, "targetedScanAccessoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[HAPAccessoryServerBrowserBTLE _updateTargetedScanTimer](self, "_updateTargetedScanTimer");
  -[HAPAccessoryServerBrowserBTLE _startBrowsingForLegacyHAPBTLE100Accessories](self, "_startBrowsingForLegacyHAPBTLE100Accessories");
  -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](self, "hapWiProxBLEBrowser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetLastSeenForTrackedAccessories:", v4);

  -[HAPAccessoryServerBrowserBTLE hapWiProxBLEBrowser](self, "hapWiProxBLEBrowser");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startBrowsingForHAPBLEAccessories");

}

- (void)_reportReachabilityForAccessoryWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HAPAccessoryServerBrowserBTLE *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerBrowserBTLE targetedScanAccessoryIdentifiers](self, "targetedScanAccessoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containsObject:", v4);

  -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](self, "identifiersWithReachabilityScanTuples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HAPAccessoryServerBrowser isPaired:](self, "isPaired:", v4))
  {
    -[HAPAccessoryServerBrowserBTLE delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryServerBrowser:didChangeReachability:forAccessoryServerWithIdentifier:", self, 1, v4);

  }
  if (v7)
  {
    -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](self, "identifiersWithReachabilityScanTuples");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v4);

    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v4;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Reporting reachability for accessory in reachability scan with identifier %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v7, "completion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v7, "queue");
      v15 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __79__HAPAccessoryServerBrowserBTLE__reportReachabilityForAccessoryWithIdentifier___block_invoke;
      v16[3] = &unk_1E894E0F8;
      v17 = v7;
      v18 = v4;
      dispatch_async(v15, v16);

    }
  }

}

- (BOOL)_shouldCreateHAPAccessoryServerWithIdentifier:(id)a3 statusFlags:(id)a4 stateNumber:(id)a5 category:(id)a6 configNumber:(id)a7 name:(id)a8 forPeripheral:(id)a9 advertisementFormat:(unint64_t)a10 setupHash:(id)a11 stateChanged:(BOOL *)a12 connectReason:(unsigned __int8 *)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  HAPAccessoryServerBrowserBTLE *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  char v44;
  void *v45;
  HAPAccessoryServerBrowserBTLE *v46;
  NSObject *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  HAPAccessoryServerBrowserBTLE *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  char v86;
  void *v87;
  HAPAccessoryServerBrowserBTLE *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v93;
  HAPAccessoryServerBrowserBTLE *v94;
  NSObject *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  BOOL v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  void *v111;
  void *context;
  void *contexta;
  HAPAccessoryServerBrowserBTLE *v114;
  int64_t v115;
  void *v116;
  void *v117;
  HAPAccessoryServerBrowserBTLE *v118;
  HAPAccessoryServerBrowserBTLE *v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  id v127;
  uint8_t buf[4];
  void *v129;
  __int16 v130;
  id v131;
  __int16 v132;
  uint64_t v133;
  __int16 v134;
  id v135;
  __int16 v136;
  uint64_t v137;
  __int16 v138;
  uint64_t v139;
  __int16 v140;
  void *v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v127 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v126 = a8;
  v23 = a9;
  v24 = a11;
  -[HAPAccessoryServerBrowserBTLE targetedScanAccessoryIdentifiers](self, "targetedScanAccessoryIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "containsObject:", v19);

  -[HAPAccessoryServerBrowserBTLE _reportReachabilityForAccessoryWithIdentifier:](self, "_reportReachabilityForAccessoryWithIdentifier:", v19);
  objc_msgSend(v23, "cbPeripheral");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "state");

  if (v28)
  {
LABEL_2:
    v29 = 0;
    goto LABEL_59;
  }
  if (v26)
  {
    *a13 = 1;
    -[HAPAccessoryServerBrowserBTLE targetedScanAccessoryIdentifiers](self, "targetedScanAccessoryIdentifiers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeObject:", v19);

    -[HAPAccessoryServerBrowserBTLE targetedScanAccessoryIdentifiers](self, "targetedScanAccessoryIdentifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {

    }
    else
    {
      -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](self, "identifiersWithReachabilityScanTuples");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (!v34)
      {
        -[HAPAccessoryServerBrowserBTLE targetedScanTimer](self, "targetedScanTimer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          -[HAPAccessoryServerBrowserBTLE targetedScanTimer](self, "targetedScanTimer");
          v36 = objc_claimAutoreleasedReturnValue();
          dispatch_source_cancel(v36);

          -[HAPAccessoryServerBrowserBTLE setTargetedScanTimer:](self, "setTargetedScanTimer:", 0);
        }
        -[HAPAccessoryServerBrowserBTLE _invalidTargetedScanActivity](self, "_invalidTargetedScanActivity");
        if (!-[HAPAccessoryServerBrowserBTLE isPerformingGeneralScan](self, "isPerformingGeneralScan"))
        {
          v37 = (void *)MEMORY[0x1D17B7244]();
          v38 = self;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v122 = v37;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v129 = v40;
            _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Stopping targeted scans after discovering the appropriate peripheral(s)", buf, 0xCu);

            v37 = v122;
          }

          objc_autoreleasePoolPop(v37);
          -[HAPAccessoryServerBrowserBTLE _stopActiveScanWithForce:](v38, "_stopActiveScanWithForce:", 0);
        }
      }
    }
    v32 = 1;
  }
  else if (-[HAPAccessoryServerBrowserBTLE isPerformingGeneralScan](self, "isPerformingGeneralScan")
         && !-[HAPAccessoryServerBrowser isPaired:](self, "isPaired:", v19))
  {
    v32 = 1;
    *a13 = 1;
  }
  else
  {
    v32 = 0;
  }
  -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](self, "recentlySeenPairedPeripherals");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKey:", v19);
  v42 = (id)objc_claimAutoreleasedReturnValue();

  if ((v32 & 1) != 0)
  {
    v29 = 1;
    if (!v42)
      goto LABEL_59;
    goto LABEL_50;
  }
  if (!v42)
  {
    if (!-[HAPAccessoryServerBrowser isPaired:](self, "isPaired:", v19))
    {
      v93 = (void *)MEMORY[0x1D17B7244]();
      v94 = self;
      HMFGetOSLogHandle();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v129 = v96;
        _os_log_impl(&dword_1CCE01000, v95, OS_LOG_TYPE_DEBUG, "%{public}@Discovered an unpaired accessory!", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v93);
      goto LABEL_2;
    }
    v42 = -[HAPRecentlySeenPairedBTLEPeripheralTuple initRecentlySeenPairedHAPBLEPeripheral:]([HAPRecentlySeenPairedBTLEPeripheralTuple alloc], "initRecentlySeenPairedHAPBLEPeripheral:", v23);
    v124 = v42;
    if (v42)
    {
      v45 = (void *)MEMORY[0x1D17B7244]();
      v46 = self;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v116 = v45;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortDescription");
        v109 = v23;
        v49 = v22;
        v50 = v20;
        v51 = v21;
        v52 = v24;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v129 = v48;
        v130 = 2114;
        v131 = v53;
        v132 = 2114;
        v133 = (uint64_t)v124;
        _os_log_impl(&dword_1CCE01000, v47, OS_LOG_TYPE_INFO, "%{public}@Adding accessory server: %{public}@ to recently seen paired peripherals: %{public}@", buf, 0x20u);

        v24 = v52;
        v21 = v51;
        v20 = v50;
        v22 = v49;
        v23 = v109;

        v45 = v116;
      }

      objc_autoreleasePoolPop(v45);
      -[HAPAccessoryServerBrowserBTLE recentlySeenPairedPeripherals](v46, "recentlySeenPairedPeripherals");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v124;
      objc_msgSend(v54, "setObject:forKey:", v124, v55);

    }
    -[HAPAccessoryServerBrowserBTLE cachedAccessoryForIdentifier:](self, "cachedAccessoryForIdentifier:", v19);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "peripheralInfo");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "stateNumber");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "isEqual:", v20))
    {
      objc_msgSend(v117, "lastKeyBagIdentityIndexFailingPV");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v58)
      {
        v115 = +[HAPBLEAccessoryCache currentDiscoveryVersion](HAPBLEAccessoryCache, "currentDiscoveryVersion");
        v97 = v23;
        v98 = v22;
        v99 = v20;
        v100 = v21;
        v101 = v24;
        v102 = objc_msgSend(v117, "discoveryVersion");

        v103 = v115 == v102;
        v24 = v101;
        v21 = v100;
        v20 = v99;
        v22 = v98;
        v23 = v97;
        v42 = v124;
        if (v103)
        {
          v29 = 0;
          goto LABEL_38;
        }
LABEL_35:
        context = (void *)MEMORY[0x1D17B7244]();
        v114 = self;
        HMFGetOSLogHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "peripheralInfo");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "stateNumber");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v22;
          v110 = v23;
          v60 = v20;
          v61 = v21;
          v62 = v24;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v117, "discoveryVersion"));
          v63 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[HAPBLEAccessoryCache currentDiscoveryVersion](HAPBLEAccessoryCache, "currentDiscoveryVersion"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "lastKeyBagIdentityIndexFailingPV");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544898;
          v129 = v108;
          v130 = 2114;
          v131 = v107;
          v132 = 2114;
          v133 = (uint64_t)v104;
          v134 = 2114;
          v135 = v60;
          v136 = 2114;
          v137 = v63;
          v66 = (void *)v63;
          v138 = 2114;
          v139 = (uint64_t)v64;
          v140 = 2114;
          v141 = v65;
          _os_log_impl(&dword_1CCE01000, v59, OS_LOG_TYPE_INFO, "%{public}@Creating accessory server for %{public}@ due to State Number: (%{public}@ -> %{public}@), BT Discovery Version: (%{public}@ -> %{public}@), KeyBagPVIndex: (%{public}@)", buf, 0x48u);

          v24 = v62;
          v21 = v61;
          v20 = v60;
          v22 = v105;
          v23 = v110;

          v42 = v124;
        }

        objc_autoreleasePoolPop(context);
        *a13 = 4;
        v29 = 1;
LABEL_38:

        if (!v42)
          goto LABEL_59;
        goto LABEL_50;
      }

    }
    goto LABEL_35;
  }
  v120 = v24;
  v123 = v42;
  if (v20)
  {
    objc_msgSend(v42, "stateNumber");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isEqualToNumber:", v20);

    if ((v44 & 1) != 0)
    {
      v29 = 0;
      v42 = v123;
      if (!v21)
        goto LABEL_49;
    }
    else
    {
      v74 = (void *)MEMORY[0x1D17B7244]();
      v119 = self;
      HMFGetOSLogHandle();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        contexta = v74;
        objc_msgSend(v123, "stateNumber");
        v76 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "monitorState");
        HMFBooleanToString();
        v77 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortDescription");
        v78 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v129 = v111;
        v130 = 2114;
        v131 = v19;
        v132 = 2114;
        v79 = (void *)v76;
        v133 = v76;
        v134 = 2114;
        v135 = v20;
        v136 = 2114;
        v137 = v77;
        v80 = (void *)v77;
        v138 = 2114;
        v139 = v78;
        v81 = (void *)v78;
        _os_log_impl(&dword_1CCE01000, v75, OS_LOG_TYPE_INFO, "%{public}@Accessory server: %{public}@ updated state number %{public}@ -> %{public}@. Monitoring state: %{public}@. %{public}@", buf, 0x3Eu);

        v74 = contexta;
      }

      objc_autoreleasePoolPop(v74);
      v42 = v123;
      v29 = objc_msgSend(v123, "monitorState");
      *a12 = 1;
      *a13 = 4;
      if (!v21)
        goto LABEL_49;
    }
LABEL_41:
    objc_msgSend(v42, "category");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "isEqualToNumber:", v21);

    if ((v68 & 1) == 0)
    {
      v69 = (void *)MEMORY[0x1D17B7244]();
      v70 = self;
      HMFGetOSLogHandle();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v118 = v70;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "category");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v129 = v72;
        v130 = 2114;
        v131 = v19;
        v132 = 2114;
        v133 = (uint64_t)v73;
        v134 = 2114;
        v135 = v21;
        _os_log_impl(&dword_1CCE01000, v71, OS_LOG_TYPE_INFO, "%{public}@Accessory server: %{public}@ updated category %{public}@ -> %{public}@", buf, 0x2Au);

        v70 = v118;
      }

      objc_autoreleasePoolPop(v69);
      *a13 = 4;
      v29 = 1;
    }
    v24 = v120;
    v42 = v123;
    goto LABEL_50;
  }
  v29 = 0;
  if (v21)
    goto LABEL_41;
LABEL_49:
  v24 = v120;
LABEL_50:
  v121 = v20;
  v82 = v21;
  if (v22)
  {
    v83 = v24;
    v125 = v42;
    objc_msgSend(v42, "configNumber");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v22;
    if (objc_msgSend(v84, "isEqualToNumber:", v22))
    {

      v42 = v125;
    }
    else
    {
      v86 = objc_msgSend(v23, "isCached");

      v42 = v125;
      if ((v86 & 1) == 0)
      {
        v87 = (void *)MEMORY[0x1D17B7244]();
        v88 = self;
        HMFGetOSLogHandle();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "configNumber");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v129 = v90;
          v130 = 2114;
          v131 = v19;
          v132 = 2114;
          v133 = (uint64_t)v91;
          v134 = 2114;
          v135 = v85;
          _os_log_impl(&dword_1CCE01000, v89, OS_LOG_TYPE_INFO, "%{public}@Invalidating cache for accessory: %{public}@ on config number update %{public}@ -> %{public}@", buf, 0x2Au);

          v42 = v125;
        }

        objc_autoreleasePoolPop(v87);
        -[HAPAccessoryServerBrowserBTLE removeCachedAccessoryWithIdentifier:](v88, "removeCachedAccessoryWithIdentifier:", v19);
        *a13 = 4;
        v29 = 1;
      }
    }
  }
  else
  {
    v85 = 0;
    v83 = v24;
  }
  objc_msgSend(v42, "updateWithPeripheral:", v23);

  v24 = v83;
  v21 = v82;
  v20 = v121;
  v22 = v85;
LABEL_59:

  return v29;
}

- (void)_updateTargetedScanTimer
{
  void *v3;
  HAPAccessoryServerBrowserBTLE *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  NSObject *v12;
  dispatch_source_t v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  HAPAccessoryServerBrowserBTLE *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Updating targeted scan timer.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPAccessoryServerBrowserBTLE targetedScanTimer](v4, "targetedScanTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    -[HAPAccessoryServerBrowserBTLE _invalidTargetedScanActivity](v4, "_invalidTargetedScanActivity");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:parent:options:", CFSTR("Targeted Scan"), 0, 2);
    -[HAPAccessoryServerBrowserBTLE setTargetedScanActivity:](v4, "setTargetedScanActivity:", v11);

    -[HAPAccessoryServerBrowser workQueue](v4, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);
    -[HAPAccessoryServerBrowserBTLE setTargetedScanTimer:](v4, "setTargetedScanTimer:", v13);

    objc_initWeak((id *)buf, v4);
    -[HAPAccessoryServerBrowserBTLE targetedScanTimer](v4, "targetedScanTimer");
    v14 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __57__HAPAccessoryServerBrowserBTLE__updateTargetedScanTimer__block_invoke;
    v20 = &unk_1E894DF38;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v4;
    dispatch_source_set_event_handler(v14, &v17);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
    -[HAPAccessoryServerBrowserBTLE targetedScanTimer](v4, "targetedScanTimer", v17, v18, v19, v20);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_walltime(0, 3000000000);
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);

    -[HAPAccessoryServerBrowserBTLE targetedScanTimer](v4, "targetedScanTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v9);
  }
  else
  {
    -[HAPAccessoryServerBrowserBTLE targetedScanTimer](v4, "targetedScanTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_walltime(0, 3000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  }

}

- (void)_invalidTargetedScanActivity
{
  void *v3;
  void *v4;

  -[HAPAccessoryServerBrowserBTLE targetedScanActivity](self, "targetedScanActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HAPAccessoryServerBrowserBTLE targetedScanActivity](self, "targetedScanActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[HAPAccessoryServerBrowserBTLE setTargetedScanActivity:](self, "setTargetedScanActivity:", 0);
  }
}

- (void)_handleTargetedScanTimeout
{
  void *v3;
  NSObject *v4;
  BOOL v5;
  void *v6;
  HAPAccessoryServerBrowserBTLE *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  void *v26;
  HAPAccessoryServerBrowserBTLE *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  HAPAccessoryServerBrowserBTLE *v49;
  NSObject *v50;
  uint64_t v51;
  HAPAccessoryServerBrowserBTLE *v52;
  void (*v53)(uint64_t);
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  id obj;
  id obja;
  _QWORD v61[6];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD block[4];
  id v67;
  _QWORD v68[4];
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  -[HAPAccessoryServerBrowserBTLE targetedScanTimer](self, "targetedScanTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HAPAccessoryServerBrowserBTLE targetedScanTimer](self, "targetedScanTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[HAPAccessoryServerBrowserBTLE setTargetedScanTimer:](self, "setTargetedScanTimer:", 0);
  }
  -[HAPAccessoryServerBrowserBTLE _invalidTargetedScanActivity](self, "_invalidTargetedScanActivity");
  v5 = -[HAPAccessoryServerBrowserBTLE isPerformingGeneralScan](self, "isPerformingGeneralScan");
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v76 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Canceling targeted scan timer but continuing to actively scan because a general scan has been requested.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](v7, "identifiersWithReachabilityScanTuples");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v71;
      do
      {
        v14 = 0;
        v57 = v12;
        do
        {
          if (*(_QWORD *)v71 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v14);
          -[HAPAccessoryServerBrowserBTLE identifiersWithReachabilityScanTuples](v7, "identifiersWithReachabilityScanTuples");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v17, "completion");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(v17, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[HAPAccessoryServerBrowserBTLE _blePeripheralForAccessoryServerIdentifier:](v7, "_blePeripheralForAccessoryServerIdentifier:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "cbPeripheral");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v21)
              {
                objc_msgSend(v17, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[HAPAccessoryServerBrowserBTLE _bleAccessoryServerTupleForIdentifier:](v7, "_bleAccessoryServerTupleForIdentifier:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "accessoryServer");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "peripheral");
                v21 = (void *)objc_claimAutoreleasedReturnValue();

              }
              v25 = objc_msgSend(v21, "state");
              v26 = (void *)MEMORY[0x1D17B7244]();
              v27 = v7;
              HMFGetOSLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
              if (v25)
              {
                if (v29)
                {
                  HMFGetLogIdentifier();
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "identifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v76 = v30;
                  v77 = 2114;
                  v78 = v31;
                  _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Targeted scan timed out, setting reachability for %{public}@ to YES as we are connected", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v26);
                objc_msgSend(v17, "queue");
                v32 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke_169;
                block[3] = &unk_1E894DD08;
                v67 = v17;
                dispatch_async(v32, block);
                v33 = &v67;
              }
              else
              {
                if (v29)
                {
                  HMFGetLogIdentifier();
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "identifier");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v76 = v34;
                  v77 = 2114;
                  v78 = v35;
                  _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Targeted scan timed out, setting reachability for %{public}@ to NO", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v26);
                objc_msgSend(v17, "queue");
                v32 = objc_claimAutoreleasedReturnValue();
                v68[0] = MEMORY[0x1E0C809B0];
                v68[1] = 3221225472;
                v68[2] = __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke;
                v68[3] = &unk_1E894DD08;
                v69 = v17;
                dispatch_async(v32, v68);
                v33 = &v69;
              }

              v12 = v57;
            }
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      }
      while (v12);
    }

  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v76 = v36;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Stopping targeted scans after timeout was received", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HAPAccessoryServerBrowserBTLE _stopActiveScanWithForce:](v7, "_stopActiveScanWithForce:", 0);
    -[HAPAccessoryServerBrowserBTLE _removeIdentifiersForReachabilityScan](v7, "_removeIdentifiersForReachabilityScan");
  }
  if (-[HAPAccessoryServerBrowserBTLE _delegateRespondsToSelector:](v7, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_))
  {
    v37 = (void *)MEMORY[0x1E0C99D20];
    -[HAPAccessoryServerBrowserBTLE targetedScanAccessoryIdentifiers](v7, "targetedScanAccessoryIdentifiers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "arrayWithArray:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obja = v39;
    v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v63;
      v43 = MEMORY[0x1E0C809B0];
      v44 = __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke_170;
      do
      {
        v45 = 0;
        v58 = v41;
        do
        {
          if (*(_QWORD *)v63 != v42)
            objc_enumerationMutation(obja);
          v46 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v45);
          -[HAPAccessoryServerBrowserBTLE targetedScanAccessoryIdentifiers](v7, "targetedScanAccessoryIdentifiers");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "removeObject:", v46);

          v48 = (void *)MEMORY[0x1D17B7244]();
          v49 = v7;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v51 = v42;
            v52 = v7;
            v53 = v44;
            v54 = v43;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v76 = v55;
            v77 = 2114;
            v78 = v46;
            _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegates that the targeted scan failed to discover accessory with identifier %{public}@", buf, 0x16u);

            v43 = v54;
            v44 = v53;
            v7 = v52;
            v42 = v51;
            v41 = v58;
          }

          objc_autoreleasePoolPop(v48);
          -[HAPAccessoryServerBrowserBTLE delegateQueue](v49, "delegateQueue");
          v56 = objc_claimAutoreleasedReturnValue();
          v61[0] = v43;
          v61[1] = 3221225472;
          v61[2] = v44;
          v61[3] = &unk_1E894E0F8;
          v61[4] = v49;
          v61[5] = v46;
          dispatch_async(v56, v61);

          ++v45;
        }
        while (v41 != v45);
        v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      }
      while (v41);
    }

  }
}

- (id)logIdentifier
{
  return CFSTR("BTLE Browser");
}

- (HAPAccessoryServerBrowserBTLEDelegate)delegate
{
  return (HAPAccessoryServerBrowserBTLEDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (CBConnectionsObserver)connectionsObserver
{
  return self->_connectionsObserver;
}

- (void)setConnectionsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_connectionsObserver, a3);
}

- (void)setHapWiProxBLEBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_hapWiProxBLEBrowser, a3);
}

- (NSMapTable)discoveredPeripheralsWithAccessories
{
  return self->_discoveredPeripheralsWithAccessories;
}

- (void)setDiscoveredPeripheralsWithAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredPeripheralsWithAccessories, a3);
}

- (NSMapTable)recentlySeenPairedPeripherals
{
  return self->_recentlySeenPairedPeripherals;
}

- (void)setRecentlySeenPairedPeripherals:(id)a3
{
  objc_storeStrong((id *)&self->_recentlySeenPairedPeripherals, a3);
}

- (NSMutableArray)powerOnCentralManagerCompletions
{
  return self->_powerOnCentralManagerCompletions;
}

- (void)setPowerOnCentralManagerCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_powerOnCentralManagerCompletions, a3);
}

- (id)reachabilityCompletion
{
  return self->_reachabilityCompletion;
}

- (void)setReachabilityCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (OS_dispatch_source)targetedScanTimer
{
  return self->_targetedScanTimer;
}

- (void)setTargetedScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_targetedScanTimer, a3);
}

- (HMFActivity)targetedScanActivity
{
  return self->_targetedScanActivity;
}

- (void)setTargetedScanActivity:(id)a3
{
  objc_storeStrong((id *)&self->_targetedScanActivity, a3);
}

- (NSMutableArray)targetedScanAccessoryIdentifiers
{
  return self->_targetedScanAccessoryIdentifiers;
}

- (void)setTargetedScanAccessoryIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_targetedScanAccessoryIdentifiers, a3);
}

- (NSMapTable)identifiersWithReachabilityScanTuples
{
  return self->_identifiersWithReachabilityScanTuples;
}

- (void)setIdentifiersWithReachabilityScanTuples:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersWithReachabilityScanTuples, a3);
}

- (int64_t)peripheralDisconnectionTimeout
{
  return self->_peripheralDisconnectionTimeout;
}

- (void)setPeripheralDisconnectionTimeout:(int64_t)a3
{
  self->_peripheralDisconnectionTimeout = a3;
}

- (NSMapTable)peripheralDisconnectionMonitorMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPeripheralDisconnectionMonitorMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheralDisconnectionMonitorMap, 0);
  objc_storeStrong((id *)&self->_identifiersWithReachabilityScanTuples, 0);
  objc_storeStrong((id *)&self->_targetedScanAccessoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_targetedScanActivity, 0);
  objc_storeStrong((id *)&self->_targetedScanTimer, 0);
  objc_storeStrong(&self->_reachabilityCompletion, 0);
  objc_storeStrong((id *)&self->_powerOnCentralManagerCompletions, 0);
  objc_storeStrong((id *)&self->_recentlySeenPairedPeripherals, 0);
  objc_storeStrong((id *)&self->_discoveredPeripheralsWithAccessories, 0);
  objc_storeStrong((id *)&self->_hapWiProxBLEBrowser, 0);
  objc_storeStrong((id *)&self->_connectionsObserver, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peripheralsPendingConnection, 0);
  objc_storeStrong((id *)&self->_peripheralsWithConnectionRequests, 0);
}

void __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v3 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, 0);

}

void __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke_169(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v3 = (void (**)(id, void *, uint64_t))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, 1);

}

void __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke_170(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFailToDiscoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __57__HAPAccessoryServerBrowserBTLE__updateTargetedScanTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidTargetedScanActivity");
    objc_msgSend(WeakRetained, "_handleTargetedScanTimeout");
  }

}

void __79__HAPAccessoryServerBrowserBTLE__reportReachabilityForAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void (**)(id, _QWORD, uint64_t))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40), 1);

}

void __251__HAPAccessoryServerBrowserBTLE__createHAPAccessoryAndNotifyDelegateWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_connectionIdleTime_format_setupHash_encryptedPayload_whbStableIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stateNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v4, v3, v5, v7, 1);

  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stateNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateStateForIdentifier:stateNumber:", v8, v11);

  if (!*(_QWORD *)(a1 + 32) || *(_BYTE *)(a1 + 72))
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 64));

  }
}

void __81__HAPAccessoryServerBrowserBTLE__monitorDisconnectionOfHAPPeripheral_peripheral___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "peripheralDisconnectionMonitorMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = WeakRetained;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543874;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to disconnect from peripheral: %@ with error: %{public}@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v7, "disconnectedHAPPeripheral:error:", *(_QWORD *)(a1 + 40), v5);

  }
}

void __65__HAPAccessoryServerBrowserBTLE_disconnectedHAPPeripheral_error___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HAPAccessoryServerBrowserBTLE_disconnectedHAPPeripheral_error___block_invoke_2;
    block[3] = &unk_1E894E120;
    v4 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = *(id *)(a1 + 48);
    dispatch_async(v3, block);

  }
}

uint64_t __65__HAPAccessoryServerBrowserBTLE_disconnectedHAPPeripheral_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfRemovedAccessoryServer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __93__HAPAccessoryServerBrowserBTLE_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowserBTLE:didDiscoverAccessoryWithAdvertisementData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_removeFromActiveConnections:", v3);
  objc_msgSend(WeakRetained, "_removeFromPendingConnections:", v3);
  objc_msgSend(WeakRetained, "discoveredPeripheralsWithAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

void __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke_3;
  block[3] = &unk_1E894CAB0;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = v4;
  dispatch_async(v2, block);

}

void __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke_3(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfRemovedAccessoryServer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 64));
  if (v2)
  {
    v3 = v2;
    v2[2](v2, *(_QWORD *)(a1 + 56));
    v2 = (void (**)(_QWORD, _QWORD))v3;
  }

}

void __188__HAPAccessoryServerBrowserBTLE__didDiscoverPeripheral_accessoryName_pairingIdentifier_format_statusFlags_stateNumber_category_configNumber_setupHash_encryptedPayload_whbStableIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 40), v3, 1, *(_QWORD *)(a1 + 48));

}

void __188__HAPAccessoryServerBrowserBTLE__didDiscoverPeripheral_accessoryName_pairingIdentifier_format_statusFlags_stateNumber_category_configNumber_setupHash_encryptedPayload_whbStableIdentifier___block_invoke_151(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFindAccessoryServer:stateChanged:stateNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));

}

void __80__HAPAccessoryServerBrowserBTLE__notifyDelegatesOfRemovedAccessoryServer_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didRemoveAccessoryServer:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __70__HAPAccessoryServerBrowserBTLE__removeIdentifiersForReachabilityScan__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v3 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, *(unsigned __int8 *)(a1 + 40));

}

uint64_t __82__HAPAccessoryServerBrowserBTLE__recentlySeenPairedPeripheralTupleWithPeripheral___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __55__HAPAccessoryServerBrowserBTLE_resetPairedAccessories__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pairedAccessoryIdentifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_forgetPairedAccessoryWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

uint64_t __67__HAPAccessoryServerBrowserBTLE_deRegisterAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forgetPairedAccessoryWithIdentifier:", *(_QWORD *)(a1 + 40));
}

void __81__HAPAccessoryServerBrowserBTLE_markNotifyingCharacteristicUpdatedForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "recentlySeenPairedPeripherals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "notifyingCharacteristicUpdated") & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "stateNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "unsignedShortValue") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStateNumber:", v6);

    v7 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v3, "setNotifyingCharacteristicUpdated:", 1));
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Incremented state number of recently seen peripheral: %{public}@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __56__HAPAccessoryServerBrowserBTLE_updateScanInBackground___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hapWiProxBLEBrowser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScanInBackground:", v1);

}

void __76__HAPAccessoryServerBrowserBTLE_stopTrackingBTLEAccessoriesWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "hapWiProxBLEBrowser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopTrackingHAPBLEAccessoriesWithIdentifiers:", *(_QWORD *)(a1 + 40));

}

void __70__HAPAccessoryServerBrowserBTLE_updateStateForIdentifier_stateNumber___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
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
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "recentlySeenPairedPeripherals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "stateNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = HAPCompareStateNumberWithRollover(v4, *(void **)(a1 + 48), 0xFFuLL);

    if (v5 == -1)
    {
      v6 = (void *)MEMORY[0x1D17B7244]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "stateNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        v52 = v9;
        v53 = 2114;
        v54 = v3;
        v55 = 2114;
        v56 = v10;
        v57 = 2114;
        v58 = v11;
        _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating State for recently seen accessory: %{public}@ to sync-up current/new: %{public}@/%{public}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(v3, "setStateNumber:", *(_QWORD *)(a1 + 48));
    }
  }
  v40 = v3;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "discoveredPeripheralsWithAccessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v48;
    v41 = v13;
    v45 = *(_QWORD *)v48;
    do
    {
      v17 = 0;
      v46 = v15;
      do
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v17);
        objc_msgSend(v18, "accessoryServer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v21)
        {
          objc_msgSend(v18, "accessoryServer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stateNumber");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = HAPCompareStateNumberWithRollover(v23, *(void **)(a1 + 48), 0xFFuLL);

          if (v24 == -1)
          {
            v25 = (void *)MEMORY[0x1D17B7244]();
            v26 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "accessoryServer");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "name");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "accessoryServer");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "accessoryServer");
              v44 = v25;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "stateNumber");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138544386;
              v52 = v28;
              v53 = 2112;
              v54 = v29;
              v55 = 2114;
              v56 = v30;
              v57 = 2114;
              v58 = v32;
              v59 = 2114;
              v60 = v33;
              _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating State for discovered tuple: %@ (%{public}@) to sync-up current/new: %{public}@/%{public}@", buf, 0x34u);

              v25 = v44;
              v13 = v41;

            }
            objc_autoreleasePoolPop(v25);
            v34 = *(_QWORD *)(a1 + 48);
            objc_msgSend(v18, "accessoryServer");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setStateNumber:", v34);

            v36 = *(_QWORD *)(a1 + 48);
            objc_msgSend(v18, "accessoryServer");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "blePeripheral");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setStateNumber:", v36);

            v16 = v45;
            v15 = v46;
          }
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v15);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateCachedStateForIdentifier:stateNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "hapWiProxBLEBrowser");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "updateStateForIdentifier:stateNumber:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __96__HAPAccessoryServerBrowserBTLE_configureAccessoryWithIdentifier_trackState_connectionPriority___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "recentlySeenPairedPeripherals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "updatePairedPeripheralConfiguration:connectionPriority:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __81__HAPAccessoryServerBrowserBTLE_resetLastSeenForAccessoryServersWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "hapWiProxBLEBrowser", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resetLastSeenForTrackedAccessories:", v7);

        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accessoryServerBrowser:didChangeReachability:forAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 40), 0, v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __111__HAPAccessoryServerBrowserBTLE__probeReachabilityForAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to probe reachability for accessory servers because BTLE failed to power on with error: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v8 = MEMORY[0x1D17B7400](*(_QWORD *)(a1 + 48));
    v9 = (void *)v8;
    if (v8)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_performTimedScanForIdentifiers:forceScan:withCompletion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }

}

void __110__HAPAccessoryServerBrowserBTLE_probeReachabilityForAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "_canStartScan"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_probeReachabilityForAccessoryServersWithIdentifiers:forceScan:withCompletion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "hapWiProxBLEBrowser");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startTrackingHAPBLEAccessoriesWithIdentifiers:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __66__HAPAccessoryServerBrowserBTLE_setReachabilityCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setReachabilityCompletion:", *(_QWORD *)(a1 + 40));
}

void __72__HAPAccessoryServerBrowserBTLE__discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v3;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to discover accessory server %{public}@ because BTLE failed to power on with error: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __72__HAPAccessoryServerBrowserBTLE__discoverAccessoryServerWithIdentifier___block_invoke_145;
      v12[3] = &unk_1E894E0F8;
      v11 = *(void **)(a1 + 40);
      v12[4] = *(_QWORD *)(a1 + 32);
      v13 = v11;
      dispatch_async(v10, v12);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_performTimedConnectionRequestForIdentifier:", *(_QWORD *)(a1 + 40));
  }

}

void __72__HAPAccessoryServerBrowserBTLE__discoverAccessoryServerWithIdentifier___block_invoke_145(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didFailToDiscoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __71__HAPAccessoryServerBrowserBTLE_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoverAccessoryServerWithIdentifier:", *(_QWORD *)(a1 + 40));
}

void __63__HAPAccessoryServerBrowserBTLE__startScanningForReachability___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didStartDiscoveringWithError:", *(_QWORD *)(a1 + 32), 0);

}

void __77__HAPAccessoryServerBrowserBTLE__startBrowsingForLegacyHAPBTLE100Accessories__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didStartDiscoveringWithError:", *(_QWORD *)(a1 + 32), 0);

}

void __58__HAPAccessoryServerBrowserBTLE__stopActiveScanWithForce___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didRemoveAccessoryServer:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

uint64_t __43__HAPAccessoryServerBrowserBTLE_pauseScans__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "centralManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopScan");

  objc_msgSend(*(id *)(a1 + 32), "hapWiProxBLEBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pauseScans");

  return objc_msgSend(*(id *)(a1 + 32), "setScanState:", 0);
}

uint64_t __100__HAPAccessoryServerBrowserBTLE_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_matchAccessoryServerWithSetupID:serverIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __64__HAPAccessoryServerBrowserBTLE_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _QWORD block[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "discoveredPeripheralsWithAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
      objc_msgSend(v8, "accessoryServer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "pendingRemovePairing");

      if (v10 == 1)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryServer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v16;
      v30 = 2114;
      v31 = v17;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Not stopping active scan because we have pending cancelled pairings to remove for accessory: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);

    if (objc_msgSend(*(id *)(a1 + 32), "remoteBrowsingEnabled"))
      goto LABEL_17;
  }
  else
  {
LABEL_9:

    objc_msgSend(*(id *)(a1 + 32), "targetedScanAccessoryIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "remoteBrowsingEnabled");

      if ((v12 & 1) == 0)
        goto LABEL_20;
    }
    else
    {

    }
LABEL_17:
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v21;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "%{public}@Stopping active scan because a client requested it and there aren't any outstanding targeted scans", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(*(id *)(a1 + 32), "_stopActiveScanWithForce:", 1);
  }
LABEL_20:
  objc_msgSend(*(id *)(a1 + 32), "setPerformingGeneralScan:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStopDiscoveringWithError_))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HAPAccessoryServerBrowserBTLE_stopDiscoveringAccessoryServers__block_invoke_125;
    block[3] = &unk_1E894DD08;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v22, block);

  }
}

void __64__HAPAccessoryServerBrowserBTLE_stopDiscoveringAccessoryServers__block_invoke_125(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didStopDiscoveringWithError:", *(_QWORD *)(a1 + 32), 0);

}

void __66__HAPAccessoryServerBrowserBTLE__startDiscoveringAccessoryServers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    if (objc_msgSend(v4, "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didStartDiscoveringWithError_))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __66__HAPAccessoryServerBrowserBTLE__startDiscoveringAccessoryServers__block_invoke_2;
      v6[3] = &unk_1E894E0F8;
      v6[4] = *(_QWORD *)(a1 + 32);
      v7 = v3;
      dispatch_async(v5, v6);

    }
  }
  else
  {
    objc_msgSend(v4, "_startBrowsingForLegacyHAPBTLE100Accessories");
    objc_msgSend(*(id *)(a1 + 32), "_updateTargetedScanTimer");
  }

}

void __66__HAPAccessoryServerBrowserBTLE__startDiscoveringAccessoryServers__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBrowser:didStartDiscoveringWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __65__HAPAccessoryServerBrowserBTLE_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_canStartScan");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_startDiscoveringAccessoryServers");
  return result;
}

uint64_t __51__HAPAccessoryServerBrowserBTLE_setDelegate_queue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", *(_QWORD *)(a1 + 48));
}

void __106__HAPAccessoryServerBrowserBTLE_updateBroadcastKeyForIdentifier_key_keyUpdatedStateNumber_keyUpdatedTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
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
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pairingIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Updating broadcast key for: %{public}@ and state number: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "peripheralInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveBroadcastKey:keyUpdatedStateNumber:updatedTime:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 32), "saveCacheToDisk:", v4);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v5;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cached accessory from accessory: %{public}@ with error: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __62__HAPAccessoryServerBrowserBTLE_cachedAccessoryForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v12);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v12;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v8 = (void *)MEMORY[0x1D17B7244]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = v11;
        v15 = 2114;
        v16 = v5;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cached accessory from accessory cache data: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __68__HAPAccessoryServerBrowserBTLE_setConnectionLatency_forPeripheral___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2 > 2)
      v3 = 0;
    else
      v3 = qword_1CCFA3170[v2];
    objc_msgSend(*(id *)(a1 + 40), "centralManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDesiredConnectionLatency:forPeripheral:", v3, *(_QWORD *)(a1 + 32));

  }
}

void __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  int8x16_t v34;
  _QWORD v35[4];
  int8x16_t v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "blePeripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "recentlySeenPairedPeripherals");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "cbPeripheral");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "state");

      if (v8 != 2)
      {
        objc_msgSend(*(id *)(a1 + 40), "hapWiProxBLEBrowser");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resetLastSeenForTrackedAccessories:", v10);

        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accessoryServerBrowser:didChangeReachability:forAccessoryServerWithIdentifier:", v12, 0, v13);

        if ((objc_msgSend(v2, "isCached") & 1) != 0
          || ((v14 = *(id *)(a1 + 32), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            ? (v15 = 0)
            : (v15 = v14),
              v16 = v15,
              v14,
              v17 = objc_msgSend(v16, "hasBeenDiscovered"),
              v16,
              (v17 & 1) == 0))
        {
          objc_msgSend(*(id *)(a1 + 40), "recentlySeenPairedPeripherals");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObjectForKey:", v19);

        }
      }
      v20 = (void *)MEMORY[0x1D17B7244](objc_msgSend(v6, "setNotifyingCharacteristicUpdated:", 0));
      v21 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v23;
        v40 = 2114;
        v41 = v24;
        v42 = 2112;
        v43 = v2;
        _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%{public}@Cancelling Connection for server, %{public}@, from CB Peripheral: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(*(id *)(a1 + 40), "_removeFromPendingConnections:", v2);
      v25 = *(void **)(a1 + 40);
      objc_msgSend(v2, "cbPeripheral");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_disconnectFromHAPBLEPeripheral:cbPeripheral:", v2, v26);

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17B7244]();
      v28 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v39 = v30;
        v40 = 2114;
        v41 = v31;
        _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to find accessory in discoveredAccessory map: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 54);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_removeFromActiveConnections:", v2);
      objc_msgSend(*(id *)(a1 + 40), "disconnectedHAPPeripheral:error:", v2, v32);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke_100;
      v35[3] = &unk_1E894A740;
      v34 = *(int8x16_t *)(a1 + 32);
      v33 = (id)v34.i64[0];
      v36 = vextq_s8(v34, v34, 8uLL);
      v37 = v32;
      v6 = v32;
      objc_msgSend(v33, "handleDisconnectionWithError:completionHandler:", v6, v35);

    }
  }

}

void __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke_100(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke_2;
  block[3] = &unk_1E894E120;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

uint64_t __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfRemovedAccessoryServer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __62__HAPAccessoryServerBrowserBTLE_connectToBTLEAccessoryServer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  int8x16_t v17;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  int8x16_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "blePeripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(*(id *)(a1 + 40), "discoveredPeripheralsWithAccessories"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "objectForKey:", v2),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportConnection:linkType:accessoryCategory:", v6, 2, v7);

    objc_msgSend(*(id *)(a1 + 40), "_connectHAPPeripheralWhenAllowed:", v2);
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      v25 = 2114;
      v26 = v12;
      v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to find accessory in discoveredAccessory map: %{public}@/%{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    if (objc_msgSend(*(id *)(a1 + 40), "_delegateRespondsToSelector:", sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __62__HAPAccessoryServerBrowserBTLE_connectToBTLEAccessoryServer___block_invoke_96;
      v21 = &unk_1E894E0F8;
      v17 = *(int8x16_t *)(a1 + 32);
      v15 = (id)v17.i64[0];
      v22 = vextq_s8(v17, v17, 8uLL);
      dispatch_async(v14, &block);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 54, *(_OWORD *)&v17, block, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "handleConnectionWithPeripheral:withError:", 0, v16);
    objc_msgSend(*(id *)(a1 + 40), "_notifyDelegatesOfRemovedAccessoryServer:error:", *(_QWORD *)(a1 + 32), v16);

  }
}

void __62__HAPAccessoryServerBrowserBTLE_connectToBTLEAccessoryServer___block_invoke_96(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryServerBrowser:didFailToDiscoverAccessoryServerWithIdentifier:", v2, v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t140 != -1)
    dispatch_once(&logCategory__hmf_once_t140, &__block_literal_global_6138);
  return (id)logCategory__hmf_once_v141;
}

void __44__HAPAccessoryServerBrowserBTLE_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v141;
  logCategory__hmf_once_v141 = v0;

}

@end
