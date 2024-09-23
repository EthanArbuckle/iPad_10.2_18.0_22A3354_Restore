@implementation HMDCompositeSettingsControllerManager

- (HMDCompositeSettingsControllerManager)initWithDataSource:(id)a3 registry:(id)a4 controllerFactory:(id)a5 stateManagerFactory:(id)a6 logEventSubmitter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDCompositeSettingsControllerManager *v18;
  uint64_t v19;
  NSMapTable *stringToCompositeSettingsController;
  uint64_t v21;
  OS_dispatch_queue *workQueue;
  void *v23;
  id compositeSettingsControllerFactory;
  void *v25;
  uint64_t v26;
  void *stateManager;
  void *v28;
  id v29;
  HMDCompositeSettingControllerManagerStateManager *v30;
  uint64_t v31;
  HMDCompositeSettingControllerManagerStateManager *v32;
  HMDCompositeSettingsControllerManager *v34;
  SEL v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  HMDCompositeSettingsController *(*v39)(uint64_t, void *, uint64_t, void *, void *, void *);
  void *v40;
  id v41;
  id location;
  objc_super v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    v17 = v16;
    v43.receiver = self;
    v43.super_class = (Class)HMDCompositeSettingsControllerManager;
    v18 = -[HMDCompositeSettingsControllerManager init](&v43, sel_init);
    if (!v18)
    {
LABEL_9:

      return v18;
    }
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    stringToCompositeSettingsController = v18->_stringToCompositeSettingsController;
    v18->_stringToCompositeSettingsController = (NSMapTable *)v19;

    objc_storeWeak((id *)&v18->_dataSource, v12);
    objc_msgSend(v12, "workQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v18->_registry, a4);
    v23 = _Block_copy(v14);
    compositeSettingsControllerFactory = v18->_compositeSettingsControllerFactory;
    v18->_compositeSettingsControllerFactory = v23;

    objc_storeStrong((id *)&v18->_logEventSubmitter, a7);
    if (v14)
    {
      if (v15)
      {
LABEL_5:
        objc_msgSend(v12, "uuid", v37, v38, v39, v40);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v15 + 2))(v15, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        stateManager = v18->_stateManager;
        v18->_stateManager = (HMDCompositeSettingControllerManagerStateManager *)v26;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      objc_initWeak(&location, v18);
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __125__HMDCompositeSettingsControllerManager_initWithDataSource_registry_controllerFactory_stateManagerFactory_logEventSubmitter___block_invoke;
      v40 = &unk_1E89B97F0;
      objc_copyWeak(&v41, &location);
      v28 = _Block_copy(&v37);
      v29 = v18->_compositeSettingsControllerFactory;
      v18->_compositeSettingsControllerFactory = v28;

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
      if (v15)
        goto LABEL_5;
    }
    v30 = [HMDCompositeSettingControllerManagerStateManager alloc];
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    stateManager = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HMDCompositeSettingControllerManagerStateManager initWithDataSource:notificationRegistrationProvider:subscribeWithOptions:delegate:uuid:](v30, "initWithDataSource:notificationRegistrationProvider:subscribeWithOptions:delegate:uuid:", v18, v25, 15, v18, stateManager);
    v32 = v18->_stateManager;
    v18->_stateManager = (HMDCompositeSettingControllerManagerStateManager *)v31;

    goto LABEL_8;
  }
  v34 = (HMDCompositeSettingsControllerManager *)_HMFPreconditionFailure();
  return -[HMDCompositeSettingsControllerManager initWithDataSource:](v34, v35, v36);
}

- (HMDCompositeSettingsControllerManager)initWithDataSource:(id)a3
{
  id v4;
  HMDCompositeSettingsOwnerToDatabaseAdapterRegistry *v5;
  void *v6;
  HMDCompositeSettingsControllerManager *v7;

  v4 = a3;
  v5 = objc_alloc_init(HMDCompositeSettingsOwnerToDatabaseAdapterRegistry);
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCompositeSettingsControllerManager initWithDataSource:registry:controllerFactory:stateManagerFactory:logEventSubmitter:](self, "initWithDataSource:registry:controllerFactory:stateManagerFactory:logEventSubmitter:", v4, v5, 0, 0, v6);

  return v7;
}

- (void)_createSettingControllerForAccessory:(id)a3 homeUUID:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *i;
  void *v10;
  uint64_t v11;
  void *v12;
  HMDCompositeSettingsControllerManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  id Property;
  id v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  SEL v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  HMDCompositeSettingsControllerManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  SEL v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  HMDCompositeSettingsControllerManager *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = a4;
  if (!self)
    goto LABEL_29;
  for (i = objc_getProperty(self, v7, 24, 1); ; i = 0)
  {
    dispatch_assert_queue_V2(i);
    -[HMDCompositeSettingsControllerManager stateManager](self, "stateManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "stateForHomeUUID:", v8);

    if ((unint64_t)(v11 - 4) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v15;
        v55 = 2112;
        v56 = v16;
        v57 = 2112;
        v58 = v8;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Current state is not resident or primary resident for owner:%@, home:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      goto LABEL_26;
    }
    if (!v8)
    {
      _HMFPreconditionFailure();
      goto LABEL_28;
    }
    objc_msgSend(v6, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      break;
LABEL_28:
    _HMFPreconditionFailure();
LABEL_29:
    ;
  }
  if (self)
    Property = objc_getProperty(self, v18, 16, 1);
  else
    Property = 0;
  v20 = Property;
  objc_msgSend(v6, "uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v23 = objc_getProperty(self, v21, 24, 1);
    objc_msgSend((id)objc_opt_class(), "zoneNameForHomeUUID:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createDatabaseAdapterIfNotExistForUUID:homeUUID:accessory:workQueue:zoneName:", v22, v8, v6, v23, v24);

    v26 = objc_getProperty(self, v25, 16, 1);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "zoneNameForHomeUUID:", v8);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createDatabaseAdapterIfNotExistForUUID:homeUUID:accessory:workQueue:zoneName:", v22, v8, v6, 0, v52);

    v26 = 0;
  }
  v27 = v26;
  objc_msgSend(v6, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "databaseAdapterForUUID:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == 3)
  {
    v30 = &unk_1E8B321F0;
    if (self)
    {
      if ((_os_feature_enabled_impl() & 1) != 0)
      {
        objc_msgSend(&unk_1E8B321F0, "arrayByAddingObjectsFromArray:", &unk_1E8B32208);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = &unk_1E8B321F0;
        v37 = &unk_1E8B321F0;
      }

      v39 = objc_getProperty(self, v38, 32, 1);
    }
    else
    {

      v31 = 0;
      v39 = 0;
    }
    v40 = v39;
    v41 = objc_opt_class();
    objc_msgSend(v6, "uuid");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, uint64_t, id, void *, void *))v39 + 2))(v40, v29, v41, v8, v42, v31);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = (void *)MEMORY[0x1D17BA0A0]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v54 = v47;
      v55 = 2112;
      v56 = v43;
      v57 = 2112;
      v58 = v48;
      v59 = 2112;
      v60 = v8;
      v61 = 2112;
      v62 = v31;
      _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Created setting controller %@ for owner:%@ home:%@ blocklist: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v44);
    -[HMDCompositeSettingsControllerManager stringToCompositeSettingsController](v45, "stringToCompositeSettingsController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v8, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setObject:forKey:", v43, v51);

  }
  else
  {
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v35;
      v55 = 2112;
      v56 = v36;
      v57 = 2112;
      v58 = v8;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Current state is not primary resident for owner:%@, home:%@ so skipping controller creation", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v32);
  }

LABEL_26:
}

- (void)localFetchSettingsForUUID:(id)a3 homeUUID:(id)a4 withKeyPaths:(id)a5 callerVersion:(id)a6 callerPrivilege:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  id v19;
  NSObject *Property;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v19 = a8;
  if (self)
    Property = objc_getProperty(self, v18, 24, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__HMDCompositeSettingsControllerManager_localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege_completion___block_invoke;
  block[3] = &unk_1E89BCFB0;
  block[4] = self;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v31 = v19;
  v32 = a7;
  v30 = v17;
  v21 = v19;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  dispatch_async(Property, block);

}

- (void)localFetchSettingsForUUID:(id)a3 homeUUID:(id)a4 withKeyPaths:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsControllerManager localFetchSettingsForUUID:homeUUID:withKeyPaths:callerVersion:callerPrivilege:completion:](self, "localFetchSettingsForUUID:homeUUID:withKeyPaths:callerVersion:callerPrivilege:completion:", v13, v12, v11, v14, 3, v10);

}

- (void)localUpdateSettingForUUID:(id)a3 homeUUID:(id)a4 keyPath:(id)a5 value:(id)a6 callerVersion:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  id v20;
  NSObject *Property;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v20 = a8;
  if (self)
    Property = objc_getProperty(self, v19, 24, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__HMDCompositeSettingsControllerManager_localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke;
  block[3] = &unk_1E89BF160;
  block[4] = self;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v20;
  v22 = v20;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v14;
  dispatch_async(Property, block);

}

- (void)localUpdateSettingForUUID:(id)a3 homeUUID:(id)a4 keyPath:(id)a5 value:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsControllerManager localUpdateSettingForUUID:homeUUID:keyPath:value:callerVersion:completion:](self, "localUpdateSettingForUUID:homeUUID:keyPath:value:callerVersion:completion:", v16, v15, v14, v13, v17, v12);

}

- (id)dumpStateInfo
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)settingsController:(id)a3 didUpdateSettings:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "homeUUID");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCompositeSettingsControllerManager _postSettingUpdatesIfDifferentWithHome:uuid:settings:metadata:](self, v12, v11, v9, v8);
}

