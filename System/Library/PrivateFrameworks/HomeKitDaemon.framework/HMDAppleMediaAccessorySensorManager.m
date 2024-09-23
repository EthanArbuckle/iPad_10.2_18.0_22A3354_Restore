@implementation HMDAppleMediaAccessorySensorManager

- (HMDAppleMediaAccessorySensorManager)initWithWorkQueue:(id)a3
{
  id v5;
  HMDAppleMediaAccessorySensorManager *v6;
  HMDAppleMediaAccessorySensorManager *v7;
  uint64_t v8;
  NSMutableArray *renamedServiceIDs;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAppleMediaAccessorySensorManager;
  v6 = -[HMDAppleMediaAccessorySensorManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_workQueue, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    renamedServiceIDs = v7->_renamedServiceIDs;
    v7->_renamedServiceIDs = (NSMutableArray *)v8;

    v7->_isCurrentlyPairing = 0;
    v7->_pairingRetryCount = 0;
    *(_WORD *)&v7->_hasPendingRetry = 0;
  }

  return v7;
}

- (void)configureWithDataSource:(id)a3 hpsXPCClient:(id)a4 dataStore:(id)a5
{
  id v8;
  id v9;
  SEL v10;
  SEL v11;
  SEL v12;
  NSObject *Property;
  id v14;
  _QWORD v15[5];
  id v16;

  v8 = a5;
  if (self)
  {
    v9 = a4;
    objc_storeWeak((id *)&self->_dataSource, a3);
    objc_setProperty_atomic(self, v10, v9, 64);

    objc_setProperty_atomic(self, v11, v8, 88);
    Property = objc_getProperty(self, v12, 96, 1);
  }
  else
  {
    Property = 0;
  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke;
  v15[3] = &unk_24E79C268;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  dispatch_async(Property, v15);

}

- (void)_migrateToDataStoreIfNeeded:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDAppleMediaAccessorySensorManagerLocalDataStore *v8;
  HMDAppleMediaAccessorySensorManagerLocalDataStore *v9;
  void *v10;
  HMDAppleMediaAccessorySensorManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  HMDAppleMediaAccessorySensorManagerLocalDataStore *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc_init(HMDAppleMediaAccessorySensorManagerLocalDataStore);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __78__HMDAppleMediaAccessorySensorManager__migrateToDataStoreIfNeeded_completion___block_invoke;
    v14[3] = &unk_24E77B178;
    v14[4] = self;
    v15 = v6;
    v16 = v8;
    v17 = v7;
    v9 = v8;
    -[HMDAppleMediaAccessorySensorManagerLocalDataStore fetchSensorUUIDWithCompletion:](v9, "fetchSensorUUIDWithCompletion:", v14);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot migrate HomePod sensor identifier with nil data source", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (NSUUID)sensorAccessoryUUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_sensorAccessoryUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
    self = (HMDAppleMediaAccessorySensorManager *)objc_getProperty(self, a2, 96, 1);
  return (OS_dispatch_queue *)self;
}

- (NSUUID)messageTargetUUID
{
  id WeakRetained;
  void *v4;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "hostUUIDForAppleMediaAccessorySensorManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v4;
}

- (void)handleErrorCaseTestMessage:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  void *WeakRetained;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  _BOOL4 shouldUseDerivedSensorUUID;
  void *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  _QWORD block[4];
  NSObject *v33;
  HMDAppleMediaAccessorySensorManager *v34;
  id v35;
  BOOL v36;
  BOOL v37;
  _QWORD v38[5];
  NSObject *v39;
  id v40;
  BOOL v41;
  BOOL v42;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 96, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  if ((isInternalBuild() & 1) != 0)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    else
      WeakRetained = 0;
    -[HMDAppleMediaAccessorySensorManager sensorAccessoryUUID](self, "sensorAccessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "accessoryWithUUID:forAppleMediaAccessorySensorManager:", v8, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_7;
    if (!self)
      goto LABEL_15;
    os_unfair_lock_lock_with_options();
    shouldUseDerivedSensorUUID = self->_shouldUseDerivedSensorUUID;
    os_unfair_lock_unlock(&self->_lock);
    if (!shouldUseDerivedSensorUUID)
      goto LABEL_15;
    -[HMDAppleMediaAccessorySensorManager derivedSensorUUID](self, "derivedSensorUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "accessoryWithUUID:forAppleMediaAccessorySensorManager:", v25, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_7:
      objc_msgSend(v5, "messagePayload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD5298]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "messagePayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD52A0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;

      objc_msgSend(v5, "messagePayload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDD5288]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 != 0;

      v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      v21 = MEMORY[0x24BDAC760];
      if (v12)
      {
        if (self)
          v22 = objc_getProperty(self, v20, 64, 1);
        else
          v22 = 0;
        v38[0] = v21;
        v38[1] = 3221225472;
        v38[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke;
        v38[3] = &unk_24E77B1A0;
        v38[4] = self;
        v41 = v18;
        v39 = v19;
        v40 = v9;
        v42 = v15;
        objc_msgSend(v22, "resetWithCompletion:", v38);

        v23 = v39;
      }
      else
      {
        if (self)
          v27 = objc_getProperty(self, v20, 96, 1);
        else
          v27 = 0;
        block[0] = v21;
        block[1] = 3221225472;
        block[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_5;
        block[3] = &unk_24E790140;
        v36 = v18;
        v33 = v19;
        v34 = self;
        v35 = v9;
        v37 = v15;
        dispatch_async(v27, block);

        v23 = v33;
      }

      if (self)
        v29 = objc_getProperty(self, v28, 96, 1);
      else
        v29 = 0;
      v30[0] = v21;
      v30[1] = 3221225472;
      v30[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_8;
      v30[3] = &unk_24E79C268;
      v30[4] = self;
      v31 = v5;
      dispatch_group_notify(v19, v29, v30);

    }
    else
    {
LABEL_15:
      -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](self, v10);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "respondWithError:", v26);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "respondWithError:", WeakRetained);
  }

}

- (void)localAccessoryAddRequiresConsent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  _BOOL4 shouldUseDerivedSensorUUID;
  uint64_t v8;
  void *v9;
  void *v10;
  HMDAppleMediaAccessorySensorManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDAppleMediaAccessorySensorManager *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  HMDAppleMediaAccessorySensorManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  SEL v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      if ((objc_msgSend(WeakRetained, "isReadyForSensorPairing:", self) & 1) != 0)
      {
        os_unfair_lock_lock_with_options();
        shouldUseDerivedSensorUUID = self->_shouldUseDerivedSensorUUID;
        os_unfair_lock_unlock(&self->_lock);
        if (!shouldUseDerivedSensorUUID)
        {
          -[HMDAppleMediaAccessorySensorManager sensorAccessoryUUID](self, "sensorAccessoryUUID");
          if (objc_claimAutoreleasedReturnValue())
            __assert_rtn("-[HMDAppleMediaAccessorySensorManager localAccessoryAddRequiresConsent:]", "HMDAppleMediaAccessorySensorManager.m", 1254, "!self.sensorAccessoryUUID");
          goto LABEL_16;
        }
        -[HMDAppleMediaAccessorySensorManager derivedSensorUUID](self, "derivedSensorUUID");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;
          if ((objc_msgSend(v4, "hmf_isEqualToUUID:", v8) & 1) == 0)
            __assert_rtn("-[HMDAppleMediaAccessorySensorManager localAccessoryAddRequiresConsent:]", "HMDAppleMediaAccessorySensorManager.m", 1250, "[accessoryUUID hmf_isEqualToUUID:derivedSensorUUID]");

LABEL_16:
          v19 = (void *)MEMORY[0x227676638]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138543618;
            v26 = v22;
            v27 = 2112;
            v28 = v4;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Confirming HomePod sensor with UUID %@ is allowed to be added locally", (uint8_t *)&v25, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
          -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v20, v4);
          objc_msgSend(v6, "accessoryBrowserForAppleMediaAccessorySensorManager:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "didReceiveUserConsentResponseForSetupAccessoryDetail:consent:", objc_getProperty(v20, v24, 80, 1), 1);

          goto LABEL_19;
        }
        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v17;
          v27 = 2112;
          v28 = v4;
          v18 = "%{public}@Cannot confirm that HomePod sensor with UUID %@ is allowed to be added locally due to missing "
                "derived sensor UUID";
          goto LABEL_13;
        }
      }
      else
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v17;
          v27 = 2112;
          v28 = v4;
          v18 = "%{public}@Not consenting to accessory local add for %@ as data source is no longer ready for pairing";
LABEL_13:
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v25, 0x16u);

        }
      }

      objc_autoreleasePoolPop(v14);
