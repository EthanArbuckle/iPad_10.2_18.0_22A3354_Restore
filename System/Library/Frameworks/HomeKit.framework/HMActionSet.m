@implementation HMActionSet

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
  return self->_uuid;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSString copy](self->_name, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isExecuting
{
  HMActionSet *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executionInProgress;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMActionSet setContext:](self, "setContext:", v6);
  -[HMActionSet setHome:](self, "setHome:", v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMActionSet actions](self, "actions", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "__configureWithContext:actionSet:", v6, self);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[HMActionSet actionSetType](self, "actionSetType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("HMActionSetTypeShortcutsComponent"));

  if ((v14 & 1) == 0)
    -[HMActionSet _registerNotificationHandlers](self, "_registerNotificationHandlers");

}

- (NSString)actionSetType
{
  return self->_actionSetType;
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

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
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

- (void)_registerNotificationHandlers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMActionSet context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("kActionSetWillStartExecutionNotificationKey"), self, sel__handleActionSetStartExecutionNotification_);

  -[HMActionSet context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:selector:", CFSTR("kActionSetExecutedNotificationKey"), self, sel__handleActionSetExecutedNotification_);

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMActionSet context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMContext)context
{
  return self->_context;
}

- (HMActionSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMActionSet *v9;
  void *v10;
  uint64_t v11;
  NSDate *lastExecutionDate;
  HMMutableArray *currentActions;
  void *v14;
  void *v15;
  HMApplicationData *v16;
  HMApplicationData *applicationData;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionSetUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionSetName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("actionSetType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMActionSet initWithName:type:uuid:](self, "initWithName:type:uuid:", v7, v8, v6);
  if (v9)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_home, v10);

    v9->_executionInProgress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.actionSetExecutionInProgress"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.actionSetLastExecutionDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    lastExecutionDate = v9->_lastExecutionDate;
    v9->_lastExecutionDate = (NSDate *)v11;

    currentActions = v9->_currentActions;
    +[HMActionSet allowedActionClasses](HMActionSet, "allowedActionClasses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("actionSetActions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMutableArray setArray:](currentActions, "setArray:", v15);

    v16 = -[HMApplicationData initWithDictionaryFromCoder:key:]([HMApplicationData alloc], "initWithDictionaryFromCoder:key:", v4, CFSTR("HM.appData"));
    applicationData = v9->_applicationData;
    v9->_applicationData = v16;

  }
  return v9;
}

- (HMActionSet)initWithName:(id)a3 type:(id)a4 uuid:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  HMActionSet *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSUUID *uuid;
  const __CFString *v16;
  uint64_t v17;
  NSString *actionSetType;
  uint64_t v19;
  HMMutableArray *currentActions;
  HMApplicationData *v21;
  HMApplicationData *applicationData;
  objc_super v24;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HMActionSet;
  v11 = -[HMActionSet init](&v24, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v14;

    if (v9)
      v16 = v9;
    else
      v16 = CFSTR("HMActionSetTypeUserDefined");
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    actionSetType = v11->_actionSetType;
    v11->_actionSetType = (NSString *)v17;

    +[HMMutableArray array](HMMutableArray, "array");
    v19 = objc_claimAutoreleasedReturnValue();
    currentActions = v11->_currentActions;
    v11->_currentActions = (HMMutableArray *)v19;

    v21 = objc_alloc_init(HMApplicationData);
    applicationData = v11->_applicationData;
    v11->_applicationData = v21;

  }
  return v11;
}

+ (id)allowedActionClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)actions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HMActionSet currentActions](self, "currentActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return (NSSet *)v6;
}

- (HMMutableArray)currentActions
{
  return self->_currentActions;
}

- (NSDate)lastExecutionDate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSDate copy](self->_lastExecutionDate, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDate *)v4;
}

