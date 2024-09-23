@implementation HMDFetchedAccessorySettingsController

- (HMDFetchedAccessorySettingsController)initWithQueue:(id)a3 dataSource:(id)a4 drivers:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDFetchedAccessorySettingsController *v13;

  v8 = (void *)MEMORY[0x24BDD16D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDFetchedAccessorySettingsController initWithQueue:dataSource:drivers:notificationCenter:](self, "initWithQueue:dataSource:drivers:notificationCenter:", v11, v10, v9, v12);

  return v13;
}

- (HMDFetchedAccessorySettingsController)initWithQueue:(id)a3 dataSource:(id)a4 drivers:(id)a5 notificationCenter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDFetchedAccessorySettingsController *v15;
  HMDFetchedAccessorySettingsController *v16;
  uint64_t v17;
  NSMutableSet *pendingFetchKeyPaths;
  HMDFetchedAccessorySettingsControllerMutableKeyPathMap *v19;
  id v20;
  HMDFetchedAccessorySettingsController *v21;
  uint64_t v22;
  void *v23;
  HMDFetchedAccessorySettingsControllerMutableKeyPathMap *driverMap;
  uint64_t v25;
  NSMutableDictionary *keyPathToSettingCache;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  OS_os_log *logger;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)HMDFetchedAccessorySettingsController;
  v15 = -[HMDFetchedAccessorySettingsController init](&v40, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_dataSource, a4);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    pendingFetchKeyPaths = v16->_pendingFetchKeyPaths;
    v16->_pendingFetchKeyPaths = (NSMutableSet *)v17;

    v19 = [HMDFetchedAccessorySettingsControllerMutableKeyPathMap alloc];
    v20 = v13;
    if (v19)
    {
      v41.receiver = v19;
      v41.super_class = (Class)HMDFetchedAccessorySettingsControllerMutableKeyPathMap;
      v21 = -[HMDFetchedAccessorySettingsController init](&v41, sel_init);
      if (v21)
      {
        v22 = objc_msgSend(v20, "mutableCopy");
        v23 = *(void **)&v21->_lock._os_unfair_lock_opaque;
        *(_QWORD *)&v21->_lock._os_unfair_lock_opaque = v22;

      }
    }
    else
    {
      v21 = 0;
    }

    driverMap = v16->_driverMap;
    v16->_driverMap = (HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)v21;

    v16->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v16->_notificationCenter, v14);
    v25 = objc_opt_new();
    keyPathToSettingCache = v16->_keyPathToSettingCache;
    v16->_keyPathToSettingCache = (NSMutableDictionary *)v25;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v20;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v37;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v31), "driver", (_QWORD)v36);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setDelegate:", v16);

          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v29);
    }

    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    logger = v16->_logger;
    v16->_logger = (OS_os_log *)v33;

  }
  return v16;
}

- (void)start
{
  NSObject *logger;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  unint64_t v17;
  uint8_t buf[8];

  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LocalSettingsFetch", ", buf, 2u);
  }
  -[HMDFetchedAccessorySettingsController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setupActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)buf = v6;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BE3F138]);
    v9 = (void *)MEMORY[0x24BDD17C8];
    MEMORY[0x227675180](self, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@, %s:%ld"), v10, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables/Sources/homed/Media/Media Accessory/Apple/Settings/Fetched Settings/HMDFetchedAccessorySettingsController.m", 184);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = objc_msgSend(v8, "initWithName:", v11);

  }
  -[HMDFetchedAccessorySettingsController dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentAccessorySetupMetricDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "markSetupBeginStage:error:", 5, 0);

  -[HMDFetchedAccessorySettingsController queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDFetchedAccessorySettingsController_start__block_invoke;
  block[3] = &unk_24E796490;
  block[4] = self;
  v16 = *(id *)buf;
  v17 = 0xEEEEB0B5B2B2EEEELL;
  dispatch_async(v14, block);

  __HMFActivityScopeLeave();
}

