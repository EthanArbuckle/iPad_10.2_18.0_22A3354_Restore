@implementation HMUserSettingsAdapter

- (HMUserSettingsAdapter)initWithUser:(id)a3 settingsType:(int64_t)a4
{
  id v6;
  HMUserSettingsAdapter *v7;
  HMUserSettingsAdapter *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMUserSettingsAdapter;
  v7 = -[HMUserSettingsAdapter init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_user, v6);
    v8->_type = a4;
  }

  return v8;
}

- (void)configureWithContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1A1AC1AAC](-[HMUserSettingsAdapter setContext:](self, "setContext:", v5));
  -[HMUserSettingsAdapter createRootSettingGroup](self, "createRootSettingGroup");
  objc_autoreleasePoolPop(v4);

}

- (void)createRootSettingGroup
{
  void *v3;
  void *v4;
  HMUserSettingsAdapter *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMUserNumberSetting *v26;
  HMUserSettingsAdapter *v27;
  void *v28;
  HMUserNumberSetting *v29;
  void *v30;
  void *v31;
  HMUserSettingsAdapter *v32;
  NSObject *v33;
  void *v34;
  HMSettings *v35;
  HMSettings *settings;
  uint64_t v37;
  id obj;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[HMUserSettingsAdapter rootGroup](self, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v8;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Warning: Settings adapter root group has already been constructed.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUserSettingsAdapter user](v5, "user");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v9;
      v52 = 2112;
      v53 = v10;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating settings for user %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMUserSettingsAdapter user](v5, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isCurrentUser");

    v13 = -[HMUserSettingsAdapter type](v5, "type");
    if (v13 == 2)
    {
      objc_msgSend((id)objc_opt_class(), "sharedSettingsSchema");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (v13 == 1 && v12)
    {
      objc_msgSend((id)objc_opt_class(), "privateSettingsSchema");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v14;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v43)
    {
      v42 = *(_QWORD *)v46;
      v15 = 3;
      if (!v12)
        v15 = 1;
      v37 = v15;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v46 != v42)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v17, "keyPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMUserSettingsAdapter groupKeyArrayFromKeyPath:](v5, "groupKeyArrayFromKeyPath:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMUserSettingsAdapter findOrAddUserSettingGroupWithKeyPath:](v5, "findOrAddUserSettingGroupWithKeyPath:", v19);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "constraints");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "count") == 5)
          {
            -[HMUserSettingsAdapter settingKeyFromKeyPath:](v5, "settingKeyFromKeyPath:", v18);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
            v39 = (void *)v20;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", 3);
            v41 = v19;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v18;
            v26 = [HMUserNumberSetting alloc];
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v27 = v5;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[HMNumberSetting initWithIdentifier:name:type:value:properties:minimumValue:maximumValue:stepValue:](v26, "initWithIdentifier:name:type:value:properties:minimumValue:maximumValue:stepValue:", v28, v44, 2, v25, v37, v22, v23, v24);

            v5 = v27;
            -[HMSetting setSettingManager:](v29, "setSettingManager:", v27);
            v30 = v39;
            objc_msgSend(v39, "addSetting:", v29);

            v18 = v40;
            v19 = v41;

          }
          else
          {
            v31 = (void *)MEMORY[0x1A1AC1AAC]();
            v32 = v5;
            HMFGetOSLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v51 = v34;
              _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_INFO, "%{public}@Only number settings are supported and the value array size must be 5", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v31);
            v30 = (void *)v20;
          }

        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v43);
    }

    v35 = -[HMSettings initWithSettingsOwner:]([HMSettings alloc], "initWithSettingsOwner:", v5);
    settings = v5->_settings;
    v5->_settings = v35;

  }
}

- (id)groupKeyArrayFromKeyPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HMUserSettingsAdapter createKeyPathArrayWithKeyPath:](self, "createKeyPathArrayWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  if ((objc_msgSend(v4, "hmf_isEmpty") & 1) != 0)
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v4, "removeLastObject");
    v5 = v4;
  }

  return v5;
}

- (id)findOrAddUserSettingGroupWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  HMSettingGroup *v6;
  void *v7;
  void *v8;
  HMSettingGroup *v9;
  void *v10;
  HMUserSettingsAdapter *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HMUserSettingsAdapter *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  HMUserSettingsAdapter *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t i;
  uint64_t v36;
  HMUserSettingsAdapter *v37;
  uint64_t v38;
  uint64_t v39;
  HMSettingGroup *v40;
  void *v41;
  id v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMUserSettingsAdapter rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [HMSettingGroup alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMSettingGroup initWithIdentifier:name:groups:settings:](v6, "initWithIdentifier:name:groups:settings:", v7, v8, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
    -[HMUserSettingsAdapter setRootGroup:](self, "setRootGroup:", v9);

    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMUserSettingsAdapter type](v11, "type"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v13;
      v52 = 2112;
      v53 = v15;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@User settings group created for : %@", buf, 0x16u);

      v4 = v14;
    }

    objc_autoreleasePoolPop(v10);
  }
  -[HMUserSettingsAdapter rootGroup](self, "rootGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HMUserSettingsAdapter rootGroup](self, "rootGroup");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "keyPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hmf_isEmpty"))
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = v4;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v23;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Group key array cannot be empty.", buf, 0xCu);

        v4 = v22;
      }

      objc_autoreleasePoolPop(v19);
    }
    else
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v18, "isEqual:", v29);

      if (v30)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = v4;
        obj = v4;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v46;
          v34 = 1;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v46 != v33)
                objc_enumerationMutation(obj);
              if ((v34 & 1) == 0)
              {
                v36 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
                v37 = self;
                -[HMUserSettingsAdapter appendKeyPath:withNextKey:](self, "appendKeyPath:withNextKey:", v18, v36);
                v38 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v17, "settingGroupWithKeyPath:", v38);
                v39 = objc_claimAutoreleasedReturnValue();
                if (!v39)
                {
                  v40 = [HMSettingGroup alloc];
                  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = -[HMSettingGroup initWithIdentifier:name:groups:settings:](v40, "initWithIdentifier:name:groups:settings:", v41, v36, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);

                  objc_msgSend(v17, "addGroup:", v39);
                }

                v18 = (void *)v38;
                v17 = (id)v39;
                self = v37;
              }
              v34 = 0;
            }
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            v34 = 0;
          }
          while (v32);
        }

        v17 = v17;
        v28 = v17;
        v4 = v43;
        goto LABEL_27;
      }
    }
    v28 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v24 = (void *)MEMORY[0x1A1AC1AAC]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = v27;
    _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Root group for user settings object is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
  v28 = 0;
LABEL_28:

  return v28;
}

- (id)appendKeyPath:(id)a3 withNextKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, a4);
}