- (NSDictionary)shortcutsDictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[HMActionSet encodeAsProtoBuf](self, "encodeAsProtoBuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = CFSTR("HMActionSetSerializedDictionaryVersion");
    v7[1] = CFSTR("HMActionSetSerializedDictionaryProtocol");
    v8[0] = CFSTR("1.0");
    v8[1] = CFSTR("ProtoBuf");
    v7[2] = CFSTR("HMActionSetSerializedData");
    v8[2] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (HMActionSet)initWithShortcutsDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  HMPBActionSet *v12;
  HMActionSet *v13;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "hmf_stringForKey:", CFSTR("HMActionSetSerializedDictionaryProtocol"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("ProtoBuf")))
    goto LABEL_6;
  objc_msgSend(v8, "hmf_stringForKey:", CFSTR("HMActionSetSerializedDictionaryVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("1.0"));

  if (v11)
  {
    objc_msgSend(v8, "hmf_dataForKey:", CFSTR("HMActionSetSerializedData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v12 = -[HMPBActionSet initWithData:]([HMPBActionSet alloc], "initWithData:", v9);
      if (v12)
      {
        +[HMActionSet actionSetFromProtoBuf:home:](HMActionSet, "actionSetFromProtoBuf:home:", v12, v7);
        v13 = (HMActionSet *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

      goto LABEL_10;
    }
LABEL_6:
    v13 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)shortcutsComponentActionSet
{
  return +[HMActionSet _shortcutsComponentActionSetWithHome:actions:]((uint64_t)a1, 0, 0);
}

+ (id)shortcutsComponentActionSetWithHome:(id)a3 actions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    +[HMActionSet _shortcutsComponentActionSetWithHome:actions:]((uint64_t)a1, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v11 = _HMFPreconditionFailure();
    return +[HMActionSet _shortcutsComponentActionSetWithHome:actions:](v11, v12, v13);
  }
}

+ (HMActionSet)_shortcutsComponentActionSetWithHome:(void *)a3 actions:
{
  id v4;
  id v5;
  HMActionSet *v6;
  void *v7;
  void *v8;
  void *v9;
  HMActionSet *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _HMContext *v23;
  HMActionSet *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  id v33;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v35 = (void *)objc_opt_self();
  v6 = [HMActionSet alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMActionSet initWithName:type:uuid:](v6, "initWithName:type:uuid:", v8, CFSTR("HMActionSetTypeShortcutsComponent"), v9);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
LABEL_3:
    v15 = v4;
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v14)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v16);
      v36 = 0;
      v18 = objc_msgSend(v17, "isValidWithError:", &v36, v35);
      v19 = v36;
      if ((v18 & 1) == 0)
        break;
      objc_msgSend(v17, "actionSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v25 = (void *)MEMORY[0x1A1AC1AAC]();
        v26 = v35;
        v33 = v35;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v29;
          v43 = 2112;
          v44 = v17;
          v30 = "%{public}@Action is in another action set: %@";
          v31 = v28;
          v32 = 22;
LABEL_15:
          _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);

        }
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setUuid:", v21);

      -[HMActionSet currentActions](v10, "currentActions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v17);

      if (v13 == ++v16)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        v4 = v15;
        if (v13)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = v35;
    v27 = v35;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v29;
      v43 = 2112;
      v44 = v17;
      v45 = 2112;
      v46 = v19;
      v30 = "%{public}@Invalid action %@: %@";
      v31 = v28;
      v32 = 32;
      goto LABEL_15;
    }
LABEL_16:
    v4 = v15;

    objc_autoreleasePoolPop(v25);
    v24 = 0;
    goto LABEL_17;
  }
LABEL_10:

  v23 = -[_HMContext initWithName:]([_HMContext alloc], "initWithName:", CFSTR("com.apple.HomeKit.ShortcutsComponent"));
  -[HMActionSet __configureWithContext:home:](v10, "__configureWithContext:home:", v23, v4);

  v24 = v10;
LABEL_17:

  return v24;
}

- (id)copyAsBuilder
{
  return -[HMActionSetBuilder initWithActionSet:]([HMActionSetBuilder alloc], "initWithActionSet:", self);
}

- (void)updateWithBuilder:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMActionSet *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  HMActionSet *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMActionSet context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMActionSet home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v30 = 0;
    v11 = objc_msgSend(v9, "validateBuilder:error:", v6, &v30);
    v12 = v30;
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E0C99E08];
      v29 = v12;
      objc_msgSend(v10, "encodeActionSetBuilder:error:", v6, &v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v29;

      objc_msgSend(v14, "dictionaryWithDictionary:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[HMActionSet uuid](self, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __69__HMActionSet_ActionSetBuilder__updateWithBuilder_completionHandler___block_invoke;
        v24[3] = &unk_1E3AB4B08;
        v25 = v8;
        v28 = v7;
        v26 = v10;
        v27 = self;
        -[_HMContext sendMessage:target:payload:responseHandler:](v25, CFSTR("HMUpdateActionSetFromBuilderMessage"), v18, v17, v24);

        v19 = v25;
      }
      else
      {
        objc_msgSend(v8, "delegateCaller");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "callCompletion:error:", v7, v16);
      }

    }
    else
    {
      objc_msgSend(v8, "delegateCaller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "callCompletion:error:", v7, v13);
      v16 = v13;
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2080;
      v34 = "-[HMActionSet(ActionSetBuilder) updateWithBuilder:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

}

void __69__HMActionSet_ActionSetBuilder__updateWithBuilder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HMActionSet *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v6 = (HMActionSet *)objc_claimAutoreleasedReturnValue();
    -[HMActionSet callCompletion:error:](v6, "callCompletion:error:", *(_QWORD *)(a1 + 56), v10);
  }
  else
  {
    v6 = -[HMActionSet initWithDictionary:home:]([HMActionSet alloc], "initWithDictionary:home:", v5, *(_QWORD *)(a1 + 40));
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "mergeFromNewObjectForBuilderUpdates:", v6);
      objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "callCompletion:error:", *(_QWORD *)(a1 + 56), 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "callCompletion:error:", v8, v9);

    }
  }

}

- (HMActionSet)init
{

  return 0;
}

- (HMActionSet)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMActionSet *v8;
  void *v9;
  uint64_t v10;
  NSUUID *uuid;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  NSString *actionSetType;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  HMAction *v27;
  HMAction *v28;
  uint64_t v29;
  HMMutableArray *currentActions;
  HMApplicationData *v31;
  void *v32;
  uint64_t v33;
  HMApplicationData *applicationData;
  HMActionSet *v35;
  void *v36;
  HMActionSet *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  HMActionSet *v42;
  uint64_t v43;
  __CFString *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)HMActionSet;
  v8 = -[HMActionSet init](&v51, sel_init);
  if (!v8)
  {
LABEL_15:
    v35 = v8;
    goto LABEL_24;
  }
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kActionSetUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v36 = (void *)MEMORY[0x1A1AC1AAC]();
    v37 = v8;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v54 = v39;
    v55 = 2112;
    v56 = v40;
    v41 = "%{public}@Unable to decode %@, missing uuid";
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  uuid = v8->_uuid;
  v8->_uuid = (NSUUID *)v10;

  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kActionSetName"));
  v12 = objc_claimAutoreleasedReturnValue();
  name = v8->_name;
  v8->_name = (NSString *)v12;

  if (v8->_name)
  {
    v46 = v9;
    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kActionSetType"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("HMActionSetTypeUserDefined");
    if (v14)
      v16 = (__CFString *)v14;
    v17 = v16;

    v45 = v17;
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    actionSetType = v8->_actionSetType;
    v8->_actionSetType = (NSString *)v18;

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_arrayForKey:ofClasses:", CFSTR("kActionSetActions"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v48 != v25)
            objc_enumerationMutation(v22);
          v27 = -[HMAction initWithDictionary:home:]([HMAction alloc], "initWithDictionary:home:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), v7);
          if (!v27)
          {

            goto LABEL_23;
          }
          v28 = v27;
          objc_msgSend(v20, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v24)
          continue;
        break;
      }
    }

    +[HMMutableArray arrayWithArray:](HMMutableArray, "arrayWithArray:", v20);
    v29 = objc_claimAutoreleasedReturnValue();
    currentActions = v8->_currentActions;
    v8->_currentActions = (HMMutableArray *)v29;

    v31 = [HMApplicationData alloc];
    objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("kAppDataInformationKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HMApplicationData initWithContentsOfDictionary:](v31, "initWithContentsOfDictionary:", v32);
    applicationData = v8->_applicationData;
    v8->_applicationData = (HMApplicationData *)v33;

    goto LABEL_15;
  }
  v36 = (void *)MEMORY[0x1A1AC1AAC]();
  v42 = v8;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v54 = v39;
    v55 = 2112;
    v56 = v43;
    v41 = "%{public}@Unable to decode %@, missing name";