LABEL_19:

      goto LABEL_20;
    }
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v13;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not consenting to accessory local add for %@ with nil data source", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
LABEL_20:

}

- (void)handleAccessoryAdded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HMDNotificationAddedAccessoryKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v16 = v6;

  if (v16)
  {
    -[HMDAppleMediaAccessorySensorManager sensorAccessoryUUID](self, "sensorAccessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (self)
        WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      else
        WeakRetained = 0;
      objc_msgSend(WeakRetained, "hostUUIDForAppleMediaAccessorySensorManager:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessorySensorManager sensorAccessoryUUID](self, "sensorAccessoryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "hmf_isEqualToUUID:", v11))
      {

      }
      else
      {
        if (!v9)
        {

          goto LABEL_14;
        }
        objc_msgSend(v16, "hostAccessory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v9, "hmf_isEqualToUUID:", v14);

        if (!v15)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](self, v12);
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4;
  _BOOL4 shouldAttemptToSetServiceNames;
  const char *v6;
  NSObject *Property;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  shouldAttemptToSetServiceNames = self->_shouldAttemptToSetServiceNames;
  os_unfair_lock_unlock(&self->_lock);
  if (shouldAttemptToSetServiceNames)
  {
    Property = objc_getProperty(self, v6, 96, 1);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __80__HMDAppleMediaAccessorySensorManager_handleCharacteristicsChangedNotification___block_invoke;
    v8[3] = &unk_24E79C268;
    v8[4] = self;
    v9 = v4;
    dispatch_async(Property, v8);

  }
}

- (void)fetchADKSensorStatusCompletion:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 64, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__HMDAppleMediaAccessorySensorManager_fetchADKSensorStatusCompletion___block_invoke;
  v8[3] = &unk_24E77B268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(Property, "getCurrentStatusWithCompletion:", v8);

}

- (id)derivedSensorUUIDForHostUUID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1880];
  v9 = CFSTR("HMDAppleMediaAccessorySensorManager");
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)derivedSensorUUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *derivedSensorUUID;
  id WeakRetained;
  void *v6;
  NSUUID *v7;
  NSUUID *v8;
  NSUUID *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  derivedSensorUUID = self->_derivedSensorUUID;
  if (!derivedSensorUUID)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "hostUUIDForAppleMediaAccessorySensorManager:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v9 = 0;
      goto LABEL_5;
    }
    -[HMDAppleMediaAccessorySensorManager derivedSensorUUIDForHostUUID:](self, "derivedSensorUUIDForHostUUID:", v6);
    v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v8 = self->_derivedSensorUUID;
    self->_derivedSensorUUID = v7;

    derivedSensorUUID = self->_derivedSensorUUID;
  }
  v9 = derivedSensorUUID;
LABEL_5:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)derivedHAPAccessoryIdentifierDataForHostUUID:(id)a3
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v4[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v4);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v4, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)derivedHAPAccessoryIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *derivedHAPAccessoryIdentifier;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  derivedHAPAccessoryIdentifier = self->_derivedHAPAccessoryIdentifier;
  if (derivedHAPAccessoryIdentifier)
  {
    v5 = derivedHAPAccessoryIdentifier;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    -[HMDAppleMediaAccessorySensorManager derivedHAPAccessoryIdentifierData]((os_unfair_lock_s *)self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      os_unfair_lock_lock_with_options();
      v7 = self->_derivedHAPAccessoryIdentifier;
      if (!v7)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BAD8]), "initWithDeviceIDData:", v6);
        objc_msgSend(v8, "deviceIDString");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        v10 = self->_derivedHAPAccessoryIdentifier;
        self->_derivedHAPAccessoryIdentifier = v9;

        v7 = self->_derivedHAPAccessoryIdentifier;
      }
      v5 = v7;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)managerIsReadyToBePaired
{
  void *v3;
  HMDAppleMediaAccessorySensorManager *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@HPSManagerDelegate: manager is ready to be paired", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](v4, v7);
}

- (id)logIdentifier
{
  id WeakRetained;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "hostUUIDForAppleMediaAccessorySensorManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E79DB48;
  v7 = v5;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_renamedServiceIDs, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_setupDescription, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sensorClient, 0);
  objc_storeStrong((id *)&self->_sensorAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_derivedHAPAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_derivedHAPAccessoryIdentifierData, 0);
  objc_storeStrong((id *)&self->_derivedSensorUUID, 0);
}

- (void)cleanUpExistingAccessoriesAndStartADKIfReady
{
  NSObject *Property;
  _QWORD block[5];

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 96, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__HMDAppleMediaAccessorySensorManager_cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = a1;
    dispatch_async(Property, block);
  }
}

void __83__HMDAppleMediaAccessorySensorManager_cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2;
  NSObject *Property;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  SEL v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id location;
  __int128 buf;
  void (*v35)(uint64_t, char);
  void *v36;
  id v37[2];
  __int128 v38;
  uint64_t (*v39)(uint64_t, void *);
  void *v40;
  uint64_t v41;
  __int128 v42;
  uint64_t (*v43)(uint64_t, void *);
  void *v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 72));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      if ((objc_msgSend(WeakRetained, "isResidentConfirmedForAppleMediaAccessorySensorManager:", v2) & 1) != 0)
      {
        if ((objc_msgSend(v5, "isReadyForSensorPairing:", v2) & 1) != 0)
        {
          objc_msgSend(v5, "hostUUIDForAppleMediaAccessorySensorManager:", v2);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accessoriesWithHostUUID:forAppleMediaAccessorySensorManager:", v6, v2);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = MEMORY[0x24BDAC760];
          *(_QWORD *)&v42 = MEMORY[0x24BDAC760];
          *((_QWORD *)&v42 + 1) = 3221225472;
          v43 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke;
          v44 = &unk_24E790530;
          v45 = v2;
          objc_msgSend(v7, "na_filter:", &v42);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "count"))
          {
            objc_msgSend((id)v2, "sensorAccessoryUUID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v10)
            {
              v29 = (void *)MEMORY[0x227676638]();
              v30 = (id)v2;
              HMFGetOSLogHandle();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v38) = 138543362;
                *(_QWORD *)((char *)&v38 + 4) = v32;
                _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Removing unexpected sensor accessories as no sensor should be paired", (uint8_t *)&v38, 0xCu);

              }
              objc_autoreleasePoolPop(v29);
              -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v30, v9);
              goto LABEL_29;
            }
            *(_QWORD *)&v38 = v8;
            *((_QWORD *)&v38 + 1) = 3221225472;
            v39 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_24;
            v40 = &unk_24E790530;
            v41 = v2;
            objc_msgSend(v9, "na_filter:", &v38);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "count"))
            {
              v12 = (void *)MEMORY[0x227676638]();
              v13 = (id)v2;
              HMFGetOSLogHandle();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf) = 138543362;
                *(_QWORD *)((char *)&buf + 4) = v15;
                _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Removing unexpected sensor accessories", (uint8_t *)&buf, 0xCu);

              }
              objc_autoreleasePoolPop(v12);
              -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v13, v11, 0);
            }

          }
          os_unfair_lock_lock_with_options();
          v16 = *(unsigned __int8 *)(v2 + 40);
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
          if (v16)
          {
            v17 = (void *)MEMORY[0x227676638]();
            v18 = (id)v2;
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v20;
              _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not checking HomePod sensor pairing status", (uint8_t *)&buf, 0xCu);

            }
            objc_autoreleasePoolPop(v17);
          }
          else
          {
            objc_initWeak(&location, (id)v2);
            v28 = objc_getProperty((id)v2, v27, 64, 1);
            *(_QWORD *)&buf = v8;
            *((_QWORD *)&buf + 1) = 3221225472;
            v35 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_25;
            v36 = &unk_24E782920;
            objc_copyWeak(v37, &location);
            objc_msgSend(v28, "isReadyToPairWithCompletion:", &buf);

            objc_destroyWeak(v37);
            objc_destroyWeak(&location);
          }
LABEL_29:

          goto LABEL_30;
        }
        v21 = (void *)MEMORY[0x227676638]();
        v22 = (id)v2;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = 138543362;
          *(_QWORD *)((char *)&v42 + 4) = v26;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot pair/check sensors yet as data source is not ready for pairing", (uint8_t *)&v42, 0xCu);

        }
      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = (id)v2;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = 138543362;
          *(_QWORD *)((char *)&v42 + 4) = v25;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot pair/check sensors yet as no primary is confirmed", (uint8_t *)&v42, 0xCu);

        }
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = (id)v2;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v42) = 138543362;
        *(_QWORD *)((char *)&v42 + 4) = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot check and clean up existing HomePod sensor pairings with nil data source", (uint8_t *)&v42, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v21);