- (void)applyOnboardingSelections:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  NSObject *Property;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = a6;
  if (self)
    Property = objc_getProperty(self, v13, 24, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__HMDCompositeSettingsControllerManager_applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke;
  block[3] = &unk_1E89C0598;
  block[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v14;
  v16 = v14;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  dispatch_async(Property, block);

}

- (void)removeHomeZone:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 24, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HMDCompositeSettingsControllerManager_removeHomeZone___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)didConfigureCompositeSettingsControllerForHomeUUID:(id)a3 accessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *Property;
  void *v12;
  HMDCompositeSettingsControllerManager *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCompositeSettingsControllerManager stateManager](self, "stateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "stateForHomeUUID:", v6);

  if (v9 == 3)
  {
    if (self)
      Property = objc_getProperty(self, v10, 24, 1);
    else
      Property = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__HMDCompositeSettingsControllerManager_didConfigureCompositeSettingsControllerForHomeUUID_accessoryUUID___block_invoke;
    block[3] = &unk_1E89C20C8;
    block[4] = self;
    v17 = v6;
    v18 = v7;
    dispatch_async(Property, block);

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
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Ignoring composite setting controller configuration update as we are not the primary resident for home:%@ accessory:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)didUpdateSiriEndpointSettingForHomeUUID:(id)a3 accessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *Property;
  void *v12;
  HMDCompositeSettingsControllerManager *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCompositeSettingsControllerManager stateManager](self, "stateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "stateForHomeUUID:", v6);

  if (v9 == 3)
  {
    if (self)
      Property = objc_getProperty(self, v10, 24, 1);
    else
      Property = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__HMDCompositeSettingsControllerManager_didUpdateSiriEndpointSettingForHomeUUID_accessoryUUID___block_invoke;
    block[3] = &unk_1E89C20C8;
    block[4] = self;
    v17 = v6;
    v18 = v7;
    dispatch_async(Property, block);

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
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Ignoring siri endpoint setting update as we are not the primary resident for home:%@ accessory:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)didUpdateCurrentRunState:(int64_t)a3 updatedState:(int64_t)a4 forHome:(id)a5
{
  id v8;
  void *v9;
  HMDCompositeSettingsControllerManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  const char *v18;
  void *v19;
  HMDCompositeSettingsControllerManager *v20;
  NSObject *v21;
  void *v22;
  NSObject *Property;
  id v24;
  _QWORD block[5];
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v12;
    v31 = 2048;
    v32 = a3;
    v33 = 2048;
    v34 = a4;
    v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@CurrentState: %ld, UpdatedState: %ld, Home:%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCompositeSettingsControllerManager dataSource](v10, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __87__HMDCompositeSettingsControllerManager_didUpdateCurrentRunState_updatedState_forHome___block_invoke;
  v27[3] = &unk_1E89BD690;
  v16 = v8;
  v28 = v16;
  objc_msgSend(v14, "na_firstObjectPassingTest:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v10;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      v31 = 2112;
      v32 = (int64_t)v16;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home not found %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }
  if (v10)
    Property = objc_getProperty(v10, v18, 24, 1);
  else
    Property = 0;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __87__HMDCompositeSettingsControllerManager_didUpdateCurrentRunState_updatedState_forHome___block_invoke_117;
  block[3] = &unk_1E89C2328;
  block[4] = v10;
  v26 = v17;
  v24 = v17;
  dispatch_async(Property, block);

}

- (void)languagesDidChangeForHome:(id)a3
{
  id v4;
  void *v5;
  HMDCompositeSettingsControllerManager *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *Property;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling languages changed for homeUUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v6)
    Property = objc_getProperty(v6, v9, 24, 1);
  else
    Property = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HMDCompositeSettingsControllerManager_languagesDidChangeForHome___block_invoke;
  v12[3] = &unk_1E89C2328;
  v12[4] = v6;
  v13 = v4;
  v11 = v4;
  dispatch_async(Property, v12);

}

- (NSArray)homes
{
  void *v2;
  void *v3;

  -[HMDCompositeSettingsControllerManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (HMDCompositeSettingsControllerManagerDataSource)dataSource
{
  return (HMDCompositeSettingsControllerManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 40, 1);
}

- (NSMapTable)stringToCompositeSettingsController
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCompositeSettingControllerManagerStateManager)stateManager
{
  return (HMDCompositeSettingControllerManagerStateManager *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_stringToCompositeSettingsController, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong(&self->_compositeSettingsControllerFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

void __67__HMDCompositeSettingsControllerManager_languagesDidChangeForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "stringToCompositeSettingsController", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v8, "homeUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

        if ((_DWORD)v9)
        {
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v8, "homeUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCompositeSettingsControllerManager _updateLanguageEventIfNeededWithHome:uuid:](v11, v12, v13);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)_updateLanguageEventIfNeededWithHome:(void *)a3 uuid:
{
  id v5;
  const char *v6;
  id v7;
  NSObject *Property;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *context;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 24, 1);
    dispatch_assert_queue_V2(Property);
    objc_msgSend(a1, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventStoreReadHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "stateForHomeUUID:", v5);

    if (v12 == 3 && v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v14 = v13;
      objc_msgSend(v9, "eventSourceForCompositeSettingsController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "languageListProviderForHomeUUID:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "languageValueList");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = (void *)MEMORY[0x1E0C9AA60];
      if (v17)
        v19 = (void *)v17;
      v20 = v19;

      if (objc_msgSend(v20, "count"))
      {
        MEMORY[0x1D17B8E58](v5, v7, CFSTR("root.siri.availableLanguages"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastEventForTopic:");
        v21 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v21;
        v43 = v15;
        if (v21)
        {
          v47 = 0;
          objc_msgSend(MEMORY[0x1E0CBA588], "decodeSettingFromEvent:error:", v21, &v47);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v47;
          if (v23)
          {
            v44 = v22;
            context = (void *)MEMORY[0x1D17BA0A0]();
            v24 = a1;
            HMFGetOSLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v49 = v26;
              v50 = 2112;
              v51 = v46;
              v52 = 2112;
              v53 = v23;
              _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(context);
            v15 = v43;
            v22 = v44;
          }

        }
        else
        {
          v22 = 0;
        }
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA5B0]), "initWithKeyPath:readOnly:languageValues:", CFSTR("root.siri.availableLanguages"), 1, v20);
        v32 = v31;
        if (!v22 || (objc_msgSend(v31, "isEqual:", v22) & 1) == 0)
        {
          v45 = v22;
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = a1;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v49 = v36;
            v50 = 2112;
            v51 = v46;
            v52 = 2112;
            v53 = v32;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Updating language event for topic %@, with Value: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v33);
          v15 = v43;
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA588]), "initWithSetting:eventSource:eventTimestamp:", v32, v43, v14);
          objc_msgSend(v9, "eventForwarder");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "forwardEvent:topic:completion:", v37, v46, &__block_literal_global_97_146998);

          HMImmutableSettingChangeEventTopicFromComponentsLegacy();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "eventForwarder");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "forwardEvent:topic:completion:", v37, v39, &__block_literal_global_98_146999);

          v22 = v45;
        }

      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = a1;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v30;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Not checking for need to post language events because this device is not the primary resident.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
    }

  }
}

uint64_t __87__HMDCompositeSettingsControllerManager_didUpdateCurrentRunState_updatedState_forHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __87__HMDCompositeSettingsControllerManager_didUpdateCurrentRunState_updatedState_forHome___block_invoke_117(uint64_t a1)
{
  void *v1;
  const char *v2;
  id v3;
  NSObject *Property;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  SEL v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id obj;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[5];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v1)
  {
    Property = objc_getProperty(v1, v2, 24, 1);
    dispatch_assert_queue_V2(Property);
    objc_msgSend(v1, "stateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "stateForHomeUUID:", v6);

    v8 = 0;
    switch(v7)
    {
      case 1:
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = v1;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          goto LABEL_36;
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v71 = v12;
        v72 = 2048;
        v73 = 1;
        v13 = "%{public}@Not creating controllers for state %ld";
        v14 = v11;
        v15 = OS_LOG_TYPE_INFO;
        v16 = 22;
        goto LABEL_35;
      case 2:
        goto LABEL_6;
      case 3:
        v8 = 1;
LABEL_6:
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = v1;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v71 = v20;
          v72 = 2048;
          v73 = v7;
          v74 = 2112;
          v75 = v3;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@creating controller for state %ld, home: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v17);
        v21 = v3;
        v23 = objc_getProperty(v18, v22, 24, 1);
        dispatch_assert_queue_V2(v23);
        if (v8)
        {
          v51 = v21;
          v52 = v3;
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          objc_msgSend(v18, "stringToCompositeSettingsController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectEnumerator");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          obj = v25;
          v56 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
          if (v56)
          {
            v54 = *(_QWORD *)v66;
            v55 = v18;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v66 != v54)
                  objc_enumerationMutation(obj);
                v58 = v26;
                v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v26);
                +[HMDCompositeSettingsAccessorySettingsModel allKeyPaths](HMDCompositeSettingsAccessorySettingsModel, "allKeyPaths");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v27;
                objc_msgSend(v27, "fetchSynchronousSettingsForKeyPaths:callerVersion:callerPrivilege:", v28, v29, 3);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = 0u;
                v62 = 0u;
                v63 = 0u;
                v64 = 0u;
                v33 = v30;
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                if (v34)
                {
                  v35 = v34;
                  v36 = *(_QWORD *)v62;
                  do
                  {
                    for (i = 0; i != v35; ++i)
                    {
                      if (*(_QWORD *)v62 != v36)
                        objc_enumerationMutation(v33);
                      v38 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                      objc_msgSend(v38, "setting");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "metadata");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "metadata");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "keyPath");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v39)
                        v43 = v40 == 0;
                      else
                        v43 = 1;
                      if (!v43 && v42 != 0)
                      {
                        objc_msgSend(v31, "setObject:forKeyedSubscript:", v39, v42);
                        objc_msgSend(v32, "setObject:forKeyedSubscript:", v40, v42);
                      }

                    }
                    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                  }
                  while (v35);
                }

                objc_msgSend(v57, "homeUUID");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "uuid");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v55;
                -[HMDCompositeSettingsControllerManager _postSettingUpdatesIfDifferentWithHome:uuid:settings:metadata:](v55, v45, v46, v31, v32);

                v26 = v58 + 1;
              }
              while (v58 + 1 != v56);
              v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
            }
            while (v56);
          }

          v21 = v51;
          v3 = v52;
        }
        objc_msgSend(v21, "accessories");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "na_filter:", &__block_literal_global_123_147009);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __87__HMDCompositeSettingsControllerManager__actualScanHomeAndCreateControllers_isPrimary___block_invoke_2;
        v59[3] = &unk_1E89B9A80;
        v59[4] = v18;
        v49 = v21;
        v60 = v49;
        v50 = (id)objc_msgSend(v48, "na_map:", v59);

        break;
      case 4:
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = v1;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v71 = v12;
          v13 = "%{public}@In uninitialized/Unknown state";
          v14 = v11;
          v15 = OS_LOG_TYPE_ERROR;
          v16 = 12;