LABEL_21:
    _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);

  }
LABEL_22:

  objc_autoreleasePoolPop(v36);
LABEL_23:
  v35 = 0;
LABEL_24:

  return v35;
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
  HMActionSet *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
      v22 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring actionSet and actions", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMActionSet actions](v5, "actions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "_unconfigure");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }
    -[HMActionSet currentActions](v5, "currentActions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setArray:", 0);

    -[HMActionSet setHome:](v5, "setHome:", 0);
    -[HMActionSet _unconfigureContext](v5, "_unconfigureContext");

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
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

- (void)setLastExecutionDate:(id)a3
{
  NSDate *v4;
  NSDate *lastExecutionDate;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  lastExecutionDate = self->_lastExecutionDate;
  self->_lastExecutionDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)requiresDeviceUnlock
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[HMActionSet actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__HMActionSet_requiresDeviceUnlock__block_invoke;
  v4[3] = &unk_1E3AB4AB0;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (void)setExecutionInProgress:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_executionInProgress = a3;
  os_unfair_lock_unlock(p_lock);
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

- (void)_recomputeAssistantIdentifier
{
  NSString *v3;
  NSString *assistantIdentifier;

  hm_assistantIdentifierWithSalts(CFSTR("AS"), (uint64_t)self->_uuid, 0);
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
    -[HMActionSet _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
    assistantIdentifier = self->_assistantIdentifier;
  }
  v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)recomputeAssistantIdentifier
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMActionSet _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
  os_unfair_lock_unlock(p_lock);
}

- (void)resetNameWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMActionSet *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMActionSet *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMActionSet context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMActionSet resetNameWithCompletionHandler:]", CFSTR("completion"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = (const char *)v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__HMActionSet_resetNameWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3AB60A0;
    block[4] = self;
    v20 = v4;
    dispatch_async(v7, block);

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
      v22 = v11;
      v23 = 2080;
      v24 = "-[HMActionSet resetNameWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)updateName:(NSString *)name completionHandler:(HMErrorBlock)completion
{
  NSString *v6;
  HMErrorBlock v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMActionSet *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMActionSet *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSString *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = name;
  v7 = completion;
  -[HMActionSet context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMActionSet updateName:completionHandler:]", CFSTR("completion"));
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
    block[2] = __44__HMActionSet_updateName_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v24 = v7;
    v23 = v6;
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
      v28 = "-[HMActionSet updateName:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(HMErrorBlock, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  HMActionSet *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMActionSet *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMActionSet *v37;
  NSObject *v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  const __CFString *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMActionSet context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMActionSet _updateName:completionHandler:]", CFSTR("completion"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1A1AC1AAC]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v39;
      v48 = 2112;
      v49 = (const char *)v35;
      _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v35, 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = objc_msgSend(v6, "length");
    if (HMMaxLengthForNaming__hmf_once_t5 != -1)
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
    if (v10 <= HMMaxLengthForNaming__hmf_once_v6)
    {
      -[HMActionSet home](self, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[HMActionSet name](self, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v6);

        if (v22)
        {
          -[HMActionSet context](self, "context");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "delegateCaller");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "callCompletion:error:", v7, 0);

        }
        else
        {
          if (v6)
          {
            v44 = CFSTR("kActionSetName");
            v45 = v6;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = (void *)MEMORY[0x1E0C9AA70];
          }
          v29 = (void *)MEMORY[0x1E0D285F8];
          v30 = objc_alloc(MEMORY[0x1E0D285D8]);
          -[HMActionSet uuid](self, "uuid");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v30, "initWithTarget:", v31);
          objc_msgSend(v29, "messageWithName:destination:payload:", CFSTR("kRenameActionSetRequestKey"), v32, v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)buf, self);
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __45__HMActionSet__updateName_completionHandler___block_invoke;
          v41[3] = &unk_1E3AB4AE0;
          objc_copyWeak(&v43, (id *)buf);
          v42 = v7;
          objc_msgSend(v33, "setResponseHandler:", v41);
          objc_msgSend(v9, "messageDispatcher");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "sendMessage:completionHandler:", v33, 0);

          objc_destroyWeak(&v43);
          objc_destroyWeak((id *)buf);

        }
      }
      else
      {
        -[HMActionSet context](self, "context");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "delegateCaller");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "callCompletion:error:", v7, v27);

        v15 = 0;
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
        *(_DWORD *)buf = 138543362;
        v47 = v14;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v9, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 46);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v7, v16);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v20;
      v48 = 2080;
      v49 = "-[HMActionSet _updateName:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }

}

