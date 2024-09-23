@implementation HMDPersonManager

- (HMDPersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 coreDataManager:(id)a5 dataInterfaces:(id)a6 workQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDPersonManager *v18;
  HMDPersonManager *v19;
  uint64_t v20;
  NSUUID *UUID;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *logIdentifier;
  id unassociatedFaceCropsCleanupTimerFactory;
  HMDPersonManager *result;
  HMDPersonManager *v28;
  SEL v29;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v14)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v15)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_13:
    v28 = (HMDPersonManager *)_HMFPreconditionFailure();
    -[HMDPersonManager dealloc](v28, v29);
    return result;
  }
  v30.receiver = self;
  v30.super_class = (Class)HMDPersonManager;
  v18 = -[HMDPersonManager init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_workQueue, a7);
    v20 = objc_msgSend(v12, "copy");
    UUID = v19->_UUID;
    v19->_UUID = (NSUUID *)v20;

    objc_storeStrong((id *)&v19->_zoneManager, a4);
    objc_storeStrong((id *)&v19->_dataInterfaces, a6);
    objc_storeStrong((id *)&v19->_coreDataManager, a5);
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "zoneName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@/%@"), v12, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v19->_logIdentifier;
    v19->_logIdentifier = (NSString *)v24;

    v19->_fetchBatchLimit = 100;
    unassociatedFaceCropsCleanupTimerFactory = v19->_unassociatedFaceCropsCleanupTimerFactory;
    v19->_unassociatedFaceCropsCleanupTimerFactory = &__block_literal_global_82688;

  }
  return v19;
}

- (void)dealloc
{
  void *v3;
  HMDPersonManager *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  HMDPersonManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDPersonManager;
  -[HMDPersonManager dealloc](&v7, sel_dealloc);
}

- (void)configureWithHome:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonManager *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!v4)
    _HMFPreconditionFailure();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v9;
    v43 = 2112;
    v44 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring person manager with home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_handleUserPrivilegeDidChangeNotification_, CFSTR("HMDUserPrivilegeDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDeviceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_handleResidentWasAddedNotification_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), v12);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDeviceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel_handleResidentWasUpdatedNotification_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), v14);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDeviceManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel_handleResidentWasRemovedNotification_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), v16);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel_handleDataSyncInProgressChangedNotification_, CFSTR("HMDHomeManagerDataSyncInProgressChangedNotification"), v18);

  -[HMDPersonManager zoneManager](v7, "zoneManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "defaultConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  v22 = objc_alloc_init(MEMORY[0x24BE4ECF0]);
  objc_msgSend(v22, "setShouldRebuildOnManateeKeyLoss:", 1);
  objc_msgSend(v21, "setCloudZoneConfiguration:", v22);
  objc_msgSend(v21, "setShouldCreateZone:", 0);
  -[HMDPersonManager zoneManager](v7, "zoneManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDefaultConfiguration:", v21);

  -[HMDPersonManager zoneManager](v7, "zoneManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegate:", v7);

  -[HMDPersonManager zoneManager](v7, "zoneManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDataSource:", v7);

  -[HMDPersonManager zoneManager](v7, "zoneManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "configure");

  -[HMDPersonManager zoneManager](v7, "zoneManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "start");

  -[HMDPersonManager coreDataManager](v7, "coreDataManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDelegate:", v7);

  -[HMDPersonManager coreDataManager](v7, "coreDataManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "configureWithDataSource:", v7);

  -[HMDPersonManager settings](v7, "settings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager _createOrRemoveZonesForSettings:](v7, "_createOrRemoveZonesForSettings:", v30);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[HMDPersonManager dataInterfaces](v7, "dataInterfaces", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "configureWithDataSource:home:", v7, v4);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v33);
  }

  -[HMDPersonManager _notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident](v7, "_notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident");
  -[HMDPersonManager _notifyDataInterfacesOfCurrentIsDataSyncInProgress](v7, "_notifyDataInterfacesOfCurrentIsDataSyncInProgress");

}

- (id)removeAllAssociatedDataDueToHomeGraphObjectRemoval:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  HMDPersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonManager workQueue](self, "workQueue");
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
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Asked to remove all person data with isDueToHomeGraphObjectRemoval: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (a3)
  {
    -[HMDPersonManager _removePersonZones](v7, "_removePersonZones");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDPersonManager coreDataManager](v7, "coreDataManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllAssociatedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __71__HMDPersonManager_removeAllAssociatedDataDueToHomeGraphObjectRemoval___block_invoke;
    v15[3] = &unk_24E793078;
    v15[4] = v7;
    objc_msgSend(v13, "flatMap:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
}

- (BOOL)syncsDataToAllUsers
{
  return 0;
}

- (BOOL)sharesFaceClassifications
{
  return 0;
}

- (id)personWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDPersonManager coreDataManager](self, "coreDataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)unassociatedFaceCropWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDPersonManager localZone](self, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchModelWithModelID:ofType:error:", v4, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "createFaceCrop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)personFaceCropWithUnassociatedFaceCropUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = CFSTR("unassociatedFaceCropUUID");
  v19[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDFaceCropModel faceCropsWithUnassociatedFaceCropUUIDQuery](HMDFaceCropModel, "faceCropsWithUnassociatedFaceCropUUIDQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryModelsUsingQuery:arguments:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__82665;
  v16 = __Block_byref_object_dispose__82666;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__HMDPersonManager_personFaceCropWithUnassociatedFaceCropUUID___block_invoke;
  v11[3] = &unk_24E780CE8;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)faceCropsForPersonWithUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR("personUUID");
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDFaceCropModel faceCropsForPersonUUIDQuery](HMDFaceCropModel, "faceCropsForPersonUUIDQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryModelsUsingQuery:arguments:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __47__HMDPersonManager_faceCropsForPersonWithUUID___block_invoke;
  v17 = &unk_24E780D10;
  v18 = v6;
  v11 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v14);
  v12 = (void *)objc_msgSend(v11, "copy", v14, v15, v16, v17);

  return v12;
}

- (void)handleFaceMisclassificationForFaceCropData:(id)a3 personUUID:(id)a4
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
  -[HMDPersonManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__HMDPersonManager_handleFaceMisclassificationForFaceCropData_personUUID___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)addUnassociatedFaceCropWithData:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[HMDPersonManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMDPersonManager_addUnassociatedFaceCropWithData___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_async(v6, block);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)enumeratePersonsUsingBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDPersonManager coreDataManager](self, "coreDataManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratePersonsUsingBlock:", v4);

}

