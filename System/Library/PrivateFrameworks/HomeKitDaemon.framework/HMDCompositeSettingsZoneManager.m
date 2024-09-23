@implementation HMDCompositeSettingsZoneManager

- (HMDCompositeSettingsZoneManager)initWithDatabase:(id)a3 workQueue:(id)a4 zoneName:(id)a5 createZoneIfNotExists:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDCompositeSettingsZoneManager *v15;
  HMDCompositeSettingsZoneManager *v16;
  void *v17;
  HMDCompositeSettingsZoneManager *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NAFuture *configurationFuture;
  HMDCompositeSettingsZoneManager *v25;
  SEL v26;
  _QWORD v27[4];
  HMDCompositeSettingsZoneManager *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v12)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_9:
    v25 = (HMDCompositeSettingsZoneManager *)_HMFPreconditionFailure();
    return (HMDCompositeSettingsZoneManager *)-[HMDCompositeSettingsZoneManager isConfigured](v25, v26);
  }
  v29.receiver = self;
  v29.super_class = (Class)HMDCompositeSettingsZoneManager;
  v15 = -[HMDCompositeSettingsZoneManager init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_zoneName, a5);
    v16->_createZoneIfNotExist = a6;
    -[HMDDatabase addDelegate:](v16->_database, "addDelegate:", v16);
    v17 = (void *)MEMORY[0x24BE6B608];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke;
    v27[3] = &unk_24E7943C8;
    v18 = v16;
    v28 = v18;
    v19 = (void *)MEMORY[0x24BE6B628];
    -[HMDCompositeSettingsZoneManager workQueue](v18, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "schedulerWithDispatchQueue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithBlock:scheduler:", v27, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    configurationFuture = v18->_configurationFuture;
    v18->_configurationFuture = (NAFuture *)v22;

  }
  return v16;
}

- (BOOL)isConfigured
{
  void *v2;
  BOOL v3;

  -[HMDCompositeSettingsZoneManager localZone](self, "localZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  HMDCompositeSettingsZoneManager *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@did create zone", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v9);

}

- (id)database:(id)a3 willRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  HMDCompositeSettingsZoneManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@will remove zone", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _QWORD block[5];

  v6 = a4;
  -[HMDCompositeSettingsZoneManager zoneName](self, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[HMDCompositeSettingsZoneManager workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__HMDCompositeSettingsZoneManager_database_didRemoveZoneWithName_isPrivate___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v9, block);

  }
}

- (void)database:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCompositeSettingsZoneManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@did receive message with  user info %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)remove
{
  NSObject *v3;
  void *v4;
  HMDCompositeSettingsZoneManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDCompositeSettingsZoneManager workQueue](self, "workQueue");
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
    v13 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing Zone", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_initWeak((id *)buf, v5);
  -[HMDCompositeSettingsZoneManager configurationFuture](v5, "configurationFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__HMDCompositeSettingsZoneManager_remove__block_invoke;
  v10[3] = &unk_24E794410;
  objc_copyWeak(&v11, (id *)buf);
  v9 = (id)objc_msgSend(v8, "addSuccessBlock:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)createZoneIfNotExist
{
  return self->_createZoneIfNotExist;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCloudZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NAFuture)configurationFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationFuture, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __41__HMDCompositeSettingsZoneManager_remove__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(WeakRetained, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeLocalAndCloudDataForLocalZone:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __41__HMDCompositeSettingsZoneManager_remove__block_invoke_15;
    v13[3] = &unk_24E798920;
    v13[4] = WeakRetained;
    v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v13);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil zone during cleanup", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void __41__HMDCompositeSettingsZoneManager_remove__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v6;
      v12 = "%{public}@Zone removal returned result:%@ error:%@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, buf, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v5;
    v12 = "%{public}@Removed zone with result:%@";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HMDCompositeSettingsZoneManager_remove__block_invoke_16;
  block[3] = &unk_24E79C240;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v16, block);

}

uint64_t __41__HMDCompositeSettingsZoneManager_remove__block_invoke_16(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCloudZone:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setLocalZone:", 0);
}

uint64_t __76__HMDCompositeSettingsZoneManager_database_didRemoveZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Zone removed", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setCloudZone:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setLocalZone:", 0);
}

void __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[5];
  id v55;
  _BYTE buf[24];
  void *v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    v6 = objc_alloc_init(MEMORY[0x24BE4ECF0]);
    v7 = objc_msgSend(v4, "createZoneIfNotExist");
    v8 = (void *)MEMORY[0x227676638]();
    v9 = v4;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "zoneName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "createZoneIfNotExist");
        HMFBooleanToString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        v57 = v14;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Finding Zone:%@ createIfNotExists:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v9, "database");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      objc_msgSend(v15, "privateZonesWithName:configuration:delegate:error:", v16, v6, 0, &v55);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "zoneName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "createZoneIfNotExist");
        HMFBooleanToString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        v57 = v20;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Finding Zone:%@ createIfNotExists:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v9, "database");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      objc_msgSend(v15, "existingPrivateZonesWithName:configuration:delegate:error:", v16, v6, 0, &v55);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v17;
    v22 = v55;

    if (v21)
    {
      objc_msgSend(v21, "cloudZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCloudZone:", v23);

      objc_msgSend(v9, "cloudZone");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (id)objc_msgSend(v24, "registerSubscriptionForExternalRecordType:", 0);

      objc_msgSend(v21, "localZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLocalZone:", v26);

      objc_msgSend(v9, "localZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "startUp");

      objc_msgSend(v9, "cloudZone");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "startUp");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v3;
      v30 = (void *)MEMORY[0x24BE6B628];
      objc_msgSend(v9, "workQueue");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "schedulerWithDispatchQueue:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "reschedule:", v32);
      v48 = v22;
      v33 = v21;
      v34 = v6;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = MEMORY[0x24BDAC760];
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __45__HMDCompositeSettingsZoneManager__configure__block_invoke;
      v57 = &unk_24E79BD80;
      v58 = v9;
      objc_msgSend(v35, "addFailureBlock:", buf);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v36;
      v54[1] = 3221225472;
      v54[2] = __45__HMDCompositeSettingsZoneManager__configure__block_invoke_11;
      v54[3] = &unk_24E79BCF0;
      v54[4] = v9;
      objc_msgSend(v37, "addSuccessBlock:", v54);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v34;
      v21 = v33;
      v22 = v48;

      v3 = v49;
    }
    else
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = v9;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to open zone: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      v42 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "futureWithError:", v28);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  v43 = MEMORY[0x24BDAC760];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke_2;
  v52[3] = &unk_24E79BCF0;
  v44 = v3;
  v53 = v44;
  objc_msgSend(v4, "addSuccessBlock:", v52);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v43;
  v50[1] = 3221225472;
  v50[2] = __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke_3;
  v50[3] = &unk_24E79BD80;
  v51 = v44;
  v46 = v44;
  v47 = (id)objc_msgSend(v45, "addFailureBlock:", v50);

}

uint64_t __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

uint64_t __93__HMDCompositeSettingsZoneManager_initWithDatabase_workQueue_zoneName_createZoneIfNotExists___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __45__HMDCompositeSettingsZoneManager__configure__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@CloudZone Error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __45__HMDCompositeSettingsZoneManager__configure__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@CloudZone startup success", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_219330 != -1)
    dispatch_once(&logCategory__hmf_once_t5_219330, &__block_literal_global_219331);
  return (id)logCategory__hmf_once_v6_219332;
}

void __46__HMDCompositeSettingsZoneManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_219332;
  logCategory__hmf_once_v6_219332 = v0;

}

@end
