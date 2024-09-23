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
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
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
    objc_setProperty_atomic(self, v10, v9, 40);

    objc_setProperty_atomic(self, v11, v8, 64);
    Property = objc_getProperty(self, v12, 72, 1);
  }
  else
  {
    Property = 0;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke;
  v15[3] = &unk_1E89C2328;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  dispatch_async(Property, v15);

}

- (void)_migrateToDataStoreIfNeeded:(id)a3 completion:(id)a4
{
  (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
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
    self = (HMDAppleMediaAccessorySensorManager *)objc_getProperty(self, a2, 72, 1);
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
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  _QWORD block[4];
  NSObject *v31;
  HMDAppleMediaAccessorySensorManager *v32;
  id v33;
  BOOL v34;
  BOOL v35;
  _QWORD v36[5];
  NSObject *v37;
  id v38;
  BOOL v39;
  BOOL v40;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 72, 1);
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
    {
      objc_msgSend(v5, "messagePayload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB82B0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "messagePayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CB82B8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;

      objc_msgSend(v5, "messagePayload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CB82A0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 != 0;

      v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      v21 = MEMORY[0x1E0C809B0];
      if (v12)
      {
        if (self)
          v22 = objc_getProperty(self, v20, 40, 1);
        else
          v22 = 0;
        v36[0] = v21;
        v36[1] = 3221225472;
        v36[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke;
        v36[3] = &unk_1E89B5448;
        v36[4] = self;
        v39 = v18;
        v37 = v19;
        v38 = v9;
        v40 = v15;
        objc_msgSend(v22, "resetWithCompletion:", v36);

        v23 = v37;
      }
      else
      {
        if (self)
          v25 = objc_getProperty(self, v20, 72, 1);
        else
          v25 = 0;
        block[0] = v21;
        block[1] = 3221225472;
        block[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_5;
        block[3] = &unk_1E89B84C8;
        v34 = v18;
        v31 = v19;
        v32 = self;
        v33 = v9;
        v35 = v15;
        dispatch_async(v25, block);

        v23 = v31;
      }

      if (self)
        v27 = objc_getProperty(self, v26, 72, 1);
      else
        v27 = 0;
      v28[0] = v21;
      v28[1] = 3221225472;
      v28[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_8;
      v28[3] = &unk_1E89C2328;
      v28[4] = self;
      v29 = v5;
      dispatch_group_notify(v19, v27, v28);

    }
    else
    {
      -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](self, v10);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "respondWithError:", v24);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "respondWithError:", WeakRetained);
  }

}

- (void)localAccessoryAddRequiresConsent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  HMDAppleMediaAccessorySensorManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  SEL v12;
  void *v13;
  HMDAppleMediaAccessorySensorManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDAppleMediaAccessorySensorManager *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource)) != 0)
  {
    v6 = WeakRetained;
    if ((objc_msgSend(WeakRetained, "isReadyForSensorPairing:", self) & 1) != 0)
    {
      -[HMDAppleMediaAccessorySensorManager sensorAccessoryUUID](self, "sensorAccessoryUUID");
      if (objc_claimAutoreleasedReturnValue())
        __assert_rtn("-[HMDAppleMediaAccessorySensorManager localAccessoryAddRequiresConsent:]", "HMDAppleMediaAccessorySensorManager.m", 1254, "!self.sensorAccessoryUUID");
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v10;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Confirming HomePod sensor with UUID %@ is allowed to be added locally", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v8, v4);
      objc_msgSend(v6, "accessoryBrowserForAppleMediaAccessorySensorManager:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didReceiveUserConsentResponseForSetupAccessoryDetail:consent:", objc_getProperty(v8, v12, 56, 1), 1);

    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v20;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Not consenting to accessory local add for %@ as data source is no longer ready for pairing", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Not consenting to accessory local add for %@ with nil data source", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

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
    Property = objc_getProperty(self, v6, 72, 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__HMDAppleMediaAccessorySensorManager_handleCharacteristicsChangedNotification___block_invoke;
    v8[3] = &unk_1E89C2328;
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
    Property = objc_getProperty(self, v4, 40, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HMDAppleMediaAccessorySensorManager_fetchADKSensorStatusCompletion___block_invoke;
  v8[3] = &unk_1E89B54C0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(Property, "getCurrentStatusWithCompletion:", v8);

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

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@HPSManagerDelegate: manager is ready to be paired", (uint8_t *)&v8, 0xCu);

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
    v5 = &stru_1E89C3E38;
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
}

- (void)cleanUpExistingAccessoriesAndStartADKIfReady
{
  NSObject *Property;
  _QWORD block[5];

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 72, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__HMDAppleMediaAccessorySensorManager_cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke;
    block[3] = &unk_1E89C2730;
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
  uint64_t (*v43)();
  void *v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
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
          v8 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v42 = MEMORY[0x1E0C809B0];
          *((_QWORD *)&v42 + 1) = 3221225472;
          v43 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke;
          v44 = &unk_1E89B53F8;
          v45 = v2;
          objc_msgSend(v7, "na_filter:", &v42);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "count"))
          {
            objc_msgSend((id)v2, "sensorAccessoryUUID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v10)
            {
              v29 = (void *)MEMORY[0x1D17BA0A0]();
              v30 = (id)v2;
              HMFGetOSLogHandle();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v38) = 138543362;
                *(_QWORD *)((char *)&v38 + 4) = v32;
                _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Removing unexpected sensor accessories as no sensor should be paired", (uint8_t *)&v38, 0xCu);

              }
              objc_autoreleasePoolPop(v29);
              -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v30, v9);
              goto LABEL_29;
            }
            *(_QWORD *)&v38 = v8;
            *((_QWORD *)&v38 + 1) = 3221225472;
            v39 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_21;
            v40 = &unk_1E89B53F8;
            v41 = v2;
            objc_msgSend(v9, "na_filter:", &v38);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "count"))
            {
              v12 = (void *)MEMORY[0x1D17BA0A0]();
              v13 = (id)v2;
              HMFGetOSLogHandle();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf) = 138543362;
                *(_QWORD *)((char *)&buf + 4) = v15;
                _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Removing unexpected sensor accessories", (uint8_t *)&buf, 0xCu);

              }
              objc_autoreleasePoolPop(v12);
              -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v13, v11, 0);
            }

          }
          os_unfair_lock_lock_with_options();
          v16 = *(unsigned __int8 *)(v2 + 12);
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
          if (v16)
          {
            v17 = (void *)MEMORY[0x1D17BA0A0]();
            v18 = (id)v2;
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v20;
              _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not checking HomePod sensor pairing status", (uint8_t *)&buf, 0xCu);

            }
            objc_autoreleasePoolPop(v17);
          }
          else
          {
            objc_initWeak(&location, (id)v2);
            v28 = objc_getProperty((id)v2, v27, 40, 1);
            *(_QWORD *)&buf = v8;
            *((_QWORD *)&buf + 1) = 3221225472;
            v35 = __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_22;
            v36 = &unk_1E89B5420;
            objc_copyWeak(v37, &location);
            objc_msgSend(v28, "isReadyToPairWithCompletion:", &buf);

            objc_destroyWeak(v37);
            objc_destroyWeak(&location);
          }