- (id)addOrUpdatePersons:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager addOrUpdatePersons:andRemovePersonsWithUUIDs:](self, "addOrUpdatePersons:andRemovePersonsWithUUIDs:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)removePersonsWithUUIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager addOrUpdatePersons:andRemovePersonsWithUUIDs:](self, "addOrUpdatePersons:andRemovePersonsWithUUIDs:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)addOrUpdatePersons:(id)a3 andRemovePersonsWithUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDPersonManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543874;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding/updating persons: %@, removing persons with UUIDs: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDPersonManager coreDataManager](v9, "coreDataManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOrUpdatePersons:andRemovePersonsWithUUIDs:", v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke;
  v17[3] = &unk_24E780D80;
  v17[4] = v9;
  v18 = v7;
  v14 = v7;
  objc_msgSend(v13, "flatMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)addOrUpdateFaceCrops:(id)a3
{
  id v4;
  void *v5;
  HMDPersonManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDPersonManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v8;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding/updating face crops: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPersonManager localZone](v6, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_61_82648);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Add face crops"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTransactionItemsBatchLimit:", 5);
    objc_msgSend(v9, "addModels:options:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "flatMap:", &__block_literal_global_65);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot add/update face crops because the local zone is not available", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v18 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)removeFaceCropsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  HMDPersonManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDPersonManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v8;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing face crops with UUIDs: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDPersonManager localZone](v6, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Remove face crops"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeModelIDs:options:", v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "flatMap:", &__block_literal_global_68_82644);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove face crops because the local zone is not available", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v12;

  return v18;
}

- (id)faceCropUUIDsForPersonWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDPersonManager *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager localZone](self, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDPersonManager faceCropsForPersonWithUUID:](self, "faceCropsForPersonWithUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_70);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot query face crops because the local zone is not available", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_createOrRemoveZonesForSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDPersonManager *v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDPersonManager isDataAvailable](self, "isDataAvailable")
    || !objc_msgSend(v4, "requiresPersistentStorage"))
  {
    if (-[HMDPersonManager isDataAvailable](self, "isDataAvailable")
      && (objc_msgSend(v4, "requiresPersistentStorage") & 1) == 0)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Data is available but settings do not require persistent storage; removing zones",
          (uint8_t *)&v15,
          0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v14 = -[HMDPersonManager _removePersonZones](v11, "_removePersonZones");
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Data is unavailable but settings require persistent storage; creating zones",
        (uint8_t *)&v15,
        0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDPersonManager _createZones](v7, "_createZones");
  }

}

- (BOOL)isDataSyncInProgress
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HMDPersonManager zoneManager](self, "zoneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDataSyncInProgress");

  return v5;
}

- (id)_unassociatedFaceCropsModelsWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__HMDPersonManager__unassociatedFaceCropsModelsWithUUIDs___block_invoke;
  v8[3] = &unk_24E780E68;
  v8[4] = self;
  objc_msgSend(v4, "na_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_faceCropsModelsWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__HMDPersonManager__faceCropsModelsWithUUIDs___block_invoke;
  v8[3] = &unk_24E780E90;
  v8[4] = self;
  objc_msgSend(v4, "na_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_removeFaceprintsForFaceCropsWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPersonManager faceprintsForFaceCropsWithUUIDs:](self, "faceprintsForFaceCropsWithUUIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "na_map:", &__block_literal_global_74);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager removeFaceprintsWithUUIDs:](self, "removeFaceprintsWithUUIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_handleCreatedOrUpdatedModel:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  HMDPersonManager *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HMDPersonManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  HMDPersonManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  HMDPersonManager *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v15;
      v88 = 2112;
      v89 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling new/updated person model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v11, "createPerson");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    -[HMDPersonManager dataInterfaces](v13, "dataInterfaces");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    if (v18)
    {
      v19 = v18;
      v65 = v11;
      v20 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v79 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "handleUpdatedPerson:mirrorOutputFuture:", v16, v7);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      }
      while (v19);
      v11 = v65;
    }
    goto LABEL_76;
  }
  v23 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v16 = v24;

  if (!v16)
  {
    v36 = v23;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;
    v17 = v37;

    if (!v17)
    {
      v48 = v36;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v49 = v48;
      else
        v49 = 0;
      v30 = v49;

      v50 = (void *)MEMORY[0x227676638]();
      v51 = self;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v52;
      if (v30)
      {
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v87 = v54;
          v88 = 2112;
          v89 = v30;
          _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Handling new/updated faceprint model: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v50);
        objc_msgSend(v30, "createFaceprint");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          v64 = v9;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          -[HMDPersonManager dataInterfaces](v51, "dataInterfaces");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
          if (v57)
          {
            v58 = v57;
            v59 = *(_QWORD *)v67;
            do
            {
              for (j = 0; j != v58; ++j)
              {
                if (*(_QWORD *)v67 != v59)
                  objc_enumerationMutation(v56);
                v61 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v61, "handleUpdatedFaceprint:mirrorOutputFuture:", v55, v7);
              }
              v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
            }
            while (v58);
          }

          v9 = v64;
          v11 = 0;
        }

      }
      else
      {
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v87 = v62;
          v88 = 2112;
          v89 = v48;
          _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Received creation/update for unknown model: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v50);
        v30 = 0;
      }
      v17 = 0;
      goto LABEL_75;
    }
    v38 = (void *)MEMORY[0x227676638]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v41;
      v88 = 2112;
      v89 = v17;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Handling new/updated unassociated face crop model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    objc_msgSend(v17, "createFaceCrop");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (!v30)
      goto LABEL_52;
    v63 = v9;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[HMDPersonManager dataInterfaces](v39, "dataInterfaces");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v71;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v71 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v47, "handleUpdatedUnassociatedFaceCrop:mirrorOutputFuture:", v30, v7);
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      }
      while (v44);
    }

LABEL_51:
    v9 = v63;
LABEL_52:
    v11 = 0;
    goto LABEL_75;
  }
  v25 = (void *)MEMORY[0x227676638]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hmbModelID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v87 = v28;
    v88 = 2112;
    v89 = v29;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Handling new/updated face crop model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v25);
  objc_msgSend(v16, "createPersonFaceCrop");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    -[HMDPersonManager dataInterfaces](v26, "dataInterfaces");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    if (!v31)
    {
LABEL_75:

      goto LABEL_76;
    }
    v32 = v31;
    v63 = v9;
    v33 = *(_QWORD *)v75;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v75 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * m);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v35, "handleUpdatedPersonFaceCrop:mirrorOutputFuture:", v17, v7);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    }
    while (v32);
    goto LABEL_51;
  }
LABEL_76:

}

- (void)_handleDeletedModel:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  HMDPersonManager *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HMDPersonManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  HMDPersonManager *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  HMDPersonManager *v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id obj;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint8_t v93[128];
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v71 = v9;
  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v95 = v15;
      v96 = 2112;
      v97 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling deleted person model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    -[HMDPersonManager dataInterfaces](v13, "dataInterfaces");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v87 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v11, "hmbModelID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleRemovedPersonWithUUID:mirrorOutputFuture:", v22, v7);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
      }
      while (v18);
    }
  }
  else
  {
    v23 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v16 = v24;

    if (v16)
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v95 = v28;
        v96 = 2112;
        v97 = v16;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Handling deleted face crop model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      v29 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v16, "hmbModelID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setWithObject:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HMDPersonManager _removeFaceprintsForFaceCropsWithUUIDs:](v26, "_removeFaceprintsForFaceCropsWithUUIDs:", v31);

      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      -[HMDPersonManager dataInterfaces](v26, "dataInterfaces");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v83;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v83 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v16, "hmbModelID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "handleRemovedFaceCropWithUUID:mirrorOutputFuture:", v39, v7);

            }
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
        }
        while (v35);
      }
    }
    else
    {
      v40 = v23;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = v40;
      else
        v41 = 0;
      v33 = v41;

      if (v33)
      {
        v42 = (void *)MEMORY[0x227676638]();
        v43 = self;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v95 = v45;
          v96 = 2112;
          v97 = v33;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Handling deleted unassociated face crop model: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v42);
        v46 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v33, "hmbModelID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setWithObject:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[HMDPersonManager _removeFaceprintsForFaceCropsWithUUIDs:](v43, "_removeFaceprintsForFaceCropsWithUUIDs:", v48);

        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        -[HMDPersonManager dataInterfaces](v43, "dataInterfaces");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v79;
          do
          {
            for (k = 0; k != v51; ++k)
            {
              if (*(_QWORD *)v79 != v52)
                objc_enumerationMutation(obj);
              v54 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v33, "hmbModelID");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "handleRemovedFaceCropWithUUID:mirrorOutputFuture:", v55, v7);

              }
            }
            v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
          }
          while (v51);
        }
      }
      else
      {
        v56 = v40;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v57 = v56;
        else
          v57 = 0;
        v58 = v57;

        v59 = (void *)MEMORY[0x227676638]();
        v60 = self;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = v61;
        obj = v58;
        if (v58)
        {
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v95 = v63;
            v96 = 2112;
            v97 = v58;
            _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Handling deleted faceprint model: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v59);
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          -[HMDPersonManager dataInterfaces](v60, "dataInterfaces");
          v72 = (id)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
          if (v64)
          {
            v65 = v64;
            v66 = *(_QWORD *)v75;
            do
            {
              for (m = 0; m != v65; ++m)
              {
                if (*(_QWORD *)v75 != v66)
                  objc_enumerationMutation(v72);
                v68 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * m);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(obj, "hmbModelID");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "handleRemovedFaceprintWithUUID:mirrorOutputFuture:", v69, v7);

                }
              }
              v65 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
            }
            while (v65);
          }

        }
        else
        {
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v95 = v70;
            v96 = 2112;
            v97 = v56;
            _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Received deletion for unknown model: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v59);
          obj = 0;
        }
      }

    }
  }

}

