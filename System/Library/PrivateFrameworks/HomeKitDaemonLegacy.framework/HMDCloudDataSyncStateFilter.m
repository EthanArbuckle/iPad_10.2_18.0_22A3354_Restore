@implementation HMDCloudDataSyncStateFilter

- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  id *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a3;
  v9 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  -[HMDMessageFilter workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HMDCloudDataSyncStateFilter_acceptMessage_target_errorReason___block_invoke;
  v13[3] = &unk_1E89BE2C8;
  v13[4] = self;
  v14 = v8;
  v15 = &v17;
  v16 = a5;
  v11 = v8;
  dispatch_sync(v10, v13);

  LOBYTE(v8) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t109_83426 != -1)
    dispatch_once(&logCategory__hmf_once_t109_83426, &__block_literal_global_164_83427);
  return (id)logCategory__hmf_once_v110_83428;
}

- (BOOL)dataSyncInProgressWithState:(unint64_t *)a3 withMessage:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  HMDCloudDataSyncStateFilter *v14;
  id v15;
  uint64_t *v16;
  unint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[HMDMessageFilter workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __71__HMDCloudDataSyncStateFilter_dataSyncInProgressWithState_withMessage___block_invoke;
  v13 = &unk_1E89BE2C8;
  v16 = &v18;
  v14 = self;
  v8 = v6;
  v15 = v8;
  v17 = a3;
  dispatch_sync(v7, &v10);

  -[HMDCloudDataSyncStateFilter _moveDirectlyToHH2IfAccountIsEmpty](self, "_moveDirectlyToHH2IfAccountIsEmpty", v10, v11, v12, v13, v14);
  LOBYTE(self) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)self;
}

- (void)_moveDirectlyToHH2IfAccountIsEmpty
{
  int AppBooleanValue;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  HMDCloudDataSyncStateFilter *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DefaultNewUsersToHH2Enabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0);
  if ((_os_feature_enabled_impl() & 1) != 0 || AppBooleanValue)
  {
    -[HMDCloudDataSyncStateFilter homeManager](self, "homeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsServerBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHH2SoftwareReleased");

    if ((v6 & 1) != 0)
    {
      if (-[HMDCloudDataSyncStateFilter areWeAllowedToAutoMigrateEmptyAccountsToHH2](self, "areWeAllowedToAutoMigrateEmptyAccountsToHH2"))
      {
        if (!objc_msgSend(v4, "areThereAnyTTSUSessionsOngoing"))
        {
          -[HMDMessageFilter workQueue](self, "workQueue");
          v15 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke;
          block[3] = &unk_1E89C2730;
          block[4] = self;
          dispatch_async(v15, block);

          goto LABEL_15;
        }
        v7 = (void *)MEMORY[0x1D17BA0A0]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v18 = v10;
          v11 = "%{public}@Not migrating to HH2 as a TTSU session is ongoing.";
LABEL_12:
          _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
          goto LABEL_13;
        }
      }
      else
      {
        v7 = (void *)MEMORY[0x1D17BA0A0]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v18 = v10;
          v11 = "%{public}@Not migrating empty account to HH2 as 'allowed to auto migrate empty accounts' is NO.";
          goto LABEL_12;
        }
      }
    }
    else
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCloudDataSyncStateFilter homeManager](v8, "homeManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "idsServerBag");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "isHH2SoftwareReleased");
        HMFBooleanToString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Can't migrate empty account to HH2 as HH2 software released server bag value is %@", buf, 0x16u);

LABEL_13:
      }
    }

    objc_autoreleasePoolPop(v7);
LABEL_15:

  }
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (BOOL)areWeAllowedToAutoMigrateEmptyAccountsToHH2
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("stopAutoMigratingEmptyAccountsToHH2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return (CFPreferencesGetAppBooleanValue(CFSTR("stopAutoMigratingEmptyAccountsToHH2"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0) & ~v4;
}

void __64__HMDCloudDataSyncStateFilter_acceptMessage_target_errorReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "supportsKeychainSync")
    || !objc_msgSend(*(id *)(a1 + 32), "iCloudAccountActive")
    || objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled"))
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[HMDCloudDataSyncStateFilter isAllowedMessage:](HMDCloudDataSyncStateFilter, "isAllowedMessage:", v22);

  if (v23
    || !objc_msgSend(*(id *)(a1 + 32), "isKeychainSyncPeerAvailable")
    || objc_msgSend(*(id *)(a1 + 32), "totalHomes") <= 0
    && (objc_msgSend(*(id *)(a1 + 40), "name"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("kAddHomeRequestKey")),
        v24,
        !v25))
  {
LABEL_5:
    v43 = 0;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[HMDCloudDataSyncStateFilter isAllowedMessage:](HMDCloudDataSyncStateFilter, "isAllowedMessage:", v3))
    {

    }
    else
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", *(_QWORD *)(a1 + 40), 0, &v43, 0);

      if (v4)
      {
        if (*(_QWORD *)(a1 + 56))
        {
          if (v43)
            v5 = 23;
          else
            v5 = 77;
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], v5, 0);
          **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        v6 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v8;
          v48 = 2112;
          v49 = v9;
          _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since cloud data sync is in progress", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v6);
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "cloudDataSyncCompleted");
          HMFBooleanToString();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "serverTokenAvailable");
          HMFBooleanToString();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "isCloudDataSyncPeerAvailable");
          HMFBooleanToString();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v47 = v12;
          v48 = 2112;
          v49 = v13;
          v50 = 2112;
          v51 = v14;
          v52 = 2112;
          v53 = v15;
          _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@cloudDataSyncCompleted: %@, serverTokenAvailable: %@, cloudDataSyncPeerAvailable: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v10);
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "networkConnectivityAvailable");
          HMFBooleanToString();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "iCloudAccountActive");
          HMFBooleanToString();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v47 = v18;
          v48 = 2112;
          v49 = v19;
          v50 = 2112;
          v51 = v20;
          v52 = 2112;
          v53 = v21;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@networkConnectivityAvailable: %@, iCloudAccountActive: %@, decryptionFailed: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v16);
      }
    }
    return;
  }
  v26 = *(void **)(a1 + 32);
  +[HMDAppleAccountSettings sharedSettings](HMDAppleAccountSettings, "sharedSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_updateKeychainSyncEnabled:", objc_msgSend(v27, "isKeychainSyncEnabled"));

  if (objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled"))
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v30;
      v48 = 2112;
      v49 = v31;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Resampled keychain sync state and it is enabled, accepting message %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    goto LABEL_5;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 76, 0);
    **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  v32 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v34;
    v48 = 2112;
    v49 = v35;
    _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Rejecting message %@ since keychain sync is not enabled", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v32);
  if ((objc_msgSend(*(id *)(a1 + 40), "isEntitledForSPIAccess") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "keychainSyncRequiredPopShown") & 1) == 0)
  {
    v36 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v38;
      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting dialog about keychain sync being required since we have more than one account", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
    objc_msgSend(*(id *)(a1 + 32), "setKeychainSyncRequiredPopShown:", 1);
    +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "name");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *(void **)(a1 + 32);
    objc_msgSend(v41, "workQueue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __64__HMDCloudDataSyncStateFilter_acceptMessage_target_errorReason___block_invoke_152;
    v44[3] = &unk_1E89B5420;
    objc_copyWeak(&v45, (id *)buf);
    objc_msgSend(v39, "displayKeychainSyncForHome:withContext:queue:completionHandler:", v40, v41, v42, v44);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);

  }
}

+ (BOOL)isAllowedMessage:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isAllowedMessage__pred;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isAllowedMessage__pred, &__block_literal_global_167_83424);
  v5 = objc_msgSend((id)isAllowedMessage___allowedMessages, "containsObject:", v4);

  return v5;
}

uint64_t __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalHomes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hasHH2MigrationAlreadyRequested");
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Going to check whether there are homes in the account or not: [homes = %@] [HH2 migration requested: %@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  result = objc_msgSend(*(id *)(a1 + 32), "totalHomes");
  if (!result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_verifyAccountStatusForMigration");
    if ((_DWORD)result)
    {
      v9 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke_123;
      v10[3] = &unk_1E89C0E48;
      v10[4] = v9;
      return objc_msgSend(v9, "totalHomesInCloudZones:", v10);
    }
  }
  return result;
}

- (int64_t)totalHomes
{
  return self->_totalHomes;
}

- (BOOL)hasHH2MigrationAlreadyRequested
{
  return self->_hasHH2MigrationAlreadyRequested;
}

- (BOOL)_verifyAccountStatusForMigration
{
  HMDCloudDataSyncStateFilter *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  HMDCloudDataSyncStateFilter *v7;
  HMDCloudDataSyncStateFilter *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v2 = self;
  v16 = *MEMORY[0x1E0C80C00];
  if (-[HMDCloudDataSyncStateFilter iCloudAccountActive](self, "iCloudAccountActive"))
  {
    if (-[HMDCloudDataSyncStateFilter hasHH2MigrationAlreadyRequested](v2, "hasHH2MigrationAlreadyRequested"))
    {
      v3 = (void *)MEMORY[0x1D17BA0A0]();
      v2 = v2;
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v13 = v5;
        v6 = "%{public}@Migration to HH2 is already requested. Not requesting again.";
LABEL_16:
        _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
LABEL_17:

      }
    }
    else if (-[HMDCloudDataSyncStateFilter networkConnectivityAvailable](v2, "networkConnectivityAvailable"))
    {
      if (-[HMDCloudDataSyncStateFilter isHomeManagerFirstFetchFinished](v2, "isHomeManagerFirstFetchFinished"))
      {
        v11 = 0;
        if (-[HMDCloudDataSyncStateFilter _cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:](v2, "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", 0, 1, 0, &v11))
        {
          v3 = (void *)MEMORY[0x1D17BA0A0]();
          v7 = v2;
          HMFGetOSLogHandle();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v13 = v5;
            v6 = "%{public}@cloud data is still syncing. Let's re-evaluate HH2 migration condition once it is done";
            goto LABEL_16;
          }
        }
        else
        {
          if (v11 == 1)
            return 1;
          v3 = (void *)MEMORY[0x1D17BA0A0]();
          v9 = v2;
          HMFGetOSLogHandle();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v13 = v5;
            v14 = 2112;
            v15 = v10;
            _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@HH1 data sync state is not good yet. %@", buf, 0x16u);

            goto LABEL_17;
          }
        }
      }
      else
      {
        v3 = (void *)MEMORY[0x1D17BA0A0]();
        v2 = v2;
        HMFGetOSLogHandle();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v13 = v5;
          v6 = "%{public}@First fetch for Home Manager's zone is not done yet.";
          goto LABEL_16;
        }
      }
    }
    else
    {
      v3 = (void *)MEMORY[0x1D17BA0A0]();
      v2 = v2;
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v13 = v5;
        v6 = "%{public}@Network is not reachable right now. Not auto migrating account.";
        goto LABEL_16;
      }
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v2 = v2;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      v6 = "%{public}@iCloud account is not signed in. Not going to auto migrate empty account.";
      goto LABEL_16;
    }
  }

  objc_autoreleasePoolPop(v3);
  return 0;
}

