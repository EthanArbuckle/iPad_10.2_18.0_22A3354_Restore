@implementation HMTrigger

- (HMTrigger)initWithName:(id)a3 configuredName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMTrigger *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *configuredName;
  uint64_t v14;
  HMMutableArray *currentActionSets;
  uint64_t v16;
  NSUUID *uuid;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmStringFromErrorCode:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v22);
  }
  v8 = v7;
  v23.receiver = self;
  v23.super_class = (Class)HMTrigger;
  v9 = -[HMTrigger init](&v23, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    name = v9->_name;
    v9->_name = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    configuredName = v9->_configuredName;
    v9->_configuredName = (NSString *)v12;

    +[HMMutableArray array](HMMutableArray, "array");
    v14 = objc_claimAutoreleasedReturnValue();
    currentActionSets = v9->_currentActionSets;
    v9->_currentActionSets = (HMMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = objc_claimAutoreleasedReturnValue();
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v16;

  }
  return v9;
}

- (HMTrigger)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMTrigger *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSUUID *uuid;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *name;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *configuredName;
  uint64_t v21;
  HMTriggerPolicy *policy;
  void *v23;
  HMActionSet *v24;
  HMActionSet *v25;
  void *v26;
  HMTrigger *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HMTrigger *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  HMMutableArray *currentActionSets;
  HMTrigger *v51;
  void *v52;
  HMTrigger *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v58;
  HMTrigger *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  id v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)HMTrigger;
  v8 = -[HMTrigger init](&v73, sel_init);
  if (!v8)
    goto LABEL_32;
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kTriggerUUID"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = v8;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v75 = v29;
      v76 = 2112;
      v77 = v30;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing uuid", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    goto LABEL_40;
  }
  v10 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  uuid = v8->_uuid;
  v8->_uuid = (NSUUID *)v11;

  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kTriggerName"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v31 = (void *)MEMORY[0x1A1AC1AAC]();
    v32 = v8;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v75 = v34;
      v76 = 2112;
      v77 = v35;
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing name", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    goto LABEL_39;
  }
  v14 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  name = v8->_name;
  v8->_name = (NSString *)v15;

  v17 = (void *)MEMORY[0x1E0D28630];
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("HMT.triggerConfiguredNameKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hmf_cachedInstanceForString:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  configuredName = v8->_configuredName;
  v8->_configuredName = (NSString *)v19;

  v8->_enabled = objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kTriggerActivate"));
  if (objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("HMT.deleteAfterExecutionPolicyKey")))
  {
    +[HMTriggerDeleteAfterExecutionPolicy deleteAfterExecutionPolicy](HMTriggerDeleteAfterExecutionPolicy, "deleteAfterExecutionPolicy");
    v21 = objc_claimAutoreleasedReturnValue();
    policy = v8->_policy;
    v8->_policy = (HMTriggerPolicy *)v21;

  }
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("kTriggerOwnedActionSetKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v25 = 0;
    goto LABEL_16;
  }
  v24 = -[HMActionSet initWithDictionary:home:]([HMActionSet alloc], "initWithDictionary:home:", v23, v7);
  if (!v24)
  {
LABEL_38:

LABEL_39:
LABEL_40:
    v51 = 0;
    goto LABEL_41;
  }
  v25 = v24;
  objc_msgSend(v68, "addObject:", v24);
LABEL_16:
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("kTriggerActionSetUUIDKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
  if (!v36)
    goto LABEL_31;
  v37 = v36;
  v38 = *(_QWORD *)v70;
  v65 = v10;
  v66 = v7;
  v63 = v23;
  v64 = v14;
  while (2)
  {
    for (i = 0; i != v37; ++i)
    {
      if (*(_QWORD *)v70 != v38)
        objc_enumerationMutation(obj);
      v40 = *(id *)(*((_QWORD *)&v69 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = v40;
      else
        v41 = 0;
      v42 = v41;

      if (!v42)
        goto LABEL_34;
      v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v42);
      if (!v43)
      {
        v42 = v40;
LABEL_34:
        v52 = (void *)MEMORY[0x1A1AC1AAC]();
        v53 = v8;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        v7 = v66;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v75 = v55;
          v76 = 2112;
          v77 = v56;
          v78 = 2112;
          v79 = v40;
          _os_log_impl(&dword_19B1B0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, invalid actionSet reference '%@'", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v52);
LABEL_37:

        v14 = v64;
        v10 = v65;
        v23 = v63;
        goto LABEL_38;
      }
      v44 = (void *)v43;
      -[HMActionSet uuid](v25, "uuid");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v44, "isEqual:", v45);

      if ((v46 & 1) != 0)
        goto LABEL_29;
      objc_msgSend(v66, "actionSetWithUUID:", v44);
      v47 = objc_claimAutoreleasedReturnValue();
      if (!v47)
      {
        v58 = (void *)MEMORY[0x1A1AC1AAC]();
        v59 = v8;
        HMFGetOSLogHandle();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v75 = v61;
          v76 = 2112;
          v77 = v62;
          v78 = 2112;
          v79 = v44;
          _os_log_impl(&dword_19B1B0000, v60, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, failed to resolve actionSet %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v58);

        v7 = v66;
        goto LABEL_37;
      }
      v48 = (void *)v47;
      objc_msgSend(v68, "addObject:", v47);

LABEL_29:
    }
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    v10 = v65;
    v7 = v66;
    v23 = v63;
    v14 = v64;
    if (v37)
      continue;
    break;
  }
LABEL_31:

  +[HMMutableArray arrayWithArray:](HMMutableArray, "arrayWithArray:", v68);
  v49 = objc_claimAutoreleasedReturnValue();
  currentActionSets = v8->_currentActionSets;
  v8->_currentActionSets = (HMMutableArray *)v49;

LABEL_32:
  v51 = v8;
LABEL_41:

  return v51;
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
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __CFString *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMTrigger actionSets](self, "actionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "actionSetType");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v9 == CFSTR("HMActionSetTypeTriggerOwned"))
          objc_msgSend(v8, "_unconfigure");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  -[HMTrigger setHome:](self, "setHome:", 0);
  -[HMTrigger setLastFireDate:](self, "setLastFireDate:", 0);
  -[HMTrigger currentActionSets](self, "currentActionSets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setArray:", 0);

  -[HMTrigger _unconfigureContext](self, "_unconfigureContext");
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMTrigger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  HMTrigger *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  obj = a3;
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
    *(_DWORD *)buf = 138544130;
    v29 = v11;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring trigger with context : %@, Home: %@, HMTrigger: %@", buf, 0x2Au);

  }
  v22 = v6;

  objc_autoreleasePoolPop(v8);
  -[HMTrigger setHome:](v9, "setHome:", v7);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HMTrigger currentActionSets](v9, "currentActionSets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v18, "actionSetType", obj);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("HMActionSetTypeTriggerOwned"));

        if (v20)
          objc_msgSend(v7, "adoptTriggerOwnedActionSet:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  if (v22)
  {
    objc_storeStrong((id *)&v9->_context, obj);
    -[HMTrigger _registerNotificationHandlers](v9, "_registerNotificationHandlers");
  }

}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *configuredName;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configuredName = self->_configuredName;
  if (configuredName)
    v5 = -[NSString copy](configuredName, "copy");
  else
    v5 = -[NSString copy](self->_name, "copy");
  v6 = (void *)v5;
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v6;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConfiguredName:(id)a3
{
  NSString *v4;
  NSString *configuredName;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)configuredName
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSString copy](self->_configuredName, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (BOOL)isEnabled
{
  HMTrigger *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)actionSets
{
  void *v2;
  void *v3;

  -[HMTrigger currentActionSets](self, "currentActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDate)lastFireDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lastFireDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastFireDate:(id)a3
{
  NSDate *v4;
  NSDate *lastFireDate;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDate *)objc_msgSend(v6, "copy");
  lastFireDate = self->_lastFireDate;
  self->_lastFireDate = v4;

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

- (NSUUID)uuid
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_uuid;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUuid:(id)a3
{
  NSUUID *v4;
  NSUUID *uuid;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v6);
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMHome)home
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMHome *)WeakRetained;
}

