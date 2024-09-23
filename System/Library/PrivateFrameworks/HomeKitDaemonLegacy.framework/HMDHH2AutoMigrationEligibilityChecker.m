@implementation HMDHH2AutoMigrationEligibilityChecker

- (HMDHH2AutoMigrationEligibilityChecker)initWithHomeManager:(id)a3
{
  id v4;
  void *v5;
  HMDFeaturesDataSource *v6;
  void *v7;
  HMDHH2AutoMigrationEligibilityChecker *v8;

  v4 = a3;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HMDFeaturesDataSource);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDHH2AutoMigrationEligibilityChecker initWithHomeManager:accountManager:featuresDataSource:userDefaults:](self, "initWithHomeManager:accountManager:featuresDataSource:userDefaults:", v4, v5, v6, v7);

  return v8;
}

- (HMDHH2AutoMigrationEligibilityChecker)initWithHomeManager:(id)a3 accountManager:(id)a4 featuresDataSource:(id)a5 userDefaults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDHH2AutoMigrationEligibilityChecker *v15;
  HMDHH2AutoMigrationEligibilityChecker *v16;
  id isHSA2Enabled;
  id frameworkSwitchProvider;
  HMDHH2AutoMigrationEligibilityChecker *result;
  HMDHH2AutoMigrationEligibilityChecker *v20;
  SEL v21;
  id v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    v20 = (HMDHH2AutoMigrationEligibilityChecker *)_HMFPreconditionFailure();
    -[HMDHH2AutoMigrationEligibilityChecker fetchIsCurrentUserEligibleForAutoMigrationWithCompletion:](v20, v21, v22);
    return result;
  }
  v14 = v13;
  v23.receiver = self;
  v23.super_class = (Class)HMDHH2AutoMigrationEligibilityChecker;
  v15 = -[HMDHH2AutoMigrationEligibilityChecker init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_homeManager, v10);
    objc_storeStrong((id *)&v16->_accountManager, a4);
    objc_storeStrong((id *)&v16->_featuresDataSource, a5);
    objc_storeStrong((id *)&v16->_userDefaults, a6);
    isHSA2Enabled = v16->_isHSA2Enabled;
    v16->_isHSA2Enabled = &__block_literal_global_65005;

    frameworkSwitchProvider = v16->_frameworkSwitchProvider;
    v16->_frameworkSwitchProvider = &__block_literal_global_79;

  }
  return v16;
}