uint64_t __71__HMDCloudDataSyncStateFilter_dataSyncInProgressWithState_withMessage___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", *(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_cloudSyncinProgressCheck:(id)a3 supressPopup:(BOOL)a4 sendCanceledError:(BOOL *)a5 dataSyncState:(unint64_t *)a6
{
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  HMDCloudDataSyncStateFilter *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  _BOOL4 decryptionFailed;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  _QWORD v77[4];
  id v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v8 = a4;
  v83 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__onceToken == -1)
  {
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__onceToken, &__block_literal_global_156);
  if (a5)
LABEL_3:
    *a5 = 0;
LABEL_4:
  if (a6)
    *a6 = 1;
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "supportsKeychainSync")
    && -[HMDCloudDataSyncStateFilter iCloudAccountActive](self, "iCloudAccountActive")
    && !-[HMDCloudDataSyncStateFilter keychainSyncEnabled](self, "keychainSyncEnabled"))
  {
    if (-[HMDCloudDataSyncStateFilter isKeychainSyncPeerAvailable](self, "isKeychainSyncPeerAvailable"))
    {

    }
    else
    {
      decryptionFailed = self->_decryptionFailed;

      if (!decryptionFailed)
        goto LABEL_10;
    }
    objc_msgSend(v10, "name");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      if (objc_msgSend(v10, "isEntitledForSPIAccess")
        && (v65 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages,
            objc_msgSend(v10, "name"),
            v66 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(v65) = objc_msgSend(v65, "containsObject:", v66),
            v66,
            (_DWORD)v65))
      {
        v67 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v69;
          v81 = 2112;
          v82 = v70;
          _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@Allowing the message %@ though Keychain is not enabled", buf, 0x16u);

        }
        v26 = 0;
      }
      else
      {
        v67 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        v26 = 1;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v71;
          v81 = 2112;
          v82 = v72;
          _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since Keychain is not enabled and there are peers", buf, 0x16u);

          v26 = 1;
        }
      }

      objc_autoreleasePoolPop(v67);
      if (!a6)
        goto LABEL_103;
    }
    else
    {
      v26 = 1;
      if (!a6)
        goto LABEL_103;
    }
    v73 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v75;
      _os_log_impl(&dword_1CD062000, v74, OS_LOG_TYPE_INFO, "%{public}@Setting data sync state to keychain not enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v73);
    v62 = 2;
LABEL_102:
    *a6 = v62;
    goto LABEL_103;
  }

LABEL_10:
  if (-[HMDCloudDataSyncStateFilter iCloudAccountActive](self, "iCloudAccountActive")
    && !-[HMDCloudDataSyncStateFilter iCloudSwitchStateEnabled](self, "iCloudSwitchStateEnabled"))
  {
    objc_msgSend(v10, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (objc_msgSend(v10, "isEntitledForSPIAccess")
        && (v20 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages,
            objc_msgSend(v10, "name"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(v20) = objc_msgSend(v20, "containsObject:", v21),
            v21,
            (_DWORD)v20))
      {
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v24;
          v81 = 2112;
          v82 = v25;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Allowing message %@ though iCloud Switch is not enabled", buf, 0x16u);

        }
        v26 = 0;
      }
      else
      {
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        v26 = 1;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v36;
          v81 = 2112;
          v82 = v37;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since iCloud Switch is not enabled", buf, 0x16u);

          v26 = 1;
        }
      }

      objc_autoreleasePoolPop(v22);
      if (!v10)
        goto LABEL_85;
    }
    else
    {
      v26 = 1;
      if (!v10)
      {
LABEL_85:
        if (!a6)
          goto LABEL_103;
        v62 = 3;
        goto LABEL_102;
      }
    }
    if ((objc_msgSend(v10, "isEntitledForSPIAccess") & 1) == 0
      && !-[HMDCloudDataSyncStateFilter iCloudSwitchRequiredPopShown](self, "iCloudSwitchRequiredPopShown")
      && !v8)
    {
      v57 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v80 = v59;
        _os_log_impl(&dword_1CD062000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting dialog about iCloud Switch being required", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v57);
      -[HMDCloudDataSyncStateFilter setICloudSwitchRequiredPopShown:](self, "setICloudSwitchRequiredPopShown:", 1);
      if (a5)
        *a5 = 1;
      +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      -[HMDMessageFilter workQueue](self, "workQueue");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __102__HMDCloudDataSyncStateFilter__cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___block_invoke_159;
      v77[3] = &unk_1E89B5420;
      objc_copyWeak(&v78, (id *)buf);
      objc_msgSend(v60, "displayiCloudSwitchWithContext:queue:completionHandler:", self, v61, v77);

      objc_destroyWeak(&v78);
      objc_destroyWeak((id *)buf);

    }
    goto LABEL_85;
  }
  if (isWatch())
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "supportsCloudDataSync") & 1) != 0)
    {
      v13 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__watchAllowedCommands;
      objc_msgSend(v10, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = objc_msgSend(v13, "containsObject:", v14);

      if ((_DWORD)v13)
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v17;
          v81 = 2112;
          v82 = v18;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Allowing configuration message (%@) on watch supporting cloud data sync", buf, 0x16u);

        }
LABEL_74:

        objc_autoreleasePoolPop(v15);
LABEL_75:
        v26 = 0;
        goto LABEL_103;
      }
    }
    else
    {

    }
  }
  if (!-[HMDCloudDataSyncStateFilter iCloudAccountActive](self, "iCloudAccountActive")
    || -[HMDCloudDataSyncStateFilter cloudDataSyncCompleted](self, "cloudDataSyncCompleted")
    || -[HMDCloudDataSyncStateFilter serverTokenAvailable](self, "serverTokenAvailable")
    || !-[HMDCloudDataSyncStateFilter isCloudDataSyncPeerAvailable](self, "isCloudDataSyncPeerAvailable"))
  {
    if (-[HMDCloudDataSyncStateFilter iCloudAccountActive](self, "iCloudAccountActive")
      && !-[HMDCloudDataSyncStateFilter serverTokenAvailable](self, "serverTokenAvailable"))
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v34;
        v81 = 2112;
        v82 = v35;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since signed into cloud, no valid server token", buf, 0x16u);

      }
    }
    else if (-[HMDCloudDataSyncStateFilter iCloudAccountActive](self, "iCloudAccountActive")
           && !-[HMDCloudDataSyncStateFilter cloudDataSyncCompleted](self, "cloudDataSyncCompleted"))
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v38;
        v81 = 2112;
        v82 = v39;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since signed into cloud, but initial sync is not complete", buf, 0x16u);

      }
    }
    else if (-[HMDCloudDataSyncStateFilter iCloudAccountActive](self, "iCloudAccountActive")
           && -[HMDCloudDataSyncStateFilter cloudDataSyncCompleted](self, "cloudDataSyncCompleted")
           && self->_decryptionFailed)
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v30;
        v81 = 2112;
        v82 = v31;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since decryption failed", buf, 0x16u);

      }
    }
    else
    {
      if (!-[HMDCloudDataSyncStateFilter localDataDecryptionFailed](self, "localDataDecryptionFailed"))
      {
        v26 = 0;
        goto LABEL_62;
      }
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v32;
        v81 = 2112;
        v82 = v33;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since local data decryption failed", buf, 0x16u);

      }
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = v29;
      v81 = 2112;
      v82 = v10;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Rejecting message %@ since server token unavailable and cloud sync not completed and transient devices present", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v27);
  if (a6)
  {
    if (-[HMDCloudDataSyncStateFilter resetConfigDisplayTimeHasElapsed](self, "resetConfigDisplayTimeHasElapsed"))
    {
      *a6 = 5;
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v80 = v42;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Setting data sync state to requiring configuration reset", buf, 0xCu);

      }
    }
    else
    {
      *a6 = 4;
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v80 = v43;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Setting data sync state to waiting for cloud data", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v40);
  }
  v26 = 1;
LABEL_62:
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "account");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isRemoteGatewayCapable");

    if (v47
      && !+[HMDKeyTransferAgentServer isPeerAvailable](HMDKeyTransferAgentServer, "isPeerAvailable"))
    {
      v48 = (void *)MEMORY[0x1D17BA0A0]();
      v49 = self;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v80 = v51;
        _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_INFO, "%{public}@Allowing message due to no key transfer peers available", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v48);
      goto LABEL_75;
    }
  }
  else
  {

  }
  objc_msgSend(v10, "name");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52 || (objc_msgSend(v10, "isEntitledForSPIAccess") & 1) == 0)
  {

    goto LABEL_103;
  }
  v53 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages;
  objc_msgSend(v10, "name");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v53) = objc_msgSend(v53, "containsObject:", v54);

  if ((_DWORD)v53)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = v55;
      v81 = 2112;
      v82 = v56;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Allowing the message %@", buf, 0x16u);

    }
    goto LABEL_74;
  }
LABEL_103:

  return v26;
}

- (BOOL)iCloudAccountActive
{
  return self->_iCloudAccountActive;
}

- (BOOL)localDataDecryptionFailed
{
  return self->_localDataDecryptionFailed;
}

