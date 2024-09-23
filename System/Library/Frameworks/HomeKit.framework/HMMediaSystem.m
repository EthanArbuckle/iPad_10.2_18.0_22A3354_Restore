@implementation HMMediaSystem

- (HMMediaSystem)initWithHome:(id)a3 uuid:(id)a4 name:(id)a5 configuredName:(id)a6 compatible:(BOOL)a7 components:(id)a8 settings:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMMediaSystem *v19;
  HMMediaSystem *v20;
  uint64_t v21;
  HMMutableArray *componentsArray;
  HMApplicationData *v23;
  HMApplicationData *applicationData;
  id v26;
  id v27;
  objc_super v28;

  v15 = a3;
  v27 = a4;
  v26 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v28.receiver = self;
  v28.super_class = (Class)HMMediaSystem;
  v19 = -[HMMediaSystem init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_home, v15);
    objc_storeStrong((id *)&v20->_uuid, a4);
    objc_storeStrong((id *)&v20->_name, a5);
    objc_storeStrong((id *)&v20->_configuredName, a6);
    v20->_compatible = a7;
    +[HMMutableArray arrayWithArray:](HMMutableArray, "arrayWithArray:", v17, v26, v27);
    v21 = objc_claimAutoreleasedReturnValue();
    componentsArray = v20->_componentsArray;
    v20->_componentsArray = (HMMutableArray *)v21;

    objc_storeStrong((id *)&v20->_settings, a9);
    v23 = objc_alloc_init(HMApplicationData);
    applicationData = v20->_applicationData;
    v20->_applicationData = v23;

  }
  return v20;
}