LABEL_30:

  }
}

uint64_t __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke(uint64_t a1, void *a2)
{
  return -[HMDAppleMediaAccessorySensorManager doesAccessoryMatchDerivedAccessory:](*(void **)(a1 + 32), a2) ^ 1;
}

- (void)_removeExistingSensorAccessoriesAndPair:(void *)a1
{
  id v3;
  SEL v4;
  NSObject *Property;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a2;
  Property = objc_getProperty(a1, v4, 96, 1);
  dispatch_assert_queue_V2(Property);
  objc_initWeak(&location, a1);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke;
  v6[3] = &unk_24E797318;
  objc_copyWeak(&v7, &location);
  -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](a1, v3, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

uint64_t __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_24(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sensorAccessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4) ^ 1;

  return v5;
}

- (void)_removeExistingSensorAccessories:(void *)a3 completion:
{
  const char *v5;
  NSObject *Property;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  SEL v19;
  NSObject *v20;
  id v21;
  id v22;
  id obj;
  NSObject *group;
  _QWORD block[5];
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id location;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v22 = a2;
  v21 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v5, 96, 1);
    dispatch_assert_queue_V2(Property);
    group = dispatch_group_create();
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v10;
      v39 = 2112;
      v40 = v22;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Removing HomePod sensor accessories %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_initWeak(&location, v8);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v22;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (-[HMDAppleMediaAccessorySensorManager doesAccessoryMatchDerivedAccessory:](v8, v14))
          {
            v15 = (void *)MEMORY[0x227676638]();
            v16 = v8;
            HMFGetOSLogHandle();
            v17 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v38 = v18;
              v39 = 2112;
              v40 = v14;
              _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Not removing derived HomePod sensor accessory %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v15);
          }
          else
          {
            dispatch_group_enter(group);
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke;
            v27[3] = &unk_24E796418;
            objc_copyWeak(&v30, &location);
            v28 = group;
            v29 = v14;
            objc_msgSend(v14, "sendRemovalRequestWithCompletion:", v27, v21);

            objc_destroyWeak(&v30);
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

    v20 = objc_getProperty(v8, v19, 96, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke_33;
    block[3] = &unk_24E79C2B8;
    block[4] = v8;
    v26 = v21;
    dispatch_group_notify(group, v20, block);

    objc_destroyWeak(&location);
  }

}

void __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_25(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    -[HMDAppleMediaAccessorySensorManager checkPairingStateAndStartADKIfUnpaired:](WeakRetained, (const char *)1);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = v4;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Not starting HomePod Sensor pairing as homepodsensed is not ready", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)checkPairingStateAndStartADKIfUnpaired:(void *)a1
{
  char v2;
  NSObject *Property;
  _QWORD v5[5];
  char v6;

  if (a1)
  {
    v2 = (char)a2;
    Property = objc_getProperty(a1, a2, 96, 1);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __78__HMDAppleMediaAccessorySensorManager_checkPairingStateAndStartADKIfUnpaired___block_invoke;
    v5[3] = &unk_24E7968C8;
    v5[4] = a1;
    v6 = v2;
    dispatch_async(Property, v5);
  }
}

void __78__HMDAppleMediaAccessorySensorManager_checkPairingStateAndStartADKIfUnpaired___block_invoke(uint64_t a1, const char *a2)
{
  void *v2;
  char v3;
  NSObject *Property;
  SEL v5;
  id v6;
  _QWORD v7[4];
  id v8;
  char v9;
  id location;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_BYTE *)(a1 + 40);
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    objc_initWeak(&location, v2);
    v6 = objc_getProperty(v2, v5, 64, 1);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __79__HMDAppleMediaAccessorySensorManager__checkPairingStateAndStartADKIfUnpaired___block_invoke;
    v7[3] = &unk_24E77B1C8;
    objc_copyWeak(&v8, &location);
    v9 = v3;
    objc_msgSend(v6, "isPairedWithCompletion:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __79__HMDAppleMediaAccessorySensorManager__checkPairingStateAndStartADKIfUnpaired___block_invoke(uint64_t a1, int a2, char a3)
{
  id WeakRetained;
  const char *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *Property;
  __int128 v14;
  void (*v15)(uint64_t, const char *);
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (!a2 || !WeakRetained)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v8;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 138543362;
      *(_QWORD *)((char *)&v14 + 4) = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to check sensor pairing due to xpc client error", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  if (a2 && (a3 & 1) != 0 || !*(_BYTE *)(a1 + 40))
  {
    if (a2 && v8)
    {
      Property = objc_getProperty(v8, v7, 96, 1);
      *(_QWORD *)&v14 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v14 + 1) = 3221225472;
      v15 = __71__HMDAppleMediaAccessorySensorManager_performPairingFromPairingStatus___block_invoke;
      v16 = &unk_24E7968C8;
      v17 = v8;
      v18 = a3;
      goto LABEL_14;
    }
  }
  else if (v8)
  {
    Property = objc_getProperty(v8, v7, 96, 1);
    *(_QWORD *)&v14 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v14 + 1) = 3221225472;
    v15 = __67__HMDAppleMediaAccessorySensorManager_startADKAndCheckPairingState__block_invoke;
    v16 = &unk_24E79C240;
    v17 = v8;
LABEL_14:
    dispatch_async(Property, &v14);
  }

}

