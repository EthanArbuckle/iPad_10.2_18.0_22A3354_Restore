@implementation HMDTrigger

- (HMDTrigger)initWithName:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDTrigger *v9;
  HMDTrigger *v10;
  void *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSMutableArray *actionSetUUIDs;
  uint64_t v16;
  NSMutableDictionary *actionSetMappings;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDTrigger;
    v10 = -[HMDTrigger init](&v19, sel_init);
    if (v10)
    {
      objc_msgSend(v6, "hm_truncatedNameString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      name = v10->_name;
      v10->_name = (NSString *)v12;

      objc_storeStrong((id *)&v10->_uuid, a4);
      v10->_active = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = objc_claimAutoreleasedReturnValue();
      actionSetUUIDs = v10->_actionSetUUIDs;
      v10->_actionSetUUIDs = (NSMutableArray *)v14;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = objc_claimAutoreleasedReturnValue();
      actionSetMappings = v10->_actionSetMappings;
      v10->_actionSetMappings = (NSMutableDictionary *)v16;

      v10->_lock._os_unfair_lock_opaque = 0;
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (HMDTrigger)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDTrigger *v10;
  void *v11;
  uint64_t v12;
  NSString *configuredName;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *actionSetMappings;
  uint64_t v17;
  NSDate *mostRecentFireDate;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  HMDUser *owner;
  uint64_t v25;
  HMDDevice *owningDevice;
  void *v27;
  int v28;
  HMDTriggerDeleteAfterExecutionPolicy *v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDTrigger initWithName:uuid:](self, "initWithName:uuid:", v8, v9);

  if (v10)
  {
    objc_storeWeak((id *)&v10->_home, v7);
    objc_msgSend(v6, "configuredName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hm_truncatedNameString");
    v12 = objc_claimAutoreleasedReturnValue();
    configuredName = v10->_configuredName;
    v10->_configuredName = (NSString *)v12;

    objc_msgSend(v6, "active");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_active = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    actionSetMappings = v10->_actionSetMappings;
    v10->_actionSetMappings = (NSMutableDictionary *)v15;

    objc_msgSend(v6, "mostRecentFireDate");
    v17 = objc_claimAutoreleasedReturnValue();
    mostRecentFireDate = v10->_mostRecentFireDate;
    v10->_mostRecentFireDate = (NSDate *)v17;

    objc_msgSend(v6, "owner");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v6, "owner");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userWithUUID:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      owner = v10->_owner;
      v10->_owner = (HMDUser *)v23;

    }
    objc_msgSend(v6, "owningDevice");
    v25 = objc_claimAutoreleasedReturnValue();
    owningDevice = v10->_owningDevice;
    v10->_owningDevice = (HMDDevice *)v25;

    objc_msgSend(v6, "autoDelete");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");
    if (v28)
      v29 = objc_alloc_init(HMDTriggerDeleteAfterExecutionPolicy);
    else
      v29 = 0;
    objc_storeStrong((id *)&v10->_policy, v29);
    if (v28)

    -[HMDTrigger _actionSetsUpdated:message:](v10, "_actionSetsUpdated:message:", v6, 0);
  }

  return v10;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((isInternalBuild() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[HMDTrigger name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDTrigger uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDTrigger msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDTrigger;
  -[HMDTrigger dealloc](&v4, sel_dealloc);
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[11];

  v35[9] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDTrigger name](self, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("NM"), v34);
  v35[0] = v33;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDTrigger configuredName](self, "configuredName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("CN"), v32);
  v35[1] = v31;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDTrigger uuid](self, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("UUID"), v30);
  v35[2] = v29;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDTrigger active](self, "active");
  HMFBooleanToString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("ACT"), v28);
  v35[3] = v27;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDTrigger shouldActivateOnLocalDevice](self, "shouldActivateOnLocalDevice");
  HMFBooleanToString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("AOLD"), v26);
  v35[4] = v25;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDTrigger owningDevice](self, "owningDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("DE"), v9);
  v35[5] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDTrigger owner](self, "owner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithName:value:options:formatter:", CFSTR("USR"), v13, 2, v14);
  v35[6] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDTrigger actionSets](self, "actionSets");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("AS"), v17);
  v35[7] = v18;
  v19 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDTrigger policy](self, "policy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("PO"), v20);
  v35[8] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 9);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  id obj;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0CB3940];
  -[HMDTrigger name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger configuredName](self, "configuredName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger active](self, "active");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger shouldActivateOnLocalDevice](self, "shouldActivateOnLocalDevice");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger mostRecentFireDate](self, "mostRecentFireDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger policy](self, "policy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("name: %@, configuredName: %@, uuid: %@, enabled: %@, activeOnLocalDevice: %@, lastFireDate: %@, Policy: %@"), v3, v4, v6, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = v34;
  v33 = (void *)v11;
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D27F80]);
  -[HMDTrigger actionSets](self, "actionSets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0C99DE8];
    -[HMDTrigger actionSets](self, "actionSets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[HMDTrigger actionSets](self, "actionSets");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      v20 = *MEMORY[0x1E0CB8230];
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v22, "type");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", v20);

          if (v24)
          {
            objc_msgSend(v22, "dumpState");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v25);
          }
          else
          {
            v26 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v22, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "type");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "uuid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "UUIDString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "actions");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringWithFormat:", CFSTR("name: %@, type: %@, uuid: %@, numActions: %ld"), v25, v27, v29, objc_msgSend(v30, "count"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v31);

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v18);
    }

    v12 = v34;
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D27E58]);

  }
  return v12;
}

- (unint64_t)triggerType
{
  return 0;
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
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
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
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setActionSetForKey:(id)a3 value:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9 && v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDTrigger actionSetMappings](self, "actionSetMappings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v9);

    os_unfair_lock_unlock(p_lock);
  }

}

- (id)actionSetForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDTrigger actionSetMappings](self, "actionSetMappings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)removeActionSetForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDTrigger actionSetMappings](self, "actionSetMappings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    os_unfair_lock_unlock(p_lock);
    v4 = v7;
  }

}

- (void)removeAllActionSets
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDTrigger actionSetMappings](self, "actionSetMappings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
}

