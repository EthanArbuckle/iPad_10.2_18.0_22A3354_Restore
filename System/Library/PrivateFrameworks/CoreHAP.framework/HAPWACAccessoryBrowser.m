@implementation HAPWACAccessoryBrowser

- (HAPWACAccessoryBrowser)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HAPWACAccessoryBrowser *v9;
  HAPWACAccessoryBrowser *v10;
  uint64_t v11;
  NSMutableSet *foundUnconfiguredUnpairedAccessories;
  uint64_t v13;
  NSMutableSet *foundUnconfiguredPairedAccessories;
  uint64_t v15;
  NSMutableSet *found2Pt4Networks;
  CUWiFiScanner *cuWiFiScanner;
  uint64_t v18;
  HMFTimer *backoffTimer;
  HMFTimer *v20;
  void *v21;
  HAPWACAccessoryBrowser *v22;
  HAPWACAccessoryBrowser *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v28.receiver = self;
    v28.super_class = (Class)HAPWACAccessoryBrowser;
    v9 = -[HAPAccessoryServerBrowser initWithQueue:](&v28, sel_initWithQueue_, v7);
    v10 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_delegate, v6);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      foundUnconfiguredUnpairedAccessories = v10->_foundUnconfiguredUnpairedAccessories;
      v10->_foundUnconfiguredUnpairedAccessories = (NSMutableSet *)v11;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = objc_claimAutoreleasedReturnValue();
      foundUnconfiguredPairedAccessories = v10->_foundUnconfiguredPairedAccessories;
      v10->_foundUnconfiguredPairedAccessories = (NSMutableSet *)v13;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = objc_claimAutoreleasedReturnValue();
      found2Pt4Networks = v10->_found2Pt4Networks;
      v10->_found2Pt4Networks = (NSMutableSet *)v15;

      cuWiFiScanner = v10->_cuWiFiScanner;
      v10->_cuWiFiScanner = 0;

      v10->_state = 0;
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 10.0);
      backoffTimer = v10->_backoffTimer;
      v10->_backoffTimer = (HMFTimer *)v18;

      -[HMFTimer setDelegate:](v10->_backoffTimer, "setDelegate:", v10);
      v20 = v10->_backoffTimer;
      -[HAPAccessoryServerBrowser workQueue](v10, "workQueue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFTimer setDelegateQueue:](v20, "setDelegateQueue:", v21);

    }
    v22 = v10;
    v23 = v22;
  }
  else
  {
    v24 = (void *)MEMORY[0x1D17B7244]();
    v22 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failing HAP Browser instantioation - nil delegate", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v23 = 0;
  }

  return v23;
}

- (void)initWiFiScannerWithScanner:(id)a3
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
  v7[2] = __53__HAPWACAccessoryBrowser_initWiFiScannerWithScanner___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_initWiFiScannerWithScanner:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  -[HAPWACAccessoryBrowser setCuWiFiScanner:](self, "setCuWiFiScanner:", v4);
  objc_msgSend(v4, "setLabel:", CFSTR("HAPWACBrowser"));
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDispatchQueue:", v5);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke;
  v11[3] = &unk_1E894D998;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "setDeviceFoundHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke_144;
  v9[3] = &unk_1E894D998;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "setDeviceLostHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke_145;
  v7[3] = &unk_1E894D9C0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "setDeviceChangedHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HAPWACAccessoryBrowser *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAPWACAccessoryBrowser backoffTimer](self, "backoffTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    if (-[HAPWACAccessoryBrowser state](self, "state") != 4)
    {
      if (-[HAPWACAccessoryBrowser state](self, "state") == 3)
      {
        -[HAPWACAccessoryBrowser setState:](self, "setState:", 4);
        -[HAPWACAccessoryBrowser cuWiFiScanner](self, "cuWiFiScanner");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "suspend");

        -[HAPWACAccessoryBrowser backoffTimer](self, "backoffTimer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resume");

        goto LABEL_10;
      }
      if (-[HAPWACAccessoryBrowser state](self, "state") != 1)
      {
        v7 = (void *)MEMORY[0x1D17B7244]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_5;
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v10;
        v17 = 2048;
        v18 = -[HAPWACAccessoryBrowser state](v8, "state");
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Incorrect state %tu on backoff timer expiry", (uint8_t *)&v15, 0x16u);
        goto LABEL_4;
      }
      -[HAPWACAccessoryBrowser scanning2Pt4SSID](self, "scanning2Pt4SSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        -[HAPWACAccessoryBrowser _restartBrowsingWithAllNetworks](self, "_restartBrowsingWithAllNetworks");
        goto LABEL_10;
      }
      -[HAPWACAccessoryBrowser _reportFound2Pt4Network:](self, "_reportFound2Pt4Network:", 0);
    }
    -[HAPWACAccessoryBrowser _handleBrowsingBackOffTimerExpiry](self, "_handleBrowsingBackOffTimerExpiry");
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryBrowser backoffTimer](v8, "backoffTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = (uint64_t)v4;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Timer mismatch: %@/%@", (uint8_t *)&v15, 0x20u);