void __71__HMDAppleMediaAccessorySensorManager_performPairingFromPairingStatus___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2;
  int v3;
  NSObject *Property;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  SEL v37;
  NSObject *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  SEL v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  const char *v57;
  NSObject *v58;
  id v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  id v82;
  id location;
  _BYTE buf[24];
  void *v85;
  id v86;
  id v87;
  id v88[2];
  uint64_t v89;
  uint64_t v90;
  void (*v91)(uint64_t, void *);
  void *v92;
  uint64_t v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return;
  v3 = *(unsigned __int8 *)(a1 + 40);
  Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
  dispatch_assert_queue_V2(Property);
  os_unfair_lock_lock_with_options();
  v5 = *(unsigned __int8 *)(v2 + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  if (!v5)
  {
    v10 = (id *)(v2 + 72);
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 72));
    if (!WeakRetained)
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = (id)v2;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor pairing with nil data source", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      goto LABEL_55;
    }
    objc_msgSend((id)v2, "sensorAccessoryUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend((id)v2, "sensorAccessoryUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "accessoryWithUUID:forAppleMediaAccessorySensorManager:", v13, v2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v31, 1);

        v32 = (void *)MEMORY[0x227676638]();
        v33 = (id)v2;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "sensorAccessoryUUID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v36;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is missing, expected accessory with UUID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        v38 = objc_getProperty(v33, v37, 96, 1);
        dispatch_assert_queue_V2(v38);
        v39 = objc_loadWeakRetained(v10);
        if (v39)
        {
          objc_msgSend(v33, "sensorAccessoryUUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "residentSyncClientDidSyncFutureForAppleMediaAccessorySensorManager:", v33);
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          if (v41)
          {
            v43 = (void *)MEMORY[0x24BE3F180];
            v89 = v41;
            objc_msgSend(v39, "firstCloudKitImportFutureForAppleMediaAccessorySensorManager:", v33);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = (uint64_t)v44;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 2);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "allSettled:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_initWeak(&location, v33);
            v47 = objc_alloc(MEMORY[0x24BE3F168]);
            v49 = objc_getProperty(v33, v48, 96, 1);
            v50 = (void *)objc_msgSend(v47, "initWithQueue:", v49);

            *(_QWORD *)buf = MEMORY[0x24BDAC760];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __57__HMDAppleMediaAccessorySensorManager__recoverLostSensor__block_invoke;
            v85 = &unk_24E77B1F0;
            objc_copyWeak(v88, &location);
            v86 = v40;
            v87 = v39;
            v51 = (id)objc_msgSend(v46, "inContext:then:", v50, buf);

            objc_destroyWeak(v88);
            objc_destroyWeak(&location);

          }
          else
          {
            v74 = (void *)MEMORY[0x227676638]();
            v75 = v33;
            HMFGetOSLogHandle();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v77;
              _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_ERROR, "%{public}@Resident sync future was nil", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v74);
          }

        }
        else
        {
          v69 = (void *)MEMORY[0x227676638]();
          v70 = v33;
          HMFGetOSLogHandle();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v72;
            _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor recovery with nil data source", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v69);
        }

        goto LABEL_55;
      }
      if (v3)
      {
LABEL_10:
        if (v14)
        {
          v16 = (void *)MEMORY[0x227676638]();
          v17 = (id)v2;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v14;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@HomePod sensor (%@) is already paired -- no action needed", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v16);

          goto LABEL_55;
        }
LABEL_31:
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v52, 2);

        v53 = (void *)MEMORY[0x227676638]();
        v54 = (id)v2;
        HMFGetOSLogHandle();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v56;
          _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is paired but not to any accessory in the home, resetting pairing", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v53);
        -[HMDAppleMediaAccessorySensorManager _resetSensorPairingAndPair](v54, v57);
        goto LABEL_55;
      }
    }
    else
    {
      os_unfair_lock_lock_with_options();
      v24 = *(unsigned __int8 *)(v2 + 42);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      if (!v24)
      {
        if (v3)
          goto LABEL_31;
LABEL_34:
        v58 = objc_getProperty((id)v2, v15, 96, 1);
        dispatch_assert_queue_V2(v58);
        v59 = objc_loadWeakRetained((id *)(v2 + 72));
        if (v59)
        {
          os_unfair_lock_lock_with_options();
          if (!*(_BYTE *)(v2 + 40))
          {
            *(_BYTE *)(v2 + 40) = 1;
            objc_msgSend(MEMORY[0x24BE4F198], "currentTime");
            *(_QWORD *)(v2 + 56) = v78;
            *(_BYTE *)(v2 + 44) = 1;
            objc_msgSend(*(id *)(v2 + 112), "removeAllObjects");
            os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
            objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = MEMORY[0x24BDAC760];
            *(_QWORD *)buf = MEMORY[0x24BDAC760];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke;
            v85 = &unk_24E79BCF0;
            v86 = (id)v2;
            v81 = (id)objc_msgSend(v79, "addSuccessBlock:", buf);
            v89 = v80;
            v90 = 3221225472;
            v91 = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_44;
            v92 = &unk_24E79BD80;
            v93 = v2;
            v82 = (id)objc_msgSend(v79, "addFailureBlock:", &v89);

            goto LABEL_54;
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
          v60 = (void *)MEMORY[0x227676638]();
          v61 = (id)v2;
          HMFGetOSLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v63;
            _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Not starting HomePod Sensor pairing as a pairing is already in progress", buf, 0xCu);

          }
        }
        else
        {
          v60 = (void *)MEMORY[0x227676638]();
          v61 = (id)v2;
          HMFGetOSLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v73;
            _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor pairing with nil data source", buf, 0xCu);

          }
        }

        objc_autoreleasePoolPop(v60);
LABEL_54:

LABEL_55:
        return;
      }
      objc_msgSend((id)v2, "derivedSensorUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "accessoryWithUUID:forAppleMediaAccessorySensorManager:", v25, v2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        goto LABEL_10;
    }
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v26, 3);

      os_unfair_lock_lock_with_options();
      LODWORD(v26) = *(unsigned __int8 *)(v2 + 42);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      if (!(_DWORD)v26
        || (-[HMDAppleMediaAccessorySensorManager doesAccessoryMatchDerivedAccessory:]((void *)v2, v14) & 1) == 0)
      {
        v64 = (void *)MEMORY[0x227676638]();
        v65 = (id)v2;
        HMFGetOSLogHandle();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v67;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is not paired but there is a paired accessory in the home, removing existing sensor: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v64);
        *(_QWORD *)buf = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v65, v68);

        goto LABEL_55;
      }
      v27 = (void *)MEMORY[0x227676638]();
      v28 = (id)v2;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is not paired but there is a paired derived accessory in the home. Running pairing again. %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);

    }
    goto LABEL_34;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = (id)v2;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not checking HomePod sensor pairing status", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
}

- (void)logPairingSuccess:(void *)a3 error:(uint64_t)a4 setupFailureReason:
{
  id *v7;
  id v8;
  id WeakRetained;
  HMDHomePodSensorPairingLogEvent *v10;
  double v11;
  HMDHomePodSensorPairingLogEvent *v12;
  id v13;

  if (a1)
  {
    v7 = (id *)(a1 + 72);
    v8 = a3;
    WeakRetained = objc_loadWeakRetained(v7);
    objc_msgSend(WeakRetained, "logSubmitterForAppleMediaAccessorySensorManager:", a1);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v10 = [HMDHomePodSensorPairingLogEvent alloc];
    os_unfair_lock_lock_with_options();
    v11 = *(double *)(a1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v12 = -[HMDHomePodSensorPairingLogEvent initWithStartTime:pairingSuccess:failureReason:](v10, "initWithStartTime:pairingSuccess:failureReason:", a2, a4, v11);
    objc_msgSend(v13, "submitLogEvent:error:", v12, v8);

  }
}

- (void)doesAccessoryMatchDerivedAccessory:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "derivedHAPAccessoryIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      objc_msgSend(v4, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "derivedSensorUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (void *)objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (void)_resetSensorPairingAndPair
{
  NSObject *Property;
  _QWORD v4[4];
  id v5;
  id location;

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    objc_initWeak(&location, a1);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __65__HMDAppleMediaAccessorySensorManager__resetSensorPairingAndPair__block_invoke;
    v4[3] = &unk_24E782920;
    objc_copyWeak(&v5, &location);
    -[HMDAppleMediaAccessorySensorManager _resetWithCompletion:]((uint64_t)a1, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __65__HMDAppleMediaAccessorySensorManager__resetSensorPairingAndPair__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    -[HMDAppleMediaAccessorySensorManager setShouldUseDerivedSensorUUID:]((uint64_t)WeakRetained, 1);
    v5 = (void *)MEMORY[0x227676638]();
    v6 = v4;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Reset HomePod sensor and ready to pair", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v4;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset HomePod sensor due to xpc client error", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_resetWithCompletion:(uint64_t)a1
{
  SEL v3;
  NSObject *Property;
  int v5;
  SEL v6;
  id v7;
  id v8;

  v8 = a2;
  Property = objc_getProperty((id)a1, v3, 96, 1);
  dispatch_assert_queue_V2(Property);
  os_unfair_lock_lock_with_options();
  v5 = *(unsigned __int8 *)(a1 + 42);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  v7 = objc_getProperty((id)a1, v6, 64, 1);
  if (v5)
    objc_msgSend(v7, "resetPairingsWithHandler:", v8);
  else
    objc_msgSend(v7, "resetWithCompletion:", v8);

}

- (void)setShouldUseDerivedSensorUUID:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 42) = a2;
    os_unfair_lock_unlock(v4);
  }
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  id Property;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HMFRandomDataWithLength();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod Sensor pairing", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v10, 64, 1);
  v12 = Property;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_37;
  v15[3] = &unk_24E77B218;
  objc_copyWeak(&v18, (id *)buf);
  v13 = v4;
  v16 = v13;
  v14 = v5;
  v17 = v14;
  objc_msgSend(v12, "setupPairing:uuid:completion:", v13, v14, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_44(uint64_t a1, void *a2)
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
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair HomePod sensor as zone fetch succeeded future failed", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v8, 0, v9, 11);

  -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:](*(_QWORD *)(a1 + 32));
}

- (void)setIsCurrentlyPairing:(uint64_t)a1
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 56) = 0;
    os_unfair_lock_unlock(v2);
  }
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_37(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  id v17;
  NSObject *Property;
  void *v19;
  _BYTE v20[24];
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = (void *)MEMORY[0x227676638]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("failed with xpc error");
    *(_DWORD *)v20 = 138543874;
    *(_QWORD *)&v20[4] = v10;
    *(_WORD *)&v20[12] = 2112;
    if (a2)
      v11 = CFSTR("completed");
    *(_QWORD *)&v20[14] = v11;
    *(_WORD *)&v20[22] = 2112;
    v21 = v5;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@HomePod Sensor pairing %@ - pairing URI: %@", v20, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v5 && (a2 & 1) != 0)
  {
    v12 = *(void **)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v14 = v5;
    v15 = v12;
    v17 = v13;
    if (v8)
    {
      Property = objc_getProperty(v8, v16, 96, 1);
      *(_QWORD *)v20 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v20[8] = 3221225472;
      *(_QWORD *)&v20[16] = __75__HMDAppleMediaAccessorySensorManager_pairWithURI_authToken_authTokenUUID___block_invoke;
      v21 = &unk_24E79A910;
      v22 = v8;
      v23 = v14;
      v24 = v15;
      v25 = v17;
      dispatch_async(Property, v20);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1, *(_QWORD *)v20, *(_QWORD *)&v20[8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v8, 0, v19, 4);

    -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:]((uint64_t)v8);
  }

}