- (void)fetchIsCurrentUserEligibleForAutoMigrationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDHH2AutoMigrationEligibilityChecker *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  char v14;
  void *v15;
  HMDHH2AutoMigrationEligibilityChecker *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  HMDHH2AutoMigrationEligibilityChecker *v22;
  NSObject *v23;
  void *v24;
  uint64_t (**v25)(void);
  char v26;
  void *v27;
  HMDHH2AutoMigrationEligibilityChecker *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  -[HMDHH2AutoMigrationEligibilityChecker homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDHH2AutoMigrationEligibilityChecker _migrationReadinessiCloudAccountStatus](self);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("iCloud account is not signed in");
      if (v6 <= 7)
      {
        if (v6 == 2)
        {
          v12 = CFSTR("iCloud account status could not be determined");
        }
        else if (v6 == 4)
        {
          v12 = CFSTR("iCloud account status is temporarily unavailable");
        }
      }
      else
      {
        switch(v6)
        {
          case 8:
            v12 = CFSTR("iCloud account status is restricted");
            break;
          case 16:
            v12 = CFSTR("iCloud account invalid credentials");
            break;
          case 32:
            v12 = CFSTR("iCloud account need to verify terms");
            break;
        }
      }
      *(_DWORD *)buf = 138543618;
      v50 = v10;
      v51 = 2114;
      v52 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v46[3] |= 1uLL;
  }
  objc_msgSend(v5, "cloudDataSyncStateFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isiCloudSwitchEnabled");

  if ((v14 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = (uint64_t)v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration: iCloud switch for HomeKit is not enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v46[3] |= 2uLL;
  }
  objc_msgSend(v5, "cloudDataSyncStateFilter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isKeychainSyncSwitchEnabled");

  if ((v20 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = (uint64_t)v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration: iCloud keychain sync is not enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v46[3] |= 4uLL;
  }
  -[HMDHH2AutoMigrationEligibilityChecker isHSA2Enabled](self, "isHSA2Enabled");
  v25 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v26 = v25[2]();

  if ((v26 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = (uint64_t)v30;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: HSA2 is not enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    v46[3] |= 8uLL;
  }
  if (!self)
  {
    v38 = 0;
    goto LABEL_37;
  }
  if (!-[HMDHH2AutoMigrationEligibilityChecker _hasAnySharedUser](self))
  {
    -[HMDHH2AutoMigrationEligibilityChecker homeManager](self, "homeManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "idsServerBag");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v32, "minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDevicesWithCurrentDeviceAtLeastVersion:residentDevicesAtLeastVersion:otherDevicesAtLeastVersion:](self, v33, v34, v35);
      goto LABEL_34;
    }
LABEL_35:
    v38 = 0;
    goto LABEL_36;
  }
  -[HMDHH2AutoMigrationEligibilityChecker homeManager](self, "homeManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "idsServerBag");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
    goto LABEL_35;
  objc_msgSend(v32, "minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDevicesWithCurrentDeviceAtLeastVersion:residentDevicesAtLeastVersion:otherDevicesAtLeastVersion:](self, v33, v34, v35);
LABEL_34:
  v38 = v36;

LABEL_36:
LABEL_37:
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __98__HMDHH2AutoMigrationEligibilityChecker_fetchIsCurrentUserEligibleForAutoMigrationWithCompletion___block_invoke;
  v40[3] = &unk_1E89ADA28;
  v40[4] = self;
  v42 = &v45;
  v43 = v38;
  v44 = v6;
  v39 = v4;
  v41 = v39;
  objc_msgSend(v5, "fetchHasOnlyEmptyHomesWithCompletion:", v40);

  _Block_object_dispose(&v45, 8);
}

- (void)fetchIsCurrentUserEligibleForMigrationByOwnerWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  HMDHH2AutoMigrationEligibilityChecker *v16;
  NSObject *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  HMDHH2AutoMigrationEligibilityChecker *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDHH2AutoMigrationEligibilityChecker *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  HMDHH2AutoMigrationEligibilityChecker *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  char v39;
  void *v40;
  HMDHH2AutoMigrationEligibilityChecker *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  HMDHH2AutoMigrationEligibilityChecker *v47;
  NSObject *v48;
  void *v49;
  uint64_t (**v50)(void);
  char v51;
  void *v52;
  HMDHH2AutoMigrationEligibilityChecker *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  HMDHH2AutoMigrationEligibilityChecker *v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __objc2_class *v68;
  HMDHH2AutoMigrationEligibilityResult *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  HMDHH2AutoMigrationEligibilityChecker *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void (**v81)(id, HMDHH2AutoMigrationEligibilityResult *, void *);
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  char v87;
  uint8_t buf[4];
  void *v89;
  uint8_t v90[4];
  uint64_t v91;
  __int16 v92;
  const __CFString *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v81 = (void (**)(id, HMDHH2AutoMigrationEligibilityResult *, void *))a3;
  if (!self)
    goto LABEL_23;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  -[HMDHH2AutoMigrationEligibilityChecker homeManager](self, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v84;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v84 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isOwnerUser") & 1) == 0 && (objc_msgSend(v11, "isUpdatedToHH2") & 1) == 0)
        {
          objc_msgSend(v11, "owner");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v8)
          {
            v14 = objc_msgSend(v8, "isAccountEqualWithUser:", v12);

            if ((v14 & 1) == 0)
            {
              v15 = (void *)MEMORY[0x1D17BA0A0]();
              v16 = self;
              HMFGetOSLogHandle();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v89 = v19;
                _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@At least one shared home owned by different a owner, all shared homes must be owned by the same owner to be eligible for auto migration by owner", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v15);
              v87 = 0;

              goto LABEL_21;
            }
          }
          else
          {
            v8 = (void *)v12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }

  v87 = 1;
LABEL_21:

  if ((v87 & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
LABEL_23:
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v90 = 138543362;
      v91 = (uint64_t)v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration by owner: only shared homes owned by the same owner supported", v90, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 512;
  }
  if ((-[HMDHH2AutoMigrationEligibilityChecker ownedHomesAreEmpty](self) & 1) == 0)
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v90 = 138543362;
      v91 = (uint64_t)v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration by owner: found non-empty owned homes", v90, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    v20 |= 0x400uLL;
  }
  -[HMDHH2AutoMigrationEligibilityChecker homeManager](self, "homeManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HMDHH2AutoMigrationEligibilityChecker _migrationReadinessiCloudAccountStatus](self);
  v82 = v30;
  if (v30)
  {
    v31 = v30;
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      v37 = CFSTR("iCloud account is not signed in");
      if (v31 <= 7)
      {
        if (v31 == 2)
        {
          v37 = CFSTR("iCloud account status could not be determined");
        }
        else if (v31 == 4)
        {
          v37 = CFSTR("iCloud account status is temporarily unavailable");
        }
      }
      else
      {
        switch(v31)
        {
          case 8:
            v37 = CFSTR("iCloud account status is restricted");
            break;
          case 16:
            v37 = CFSTR("iCloud account invalid credentials");
            break;
          case 32:
            v37 = CFSTR("iCloud account need to verify terms");
            break;
        }
      }
      *(_DWORD *)v90 = 138543618;
      v91 = v35;
      v92 = 2114;
      v93 = v37;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration by owner: %{public}@", v90, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    v20 |= 1uLL;
  }
  objc_msgSend(v29, "cloudDataSyncStateFilter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isiCloudSwitchEnabled");

  if ((v39 & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v90 = 138543362;
      v91 = (uint64_t)v43;
      _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration by owner: iCloud switch for HomeKit is not enabled", v90, 0xCu);

    }
    objc_autoreleasePoolPop(v40);
    v20 |= 2uLL;
  }
  objc_msgSend(v29, "cloudDataSyncStateFilter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isKeychainSyncSwitchEnabled");

  if ((v45 & 1) == 0)
  {
    v46 = (void *)MEMORY[0x1D17BA0A0]();
    v47 = self;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v90 = 138543362;
      v91 = (uint64_t)v49;
      _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration by owner: iCloud keychain sync is not enabled", v90, 0xCu);

    }
    objc_autoreleasePoolPop(v46);
    v20 |= 4uLL;
  }
  -[HMDHH2AutoMigrationEligibilityChecker isHSA2Enabled](self, "isHSA2Enabled");
  v50 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v51 = v50[2]();

  if ((v51 & 1) == 0)
  {
    v52 = (void *)MEMORY[0x1D17BA0A0]();
    v53 = self;
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v90 = 138543362;
      v91 = (uint64_t)v55;
      _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration by owner: HSA2 is not enabled", v90, 0xCu);

    }
    objc_autoreleasePoolPop(v52);
    v20 |= 8uLL;
  }
  if (!self
    || (-[HMDHH2AutoMigrationEligibilityChecker homeManager](self, "homeManager"),
        v56 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v56, "idsServerBag"),
        v57 = (void *)objc_claimAutoreleasedReturnValue(),
        v56,
        !v57))
  {
    v59 = 0;
    goto LABEL_64;
  }
  objc_msgSend(v57, "minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDevicesOnCurrentAccountNotAtLeastVersion:](self, v58);

  if (!v59)
  {
LABEL_64:
    v64 = v20;
    goto LABEL_65;
  }
  v60 = (void *)MEMORY[0x1D17BA0A0]();
  v61 = self;
  HMFGetOSLogHandle();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v90 = 138543362;
    v91 = (uint64_t)v63;
    _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for migration by owner: not all devices support migration by owner performing manual migration", v90, 0xCu);

  }
  objc_autoreleasePoolPop(v60);
  v64 = v20 | 0x10;
LABEL_65:
  v65 = -[HMDHH2AutoMigrationEligibilityChecker numberOwnedNonEmptyHomes](self);
  v66 = -[HMDHH2AutoMigrationEligibilityChecker numberUnownedSharedHomes](self);
  v67 = -[HMDHH2AutoMigrationEligibilityChecker numberOwnedSharedHomes](self);
  v68 = &OBJC_METACLASS___HMDRemoteKeyedArchiver;
  v69 = -[HMDHH2AutoMigrationEligibilityResult initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:]([HMDHH2AutoMigrationEligibilityResult alloc], "initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:", v64, v82, v59, -[HMDHH2AutoMigrationEligibilityChecker ownedHomesAreEmpty](self), v65, v66, v67);
  v80 = v29;
  if (self
    && (-[HMDHH2AutoMigrationEligibilityChecker homeManager](self, "homeManager"),
        v70 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v70, "idsServerBag"),
        v71 = (void *)objc_claimAutoreleasedReturnValue(),
        v70,
        v71))
  {
    objc_msgSend(v71, "minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDevicesOnCurrentAccountNotAtLeastVersion:](self, v72);

    if (v73)
    {
      v74 = (void *)MEMORY[0x1D17BA0A0]();
      v75 = self;
      HMFGetOSLogHandle();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v79 = v74;
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v90 = 138543362;
        v91 = (uint64_t)v77;
        _os_log_impl(&dword_1CD062000, v76, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for migration by owner: not all devices support migration by owner performing auto migration", v90, 0xCu);

        v74 = v79;
      }

      objc_autoreleasePoolPop(v74);
      v20 |= 0x10uLL;
      v68 = &OBJC_METACLASS___HMDRemoteKeyedArchiver;
    }
  }
  else
  {
    v73 = 0;
  }
  v78 = (void *)objc_msgSend(objc_alloc(&v68[75]), "initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:", v20, v82, v73, -[HMDHH2AutoMigrationEligibilityChecker ownedHomesAreEmpty](self), v65, v66, v67);
  v81[2](v81, v69, v78);

}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (id)isHSA2Enabled
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setIsHSA2Enabled:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)frameworkSwitchProvider
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setFrameworkSwitchProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameworkSwitchProvider, 0);
  objc_storeStrong(&self->_isHSA2Enabled, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (uint64_t)ownedHomesAreEmpty
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "homeManager", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "isOwnerUser") && !HMDIsEmptyHome(v7))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (uint64_t)_migrationReadinessiCloudAccountStatus
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  if (!a1)
    return 0;
  objc_msgSend(a1, "frameworkSwitchProvider");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v5 = objc_msgSend(v4, "areCloudKitServersReachableWithError:", &v8);
  v6 = 0;
  if (v5 <= 6)
    v6 = qword_1CDB8F350[v5];

  return v6;
}