- (id)actionSetMapKeys
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDTrigger actionSetMappings](self, "actionSetMappings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSArray)actionSets
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDTrigger actionSetMappings](self, "actionSetMappings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (BOOL)requiresDataVersion4
{
  return 0;
}

- (BOOL)compatible:(id)a3 user:(id)a4
{
  return 0;
}

- (void)setEnabled:(BOOL)a3 message:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v6 = a4;
  -[HMDTrigger emptyModelObject](self, "emptyModelObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", v10);

  -[HMDTrigger home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backingStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transaction:options:", CFSTR("setEnabled"), v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "add:withMessage:", v9, v6);
  objc_msgSend(v14, "run");

}

- (BOOL)hasNoActions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDTrigger actionSets](self, "actionSets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "actions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)_checkForNoActions
{
  -[HMDTrigger _activateWithCompletion:](self, "_activateWithCompletion:", 0);
}

- (void)_forceEvaluate
{
  void *v3;
  HMDTrigger *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[HMDTrigger active](self, "active"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Trigger is active. Hence force evaluating", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDTrigger _activateWithCompletion:](v4, "_activateWithCompletion:", 0);
  }
}

- (void)removeActionSet:(id)a3 postUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  HMDTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDTrigger *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDTrigger home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isOwnerUser");

  if ((v8 & 1) != 0)
  {
    -[HMDTrigger actionSets](self, "actionSets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v6);

    if (v10)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v14;
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Action set %@ has been removed from home, cleaning the trigger", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v15 = (void *)MEMORY[0x1E0D285F8];
      v26[0] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v6, "uuid", CFSTR("kTriggerAddActionSetKey"), CFSTR("kTriggerActionSetUUIDKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v17;
      v25[2] = CFSTR("kTriggerActionSetTypeKey");
      objc_msgSend(v6, "type");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "messageWithName:messagePayload:", CFSTR("kUpdateActionSetTriggerRequestKey"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setRemote:", 1);
      -[HMDTrigger _updateActionSetRequest:postUpdate:](v12, "_updateActionSetRequest:postUpdate:", v20, v4);

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Not the owner of this home, cannot clean up the action set reference", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)reEvaluate:(unint64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  HMDTrigger *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[HMDTrigger isConfigured](self, "isConfigured"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      v11 = "%{public}@Cannot re-evaluate trigger, work queue has not been configured yet";
LABEL_10:
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v12, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v7);
    return;
  }
  -[HMDTrigger home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOwnerUser");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      v11 = "%{public}@Cannot re-evaluate trigger, not a owner user";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    -[HMDTrigger _forceEvaluate](self, "_forceEvaluate");
  }
  else if (!a3)
  {
    -[HMDTrigger _checkForNoActions](self, "_checkForNoActions");
  }
}

- (void)triggerFired
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HMDTrigger emptyModelObject](self, "emptyModelObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMostRecentFireDate:", v6);

  -[HMDTrigger home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultLocalOptions](HMDBackingStoreTransactionOptions, "defaultLocalOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transaction:options:", CFSTR("kTriggerFiredNotificationKey"), v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "add:withMessage:", v5, 0);
  objc_msgSend(v10, "run");

}

- (void)_recentFireDateUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[HMDTrigger setMostRecentFireDate:](self, "setMostRecentFireDate:");
    v9 = CFSTR("kTriggerInfo");
    v7 = CFSTR("kTriggerLastFireDateKey");
    -[HMDTrigger mostRecentFireDate](self, "mostRecentFireDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDTrigger sendTriggerFiredNotification:](self, "sendTriggerFiredNotification:", v6);
  }
}

- (void)sendTriggerFiredNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (-[HMDTrigger _isTriggerFiredNotificationEntitled](self, "_isTriggerFiredNotificationEntitled"))
    objc_msgSend(MEMORY[0x1E0D285D0], "entitledMessageWithName:messagePayload:", CFSTR("kTriggerFiredNotificationKey"), v4);
  else
    objc_msgSend(MEMORY[0x1E0D285D0], "messageWithName:messagePayload:", CFSTR("kTriggerFiredNotificationKey"), v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDTrigger msgDispatcher](self, "msgDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:target:", v7, v6);

}

- (BOOL)_isTriggerFiredNotificationEntitled
{
  return 0;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDTrigger actionSets](self, "actionSets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isAssociatedWithAccessory:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)configure:(id)a3 messageDispatcher:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[HMDTrigger home](self, "home");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v15)
  {
    -[HMDTrigger setHome:](self, "setHome:", v15);
    -[HMDTrigger owner](self, "owner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userWithUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger setOwner:](self, "setOwner:", v13);

  }
  -[HMDTrigger setMsgDispatcher:](self, "setMsgDispatcher:", v8);
  -[HMDTrigger setWorkQueue:](self, "setWorkQueue:", v9);

  -[HMDTrigger _registerForMessages](self, "_registerForMessages");
  objc_msgSend(v15, "residentDeviceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addDataSource:", self);

}

- (void)invalidate
{
  void *v3;
  HMDTrigger *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating trigger", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDTrigger actionSets](v4, "actionSets", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[HMDTrigger removeActionSet:postUpdate:](v4, "removeActionSet:postUpdate:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), 0);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[HMDTrigger removeAllActionSets](v4, "removeAllActionSets");
  -[HMDTrigger actionSetUUIDs](v4, "actionSetUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[HMDTrigger setMsgDispatcher:](v4, "setMsgDispatcher:", 0);
}

- (BOOL)isOwnedByThisDevice
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HMDTrigger owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isCurrentUser"))
  {
    -[HMDTrigger owningDevice](self, "owningDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HMDTrigger owningDevice](self, "owningDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isCurrentDevice");

    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldActivateOnLocalDevice
{
  return !-[HMDTrigger hasNoActions](self, "hasNoActions");
}

- (BOOL)isConfigured
{
  void *v2;
  BOOL v3;

  -[HMDTrigger workQueue](self, "workQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDTrigger *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDTrigger isConfigured](self, "isConfigured"))
  {
    -[HMDTrigger workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__HMDTrigger_activateWithCompletion___block_invoke;
    v10[3] = &unk_1E89C1D68;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Work queue is not configured, cannot activate", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_activateWithCompletion:(id)a3
{
  void *v3;
  void (**v4)(id, void *);

  v4 = (void (**)(id, void *))_Block_copy(a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v3);

  }
}

- (void)activateAfterResidentChangeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDTrigger *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Re-evaluating trigger after resident change", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDTrigger activateWithCompletion:](v6, "activateWithCompletion:", v4);

}

- (BOOL)modelContainsTriggerFired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "setProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v3, "setProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", CFSTR("mostRecentFireDate"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)markChangedForMessage:(id)a3
{
  -[HMDTrigger markChangedForMessage:triggerModel:](self, "markChangedForMessage:triggerModel:", a3, 0);
}

- (void)markChangedForMessage:(id)a3 triggerModel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  HMDTrigger *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDTrigger home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transactionResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isOwnerUser"))
  {
    objc_msgSend(v9, "markChanged");
  }
  else if (objc_msgSend(v8, "isAdminUser"))
  {
    objc_msgSend(v9, "markLocalChanged");
  }
  v10 = -[HMDTrigger modelContainsTriggerFired:](self, "modelContainsTriggerFired:", v7);
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Not re-activating the trigger after applying the trigger model since it only contains mostRecentFireDate", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Activating the trigger after applying the trigger model", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDTrigger activateWithCompletion:](v12, "activateWithCompletion:", 0);
  }

}

- (void)_activate:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
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
  _BYTE v19[128];
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[HMDTrigger actionSets](self, "actionSets", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "actions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v10 += objc_msgSend(v13, "count");

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);

      if (v10)
        goto LABEL_10;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 25, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v14);

    goto LABEL_14;
  }