LABEL_29:

          goto LABEL_30;
        }
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = (id)v2;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = 138543362;
          *(_QWORD *)((char *)&v42 + 4) = v26;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot pair/check sensors yet as data source is not ready for pairing", (uint8_t *)&v42, 0xCu);

        }
      }
      else
      {
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = (id)v2;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = 138543362;
          *(_QWORD *)((char *)&v42 + 4) = v25;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Cannot pair/check sensors yet as no primary is confirmed", (uint8_t *)&v42, 0xCu);

        }
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = (id)v2;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v42) = 138543362;
        *(_QWORD *)((char *)&v42 + 4) = v24;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot check and clean up existing HomePod sensor pairings with nil data source", (uint8_t *)&v42, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v21);
LABEL_30:

  }
}

uint64_t __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke()
{
  return 1;
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
  Property = objc_getProperty(a1, v4, 72, 1);
  dispatch_assert_queue_V2(Property);
  objc_initWeak(&location, a1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke;
  v6[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v7, &location);
  -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](a1, v3, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

uint64_t __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_21(uint64_t a1, void *a2)
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
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SEL v17;
  NSObject *v18;
  id v19;
  id v20;
  id val;
  _QWORD block[5];
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v19 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v5, 72, 1);
    dispatch_assert_queue_V2(Property);
    v7 = dispatch_group_create();
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    val = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2112;
      v36 = v20;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Removing HomePod sensor accessories %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_initWeak((id *)buf, val);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v20;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      v14 = *(_QWORD *)v29;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v15);
          dispatch_group_enter(v7);
          v24[0] = v13;
          v24[1] = 3221225472;
          v24[2] = __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke;
          v24[3] = &unk_1E89BCB20;
          objc_copyWeak(&v27, (id *)buf);
          v25 = v7;
          v26 = v16;
          objc_msgSend(v16, "sendRemovalRequestWithCompletion:", v24, v19);

          objc_destroyWeak(&v27);
          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v12);
    }

    v18 = objc_getProperty(val, v17, 72, 1);
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke_27;
    block[3] = &unk_1E89C1D68;
    block[4] = val;
    v23 = v19;
    dispatch_group_notify(v7, v18, block);

    objc_destroyWeak((id *)buf);
  }

}