- (uint64_t)numberOwnedNonEmptyHomes
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "homeManager", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isOwnerUser"))
          v5 += !HMDIsEmptyHome(v8);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)numberUnownedSharedHomes
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "homeManager", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isOwnerUser") ^ 1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)numberOwnedSharedHomes
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  unsigned int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "homeManager", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isOwnerUser"))
        {
          objc_msgSend(v8, "users");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "na_any:", &__block_literal_global_83_64952);

          v5 += v10;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_unsupportedDevicesOnCurrentAccountNotAtLeastVersion:(void *)a1
{
  id v3;
  SEL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(objc_getProperty(a1, v4, 16, 1), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    *(_QWORD *)&v9 = 138543874;
    v23 = v9;
    v24 = v7;
    do
    {
      v13 = 0;
      v25 = v10;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_msgSend(v14, "derivedVersion", v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isAtLeastVersion:", v3);

        if ((v16 & 1) == 0)
        {
          v17 = (void *)MEMORY[0x1D17BA0A0]();
          v18 = a1;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = a1;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v23;
            v31 = v21;
            v32 = 2114;
            v33 = v3;
            v34 = 2114;
            v35 = v14;
            _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Device for current user does not meet required version %{public}@ for HH2 auto migration: %{public}@", buf, 0x20u);

            a1 = v20;
            v7 = v24;
          }

          objc_autoreleasePoolPop(v17);
          v11 |= -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDeviceTypeFromDevice:](v18, v14);
          v10 = v25;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)_unsupportedDeviceTypeFromDevice:(void *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isCurrentDevice"))
    v4 = 16;
  else
    v4 = 0;
  objc_msgSend(v3, "productInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "productPlatform");

  switch(v6)
  {
    case 0:
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = a1;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected HMFProductPlatformUnknown", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      break;
    case 1:
      v4 |= 4uLL;
      break;
    case 2:
      v4 |= 1uLL;
      break;
    case 3:
      v4 |= 8uLL;
      break;
    case 4:
      v4 |= 2uLL;
      break;
    case 5:
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v14;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected VisionOS device that does not support HH2", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      v4 |= 0x20uLL;
      break;
    default:
      break;
  }

  return v4;
}

BOOL __63__HMDHH2AutoMigrationEligibilityChecker_numberOwnedSharedHomes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isOwner") & 1) != 0 || (objc_msgSend(v2, "isRemoteGateway") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "userID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

void __98__HMDHH2AutoMigrationEligibilityChecker_fetchIsCurrentUserEligibleForAutoMigrationWithCompletion___block_invoke(uint64_t a1, unsigned int a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  char v20;
  int v21;
  char v22;
  void *v23;
  char v24;
  const char *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  SEL v52;
  void *v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  _BOOL4 v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  NSObject *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  NSObject *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  NSObject *v95;
  id v96;
  void *v97;
  unsigned __int8 HasSharedUserOrPendingInvitation;
  void *v99;
  id v100;
  NSObject *v101;
  id v102;
  void *v103;
  NSObject *v104;
  id v105;
  void *v106;
  void *v107;
  id v108;
  NSObject *v109;
  void *v110;
  id Property;
  void *v112;
  id v113;
  NSObject *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  unint64_t v120;
  void *v121;
  id v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  unint64_t v127;
  const char *v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  NSObject *v133;
  void *v134;
  HMDHH2AutoMigrationEligibilityResult *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  HMDHH2AutoMigrationEligibilityResult *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  SEL v146;
  id v147;
  void *v148;
  void *v149;
  id v150;
  NSObject *v151;
  void *v152;
  void *v153;
  void *v154;
  unint64_t v155;
  void *v156;
  id v157;
  NSObject *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  NSObject *v163;
  void *v164;
  void *v165;
  uint64_t v167;
  void *v168;
  void *v169;
  _BOOL4 v170;
  uint64_t v171;
  id v172;
  id v173;
  id obj;
  id obja;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  uint8_t v188[4];
  id v189;
  __int16 v190;
  void *v191;
  __int16 v192;
  void *v193;
  _BYTE v194[24];
  void *v195;
  _BYTE buf[12];
  __int16 v197;
  unint64_t v198;
  __int16 v199;
  uint64_t v200;
  __int16 v201;
  unint64_t v202;
  __int16 v203;
  void *v204;
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v171 = a1;
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    v197 = 2114;
    v198 = (unint64_t)v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Does user have only empty homes: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v8 = *(void **)(v171 + 32);
  if (v8)
  {
    v182 = 0u;
    v183 = 0u;
    v180 = 0u;
    v181 = 0u;
    v169 = v8;
    objc_msgSend(v8, "homeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "homes");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v172 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
    if (v172)
    {
      v10 = *(_QWORD *)v181;
      v167 = *(_QWORD *)v181;
      while (2)
      {
        for (i = 0; i != v172; i = (char *)i + 1)
        {
          if (*(_QWORD *)v181 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v12, "isOwnerUser") & 1) == 0)
          {
            v161 = (void *)MEMORY[0x1D17BA0A0]();
            v162 = v169;
            HMFGetOSLogHandle();
            v163 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v194 = 138543618;
              *(_QWORD *)&v194[4] = v164;
              *(_WORD *)&v194[12] = 2112;
              *(_QWORD *)&v194[14] = v12;
              _os_log_impl(&dword_1CD062000, v163, OS_LOG_TYPE_INFO, "%{public}@Current user is in a shared home: %@", v194, 0x16u);

            }
            objc_autoreleasePoolPop(v161);
LABEL_34:

            goto LABEL_35;
          }
          v178 = 0u;
          v179 = 0u;
          v176 = 0u;
          v177 = 0u;
          objc_msgSend(v12, "users");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v176, &v184, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v177;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v177 != v15)
                  objc_enumerationMutation(v13);
                v17 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * j);
                if ((objc_msgSend(v17, "isOwner") & 1) == 0)
                {
                  objc_msgSend(v17, "userDataController");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "supportsHH2MigrationByOwnerManual");
                  v20 = objc_msgSend(v18, "supportsHH2MigrationByOwnerAuto");
                  v21 = isInternalBuild();
                  v22 = v20 | v19;
                  if (!v21)
                    v22 = v20;
                  if ((v22 & 1) == 0)
                  {
                    v26 = (void *)MEMORY[0x1D17BA0A0]();
                    v27 = v169;
                    HMFGetOSLogHandle();
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "shortDescription");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v194 = 138543874;
                      *(_QWORD *)&v194[4] = v29;
                      *(_WORD *)&v194[12] = 2114;
                      *(_QWORD *)&v194[14] = v30;
                      *(_WORD *)&v194[22] = 2114;
                      v195 = v17;
                      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ has at least one shared user that doesn't support migration by owner performing auto migration: %{public}@", v194, 0x20u);

                    }
                    objc_autoreleasePoolPop(v26);

                    goto LABEL_33;
                  }

                }
                if ((objc_msgSend(v17, "isOwner") & 1) == 0)
                {
                  objc_msgSend(v17, "userDataController");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "supportsHH2MigrationByOwnerAuto");

                  if ((v24 & 1) == 0)
                  {
                    v31 = (void *)MEMORY[0x1D17BA0A0]();
                    v32 = v169;
                    HMFGetOSLogHandle();
                    v33 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "shortDescription");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v194 = 138543874;
                      *(_QWORD *)&v194[4] = v34;
                      *(_WORD *)&v194[12] = 2114;
                      *(_QWORD *)&v194[14] = v35;
                      *(_WORD *)&v194[22] = 2114;
                      v195 = v17;
                      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ has at least one shared user that doesn't support migration by owner performing auto migration: %{public}@", v194, 0x20u);

                    }
                    objc_autoreleasePoolPop(v31);
