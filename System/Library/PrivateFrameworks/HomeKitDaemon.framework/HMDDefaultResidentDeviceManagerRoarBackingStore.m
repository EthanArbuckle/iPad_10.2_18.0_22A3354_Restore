@implementation HMDDefaultResidentDeviceManagerRoarBackingStore

- (HMDDefaultResidentDeviceManagerRoarBackingStore)initWithHome:(id)a3 appleAccountManager:(id)a4
{
  id v6;
  id v7;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v8;
  uint64_t v9;
  OS_os_log *logger;
  uint64_t v11;
  NSMapTable *residentDeviceByObjectID;
  void *v13;
  uint64_t v14;
  NSString *logIdentifier;
  void *v16;
  void *v17;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v18;
  HMDResidentSelectionInfo *residentSelectionInfoToWrite;
  id residentSelectionInfoWriteCompletion;
  _QWORD v22[4];
  HMDDefaultResidentDeviceManagerRoarBackingStore *v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMDDefaultResidentDeviceManagerRoarBackingStore;
  v8 = -[HMDDefaultResidentDeviceManagerRoarBackingStore init](&v24, sel_init);
  if (v8)
  {
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    logger = v8->_logger;
    v8->_logger = (OS_os_log *)v9;

    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeWeak((id *)&v8->_appleAccountManager, v7);
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    residentDeviceByObjectID = v8->_residentDeviceByObjectID;
    v8->_residentDeviceByObjectID = (NSMapTable *)v11;

    objc_msgSend(v6, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v8->_logIdentifier;
    v8->_logIdentifier = (NSString *)v14;

    objc_msgSend(v6, "backingStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __84__HMDDefaultResidentDeviceManagerRoarBackingStore_initWithHome_appleAccountManager___block_invoke;
    v22[3] = &unk_24E79C240;
    v18 = v8;
    v23 = v18;
    objc_msgSend(v17, "unsafeSynchronousBlock:", v22);

    residentSelectionInfoToWrite = v18->_residentSelectionInfoToWrite;
    v18->_residentSelectionInfoToWrite = 0;

    v18->_allowedToWriteResidentSelectionInfo = 0;
    residentSelectionInfoWriteCompletion = v18->_residentSelectionInfoWriteCompletion;
    v18->_residentSelectionInfoWriteCompletion = 0;

  }
  return v8;
}

- (NSString)cloudChangeUpdateNotificationName
{
  return (NSString *)(id)*MEMORY[0x24BDBB458];
}

- (id)_deviceWithIdsIdentifier:(id)a3 fromAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[HMDDeviceHandle deviceHandleForDeviceIdentifier:](HMDDeviceHandle, "deviceHandleForDeviceIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "deviceForHandle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_deviceWithIdsDestination:(id)a3 fromAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "deviceForHandle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_deviceFromModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDDefaultResidentDeviceManagerRoarBackingStore appleAccountManager](self, "appleAccountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceAddress addressWithIDSIdentifier:idsDestination:](HMDDeviceAddress, "addressWithIDSIdentifier:idsDestination:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(v5, "accountRegistry"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "deviceForAddress:", v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(v5, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "idsIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDefaultResidentDeviceManagerRoarBackingStore _deviceWithIdsIdentifier:fromAccount:](self, "_deviceWithIdsIdentifier:fromAccount:", v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_8;
    }
    objc_msgSend(v4, "idsDestination");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_9;
    objc_msgSend(v4, "idsDestination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDefaultResidentDeviceManagerRoarBackingStore _deviceWithIdsDestination:fromAccount:](self, "_deviceWithIdsDestination:fromAccount:", v17, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
LABEL_8:
      v11 = v15;
    }
    else
    {
LABEL_9:
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v21;
        v25 = 2112;
        v26 = v4;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the device for model: %@ from account: %@", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v11 = 0;
    }

  }
  return v11;
}