void __84__HMDAppleMediaAccessorySensorManager__cleanUpExistingAccessoriesAndStartADKIfReady__block_invoke_22(uint64_t a1, char a2)
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

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    -[HMDAppleMediaAccessorySensorManager checkPairingStateAndStartADKIfUnpaired:](WeakRetained, (const char *)1);
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = v4;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Not starting HomePod Sensor pairing as homepodsensed is not ready", (uint8_t *)&v9, 0xCu);

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
    Property = objc_getProperty(a1, a2, 72, 1);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __78__HMDAppleMediaAccessorySensorManager_checkPairingStateAndStartADKIfUnpaired___block_invoke;
    v5[3] = &unk_1E89C2758;
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
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    objc_initWeak(&location, v2);
    v6 = objc_getProperty(v2, v5, 40, 1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__HMDAppleMediaAccessorySensorManager__checkPairingStateAndStartADKIfUnpaired___block_invoke;
    v7[3] = &unk_1E89B5470;
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

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (!a2 || !WeakRetained)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = v8;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 138543362;
      *(_QWORD *)((char *)&v14 + 4) = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to check sensor pairing due to xpc client error", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  if (a2 && (a3 & 1) != 0 || !*(_BYTE *)(a1 + 40))
  {
    if (a2 && v8)
    {
      Property = objc_getProperty(v8, v7, 72, 1);
      *(_QWORD *)&v14 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v14 + 1) = 3221225472;
      v15 = __71__HMDAppleMediaAccessorySensorManager_performPairingFromPairingStatus___block_invoke;
      v16 = &unk_1E89C2758;
      v17 = v8;
      v18 = a3;
      goto LABEL_14;
    }
  }
  else if (v8)
  {
    Property = objc_getProperty(v8, v7, 72, 1);
    *(_QWORD *)&v14 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v14 + 1) = 3221225472;
    v15 = __67__HMDAppleMediaAccessorySensorManager_startADKAndCheckPairingState__block_invoke;
    v16 = &unk_1E89C2730;
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
  id WeakRetained;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  SEL v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  _QWORD v60[5];
  _BYTE buf[24];
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return;
  v3 = *(unsigned __int8 *)(a1 + 40);
  Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
  dispatch_assert_queue_V2(Property);
  os_unfair_lock_lock_with_options();
  v5 = *(unsigned __int8 *)(v2 + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
    if (!WeakRetained)
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = (id)v2;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor pairing with nil data source", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      goto LABEL_41;
    }
    objc_msgSend((id)v2, "sensorAccessoryUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend((id)v2, "sensorAccessoryUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "accessoryWithUUID:forAppleMediaAccessorySensorManager:", v13, v2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (v3)
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          v16 = (id)v2;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v14;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@HomePod sensor (%@) is already paired -- no action needed", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v37, 3);

          v38 = (void *)MEMORY[0x1D17BA0A0]();
          v39 = (id)v2;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v41;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v14;
            _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is not paired but there is a paired accessory in the home, removing existing sensor: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v38);
          *(_QWORD *)buf = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessoriesAndPair:](v39, v42);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v29, 1);

        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = (id)v2;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "sensorAccessoryUUID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v34;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is missing, expected accessory with UUID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v30);
        v36 = objc_getProperty(v31, v35, 72, 1);
        dispatch_assert_queue_V2(v36);
      }
      goto LABEL_41;
    }
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v2, 0, v23, 2);

      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = (id)v2;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v27;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@HomePod sensor is paired but not to any accessory in the home, resetting pairing", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      -[HMDAppleMediaAccessorySensorManager _resetSensorPairingAndPair](v25, v28);
      goto LABEL_41;
    }
    v43 = objc_getProperty((id)v2, v12, 72, 1);
    dispatch_assert_queue_V2(v43);
    v44 = objc_loadWeakRetained((id *)(v2 + 48));
    if (v44)
    {
      os_unfair_lock_lock_with_options();
      if (!*(_BYTE *)(v2 + 12))
      {
        *(_BYTE *)(v2 + 12) = 1;
        objc_msgSend(MEMORY[0x1E0D33490], "currentTime");
        *(_QWORD *)(v2 + 32) = v50;
        *(_BYTE *)(v2 + 16) = 1;
        objc_msgSend(*(id *)(v2 + 88), "removeAllObjects");
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
        objc_msgSend(v44, "fetchSentinelZoneDidFinishFutureForAppleMediaAccessorySensorManager:", v2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v52 = MEMORY[0x1E0C809B0];
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke;
          v62 = &unk_1E89C2210;
          v63 = v44;
          v64 = v2;
          v53 = (id)objc_msgSend(v51, "addSuccessBlock:", buf);
          v60[0] = v52;
          v60[1] = 3221225472;
          v60[2] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_36;
          v60[3] = &unk_1E89C2350;
          v60[4] = v2;
          v54 = (id)objc_msgSend(v51, "addFailureBlock:", v60);

        }
        else
        {
          v55 = (void *)MEMORY[0x1D17BA0A0]();
          v56 = (id)v2;
          HMFGetOSLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v58;
            _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair HomePod sensor as zone fetch succeeded future is nil", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v55);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v56, 0, v59, 12);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v2 + 12) = 0;
          *(_QWORD *)(v2 + 32) = 0;
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
        }

        goto LABEL_40;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      v45 = (void *)MEMORY[0x1D17BA0A0]();
      v46 = (id)v2;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v48;
        _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Not starting HomePod Sensor pairing as a pairing is already in progress", buf, 0xCu);

      }
    }
    else
    {
      v45 = (void *)MEMORY[0x1D17BA0A0]();
      v46 = (id)v2;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v49;
        _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform HomePod sensor pairing with nil data source", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v45);
LABEL_40:

LABEL_41:
    return;
  }
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = (id)v2;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not checking HomePod sensor pairing status", buf, 0xCu);

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
    v7 = (id *)(a1 + 48);
    v8 = a3;
    WeakRetained = objc_loadWeakRetained(v7);
    objc_msgSend(WeakRetained, "logSubmitterForAppleMediaAccessorySensorManager:", a1);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v10 = [HMDHomePodSensorPairingLogEvent alloc];
    os_unfair_lock_lock_with_options();
    v11 = *(double *)(a1 + 32);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v12 = -[HMDHomePodSensorPairingLogEvent initWithStartTime:pairingSuccess:failureReason:](v10, "initWithStartTime:pairingSuccess:failureReason:", a2, a4, v11);
    objc_msgSend(v13, "submitLogEvent:error:", v12, v8);

  }
}

