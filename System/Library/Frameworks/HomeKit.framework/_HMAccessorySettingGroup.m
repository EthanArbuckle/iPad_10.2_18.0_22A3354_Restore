@implementation _HMAccessorySettingGroup

- (_HMAccessorySettingGroup)init
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

- (_HMAccessorySettingGroup)initWithName:(id)a3
{
  id v5;
  _HMAccessorySettingGroup *v6;
  uint64_t v7;
  NSUUID *identifier;
  uint64_t v9;
  NSMutableSet *settings;
  uint64_t v11;
  NSMutableSet *groups;
  _HMAccessorySettingGroup *v13;
  objc_super v15;

  v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)_HMAccessorySettingGroup;
    v6 = -[_HMAccessorySettingGroup init](&v15, sel_init);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v7;

      objc_storeStrong((id *)&v6->_name, a3);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v9 = objc_claimAutoreleasedReturnValue();
      settings = v6->_settings;
      v6->_settings = (NSMutableSet *)v9;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      groups = v6->_groups;
      v6->_groups = (NSMutableSet *)v11;

    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HMAccessorySettingGroup identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _HMAccessorySettingGroup *v4;
  _HMAccessorySettingGroup *v5;
  _HMAccessorySettingGroup *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMAccessorySettingGroup *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[_HMAccessorySettingGroup identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMAccessorySettingGroup identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMAccessorySettingGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E3AB7688;
  }
  -[_HMAccessorySettingGroup identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMAccessorySettingGroup name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Identifier = %@, Name = %@>"), v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v11;
}

- (NSString)debugDescription
{
  return (NSString *)-[_HMAccessorySettingGroup descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[_HMAccessorySettingGroup descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)clientQueue
{
  void *v2;
  void *v3;

  -[_HMAccessorySettingGroup context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureWithAccessorySettings:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _HMAccessorySettingGroup *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v11;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[_HMAccessorySettingGroup setAccessorySettings:](v9, "setAccessorySettings:", v6);
  -[_HMAccessorySettingGroup setContext:](v9, "setContext:", v7);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[_HMAccessorySettingGroup settings](v9, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16++), "configureWithAccessorySettings:context:", v6, v7);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_HMAccessorySettingGroup groups](v9, "groups", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "configureWithAccessorySettings:context:", v6, v7);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

}

- (void)_unconfigureContext
{
  void *v3;
  void *v4;
  _HMContext *context;

  -[_HMAccessorySettingGroup context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  _HMAccessorySettingGroup *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring accessorySettingGroup", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[_HMAccessorySettingGroup settings](v5, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13++), "unconfigure");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v11);
    }

    -[_HMAccessorySettingGroup resetSettings](v5, "resetSettings");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[_HMAccessorySettingGroup groups](v5, "groups", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18++), "_unconfigure");
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v16);
    }

    -[_HMAccessorySettingGroup resetGroups](v5, "resetGroups");
    -[_HMAccessorySettingGroup _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
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

- (void)resetSettings
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet removeAllObjects](self->_settings, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)addSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableSet containsObject:](self->_settings, "containsObject:", v7) & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[NSMutableSet addObject:](self->_settings, "addObject:", v7);
      -[_HMAccessorySettingGroup context](self, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[_HMAccessorySettingGroup accessorySettings](self, "accessorySettings");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "configureWithAccessorySettings:context:", v6, v5);

      }
      os_unfair_lock_unlock(&self->_lock);
      -[_HMAccessorySettingGroup notifyDelegateOfAddedSetting:](self, "notifyDelegateOfAddedSetting:", v7);
    }
    v4 = v7;
  }

}

- (void)notifyDelegateOfAddedSetting:(id)a3
{
  id v4;
  void *v5;
  _HMAccessorySettingGroup *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Added setting: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[_HMAccessorySettingGroup delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_settingGroup:didAddSetting:", v6, v4);

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
      os_unfair_lock_unlock(&self->_lock);
      -[_HMAccessorySettingGroup notifyDelegateOfRemovedSetting:](self, "notifyDelegateOfRemovedSetting:", v5);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    v4 = v5;
  }

}

- (void)notifyDelegateOfRemovedSetting:(id)a3
{
  id v4;
  void *v5;
  _HMAccessorySettingGroup *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removed setting: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[_HMAccessorySettingGroup delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_settingGroup:didRemoveSetting:", v6, v4);

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

- (void)resetGroups
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet removeAllObjects](self->_groups, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)addGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableSet containsObject:](self->_groups, "containsObject:", v8) & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[NSMutableSet addObject:](self->_groups, "addObject:", v8);
      -[_HMAccessorySettingGroup context](self, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[_HMAccessorySettingGroup accessorySettings](self, "accessorySettings");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HMAccessorySettingGroup context](self, "context");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "configureWithAccessorySettings:context:", v6, v7);

      }
      os_unfair_lock_unlock(&self->_lock);
      -[_HMAccessorySettingGroup notifyDelegateOfAddedGroup:](self, "notifyDelegateOfAddedGroup:", v8);
    }
    v4 = v8;
  }

}