- (void)_unconfigureContext
{
  void *v3;
  void *v4;
  _HMContext *context;

  -[_HMContext messageDispatcher](self->_context, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  HMMediaSystem *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  HMMediaSystem *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  HMMediaSystem *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v25 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (context)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v7;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring mediaSystem and child objects", buf, 0xCu);

    }
    v8 = v25;

    objc_autoreleasePoolPop(v4);
    -[HMMediaSystem setSettings:](v25, "setSettings:", 0);
    -[HMMediaSystem mediaSystemSettingsAdapter](v25, "mediaSystemSettingsAdapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unconfigure");

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[HMMediaSystem components](v25, "components");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v27;
      *(_QWORD *)&v12 = 138543618;
      v24 = v12;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v16, "accessory", v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1A1AC1AAC]();
          v19 = v8;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v31 = v21;
            v32 = 2112;
            v33 = v17;
            _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Reset component accessory %@ settings reflected", buf, 0x16u);

            v8 = v25;
          }

          objc_autoreleasePoolPop(v18);
          objc_msgSend(v17, "updateSettingsAdapterSettingReflected:", 0);
          objc_msgSend(v16, "_unconfigure");

        }
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v13);
    }

    -[HMMediaSystem componentsArray](v8, "componentsArray");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setArray:", 0);

    -[HMMediaSystem _unconfigureContext](v8, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v23;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[HMMediaSystem audioDestination](self, "audioDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMMediaSystem uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem configuredName](self, "configuredName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem components](self, "components");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" audioDestination: %@"), v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[HMMediaSystem identifier: %@ uuid: %@ name: %@ configured name: %@ components: %@%@]"), v5, v6, v7, v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[HMMediaSystem identifier: %@ uuid: %@ name: %@ configured name: %@ components: %@%@]"), v5, v6, v7, v8, v9, &stru_1E3AB7688);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMediaSystem uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaSystem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMMediaSystem *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMMediaSystem uuid](v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaSystem uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  HMMediaSystem *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v11;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring media system: %@ context: %@ home: %@", (uint8_t *)&v16, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMediaSystem setHome:](v9, "setHome:", v7);
  -[HMMediaSystem setContext:](v9, "setContext:", v6);
  -[HMMediaSystem _updateAccessoryReference](v9, "_updateAccessoryReference");
  if (!-[HMMediaSystem supportsMessagedHomepodSettings](v9, "supportsMessagedHomepodSettings"))
  {
    -[HMMediaSystem settings](v9, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem settings](v9, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configureWithAccessorySettings:context:", v15, v6);

  }
  -[HMMediaSystem _registerNotificationHandlers](v9, "_registerNotificationHandlers");

}

- (void)postConfigure
{
  if (-[HMMediaSystem supportsMessagedHomepodSettings](self, "supportsMessagedHomepodSettings"))
    -[HMMediaSystem configureSettingsAdaptorIfNeeded](self, "configureSettingsAdaptorIfNeeded");
}

- (BOOL)configureSettingsAdaptorIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMediaSystem *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMMediaSystem *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMAccessorySettingsAdapter *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMAccessorySettingsAdapter *v40;
  void *v41;
  void *v42;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  HMMediaSystem *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[HMMediaSystem home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "options");

  if ((v6 & 0x20) == 0)
    return 0;
  -[HMMediaSystem mediaSystemSettingsAdapter](self, "mediaSystemSettingsAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v11;
      v12 = "%{public}@Asked to create settings adapter again";
      v13 = v10;
      v14 = OS_LOG_TYPE_INFO;
LABEL_16:
      _os_log_impl(&dword_19B1B0000, v13, v14, v12, buf, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  -[HMMediaSystem context](self, "context");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_14;
  v16 = (void *)v15;
  -[HMMediaSystem context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "queue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_14:
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v11;
      v12 = "%{public}@Context or context queue is nil";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
LABEL_17:

    objc_autoreleasePoolPop(v8);
    return 0;
  }
  -[HMMediaSystem settings](self, "settings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v23;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all existing settings on update to support HPLS", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    -[HMMediaSystem setSettings:](v21, "setSettings:", 0);
  }
  -[HMMediaSystem home](self, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1A1AC1AAC]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v28;
    v47 = 2112;
    v48 = v26;
    v49 = 2112;
    v50 = v24;
    _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Create settings adapter for media system: %@ home: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v25);
  objc_msgSend(v24, "homeManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "createAccessorySettingsDataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem setAccessorySettingsDataSource:](v26, "setAccessorySettingsDataSource:", v30);

  objc_msgSend(v29, "createAccessorySettingsController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem setAccessorySettingsController:](v26, "setAccessorySettingsController:", v31);

  v32 = [HMAccessorySettingsAdapter alloc];
  objc_msgSend(v24, "uniqueIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem accessorySettingsDataSource](v26, "accessorySettingsDataSource");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem accessorySettingsController](v26, "accessorySettingsController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem context](v26, "context");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "queue");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem uniqueIdentifier](v26, "uniqueIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem context](v26, "context");
  v44 = v24;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[HMAccessorySettingsAdapter initWithHomeIdentifier:dataSource:controller:workQueue:settingsContainer:containerIdentifier:containerType:settingsControl:context:](v32, "initWithHomeIdentifier:dataSource:controller:workQueue:settingsContainer:containerIdentifier:containerType:settingsControl:context:", v33, v34, v35, v37, v26, v38, 2, v26, v39);
  -[HMMediaSystem setMediaSystemSettingsAdapter:](v26, "setMediaSystemSettingsAdapter:", v40);

  -[HMMediaSystem mediaSystemSettingsAdapter](v26, "mediaSystemSettingsAdapter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDelegate:", v26);

  -[HMMediaSystem mediaSystemSettingsAdapter](v26, "mediaSystemSettingsAdapter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "configureWithCompletionHandler:", &__block_literal_global_17364);

  -[HMMediaSystem updateComponentsSettingsAdapterToSettingReflected](v26, "updateComponentsSettingsAdapterToSettingReflected");
  return 1;
}

- (void)updateComponentsSettingsAdapterToSettingReflected
{
  void *v3;
  void *v4;
  HMMediaSystem *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HMMediaSystem components](self, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating components settings adapter to setting reflected for components: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "na_each:", &__block_literal_global_14_17358);

}

- (void)_registerNotificationHandlers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMMediaSystem context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", kMediaSystemRootSettingsUpdatedNotification, self, sel__handleRootSettingsUpdated_);

  -[HMMediaSystem context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:selector:", kMediaSystemUpdatedNotification, self, sel__handleSystemUpdatedNotification_);

}

- (void)_updateAccessoryReference
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMMediaSystem components](self, "components", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[HMMediaSystem home](self, "home");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_updateAccessoryReference:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (HMMediaSystemDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMMediaSystemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)configuredName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_configuredName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setConfiguredName:(id)a3
{
  NSString *v4;
  NSString *configuredName;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *uniqueIdentifier;
  NSUUID *v5;
  NSUUID *v6;
  NSUUID *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)isCompatible
{
  HMMediaSystem *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_compatible;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)components
{
  void *v2;
  void *v3;

  -[HMMediaSystem componentsArray](self, "componentsArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (HMAccessoryCategory)category
{
  HMAccessoryCategory *v2;
  void *v3;

  v2 = -[HMAccessoryCategory initWithType:name:]([HMAccessoryCategory alloc], "initWithType:name:", CFSTR("1D8FD40E-7CAE-4AD5-9973-977D18890DE2"), CFSTR("homepod"));
  +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:](HMFObjectCacheHMAccessoryCategory, "cachedInstanceForHMAccessoryCategory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessoryCategory *)v3;
}

- (HMMediaSession)mediaSession
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMMediaSystem components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (HMMediaSession *)v6;
}

- (HMAccessorySettings)settings
{
  os_unfair_lock_s *p_lock;
  HMAccessorySettings *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_settings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSettings:(id)a3
{
  HMAccessorySettings *v4;
  HMAccessorySettings *settings;

  v4 = (HMAccessorySettings *)a3;
  os_unfair_lock_lock_with_options();
  settings = self->_settings;
  self->_settings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMSymptomsHandler)symptomsHandler
{
  return 0;
}

- (HMApplicationData)applicationData
{
  os_unfair_lock_s *p_lock;
  HMApplicationData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setApplicationData:(id)a3
{
  HMApplicationData *v4;
  HMApplicationData *applicationData;

  v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMMediaSystem *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMMediaSystem *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMMediaSystem context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMMediaSystem updateApplicationData:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__HMMediaSystem_updateApplicationData_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMMediaSystem updateApplicationData:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateApplicationData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  HMMediaSystem *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  id v40;
  _BYTE location[12];
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = a4;
  -[HMMediaSystem context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("kAppDataInformationKey"));

    }
    v10 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMMediaSystem messageTargetUUID](self, "messageTargetUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithTarget:", v11);

    v13 = (void *)MEMORY[0x1E0D285F8];
    v14 = kMediaSystemSetAppDataRequestKey;
    v15 = (void *)objc_msgSend(v8, "copy");
    v31 = (void *)v12;
    objc_msgSend(v13, "messageWithName:destination:payload:", v14, v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__HMMediaSystem__updateApplicationData_completionHandler___block_invoke;
    aBlock[3] = &unk_1E3AB5538;
    objc_copyWeak(&v40, (id *)location);
    v38 = v6;
    v39 = v32;
    v18 = _Block_copy(aBlock);
    -[HMMediaSystem context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pendingRequests");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = _Block_copy(v18);
    objc_msgSend(v20, "addCompletionBlock:forIdentifier:", v22, v21);

    v33[0] = v17;
    v33[1] = 3221225472;
    v33[2] = __58__HMMediaSystem__updateApplicationData_completionHandler___block_invoke_2;
    v33[3] = &unk_1E3AB60C8;
    v23 = v20;
    v34 = v23;
    v24 = v21;
    v35 = v24;
    v25 = v18;
    v36 = v25;
    objc_msgSend(v16, "setResponseHandler:", v33);
    objc_msgSend(v7, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendMessage:completionHandler:", v16, 0);

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v30;
      v42 = 2080;
      v43 = "-[HMMediaSystem _updateApplicationData:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
  }

}

- (void)_handleRootSettingsUpdated:(id)a3
{
  id v4;
  void *v5;
  HMMediaSystem *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  HMAccessorySettings *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HMMediaSystem *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMMediaSystem *v26;
  NSObject *v27;
  void *v28;
  HMAccessorySettingGroup *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HMMediaSystem supportsMessagedHomepodSettings](self, "supportsMessagedHomepodSettings"))
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received Root Settings Updated notification", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "dataForKey:", kMediaSystemRootSettingsCodingKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v30;
      if (v10)
      {
        v29 = -[HMAccessorySettingGroup initWithInternal:]([HMAccessorySettingGroup alloc], "initWithInternal:", v10);
        v12 = -[HMAccessorySettings initWithSettingsContainer:settingsControl:rootGroup:]([HMAccessorySettings alloc], "initWithSettingsContainer:settingsControl:rootGroup:", v6, v6, v29);
        -[HMMediaSystem setSettings:](v6, "setSettings:", v12);

        -[HMMediaSystem settings](v6, "settings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "rootGroup");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "internal");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaSystem settings](v6, "settings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaSystem context](v6, "context");
        v17 = v11;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "configureWithAccessorySettings:context:", v16, v18);

        -[HMMediaSystem settings](v6, "settings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaSystem notifyDelegateOfUpdatedSettings:](v6, "notifyDelegateOfUpdatedSettings:", v19);

        v11 = v17;
      }
      else
      {
        v25 = (void *)MEMORY[0x1A1AC1AAC]();
        v26 = v6;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v28;
          v33 = 2112;
          v34 = v11;
          _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting group from root group data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = v6;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v23;
        v33 = 2112;
        v34 = v24;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized root settings from message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
}

- (void)_handleSystemUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMediaSystem mediaSystemWithDictionary:home:](HMMediaSystem, "mediaSystemWithDictionary:home:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMMediaSystem mergeFromNewObject:isFromSerializedData:](self, "mergeFromNewObject:isFromSerializedData:", v7, 1);
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not create media system from system payload: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (BOOL)isControllable
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMMediaSystem components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      v7 = 1;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          if ((v7 & 1) != 0)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "accessory", (_QWORD)v11);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v9, "isControllable");

          }
          else
          {
            v7 = 0;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return -[HMMediaSystem mergeFromNewObject:isFromSerializedData:](self, "mergeFromNewObject:isFromSerializedData:", a3, 0);
}