- (void)addAction:(HMAction *)action completionHandler:(HMErrorBlock)completion
{
  HMAction *v6;
  HMErrorBlock v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMActionSet *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMActionSet *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  HMAction *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = action;
  v7 = completion;
  -[HMActionSet context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMActionSet addAction:completionHandler:]", CFSTR("completion"));
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
    block[2] = __43__HMActionSet_addAction_completionHandler___block_invoke;
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
      v28 = "-[HMActionSet addAction:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(HMErrorBlock, void *))v7 + 2))(v7, v15);

  }
}

- (void)_addAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMActionSet *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMActionSet context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v40 = 0;
      v10 = objc_msgSend(v6, "isValidWithError:", &v40);
      v11 = v40;
      if ((v10 & 1) != 0)
      {
        -[HMActionSet actions](self, "actions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v6);

        if (v13)
        {
          objc_msgSend(v9, "delegateCaller");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v16 = 1;
LABEL_17:
          objc_msgSend(v15, "hmErrorWithCode:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "callCompletion:error:", v7, v25);

          goto LABEL_18;
        }
        objc_msgSend(v6, "actionSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v9, "delegateCaller");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v16 = 30;
          goto LABEL_17;
        }
        -[HMActionSet actionSetType](self, "actionSetType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("HMActionSetTypeShortcutsComponent"));

        if (!v27)
        {
          -[HMActionSet home](self, "home");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v6, "_serializeForAdd");
            v29 = objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v30 = (void *)v29;
              -[HMActionSet uuid](self, "uuid");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = CFSTR("kActionInfo");
              v42 = v30;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v36[0] = MEMORY[0x1E0C809B0];
              v36[1] = 3221225472;
              v36[2] = __44__HMActionSet__addAction_completionHandler___block_invoke;
              v36[3] = &unk_1E3AB4B08;
              v36[4] = self;
              v37 = v9;
              v39 = v7;
              v38 = v6;
              -[_HMContext sendMessage:target:payload:responseHandler:](v37, CFSTR("kAddActionRequestKey"), v31, v32, v36);

            }
            else
            {
              objc_msgSend(v9, "delegateCaller");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "callCompletion:error:", v7, v35);

              v30 = 0;
            }
          }
          else
          {
            objc_msgSend(v9, "delegateCaller");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "callCompletion:error:", v7, v33);

          }
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMActionSet _doAddAction:uuid:](self, "_doAddAction:uuid:", v6, v28);

        objc_msgSend(v9, "delegateCaller");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        v22 = v7;
        v23 = 0;
      }
      else
      {
        objc_msgSend(v9, "delegateCaller");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        if (!v11)
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v16 = 3;
          goto LABEL_17;
        }
        v22 = v7;
        v23 = v11;
      }
    }
    else
    {
      objc_msgSend(v8, "delegateCaller");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v11;
      v22 = v7;
      v23 = v14;
    }
    objc_msgSend(v21, "callCompletion:error:", v22, v23);
LABEL_18:

    goto LABEL_19;
  }
  v17 = (void *)MEMORY[0x1A1AC1AAC]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v20;
    v45 = 2080;
    v46 = "-[HMActionSet _addAction:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v7 + 2))(v7, v11);
LABEL_19:

  }
}

- (void)removeAction:(HMAction *)action completionHandler:(HMErrorBlock)completion
{
  HMAction *v6;
  HMErrorBlock v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMActionSet *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMActionSet *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  HMAction *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = action;
  v7 = completion;
  -[HMActionSet context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMActionSet removeAction:completionHandler:]", CFSTR("completion"));
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
    block[2] = __46__HMActionSet_removeAction_completionHandler___block_invoke;
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
      v28 = "-[HMActionSet removeAction:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(HMErrorBlock, void *))v7 + 2))(v7, v15);

  }
}

- (void)_removeAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  HMActionSet *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  HMActionSet *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  void (**v43)(id, void *);
  id v44;
  const __CFString *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMActionSet context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMActionSet _removeAction:completionHandler:]", CFSTR("completion"));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v38;
      v49 = 2112;
      v50 = (const char *)v34;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v34, 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v39);
  }
  v9 = v8;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v18;
      v49 = 2080;
      v50 = "-[HMActionSet _removeAction:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v19);

    goto LABEL_14;
  }
  if (!v6)
  {
    objc_msgSend(v8, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v21 = (void *)v20;
    objc_msgSend(v14, "callCompletion:error:", v7, v20);

    goto LABEL_13;
  }
  -[HMActionSet currentActions](self, "currentActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v9, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[HMActionSet actionSetType](self, "actionSetType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("HMActionSetTypeShortcutsComponent"));

  if (v13)
  {
    objc_msgSend(v6, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMActionSet _doRemoveActionWithUUID:completionHandler:](self, "_doRemoveActionWithUUID:completionHandler:", v14, v7);
LABEL_13:

    goto LABEL_14;
  }
  -[HMActionSet home](self, "home");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v22 = (void *)MEMORY[0x1E0D285F8];
    v23 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMActionSet uuid](self, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithTarget:", v24);
    v45 = CFSTR("kActionUUID");
    objc_msgSend(v6, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "messageWithName:destination:payload:", CFSTR("kRemoveActionRequestKey"), v25, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __47__HMActionSet__removeAction_completionHandler___block_invoke;
    v41[3] = &unk_1E3AB4B30;
    objc_copyWeak(&v44, (id *)buf);
    v43 = v7;
    v30 = v9;
    v42 = v30;
    objc_msgSend(v29, "setResponseHandler:", v41);
    objc_msgSend(v30, "messageDispatcher");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendMessage:completionHandler:", v29, 0);

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    objc_msgSend(v9, "delegateCaller");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "callCompletion:error:", v7, v33);

  }