- (void)_resetSensorPairingAndPair
{
  NSObject *Property;
  _QWORD v4[4];
  id v5;
  id location;

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    objc_initWeak(&location, a1);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__HMDAppleMediaAccessorySensorManager__resetSensorPairingAndPair__block_invoke;
    v4[3] = &unk_1E89B5420;
    objc_copyWeak(&v5, &location);
    -[HMDAppleMediaAccessorySensorManager _resetWithCompletion:](a1, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __65__HMDAppleMediaAccessorySensorManager__resetSensorPairingAndPair__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = WeakRetained;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Reset HomePod sensor and ready to pair", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](v5);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset HomePod sensor due to xpc client error", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

- (void)_resetWithCompletion:(void *)a1
{
  SEL v3;
  NSObject *Property;
  SEL v5;
  id v6;

  v6 = a2;
  Property = objc_getProperty(a1, v3, 72, 1);
  dispatch_assert_queue_V2(Property);
  objc_msgSend(objc_getProperty(a1, v5, 40, 1), "resetWithCompletion:", v6);

}

- (void)setIsCurrentlyPairing:(uint64_t)a1
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 12) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    os_unfair_lock_unlock(v2);
  }
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  id Property;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "accountHasSentinelZoneForAppleMediaAccessorySensorManager:", *(_QWORD *)(a1 + 40)))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair HomePod sensor as sentinel zone was detected in HH1, relaunch imminent", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v8, 0, v9, 10);

    -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:](*(_QWORD *)(a1 + 40));
  }
  else
  {
    HMFRandomDataWithLength();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod Sensor pairing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    Property = *(id *)(a1 + 40);
    if (Property)
      Property = objc_getProperty(Property, v16, 40, 1);
    v18 = Property;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_29;
    v21[3] = &unk_1E89B5498;
    objc_copyWeak(&v24, (id *)buf);
    v19 = v10;
    v22 = v19;
    v20 = v11;
    v23 = v20;
    objc_msgSend(v18, "setupPairing:uuid:completion:", v19, v20, v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

  }
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_36(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot pair HomePod sensor as zone fetch succeeded future failed", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:](v8, 0, v9, 11);

  -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:](*(_QWORD *)(a1 + 32));
}