- (void)fetchSettingsForKeyPaths:(id)a3 completion:(id)a4
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
  -[HMDFetchedAccessorySettingsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)updateSettingWithKeyPath:(id)a3 settingValue:(id)a4 completion:(id)a5
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
  -[HMDFetchedAccessorySettingsController queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __90__HMDFetchedAccessorySettingsController_updateSettingWithKeyPath_settingValue_completion___block_invoke;
  v15[3] = &unk_24E79B3F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)languageValueListWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDFetchedAccessorySettingsController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__HMDFetchedAccessorySettingsController_languageValueListWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)cachedSettingForKeyPath:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyPathToSettingCache, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)driver:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDFetchedAccessorySettingsController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  HMDFetchedAccessorySettingsController *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDFetchedAccessorySettingsController *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(_QWORD *, void *);
  void *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDFetchedAccessorySettingsController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received setting updates", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDFetchedAccessorySettingsController driverMap](v10, "driverMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap availableKeyPaths](v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x24BDAC760];
  v35 = 3221225472;
  v36 = __66__HMDFetchedAccessorySettingsController_driver_didUpdateSettings___block_invoke;
  v37 = &unk_24E783418;
  v18 = v15;
  v38 = v18;
  v19 = v16;
  v39 = v19;
  v20 = v17;
  v40 = v20;
  objc_msgSend(v7, "na_filter:", &v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    v22 = v7;
    v23 = v6;
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v10;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = v18;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v27;
      v43 = 2112;
      v44 = v20;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Ignoring updates for unknown keypaths: %@", buf, 0x16u);

      v18 = v33;
    }

    objc_autoreleasePoolPop(v24);
    v6 = v23;
    v7 = v22;
  }
  if (objc_msgSend(v21, "count", v33, v34, v35, v36, v37))
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = v10;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v31 = v18;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v32;
      v43 = 2114;
      v44 = v19;
      v45 = 2112;
      v46 = v21;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Received update for keyPaths: %{public}@ settings: %@", buf, 0x20u);

      v18 = v31;
    }

    objc_autoreleasePoolPop(v28);
    -[HMDFetchedAccessorySettingsController _updateCacheWithSettings:]((uint64_t)v29, v21);
    -[HMDFetchedAccessorySettingsController _postUpdateEventsIfDifferent:](v29, v21);
    -[HMDFetchedAccessorySettingsController _postNotificationForSettings:](v29, v21);
  }

}

- (void)driver:(id)a3 didUpdatePrimaryUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDFetchedAccessorySettingsController *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Primary user is not supported", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)driverDidReload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  id Property;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMDFetchedAccessorySettingsController *v15;
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
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDFetchedAccessorySettingsController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDFetchedAccessorySettingsController driverMap](self, "driverMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
    Property = objc_getProperty(v6, v7, 8, 1);
  else
    Property = 0;
  v10 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __57__HMDFetchedAccessorySettingsController_driverDidReload___block_invoke;
  v29[3] = &unk_24E783440;
  v11 = v4;
  v30 = v11;
  objc_msgSend(Property, "na_firstObjectPassingTest:", v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && (objc_msgSend(v12, "driver"), v13 = (id)objc_claimAutoreleasedReturnValue(), v13, v13 == v11))
  {
    v18 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v12, "keyPaths");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDFetchedAccessorySettingsController pendingFetchKeyPaths](self, "pendingFetchKeyPaths");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setByAddingObjectsFromSet:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");
    -[HMDFetchedAccessorySettingsController setPendingFetchKeyPaths:](self, "setPendingFetchKeyPaths:", v23);

    objc_initWeak((id *)buf, self);
    objc_msgSend(v12, "keyPaths");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    v26[1] = 3221225472;
    v26[2] = __57__HMDFetchedAccessorySettingsController_driverDidReload___block_invoke_2;
    v26[3] = &unk_24E783468;
    objc_copyWeak(&v28, (id *)buf);
    v25 = v20;
    v27 = v25;
    objc_msgSend(v11, "fetchSettingsForKeyPaths:completion:", v24, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);

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
      *(_DWORD *)buf = 138543618;
      v32 = v17;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Did not find driver in list %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDFetchedAccessorySettingsControllerDataSource)dataSource
{
  return (HMDFetchedAccessorySettingsControllerDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (HMDFetchedAccessorySettingsControllerMutableKeyPathMap)driverMap
{
  return (HMDFetchedAccessorySettingsControllerMutableKeyPathMap *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableSet)pendingFetchKeyPaths
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPendingFetchKeyPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_loadWeakRetained((id *)&self->_notificationCenter);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_storeStrong((id *)&self->_pendingFetchKeyPaths, 0);
  objc_storeStrong((id *)&self->_driverMap, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_keyPathToSettingCache, 0);
}

BOOL __57__HMDFetchedAccessorySettingsController_driverDidReload___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "driver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __57__HMDFetchedAccessorySettingsController_driverDidReload___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    -[HMDFetchedAccessorySettingsController applyFetchedSettings:requestedKeyPaths:](v4, v6);
  }

}