LABEL_33:

                    goto LABEL_34;
                  }
                }
              }
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v176, &v184, 16);
              if (v14)
                continue;
              break;
            }
          }

          v10 = v167;
        }
        v172 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
        v10 = v167;
        if (v172)
          continue;
        break;
      }
    }

  }
  else
  {
LABEL_35:
    v36 = (void *)MEMORY[0x1D17BA0A0]();
    v37 = *(id *)(v171 + 32);
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v39;
      _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: not all homes support HH2", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 48) + 8) + 24) |= 0x20uLL;
  }
  if ((a2 & 1) == 0 && *(_QWORD *)(v171 + 56))
  {
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v41 = *(id *)(v171 + 32);
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v43;
      _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: not all devices on current account support HH2 auto migration", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v40);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 48) + 8) + 24) |= 0x10uLL;
  }
  v44 = *(void **)(v171 + 32);
  if (v44)
  {
    objc_msgSend(*(id *)(v171 + 32), "homeManager");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "lastUserAddRemoveTimestamp");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)MEMORY[0x1D17BA0A0]();
    obja = v44;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
    if (v168)
    {
      if (v47)
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v194 = 138543618;
        *(_QWORD *)&v194[4] = v48;
        *(_WORD *)&v194[12] = 2114;
        *(_QWORD *)&v194[14] = v168;
        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Last user add/remove occurred on %{public}@", v194, 0x16u);

      }
      objc_autoreleasePoolPop(v45);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "timeIntervalSinceDate:", v168);
      v51 = v50;
      objc_msgSend(objc_getProperty(obja, v52, 32, 1), "objectForKey:", CFSTR("recentUserAddRemoveTimeIntervalKey"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v54 = v53;
      else
        v54 = 0;
      v55 = v54;

      if (v55)
      {
        objc_msgSend(v55, "doubleValue");
        v57 = v56;
      }
      else if (isInternalBuild())
      {
        v57 = 432000.0;
      }
      else
      {
        v57 = 2592000.0;
      }

      v170 = v51 < v57;
    }
    else
    {
      if (v47)
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v194 = 138543362;
        *(_QWORD *)&v194[4] = v58;
        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Setting last user add/remove to now since it is not set", v194, 0xCu);

      }
      objc_autoreleasePoolPop(v45);
      objc_msgSend(v165, "setLastUserAddRemoveTimestamp");
      v170 = 1;
    }
    objc_msgSend(v165, "homes");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = 0u;
    v187 = 0u;
    v184 = 0u;
    v185 = 0u;
    v173 = v59;
    v60 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v184, buf, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v185;
      while (2)
      {
        for (k = 0; k != v60; ++k)
        {
          if (*(_QWORD *)v185 != v61)
            objc_enumerationMutation(v173);
          v63 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * k);
          if (HMDIsEmptyHome(v63))
          {
            v64 = (void *)MEMORY[0x1D17BA0A0]();
            v65 = obja;
            HMFGetOSLogHandle();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "shortDescription");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v194 = 138543618;
              *(_QWORD *)&v194[4] = v67;
              *(_WORD *)&v194[12] = 2114;
              *(_QWORD *)&v194[14] = v68;
              _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ is empty, ignoring for eligible resident check", v194, 0x16u);

            }
            objc_autoreleasePoolPop(v64);
          }
          else
          {
            *(_QWORD *)v194 = 0;
            *(_QWORD *)&v194[8] = v194;
            *(_QWORD *)&v194[16] = 0x2020000000;
            v195 = 0;
            objc_msgSend(v63, "enabledResidents");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&v180 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v180 + 1) = 3221225472;
            *(_QWORD *)&v181 = __74__HMDHH2AutoMigrationEligibilityChecker_allHomesHaveHH2SupportedResidents__block_invoke;
            *((_QWORD *)&v181 + 1) = &unk_1E89ADA90;
            *(_QWORD *)&v182 = v194;
            objc_msgSend(v69, "na_filter:", &v180);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            if (*(uint64_t *)(*(_QWORD *)&v194[8] + 24) >= 1)
            {
              objc_msgSend(v63, "enabledResidents");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v71, "count");
              v73 = v72 == *(_QWORD *)(*(_QWORD *)&v194[8] + 24);

              if (v73)
              {
                v93 = (void *)MEMORY[0x1D17BA0A0]();
                v94 = obja;
                HMFGetOSLogHandle();
                v95 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v96 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "shortDescription");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v188 = 138543618;
                  v189 = v96;
                  v190 = 2114;
                  v191 = v97;
                  _os_log_impl(&dword_1CD062000, v95, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ only has iPad as resident", v188, 0x16u);

                }
                objc_autoreleasePoolPop(v93);
                v87 = 0x2000;