LABEL_14:

}

- (void)_updateAction:(id)a3 changes:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMActionSet *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  HMActionSet *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _BYTE location[12];
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMActionSet context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMActionSet _updateAction:changes:completionHandler:]", CFSTR("completion"));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v38;
      v47 = 2112;
      v48 = (const char *)v34;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v34, 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v39);
  }
  v12 = v11;
  if (v11)
  {
    if (v8 && v9)
    {
      -[HMActionSet home](self, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[HMActionSet currentActions](self, "currentActions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v8);

        if ((v15 & 1) != 0)
        {
          v16 = objc_alloc(MEMORY[0x1E0D285D8]);
          -[HMActionSet uuid](self, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

          v18 = (void *)MEMORY[0x1E0D285F8];
          v44[0] = CFSTR("kActionUUID");
          objc_msgSend(v8, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v44[1] = CFSTR("kActionInfo");
          v45[0] = v20;
          v45[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "messageWithName:destination:payload:", CFSTR("kReplaceActionValueKey"), v40, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)location, self);
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __55__HMActionSet__updateAction_changes_completionHandler___block_invoke;
          v41[3] = &unk_1E3AB4AE0;
          objc_copyWeak(&v43, (id *)location);
          v42 = v10;
          objc_msgSend(v22, "setResponseHandler:", v41);
          objc_msgSend(v12, "messageDispatcher");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "sendMessage:completionHandler:", v22, 0);

          objc_destroyWeak(&v43);
          objc_destroyWeak((id *)location);

LABEL_15:
          goto LABEL_16;
        }
        objc_msgSend(v12, "delegateCaller");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 2, 0);
        v32 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v12, "delegateCaller");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
        v32 = objc_claimAutoreleasedReturnValue();
      }
      v33 = (void *)v32;
      objc_msgSend(v31, "callCompletion:error:", v10, v32);

      goto LABEL_15;
    }
    objc_msgSend(v11, "delegateCaller");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 20, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "callCompletion:error:", v10, v30);

  }
  else
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v27;
      v47 = 2080;
      v48 = "-[HMActionSet _updateAction:changes:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v28);

  }
LABEL_16:

}

- (void)_doAddAction:(id)a3 uuid:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMActionSet *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _QWORD *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMActionSet currentActions](self, "currentActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstItemWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Action %@ being added has already appeared, making %@ a proxy for existing configured instance %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    HMProxify(v6);
  }
  else
  {
    objc_msgSend(v6, "setUuid:", v7);
    -[HMActionSet context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__configureWithContext:actionSet:", v15, self);

    -[HMActionSet currentActions](self, "currentActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v6);

  }
}

- (void)_removeActionsForAccessory:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  _QWORD v24[4];
  id v25;
  HMActionSet *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HMActionSet actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
        v10 = v9;

        if (v10)
        {
          objc_msgSend(v10, "characteristic");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "service");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v12, "accessoryUUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "uuid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

            if (v15)
              objc_msgSend(v21, "addObject:", v8);
          }

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }

  -[HMActionSet currentActions](self, "currentActions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectsInArray:", v21);

  -[HMActionSet home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMActionSet context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __42__HMActionSet__removeActionsForAccessory___block_invoke;
    v24[3] = &unk_1E3AB5ED8;
    v25 = v18;
    v26 = self;
    objc_msgSend(v20, "invokeBlock:", v24);

  }
}

- (BOOL)_doRemoveActionWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  HMActionSet *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  HMActionSet *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMActionSet currentActions](self, "currentActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstItemWithUUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMActionSet currentActions](self, "currentActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v9);

    objc_msgSend(v9, "_unconfigure");
    if (v7)
    {
      -[HMActionSet context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "callCompletion:error:", v7, 0);

      v13 = 0;
    }
    else
    {
      -[HMActionSet home](self, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();
      if ((v20 & 1) != 0)
      {
        -[HMActionSet context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "delegateCaller");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __57__HMActionSet__doRemoveActionWithUUID_completionHandler___block_invoke;
        v24[3] = &unk_1E3AB5CD0;
        v25 = v19;
        v26 = v18;
        v27 = self;
        objc_msgSend(v22, "invokeBlock:", v24);

      }
      v13 = v20 ^ 1;

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
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@The action does not belong to actionset", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 1;
  }

  return v13 & 1;
}

- (BOOL)_handleActionRemovedFromPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  HMActionSet *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kActionUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[HMActionSet _doRemoveActionWithUUID:completionHandler:](self, "_doRemoveActionWithUUID:completionHandler:", v8, v7);
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
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid action UUID : %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 1;
  }

  return v9;
}

- (BOOL)_handleActionUpdatedFromResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  HMActionSet *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMActionSet *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  HMActionSet *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kActionUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("kActionInfo"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 && v9)
  {
    -[HMActionSet currentActions](self, "currentActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstItemWithUUID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if ((objc_msgSend(v12, "_handleUpdates:", v10) & 1) != 0)
      {
        if (v7)
        {
          -[HMActionSet context](self, "context");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "delegateCaller");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "callCompletion:error:", v7, 0);

          v15 = 0;
        }
        else
        {
          -[HMActionSet home](self, "home");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_opt_respondsToSelector();
          if ((v30 & 1) != 0)
          {
            -[HMActionSet context](self, "context");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "delegateCaller");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __59__HMActionSet__handleActionUpdatedFromResponse_completion___block_invoke;
            v33[3] = &unk_1E3AB5CD0;
            v34 = v29;
            v35 = v28;
            v36 = self;
            objc_msgSend(v31, "invokeBlock:", v33);

          }
          v15 = v30 ^ 1;

        }
        goto LABEL_16;
      }
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v23;
        v39 = 2112;
        v40 = v12;
        v41 = 2112;
        v42 = v10;
        v24 = "%{public}@Could not update action (%@) with info (%@)";
        v25 = v22;
        v26 = 32;
        goto LABEL_14;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v23;
        v24 = "%{public}@Unable to update action.";
        v25 = v22;
        v26 = 12;