LABEL_4:
  }
LABEL_5:

  objc_autoreleasePoolPop(v7);
LABEL_10:

}

- (void)_handleBrowsingBackOffTimerExpiry
{
  void *v3;
  HAPWACAccessoryBrowser *v4;
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
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryBrowser foundUnconfiguredUnpairedAccessories](v4, "foundUnconfiguredUnpairedAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryBrowser found2Pt4Networks](v4, "found2Pt4Networks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryBrowser foundUnconfiguredPairedAccessories](v4, "foundUnconfiguredPairedAccessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Stopping the suspended browse, clearing foundUnconfiguredUnpairedAccessories %@, foundNetworks: %@, foundUnconfiguredPairedAccessories: %@", (uint8_t *)&v15, 0x2Au);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  -[HAPWACAccessoryBrowser setCuWiFiScanner:](v4, "setCuWiFiScanner:", 0);
  -[HAPWACAccessoryBrowser backoffTimer](v4, "backoffTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suspend");

  -[HAPWACAccessoryBrowser setState:](v4, "setState:", 0);
  -[HAPWACAccessoryBrowser foundUnconfiguredUnpairedAccessories](v4, "foundUnconfiguredUnpairedAccessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[HAPWACAccessoryBrowser found2Pt4Networks](v4, "found2Pt4Networks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[HAPWACAccessoryBrowser foundUnconfiguredPairedAccessories](v4, "foundUnconfiguredPairedAccessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

}

- (void)_restartBrowsingWithAllNetworks
{
  void *v3;
  HAPWACAccessoryBrowser *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Restarting browsing for all networks", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suspend");

  -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScanFlags:", 3);

  -[HAPWACAccessoryBrowser setState:](v4, "setState:", 2);
  -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)startDiscoveringAccessoryServers
{
  void *v4;
  HAPWACAccessoryBrowser *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HAPAccessoryServerBrowser workQueue](v5, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HAPWACAccessoryBrowser_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = v5;
  dispatch_async(v9, block);

}

