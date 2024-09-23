@implementation HMDCompositeSettingsController

- (HMDCompositeSettingsController)initWithDatabaseAdapter:(id)a3 model:(Class)a4 homeUUID:(id)a5 ownerUUID:(id)a6 settingKeyPathBlockList:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMDCompositeSettingsController *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDCompositeSettingsController initWithDatabaseAdapter:model:homeUUID:ownerUUID:logEventSubmitter:settingKeyPathBlockList:](self, "initWithDatabaseAdapter:model:homeUUID:ownerUUID:logEventSubmitter:settingKeyPathBlockList:", v15, a4, v14, v13, v16, v12);

  return v17;
}

- (HMDCompositeSettingsController)initWithDatabaseAdapter:(id)a3 model:(Class)a4 homeUUID:(id)a5 ownerUUID:(id)a6 logEventSubmitter:(id)a7 settingKeyPathBlockList:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDCompositeSettingsController *v18;
  HMDCompositeSettingsController *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDCompositeSettingsController;
  v18 = -[HMDCompositeSettingsController init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_lock._os_unfair_lock_opaque = 0;
    v18->_configured = 0;
    objc_storeStrong((id *)&v18->_modelClass, a4);
    objc_storeStrong((id *)&v19->_databaseAdapter, a3);
    objc_storeStrong((id *)&v19->_uuid, a6);
    objc_storeStrong((id *)&v19->_homeUUID, a5);
    objc_storeStrong((id *)&v19->_logEventSubmitter, a7);
    objc_storeStrong((id *)&v19->_settingKeyPathBlockList, a8);
  }

  return v19;
}

- (void)start
{
  HMDCompositeSettingsController *v2;

  v2 = self;
  if (self)
    self = (HMDCompositeSettingsController *)objc_getProperty(self, a2, 64, 1);
  -[HMDCompositeSettingsController startWithDelegate:](self, "startWithDelegate:", v2);
}

- (BOOL)configured
{
  HMDCompositeSettingsController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_configured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setConfigured:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_configured = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_createSettingsFromModel:(id)a3
{
  const char *v4;
  id Property;
  const char *v6;
  NSObject *v7;
  SEL v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDCompositeSettingsController *v17;
  void *v18;
  HMDCompositeSettingsController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDCompositeSettingsController *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  SEL v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDCompositeSettingsController *v44;
  NSObject *v45;
  void *v46;
  const char *v47;
  void *v48;
  BOOL v49;
  const char *v50;
  void *v51;
  const char *v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  id v57;
  _QWORD block[5];
  _BYTE v59[24];
  void *v60;
  id v61;
  HMDCompositeSettingsController *v62;
  uint8_t buf[32];
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 64, 1);
  else
    Property = 0;
  objc_msgSend(Property, "rawDatabase");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    if (self)
    {
      objc_msgSend(objc_getProperty(self, v6, 64, 1), "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v7);

      v9 = objc_getProperty(self, v8, 24, 1);
    }
    else
    {
      objc_msgSend(0, "queue");
      v55 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v55);

      v9 = 0;
    }
    v10 = v9;
    objc_msgSend(v57, "keyPathsToSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    v14 = v13;
    v15 = MEMORY[0x1E0C809B0];
    if (self)
    {
      v16 = (void *)objc_msgSend(v13, "mutableCopy");
      *(_QWORD *)v59 = v15;
      *(_QWORD *)&v59[8] = 3221225472;
      *(_QWORD *)&v59[16] = __74__HMDCompositeSettingsController__addedOrUpdatedSettingsFrom_newSettings___block_invoke;
      v60 = &unk_1E89AF700;
      v61 = v12;
      v17 = v16;
      v62 = v17;
      v18 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v14, "na_each:", v59));
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v17;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Settings changed %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v22 = (void *)-[HMDCompositeSettingsController copy](v17, "copy");

    }
    else
    {
      v22 = 0;
    }

    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v59 = 138543618;
      *(_QWORD *)&v59[4] = v26;
      *(_WORD *)&v59[12] = 2112;
      *(_QWORD *)&v59[14] = v22;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Updated Settings %@", v59, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    if (objc_msgSend(v22, "count"))
    {
      v27 = v22;
      v28 = v27;
      if (self)
      {
        v29 = (void *)objc_msgSend(v27, "mutableCopy");
        v31 = objc_getProperty(v24, v30, 56, 1);
        *(_QWORD *)v59 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v59[8] = 3221225472;
        *(_QWORD *)&v59[16] = __62__HMDCompositeSettingsController_filteredSettingsForSettings___block_invoke;
        v60 = &unk_1E89BDDC0;
        v32 = v29;
        v61 = v32;
        v62 = v24;
        objc_msgSend(v31, "na_each:", v59);
        v33 = v32;

        if (objc_msgSend(v33, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = 0u;
          v65 = 0u;
          memset(buf, 0, sizeof(buf));
          v28 = v33;
          v36 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", buf, v59, 16);
          if (v36)
          {
            v37 = **(_QWORD **)&buf[16];
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (**(_QWORD **)&buf[16] != v37)
                  objc_enumerationMutation(v28);
                v39 = *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * i);
                objc_msgSend(objc_getProperty(v24, v35, 32, 1), "objectForKeyedSubscript:", v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setObject:forKeyedSubscript:", v40, v39);

              }
              v36 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", buf, v59, 16);
            }
            while (v36);
          }

          -[HMDCompositeSettingsController delegate](v24, "delegate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v34, "copy");
          objc_msgSend(v41, "settingsController:didUpdateSettings:metadata:", v24, v28, v42);

        }
        else
        {
          v28 = v33;
        }
      }

    }
    objc_msgSend(v57, "keyPathsToSettings");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      objc_setProperty_atomic_copy(v24, v47, v48, 24);
    v49 = self == 0;

    objc_msgSend(v57, "keyPathsToSettingMetadata");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
      objc_setProperty_atomic_copy(v24, v50, v51, 32);

    os_unfair_lock_lock_with_options();
    if (!v24->_configured)
    {
      v24->_configured = 1;
      v53 = objc_getProperty(v24, v52, 64, 1);
      objc_msgSend(v53, "queue");
      v54 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__HMDCompositeSettingsController__createSettingsFromModel___block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = v24;
      dispatch_async(v54, block);

    }
    os_unfair_lock_unlock(&v24->_lock);

  }
  else
  {
    v43 = (void *)MEMORY[0x1D17BA0A0]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v59 = 138543362;
      *(_QWORD *)&v59[4] = v46;
      _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@Nil database (_createSettingsFromModel)", v59, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
  }

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCompositeSettingsController homeUUID](self, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsController uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)fetchSettingForKeyPath:(id)a3 callerVersion:(id)a4 callerPrivilege:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  void (**v14)(_QWORD, _QWORD);
  id Property;
  const char *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  HMDCompositeSettingsController *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDCompositeSettingOperationResult *v25;
  _QWORD block[5];
  id v27;
  id v28;
  void (**v29)(_QWORD, _QWORD);
  unint64_t v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HMDCompositeSettingsController _metricSubmittingSingleFetchCompletionFromCompletion:](self, v12);
  v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v13, 64, 1);
  else
    Property = 0;
  objc_msgSend(Property, "rawDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (self)
      v18 = objc_getProperty(self, v16, 64, 1);
    else
      v18 = 0;
    objc_msgSend(v18, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__HMDCompositeSettingsController_fetchSettingForKeyPath_callerVersion_callerPrivilege_completion___block_invoke;
    block[3] = &unk_1E89BB0A0;
    block[4] = self;
    v27 = v10;
    v28 = v11;
    v30 = a5;
    v29 = v14;
    dispatch_async(v19, block);

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Nil database (fetchSettingForKeyPath)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v10, 0, 0, v24);
    ((void (**)(_QWORD, HMDCompositeSettingOperationResult *))v14)[2](v14, v25);

  }
}