- (id)_deviceFromModel:(id)a3 currentDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v9;
  NSObject *v10;
  void *v11;
  NSObject *logger;
  id v13;
  void *v14;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7 && _isMKFResidentCurrentDevice(v6))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Using current device: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    logger = v9->_logger;
    if (os_signpost_enabled(logger))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HH2CurrentDeviceResidentDeviceCreated", ", (uint8_t *)&v19, 2u);
    }
    v13 = v7;
  }
  else
  {
    -[HMDDefaultResidentDeviceManagerRoarBackingStore _deviceFromModel:](self, "_deviceFromModel:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v17;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Using device: %@ from account for model: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

  return v13;
}

- (BOOL)hasAnyResident
{
  HMDDefaultResidentDeviceManagerRoarBackingStore *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasAnyResident;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasAnyResident:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasAnyResident = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_updateHasAnyResident
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HMDDefaultResidentDeviceManagerRoarBackingStore home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v5, "residents", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "appleMediaAccessory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v12, "idsIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14 != 0;

          }
          else
          {
            v15 = 0;
          }

          v9 |= v15;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    if ((v9 & 1) != -[HMDDefaultResidentDeviceManagerRoarBackingStore hasAnyResident](self, "hasAnyResident"))
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Updating hasAnyResident to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      -[HMDDefaultResidentDeviceManagerRoarBackingStore setHasAnyResident:](v17, "setHasAnyResident:", v9 & 1);
    }

  }
}

- (id)findResidents:(id)a3 outHasResidents:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v19;
  id v20;
  id v21;
  BOOL *v22;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDefaultResidentDeviceManagerRoarBackingStore home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backingStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __81__HMDDefaultResidentDeviceManagerRoarBackingStore_findResidents_outHasResidents___block_invoke;
  v18 = &unk_24E795658;
  v19 = self;
  v20 = v6;
  v21 = v7;
  v22 = a4;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "unsafeSynchronousBlock:", &v15);

  v13 = (void *)objc_msgSend(v11, "copy", v15, v16, v17, v18, v19);
  return v13;
}

- (id)pruneDuplicateResidentModelsFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __84__HMDDefaultResidentDeviceManagerRoarBackingStore_pruneDuplicateResidentModelsFrom___block_invoke;
  v23[3] = &unk_24E790AE8;
  v23[4] = self;
  objc_msgSend(v5, "sortUsingComparator:", v23);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__199605;
  v21[4] = __Block_byref_object_dispose__199606;
  v22 = 0;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __84__HMDDefaultResidentDeviceManagerRoarBackingStore_pruneDuplicateResidentModelsFrom___block_invoke_30;
  v17[3] = &unk_24E790B10;
  v17[4] = self;
  v20 = v21;
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);
  if (objc_msgSend(v9, "count"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v14;
      v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Duplicate MKFResident models are present in the working store: %{public}@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v21, 8);
  return v15;
}

- (BOOL)residentModel:(id)a3 isTheSameAs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "modelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "idsIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqual:", v11);

  }
  return v9;
}

