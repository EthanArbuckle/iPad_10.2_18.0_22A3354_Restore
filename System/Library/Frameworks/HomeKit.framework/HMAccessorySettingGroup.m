@implementation HMAccessorySettingGroup

void __50___HMAccessorySettingGroup_supportedGroupsClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedGroupsClasses_supportedGroupsClasses;
  supportedGroupsClasses_supportedGroupsClasses = v2;

}

void __52___HMAccessorySettingGroup_supportedSettingsClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedSettingsClasses_supportedSettingsClasses;
  supportedSettingsClasses_supportedSettingsClasses = v2;

}

void __39___HMAccessorySettingGroup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17_32569;
  logCategory__hmf_once_v17_32569 = v0;

}

- (HMAccessorySettingGroup)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMAccessorySettingGroup)initWithKeyPath:(id)a3
{
  id v4;
  _HMAccessorySettingGroup *v5;
  HMAccessorySettingGroup *v6;

  v4 = a3;
  v5 = -[_HMAccessorySettingGroup initWithName:]([_HMAccessorySettingGroup alloc], "initWithName:", v4);

  v6 = -[HMAccessorySettingGroup initWithInternal:](self, "initWithInternal:", v5);
  return v6;
}

- (HMAccessorySettingGroup)initWithInternal:(id)a3
{
  id v5;
  HMAccessorySettingGroup *v6;
  id *p_isa;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  HMAccessorySettingGroup *v24;
  HMAccessorySettingGroup *v25;
  HMAccessorySettingGroup *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v39.receiver = self;
    v39.super_class = (Class)HMAccessorySettingGroup;
    v6 = -[HMAccessorySettingGroup init](&v39, sel_init);
    p_isa = (id *)&v6->super.super.isa;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_internal, a3);
      objc_msgSend(v5, "setDelegate:", p_isa);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = p_isa[8];
      p_isa[8] = (id)v8;

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v5, "settings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v36 != v13)
              objc_enumerationMutation(v10);
            +[HMAccessorySetting settingForInternal:](HMAccessorySetting, "settingForInternal:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              objc_msgSend(v15, "setGroup:", p_isa);
              objc_msgSend(p_isa[8], "addObject:", v16);
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v12);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = p_isa[9];
      p_isa[9] = (id)v17;

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v5, "groups", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v19);
            v24 = -[HMAccessorySettingGroup initWithInternal:]([HMAccessorySettingGroup alloc], "initWithInternal:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
            v25 = v24;
            if (v24)
            {
              -[HMAccessorySettingGroup setGroup:](v24, "setGroup:", p_isa);
              objc_msgSend(p_isa[9], "addObject:", v25);
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v21);
      }

    }
    self = p_isa;
    v26 = self;
  }
  else
  {
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to create setting group controller without internal object", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    v26 = 0;
  }

  return v26;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMAccessorySettingGroup keyPath](self, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMAccessorySettings localizationKeyForKeyPath:](HMAccessorySettings, "localizationKeyForKeyPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMLocalization sharedManager](HMLocalization, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLocalizedString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMAccessorySettingGroup internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessorySettingGroup *v4;
  HMAccessorySettingGroup *v5;
  HMAccessorySettingGroup *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  v4 = (HMAccessorySettingGroup *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_9;
    -[HMAccessorySettingGroup keyPath](self, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingGroup keyPath](v6, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (!v9)
      goto LABEL_9;
    -[HMAccessorySettingGroup groups](self, "groups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingGroup groups](v6, "groups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToArray:", v11);

    if (v12)
    {
      -[HMAccessorySettingGroup settings](self, "settings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingGroup settings](v6, "settings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToArray:", v14);

    }
    else
    {
LABEL_9:
      v15 = 0;
    }

  }
  return v15;
}

- (BOOL)isReflectedEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  void *context;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1A1AC1AAC]();
  v25 = v4;
  objc_msgSend(v4, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HMAccessorySettingGroup groups](self, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "keyPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "hmf_firstObjectWithValue:forKeyPath:", v12, CFSTR("keyPath"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && !objc_msgSend(v11, "isReflectedEqual:", v13))
        {
LABEL_21:
          v22 = 0;
          goto LABEL_22;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v25, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMAccessorySettingGroup settings](self, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    while (2)
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v18, "keyPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hmf_firstObjectWithValue:forKeyPath:", v19, CFSTR("keyPath"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = objc_msgSend(v18, "isReflected");
          if (v21 != objc_msgSend(v20, "isReflected"))
          {

            goto LABEL_21;
          }
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      v22 = 1;
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v22 = 1;
  }
LABEL_22:

  objc_autoreleasePoolPop(context);
  return v22;
}

- (void)mergeReflected:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  objc_msgSend(v23, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HMAccessorySettingGroup groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "keyPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hmf_firstObjectWithValue:forKeyPath:", v11, CFSTR("keyPath"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v10, "mergeReflected:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  objc_msgSend(v23, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HMAccessorySettingGroup settings](self, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v19, "keyPath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hmf_firstObjectWithValue:forKeyPath:", v20, CFSTR("keyPath"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = objc_msgSend(v19, "isReflected");
          if (v22 != objc_msgSend(v21, "isReflected"))
            objc_msgSend(v19, "updateReflected:", objc_msgSend(v21, "isReflected"));
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

}

- (id)keyPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  -[HMAccessorySettingGroup group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMAccessorySettingGroup internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(".%@"), v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(v7, "copy");
  }
  v10 = (void *)v9;

  objc_autoreleasePoolPop(v3);
  return v10;
}

- (NSArray)settings
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_settings, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addSetting:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableSet containsObject:](self->_settings, "containsObject:", v5) & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[NSMutableSet addObject:](self->_settings, "addObject:", v5);
      objc_msgSend(v5, "setGroup:", self);
      os_unfair_lock_unlock(&self->_lock);
      -[HMAccessorySettingGroup _notifyClientOfAddedSetting:](self, "_notifyClientOfAddedSetting:", v5);
    }
    v4 = v5;
  }

}