- (void)fetchSettingsForKeyPaths:(id)a3 callerVersion:(id)a4 callerPrivilege:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  id v13;
  id Property;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(void *, _QWORD);
  const char *v20;
  void *v21;
  HMDCompositeSettingsController *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  HMDCompositeSettingsController *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD block[4];
  id v35;
  HMDCompositeSettingsController *v36;
  id v37;
  void (**v38)(void *, _QWORD);
  unint64_t v39;
  _QWORD v40[4];
  id v41;
  __int128 aBlock;
  void (*v43)(_QWORD *, void *);
  void *v44;
  HMDCompositeSettingsController *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v13 = a6;
  if (self)
    Property = objc_getProperty(self, v12, 64, 1);
  else
    Property = 0;
  objc_msgSend(Property, "rawDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  v17 = MEMORY[0x1E0C809B0];
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0D33490], "currentTime");
    *(_QWORD *)&aBlock = v17;
    *((_QWORD *)&aBlock + 1) = 3221225472;
    v43 = __89__HMDCompositeSettingsController__metricSubmittingMultipleFetchCompletionFromCompletion___block_invoke;
    v44 = &unk_1E89AF6D8;
    v45 = self;
    v47 = v18;
    v46 = v16;
    v19 = (void (**)(void *, _QWORD))_Block_copy(&aBlock);

  }
  else
  {
    v19 = 0;
  }

  if (v15)
  {
    if (!objc_msgSend(v10, "count"))
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = v21;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(aBlock) = 138543362;
        *(_QWORD *)((char *)&aBlock + 4) = v24;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Empty keypaths array", (uint8_t *)&aBlock, 0xCu);

        v21 = v33;
      }

      objc_autoreleasePoolPop(v21);
      v19[2](v19, MEMORY[0x1E0C9AA60]);
      v17 = MEMORY[0x1E0C809B0];
    }
    if (self)
      v25 = objc_getProperty(self, v20, 64, 1);
    else
      v25 = 0;
    objc_msgSend(v25, "queue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_44;
    block[3] = &unk_1E89BB0A0;
    v35 = v10;
    v36 = self;
    v37 = v11;
    v39 = a5;
    v38 = v19;
    dispatch_async(v26, block);

    v27 = v35;
  }
  else
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(aBlock) = 138543362;
      *(_QWORD *)((char *)&aBlock + 4) = v31;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Nil database (fetchSettingsForKeyPaths)", (uint8_t *)&aBlock, 0xCu);

      v17 = MEMORY[0x1E0C809B0];
    }

    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v40[0] = v17;
    v40[1] = 3221225472;
    v40[2] = __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke;
    v40[3] = &unk_1E89BE670;
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v27 = v41;
    objc_msgSend(v10, "na_map:", v40);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void *, void *))v19)[2](v19, v32);

  }
}

- (id)fetchSynchronousSettingsForKeyPaths:(id)a3 callerVersion:(id)a4 callerPrivilege:(unint64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  void *v11;
  id Property;
  const char *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  HMDCompositeSettingsController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v10, 64, 1);
  else
    Property = 0;
  objc_msgSend(Property, "rawDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (self)
      v15 = objc_getProperty(self, v13, 64, 1);
    else
      v15 = 0;
    objc_msgSend(v15, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v16);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke_2;
    v27[3] = &unk_1E89AF770;
    v27[4] = self;
    v28 = v9;
    v30 = a5;
    v17 = v11;
    v29 = v17;
    objc_msgSend(v8, "na_each:", v27);

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Nil database (fetchSynchronousSettingsForKeyPaths)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke;
    v31[3] = &unk_1E89BE670;
    v32 = v22;
    v23 = v22;
    objc_msgSend(v8, "na_map:", v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v24, "mutableCopy");

  }
  v25 = (void *)objc_msgSend(v17, "copy");

  return v25;
}

- (void)updateSettingForKeyPath:(id)a3 value:(id)a4 callerVersion:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  void (**v15)(_QWORD, _QWORD);
  id Property;
  const char *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  HMDCompositeSettingsController *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDCompositeSettingOperationResult *v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  void (**v31)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDCompositeSettingsController _metricSubmittingSingleUpdateCompletionFromCompletion:](self, v13);
  v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v14, 64, 1);
  else
    Property = 0;
  objc_msgSend(Property, "rawDatabase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (self)
      v19 = objc_getProperty(self, v17, 64, 1);
    else
      v19 = 0;
    objc_msgSend(v19, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__HMDCompositeSettingsController_updateSettingForKeyPath_value_callerVersion_completion___block_invoke;
    block[3] = &unk_1E89C0598;
    block[4] = self;
    v28 = v10;
    v29 = v11;
    v30 = v12;
    v31 = v15;
    dispatch_async(v20, block);

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Nil database (updateSettingForKeyPath)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v10, 0, 0, v25);
    ((void (**)(_QWORD, HMDCompositeSettingOperationResult *))v15)[2](v15, v26);

  }
}

- (void)updateSettingsForKeyPaths:(id)a3 callerVersion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  const char *v12;
  id Property;
  uint64_t v14;
  const char *v15;
  HMDCompositeSettingOperationResult *v16;
  id v17;
  NSObject *v18;
  void *v19;
  HMDCompositeSettingsController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDCompositeSettingsController *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDCompositeSettingOperationResult *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  void (**v32)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCompositeSettingsController _metricSubmittingSingleUpdateCompletionFromCompletion:](self, v10);
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    if (self)
      Property = objc_getProperty(self, v12, 64, 1);
    else
      Property = 0;
    objc_msgSend(Property, "rawDatabase");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v16 = (HMDCompositeSettingOperationResult *)v14;
      if (self)
        v17 = objc_getProperty(self, v15, 64, 1);
      else
        v17 = 0;
      objc_msgSend(v17, "queue");
      v18 = objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __85__HMDCompositeSettingsController_updateSettingsForKeyPaths_callerVersion_completion___block_invoke;
      v29[3] = &unk_1E89C0448;
      v29[4] = self;
      v30 = v8;
      v31 = v9;
      v32 = v11;
      dispatch_async(v18, v29);

    }
    else
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v26;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Nil database (updateSettingsForKeyPaths)", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", CFSTR("onboardingSettings"), 0, 0, v27);
      ((void (**)(_QWORD, HMDCompositeSettingOperationResult *))v11)[2](v11, v28);

      v16 = 0;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@settings is empty", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v16 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", CFSTR("onboardingSettings"), 0, 0, 0);
    ((void (**)(_QWORD, HMDCompositeSettingOperationResult *))v11)[2](v11, v16);
  }

}