- (id)handleCloudResidentChange:(id)a3 currentResidents:(id)a4 isCurrentDevicePrimaryResident:(BOOL)a5 currentDevice:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDBackingStoreResidentUpdateResult *v46;
  void *v47;
  void *v48;
  HMDBackingStoreResidentUpdateResult *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  _QWORD v58[5];
  _QWORD v59[4];
  id v60;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v61;
  _QWORD v62[5];
  id v63;
  uint64_t *v64;
  _QWORD v65[5];
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t *v71;
  BOOL v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  -[HMDDefaultResidentDeviceManagerRoarBackingStore home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  if (self
    && (+[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "isRelatedContext:", v17),
        v19,
        v18)
    && (v20 & 1) != 0)
  {
    v57 = v12;
    objc_msgSend(v17, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HMDWorkingContextNameForHomeUUID(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "isEqualToString:", v23);

    if (v24)
    {
      v25 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0;
      v74 = &v73;
      v75 = 0x2020000000;
      v76 = 0;
      objc_msgSend(v10, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x24BDBB430]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
      v56 = v28;

      objc_msgSend(v10, "userInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BDBB598]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      v51 = v32;
      objc_msgSend(v32, "setByAddingObjectsFromSet:", v56);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke;
      v65[3] = &unk_24E790B38;
      v65[4] = self;
      v34 = v18;
      v66 = v34;
      v71 = &v73;
      v35 = v25;
      v67 = v35;
      v72 = a5;
      v36 = v52;
      v68 = v36;
      v55 = v54;
      v69 = v55;
      v70 = v57;
      objc_msgSend(v33, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v65);

      objc_msgSend(v10, "userInfo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x24BDBB400]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = v38;
      else
        v39 = 0;
      v40 = v39;

      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_42;
      v62[3] = &unk_24E790B60;
      v64 = &v73;
      v62[4] = self;
      v41 = v35;
      v63 = v41;
      v53 = v40;
      objc_msgSend(v40, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v62);
      if (objc_msgSend(v36, "count"))
      {
        objc_msgSend(v34, "backingStore");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "context");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_43;
        v59[3] = &unk_24E79C268;
        v60 = v36;
        v61 = self;
        objc_msgSend(v43, "performBlock:", v59);

      }
      if (*((_BYTE *)v74 + 24))
      {
        objc_msgSend(v34, "backingStore");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "context");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x24BDAC760];
        v58[1] = 3221225472;
        v58[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_46;
        v58[3] = &unk_24E79C240;
        v58[4] = self;
        objc_msgSend(v45, "performBlock:", v58);

      }
      v46 = [HMDBackingStoreResidentUpdateResult alloc];
      objc_msgSend(v11, "hmf_addedObjectsFromSet:", v41);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_removedObjectsFromSet:", v41);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[HMDBackingStoreResidentUpdateResult initWithAddedResidentDevices:deletedResidentDevices:reachabilityUpdates:](v46, "initWithAddedResidentDevices:deletedResidentDevices:reachabilityUpdates:", v47, v48, v55);

      _Block_object_dispose(&v73, 8);
    }
    else
    {
      v49 = 0;
    }
    v12 = v57;
  }
  else
  {

    v49 = 0;
  }

  return v49;
}

- (BOOL)_shouldUpdateDeviceIdentifiersForResident:(id)a3 fromResidentDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteDestinationString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!v8)
    {
      LOBYTE(v9) = 0;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  objc_msgSend(v5, "idsIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    LOBYTE(v9) = 1;
    goto LABEL_9;
  }
  if (v8)
  {
LABEL_6:
    objc_msgSend(v5, "idsDestination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqual:", v8) ^ 1;

    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  LOBYTE(v9) = 0;
LABEL_9:

LABEL_10:
  return v9;
}

- (BOOL)_addDeviceIdentifiersIfNecessary:(id)a3 fromResidentDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[HMDDefaultResidentDeviceManagerRoarBackingStore _shouldUpdateDeviceIdentifiersForResident:fromResidentDevice:](self, "_shouldUpdateDeviceIdentifiersForResident:fromResidentDevice:", v6, v7))
  {
    objc_msgSend(v7, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteDestinationString");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    v12 = !v11;
    if (!v11)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v16;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Setting resident: %@ with device address identifiers", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v6, "setIdsDestination:", v10);
      objc_msgSend(v6, "setIdsIdentifier:", v8);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)updateIdentifiersForAvailableResidentDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  -[HMDDefaultResidentDeviceManagerRoarBackingStore home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __96__HMDDefaultResidentDeviceManagerRoarBackingStore_updateIdentifiersForAvailableResidentDevices___block_invoke;
  v10[3] = &unk_24E79BBD0;
  v10[4] = self;
  v11 = v4;
  v12 = v7;
  v8 = v7;
  v9 = v4;
  objc_msgSend(v8, "performBlock:", v10);

}

- (void)_mapResidentsToMKFResidents:(id)a3 operation:(id)a4 finished:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBCED8];
  v11 = a3;
  objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke;
  v25[3] = &unk_24E7952E0;
  v14 = v12;
  v26 = v14;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);

  -[HMDDefaultResidentDeviceManagerRoarBackingStore home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "backingStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke_2;
  v21[3] = &unk_24E790BD8;
  v21[4] = self;
  v22 = v14;
  v23 = v8;
  v24 = v9;
  v18 = v9;
  v19 = v8;
  v20 = v14;
  objc_msgSend(v17, "performBlock:", v21);

}

- (void)updateReachabilityForResidents:(id)a3
{
  id v4;
  _QWORD v5[5];
  _QWORD v6[6];
  _QWORD v7[3];
  char v8;

  v4 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v5[4] = v7;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__HMDDefaultResidentDeviceManagerRoarBackingStore_updateReachabilityForResidents___block_invoke;
  v6[3] = &unk_24E790C00;
  v6[4] = self;
  v6[5] = v7;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__HMDDefaultResidentDeviceManagerRoarBackingStore_updateReachabilityForResidents___block_invoke_51;
  v5[3] = &unk_24E797578;
  -[HMDDefaultResidentDeviceManagerRoarBackingStore _mapResidentsToMKFResidents:operation:finished:](self, "_mapResidentsToMKFResidents:operation:finished:", v4, v6, v5);
  _Block_object_dispose(v7, 8);

}

- (id)residentsRequiringReachabilityUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __88__HMDDefaultResidentDeviceManagerRoarBackingStore_residentsRequiringReachabilityUpdate___block_invoke;
    v15[3] = &unk_24E790C28;
    v16 = v6;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __88__HMDDefaultResidentDeviceManagerRoarBackingStore_residentsRequiringReachabilityUpdate___block_invoke_2;
    v12[3] = &unk_24E79C268;
    v13 = v17;
    v14 = v16;
    v8 = v16;
    -[HMDDefaultResidentDeviceManagerRoarBackingStore _mapResidentsToMKFResidents:operation:finished:](self, "_mapResidentsToMKFResidents:operation:finished:", v4, v15, v12);

  }
  else
  {
    v9 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithValue:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (HMDResidentSelectionInfo)residentSelectionInfo
{
  void *v3;
  void *v4;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[6];
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDDefaultResidentDeviceManagerRoarBackingStore residentSelectionInfoToWrite](self, "residentSelectionInfoToWrite");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDefaultResidentDeviceManagerRoarBackingStore residentSelectionInfoToWrite](v5, "residentSelectionInfoToWrite");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Getting resident selection info from cache: %@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDDefaultResidentDeviceManagerRoarBackingStore residentSelectionInfoToWrite](v5, "residentSelectionInfoToWrite");
    return (HMDResidentSelectionInfo *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v16 = __Block_byref_object_copy__199605;
    v17 = __Block_byref_object_dispose__199606;
    v18 = 0;
    -[HMDDefaultResidentDeviceManagerRoarBackingStore home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backingStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __72__HMDDefaultResidentDeviceManagerRoarBackingStore_residentSelectionInfo__block_invoke;
    v14[3] = &unk_24E79B698;
    v14[4] = self;
    v14[5] = buf;
    objc_msgSend(v12, "unsafeSynchronousBlock:", v14);

    v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    return (HMDResidentSelectionInfo *)v13;
  }
}

- (id)_residentSelectionModelFromManagedObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "castIfResidentSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDefaultResidentDeviceManagerRoarBackingStore home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if ((v12 & 1) != 0)
    {
      v13 = v7;
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
        v19 = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Ignoring resident selection model for another home: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)hasResidentSelectionInfoUpdateInNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  _QWORD v17[7];
  _QWORD v18[7];
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_setForKey:", *MEMORY[0x24BDBB430]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_setForKey:", *MEMORY[0x24BDBB598]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__199605;
  v19[4] = __Block_byref_object_dispose__199606;
  v20 = 0;
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __96__HMDDefaultResidentDeviceManagerRoarBackingStore_hasResidentSelectionInfoUpdateInNotification___block_invoke;
  v18[3] = &unk_24E790C50;
  v18[4] = self;
  v18[5] = v19;
  v18[6] = &v21;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);

  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDBB400]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __96__HMDDefaultResidentDeviceManagerRoarBackingStore_hasResidentSelectionInfoUpdateInNotification___block_invoke_54;
  v17[3] = &unk_24E790C50;
  v17[4] = self;
  v17[5] = v19;
  v17[6] = &v21;
  objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);
  v15 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v15;
}

- (void)updateResidentSelectionInfoTo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v9;
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
    v15 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received updated resident selection info to write to working store: %@.", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDDefaultResidentDeviceManagerRoarBackingStore setResidentSelectionInfoToWrite:](v9, "setResidentSelectionInfoToWrite:", v6);
  -[HMDDefaultResidentDeviceManagerRoarBackingStore setResidentSelectionInfoWriteCompletion:](v9, "setResidentSelectionInfoWriteCompletion:", v7);
  -[HMDDefaultResidentDeviceManagerRoarBackingStore _writeResidentSelectionInfoToWorkingStore](v9, "_writeResidentSelectionInfoToWorkingStore");

}