- (HMDCloudDataSyncStateFilter)initWithName:(id)a3 homeManager:(id)a4 messageDispatcher:(id)a5 serverTokenAvailable:(BOOL)a6 homeDataHasBeenDecrypted:(BOOL)a7 homeManagerServerTokenAvailable:(BOOL)a8 localDataDecryptionFailed:(BOOL)a9 totalHomes:(int64_t)a10 currentAccount:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  HMDCloudDataSyncStateFilter *v21;
  int64_t v22;
  uint64_t v23;
  OS_os_log *logger;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _BOOL4 keychainSyncEnabled;
  OS_dispatch_source *popupTimer;
  uint64_t v31;
  NSUUID *uuid;
  void *v33;
  void *v34;
  void *v35;
  BOOL v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a11;
  v38.receiver = self;
  v38.super_class = (Class)HMDCloudDataSyncStateFilter;
  v21 = -[HMDMessageFilter initWithName:](&v38, sel_initWithName_, v17);
  if (v21)
  {
    v37 = a8;
    v22 = a10;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    logger = v21->_logger;
    v21->_logger = (OS_os_log *)v23;

    v21->_hh1FirstCloudSyncComplete = 0;
    objc_storeStrong((id *)&v21->_msgDispatcher, a5);
    +[HMDAppleAccountSettings sharedSettings](HMDAppleAccountSettings, "sharedSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v21->_keychainSyncEnabled = objc_msgSend(v25, "isKeychainSyncEnabled");

    v26 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      keychainSyncEnabled = v21->_keychainSyncEnabled;
      *(_DWORD *)buf = 138543618;
      v40 = v28;
      v41 = 1024;
      v42 = keychainSyncEnabled;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Key chain sync enabled is set to: %d", buf, 0x12u);

      v22 = a10;
    }

    objc_autoreleasePoolPop(v26);
    popupTimer = v21->_popupTimer;
    v21->_popupTimer = 0;

    v21->_keychainSyncRequiredPopShown = 0;
    v21->_iCloudAccountActive = 0;
    v21->_cloudDataSyncCompleted = (v37 | ~a7) & a6;
    v21->_serverTokenAvailable = a6;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v31 = objc_claimAutoreleasedReturnValue();
    uuid = v21->_uuid;
    v21->_uuid = (NSUUID *)v31;

    v21->_totalHomes = v22;
    objc_storeWeak((id *)&v21->_homeManager, v18);
    v21->_remainingDataSyncPeriod = 0.0;
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v21->_decryptionFailed = (objc_msgSend(v33, "supportsStandaloneMode") | a7) ^ 1;

    v21->_localDataDecryptionFailed = a9;
    -[HMDCloudDataSyncStateFilter _updateCurrentAccount:](v21, "_updateCurrentAccount:", v20);
    -[HMDCloudDataSyncStateFilter _registerForMessages](v21, "_registerForMessages");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v21, sel_handleKeychainSyncStateChangedNotification_, CFSTR("HMDAppleAccountSettingsKeychainSyncStateUpdatedNotificationKey"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v21, sel__handleCloudZoneReadyNotification_, CFSTR("HMDCloudZoneReadyNotification"), 0);

  }
  return v21;
}

- (void)_registerForMessages
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HMDCloudDataSyncStateFilter msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__HMDCloudDataSyncStateFilter__registerForMessages__block_invoke;
  v4[3] = &unk_1E89C1AD0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerForMessage:receiver:messageHandler:", CFSTR("kiCloudAccountChangedNotificationKey"), self, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HMDCloudDataSyncStateFilter msgDispatcher](self, "msgDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HMDCloudDataSyncStateFilter;
  -[HMDCloudDataSyncStateFilter dealloc](&v5, sel_dealloc);
}

- (void)_updateKeychainSyncEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[HMDCloudDataSyncStateFilter keychainSyncEnabled](self, "keychainSyncEnabled") == a3)
    return;
  v5 = -[HMDCloudDataSyncStateFilter setKeychainSyncEnabled:](self, "setKeychainSyncEnabled:", v3);
  if (!self->_decryptionFailed)
  {
    if (!v3)
      return;
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x1D17BA0A0](v5);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Keychain has been enabled but decryption had failed earlier, starting data reset timers", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = -[HMDCloudDataSyncStateFilter _startDataConfigResetTimers](self, "_startDataConfigResetTimers");
LABEL_8:
    v10 = (void *)MEMORY[0x1D17BA0A0](v5);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Keychain just got enabled, requesting an upload if necessary", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCloudDataSyncStateFilter homeManager](self, "homeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "determineLocalChangesAndSchedulePush");

    return;
  }
  if (v8)
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v14;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Decryption had failed earlier but keychain is not enabled, stopping data reset timers", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCloudDataSyncStateFilter _stopDataConfigResetTimers](self, "_stopDataConfigResetTimers");
}

- (void)handleKeychainSyncStateChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDMessageFilter workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HMDCloudDataSyncStateFilter_handleKeychainSyncStateChangedNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_postNotificationForDataSyncInProgress:(BOOL)a3 dataSyncState:(unint64_t)a4 forcePost:(BOOL)a5
{
  _BOOL4 v7;
  _BOOL8 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v7 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v9 = -[HMDCloudDataSyncStateFilter _cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:](self, "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", 0, 1, 0, &v17);
  if (a5 || v9 != v7 || v17 != a4)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0](v9);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Posting notification kCloudDataSyncInProgressUpdatedNotification", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("kCloudDataSyncInProgressUpdatedNotification"), self);

    -[HMDCloudDataSyncStateFilter homeManager](self, "homeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "metricsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceStateManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateWithDataSyncState:", v17);

  }
  -[HMDCloudDataSyncStateFilter _evaluateMoveToHH2](self, "_evaluateMoveToHH2");
}

- (void)evaluateMoveToHH2
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMessageFilter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HMDCloudDataSyncStateFilter_evaluateMoveToHH2__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_evaluateMoveToHH2
{
  -[HMDCloudDataSyncStateFilter _moveDirectlyToHH2IfAccountIsEmpty](self, "_moveDirectlyToHH2IfAccountIsEmpty");
  -[HMDCloudDataSyncStateFilter moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes:](self, "moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes:", 1);
}

- (void)moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  if (_os_feature_enabled_impl())
  {
    -[HMDMessageFilter workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke;
    v6[3] = &unk_1E89C2758;
    v6[4] = self;
    v7 = a3;
    dispatch_async(v5, v6);

  }
}

- (void)_detectAndMigrateSharedUserWithEmptyOwnedHomes
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[HMDCloudDataSyncStateFilter homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke;
  v6[3] = &unk_1E89C2328;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)_handleCloudZoneReadyNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCloudDataSyncStateFilter *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  HMDCloudDataSyncStateFilter *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("HMDCR.id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_BOOLForKey:", CFSTR("HMDCR.stc"));
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Cloud manager completed initial fetch for zone %@, didServerTokenChange: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDMessageFilter workQueue](v8, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HMDCloudDataSyncStateFilter__handleCloudZoneReadyNotification___block_invoke;
  block[3] = &unk_1E89C20C8;
  v17 = v6;
  v18 = v8;
  v19 = v5;
  v14 = v5;
  v15 = v6;
  dispatch_async(v13, block);

}

- (void)totalHomesInCloudZones:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[HMDCloudDataSyncStateFilter homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudDataSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManagerZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HMDCloudDataSyncStateFilter_totalHomesInCloudZones___block_invoke;
  v10[3] = &unk_1E89C0960;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "cloudRecordsForParentID:completionHandler:", v8, v10);

}

- (BOOL)decryptionFailed
{
  HMDCloudDataSyncStateFilter *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HMDMessageFilter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HMDCloudDataSyncStateFilter_decryptionFailed__block_invoke;
  v5[3] = &unk_1E89C0800;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setDecryptionFailed:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDMessageFilter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HMDCloudDataSyncStateFilter_setDecryptionFailed___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)startDataConfigResetTimers
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMessageFilter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HMDCloudDataSyncStateFilter_startDataConfigResetTimers__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_startDataConfigResetTimers
{
  -[HMDCloudDataSyncStateFilter _startCloudDataSyncTimer](self, "_startCloudDataSyncTimer");
  if (!-[HMDCloudDataSyncStateFilter resetConfigDisplayTimeHasElapsed](self, "resetConfigDisplayTimeHasElapsed"))
    -[HMDCloudDataSyncStateFilter _startResetConfigDisplayTimer](self, "_startResetConfigDisplayTimer");
}

- (void)_stopDataConfigResetTimers
{
  -[HMDCloudDataSyncStateFilter _stopCloudDataSyncTimer](self, "_stopCloudDataSyncTimer");
  -[HMDCloudDataSyncStateFilter _stopResetConfigDisplayTimer](self, "_stopResetConfigDisplayTimer");
}

- (void)updateNetworkConnectivity:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDMessageFilter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HMDCloudDataSyncStateFilter_updateNetworkConnectivity___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDCloudDataSyncStateFilter *v9;

  v4 = a3;
  -[HMDMessageFilter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HMDCloudDataSyncStateFilter_timerDidFire___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_startCloudDataSyncTimer
{
  void *v3;
  char v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsKeychainSync");

  if ((v4 & 1) != 0)
  {
    v5 = -[HMDCloudDataSyncStateFilter remainingDataSyncPeriod](self, "remainingDataSyncPeriod");
    if (v6 <= 0.0)
    {
      v7 = (double)(unint64_t)cloudDataSyncInProgressWaitPeriod;
      v8 = (void *)MEMORY[0x1D17BA0A0](v5);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v10;
        v25 = 2048;
        v26 = v7;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Timer does not exist, initializing it to %lf", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v5 = -[HMDCloudDataSyncStateFilter setRemainingDataSyncPeriod:](self, "setRemainingDataSyncPeriod:", v7);
    }
    v11 = (void *)MEMORY[0x1D17BA0A0](v5);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudDataSyncStateFilter remainingDataSyncPeriod](self, "remainingDataSyncPeriod");
      v23 = 138543618;
      v24 = v13;
      v25 = 2048;
      v26 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting a timer with %lf seconds to wait for cloud data sync to complete", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCloudDataSyncStateFilter cloudDataSyncInProgressTimer](self, "cloudDataSyncInProgressTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

    v16 = objc_alloc(MEMORY[0x1E0D286C8]);
    -[HMDCloudDataSyncStateFilter remainingDataSyncPeriod](self, "remainingDataSyncPeriod");
    v17 = (void *)objc_msgSend(v16, "initWithTimeInterval:options:", 1);
    -[HMDCloudDataSyncStateFilter setCloudDataSyncInProgressTimer:](self, "setCloudDataSyncInProgressTimer:", v17);

    -[HMDCloudDataSyncStateFilter cloudDataSyncInProgressTimer](self, "cloudDataSyncInProgressTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resume");

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudDataSyncStateFilter setDataSyncTimerStartTimestamp:](self, "setDataSyncTimerStartTimestamp:", v19);

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Cloud data sync timer is not valid on devices without keychain sync", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }
}