LABEL_35:
          _os_log_impl(&dword_1CD062000, v14, v15, v13, buf, v16);

        }
LABEL_36:

        objc_autoreleasePoolPop(v9);
        break;
      default:
        break;
    }
  }

}

- (void)_postSettingUpdatesIfDifferentWithHome:(void *)a3 uuid:(void *)a4 settings:(void *)a5 metadata:
{
  id v9;
  id v10;
  const char *v11;
  NSObject *Property;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  HMDCompositeSettingOperationResult *v32;
  void *v33;
  HMDCompositeSettingOperationResult *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  id obj;
  id v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v59 = a3;
  v10 = a4;
  v55 = a5;
  if (a1)
  {
    Property = objc_getProperty(a1, v11, 24, 1);
    dispatch_assert_queue_V2(Property);
    objc_msgSend(a1, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v15 = v14;
    objc_msgSend(v13, "eventSourceForCompositeSettingsController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v13;
    objc_msgSend(v13, "eventStoreReadHandle");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stateManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "stateForHomeUUID:", v9);

    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v68 = v21;
      v69 = 2112;
      v70 = v56;
      v71 = 2048;
      v72 = objc_msgSend(v10, "count");
      v73 = 2048;
      v74 = v17;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Posting updates with eventStoreHandle:%@, for settings count:%lu, with run state:%ld", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    if (v17 == 3 && v56)
    {
      v53 = v19;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v49 = v10;
      obj = v10;
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      if (v57)
      {
        v54 = *(_QWORD *)v63;
        v52 = v9;
        do
        {
          for (i = 0; i != v57; ++i)
          {
            if (*(_QWORD *)v63 != v54)
              objc_enumerationMutation(obj);
            v23 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
            objc_msgSend(obj, "objectForKeyedSubscript:", v23);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            MEMORY[0x1D17B8E58](v9, v59, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "lastEventForTopic:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v61 = 0;
              objc_msgSend(MEMORY[0x1E0CBA588], "decodeSettingFromEvent:error:", v25, &v61);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v61;
              if (v27)
              {
                v28 = (void *)MEMORY[0x1D17BA0A0]();
                v29 = v53;
                HMFGetOSLogHandle();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v68 = v31;
                  v69 = 2112;
                  v70 = v24;
                  v71 = 2112;
                  v72 = (uint64_t)v27;
                  _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v28);
                v9 = v52;
              }

            }
            else
            {
              v26 = 0;
            }
            v32 = [HMDCompositeSettingOperationResult alloc];
            objc_msgSend(v55, "objectForKeyedSubscript:", v23);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:](v32, "initWithKeyPath:setting:metadata:error:", v23, v60, v33, 0);
            +[HMDCompositeSettingsControllerManager immutableSettingFromFetchReturn:](HMDCompositeSettingsControllerManager, "immutableSettingFromFetchReturn:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26 && objc_msgSend(v26, "isEqual:", v35))
            {
              v36 = (void *)MEMORY[0x1D17BA0A0]();
              v37 = v53;
              HMFGetOSLogHandle();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v68 = v39;
                v69 = 2112;
                v70 = v59;
                v71 = 2112;
                v72 = v23;
                _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Skip sending event for accessory %@ setting %@ as it matches stored", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v36);
              v9 = v52;
            }
            else
            {
              v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA588]), "initWithSetting:eventSource:eventTimestamp:", v35, v50, v15);
              objc_msgSend(v51, "eventForwarder");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "forwardEvent:topic:completion:", v40, v24, &__block_literal_global_94_147022);

              HMImmutableSettingChangeEventTopicFromComponentsLegacy();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "eventForwarder");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "forwardEvent:topic:completion:", v40, v42, &__block_literal_global_95_147023);

            }
          }
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        }
        while (v57);
      }

      v44 = (void *)MEMORY[0x1D17BA0A0]();
      v45 = v53;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v47;
        v69 = 2112;
        v70 = v48;
        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Diff from persistent store?: %@, skipping all updates", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v44);
      -[HMDCompositeSettingsControllerManager _updateLanguageEventIfNeededWithHome:uuid:](v45, v9, v59);
      v10 = v49;
    }

  }
}

uint64_t __87__HMDCompositeSettingsControllerManager__actualScanHomeAndCreateControllers_isPrimary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _BYTE buf[32];
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(v3, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v3, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
    }
    v26 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    *(_WORD *)&buf[18] = 2096;
    *(_QWORD *)&buf[20] = &v26;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating controller for: %{uuid_t}.16P", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(*(id *)(a1 + 32), "stringToCompositeSettingsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v10;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@controller for uuid:%@, homeUUID:%@ already exists", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
  }
  else
  {
    v22 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_createSettingControllerForAccessory:homeUUID:", v14, v23);

  }
  return 0;
}

BOOL __87__HMDCompositeSettingsControllerManager__actualScanHomeAndCreateControllers_isPrimary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "siriEndpointProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __95__HMDCompositeSettingsControllerManager_didUpdateSiriEndpointSettingForHomeUUID_accessoryUUID___block_invoke(void **a1)
{
  -[HMDCompositeSettingsControllerManager _manageCharacteristicsBackedSettingsChangeForHomeUUID:accessoryUUID:](a1[4], a1[5], a1[6]);
}

- (void)_manageCharacteristicsBackedSettingsChangeForHomeUUID:(void *)a3 accessoryUUID:
{
  id v5;
  const char *v6;
  id v7;
  NSObject *Property;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  HMDCompositeBoolSetting *v23;
  HMDCompositeBoolSetting *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  HMDCompositeBoolSetting *v31;
  HMDCompositeBoolSetting *v32;
  SEL v33;
  NSObject *v34;
  void *v35;
  id v36;
  NSObject *v37;
  HMDCompositeBoolSetting *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  id v50;
  HMDCompositeBoolSetting *v51;
  void *v52;
  HMDCompositeSettingBoolValue *v53;
  _BYTE buf[24];
  void *v55;
  id v56;
  id v57;
  id v58;
  HMDCompositeBoolSetting *v59;
  HMDCompositeBoolSetting *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 24, 1);
    dispatch_assert_queue_V2(Property);
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      v55 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@managing characteristic backed settings for home:%@, accessory:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v10, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "siriEndpointBridge");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = v10;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v28;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Nil siriEndpointBridge", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      goto LABEL_27;
    }
    objc_msgSend(v14, "readValueValueForAccessoryUUID:homeUUID:forKeyPath:", v7, v5, CFSTR("root.siri.allowHeySiri"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v14, "readValueValueForAccessoryUUID:homeUUID:forKeyPath:", v7, v5, CFSTR("root.siri.tapToAccess"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    v21 = objc_msgSend(v17, "BOOLValue");
    v22 = objc_msgSend(v20, "BOOLValue");

    if (v17)
    {
      v23 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", v21, CFSTR("7.2"), CFSTR("7.2"));
      if (v20)
      {
LABEL_13:
        v24 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", v22, CFSTR("7.2"), CFSTR("7.2"));
        goto LABEL_19;
      }
    }
    else
    {
      v23 = 0;
      if (v20)
        goto LABEL_13;
    }
    v24 = 0;
LABEL_19:
    v29 = v5;
    v30 = v7;
    v31 = v23;
    v32 = v24;
    v34 = objc_getProperty(v10, v33, 24, 1);
    dispatch_assert_queue_V2(v34);
    if (v31
      && v32
      && !-[HMDCompositeBoolSetting BOOLValue](v31, "BOOLValue")
      && !-[HMDCompositeBoolSetting BOOLValue](v32, "BOOLValue"))
    {
      v45 = (void *)MEMORY[0x1D17BA0A0]();
      v46 = v10;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = v45;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v48;
        _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Setting Siri enabled to NO", buf, 0xCu);

        v45 = v52;
      }

      objc_autoreleasePoolPop(v45);
      v53 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", 0);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __134__HMDCompositeSettingsControllerManager__processCharacteristicBackedSettingsChangeForHomeUUID_accessoryUUID_allowHeySiri_tapToAccess___block_invoke;
      v55 = &unk_1E89B9A18;
      v56 = v46;
      v49 = v29;
      v57 = v49;
      v50 = v30;
      v58 = v50;
      v59 = v31;
      v60 = v32;
      objc_msgSend(v46, "localUpdateSettingForUUID:homeUUID:keyPath:value:completion:", v50, v49, CFSTR("root.siri.siriEnabled"), v53, buf);

    }
    else
    {
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v36 = v10;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v51 = v31;
        v38 = v32;
        v39 = v14;
        v40 = v7;
        v41 = v5;
        v42 = v30;
        v43 = v29;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v44;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Not transforming allowHeySiri and tapToAccess settings", buf, 0xCu);

        v29 = v43;
        v30 = v42;
        v5 = v41;
        v7 = v40;
        v14 = v39;
        v32 = v38;
        v31 = v51;
      }

      objc_autoreleasePoolPop(v35);
      -[HMDCompositeSettingsControllerManager _publishCharacteristicBackedSettingsChangeForHomeUUID:accessoryUUID:allowHeySiri:tapToAccess:](v36, v29, v30, v31, v32);
    }

LABEL_27:
  }

}

