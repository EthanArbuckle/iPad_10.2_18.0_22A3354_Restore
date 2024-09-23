@implementation HMDAppleAccountSettings

+ (id)sharedSettings
{
  if (sharedSettings_onceToken != -1)
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_37151);
  return (id)sharedSettings_sharedSettings;
}

- (BOOL)isEducationMode
{
  return -[HMDAppleAccountSettings isManaged](self, "isManaged")
      || -[HMDAppleAccountSettings isEphemeral](self, "isEphemeral");
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAppleAccountSettings isHomeEnabled](self, "isHomeEnabled");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("HME"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAppleAccountSettings isKeychainSyncEnabled](self, "isKeychainSyncEnabled");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("KSE"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAppleAccountSettings isManaged](self, "isManaged");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("MA"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAppleAccountSettings isEphemeral](self, "isEphemeral");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("EDU"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_16396 != -1)
    dispatch_once(&logCategory__hmf_once_t0_16396, &__block_literal_global_16397);
  return (id)logCategory__hmf_once_v1_16398;
}

void __46__HMDAppleAccountSettings_Common__logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_16398;
  logCategory__hmf_once_v1_16398 = v0;

}

- (HMDAppleAccountSettings)init
{
  HMDAppleAccountSettings *v2;
  HMDAppleAccountSettings *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *clientQueue;
  void *v9;
  HMDAppleAccountSettings *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)HMDAppleAccountSettings;
  v2 = -[HMDAppleAccountSettings init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock.lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v7;

    v3->_homeEnabled = 1;
    v3->_keychainSyncEnabled = 1;
    -[HMDAppleAccountSettings __registerForKeychainChangeNotifications](v3, "__registerForKeychainChangeNotifications");
    v9 = (void *)MEMORY[0x227676638](-[HMDAppleAccountSettings __synchronize](v3, "__synchronize"));
    v10 = v3;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccountSettings isHomeEnabled](v10, "isHomeEnabled");
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccountSettings isKeychainSyncEnabled](v10, "isKeychainSyncEnabled");
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccountSettings isManaged](v10, "isManaged");
      HMFBooleanToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccountSettings isEphemeral](v10, "isEphemeral");
      HMFBooleanToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Initialized Apple account settings with isHomeEnabled: %@, isKeychainSyncEnabled: %@, isManaged: %@, isEphemeral: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v9);
  }
  return v3;
}

- (BOOL)isHomeEnabled
{
  HMDAppleAccountSettings *v2;
  hmf_unfair_data_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_homeEnabled;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (void)enableHome:(BOOL)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  hmf_unfair_data_lock_s *p_lock;

  v4 = a4;
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_homeEnabled == v5)
  {
    os_unfair_lock_unlock(&p_lock->lock);
  }
  else
  {
    self->_homeEnabled = v5;
    os_unfair_lock_unlock(&p_lock->lock);
    -[HMDAppleAccountSettings _notifyClientsOfUpdatedHomeState:userInitiated:](self, "_notifyClientsOfUpdatedHomeState:userInitiated:", v4, v4);
    __HMDAppleAccountSettingsPostUpdatedNotification(self);
  }
}