- (void)_stopCloudDataSyncTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping cloud data sync timer", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCloudDataSyncStateFilter _resetCloudDataSyncTimer](self, "_resetCloudDataSyncTimer");
}

- (void)_resetCloudDataSyncTimer
{
  -[HMDCloudDataSyncStateFilter setCloudDataSyncInProgressTimer:](self, "setCloudDataSyncInProgressTimer:", 0);
  -[HMDCloudDataSyncStateFilter setDataSyncTimerStartTimestamp:](self, "setDataSyncTimerStartTimestamp:", 0);
  -[HMDCloudDataSyncStateFilter setRemainingDataSyncPeriod:](self, "setRemainingDataSyncPeriod:", 0.0);
}

- (void)_stallCloudDataSyncTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  int v22;
  void *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDCloudDataSyncStateFilter cloudDataSyncInProgressTimer](self, "cloudDataSyncInProgressTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v20;
      v21 = "%{public}@There is no cloud sync timer running?";
LABEL_13:
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v22, 0xCu);

    }
LABEL_14:

    objc_autoreleasePoolPop(v18);
    return;
  }
  -[HMDCloudDataSyncStateFilter dataSyncTimerStartTimestamp](self, "dataSyncTimerStartTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v20;
      v21 = "%{public}@There is data sync timer timestamp timer running?";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  -[HMDCloudDataSyncStateFilter setCloudDataSyncInProgressTimer:](self, "setCloudDataSyncInProgressTimer:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudDataSyncStateFilter dataSyncTimerStartTimestamp](self, "dataSyncTimerStartTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v11;
    v24 = 2048;
    v25 = v8;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Stalling the cloud data sync timer, %lf seconds have passed on this timer", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCloudDataSyncStateFilter remainingDataSyncPeriod](self, "remainingDataSyncPeriod");
  -[HMDCloudDataSyncStateFilter setRemainingDataSyncPeriod:](self, "setRemainingDataSyncPeriod:", v12 - v8);
  v13 = -[HMDCloudDataSyncStateFilter remainingDataSyncPeriod](self, "remainingDataSyncPeriod");
  if (v14 <= 0.0)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0](v13);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Remaining period became less than 0?", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCloudDataSyncStateFilter setRemainingDataSyncPeriod:](self, "setRemainingDataSyncPeriod:", (double)(unint64_t)cloudDataSyncInProgressWaitPeriod);
  }
}

- (void)kickResetConfigDisplayTimer
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMessageFilter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMDCloudDataSyncStateFilter_kickResetConfigDisplayTimer__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_startResetConfigDisplayTimer
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  double v25;
  double v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  int v42;
  void *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!+[HMDDeviceCapabilities supportsCustomerReset](HMDDeviceCapabilities, "supportsCustomerReset"))
  {
    v21 = MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543362;
      v43 = v23;
      v24 = "%{public}@Reset config display timer is not valid on this platform";
LABEL_22:
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v42, 0xCu);

    }
LABEL_23:

    v39 = (void *)v21;
    goto LABEL_24;
  }
  +[HMDDeviceSetupManager sharedManager](HMDDeviceSetupManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunning");

  -[HMDCloudDataSyncStateFilter resetConfigDisplayTimer](self, "resetConfigDisplayTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((v4 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudDataSyncStateFilter resetConfigDisplayTimerStartTimestamp](self, "resetConfigDisplayTimerStartTimestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v7);
      v9 = v8;

      v10 = -[HMDCloudDataSyncStateFilter remainingResetConfigDisplayPeriod](self, "remainingResetConfigDisplayPeriod");
      v12 = v11 - v9;
      v13 = (double)(unint64_t)controllerKeyNotLandingShortCircuitWaitPeriod;
      v14 = (void *)MEMORY[0x1D17BA0A0](v10);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v12 >= v13)
      {
        if (v16)
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 138543362;
          v43 = v17;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Reset config display timer is running but short circuit time is less than current remaining, restarting timer", (uint8_t *)&v42, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        -[HMDCloudDataSyncStateFilter _stopResetConfigDisplayTimer](self, "_stopResetConfigDisplayTimer");
        v18 = -[HMDCloudDataSyncStateFilter remainingResetConfigDisplayPeriod](self, "remainingResetConfigDisplayPeriod");
        if (v19 > 0.0)
          goto LABEL_17;
        v20 = &controllerKeyNotLandingShortCircuitWaitPeriod;
        goto LABEL_14;
      }
      if (v16)
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCloudDataSyncStateFilter remainingResetConfigDisplayPeriod](self, "remainingResetConfigDisplayPeriod");
        v42 = 138543874;
        v43 = v40;
        v44 = 2048;
        v45 = v41 - v9;
        v46 = 2048;
        v47 = controllerKeyNotLandingShortCircuitWaitPeriod;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Reset config display timer is already running and remaining time %lf is less than short circuit time %lu", (uint8_t *)&v42, 0x20u);

      }
      v39 = v14;
LABEL_24:
      objc_autoreleasePoolPop(v39);
      return;
    }
    v21 = MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543362;
      v43 = v23;
      v24 = "%{public}@Reset config display timer is already running, not restarting";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v18 = -[HMDCloudDataSyncStateFilter remainingResetConfigDisplayPeriod](self, "remainingResetConfigDisplayPeriod");
  if (v25 <= 0.0)
  {
    v20 = &controllerKeyNotLandingWaitPeriod;
    if (v4)
      v20 = &controllerKeyNotLandingShortCircuitWaitPeriod;
LABEL_14:
    v26 = (double)(unint64_t)*v20;
    v27 = (void *)MEMORY[0x1D17BA0A0](v18);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543618;
      v43 = v29;
      v44 = 2048;
      v45 = v26;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Reset config display timer does not exist, initializing it to %lf", (uint8_t *)&v42, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    v18 = -[HMDCloudDataSyncStateFilter setRemainingResetConfigDisplayPeriod:](self, "setRemainingResetConfigDisplayPeriod:", v26);
  }
LABEL_17:
  v30 = (void *)MEMORY[0x1D17BA0A0](v18);
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudDataSyncStateFilter remainingResetConfigDisplayPeriod](self, "remainingResetConfigDisplayPeriod");
    v42 = 138543618;
    v43 = v32;
    v44 = 2048;
    v45 = v33;
    _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Starting a timer with %lf seconds to wait for controller key to land", (uint8_t *)&v42, 0x16u);

  }
  objc_autoreleasePoolPop(v30);
  v34 = objc_alloc(MEMORY[0x1E0D286C8]);
  -[HMDCloudDataSyncStateFilter remainingResetConfigDisplayPeriod](self, "remainingResetConfigDisplayPeriod");
  v35 = (void *)objc_msgSend(v34, "initWithTimeInterval:options:", 1);
  -[HMDCloudDataSyncStateFilter setResetConfigDisplayTimer:](self, "setResetConfigDisplayTimer:", v35);

  -[HMDCloudDataSyncStateFilter resetConfigDisplayTimer](self, "resetConfigDisplayTimer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDelegate:", self);

  -[HMDCloudDataSyncStateFilter resetConfigDisplayTimer](self, "resetConfigDisplayTimer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "resume");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudDataSyncStateFilter setResetConfigDisplayTimerStartTimestamp:](self, "setResetConfigDisplayTimerStartTimestamp:", v38);

}

- (void)_stopResetConfigDisplayTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping reset config display timer", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCloudDataSyncStateFilter _clearResetConfigDisplayTimer](self, "_clearResetConfigDisplayTimer");
  -[HMDCloudDataSyncStateFilter setResetConfigDisplayTimeHasElapsed:](self, "setResetConfigDisplayTimeHasElapsed:", 0);
}

- (void)_clearResetConfigDisplayTimer
{
  -[HMDCloudDataSyncStateFilter setResetConfigDisplayTimer:](self, "setResetConfigDisplayTimer:", 0);
  -[HMDCloudDataSyncStateFilter setResetConfigDisplayTimerStartTimestamp:](self, "setResetConfigDisplayTimerStartTimestamp:", 0);
  -[HMDCloudDataSyncStateFilter setRemainingResetConfigDisplayPeriod:](self, "setRemainingResetConfigDisplayPeriod:", 0.0);
}

- (void)_stallResetConfigDisplayTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  int v24;
  void *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[HMDCloudDataSyncStateFilter resetConfigDisplayTimer](self, "resetConfigDisplayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v22;
      v23 = "%{public}@There is no reset config display timer running?";
LABEL_14:
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v24, 0xCu);

    }
LABEL_15:

    objc_autoreleasePoolPop(v20);
    return;
  }
  -[HMDCloudDataSyncStateFilter resetConfigDisplayTimerStartTimestamp](self, "resetConfigDisplayTimerStartTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v22;
      v23 = "%{public}@Reset config display timer start time in invalid?";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  -[HMDCloudDataSyncStateFilter setResetConfigDisplayTimer:](self, "setResetConfigDisplayTimer:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudDataSyncStateFilter resetConfigDisplayTimerStartTimestamp](self, "resetConfigDisplayTimerStartTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v11;
    v26 = 2048;
    v27 = v8;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Stalling the reset config display timer, %lf seconds have passed on this timer", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCloudDataSyncStateFilter remainingResetConfigDisplayPeriod](self, "remainingResetConfigDisplayPeriod");
  -[HMDCloudDataSyncStateFilter setRemainingResetConfigDisplayPeriod:](self, "setRemainingResetConfigDisplayPeriod:", v12 - v8);
  v13 = -[HMDCloudDataSyncStateFilter remainingResetConfigDisplayPeriod](self, "remainingResetConfigDisplayPeriod");
  if (v14 <= 0.0)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0](v13);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Remaining period for reset config display timer became less than 0?", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCloudDataSyncStateFilter setRemainingResetConfigDisplayPeriod:](self, "setRemainingResetConfigDisplayPeriod:", (double)(unint64_t)controllerKeyNotLandingWaitPeriod);
    +[HMDDeviceSetupManager sharedManager](HMDDeviceSetupManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isRunning");

    if (v19)
      -[HMDCloudDataSyncStateFilter setRemainingResetConfigDisplayPeriod:](self, "setRemainingResetConfigDisplayPeriod:", (double)(unint64_t)controllerKeyNotLandingShortCircuitWaitPeriod);
  }
}