LABEL_10:
  if (v6)
    v6[2](v6, 0);
LABEL_14:

}

- (void)_handleRenameRequest:(id)a3
{
  void *v4;
  void *v5;

  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 8, a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HMDTrigger _renameRequest:](self, "_renameRequest:", v4);
    v4 = v5;
  }

}

- (void)_renameRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  HMDTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  HMDTrigger *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kTriggerName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "length"))
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 20;
LABEL_8:
    objc_msgSend(v12, "hmErrorWithCode:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);
    goto LABEL_9;
  }
  v7 = HMMaxLengthForNaming();
  if (objc_msgSend(v6, "length") > v7)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 46;
    goto LABEL_8;
  }
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CB9E50]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTrigger name](v17, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTrigger configuredName](v17, "configuredName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      v38 = 2112;
      v39 = v6;
      v40 = 2112;
      v41 = v21;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Rename request received : [%@, %@] [%@, %@]", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v16);
    v33 = 0;
    -[HMDTrigger canRenameTriggerWithNewName:configuredName:error:](v17, "canRenameTriggerWithNewName:configuredName:error:", v6, v14, &v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v33;
    if (v23 || !v22)
    {
      objc_msgSend(v4, "respondWithError:", v23);
    }
    else
    {
      -[HMDTrigger emptyModelObject](v17, "emptyModelObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
      v26 = v25;

      objc_msgSend(v26, "setName:", v22);
      objc_msgSend(v26, "setConfiguredName:", v14);
      objc_msgSend(v15, "backingStore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "transaction:options:", v28, v29);
      v32 = v14;
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "add:withMessage:", v26, v4);
      objc_msgSend(v30, "run");

      v14 = v32;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v31);

  }
LABEL_9:

}

- (id)canRenameTriggerWithNewName:(id)a3 configuredName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDTrigger *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  HMDTrigger *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  HMDTrigger *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDTrigger *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HMDTrigger home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nameValidator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trimNotAllowedCharactersFromName:error:", v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a5)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *a5;
      *(_DWORD *)buf = 138543618;
      v51 = v17;
      v52 = 2112;
      v53 = v18;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Invalid characters found in trigger name. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v19 = 0;
    goto LABEL_26;
  }
  v20 = objc_msgSend(v13, "length");
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v20)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v37;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Name cannot be empty.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v36 = 20;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v25;
    v52 = 2112;
    v53 = v13;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@New Trigger name after trimming invalid characters : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  -[HMDTrigger name](v22, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", v13);

  if (v27)
  {
    -[HMDTrigger configuredName](v22, "configuredName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", v9);

    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = v22;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v29)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v34;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot rename the trigger as new trigger name & configured names are same.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = 48;
LABEL_16:
      objc_msgSend(v35, "hmErrorWithCode:", v36);
      v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTrigger name](v31, "name");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDTrigger configuredName](v31, "configuredName");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v51 = v45;
      v52 = 2112;
      v53 = v46;
      v54 = 2112;
      v55 = v13;
      v56 = 2112;
      v57 = v47;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Allowing rename request as current name : %@ & strippedName are same : %@ but configuredName [%@] is different", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v30);
    v19 = v13;
  }
  else
  {
    -[HMDTrigger name](v22, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replaceName:withNewName:", v38, v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      v41 = v22;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDTrigger name](v41, "name");
        v49 = v40;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v51 = v43;
        v52 = 2112;
        v53 = v44;
        v54 = 2112;
        v55 = v13;
        v56 = 2112;
        v57 = v39;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Cannot rename the trigger from %@ to %@ due to %@", buf, 0x2Au);

        v40 = v49;
      }

      objc_autoreleasePoolPop(v40);
      v19 = 0;
      *a5 = objc_retainAutorelease(v39);
    }
    else
    {
      v19 = v13;
    }

  }
LABEL_26:

  return v19;
}

- (void)_handleAddActionSetRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "uuidForKey:", CFSTR("kTriggerActionSetUUIDKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDTrigger emptyModelObject](self, "emptyModelObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v7, "setCurrentActionSets:", v11);

    -[HMDTrigger home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backingStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", v14, v15);
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:withMessage:", v7, v18);
    objc_msgSend(v16, "run");
  }
  else
  {
    objc_msgSend(v18, "responseHandler");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v16)[2](v16, v17, 0);

  }
}

- (void)_handleAddTriggerOwnedActionSetRequest:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  HMDActionSetModel *v7;
  void *v8;
  HMDActionSetModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDTrigger *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kNewObjectUUIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDTrigger home](self, "home");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = [HMDActionSetModel alloc];
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", 1, v5, v8);

    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDActionSetModel setName:](v9, "setName:", v11);

    -[HMDActionSetModel setType:](v9, "setType:", *MEMORY[0x1E0CB8230]);
    -[HMDTrigger emptyModelObject](self, "emptyModelObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

    -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v14, "setCurrentActionSets:", v18);

    objc_msgSend(v6, "backingStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transaction:options:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "add:withMessage:", v9, 0);
    objc_msgSend(v22, "add:withMessage:", v14, v4);

    objc_msgSend(v22, "run");
    goto LABEL_10;
  }
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v26;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ActionSetUUID not set.", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  objc_msgSend(v4, "responseHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v4, "responseHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v9 = (HMDActionSetModel *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, HMDActionSetModel *, _QWORD))v6)[2](v6, v9, 0);
LABEL_10:

  }
}