- (void)applyFetchedSettings:(void *)a1 requestedKeyPaths:(void *)a2
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__HMDFetchedAccessorySettingsController_applyFetchedSettings_requestedKeyPaths___block_invoke;
  v4[3] = &unk_24E7833F0;
  v4[4] = a1;
  objc_msgSend(a2, "na_filter:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[HMDFetchedAccessorySettingsController _postUpdateEventsIfDifferent:](a1, v3);
    -[HMDFetchedAccessorySettingsController _updateCacheWithSettings:]((uint64_t)a1, v3);
    -[HMDFetchedAccessorySettingsController _postNotificationForSettings:](a1, v3);
  }

}

uint64_t __80__HMDFetchedAccessorySettingsController_applyFetchedSettings_requestedKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "pendingFetchKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "na_safeContainsObject:", v5);
  return v6;
}

- (void)_postUpdateEventsIfDifferent:(void *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
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
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id obj;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
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
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(a1, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventSourceIdentifierNameForFetchedSettingsController:", a1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_msgSend(a1, "pendingFetchKeyPaths");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v41 = v3;
    obj = v3;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (!v47)
      goto LABEL_27;
    v46 = *(_QWORD *)v51;
    v44 = a1;
    while (1)
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v51 != v46)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v9, "keyPath");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v9, "keyPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v43, "containsObject:", v12);

          if (v13)
          {
            v14 = (void *)MEMORY[0x227676638]();
            v15 = a1;
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "keyPath");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v55 = v17;
              v56 = 2114;
              v57 = v18;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Removing keyPath %{public}@ from pending fetch", buf, 0x16u);

              a1 = v44;
            }

            objc_autoreleasePoolPop(v14);
            objc_msgSend(v15, "pendingFetchKeyPaths");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "keyPath");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeObject:", v20);

          }
        }
        objc_msgSend(a1, "dataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "keyPath");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "controller:topicForKeyPath:", a1, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "dataSource");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "eventStoreReadHandle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "lastEventForTopic:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          v27 = 0;
          goto LABEL_24;
        }
        v48 = v25;
        v49 = 0;
        objc_msgSend(MEMORY[0x24BDD7708], "decodeSettingFromEvent:error:", v26, &v49);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v49;
        if (v28)
        {
          v29 = (void *)MEMORY[0x227676638]();
          v30 = a1;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v55 = v32;
            v56 = 2112;
            v57 = v23;
            v58 = 2112;
            v59 = v28;
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v29);
          a1 = v44;
        }

        if (!v27 || !objc_msgSend(v27, "isEqual:", v9))
        {
          v25 = v48;
LABEL_24:
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7708]), "initWithSetting:eventSource:eventTimestamp:", v9, v45, v7);
          objc_msgSend(a1, "dataSource");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "eventForwarder");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "forwardEvent:topic:completion:", v38, v23, &__block_literal_global_67);

          goto LABEL_25;
        }
        v33 = (void *)MEMORY[0x227676638]();
        v34 = a1;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "keyPath");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v55 = v36;
          v56 = 2114;
          v57 = v37;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Skip sending event for keyPath: %{public}@ as it matches stored", buf, 0x16u);

          a1 = v44;
        }

        objc_autoreleasePoolPop(v33);
        v25 = v48;
LABEL_25:

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (!v47)
      {
LABEL_27:

        v3 = v41;
        break;
      }
    }
  }

}