- (void)_notifyClientOfAddedSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HMAccessorySettingGroup internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__HMAccessorySettingGroup__notifyClientOfAddedSetting___block_invoke;
  v9[3] = &unk_1E3AB5ED8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "invokeBlock:", v9);

}

- (void)removeSetting:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_settings, "containsObject:", v5))
    {
      -[NSMutableSet removeObject:](self->_settings, "removeObject:", v5);
      objc_msgSend(v5, "setGroup:", 0);
      os_unfair_lock_unlock(&self->_lock);
      -[HMAccessorySettingGroup _notifyClientOfRemovedSetting:](self, "_notifyClientOfRemovedSetting:", v5);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    v4 = v5;
  }

}

- (void)_notifyClientOfRemovedSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HMAccessorySettingGroup internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HMAccessorySettingGroup__notifyClientOfRemovedSetting___block_invoke;
  v9[3] = &unk_1E3AB5ED8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "invokeBlock:", v9);

}

- (NSArray)groups
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_groups, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableSet containsObject:](self->_groups, "containsObject:", v5) & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[NSMutableSet addObject:](self->_groups, "addObject:", v5);
      objc_msgSend(v5, "setGroup:", self);
      os_unfair_lock_unlock(&self->_lock);
      -[HMAccessorySettingGroup _notifyClientOfAddedGroup:](self, "_notifyClientOfAddedGroup:", v5);
    }
    v4 = v5;
  }

}

- (void)_notifyClientOfAddedGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HMAccessorySettingGroup internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HMAccessorySettingGroup__notifyClientOfAddedGroup___block_invoke;
  v9[3] = &unk_1E3AB5ED8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "invokeBlock:", v9);

}