- (BOOL)mergeFromNewObject:(id)a3 isFromSerializedData:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  HMMediaSystem *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = -[HMMediaSystem _mergeWithNewMediaSystem:isFromSerializedData:](self, "_mergeWithNewMediaSystem:isFromSerializedData:", v8, v4);
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge new media system with object: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (BOOL)_mergeWithNewMediaSystem:(id)a3 isFromSerializedData:(BOOL)a4
{
  id v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;

  v6 = a3;
  v7 = -[HMMediaSystem _mergeComponentsWithNewMediaSystem:](self, "_mergeComponentsWithNewMediaSystem:", v6);
  v8 = -[HMMediaSystem _mergeNameWithNewMediaSystem:](self, "_mergeNameWithNewMediaSystem:", v6);
  if (a4)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v11 = -[HMMediaSystem _mergeApplicationDataWithNewMediaSystem:](self, "_mergeApplicationDataWithNewMediaSystem:", v6);
    v12 = -[HMMediaSystem _mergeSettingsWithNewMediaSystem:](self, "_mergeSettingsWithNewMediaSystem:", v6);
    v10 = -[HMMediaSystem mergeAudioDestinationWithNewMediaSystem:](self, "mergeAudioDestinationWithNewMediaSystem:", v6);
    v9 = v11 || v12;
  }
  v13 = v7 || v8 || v10 || v9;

  return v13;
}