- (void)startDiscoveringAirPlayAccessoriesWithDelegate:(id)a3
{
  id v4;
  void *v5;
  HAPWACAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Discovering AirPlay Accessories", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerBrowser workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__HAPWACAccessoryBrowser_startDiscoveringAirPlayAccessoriesWithDelegate___block_invoke;
  v11[3] = &unk_1E894E0F8;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  HAPWACAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Discovering with identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPAccessoryServerBrowser workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__HAPWACAccessoryBrowser_discoverAccessoryServerWithIdentifier___block_invoke;
  v11[3] = &unk_1E894E0F8;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)_startBrowsingForWACAccessories
{
  void *v3;
  HAPWACAccessoryBrowser *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HAPWACAccessoryBrowser *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  HAPWACAccessoryBrowser *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  HAPWACAccessoryBrowser *v44;
  NSObject *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v58 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Starting to discover WAC accessories", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D1B480]);
    -[HAPWACAccessoryBrowser setCuWiFiScanner:](v4, "setCuWiFiScanner:", v8);

    -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryBrowser _initWiFiScannerWithScanner:](v4, "_initWiFiScannerWithScanner:", v9);

  }
  -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (-[HAPWACAccessoryBrowser state](v4, "state"))
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[HAPWACAccessoryBrowser foundUnconfiguredUnpairedAccessories](v4, "foundUnconfiguredUnpairedAccessories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v12)
      {
        v14 = v12;
        v15 = *(_QWORD *)v53;
        *(_QWORD *)&v13 = 138543618;
        v47 = v13;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v53 != v15)
              objc_enumerationMutation(v11);
            v17 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v16);
            v18 = (void *)MEMORY[0x1D17B7244]();
            v19 = v4;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v47;
              v58 = v21;
              v59 = 2112;
              v60 = v17;
              _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Reporting previously found unconfigured accessory: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v18);
            -[HAPWACAccessoryBrowser delegate](v19, "delegate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "wacBrowser:didFindHAPWACAccessory:", v19, v17);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        }
        while (v14);
      }

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[HAPWACAccessoryBrowser foundUnconfiguredPairedAccessories](v4, "foundUnconfiguredPairedAccessories");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v24)
      {
        v26 = v24;
        v27 = *(_QWORD *)v49;
        *(_QWORD *)&v25 = 138543618;
        v47 = v25;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v49 != v27)
              objc_enumerationMutation(v23);
            v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v28);
            v30 = (void *)MEMORY[0x1D17B7244]();
            v31 = v4;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v47;
              v58 = v33;
              v59 = 2112;
              v60 = v29;
              _os_log_impl(&dword_1CCE01000, v32, OS_LOG_TYPE_DEBUG, "%{public}@Reporting previously found configured accessory: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v30);
            -[HAPWACAccessoryBrowser delegate](v31, "delegate");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "wacBrowser:didFindUnconfiguredPairedHAPWACAccessory:", v31, v29);

            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v26);
      }

    }
    -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner", v47);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setScanFlags:", 1);

    -[HAPWACAccessoryBrowser scanning2Pt4SSID](v4, "scanning2Pt4SSID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSsid:", v36);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPWACAccessoryBrowser setBrowsingStartTime:](v4, "setBrowsingStartTime:", v38);

    -[HAPWACAccessoryBrowser backoffTimer](v4, "backoffTimer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "resume");

    v40 = -[HAPWACAccessoryBrowser state](v4, "state");
    -[HAPWACAccessoryBrowser cuWiFiScanner](v4, "cuWiFiScanner");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v40 == 4)
      objc_msgSend(v41, "resume");
    else
      objc_msgSend(v41, "activate");

    -[HAPWACAccessoryBrowser setState:](v4, "setState:", 1);
  }
  else
  {
    v43 = (void *)MEMORY[0x1D17B7244]();
    v44 = v4;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v46;
      _os_log_impl(&dword_1CCE01000, v45, OS_LOG_TYPE_ERROR, "%{public}@Error instantiating CUWiFiScanner", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
  }
}

- (void)stopDiscoveringAccessoryServers
{
  void *v4;
  HAPWACAccessoryBrowser *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HAPAccessoryServerBrowser workQueue](v5, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HAPWACAccessoryBrowser_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = v5;
  dispatch_async(v9, block);

}

- (void)_stopBrowsingForWACAccessories
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[HAPWACAccessoryBrowser state](self, "state") == 2)
  {
    -[HAPWACAccessoryBrowser cuWiFiScanner](self, "cuWiFiScanner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suspend");

    v4 = 4;
  }
  else
  {
    if (-[HAPWACAccessoryBrowser state](self, "state") != 1)
      return;
    v4 = 3;
  }
  -[HAPWACAccessoryBrowser setState:](self, "setState:", v4);
  -[HAPWACAccessoryBrowser backoffTimer](self, "backoffTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

}

- (void)handleFoundUnconfiguredUnpairedWACDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPWACAccessoryBrowser *v9;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HAPWACAccessoryBrowser_handleFoundUnconfiguredUnpairedWACDevice___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_addFoundUnconfiguredUnpairedWACDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HAPWACAccessoryBrowser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "supportsAirPlay"))
  {
    -[HAPWACAccessoryBrowser airplayDelegate](self, "airplayDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1D17B7244]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Found AirPlay WAC Accessory: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      -[HAPWACAccessoryBrowser airplayDelegate](v7, "airplayDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cuWiFiDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "wacBrowser:didFindAirPlayDevice:", v7, v11);

    }
  }
  -[HAPWACAccessoryBrowser _handleNewUnconfiguredUnpairedWACDevice:](self, "_handleNewUnconfiguredUnpairedWACDevice:", v4);

}