- (id)createKeyPathArrayWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMUserSettingsAdapter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    v11 = v5;
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2112;
      v17 = v4;
      v18 = 2048;
      v19 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@The keypath %@ needs at least 2 keys, but only has %lu component.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)settingKeyFromKeyPath:(id)a3
{
  void *v3;
  void *v4;

  -[HMUserSettingsAdapter createKeyPathArrayWithKeyPath:](self, "createKeyPathArrayWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hmf_isEmpty") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)updateValueForSetting:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  char *v8;
  char *v9;
  id v10;
  void *v11;
  HMUserSettingsAdapter *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  HMUserSettingsAdapter *v24;
  NSObject *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMUserSettingsAdapter *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  HMUserSettingsAdapter *v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  _QWORD v58[5];
  id v59;
  char *v60;
  char *v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  _QWORD v66[4];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  char *v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = (char *)a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v68 = v14;
    v69 = 2112;
    v70 = v8;
    v71 = 2112;
    v72 = v9;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Ask to update value for [%@] to [%@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMUserSettingsAdapter context](v12, "context");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUserSettingsAdapter updateValueForSetting:value:completionHandler:]", CFSTR("completionHandler"));
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1A1AC1AAC]();
    v49 = v12;
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v51;
      v69 = 2112;
      v70 = (const char *)v47;
      _os_log_impl(&dword_19B1B0000, v50, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v48);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v47, 0);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v52);
  }
  v16 = (void *)v15;
  if (v15)
  {
    -[HMUserSettingsAdapter user](v12, "user");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if ((objc_msgSend(v8, "properties") & 2) == 0)
      {
        objc_msgSend(v16, "delegateCaller");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v20 = CFSTR("User Setting is not writable");
        v21 = CFSTR("UserSetting is not writable");
        v22 = 48;
LABEL_19:
        objc_msgSend(v19, "hmErrorWithCode:description:reason:suggestion:", v22, v20, v21, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "callCompletion:error:", v10, v30);
        goto LABEL_20;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (v9 && (isKindOfClass & 1) != 0)
      {
        if ((objc_msgSend(v8, "doesValueConformToConstraints:", v9) & 1) != 0)
        {
          objc_msgSend(v8, "value");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = HMFEqualObjects();

          if (v29)
          {
            objc_msgSend(v16, "delegateCaller");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "callCompletion:error:", v10, 0);
          }
          else
          {
            v18 = -[HMSettingValue initNumberSettingWithValue:]([HMSettingValue alloc], "initNumberSettingWithValue:", v9);
            v64 = 0;
            objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v64);
            v35 = objc_claimAutoreleasedReturnValue();
            v56 = (void *)v35;
            v57 = v64;
            if (v35)
            {
              v66[0] = v35;
              v65[0] = CFSTR("value");
              v65[1] = CFSTR("keyPath");
              objc_msgSend(v8, "keyPath");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v66[1] = v54;
              v65[2] = CFSTR("SettingTargetType");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMUserSettingsAdapter type](v12, "type"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v66[2] = v53;
              v65[3] = CFSTR("kUserUUIDKey");
              objc_msgSend(v17, "uuid");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "UUIDString");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v66[3] = v37;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 4);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "home");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "uuid");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v58[0] = MEMORY[0x1E0C809B0];
              v58[1] = 3221225472;
              v58[2] = __71__HMUserSettingsAdapter_updateValueForSetting_value_completionHandler___block_invoke;
              v58[3] = &unk_1E3AAE1D0;
              v58[4] = v12;
              v59 = v17;
              v60 = v8;
              v61 = v9;
              v62 = v16;
              v63 = v10;
              -[_HMContext sendMessage:target:payload:responseHandler:](v62, CFSTR("HMS.uv"), v40, v38, v58);

              v41 = v56;
            }
            else
            {
              v42 = (void *)MEMORY[0x1A1AC1AAC]();
              v43 = v12;
              HMFGetOSLogHandle();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v55 = v42;
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v68 = v45;
                v69 = 2112;
                v70 = v9;
                v71 = 2112;
                v72 = v8;
                v73 = 2112;
                v74 = v57;
                _os_log_impl(&dword_19B1B0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain encoded setting value %@ for setting %@. Error : %@", buf, 0x2Au);

                v42 = v55;
              }

              objc_autoreleasePoolPop(v42);
              objc_msgSend(v16, "delegateCaller");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Could not encode value"), CFSTR("Could not encode value"), 0);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "callCompletion:error:", v10, v46);

              v41 = 0;
            }

          }
          goto LABEL_21;
        }
        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "minimumValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "maximumValue");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("Value should be between %@ & %@"), v32, v33);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "delegateCaller");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 43, v18, v18, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "callCompletion:error:", v10, v34);

