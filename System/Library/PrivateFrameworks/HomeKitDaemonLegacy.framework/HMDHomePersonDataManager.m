@implementation HMDHomePersonDataManager

- (HMDHomePersonDataManager)initWithHome:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomePersonDataManager *v9;
  HMDHomePersonDataManager *v10;
  uint64_t v11;
  NSUUID *homeUUID;
  id personManagerFactory;
  HMDHomePersonDataManager *result;
  HMDHomePersonDataManager *v15;
  SEL v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (HMDHomePersonDataManager *)_HMFPreconditionFailure();
    -[HMDHomePersonDataManager configure](v15, v16);
    return result;
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDHomePersonDataManager;
  v9 = -[HMDHomePersonDataManager init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a4);
    objc_msgSend(v6, "uuid");
    v11 = objc_claimAutoreleasedReturnValue();
    homeUUID = v10->_homeUUID;
    v10->_homeUUID = (NSUUID *)v11;

    objc_storeWeak((id *)&v10->_home, v6);
    personManagerFactory = v10->_personManagerFactory;
    v10->_personManagerFactory = &__block_literal_global_128059;

  }
  return v10;
}

- (void)configure
{
  void *v3;
  void *v4;
  HMDHomePersonDataManager *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  HMDHomePersonDataManager *v22;
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[HMDHomePersonDataManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "personManagerSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "personManagerZoneUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Initialized home person manager settings: %@, home person manager zone UUID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "personManagerZoneUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "administratorHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CB92D0];
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 8197);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerForMessage:receiver:policies:selector:", v13, v5, v16, sel_handleUpdateSettingsMessage_);

    -[HMDHomePersonDataManager workQueue](v5, "workQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __37__HMDHomePersonDataManager_configure__block_invoke;
    v20[3] = &unk_1E89C2328;
    v21 = v11;
    v22 = v5;
    v18 = v11;
    dispatch_async(v17, v20);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

- (void)removeCloudDataDueToHomeRemoval
{
  NSObject *v3;

  -[HMDHomePersonDataManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDHomePersonDataManager removeCloudDataDueToHomeGraphObjectRemoval:](self, "removeCloudDataDueToHomeGraphObjectRemoval:", 1);
}

- (id)updateSettingsModelWithSettings:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  HMDHomePersonDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHomePersonDataManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDHomePersonDataManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  HMDHomePersonDataManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HMDHomePersonDataManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v10;
    v47 = 2112;
    v48 = v5;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating home person manager settings: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDHomePersonDataManager home](v8, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomePersonManagerSettingsModel defaultModelForHomeUUID:](HMDHomePersonManagerSettingsModel, "defaultModelForHomeUUID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isFaceClassificationEnabled")
      && (objc_msgSend(v12, "personManagerZoneUUID"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setZoneUUID:", v27);

      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = v8;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "zoneUUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v31;
        v47 = 2112;
        v48 = v32;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Face Classification is now enabled. Updating settings with new home person manager zone UUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
    }
    else if ((objc_msgSend(v5, "isFaceClassificationEnabled") & 1) == 0)
    {
      objc_msgSend(v12, "personManagerZoneUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = v8;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v46 = v20;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Face Classification is now disabled. Updating settings to remove zone UUID", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
        objc_msgSend(v14, "setZoneUUID:", 0);
      }
    }
    v33 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v34 = objc_alloc(MEMORY[0x1E0D285F8]);
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D285D8], "allMessageDestinations");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v34, "initWithName:destination:payload:", v35, v36, 0);

    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __60__HMDHomePersonDataManager_updateSettingsModelWithSettings___block_invoke;
    v43[3] = &unk_1E89C0E20;
    v38 = v33;
    v44 = v38;
    objc_msgSend(v37, "setResponseHandler:", v43);
    objc_msgSend(v12, "backingStore");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "transaction:options:", CFSTR("Update home person manager settings"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "add:withMessage:", v14, v37);
    objc_msgSend(v41, "run");
    v26 = v38;

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v8;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v25 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "futureWithError:", v14);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (void)handleUpdatedSettingsModel:(id)a3 previousSettingsModel:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDHomePersonDataManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  HMDHomePersonDataManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  HMDHomePersonDataManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMDHomePersonDataManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD block[4];
  id v52;
  id v53;
  HMDHomePersonDataManager *v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "copy");
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v8;
  v14 = v13;

  v15 = (void *)MEMORY[0x1D17BA0A0]((id)objc_msgSend(v14, "merge:", v8));
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "debugString:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v18;
    v60 = 2112;
    v61 = v19;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling updated home person manager settings model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDHomePersonDataManager home](v16, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if ((objc_msgSend(v14, "propertyWasSet:", CFSTR("zoneUUIDString")) & 1) != 0)
    {
      objc_msgSend(v14, "createSettings");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personManagerSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)v21;
      v23 = objc_msgSend(v22, "isEqual:", v21);

      if ((v23 & 1) == 0)
      {
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = v16;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = v10;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "personManagerSettings");
          v48 = v24;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v59 = v27;
          v60 = 2112;
          v61 = v28;
          v62 = 2112;
          v63 = v50;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating home person manager settings from %@ to %@", buf, 0x20u);

          v24 = v48;
          v10 = v46;
        }

        objc_autoreleasePoolPop(v24);
        objc_msgSend(v20, "setPersonManagerSettings:", v50);
      }
      objc_msgSend(v14, "zoneUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personManagerZoneUUID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personManagerZoneUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = HMFEqualObjects();

      if ((v31 & 1) != 0)
      {
        if (v23)
        {
          objc_msgSend(v10, "respondWithSuccess");
          v33 = v49;
          v32 = v50;
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        v38 = (void *)MEMORY[0x1D17BA0A0]();
        v39 = v16;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v45 = v9;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "personManagerZoneUUID");
          v47 = v38;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v59 = v41;
          v60 = 2112;
          v61 = v42;
          v62 = 2112;
          v63 = v29;
          _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@Updating home person manager zone UUID from %@ to %@", buf, 0x20u);

          v38 = v47;
          v9 = v45;
        }

        objc_autoreleasePoolPop(v38);
        objc_msgSend(v20, "setPersonManagerZoneUUID:", v29);
      }
      objc_msgSend(v10, "transactionResult");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "markChanged");

      -[HMDHomePersonDataManager workQueue](v16, "workQueue");
      v44 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__HMDHomePersonDataManager_handleUpdatedSettingsModel_previousSettingsModel_message___block_invoke;
      block[3] = &unk_1E89B5F88;
      v52 = v29;
      v33 = v49;
      v53 = v49;
      v54 = v16;
      v55 = v20;
      v32 = v50;
      v56 = v50;
      v57 = v10;
      dispatch_async(v44, block);

      goto LABEL_23;
    }
    objc_msgSend(v10, "respondWithSuccess");
  }
  else
  {
    v34 = (void *)MEMORY[0x1D17BA0A0]();
    v35 = v16;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v37;
      _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v34);
  }