- (void)_handleAccountStatusChanged:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isInternal"))
  {
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("kAccountIsActiveKey"));
    if ((_DWORD)v5 != -[HMDCloudDataSyncStateFilter iCloudAccountActive](self, "iCloudAccountActive"))
    {
      v12 = 0;
      v6 = -[HMDCloudDataSyncStateFilter _cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:](self, "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", 0, 1, 0, &v12);
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        v11 = CFSTR("signed out");
        if ((_DWORD)v5)
          v11 = CFSTR("active");
        *(_DWORD *)buf = 138543618;
        v14 = v9;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating account status has changed to: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDCloudDataSyncStateFilter setICloudAccountActive:](self, "setICloudAccountActive:", v5);
      if (-[HMDCloudDataSyncStateFilter iCloudAccountActive](self, "iCloudAccountActive")
        || !-[HMDCloudDataSyncStateFilter cloudDataSyncCompleted](self, "cloudDataSyncCompleted"))
      {
        -[HMDCloudDataSyncStateFilter _postNotificationForDataSyncInProgress:dataSyncState:forcePost:](self, "_postNotificationForDataSyncInProgress:dataSyncState:forcePost:", v6, v12, 0);
      }
      else
      {
        -[HMDCloudDataSyncStateFilter _updateCloudDataSyncState:](self, "_updateCloudDataSyncState:", 0);
      }
    }
  }

}

- (void)_startPopupTimer
{
  uint64_t v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = keychainPopupTimerInterval;
  -[HMDMessageFilter workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  -[HMDCloudDataSyncStateFilter setPopupTimer:](self, "setPopupTimer:", v5);

  -[HMDCloudDataSyncStateFilter popupTimer](self, "popupTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 1000000000 * v3);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);

  objc_initWeak(&location, self);
  -[HMDCloudDataSyncStateFilter popupTimer](self, "popupTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __47__HMDCloudDataSyncStateFilter__startPopupTimer__block_invoke;
  v16 = &unk_1E89BE3F8;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v8, &v13);

  -[HMDCloudDataSyncStateFilter popupTimer](self, "popupTimer", v13, v14, v15, v16);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v9);

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting keychain sync popup shown timer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_stopPopupTimer
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HMDCloudDataSyncStateFilter setKeychainSyncRequiredPopShown:](self, "setKeychainSyncRequiredPopShown:", 0);
  -[HMDCloudDataSyncStateFilter popupTimer](self, "popupTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Cancelling keychain sync popup shown timer", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDCloudDataSyncStateFilter popupTimer](self, "popupTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[HMDCloudDataSyncStateFilter setPopupTimer:](self, "setPopupTimer:", 0);
  }
}

- (void)_startiCloudSwitchPopupTimer
{
  uint64_t v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = keychainPopupTimerInterval;
  -[HMDMessageFilter workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  -[HMDCloudDataSyncStateFilter setICloudSwitchPopupTimer:](self, "setICloudSwitchPopupTimer:", v5);

  -[HMDCloudDataSyncStateFilter iCloudSwitchPopupTimer](self, "iCloudSwitchPopupTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 1000000000 * v3);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);

  objc_initWeak(&location, self);
  -[HMDCloudDataSyncStateFilter iCloudSwitchPopupTimer](self, "iCloudSwitchPopupTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __59__HMDCloudDataSyncStateFilter__startiCloudSwitchPopupTimer__block_invoke;
  v16 = &unk_1E89BE3F8;
  objc_copyWeak(&v17, &location);
  dispatch_source_set_event_handler(v8, &v13);

  -[HMDCloudDataSyncStateFilter iCloudSwitchPopupTimer](self, "iCloudSwitchPopupTimer", v13, v14, v15, v16);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v9);

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting iCloud Switch popup shown timer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_stopiCloudSwitchPopupTimer
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HMDCloudDataSyncStateFilter setICloudSwitchRequiredPopShown:](self, "setICloudSwitchRequiredPopShown:", 0);
  -[HMDCloudDataSyncStateFilter iCloudSwitchPopupTimer](self, "iCloudSwitchPopupTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Cancelling iCloud Switch popup shown timer", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDCloudDataSyncStateFilter iCloudSwitchPopupTimer](self, "iCloudSwitchPopupTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[HMDCloudDataSyncStateFilter setICloudSwitchPopupTimer:](self, "setICloudSwitchPopupTimer:", 0);
  }
}

- (void)updateTotalHomes:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDMessageFilter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HMDCloudDataSyncStateFilter_updateTotalHomes___block_invoke;
  v6[3] = &unk_1E89C0B98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)updateCurrentAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMessageFilter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDCloudDataSyncStateFilter_updateCurrentAccount___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_updateCurrentAccount:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  HMDCloudDataSyncStateFilter *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  const char *v20;
  void *v21;
  HMDCloudDataSyncStateFilter *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  const char *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = a3;
  objc_msgSend(v27, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isCurrentDevice") & 1) == 0)
        {
          objc_msgSend(v11, "capabilities");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend((id)v12, "supportsKeychainSync");

          v8 |= v13;
          objc_msgSend(v11, "capabilities");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend(v14, "supportsCloudDataSync");

          v7 |= v12;
          if ((v8 & 1) != 0 && (v7 & 1) != 0)
          {
            v7 = 1;
            v8 = 1;
            goto LABEL_14;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
LABEL_14:

  if ((v8 & 1) != -[HMDCloudDataSyncStateFilter isKeychainSyncPeerAvailable](self, "isKeychainSyncPeerAvailable"))
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if ((v8 & 1) != 0)
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v19;
        v20 = "%{public}@Keychain sync peers are available";
LABEL_20:
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, v20, buf, 0xCu);

      }
    }
    else if (v18)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      v20 = "%{public}@Keychain sync peers are not available";
      goto LABEL_20;
    }

    objc_autoreleasePoolPop(v15);
    -[HMDCloudDataSyncStateFilter setKeychainSyncPeerAvailable:](v16, "setKeychainSyncPeerAvailable:", v8 & 1);
  }
  if ((v7 & 1) != -[HMDCloudDataSyncStateFilter isCloudDataSyncPeerAvailable](self, "isCloudDataSyncPeerAvailable"))
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if ((v7 & 1) != 0)
    {
      if (v24)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v25;
        v26 = "%{public}@Cloud data sync peers are available";
LABEL_28:
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, v26, buf, 0xCu);

      }
    }
    else if (v24)
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      v26 = "%{public}@Cloud data sync peers are not available";
      goto LABEL_28;
    }

    objc_autoreleasePoolPop(v21);
    -[HMDCloudDataSyncStateFilter setCloudDataSyncPeerAvailable:](v22, "setCloudDataSyncPeerAvailable:", v7 & 1);
  }

}

- (void)updateCloudDataSyncState:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDMessageFilter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HMDCloudDataSyncStateFilter_updateCloudDataSyncState___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (void)_updateCloudDataSyncState:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[HMDCloudDataSyncStateFilter cloudDataSyncCompleted](self, "cloudDataSyncCompleted") != a3)
  {
    v12 = 0;
    v5 = -[HMDCloudDataSyncStateFilter _cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:](self, "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", 0, 1, 0, &v12);
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = "Sync in progress";
      if (v3)
        v10 = "Sync completed";
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2080;
      v16 = v10;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating cloud sync state to %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCloudDataSyncStateFilter setCloudDataSyncCompleted:](self, "setCloudDataSyncCompleted:", v3);
    if (-[HMDCloudDataSyncStateFilter cloudDataSyncCompleted](self, "cloudDataSyncCompleted"))
    {
      -[HMDCloudDataSyncStateFilter homeManager](self, "homeManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "assistantSyncDataChanged:", CFSTR("SyncStateCompleted"));

      -[HMDCloudDataSyncStateFilter _markHH1FirstCloudSyncComplete](self, "_markHH1FirstCloudSyncComplete");
    }
    -[HMDCloudDataSyncStateFilter _postNotificationForDataSyncInProgress:dataSyncState:forcePost:](self, "_postNotificationForDataSyncInProgress:dataSyncState:forcePost:", v5, v12, -[HMDCloudDataSyncStateFilter cloudDataSyncCompleted](self, "cloudDataSyncCompleted"));
  }
}

- (void)_markHH1FirstCloudSyncComplete
{
  os_unfair_lock_s *p_lock;
  NSObject *logger;
  uint8_t v5[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_hh1FirstCloudSyncComplete)
  {
    self->_hh1FirstCloudSyncComplete = 1;
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HH1FirstCloudSyncComplete", ", v5, 2u);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)updateWithoutDataSynCheckServerTokenAvailable:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDMessageFilter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__HMDCloudDataSyncStateFilter_updateWithoutDataSynCheckServerTokenAvailable___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (void)updateServerTokenAvailable:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDMessageFilter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HMDCloudDataSyncStateFilter_updateServerTokenAvailable___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (void)updateiCloudSwitchState:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDMessageFilter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__HMDCloudDataSyncStateFilter_updateiCloudSwitchState___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (BOOL)isiCloudSwitchEnabled
{
  HMDCloudDataSyncStateFilter *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HMDMessageFilter queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HMDCloudDataSyncStateFilter_isiCloudSwitchEnabled__block_invoke;
  v5[3] = &unk_1E89C0800;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isKeychainSyncSwitchEnabled
{
  HMDCloudDataSyncStateFilter *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HMDMessageFilter queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HMDCloudDataSyncStateFilter_isKeychainSyncSwitchEnabled__block_invoke;
  v5[3] = &unk_1E89C0800;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)updateLocalDataDecryptionFailed:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDMessageFilter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__HMDCloudDataSyncStateFilter_updateLocalDataDecryptionFailed___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (BOOL)isLocalDataDecryptionFailed
{
  HMDCloudDataSyncStateFilter *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HMDMessageFilter queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HMDCloudDataSyncStateFilter_isLocalDataDecryptionFailed__block_invoke;
  v5[3] = &unk_1E89C0800;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)resetConfiguration
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMessageFilter queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HMDCloudDataSyncStateFilter_resetConfiguration__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (BOOL)shouldCloudSyncData
{
  HMDCloudDataSyncStateFilter *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HMDMessageFilter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__HMDCloudDataSyncStateFilter_shouldCloudSyncData__block_invoke;
  v5[3] = &unk_1E89C0800;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isHomeManagerFirstFetchFinished
{
  return self->_homeManagerFirstFetchFinished;
}

- (void)setHomeManagerFirstFetchFinished:(BOOL)a3
{
  self->_homeManagerFirstFetchFinished = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)keychainSyncEnabled
{
  return self->_keychainSyncEnabled;
}

- (void)setKeychainSyncEnabled:(BOOL)a3
{
  self->_keychainSyncEnabled = a3;
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (OS_dispatch_source)popupTimer
{
  return self->_popupTimer;
}

- (void)setPopupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_popupTimer, a3);
}

- (OS_dispatch_source)iCloudSwitchPopupTimer
{
  return self->_iCloudSwitchPopupTimer;
}

- (void)setICloudSwitchPopupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudSwitchPopupTimer, a3);
}