void __54__HMDAppleMediaAccessorySensorManager__performPairing__block_invoke_29(uint64_t a1, int a2, void *a3)
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

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@HomePod Sensor pairing %@ - pairing URI: %@", v20, 0x20u);

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
      Property = objc_getProperty(v8, v16, 72, 1);
      *(_QWORD *)v20 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v20[8] = 3221225472;
      *(_QWORD *)&v20[16] = __75__HMDAppleMediaAccessorySensorManager_pairWithURI_authToken_authTokenUUID___block_invoke;
      v21 = &unk_1E89C07B8;
      v22 = v8;
      v23 = v14;
      v24 = v15;
      v25 = v17;
      dispatch_async(Property, v20);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1, *(_QWORD *)v20, *(_QWORD *)&v20[8]);
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

  v46[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v42 = v2;
  v6 = v3;
  if (v1)
  {
    Property = objc_getProperty(v1, v5, 72, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained(v1 + 6);
    if (!WeakRetained)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = v1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor pairing with nil data source", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v13, 0, v16, 6);

      os_unfair_lock_lock_with_options();
      *((_BYTE *)v13 + 12) = 0;
      v13[4] = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)v13 + 2);
      goto LABEL_23;
    }
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (objc_msgSend(MEMORY[0x1E0CBA308], "isHAPSetupPayloadURL:", v10))
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA840]), "initWithHAPSetupPayloadURL:error:", v10, 0);
LABEL_15:

        if (v11)
        {
          v22 = objc_alloc(MEMORY[0x1E0CBA838]);
          objc_msgSend(WeakRetained, "homeUUIDForAppleMediaAccessorySensorManager:", v1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v22, "initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:", v11, 0, v23, 0);
          objc_setProperty_atomic(v1, v25, v24, 56);

          v27 = objc_msgSend(objc_getProperty(v1, v26, 56, 1), "updateWithAuthToken:uuid:", v42, v6);
          v28 = (void *)MEMORY[0x1D17BA0A0](v27);
          v29 = v1;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_getProperty(v29, v32, 56, 1);
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v33;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HomePod sensor pairing with accessory description: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v28);
          objc_msgSend(WeakRetained, "accessoryBrowserForAppleMediaAccessorySensorManager:", v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "startDiscoveringAccessoriesWithLinkType:", 1);
          objc_initWeak(&location, v29);
          v36 = objc_getProperty(v29, v35, 56, 1);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __76__HMDAppleMediaAccessorySensorManager__pairWithURI_authToken_authTokenUUID___block_invoke;
          v45 = &unk_1E89C0678;
          objc_copyWeak(v46, &location);
          objc_msgSend(WeakRetained, "performLocalAddAccessoryWithDescription:progressHandlerDelegate:completion:", v36, v29, buf);

          objc_destroyWeak(v46);
          objc_destroyWeak(&location);

        }
        else
        {
          v37 = (void *)MEMORY[0x1D17BA0A0]();
          v38 = v1;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v40;
            _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor pairing with nil accessory payload", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v37);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v38, 0, v41, 5);

          os_unfair_lock_lock_with_options();
          *((_BYTE *)v38 + 12) = 0;
          v38[4] = 0;
          os_unfair_lock_unlock((os_unfair_lock_t)v38 + 2);
        }