- (void)_writeResidentSelectionInfoToWorkingStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[HMDDefaultResidentDeviceManagerRoarBackingStore home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isCurrentDevicePrimaryResident")
    && -[HMDDefaultResidentDeviceManagerRoarBackingStore allowedToWriteResidentSelectionInfo](self, "allowedToWriteResidentSelectionInfo")&& (-[HMDDefaultResidentDeviceManagerRoarBackingStore residentSelectionInfoToWrite](self, "residentSelectionInfoToWrite"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    -[HMDDefaultResidentDeviceManagerRoarBackingStore residentSelectionInfoToWrite](self, "residentSelectionInfoToWrite");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDDefaultResidentDeviceManagerRoarBackingStore residentSelectionInfoWriteCompletion](self, "residentSelectionInfoWriteCompletion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __92__HMDDefaultResidentDeviceManagerRoarBackingStore__writeResidentSelectionInfoToWorkingStore__block_invoke;
    v18[3] = &unk_24E799A68;
    v18[4] = self;
    v19 = v5;
    v20 = v3;
    v21 = v7;
    v22 = v8;
    v9 = v8;
    v10 = v7;
    v11 = v5;
    objc_msgSend(v10, "performBlock:", v18);
    -[HMDDefaultResidentDeviceManagerRoarBackingStore setResidentSelectionInfoToWrite:](self, "setResidentSelectionInfoToWrite:", 0);
    -[HMDDefaultResidentDeviceManagerRoarBackingStore setResidentSelectionInfoWriteCompletion:](self, "setResidentSelectionInfoWriteCompletion:", 0);

  }
  else
  {
    -[HMDDefaultResidentDeviceManagerRoarBackingStore residentSelectionInfoToWrite](self, "residentSelectionInfoToWrite");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDefaultResidentDeviceManagerRoarBackingStore residentSelectionInfoToWrite](v14, "residentSelectionInfoToWrite");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        v27 = 1024;
        v28 = -[HMDDefaultResidentDeviceManagerRoarBackingStore allowedToWriteResidentSelectionInfo](v14, "allowedToWriteResidentSelectionInfo");
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Not writing resident selection info:%@ to working store yet. Allowed to write: %d", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v13);
    }
  }

}

- (void)handleHomeDataReadyAfterBecomingPrimary:(id)a3
{
  -[HMDDefaultResidentDeviceManagerRoarBackingStore setAllowedToWriteResidentSelectionInfo:](self, "setAllowedToWriteResidentSelectionInfo:", 1);
  -[HMDDefaultResidentDeviceManagerRoarBackingStore _writeResidentSelectionInfoToWorkingStore](self, "_writeResidentSelectionInfoToWorkingStore");
}

- (id)_canonicalResidentSelectionModelForHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "residentSelections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = (id)objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_199594);
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Resident Selection model is not present in the backing store.", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMDAppleAccountManager)appleAccountManager
{
  return (HMDAppleAccountManager *)objc_loadWeakRetained((id *)&self->_appleAccountManager);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSMapTable)residentDeviceByObjectID
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (HMDResidentSelectionInfo)residentSelectionInfoToWrite
{
  return (HMDResidentSelectionInfo *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResidentSelectionInfoToWrite:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)allowedToWriteResidentSelectionInfo
{
  return self->_allowedToWriteResidentSelectionInfo;
}

- (void)setAllowedToWriteResidentSelectionInfo:(BOOL)a3
{
  self->_allowedToWriteResidentSelectionInfo = a3;
}

- (id)residentSelectionInfoWriteCompletion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setResidentSelectionInfoWriteCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_residentSelectionInfoWriteCompletion, 0);
  objc_storeStrong((id *)&self->_residentSelectionInfoToWrite, 0);
  objc_storeStrong((id *)&self->_residentDeviceByObjectID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_appleAccountManager);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_logger, 0);
}

uint64_t __91__HMDDefaultResidentDeviceManagerRoarBackingStore__canonicalResidentSelectionModelForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "selectionTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __92__HMDDefaultResidentDeviceManagerRoarBackingStore__writeResidentSelectionInfoToWorkingStore__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v29 = 138543618;
    v30 = v5;
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Writing resident selection info: %@ to working store.", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_canonicalResidentSelectionModelForHome:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v29 = 138543618;
      v30 = v13;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating new resident selection model with info: %@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "materializeOrCreateResidentSelectionsRelationWithModelID:createdNew:", v15, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "residentSelectionVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedLongValue");

  if (v17 != 3)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating home model to indicate support for resident selection", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLong:", 3);
    objc_msgSend(v8, "setResidentSelectionVersion:", v22);

  }
  objc_msgSend(*(id *)(a1 + 40), "preferredResidentIDSIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(*(id *)(a1 + 40), "preferredResidentIDSIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "arrayWithObject:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "setPreferredResidentIDSIdentifiers:", v23);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "currentModeType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMode:", v26);

  objc_msgSend(*(id *)(a1 + 40), "selectionTimestamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectionTimestamp:", v27);

  objc_msgSend(*(id *)(a1 + 56), "save");
  v28 = *(_QWORD *)(a1 + 64);
  if (v28)
    (*(void (**)(uint64_t, _QWORD))(v28 + 16))(v28, 0);

}