- (void)_handleRemoveActionSetRequest:(id)a3 postUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  void *v21;
  void *v22;
  HMDTrigger *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "uuidForKey:", CFSTR("kTriggerActionSetUUIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v4)
    {
      -[HMDTrigger emptyModelObject](self, "emptyModelObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", v12);

      -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v10, "setCurrentActionSets:", v14);

      -[HMDTrigger home](self, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "backingStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "transaction:options:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "add:withMessage:", v10, v6);
      objc_msgSend(v19, "run");

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v25;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Remove of trigger action set, not posting event trigger update model as requested", (uint8_t *)&v26, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
    }
  }
  else
  {
    objc_msgSend(v6, "responseHandler");
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v20)[2](v20, v21, 0);

  }
}

- (void)_handleRemoveTriggerOwnedActionSetRequest:(id)a3 postUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDActionSetModel *v13;
  void *v14;
  HMDActionSetModel *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDTrigger *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "uuidForKey:", CFSTR("kTriggerActionSetUUIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDTrigger home](self, "home");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backingStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transaction:options:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [HMDActionSetModel alloc];
    objc_msgSend(v8, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v13, "initWithObjectChangeType:uuid:parentUUID:", 3, v7, v14);

    v16 = objc_msgSend(v12, "add:withMessage:", v15, 0);
    if (v4)
    {
      -[HMDTrigger emptyModelObject](self, "emptyModelObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObject:", v21);

      -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      objc_msgSend(v19, "setCurrentActionSets:", v23);

      objc_msgSend(v12, "add:withMessage:", v19, v6);
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0](v16);
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v27;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Remove of trigger owned action set, not posting event trigger update model as requested", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
    }
    objc_msgSend(v12, "run");

  }
  else
  {
    objc_msgSend(v6, "responseHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v12, 0);
  }

}

- (void)_handleUpdateActionSetRequest:(id)a3
{
  void *v4;
  void *v5;

  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 9, a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HMDTrigger _updateActionSetRequest:postUpdate:](self, "_updateActionSetRequest:postUpdate:", v4, 1);
    v4 = v5;
  }

}

- (void)_updateActionSetRequest:(id)a3 postUpdate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  int v10;
  int v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  objc_msgSend(v15, "numberForKey:", CFSTR("kTriggerAddActionSetKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDTrigger home](self, "home");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v15, "stringForKey:", CFSTR("kTriggerActionSetTypeKey"));
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8230]);
      v11 = objc_msgSend(v6, "BOOLValue");
      if (v10)
      {
        if ((objc_msgSend(v15, "isEntitledForSPIAccess") & 1) != 0 || (objc_msgSend(v15, "isRemote") & 1) != 0)
        {
          if (v11)
            -[HMDTrigger _handleAddTriggerOwnedActionSetRequest:](self, "_handleAddTriggerOwnedActionSetRequest:", v15);
          else
            -[HMDTrigger _handleRemoveTriggerOwnedActionSetRequest:postUpdate:](self, "_handleRemoveTriggerOwnedActionSetRequest:postUpdate:", v15, v4);
        }
        else
        {
          objc_msgSend(v15, "responseHandler");
          v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v14, 0);

        }
      }
      else if (v11)
      {
        -[HMDTrigger _handleAddActionSetRequest:](self, "_handleAddActionSetRequest:", v15);
      }
      else
      {
        -[HMDTrigger _handleRemoveActionSetRequest:postUpdate:](self, "_handleRemoveActionSetRequest:postUpdate:", v15, v4);
      }
    }
    else
    {
      objc_msgSend(v15, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v12, 0);

      v8 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 20, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "responseHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v8, 0);
  }

}

- (void)_actionSetsUpdated:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDTrigger *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDTrigger *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  HMDTrigger *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDTrigger *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDTrigger *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  HMDTrigger *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HMDTrigger *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  HMDTrigger *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id obj;
  char v76;
  id v77;
  id v78;
  uint64_t v79;
  HMDTrigger *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  _QWORD v91[4];
  _BYTE v92[128];
  _QWORD v93[4];
  _QWORD v94[4];
  uint8_t v95[128];
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v81 = a4;
  v7 = (void *)MEMORY[0x1E0C99E20];
  v72 = v6;
  objc_msgSend(v6, "currentActionSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E20];
  -[HMDTrigger actionSetMapKeys](self, "actionSetMapKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v73 = (void *)v12;
  v74 = v9;
  v13 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v9, "minusSet:", v12));
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v97 = v16;
    v98 = 2112;
    v99 = v9;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@addedActionSets: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v72, "currentActionSets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v73;
  objc_msgSend(v73, "minusSet:", v19);

  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = v14;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v97 = v24;
    v98 = 2112;
    v99 = v73;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@removedActionSets: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  v80 = v22;
  if (objc_msgSend(v74, "count"))
  {
    -[HMDTrigger home](v22, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v26 = v74;
    v79 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    if (v79)
    {
      v76 = 0;
      v77 = *(id *)v87;
      obj = v26;
      do
      {
        v27 = 0;
        do
        {
          if (*(id *)v87 != v77)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v27);
          v29 = (void *)MEMORY[0x1D17BA0A0]();
          v30 = v22;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v97 = v32;
            v98 = 2112;
            v99 = v28;
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Action set %@ has been added", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v28);
          objc_msgSend(v25, "actionSetWithUUID:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34
            || (objc_msgSend(v25, "triggerOwnedActionSetWithUUID:", v33),
                (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            if ((objc_msgSend(v34, "containsShortcutActions") & 1) != 0
              || objc_msgSend(v34, "containsMediaPlaybackActions"))
            {
              v76 = 1;
            }
            -[HMDTrigger setActionSetForKey:value:](v30, "setActionSetForKey:value:", v28, v34);
            -[HMDTrigger actionSetUUIDs](v30, "actionSetUUIDs");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "containsObject:", v28);

            if ((v36 & 1) == 0)
            {
              -[HMDTrigger actionSetUUIDs](v30, "actionSetUUIDs");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v28);

            }
            v94[0] = v28;
            v93[0] = CFSTR("kTriggerActionSetUUIDKey");
            v93[1] = CFSTR("kActionSetName");
            objc_msgSend(v34, "name");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v94[1] = v38;
            v93[2] = CFSTR("kTriggerActionSetTypeKey");
            objc_msgSend(v34, "type");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v93[3] = CFSTR("kTriggerAddActionSetKey");
            v94[2] = v39;
            v94[3] = MEMORY[0x1E0C9AAB0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 4);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v41 = (void *)MEMORY[0x1D17BA0A0]();
            v42 = v30;
            HMFGetOSLogHandle();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v97 = v44;
              _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, "%{public}@Responding to clients that actionSet has been added to the trigger.", buf, 0xCu);

              v22 = v80;
            }

            objc_autoreleasePoolPop(v41);
            objc_msgSend(v81, "respondWithPayload:", v40);

          }
          else
          {
            v45 = (void *)MEMORY[0x1D17BA0A0]();
            v46 = v30;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v97 = v48;
              v98 = 2112;
              v99 = v28;
              _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Action set %@ could not be found", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v45);
          }

          ++v27;
        }
        while (v79 != v27);
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
        v79 = v49;
      }
      while (v49);

      if ((v76 & 1) != 0)
        -[HMDTrigger confirmResident](v30, "confirmResident");
    }
    else
    {

    }
    v20 = v73;
  }
  if (objc_msgSend(v20, "count"))
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v78 = v20;
    v50 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v83 != v52)
            objc_enumerationMutation(v78);
          v54 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          v55 = (void *)MEMORY[0x1D17BA0A0]();
          v56 = v22;
          HMFGetOSLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v97 = v58;
            v98 = 2112;
            v99 = v54;
            _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_INFO, "%{public}@Action set %@ has been deleted", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v55);
          -[HMDTrigger actionSetForKey:](v56, "actionSetForKey:", v54);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
          {
            -[HMDTrigger removeActionSetForKey:](v56, "removeActionSetForKey:", v54);
            -[HMDTrigger actionSetUUIDs](v56, "actionSetUUIDs");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "removeObject:", v54);

            v91[0] = v54;
            v90[0] = CFSTR("kTriggerActionSetUUIDKey");
            v90[1] = CFSTR("kActionSetName");
            objc_msgSend(v59, "name");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v91[1] = v61;
            v90[2] = CFSTR("kTriggerActionSetTypeKey");
            objc_msgSend(v59, "type");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v90[3] = CFSTR("kTriggerAddActionSetKey");
            v91[2] = v62;
            v91[3] = MEMORY[0x1E0C9AAA0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 4);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            v64 = (void *)MEMORY[0x1D17BA0A0]();
            v65 = v56;
            HMFGetOSLogHandle();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v97 = v67;
              _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_INFO, "%{public}@Notifying clients that actionSet has been removed from the trigger.", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v64);
            objc_msgSend(v81, "respondWithPayload:", v63);

            v22 = v80;
          }
          else
          {
            v68 = (void *)MEMORY[0x1D17BA0A0]();
            v69 = v56;
            HMFGetOSLogHandle();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v97 = v71;
              v98 = 2112;
              v99 = v54;
              _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_INFO, "%{public}@Action set %@ could not be found", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v68);
          }

        }
        v51 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      }
      while (v51);
    }

    v20 = v73;
  }

}