- (BOOL)_mergeComponentsWithNewMediaSystem:(id)a3
{
  id v4;
  HMObjectMergeCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMObjectMergeCollection *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];

  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[HMMediaSystem componentsArray](self, "componentsArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v7, v9);

  -[HMObjectMergeCollection removedObjects](v10, "removedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__HMMediaSystem__mergeComponentsWithNewMediaSystem___block_invoke;
  v20[3] = &unk_1E3AAFD30;
  v20[4] = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v20);

  -[HMObjectMergeCollection addedObjects](v10, "addedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __52__HMMediaSystem__mergeComponentsWithNewMediaSystem___block_invoke_43;
  v19[3] = &unk_1E3AAFD30;
  v19[4] = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);

  -[HMObjectMergeCollection mergeCommonObjects](v10, "mergeCommonObjects");
  v14 = -[HMObjectMergeCollection isModified](v10, "isModified");
  if (v14)
  {
    -[HMObjectMergeCollection finalObjects](v10, "finalObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem componentsArray](self, "componentsArray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setArray:", v15);

    -[HMMediaSystem components](self, "components");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem notifyDelegateOfUpdatedComponents:](self, "notifyDelegateOfUpdatedComponents:", v17);

  }
  return v14;
}

- (BOOL)_mergeNameWithNewMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  HMMediaSystem *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  HMMediaSystem *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  v8 = MEMORY[0x1E0C809B0];
  if ((v7 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating media system name: %@", buf, 0x16u);

      v8 = MEMORY[0x1E0C809B0];
    }

    objc_autoreleasePoolPop(v9);
    objc_msgSend(v4, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem setName:](v10, "setName:", v14);

    -[HMMediaSystem context](v10, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __46__HMMediaSystem__mergeNameWithNewMediaSystem___block_invoke;
    v29[3] = &unk_1E3AB5E18;
    v29[4] = v10;
    HMDispatchToContextQueueIfNotNil(v10, v15, v29);

  }
  -[HMMediaSystem configuredName](self, "configuredName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuredName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = HMFEqualObjects();

  if ((v18 & 1) != 0)
  {
    v19 = v7 ^ 1;
  }
  else
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configuredName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating media system configured name: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v4, "configuredName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem setConfiguredName:](v21, "setConfiguredName:", v25);

    -[HMMediaSystem context](v21, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v8;
    v28[1] = 3221225472;
    v28[2] = __46__HMMediaSystem__mergeNameWithNewMediaSystem___block_invoke_44;
    v28[3] = &unk_1E3AB5E18;
    v28[4] = v21;
    HMDispatchToContextQueueIfNotNil(v21, v26, v28);

    v19 = 1;
  }

  return v19;
}

- (BOOL)_mergeApplicationDataWithNewMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v4 = a3;
  -[HMMediaSystem applicationData](self, "applicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "applicationData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem setApplicationData:](self, "setApplicationData:", v8);

    -[HMMediaSystem context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__HMMediaSystem__mergeApplicationDataWithNewMediaSystem___block_invoke;
    v11[3] = &unk_1E3AB5E18;
    v11[4] = self;
    HMDispatchToContextQueueIfNotNil(self, v9, v11);

  }
  return v7 ^ 1;
}

- (BOOL)_mergeSettingsWithNewMediaSystem:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[HMMediaSystem _mergeLegacySettingsWithNewMediaSystem:](self, "_mergeLegacySettingsWithNewMediaSystem:", v4);
  LOBYTE(self) = -[HMMediaSystem mergeSupportsMessagedHomepodSettingsWithNewMediaSystem:](self, "mergeSupportsMessagedHomepodSettingsWithNewMediaSystem:", v4);

  return v5 | self;
}