- (void)handleFoundAPDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPWACAccessoryBrowser *v9;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HAPWACAccessoryBrowser_handleFoundAPDevice___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleNewUnconfiguredUnpairedWACDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HAPWACAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HAPWACAccessoryBrowser _removeUnconfiguredWACDevice:](self, "_removeUnconfiguredWACDevice:", v4);
  -[HAPWACAccessoryBrowser foundUnconfiguredUnpairedAccessories](self, "foundUnconfiguredUnpairedAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  -[HAPWACAccessoryBrowser browsingIdentifier](self, "browsingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (-[HAPWACAccessoryBrowser browsingIdentifier](self, "browsingIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "deviceId"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        v10))
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Reporting new HAP WAC Accessory: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HAPWACAccessoryBrowser delegate](v12, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wacBrowser:didFindHAPWACAccessory:", v12, v4);

  }
}

- (void)handleFoundUnconfiguredPairedWACDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPWACAccessoryBrowser *v9;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HAPWACAccessoryBrowser_handleFoundUnconfiguredPairedWACDevice___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleUnconfiguredPairedWACDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HAPWACAccessoryBrowser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPWACAccessoryBrowser foundUnconfiguredPairedAccessories](self, "foundUnconfiguredPairedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[HAPWACAccessoryBrowser browsingIdentifier](self, "browsingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (-[HAPWACAccessoryBrowser browsingIdentifier](self, "browsingIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "deviceId"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        v9))
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Reporting HomeKit Paired WAC Accessory: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HAPWACAccessoryBrowser delegate](v11, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "wacBrowser:didFindUnconfiguredPairedHAPWACAccessory:", v11, v4);

  }
}

- (void)handleChangeUnconfiguredWACDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPWACAccessoryBrowser *v9;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HAPWACAccessoryBrowser_handleChangeUnconfiguredWACDevice___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleChangeUnconfiguredUnpairedWACAccessory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HAPWACAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HAPWACAccessoryBrowser *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HAPWACAccessoryBrowser foundUnconfiguredUnpairedAccessories](self, "foundUnconfiguredUnpairedAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "deviceId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "deviceId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
        {
          objc_msgSend(v10, "updateWithHAPWACAccessory:", v4);
          if (objc_msgSend(v4, "supportsAirPlay"))
          {
            -[HAPWACAccessoryBrowser airplayDelegate](self, "airplayDelegate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v21 = (void *)MEMORY[0x1D17B7244]();
              v22 = self;
              HMFGetOSLogHandle();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v32 = v24;
                v33 = 2112;
                v34 = v4;
                _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Changed AirPlay WAC Accessory: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v21);
              -[HAPWACAccessoryBrowser airplayDelegate](v22, "airplayDelegate");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "cuWiFiDevice");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "wacBrowser:didUpdateAirPlayDevice:", v22, v26);

            }
          }

          goto LABEL_18;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v7)
        continue;
      break;
    }
  }

  v14 = (void *)MEMORY[0x1D17B7244]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v17;
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Changed accessory %@ did not match previously found - handle as new", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWACAccessoryBrowser browsingStartTime](v15, "browsingStartTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v19);
  objc_msgSend(v4, "setDiscoveryTime:");

  -[HAPWACAccessoryBrowser _addFoundUnconfiguredUnpairedWACDevice:](v15, "_addFoundUnconfiguredUnpairedWACDevice:", v4);
LABEL_18:

}

- (void)_handleChangeUnconfiguredPairedWACAccessory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HAPWACAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HAPWACAccessoryBrowser foundUnconfiguredPairedAccessories](self, "foundUnconfiguredPairedAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "deviceId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "deviceId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
        {
          objc_msgSend(v10, "updateWithHAPWACAccessory:", v4);

          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v7)
        continue;
      break;
    }
  }

  v14 = (void *)MEMORY[0x1D17B7244]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Changed paired accessory %@ did not match previously found - handle as new", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWACAccessoryBrowser browsingStartTime](v15, "browsingStartTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v19);
  objc_msgSend(v4, "setDiscoveryTime:");

  -[HAPWACAccessoryBrowser _handleUnconfiguredPairedWACDevice:](v15, "_handleUnconfiguredPairedWACDevice:", v4);