LABEL_97:

                _Block_object_dispose(v194, 8);
LABEL_98:

                goto LABEL_99;
              }
            }
            if (((HMDHH2AutoMigrationHasSharedUserOrPendingInvitation(v63) | v170) & 1) != 0)
            {
              if (!objc_msgSend(v70, "count"))
              {
                HasSharedUserOrPendingInvitation = HMDHH2AutoMigrationHasSharedUserOrPendingInvitation(v63);
                v99 = (void *)MEMORY[0x1D17BA0A0]();
                v100 = obja;
                if (((HasSharedUserOrPendingInvitation | !v170) & 1) != 0)
                {
                  HMFGetOSLogHandle();
                  v101 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v102 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "shortDescription");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v188 = 138543618;
                    v189 = v102;
                    v190 = 2114;
                    v191 = v103;
                    _os_log_impl(&dword_1CD062000, v101, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ doesn't have an eligible resident", v188, 0x16u);

                  }
                  objc_autoreleasePoolPop(v99);
                  v87 = 64;
                }
                else
                {
                  HMFGetOSLogHandle();
                  v104 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v105 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "shortDescription");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v188 = 138543874;
                    v189 = v105;
                    v190 = 2114;
                    v191 = v106;
                    v192 = 2114;
                    v193 = v168;
                    _os_log_impl(&dword_1CD062000, v104, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ doesn't have an eligible resident, recent user add/remove on %{public}@", v188, 0x20u);

                  }
                  objc_autoreleasePoolPop(v99);
                  v87 = 0x4000;
                }
                goto LABEL_97;
              }
              objc_msgSend(v63, "appleMediaAccessories");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v176 = MEMORY[0x1E0C809B0];
              *((_QWORD *)&v176 + 1) = 3221225472;
              *(_QWORD *)&v177 = __74__HMDHH2AutoMigrationEligibilityChecker_allHomesHaveHH2SupportedResidents__block_invoke_86;
              *((_QWORD *)&v177 + 1) = &unk_1E89C1088;
              v75 = v70;
              *(_QWORD *)&v178 = v75;
              objc_msgSend(v74, "na_filter:", &v176);
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v76 || objc_msgSend(v76, "hmf_isEmpty"))
              {
                v88 = (void *)MEMORY[0x1D17BA0A0]();
                v89 = obja;
                HMFGetOSLogHandle();
                v90 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v91 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "shortDescription");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v188 = 138543618;
                  v189 = v91;
                  v190 = 2114;
                  v191 = v92;
                  _os_log_impl(&dword_1CD062000, v90, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ doesn't have a resident that is also accessory", v188, 0x16u);

                }
                objc_autoreleasePoolPop(v88);

                _Block_object_dispose(v194, 8);
                v87 = 64;
                goto LABEL_98;
              }

            }
            else
            {
              v77 = (void *)MEMORY[0x1D17BA0A0]();
              v78 = obja;
              HMFGetOSLogHandle();
              v79 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v80 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "shortDescription");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v188 = 138543874;
                v189 = v80;
                v190 = 2114;
                v191 = v81;
                v192 = 2114;
                v193 = v168;
                _os_log_impl(&dword_1CD062000, v79, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ last user change on %{public}@, ignoring resident requiremnt", v188, 0x20u);

              }
              objc_autoreleasePoolPop(v77);

            }
            _Block_object_dispose(v194, 8);
          }
        }
        v60 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v184, buf, 16);
        if (v60)
          continue;
        break;
      }
    }

    v82 = (void *)MEMORY[0x1D17BA0A0]();
    v83 = obja;
    HMFGetOSLogHandle();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v173, "count");
      *(_DWORD *)v194 = 138543618;
      *(_QWORD *)&v194[4] = v85;
      *(_WORD *)&v194[12] = 2050;
      *(_QWORD *)&v194[14] = v86;
      _os_log_impl(&dword_1CD062000, v84, OS_LOG_TYPE_INFO, "%{public}@All homes (%{public}lu) have at least one eligible resident device or no recent user add/remove", v194, 0x16u);

    }
    objc_autoreleasePoolPop(v82);
    v87 = 0;