- (id)_settingFromSetting:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  HMDCompositeStringSetting *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  HMDCompositeSettingsController *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  HMDCompositeBoolSetting *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  HMDCompositeStringSetting *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  HMDCompositeSettingsController *v66;
  NSObject *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  HMDCompositeSettingsController *v76;
  NSObject *v77;
  void *v78;
  HMDCompositeNumberSetting *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  HMDCompositeNumberSetting *v89;
  void *v90;
  void *v91;
  HMDCompositeSettingsController *v92;
  NSObject *v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  HMDCompositeSettingsController *v102;
  NSObject *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  HMDCompositeSettingsController *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  HMDCompositeSettingsController *v125;
  NSObject *v126;
  void *v127;
  void *v129;
  void *v130;
  HMDCompositeLanguageSetting *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  HMDCompositeLanguageSetting *v136;
  void *v137;
  void *v138;
  id *v139;
  id *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  id v146;
  uint8_t buf[4];
  void *v148;
  __int16 v149;
  id v150;
  __int16 v151;
  id v152;
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v11)
  {
    v140 = a5;
    v143 = v9;
    v22 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    v146 = v24;
    if (v24)
    {
      v25 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
      v27 = v26;

      if (v27)
      {
        v28 = [HMDCompositeStringSetting alloc];
        objc_msgSend(v27, "stringValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "readVersion");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "versionString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "writeVersion");
        v32 = v8;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "versionString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[HMDCompositeStringSetting initWithValue:readVersion:writeVersion:](v28, "initWithValue:readVersion:writeVersion:", v29, v31, v34);

        v8 = v32;
        v11 = 0;

        v13 = 0;
        v35 = v27;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 19, CFSTR("Invalid string setting value"), 0, CFSTR("Setting type is String, please pass a String value"));
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v65 = (void *)MEMORY[0x1D17BA0A0]();
        v66 = self;
        HMFGetOSLogHandle();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v148 = v68;
          v149 = 2112;
          v150 = v13;
          _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v65);
        if (v140)
        {
          v13 = objc_retainAutorelease(v13);
          v35 = 0;
          self = 0;
          *v140 = v13;
        }
        else
        {
          v35 = 0;
          self = 0;
        }
      }
    }
    else
    {
      v41 = v22;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v42 = v41;
      else
        v42 = 0;
      v43 = v42;

      if (v43)
      {
        v44 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v45 = v44;
        else
          v45 = 0;
        v46 = v45;

        if (v46)
        {
          v47 = [HMDCompositeBoolSetting alloc];
          v48 = objc_msgSend(v46, "BOOLValue");
          v49 = v43;
          objc_msgSend(v43, "readVersion");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "versionString");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "writeVersion");
          v52 = v8;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "versionString");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v48;
          v35 = v49;
          self = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:](v47, "initWithValue:readVersion:writeVersion:", v55, v51, v54);

          v8 = v52;
          v11 = 0;

          v13 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 19, CFSTR("Invalid BOOL setting value"), 0, CFSTR("Setting type is Bool, please pass a Bool value"));
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v91 = (void *)MEMORY[0x1D17BA0A0]();
          v92 = self;
          HMFGetOSLogHandle();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v148 = v94;
            v149 = 2112;
            v150 = v13;
            _os_log_impl(&dword_1CD062000, v93, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v91);
          v35 = v43;
          if (v140)
          {
            v13 = objc_retainAutorelease(v13);
            v46 = 0;
            self = 0;
            *v140 = v13;
          }
          else
          {
            v46 = 0;
            self = 0;
          }
        }
      }
      else
      {
        v69 = v41;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v70 = v69;
        else
          v70 = 0;
        v71 = v70;

        v135 = v71;
        if (v71)
        {
          v72 = v9;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v73 = v72;
          else
            v73 = 0;
          v74 = v73;

          v13 = 0;
          if (!v74)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 19, CFSTR("Invalid Number setting value"), 0, CFSTR("Setting type is Number, please pass a Number value"));
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v75 = (void *)MEMORY[0x1D17BA0A0]();
            v76 = self;
            HMFGetOSLogHandle();
            v77 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v148 = v78;
              v149 = 2112;
              v150 = v13;
              _os_log_impl(&dword_1CD062000, v77, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v75);
            if (v140)
            {
              v13 = objc_retainAutorelease(v13);
              *v140 = v13;
            }
          }
          v79 = [HMDCompositeNumberSetting alloc];
          objc_msgSend(v74, "numberValue");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "readVersion");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "versionString");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "writeVersion");
          v83 = v8;
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "versionString");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v79, "initWithValue:readVersion:writeVersion:", v80, v82, v85);

          v8 = v83;
          v11 = 0;
          v9 = v143;
        }
        else
        {
          v95 = v69;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v96 = v95;
          else
            v96 = 0;
          v97 = v96;

          if (v97)
          {
            v137 = v97;
            v145 = v8;
            v98 = v9;
            if (objc_msgSend(v98, "conformsToProtocol:", &unk_1EFAA0420))
              v99 = v98;
            else
              v99 = 0;
            v100 = v99;

            v13 = 0;
            if (!v100)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 19, CFSTR("Invalid Language setting value"), 0, CFSTR("Setting type is Language, please pass a Language value"));
              v13 = (id)objc_claimAutoreleasedReturnValue();
              v101 = (void *)MEMORY[0x1D17BA0A0]();
              v102 = self;
              HMFGetOSLogHandle();
              v103 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v148 = v104;
                v149 = 2112;
                v150 = v13;
                _os_log_impl(&dword_1CD062000, v103, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v101);
              if (v140)
              {
                v13 = objc_retainAutorelease(v13);
                *v140 = v13;
              }
            }
            v131 = [HMDCompositeLanguageSetting alloc];
            objc_msgSend(v100, "inputLanguageCode");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "outputVoiceLanguageCode");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "outputVoiceGenderCode");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "voiceName");
            v106 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "readVersion");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "versionString");
            v132 = v100;
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "writeVersion");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "versionString");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = (void *)v106;
            self = -[HMDCompositeLanguageSetting initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:](v131, "initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:", v141, v129, v105, v106, v107, v109);

            v74 = v137;
            v8 = v145;
          }
          else
          {
            v118 = v8;
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 19, CFSTR("trying to create an invalid setting from value"), 0, 0);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v119 = (void *)MEMORY[0x1D17BA0A0]();
            v120 = self;
            HMFGetOSLogHandle();
            v121 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v148 = v122;
              v149 = 2112;
              v150 = v13;
              _os_log_impl(&dword_1CD062000, v121, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v119);
            if (v140)
            {
              v13 = objc_retainAutorelease(v13);
              v74 = 0;
              self = 0;
              *v140 = v13;
            }
            else
            {
              v74 = 0;
              self = 0;
            }
            v8 = v118;
          }
        }

        v35 = 0;
        v46 = v135;
      }

    }
    goto LABEL_106;
  }
  v144 = v8;
  v146 = v8;
  v12 = v11;
  v13 = v12;
  if (!self)
    goto LABEL_107;
  v14 = objc_msgSend(v12, "type");
  if ((unint64_t)(v14 - 1) >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unable to derived setting"), CFSTR("unknown version type"), 0);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1D17BA0A0]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      HMSettingVersionValueTypeAsString();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v148 = v39;
      v149 = 2112;
      v150 = v40;
      v151 = 2112;
      v152 = v35;
      _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive setting due to unknown version value type: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v36);
    if (a5)
    {
      v35 = objc_retainAutorelease(v35);
      self = 0;
      *a5 = v35;
    }
    else
    {
      self = 0;
    }
    goto LABEL_105;
  }
  v139 = a5;
  objc_msgSend(v146, "readVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "versionString");
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v146, "writeVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "versionString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == 2)
  {
    objc_msgSend(v13, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "versionString");
    v56 = objc_claimAutoreleasedReturnValue();
    v21 = v18;
    v18 = (void *)v56;
  }
  else
  {
    if (v14 != 1)
    {
      v138 = (void *)v16;
      goto LABEL_36;
    }
    objc_msgSend(v13, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "versionString");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v16;
    v16 = v20;
  }
  v138 = (void *)v16;