- (void)setHome:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMDevice)ownerDevice
{
  os_unfair_lock_s *p_lock;
  HMDevice *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_ownerDevice;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOwnerDevice:(id)a3
{
  HMDevice *v4;
  HMDevice *ownerDevice;

  v4 = (HMDevice *)a3;
  os_unfair_lock_lock_with_options();
  ownerDevice = self->_ownerDevice;
  self->_ownerDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMUser)owner
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  os_unfair_lock_unlock(p_lock);
  return (HMUser *)WeakRetained;
}

- (void)setOwner:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_owner, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_recomputeAssistantIdentifier
{
  NSString *v3;
  NSString *assistantIdentifier;

  hm_assistantIdentifierWithSalts(CFSTR("TR"), (uint64_t)self->_uuid, 0);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

}

- (NSString)assistantIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *assistantIdentifier;
  NSString *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    -[HMTrigger _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
    assistantIdentifier = self->_assistantIdentifier;
  }
  v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (HMTriggerPolicy)policy
{
  os_unfair_lock_s *p_lock;
  HMTriggerPolicy *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_policy;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPolicy:(id)a3
{
  HMTriggerPolicy *v4;
  HMTriggerPolicy *policy;

  v4 = (HMTriggerPolicy *)a3;
  os_unfair_lock_lock_with_options();
  policy = self->_policy;
  self->_policy = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)recomputeAssistantIdentifier
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMTrigger _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
  os_unfair_lock_unlock(p_lock);
}

- (void)_updateActionSet:(id)a3 add:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMTrigger *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HMTrigger *v39;
  NSObject *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[3];
  _QWORD v47[3];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v6 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[HMTrigger context](self, "context");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTrigger _updateActionSet:add:completionHandler:]", CFSTR("clientCompletionHandler"));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1A1AC1AAC]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v41;
      v50 = 2112;
      v51 = (const char *)v37;
      _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v37, 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }
  v11 = (void *)v10;
  if (v10)
  {
    -[HMTrigger home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HMTrigger currentActionSets](self, "currentActionSets");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v8);

      if (v6)
      {
        if (v14)
        {
          -[HMTrigger context](self, "context");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "delegateCaller");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 1);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:
          v36 = (void *)v17;
          objc_msgSend(v16, "callCompletion:error:", v9, v17);

          goto LABEL_15;
        }
      }
      else if ((v14 & 1) == 0)
      {
        -[HMTrigger context](self, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "delegateCaller");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      v46[0] = CFSTR("kTriggerAddActionSetKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v25;
      v46[1] = CFSTR("kTriggerActionSetUUIDKey");
      objc_msgSend(v8, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v27;
      v46[2] = CFSTR("kTriggerActionSetTypeKey");
      objc_msgSend(v8, "actionSetType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47[2] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1E0D285F8];
      v31 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMTrigger uuid](self, "uuid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithTarget:", v32);
      objc_msgSend(v30, "messageWithName:destination:payload:", CFSTR("kUpdateActionSetTriggerRequestKey"), v33, v29);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, self);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __52__HMTrigger__updateActionSet_add_completionHandler___block_invoke;
      v43[3] = &unk_1E3AB4AE0;
      objc_copyWeak(&v45, (id *)buf);
      v44 = v9;
      objc_msgSend(v34, "setResponseHandler:", v43);
      objc_msgSend(v11, "messageDispatcher");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sendMessage:completionHandler:", v34, 0);

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      -[HMTrigger context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "delegateCaller");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "callCompletion:error:", v9, v24);

      v12 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v21;
      v50 = 2080;
      v51 = "-[HMTrigger _updateActionSet:add:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
  }
LABEL_15:

}

- (void)addActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion
{
  HMActionSet *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMTrigger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMTrigger *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD block[5];
  HMActionSet *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = actionSet;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTrigger addActionSet:completionHandler:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = (const char *)v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v9 = (void *)v8;
  if (v8)
  {
    -[HMTrigger home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v11 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v6, v10, 1, &v28);
    v12 = v28;

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v9, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__HMTrigger_addActionSet_completionHandler___block_invoke;
      block[3] = &unk_1E3AB5C58;
      block[4] = self;
      v26 = v6;
      v27 = v7;
      dispatch_async(v13, block);

    }
    else
    {
      objc_msgSend(v9, "delegateCaller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callCompletion:error:", v7, v12);

      v12 = v18;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v17;
      v31 = 2080;
      v32 = "-[HMTrigger addActionSet:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, id))v7 + 2))(v7, v12);
  }

}