- (void)_updateCacheWithSettings:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          v9 = *(void **)(a1 + 16);
          objc_msgSend(v8, "keyPath", (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

- (void)_postNotificationForSettings:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  obj = a2;
  if (a1)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
          objc_msgSend(a1, "notificationCenter");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "dataSource");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v17[1] = CFSTR("HMDFetchedAccessorySettingsControllerSettingsUpdateNotification");
          v18[0] = v7;
          v17[0] = CFSTR("HMDFetchedAccessorySettingsControllerSettingsUpdateNotificationSettingValueCodingKey");
          objc_msgSend(v7, "keyPath");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v18[1] = v10;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("HMDFetchedAccessorySettingsControllerSettingsUpdateNotification"), v9, v11);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v4);
    }
  }

}

uint64_t __66__HMDFetchedAccessorySettingsController_driver_didUpdateSettings___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v5);

  if ((_DWORD)v3)
    v6 = (void *)a1[5];
  else
    v6 = (void *)a1[6];
  objc_msgSend(v4, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  v8 = (void *)a1[4];
  objc_msgSend(v4, "keyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "containsObject:", v9);
  return v10;
}

void __73__HMDFetchedAccessorySettingsController_languageValueListWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "driverMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap objectForKeyedSubscript:](v3, CFSTR("root.siri.availableLanguages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageValueListWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __90__HMDFetchedAccessorySettingsController_updateSettingWithKeyPath_settingValue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "driverMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap availableKeyPaths](v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40));

  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v36 = 138543618;
      v37 = v10;
      v38 = 2114;
      v39 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Got setting update request keyPath: %{public}@", (uint8_t *)&v36, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v12 = *(id *)(a1 + 48);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    v15 = *(id *)(a1 + 48);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    v18 = *(id *)(a1 + 48);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "driverMap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap objectForKeyedSubscript:](v21, *(void **)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateSettingWithKeyPath:BOOLSettingValue:completion:", *(_QWORD *)(a1 + 40), v14, *(_QWORD *)(a1 + 56));
    }
    else if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "driverMap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap objectForKeyedSubscript:](v21, *(void **)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateSettingWithKeyPath:integerSettingValue:completion:", *(_QWORD *)(a1 + 40), v17, *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (!v20)
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *(_QWORD *)(a1 + 40);
          v34 = *(void **)(a1 + 48);
          v36 = 138543874;
          v37 = v32;
          v38 = 2114;
          v39 = v33;
          v40 = 2112;
          v41 = v34;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Do not support provided type for update keypath: %{public}@ settingValue: %@", (uint8_t *)&v36, 0x20u);

        }
        objc_autoreleasePoolPop(v29);
        v35 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v21);
        goto LABEL_23;
      }
      objc_msgSend(*(id *)(a1 + 32), "driverMap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap objectForKeyedSubscript:](v21, *(void **)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateSettingWithKeyPath:languageSettingValue:completion:", *(_QWORD *)(a1 + 40), v20, *(_QWORD *)(a1 + 56));
    }

LABEL_23:
    goto LABEL_24;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "driverMap");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap availableKeyPaths](v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138543874;
    v37 = v23;
    v38 = 2114;
    v39 = v24;
    v40 = 2114;
    v41 = v27;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Provided keypath: %{public}@ not in available keypaths: %{public}@", (uint8_t *)&v36, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v28 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v28 + 16))(v28, v14);
LABEL_24:

}