void __134__HMDCompositeSettingsControllerManager__processCharacteristicBackedSettingsChangeForHomeUUID_accessoryUUID_allowHeySiri_tapToAccess___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = a1[4];
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v13;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Siri enabled setting update returned result:%@, home:%@ accessory:%@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDCompositeSettingsControllerManager _publishCharacteristicBackedSettingsChangeForHomeUUID:accessoryUUID:allowHeySiri:tapToAccess:](a1[4], a1[5], a1[6], a1[7], a1[8]);

}

- (void)_publishCharacteristicBackedSettingsChangeForHomeUUID:(void *)a3 accessoryUUID:(void *)a4 allowHeySiri:(void *)a5 tapToAccess:
{
  id v9;
  id v10;
  HMDCompositeBoolSetting *v11;
  HMDCompositeSettingMetadata *v12;
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
  uint64_t v25;
  void *v26;
  HMDCompositeBoolSetting *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  HMDCompositeSettingMetadata *v38;
  HMDCompositeSettingPrivileges *v39;
  HMDCompositeSettingMetadata *v40;
  HMDCompositeBoolSetting *v41;
  uint64_t v42;
  HMDCompositeBoolSetting *v43;
  HMDCompositeSettingMetadata *v44;
  HMDCompositeSettingPrivileges *v45;
  HMDCompositeSettingMetadata *v46;
  void *v47;
  HMDCompositeBoolSetting *v48;
  id v49;
  HMDCompositeSettingMetadata *v50;
  const __CFString *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_msgSend(a1, "stringToCompositeSettingsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v51 = CFSTR("root.siri.siriEnabled");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fetchSynchronousSettingsForKeyPaths:callerVersion:callerPrivilege:", v16, v17, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count")
        && (objc_msgSend(v18, "firstObject"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v19, "setting"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            v20))
      {
        v47 = v9;
        v50 = v12;
        objc_msgSend(v18, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setting");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;
        v49 = v23;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v25 = objc_claimAutoreleasedReturnValue();
        v48 = v11;
        if (v11)
        {
          v26 = (void *)v25;
          v27 = [HMDCompositeBoolSetting alloc];
          if (-[HMDCompositeBoolSetting BOOLValue](v11, "BOOLValue"))
            v28 = objc_msgSend(v49, "BOOLValue");
          else
            v28 = 0;
          v11 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v27, "initWithValue:readVersion:writeVersion:", v28, CFSTR("7.2"), CFSTR("7.2"));
          v38 = [HMDCompositeSettingMetadata alloc];
          v39 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
          v46 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:](v38, "initWithKeyPath:constraint:privileges:", CFSTR("root.siri.allowHeySiri"), 0, v39);

        }
        else
        {
          v26 = (void *)v25;
          v46 = 0;
        }
        v40 = v50;
        if (v50)
        {
          v41 = [HMDCompositeBoolSetting alloc];
          if (-[HMDCompositeSettingMetadata BOOLValue](v50, "BOOLValue"))
            v42 = objc_msgSend(v49, "BOOLValue");
          else
            v42 = 0;
          v43 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v41, "initWithValue:readVersion:writeVersion:", v42, CFSTR("7.2"), CFSTR("7.2"));
          v44 = [HMDCompositeSettingMetadata alloc];
          v45 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
          v40 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:](v44, "initWithKeyPath:constraint:privileges:", CFSTR("root.siri.tapToAccess"), 0, v45);

        }
        else
        {
          v43 = 0;
        }
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v11, CFSTR("root.siri.allowHeySiri"));
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v43, CFSTR("root.siri.tapToAccess"));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v46, CFSTR("root.siri.allowHeySiri"));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v40, CFSTR("root.siri.tapToAccess"));
        v9 = v47;
        -[HMDCompositeSettingsControllerManager _postSettingUpdatesIfDifferentWithHome:uuid:settings:metadata:](a1, v47, v10, v24, v26);

        v11 = v48;
        v12 = v50;
      }
      else
      {
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = a1;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = v9;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v33;
          v54 = 2112;
          v55 = v18;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch SiriEnabled setting operation result:%@", buf, 0x16u);

          v9 = v32;
        }

        objc_autoreleasePoolPop(v29);
      }

    }
    else
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = a1;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v37;
        v54 = 2112;
        v55 = v9;
        v56 = 2112;
        v57 = v10;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@No controller for home:%@ accessory:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v34);
    }

  }
}

void __106__HMDCompositeSettingsControllerManager_didConfigureCompositeSettingsControllerForHomeUUID_accessoryUUID___block_invoke(void **a1)
{
  -[HMDCompositeSettingsControllerManager _manageCharacteristicsBackedSettingsChangeForHomeUUID:accessoryUUID:](a1[4], a1[5], a1[6]);
}

void __56__HMDCompositeSettingsControllerManager_removeHomeZone___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  SEL v3;
  id v4;
  SEL v5;
  id v6;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = *(id *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "zoneNameForHomeUUID:", v2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_getProperty(v1, v3, 16, 1);
    objc_msgSend(v4, "removeZoneWithZoneName:uuid:workQueue:", v6, v2, objc_getProperty(v1, v5, 24, 1));

  }
}

void __101__HMDCompositeSettingsControllerManager_applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  NSObject *Property;
  id *v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v10 = v8;
  if (!v1)
    goto LABEL_7;
  if (!v5)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v7)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (v8)
  {
    Property = objc_getProperty(v1, v9, 24, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke;
    block[3] = &unk_1E89C0598;
    block[4] = v1;
    v14 = v7;
    v17 = v10;
    v15 = v6;
    v16 = v5;
    dispatch_async(Property, block);

LABEL_7:
    return;
  }
LABEL_11:
  v12 = (id *)_HMFPreconditionFailure();
  __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke(v12);
}