- (void)_handleActivateTriggerRequest:(id)a3
{
  void *v4;
  void *v5;

  -[HMDTrigger updateEventTriggerMessage:message:relay:](self, "updateEventTriggerMessage:message:relay:", 10, a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HMDTrigger _activateTriggerRequest:](self, "_activateTriggerRequest:", v4);
    v4 = v5;
  }

}

- (void)_activateTriggerRequest:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a3;
  -[HMDTrigger home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v10, "numberForKey:", CFSTR("kTriggerActivate"));
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      -[HMDTrigger setEnabled:message:](self, "setEnabled:message:", objc_msgSend(v5, "BOOLValue"), v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 20, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v8, 0);

      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(v10, "responseHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v7, 0);

  }
}

- (void)_handleUpdateTriggerPolicyRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDTrigger *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDTrigger *v22;
  NSObject *v23;
  void *v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDTrigger home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "dictionaryForKey:", *MEMORY[0x1E0CB9E70]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v7 = objc_msgSend(v6, "hmf_BOOLForKey:isPresent:", *MEMORY[0x1E0CB9E60], &v25);
    if (v25)
    {
      v8 = v7;
      -[HMDTrigger emptyModelObject](self, "emptyModelObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAutoDelete:", v12);

      objc_msgSend(v5, "backingStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transaction:options:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "add:withMessage:", v11, v4);
      objc_msgSend(v16, "run");
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0](v7);
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v24;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid payload for update policy request", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Trigger not associated to a home", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

}

- (void)_handleRemoveTriggerPolicyRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDTrigger *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDTrigger policy](self, "policy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDTrigger emptyModelObject](self, "emptyModelObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoDelete:", v9);

    -[HMDTrigger home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backingStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transaction:options:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "add:withMessage:", v8, v4);
    objc_msgSend(v14, "run");

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Policy already removed", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v4, "respondWithSuccess");
  }

}

- (void)_executeActionSetsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDTrigger actionSets](self, "actionSets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger _executeActionSets:captureCurrentState:completionHandler:](self, "_executeActionSets:captureCurrentState:completionHandler:", v5, 0, v4);

}

- (void)_executeActionSets:(id)a3 captureCurrentState:(BOOL)a4 completionHandler:(id)a5
{
  void *v7;
  HMDTrigger *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDTrigger *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  HMDTrigger *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDTrigger *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void (**v35)(id, void *, _QWORD);
  void *v36;
  id obj;
  _BOOL4 v38;
  _QWORD block[4];
  void (**v40)(id, void *, _QWORD);
  _BYTE *v41;
  _QWORD *v42;
  _QWORD v43[5];
  NSObject *v44;
  void *v45;
  _BYTE *v46;
  _QWORD *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  id v53;
  uint8_t v54[128];
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v38 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v35 = (void (**)(id, void *, _QWORD))a5;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v34;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Executing action sets: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  +[HMDLostModeManager sharedManager](HMDLostModeManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isLost");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Not executing action sets: device is in lost mode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2](v35, v36, 0);
  }
  else
  {
    -[HMDTrigger msgDispatcher](v8, "msgDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (v18)
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = v8;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v29;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not executing action sets: trigger is unconfigured", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2](v35, v36, 0);
    }
    else
    {
      objc_msgSend(v34, "na_filter:", &__block_literal_global_52);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "count"))
      {
        v19 = dispatch_group_create();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v56 = __Block_byref_object_copy_;
        v57 = __Block_byref_object_dispose_;
        v58 = 0;
        v52[0] = 0;
        v52[1] = v52;
        v52[2] = 0x3032000000;
        v52[3] = __Block_byref_object_copy_;
        v52[4] = __Block_byref_object_dispose_;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v53 = (id)objc_claimAutoreleasedReturnValue();
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        obj = v36;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v49;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v49 != v21)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v22);
              dispatch_group_enter(v19);
              v43[0] = MEMORY[0x1E0C809B0];
              v43[1] = 3221225472;
              v43[2] = __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_53;
              v43[3] = &unk_1E89A20B8;
              v43[4] = v8;
              v46 = buf;
              v24 = v19;
              v47 = v52;
              v44 = v24;
              v45 = v23;
              objc_msgSend(v23, "executeWithTriggerSource:captureCurrentState:completionHandler:", v8, v38, v43);

              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          }
          while (v20);
        }

        -[HMDTrigger workQueue](v8, "workQueue");
        v25 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_3;
        block[3] = &unk_1E89B4C18;
        v40 = v35;
        v41 = buf;
        v42 = v52;
        dispatch_group_notify(v19, v25, block);

        _Block_object_dispose(v52, 8);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = v8;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v33;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Not executing action sets: all action sets have an empty list of actions", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v30);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 25);
        v19 = objc_claimAutoreleasedReturnValue();
        v35[2](v35, v19, 0);
      }

    }
  }

}