- (void)removeActionSet:(HMActionSet *)actionSet completionHandler:(void *)completion
{
  HMActionSet *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMTrigger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMTrigger *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD block[5];
  HMActionSet *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = actionSet;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTrigger removeActionSet:completionHandler:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = (const char *)v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v9 = (void *)v8;
  if (v8)
  {
    -[HMTrigger home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v11 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v6, v10, 0, &v28);
    v12 = v28;

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v9, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__HMTrigger_removeActionSet_completionHandler___block_invoke;
      block[3] = &unk_1E3AB5C58;
      block[4] = self;
      v26 = v6;
      v27 = v7;
      dispatch_async(v13, block);

    }
    else
    {
      objc_msgSend(v9, "delegateCaller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callCompletion:error:", v7, v12);

      v12 = v18;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v17;
      v31 = 2080;
      v32 = "-[HMTrigger removeActionSet:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, id))v7 + 2))(v7, v12);
  }

}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  -[HMTrigger updateName:configuredName:completionHandler:](self, "updateName:configuredName:completionHandler:", name, name, completion);
}

- (void)updateName:(id)a3 configuredName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  HMTrigger *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMTrigger context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v33 = 0;
    v12 = +[HMTrigger _validateName:configuredName:error:]((uint64_t)HMTrigger, v8, v9, &v33);
    v29 = v33;
    if ((v12 & 1) == 0)
    {
      objc_msgSend(v11, "delegateCaller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "callCompletion:error:", v10, v29);
LABEL_17:

      goto LABEL_18;
    }
    -[HMTrigger home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[HMTrigger triggerName]((char *)self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", v8) & 1) != 0)
      {
        -[HMTrigger configuredName](self, "configuredName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v9);

        if (v16)
        {
          -[HMTrigger context](self, "context");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "delegateCaller");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "callCompletion:error:", v10, 0);
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2, v29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v8, CFSTR("kTriggerName"));
      if (v9)
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, CFSTR("HMT.triggerConfiguredNameKey"));
      v24 = (void *)MEMORY[0x1E0D285F8];
      v25 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMTrigger uuid](self, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithTarget:", v26);
      objc_msgSend(v24, "messageWithName:destination:payload:", CFSTR("kRenameTriggerRequestKey"), v27, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, self);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __57__HMTrigger_updateName_configuredName_completionHandler___block_invoke;
      v30[3] = &unk_1E3AB4AE0;
      objc_copyWeak(&v32, (id *)buf);
      v31 = v10;
      objc_msgSend(v18, "setResponseHandler:", v30);
      objc_msgSend(v11, "messageDispatcher");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sendMessage:completionHandler:", v18, 0);

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }
    -[HMTrigger context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "callCompletion:error:", v10, v23);

    goto LABEL_16;
  }
  v19 = (void *)MEMORY[0x1A1AC1AAC]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v22;
    v36 = 2080;
    v37 = "-[HMTrigger updateName:configuredName:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
LABEL_18:

}

- (void)enable:(BOOL)enable completionHandler:(void *)completion
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMTrigger *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMTrigger *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = completion;
  -[HMTrigger context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTrigger enable:completionHandler:]", CFSTR("completion"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = (const char *)v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__HMTrigger_enable_completionHandler___block_invoke;
    block[3] = &unk_1E3AB15D0;
    block[4] = self;
    v23 = enable;
    v22 = v6;
    dispatch_async(v9, block);

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
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      v26 = 2080;
      v27 = "-[HMTrigger enable:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v6 + 2))(v6, v14);

  }
}

- (void)_enable:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  HMTrigger *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31;
  const __CFString *v32;
  void *v33;
  _BYTE location[12];
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v4 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMTrigger context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v4
      && (-[HMTrigger currentActionSets](self, "currentActionSets"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          !v9))
    {
      objc_msgSend(v7, "delegateCaller");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 26);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMTrigger home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v32 = CFSTR("kTriggerActivate");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0D285F8];
        v14 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMTrigger uuid](self, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);
        objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("kActivateTriggerRequestKey"), v16, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)location, self);
        v26 = MEMORY[0x1E0C809B0];
        v27 = 3221225472;
        v28 = __39__HMTrigger__enable_completionHandler___block_invoke;
        v29 = &unk_1E3AB4AE0;
        objc_copyWeak(&v31, (id *)location);
        v30 = v6;
        objc_msgSend(v17, "setResponseHandler:", &v26);
        objc_msgSend(v7, "messageDispatcher", v26, v27, v28, v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sendMessage:completionHandler:", v17, 0);

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)location);

        goto LABEL_12;
      }
      objc_msgSend(v7, "delegateCaller");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v24;
    objc_msgSend(v23, "callCompletion:error:", v6, v24);

    goto LABEL_12;
  }
  v19 = (void *)MEMORY[0x1A1AC1AAC]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = v22;
    v35 = 2080;
    v36 = "-[HMTrigger _enable:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
LABEL_12:

}

- (void)addActionSetWithCompletionHandler:(id)a3
{
  -[HMTrigger addActionSetOfType:completionHandler:](self, "addActionSetOfType:completionHandler:", CFSTR("HMActionSetTypeTriggerOwned"), a3);
}

- (void)addActionSetOfType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HMTrigger *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("You must provide a completion handler");
    goto LABEL_11;
  }
  v8 = v7;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HMActionSetTypeTriggerOwned")) & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = CFSTR("type must be HMActionSetTypeTriggerOwned");