- (void)_notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HMDPersonManager dataInterfaces](self, "dataInterfaces", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "handleUpdatedIsCurrentDeviceAvailableResident:", -[HMDPersonManager isCurrentDeviceAvailableResident](self, "isCurrentDeviceAvailableResident"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_notifyDataInterfacesOfCurrentIsDataSyncInProgress
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HMDPersonManager dataInterfaces](self, "dataInterfaces", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "handleUpdatedIsDataSyncInProgress:", -[HMDPersonManager isDataSyncInProgress](self, "isDataSyncInProgress"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_createZones
{
  NSObject *v3;
  void *v4;
  HMDPersonManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonManager workQueue](self, "workQueue");
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
    v12 = 138543362;
    v13 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating zones for person manager data", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDPersonManager zoneManager](v5, "zoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setShouldCreateZone:", 1);
  -[HMDPersonManager zoneManager](v5, "zoneManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startWithConfiguration:", v10);

}

- (void)_cleanUpExpiredUnassociatedFaceCrops
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMDPersonManager *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  HMDPersonManager *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  -[HMDPersonManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -*MEMORY[0x24BDD53E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("dateAfter");
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = CFSTR("dateBefore");
  v31[0] = v5;
  v31[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", -[HMDPersonManager fetchBatchLimit](self, "fetchBatchLimit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Remove expired unassociated face crops"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldEnqueueMirrorOutput:", 0);
  +[HMDUnassociatedFaceCropModel unassociatedFaceCropsBetweenDatesQueryWithIsAscending:](HMDUnassociatedFaceCropModel, "unassociatedFaceCropsBetweenDatesQueryWithIsAscending:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager localZone](self, "localZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryModelsUsingQuery:arguments:", v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __56__HMDPersonManager__cleanUpExpiredUnassociatedFaceCrops__block_invoke;
  v23 = &unk_24E780EF8;
  v24 = self;
  v12 = v7;
  v25 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v20);
  if (objc_msgSend(v12, "count", v20, v21, v22, v23, v24))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 138543618;
      v27 = v16;
      v28 = 2048;
      v29 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Removing %lu expired unassociated face crops", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDPersonManager localZone](v14, "localZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "removeModelIDs:options:", v12, v8);

    objc_msgSend(v12, "removeAllObjects");
  }

}

- (id)_removePersonZones
{
  NSObject *v3;
  void *v4;
  HMDPersonManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing zones for person manager data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDPersonManager zoneManager](v5, "zoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remove");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __38__HMDPersonManager__removePersonZones__block_invoke;
  v12[3] = &unk_24E79BD80;
  v12[4] = v5;
  objc_msgSend(v9, "addFailureBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)handleUserPrivilegeDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDPersonManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__HMDPersonManager_handleUserPrivilegeDidChangeNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleResidentWasAddedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDPersonManager *v9;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HMDPersonManager_handleResidentWasAddedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleResidentWasUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDPersonManager *v9;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDPersonManager_handleResidentWasUpdatedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleResidentWasRemovedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDPersonManager *v9;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDPersonManager_handleResidentWasRemovedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleDataSyncInProgressChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDPersonManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HMDPersonManager_handleDataSyncInProgressChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__HMDPersonManager_localZone_didProcessModelCreation___block_invoke;
  v9[3] = &unk_24E79C268;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__HMDPersonManager_localZone_didProcessModelUpdate___block_invoke;
  v9[3] = &unk_24E79C268;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__HMDPersonManager_localZone_didProcessModelDeletion___block_invoke;
  v9[3] = &unk_24E79C268;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  NSObject *v4;

  -[HMDPersonManager workQueue](self, "workQueue", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return 0;
}

- (void)zoneManagerDidStart:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, double);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
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
    v22 = 138543362;
    v23 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Person zone manager started", (uint8_t *)&v22, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDPersonManager zoneManager](v7, "zoneManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager setLocalZone:](v7, "setLocalZone:", v11);

  -[HMDPersonManager localZone](v7, "localZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserverForAllModels:", v7);

  -[HMDPersonManager localZone](v7, "localZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startUp");

  -[HMDPersonManager zoneManager](v7, "zoneManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cloudZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager setCloudZone:](v7, "setCloudZone:", v15);

  -[HMDPersonManager _cleanUpExpiredUnassociatedFaceCrops](v7, "_cleanUpExpiredUnassociatedFaceCrops");
  -[HMDPersonManager unassociatedFaceCropsCleanupTimerFactory](v7, "unassociatedFaceCropsCleanupTimerFactory");
  v16 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v16[2](v16, 4, 86400.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager setUnassociatedFaceCropsCleanupTimer:](v7, "setUnassociatedFaceCropsCleanupTimer:", v17);

  -[HMDPersonManager unassociatedFaceCropsCleanupTimer](v7, "unassociatedFaceCropsCleanupTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", v7);

  -[HMDPersonManager workQueue](v7, "workQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonManager unassociatedFaceCropsCleanupTimer](v7, "unassociatedFaceCropsCleanupTimer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegateQueue:", v19);

  -[HMDPersonManager unassociatedFaceCropsCleanupTimer](v7, "unassociatedFaceCropsCleanupTimer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resume");

}

- (void)zoneManagerDidStop:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
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
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Person zone manager stopped", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDPersonManager setLocalZone:](v7, "setLocalZone:", 0);
  -[HMDPersonManager setCloudZone:](v7, "setCloudZone:", 0);

}