- (BOOL)_mergeLegacySettingsWithNewMediaSystem:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  HMMediaSystem *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  HMMediaSystem *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "supportsMessagedHomepodSettings") & 1) == 0)
  {
    objc_msgSend(v4, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem settings](self, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

    if ((v6 == 0) == v8)
    {
      -[HMMediaSystem settings](self, "settings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rootGroup");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rootGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if ((v17 & 1) != 0)
      {
        v5 = 0;
LABEL_11:

        goto LABEL_12;
      }
      -[HMMediaSystem settings](self, "settings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __56__HMMediaSystem__mergeLegacySettingsWithNewMediaSystem___block_invoke_45;
      v34 = &unk_1E3AB5ED8;
      v35 = self;
      v13 = &v36;
      v19 = v6;
      v36 = v19;
      objc_msgSend(v18, "_updateSettingsWithBlock:", &v31);

      v25 = (void *)MEMORY[0x1A1AC1AAC](v20, v21, v22, v23, v24);
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "longDescription", v31, v32, v33, v34, v35);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v28;
        v41 = 2112;
        v42 = v29;
        _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Merged new settings: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
    }
    else
    {
      objc_msgSend(v6, "rootGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "internal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaSystem context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configureWithAccessorySettings:context:", v6, v11);

      -[HMMediaSystem setSettings:](self, "setSettings:", v6);
      objc_msgSend(v6, "setSettingsControl:", self);
      objc_msgSend(v6, "setSettingsContainerInternal:", self);
      -[HMMediaSystem context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __56__HMMediaSystem__mergeLegacySettingsWithNewMediaSystem___block_invoke;
      v37[3] = &unk_1E3AB5ED8;
      v37[4] = self;
      v13 = &v38;
      v38 = v6;
      HMDispatchToContextQueueIfNotNil(self, v12, v37);

    }
    v5 = 1;
    goto LABEL_11;
  }
  v5 = 0;
LABEL_12:

  return v5;
}

- (BOOL)mergeSupportsMessagedHomepodSettingsWithNewMediaSystem:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "supportsMessagedHomepodSettings");
  if (v4)
    LOBYTE(v4) = -[HMMediaSystem configureSettingsAdaptorIfNeeded](self, "configureSettingsAdaptorIfNeeded");
  return v4;
}

- (BOOL)mergeAudioDestinationWithNewMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystem audioDestination](self, "audioDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();
  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating audio destination: %@ new audio destination: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMMediaSystem setAudioDestination:](v9, "setAudioDestination:", v6);
    -[HMMediaSystem context](v9, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__HMMediaSystem_mergeAudioDestinationWithNewMediaSystem___block_invoke;
    v14[3] = &unk_1E3AB5E18;
    v14[4] = v9;
    HMDispatchToContextQueueIfNotNil(v9, v12, v14);

  }
  return v7 ^ 1;
}

- (void)updateMediaSession:(id)a3 forMediaProfile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMMediaSystem *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMMediaSystem context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__HMMediaSystem_updateMediaSession_forMediaProfile___block_invoke;
    block[3] = &unk_1E3AB5CD0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2080;
      v21 = "-[HMMediaSystem updateMediaSession:forMediaProfile:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)notifyDelegateOfUpdatedName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystem context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__HMMediaSystem_notifyDelegateOfUpdatedName___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[HMMediaSystem notifyDelegateOfUpdatedName:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)notifyDelegateOfUpdatedConfiguredName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystem context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__HMMediaSystem_notifyDelegateOfUpdatedConfiguredName___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[HMMediaSystem notifyDelegateOfUpdatedConfiguredName:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)notifyDelegateOfUpdatedComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystem context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__HMMediaSystem_notifyDelegateOfUpdatedComponents___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v7, "invokeBlock:", v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[HMMediaSystem notifyDelegateOfUpdatedComponents:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)notifyDelegateOfUpdatedApplicationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystem context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__HMMediaSystem_notifyDelegateOfUpdatedApplicationData___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[HMMediaSystem notifyDelegateOfUpdatedApplicationData:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)notifyDelegateOfUpdatedSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystem context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__HMMediaSystem_notifyDelegateOfUpdatedSettings___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[HMMediaSystem notifyDelegateOfUpdatedSettings:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)notifyDelegateOfUpdatedMediaSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystem context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__HMMediaSystem_notifyDelegateOfUpdatedMediaSession___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[HMMediaSystem notifyDelegateOfUpdatedMediaSession:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)notifyDelegateOfUpdatedAudioDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMMediaSystem *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMediaSystem *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  HMMediaSystem *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMMediaSystem context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMMediaSystem delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaSystem audioDestination](v7, "audioDestination");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated audio destination: %@ with delegate: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __56__HMMediaSystem_notifyDelegateOfUpdatedAudioDestination__block_invoke;
      v15[3] = &unk_1E3AB5ED8;
      v16 = v5;
      v17 = v7;
      objc_msgSend(v4, "invokeBlock:", v15);

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated audio destination due to no delegate caller for context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaSystem uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMMediaSystem context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMMediaSystem)initWithCoder:(id)a3
{
  id v4;
  HMMediaSystem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMAccessorySettings *v15;
  HMAccessorySettingGroup *v16;
  HMMediaSystem *v17;
  HMApplicationData *v18;
  HMApplicationData *applicationData;
  uint64_t v20;
  HMMediaDestination *audioDestination;
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "decodeBoolForKey:", kMediaSystemInvalidObjectFlagCodingKey) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kMediaSystemUUIDCodingKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kMediaSystemNameCodingKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kMediaSystemConfiguredNameCodingKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "decodeBoolForKey:", kMediaSystemCompatibleCodingKey);
    v10 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, kMediaSystemComponentsCodingKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kMediaSystemRootSettingsCodingKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (_os_feature_enabled_impl() & 1) == 0)
    {
      v16 = -[HMAccessorySettingGroup initWithInternal:]([HMAccessorySettingGroup alloc], "initWithInternal:", v14);
      v15 = -[HMAccessorySettings initWithSettingsContainer:settingsControl:rootGroup:]([HMAccessorySettings alloc], "initWithSettingsContainer:settingsControl:rootGroup:", self, self, v16);

    }
    else
    {
      v15 = 0;
    }
    v17 = -[HMMediaSystem initWithHome:uuid:name:configuredName:compatible:components:settings:](self, "initWithHome:uuid:name:configuredName:compatible:components:settings:", v23, v6, v7, v8, v9, v13, v15);
    if (v17)
    {
      v18 = -[HMApplicationData initWithDictionaryFromCoder:key:]([HMApplicationData alloc], "initWithDictionaryFromCoder:key:", v4, CFSTR("HM.appData"));
      applicationData = v17->_applicationData;
      v17->_applicationData = v18;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), HMMediaSystemAudioDestinationCodingKey);
      v20 = objc_claimAutoreleasedReturnValue();
      audioDestination = v17->_audioDestination;
      v17->_audioDestination = (HMMediaDestination *)v20;

    }
    self = v17;

    v5 = self;
  }

  return v5;
}