void __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDCompositeSettingsKeyPathValueItem *v8;
  __objc2_class **p_superclass;
  HMDCompositeSettingBoolValue *v10;
  HMDCompositeSettingsKeyPathValueItem *v11;
  HMDCompositeSettingsKeyPathValueItem *v12;
  HMDCompositeSettingBoolValue *v13;
  HMDCompositeSettingsKeyPathValueItem *v14;
  HMDCompositeSettingsKeyPathValueItem *v15;
  HMDCompositeSettingBoolValue *v16;
  HMDCompositeSettingsKeyPathValueItem *v17;
  HMDCompositeSettingsKeyPathValueItem *v18;
  HMDCompositeSettingBoolValue *v19;
  HMDCompositeSettingsKeyPathValueItem *v20;
  HMDCompositeSettingsKeyPathValueItem *v21;
  HMDCompositeSettingBoolValue *v22;
  HMDCompositeSettingsKeyPathValueItem *v23;
  HMDCompositeSettingsKeyPathValueItem *v24;
  HMDCompositeSettingBoolValue *v25;
  HMDCompositeSettingsKeyPathValueItem *v26;
  HMDCompositeSettingsKeyPathValueItem *v27;
  HMDCompositeSettingBoolValue *v28;
  HMDCompositeSettingsKeyPathValueItem *v29;
  HMDCompositeSettingsKeyPathValueItem *v30;
  HMDCompositeSettingBoolValue *v31;
  HMDCompositeSettingsKeyPathValueItem *v32;
  void *v33;
  HMDCompositeSettingLanguageValue *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void (*v50)(void);
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  HMDCompositeSettingLanguageValue *v55;
  HMDCompositeSettingsKeyPathValueItem *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[5];
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  id v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "stateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stateForHomeUUID:", a1[5]);

  if (v3 != 3)
  {
    v46 = (void *)MEMORY[0x1D17BA0A0]();
    v47 = a1[4];
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v89 = v49;
      _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_INFO, "%{public}@Device is not a primary resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v46);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 14);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v50 = (void (*)(void))*((_QWORD *)a1[8] + 2);
    goto LABEL_12;
  }
  objc_msgSend(a1[4], "stringToCompositeSettingsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a1[5], a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_msgSend(v6, "configured") & 1) == 0)
  {
    v51 = (void *)MEMORY[0x1D17BA0A0]();
    v52 = a1[4];
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v89 = v54;
      _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_INFO, "%{public}@Controller is not created or not configured", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v51);
    v50 = (void (*)(void))*((_QWORD *)a1[8] + 2);
LABEL_12:
    v50();
    goto LABEL_13;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
  v8 = [HMDCompositeSettingsKeyPathValueItem alloc];
  p_superclass = &OBJC_METACLASS___HMDNetworkRouterFirewallRule.superclass;
  v10 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", 1);
  v11 = -[HMDCompositeSettingsKeyPathValueItem initWithKeyPath:value:](v8, "initWithKeyPath:value:", CFSTR("root.siriEndpoint.enabled"), v10);
  objc_msgSend(v7, "addObject:", v11);

  v12 = [HMDCompositeSettingsKeyPathValueItem alloc];
  v13 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", objc_msgSend(a1[7], "allowHeySiri"));
  v14 = -[HMDCompositeSettingsKeyPathValueItem initWithKeyPath:value:](v12, "initWithKeyPath:value:", CFSTR("root.siri.siriEnabled"), v13);
  objc_msgSend(v7, "addObject:", v14);

  v15 = [HMDCompositeSettingsKeyPathValueItem alloc];
  v16 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", objc_msgSend(a1[7], "isAirPlayEnabled"));
  v17 = -[HMDCompositeSettingsKeyPathValueItem initWithKeyPath:value:](v15, "initWithKeyPath:value:", CFSTR("root.airPlay.airPlayEnabled"), v16);
  objc_msgSend(v7, "addObject:", v17);

  v18 = [HMDCompositeSettingsKeyPathValueItem alloc];
  v19 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", objc_msgSend(a1[7], "isExplicitContentAllowed"));
  v20 = -[HMDCompositeSettingsKeyPathValueItem initWithKeyPath:value:](v18, "initWithKeyPath:value:", CFSTR("root.music.allowExplicitContent"), v19);
  objc_msgSend(v7, "addObject:", v20);

  v21 = [HMDCompositeSettingsKeyPathValueItem alloc];
  v22 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", objc_msgSend(a1[7], "isShareSiriAnalyticsEnabled"));
  v23 = -[HMDCompositeSettingsKeyPathValueItem initWithKeyPath:value:](v21, "initWithKeyPath:value:", CFSTR("root.general.analytics.shareSiriAnalytics"), v22);
  objc_msgSend(v7, "addObject:", v23);

  v24 = [HMDCompositeSettingsKeyPathValueItem alloc];
  v25 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", objc_msgSend(a1[7], "isDoorbellChimeEnabled"));
  v26 = -[HMDCompositeSettingsKeyPathValueItem initWithKeyPath:value:](v24, "initWithKeyPath:value:", CFSTR("root.doorbellChime.enabled"), v25);
  objc_msgSend(v7, "addObject:", v26);

  v27 = [HMDCompositeSettingsKeyPathValueItem alloc];
  v28 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", objc_msgSend(a1[7], "isLightWhenUsingSiriEnabled"));
  v29 = -[HMDCompositeSettingsKeyPathValueItem initWithKeyPath:value:](v27, "initWithKeyPath:value:", CFSTR("root.siri.lightWhenUsingSiri"), v28);
  objc_msgSend(v7, "addObject:", v29);

  v30 = [HMDCompositeSettingsKeyPathValueItem alloc];
  v31 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", objc_msgSend(a1[7], "isAnnounceEnabled"));
  v32 = -[HMDCompositeSettingsKeyPathValueItem initWithKeyPath:value:](v30, "initWithKeyPath:value:", CFSTR("root.announce.enabled"), v31);
  v77 = v7;
  objc_msgSend(v7, "addObject:", v32);

  objc_msgSend(a1[7], "languageValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = [HMDCompositeSettingLanguageValue alloc];
    objc_msgSend(a1[7], "languageValue");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "inputLanguageCode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "languageValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "outputVoiceLanguageCode");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "languageValue");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "outputVoiceGenderCode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "languageValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "voiceName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[HMDCompositeSettingLanguageValue initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:](v34, "initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v35, v37, v39, v41);

    v43 = v42;
    v44 = v36;
    v45 = v75;

    p_superclass = (__objc2_class **)(&OBJC_METACLASS___HMDNetworkRouterFirewallRule + 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA2D8], "defaultLanguageValue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = [HMDCompositeSettingLanguageValue alloc];
    objc_msgSend(v45, "inputLanguageCode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "outputVoiceLanguageCode");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "outputVoiceGenderCode");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "voiceName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[HMDCompositeSettingLanguageValue initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:](v55, "initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v35, v44, v37, v38);
  }

  v76 = (void *)v43;
  v56 = -[HMDCompositeSettingsKeyPathValueItem initWithKeyPath:value:]([HMDCompositeSettingsKeyPathValueItem alloc], "initWithKeyPath:value:", CFSTR("root.siri.language"), v43);
  objc_msgSend(v77, "addObject:", v56);

  +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(objc_alloc((Class)(p_superclass + 389)), "initWithValue:", objc_msgSend(a1[7], "allowHeySiri"));
  objc_msgSend(a1[4], "dataSource");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "siriEndpointBridge");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = a1[5];
  v61 = a1[6];
  v87 = 0;
  v63 = objc_msgSend(v60, "siriEndpointCertificationReasonForAccessoryUUID:homeUUID:error:", v61, v62, &v87);
  v64 = v87;

  if (v64)
  {
    v65 = (void *)MEMORY[0x1D17BA0A0]();
    v66 = a1[4];
    HMFGetOSLogHandle();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v89 = v68;
      v90 = 2112;
      v91 = v64;
      _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_ERROR, "%{public}@Error while checking certification status error:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v65);
  }
  v70 = a1[5];
  v69 = a1[6];
  v71 = a1[4];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_106;
  v78[3] = &unk_1E89B99D0;
  v86 = v63;
  v78[4] = v71;
  v85 = a1[8];
  v79 = a1[6];
  v80 = a1[5];
  v81 = v58;
  v6 = v6;
  v82 = v6;
  v83 = v77;
  v84 = v57;
  v72 = v57;
  v73 = v77;
  v74 = v58;
  objc_msgSend(v71, "localUpdateSettingForUUID:homeUUID:keyPath:value:completion:", v69, v70, CFSTR("root.siri.allowHeySiri"), v74, v78);

LABEL_13:
}

void __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_106(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  HMDCompositeSettingsControllerManagerOnboardingLogEvent *v11;
  void *v12;
  HMDCompositeSettingsControllerManagerOnboardingLogEvent *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [HMDCompositeSettingsControllerManagerOnboardingLogEvent alloc];
    objc_msgSend(v7, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDCompositeSettingsControllerManagerOnboardingLogEvent initWithError:siriEndpointCertificationReason:](v11, "initWithError:siriEndpointCertificationReason:", v12, *(_QWORD *)(a1 + 96));

    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "submitLogEvent:", v13);

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v18;
      v35 = 2112;
      v36 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Applying onboarding selections to controller failed with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v20 = *(_QWORD *)(a1 + 88);
    objc_msgSend(v7, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v20 + 16))(v20, v21, 1);

  }
  else
  {
    v22 = *(void **)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_QWORD *)(a1 + 48);
    v25 = *(_QWORD *)(a1 + 56);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_108;
    v27[3] = &unk_1E89B99A8;
    v26 = *(void **)(a1 + 88);
    v32 = *(_QWORD *)(a1 + 96);
    v27[4] = v22;
    v31 = v26;
    v28 = *(id *)(a1 + 64);
    v29 = *(id *)(a1 + 72);
    v30 = *(id *)(a1 + 80);
    objc_msgSend(v22, "localUpdateSettingForUUID:homeUUID:keyPath:value:completion:", v23, v24, CFSTR("root.siri.tapToAccess"), v25, v27);

  }
}

void __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_108(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  HMDCompositeSettingsControllerManagerOnboardingLogEvent *v11;
  void *v12;
  HMDCompositeSettingsControllerManagerOnboardingLogEvent *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [HMDCompositeSettingsControllerManagerOnboardingLogEvent alloc];
    objc_msgSend(v7, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDCompositeSettingsControllerManagerOnboardingLogEvent initWithError:siriEndpointCertificationReason:](v11, "initWithError:siriEndpointCertificationReason:", v12, *(_QWORD *)(a1 + 72));

    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "submitLogEvent:", v13);

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Applying onboarding selections to controller failed with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v20 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v7, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v20 + 16))(v20, v21, 1);

  }
  else
  {
    v22 = *(_QWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 56);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_109;
    v27[3] = &unk_1E89B9980;
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(a1 + 40);
    v26 = *(void **)(a1 + 64);
    v29 = *(_QWORD *)(a1 + 72);
    v27[4] = v24;
    v28 = v26;
    objc_msgSend(v25, "updateSettingsForKeyPaths:callerVersion:completion:", v22, v23, v27);

  }
}