- (void)coreDataManager:(id)a3 didUpdatePersons:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HMDPersonManager dataInterfaces](self, "dataInterfaces");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v17 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v18;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v9, "handleUpdatedPerson:mirrorOutputFuture:", v15, 0);
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

}

- (void)coreDataManager:(id)a3 didRemovePersonsWithUUIDs:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HMDPersonManager dataInterfaces](self, "dataInterfaces");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v17 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v18;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v9, "handleRemovedPersonWithUUID:mirrorOutputFuture:", v15, 0);
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

}

- (BOOL)isDataAvailable
{
  void *v2;
  BOOL v3;

  -[HMDPersonManager localZone](self, "localZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isCurrentDeviceAvailableResident
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HMDPersonManager zoneManager](self, "zoneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentDeviceAvailableResident");

  return v5;
}

- (id)performCloudPull
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDPersonManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonManager cloudZone](self, "cloudZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ED10]), "initWithLabel:", CFSTR("Explicit cloud pull"));
    objc_msgSend(v3, "performCloudPullWithOptions:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __36__HMDPersonManager_performCloudPull__block_invoke;
    v13[3] = &unk_24E79BD80;
    v13[4] = self;
    objc_msgSend(v5, "addFailureBlock:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

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
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform cloud pull because the cloud zone is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithError:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)personsWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__HMDPersonManager_personsWithUUIDs___block_invoke;
  v8[3] = &unk_24E780F20;
  v8[4] = self;
  objc_msgSend(v4, "na_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateFaceCropsUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPersonManager localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryModelsOfType:", objc_opt_class());
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__HMDPersonManager_enumerateFaceCropsUsingBlock___block_invoke;
  v15[3] = &unk_24E780F48;
  v8 = v4;
  v16 = v8;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);
  -[HMDPersonManager localZone](self, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryModelsOfType:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __49__HMDPersonManager_enumerateFaceCropsUsingBlock___block_invoke_2;
  v13[3] = &unk_24E780F70;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

- (void)enumerateUnassociatedFaceCropsUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPersonManager localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryModelsOfType:", objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__HMDPersonManager_enumerateUnassociatedFaceCropsUsingBlock___block_invoke;
  v9[3] = &unk_24E780F48;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

- (id)faceCropsWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPersonManager _faceCropsModelsWithUUIDs:](self, "_faceCropsModelsWithUUIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_108_82572);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDPersonManager _unassociatedFaceCropsModelsWithUUIDs:](self, "_unassociatedFaceCropsModelsWithUUIDs:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_map:", &__block_literal_global_110);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setByAddingObjectsFromSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)enumeratePersonFaceCropsUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPersonManager localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryModelsOfType:", objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__HMDPersonManager_enumeratePersonFaceCropsUsingBlock___block_invoke;
  v9[3] = &unk_24E780F70;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

- (id)faceCropsForPersonsWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
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
        -[HMDPersonManager faceCropsForPersonWithUUID:](self, "faceCropsForPersonWithUUID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unionSet:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  return v13;
}

- (void)enumerateFaceprintsUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPersonManager localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryModelsOfType:", objc_opt_class());
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__HMDPersonManager_enumerateFaceprintsUsingBlock___block_invoke;
  v9[3] = &unk_24E781018;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

- (id)faceprintsForFaceCropsWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDPersonManager *v19;
  HMDPersonManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v25;
  uint64_t v26;
  id obj;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v31;
    *(_QWORD *)&v7 = 138543874;
    v25 = v7;
    do
    {
      v10 = 0;
      v26 = v8;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10);
        -[HMDPersonManager localZone](self, "localZone", v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_opt_class();
        v29 = 0;
        objc_msgSend(v12, "fetchModelsWithParentModelID:ofType:error:", v11, v13, &v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v29;

        if (v14)
        {
          objc_msgSend(v14, "na_map:", &__block_literal_global_113_82568);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "unionSet:", v16);

        }
        else
        {
          v17 = v9;
          v18 = (void *)MEMORY[0x227676638]();
          v19 = self;
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v35 = v22;
            v36 = 2112;
            v37 = v11;
            v38 = 2112;
            v39 = v15;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch faceprints for face crop with UUID %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v18);
          v9 = v17;
          self = v19;
          v8 = v26;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v8);
  }

  v23 = (void *)objc_msgSend(v28, "copy");
  return v23;
}