- (void)callCompletionHandler:(id)a3
{
  -[HMMediaSystem callCompletionHandler:error:](self, "callCompletionHandler:error:", a3, 0);
}

- (void)callCompletionHandler:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMediaSystem *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMMediaSystem *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMMediaSystem context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "callCompletion:error:", v6, v7);
    }
    else
    {
      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v18;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no delegate caller given by context: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no handler provided", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (NSString)audioDestinationIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaSystem audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)audioDestinationType
{
  void *v2;
  _BOOL4 v3;

  -[HMMediaSystem audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return 2 * v3;
}

- (BOOL)supportsAudioDestination
{
  void *v2;
  char v3;

  -[HMMediaSystem audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsHomeTheaterSupportedOptions");

  return v3;
}

- (BOOL)supportsAudioGroup
{
  void *v2;
  char v3;

  -[HMMediaSystem audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsSupportedOptions:", 8);

  return v3;
}

- (BOOL)supportsMessagedHomepodSettings
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMMediaSystem components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "accessory");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "supportsMessagedHomePodSettings");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)audioDestinationParentIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaSystem uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)audioDestinationMediaProfiles
{
  void *v2;
  void *v3;
  void *v4;

  -[HMMediaSystem components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(v3, "na_map:", &__block_literal_global_75);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSUUID)audioDestinationGroupIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaSystem audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)updateAudioDestinationSupportedOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HMMediaSystem *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMMediaSystem *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMMediaSystem *v30;
  id v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v10;
    v36 = 2112;
    v37 = v11;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending update audio destination support options message with options: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMMediaSystem context](v8, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v32 = CFSTR("HMMediaDestinationSupportedOptionsPayloadKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMMediaSystem audioDestination](v8, "audioDestination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithTarget:", v18);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMMediaDestinationUpdateSupportedOptionsRequestMessage"), v19, v15);
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __67__HMMediaSystem_updateAudioDestinationSupportedOptions_completion___block_invoke;
    v29 = &unk_1E3AB59B8;
    v30 = v8;
    v31 = v6;
    objc_msgSend(v20, "setResponseHandler:", &v26);
    v21 = (void *)objc_msgSend(v20, "copy", v26, v27, v28, v29, v30);
    objc_msgSend(v13, "sendMessage:", v21);

  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = v8;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination support options due to no message dispatcher given by context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem callCompletionHandler:error:](v23, "callCompletionHandler:error:", v6, v15);
  }

}

- (void)adapter:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMMediaSystem *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMMediaSystem settings](self, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Attempt to set root group to non-nil settings.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    -[HMMediaSystem setSettings:](self, "setSettings:", v7);
    -[HMMediaSystem settings](self, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem notifyDelegateOfUpdatedSettings:](self, "notifyDelegateOfUpdatedSettings:", v13);

  }
}

- (void)adapter:(id)a3 didUpdateSettingKeyPaths:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMediaSystem *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  HMMediaSystem *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v11;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Media system %@ did update settings %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMediaSystem context](v9, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_initWeak((id *)buf, v9);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__HMMediaSystem_adapter_didUpdateSettingKeyPaths___block_invoke;
    v14[3] = &unk_1E3AB6240;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v7;
    objc_msgSend(v13, "invokeBlock:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

- (void)adapter:(id)a3 didUpdatePreferredMediaUserUUIDString:(id)a4 selectionType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  HMMediaSystem *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Preferred media user not supported.", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v9);

}

- (void)updateSettingWithKeyPath:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  HMMediaSystem *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  HMMediaSystem *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[HMMediaSystem mediaSystemSettingsAdapter](self, "mediaSystemSettingsAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1A1AC1AAC]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v16;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Media system %@ update setting %@ with value %@", (uint8_t *)&v19, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    -[HMMediaSystem mediaSystemSettingsAdapter](v13, "mediaSystemSettingsAdapter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithKeyPath:value:completionHandler:", v8, v9, v10);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Calling update setting with settings adapter object being nil", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:suggestion:", 8, CFSTR("Adapter is nil"), CFSTR("Configure adapter before use it"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v17);
  }

}