LABEL_99:

    if (v87 && (a2 & 1) == 0)
    {
      v107 = (void *)MEMORY[0x1D17BA0A0]();
      v108 = *(id *)(v171 + 32);
      HMFGetOSLogHandle();
      v109 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v110;
        _os_log_impl(&dword_1CD062000, v109, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: not enough eligible residents exist for owned homes", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v107);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 48) + 8) + 24) |= v87;
    }
  }
  if ((a2 & 1) == 0)
  {
    Property = *(id *)(v171 + 32);
    if (Property)
      Property = objc_getProperty(Property, v25, 24, 1);
    if ((objc_msgSend(Property, "isHH2AutoMigrationEnabled") & 1) == 0)
    {
      v112 = (void *)MEMORY[0x1D17BA0A0]();
      v113 = *(id *)(v171 + 32);
      HMFGetOSLogHandle();
      v114 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v115;
        _os_log_impl(&dword_1CD062000, v114, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: HH2 auto migration feature flag is not enabled", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v112);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 48) + 8) + 24) |= 0x80uLL;
    }
    v116 = *(void **)(v171 + 32);
    if (!v116)
      goto LABEL_122;
    objc_msgSend(*(id *)(v171 + 32), "homeManager");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "idsServerBag");
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v118)
    {
      v121 = (void *)MEMORY[0x1D17BA0A0]();
      v122 = v116;
      HMFGetOSLogHandle();
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v124;
        _os_log_impl(&dword_1CD062000, v123, OS_LOG_TYPE_ERROR, "%{public}@Not ramp eligible because server bag is unavailable", buf, 0xCu);

      }
      goto LABEL_121;
    }
    if (-[HMDHH2AutoMigrationEligibilityChecker _hasAnySharedUser](v116))
    {
      objc_msgSend(v118, "hh2AutoMigrationWithSharedUserRampDivisor");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend(v119, "unsignedIntegerValue");

      objc_msgSend(v118, "hh2AutoMigrationWithSharedUserRampRemainder");
    }
    else
    {
      objc_msgSend(v118, "hh2AutoMigrationWithoutSharedUserRampDivisor");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend(v125, "unsignedIntegerValue");

      objc_msgSend(v118, "hh2AutoMigrationWithoutSharedUserRampRemainder");
    }
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v126, "unsignedIntegerValue");

    if (v120 <= 0x63)
    {
      v121 = (void *)MEMORY[0x1D17BA0A0]();
      v129 = v116;
      HMFGetOSLogHandle();
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v130;
        v197 = 2050;
        v198 = v120;
        v199 = 2050;
        v200 = 100;
        _os_log_impl(&dword_1CD062000, v123, OS_LOG_TYPE_INFO, "%{public}@Ramp dividier %{public}tu is less than the required minimum %{public}tu", buf, 0x20u);

      }