- (void)userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  objc_msgSend(v5, "hmErrorWithCode:", 22);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setRoles:", objc_msgSend(v23, "roles") | 4);
  v3 = (void *)objc_msgSend(v23, "copy");
  -[HMDTrigger home](self, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v24, 4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger msgDispatcher](self, "msgDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v29[1] = v3;
  v29[2] = v4;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", CFSTR("kRenameTriggerRequestKey"), self, v8, sel__handleRenameRequest_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v9;
  v28[1] = v3;
  v28[2] = v4;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", CFSTR("kUpdateActionSetTriggerRequestKey"), self, v11, sel__handleUpdateActionSetRequest_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v12;
  v27[1] = v3;
  v27[2] = v4;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", CFSTR("kActivateTriggerRequestKey"), self, v14, sel__handleActivateTriggerRequest_);

  v15 = *MEMORY[0x1E0CB9E90];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v26[1] = v3;
  v26[2] = v4;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", v15, self, v18, sel__handleUpdateTriggerPolicyRequest_);

  v19 = *MEMORY[0x1E0CB9E88];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  v25[1] = v3;
  v25[2] = v4;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", v19, self, v22, sel__handleRemoveTriggerPolicyRequest_);

}

- (void)_fillBaseObjectChangeModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[HMDTrigger name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[HMDTrigger configuredName](self, "configuredName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguredName:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDTrigger active](self, "active"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", v7);

  -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v4, "setCurrentActionSets:", v9);

  -[HMDTrigger mostRecentFireDate](self, "mostRecentFireDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMostRecentFireDate:", v10);

  -[HMDTrigger owner](self, "owner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOwner:", v11);

  -[HMDTrigger owningDevice](self, "owningDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOwningDevice:", v12);

  -[HMDTrigger policy](self, "policy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12 & (v13 != 0));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoDelete:", v14);

}

- (void)_handleTriggerUpdate:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  unint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDTrigger *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDTrigger *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  int v63;
  HMDTriggerDeleteAfterExecutionPolicy *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v75 = v11;
    v76 = 2112;
    v77 = v6;
    v78 = 2112;
    v79 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling base trigger update: %@, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "setProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", CFSTR("currentActionSets"));

  if (v14)
    -[HMDTrigger _actionSetsUpdated:message:](v9, "_actionSetsUpdated:message:", v6, v7);
  objc_msgSend(v6, "setProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0x1E0C99000;
  if (objc_msgSend(v15, "containsObject:", CFSTR("name")))
  {

  }
  else
  {
    objc_msgSend(v6, "setProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", CFSTR("configuredName"));

    if (!v18)
      goto LABEL_13;
  }
  -[HMDTrigger name](v9, "name");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger configuredName](v9, "configuredName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger setName:](v9, "setName:", v20);

  objc_msgSend(v6, "configuredName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger setConfiguredName:](v9, "setConfiguredName:", v21);

  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = v9;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger name](v23, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger configuredName](v23, "configuredName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v75 = v25;
    v76 = 2112;
    v77 = v69;
    v78 = 2112;
    v79 = v26;
    v80 = 2112;
    v81 = v19;
    v82 = 2112;
    v83 = v27;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Parameter configured From : [%@, %@] To: [%@, %@]", buf, 0x34u);

    v16 = 0x1E0C99000uLL;
  }

  objc_autoreleasePoolPop(v22);
  v28 = *(void **)(v16 + 3592);
  objc_msgSend(v7, "messagePayload");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryWithDictionary:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDTrigger name](v23, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("kTriggerName"));

  -[HMDTrigger configuredName](v23, "configuredName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CB9E50]);

  HMDRemoteMessagePayloadKeysForTransportMetadata();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "removeObjectsForKeys:", v33);

  v34 = (void *)MEMORY[0x1D17BA0A0]();
  v35 = v23;
  HMFGetOSLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v75 = v37;
    v76 = 2112;
    v77 = v30;
    _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@name parameter configured : payload : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v34);
  objc_msgSend(v7, "respondWithPayload:", v30);

LABEL_13:
  objc_msgSend(v6, "setProperties");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "containsObject:", CFSTR("mostRecentFireDate"));

  if (v39)
  {
    objc_msgSend(v6, "mostRecentFireDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger _recentFireDateUpdated:](v9, "_recentFireDateUpdated:", v40);

  }
  objc_msgSend(v6, "setProperties");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "containsObject:", CFSTR("owner"));

  if (v42)
  {
    -[HMDTrigger home](v9, "home");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "owner");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "uuid");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "userWithUUID:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger setOwner:](v9, "setOwner:", v46);

    objc_msgSend(v7, "respondWithPayload:", 0);
  }
  objc_msgSend(v6, "setProperties");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "containsObject:", CFSTR("owningDevice"));

  if (v48)
  {
    objc_msgSend(v6, "owningDevice");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger setOwningDevice:](v9, "setOwningDevice:", v49);

    v72[0] = CFSTR("kTriggerUUID");
    -[HMDTrigger uuid](v9, "uuid");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "UUIDString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = CFSTR("HM.device");
    v73[0] = v51;
    -[HMDTrigger owningDevice](v9, "owningDevice");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObjectForIncomingXPCMessage(v52, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v53;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "respondWithPayload:", v54);
  }
  objc_msgSend(v6, "setProperties");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "containsObject:", CFSTR("active"));

  if (v56)
  {
    objc_msgSend(v6, "active");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger setActive:](v9, "setActive:", objc_msgSend(v57, "BOOLValue"));

    v70 = CFSTR("kTriggerActivate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDTrigger active](v9, "active"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "respondWithPayload:", v59);
  }
  objc_msgSend(v6, "setProperties");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "containsObject:", CFSTR("autoDelete"));

  if (v61)
  {
    objc_msgSend(v6, "autoDelete");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "BOOLValue");

    if (v63)
    {
      v64 = objc_alloc_init(HMDTriggerDeleteAfterExecutionPolicy);
      -[HMDTrigger setPolicy:](v9, "setPolicy:", v64);

      -[HMDTrigger policy](v9, "policy");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "uuid");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HMDTrigger setPolicy:](v9, "setPolicy:", 0);
      v66 = 0;
    }
    objc_msgSend(*(id *)(v16 + 3592), "dictionaryWithCapacity:", 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      objc_msgSend(v66, "UUIDString");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E0CB9E80]);

    }
    objc_msgSend(v7, "respondWithPayload:", v67);

  }
  -[HMDTrigger markChangedForMessage:triggerModel:](v9, "markChangedForMessage:triggerModel:", v7, v6);

}