void __102__HMDCompositeSettingsControllerManager__applyOnboardingSelections_accessoryUUID_homeUUID_completion___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  HMDCompositeSettingsControllerManagerOnboardingLogEvent *v5;
  HMDCompositeSettingsControllerManagerOnboardingLogEvent *v6;
  void *v7;
  HMDCompositeSettingsControllerManagerOnboardingLogEvent *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [HMDCompositeSettingsControllerManagerOnboardingLogEvent alloc];
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDCompositeSettingsControllerManagerOnboardingLogEvent initWithError:siriEndpointCertificationReason:](v6, "initWithError:siriEndpointCertificationReason:", v7, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "submitLogEvent:", v8);

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Applying onboarding selections to controller failed with error: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v15 + 16))(v15, v16, 1);

  }
  else
  {
    v8 = -[HMDCompositeSettingsControllerManagerOnboardingLogEvent initWithError:siriEndpointCertificationReason:](v5, "initWithError:siriEndpointCertificationReason:", 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "submitLogEvent:", v8);

    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Applying onboarding selections to controller successful", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __115__HMDCompositeSettingsControllerManager_localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  void (**v11)(id, HMDCompositeSettingOperationResult *, id, id);
  NSObject *Property;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCompositeSettingOperationResult *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void (**v31)(id, HMDCompositeSettingOperationResult *, id, id);
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  HMDCompositeSettingOperationResult *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  void *v47;
  HMDCompositeSettingOperationResult *v48;
  void *v49;
  HMDCompositeSettingOperationResult *v50;
  id v51;
  id v52;
  HMDCompositeSettingOperationResult *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  HMDCompositeSettingOperationResult *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id *context;
  void *contexta;
  void *contextb;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  _BYTE buf[24];
  void *v73;
  _BYTE v74[24];
  void (**v75)(id, HMDCompositeSettingOperationResult *, id, id);
  id v76;
  id v77;
  id v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(void **)(a1 + 72);
  v6 = *(void **)(a1 + 80);
  v71 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  v70 = v5;
  v11 = v6;
  if (v1)
  {
    Property = objc_getProperty(v1, v10, 24, 1);
    dispatch_assert_queue_V2(Property);
    if (v71)
    {
      if (v7)
      {
        if (v8)
        {
          if (v9)
          {
            if (v70)
            {
              if (v11)
              {
                -[HMDCompositeSettingsControllerManager dataSourceIsCurrentDevicePrimaryResidentForHomeUUID:](v1, v7);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = v13;
                if (!v13 || (objc_msgSend(v13, "BOOLValue") & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Not a primary resident"), 0, 0);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = (void *)MEMORY[0x1D17BA0A0]();
                  v33 = v1;
                  HMFGetOSLogHandle();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v69 = v7;
                    v35 = v9;
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)&buf[4] = v36;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v17;
                    _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

                    v9 = v35;
                    v7 = v69;
                  }

                  objc_autoreleasePoolPop(v32);
                  v19 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v8, 0, 0, v17);
                  v11[2](v11, v19, v71, v7);
                  goto LABEL_25;
                }
                v68 = v9;
                objc_msgSend(v1, "stringToCompositeSettingsController");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, v71);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKey:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                v66 = v17;
                if (!v17)
                {
                  v67 = v14;
                  v37 = (void *)MEMORY[0x1D17BA0A0]();
                  v38 = v1;
                  HMFGetOSLogHandle();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    *(_QWORD *)&buf[4] = v40;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v71;
                    *(_WORD *)&buf[22] = 2112;
                    v73 = v7;
                    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unconfigured controller for uuid:%@, home:%@", buf, 0x20u);

                  }
                  objc_autoreleasePoolPop(v37);
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
                  v19 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
                  v41 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v8, 0, 0, v19);
                  v11[2](v11, v41, v71, v7);

                  v17 = 0;
                  v14 = v67;
                  v9 = v68;
                  goto LABEL_25;
                }
                objc_msgSend(v1, "dataSource");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "siriEndpointBridge");
                v19 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();

                if ((objc_msgSend(v8, "isEqualToString:", CFSTR("root.siri.tapToAccess")) & 1) == 0
                  && !objc_msgSend(v8, "isEqualToString:", CFSTR("root.siri.allowHeySiri")))
                {
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_2_90;
                  v73 = &unk_1E89B98D8;
                  *(_QWORD *)&v74[16] = v11;
                  *(_QWORD *)v74 = v71;
                  *(_QWORD *)&v74[8] = v7;
                  v9 = v68;
                  objc_msgSend(v17, "updateSettingForKeyPath:value:callerVersion:completion:", v8, v68, v70, buf);

LABEL_25:
                  goto LABEL_26;
                }
                v20 = (void *)MEMORY[0x1D17BA0A0]();
                v21 = v1;
                HMFGetOSLogHandle();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544386;
                  *(_QWORD *)&buf[4] = v23;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v7;
                  *(_WORD *)&buf[22] = 2112;
                  v73 = v71;
                  *(_WORD *)v74 = 2112;
                  *(_QWORD *)&v74[2] = v8;
                  *(_WORD *)&v74[10] = 2112;
                  *(_QWORD *)&v74[12] = v68;
                  _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Characteristic backed keyPath update for home:%@, accessory:%@, keyPath:%@, value:%@", buf, 0x34u);

                }
                objc_autoreleasePoolPop(v20);
                v24 = v68;
                objc_opt_class();
                v25 = objc_opt_isKindOfClass() & 1;
                if (v25)
                  v26 = v24;
                else
                  v26 = 0;
                v27 = v26;

                if (!v25)
                {
                  v42 = v21;
                  v43 = v27;
                  v44 = v24;
                  contexta = (void *)MEMORY[0x1D17BA0A0]();
                  v45 = v42;
                  HMFGetOSLogHandle();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)&buf[4] = v47;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v44;
                    _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Invalid BOOL value:%@", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(contexta);
                  v48 = [HMDCompositeSettingOperationResult alloc];
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", 43, 0);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:](v48, "initWithKeyPath:setting:metadata:error:", v8, 0, 0, v49);

                  v27 = v43;
                  goto LABEL_42;
                }
                if (objc_msgSend(v24, "BOOLValue"))
                {
                  if (v19)
                  {
                    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA7F8]), "initWithBoolValue:", 1);
                    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                    *(_QWORD *)&buf[8] = 3221225472;
                    *(_QWORD *)&buf[16] = __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke;
                    v73 = &unk_1E89B98B0;
                    v28 = v8;
                    *(_QWORD *)v74 = v28;
                    context = (id *)v79;
                    v79[0] = v11;
                    v27 = v24;
                    v29 = v71;
                    *(_QWORD *)&v74[8] = v29;
                    v30 = v7;
                    *(_QWORD *)&v74[16] = v30;
                    v75 = v66;
                    v76 = v27;
                    v77 = v70;
                    v78 = v21;
                    -[HMDCompositeSettingOperationResult writeSettingValue:accessoryUUID:homeUUID:forKeyPath:completionHandler:](v19, "writeSettingValue:accessoryUUID:homeUUID:forKeyPath:completionHandler:", v62, v29, v30, v28, buf);

                    v31 = v75;
LABEL_36:

LABEL_43:
                    v17 = v66;
                    v9 = v68;
                    goto LABEL_25;
                  }
                  v53 = [HMDCompositeSettingOperationResult alloc];
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", 27, 0);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:](v53, "initWithKeyPath:setting:metadata:error:", v8, 0, 0, v54);

                  v55 = (void *)MEMORY[0x1D17BA0A0]();
                  v56 = v21;
                  HMFGetOSLogHandle();
                  v57 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                    goto LABEL_41;
                }
                else
                {
                  if (v19)
                  {
                    v31 = (void (**)(id, HMDCompositeSettingOperationResult *, id, id))objc_msgSend(objc_alloc(MEMORY[0x1E0CBA7F8]), "initWithBoolValue:", objc_msgSend(v24, "BOOLValue"));
                    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                    *(_QWORD *)&buf[8] = 3221225472;
                    *(_QWORD *)&buf[16] = __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_89;
                    v73 = &unk_1E89C25C8;
                    v51 = v8;
                    *(_QWORD *)v74 = v51;
                    context = (id *)&v75;
                    v75 = v11;
                    v27 = v24;
                    v52 = v71;
                    *(_QWORD *)&v74[8] = v52;
                    *(_QWORD *)&v74[16] = v7;
                    -[HMDCompositeSettingOperationResult writeSettingValue:accessoryUUID:homeUUID:forKeyPath:completionHandler:](v19, "writeSettingValue:accessoryUUID:homeUUID:forKeyPath:completionHandler:", v31, v52, *(_QWORD *)&v74[16], v51, buf);
                    goto LABEL_36;
                  }
                  v58 = [HMDCompositeSettingOperationResult alloc];
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", 27, 0);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:](v58, "initWithKeyPath:setting:metadata:error:", v8, 0, 0, v59);

                  v55 = (void *)MEMORY[0x1D17BA0A0]();
                  v56 = v21;
                  HMFGetOSLogHandle();
                  v57 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                    goto LABEL_41;
                }
                HMFGetLogIdentifier();
                contextb = v56;
                v60 = v55;
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v61;
                _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, "%{public}@No Siri endpoint bridge", buf, 0xCu);

                v55 = v60;
                v56 = contextb;
LABEL_41:

                objc_autoreleasePoolPop(v55);
LABEL_42:
                v11[2](v11, v50, v71, v7);

                goto LABEL_43;
              }
LABEL_49:
              _HMFPreconditionFailure();
            }
LABEL_48:
            _HMFPreconditionFailure();
            goto LABEL_49;
          }
LABEL_47:
          _HMFPreconditionFailure();
          goto LABEL_48;
        }
LABEL_46:
        _HMFPreconditionFailure();
        goto LABEL_47;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
    goto LABEL_46;
  }
LABEL_26:

}

- (id)dataSourceIsCurrentDevicePrimaryResidentForHomeUUID:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "stateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "stateForHomeUUID:", v3) == 3;

    objc_msgSend(MEMORY[0x1E0D28558], "BOOLeanWithBool:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine current device is primary resident due to no data source", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

void __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDCompositeSettingOperationResult *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    v4 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", *(_QWORD *)(a1 + 32), 0, 0, v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

  }
  else
  {
    v5 = *(void **)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 72);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_2;
    v10[3] = &unk_1E89B9888;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 80);
    v11 = v8;
    v12 = v9;
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 88);
    objc_msgSend(v5, "updateSettingForKeyPath:value:callerVersion:completion:", CFSTR("root.siri.siriEnabled"), v6, v7, v10);

  }
}