- (BOOL)keychainSyncRequiredPopShown
{
  return self->_keychainSyncRequiredPopShown;
}

- (void)setKeychainSyncRequiredPopShown:(BOOL)a3
{
  self->_keychainSyncRequiredPopShown = a3;
}

- (BOOL)iCloudSwitchRequiredPopShown
{
  return self->_iCloudSwitchRequiredPopShown;
}

- (void)setICloudSwitchRequiredPopShown:(BOOL)a3
{
  self->_iCloudSwitchRequiredPopShown = a3;
}

- (void)setICloudAccountActive:(BOOL)a3
{
  self->_iCloudAccountActive = a3;
}

- (BOOL)cloudDataSyncCompleted
{
  return self->_cloudDataSyncCompleted;
}

- (void)setCloudDataSyncCompleted:(BOOL)a3
{
  self->_cloudDataSyncCompleted = a3;
}

- (BOOL)serverTokenAvailable
{
  return self->_serverTokenAvailable;
}

- (void)setServerTokenAvailable:(BOOL)a3
{
  self->_serverTokenAvailable = a3;
}

- (BOOL)iCloudSwitchStateEnabled
{
  return self->_iCloudSwitchStateEnabled;
}

- (void)setICloudSwitchStateEnabled:(BOOL)a3
{
  self->_iCloudSwitchStateEnabled = a3;
}

- (void)setLocalDataDecryptionFailed:(BOOL)a3
{
  self->_localDataDecryptionFailed = a3;
}

- (void)setTotalHomes:(int64_t)a3
{
  self->_totalHomes = a3;
}

- (BOOL)networkConnectivityAvailable
{
  return self->_networkConnectivityAvailable;
}

- (void)setNetworkConnectivityAvailable:(BOOL)a3
{
  self->_networkConnectivityAvailable = a3;
}

- (HMFTimer)cloudDataSyncInProgressTimer
{
  return self->_cloudDataSyncInProgressTimer;
}

- (void)setCloudDataSyncInProgressTimer:(id)a3
{
  objc_storeStrong((id *)&self->_cloudDataSyncInProgressTimer, a3);
}

- (double)remainingDataSyncPeriod
{
  return self->_remainingDataSyncPeriod;
}

- (void)setRemainingDataSyncPeriod:(double)a3
{
  self->_remainingDataSyncPeriod = a3;
}

- (NSDate)dataSyncTimerStartTimestamp
{
  return self->_dataSyncTimerStartTimestamp;
}

- (void)setDataSyncTimerStartTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_dataSyncTimerStartTimestamp, a3);
}

- (HMFTimer)resetConfigDisplayTimer
{
  return self->_resetConfigDisplayTimer;
}

- (void)setResetConfigDisplayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_resetConfigDisplayTimer, a3);
}

- (double)remainingResetConfigDisplayPeriod
{
  return self->_remainingResetConfigDisplayPeriod;
}

- (void)setRemainingResetConfigDisplayPeriod:(double)a3
{
  self->_remainingResetConfigDisplayPeriod = a3;
}

- (NSDate)resetConfigDisplayTimerStartTimestamp
{
  return self->_resetConfigDisplayTimerStartTimestamp;
}

- (void)setResetConfigDisplayTimerStartTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_resetConfigDisplayTimerStartTimestamp, a3);
}

- (BOOL)resetConfigDisplayTimeHasElapsed
{
  return self->_resetConfigDisplayTimeHasElapsed;
}

- (void)setResetConfigDisplayTimeHasElapsed:(BOOL)a3
{
  self->_resetConfigDisplayTimeHasElapsed = a3;
}

- (void)setHasHH2MigrationAlreadyRequested:(BOOL)a3
{
  self->_hasHH2MigrationAlreadyRequested = a3;
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (BOOL)isKeychainSyncPeerAvailable
{
  return self->_keychainSyncPeerAvailable;
}

- (void)setKeychainSyncPeerAvailable:(BOOL)a3
{
  self->_keychainSyncPeerAvailable = a3;
}

- (BOOL)isCloudDataSyncPeerAvailable
{
  return self->_cloudDataSyncPeerAvailable;
}

- (void)setCloudDataSyncPeerAvailable:(BOOL)a3
{
  self->_cloudDataSyncPeerAvailable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_resetConfigDisplayTimerStartTimestamp, 0);
  objc_storeStrong((id *)&self->_resetConfigDisplayTimer, 0);
  objc_storeStrong((id *)&self->_dataSyncTimerStartTimestamp, 0);
  objc_storeStrong((id *)&self->_cloudDataSyncInProgressTimer, 0);
  objc_storeStrong((id *)&self->_iCloudSwitchPopupTimer, 0);
  objc_storeStrong((id *)&self->_popupTimer, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

uint64_t __50__HMDCloudDataSyncStateFilter_shouldCloudSyncData__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t result;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsStandaloneMode");

  result = objc_msgSend(*(id *)(a1 + 32), "iCloudAccountActive");
  if (v3)
  {
    if ((_DWORD)result)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled") & 1) != 0
        || (result = objc_msgSend(*(id *)(a1 + 32), "isCloudDataSyncPeerAvailable"), (_DWORD)result))
      {
        result = objc_msgSend(*(id *)(a1 + 32), "iCloudSwitchStateEnabled");
      }
    }
  }
  else if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "iCloudSwitchStateEnabled");
      if ((_DWORD)result)
        result = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 37) == 0;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __49__HMDCloudDataSyncStateFilter_resetConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setServerTokenAvailable:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCloudDataSyncCompleted:", 0);
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 37) = objc_msgSend(v2, "supportsStandaloneMode") ^ 1;

  v3 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "setLocalDataDecryptionFailed:", 0));
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@HomeKit configuration got reset, stopping data reset timers", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  return objc_msgSend(*(id *)(a1 + 32), "_stopDataConfigResetTimers");
}

uint64_t __58__HMDCloudDataSyncStateFilter_isLocalDataDecryptionFailed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "localDataDecryptionFailed");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__HMDCloudDataSyncStateFilter_updateLocalDataDecryptionFailed___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "localDataDecryptionFailed");
  if (*(unsigned __int8 *)(a1 + 40) != (_DWORD)result)
  {
    v9 = 0;
    v3 = objc_msgSend(*(id *)(a1 + 32), "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", 0, 1, 0, &v9);
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = "YES";
      if (!*(_BYTE *)(a1 + 40))
        v8 = "NO";
      *(_DWORD *)buf = 138543618;
      v11 = v6;
      v12 = 2080;
      v13 = v8;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating local data decryption fail state to: %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setLocalDataDecryptionFailed:", *(unsigned __int8 *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_postNotificationForDataSyncInProgress:dataSyncState:forcePost:", v3, v9, 0);
  }
  return result;
}

uint64_t __58__HMDCloudDataSyncStateFilter_isKeychainSyncSwitchEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __52__HMDCloudDataSyncStateFilter_isiCloudSwitchEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iCloudSwitchStateEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __55__HMDCloudDataSyncStateFilter_updateiCloudSwitchState___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "iCloudSwitchStateEnabled");
  if (*(unsigned __int8 *)(a1 + 40) != (_DWORD)result)
  {
    v9 = 0;
    v3 = objc_msgSend(*(id *)(a1 + 32), "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", 0, 1, 0, &v9);
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = "";
      if (!*(_BYTE *)(a1 + 40))
        v8 = "not ";
      *(_DWORD *)buf = 138543618;
      v11 = v6;
      v12 = 2080;
      v13 = v8;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating iCloud Switch state to: %senabled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setICloudSwitchStateEnabled:", *(unsigned __int8 *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_postNotificationForDataSyncInProgress:dataSyncState:forcePost:", v3, v9, 0);
  }
  return result;
}

uint64_t __58__HMDCloudDataSyncStateFilter_updateServerTokenAvailable___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "serverTokenAvailable");
  if (*(unsigned __int8 *)(a1 + 40) != (_DWORD)result)
  {
    v9 = 0;
    v3 = objc_msgSend(*(id *)(a1 + 32), "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", 0, 1, 0, &v9);
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = "";
      if (!*(_BYTE *)(a1 + 40))
        v8 = "not ";
      *(_DWORD *)buf = 138543618;
      v11 = v6;
      v12 = 2080;
      v13 = v8;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating cloud server token available state to %savailable", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setServerTokenAvailable:", *(unsigned __int8 *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_postNotificationForDataSyncInProgress:dataSyncState:forcePost:", v3, v9, 0);
  }
  return result;
}

uint64_t __77__HMDCloudDataSyncStateFilter_updateWithoutDataSynCheckServerTokenAvailable___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 32), "serverTokenAvailable");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != (_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setServerTokenAvailable:", v3 != 0);
  return result;
}

uint64_t __56__HMDCloudDataSyncStateFilter_updateCloudDataSyncState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCloudDataSyncState:", *(unsigned __int8 *)(a1 + 40));
}

void __102__HMDCloudDataSyncStateFilter__cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___block_invoke_159(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Enabling iCloud switch", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    +[HMDAppleAccountSettings sharedSettings](HMDAppleAccountSettings, "sharedSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateHomeEnabled:completionHandler:", 1, &__block_literal_global_161_83298);

  }
  objc_msgSend(WeakRetained, "_startiCloudSwitchPopupTimer");

}

void __102__HMDCloudDataSyncStateFilter__cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("kHomeConfigInternalRequestKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__watchAllowedCommands;
  _cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState__watchAllowedCommands = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v6 = CFSTR("kUpdateAccessAllowedWhenLockedRequestKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages;
  _cloudSyncinProgressCheck_supressPopup_sendCanceledError_dataSyncState___allowedMessages = v4;

}

void __64__HMDCloudDataSyncStateFilter_acceptMessage_target_errorReason___block_invoke_152(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Launching settings for iCloud Keychain", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    launchURL((uint64_t)CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"));
  }
  objc_msgSend(WeakRetained, "_startPopupTimer");

}