LABEL_23:
        goto LABEL_24;
      }
      v17 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not create setup payload from invalid HAP setup payload url string: %@", buf, 0x16u);

      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil setup payload for url string: %@", buf, 0x16u);

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
    Property = objc_getProperty(self, v4, 72, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HMDAppleMediaAccessorySensorManager_handleLocalAddCompletedWithError___block_invoke;
    block[3] = &unk_1E89C2328;
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
  SEL v12;
  SEL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SEL v17;
  SEL v18;
  id v19;
  void *v20;
  SEL v21;
  NSObject *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  id v38;
  id WeakRetained;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id location[16];
  _BYTE buf[24];
  void *v52;
  id v53[16];

  v53[13] = *(id *)MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  v41 = *(id *)(a1 + 40);
  if (v1)
  {
    Property = objc_getProperty(v1, v2, 72, 1);
    dispatch_assert_queue_V2(Property);
    v4 = v1 + 6;
    WeakRetained = objc_loadWeakRetained(v1 + 6);
    objc_msgSend(WeakRetained, "accessoryBrowserForAppleMediaAccessorySensorManager:", v1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = v1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v41)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = objc_getProperty(v6, v10, 56, 1);
        *(_WORD *)&buf[22] = 2112;
        v52 = v41;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to add HomePod sensor accessory: %@ - %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v40, "cancelPairingWithAccessoryDescription:error:", objc_getProperty(v6, v11, 56, 1), v41);
      -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v6, 0);
      objc_setProperty_atomic(v6, v12, 0, 56);
      objc_msgSend(objc_getProperty(v6, v13, 64, 1), "saveSensorUUID:", 0);
      objc_initWeak(location, v6);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __73__HMDAppleMediaAccessorySensorManager__handleLocalAddCompletedWithError___block_invoke;
      v52 = &unk_1E89B5420;
      objc_copyWeak(v53, location);
      -[HMDAppleMediaAccessorySensorManager _resetWithCompletion:](v6, buf);
      objc_destroyWeak(v53);
      objc_destroyWeak(location);
      v14 = 7;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sensorAccessoryUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully added HomePod sensor accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      objc_setProperty_atomic(v6, v17, 0, 56);
      v19 = objc_getProperty(v6, v18, 64, 1);
      objc_msgSend(v6, "sensorAccessoryUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "saveSensorUUID:", v20);

      v22 = objc_getProperty(v6, v21, 72, 1);
      dispatch_assert_queue_V2(v22);
      os_unfair_lock_lock_with_options();
      v23 = *((unsigned __int8 *)v6 + 16);
      os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
      if (v23)
      {
        objc_msgSend(v6, "sensorAccessoryUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = objc_loadWeakRetained(v4);
          objc_msgSend(v25, "accessoryWithUUID:forAppleMediaAccessorySensorManager:", v24, v6);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;
          v38 = v27;

          v28 = v38;
          if (v38)
          {
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            objc_msgSend(v38, "services");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, buf, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v47;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v47 != v31)
                    objc_enumerationMutation(v29);
                  v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
                  v42 = 0u;
                  v43 = 0u;
                  v44 = 0u;
                  v45 = 0u;
                  objc_msgSend(v33, "characteristics");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, location, 16);
                  if (v35)
                  {
                    v36 = *(_QWORD *)v43;
                    do
                    {
                      for (j = 0; j != v35; ++j)
                      {
                        if (*(_QWORD *)v43 != v36)
                          objc_enumerationMutation(v34);
                        -[HMDAppleMediaAccessorySensorManager _checkIfCharacteristicsUpdateServiceName:sensorUUID:]((uint64_t)v6, *(void **)(*((_QWORD *)&v42 + 1) + 8 * j), v24);
                      }
                      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, location, 16);
                    }
                    while (v35);
                  }

                }
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, buf, 16);
              }
              while (v30);
            }

            v28 = v38;
          }

        }
      }
      os_unfair_lock_lock_with_options();
      *((_BYTE *)v6 + 12) = 0;
      v6[4] = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
      v14 = 0;
    }
    objc_msgSend(v40, "stopDiscoveringForUnpairedAccessoriesWithLinkType:", 1);
    -[HMDAppleMediaAccessorySensorManager logPairingSuccess:error:setupFailureReason:]((uint64_t)v6, v41 == 0, v41, v14);

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
    v4 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v3;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