LABEL_11:
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  -[HMTrigger context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__HMTrigger_addActionSetOfType_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v21 = v6;
    v22 = v8;
    dispatch_async(v11, block);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2080;
      v26 = "-[HMTrigger addActionSetOfType:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)_addActionSetOfType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMTrigger *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _BYTE location[12];
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMTrigger home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("HMActionSetTypeTriggerOwned")))
      {
        v32[0] = CFSTR("kTriggerAddActionSetKey");
        v32[1] = CFSTR("kTriggerActionSetTypeKey");
        v33[0] = MEMORY[0x1E0C9AAB0];
        v33[1] = CFSTR("HMActionSetTypeTriggerOwned");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D285F8];
        v12 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMTrigger uuid](self, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);
        objc_msgSend(v11, "messageWithName:destination:payload:", CFSTR("kUpdateActionSetTriggerRequestKey"), v14, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)location, self);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __51__HMTrigger__addActionSetOfType_completionHandler___block_invoke;
        v28[3] = &unk_1E3AB4B30;
        objc_copyWeak(&v31, (id *)location);
        v30 = v7;
        v16 = v8;
        v29 = v16;
        objc_msgSend(v15, "setResponseHandler:", v28);
        objc_msgSend(v16, "messageDispatcher");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sendMessage:completionHandler:", v15, 0);

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)location);

      }
      else
      {
        -[HMTrigger context](self, "context");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "delegateCaller");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "callCompletion:actionSet:error:", v7, 0, v27);

      }
    }
    else
    {
      -[HMTrigger context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "delegateCaller");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "callCompletion:actionSet:error:", v7, 0, v24);

      v9 = 0;
    }
    goto LABEL_11;
  }
  v18 = (void *)MEMORY[0x1A1AC1AAC]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = v21;
    v35 = 2080;
    v36 = "-[HMTrigger _addActionSetOfType:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);
LABEL_11:

  }
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMTrigger triggerName]((char *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kTriggerName"));

  -[HMTrigger configuredName](self, "configuredName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("HMT.triggerConfiguredNameKey"));

  -[HMTrigger uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("kNewObjectUUIDKey"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (void)updatePolicy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMTrigger *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  _BYTE location[12];
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v27 = 0;
    v9 = +[HMTrigger _validatePolicy:error:]((uint64_t)HMTrigger, v6, &v27);
    v10 = v27;
    if ((v9 & 1) != 0)
    {
      -[HMTrigger home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v30 = CFSTR("HMT.deleteAfterExecutionPolicyKey");
        v31 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("HMT.policyKey");
        v29 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0D285F8];
        v14 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMTrigger uuid](self, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);
        objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("HMTriggerUpdatePolicyKey"), v16, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)location, self);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __44__HMTrigger_updatePolicy_completionHandler___block_invoke;
        v24[3] = &unk_1E3AB4AE0;
        objc_copyWeak(&v26, (id *)location);
        v25 = v7;
        objc_msgSend(v17, "setResponseHandler:", v24);
        objc_msgSend(v8, "messageDispatcher");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sendMessage:", v17);

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)location);
      }
      else
      {
        -[HMTrigger context](self, "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "delegateCaller");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "callCompletion:error:", v7, v17);
      }

    }
    else
    {
      objc_msgSend(v8, "delegateCaller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "callCompletion:error:", v7, v10);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v22;
      v33 = 2080;
      v34 = "-[HMTrigger updatePolicy:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)removePolicy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMTrigger *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  const __CFString *v32;
  uint64_t v33;
  _BYTE location[12];
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v31 = 0;
    v9 = +[HMTrigger _validatePolicy:error:]((uint64_t)HMTrigger, v6, &v31);
    v10 = v31;
    if ((v9 & 1) != 0)
    {
      -[HMTrigger home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[HMTrigger policy](self, "policy");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
        {
          -[HMTrigger context](self, "context");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "delegateCaller");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "callCompletion:error:", v7, 0);

        }
        v32 = CFSTR("HMT.policyKey");
        v33 = MEMORY[0x1E0C9AA70];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0D285F8];
        v18 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMTrigger uuid](self, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);
        objc_msgSend(v17, "messageWithName:destination:payload:", CFSTR("HMTriggerRemovePolicyKey"), v20, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)location, self);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __44__HMTrigger_removePolicy_completionHandler___block_invoke;
        v28[3] = &unk_1E3AB4AE0;
        objc_copyWeak(&v30, (id *)location);
        v29 = v7;
        objc_msgSend(v21, "setResponseHandler:", v28);
        objc_msgSend(v8, "messageDispatcher");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sendMessage:", v21);

        objc_destroyWeak(&v30);
        objc_destroyWeak((id *)location);
      }
      else
      {
        -[HMTrigger context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "delegateCaller");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "callCompletion:error:", v7, v27);

      }
    }
    else
    {
      objc_msgSend(v8, "delegateCaller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "callCompletion:error:", v7, v10);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v26;
      v35 = 2080;
      v36 = "-[HMTrigger removePolicy:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
  }

}

- (BOOL)_updateTriggerNameFromResponse:(id)a3 responsePayload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMTrigger *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  HMTrigger *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmf_stringForKey:", CFSTR("kTriggerName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_stringForKey:", CFSTR("HMT.triggerConfiguredNameKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v26 = v13;
    v27 = 2112;
    v28 = v7;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updated Trigger Name from payload: %@ with name : [%@], configuredName: [%@]", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  -[HMTrigger setTriggerName:]((uint64_t)v11, v8);
  -[HMTrigger setConfiguredName:](v11, "setConfiguredName:", v9);
  if (v6)
  {
    -[HMTrigger context](v11, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "callCompletion:error:", v6, 0);
    v16 = 0;
  }
  else
  {
    -[HMTrigger home](v11, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();
    if ((v17 & 1) != 0)
    {
      -[HMTrigger context](v11, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "delegateCaller");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __60__HMTrigger__updateTriggerNameFromResponse_responsePayload___block_invoke;
      v21[3] = &unk_1E3AB5CD0;
      v22 = v15;
      v23 = v14;
      v24 = v11;
      objc_msgSend(v19, "invokeBlock:", v21);

    }
    v16 = v17 ^ 1;
  }

  return v16 & 1;
}

- (void)_handleTriggerFired:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "hmf_dateForKey:", CFSTR("kTriggerLastFireDateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HMTrigger setLastFireDate:](self, "setLastFireDate:", v4);
    v4 = v5;
  }

}