- (void)notifyDelegateOfAddedGroup:(id)a3
{
  id v4;
  void *v5;
  _HMAccessorySettingGroup *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Added group: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[_HMAccessorySettingGroup delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_settingGroup:didAddSettingGroup:", v6, v4);

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
      os_unfair_lock_unlock(&self->_lock);
      -[_HMAccessorySettingGroup notifyDelegateOfRemovedGroup:](self, "notifyDelegateOfRemovedGroup:", v5);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    v4 = v5;
  }

}

- (void)notifyDelegateOfRemovedGroup:(id)a3
{
  id v4;
  void *v5;
  _HMAccessorySettingGroup *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removed group: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[_HMAccessorySettingGroup delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_settingGroup:didRemoveSettingGroup:", v6, v4);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[_HMAccessorySettingGroup identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)mergeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_HMAccessorySettingGroup mergeSettings:](self, "mergeSettings:", v8);

    objc_msgSend(v7, "groups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_HMAccessorySettingGroup mergeGroups:](self, "mergeGroups:", v10);

    v12 = v11 || v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)mergeSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _HMAccessorySettingGroup *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  _HMAccessorySettingGroup *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[_HMAccessorySettingGroup settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v7;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "minusSet:", v8);
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v13;
      v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Removing settings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    v16 = v15 != 0;
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v50 != v18)
            objc_enumerationMutation(v14);
          -[_HMAccessorySettingGroup removeSetting:](v11, "removeSetting:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v17);
    }

  }
  else
  {
    v16 = 0;
  }
  v20 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v20, "minusSet:", v40);
  if (objc_msgSend(v20, "count"))
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v24;
      v58 = 2112;
      v59 = v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Adding settings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v25 = v20;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v46 != v28)
            objc_enumerationMutation(v25);
          -[_HMAccessorySettingGroup addSetting:](v22, "addSetting:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v27);
      v16 = 1;
    }

  }
  v30 = (void *)objc_msgSend(v40, "mutableCopy");
  objc_msgSend(v30, "minusSet:", v9);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
        objc_msgSend(v8, "member:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          v16 |= objc_msgSend(v36, "mergeObject:", v37);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v33);
  }

  return v16 & 1;
}

- (BOOL)mergeGroups:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _HMAccessorySettingGroup *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  _HMAccessorySettingGroup *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[_HMAccessorySettingGroup groups](self, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v7;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "minusSet:", v8);
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v13;
      v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Removing groups: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    v16 = v15 != 0;
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v50 != v18)
            objc_enumerationMutation(v14);
          -[_HMAccessorySettingGroup removeGroup:](v11, "removeGroup:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v17);
    }

  }
  else
  {
    v16 = 0;
  }
  v20 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v20, "minusSet:", v40);
  if (objc_msgSend(v20, "count"))
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v24;
      v58 = 2112;
      v59 = v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Adding groups: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v25 = v20;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v46 != v28)
            objc_enumerationMutation(v25);
          -[_HMAccessorySettingGroup addGroup:](v22, "addGroup:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v27);
      v16 = 1;
    }

  }
  v30 = (void *)objc_msgSend(v40, "mutableCopy");
  objc_msgSend(v30, "minusSet:", v9);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
        objc_msgSend(v8, "member:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          v16 |= objc_msgSend(v36, "mergeObject:", v37);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v33);
  }

  return v16 & 1;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[_HMAccessorySettingGroup messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (_HMAccessorySettingGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _HMAccessorySettingGroup *v6;
  uint64_t v7;
  NSUUID *identifier;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableSet *settings;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableSet *groups;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_HMAccessorySettingGroup initWithName:](self, "initWithName:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    +[_HMAccessorySettingGroup supportedSettingsClasses](_HMAccessorySettingGroup, "supportedSettingsClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HM.settings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      settings = v6->_settings;
      v6->_settings = (NSMutableSet *)v11;

    }
    +[_HMAccessorySettingGroup supportedGroupsClasses](_HMAccessorySettingGroup, "supportedGroupsClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("HM.groups"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      groups = v6->_groups;
      v6->_groups = (NSMutableSet *)v15;

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_HMAccessorySettingGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

  -[_HMAccessorySettingGroup name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.name"));

  -[_HMAccessorySettingGroup settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.settings"));

  -[_HMAccessorySettingGroup groups](self, "groups");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.groups"));

}

- (_HMAccessorySettingGroupDelegate)delegate
{
  return (_HMAccessorySettingGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HMAccessorySettings)accessorySettings
{
  return (HMAccessorySettings *)objc_loadWeakRetained((id *)&self->_accessorySettings);
}

- (void)setAccessorySettings:(id)a3
{
  objc_storeWeak((id *)&self->_accessorySettings, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessorySettings);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_32567 != -1)
    dispatch_once(&logCategory__hmf_once_t16_32567, &__block_literal_global_32568);
  return (id)logCategory__hmf_once_v17_32569;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)supportedSettingsClasses
{
  if (supportedSettingsClasses_onceToken != -1)
    dispatch_once(&supportedSettingsClasses_onceToken, &__block_literal_global_38);
  return (id)supportedSettingsClasses_supportedSettingsClasses;
}

+ (id)supportedGroupsClasses
{
  if (supportedGroupsClasses_onceToken != -1)
    dispatch_once(&supportedGroupsClasses_onceToken, &__block_literal_global_41);
  return (id)supportedGroupsClasses_supportedGroupsClasses;
}

@end