LABEL_36:
  v57 = v146;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v58 = v57;
  else
    v58 = 0;
  v59 = v58;

  if (v59)
  {
    v60 = [HMDCompositeStringSetting alloc];
    objc_msgSend(v59, "stringValue");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v138;
    self = -[HMDCompositeStringSetting initWithValue:readVersion:writeVersion:](v60, "initWithValue:readVersion:writeVersion:", v61, v138, v18);

  }
  else
  {
    v62 = v57;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v63 = v62;
    else
      v63 = 0;
    v64 = v63;

    if (v64)
    {
      v35 = v138;
      self = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", objc_msgSend(v64, "BOOLValue"), v138, v18);
    }
    else
    {
      v86 = v62;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v87 = v86;
      else
        v87 = 0;
      v88 = v87;

      if (v88)
      {
        v89 = [HMDCompositeNumberSetting alloc];
        objc_msgSend(v88, "numberValue");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v138;
        self = -[HMDCompositeNumberSetting initWithValue:readVersion:writeVersion:](v89, "initWithValue:readVersion:writeVersion:", v90, v138, v18);

      }
      else
      {
        v111 = v86;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v112 = v111;
        else
          v112 = 0;
        v113 = v112;

        if (v113)
        {
          v136 = [HMDCompositeLanguageSetting alloc];
          objc_msgSend(v113, "inputLanguageCode");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "outputVoiceLanguageCode");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "outputVoiceGenderCode");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "voiceName");
          v115 = v113;
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v138;
          self = -[HMDCompositeLanguageSetting initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:](v136, "initWithInputLanguage:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:readVersion:writeVersion:", v142, v133, v114, v116, v138, v18);

          v117 = v115;
          v88 = 0;
        }
        else
        {
          v134 = v111;
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 19, CFSTR("Unable to derived setting"), CFSTR("unknown setting type"), 0);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = (void *)MEMORY[0x1D17BA0A0]();
          v125 = self;
          HMFGetOSLogHandle();
          v126 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v148 = v127;
            v149 = 2112;
            v150 = v134;
            v151 = 2112;
            v152 = v123;
            _os_log_impl(&dword_1CD062000, v126, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive setting due to unknown setting object type: %@ error: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v124);
          v35 = v138;
          if (v139)
            *v139 = objc_retainAutorelease(v123);

          self = 0;
          v117 = 0;
          v88 = 0;
        }

      }
      v64 = 0;
    }

  }
LABEL_105:
  v8 = v144;
LABEL_106:

LABEL_107:
  return self;
}

- (void)database:(id)a3 didProcessCreationForModel:(id)a4
{
  -[HMDCompositeSettingsController _handleModelCreationOrUpdate:](self, a4);
}

- (void)database:(id)a3 didProcessUpdateForModel:(id)a4
{
  -[HMDCompositeSettingsController _handleModelCreationOrUpdate:](self, a4);
}

- (void)database:(id)a3 didProcessDeletionForModel:(id)a4
{
  const char *v5;
  id v6;
  id v7;
  void *v8;
  HMDCompositeSettingsController *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  SEL v13;
  id v14;
  void *v15;
  void *v16;
  SEL v17;
  SEL v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self)
  {
    v7 = objc_getProperty(self, v5, 64, 1);
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v12;
        v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Processing  model deletion, model:%@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v14 = objc_getProperty(v9, v13, 64, 1);
      -[HMDCompositeSettingsController uuid](v9, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stopObservingModelWithID:", v15);

      v16 = (void *)MEMORY[0x1E0C9AA70];
      objc_setProperty_atomic_copy(v9, v17, MEMORY[0x1E0C9AA70], 24);
      objc_setProperty_atomic_copy(v9, v18, v16, 32);
    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Nil database adapter (_handleModelDeletion)", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }
  }

}