void __96__HMDDefaultResidentDeviceManagerRoarBackingStore_hasResidentSelectionInfoUpdateInNotification___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_residentSelectionModelFromManagedObject:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Resident selection info has updated in the working store.", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }

}

void __96__HMDDefaultResidentDeviceManagerRoarBackingStore_hasResidentSelectionInfoUpdateInNotification___block_invoke_54(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "castIfResidentSelection");
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v11)
  {
    objc_msgSend(v11, "modelID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident selection info got deleted from the working store.", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

void __72__HMDDefaultResidentDeviceManagerRoarBackingStore_residentSelectionInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  HMDResidentSelectionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_canonicalResidentSelectionModelForHome:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HMDResidentSelectionInfo alloc];
  objc_msgSend(v4, "preferredResidentIDSIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(v4, "selectionTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDResidentSelectionInfo initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:](v5, "initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:", v7, v9, v10);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

void __88__HMDDefaultResidentDeviceManagerRoarBackingStore_residentsRequiringReachabilityUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    v6 = objc_msgSend(v9, "isReachable");
    objc_msgSend(v5, "reachable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v6 != v8)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  }

}

void __88__HMDDefaultResidentDeviceManagerRoarBackingStore_residentsRequiringReachabilityUpdate___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "fulfillWithValue:", v2);

}

void __82__HMDDefaultResidentDeviceManagerRoarBackingStore_updateReachabilityForResidents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "reachable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v5 != 0) != v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating resident %@ %@ with reachability: %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 != 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReachable:", v16);

  }
}

void __82__HMDDefaultResidentDeviceManagerRoarBackingStore_updateReachabilityForResidents___block_invoke_51(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    +[HMCContext currentContext](HMCContext, "currentContext");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "save");

  }
}

void __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

void __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "residents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke_3;
  v7[3] = &unk_24E790BB0;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);

  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __98__HMDDefaultResidentDeviceManagerRoarBackingStore__mapResidentsToMKFResidents_operation_finished___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v7, "idsIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __96__HMDDefaultResidentDeviceManagerRoarBackingStore_updateIdentifiersForAvailableResidentDevices___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v1 = a1;
  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(v1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v4, "residents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (!v7)
  {

    goto LABEL_24;
  }
  v8 = v7;
  v31 = v4;
  v32 = v6;
  v33 = 0;
  v9 = *(_QWORD *)v35;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v35 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_msgSend(v11, "device");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v11, "idsIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(v11, "idsDestination");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            continue;
        }
        else
        {

        }
        _findResidentMatching(v5, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "device");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            v21 = v5;
            v22 = *(void **)(v1 + 32);
            objc_msgSend(v18, "device");
            v23 = v1;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v22) = objc_msgSend(v22, "_shouldUpdateDeviceIdentifiersForResident:fromResidentDevice:", v11, v24);

            if ((_DWORD)v22)
            {
              v25 = *(void **)(v23 + 32);
              objc_msgSend(v18, "device");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v33 |= objc_msgSend(v25, "_addDeviceIdentifiersIfNecessary:fromResidentDevice:", v11, v26);

            }
            v1 = v23;
            v5 = v21;
            v6 = v32;
          }
        }

      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  }
  while (v8);

  v4 = v31;
  if ((v33 & 1) != 0)
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = *(id *)(v1 + 32);
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v30;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Saving on adding identifiers to resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(*(id *)(v1 + 48), "save");
  }