- (id)addOrUpdateFaceprints:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonManager *v7;
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
  void *v18;
  void *v19;
  void *v20;
  HMDPersonManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
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
    v26 = 138543618;
    v27 = v9;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding/updating faceprints: %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDPersonManager localZone](v7, "localZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_115_82560);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPersonManager localZone](v7, "localZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Add faceprints"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addModels:options:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BE6B628];
    -[HMDPersonManager workQueue](v7, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "schedulerWithDispatchQueue:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reschedule:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "flatMap:", &__block_literal_global_118_82562);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot add/update persons because the local zone is not available", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v24 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "futureWithError:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDPersonManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDPersonManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  int64_t v47;
  _QWORD v48[4];
  id v49;
  int64_t v50;
  _QWORD v51[2];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDPersonManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v14;
    v54 = 2112;
    v55 = v8;
    v56 = 2112;
    v57 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Associating face crops with UUIDs %@ to person with UUID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDPersonManager localZone](v12, "localZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HMDPersonManager _unassociatedFaceCropsModelsWithUUIDs:](v12, "_unassociatedFaceCropsModelsWithUUIDs:", v8);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "na_map:", &__block_literal_global_120_82547);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_2;
    v48[3] = &unk_24E781120;
    v17 = v9;
    v49 = v17;
    v50 = a5;
    objc_msgSend(v44, "na_map:", v48);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPersonManager _faceCropsModelsWithUUIDs:](v12, "_faceCropsModelsWithUUIDs:", v8);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v16;
    v45[1] = 3221225472;
    v45[2] = __75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_3;
    v45[3] = &unk_24E781148;
    v46 = v17;
    v47 = a5;
    objc_msgSend(v43, "na_map:", v45);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Associate unassociated face crops"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addModels:andRemoveModelIDs:options:", v41, v42, v18);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Associate face crops"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateModels:options:", v40, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x24BE6B608];
    v51[0] = v39;
    v51[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "chainFutures:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v8;
    v25 = (void *)MEMORY[0x24BE6B628];
    -[HMDPersonManager workQueue](v12, "workQueue");
    v26 = v9;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "schedulerWithDispatchQueue:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reschedule:", v28);
    v29 = v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "flatMap:", &__block_literal_global_129_82550);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v29;
    v8 = v24;

    v9 = v26;
    v32 = v44;

  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = v12;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v36;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot associate face crops because the local zone is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
    v37 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "futureWithError:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v31;
}

- (id)disassociateFaceCropsWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonManager *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDPersonManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
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
    v27 = 138543618;
    v28 = v9;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Disassociating face crops with UUIDs %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDPersonManager localZone](v7, "localZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HMDPersonManager _faceCropsModelsWithUUIDs:](v7, "_faceCropsModelsWithUUIDs:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_map:", &__block_literal_global_131);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_map:", &__block_literal_global_133_82537);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Disassociate face crops"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addModels:andRemoveModelIDs:options:", v13, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BE6B628];
    -[HMDPersonManager workQueue](v7, "workQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "schedulerWithDispatchQueue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reschedule:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "flatMap:", &__block_literal_global_136);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v7;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot disassociate face crops because the local zone is not available", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v25 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "futureWithError:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)removeFaceprintsWithUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonManager *v7;
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
  void *v18;
  HMDPersonManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager workQueue](self, "workQueue");
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
    v24 = 138543618;
    v25 = v9;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing faceprints with UUIDs: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDPersonManager localZone](v7, "localZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Remove faceprints"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeModelIDs:options:", v4, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BE6B628];
    -[HMDPersonManager workQueue](v7, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "schedulerWithDispatchQueue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reschedule:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "flatMap:", &__block_literal_global_139_82533);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove faceprints because the local zone is not available", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "futureWithError:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)createBatchChange
{
  void *v3;
  HMDPersonManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HMDPersonDataBatchChange *v11;
  void *v12;
  HMDPersonManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDPersonManager *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating batch change", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDPersonManager localZone](v4, "localZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v21 = 0;
    objc_msgSend(v7, "createLocalInputWithError:", &v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;
    if (v9)
    {
      v11 = -[HMDPersonDataBatchChange initWithLocalInput:]([HMDPersonDataBatchChange alloc], "initWithLocalInput:", v9);
      -[HMDPersonDataBatchChange setDataSource:](v11, "setDataSource:", v4);
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = v4;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v19;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create local zone input for batch change: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v11 = 0;
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v4;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot create batch change because the local zone is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (HMDPersonManagerSettings)settings
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDPersonManager UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMDPersonManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonManager unassociatedFaceCropsCleanupTimer](self, "unassociatedFaceCropsCleanupTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Unassociated face crops cleanup timer fired", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDPersonManager _cleanUpExpiredUnassociatedFaceCrops](v7, "_cleanUpExpiredUnassociatedFaceCrops");
  }

}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)syncsPersonData
{
  return self->_syncsPersonData;
}

- (HMDPersonCoreDataManager)coreDataManager
{
  return (HMDPersonCoreDataManager *)objc_getProperty(self, a2, 32, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCloudZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMFTimer)unassociatedFaceCropsCleanupTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUnassociatedFaceCropsCleanupTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)fetchBatchLimit
{
  return self->_fetchBatchLimit;
}

- (void)setFetchBatchLimit:(unint64_t)a3
{
  self->_fetchBatchLimit = a3;
}

- (id)unassociatedFaceCropsCleanupTimerFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setUnassociatedFaceCropsCleanupTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (HMDDatabaseZoneManager)zoneManager
{
  return (HMDDatabaseZoneManager *)objc_getProperty(self, a2, 88, 1);
}

- (NSSet)dataInterfaces
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataInterfaces, 0);
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_unassociatedFaceCropsCleanupTimerFactory, 0);
  objc_storeStrong((id *)&self->_unassociatedFaceCropsCleanupTimer, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_coreDataManager, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

uint64_t __46__HMDPersonManager_removeFaceprintsWithUUIDs___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

uint64_t __51__HMDPersonManager_disassociateFaceCropsWithUUIDs___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

HMDUnassociatedFaceCropModel *__51__HMDPersonManager_disassociateFaceCropsWithUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  HMDUnassociatedFaceCropModel *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a2, "createPersonFaceCrop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "unassociatedFaceCropUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;

    v9 = objc_alloc(MEMORY[0x24BDD7680]);
    objc_msgSend(v3, "dataRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateCreated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceBoundingBox");
    v12 = (void *)objc_msgSend(v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v8, v10, v11);

    v7 = -[HMDUnassociatedFaceCropModel initWithFaceCrop:]([HMDUnassociatedFaceCropModel alloc], "initWithFaceCrop:", v12);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __51__HMDPersonManager_disassociateFaceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmbModelID");
}