- (id)targetAccessoryIdentifierBySerial
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v18;
  HMMediaSystem *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMMediaSystem *v23;
  NSObject *v24;
  void *v25;
  HMMediaSystem *v26;
  void *v27;
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
  -[HMMediaSystem components](self, "components", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v29;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v7)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v8), "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        break;
      v10 = v9;
      objc_msgSend(v9, "serialNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v22 = (void *)MEMORY[0x1A1AC1AAC]();
        v26 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v27;
          _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Missing serial number cannot determine target", buf, 0xCu);

        }
LABEL_22:

        objc_autoreleasePoolPop(v22);
        return 0;
      }
      if (!v6
        || (objc_msgSend(v6, "serialNumber"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "serialNumber"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v12, "compare:", v13),
            v13,
            v12,
            v14 == 1))
      {
        v15 = v10;

        v6 = v15;
      }

      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v5)
          goto LABEL_3;

        objc_msgSend(v6, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        return v16;
      }
    }
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Missing accessory cannot determine target", buf, 0xCu);

    }
    v10 = 0;
    goto LABEL_22;
  }

  v18 = (void *)MEMORY[0x1A1AC1AAC]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v21;
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to find target accessory by serial", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  return 0;
}

- (HMHome)home
{
  return (HMHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HMAccessorySettingsDataSource)accessorySettingsDataSource
{
  return self->_accessorySettingsDataSource;
}

- (void)setAccessorySettingsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, a3);
}

- (HMAccessorySettingsController)accessorySettingsController
{
  return self->_accessorySettingsController;
}

- (void)setAccessorySettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsController, a3);
}

- (HMAccessorySettingsAdapter)mediaSystemSettingsAdapter
{
  return self->_mediaSystemSettingsAdapter;
}

- (void)setMediaSystemSettingsAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSystemSettingsAdapter, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMMutableArray)componentsArray
{
  return self->_componentsArray;
}

- (void)setComponentsArray:(id)a3
{
  objc_storeStrong((id *)&self->_componentsArray, a3);
}

- (HMMediaDestination)audioDestination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAudioDestination:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_componentsArray, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_mediaSystemSettingsAdapter, 0);
  objc_storeStrong((id *)&self->_accessorySettingsController, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __50__HMMediaSystem_adapter_didUpdateSettingKeyPaths___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id obj;
  id WeakRetained;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v7;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings will update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v5, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settingsWillUpdate:", v8);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = *(id *)(a1 + 32);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1A1AC1AAC]();
          v15 = WeakRetained;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "uniqueIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v33 = v17;
            v34 = 2112;
            v35 = v18;
            v36 = 2112;
            v37 = v13;
            _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying clients did update for identifier %@ setting %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v14);
          objc_msgSend(v15, "settings");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uniqueIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "settings:didUpdateForIdentifier:keyPath:", v19, v20, v13);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v10);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = WeakRetained;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      v34 = 2112;
      v35 = v22;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings did update: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(v22, "settings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settingsDidUpdate:", v25);

  }
}

void __67__HMMediaSystem_updateAudioDestinationSupportedOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update destination supported options request message responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandler:error:", *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Update destination supported options request message succeeded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandler:", *(_QWORD *)(a1 + 40));
  }

}

uint64_t __46__HMMediaSystem_audioDestinationMediaProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

uint64_t __56__HMMediaSystem_notifyDelegateOfUpdatedAudioDestination__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaSystemDidUpdateAudioDestination:", *(_QWORD *)(a1 + 40));
}

void __53__HMMediaSystem_notifyDelegateOfUpdatedMediaSession___block_invoke(uint64_t a1)
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
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system session: %@ for components: [%@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__HMMediaSystem_notifyDelegateOfUpdatedMediaSession___block_invoke_62;
    v14[3] = &unk_1E3AB5CD0;
    v11 = v8;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v15 = v11;
    v16 = v12;
    v17 = v13;
    objc_msgSend(v10, "invokeBlock:", v14);

  }
}

uint64_t __53__HMMediaSystem_notifyDelegateOfUpdatedMediaSession___block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaObject:didUpdateMediaSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __49__HMMediaSystem_notifyDelegateOfUpdatedSettings___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system settings: {%@}", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__HMMediaSystem_notifyDelegateOfUpdatedSettings___block_invoke_59;
    v13[3] = &unk_1E3AB5CD0;
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v14 = v10;
    v15 = v11;
    v16 = v12;
    objc_msgSend(v9, "invokeBlock:", v13);

  }
}

uint64_t __49__HMMediaSystem_notifyDelegateOfUpdatedSettings___block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaObject:didUpdateSettings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __56__HMMediaSystem_notifyDelegateOfUpdatedApplicationData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system app data: {%@}", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__HMMediaSystem_notifyDelegateOfUpdatedApplicationData___block_invoke_56;
    v13[3] = &unk_1E3AB5CD0;
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v14 = v10;
    v15 = v11;
    v16 = v12;
    objc_msgSend(v9, "invokeBlock:", v13);

  }
}