uint64_t __52__HMDCloudDataSyncStateFilter_updateCurrentAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentAccount:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__HMDCloudDataSyncStateFilter_updateTotalHomes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTotalHomes:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateMoveToHH2");
}

void __59__HMDCloudDataSyncStateFilter__startiCloudSwitchPopupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_INFO, "%{public}@iCloud Switch popup timer fired, resetting last shown flag", (uint8_t *)&v5, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(WeakRetained, "_stopiCloudSwitchPopupTimer");
  }

}

void __47__HMDCloudDataSyncStateFilter__startPopupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_INFO, "%{public}@Keychain sync popup timer fired, resetting last shown flag", (uint8_t *)&v5, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(WeakRetained, "_stopPopupTimer");
  }

}

void __58__HMDCloudDataSyncStateFilter_kickResetConfigDisplayTimer__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsKeychainSync")
    && (objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "resetConfigDisplayTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      objc_msgSend(*(id *)(a1 + 32), "_startResetConfigDisplayTimer");
  }
  else
  {

  }
}

void __44__HMDCloudDataSyncStateFilter_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cloudDataSyncInProgressTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Cloud data sync in progress timer has fired", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 40), "_resetCloudDataSyncTimer");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 37) = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 40);
    v12 = CFSTR("kCloudDataSyncTimerExpiredNotification");
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "resetConfigDisplayTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
      return;
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Reset config display timer has fired", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 40), "_clearResetConfigDisplayTimer");
    objc_msgSend(*(id *)(a1 + 40), "setResetConfigDisplayTimeHasElapsed:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 40);
    v12 = CFSTR("kCloudDataSyncInProgressUpdatedNotification");
  }
  objc_msgSend(v9, "postNotificationName:object:", v12, v11);

}

uint64_t __57__HMDCloudDataSyncStateFilter_updateNetworkConnectivity___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  int v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t result;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setNetworkConnectivityAvailable:", *(unsigned __int8 *)(a1 + 40));
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[37] && objc_msgSend(v2, "keychainSyncEnabled"))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v7;
        _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Network is reachable now, starting the cloud sync timer", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(*(id *)(a1 + 32), "_startDataConfigResetTimers");
    }
    else
    {
      if (v6)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Network is not reachable now, stalling the cloud sync timer", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(*(id *)(a1 + 32), "_stallCloudDataSyncTimer");
      objc_msgSend(*(id *)(a1 + 32), "_stallResetConfigDisplayTimer");
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled");
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Network reachability changed to %@ and decryption failed, keychain enabled: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "networkConnectivityAvailable");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_evaluateMoveToHH2");
  return result;
}

void __57__HMDCloudDataSyncStateFilter_startDataConfigResetTimers__block_invoke(uint64_t a1)
{
  int v2;
  id v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsKeychainSync"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled");

    if (v2)
      objc_msgSend(*(id *)(a1 + 32), "_startDataConfigResetTimers");
  }
  else
  {

  }
}

void __51__HMDCloudDataSyncStateFilter_setDecryptionFailed___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 **)(a1 + 32);
  if (v2[37] == *(unsigned __int8 *)(a1 + 40))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v5;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Decrypt failed is already set to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v22 = 0;
    v7 = objc_msgSend(v2, "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", 0, 1, 0, &v22);
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMHomeManagerDataSyncStateToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating decrypt fail state from %@ to %@, dataSyncState: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 37) = *(_BYTE *)(a1 + 40);
    v14 = objc_msgSend(*(id *)(a1 + 32), "_postNotificationForDataSyncInProgress:dataSyncState:forcePost:", v7, v22, 0);
    if (*(_BYTE *)(a1 + 40) && (v14 = objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled"), (_DWORD)v14))
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v17;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Decrypt failed and keychain is enabled, starting data reset timers", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 32), "_startDataConfigResetTimers");
    }
    else
    {
      v18 = (void *)MEMORY[0x1D17BA0A0](v14);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled");
        HMFBooleanToString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v21;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Stopping data reset timers, keychain enabled: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(*(id *)(a1 + 32), "_stopDataConfigResetTimers");
    }
  }
}

uint64_t __47__HMDCloudDataSyncStateFilter_decryptionFailed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 37);
  return result;
}

void __54__HMDCloudDataSyncStateFilter_totalHomesInCloudZones___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  __int128 buf;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Encountered an error while querying cloud cache for records", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = _Block_copy(*(const void **)(a1 + 40));
    v12 = v11;
    if (v11)
      (*((void (**)(void *, _QWORD, id))v11 + 2))(v11, 0, v6);

  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v17 = 0x2020000000;
    v18 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__HMDCloudDataSyncStateFilter_totalHomesInCloudZones___block_invoke_138;
    v15[3] = &unk_1E89AFEB0;
    v15[4] = *(_QWORD *)(a1 + 32);
    v15[5] = &buf;
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
    v13 = _Block_copy(*(const void **)(a1 + 40));
    v14 = v13;
    if (v13)
      (*((void (**)(void *, _QWORD, _QWORD))v13 + 2))(v13, *(_QWORD *)(*((_QWORD *)&buf + 1) + 24), 0);

    _Block_object_dispose(&buf, 8);
  }

}

void __54__HMDCloudDataSyncStateFilter_totalHomesInCloudZones___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "extractObjectChange");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Found : %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

uint64_t __65__HMDCloudDataSyncStateFilter__handleCloudZoneReadyNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t result;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5"));
    v4 = objc_msgSend(v2, "isEqual:", v3);

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
        v20 = 138543362;
        v21 = v8;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@home manager zone fetch finished", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(*(id *)(a1 + 40), "setHomeManagerFirstFetchFinished:", 1);
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Legacy zone fetch finished", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 48), "hmf_numberForKey:", CFSTR("HMDCR.de"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (objc_msgSend(v13, "BOOLValue") & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Legacy zone does not have home data records, home manager zone will not be fetched", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 40), "setHomeManagerFirstFetchFinished:", 1);
    }

  }
  result = objc_msgSend(*(id *)(a1 + 40), "isHomeManagerFirstFetchFinished");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_evaluateMoveToHH2");
  return result;
}

void __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hasHH2MigrationAlreadyRequested"))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@HH2 migration has already been requested. Not requesting again.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "homes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_filter:", &__block_literal_global_132_83370);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "homes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v10 = objc_msgSend(v7, "count");

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 - v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Owned Home Count : %@, Total Shared Home Count: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    if (objc_msgSend(v7, "count"))
    {
      if (v9 == v10)
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v20;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Not migrating empty owned homes for shared users as they do not have any shared homes right now. This is already covered by the daily overnight migration which has some extra few checks. Please take a look at : fetchIsCurrentUserEligibleForAutoMigrationWithCompletion method", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
      }
      else
      {
        v21 = *(void **)(a1 + 40);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_133;
        v25[3] = &unk_1E89B2EB0;
        v22 = v7;
        v23 = *(_QWORD *)(a1 + 32);
        v24 = *(void **)(a1 + 40);
        v26 = v22;
        v27 = v23;
        v28 = v24;
        objc_msgSend(v21, "determineEmptyHomesForSharedUsersWithCompletionHandler:", v25);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setHasHH2MigrationAlreadyRequested:", 1);
      if ((objc_msgSend(*(id *)(a1 + 40), "moveDirectlyToHH2IfOnlyHH2SharedHomesExist") & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "setHasHH2MigrationAlreadyRequested:", 0);
    }

  }
}

void __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_133(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(a1[4], "count");
  if (v4 == objc_msgSend(v3, "count"))
  {
    objc_msgSend(a1[6], "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_134;
    v20[3] = &unk_1E89BD578;
    v20[4] = a1[5];
    v21 = v3;
    v7 = objc_msgSend(v5, "na_allObjectsPassTest:", v20);

    if ((v7 & 1) != 0)
    {
      objc_msgSend(a1[5], "setHasHH2MigrationAlreadyRequested:", 1);
      v19[0] = v6;
      v19[1] = 3221225472;
      v19[2] = __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_135;
      v19[3] = &unk_1E89C2350;
      v8 = a1[6];
      v19[4] = a1[5];
      objc_msgSend(v8, "autoMigrateToHH2WithCompletionHandler:", v19);
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = a1[5];
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Not All the homes are ready for HH2 yet. Not auto migrating shared user to HH2", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = a1[5];
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1[4], "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Actual owned homes and empty home map do not agree. Not moving shared user to HH2: [%@ / %@]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

uint64_t __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_134(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v3, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "BOOLValue");
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "isUpdatedToHH2");
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v7;
    v20 = 2112;
    v21 = v3;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ / is owned home empty: %@ / is shared user updated to HH2: %@", (uint8_t *)&v18, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  if (objc_msgSend(v3, "isOwnerUser"))
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v3, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

  }
  else
  {
    v16 = objc_msgSend(v3, "isUpdatedToHH2");
  }

  return v16;
}

void __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_135(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@failed to start auto migration to HH2 with an error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setHasHH2MigrationAlreadyRequested:", 0);
  }

}

uint64_t __77__HMDCloudDataSyncStateFilter__detectAndMigrateSharedUserWithEmptyOwnedHomes__block_invoke_130(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOwnerUser");
}

uint64_t __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;
  void *v9;
  _QWORD v10[5];
  char v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalHomes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hasHH2MigrationAlreadyRequested");
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@[Shared User] : Going to check whether there are homes in the account or not: [homes = %@] [HH2 migration requested: %@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  result = objc_msgSend(*(id *)(a1 + 32), "totalHomes");
  if (result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_verifyAccountStatusForMigration");
    if ((_DWORD)result)
    {
      v9 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_128;
      v10[3] = &unk_1E89AFE68;
      v10[4] = v9;
      v11 = *(_BYTE *)(a1 + 40);
      return objc_msgSend(v9, "totalHomesInCloudZones:", v10);
    }
  }
  return result;
}

void __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  _QWORD block[6];
  char v9;
  uint64_t v10;
  uint64_t v11;

  if (!a3)
  {
    v10 = v3;
    v11 = v4;
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_2;
    block[3] = &unk_1E89B1748;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = a2;
    v9 = *(_BYTE *)(a1 + 40);
    dispatch_async(v7, block);

  }
}