- (void)_handleTriggerFiredNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMTrigger context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeCompletionBlockForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dictionaryForKey:", CFSTR("kTriggerInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMTrigger _handleTriggerFired:](self, "_handleTriggerFired:", v8);
  -[HMTrigger _updateClientWithResults:withError:](self, "_updateClientWithResults:withError:", v7, 0);

}

- (BOOL)_updateActionSetFromResponse:(id)a3 responsePayload:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  BOOL v14;
  char v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMTrigger *v22;
  NSObject *v23;
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
  void *v35;
  void *v36;
  void *v37;
  HMTrigger *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  HMTrigger *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  HMTrigger *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  HMTrigger *v64;
  NSObject *v65;
  _BOOL4 v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  id v76;
  void *v77;
  int aBlock;
  void *aBlocka;
  char v80;
  void *v81;
  void *v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger home](self, "home");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_stringForKey:", CFSTR("kTriggerActionSetTypeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_numberForKey:", CFSTR("kTriggerAddActionSetKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_UUIDForKey:", CFSTR("kTriggerActionSetUUIDKey"));
  v11 = objc_claimAutoreleasedReturnValue();
  v81 = (void *)v8;
  v82 = (void *)v11;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  v14 = v12 || v11 == 0 || v9 == 0;
  v15 = !v14;
  v80 = v15;
  if (!v14)
  {
    v16 = objc_msgSend(v9, "isEqualToString:", CFSTR("HMActionSetTypeTriggerOwned"));
    if (!objc_msgSend(v10, "BOOLValue"))
    {
      -[HMTrigger currentActionSets](self, "currentActionSets");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstItemWithUUID:", v82);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = _Block_copy(v6);
      v20 = v27;
      if (v18)
      {
        -[HMTrigger currentActionSets](self, "currentActionSets");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeObject:", v18);
        v19 = 0;
        aBlock = 1;
      }
      else
      {
        if (!v27)
        {
          v18 = 0;
          v19 = 0;
          aBlock = 1;
          goto LABEL_31;
        }
        -[HMTrigger context](self, "context");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "delegateCaller");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v35 = v20;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "callCompletion:error:", v35, v36);

        v20 = v35;
        v18 = 0;
        aBlock = 0;
        v19 = 0;
      }
LABEL_30:

LABEL_31:
      v77 = v10;
      v37 = (void *)MEMORY[0x1A1AC1AAC]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v75 = v18;
        v40 = v19;
        v41 = v20;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v43 = v7;
        v44 = v9;
        v45 = v6;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v84 = v42;
        v85 = 2112;
        v86 = v46;
        _os_log_impl(&dword_19B1B0000, v39, OS_LOG_TYPE_INFO, "%{public}@Should we call completion handler: %@", buf, 0x16u);

        v6 = v45;
        v9 = v44;
        v7 = v43;

        v20 = v41;
        v19 = v40;
        v18 = v75;
      }

      objc_autoreleasePoolPop(v37);
      if (aBlock)
      {
        aBlocka = v19;
        v47 = (void *)MEMORY[0x1A1AC1AAC]();
        v48 = v38;
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v76 = v6;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = _Block_copy(v20);
          v52 = v20;
          v53 = _Block_copy(aBlocka);
          *(_DWORD *)buf = 138543874;
          v84 = v50;
          v85 = 2112;
          v86 = v51;
          v87 = 2112;
          v88 = v53;
          _os_log_impl(&dword_19B1B0000, v49, OS_LOG_TYPE_INFO, "%{public}@Looks like we did not yet call the completion handler: [completion: %@], [triggerOwnedActionSetAddCompletion: %@]", buf, 0x20u);

          v20 = v52;
          v6 = v76;
        }

        objc_autoreleasePoolPop(v47);
        if (v20)
        {
          v54 = v18;
          v55 = v20;
          v56 = v6;
          v57 = (void *)MEMORY[0x1A1AC1AAC]();
          v58 = v48;
          HMFGetOSLogHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v84 = v60;
            _os_log_impl(&dword_19B1B0000, v59, OS_LOG_TYPE_INFO, "%{public}@Calling completion handler", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v57);
          -[HMTrigger context](v58, "context");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "delegateCaller");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "callCompletion:error:", v55, 0);

          v6 = v56;
          v20 = v55;
          v18 = v54;
          v19 = aBlocka;
        }
        else
        {
          v63 = (void *)MEMORY[0x1A1AC1AAC]();
          v64 = v48;
          HMFGetOSLogHandle();
          v65 = objc_claimAutoreleasedReturnValue();
          v66 = os_log_type_enabled(v65, OS_LOG_TYPE_INFO);
          v19 = aBlocka;
          if (aBlocka)
          {
            v67 = v6;
            if (v66)
            {
              HMFGetLogIdentifier();
              v68 = v63;
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v84 = v69;
              _os_log_impl(&dword_19B1B0000, v65, OS_LOG_TYPE_INFO, "%{public}@Calling trigger owned action set add completion handler", buf, 0xCu);

              v63 = v68;
            }

            objc_autoreleasePoolPop(v63);
            -[HMTrigger context](v64, "context");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "delegateCaller");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "callCompletion:actionSet:error:", aBlocka, v18, 0);

            v6 = v67;
          }
          else
          {
            if (v66)
            {
              HMFGetLogIdentifier();
              v72 = v63;
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v84 = v73;
              _os_log_impl(&dword_19B1B0000, v65, OS_LOG_TYPE_INFO, "%{public}@Calling the trigger delegate", buf, 0xCu);

              v63 = v72;
            }

            objc_autoreleasePoolPop(v63);
            objc_msgSend(v81, "_notifyDelegateOfTriggerUpdated:", v64);
          }
        }
      }

      v10 = v77;
      goto LABEL_49;
    }
    aBlock = v16;
    if (v16)
    {
      objc_msgSend(v7, "hmf_stringForKey:", CFSTR("kActionSetName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "createAndAddActionSetWithName:type:uuid:", v17, v9, v82);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = _Block_copy(v6);
      v20 = 0;
    }
    else
    {
      objc_msgSend(v81, "actionSets");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "hmf_firstObjectWithUUID:", v82);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = _Block_copy(v6);
      v20 = v30;
      v19 = 0;
      if (v18 || !v30)
      {
        aBlock = 1;
        goto LABEL_29;
      }
      -[HMTrigger context](self, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "delegateCaller");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v32 = v20;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "callCompletion:error:", v32, v33);

      v20 = v32;
      v18 = 0;
      v19 = 0;
    }