void __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  const char *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SEL v28;
  id v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id Property;
  void *v38;
  void *v39;
  void *v40;
  HMDFetchedAccessorySettingsControllerKeyPathMapItem *v41;
  void *v42;
  HMDFetchedAccessorySettingsControllerKeyPathMapItem *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id obj;
  id obja;
  void *v69;
  void *v70;
  void *v71;
  _QWORD block[4];
  id v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  NSObject *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t v90[128];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v92 = v5;
    v93 = 2114;
    v94 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received fetch request for keyPaths: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "driverMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap availableKeyPaths](v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)v9;
  if ((objc_msgSend(v71, "isSubsetOfSet:", v9) & 1) == 0)
  {
    objc_msgSend(v71, "hmf_removedObjectsFromSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "driverMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap availableKeyPaths](v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v92 = v14;
      v93 = 2114;
      v94 = v10;
      v95 = 2114;
      v96 = v17;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Some provided keypaths: %{public}@ not in available keypaths: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObject:", v18);

  }
  v19 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "driverMap");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = a1;
  v21 = *(id *)(a1 + 40);
  v63 = v21;
  v64 = v20;
  if (v20)
  {
    v23 = v21;
    -[HMDFetchedAccessorySettingsControllerMutableKeyPathMap availableKeyPaths](v20, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v25;
    objc_msgSend(v25, "hmf_removedObjectsFromSet:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v29 = objc_getProperty(v20, v28, 8, 1);
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
    if (v30)
    {
      v32 = v30;
      v33 = *(_QWORD *)v87;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v87 != v33)
            objc_enumerationMutation(v29);
          v35 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v34);
          v36 = (void *)MEMORY[0x24BDBCF20];
          if (v35)
            Property = objc_getProperty(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v34), v31, 16, 1);
          else
            Property = 0;
          objc_msgSend(v36, "setWithArray:", Property);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "hmf_removedObjectsFromSet:", v27);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "allObjects");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v40, "count"))
          {
            v41 = [HMDFetchedAccessorySettingsControllerKeyPathMapItem alloc];
            objc_msgSend(v35, "driver");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = -[HMDFetchedAccessorySettingsControllerKeyPathMapItem initWithDriver:keyPaths:](v41, "initWithDriver:keyPaths:", v42, v40);
            objc_msgSend(obj, "addObject:", v43);

          }
          ++v34;
        }
        while (v32 != v34);
        v44 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
        v32 = v44;
      }
      while (v44);
    }

    v45 = (void *)objc_msgSend(obj, "copy");
  }
  else
  {
    v45 = 0;
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obja = v45;
  v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v83 != v48)
          objc_enumerationMutation(obja);
        v50 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        dispatch_group_enter(v19);
        v51 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v50, "keyPaths");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setWithArray:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "na_setByIntersectingWithSet:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "allObjects");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "driver");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v78[0] = MEMORY[0x24BDAC760];
        v78[1] = 3221225472;
        v78[2] = __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke_56;
        v78[3] = &unk_24E7993D8;
        v79 = v69;
        v80 = v70;
        v81 = v19;
        objc_msgSend(v56, "fetchSettingsForKeyPaths:completion:", v55, v78);

      }
      v47 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    }
    while (v47);
  }

  objc_msgSend(*(id *)(v65 + 32), "queue");
  v57 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke_2;
  block[3] = &unk_24E799A68;
  v58 = *(_QWORD *)(v65 + 32);
  v59 = *(void **)(v65 + 40);
  v73 = v70;
  v74 = v58;
  v75 = v59;
  v76 = v69;
  v77 = *(id *)(v65 + 48);
  v60 = v69;
  v61 = v70;
  dispatch_group_notify(v19, v57, block);

}

void __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __77__HMDFetchedAccessorySettingsController_fetchSettingsForKeyPaths_completion___block_invoke_2(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@At least one of the driver's returned an error setting error on completion", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = 138543874;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Finishing fetch request for keyPaths: %{public}@ restuls: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __46__HMDFetchedAccessorySettingsController_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  const char *v4;
  void *v5;
  id Property;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[5];
  id v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  _QWORD *v35;
  id v36;
  id location;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  const __CFString *v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_group_create();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__102012;
  v42[4] = __Block_byref_object_dispose__102013;
  v43 = 0;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "driverMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
    Property = objc_getProperty(v3, v4, 8, 1);
  else
    Property = 0;
  obj = Property;

  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v7)
  {
    v23 = *(_QWORD *)v39;
    do
    {
      v24 = v7;
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        dispatch_group_enter(v2);
        objc_msgSend(v9, "keyPaths");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "pendingFetchKeyPaths");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setByAddingObjectsFromSet:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(*(id *)(a1 + 32), "setPendingFetchKeyPaths:", v14);

        v15 = *(id *)(a1 + 40);
        v44 = CFSTR("keyPaths");
        v45 = v10;
        v16 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);

        objc_initWeak(&location, *(id *)(a1 + 32));
        objc_msgSend(v9, "driver");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __46__HMDFetchedAccessorySettingsController_start__block_invoke_43;
        v29[3] = &unk_24E783380;
        objc_copyWeak(&v36, &location);
        v30 = v2;
        v18 = v10;
        v31 = v18;
        v32 = v9;
        v33 = *(id *)(a1 + 40);
        v35 = v42;
        v19 = v11;
        v34 = v19;
        objc_msgSend(v17, "startWithKeyPaths:completion:", v18, v29);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDFetchedAccessorySettingsController_start__block_invoke_54;
  block[3] = &unk_24E7833A8;
  v21 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v27 = v42;
  v28 = *(_QWORD *)(a1 + 48);
  v26 = v21;
  dispatch_group_notify(v2, v20, block);

  _Block_object_dispose(v42, 8);
}