- (void)database:(id)a3 didConfigureWithError:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  void *v9;
  HMDCompositeSettingsController *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  id v14;
  NSObject *v15;
  SEL v16;
  id v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMDCompositeSettingsController *v25;
  NSObject *v26;
  void *v27;
  SEL v28;
  id Property;
  id v30;
  void *v31;
  _BYTE v32[24];
  void *v33;
  HMDCompositeSettingsController *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v32 = 138543618;
      *(_QWORD *)&v32[4] = v12;
      *(_WORD *)&v32[12] = 2112;
      *(_QWORD *)&v32[14] = v8;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error configuring database adapter: %@", v32, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    if (self)
    {
      v14 = objc_getProperty(self, v7, 64, 1);
      if (v14)
      {
        objc_msgSend(objc_getProperty(self, v13, 64, 1), "queue");
        v15 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(v15);

        v17 = objc_getProperty(self, v16, 64, 1);
        -[HMDCompositeSettingsController uuid](self, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fetchModelWithID:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          -[HMDCompositeSettingsController emptyModelForTransaction](self, v20);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[HMDCompositeSettingsController _migrateUpdatedSettings:](self, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v32 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v32[8] = 3221225472;
        *(_QWORD *)&v32[16] = __59__HMDCompositeSettingsController__migrateAndCreateSettings__block_invoke;
        v33 = &unk_1E89C2210;
        v34 = self;
        v35 = v19;
        v22 = v19;
        objc_msgSend(v21, "addSuccessBlock:", v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v37 = v27;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Nil database adapter (_migrateAndCreateSettings)", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
        v23 = 0;
      }

      Property = objc_getProperty(self, v28, 64, 1);
    }
    else
    {
      Property = 0;
    }
    v30 = Property;
    -[HMDCompositeSettingsController uuid](self, "uuid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "startObservingModelWithID:", v31);

  }
}

- (HMDCompositeSettingsControllerDelegate)delegate
{
  return (HMDCompositeSettingsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDCompositeSettingsZoneManager)zoneManager
{
  return (HMDCompositeSettingsZoneManager *)objc_loadWeakRetained((id *)&self->_zoneManager);
}

- (void)setZoneManager:(id)a3
{
  objc_storeWeak((id *)&self->_zoneManager, a3);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_zoneManager);
  objc_storeStrong((id *)&self->_databaseAdapter, 0);
  objc_storeStrong((id *)&self->_settingKeyPathBlockList, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)emptyModelForTransaction
{
  id v3;
  void *v4;
  void *v5;
  SEL v6;
  void *v7;

  v3 = objc_getProperty(a1, a2, 64, 1);
  objc_msgSend(a1, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emptyModelWithID:parentModelID:modelClass:", v4, v5, objc_getProperty(a1, v6, 40, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_migrateUpdatedSettings:(void *)a1
{
  id v3;
  SEL v4;
  const char *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  SEL v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v6 = objc_getProperty(a1, v4, 64, 1);
  if (v6)
  {
    objc_msgSend(objc_getProperty(a1, v5, 64, 1), "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyPathsToSettingsForMigration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v13;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Settings to migrate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (objc_msgSend(v9, "count"))
    {
      v14 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke;
      v29[3] = &unk_1E89AF700;
      v15 = v3;
      v30 = v15;
      v31 = v11;
      objc_msgSend(v9, "na_each:", v29);
      v16 = (void *)MEMORY[0x1E0D519C0];
      v28 = v15;
      v17 = (void *)MEMORY[0x1E0D519E8];
      objc_msgSend(objc_getProperty(v11, v18, 64, 1), "queue", v14, 3221225472, __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke_29, &unk_1E89BD320, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "schedulerWithDispatchQueue:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "futureWithBlock:scheduler:", &v27, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = v8;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = a1;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Nil database adapter (_migrateUpdatedSettings)", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 0;
  }

  return v21;
}

uint64_t __59__HMDCompositeSettingsController__migrateAndCreateSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createSettingsFromModel:", *(_QWORD *)(a1 + 40));
}

void __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v7, "setSetting:forKeyPath:withError:", v6, v5, &v14);
  v8 = v14;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating setting on model: %@, setting: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);

}

void __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke_29(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  id Property;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
    Property = objc_getProperty(v5, v3, 64, 1);
  else
    Property = 0;
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke_2;
  v9[3] = &unk_1E89C2350;
  v10 = v4;
  v8 = v4;
  objc_msgSend(Property, "addModel:withOptionsLabel:completion:", v7, CFSTR("HMDCompositeSettingController Migrate UninitializedSettings"), v9);

}

void __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  }
  else
  {
    NAEmptyResult();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithResult:", v3);

  }
}

- (void)_handleModelCreationOrUpdate:(void *)a1
{
  const char *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v3, 64, 1), "rawDatabase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMDCompositeSettingsController _migrateUpdatedSettings:](a1, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __63__HMDCompositeSettingsController__handleModelCreationOrUpdate___block_invoke;
      v12[3] = &unk_1E89B8190;
      v12[4] = a1;
      v13 = v4;
      v7 = (id)objc_msgSend(v6, "addCompletionBlock:", v12);

    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = a1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Nil database (_handleModelCreationOrUpdate)", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

uint64_t __63__HMDCompositeSettingsController__handleModelCreationOrUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createSettingsFromModel:", *(_QWORD *)(a1 + 40));
}

- (id)_metricSubmittingSingleUpdateCompletionFromCompletion:(void *)a1
{
  id v3;
  uint64_t v4;
  _QWORD aBlock[5];
  id v7;
  uint64_t v8;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D33490], "currentTime");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__HMDCompositeSettingsController__metricSubmittingSingleUpdateCompletionFromCompletion___block_invoke;
    aBlock[3] = &unk_1E89B9980;
    aBlock[4] = a1;
    v8 = v4;
    v7 = v3;
    a1 = _Block_copy(aBlock);

  }
  return a1;
}

void __85__HMDCompositeSettingsController_updateSettingsForKeyPaths_callerVersion_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SEL v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  const char *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  HMDCompositeSettingOperationResult *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  int v29;
  HMDCompositeSettingOperationResult *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  HMDCompositeSettingOperationResult *v38;
  uint64_t v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  SEL v45;
  id v46;
  HMDCompositeSettingOperationResult *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  HMDCompositeSettingOperationResult *v52;
  void *v53;
  id v54;
  HMDCompositeSettingOperationResult *v55;
  id obj;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void (**v60)(id, HMDCompositeSettingOperationResult *);
  id location;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE buf[24];
  void *v70;
  HMDCompositeSettingOperationResult *v71;
  void (**v72)(id, HMDCompositeSettingOperationResult *);
  id v73[2];
  uint8_t v74[4];
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v54 = *(id *)(a1 + 40);
  v58 = v2;
  v60 = v3;
  if (!v1)
    goto LABEL_47;
  objc_msgSend(objc_getProperty(v1, v4, 64, 1), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!v54)
  {
    _HMFPreconditionFailure();
    goto LABEL_49;
  }
  if (!v58)
  {
LABEL_49:
    _HMFPreconditionFailure();
LABEL_50:
    _HMFPreconditionFailure();
  }
  if (!v60)
    goto LABEL_50;
  objc_msgSend(objc_getProperty(v1, v6, 64, 1), "rawDatabase");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    -[HMDCompositeSettingsController emptyModelForTransaction](v1, v7);
    v55 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v54;
    v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    if (!v59)
    {
      v8 = 0;
      goto LABEL_40;
    }
    v8 = 0;
    v57 = *(_QWORD *)v66;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v66 != v57)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v9);
        objc_msgSend(v10, "keyPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc_getProperty(v1, v12, 24, 1), "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 21, CFSTR("Setting has not been configured yet (no current setting)"), 0, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = (void *)MEMORY[0x1D17BA0A0]();
          v49 = v1;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v51;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v44;
            _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v48);
          v52 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v11, 0, 0, v44);
          v60[2](v60, v52);

          goto LABEL_45;
        }
        objc_msgSend(v10, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v8;
        objc_msgSend(v1, "_settingFromSetting:value:error:", v13, v14, &v64);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v64;

        if (v15)
        {
          objc_msgSend(v13, "writeVersion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isGreaterThanVersion:", v58);

          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 10, CFSTR("Write version does not meet the minimum"), 0, 0);
            v8 = (id)objc_claimAutoreleasedReturnValue();

            v20 = (void *)MEMORY[0x1D17BA0A0]();
            v21 = v1;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v23;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v8;
              _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v20);
            v24 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v11, 0, 0, v8);
            v60[2](v60, v24);
            goto LABEL_29;
          }
          objc_msgSend(objc_getProperty(v1, v19, 32, 1), "objectForKeyedSubscript:", v11);
          v30 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
          v24 = v30;
          if (v30)
          {
            -[HMDCompositeSettingOperationResult constraint](v30, "constraint");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "value");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v16;
            objc_msgSend(v31, "isValidValue:error:", v32, &v63);
            v8 = v63;

            if (v8)
            {
              v33 = (void *)MEMORY[0x1D17BA0A0]();
              v34 = v1;
              HMFGetOSLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
LABEL_27:
                HMFGetLogIdentifier();
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v37;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v8;
                _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

              }
