@implementation HMSettingGroup

- (HMSettingGroup)initWithIdentifier:(id)a3 name:(id)a4 groups:(id)a5 settings:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMSettingGroup *v15;
  HMSettingGroup *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *settings;
  NSMutableDictionary *v19;
  NSMutableDictionary *groups;
  NSString *keyPath;
  uint64_t v22;
  HMSettingGroup *v23;
  _QWORD v25[4];
  HMSettingGroup *v26;
  _QWORD v27[4];
  HMSettingGroup *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)HMSettingGroup;
  v15 = -[HMSettingGroup init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    settings = v16->_settings;
    v16->_settings = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groups = v16->_groups;
    v16->_groups = v19;

    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v16->_name, a4);
    keyPath = v16->_keyPath;
    v16->_keyPath = (NSString *)CFSTR("root");

    v22 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __58__HMSettingGroup_initWithIdentifier_name_groups_settings___block_invoke;
    v27[3] = &unk_1E3AB01A8;
    v23 = v16;
    v28 = v23;
    objc_msgSend(v13, "na_each:", v27);
    v25[0] = v22;
    v25[1] = 3221225472;
    v25[2] = __58__HMSettingGroup_initWithIdentifier_name_groups_settings___block_invoke_3;
    v25[3] = &unk_1E3AB01D0;
    v26 = v23;
    objc_msgSend(v14, "na_each:", v25);

  }
  return v16;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMSettingGroup keyPath](self, "keyPath");
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
  unint64_t v3;

  -[HMSettingGroup name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)groups
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_groups, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)settings
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_settings, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *groups;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMSettingGroup keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyPath:", v7);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  groups = self->_groups;
  objc_msgSend(v11, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](groups, "setObject:forKey:", v11, v10);

  os_unfair_lock_unlock(p_lock);
}

- (void)addSetting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *settings;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMSettingGroup keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyPath:", v7);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  settings = self->_settings;
  objc_msgSend(v11, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v11, v10);

  os_unfair_lock_unlock(p_lock);
}

- (HMSettingGroup)settingGroupWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMSettingGroup groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__HMSettingGroup_settingGroupWithKeyPath___block_invoke;
  v9[3] = &unk_1E3AB01F8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMSettingGroup *)v7;
}

- (NSString)keyPath
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_keyPath;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setKeyPath:(id)a3
{
  NSString *v4;
  NSString *keyPath;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  keyPath = self->_keyPath;
  self->_keyPath = v4;

  os_unfair_lock_unlock(&self->_lock);
  -[HMSettingGroup fixNestedKeyPaths](self, "fixNestedKeyPaths");
}

- (void)fixNestedKeyPaths
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[HMSettingGroup groups](self, "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__HMSettingGroup_fixNestedKeyPaths__block_invoke;
  v7[3] = &unk_1E3AB01A8;
  v7[4] = self;
  objc_msgSend(v3, "na_each:", v7);

  -[HMSettingGroup settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __35__HMSettingGroup_fixNestedKeyPaths__block_invoke_2;
  v6[3] = &unk_1E3AB01D0;
  v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMSettingGroup keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ keyPath: %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)longDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSettingGroup _longDescriptionWithCurrentGroup:currentSettings:](self, "_longDescriptionWithCurrentGroup:currentSettings:", self, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@ settings: %@]"), objc_opt_class(), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_longDescriptionWithCurrentGroup:(id)a3 currentSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HMSettingGroup__longDescriptionWithCurrentGroup_currentSettings___block_invoke;
  v15[3] = &unk_1E3AB01D0;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "na_each:", v15);

  objc_msgSend(v7, "groups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __67__HMSettingGroup__longDescriptionWithCurrentGroup_currentSettings___block_invoke_2;
  v13[3] = &unk_1E3AB0220;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "na_each:", v13);

}

- (HMSettingGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMSettingGroup *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HM.groups"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("HM.settings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HMSettingGroup initWithIdentifier:name:groups:settings:](self, "initWithIdentifier:name:groups:settings:", v6, v5, v10, v14);
  return v15;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __67__HMSettingGroup__longDescriptionWithCurrentGroup_currentSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  if (!v5)
}

uint64_t __67__HMSettingGroup__longDescriptionWithCurrentGroup_currentSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_longDescriptionWithCurrentGroup:currentSettings:", a2, *(_QWORD *)(a1 + 40));
}

void __35__HMSettingGroup_fixNestedKeyPaths__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyPath:", v6);

  objc_msgSend(v7, "fixNestedKeyPaths");
}

void __35__HMSettingGroup_fixNestedKeyPaths__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "keyPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyPath:", v6);

}

uint64_t __42__HMSettingGroup_settingGroupWithKeyPath___block_invoke(uint64_t a1, void *a2)
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

void __58__HMSettingGroup_initWithIdentifier_name_groups_settings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (v3 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addGroup:", v3);
  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type found while decoding group", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __58__HMSettingGroup_initWithIdentifier_name_groups_settings___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (v3 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addSetting:", v3);
  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type found while decoding setting", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