HMDFaceCropModel *__75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDFaceCropModel *v10;

  objc_msgSend(a2, "createFaceCrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD7850]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateCreated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceBoundingBox");
    v8 = (void *)objc_msgSend(v4, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v5, v6, v7, *(_QWORD *)(a1 + 32));

    objc_msgSend(v3, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnassociatedFaceCropUUID:", v9);

    objc_msgSend(v8, "setSource:", *(_QWORD *)(a1 + 40));
    v10 = -[HMDFaceCropModel initWithPersonFaceCrop:]([HMDFaceCropModel alloc], "initWithPersonFaceCrop:", v8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

HMDFaceCropModel *__75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  HMDFaceCropModel *v4;
  void *v5;
  void *v6;
  HMDFaceCropModel *v7;

  v3 = a2;
  v4 = [HMDFaceCropModel alloc];
  objc_msgSend(v3, "hmbModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmbParentModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMBModel initWithModelID:parentModelID:](v4, "initWithModelID:parentModelID:", v5, v6);
  -[HMDFaceCropModel setPersonUUID:](v7, "setPersonUUID:", *(_QWORD *)(a1 + 32));
  -[HMDFaceCropModel setSource:](v7, "setSource:", *(_QWORD *)(a1 + 40));
  return v7;
}

uint64_t __75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke_4()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

uint64_t __75__HMDPersonManager_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmbModelID");
}

uint64_t __42__HMDPersonManager_addOrUpdateFaceprints___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

HMDFaceprintModel *__42__HMDPersonManager_addOrUpdateFaceprints___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDFaceprintModel *v3;

  v2 = a2;
  v3 = -[HMDFaceprintModel initWithFaceprint:]([HMDFaceprintModel alloc], "initWithFaceprint:", v2);

  return v3;
}

uint64_t __52__HMDPersonManager_faceprintsForFaceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createFaceprint");
}

void __50__HMDPersonManager_enumerateFaceprintsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "createFaceprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

void __55__HMDPersonManager_enumeratePersonFaceCropsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "createPersonFaceCrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

uint64_t __39__HMDPersonManager_faceCropsWithUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createFaceCrop");
}

uint64_t __39__HMDPersonManager_faceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createPersonFaceCrop");
}

void __61__HMDPersonManager_enumerateUnassociatedFaceCropsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "createFaceCrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

void __49__HMDPersonManager_enumerateFaceCropsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "createFaceCrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

void __49__HMDPersonManager_enumerateFaceCropsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "createPersonFaceCrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = v4;
  }

}

uint64_t __37__HMDPersonManager_personsWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "personWithUUID:", a2);
}

void __36__HMDPersonManager_performCloudPull__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform cloud pull: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __54__HMDPersonManager_localZone_didProcessModelDeletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mirrorOutputFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleDeletedModel:mirrorOutputFuture:", v4, v3);

}

void __52__HMDPersonManager_localZone_didProcessModelUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mirrorOutputFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleCreatedOrUpdatedModel:mirrorOutputFuture:", v4, v3);

}

void __54__HMDPersonManager_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mirrorOutputFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleCreatedOrUpdatedModel:mirrorOutputFuture:", v4, v3);

}

uint64_t __64__HMDPersonManager_handleDataSyncInProgressChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "isDataSyncInProgress");
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Data sync in progress changed to %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDataInterfacesOfCurrentIsDataSyncInProgress");
}