LABEL_14:
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);

      }
    }

    objc_autoreleasePoolPop(v20);
    v15 = 1;
LABEL_16:

    goto LABEL_17;
  }
  v16 = (void *)MEMORY[0x1A1AC1AAC]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v19;
    v39 = 2112;
    v40 = v8;
    v41 = 2112;
    v42 = v10;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to update action. Either UUID (%@) or info (%@) is invalid", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  v15 = 1;
LABEL_17:

  return v15 & 1;
}

- (BOOL)_handleActionSetRenameFromPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  HMActionSet *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  HMActionSet *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kActionSetName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMActionSet setName:](self, "setName:", v8);
    if (v7)
    {
      -[HMActionSet context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delegateCaller");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "callCompletion:error:", v7, 0);

      v11 = 0;
    }
    else
    {
      -[HMActionSet home](self, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();
      if ((v18 & 1) != 0)
      {
        -[HMActionSet context](self, "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "delegateCaller");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __60__HMActionSet__handleActionSetRenameFromPayload_completion___block_invoke;
        v22[3] = &unk_1E3AB5CD0;
        v23 = v17;
        v24 = v16;
        v25 = self;
        objc_msgSend(v20, "invokeBlock:", v22);

      }
      v11 = v18 ^ 1;

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      v28 = 2112;
      v29 = 0;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Received a new action set without a new name %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 1;
  }

  return v11 & 1;
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = v6;
  -[HMActionSet home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "updateApplicationData:forActionSet:completionHandler:", v14, self, v7);
  }
  else
  {
    -[HMActionSet context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v7, v12);

  }
}

- (void)_handleActionSetStartExecutionNotification:(id)a3
{
  -[HMActionSet setExecutionInProgress:](self, "setExecutionInProgress:", 1);
}

- (void)_handleActionSetExecutedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMActionSet *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dateForKey:", CFSTR("kActionSetLastexecutionDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMActionSet setLastExecutionDate:](self, "setLastExecutionDate:", v5);
    -[HMActionSet setExecutionInProgress:](self, "setExecutionInProgress:", 0);
    -[HMActionSet home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notifyDelegatesOfExecutionForActionSet:atDate:", self, v5);

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
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received action set executed message without a last execution date: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  HMObjectMergeCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  HMObjectMergeCollection *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  int v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(id *);
  void *v40;
  HMActionSet *v41;
  id v42;
  id v43;
  _QWORD block[5];
  id v45;
  id v46;
  _QWORD v47[5];
  _QWORD v48[5];

  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[HMActionSet currentActions](self, "currentActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v14, v8);

  -[HMObjectMergeCollection removedObjects](v9, "removedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __34__HMActionSet_mergeFromNewObject___block_invoke;
  v48[3] = &unk_1E3AB4B58;
  v48[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v48);

  -[HMObjectMergeCollection addedObjects](v9, "addedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v11;
  v47[1] = 3221225472;
  v47[2] = __34__HMActionSet_mergeFromNewObject___block_invoke_59;
  v47[3] = &unk_1E3AB4B58;
  v47[4] = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v47);

  -[HMObjectMergeCollection mergeCommonObjects](v9, "mergeCommonObjects");
  -[HMActionSet home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = -[HMObjectMergeCollection isModified](v9, "isModified");
  if ((_DWORD)v14)
  {
    -[HMObjectMergeCollection finalObjects](v9, "finalObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMActionSet currentActions](self, "currentActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setArray:", v15);

    objc_msgSend(v13, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMActionSet context](self, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "queue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __34__HMActionSet_mergeFromNewObject___block_invoke_60;
      block[3] = &unk_1E3AB5CD0;
      block[4] = self;
      v45 = v17;
      v46 = v13;
      dispatch_async(v19, block);

    }
  }
  -[HMActionSet name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if ((v22 & 1) == 0)
  {
    objc_msgSend(v4, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMActionSet setName:](self, "setName:", v23);

    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMActionSet context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "queue");
      v25 = objc_claimAutoreleasedReturnValue();
      v37 = v11;
      v38 = 3221225472;
      v39 = __34__HMActionSet_mergeFromNewObject___block_invoke_3;
      v40 = &unk_1E3AB5CD0;
      v41 = self;
      v42 = v14;
      v43 = v13;
      dispatch_async(v25, &v37);

    }
    LOBYTE(v14) = 1;
  }
  -[HMActionSet applicationData](self, "applicationData", v37, v38, v39, v40, v41);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = HMFEqualObjects();

  if ((v28 & 1) == 0)
  {
    objc_msgSend(v4, "applicationData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMActionSet setApplicationData:](self, "setApplicationData:", v14);

    objc_msgSend(v13, "notifyDelegateOfAppDataUpdateForActionSet:", self);
    LOBYTE(v14) = 1;
  }
  v29 = -[HMActionSet executionInProgress](self, "executionInProgress");
  if (v29 != objc_msgSend(v4, "executionInProgress"))
  {
    -[HMActionSet setExecutionInProgress:](self, "setExecutionInProgress:", objc_msgSend(v4, "executionInProgress"));
    LOBYTE(v14) = 1;
  }
  -[HMActionSet lastExecutionDate](self, "lastExecutionDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastExecutionDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = HMFEqualObjects();

  if ((v32 & 1) == 0)
  {
    objc_msgSend(v4, "lastExecutionDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMActionSet setLastExecutionDate:](self, "setLastExecutionDate:", v33);

    objc_msgSend(v4, "lastExecutionDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v4, "lastExecutionDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "notifyDelegatesOfExecutionForActionSet:atDate:", self, v35);

    }
    LOBYTE(v14) = 1;
  }

  return (char)v14;
}

- (BOOL)mergeFromNewObjectForBuilderUpdates:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  _QWORD v23[5];
  _QWORD v24[5];

  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[HMActionSet currentActions](self, "currentActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v7, v9);

  -[HMObjectMergeCollection removedObjects](v10, "removedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __51__HMActionSet_mergeFromNewObjectForBuilderUpdates___block_invoke;
  v24[3] = &unk_1E3AB4B58;
  v24[4] = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v24);

  -[HMObjectMergeCollection addedObjects](v10, "addedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __51__HMActionSet_mergeFromNewObjectForBuilderUpdates___block_invoke_61;
  v23[3] = &unk_1E3AB4B58;
  v23[4] = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v23);

  -[HMObjectMergeCollection mergeCommonObjects](v10, "mergeCommonObjects");
  LODWORD(v13) = -[HMObjectMergeCollection isModified](v10, "isModified");
  if ((_DWORD)v13)
  {
    -[HMObjectMergeCollection finalObjects](v10, "finalObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMActionSet currentActions](self, "currentActions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setArray:", v14);

  }
  -[HMActionSet name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToString:", v17);

  if ((v18 & 1) == 0)
  {
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMActionSet setName:](self, "setName:", v13);

    LOBYTE(v13) = 1;
  }
  -[HMActionSet applicationData](self, "applicationData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = HMFEqualObjects();

  if ((v21 & 1) == 0)
  {
    objc_msgSend(v4, "applicationData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMActionSet setApplicationData:](self, "setApplicationData:", v13);

    LOBYTE(v13) = 1;
  }

  return (char)v13;
}

- (id)encodeAsProtoBuf
{
  void *v3;
  HMPBActionSet *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  HMActionSet *v22;
  NSObject *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HMActionSet home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(HMPBActionSet);
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hm_convertToData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMPBActionSet setHomeUUID:](v4, "setHomeUUID:", v6);

    -[HMActionSet uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hm_convertToData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMPBActionSet setUuid:](v4, "setUuid:", v8);

    -[HMActionSet uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionSetWithUUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[HMActionSet name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMPBActionSet setName:](v4, "setName:", v11);

      -[HMActionSet actionSetType](self, "actionSetType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMPBActionSet setActionSetType:](v4, "setActionSetType:", v12);

      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[HMPBActionSet setActions:](v4, "setActions:", v13);

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[HMActionSet actions](self, "actions", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "encodeAsProtoBuf");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              -[HMPBActionSet actions](v4, "actions");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v19);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v16);
      }

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@home is nil while encoding ActionSet", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v4 = 0;
  }

  return v4;
}

- (BOOL)executionInProgress
{
  return self->_executionInProgress;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActions, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_lastExecutionDate, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __51__HMActionSet_mergeFromNewObjectForBuilderUpdates___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed action via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "_unconfigure");

}

void __51__HMActionSet_mergeFromNewObjectForBuilderUpdates___block_invoke_61(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added action via merge: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__configureWithContext:actionSet:", v8, *(_QWORD *)(a1 + 32));

}

void __34__HMActionSet_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed action via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "_unconfigure");

}

void __34__HMActionSet_mergeFromNewObject___block_invoke_59(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added action via merge: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__configureWithContext:actionSet:", v8, *(_QWORD *)(a1 + 32));

}

void __34__HMActionSet_mergeFromNewObject___block_invoke_60(id *a1)
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
  v6[2] = __34__HMActionSet_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E3AB5CD0;
  v7 = a1[5];
  v4 = a1[6];
  v5 = a1[4];
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMActionSet_mergeFromNewObject___block_invoke_3(id *a1)
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
  v6[2] = __34__HMActionSet_mergeFromNewObject___block_invoke_4;
  v6[3] = &unk_1E3AB5CD0;
  v7 = a1[5];
  v4 = a1[6];
  v5 = a1[4];
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __34__HMActionSet_mergeFromNewObject___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateNameForActionSet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __34__HMActionSet_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateActionsForActionSet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __60__HMActionSet__handleActionSetRenameFromPayload_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateNameForActionSet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __59__HMActionSet__handleActionUpdatedFromResponse_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateActionsForActionSet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __57__HMActionSet__doRemoveActionWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateActionsForActionSet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __42__HMActionSet__removeActionsForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home:didUpdateActionsForActionSet:", v3, *(_QWORD *)(a1 + 40));

}

void __55__HMActionSet__updateAction_changes_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
    v15 = 138544130;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Replace action value response : %@, completionHandler: %@ error %@", (uint8_t *)&v15, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (v5
    || !v6
    || objc_msgSend(v9, "_handleActionUpdatedFromResponse:completion:", v6, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v9, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", *(_QWORD *)(a1 + 32), v5);

  }
}