void __75__HMDAppleMediaAccessorySensorManager_pairWithURI_authToken_authTokenUUID___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  id v6;
  NSObject *Property;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  SEL v25;
  SEL v26;
  uint64_t v27;
  void *v28;
  id *v29;
  NSObject *v30;
  void *v31;
  SEL v32;
  id v33;
  void *v34;
  SEL v35;
  id v36;
  void *v37;
  id *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  id location;
  _BYTE buf[24];
  void *v45;
  id v46[2];

  v46[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v42 = v2;
  v6 = v3;
  if (v1)
  {
    Property = objc_getProperty(v1, v5, 96, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained(v1 + 9);
    if (!WeakRetained)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = v1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor pairing with nil data source", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v13, 0, v16, 6);

      os_unfair_lock_lock_with_options();
      *((_BYTE *)v13 + 40) = 0;
      v13[7] = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)v13 + 2);
      goto LABEL_23;
    }
    v9 = v4;
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (objc_msgSend(MEMORY[0x24BDD7450], "isHAPSetupPayloadURL:", v10))
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD79A0]), "initWithHAPSetupPayloadURL:error:", v10, 0);
LABEL_15:

        if (v11)
        {
          v22 = objc_alloc(MEMORY[0x24BDD7998]);
          objc_msgSend(WeakRetained, "homeUUIDForAppleMediaAccessorySensorManager:", v1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v22, "initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:", v11, 0, v23, 0);
          objc_setProperty_atomic(v1, v25, v24, 80);

          v27 = objc_msgSend(objc_getProperty(v1, v26, 80, 1), "updateWithAuthToken:uuid:", v42, v6);
          v28 = (void *)MEMORY[0x227676638](v27);
          v29 = v1;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_getProperty(v29, v32, 80, 1);
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v33;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod sensor pairing with accessory description: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v28);
          objc_msgSend(WeakRetained, "accessoryBrowserForAppleMediaAccessorySensorManager:", v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "startDiscoveringAccessoriesWithLinkType:", 1);
          objc_initWeak(&location, v29);
          v36 = objc_getProperty(v29, v35, 80, 1);
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __76__HMDAppleMediaAccessorySensorManager__pairWithURI_authToken_authTokenUUID___block_invoke;
          v45 = &unk_24E799B48;
          objc_copyWeak(v46, &location);
          objc_msgSend(WeakRetained, "performLocalAddAccessoryWithDescription:progressHandlerDelegate:completion:", v36, v29, buf);

          objc_destroyWeak(v46);
          objc_destroyWeak(&location);

        }
        else
        {
          v37 = (void *)MEMORY[0x227676638]();
          v38 = v1;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v40;
            _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor pairing with nil accessory payload", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v37);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v38, 0, v41, 5);

          os_unfair_lock_lock_with_options();
          *((_BYTE *)v38 + 40) = 0;
          v38[7] = 0;
          os_unfair_lock_unlock((os_unfair_lock_t)v38 + 2);
        }

LABEL_23:
        goto LABEL_24;
      }
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not create setup payload from invalid HAP setup payload url string: %@", buf, 0x16u);

      }
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil setup payload for url string: %@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v17);
    v11 = 0;
    goto LABEL_15;
  }
LABEL_24:

}

void __76__HMDAppleMediaAccessorySensorManager__pairWithURI_authToken_authTokenUUID___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  const char *v4;
  id v5;
  NSObject *Property;
  id self;
  _QWORD block[5];
  id v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  self = objc_loadWeakRetained(v2);
  v5 = v3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 96, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__HMDAppleMediaAccessorySensorManager_handleLocalAddCompletedWithError___block_invoke;
    block[3] = &unk_24E79C268;
    block[4] = self;
    v9 = v5;
    dispatch_async(Property, block);

  }
}

void __72__HMDAppleMediaAccessorySensorManager_handleLocalAddCompletedWithError___block_invoke(uint64_t a1)
{
  id *v1;
  const char *v2;
  NSObject *Property;
  id *v4;
  void *v5;
  id *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  SEL v10;
  SEL v11;
  int v12;
  void *v13;
  SEL v14;
  SEL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  void *v24;
  BOOL v25;
  void *v26;
  SEL v27;
  id v28;
  void *v29;
  SEL v30;
  NSObject *v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  id v47;
  os_unfair_lock_s *v48;
  id v49;
  id WeakRetained;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id location[16];
  _BYTE buf[24];
  void *v63;
  id v64[16];

  v64[13] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(id **)(a1 + 32);
  v52 = *(id *)(a1 + 40);
  if (v1)
  {
    Property = objc_getProperty(v1, v2, 96, 1);
    dispatch_assert_queue_V2(Property);
    v4 = v1 + 9;
    WeakRetained = objc_loadWeakRetained(v1 + 9);
    objc_msgSend(WeakRetained, "accessoryBrowserForAppleMediaAccessorySensorManager:", v1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x227676638]();
    v6 = v1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v52)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = objc_getProperty(v6, v10, 80, 1);
        *(_WORD *)&buf[22] = 2112;
        v63 = v52;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to add HomePod sensor accessory: %@ - %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v51, "cancelPairingWithAccessoryDescription:error:", objc_getProperty(v6, v11, 80, 1), v52);
      os_unfair_lock_lock_with_options();
      v12 = *((unsigned __int8 *)v6 + 42);
      os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
      if (v12)
      {
        objc_msgSend(v6, "derivedHAPAccessoryIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "deregisterPairedAccessory:", v13);

      }
      -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v6, 0);
      objc_setProperty_atomic(v6, v14, 0, 80);
      objc_msgSend(objc_getProperty(v6, v15, 88, 1), "saveSensorUUID:", 0);
      objc_initWeak(location, v6);
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __73__HMDAppleMediaAccessorySensorManager__handleLocalAddCompletedWithError___block_invoke;
      v63 = &unk_24E782920;
      objc_copyWeak(v64, location);
      -[HMDAppleMediaAccessorySensorManager _resetWithCompletion:]((uint64_t)v6, buf);
      objc_destroyWeak(v64);
      objc_destroyWeak(location);
      v16 = 7;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sensorAccessoryUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully added HomePod sensor accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v6, "sensorAccessoryUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "accessoryWithUUID:forAppleMediaAccessorySensorManager:", v19, v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
      v49 = v21;

      os_unfair_lock_lock_with_options();
      v22 = *((unsigned __int8 *)v6 + 42);
      v48 = (os_unfair_lock_s *)(v6 + 1);
      os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
      if (v22)
      {
        if (v49)
        {
          objc_msgSend(v51, "unpairedHAPAccessoryWithAccessoryDescription:", objc_getProperty(v6, v23, 80, 1));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24 == 0;

          if (!v25)
          {
            objc_msgSend(v49, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            objc_msgSend(v49, "matchesHAPAccessoryWithServerIdentifier:linkType:", v26, buf);
            objc_msgSend(v51, "handleNewlyPairedAccessory:linkType:", v26, *(_QWORD *)buf);

          }
        }
      }
      objc_setProperty_atomic(v6, v23, 0, 80);
      v28 = objc_getProperty(v6, v27, 88, 1);
      objc_msgSend(v6, "sensorAccessoryUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "saveSensorUUID:", v29);

      v31 = objc_getProperty(v6, v30, 96, 1);
      dispatch_assert_queue_V2(v31);
      os_unfair_lock_lock_with_options();
      v32 = *((unsigned __int8 *)v6 + 44);
      os_unfair_lock_unlock(v48);
      if (v32)
      {
        objc_msgSend(v6, "sensorAccessoryUUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v34 = objc_loadWeakRetained(v4);
          objc_msgSend(v34, "accessoryWithUUID:forAppleMediaAccessorySensorManager:", v33, v6);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v36 = v35;
          else
            v36 = 0;
          v47 = v36;

          v37 = v47;
          if (v47)
          {
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            objc_msgSend(v47, "services");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
            if (v39)
            {
              v40 = *(_QWORD *)v58;
              do
              {
                for (i = 0; i != v39; ++i)
                {
                  if (*(_QWORD *)v58 != v40)
                    objc_enumerationMutation(v38);
                  v42 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                  v53 = 0u;
                  v54 = 0u;
                  v55 = 0u;
                  v56 = 0u;
                  objc_msgSend(v42, "characteristics", v47);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v53, location, 16);
                  if (v44)
                  {
                    v45 = *(_QWORD *)v54;
                    do
                    {
                      for (j = 0; j != v44; ++j)
                      {
                        if (*(_QWORD *)v54 != v45)
                          objc_enumerationMutation(v43);
                        -[HMDAppleMediaAccessorySensorManager _checkIfCharacteristicsUpdateServiceName:sensorUUID:]((uint64_t)v6, *(void **)(*((_QWORD *)&v53 + 1) + 8 * j), v33);
                      }
                      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v53, location, 16);
                    }
                    while (v44);
                  }

                }
                v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
              }
              while (v39);
            }

            v37 = v47;
          }

        }
      }
      os_unfair_lock_lock_with_options();
      *((_BYTE *)v6 + 40) = 0;
      v6[7] = 0;
      os_unfair_lock_unlock(v48);

      v16 = 0;
    }
    objc_msgSend(v51, "stopDiscoveringForUnpairedAccessoriesWithLinkType:", 1);
    -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v6, v52 == 0, v52, v16);

  }
}