LABEL_28:

              objc_autoreleasePoolPop(v33);
              v38 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v11, 0, 0, v8);
              v60[2](v60, v38);

LABEL_29:
              v29 = 0;
              goto LABEL_30;
            }
            v16 = 0;
          }
          v62 = v16;
          -[HMDCompositeSettingOperationResult setSetting:forKeyPath:withError:](v55, "setSetting:forKeyPath:withError:", v15, v11, &v62);
          v8 = v62;

          if (v8)
          {
            v33 = (void *)MEMORY[0x1D17BA0A0]();
            v36 = v1;
            HMFGetOSLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              goto LABEL_27;
            goto LABEL_28;
          }
          v29 = 1;
        }
        else
        {
          v25 = (void *)MEMORY[0x1D17BA0A0]();
          v26 = v1;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v28;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v16;
            _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v25);
          v24 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v11, 0, 0, v16);
          v60[2](v60, v24);
          v29 = 0;
          v8 = v16;
        }
LABEL_30:

        if (!v29)
        {
          v44 = v8;
LABEL_45:

          goto LABEL_46;
        }
        ++v9;
      }
      while (v59 != v9);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      v59 = v39;
      if (!v39)
      {
LABEL_40:

        objc_initWeak(&location, v1);
        v46 = objc_getProperty(v1, v45, 64, 1);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke;
        v70 = &unk_1E89C0650;
        objc_copyWeak(v73, &location);
        v47 = v55;
        v71 = v47;
        v72 = v60;
        v55 = v47;
        objc_msgSend(v46, "addModel:withOptionsLabel:completion:", v47, CFSTR("HMDCompositeSettingController updating settings"), buf);

        objc_destroyWeak(v73);
        objc_destroyWeak(&location);
        v44 = v8;
        goto LABEL_46;
      }
    }
  }
  v40 = (void *)MEMORY[0x1D17BA0A0]();
  v41 = v1;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v74 = 138543362;
    v75 = v43;
    _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Nil database (_updateSettingsForKeyPaths)", v74, 0xCu);

  }
  objc_autoreleasePoolPop(v40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", CFSTR("onboardingSettings"), 0, 0, v44);
  v60[2](v60, v55);
LABEL_46:

LABEL_47:
}

void __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SEL v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Finished updating models:%@ error:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    v10 = (void *)MEMORY[0x1E0D519C0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke_74;
    v16[3] = &unk_1E89AF7C0;
    v17 = v3;
    v18 = *(id *)(a1 + 40);
    v11 = (void *)MEMORY[0x1E0D519E8];
    objc_msgSend(objc_getProperty(v6, v12, 64, 1), "queue", v16[0], 3221225472, __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke_74, &unk_1E89AF7C0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "schedulerWithDispatchQueue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v10, "futureWithBlock:scheduler:", v16, v14);

  }
}

void __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  HMDCompositeSettingOperationResult *v4;

  v3 = a2;
  v4 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", CFSTR("nil"), 0, 0, *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v3, "finishWithNoResult");

}