void __73__HMDAppleMediaAccessorySensorManager__handleLocalAddCompletedWithError___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *Property;
  void *v11;
  __int128 v12;
  void (*v13)(uint64_t, const char *);
  void *v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HMDAppleMediaAccessorySensorManager setIsCurrentlyPairing:]((uint64_t)WeakRetained);
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = WeakRetained;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = 138543362;
      *(_QWORD *)((char *)&v12 + 4) = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Reset HomePod sensor after failed pairing", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    if (v5)
    {
      Property = objc_getProperty(v5, v9, 72, 1);
      *(_QWORD *)&v12 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v12 + 1) = 3221225472;
      v13 = __60__HMDAppleMediaAccessorySensorManager_scheduleRetryIfNeeded__block_invoke;
      v14 = &unk_1E89C2730;
      v15 = v5;
      dispatch_async(Property, &v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = 138543362;
      *(_QWORD *)((char *)&v12 + 4) = v11;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to reset HomePod sensor due to xpc client error", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
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

  v39 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  v5 = a3;
  Property = objc_getProperty((id)a1, v6, 72, 1);
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
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB8968]) & 1) == 0)
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
    v20 = objc_getProperty((id)a1, v19, 72, 1);
    dispatch_assert_queue_V2(v20);
    os_unfair_lock_lock_with_options();
    v21 = *(void **)(a1 + 88);
    objc_msgSend(v17, "instanceID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = objc_msgSend(v21, "containsObject:", v22);

    if ((v21 & 1) != 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    else
    {
      v23 = *(void **)(a1 + 88);
      objc_msgSend(v17, "instanceID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      v25 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Renaming service %@ on accessory %@ to %@ after sensor pairing", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v25);
      WeakRetained = objc_loadWeakRetained(v26 + 6);
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

  v22[3] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
    if (WeakRetained)
    {
      os_unfair_lock_lock_with_options();
      if ((*(_BYTE *)(v2 + 15) & 1) != 0 || (v5 = *(char **)(v2 + 80), (unint64_t)v5 >= 0x32))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
      }
      else
      {
        *(_QWORD *)(v2 + 80) = v5 + 1;
        *(_BYTE *)(v2 + 15) = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
        if ((unint64_t)v5 >= objc_msgSend(&unk_1E8B321A8, "count"))
          v5 = (char *)(objc_msgSend(&unk_1E8B321A8, "count") - 1);
        objc_msgSend(&unk_1E8B321A8, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1D17BA0A0]();
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
          _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Will retry (# %ld) HomePod sensor pairing after %ld sec", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v7);
        objc_initWeak(&location, v8);
        objc_msgSend(v6, "doubleValue");
        v12 = v11;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __61__HMDAppleMediaAccessorySensorManager__scheduleRetryIfNeeded__block_invoke;
        v21 = &unk_1E89BCF60;
        objc_copyWeak(v22, &location);
        v22[1] = v5;
        v14 = objc_getProperty(v8, v13, 72, 1);
        objc_msgSend(WeakRetained, "performAfterDelay:block:queue:", buf, v14, v12);

        objc_destroyWeak(v22);
        objc_destroyWeak(&location);

      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = (id)v2;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot schedule retry due to nil data source", buf, 0xCu);

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

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    *((_BYTE *)WeakRetained + 15) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    v3 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Performing sensor paring retry (# %ld)", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](v4);
  }

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

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    v4 = *(unsigned __int8 *)(v2 + 12);
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
    if (v4)
    {
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      v6 = (id)v2;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not going to restart ADK", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
    }
    else
    {
      objc_initWeak(&location, (id)v2);
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v11 = __68__HMDAppleMediaAccessorySensorManager__startADKAndCheckPairingState__block_invoke;
      v12 = &unk_1E89B5420;
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

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2 && WeakRetained)
  {
    -[HMDAppleMediaAccessorySensorManager checkPairingStateAndStartADKIfUnpaired:](WeakRetained, 0);
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = v4;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Starting the HomePod sensor manager to check pairing failed", (uint8_t *)&v9, 0xCu);

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
  const char *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    Property = objc_getProperty((id)a1, v3, 72, 1);
    dispatch_assert_queue_V2(Property);
    os_unfair_lock_lock_with_options();
    v6 = *(unsigned __int8 *)(a1 + 12);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v6)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = (id)a1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Already in the process of pairing, not starting adk again", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      objc_msgSend(objc_getProperty((id)a1, v7, 40, 1), "startWithCompletion:", v4);
    }
  }

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

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v12, v13, v11, (uint8_t *)&v16, v14);

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

uint64_t __83__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessories_completion___block_invoke_27(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removed HomePod sensor accessories", (uint8_t *)&v7, 0xCu);

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

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting sensor uuid after sensor removal", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)v3, 0);
  if (v3)
    Property = objc_getProperty(v3, v6, 64, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke_28;
  v8[3] = &unk_1E89C2350;
  v8[4] = v3;
  objc_msgSend(Property, "saveSensorUUID:completion:", 0, v8);

}

void __79__HMDAppleMediaAccessorySensorManager__removeExistingSensorAccessoriesAndPair___block_invoke_28(uint64_t a1, const char *a2)
{
  uint64_t v2;
  NSObject *Property;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HMDAppleMediaAccessorySensorManager_resetSensorPairingAndPair__block_invoke;
    block[3] = &unk_1E89C2730;
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

  v11 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3);
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch sensor status from adk", (uint8_t *)&v9, 0xCu);

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

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    Property = objc_getProperty(v1, v2, 72, 1);
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
    Property = objc_getProperty(v3, a2, 72, 1);
  else
    Property = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_2;
  v7[3] = &unk_1E89B84C8;
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

  v13[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v2 = *(void **)(a1 + 40);
    v13[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_6;
    v10[3] = &unk_1E89C2730;
    v4 = &v11;
    v11 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v2, v3, v10);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
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
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_7;
    v8[3] = &unk_1E89C2730;
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

  v13[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v2 = *(void **)(a1 + 40);
    v13[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_3;
    v10[3] = &unk_1E89C2730;
    v4 = &v11;
    v11 = *(id *)(a1 + 32);
    -[HMDAppleMediaAccessorySensorManager _removeExistingSensorAccessories:completion:](v2, v3, v10);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
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
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__HMDAppleMediaAccessorySensorManager_handleErrorCaseTestMessage___block_invoke_4;
    v8[3] = &unk_1E89C2730;
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

uint64_t __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_2;
  v4[3] = &unk_1E89C02B8;
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

  v12 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a2)
  {
    Property = *(NSObject **)(a1 + 32);
    if (Property)
    {
      Property = objc_getProperty(Property, a2, 72, 1);
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v4 = 0;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__HMDAppleMediaAccessorySensorManager_configureWithDataSource_hpsXPCClient_dataStore___block_invoke_3;
    block[3] = &unk_1E89C2730;
    block[4] = v4;
    dispatch_async(Property, block);
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with failed migration", buf, 0xCu);

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

  v19[2] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 32);
  if (v2)
  {
    Property = objc_getProperty(*(id *)(a1 + 32), a2, 72, 1);
    dispatch_assert_queue_V2(Property);
    WeakRetained = objc_loadWeakRetained(v2 + 6);
    if (WeakRetained)
    {
      objc_getProperty(v2, v4, 40, 1);
      if ((objc_msgSend((id)objc_opt_class(), "supportSensory") & 1) != 0)
      {
        objc_initWeak(&location, v2);
        objc_initWeak(&v13, WeakRetained);
        v7 = objc_getProperty(v2, v6, 64, 1);
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v16 = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke;
        v17 = &unk_1E89B53D0;
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
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = v2;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Cannot start HomePod sensor manager as device does not support sensors", (uint8_t *)&buf, 0xCu);

      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = v2;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with nil data source", (uint8_t *)&buf, 0xCu);

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
  id v9;
  NSObject *v10;
  void *v11;
  SEL v12;
  id Property;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (id *)(a1 + 40);
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  -[HMDAppleMediaAccessorySensorManager setSensorAccessoryUUID:]((uint64_t)WeakRetained, v3);
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  if (v7 && WeakRetained)
  {
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Local HomePod paired sensor UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    Property = objc_getProperty(v9, v12, 72, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_8;
    block[3] = &unk_1E89BF2A0;
    block[4] = v9;
    v14 = Property;
    objc_copyWeak(&v18, v4);
    objc_copyWeak(&v19, v6);
    dispatch_async(v14, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
  }
  else
  {
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot continue starting HomePod sensor manager with nil data source", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__HMDAppleMediaAccessorySensorManager__start__block_invoke_2;
  v3[3] = &unk_1E89B53A8;
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

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 && WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = WeakRetained;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v25 = 138543362;
        *(_QWORD *)&v25[4] = v9;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Starting the HomePod sensor manager failed", v25, 0xCu);

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
      v18 = *MEMORY[0x1E0CB82A8];
      *(_QWORD *)v25 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "registerForMessage:receiver:policies:selector:", v18, WeakRetained, v19, sel_handleErrorCaseTestMessage_);

    }
    -[HMDAppleMediaAccessorySensorManager cleanUpExistingAccessoriesAndStartADKIfReady](WeakRetained, v20);
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = WeakRetained;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 138543362;
      *(_QWORD *)&v25[4] = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot start HomePod sensor manager with nil data source or nil self", v25, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t76 != -1)
    dispatch_once(&logCategory__hmf_once_t76, &__block_literal_global_123231);
  return (id)logCategory__hmf_once_v77;
}

void __50__HMDAppleMediaAccessorySensorManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v77;
  logCategory__hmf_once_v77 = v0;

}

@end