- (void)setSensorAccessoryUUID:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v3 = objc_msgSend(v5, "copy");
    v4 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v3;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

void __73__HMDAppleMediaAccessorySensorManager__handleLocalAddCompletedWithError___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  NSObject *Property;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  void (*v15)(uint64_t, const char *);
  void *v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:]((uint64_t)WeakRetained);
  if ((a2 & 1) != 0)
  {
    -[HMDAppleMediaAccessorySensorManager setShouldUseDerivedSensorUUID:]((uint64_t)WeakRetained, 1);
    v4 = (void *)MEMORY[0x227676638]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 138543362;
      *(_QWORD *)((char *)&v14 + 4) = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Reset HomePod sensor after failed pairing", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    if (v5)
    {
      Property = objc_getProperty(v5, v8, 96, 1);
      *(_QWORD *)&v14 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v14 + 1) = 3221225472;
      v15 = __60__HMDAppleMediaAccessorySensorManager_scheduleRetryIfNeeded__block_invoke;
      v16 = &unk_24E79C240;
      v17 = v5;
      dispatch_async(Property, &v14);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 138543362;
      *(_QWORD *)((char *)&v14 + 4) = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset HomePod sensor due to xpc client error", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)_checkIfCharacteristicsUpdateServiceName:(void *)a3 sensorUUID:
{
  id v5;
  SEL v6;
  NSObject *Property;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  SEL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  NSObject *v27;
  void *v28;
  id WeakRetained;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v30 = a2;
  v5 = a3;
  Property = objc_getProperty((id)a1, v6, 96, 1);
  dispatch_assert_queue_V2(Property);
  objc_msgSend(v30, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v11)
    goto LABEL_12;
  objc_msgSend(v30, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hmf_isEqualToUUID:", v5) & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v30, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD5928]) & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v8, "getConfiguredName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = v11;
    v17 = v8;
    v18 = v5;
    v20 = objc_getProperty((id)a1, v19, 96, 1);
    dispatch_assert_queue_V2(v20);
    os_unfair_lock_lock_with_options();
    v21 = *(void **)(a1 + 112);
    objc_msgSend(v17, "instanceID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = objc_msgSend(v21, "containsObject:", v22);

    if ((v21 & 1) != 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    else
    {
      v23 = *(void **)(a1 + 112);
      objc_msgSend(v17, "instanceID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      v25 = (void *)MEMORY[0x227676638]();
      v26 = (id *)(id)a1;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v32 = v28;
        v33 = 2112;
        v34 = v17;
        v35 = 2112;
        v36 = v18;
        v37 = 2112;
        v38 = v16;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Renaming service %@ on accessory %@ to %@ after sensor pairing", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v25);
      WeakRetained = objc_loadWeakRetained(v26 + 9);
      objc_msgSend(WeakRetained, "renameService:name:", v17, v16);

    }
  }
LABEL_12:

}

void __60__HMDAppleMediaAccessorySensorManager_scheduleRetryIfNeeded__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2;
  NSObject *Property;
  id WeakRetained;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  SEL v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id location;
  _BYTE buf[24];
  void *v21;
  id v22[4];

  v22[3] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 72));
    if (WeakRetained)
    {
      os_unfair_lock_lock_with_options();
      if ((*(_BYTE *)(v2 + 43) & 1) != 0 || (v5 = *(char **)(v2 + 104), (unint64_t)v5 >= 0x32))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      }
      else
      {
        *(_QWORD *)(v2 + 104) = v5 + 1;
        *(_BYTE *)(v2 + 43) = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
        if ((unint64_t)v5 >= objc_msgSend(&unk_24E970CB8, "count"))
          v5 = (char *)(objc_msgSend(&unk_24E970CB8, "count") - 1);
        objc_msgSend(&unk_24E970CB8, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x227676638]();
        v8 = (id)v2;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2048;
          v21 = (void *)objc_msgSend(v6, "integerValue");
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Will retry (# %ld) HomePod sensor pairing after %ld sec", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v7);
        objc_initWeak(&location, v8);
        objc_msgSend(v6, "doubleValue");
        v12 = v11;
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __61__HMDAppleMediaAccessorySensorManager__scheduleRetryIfNeeded__block_invoke;
        v21 = &unk_24E77B240;
        objc_copyWeak(v22, &location);
        v22[1] = v5;
        v14 = objc_getProperty(v8, v13, 96, 1);
        objc_msgSend(WeakRetained, "performAfterDelay:block:queue:", buf, v14, v12);

        objc_destroyWeak(v22);
        objc_destroyWeak(&location);

      }
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = (id)v2;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot schedule retry due to nil data source", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
}

void __61__HMDAppleMediaAccessorySensorManager__scheduleRetryIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    *((_BYTE *)WeakRetained + 43) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    v3 = (void *)MEMORY[0x227676638]();
    v4 = WeakRetained;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Performing sensor paring retry (# %ld)", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](v4);
  }

}

uint64_t __57__HMDAppleMediaAccessorySensorManager__recoverLostSensor__block_invoke(id *a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  const char *v5;
  os_unfair_lock_s *v6;
  NSObject *Property;
  void *v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  os_unfair_lock_s *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  os_unfair_lock_s *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  os_unfair_lock_s *v26;
  NSObject *v27;
  void *v28;
  id v29;
  SEL v30;
  id v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained(a1 + 6);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    Property = objc_getProperty(WeakRetained, v5, 96, 1);
    dispatch_assert_queue_V2(Property);
    -[os_unfair_lock_s derivedSensorUUID](v6, "derivedSensorUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "hmf_isEqualToUUID:", a1[4]))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = v6;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Recovering lost derived sensor immediately", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v11, 0, v14, 13);

      v15 = (void *)MEMORY[0x227676638]();
      v16 = v11;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = a1[4];
        *(_DWORD *)buf = 138543618;
        v38 = v18;
        v39 = 2112;
        v40 = (uint64_t)v19;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting lost sensor %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v16, MEMORY[0x24BDBD1A8]);
    }
    else
    {
      v20 = os_unfair_lock_lock_with_options();
      if (BYTE1(v6[10]._os_unfair_lock_opaque))
      {
        v21 = (void *)MEMORY[0x227676638](v20);
        v22 = v6;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v24;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Recovery is already pending, will not start another.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
        os_unfair_lock_unlock(v6 + 2);
      }
      else
      {
        BYTE1(v6[10]._os_unfair_lock_opaque) = 1;
        os_unfair_lock_unlock(v6 + 2);
        v25 = (void *)MEMORY[0x227676638]();
        v26 = v6;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v28;
          v39 = 2048;
          v40 = 0x40AC200000000000;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Pending sensor recovery for %f seconds", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        v29 = a1[5];
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __57__HMDAppleMediaAccessorySensorManager__recoverLostSensor__block_invoke_31;
        v33[3] = &unk_24E7965D0;
        objc_copyWeak(&v36, a1 + 6);
        v34 = a1[5];
        v35 = a1[4];
        v31 = objc_getProperty(v26, v30, 96, 1);
        objc_msgSend(v29, "performAfterDelay:block:queue:", v33, v31, 3600.0);

        objc_destroyWeak(&v36);
      }
    }

  }
  return 1;
}

void __57__HMDAppleMediaAccessorySensorManager__recoverLostSensor__block_invoke_31(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  void *v3;
  void *v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int os_unfair_lock_opaque_low;
  void *v10;
  os_unfair_lock_s *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  os_unfair_lock_s *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryWithUUID:forAppleMediaAccessorySensorManager:", *(_QWORD *)(a1 + 40), WeakRetained);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = WeakRetained;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v7;
        v25 = 2112;
        v26 = v3;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Found lost sensor %@, stopping reset", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v5, 0, v8, 8);

      goto LABEL_17;
    }
    os_unfair_lock_lock_with_options();
    os_unfair_lock_opaque_low = LOBYTE(WeakRetained[10]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(WeakRetained + 2);
    if (os_unfair_lock_opaque_low)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = WeakRetained;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        objc_autoreleasePoolPop(v10);
LABEL_17:

        goto LABEL_18;
      }
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v13;
      v14 = "%{public}@Already in the process of pairing, not resetting lost sensor";
    }
    else
    {
      -[os_unfair_lock_s sensorAccessoryUUID](WeakRetained, "sensorAccessoryUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 40));

      if ((v16 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)WeakRetained, 0, v17, 9);

        v18 = (void *)MEMORY[0x227676638]();
        v19 = WeakRetained;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(void **)(a1 + 40);
          v23 = 138543618;
          v24 = v21;
          v25 = 2112;
          v26 = v22;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting lost sensor %@", (uint8_t *)&v23, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v19, MEMORY[0x24BDBD1A8]);
        goto LABEL_17;
      }
      v10 = (void *)MEMORY[0x227676638]();
      v11 = WeakRetained;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v13;
      v14 = "%{public}@Sensor UUID has changed, not resetting lost sensor";
    }
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v23, 0xCu);

    goto LABEL_16;
  }