void __57__HMDPersonManager_handleResidentWasRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (objc_msgSend(v5, "isCurrentDevice"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device was removed as a resident", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 40), "_notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident");
  }

}

void __57__HMDPersonManager_handleResidentWasUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (objc_msgSend(v5, "isCurrentDevice"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device updated its resident device state", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 40), "_notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident");
  }

}

void __55__HMDPersonManager_handleResidentWasAddedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (objc_msgSend(v5, "isCurrentDevice"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device was added as a resident", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (id)objc_msgSend(*(id *)(a1 + 40), "performCloudPull");
    objc_msgSend(*(id *)(a1 + 40), "_notifyDataInterfacesOfCurrentIsCurrentDeviceAvailableResident");
  }

}

void __61__HMDPersonManager_handleUserPrivilegeDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateShareParticipants");

}

void __38__HMDPersonManager__removePersonZones__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove person manager zones: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __56__HMDPersonManager__cleanUpExpiredUnassociatedFaceCrops__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v7;
    v23 = 2112;
    v24 = (uint64_t)v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Removing expired unassociated face crop: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v3, "hmbModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v11 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v11 >= objc_msgSend(*(id *)(a1 + 32), "fetchBatchLimit"))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(*(id *)(a1 + 40), "count");
      v21 = 138543618;
      v22 = v15;
      v23 = 2048;
      v24 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removing %lu expired unassociated face crops", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(a1 + 32), "localZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Remove expired unassociated face crops"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v17, "removeModelIDs:options:", v18, v19);

    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  }

}

uint64_t __59__HMDPersonManager__removeFaceprintsForFaceCropsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

id __46__HMDPersonManager__faceCropsModelsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "fetchModelWithModelID:ofType:error:", v3, objc_opt_class(), &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (!v5)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find face crop with UUID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

id __58__HMDPersonManager__unassociatedFaceCropsModelsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "fetchModelWithModelID:ofType:error:", v3, objc_opt_class(), &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (!v5)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find unassociated face crop with UUID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

uint64_t __51__HMDPersonManager_faceCropUUIDsForPersonWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

uint64_t __45__HMDPersonManager_removeFaceCropsWithUUIDs___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

uint64_t __41__HMDPersonManager_addOrUpdateFaceCrops___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

HMDFaceCropModel *__41__HMDPersonManager_addOrUpdateFaceCrops___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  HMDFaceCropModel *v5;
  HMDFaceCropModel *v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  if (v4)
    v5 = -[HMDFaceCropModel initWithPersonFaceCrop:]([HMDFaceCropModel alloc], "initWithPersonFaceCrop:", v4);
  else
    v5 = -[HMDUnassociatedFaceCropModel initWithFaceCrop:]([HMDUnassociatedFaceCropModel alloc], "initWithFaceCrop:", v2);
  v6 = v5;

  return v6;
}

id __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_52;
    v21[3] = &unk_24E780D38;
    v5 = *(void **)(a1 + 40);
    v21[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "na_flatMap:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Remove face crops for person"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeModelIDs:options:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BE6B628];
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "schedulerWithDispatchQueue:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reschedule:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "flatMap:", &__block_literal_global_59_82657);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove face crops for persons because the local zone is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v18 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

uint64_t __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_52(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "faceCropUUIDsForPersonWithUUID:", a2);
}

uint64_t __65__HMDPersonManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

void __52__HMDPersonManager_addUnassociatedFaceCropWithData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Adding unassociated face crop with data: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = objc_alloc(MEMORY[0x24BDD7680]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v8, v9, v10, *MEMORY[0x24BDD5BE8], *(double *)(MEMORY[0x24BDD5BE8] + 8), *(double *)(MEMORY[0x24BDD5BE8] + 16), *(double *)(MEMORY[0x24BDD5BE8] + 24));

  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOrUpdateFaceCrops:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__HMDPersonManager_addUnassociatedFaceCropWithData___block_invoke_50;
  v19[3] = &unk_24E793078;
  v20 = v11;
  v15 = v11;
  objc_msgSend(v14, "flatMap:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "completionHandlerAdapter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v16, "addCompletionBlock:", v17);

}

uint64_t __52__HMDPersonManager_addUnassociatedFaceCropWithData___block_invoke_50(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

void __74__HMDPersonManager_handleFaceMisclassificationForFaceCropData_personUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling face misclassification for face crop data: %@ personUUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "dataInterfaces", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "handleFaceMisclassificationForFaceCropData:personUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

void __47__HMDPersonManager_faceCropsForPersonWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "createPersonFaceCrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __63__HMDPersonManager_personFaceCropWithUnassociatedFaceCropUUID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "createPersonFaceCrop");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

uint64_t __71__HMDPersonManager_removeAllAssociatedDataDueToHomeGraphObjectRemoval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePersonZones");
}

id __86__HMDPersonManager_initWithUUID_zoneManager_coreDataManager_dataInterfaces_workQueue___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)zoneNameForZoneUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t64 != -1)
    dispatch_once(&logCategory__hmf_once_t64, &__block_literal_global_142);
  return (id)logCategory__hmf_once_v65;
}

void __31__HMDPersonManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v65;
  logCategory__hmf_once_v65 = v0;

}

@end