LABEL_20:
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v16, "delegateCaller");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = CFSTR("Either value is nil or not of type NSNumber");
      v22 = 43;
    }
    else
    {
      objc_msgSend(v16, "delegateCaller");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = CFSTR("User object is nil");
      v22 = 20;
    }
    v21 = v20;
    goto LABEL_19;
  }
  v23 = (void *)MEMORY[0x1A1AC1AAC]();
  v24 = v12;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v26;
    v69 = 2080;
    v70 = "-[HMUserSettingsAdapter updateValueForSetting:value:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v23);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v17);
LABEL_22:

}

- (void)mergeWithDictionary:(id)a3
{
  id v4;
  int v5;
  void *v6;
  _BOOL4 v7;

  v4 = a3;
  if (-[HMUserSettingsAdapter didEverSentOutSettingsDidUpdate](self, "didEverSentOutSettingsDidUpdate"))
  {
    v5 = 0;
  }
  else
  {
    v5 = 1;
    -[HMUserSettingsAdapter setDidEverSentOutSettingsDidUpdate:](self, "setDidEverSentOutSettingsDidUpdate:", 1);
  }
  -[HMUserSettingsAdapter rootGroup](self, "rootGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMUserSettingsAdapter mergeUsingPreOrder:withDictionary:](self, "mergeUsingPreOrder:withDictionary:", v6, v4);

  if (v5 | v7)
    -[HMUserSettingsAdapter _notifyDelegateSettingsDidUpdate](self, "_notifyDelegateSettingsDidUpdate");
}

- (BOOL)mergeUsingPreOrder:(id)a3 withDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  HMUserSettingsAdapter *v21;
  NSObject *v22;
  void *v23;
  HMUserSettingsAdapter *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v33;
  void *v34;
  void *context;
  uint64_t v36;
  HMUserSettingsAdapter *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v37 = self;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v33 = v6;
    objc_msgSend(v6, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    v9 = 0;
    if (v38)
    {
      v10 = *(_QWORD *)v44;
      v34 = v8;
      v36 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v12, "keyPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v12, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = HMFEqualObjects();

            if ((v16 & 1) == 0)
            {
              v17 = v12;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v18 = v17;
              else
                v18 = 0;
              v19 = v18;

              if (v19)
              {
                v20 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v19, "setValue:", v14));
                v21 = v37;
                HMFGetOSLogHandle();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v49 = v23;
                  v50 = 2112;
                  v51 = v19;
                  _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Merged setting: %@", buf, 0x16u);

                  v8 = v34;
                }

                objc_autoreleasePoolPop(v20);
                -[HMUserSettingsAdapter _notifyDelegateDidUpdateKeyPath:](v21, "_notifyDelegateDidUpdateKeyPath:", v13);
                v9 = 1;
              }
              else
              {
                context = (void *)MEMORY[0x1A1AC1AAC]();
                v24 = v37;
                HMFGetOSLogHandle();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v49 = v26;
                  v50 = 2112;
                  v51 = v17;
                  _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Looks like we have non number setting. Need to handle that. %@", buf, 0x16u);

                  v8 = v34;
                }

                objc_autoreleasePoolPop(context);
              }

              v10 = v36;
            }
          }

        }
        v38 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v38);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v6 = v33;
    objc_msgSend(v33, "groups");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v27);
          v9 |= -[HMUserSettingsAdapter mergeUsingPreOrder:withDictionary:](v37, "mergeUsingPreOrder:withDictionary:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j), v7);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v29);
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (void)_notifyDelegateDidUpdateKeyPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMUserSettingsAdapter *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMUserSettingsAdapter context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__HMUserSettingsAdapter__notifyDelegateDidUpdateKeyPath___block_invoke;
    v11[3] = &unk_1E3AB5ED8;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v6, v11);

  }
  else
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not notifying updated setting keypath: %@ due to nil queue", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)_notifyDelegateSettingsDidUpdate
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMUserSettingsAdapter *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HMUserSettingsAdapter context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__HMUserSettingsAdapter__notifyDelegateSettingsDidUpdate__block_invoke;
    block[3] = &unk_1E3AB5E18;
    block[4] = self;
    dispatch_async(v4, block);
  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Not notifying for updated settings due to nil queue", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (HMSettingsDelegate)delegate
{
  return (HMSettingsDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (HMSettingGroup)rootGroup
{
  return (HMSettingGroup *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRootGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMSettings)settings
{
  return (HMSettings *)objc_getProperty(self, a2, 32, 1);
}

- (HMUser)user
{
  return (HMUser *)objc_loadWeakRetained((id *)&self->_user);
}

- (void)setUser:(id)a3
{
  objc_storeWeak((id *)&self->_user, a3);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)didEverSentOutSettingsDidUpdate
{
  return self->_didEverSentOutSettingsDidUpdate;
}

- (void)setDidEverSentOutSettingsDidUpdate:(BOOL)a3
{
  self->_didEverSentOutSettingsDidUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_destroyWeak((id *)&self->delegate);
}

void __57__HMUserSettingsAdapter__notifyDelegateSettingsDidUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__HMUserSettingsAdapter__notifyDelegateSettingsDidUpdate__block_invoke_2;
    v8[3] = &unk_1E3AB61D0;
    objc_copyWeak(&v9, location);
    objc_msgSend(v3, "invokeBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v7;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated settings", (uint8_t *)location, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __57__HMUserSettingsAdapter__notifyDelegateSettingsDidUpdate__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v2;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of did update settings: %@ delegate: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "settingsDidUpdate:", v8);

  }
}

void __57__HMUserSettingsAdapter__notifyDelegateDidUpdateKeyPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _BYTE location[12];
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__HMUserSettingsAdapter__notifyDelegateDidUpdateKeyPath___block_invoke_2;
    v9[3] = &unk_1E3AB6240;
    objc_copyWeak(&v11, (id *)location);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v3, "invokeBlock:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated setting keypath: %@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __57__HMUserSettingsAdapter__notifyDelegateDidUpdateKeyPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(WeakRetained, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "settings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v15 = 138544386;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings: %@ didUpdateForIdentifier: %@ keyPath: %@ delegate: %@", (uint8_t *)&v15, 0x34u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settings:didUpdateForIdentifier:keyPath:", v14, v7, *(_QWORD *)(a1 + 32));

  }
}