LABEL_24:

}

- (void)configurePersonManagerWithZoneUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  HMDHomePersonDataManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDHomePersonDataManager *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomePersonDataManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomePersonDataManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDHomePersonDataManager personManagerFactory](self, "personManagerFactory");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDHomePersonDataManager workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id, void *))v7)[2](v7, v6, v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomePersonDataManager setPersonManager:](self, "setPersonManager:", v9);

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomePersonDataManager personManager](v11, "personManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring home person manager: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDHomePersonDataManager personManager](v11, "personManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configureWithHome:", v6);

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)removeCloudDataDueToHomeGraphObjectRemoval:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomePersonDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  -[HMDHomePersonDataManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomePersonDataManager personManager](self, "personManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing home person cloud data", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDHomePersonDataManager personManager](v8, "personManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0CBA568]);
    objc_msgSend(v11, "handleUpdatedSettings:", v12);

    -[HMDHomePersonDataManager personManager](v8, "personManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "removeAllAssociatedDataDueToHomeGraphObjectRemoval:", v3);

    -[HMDHomePersonDataManager setPersonManager:](v8, "setPersonManager:", 0);
    -[HMDHomePersonDataManager home](v8, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentUser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "personSettingsManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "remove");

  }
}

- (void)handleUpdateSettingsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomePersonDataManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HMDHomePersonDataManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomePersonDataManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update person manager settings message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v11 = *MEMORY[0x1E0CB91A8];
  v29 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDHomePersonDataManager updateSettingsModelWithSettings:](v7, "updateSettingsModelWithSettings:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __56__HMDHomePersonDataManager_handleUpdateSettingsMessage___block_invoke;
    v27[3] = &unk_1E89C21E8;
    v16 = v4;
    v28 = v16;
    objc_msgSend(v14, "addSuccessBlock:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __56__HMDHomePersonDataManager_handleUpdateSettingsMessage___block_invoke_2;
    v25[3] = &unk_1E89C2350;
    v26 = v16;
    v18 = (id)objc_msgSend(v17, "addFailureBlock:", v25);

    v19 = v28;
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find person manager settings in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v19);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomePersonDataManager homeUUID](self, "homeUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDHomePersonManager)personManager
{
  return (HMDHomePersonManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersonManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (id)personManagerFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setPersonManagerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_personManagerFactory, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
}

uint64_t __56__HMDHomePersonDataManager_handleUpdateSettingsMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __56__HMDHomePersonDataManager_handleUpdateSettingsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

uint64_t __85__HMDHomePersonDataManager_handleUpdatedSettingsModel_previousSettingsModel_message___block_invoke(uint64_t a1)
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
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
LABEL_4:
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = (void *)MEMORY[0x1D17BA0A0]();
      v3 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v5;
        _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Home person manager zone UUID is now nil. Removing home person manager", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v2);
      objc_msgSend(*(id *)(a1 + 48), "removeCloudDataDueToHomeGraphObjectRemoval:", 0);
      return objc_msgSend(*(id *)(a1 + 72), "respondWithSuccess");
    }
LABEL_8:
    objc_msgSend(*(id *)(a1 + 48), "personManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleUpdatedSettings:", *(_QWORD *)(a1 + 64));

    return objc_msgSend(*(id *)(a1 + 72), "respondWithSuccess");
  }
  if ((HMFEqualObjects() & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 32))
      goto LABEL_8;
    goto LABEL_4;
  }
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 56), "personManagerZoneUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Home person manager zone UUID changed from %@ to %@. Configuring home person manager", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 48), "removeCloudDataDueToHomeGraphObjectRemoval:", 0);
  objc_msgSend(*(id *)(a1 + 48), "configurePersonManagerWithZoneUUID:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 72), "respondWithSuccess");
}

uint64_t __60__HMDHomePersonDataManager_updateSettingsModelWithSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

uint64_t __37__HMDHomePersonDataManager_configure__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "configurePersonManagerWithZoneUUID:");
  return result;
}

HMDHomePersonManager *__51__HMDHomePersonDataManager_initWithHome_workQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  HMDHomePersonManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = -[HMDHomePersonManager initWithHome:zoneUUID:workQueue:]([HMDHomePersonManager alloc], "initWithHome:zoneUUID:workQueue:", v8, v7, v6);

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_128066 != -1)
    dispatch_once(&logCategory__hmf_once_t17_128066, &__block_literal_global_25_128067);
  return (id)logCategory__hmf_once_v18_128068;
}

void __39__HMDHomePersonDataManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18_128068;
  logCategory__hmf_once_v18_128068 = v0;

}

@end