LABEL_121:

      objc_autoreleasePoolPop(v121);
LABEL_122:
      v131 = (void *)MEMORY[0x1D17BA0A0]();
      v132 = *(id *)(v171 + 32);
      HMFGetOSLogHandle();
      v133 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v134;
        _os_log_impl(&dword_1CD062000, v133, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: ramp roll out in effect", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v131);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 48) + 8) + 24) |= 0x1000uLL;
      goto LABEL_125;
    }
    objc_msgSend(objc_getProperty(v116, v128, 32, 1), "objectForKey:", CFSTR("rmigration-ercv"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v143 = v142;
    else
      v143 = 0;
    v144 = v143;

    if (!v144 || (v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v144)) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = objc_getProperty(v116, v146, 32, 1);
      objc_msgSend(v145, "UUIDString");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKey:", v148, CFSTR("rmigration-ercv"));

      v149 = (void *)MEMORY[0x1D17BA0A0]();
      v150 = v116;
      HMFGetOSLogHandle();
      v151 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v152;
        v197 = 2114;
        v198 = (unint64_t)v145;
        _os_log_impl(&dword_1CD062000, v151, OS_LOG_TYPE_INFO, "%{public}@Generated ramp candidate value: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v149);
    }
    *(_QWORD *)buf = 0;
    objc_msgSend(v145, "hmf_bytesAsData");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "hm_generateSHA256");
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v154, "getBytes:length:", buf, 8);
    v155 = *(_QWORD *)buf;

    v156 = (void *)MEMORY[0x1D17BA0A0]();
    v157 = v116;
    HMFGetOSLogHandle();
    v158 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v159;
      v197 = 2050;
      v198 = v155;
      v199 = 2050;
      v200 = v120;
      v201 = 2050;
      v202 = v127;
      v203 = 2114;
      v204 = v160;
      _os_log_impl(&dword_1CD062000, v158, OS_LOG_TYPE_INFO, "%{public}@HH2 auto migration ramp decision: dividend=%{public}tu, divisor=%{public}tu, remainder=%{public}tu, result=%{public}@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v156);

    if (v155 % v120 >= v127)
      goto LABEL_122;
  }