LABEL_13:

}

- (void)handleRemovedUnconfiguredWACDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPWACAccessoryBrowser *v9;

  v4 = a3;
  -[HAPAccessoryServerBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HAPWACAccessoryBrowser_handleRemovedUnconfiguredWACDevice___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_removeUnconfiguredWACDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  HAPWACAccessoryBrowser *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HAPWACAccessoryBrowser *v21;
  NSObject *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HAPWACAccessoryBrowser foundUnconfiguredUnpairedAccessories](self, "foundUnconfiguredUnpairedAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
      objc_msgSend(v10, "deviceId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v13)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Removing accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = v10;

    if (v14)
    {
      -[HAPWACAccessoryBrowser foundUnconfiguredUnpairedAccessories](v16, "foundUnconfiguredUnpairedAccessories");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObject:", v14);

      v20 = (void *)MEMORY[0x1D17B7244]();
      v21 = v16;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Reporting removal of accessory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      -[HAPWACAccessoryBrowser delegate](v21, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "wacBrowser:didRemoveHAPWACAccessory:", v21, v14);
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:
    v14 = 0;
LABEL_16:

  }
  return v14;
}

- (id)visible2Pt4Networks
{
  void *v2;
  void *v3;

  -[HAPWACAccessoryBrowser found2Pt4Networks](self, "found2Pt4Networks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)scan2Pt4APWithSSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HAPWACAccessoryBrowser *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Scanning for 2.4 AP SSID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HAPAccessoryServerBrowser workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HAPWACAccessoryBrowser_scan2Pt4APWithSSID_completion___block_invoke;
  block[3] = &unk_1E894D9E8;
  block[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

- (void)_reportFound2Pt4Network:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HAPWACAccessoryBrowser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPWACAccessoryBrowser found2Pt4Completion](self, "found2Pt4Completion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[HAPWACAccessoryBrowser scanning2Pt4SSID](self, "scanning2Pt4SSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!v4)
      {
        v10 = (void *)MEMORY[0x1D17B7244]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543618;
          v17 = v14;
          v18 = 2112;
          v19 = 0;
          _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@No 2.4 AP found with ssid: %@", (uint8_t *)&v16, 0x16u);

        }
        goto LABEL_10;
      }
      -[HAPWACAccessoryBrowser scanning2Pt4SSID](self, "scanning2Pt4SSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", v4);

      if (v9)
      {
        v10 = (void *)MEMORY[0x1D17B7244]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543618;
          v17 = v13;
          v18 = 2112;
          v19 = v4;
          _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Found 2.4 AP found with ssid: %@", (uint8_t *)&v16, 0x16u);

        }
LABEL_10:

        objc_autoreleasePoolPop(v10);
        -[HAPWACAccessoryBrowser found2Pt4Completion](v11, "found2Pt4Completion");
        v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v15[2]();

        -[HAPWACAccessoryBrowser setFound2Pt4Completion:](self, "setFound2Pt4Completion:", 0);
        -[HAPWACAccessoryBrowser setScanning2Pt4SSID:](self, "setScanning2Pt4SSID:", 0);
        -[HAPWACAccessoryBrowser _handleBrowsingBackOffTimerExpiry](self, "_handleBrowsingBackOffTimerExpiry");
      }
    }
  }

}

- (id)logIdentifier
{
  return CFSTR("WAC Browser");
}

- (NSString)browsingIdentifier
{
  return self->_browsingIdentifier;
}

- (void)setBrowsingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_browsingIdentifier, a3);
}

- (NSDate)browsingStartTime
{
  return self->_browsingStartTime;
}

- (void)setBrowsingStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_browsingStartTime, a3);
}

- (HAPAirPlayAccessoryBrowserDelegate)airplayDelegate
{
  return (HAPAirPlayAccessoryBrowserDelegate *)objc_loadWeakRetained((id *)&self->_airplayDelegate);
}