LABEL_18:

}

void __67__HMDAppleMediaAccessorySensorManager_startADKAndCheckPairingState__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2;
  NSObject *Property;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id location;
  __int128 buf;
  void (*v11)(uint64_t, int);
  void *v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    v4 = *(unsigned __int8 *)(v2 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
    if (v4)
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = (id)v2;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not going to restart ADK", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
    }
    else
    {
      objc_initWeak(&location, (id)v2);
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v11 = __68__HMDAppleMediaAccessorySensorManager__startADKAndCheckPairingState__block_invoke;
      v12 = &unk_24E782920;
      objc_copyWeak(v13, &location);
      -[HMDAppleMediaAccessorySensorManager startSensorClientWithCompletion:](v2, &buf);
      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

void __68__HMDAppleMediaAccessorySensorManager__startADKAndCheckPairingState__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2 && WeakRetained)
  {
    -[HMDAppleMediaAccessorySensorManager checkPairingStateAndStartADKIfUnpaired:](WeakRetained, 0);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = v4;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Starting the HomePod sensor manager to check pairing failed", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)startSensorClientWithCompletion:(uint64_t)a1
{
  const char *v3;
  id v4;
  NSObject *Property;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (a1)
  {
    Property = objc_getProperty((id)a1, v3, 96, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    v6 = *(unsigned __int8 *)(a1 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = (id)a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not starting adk again", (uint8_t *)&v26, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      os_unfair_lock_lock_with_options();
      v11 = *(unsigned __int8 *)(a1 + 42);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (v11)
      {
        -[HMDAppleMediaAccessorySensorManager derivedHAPAccessoryIdentifierData]((os_unfair_lock_s *)a1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(objc_getProperty((id)a1, v13, 120, 1), "privateKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "data");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(objc_getProperty((id)a1, v17, 64, 1), "startWithDeviceID:deviceLTSK:controllerPairingID:controllerLTPK:completion:", v14, v16, 0, 0, v4);
          }
          else
          {
            v22 = (void *)MEMORY[0x227676638]();
            v23 = (id)a1;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = 138543362;
              v27 = v25;
              _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to get pairing identity to start sensor client", (uint8_t *)&v26, 0xCu);

            }
            objc_autoreleasePoolPop(v22);
          }

        }
        else
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = (id)a1;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 138543362;
            v27 = v21;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to calculate derived deviceID to start sensor client", (uint8_t *)&v26, 0xCu);

          }
          objc_autoreleasePoolPop(v18);
        }

      }
      else
      {
        objc_msgSend(objc_getProperty((id)a1, v12, 64, 1), "startWithCompletion:", v4);
      }
    }
  }

}

- (os_unfair_lock_s)derivedHAPAccessoryIdentifierData
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock_with_options();
    v3 = *(void **)&v1[6]._os_unfair_lock_opaque;
    if (!v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v1[18]);
      objc_msgSend(WeakRetained, "hostUUIDForAppleMediaAccessorySensorManager:", v1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v1 = 0;
        goto LABEL_6;
      }
      -[os_unfair_lock_s derivedHAPAccessoryIdentifierDataForHostUUID:](v1, "derivedHAPAccessoryIdentifierDataForHostUUID:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)&v1[6]._os_unfair_lock_opaque;
      *(_QWORD *)&v1[6]._os_unfair_lock_opaque = v6;

      v3 = *(void **)&v1[6]._os_unfair_lock_opaque;
    }
    v1 = v3;
LABEL_6:
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

void __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v16 = 138543874;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v3;
      v11 = "%{public}@Unable to remove existing HomePod sensor accessory: %@ - %@";
      v12 = v8;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v12, v13, v11, (uint8_t *)&v16, v14);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    v16 = 138543618;
    v17 = v9;
    v18 = 2112;
    v19 = v15;
    v11 = "%{public}@Removed HomePod sensor accessory %@";
    v12 = v8;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
}

uint64_t __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke_33(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removed HomePod sensor accessories", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  id Property;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x227676638]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting sensor uuid after sensor removal", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v3, 0);
  if (v3)
    Property = objc_getProperty(v3, v6, 88, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke_34;
  v8[3] = &unk_24E79BD80;
  v8[4] = v3;
  objc_msgSend(Property, "saveSensorUUID:completion:", 0, v8);

}

void __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke_34(uint64_t a1, const char *a2)
{
  uint64_t v2;
  NSObject *Property;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__HMDAppleMediaAccessorySensorManager_resetSensorPairingAndPair__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v2;
    dispatch_async(Property, block);
  }
}

void __64__HMDAppleMediaAccessorySensorManager_resetSensorPairingAndPair__block_invoke(uint64_t a1, const char *a2)
{
  -[HMDAppleMediaAccessorySensorManager _resetSensorPairingAndPair](*(void **)(a1 + 32), a2);
}

uint64_t __70__HMDAppleMediaAccessorySensorManager_fetchADKSensorStatusCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3);
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch sensor status from adk", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__HMDAppleMediaAccessorySensorManager_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  void *v1;
  const char *v2;
  NSObject *Property;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    Property = objc_getProperty(v1, v2, 96, 1);
    dispatch_assert_queue_V2(Property);
    objc_msgSend(v1, "sensorAccessoryUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v10, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            -[HMDAppleMediaAccessorySensorManager _checkIfCharacteristicsUpdateServiceName:sensorUUID:]((uint64_t)v1, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9++), v4);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }

    }
  }

}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  NSObject *Property;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;
  char v12;

  v3 = *(void **)(a1 + 32);
  if (v3)
    Property = objc_getProperty(v3, a2, 96, 1);
  else
    Property = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_2;
  v7[3] = &unk_24E790140;
  v11 = *(_BYTE *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 57);
  dispatch_async(Property, v7);

}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 56))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v2 = *(void **)(a1 + 40);
    v13[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_6;
    v10[3] = &unk_24E79C240;
    v4 = &v11;
    v11 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v2, v3, v10);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(_QWORD *)(a1 + 40), v5);

LABEL_5:
    goto LABEL_6;
  }
  if (*(_BYTE *)(a1 + 57))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v6 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_7;
    v8[3] = &unk_24E79C240;
    v4 = &v9;
    v9 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v6, v7, v8);

    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(_QWORD *)(a1 + 40), 0);
    goto LABEL_5;
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_8(uint64_t a1, const char *a2)
{
  -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](*(void **)(a1 + 32), a2);
  return objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_7(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 56))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v2 = *(void **)(a1 + 40);
    v13[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_3;
    v10[3] = &unk_24E79C240;
    v4 = &v11;
    v11 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v2, v3, v10);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(_QWORD *)(a1 + 40), v5);

LABEL_5:
    goto LABEL_6;
  }
  if (*(_BYTE *)(a1 + 57))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v6 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_4;
    v8[3] = &unk_24E79C240;
    v4 = &v9;
    v9 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v6, v7, v8);

    -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:](*(_QWORD *)(a1 + 40), 0);
    goto LABEL_5;
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__HMDAppleMediaAccessorySensorManager__migrateToDataStoreIfNeeded_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Found HomePod sensor identifier, need to migrate", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __78__HMDAppleMediaAccessorySensorManager__migrateToDataStoreIfNeeded_completion___block_invoke_11;
    v11[3] = &unk_24E79AB68;
    v9 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v9, "saveSensorUUID:completion:", v3, v11);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Didn't found HomePod sensor identifier, no migration needed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __78__HMDAppleMediaAccessorySensorManager__migrateToDataStoreIfNeeded_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate HomePod sensor identifier: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Success migrating HomePod sensor identifier", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "saveSensorUUID:", 0);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v9();

}

uint64_t __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_2;
  v4[3] = &unk_24E791780;
  v4[4] = v2;
  return objc_msgSend(v2, "_migrateToDataStoreIfNeeded:completion:", v1, v4);
}