LABEL_29:
    -[HMTrigger currentActionSets](self, "currentActionSets");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObjectIfNotPresent:", v18);
    goto LABEL_30;
  }
  v21 = (void *)MEMORY[0x1A1AC1AAC]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = v10;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v84 = v25;
    v85 = 2112;
    v86 = v81;
    v87 = 2112;
    v88 = v24;
    v89 = 2112;
    v90 = v82;
    v91 = 2112;
    v92 = v9;
    _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Required parameters not available. Not updating the action set from response. [Home: %@], [addActionSet : %@], [actionSetUUID: %@], [actionSetType: %@]", buf, 0x34u);

    v10 = v24;
  }

  objc_autoreleasePoolPop(v21);
LABEL_49:

  return v80 ^ 1;
}

- (void)_registerNotificationHandlers
{
  void *v3;
  id v4;

  -[HMTrigger context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:selector:", CFSTR("kTriggerFiredNotificationKey"), self, sel__handleTriggerFiredNotification_);

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMTrigger context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMTrigger *v7;
  void *v8;
  uint64_t v9;
  NSUUID *uuid;
  void *v11;
  uint64_t v12;
  void *v13;
  HMMutableArray *currentActionSets;
  void *v15;
  uint64_t v16;
  NSDate *lastFireDate;
  uint64_t v18;
  HMDevice *ownerDevice;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  HMTriggerPolicy *policy;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMT.triggerConfiguredNameCodingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMTrigger initWithName:configuredName:](self, "initWithName:configuredName:", v5, v6);
  if (v7)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger setHome:](v7, "setHome:", v8);

    objc_msgSend(v4, "hm_decodeAndCacheUUIDFromStringForKey:", CFSTR("triggerUUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    currentActionSets = v7->_currentActionSets;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("triggerActionSets"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMutableArray setArray:](currentActionSets, "setArray:", v15);

    -[HMTrigger setEnabled:](v7, "setEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("triggerActive")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerLastFireDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    lastFireDate = v7->_lastFireDate;
    v7->_lastFireDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.device"));
    v18 = objc_claimAutoreleasedReturnValue();
    ownerDevice = v7->_ownerDevice;
    v7->_ownerDevice = (HMDevice *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.user"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_owner, v20);

    v21 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("HMT.policyKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    policy = v7->_policy;
    v7->_policy = (HMTriggerPolicy *)v24;

  }
  return v7;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMObjectMergeCollection *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMObjectMergeCollection *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  HMTrigger *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  HMTrigger *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v68;
  void *v69;
  _QWORD v70[5];
  id v71;
  id v72;
  _QWORD block[5];
  id v74;
  id v75;
  _QWORD v76[5];
  _QWORD v77[5];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    LOBYTE(v53) = 0;
    goto LABEL_35;
  }
  v7 = [HMObjectMergeCollection alloc];
  -[HMTrigger currentActionSets](self, "currentActionSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentActionSets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v7, "initWithCurrentObjects:newObjects:", v9, v11);

  -[HMObjectMergeCollection removedObjects](v12, "removedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __32__HMTrigger_mergeFromNewObject___block_invoke;
  v77[3] = &unk_1E3AB1390;
  v77[4] = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v77);

  -[HMTrigger home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v15, "actionSets");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = v15;
  objc_msgSend(v15, "triggerOwnedActionSets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  v68 = v18;
  -[HMObjectMergeCollection replaceAddedObjectsWithObjects:](v12, "replaceAddedObjectsWithObjects:", v18);
  -[HMObjectMergeCollection addedObjects](v12, "addedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v14;
  v76[1] = 3221225472;
  v76[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_53;
  v76[3] = &unk_1E3AB1390;
  v76[4] = self;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v76);

  -[HMObjectMergeCollection finalObjects](v12, "finalObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMTrigger currentActionSets](self, "currentActionSets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setArray:", v21);

  v23 = -[HMObjectMergeCollection isModified](v12, "isModified");
  LODWORD(v22) = -[HMTrigger isEnabled](self, "isEnabled");
  if ((_DWORD)v22 != objc_msgSend(v6, "isEnabled"))
  {
    -[HMTrigger setEnabled:](self, "setEnabled:", objc_msgSend(v6, "isEnabled"));
    v23 = 1;
  }
  -[HMTrigger lastFireDate](self, "lastFireDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastFireDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = HMFEqualObjects();

  if ((v26 & 1) == 0)
  {
    objc_msgSend(v6, "lastFireDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger setLastFireDate:](self, "setLastFireDate:", v27);

    v23 = 1;
  }
  -[HMTrigger configuredName](self, "configuredName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuredName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = HMFEqualObjects();

  if ((v30 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x1A1AC1AAC]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMTrigger configuredName](v32, "configuredName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuredName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v79 = v34;
      v80 = 2112;
      v81 = v35;
      v82 = 2112;
      v83 = v36;
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating configured name from %@ to %@ via merge", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(v6, "configuredName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger setConfiguredName:](v32, "setConfiguredName:", v37);

    v23 = 1;
  }
  -[HMTrigger triggerName]((char *)self);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v38, "isEqualToString:", v39);

  if ((v40 & 1) == 0)
  {
    objc_msgSend(v6, "name");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger setTriggerName:]((uint64_t)self, v41);

    -[HMTrigger home](self, "home");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "delegate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMTrigger context](self, "context");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "queue");
      v45 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_54;
      block[3] = &unk_1E3AB5CD0;
      block[4] = self;
      v74 = v43;
      v75 = v42;
      dispatch_async(v45, block);

    }
    v23 = 1;
  }
  -[HMTrigger ownerDevice](self, "ownerDevice");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ownerDevice");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v46)
  {

    if (v48)
    {
      -[HMTrigger ownerDevice](self, "ownerDevice");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ownerDevice");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "mergeFromNewObject:", v50);

      v52 = v51 | v23;
      goto LABEL_24;
    }
    objc_msgSend(v6, "ownerDevice");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger setOwnerDevice:](self, "setOwnerDevice:", v54);

  }
  else
  {
    -[HMTrigger setOwnerDevice:](self, "setOwnerDevice:", v47);

  }
  v52 = 1;
LABEL_24:
  -[HMTrigger owner](self, "owner");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "owner");
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v56;
  if (!v55)
  {
    v58 = self;
    v59 = v57;
LABEL_29:
    -[HMTrigger setOwner:](v58, "setOwner:", v59);
    LOBYTE(v53) = 1;
    goto LABEL_30;
  }
  if (!v56)
  {
    v58 = self;
    v59 = 0;
    goto LABEL_29;
  }
  LODWORD(v53) = objc_msgSend(v55, "mergeFromNewObject:", v56) | v52;
LABEL_30:
  -[HMTrigger policy](self, "policy");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "policy");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = HMFEqualObjects();

  if ((v62 & 1) == 0)
  {
    objc_msgSend(v6, "policy");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger setPolicy:](self, "setPolicy:", v63);

    -[HMTrigger home](self, "home");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "delegate");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMTrigger context](self, "context");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "queue");
      v66 = objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_3;
      v70[3] = &unk_1E3AB5CD0;
      v70[4] = self;
      v71 = v64;
      v72 = v53;
      dispatch_async(v66, v70);

    }
    LOBYTE(v53) = 1;
  }

