@implementation HMSettingsController

- (void)setDelegate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  HMSettingsController *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x1A1AC1AAC](v6);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting user settings delegate: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_storeWeak((id *)&v8->_delegate, v4);
  os_unfair_lock_unlock(p_lock);

}

- (void)configureWithContext:(id)a3
{
  id v4;
  void *v5;
  HMSettingsController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSettingsController settings](v6, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "longDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configure with settings: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMSettingsController setContext:](v6, "setContext:", v4);
  -[HMSettingsController messageHandler](v6, "messageHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureWithContext:", v4);

}

- (HMSettings)settings
{
  return (HMSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HMSettingsMessageHandler)messageHandler
{
  return (HMSettingsMessageHandler *)objc_getProperty(self, a2, 56, 1);
}

- (HMSettingGroup)rootGroup
{
  os_unfair_lock_s *p_lock;
  HMSettingGroup *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rootGroup;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMSettingsController)initWithParentIdentifier:(id)a3 homeUUID:(id)a4 codingKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMSettingsMessageHandler *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSUUID *userTargetUUID;
  uint64_t v17;
  NSUUID *homeTargetUUID;
  uint64_t v19;
  NSString *targetSettingsType;
  HMSettingsCreator *v21;
  HMSettingsController *v22;
  objc_super v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [HMSettingsMessageHandler alloc];
  v12 = v10;
  v13 = v9;
  v14 = v8;
  if (v11)
  {
    v24.receiver = v11;
    v24.super_class = (Class)HMSettingsMessageHandler;
    v11 = -[HMSettingsController init](&v24, sel_init);
    if (v11)
    {
      v15 = objc_msgSend(v12, "copy");
      userTargetUUID = v11->_userTargetUUID;
      v11->_userTargetUUID = (NSUUID *)v15;

      v17 = objc_msgSend(v13, "copy");
      homeTargetUUID = v11->_homeTargetUUID;
      v11->_homeTargetUUID = (NSUUID *)v17;

      v19 = objc_msgSend(v14, "copy");
      targetSettingsType = v11->_targetSettingsType;
      v11->_targetSettingsType = (NSString *)v19;

    }
  }

  v21 = objc_alloc_init(HMSettingsCreator);
  v22 = -[HMSettingsController initWithParentIdentifier:codingKey:messageHandler:settingsCreator:](self, "initWithParentIdentifier:codingKey:messageHandler:settingsCreator:", v12, v14, v11, v21);

  return v22;
}

- (HMSettingsController)initWithParentIdentifier:(id)a3 codingKey:(id)a4 messageHandler:(id)a5 settingsCreator:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMSettingsController *v15;
  HMSettingsController *v16;
  uint64_t v17;
  NSMapTable *groupsMap;
  uint64_t v19;
  NSMapTable *settingsMap;
  uint64_t v21;
  HMSettings *settings;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMSettingsController;
  v15 = -[HMSettingsController init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_parentIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    groupsMap = v16->_groupsMap;
    v16->_groupsMap = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    settingsMap = v16->_settingsMap;
    v16->_settingsMap = (NSMapTable *)v19;

    objc_storeStrong((id *)&v16->_messageHandler, a5);
    objc_storeStrong((id *)&v16->_codingKey, a4);
    objc_msgSend(v14, "createSettingsWithOwner:", v16);
    v21 = objc_claimAutoreleasedReturnValue();
    settings = v16->_settings;
    v16->_settings = (HMSettings *)v21;

  }
  return v16;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMSettingsController parentIdentifier](self, "parentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31 != -1)
    dispatch_once(&logCategory__hmf_once_t31, &__block_literal_global_13033);
  return (id)logCategory__hmf_once_v32;
}

void __35__HMSettingsController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v32;
  logCategory__hmf_once_v32 = v0;

}

- (void)setRootGroup:(id)a3
{
  id v5;
  NSMapTable *v6;
  NSMapTable *groupsMap;
  NSMapTable *v8;
  NSMapTable *settingsMap;
  NSMapTable *v10;
  void *v11;
  _QWORD v12[5];

  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  groupsMap = self->_groupsMap;
  self->_groupsMap = v6;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  settingsMap = self->_settingsMap;
  self->_settingsMap = v8;

  objc_storeStrong((id *)&self->_rootGroup, a3);
  v10 = self->_groupsMap;
  objc_msgSend(v5, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v5, v11);

  os_unfair_lock_unlock(&self->_lock);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__HMSettingsController_setRootGroup___block_invoke;
  v12[3] = &unk_1E3AAEFF0;
  v12[4] = self;
  if (v5)
    _PreorderTraverseGroupsWithBlock(v5, 0, v12);

}