- (BOOL)shouldEncodeLastFireDate:(id)a3
{
  return 1;
}

- (void)executeCompleteWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDTrigger policy](self, "policy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Trigger is marked to be deleted after execution (finished with error: %@), removing...", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDTrigger home](v9, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeTrigger:", v9);

  }
}

- (HMDTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDTrigger *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = (HMDTrigger *)-[HMDTrigger _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDTrigger *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  HMDUser *owner;
  uint64_t v30;
  HMDDevice *owningDevice;
  void *v32;
  uint64_t v33;
  NSString *configuredName;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  HMDTriggerPolicy *policy;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  _BYTE v50[128];
  _QWORD v51[2];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  v8 = -[HMDTrigger initWithName:uuid:](self, "initWithName:uuid:", v5, v7);
  if (v8)
  {
    v42 = v7;
    v43 = v6;
    v44 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_home, v9);

    v10 = (void *)MEMORY[0x1E0C99E60];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99E60];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("triggerActionSetUUIDs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)v12;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("triggerActionSets"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v22, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "UUIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDTrigger setActionSetForKey:value:](v8, "setActionSetForKey:value:", v24, v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v19);
    }
    if (v16)
    {
      v25 = (void *)objc_msgSend(v16, "mutableCopy");
      -[HMDTrigger setActionSetUUIDs:](v8, "setActionSetUUIDs:", v25);
    }
    else
    {
      -[HMDTrigger actionSetMapKeys](v8, "actionSetMapKeys");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");
      -[HMDTrigger setActionSetUUIDs:](v8, "setActionSetUUIDs:", v26);

    }
    v7 = v42;
    v6 = v43;

    -[HMDTrigger setActive:](v8, "setActive:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("triggerActive")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerLastFireDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDTrigger setMostRecentFireDate:](v8, "setMostRecentFireDate:", v27);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.user"));
    v28 = objc_claimAutoreleasedReturnValue();
    owner = v8->_owner;
    v8->_owner = (HMDUser *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.device"));
    v30 = objc_claimAutoreleasedReturnValue();
    owningDevice = v8->_owningDevice;
    v8->_owningDevice = (HMDDevice *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB9E48]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "hm_truncatedNameString");
    v33 = objc_claimAutoreleasedReturnValue();
    configuredName = v8->_configuredName;
    v8->_configuredName = (NSString *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v49 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, *MEMORY[0x1E0CB9E68]);
    v38 = objc_claimAutoreleasedReturnValue();
    policy = v8->_policy;
    v8->_policy = (HMDTriggerPolicy *)v38;

    v5 = v44;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  -[HMDTrigger _encodeWithCoder:](self, "_encodeWithCoder:", v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDTrigger *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDTrigger home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, CFSTR("home"));
  -[HMDTrigger name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("triggerName"));

  -[HMDTrigger uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("triggerUUID"));

  -[HMDTrigger actionSets](self, "actionSets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("triggerActionSets"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDTrigger active](self, "active"), CFSTR("triggerActive"));
  -[HMDTrigger configuredName](self, "configuredName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, *MEMORY[0x1E0CB9E48]);

  LODWORD(v10) = objc_msgSend(v4, "hmd_isForXPCTransport");
  v11 = objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess");
  if (!(_DWORD)v10)
  {
    -[HMDTrigger actionSetUUIDs](self, "actionSetUUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("triggerActionSetUUIDs"));

    -[HMDTrigger owningDevice](self, "owningDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("HM.device"));

    -[HMDTrigger owner](self, "owner");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("HM.user"));

    -[HMDTrigger policy](self, "policy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v21, *MEMORY[0x1E0CB9E68]);

    goto LABEL_8;
  }
  v12 = v11;
  v13 = -[HMDTrigger shouldEncodeLastFireDate:](self, "shouldEncodeLastFireDate:", v4);
  if (!v12)
    goto LABEL_5;
  -[HMDTrigger policy](self, "policy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, *MEMORY[0x1E0CB9E68]);

  -[HMDTrigger owningDevice](self, "owningDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("HM.device"));

  -[HMDTrigger owner](self, "owner");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HMDTrigger owner](self, "owner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("HM.user"));

LABEL_5:
    if (!v13)
      goto LABEL_9;
    goto LABEL_8;
  }
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v26;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Owner user is not set in the trigger", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  if (v13)
  {
LABEL_8:
    -[HMDTrigger mostRecentFireDate](self, "mostRecentFireDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("triggerLastFireDate"));

  }
LABEL_9:

}

- (id)spiClientIdentifier
{
  return spiClientIdentifierForUUID(self->_uuid);
}

- (NSSet)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTrigger actionSets](self, "actionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v5;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)_transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return -[HMDTrigger modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", a3, 0);
}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)emptyModelObject
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)updateEventTriggerMessage:(int)a3 message:(id)a4 relay:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void (**v12)(void *, void *, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[4];
  id v19;
  id v20;
  id v21;
  int v22;
  BOOL v23;
  id location;

  v8 = a4;
  -[HMDTrigger home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HMDTrigger_updateEventTriggerMessage_message_relay___block_invoke;
  aBlock[3] = &unk_1E89A20E0;
  v10 = v8;
  v19 = v10;
  objc_copyWeak(&v21, &location);
  v11 = v9;
  v20 = v11;
  v22 = a3;
  v23 = a5;
  v12 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v11, "isSharedAdmin"))
  {
    objc_msgSend(v11, "primaryResident");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13 || (objc_msgSend(v13, "isReachable") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 91);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v16, 0);

      v15 = 0;
      goto LABEL_7;
    }

  }
  v14 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v14, "setResponseHandler:", v12);
  objc_msgSend(v14, "setRemote:", objc_msgSend(v10, "isRemote"));
  v15 = (void *)objc_msgSend(v14, "copy");