LABEL_125:
  v135 = [HMDHH2AutoMigrationEligibilityResult alloc];
  v136 = *(_QWORD *)(v171 + 56);
  v137 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v171 + 48) + 8) + 24);
  v138 = *(_QWORD *)(v171 + 64);
  v139 = -[HMDHH2AutoMigrationEligibilityChecker numberOwnedNonEmptyHomes](*(void **)(v171 + 32));
  v140 = -[HMDHH2AutoMigrationEligibilityChecker numberUnownedSharedHomes](*(void **)(v171 + 32));
  v141 = -[HMDHH2AutoMigrationEligibilityResult initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:](v135, "initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:", v137, v138, v136, a2, v139, v140, -[HMDHH2AutoMigrationEligibilityChecker numberOwnedSharedHomes](*(void **)(v171 + 32)));
  (*(void (**)(void))(*(_QWORD *)(v171 + 40) + 16))();

}

- (uint64_t)_hasAnySharedUser
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "homeManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_91);

  return v3;
}

uint64_t __58__HMDHH2AutoMigrationEligibilityChecker__hasAnySharedUser__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "users");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_189_64979);

  return v3;
}

BOOL __74__HMDHH2AutoMigrationEligibilityChecker_allHomesHaveHH2SupportedResidents__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "productClass");

  if (v5 == 3)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return v5 != 3;
}

uint64_t __74__HMDHH2AutoMigrationEligibilityChecker_allHomesHaveHH2SupportedResidents__block_invoke_86(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "device", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v3, "isEqual:", v8);

        if ((v9 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (uint64_t)_unsupportedDevicesWithCurrentDeviceAtLeastVersion:(void *)a3 residentDevicesAtLeastVersion:(void *)a4 otherDevicesAtLeastVersion:
{
  SEL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  int v32;
  void *v33;
  char v34;
  id v35;
  id v37;
  id v38;
  id obj;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v40 = a2;
  v37 = a3;
  v38 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(objc_getProperty(a1, v7, 16, 1), "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v42;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (!objc_msgSend(v15, "isCurrentDevice"))
        {
          objc_msgSend(v15, "productInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "productClass") != 3
            && (objc_msgSend(v22, "productPlatform") == 4
             || (objc_msgSend(v15, "capabilities"),
                 v31 = (void *)objc_claimAutoreleasedReturnValue(),
                 v32 = objc_msgSend(v31, "isResidentCapable"),
                 v31,
                 v32)))
          {
            objc_msgSend(v15, "derivedVersion");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isAtLeastVersion:", v37);

            if ((v34 & 1) == 0)
            {
              v25 = (void *)MEMORY[0x1D17BA0A0]();
              v35 = a1;
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v46 = v28;
                v47 = 2114;
                v48 = v37;
                v49 = 2114;
                v50 = v15;
                v29 = v27;
                v30 = "%{public}@Resident device on current user's account does not meet required version %{public}@ for "
                      "HH2 auto migration: %{public}@";
LABEL_20:
                _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, v30, buf, 0x20u);

              }
              goto LABEL_21;
            }
          }
          else
          {
            objc_msgSend(v15, "derivedVersion");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isAtLeastVersion:", v38);

            if ((v24 & 1) == 0)
            {
              v25 = (void *)MEMORY[0x1D17BA0A0]();
              v26 = a1;
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v46 = v28;
                v47 = 2114;
                v48 = v38;
                v49 = 2114;
                v50 = v15;
                v29 = v27;
                v30 = "%{public}@Controller device on current user's account does not meet required version %{public}@ fo"
                      "r HH2 auto migration: %{public}@";
                goto LABEL_20;
              }
LABEL_21:

              objc_autoreleasePoolPop(v25);
              v12 |= -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDeviceTypeFromDevice:](a1, v15);
            }
          }

          continue;
        }
        objc_msgSend(v15, "derivedVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isAtLeastVersion:", v40);

        if ((v17 & 1) == 0)
        {
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = a1;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v46 = v21;
            v47 = 2114;
            v48 = v40;
            v49 = 2114;
            v50 = v15;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Current device on current user's account does not meet required version %{public}@ for HH2 auto migration: %{public}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v18);
          v12 |= -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDeviceTypeFromDevice:](v19, v15);
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (!v11)
        goto LABEL_27;
    }
  }
  v12 = 0;
LABEL_27:

  return v12;
}

HMDHH2FrameworkSwitch *__108__HMDHH2AutoMigrationEligibilityChecker_initWithHomeManager_accountManager_featuresDataSource_userDefaults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HMDHH2FrameworkSwitch *v3;

  v2 = a2;
  v3 = -[HMDHH2FrameworkSwitch initWithAutoSwitchDisabledWithHomeManager:]([HMDHH2FrameworkSwitch alloc], "initWithAutoSwitchDisabledWithHomeManager:", v2);

  return v3;
}

BOOL __108__HMDHH2AutoMigrationEligibilityChecker_initWithHomeManager_accountManager_featuresDataSource_userDefaults___block_invoke()
{
  return +[HMDRemoteLoginUtilities isTwoFactorAuthenticationEnabledForAccount](HMDRemoteLoginUtilities, "isTwoFactorAuthenticationEnabledForAccount");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t47_65016 != -1)
    dispatch_once(&logCategory__hmf_once_t47_65016, &__block_literal_global_93);
  return (id)logCategory__hmf_once_v48_65017;
}

void __52__HMDHH2AutoMigrationEligibilityChecker_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v48_65017;
  logCategory__hmf_once_v48_65017 = v0;

}

@end