- (void)setAirplayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_airplayDelegate, a3);
}

- (NSString)scanning2Pt4SSID
{
  return self->_scanning2Pt4SSID;
}

- (void)setScanning2Pt4SSID:(id)a3
{
  objc_storeStrong((id *)&self->_scanning2Pt4SSID, a3);
}

- (id)found2Pt4Completion
{
  return self->_found2Pt4Completion;
}

- (void)setFound2Pt4Completion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (HAPWACAccessoryBrowserDelegate)delegate
{
  return (HAPWACAccessoryBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableSet)foundUnconfiguredUnpairedAccessories
{
  return self->_foundUnconfiguredUnpairedAccessories;
}

- (void)setFoundUnconfiguredUnpairedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_foundUnconfiguredUnpairedAccessories, a3);
}

- (NSMutableSet)foundUnconfiguredPairedAccessories
{
  return self->_foundUnconfiguredPairedAccessories;
}

- (void)setFoundUnconfiguredPairedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_foundUnconfiguredPairedAccessories, a3);
}

- (NSMutableSet)found2Pt4Networks
{
  return self->_found2Pt4Networks;
}

- (void)setFound2Pt4Networks:(id)a3
{
  objc_storeStrong((id *)&self->_found2Pt4Networks, a3);
}

- (CUWiFiScanner)cuWiFiScanner
{
  return self->_cuWiFiScanner;
}

- (void)setCuWiFiScanner:(id)a3
{
  objc_storeStrong((id *)&self->_cuWiFiScanner, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (HMFTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_cuWiFiScanner, 0);
  objc_storeStrong((id *)&self->_found2Pt4Networks, 0);
  objc_storeStrong((id *)&self->_foundUnconfiguredPairedAccessories, 0);
  objc_storeStrong((id *)&self->_foundUnconfiguredUnpairedAccessories, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_found2Pt4Completion, 0);
  objc_storeStrong((id *)&self->_scanning2Pt4SSID, 0);
  objc_destroyWeak((id *)&self->_airplayDelegate);
  objc_storeStrong((id *)&self->_browsingStartTime, 0);
  objc_storeStrong((id *)&self->_browsingIdentifier, 0);
}

uint64_t __56__HAPWACAccessoryBrowser_scan2Pt4APWithSSID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setScanning2Pt4SSID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setFound2Pt4Completion:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "found2Pt4Networks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  v4 = *(void **)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "_reportFound2Pt4Network:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "_handleBrowsingBackOffTimerExpiry");
  return objc_msgSend(*(id *)(a1 + 32), "_startBrowsingForWACAccessories");
}

void __61__HAPWACAccessoryBrowser_handleRemovedUnconfiguredWACDevice___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HAPWACAccessory *v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v7 = -[HAPWACAccessory initWithWiFiDevice:]([HAPWACAccessory alloc], "initWithWiFiDevice:", *(_QWORD *)(a1 + 32));
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "_removeUnconfiguredWACDevice:", v7);
    if (-[HAPWACAccessory supportsAirPlay](v7, "supportsAirPlay"))
    {
      objc_msgSend(*(id *)(a1 + 40), "airplayDelegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 40), "airplayDelegate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(a1 + 40);
        -[HAPWACAccessory cuWiFiDevice](v7, "cuWiFiDevice");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "wacBrowser:didRemoveAirPlayDevice:", v5, v6);

      }
    }

  }
}

void __60__HAPWACAccessoryBrowser_handleChangeUnconfiguredWACDevice___block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  HAPWACAccessory *v4;

  v4 = -[HAPWACAccessory initWithWiFiDevice:]([HAPWACAccessory alloc], "initWithWiFiDevice:", *(_QWORD *)(a1 + 32));
  v2 = -[HAPWACAccessory homeKitPaired](v4, "homeKitPaired");
  v3 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "_handleChangeUnconfiguredPairedWACAccessory:", v4);
  else
    objc_msgSend(v3, "_handleChangeUnconfiguredUnpairedWACAccessory:", v4);

}