void __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_2(uint64_t a1)
{
  BOOL v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "totalHomes") != *(_QWORD *)(a1 + 40))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@[Shared User] : There are still homes in the cloud which are not yet downloaded. : [HomesInCloud : %@]", buf, 0x16u);

    }
    goto LABEL_11;
  }
  v2 = +[HMDRemoteLoginUtilities isTwoFactorAuthenticationEnabledForAccount](HMDRemoteLoginUtilities, "isTwoFactorAuthenticationEnabledForAccount");
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (!v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@[Empty Account] : HSA is not enabled for this account. Cannot move this account to HH2", buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v3);
    return;
  }
  if (v6)
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalHomes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Moving shared user to HH2 : [total Homes : %@], [HomesInCloud : %@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  v10 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v10, "_detectAndMigrateSharedUserWithEmptyOwnedHomes");
  }
  else
  {
    objc_msgSend(v10, "setHasHH2MigrationAlreadyRequested:", 1);
    objc_msgSend(*(id *)(a1 + 32), "homeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_129;
    block[3] = &unk_1E89C2730;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v15, block);

  }
}

void __104__HMDCloudDataSyncStateFilter_moveDirectlyToHH2IfAccountOnlyHasUpgradedSharedHomesAllowEmptyOwnedHomes___block_invoke_129(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "moveDirectlyToHH2IfOnlyHH2SharedHomesExist");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setHasHH2MigrationAlreadyRequested:", 0);
}

void __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke_123(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    if (a2)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v9;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[Empty Account] : There are still homes in the cloud which are not yet downloaded. : [HomesInCloud : %@]", buf, 0x16u);

      }
LABEL_9:

      objc_autoreleasePoolPop(v6);
      goto LABEL_10;
    }
    if (!+[HMDRemoteLoginUtilities isTwoFactorAuthenticationEnabledForAccount](HMDRemoteLoginUtilities, "isTwoFactorAuthenticationEnabledForAccount"))
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v16 = v13;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[Empty Account] : HSA is not enabled for this account. Cannot move this account to HH2", buf, 0xCu);

      }
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "setHasHH2MigrationAlreadyRequested:", 1);
    objc_msgSend(*(id *)(a1 + 32), "homeManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke_125;
    block[3] = &unk_1E89C2730;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v12, block);

  }
LABEL_10:

}

void __65__HMDCloudDataSyncStateFilter__moveDirectlyToHH2IfAccountIsEmpty__block_invoke_125(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "moveDirectlyToHH2");

  if ((v3 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "setHasHH2MigrationAlreadyRequested:", 0));
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to create HH2 sentinel zone hence empty account cannot be moved to HH2 for now.", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

uint64_t __48__HMDCloudDataSyncStateFilter_evaluateMoveToHH2__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateMoveToHH2");
}

void __74__HMDCloudDataSyncStateFilter_handleKeychainSyncStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_cloudSyncinProgressCheck:supressPopup:sendCanceledError:dataSyncState:", 0, 1, 0, &v10);
  v3 = *(void **)(a1 + 32);
  +[HMDAppleAccountSettings sharedSettings](HMDAppleAccountSettings, "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateKeychainSyncEnabled:", objc_msgSend(v4, "isKeychainSyncEnabled"));

  v5 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "_postNotificationForDataSyncInProgress:dataSyncState:forcePost:", v2, v10, 0));
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "keychainSyncEnabled");
    v9 = CFSTR("disabled");
    if (v8)
      v9 = CFSTR("enabled");
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification about keychain sync change, keychain is %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
}

void __51__HMDCloudDataSyncStateFilter__registerForMessages__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAccountStatusChanged:", v3);

}

void __48__HMDCloudDataSyncStateFilter_isAllowedMessage___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[81];

  v17[80] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("kiCloudAccountChangedNotificationKey");
  v17[1] = CFSTR("kPrimaryAccountWasModifiedRequestKey");
  v17[2] = CFSTR("kPrimaryAccountWasDeletedRequestKey");
  v17[3] = CFSTR("kResetConfigRequestKey");
  v17[4] = CFSTR("kQueryHomeKitUsageStateRequestKey");
  v17[5] = CFSTR("kRemoteSessionTornDownNotificationKey");
  v17[6] = CFSTR("kSearchForNewAccessoriesRequestKey");
  v17[7] = CFSTR("kFetchNewAccessoriesRequestKey");
  v17[8] = CFSTR("kSuspendXPCConnectionRequestKey");
  v17[9] = CFSTR("kResumeXPCConnectionRequestKey");
  v0 = *MEMORY[0x1E0CB9078];
  v17[10] = *MEMORY[0x1E0CB8F78];
  v17[11] = v0;
  v1 = *MEMORY[0x1E0CB9088];
  v17[12] = *MEMORY[0x1E0CB90D0];
  v17[13] = v1;
  v17[14] = CFSTR("kRetrieveHomeLocationRequestKey");
  v17[15] = CFSTR("kRetrieveLocationEventRequestKey");
  v2 = *MEMORY[0x1E0CB8B70];
  v17[16] = *MEMORY[0x1E0CB8B68];
  v17[17] = v2;
  v3 = *MEMORY[0x1E0CB8C18];
  v17[18] = CFSTR("HMHomeAllowUserManagementMessage");
  v17[19] = v3;
  v4 = *MEMORY[0x1E0CB8BF0];
  v17[20] = *MEMORY[0x1E0CB8BF8];
  v17[21] = v4;
  v5 = *MEMORY[0x1E0CB90B0];
  v17[22] = *MEMORY[0x1E0CB8C20];
  v17[23] = v5;
  v6 = *MEMORY[0x1E0CB9D20];
  v17[24] = *MEMORY[0x1E0CB9D00];
  v17[25] = v6;
  v7 = *MEMORY[0x1E0CB9CF0];
  v17[26] = *MEMORY[0x1E0CB9D10];
  v17[27] = v7;
  v8 = *MEMORY[0x1E0CB9F10];
  v17[28] = *MEMORY[0x1E0CB9D08];
  v17[29] = v8;
  v17[30] = CFSTR("kSecureServerIDSMessageRequestKey");
  v17[31] = CFSTR("kSecureClientIDSMessageRequestKey");
  v17[32] = CFSTR("kSecureSessionInvalidatedNotificationKey");
  v17[33] = CFSTR("kHomeDataSyncRequestKey");
  v17[34] = CFSTR("kHomeDataFragmentedSyncRequestKey");
  v17[35] = CFSTR("kAreYouAtHomeRequestKey");
  v17[36] = CFSTR("kDoYouSeeUnpairedAccessoriesKey");
  v17[37] = CFSTR("kAddRemoteAccessRequestKey");
  v17[38] = CFSTR("kUserRemovedRequestKey");
  v17[39] = CFSTR("kElectDeviceForIDSSessionKey");
  v17[40] = CFSTR("kUserResetHomeConfigRequestKey");
  v17[41] = CFSTR("kMetadataDataSyncRequestKey");
  v17[42] = CFSTR("kModifyCharacterisiticNotificationsRequestKey");
  v17[43] = CFSTR("kCharacterisiticsChangedInternalNotificationKey");
  v17[44] = CFSTR("kDismissBulletinInternalRequestKey");
  v17[45] = CFSTR("kDismissDialogInternalRequestKey");
  v17[46] = CFSTR("kRequestForCompanionKeysSyncInternalRequestKey");
  v17[47] = CFSTR("kCompanionKeysSyncInternalRequestKey");
  v17[48] = CFSTR("kResidentElectionParametersInternalRequestKey");
  v17[49] = CFSTR("kRetrieveVendorIdentifierInternalKey");
  v9 = *MEMORY[0x1E0CB9090];
  v17[50] = CFSTR("kHomeConfigInternalRequestKey");
  v17[51] = v9;
  v17[52] = *MEMORY[0x1E0CB9120];
  v17[53] = CFSTR("kAccessHomeInviteRequestKey");
  v17[54] = CFSTR("kUpdateHomeInvitationStateInternalRequestKey");
  v17[55] = CFSTR("kUpdateInvitationStateRequestKey");
  v17[56] = CFSTR("kPingInternalRequestKey");
  v17[57] = CFSTR("kStartRemoteStreamRequestKey");
  v17[58] = CFSTR("kReconfigureRemoteStreamRequestKey");
  v17[59] = CFSTR("kNegotitateRemoteStreamRequestKey");
  v17[60] = CFSTR("kStopRemoteStreamRequestKey");
  v17[61] = CFSTR("kTakeSnapshotRemoteRequestKey");
  v17[62] = CFSTR("kTakeSnapshotRemoteReceivedKey");
  v17[63] = CFSTR("kEnableAccessoryReachabilityNotificationRequestKey");
  v17[64] = CFSTR("kDisableAccessoryReachabilityNotificationRequestKey");
  v17[65] = CFSTR("kRemoteReachabilityChangedNotificationKey");
  v17[66] = CFSTR("kAddHomeInvitesInternalRequestKey");
  v17[67] = *MEMORY[0x1E0CB8F20];
  v17[68] = CFSTR("kDeviceMeshUpdateRequestKey");
  v17[69] = CFSTR("kDeviceMeshUpdateKey");
  v17[70] = CFSTR("kKeyTransferAgentKey");
  v17[71] = CFSTR("kSystemLogCaptureRequestKey");
  v17[72] = CFSTR("kLocationEventOccuredRequestKey");
  v17[73] = CFSTR("kRemoteUpdateUserPresenceNotificationKey");
  v17[74] = CFSTR("kEventTriggerUserPermissionRequestKey");
  v17[75] = CFSTR("kEventTriggerUserPermissionRemoveDialogKey");
  v17[76] = CFSTR("kEventTriggerUserPermissionResponseKey");
  v10 = (void *)MEMORY[0x1E0C99E60];
  v17[77] = *MEMORY[0x1E0CB9C68];
  v17[78] = *MEMORY[0x1E0CB9C78];
  v17[79] = CFSTR("HMDHouseholdMetricsHomeDataLogEventRequest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 80);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  +[HMDRemoteLoginHandler remoteMessages](HMDRemoteLoginHandler, "remoteMessages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v14);

  v15 = objc_msgSend(v13, "copy");
  v16 = (void *)isAllowedMessage___allowedMessages;
  isAllowedMessage___allowedMessages = v15;

}

void __42__HMDCloudDataSyncStateFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v110_83428;
  logCategory__hmf_once_v110_83428 = v0;

}

@end