- (void)removeGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_groups, "containsObject:", v5))
    {
      -[NSMutableSet removeObject:](self->_groups, "removeObject:", v5);
      objc_msgSend(v5, "setGroup:", 0);
      os_unfair_lock_unlock(&self->_lock);
      -[HMAccessorySettingGroup _notifyClientOfRemovedGroup:](self, "_notifyClientOfRemovedGroup:", v5);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    v4 = v5;
  }

}

- (void)_notifyClientOfRemovedGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HMAccessorySettingGroup internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__HMAccessorySettingGroup__notifyClientOfRemovedGroup___block_invoke;
  v9[3] = &unk_1E3AB5ED8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "invokeBlock:", v9);

}

- (void)_settingGroup:(id)a3 didAddSetting:(id)a4
{
  void *v5;
  void *v6;

  +[HMAccessorySetting settingForInternal:](HMAccessorySetting, "settingForInternal:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[HMAccessorySettingGroup addSetting:](self, "addSetting:", v5);
    v5 = v6;
  }

}

- (void)_settingGroup:(id)a3 didRemoveSetting:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMAccessorySettingGroup settings](self, "settings", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "internal");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v5);

        if (v13)
        {
          -[HMAccessorySettingGroup removeSetting:](self, "removeSetting:", v11);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_settingGroup:(id)a3 didAddSettingGroup:(id)a4
{
  id v5;
  HMAccessorySettingGroup *v6;

  v5 = a4;
  v6 = -[HMAccessorySettingGroup initWithInternal:]([HMAccessorySettingGroup alloc], "initWithInternal:", v5);

  -[HMAccessorySettingGroup addGroup:](self, "addGroup:", v6);
}

- (void)_settingGroup:(id)a3 didRemoveSettingGroup:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMAccessorySettingGroup groups](self, "groups", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "internal");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v5);

        if (v13)
        {
          -[HMAccessorySettingGroup removeGroup:](self, "removeGroup:", v11);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (HMAccessorySettingGroup)accessorySettingGroupWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMAccessorySettingGroup groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HMAccessorySettingGroup_accessorySettingGroupWithKeyPath___block_invoke;
  v9[3] = &unk_1E3AB2F00;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessorySettingGroup *)v7;
}

- (id)accessorySettingWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMAccessorySettingGroup settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__HMAccessorySettingGroup_accessorySettingWithKeyPath___block_invoke;
  v9[3] = &unk_1E3AB2F28;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_HMAccessorySettingGroup)internal
{
  return (_HMAccessorySettingGroup *)objc_getProperty(self, a2, 80, 1);
}

- (HMAccessorySettingGroup)group
{
  return (HMAccessorySettingGroup *)objc_loadWeakRetained((id *)&self->_group);
}

- (void)setGroup:(id)a3
{
  objc_storeWeak((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

uint64_t __55__HMAccessorySettingGroup_accessorySettingWithKeyPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

uint64_t __60__HMAccessorySettingGroup_accessorySettingGroupWithKeyPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

void __55__HMAccessorySettingGroup__notifyClientOfRemovedGroup___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed group: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = CFSTR("group");
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HMAccessorySettingGroupRemovedNotification"), v9, v10);

}

void __53__HMAccessorySettingGroup__notifyClientOfAddedGroup___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added group: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = CFSTR("group");
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HMAccessorySettingGroupAddedNotification"), v9, v10);

}

void __57__HMAccessorySettingGroup__notifyClientOfRemovedSetting___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed setting: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = CFSTR("setting");
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HMAccessorySettingRemovedNotification"), v9, v10);

}

void __55__HMAccessorySettingGroup__notifyClientOfAddedSetting___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added setting: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = CFSTR("setting");
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HMAccessorySettingAddedNotification"), v9, v10);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t35 != -1)
    dispatch_once(&logCategory__hmf_once_t35, &__block_literal_global_191);
  return (id)logCategory__hmf_once_v36;
}

void __38__HMAccessorySettingGroup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v36;
  logCategory__hmf_once_v36 = v0;

}

@end