uint64_t __56__HMMediaSystem_notifyDelegateOfUpdatedApplicationData___block_invoke_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaSystem:didUpdateApplicationData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __51__HMMediaSystem_notifyDelegateOfUpdatedComponents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v2;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system components: %@ delegate: %@", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "mediaSystem:didUpdateComponents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __55__HMMediaSystem_notifyDelegateOfUpdatedConfiguredName___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system configured name: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__HMMediaSystem_notifyDelegateOfUpdatedConfiguredName___block_invoke_51;
    v13[3] = &unk_1E3AB5CD0;
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v14 = v10;
    v15 = v11;
    v16 = v12;
    objc_msgSend(v9, "invokeBlock:", v13);

  }
}

uint64_t __55__HMMediaSystem_notifyDelegateOfUpdatedConfiguredName___block_invoke_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaSystem:didUpdateConfiguredName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __45__HMMediaSystem_notifyDelegateOfUpdatedName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did update name: %@ delegate: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __45__HMMediaSystem_notifyDelegateOfUpdatedName___block_invoke_48;
      v18[3] = &unk_1E3AB5CD0;
      v10 = v4;
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      v19 = v10;
      v20 = v11;
      v21 = v12;
      objc_msgSend(v3, "invokeBlock:", v18);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get delegate caller to notify client of did update name: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

uint64_t __45__HMMediaSystem_notifyDelegateOfUpdatedName___block_invoke_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaSystem:didUpdateName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __52__HMMediaSystem_updateMediaSession_forMediaProfile___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Updated media system session: %@ for components: [%@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "components", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "mediaProfile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(void **)(a1 + 48);

        if (v13 == v14)
        {
          objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfUpdatedMediaSession:", *(_QWORD *)(a1 + 40));
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

}

uint64_t __57__HMMediaSystem_mergeAudioDestinationWithNewMediaSystem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfUpdatedAudioDestination");
}

uint64_t __56__HMMediaSystem__mergeLegacySettingsWithNewMediaSystem___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "longDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Updated new settings: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfUpdatedSettings:", *(_QWORD *)(a1 + 40));
}

void __56__HMMediaSystem__mergeLegacySettingsWithNewMediaSystem___block_invoke_45(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "mergeObject:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@The merge unexpectedly did not result in a change.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
}

void __57__HMMediaSystem__mergeApplicationDataWithNewMediaSystem___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "applicationData");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyDelegateOfUpdatedApplicationData:", v2);

}

void __46__HMMediaSystem__mergeNameWithNewMediaSystem___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "name");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyDelegateOfUpdatedName:", v2);

}

void __46__HMMediaSystem__mergeNameWithNewMediaSystem___block_invoke_44(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "configuredName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyDelegateOfUpdatedConfiguredName:", v2);

}

void __52__HMMediaSystem__mergeComponentsWithNewMediaSystem___block_invoke(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed media system component via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "_unconfigure");

}

void __52__HMMediaSystem__mergeComponentsWithNewMediaSystem___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added media system component via merge: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateAccessoryReference:", v8);

}

void __58__HMMediaSystem__updateApplicationData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v8 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "setApplicationData:", *(_QWORD *)(a1 + 32));
    WeakRetained = v8;
  }
  objc_msgSend(WeakRetained, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __58__HMMediaSystem__updateApplicationData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __57__HMMediaSystem_updateApplicationData_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateApplicationData:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __29__HMMediaSystem_mediaSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

void __66__HMMediaSystem_updateComponentsSettingsAdapterToSettingReflected__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "accessory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSettingsAdapterSettingReflected:", 1);

}

+ (id)mediaSystemWithDictionary:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  HMMediaSystem *v16;
  void *v17;
  HMMediaSystem *v18;
  unsigned int v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "hmf_stringForKey:", kMediaSystemNameCodingKey);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", kMediaSystemConfiguredNameCodingKey);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDForKey:", kMediaSystemUUIDCodingKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "hmf_BOOLForKey:", kMediaSystemCompatibleCodingKey);
  objc_msgSend(v5, "hmf_arrayForKey:", kMediaSystemComponentsCodingKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        +[HMMediaSystemComponent mediaSystemComponentWithDictionary:home:](HMMediaSystemComponent, "mediaSystemComponentWithDictionary:home:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14), v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  v16 = [HMMediaSystem alloc];
  v17 = (void *)objc_msgSend(v9, "copy");
  v18 = -[HMMediaSystem initWithHome:uuid:name:configuredName:compatible:components:settings:](v16, "initWithHome:uuid:name:configuredName:compatible:components:settings:", v6, v7, v22, v21, v20, v17, 0);

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t55 != -1)
    dispatch_once(&logCategory__hmf_once_t55, &__block_literal_global_65);
  return (id)logCategory__hmf_once_v56;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __28__HMMediaSystem_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v56;
  logCategory__hmf_once_v56 = v0;

}

@end