void __46__HMDFetchedAccessorySettingsController_start__block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  id v31;
  void *v32;
  os_unfair_lock_s *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[3];
  _QWORD v39[3];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = v8;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v8;
      v15 = v6;
      v16 = v5;
      v17 = a3;
      v18 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "driver");
      v37 = a1;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v13;
      v42 = 2114;
      v43 = v18;
      a3 = v17;
      v5 = v16;
      v6 = v15;
      v8 = v14;
      v44 = 2112;
      v45 = v19;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched at startup: keyPaths: %{public}@ settings from driver: %@", buf, 0x20u);

      a1 = v37;
    }

    objc_autoreleasePoolPop(v10);
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v11;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v23;
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched at startup: settings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v24 = *(void **)(a1 + 56);
    v39[0] = *(_QWORD *)(a1 + 40);
    v38[0] = CFSTR("keyPaths");
    v38[1] = CFSTR("error.code");
    v25 = (void *)MEMORY[0x24BDD16E0];
    v26 = v24;
    objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v6, "code"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v27;
    v38[2] = CFSTR("domain");
    objc_msgSend(v6, "domain");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    v30 = &stru_24E79DB48;
    if (v28)
      v30 = (const __CFString *)v28;
    v39[2] = v30;
    v31 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);

    if (v6)
    {
      v32 = (void *)MEMORY[0x227676638]();
      v33 = (os_unfair_lock_s *)v21;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = a1;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v36;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Driver error on start %@", buf, 0x16u);

        a1 = v35;
      }

      objc_autoreleasePoolPop(v32);
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
      os_unfair_lock_unlock(v33 + 2);
    }
    -[HMDFetchedAccessorySettingsController applyFetchedSettings:requestedKeyPaths:](v21, v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __46__HMDFetchedAccessorySettingsController_start__block_invoke_54(uint64_t a1)
{
  os_unfair_lock_s *v2;
  id v3;
  os_signpost_id_t v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  __uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id *v26;
  NSObject *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  double v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  os_unfair_lock_unlock(v2);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(id **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v32 = v3;
  if (v5)
  {
    objc_msgSend(v5, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = CFSTR("error.code");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v32, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = CFSTR("domain");
    v38[0] = v8;
    objc_msgSend(v32, "domain");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_24E79DB48;
    if (v9)
      v11 = (const __CFString *)v9;
    v38[1] = v11;
    v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);

    v13 = v5[3];
    v14 = v13;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v14, OS_SIGNPOST_INTERVAL_END, v4, "LocalSettingsFetch", ", buf, 2u);
    }

    v15 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "end"));
    v16 = v5;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setupStartTimestamp");
      *(_DWORD *)buf = 138543618;
      v34 = v18;
      v35 = 2048;
      v36 = v20;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Setup start timestamp %f", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v21 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    objc_msgSend(v16, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setupStartTimestamp");
    v24 = v23;

    v25 = (void *)MEMORY[0x227676638]();
    v26 = v16;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (double)(v21 / 0x3B9ACA00) - v24;
      if (v28 >= 0.0)
        v29 = (double)(v21 / 0x3B9ACA00) - v24;
      else
        v29 = -v28;
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v30;
      v35 = 2048;
      v36 = v29;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Settings creation latency %f", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(v7, "setSetupStartTimestamp:", 0.0);
    objc_msgSend(v7, "currentAccessorySetupMetricDispatcher");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "markSetupEndStage:error:", 5, v32);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_102039 != -1)
    dispatch_once(&logCategory__hmf_once_t0_102039, &__block_literal_global_30_102040);
  return (id)logCategory__hmf_once_v1_102041;
}

void __52__HMDFetchedAccessorySettingsController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_102041;
  logCategory__hmf_once_v1_102041 = v0;

}

@end