void __71__HMUserSettingsAdapter_updateValueForSetting_value_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
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
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    v25 = 138544130;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating of setting for user [%@] finished with : %@, error %@", (uint8_t *)&v25, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if (!v5)
  {
    v12 = *(id *)(a1 + 48);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      v15 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v14, "setValue:", *(_QWORD *)(a1 + 56)));
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v18;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Updated setting: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v5 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 48);
        v25 = 138543618;
        v26 = v22;
        v27 = 2112;
        v28 = v23;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Looks like we have non number setting. Need to handle that. %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(*(id *)(a1 + 64), "delegateCaller");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "callCompletion:error:", *(_QWORD *)(a1 + 72), v5);

}

+ (id)privateSettingsSchema
{
  _HMUserSettingEntry *v2;
  _HMUserSettingEntry *v3;
  _HMUserSettingEntry *v4;
  _HMUserSettingEntry *v5;
  _HMUserSettingEntry *v6;
  _HMUserSettingEntry *v7;
  _HMUserSettingEntry *v8;
  _HMUserSettingEntry *v9;
  _HMUserSettingEntry *v10;
  void *v11;
  _HMUserSettingEntry *v13;
  _HMUserSettingEntry *v14;
  _HMUserSettingEntry *v15;
  _HMUserSettingEntry *v16;
  _HMUserSettingEntry *v17;
  _HMUserSettingEntry *v18;
  _HMUserSettingEntry *v19;
  _HMUserSettingEntry *v20;
  _HMUserSettingEntry *v21;
  _HMUserSettingEntry *v22;
  _HMUserSettingEntry *v23;
  _QWORD v24[22];

  v24[20] = *MEMORY[0x1E0C80C00];
  v23 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.addSceneButtonPresentedCount"), &unk_1E3B30430);
  v24[0] = v23;
  v22 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.completedSwitchingHomesOnboardingUI"), &unk_1E3B30448);
  v24[1] = v22;
  v21 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissed2024EnergyOnboarding"), &unk_1E3B30460);
  v24[2] = v21;
  v20 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedAccessCodeOnboarding"), &unk_1E3B30478);
  v24[3] = v20;
  v19 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedAccessoryAnalyticsOnboarding"), &unk_1E3B30490);
  v24[4] = v19;
  v18 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedAccessoryFirmwareUpdateOnboarding"), &unk_1E3B304A8);
  v24[5] = v18;
  v17 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedAnnounceOnboarding"), &unk_1E3B304C0);
  v24[6] = v17;
  v16 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedCameraRecordingOnboarding"), &unk_1E3B304D8);
  v24[7] = v16;
  v15 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedCameraRecordingSetupBanner"), &unk_1E3B304F0);
  v24[8] = v15;
  v14 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedCameraUpgradeOfferBanner"), &unk_1E3B30508);
  v24[9] = v14;
  v13 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedHomeTheaterOnboarding"), &unk_1E3B30520);
  v24[10] = v13;
  v2 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedIdentifyVoiceOnboarding"), &unk_1E3B30538);
  v24[11] = v2;
  v3 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedIdentifyVoiceSetupBanner"), &unk_1E3B30550);
  v24[12] = v3;
  v4 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedLocationServicesOnboarding"), &unk_1E3B30568);
  v24[13] = v4;
  v5 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedNaturalLightingOnboarding"), &unk_1E3B30580);
  v24[14] = v5;
  v6 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedTVViewingProfileOnboarding"), &unk_1E3B30598);
  v24[15] = v6;
  v7 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedTVViewingProfileSetupBanner"), &unk_1E3B305B0);
  v24[16] = v7;
  v8 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedUserSplitMediaAccountWarning"), &unk_1E3B305C8);
  v24[17] = v8;
  v9 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedWalletKeyExpressModeOnboarding"), &unk_1E3B305E0);
  v24[18] = v9;
  v10 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.home.dismissedWelcomeUI"), &unk_1E3B305F8);
  v24[19] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)sharedSettingsSchema
{
  _HMUserSettingEntry *v2;
  _HMUserSettingEntry *v3;
  _HMUserSettingEntry *v4;
  _HMUserSettingEntry *v5;
  _HMUserSettingEntry *v6;
  _HMUserSettingEntry *v7;
  _HMUserSettingEntry *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.music.allowExplicitContent"), &unk_1E3B30610);
  v3 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.music.allowiTunesAccount"), &unk_1E3B30628, v2);
  v11[1] = v3;
  v4 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.music.playbackInfluencesForYou"), &unk_1E3B30640);
  v11[2] = v4;
  v5 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.music.soundCheck"), &unk_1E3B30658);
  v11[3] = v5;
  v6 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.music.lossless"), &unk_1E3B30670);
  v11[4] = v6;
  v7 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.music.dolbyAtmos"), &unk_1E3B30688);
  v11[5] = v7;
  v8 = -[_HMUserSettingEntry initWithKeyPath:constraintArray:]([_HMUserSettingEntry alloc], "initWithKeyPath:constraintArray:", CFSTR("root.siri.identifyVoice"), &unk_1E3B306A0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24 != -1)
    dispatch_once(&logCategory__hmf_once_t24, &__block_literal_global_7116);
  return (id)logCategory__hmf_once_v25;
}

void __36__HMUserSettingsAdapter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25;
  logCategory__hmf_once_v25 = v0;

}

@end
