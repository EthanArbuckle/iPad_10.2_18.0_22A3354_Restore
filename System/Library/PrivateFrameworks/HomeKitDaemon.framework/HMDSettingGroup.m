@implementation HMDSettingGroup

- (HMDSettingGroup)initWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HMDSettingGroup *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmbModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "hmbModelID");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_msgSend(v4, "hmbParentModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDSettingGroup initWithIdentifier:parentIdentifier:name:groups:settings:](self, "initWithIdentifier:parentIdentifier:name:groups:settings:", v5, v8, v9, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);

  return v10;
}

- (HMDSettingGroup)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 groups:(id)a6 settings:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDSettingGroup *v17;
  HMDSettingGroup *v18;
  uint64_t v19;
  NSString *name;
  uint64_t v21;
  NSString *keyPath;
  uint64_t v23;
  NSUUID *identifier;
  uint64_t v25;
  NSUUID *parentIdentifier;
  uint64_t v27;
  NSMutableSet *groupsInternal;
  uint64_t v29;
  NSMutableSet *settingsInternal;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)HMDSettingGroup;
  v17 = -[HMDSettingGroup init](&v32, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    v19 = objc_msgSend(v14, "copy");
    name = v18->_name;
    v18->_name = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    keyPath = v18->_keyPath;
    v18->_keyPath = (NSString *)v21;

    v23 = objc_msgSend(v12, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (NSUUID *)v23;

    v25 = objc_msgSend(v13, "copy");
    parentIdentifier = v18->_parentIdentifier;
    v18->_parentIdentifier = (NSUUID *)v25;

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v15);
    v27 = objc_claimAutoreleasedReturnValue();
    groupsInternal = v18->_groupsInternal;
    v18->_groupsInternal = (NSMutableSet *)v27;

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v16);
    v29 = objc_claimAutoreleasedReturnValue();
    settingsInternal = v18->_settingsInternal;
    v18->_settingsInternal = (NSMutableSet *)v29;

  }
  return v18;
}

- (NSArray)settings
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDSettingGroup settingsInternal](self, "settingsInternal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSArray)groups
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDSettingGroup groupsInternal](self, "groupsInternal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (void)addSetting:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDSettingGroup settingsInternal](self, "settingsInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  -[HMDSettingGroup keyPath](self, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setKeyPath:", v8);

  os_unfair_lock_unlock(p_lock);
}

- (void)addGroup:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDSettingGroup groupsInternal](self, "groupsInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  -[HMDSettingGroup keyPath](self, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setKeyPath:", v8);

  os_unfair_lock_unlock(p_lock);
}

- (HMDSettingGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDSettingGroup *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "hmd_isForXPCTransport") & 1) != 0)
  {
    -[HMDSettingGroup parentIdentifier](self, "parentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.S.ParentID"));

    -[HMDSettingGroup identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x24BDD4E08]);

    -[HMDSettingGroup name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x24BDD4E10]);

    -[HMDSettingGroup groups](self, "groups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, *MEMORY[0x24BDD4E00]);

    -[HMDSettingGroup settings](self, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, *MEMORY[0x24BDD4E18]);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Did not encode group as transport is not XPC.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSMutableSet)settingsInternal
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSettingsInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)groupsInternal
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGroupsInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsInternal, 0);
  objc_storeStrong((id *)&self->_settingsInternal, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