void __47__HMActionSet__removeAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v14 = 138544130;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove action response : %@, completionHandler: %@ error %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (v5
    || !v6
    || objc_msgSend(v9, "_handleActionRemovedFromPayload:completion:", v6, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "callCompletion:error:", *(_QWORD *)(a1 + 40), v5);

  }
}

uint64_t __46__HMActionSet_removeAction_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __44__HMActionSet__addAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Add action error: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Add action response: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kActionUUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_doAddAction:uuid:", *(_QWORD *)(a1 + 48), v12);
    objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", *(_QWORD *)(a1 + 56), 0);

  }
}

uint64_t __43__HMActionSet_addAction_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __45__HMActionSet__updateName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
    v15 = 138544130;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Rename actionSet response : %@, completionHandler: %@ error %@", (uint8_t *)&v15, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (v5
    || !v6
    || objc_msgSend(v9, "_handleActionSetRenameFromPayload:completion:", v6, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v9, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", *(_QWORD *)(a1 + 32), v5);

  }
}

void __44__HMActionSet_updateName_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "actionSetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("HMActionSetTypeTriggerOwned")))
  {

LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    objc_msgSend(v5, "callCompletion:error:", v6, v7);

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "actionSetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HMActionSetTypeShortcutsComponent"));

  if (v4)
    goto LABEL_4;
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (!v10)
  {
    objc_msgSend(v9, "context");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 20, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v9, "_updateName:completionHandler:", v10, *(_QWORD *)(a1 + 48));
}