LABEL_35:
  return (char)v53;
}

- (BOOL)mergeFromNewObjectForBuilderUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  HMTrigger *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  HMTrigger *v45;
  void *v46;
  HMObjectMergeCollection *v47;
  int v48;
  void *v49;
  id obj;
  _QWORD v51[5];
  _QWORD v52[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45 = self;
  -[HMTrigger currentActionSets](self, "currentActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = v4;
  objc_msgSend(v4, "currentActionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:]([HMObjectMergeCollection alloc], "initWithCurrentObjects:newObjects:", v6, v8);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  v49 = v6;
  if (v9)
  {
    v10 = v9;
    v48 = 0;
    v11 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v13, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hmf_firstObjectWithValue:forKeyPath:", v14, CFSTR("uniqueIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "actionSetType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("HMActionSetTypeTriggerOwned")) & 1) != 0)
        {
          objc_msgSend(v15, "actionSetType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("HMActionSetTypeTriggerOwned"));

          if (v18)
            v48 |= objc_msgSend(v15, "mergeFromNewObjectForBuilderUpdates:", v13);
          v6 = v49;
        }
        else
        {

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v10);
  }
  else
  {
    LOBYTE(v48) = 0;
  }

  -[HMObjectMergeCollection removedObjects](v47, "removedObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __49__HMTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke;
  v52[3] = &unk_1E3AB1390;
  v52[4] = v45;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v52);

  -[HMObjectMergeCollection addedObjects](v47, "addedObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v20;
  v51[1] = 3221225472;
  v51[2] = __49__HMTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke_57;
  v51[3] = &unk_1E3AB1390;
  v51[4] = v45;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v51);

  -[HMObjectMergeCollection finalObjects](v47, "finalObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMTrigger currentActionSets](v45, "currentActionSets");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setArray:", v22);

  v24 = -[HMObjectMergeCollection isModified](v47, "isModified");
  LODWORD(v22) = -[HMTrigger isEnabled](v45, "isEnabled");
  if ((_DWORD)v22 == objc_msgSend(v46, "isEnabled"))
  {
    v25 = v24 | v48;
  }
  else
  {
    -[HMTrigger setEnabled:](v45, "setEnabled:", objc_msgSend(v46, "isEnabled"));
    v25 = 1;
  }
  -[HMTrigger configuredName](v45, "configuredName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "configuredName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = HMFEqualObjects();

  if ((v28 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = v45;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMTrigger configuredName](v30, "configuredName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "configuredName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v32;
      v59 = 2112;
      v60 = v33;
      v61 = 2112;
      v62 = v34;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_INFO, "%{public}@Updating configured name from %@ to %@ via merge", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(v46, "configuredName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger setConfiguredName:](v30, "setConfiguredName:", v35);

    v25 = 1;
  }
  -[HMTrigger triggerName]((char *)v45);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isEqualToString:", v37);

  if ((v38 & 1) == 0)
  {
    objc_msgSend(v46, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger setTriggerName:]((uint64_t)v45, v39);

    v25 = 1;
  }
  -[HMTrigger policy](v45, "policy");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "policy");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = HMFEqualObjects();

  if ((v42 & 1) == 0)
  {
    objc_msgSend(v46, "policy");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger setPolicy:](v45, "setPolicy:", v43);

    v25 = 1;
  }

  return v25 & 1;
}

- (BOOL)compatibleWithApp
{
  return 1;
}

- (void)_updateClientWithResults:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    -[HMTrigger context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateCaller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "callCompletion:error:", v9, v6);

  }
  else
  {
    -[HMTrigger home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_notifyDelegateOfTriggerUpdated:", self);
  }

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (isInternalBuild())
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[HMTrigger triggerName]((char *)self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger configuredName](self, "configuredName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTrigger uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), v4, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMTrigger uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_HMContext)context
{
  return self->_context;
}

- (HMMutableArray)currentActionSets
{
  return self->_currentActionSets;
}

- (void)setCurrentActionSets:(id)a3
{
  objc_storeStrong((id *)&self->_currentActionSets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActionSets, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_ownerDevice, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_lastFireDate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)triggerName
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = (id *)v1[2];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

void __49__HMTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed action set via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __49__HMTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke_57(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@added action set via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

- (void)setTriggerName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)(a1 + 16), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

void __32__HMTrigger_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed action set via trigger merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __32__HMTrigger_mergeFromNewObject___block_invoke_53(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added action set via trigger merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __32__HMTrigger_mergeFromNewObject___block_invoke_54(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E3AB5CD0;
  v7 = a1[5];
  v4 = a1[6];
  v5 = a1[4];
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __32__HMTrigger_mergeFromNewObject___block_invoke_3(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__HMTrigger_mergeFromNewObject___block_invoke_4;
  v6[3] = &unk_1E3AB5CD0;
  v7 = a1[5];
  v4 = a1[6];
  v5 = a1[4];
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __32__HMTrigger_mergeFromNewObject___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateTrigger:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __32__HMTrigger_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateNameForTrigger:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __60__HMTrigger__updateTriggerNameFromResponse_responsePayload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateNameForTrigger:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (uint64_t)_validatePolicy:(_QWORD *)a3 error:
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  objc_opt_self();
  v5 = v4;
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  v6 = v4 & (v5 != 0);
  if (a3 && (v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __44__HMTrigger_removePolicy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(*(const void **)(a1 + 32));
    v13 = 138544130;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Trigger remove policy response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5 && v6)
    objc_msgSend(v9, "setPolicy:", 0);
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

void __44__HMTrigger_updatePolicy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMTriggerDeleteAfterExecutionPolicy *v15;
  objc_class *v16;
  HMTriggerDeleteAfterExecutionPolicy *v17;
  void *v18;
  HMTriggerDeleteAfterExecutionPolicy *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(*(const void **)(a1 + 32));
    v24 = 138544130;
    v25 = v11;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Trigger update policy response : %@, completionHandler: %@ error %@", (uint8_t *)&v24, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5 && v6)
  {
    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("HMT.triggerPolicyUUIDKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v9, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "delegateCaller");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "callCompletion:error:", v22, v23);

      goto LABEL_8;
    }
    v14 = (void *)v13;
    v15 = [HMTriggerDeleteAfterExecutionPolicy alloc];
    v16 = (objc_class *)MEMORY[0x1E0CB3A28];
    v17 = v15;
    v18 = (void *)objc_msgSend([v16 alloc], "initWithUUIDString:", v14);
    v19 = -[HMTriggerDeleteAfterExecutionPolicy initWithPayload:payload:](v17, "initWithPayload:payload:", v18, v6);

    objc_msgSend(v9, "setPolicy:", v19);
  }
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);
LABEL_8:

}

void __51__HMTrigger__addActionSetOfType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(*(const void **)(a1 + 40));
    v21 = 138544130;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@addActionSetOfType: response : %@, completionHandler: %@ error %@", (uint8_t *)&v21, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  v13 = 1;
  if (!v5 && v6)
  {
    v14 = _Block_copy(*(const void **)(a1 + 40));
    v13 = objc_msgSend(v9, "_updateActionSetFromResponse:responsePayload:", v14, v6);

  }
  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v18;
    v23 = 2112;
    v24 = v19;
    _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@addActionSetOfType: shouldCallClientHandler: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:actionSet:error:", *(_QWORD *)(a1 + 40), 0, v5);

  }
}

uint64_t __50__HMTrigger_addActionSetOfType_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addActionSetOfType:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __39__HMTrigger__enable_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(*(const void **)(a1 + 32));
    v13 = 138544130;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Activate trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5 && v6)
    objc_msgSend(v9, "setEnabled:", objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kTriggerActivate")));
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

uint64_t __38__HMTrigger_enable_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enable:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (uint64_t)_validateName:(void *)a3 configuredName:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  if (!v6)
  {
    if (a4)
    {
      v10 = 20;
      goto LABEL_12;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_15;
  }
  v8 = objc_msgSend(v6, "length");
  if (HMMaxLengthForNaming__hmf_once_t5 != -1)
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
  if (v8 <= HMMaxLengthForNaming__hmf_once_v6)
  {
    v9 = objc_msgSend(v7, "length");
    if (HMMaxLengthForNaming__hmf_once_t5 != -1)
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
    if (v9 <= HMMaxLengthForNaming__hmf_once_v6)
    {
      v11 = 1;
      goto LABEL_15;
    }
  }
  if (!a4)
    goto LABEL_13;
  v10 = 46;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v10);
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v11;
}

void __57__HMTrigger_updateName_configuredName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(*(const void **)(a1 + 32));
    v13 = 138544130;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Rename trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (v5
    || !v6
    || objc_msgSend(v9, "_updateTriggerNameFromResponse:responsePayload:", *(_QWORD *)(a1 + 32), v6))
  {
    objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);
  }

}

+ (uint64_t)_validateActionSet:(void *)a3 home:(int)a4 homeOwnedOnly:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  BOOL IsHomeOwned;
  uint64_t v16;
  uint64_t v17;

  v8 = a2;
  v9 = a3;
  objc_opt_self();
  if (!v8)
  {
    if (!a5)
      goto LABEL_14;
    v17 = 20;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v17);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v9)
  {
    objc_msgSend(v8, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      if (!a5)
        goto LABEL_14;
      v17 = 11;
      goto LABEL_13;
    }
  }
  if (a4)
  {
    objc_msgSend(v8, "actionSetType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    IsHomeOwned = HMActionSetTypeIsHomeOwned(v14);

    if (!IsHomeOwned)
    {
      if (a5)
      {
        v17 = 3;
        goto LABEL_13;
      }
LABEL_14:
      v16 = 0;
      goto LABEL_15;
    }
  }
  v16 = 1;
LABEL_15:

  return v16;
}

uint64_t __47__HMTrigger_removeActionSet_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateActionSet:add:completionHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __44__HMTrigger_addActionSet_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateActionSet:add:completionHandler:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

void __52__HMTrigger__updateActionSet_add_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(*(const void **)(a1 + 32));
    v20 = 138544130;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@_updateActionSet: response : %@, completionHandler: %@ error %@", (uint8_t *)&v20, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  v13 = 1;
  if (!v5 && v6)
  {
    v14 = _Block_copy(*(const void **)(a1 + 32));
    v13 = objc_msgSend(v9, "_updateActionSetFromResponse:responsePayload:", v14, v6);

  }
  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v18;
    v22 = 2112;
    v23 = v19;
    _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@_updateActionSet : shouldCallClientHandler: %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  if (v13)
    objc_msgSend(v16, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t72 != -1)
    dispatch_once(&logCategory__hmf_once_t72, &__block_literal_global_8900);
  return (id)logCategory__hmf_once_v73;
}

void __24__HMTrigger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v73;
  logCategory__hmf_once_v73 = v0;

}

- (id)copyAsBuilder
{
  return 0;
}

@end