- (void)_notifyClientsOfUpdatedHomeState:(BOOL)a3 userInitiated:(BOOL)a4
{
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  -[HMDAppleAccountSettings clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__HMDAppleAccountSettings__notifyClientsOfUpdatedHomeState_userInitiated___block_invoke;
  v8[3] = &unk_24E789C58;
  v8[4] = self;
  v9 = a3;
  v10 = a4;
  dispatch_async(v7, v8);

}

- (BOOL)isKeychainSyncEnabled
{
  HMDAppleAccountSettings *v2;
  hmf_unfair_data_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_keychainSyncEnabled;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (void)_notifyClientsOfUpdatedKeychainSyncState:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAppleAccountSettings clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDAppleAccountSettings__notifyClientsOfUpdatedKeychainSyncState___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)isManaged
{
  HMDAppleAccountSettings *v2;
  hmf_unfair_data_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_managed;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (BOOL)isEphemeral
{
  HMDAppleAccountSettings *v2;
  hmf_unfair_data_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_ephemeral;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (void)synchronize
{
  NSObject *v3;
  _QWORD block[5];

  if (+[HMDAppleAccountSettings supportsCloudSettings](HMDAppleAccountSettings, "supportsCloudSettings"))
  {
    -[HMDAppleAccountSettings clientQueue](self, "clientQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__HMDAppleAccountSettings_synchronize__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (void)__synchronize
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int homeEnabled;
  BOOL v8;
  void *v9;
  HMDAppleAccountSettings *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  HMDAppleAccountSettings *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAppleAccountSettings *v22;
  NSObject *v23;
  id v24;
  void *v25;
  int v26;
  BOOL v27;
  void *v28;
  HMDAppleAccountSettings *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  HMDAppleAccountSettings *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *context;
  void *v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (+[HMDAppleAccountSettings supportsCloudSettings](HMDAppleAccountSettings, "supportsCloudSettings"))
  {
    v3 = os_unfair_lock_lock_with_options();
    context = (void *)MEMORY[0x227676638](v3);
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_primaryAppleAccount");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      v6 = objc_msgSend(v41, "isEnabledForDataclass:", *MEMORY[0x24BDB45C8]);
    else
      v6 = 0;
    homeEnabled = self->_homeEnabled;
    v8 = homeEnabled != (_DWORD)v6;
    if (homeEnabled != (_DWORD)v6)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v12;
        v45 = 2112;
        v46 = v13;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updated to home enabled: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      self->_homeEnabled = v6;
      -[HMDAppleAccountSettings _notifyClientsOfUpdatedHomeState:userInitiated:](v10, "_notifyClientsOfUpdatedHomeState:userInitiated:", v6, 0);
    }
    if (!-[HMDAppleAccountSettings migrated](self, "migrated"))
      -[HMDAppleAccountSettings __migrateHomePreferences](self, "__migrateHomePreferences");
    v14 = objc_alloc_init(MEMORY[0x24BE1A490]);
    v42 = 0;
    v15 = objc_msgSend(v14, "isManateeAvailable:", &v42);
    v16 = v42;
    if ((v15 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v20;
        v45 = 2112;
        v46 = v16;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@The v0 keychain is not enabled: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }
    if (self->_keychainSyncEnabled != (_DWORD)v15)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v24;
        v45 = 2112;
        v46 = v25;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Updated to keychain sync enabled: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      self->_keychainSyncEnabled = v15;
      -[HMDAppleAccountSettings _notifyClientsOfUpdatedKeychainSyncState:](v22, "_notifyClientsOfUpdatedKeychainSyncState:", v15);
      v8 = 1;
    }

    v26 = objc_msgSend(v41, "aa_isManagedAppleID");
    v27 = v26;
    if (self->_managed != v26)
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v31;
        v45 = 2112;
        v46 = v32;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Updated to managed account: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      self->_managed = v27;
      v8 = 1;
    }
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isMultiUser");

    if (self->_ephemeral != v34)
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = self;
      HMFGetOSLogHandle();
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v38;
        v45 = 2112;
        v46 = v39;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Updated to ephemeral account: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      self->_ephemeral = v34;
      v8 = 1;
    }

    objc_autoreleasePoolPop(context);
    os_unfair_lock_unlock(&self->_lock.lock);
    if (v8)
      __HMDAppleAccountSettingsPostUpdatedNotification(self);
  }
}

- (void)__registerForKeychainChangeNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BE1A358]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleManateeAvailabilityNotification_, v3, 0);

}

- (void)__migrateHomePreferences
{
  CFPropertyListRef v3;
  void *v4;
  CFTypeID TypeID;
  void *v6;
  id v7;

  v3 = CFPreferencesCopyAppValue(CFSTR("kDisplayiCloudSwitch"), CFSTR("com.apple.homed"));
  if (v3)
  {
    CFPreferencesSetAppValue(CFSTR("kDisplayiCloudSwitch"), 0, CFSTR("com.apple.homed"));
    CFRelease(v3);
  }
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("kiCloudSwitchStateKey"), CFSTR("com.apple.homed"));
  TypeID = CFBooleanGetTypeID();
  objc_opt_class();
  if (v4 && CFGetTypeID(v4) != TypeID)
  {
    CFRelease(v4);
    v4 = 0;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    CFPreferencesSetAppValue(CFSTR("kiCloudSwitchStateKey"), 0, CFSTR("com.apple.homed"));
    -[HMDAppleAccountSettings __updateHomeEnabled:userInitiated:completionHandler:](self, "__updateHomeEnabled:userInitiated:completionHandler:", objc_msgSend(v7, "BOOLValue"), 0, 0);
LABEL_12:
    CFPreferencesAppSynchronize(CFSTR("com.apple.homed"));
    goto LABEL_13;
  }
  if (v3)
    goto LABEL_12;