LABEL_24:

}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  HMDDeviceAddress *v48;
  void *v49;
  void *v50;
  HMDDeviceAddress *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  os_unfair_lock_s *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  void *v70;
  HMDAssertionLogEvent *v71;
  void *v72;
  HMDAssertionLogEvent *v73;
  void *v74;
  _QWORD v75[4];
  id v76;
  uint64_t v77;
  id v78;
  id v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = v3;
  v7 = v4;
  if (v5)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "castIfResident");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modelID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) != 0)
      {
        v16 = v11;
      }
      else
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = v5;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v81 = v20;
          v82 = 2112;
          v83 = v11;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Ignoring resident model with invalid home: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  if (v16)
  {
    objc_msgSend(v16, "modelID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v66 = (void *)MEMORY[0x227676638]();
      v67 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "debugDescription");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v69;
        v82 = 2112;
        v83 = v70;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Model ID is nil for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v66);
      v71 = [HMDAssertionLogEvent alloc];
      objc_msgSend(v16, "debugDescription");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = -[HMDAssertionLogEvent initWithReason:](v71, "initWithReason:", CFSTR("Model ID is nil for %@"), v72);

      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "submitLogEvent:", v73);

    }
    objc_msgSend(v16, "modelID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (!v23)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      _findResidentMatching(*(void **)(a1 + 48), v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)MEMORY[0x227676638]();
        v26 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "debugDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v81 = v28;
          v82 = 2112;
          v83 = v29;
          v84 = 2112;
          v85 = v24;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Found existing resident device for model %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v25);
        objc_msgSend(v16, "reachable");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "BOOLValue");
        v32 = objc_msgSend(v24, "isReachable");

        if (v31 != v32)
        {
          if (*(_BYTE *)(a1 + 88))
          {
            v33 = *(void **)(a1 + 56);
            objc_msgSend(v16, "databaseID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v34);

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v24);
          }
        }
        objc_msgSend(v16, "residentCapabilities");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend(v16, "residentCapabilities");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_updateRawCapabilities:", v44);

        }
        objc_msgSend(v16, "idsIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          objc_msgSend(v16, "idsDestination");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46 == 0;

          if (!v47)
          {
            v48 = [HMDDeviceAddress alloc];
            objc_msgSend(v16, "idsIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "idsDestination");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = -[HMDDeviceAddress initWithIDSIdentifier:idsDestination:](v48, "initWithIDSIdentifier:idsDestination:", v49, v50);

            objc_msgSend(v24, "_updateMessageAddress:", v51);
          }
        }
        objc_msgSend(v16, "deviceIRKData");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          objc_msgSend(v16, "deviceIRKData");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "updateDeviceIRKData:", v53);

        }
      }
      else
      {
        -[HMDDefaultResidentDeviceManagerRoarBackingStore _residentDeviceFromModel:currentDevice:](*(HMDResidentDevice **)(a1 + 32), v16, *(void **)(a1 + 72));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x227676638]();
        v36 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if (v24)
        {
          if (v38)
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "debugDescription");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v81 = v39;
            v82 = 2112;
            v83 = v40;
            v84 = 2112;
            v85 = v24;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Created new resident device for model %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v35);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);
        }
        else
        {
          if (v38)
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "debugDescription");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v81 = v41;
            v82 = 2112;
            v83 = v42;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@No resident device is created for model: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v35);
          v24 = 0;
        }
      }
      if (*(_BYTE *)(a1 + 88))
      {
        v54 = *(void **)(a1 + 32);
        objc_msgSend(v24, "device");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v54) = objc_msgSend(v54, "_shouldUpdateDeviceIdentifiersForResident:fromResidentDevice:", v16, v55);

        if ((_DWORD)v54)
        {
          objc_msgSend(*(id *)(a1 + 32), "home");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "backingStore");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "context");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "databaseID");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v75[0] = MEMORY[0x24BDAC760];
          v75[1] = 3221225472;
          v75[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_40;
          v75[3] = &unk_24E79A910;
          v60 = *(_QWORD *)(a1 + 32);
          v76 = v59;
          v77 = v60;
          v78 = v24;
          v79 = v58;
          v61 = v58;
          v62 = v59;
          objc_msgSend(v61, "performBlock:", v75);

        }
      }
      v63 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
      os_unfair_lock_lock_with_options();
      objc_msgSend(*(id *)(a1 + 32), "residentDeviceByObjectID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "modelID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setObject:forKey:", v24, v65);

      os_unfair_lock_unlock(v63);
    }
  }

}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *v8;
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
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "castIfResident");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "modelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
      os_unfair_lock_lock_with_options();
      objc_msgSend(*(id *)(a1 + 32), "residentDeviceByObjectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "residentDeviceByObjectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v13);

      os_unfair_lock_unlock(v8);
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "modelID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Matched resident removal for modelID: %@ to pending removal for device: %@", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "removeObject:", v11);
      }
      else
      {
        v19 = (void *)MEMORY[0x227676638]();
        v20 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543618;
          v24 = v22;
          v25 = 2112;
          v26 = v6;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Notified of deleted resident with no matching HMDResidentDevice: %@", (uint8_t *)&v23, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
      }

    }
  }

}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_43(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_2;
  v3[3] = &unk_24E790B88;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
  +[HMCContext currentContext](HMCContext, "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "save");

}

uint64_t __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHasAnyResident");
}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[HMCContext findResidentWithDatabaseID:](HMCContext, "findResidentWithDatabaseID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "reachable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "BOOLValue") ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReachable:", v8);

    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reachable");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 1024;
      v17 = objc_msgSend(v13, "intValue");
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating reachability to '%d' for HMDResidentDevice: %@", (uint8_t *)&v14, 0x1Cu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (HMDResidentDevice)_residentDeviceFromModel:(void *)a3 currentDevice:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HMDResidentDevice *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  HMDResidentDevice *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[HMDResidentDevice _deviceFromModel:currentDevice:](a1, "_deviceFromModel:currentDevice:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v12;
        v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Create resident device using %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v13 = [HMDResidentDevice alloc];
      -[HMDResidentDevice home](v9, "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "residentCapabilities");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceIRKData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = -[HMDResidentDevice initWithDevice:home:name:rawCapabilities:messageAddress:deviceIRKData:](v13, "initWithDevice:home:name:rawCapabilities:messageAddress:deviceIRKData:", v7, v14, v15, v16, v17, v18);

      objc_msgSend(v5, "reachable");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentDevice setReachable:](a1, "setReachable:", objc_msgSend(v19, "BOOLValue"));

    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@No device found for this model", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      a1 = 0;
    }

  }
  return a1;
}