void __88__HMDCompositeSettingsController__metricSubmittingSingleUpdateCompletionFromCompletion___block_invoke(double *a1, void *a2)
{
  const char *v3;
  id Property;
  id v5;
  HMDCompositeSettingsControllerUpdateLogEvent *v6;
  double v7;
  void *v8;
  HMDCompositeSettingsControllerUpdateLogEvent *v9;
  void *v10;
  id v11;

  v11 = a2;
  Property = (id)*((_QWORD *)a1 + 4);
  if (Property)
    Property = objc_getProperty(Property, v3, 48, 1);
  v5 = Property;
  v6 = [HMDCompositeSettingsControllerUpdateLogEvent alloc];
  v7 = a1[6];
  objc_msgSend(v11, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDCompositeSettingsControllerUpdateLogEvent initWithStartTime:keyPath:](v6, "initWithStartTime:keyPath:", v8, v7);
  objc_msgSend(v11, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitLogEvent:error:", v9, v10);

  (*(void (**)(void))(*((_QWORD *)a1 + 5) + 16))();
}

void __89__HMDCompositeSettingsController_updateSettingForKeyPath_value_callerVersion_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  void (**v7)(id, HMDCompositeSettingOperationResult *);
  const char *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  HMDCompositeSettingOperationResult *v12;
  SEL v13;
  void *v14;
  int v15;
  id v16;
  HMDCompositeSettingOperationResult *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  void *v31;
  id v32;
  HMDCompositeSettingOperationResult *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMDCompositeSettingOperationResult *v42;
  SEL v43;
  id v44;
  void *context;
  void *v46;
  id v47;
  id v48;
  id location;
  id v50;
  id v51;
  id v52;
  _BYTE buf[24];
  void *v54;
  HMDCompositeSettingOperationResult *v55;
  HMDCompositeSettingOperationResult *v56;
  id v57;
  id v58;
  void (**v59)(id, HMDCompositeSettingOperationResult *);
  id v60[3];

  v60[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  v47 = v2;
  v48 = v3;
  v7 = v4;
  if (v1)
  {
    objc_msgSend(objc_getProperty(v1, v6, 64, 1), "rawDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Nil database (_updateSettingForKeyPath)", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v5, 0, 0, v16);
      v7[2](v7, v12);
      goto LABEL_34;
    }
    objc_msgSend(objc_getProperty(v1, v8, 64, 1), "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    if (v5)
    {
      if (v47)
      {
        if (v48)
        {
          if (v7)
          {
            objc_msgSend(objc_getProperty(v1, v11, 24, 1), "objectForKeyedSubscript:", v5);
            v12 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(objc_getProperty(v1, v13, 32, 1), "objectForKeyedSubscript:", v5);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 21, CFSTR("Setting has not been configured yet (no current setting)"), 0, 0);
              v16 = (id)objc_claimAutoreleasedReturnValue();
              v26 = (void *)MEMORY[0x1D17BA0A0]();
              v27 = v1;
              HMFGetOSLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v29;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v16;
                _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v26);
              v17 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v5, 0, 0, v16);
              v7[2](v7, v17);
              goto LABEL_33;
            }
            -[HMDCompositeSettingOperationResult writeVersion](v12, "writeVersion");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isGreaterThanVersion:", v48);

            if (v15)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 10, CFSTR("Write version does not meet the minimum"), 0, 0);
              v16 = (id)objc_claimAutoreleasedReturnValue();
              v17 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v5, 0, 0, v16);
              v18 = (void *)MEMORY[0x1D17BA0A0]();
              v19 = v1;
              HMFGetOSLogHandle();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v21;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v16;
                _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v18);
              v7[2](v7, v17);
              goto LABEL_33;
            }
            v52 = 0;
            objc_msgSend(v1, "_settingFromSetting:value:error:", v12, v47, &v52);
            v17 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
            v16 = v52;
            if (!v17)
            {
              v37 = (void *)MEMORY[0x1D17BA0A0]();
              v38 = v1;
              HMFGetOSLogHandle();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v40;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v16;
                _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v37);
              v33 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v5, 0, 0, v16);
              v7[2](v7, v33);
              goto LABEL_32;
            }
            if (v46)
            {
              objc_msgSend(v46, "constraint");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v16;
              objc_msgSend(v31, "isValidValue:error:", v47, &v51);
              v32 = v51;

              if (v32)
              {
                v33 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v5, 0, 0, v32);
                context = (void *)MEMORY[0x1D17BA0A0]();
                v34 = v1;
                HMFGetOSLogHandle();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v36;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v32;
                  _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(context);
                v7[2](v7, v33);
                v16 = v32;
                goto LABEL_32;
              }
              v41 = 0;
            }
            else
            {
              v41 = v16;
            }
            -[HMDCompositeSettingsController emptyModelForTransaction](v1, v30);
            v33 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
            v50 = v41;
            -[HMDCompositeSettingOperationResult setSetting:forKeyPath:withError:](v33, "setSetting:forKeyPath:withError:", v17, v5, &v50);
            v16 = v50;

            if (v16)
            {
              v42 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v5, 0, 0, v16);
              v7[2](v7, v42);

            }
            else
            {
              objc_initWeak(&location, v1);
              v44 = objc_getProperty(v1, v43, 64, 1);
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke;
              v54 = &unk_1E89B6920;
              objc_copyWeak(v60, &location);
              v55 = v12;
              v56 = v17;
              v57 = v5;
              v58 = v46;
              v59 = v7;
              objc_msgSend(v44, "addModel:withOptionsLabel:completion:", v33, CFSTR("HMDCompositeSettingController updating setting"), buf);

              objc_destroyWeak(v60);
              objc_destroyWeak(&location);
              v16 = 0;
            }
LABEL_32:

LABEL_33:
LABEL_34:

            goto LABEL_35;
          }
LABEL_39:
          _HMFPreconditionFailure();
        }
LABEL_38:
        _HMFPreconditionFailure();
        goto LABEL_39;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
    goto LABEL_38;
  }
LABEL_35:

}

void __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SEL v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@updating current setting:%@, new setting:%@ error:%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    v11 = (void *)MEMORY[0x1E0D519C0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke_67;
    v17[3] = &unk_1E89AF798;
    v17[4] = v6;
    v18 = *(id *)(a1 + 40);
    v19 = v3;
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    v12 = (void *)MEMORY[0x1E0D519E8];
    objc_msgSend(objc_getProperty(v6, v13, 64, 1), "queue", v17[0], 3221225472, __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke_67, &unk_1E89AF798, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "schedulerWithDispatchQueue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v11, "futureWithBlock:scheduler:", v17, v15);

  }
}

void __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  HMDCompositeSettingOperationResult *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = 138543874;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@updating setting:%@, error:%@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v10 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(v3, "finishWithNoResult");

}

HMDCompositeSettingOperationResult *__100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDCompositeSettingOperationResult *v4;

  v3 = a2;
  v4 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v3, 0, 0, *(_QWORD *)(a1 + 32));

  return v4;
}

void __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke_3;
  v8[3] = &unk_1E89AF748;
  v5 = *(_QWORD *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v6 = a2;
  -[HMDCompositeSettingsController _metricSubmittingSingleFetchCompletionFromCompletion:](v3, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsController _fetchSettingForKeyPath:callerVersion:callerPrivilege:completion:](v3, v6, v4, v5, v7);

}

uint64_t __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_metricSubmittingSingleFetchCompletionFromCompletion:(void *)a1
{
  id v3;
  uint64_t v4;
  _QWORD aBlock[5];
  id v7;
  uint64_t v8;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D33490], "currentTime");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__HMDCompositeSettingsController__metricSubmittingSingleFetchCompletionFromCompletion___block_invoke;
    aBlock[3] = &unk_1E89B9980;
    aBlock[4] = a1;
    v8 = v4;
    v7 = v3;
    a1 = _Block_copy(aBlock);

  }
  return a1;
}