LABEL_13:
  -[HMDAppleAccountSettings setMigrated:](self, "setMigrated:", 1);

}

- (void)updateHomeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[HMDAppleAccountSettings clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDAppleAccountSettings_updateHomeEnabled_completionHandler___block_invoke;
  block[3] = &unk_24E78D3F8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)__updateHomeEnabled:(BOOL)a3 userInitiated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  const __CFString *v14;
  void *v15;
  HMDAppleAccountSettings *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAppleAccountSettings *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAppleAccountSettings *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *context;
  _QWORD v34[4];
  void (**v35)(id, void *);
  id v36;
  BOOL v37;
  BOOL v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v6 = a3;
  v43 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a5;
  if (+[HMDAppleAccountSettings supportsCloudSettings](HMDAppleAccountSettings, "supportsCloudSettings"))
  {
    context = (void *)MEMORY[0x227676638]();
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "aa_primaryAppleAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = (_QWORD *)MEMORY[0x24BDB45C8];
      if (v6
        && (v14 = (const __CFString *)*MEMORY[0x24BDB45C8],
            (objc_msgSend(v11, "isProvisionedForDataclass:", *MEMORY[0x24BDB45C8]) & 1) == 0))
      {
        v28 = (void *)MEMORY[0x227676638]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = (uint64_t)v31;
          v41 = 2112;
          v42 = v14;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to enable iCloud switch for account. Account currently unprovisioned for %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        if (v8)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 10);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v32);

        }
      }
      else
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          v20 = CFSTR("disabled");
          if (v6)
            v20 = CFSTR("enabled");
          *(_DWORD *)buf = 138543618;
          v40 = v18;
          v41 = 2112;
          v42 = v20;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating iCloud setting to %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "postNotificationName:object:", CFSTR("kCloudDataSyncInProgressUpdatedNotification"), v16);

        objc_msgSend(v12, "setEnabled:forDataclass:", v6, *v13);
        objc_initWeak((id *)buf, v16);
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __79__HMDAppleAccountSettings___updateHomeEnabled_userInitiated_completionHandler___block_invoke;
        v34[3] = &unk_24E77A650;
        objc_copyWeak(&v36, (id *)buf);
        v37 = v6;
        v38 = a4;
        v35 = v8;
        objc_msgSend(v10, "saveVerifiedAccount:withCompletionHandler:", v12, v34);

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = (uint64_t)v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to update iCloud setting, there is no primary account", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v27);

      }
    }

    objc_autoreleasePoolPop(context);
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v22);

  }
}

- (void)handleManateeAvailabilityNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAppleAccountSettings clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDAppleAccountSettings_handleManateeAvailabilityNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BOOL)migrated
{
  return self->_migrated;
}

- (void)setMigrated:(BOOL)a3
{
  self->_migrated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

uint64_t __65__HMDAppleAccountSettings_handleManateeAvailabilityNotification___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received Manatee availability notification", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "__synchronize");
}

void __79__HMDAppleAccountSettings___updateHomeEnabled_userInitiated_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "enableHome:userInitiated:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = v7;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to save iCloud setting with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v5);

}

uint64_t __63__HMDAppleAccountSettings_updateHomeEnabled_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__updateHomeEnabled:userInitiated:completionHandler:", *(unsigned __int8 *)(a1 + 48), 1, *(_QWORD *)(a1 + 40));
}

uint64_t __38__HMDAppleAccountSettings_synchronize__block_invoke(uint64_t a1)
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
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Synchronizing apple account settings", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "__synchronize");
}

void __68__HMDAppleAccountSettings__notifyClientsOfUpdatedKeychainSyncState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HMDAppleAccountSettingsKeychainSyncStateUpdatedNotificationKey"), *(_QWORD *)(a1 + 32));

}

void __74__HMDAppleAccountSettings__notifyClientsOfUpdatedHomeState_userInitiated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Updated isHomeEnabled to %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 41), CFSTR("kIsUserInitiated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HMDAppleAccountSettingsHomeStateUpdatedNotification"), v8, v10);

}

+ (BOOL)supportsCloudSettings
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 < 6) & (0x26u >> v3);
}

void __41__HMDAppleAccountSettings_sharedSettings__block_invoke()
{
  HMDAppleAccountSettings *v0;
  void *v1;

  v0 = objc_alloc_init(HMDAppleAccountSettings);
  v1 = (void *)sharedSettings_sharedSettings;
  sharedSettings_sharedSettings = (uint64_t)v0;

}

@end