void __65__HAPWACAccessoryBrowser_handleFoundUnconfiguredPairedWACDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  HAPWACAccessory *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = -[HAPWACAccessory initWithWiFiDevice:]([HAPWACAccessory alloc], "initWithWiFiDevice:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "browsingStartTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", v3);
    -[HAPWACAccessory setDiscoveryTime:](v4, "setDiscoveryTime:");

    objc_msgSend(*(id *)(a1 + 40), "_handleUnconfiguredPairedWACDevice:", v4);
  }
}

void __46__HAPWACAccessoryBrowser_handleFoundAPDevice___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "ssid");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "state");

      if (v3 == 1)
      {
        v4 = (void *)MEMORY[0x1D17B7244]();
        v5 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "ssid");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v15 = v7;
          v16 = 2112;
          v17 = v8;
          _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Found 2.4 Network SSID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v4);
        objc_msgSend(*(id *)(a1 + 40), "found2Pt4Networks");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "ssid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        v11 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "ssid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_reportFound2Pt4Network:", v12);

      }
    }
    else
    {

    }
  }
}

void __67__HAPWACAccessoryBrowser_handleFoundUnconfiguredUnpairedWACDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  HAPWACAccessory *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = -[HAPWACAccessory initWithWiFiDevice:]([HAPWACAccessory alloc], "initWithWiFiDevice:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "browsingStartTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", v3);
    -[HAPWACAccessory setDiscoveryTime:](v4, "setDiscoveryTime:");

    objc_msgSend(*(id *)(a1 + 40), "_addFoundUnconfiguredUnpairedWACDevice:", v4);
  }
}

uint64_t __57__HAPWACAccessoryBrowser_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAirplayDelegate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_stopBrowsingForWACAccessories");
}

uint64_t __64__HAPWACAccessoryBrowser_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBrowsingIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_startBrowsingForWACAccessories");
}

uint64_t __73__HAPWACAccessoryBrowser_startDiscoveringAirPlayAccessoriesWithDelegate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAirplayDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_startBrowsingForWACAccessories");
}

uint64_t __58__HAPWACAccessoryBrowser_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBrowsingIdentifier:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_startBrowsingForWACAccessories");
}

void __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(v3, "deviceIEFlags") & 0x40000000) == 0 || (objc_msgSend(v3, "deviceIEFlags") & 0x400000) != 0)
  {
    if (objc_msgSend(v3, "deviceIEFlags"))
    {
      v9 = objc_msgSend(v3, "deviceIEFlags");
      v10 = (void *)MEMORY[0x1D17B7244]();
      v11 = WeakRetained;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if ((v9 & 0x400000) != 0)
      {
        if (v13)
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543618;
          v17 = v15;
          v18 = 2112;
          v19 = v3;
          _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Found unconfigured & paired WAC device %@", (uint8_t *)&v16, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        objc_msgSend(v11, "handleFoundUnconfiguredPairedWACDevice:", v3);
      }
      else
      {
        if (v13)
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138543618;
          v17 = v14;
          v18 = 2112;
          v19 = v3;
          _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Unhandled device: %@", (uint8_t *)&v16, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "handleFoundAPDevice:", v3);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Found unconfigured & unpaired WAC device %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "handleFoundUnconfiguredUnpairedWACDevice:", v3);
  }

}

void __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke_144(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(v3, "deviceIEFlags") & 0x40000000) != 0)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Lost device %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "handleRemovedUnconfiguredWACDevice:", v3);
  }

}

void __54__HAPWACAccessoryBrowser__initWiFiScannerWithScanner___block_invoke_145(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(v5, "deviceIEFlags") & 0x40000000) != 0)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      v15 = 1024;
      v16 = a3;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Device %@ changed with flags: %u", (uint8_t *)&v11, 0x1Cu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "handleChangeUnconfiguredWACDevice:", v5);
  }

}

uint64_t __53__HAPWACAccessoryBrowser_initWiFiScannerWithScanner___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initWiFiScannerWithScanner:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t37 != -1)
    dispatch_once(&logCategory__hmf_once_t37, &__block_literal_global_21333);
  return (id)logCategory__hmf_once_v38;
}

void __37__HAPWACAccessoryBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v38;
  logCategory__hmf_once_v38 = v0;

}

@end