void __46__HMActionSet_resetNameWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "actionSetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[HMActionSet isBuiltinActionSetType:](HMActionSet, "isBuiltinActionSetType:", v2);

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "_updateName:completionHandler:", 0, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v4, "context");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callCompletion:error:", v6, v7);

  }
}

uint64_t __35__HMActionSet_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "requiresDeviceUnlock");
  if ((_DWORD)result)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

+ (id)actionSetFromProtoBuf:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMActionSet *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMActionSet *v38;
  void *v39;
  void *v40;
  HMActionSet *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  int v49;
  __objc2_class *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HMActionSet *v59;
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_UUIDWithBytesAsData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if ((objc_msgSend(v6, "hasHomeUUID") & 1) != 0)
    {
      v11 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend(v6, "homeUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_UUIDWithBytesAsData:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v7, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v13);

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v7, "actionSetWithUUID:", v10);
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            objc_msgSend(v6, "actions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count");

            if (v19)
            {
              v20 = (void *)MEMORY[0x1A1AC1AAC]();
              v21 = a1;
              HMFGetOSLogHandle();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "formattedText");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v69 = v23;
                v70 = 2112;
                v71 = v10;
                v72 = 2112;
                v73 = v24;
                _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@actionSetFromProtoBuf found actionSet (%@) in home and actions in proto - ignoring proto: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v20);
            }
            v25 = v17;
LABEL_43:

            goto LABEL_44;
          }
          v60 = v13;
          v38 = [HMActionSet alloc];
          objc_msgSend(v6, "name");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "actionSetType");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v10;
          v41 = -[HMActionSet initWithName:type:uuid:](v38, "initWithName:type:uuid:", v39, v40, v10);

          v59 = v41;
          -[HMActionSet setHome:](v41, "setHome:", v7);
          v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v62 = v6;
          objc_msgSend(v6, "actions");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          if (!v44)
            goto LABEL_42;
          v45 = v44;
          v46 = *(_QWORD *)v64;
LABEL_26:
          v47 = 0;
          while (1)
          {
            if (*(_QWORD *)v64 != v46)
              objc_enumerationMutation(v43);
            v48 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v47);
            v49 = objc_msgSend(v48, "type");
            switch(v49)
            {
              case 3:
                v50 = HMLightProfileNaturalLightingAction;
                objc_msgSend(v48, "naturalLightingAction");
                v51 = objc_claimAutoreleasedReturnValue();
                break;
              case 2:
                v50 = HMMediaPlaybackAction;
                objc_msgSend(v48, "mediaPlaybackAction");
                v51 = objc_claimAutoreleasedReturnValue();
                break;
              case 1:
                v50 = HMCharacteristicWriteAction;
                objc_msgSend(v48, "characteristicWriteAction");
                v51 = objc_claimAutoreleasedReturnValue();
                break;
              default:
                goto LABEL_37;
            }
            v52 = (void *)v51;
            -[__objc2_class actionWithProtoBuf:home:](v50, "actionWithProtoBuf:home:", v51, v7);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v53)
            {
LABEL_37:
              v54 = (void *)MEMORY[0x1A1AC1AAC]();
              HMFGetOSLogHandle();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v69 = v56;
                v70 = 2112;
                v71 = v48;
                _os_log_impl(&dword_19B1B0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to create action with proto buf: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v54);
              goto LABEL_40;
            }
            objc_msgSend(v42, "addObject:", v53);

LABEL_40:
            if (v45 == ++v47)
            {
              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
              if (!v45)
              {
LABEL_42:

                -[HMActionSet currentActions](v59, "currentActions");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "addObjectsFromArray:", v42);

                v25 = v59;
                v10 = v61;
                v6 = v62;
                v13 = v60;
                goto LABEL_43;
              }
              goto LABEL_26;
            }
          }
        }
        v31 = (void *)MEMORY[0x1A1AC1AAC]();
        v32 = a1;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "uuid");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v69 = v36;
          v70 = 2112;
          v71 = v13;
          v72 = 2112;
          v73 = v37;
          _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Trying to deserialize HMActionSet with a different home %@ %@", buf, 0x20u);

        }
      }
      else
      {
        v31 = (void *)MEMORY[0x1A1AC1AAC]();
        v32 = a1;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v69 = v34;
          _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Home UUID", buf, 0xCu);

        }
      }

      objc_autoreleasePoolPop(v31);
      v25 = 0;
LABEL_44:

      goto LABEL_45;
    }
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = a1;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v29;
      v30 = "%{public}@homeUUID not set while decoding ActionSet";
      goto LABEL_15;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = a1;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v29;
      v30 = "%{public}@Couldn't decode ActionSet UUID";
LABEL_15:
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v26);
  v25 = 0;
LABEL_45:

  return v25;
}

+ (BOOL)isBuiltinActionSetType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HMActionSetTypeWakeUp")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HMActionSetTypeHomeDeparture")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HMActionSetTypeHomeArrival")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HMActionSetTypeSleep"));
  }

  return v4;
}

@end