LABEL_7:

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v15;
}

- (void)confirmResident
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (-[HMDTrigger isConfigured](self, "isConfigured"))
  {
    -[HMDTrigger home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "residentDeviceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __29__HMDTrigger_confirmResident__block_invoke;
    v5[3] = &unk_1E89C2350;
    v5[4] = self;
    objc_msgSend(v4, "confirmWithCompletionHandler:", v5);

  }
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDTrigger actionSets](self, "actionSets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsShortcutActions"))
          v9 &= objc_msgSend(v4, "supportsShortcutActions");
        if (objc_msgSend(v11, "containsMediaPlaybackActions"))
          v9 &= objc_msgSend(v4, "supportsMediaActions");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9 & 1;
}

- (void)_addActionSet:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDTrigger setActionSetForKey:value:](self, "setActionSetForKey:value:", v6, v4);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (HMDUser)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong((id *)&self->_owner, a3);
}

- (HMDDevice)owningDevice
{
  return self->_owningDevice;
}

- (void)setOwningDevice:(id)a3
{
  objc_storeStrong((id *)&self->_owningDevice, a3);
}

- (HMDTriggerPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (NSMutableDictionary)actionSetMappings
{
  return self->_actionSetMappings;
}

- (void)setActionSetMappings:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetMappings, a3);
}

- (NSMutableArray)actionSetUUIDs
{
  return self->_actionSetUUIDs;
}

- (void)setActionSetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetUUIDs, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)setTriggerType:(unint64_t)a3
{
  self->_triggerType = a3;
}

- (NSDate)mostRecentFireDate
{
  return self->_mostRecentFireDate;
}

- (void)setMostRecentFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentFireDate, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_actionSetUUIDs, 0);
  objc_storeStrong((id *)&self->_actionSetMappings, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_owningDevice, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __29__HMDTrigger_confirmResident__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Failed to confirm primary resident with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Successfully confirmed primary resident";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __54__HMDTrigger_updateEventTriggerMessage_message_relay___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  HomeKitEventTriggerUpdateLogEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = objc_alloc_init(HomeKitEventTriggerUpdateLogEvent);
    objc_msgSend(*(id *)(a1 + 32), "remoteSourceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HomeKitEventTriggerUpdateLogEvent analyticsData](v7, "analyticsData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 3;
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "isOwnerUser"))
    {
      -[HomeKitEventTriggerUpdateLogEvent analyticsData](v7, "analyticsData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 1;
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "isAdminUser"))
        goto LABEL_11;
      -[HomeKitEventTriggerUpdateLogEvent analyticsData](v7, "analyticsData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 2;
    }
    objc_msgSend(v9, "setRequestOrigin:", v11);

LABEL_11:
    v13 = *(unsigned int *)(a1 + 56);
    -[HomeKitEventTriggerUpdateLogEvent analyticsData](v7, "analyticsData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUpdateType:", v13);

    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "submitLogEvent:", v7);

    if (!v21 && *(_BYTE *)(a1 + 60) && objc_msgSend(*(id *)(a1 + 40), "isSharedAdmin"))
    {
      v18 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      objc_msgSend(v18, "setResponseHandler:", 0);
      objc_msgSend(*(id *)(a1 + 40), "administratorHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "operationForMessage:error:", v18, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v19, "addOperation:", v20);

    }
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id))v17)[2](v17, v21, v5);

    }
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v7 = (HomeKitEventTriggerUpdateLogEvent *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(HomeKitEventTriggerUpdateLogEvent *, id, id))&v7->super._endTime)(v7, v21, v5);
LABEL_14:

  }
}

void __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_2;
  v14[3] = &unk_1E89B63F0;
  v8 = *(_QWORD *)(a1 + 56);
  v15 = v5;
  v19 = v8;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 48);
  v16 = v9;
  v17 = v11;
  v20 = v10;
  v18 = v6;
  v12 = v6;
  v13 = v5;
  dispatch_async(v7, v14);

}

uint64_t __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

}

BOOL __71__HMDTrigger__executeActionSets_captureCurrentState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __37__HMDTrigger_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_909 != -1)
    dispatch_once(&logCategory__hmf_once_t0_909, &__block_literal_global_910);
  return (id)logCategory__hmf_once_v1_911;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

void __25__HMDTrigger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_911;
  logCategory__hmf_once_v1_911 = v0;

}

- (NSString)contextID
{
  void *v2;
  void *v3;

  -[HMDTrigger uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)actionContext
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("itemType");
  v15[1] = CFSTR("identifier");
  v16[0] = CFSTR("TRIGGER");
  v16[1] = CFSTR("trigger_execute");
  v15[2] = CFSTR("title");
  HMDLocalizedStringForKey(CFSTR("CONFIRM_EXECUTE_SECURE_TRIGGER_ACTION_YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = CFSTR("shouldDismiss");
  v3 = MEMORY[0x1E0C9AAB0];
  v16[2] = v2;
  v16[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = CFSTR("itemType");
  v13[1] = CFSTR("identifier");
  v14[0] = CFSTR("TRIGGER");
  v14[1] = CFSTR("trigger_doNotExecute");
  v13[2] = CFSTR("title");
  HMDLocalizedStringForKey(CFSTR("CONFIRM_EXECUTE_SECURE_TRIGGER_ACTION_NO"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = CFSTR("shouldDismiss");
  v14[2] = v5;
  v14[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[1] = v6;
  v11[0] = CFSTR("buttonCategory");
  v11[1] = CFSTR("bulletinActionButtonDescription");
  v12[0] = &unk_1E8B32418;
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (NSDictionary)bulletinContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  -[HMDTrigger home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("home");
  objc_msgSend(v3, "contextID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  v17[1] = CFSTR("trigger");
  -[HMDTrigger contextID](self, "contextID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  v17[2] = *MEMORY[0x1E0CB8388];
  objc_msgSend(v3, "contextSPIUniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v4;
  v17[3] = *MEMORY[0x1E0CB83A8];
  -[HMDTrigger contextSPIUniqueIdentifier](self, "contextSPIUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v6;
  v17[4] = *MEMORY[0x1E0CB83B0];
  -[HMDTrigger name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v7;
  v17[5] = CFSTR("home.uuid.internal");
  objc_msgSend(v3, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v9;
  v17[6] = CFSTR("trigger.uuid.internal");
  -[HMDTrigger uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSString)urlString
{
  void *v2;
  void *v3;

  -[HMDTrigger uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