void __139__HMDDefaultResidentDeviceManagerRoarBackingStore_handleCloudResidentChange_currentResidents_isCurrentDevicePrimaryResident_currentDevice___block_invoke_40(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[HMCContext findResidentWithDatabaseID:](HMCContext, "findResidentWithDatabaseID:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "_addDeviceIdentifiersIfNecessary:fromResidentDevice:", v2, v4);

    if ((_DWORD)v3)
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "modelID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v8;
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Saving resident: %@ with added device address identifiers", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(*(id *)(a1 + 56), "save");
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 32);
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Did not find resident %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

uint64_t __84__HMDDefaultResidentDeviceManagerRoarBackingStore_pruneDuplicateResidentModelsFrom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v16;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "residentModel:isTheSameAs:", v5, v6) & 1) != 0)
  {
    objc_msgSend(v5, "appleMediaAccessory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v6, "appleMediaAccessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v14 = -1;
        goto LABEL_9;
      }
    }
    objc_msgSend(v5, "appleMediaAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      objc_msgSend(v6, "appleMediaAccessory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v14 = 1;
        goto LABEL_9;
      }
    }
    objc_msgSend(v5, "modelID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelID");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "idsIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  v14 = objc_msgSend(v11, "compare:", v12);

LABEL_9:
  return v14;
}

void __84__HMDDefaultResidentDeviceManagerRoarBackingStore_pruneDuplicateResidentModelsFrom___block_invoke_30(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v7 = a2;
  v5 = objc_msgSend(v3, "residentModel:isTheSameAs:", v7, v4);
  v6 = 48;
  if (v5)
    v6 = 40;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v7);

}

void __81__HMDDefaultResidentDeviceManagerRoarBackingStore_findResidents_outHasResidents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "residents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pruneDuplicateResidentModelsFrom:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__HMDDefaultResidentDeviceManagerRoarBackingStore_findResidents_outHasResidents___block_invoke_2;
  v15[3] = &unk_24E790AC0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 56);
  v15[4] = v8;
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v10 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15));
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v20 = v13;
    v21 = 2114;
    v22 = v14;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Created resident devices: %{public}@ from models: %{public}@.", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);

}

void __81__HMDDefaultResidentDeviceManagerRoarBackingStore_findResidents_outHasResidents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  void *v5;
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(_BYTE **)(a1 + 56);
  if (v4)
    *v4 = 1;
  v12 = v3;
  -[HMDDefaultResidentDeviceManagerRoarBackingStore _residentDeviceFromModel:currentDevice:](*(HMDResidentDevice **)(a1 + 32), v3, *(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    objc_msgSend(*(id *)(a1 + 32), "residentDeviceByObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "residentDeviceByObjectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modelID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v5, v11);

    }
    os_unfair_lock_unlock(v6);
  }

}

uint64_t __84__HMDDefaultResidentDeviceManagerRoarBackingStore_initWithHome_appleAccountManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHasAnyResident");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t48_199660 != -1)
    dispatch_once(&logCategory__hmf_once_t48_199660, &__block_literal_global_57_199661);
  return (id)logCategory__hmf_once_v49_199662;
}

void __62__HMDDefaultResidentDeviceManagerRoarBackingStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v49_199662;
  logCategory__hmf_once_v49_199662 = v0;

}

@end