- (BOOL)hasSettings
{
  HMSettingsController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = -[NSMapTable count](v2->_settingsMap, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSetting:(id)a3 withGroupKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *p_lock;
  NSMapTable *settingsMap;
  void *v13;
  void *v14;
  HMSettingsController *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  -[HMSettingsController settingGroupForKeyPath:](self, "settingGroupForKeyPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "addSetting:", v6);
    objc_msgSend(v6, "setSettingManager:", self);
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    settingsMap = self->_settingsMap;
    objc_msgSend(v6, "keyPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](settingsMap, "setObject:forKey:", v6, v13);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v17;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to get group with key path: %@ for setting: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (id)settingForKeyPath:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_settingsMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (HMSettingsDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMSettingsDelegate *)WeakRetained;
}

- (BOOL)hasSettingGroups
{
  HMSettingsController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = -[NSMapTable count](v2->_groupsMap, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSettingGroup:(id)a3 withParentGroupKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *p_lock;
  NSMapTable *groupsMap;
  void *v13;
  void *v14;
  HMSettingsController *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  -[HMSettingsController settingGroupForKeyPath:](self, "settingGroupForKeyPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "addGroup:", v6);
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    groupsMap = self->_groupsMap;
    objc_msgSend(v6, "keyPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](groupsMap, "setObject:forKey:", v6, v13);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v17;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to get parent group with key path: %@ for setting group: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (id)settingGroupForKeyPath:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_groupsMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)mergeWith:(id)a3 settingsInitializedWasModified:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  HMSettingsController *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[5];
  _BYTE buf[24];
  char v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "rootGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSettingsController rootGroup](self, "rootGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HMFEqualObjects();

  if ((v11 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v24 = 0;
    objc_msgSend(v6, "rootGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_39;
    v21[3] = &unk_1E3AAF040;
    v21[4] = self;
    v21[5] = buf;
    if (v12)
      _PreorderTraverseGroupsWithBlock(v12, 0, v21);

    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) || v4)
      -[HMSettingsController __notifyDelegateSettingsDidUpdate](self, "__notifyDelegateSettingsDidUpdate");
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "longDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Merging new root group: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMSettingsController setRootGroup:](v15, "setRootGroup:", v7);
    -[HMSettingsController __notifyDelegateSettingsDidUpdate](v15, "__notifyDelegateSettingsDidUpdate");
    objc_msgSend(v6, "rootGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke;
    v22[3] = &unk_1E3AAEFF0;
    v22[4] = v15;
    if (v19)
      _PreorderTraverseGroupsWithBlock(v19, 0, v22);

  }
}

- (void)notifyDelegateOfUpdate
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[HMSettingsController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__HMSettingsController_notifyDelegateOfUpdate__block_invoke;
    v5[3] = &unk_1E3AB61D0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "invokeBlock:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

- (void)decodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_opt_class();
  -[HMSettingsController codingKey](self, "codingKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HMSettingsController setRootGroup:](self, "setRootGroup:", v7);
}

- (void)updateValueForSetting:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  HMSettingsController *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMSettingsController *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD block[4];
  id v27;
  HMSettingsController *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMSettingsController context](self, "context");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSettingsController updateValueForSetting:value:completionHandler:]", CFSTR("completionHandler"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      v34 = 2112;
      v35 = (const char *)v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  v12 = (void *)v11;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v12, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke;
    block[3] = &unk_1E3AB52E0;
    v27 = v8;
    v28 = self;
    v31 = v10;
    v29 = v13;
    v30 = v9;
    v15 = v13;
    dispatch_async(v14, block);

  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v19;
      v34 = 2080;
      v35 = "-[HMSettingsController updateValueForSetting:value:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v10 + 2))(v10, v15);
  }

}

- (void)__notifyDelegateSettingsDidUpdate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMSettingsController *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _BYTE location[12];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMSettingsController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMSettingsController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__HMSettingsController___notifyDelegateSettingsDidUpdate__block_invoke;
    v11[3] = &unk_1E3AB6240;
    objc_copyWeak(&v13, (id *)location);
    v6 = v5;
    v12 = v6;
    objc_msgSend(v4, "invokeBlock:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);

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
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v10;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify clients of updated settings due to no delegate caller in context: %@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)__notifyDelegateDidUpdateKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMSettingsController *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSettingsController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Finished update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_initWeak((id *)buf, v8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__HMSettingsController___notifyDelegateDidUpdateKeyPath___block_invoke;
    v13[3] = &unk_1E3AB6240;
    objc_copyWeak(&v15, (id *)buf);
    v14 = v4;
    objc_msgSend(v6, "invokeBlock:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated settings", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)encodedSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEncodedSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)codingKey
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codingKey, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_encodedSettings, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_settingsMap, 0);
  objc_storeStrong((id *)&self->_groupsMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootGroup, 0);
}

void __57__HMSettingsController___notifyDelegateDidUpdateKeyPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(WeakRetained, "parentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "settings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v14 = 138544386;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings: %@ didUpdateForIdentifier: %@ keyPath: %@ delegate: %@", (uint8_t *)&v14, 0x34u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settings:didUpdateForIdentifier:keyPath:", v13, v6, *(_QWORD *)(a1 + 32));

  }
}