- (void)_fetchSettingForKeyPath:(void *)a3 callerVersion:(uint64_t)a4 callerPrivilege:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  void (**v13)(_QWORD, _QWORD);
  const char *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDCompositeSettingOperationResult *v20;
  const char *v21;
  NSObject *v22;
  SEL v23;
  SEL v24;
  HMDCompositeSettingOperationResult *v25;
  HMDCompositeSettingOperationResult *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  HMDCompositeSettingOperationResult *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  HMDCompositeSettingOperationResult *v47;
  HMDCompositeSettingOperationResult *v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v13 = (void (**)(_QWORD, _QWORD))v11;
  if (a1 && v11)
  {
    if (objc_msgSend(objc_getProperty(a1, v12, 56, 1), "containsObject:", v9))
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v18;
        v52 = 2112;
        v53 = v9;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Blocked fetch setting with key path: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v9, 0, 0, v19);
      ((void (**)(_QWORD, HMDCompositeSettingOperationResult *))v13)[2](v13, v20);
      goto LABEL_26;
    }
    objc_msgSend(objc_getProperty(a1, v14, 64, 1), "rawDatabase");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = a1;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v40;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Nil database (_fetchSettingForKeyPath)", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v20 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
      v26 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v9, 0, 0, v20);
      ((void (**)(_QWORD, HMDCompositeSettingOperationResult *))v13)[2](v13, v26);
      goto LABEL_25;
    }
    objc_msgSend(objc_getProperty(a1, v21, 64, 1), "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v22);

    objc_msgSend(objc_getProperty(a1, v23, 24, 1), "objectForKeyedSubscript:", v9);
    v20 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_getProperty(a1, v24, 32, 1), "objectForKeyedSubscript:", v9);
    v25 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 21, CFSTR("Setting has not been configured yet (no setting)"), 0, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1D17BA0A0]();
      v44 = a1;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v46;
        v52 = 2112;
        v53 = v42;
        _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@_fetchSettingForKeyPath Error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v43);
      v47 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v9, 0, 0, v42);
      ((void (**)(_QWORD, HMDCompositeSettingOperationResult *))v13)[2](v13, v47);

      v20 = 0;
      goto LABEL_25;
    }
    if (!v25
      || (-[HMDCompositeSettingOperationResult privileges](v25, "privileges"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = HMDUserPrivilegeCompare(a4, objc_msgSend(v27, "minReadUserPrivilege")),
          v27,
          v28 == -1))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 17, CFSTR("Insufficient User read Privilege or missing Metadata"), 0, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = a1;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = v32;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v35;
        v52 = 2112;
        v53 = v31;
        v36 = "%{public}@_fetchSettingForKeyPath failed, Error: %@";
        goto LABEL_19;
      }
    }
    else
    {
      -[HMDCompositeSettingOperationResult readVersion](v20, "readVersion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isGreaterThanVersion:", v10);

      if (!v30)
      {
        v48 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v9, v20, v26, 0);
        ((void (**)(_QWORD, HMDCompositeSettingOperationResult *))v13)[2](v13, v48);

        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 10, CFSTR("Read version does not meet the minimum"), 0, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = a1;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = v32;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v35;
        v52 = 2112;
        v53 = v31;
        v36 = "%{public}@_fetchSettingForKeyPath Error: %@";
LABEL_19:
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, v36, buf, 0x16u);

        v32 = v49;
      }
    }

    objc_autoreleasePoolPop(v32);
    v41 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v9, 0, 0, v31);
    ((void (**)(_QWORD, HMDCompositeSettingOperationResult *))v13)[2](v13, v41);

LABEL_25:
LABEL_26:

  }
}

void __87__HMDCompositeSettingsController__metricSubmittingSingleFetchCompletionFromCompletion___block_invoke(double *a1, void *a2)
{
  const char *v3;
  id Property;
  id v5;
  HMDCompositeSettingsControllerFetchLogEvent *v6;
  double v7;
  void *v8;
  HMDCompositeSettingsControllerFetchLogEvent *v9;
  void *v10;
  id v11;

  v11 = a2;
  Property = (id)*((_QWORD *)a1 + 4);
  if (Property)
    Property = objc_getProperty(Property, v3, 48, 1);
  v5 = Property;
  v6 = [HMDCompositeSettingsControllerFetchLogEvent alloc];
  v7 = a1[6];
  objc_msgSend(v11, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDCompositeSettingsControllerFetchLogEvent initWithStartTime:keyPath:](v6, "initWithStartTime:keyPath:", v8, v7);
  objc_msgSend(v11, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitLogEvent:error:", v9, v10);

  (*(void (**)(void))(*((_QWORD *)a1 + 5) + 16))();
}

HMDCompositeSettingOperationResult *__100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDCompositeSettingOperationResult *v4;

  v3 = a2;
  v4 = -[HMDCompositeSettingOperationResult initWithKeyPath:setting:metadata:error:]([HMDCompositeSettingOperationResult alloc], "initWithKeyPath:setting:metadata:error:", v3, 0, 0, *(_QWORD *)(a1 + 32));

  return v4;
}

void __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_44(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_2;
  v7[3] = &unk_1E89AF770;
  v3 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v2;
  v10 = v5;
  v8 = v4;
  v6 = v2;
  objc_msgSend(v3, "na_each:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_3;
  v6[3] = &unk_1E89AF748;
  v5 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  -[HMDCompositeSettingsController _fetchSettingForKeyPath:callerVersion:callerPrivilege:completion:](v3, a2, v4, v5, v6);

}

uint64_t __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __89__HMDCompositeSettingsController__metricSubmittingMultipleFetchCompletionFromCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__HMDCompositeSettingsController__metricSubmittingMultipleFetchCompletionFromCompletion___block_invoke_2;
  v8[3] = &unk_1E89AF6B0;
  v8[4] = a1[4];
  v8[5] = a1[6];
  v3 = a2;
  objc_msgSend(v3, "na_each:", v8);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v3, v4, v5, v6, v7);

}

void __89__HMDCompositeSettingsController__metricSubmittingMultipleFetchCompletionFromCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  id Property;
  id v5;
  HMDCompositeSettingsControllerFetchLogEvent *v6;
  double v7;
  void *v8;
  HMDCompositeSettingsControllerFetchLogEvent *v9;
  void *v10;
  id v11;

  v11 = a2;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v3, 48, 1);
  v5 = Property;
  v6 = [HMDCompositeSettingsControllerFetchLogEvent alloc];
  v7 = *(double *)(a1 + 40);
  objc_msgSend(v11, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDCompositeSettingsControllerFetchLogEvent initWithStartTime:keyPath:](v6, "initWithStartTime:keyPath:", v8, v7);
  objc_msgSend(v11, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitLogEvent:error:", v9, v10);

}

void __98__HMDCompositeSettingsController_fetchSettingForKeyPath_callerVersion_callerPrivilege_completion___block_invoke(uint64_t a1)
{
  -[HMDCompositeSettingsController _fetchSettingForKeyPath:callerVersion:callerPrivilege:completion:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 64), *(void **)(a1 + 56));
}

void __59__HMDCompositeSettingsController__createSettingsFromModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("HMDCompositeSettingControllerOwnerUUIDNotificationKey");
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("HMDCompositeSettingControllerHomeUUIDNotificationKey");
  v10[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "homeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("HMDHomeUUIDOwnerUUIDKey");
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("HMDCompositeSettingsControllerDidConfigureNotification"), 0, v6);

}

void __62__HMDCompositeSettingsController_filteredSettingsForSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Filtering setting with blocked key path: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v3);
  }

}

void __74__HMDCompositeSettingsController__addedOrUpdatedSettingsFrom_newSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v5);

    if (v8)
      objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v9);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_79059 != -1)
    dispatch_once(&logCategory__hmf_once_t13_79059, &__block_literal_global_79060);
  return (id)logCategory__hmf_once_v14_79061;
}

void __45__HMDCompositeSettingsController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_79061;
  logCategory__hmf_once_v14_79061 = v0;

}

@end