void __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_89(uint64_t a1, void *a2)
{
  HMDCompositeSettingOperationResult *v3;
  HMDCompositeBoolSetting *v4;
  HMDCompositeSettingMetadata *v5;
  uint64_t v6;
  HMDCompositeSettingPrivileges *v7;
  HMDCompositeSettingMetadata *v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    v3 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", *(_QWORD *)(a1 + 32), 0, 0, v9);
  }
  else
  {
    v4 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", 0, CFSTR("7.2"), CFSTR("7.2"));
    v5 = [HMDCompositeSettingMetadata alloc];
    v6 = *(_QWORD *)(a1 + 32);
    v7 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
    v8 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:](v5, "initWithKeyPath:constraint:privileges:", v6, 0, v7);

    v3 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", *(_QWORD *)(a1 + 32), v4, v8, 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_2_90(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a2, a1[4], a1[5]);
}

void __116__HMDCompositeSettingsControllerManager__localUpdateSettingForUUID_homeUUID_keyPath_value_callerVersion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  HMDCompositeSettingOperationResult *v5;
  uint64_t v6;
  void *v7;
  HMDCompositeSettingOperationResult *v8;
  uint64_t v9;
  void *v10;
  HMDCompositeSettingOperationResult *v11;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [HMDCompositeSettingOperationResult alloc];
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:](v5, "initWithKeyPath:setting:metadata:error:", v6, 0, 0, v7);
  }
  else
  {
    -[HMDCompositeSettingsControllerManager _manageCharacteristicsBackedSettingsChangeForHomeUUID:accessoryUUID:](*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
    v8 = [HMDCompositeSettingOperationResult alloc];
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "setting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:](v8, "initWithKeyPath:setting:metadata:error:", v9, v7, v10, 0);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __130__HMDCompositeSettingsControllerManager_localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  id v11;
  NSObject *Property;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  char v37;
  void *v38;
  id v39;
  NSObject *v40;
  char v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  _BYTE buf[24];
  void *v61;
  __int128 v62;
  id v63;
  char v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v6 = *(void **)(a1 + 80);
  v54 = *(id *)(a1 + 40);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v55 = v9;
  if (v2)
  {
    v11 = v9;
    Property = objc_getProperty(v2, v10, 24, 1);
    dispatch_assert_queue_V2(Property);
    -[HMDCompositeSettingsControllerManager dataSourceIsCurrentDevicePrimaryResidentForHomeUUID:](v2, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (objc_msgSend(v13, "BOOLValue") & 1) != 0)
    {
      v56 = v6;
      objc_msgSend(v2, "stringToCompositeSettingsController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v54;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, v54);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v8, "na_filter:", &__block_literal_global_147085);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v51, "count"))
        {
          v65[0] = CFSTR("root.siri.siriEnabled");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "fetchSynchronousSettingsForKeyPaths:callerVersion:callerPrivilege:", v19, v11, v56);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = 0;
        }
        v52 = v20;
        if (objc_msgSend(v20, "count"))
        {
          objc_msgSend(v20, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setting");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v35 = v34;
          else
            v35 = 0;
          v36 = v35;

          v37 = objc_msgSend(v36, "BOOLValue");
        }
        else
        {
          v37 = 0;
        }
        v53 = v8;
        v38 = (void *)MEMORY[0x1D17BA0A0]();
        v39 = v2;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v50 = v38;
          v41 = v37;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v43;
          *(_WORD *)&buf[22] = 2112;
          v61 = v54;
          LOWORD(v62) = 2112;
          *(_QWORD *)((char *)&v62 + 2) = v7;
          _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@Siri is enabled:%@ for owner:%@, home:%@", buf, 0x2Au);

          v37 = v41;
          v38 = v50;
        }

        objc_autoreleasePoolPop(v38);
        v44 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_69;
        v61 = &unk_1E89B9838;
        *(_QWORD *)&v62 = v39;
        *((_QWORD *)&v62 + 1) = v54;
        v63 = v7;
        v64 = v37;
        objc_msgSend(v51, "na_map:", buf);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v44;
        v58[1] = 3221225472;
        v58[2] = __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_2_74;
        v58[3] = &unk_1E89B9860;
        v26 = v51;
        v59 = v26;
        v8 = v53;
        objc_msgSend(v53, "na_filter:", v58);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v46, "count"))
        {
          objc_msgSend(v18, "fetchSynchronousSettingsForKeyPaths:callerVersion:callerPrivilege:", v46, v55, v56);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "mutableCopy");

          v47 = (void *)v49;
          v8 = v53;
          v16 = v54;
        }
        objc_msgSend(v47, "na_safeAddObjectsFromArray:", v45);
        v57 = (id)objc_msgSend(v47, "copy");

        v32 = v52;
      }
      else
      {
        v27 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = v2;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v54;
          *(_WORD *)&buf[22] = 2112;
          v61 = v7;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unconfigured controller for uuid:%@, home:%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v27);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_66;
        v61 = &unk_1E89BE670;
        *(_QWORD *)&v62 = v31;
        v26 = v31;
        objc_msgSend(v8, "na_map:", buf);
        v57 = (id)objc_claimAutoreleasedReturnValue();
        v32 = (void *)v62;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Not a primary resident"), 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v2;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v16 = v54;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2112;
        v61 = v54;
        LOWORD(v62) = 2112;
        *(_QWORD *)((char *)&v62 + 2) = v7;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Error: %@, owner:%@, home:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v22);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke;
      v61 = &unk_1E89BE670;
      *(_QWORD *)&v62 = v21;
      v18 = v21;
      objc_msgSend(v8, "na_map:", buf);
      v57 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (id)v62;
    }

  }
  else
  {
    v57 = 0;
    v16 = v54;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

HMDCompositeSettingOperationResult *__120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDCompositeSettingOperationResult *v4;

  v3 = a2;
  v4 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v3, 0, 0, *(_QWORD *)(a1 + 32));

  return v4;
}

HMDCompositeSettingOperationResult *__120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  HMDCompositeSettingOperationResult *v4;

  v3 = a2;
  v4 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v3, 0, 0, *(_QWORD *)(a1 + 32));

  return v4;
}

HMDCompositeSettingOperationResult *__120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  HMDCompositeBoolSetting *v9;
  _BOOL8 v10;
  HMDCompositeSettingOperationResult *v11;
  HMDCompositeBoolSetting *v12;
  HMDCompositeSettingOperationResult *v13;
  HMDCompositeSettingMetadata *v14;
  HMDCompositeSettingPrivileges *v15;
  HMDCompositeSettingMetadata *v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriEndpointBridge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readValueValueForAccessoryUUID:homeUUID:forKeyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = [HMDCompositeBoolSetting alloc];
    if (objc_msgSend(v8, "BOOLValue"))
      v10 = *(_BYTE *)(a1 + 56) != 0;
    else
      v10 = 0;
    v12 = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v9, "initWithValue:readVersion:writeVersion:", v10, CFSTR("7.2"), CFSTR("7.2"));
    v14 = [HMDCompositeSettingMetadata alloc];
    v15 = -[HMDCompositeSettingPrivileges initWithMinReadUserPrivilege:]([HMDCompositeSettingPrivileges alloc], "initWithMinReadUserPrivilege:", 4);
    v16 = -[HMDCompositeSettingMetadata initWithKeyPath:constraint:privileges:](v14, "initWithKeyPath:constraint:privileges:", v3, 0, v15);

    v13 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v3, v12, v16, 0);
  }
  else
  {
    v11 = [HMDCompositeSettingOperationResult alloc];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 74);
    v12 = (HMDCompositeBoolSetting *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:](v11, "initWithKeyPath:setting:metadata:error:", v3, 0, 0, v12);
  }

  return v13;
}

uint64_t __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_2_74(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __120__HMDCompositeSettingsControllerManager__localFetchSettingsForUUID_homeUUID_withKeyPaths_callerVersion_callerPrivilege___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("root.siri.tapToAccess")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("root.siri.allowHeySiri"));

  return v3;
}

HMDCompositeSettingsController *__125__HMDCompositeSettingsControllerManager_initWithDataSource_registry_controllerFactory_stateManagerFactory_logEventSubmitter___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  HMDCompositeSettingsController *v16;

  v10 = (id *)(a1 + 32);
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a2;
  WeakRetained = objc_loadWeakRetained(v10);
  v16 = -[HMDCompositeSettingsController initWithDatabaseAdapter:model:homeUUID:ownerUUID:settingKeyPathBlockList:]([HMDCompositeSettingsController alloc], "initWithDatabaseAdapter:model:homeUUID:ownerUUID:settingKeyPathBlockList:", v14, a3, v13, v12, v11);

  -[HMDCompositeSettingsController setDelegate:](v16, "setDelegate:", WeakRetained);
  -[HMDCompositeSettingsController start](v16, "start");

  return v16;
}