void __57__HMSettingsController___notifyDelegateSettingsDidUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
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
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 138543874;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of did update settings: %@ delegate: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v4, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "settingsDidUpdate:", v10);

  }
}

void __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24[2];
  _QWORD v25[4];
  int8x16_t v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1[4], "properties") & 2) == 0)
  {
    objc_msgSend(a1[5], "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegateCaller");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Setting is not writable"), CFSTR("Setting is not writable"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "callCompletion:error:", v3, v4);

LABEL_5:
    return;
  }
  objc_msgSend(a1[4], "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if (v6)
  {
    objc_msgSend(a1[5], "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegateCaller");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "callCompletion:error:", a1[8], 0);
    goto LABEL_5;
  }
  objc_msgSend(a1[4], "valueForUpdate:", a1[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;
  if (v8)
  {
    objc_msgSend(a1[5], "messageHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke_64;
    v25[3] = &unk_1E3AB4210;
    *(_OWORD *)v24 = *((_OWORD *)a1 + 2);
    v12 = v24[0];
    v26 = vextq_s8(*(int8x16_t *)v24, *(int8x16_t *)v24, 8uLL);
    v27 = a1[7];
    v28 = a1[8];
    objc_msgSend(v10, "sendUpdateValueMessage:value:completionHandler:", v11, v8, v25);

  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = a1[5];
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = a1[7];
      v18 = a1[4];
      *(_DWORD *)buf = 138544130;
      v31 = v16;
      v32 = 2112;
      v33 = v17;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain encoded setting value %@ for setting %@. Error : %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(a1[5], "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Could not encode value"), CFSTR("Could not encode value"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:error:", v21, v22);

  }
}

void __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke_2;
  v8[3] = &unk_1E3AB4210;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v6, "callCompletion:error:", v8, v4);

}

void __70__HMSettingsController_updateValueForSetting_value_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating setting %@ to %@", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "setValue:", *(_QWORD *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __46__HMSettingsController_notifyDelegateOfUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1A1AC1AAC]();
    v4 = WeakRetained;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Calling delegate settings did update: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(v4, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "settingsDidUpdate:", v7);

  }
}

void __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingGroupForKeyPath:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_2;
  v7[3] = &unk_1E3AB01D0;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "na_each:", v7);

}

void __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settingGroupForKeyPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "longDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Merging new setting group: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "setSettingGroup:withParentGroupKeyPath:", v5, v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  objc_msgSend(v5, "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_40;
  v18[3] = &unk_1E3AAF018;
  v16 = *(_QWORD *)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v5;
  v20 = v16;
  v17 = v5;
  objc_msgSend(v15, "na_each:", v18);

}

void __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingForKeyPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Merging new setting: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v15 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "keyPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSetting:withGroupKeyPath:", v3, v16);

    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "isEqual:", v3) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging setting: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v6, "merge:", v3);
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v3, "keyPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "__notifyDelegateDidUpdateKeyPath:", v18);

  }
}

void __65__HMSettingsController_mergeWith_settingsInitializedWasModified___block_invoke_2(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Initial notify delegate = %@ for keyPath = %@ with setting = %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v3, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__notifyDelegateDidUpdateKeyPath:", v11);

}

void __37__HMSettingsController_setRootGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "setSettingGroup:withParentGroupKeyPath:", v5, a3);
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__HMSettingsController_setRootGroup___block_invoke_2;
  v8[3] = &unk_1E3AAEFC8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "na_each:", v8);

}

void __37__HMSettingsController_setRootGroup___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "keyPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSetting:withGroupKeyPath:", v4, v5);

}

@end