void __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_2(uint64_t a1, const char *a2)
{
  NSObject *Property;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a2)
  {
    Property = *(NSObject **)(a1 + 32);
    if (Property)
    {
      Property = objc_getProperty(Property, a2, 96, 1);
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v4 = 0;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_3;
    block[3] = &unk_24E79C240;
    block[4] = v4;
    dispatch_async(Property, block);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with failed migration", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

void __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_3(uint64_t a1, const char *a2)
{
  id *v2;
  NSObject *Property;
  const char *v4;
  id WeakRetained;
  SEL v6;
  id v7;
  void *v8;
  id *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id location;
  __int128 buf;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19[3];

  v19[2] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(id **)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 96, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained(v2 + 9);
    if (WeakRetained)
    {
      objc_getProperty(v2, v4, 64, 1);
      if ((objc_msgSend((id)objc_opt_class(), "supportSensory") & 1) != 0)
      {
        objc_initWeak(&location, v2);
        objc_initWeak(&v13, WeakRetained);
        v7 = objc_getProperty(v2, v6, 88, 1);
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v16 = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke;
        v17 = &unk_24E77B150;
        objc_copyWeak(&v18, &location);
        objc_copyWeak(v19, &v13);
        objc_msgSend(v7, "fetchSensorUUIDWithCompletion:", &buf);

        objc_destroyWeak(v19);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
LABEL_11:

        return;
      }
      v8 = (void *)MEMORY[0x227676638]();
      v9 = v2;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Cannot start HomePod sensor manager as device does not support sensors", (uint8_t *)&buf, 0xCu);

      }
    }
    else
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = v2;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with nil data source", (uint8_t *)&buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v8);
    goto LABEL_11;
  }
}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  id Property;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  SEL v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD block[5];
  id v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (id *)(a1 + 40);
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)WeakRetained, v3);
  if (v7 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "derivedSensorUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(WeakRetained, "sensorAccessoryUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = objc_msgSend(v3, "hmf_isEqualToUUID:", v8);
      else
        v10 = 1;
      os_unfair_lock_lock_with_options();
      *((_BYTE *)WeakRetained + 42) = v10;
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);

      v20 = objc_loadWeakRetained((id *)WeakRetained + 9);
      v80 = v20;
      if (v20)
      {
        v77 = v4;
        v79 = v8;
        objc_msgSend(v20, "keychainStoreForAppleMediaAccessorySensorManager:", WeakRetained);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "derivedSensorUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v21;
        objc_msgSend(v21, "pairingIdentityForAppleMediaAccessorySensorWithUUID:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x227676638]();
        v25 = WeakRetained;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = v27;
          v86 = 2112;
          v87 = v23;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Existing sensor accessory pairing identity: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        if (v23)
        {
          objc_setProperty_atomic_copy(v25, v28, v23, 120);
        }
        else
        {
          v36 = objc_loadWeakRetained((id *)WeakRetained + 9);
          v37 = v36;
          if (v36)
          {
            v76 = v36;
            objc_msgSend(MEMORY[0x24BE3F228], "pairingIdentity");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_alloc(MEMORY[0x24BE3F228]);
            objc_msgSend(v25, "derivedHAPAccessoryIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "publicKey");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = v38;
            objc_msgSend(v38, "privateKey");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (void *)objc_msgSend(v39, "initWithIdentifier:publicKey:privateKey:", v40, v41, v42);

            v44 = (void *)MEMORY[0x227676638]();
            v45 = v25;
            HMFGetOSLogHandle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v85 = v47;
              v86 = 2112;
              v87 = v43;
              _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new sensor accessory pairing identity: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v44);
            v37 = v76;
            objc_msgSend(v76, "keychainStoreForAppleMediaAccessorySensorManager:", v45);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v43;
            if ((objc_msgSend(v75, "saveAppleMediaAccessorySensorPairingIdentity:", v43) & 1) != 0)
            {
              objc_setProperty_atomic_copy(v45, v48, v43, 120);
              v23 = 0;
              v50 = v74;
            }
            else
            {
              v73 = v43;
              v55 = (void *)MEMORY[0x227676638]();
              v56 = v45;
              HMFGetOSLogHandle();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v85 = v58;
                _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_ERROR, "%{public}@Failed to save new sensor accessory pairing identity in the keychain store", buf, 0xCu);

                v37 = v76;
              }

              objc_autoreleasePoolPop(v55);
              v23 = 0;
              v49 = v73;
              v50 = v74;
            }

          }
          else
          {
            v51 = (void *)MEMORY[0x227676638]();
            v52 = v25;
            HMFGetOSLogHandle();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v85 = v54;
              _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Cannot create sensor pairing with nil data source", buf, 0xCu);

              v37 = 0;
            }

            objc_autoreleasePoolPop(v51);
            v23 = 0;
          }

        }
        Property = objc_getProperty(v25, v29, 120, 1);
        v35 = Property != 0;
        if (!Property)
        {
          v60 = (void *)MEMORY[0x227676638]();
          v61 = v25;
          HMFGetOSLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v85 = v63;
            _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to get/create a sensor pairing identity", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v60);
        }

        v8 = v79;
        v4 = v77;
      }
      else
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = WeakRetained;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = v8;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v85 = v34;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Cannot load sensor pairing with nil data source", buf, 0xCu);

          v8 = v33;
        }

        objc_autoreleasePoolPop(v30);
        v35 = 0;
      }

      v64 = (void *)MEMORY[0x227676638]();
      v65 = WeakRetained;
      HMFGetOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = v66;
      if (v35)
      {
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = v68;
          v86 = 2112;
          v87 = v3;
          _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@Local HomePod paired sensor UUID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v64);
        v70 = objc_getProperty(v65, v69, 96, 1);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_8;
        block[3] = &unk_24E798350;
        block[4] = v65;
        v71 = v70;
        objc_copyWeak(&v82, v4);
        objc_copyWeak(&v83, v6);
        dispatch_async(v71, block);

        objc_destroyWeak(&v83);
        objc_destroyWeak(&v82);
        goto LABEL_47;
      }
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v85 = v72;
        _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_ERROR, "%{public}@Cannot start sensor manager as we are unable to get a pairing identity", buf, 0xCu);

      }
      v19 = v64;
    }
    else
    {
      v15 = MEMORY[0x227676638]();
      v16 = WeakRetained;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v85 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to calculate derived sensor UUID start sensor client", buf, 0xCu);

      }
      v19 = (void *)v15;
    }
    objc_autoreleasePoolPop(v19);
LABEL_47:

    goto LABEL_48;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = WeakRetained;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v85 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot continue starting HomePod sensor manager with nil data source", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
LABEL_48:

}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_2;
  v3[3] = &unk_24E77B128;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_copyWeak(&v5, (id *)(a1 + 48));
  -[HMDAppleMediaAccessorySensorManager startSensorClientWithCompletion:](v2, v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 && WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = WeakRetained;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v25 = 138543362;
        *(_QWORD *)&v25[4] = v9;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Starting the HomePod sensor manager failed", v25, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }
    v10 = v5;
    objc_msgSend(v10, "notificationCenterForAppleMediaAccessorySensorManager:", WeakRetained);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "residentNotificationObjectForAppleMediaAccessorySensorManager:", WeakRetained);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", WeakRetained, sel_handlePrimaryResidentChanged_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v12);

    objc_msgSend(v10, "residentNotificationObjectForAppleMediaAccessorySensorManager:", WeakRetained);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", WeakRetained, sel_handlePrimaryResidentChanged_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), v13);

    objc_msgSend(v10, "residentNotificationObjectForAppleMediaAccessorySensorManager:", WeakRetained);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", WeakRetained, sel_handlePrimaryResidentChanged_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), v14);

    objc_msgSend(v10, "addAccessoryNotificationObjectForAppleMediaAccessorySensorManager:", WeakRetained);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", WeakRetained, sel_handleAccessoryAdded_, CFSTR("HMDNotificationHomeAddedAccessory"), v15);

    objc_msgSend(v11, "addObserver:selector:name:object:", WeakRetained, sel_handleCharacteristicsChangedNotification_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), 0);
    if (isInternalBuild())
    {
      +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageDispatcherForAppleMediaAccessorySensorManager:", WeakRetained);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x24BDD5290];
      *(_QWORD *)v25 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "registerForMessage:receiver:policies:selector:", v18, WeakRetained, v19, sel_handleErrorCaseTestMessage_);

    }
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](WeakRetained, v20);
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = WeakRetained;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 138543362;
      *(_QWORD *)&v25[4] = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with nil data source or nil self", v25, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t108 != -1)
    dispatch_once(&logCategory__hmf_once_t108, &__block_literal_global_42517);
  return (id)logCategory__hmf_once_v109;
}

void __50__HMDAppleMediaAccessorySensorManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v109;
  logCategory__hmf_once_v109 = v0;

}

@end