+ (id)immutableSettingFromFetchReturn:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;

  v3 = a3;
  objc_msgSend(v3, "setting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    if ((isKindOfClass & 1) != 0)
    {
      v10 = objc_alloc(MEMORY[0x1E0CBA368]);
      objc_msgSend(v3, "keyPath");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithKeyPath:readOnly:BOOLValue:", v11, 0, objc_msgSend(v6, "BOOLValue"));
LABEL_29:

      goto LABEL_30;
    }
    v13 = v6;
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();
    if ((v14 & 1) != 0)
      v15 = v13;
    else
      v15 = 0;
    v11 = v15;

    if ((v14 & 1) != 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CBA590]);
      objc_msgSend(v3, "keyPath");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v16, "initWithKeyPath:readOnly:stringValue:", v17, 0, v18);
    }
    else
    {
      v45 = v9;
      v19 = v13;
      objc_opt_class();
      v20 = objc_opt_isKindOfClass();
      if ((v20 & 1) != 0)
        v21 = v19;
      else
        v21 = 0;
      v17 = v21;

      if ((v20 & 1) != 0)
      {
        v44 = v17;
        objc_msgSend(v5, "constraint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;
        v24 = v23;

        v40 = objc_alloc(MEMORY[0x1E0CBA370]);
        objc_msgSend(v3, "keyPath");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "numberValue");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v42, "integerValue");
        v26 = objc_msgSend(v24, "max");
        v27 = objc_msgSend(v24, "min");
        v28 = objc_msgSend(v24, "step");

        v12 = (void *)objc_msgSend(v40, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v18, 0, v25, v26, v27, v28);
      }
      else
      {
        v29 = v19;
        objc_opt_class();
        v30 = objc_opt_isKindOfClass();
        if ((v30 & 1) != 0)
          v31 = v29;
        else
          v31 = 0;
        v18 = v31;

        if ((v30 & 1) == 0)
        {
          v12 = 0;
          v9 = v45;
          goto LABEL_28;
        }
        v44 = v17;
        v43 = objc_alloc(MEMORY[0x1E0CBA5A8]);
        objc_msgSend(v3, "keyPath");
        v32 = objc_claimAutoreleasedReturnValue();
        v39 = objc_alloc(MEMORY[0x1E0CBA810]);
        objc_msgSend(v29, "inputLanguageCode");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "outputVoiceLanguageCode");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "outputVoiceGenderCode");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "voiceName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v39, "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v41, v33, v34, v35);
        v37 = v43;
        v42 = (void *)v32;
        v12 = (void *)objc_msgSend(v37, "initWithKeyPath:readOnly:languageValue:", v32, 0, v36);

      }
      v17 = v44;
      v9 = v45;
    }
LABEL_28:

    goto LABEL_29;
  }
  v12 = 0;
LABEL_30:

  return v12;
}

+ (id)zoneNameForHomeUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HMDCompositeSettingsZone.%@"), a3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t35_147131 != -1)
    dispatch_once(&logCategory__hmf_once_t35_147131, &__block_literal_global_112_147132);
  return (id)logCategory__hmf_once_v36_147133;
}

void __52__HMDCompositeSettingsControllerManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v36_147133;
  logCategory__hmf_once_v36_147133 = v0;

}

- (void)accessorySettingsLocalMessageHandler:(id)a3 didReceiveFetchRequestMessage:(id)a4 withHomeUUID:(id)a5 accessoryUUID:(id)a6 keyPaths:(id)a7 callerVersion:(id)a8 callerPrivilege:(unint64_t)a9 siriAvailableLanguagesSetting:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCompositeSettingsControllerManager *v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  HMDCompositeSettingsControllerManager *v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  -[HMDCompositeSettingsControllerManager dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "settingsControllerForAccessoryUUID:homeUUID:", v18, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v32 = v21;
      v27 = v20;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v28;
      v43 = 2114;
      v44 = v19;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch using current accessory %{public}@", buf, 0x16u);

      v20 = v27;
      v21 = v32;
    }

    objc_autoreleasePoolPop(v24);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke;
    v39[3] = &unk_1E89C0D18;
    v39[4] = v25;
    v40 = v16;
    v29 = v16;
    objc_msgSend(v23, "fetchSettingsForKeyPaths:completion:", v19, v39);

  }
  else
  {
    objc_msgSend(v19, "na_filter:", &__block_literal_global_178194);
    v30 = objc_claimAutoreleasedReturnValue();

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke_2;
    v34[3] = &unk_1E89C0D80;
    v35 = v21;
    v36 = self;
    v37 = v18;
    v38 = v16;
    v31 = v16;
    -[HMDCompositeSettingsControllerManager localFetchSettingsForUUID:homeUUID:withKeyPaths:callerVersion:callerPrivilege:completion:](self, "localFetchSettingsForUUID:homeUUID:withKeyPaths:callerVersion:callerPrivilege:completion:", v37, v17, v30, v20, a9, v34);

    v19 = (id)v30;
  }

}

- (void)accessorySettingsLocalMessageHandler:(id)a3 didReceiveUpdateRequestMessage:(id)a4 withHomeUUID:(id)a5 accessoryUUID:(id)a6 keyPath:(id)a7 value:(id)a8 callerVersion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMDCompositeSettingsControllerManager *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  HMDCompositeSettingsControllerManager *v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *contexta;
  void *context;
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  -[HMDCompositeSettingsControllerManager dataSource](self, "dataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "settingsControllerForAccessoryUUID:homeUUID:", v17, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      contexta = v17;
      v26 = v16;
      v27 = v15;
      v28 = v20;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v29;
      v50 = 2114;
      v51 = v18;
      v52 = 2112;
      v53 = v19;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Update using current accessory keyPath: %{public}@, value: %@", buf, 0x20u);

      v20 = v28;
      v15 = v27;
      v16 = v26;
      v17 = contexta;
    }

    objc_autoreleasePoolPop(v23);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __210__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveUpdateRequestMessage_withHomeUUID_accessoryUUID_keyPath_value_callerVersion___block_invoke;
    v45[3] = &unk_1E89C0DA8;
    v45[4] = v24;
    v46 = v18;
    v47 = v15;
    objc_msgSend(v22, "updateSettingWithKeyPath:settingValue:completion:", v46, v19, v45);

  }
  else
  {
    +[HMDCompositeSettingValue compositeSettingValueFromImmutableSettingsValue:](HMDCompositeSettingValue, "compositeSettingValueFromImmutableSettingsValue:", v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __210__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveUpdateRequestMessage_withHomeUUID_accessoryUUID_keyPath_value_callerVersion___block_invoke_11;
      v43[3] = &unk_1E89C0DD0;
      v43[4] = self;
      v44 = v15;
      -[HMDCompositeSettingsControllerManager localUpdateSettingForUUID:homeUUID:keyPath:value:callerVersion:completion:](self, "localUpdateSettingForUUID:homeUUID:keyPath:value:callerVersion:completion:", v17, v16, v18, v30, v20, v43);

    }
    else
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = v18;
        v33 = v17;
        v34 = v16;
        v35 = v15;
        v36 = v20;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v37;
        v50 = 2112;
        v51 = v19;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to update setting due to no composite setting value conversion for setting value: %@", buf, 0x16u);

        v20 = v36;
        v15 = v35;
        v16 = v34;
        v17 = v33;
        v18 = v39;
      }

      objc_autoreleasePoolPop(context);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "respondWithError:", v38);

    }
  }

}

void __210__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveUpdateRequestMessage_withHomeUUID_accessoryUUID_keyPath_value_callerVersion___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Update %{public}@ result: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(void **)(a1 + 48);
  if (v3)
    objc_msgSend(v9, "respondWithError:", v3);
  else
    objc_msgSend(v9, "respondWithSuccess");

}

void __210__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveUpdateRequestMessage_withHomeUUID_accessoryUUID_keyPath_value_callerVersion___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Update completed with error: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v10);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Update complete", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");
  }

}

void __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched settings %@, error: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v11 = objc_alloc_init(MEMORY[0x1E0CBA6A0]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2E8]), "initWithSettings:failureInformation:", v5, v11);
  v13 = *(void **)(a1 + 40);
  objc_msgSend(v12, "payloadCopy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "respondWithPayload:error:", v14, v6);

}

void __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v36 = a3;
  v34 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CBA6A0]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        +[HMDCompositeSettingsControllerManager immutableSettingFromFetchReturn:](HMDCompositeSettingsControllerManager, "immutableSettingFromFetchReturn:", v15, v34, v36, (_QWORD)v37);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v9, "addObject:", v16);
        }
        else
        {
          objc_msgSend(v15, "keyPath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setFetchFailureType:forKeyPath:", 0, v17);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v12);
  }

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v9, "addObject:");
  objc_msgSend(v8, "failedKeyPaths", v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  v20 = (void *)MEMORY[0x1D17BA0A0]();
  v21 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v19)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v42 = v24;
      v43 = 2112;
      v44 = v25;
      v45 = 2112;
      v46 = v9;
      v47 = 2112;
      v48 = v8;
      v26 = "%{public}@Fetch completed for accessory uuid: %@ settings: %@ failures: %@";
      v27 = v23;
      v28 = OS_LOG_TYPE_ERROR;
      v29 = 42;
LABEL_18:
      _os_log_impl(&dword_1CD062000, v27, v28, v26, buf, v29);

    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v42 = v24;
    v43 = 2112;
    v44 = v30;
    v45 = 2112;
    v46 = v9;
    v26 = "%{public}@Fetch completed for accessory uuid: %@ settings: %@";
    v27 = v23;
    v28 = OS_LOG_TYPE_INFO;
    v29 = 32;
    goto LABEL_18;
  }

  objc_autoreleasePoolPop(v20);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2E8]), "initWithSettings:failureInformation:", v9, v8);
  v32 = *(void **)(a1 + 56);
  objc_msgSend(v31, "payloadCopy");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "respondWithPayload:error:", v33, 0);

}

uint64_t __250__HMDCompositeSettingsControllerManager_AccessorySettingsLocalMessageHandlerDelegate__accessorySettingsLocalMessageHandler_didReceiveFetchRequestMessage_withHomeUUID_accessoryUUID_keyPaths_callerVersion_callerPrivilege_siriAvailableLanguagesSetting___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", CFSTR("root.siri.availableLanguages")) ^ 1;
}

@end
