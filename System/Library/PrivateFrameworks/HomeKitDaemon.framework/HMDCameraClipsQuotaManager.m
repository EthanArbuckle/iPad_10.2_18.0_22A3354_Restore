@implementation HMDCameraClipsQuotaManager

- (HMDCameraClipsQuotaManager)init
{
  void *v3;
  HMDCameraClipsQuotaManager *v4;

  +[HMDDatabase cameraClipsDatabase](HMDDatabase, "cameraClipsDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDCameraClipsQuotaManager initWithDatabase:](self, "initWithDatabase:", v3);

  return v4;
}

- (HMDCameraClipsQuotaManager)initWithDatabase:(id)a3
{
  id v5;
  HMDCameraClipsQuotaManager *v6;
  HMDCameraClipsQuotaManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraClipsQuotaManager;
  v6 = -[HMDCameraClipsQuotaManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    objc_msgSend(v5, "addDelegate:", v7);
  }

  return v7;
}

- (void)synchronize
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[HMDCameraClipsQuotaManager database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performInitialCloudSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__HMDCameraClipsQuotaManager_synchronize__block_invoke;
  v7[3] = &unk_24E798920;
  v7[4] = self;
  v6 = (id)objc_msgSend(v5, "addCompletionBlock:", v7);

}

- (id)fetchNamesForZonesWithEnabledCloudStorage
{
  HMDCameraClipsQuotaGetActiveCamerasMessage *v3;
  void *v4;
  HMDCameraClipsQuotaManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  HMDCameraClipsQuotaGetActiveCamerasMessage *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(HMDCameraClipsQuotaGetActiveCamerasMessage);
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending get active cameras message %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraClipsQuotaManager _addCodeOperationWithFunctionName:request:responseClass:](v5, "_addCodeOperationWithFunctionName:request:responseClass:", CFSTR("getActiveCameras"), v3, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__HMDCameraClipsQuotaManager_fetchNamesForZonesWithEnabledCloudStorage__block_invoke;
  v11[3] = &unk_24E77DE20;
  v11[4] = v5;
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)enableCloudStorageForZoneWithName:(id)a3
{
  id v4;
  HMDCameraClipsQuotaEnableCameraMessage *v5;
  void *v6;
  HMDCameraClipsQuotaManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  HMDCameraClipsQuotaEnableCameraMessage *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(HMDCameraClipsQuotaEnableCameraMessage);
  v6 = (void *)MEMORY[0x227676638](-[HMDCameraClipsQuotaEnableCameraMessage setZoneName:](v5, "setZoneName:", v4));
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v9;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending enable camera message %@ for zone with name %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipsQuotaManager _addCodeOperationWithFunctionName:request:responseClass:](v7, "_addCodeOperationWithFunctionName:request:responseClass:", CFSTR("enableCamera"), v5, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__HMDCameraClipsQuotaManager_enableCloudStorageForZoneWithName___block_invoke;
  v13[3] = &unk_24E77DE20;
  v13[4] = v7;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)disableCloudStorageForZoneWithName:(id)a3
{
  id v4;
  HMDCameraClipsQuotaDisableCameraMessage *v5;
  void *v6;
  HMDCameraClipsQuotaManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  HMDCameraClipsQuotaDisableCameraMessage *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(HMDCameraClipsQuotaDisableCameraMessage);
  v6 = (void *)MEMORY[0x227676638](-[HMDCameraClipsQuotaDisableCameraMessage setZoneName:](v5, "setZoneName:", v4));
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending disable camera message %@ for zone with name %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipsQuotaManager _addCodeOperationWithFunctionName:request:responseClass:](v7, "_addCodeOperationWithFunctionName:request:responseClass:", CFSTR("disableCamera"), v5, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65__HMDCameraClipsQuotaManager_disableCloudStorageForZoneWithName___block_invoke;
  v16[3] = &unk_24E77DE20;
  v16[4] = v7;
  objc_msgSend(v10, "flatMap:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __65__HMDCameraClipsQuotaManager_disableCloudStorageForZoneWithName___block_invoke_23;
  v15[3] = &unk_24E7927B0;
  v15[4] = v7;
  objc_msgSend(v12, "recover:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_addCodeOperationWithFunctionName:(id)a3 request:(id)a4 responseClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v8 = a4;
  v9 = a3;
  -[HMDCameraClipsQuotaManager database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performCodeOperationWithServiceName:functionName:request:responseClass:", CFSTR("HomeQuota"), v9, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86__HMDCameraClipsQuotaManager__addCodeOperationWithFunctionName_request_responseClass___block_invoke;
  v15[3] = &unk_24E7927B0;
  v15[4] = self;
  objc_msgSend(v12, "recover:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)database:(id)a3 willRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  HMDCameraClipsQuotaManager *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("camera-clips-")) && a5)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Disabling cloud storage before removing zone with name %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCameraClipsQuotaManager disableCloudStorageForZoneWithName:](v11, "disableCloudStorageForZoneWithName:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDCameraClipsQuotaManager database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

id __86__HMDCameraClipsQuotaManager__addCodeOperationWithFunctionName_request_responseClass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "_quotaErrorFromServerError:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __65__HMDCameraClipsQuotaManager_disableCloudStorageForZoneWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully disabled camera with response: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __65__HMDCameraClipsQuotaManager_disableCloudStorageForZoneWithName___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("HMDCameraClipsQuotaErrorDomain")))
  {

    goto LABEL_7;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != 2)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v3);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Assuming success for disable camera request because zone does not exist", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v11 = (void *)v10;

  return v11;
}

id __64__HMDCameraClipsQuotaManager_enableCloudStorageForZoneWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully enabled camera with response: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __71__HMDCameraClipsQuotaManager_fetchNamesForZonesWithEnabledCloudStorage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "zoneNames");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x24BDBD1A8];
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v13;
      v25 = 2112;
      v26 = (uint64_t)v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully got active cameras with zone names: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithResult:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v20;
      v25 = 2112;
      v26 = objc_opt_class();
      v27 = 2112;
      v28 = v3;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Received get active cameras response of unexpected type %@: %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v21 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithError:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __41__HMDCameraClipsQuotaManager_synchronize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Finished initial cloud sync for camera clips quota manager cloud database", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v7);

}

+ (HMDCameraClipsQuotaManager)defaultManager
{
  HMDCameraClipsQuotaManager *WeakRetained;
  HMDCameraClipsQuotaManager *v3;

  os_unfair_lock_lock_with_options();
  WeakRetained = (HMDCameraClipsQuotaManager *)objc_loadWeakRetained(&defaultManager_defaultManager);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(HMDCameraClipsQuotaManager);
    objc_storeWeak(&defaultManager_defaultManager, WeakRetained);
  }
  v3 = WeakRetained;

  os_unfair_lock_unlock((os_unfair_lock_t)&defaultManager_defaultManagerLock);
  return v3;
}

+ (id)_quotaServerErrorFromServerError:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD1398];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("HomeQuotaError")))
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

+ (id)_quotaErrorFromServerError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_quotaServerErrorFromServerError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Determining quota error based on underlying quota server error: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = objc_msgSend(v5, "code");
    if (v10 == 1003)
      v11 = 1;
    else
      v11 = 2 * (v10 == 1002);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDCameraClipsQuotaErrorDomain"), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_58559 != -1)
    dispatch_once(&logCategory__hmf_once_t15_58559, &__block_literal_global_58560);
  return (id)logCategory__hmf_once_v16_58561;
}

void __41__HMDCameraClipsQuotaManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16_58561;
  logCategory__hmf_once_v16_58561 = v0;

}

@end
