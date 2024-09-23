@implementation HMPresenceEvent

- (HMPresenceEvent)initWithPresenceType:(id)a3
{
  return -[HMPresenceEvent initWithPresenceType:users:](self, "initWithPresenceType:users:", a3, MEMORY[0x1E0C9AA60]);
}

- (HMPresenceEvent)initWithPresenceType:(id)a3 users:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  HMPresenceEvent *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("kEventUUIDKey");
  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMPresenceEvent initWithDict:presenceType:users:activationGranularity:](self, "initWithDict:presenceType:users:activationGranularity:", v10, v8, v7, 2);

  return v11;
}

- (HMPresenceEvent)initWithPresenceEventType:(HMPresenceEventType)presenceEventType presenceUserType:(HMPresenceEventUserType)presenceUserType
{
  return -[HMPresenceEvent initWithPresenceEventType:presenceUserType:users:](self, "initWithPresenceEventType:presenceUserType:users:", presenceEventType, presenceUserType, MEMORY[0x1E0C9AA60]);
}

- (HMPresenceEvent)initWithPresenceEventType:(unint64_t)a3 presenceUserType:(unint64_t)a4 users:(id)a5
{
  id v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMPresenceEvent *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  presenceTypeForEventTypeAndGranularity(a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (uint64_t *)((char *)&unk_19B44CD70 + 8 * a3 - 8);
  if (a3 - 1 >= 4)
    v10 = (uint64_t *)&kInvalidHMPresenceEventActivationGranularity;
  v11 = *v10;
  v16 = CFSTR("kEventUUIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMPresenceEvent initWithDict:presenceType:users:activationGranularity:](self, "initWithDict:presenceType:users:activationGranularity:", v13, v9, v8, v11);

  return v14;
}

- (HMPresenceEvent)initWithDict:(id)a3 presenceType:(id)a4 users:(id)a5 activationGranularity:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMPresenceEvent *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[HMPresenceEventActivation activationGranularityWithValue:](HMPresenceEventActivation, "activationGranularityWithValue:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMPresenceEvent initWithDict:presenceType:users:activation:](self, "initWithDict:presenceType:users:activation:", v12, v11, v10, v13);

  return v14;
}

- (HMPresenceEvent)initWithDict:(id)a3 presenceType:(id)a4 users:(id)a5 activation:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMPresenceEvent *v14;
  HMPresenceEvent *v15;
  uint64_t v16;
  HMMutableArray *observedUsers;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMPresenceEvent;
  v14 = -[HMEvent initWithDict:](&v19, sel_initWithDict_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_presenceType, a4);
    objc_storeStrong((id *)&v15->_activation, a6);
    +[HMMutableArray arrayWithArray:](HMMutableArray, "arrayWithArray:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    observedUsers = v15->_observedUsers;
    v15->_observedUsers = (HMMutableArray *)v16;

  }
  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[HMPresenceEvent presenceType](self, "presenceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMPresenceEvent users](self, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(v5, "appendString:", CFSTR(", "));
        objc_msgSend(v11, "userID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[HMPresenceEvent activation](self, "activation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("[Presence-Event: %@, mode: %@]"), v5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)presenceType
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_presenceType;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPresenceType:(id)a3
{
  NSString *v4;
  NSString *presenceType;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  presenceType = self->_presenceType;
  self->_presenceType = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (unint64_t)activationGranularity
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMPresenceEvent activation](self, "activation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "value");
  else
    v4 = 2;

  return v4;
}

- (HMPresenceEventActivation)activation
{
  os_unfair_lock_s *p_lock;
  HMPresenceEventActivation *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_activation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setActivation:(id)a3
{
  HMPresenceEventActivation *v4;
  HMPresenceEventActivation *activation;

  v4 = (HMPresenceEventActivation *)a3;
  os_unfair_lock_lock_with_options();
  activation = self->_activation;
  self->_activation = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMPresenceEventType)presenceEventType
{
  void *v3;
  HMPresenceEventType v4;

  -[HMPresenceEvent presenceType](self, "presenceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = eventTypeForPresenceTypeAndGranularity(v3, -[HMPresenceEvent activationGranularity](self, "activationGranularity"));

  return v4;
}

- (void)setPresenceEventType:(unint64_t)a3
{
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  id v8;

  presenceTypeForEventTypeAndGranularity(a3, -[HMPresenceEvent presenceUserType](self, "presenceUserType"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMPresenceEvent presenceUserType](self, "presenceUserType");
  if (a3 - 1 >= 4)
    v5 = (uint64_t *)&kInvalidHMPresenceEventActivationGranularity;
  else
    v5 = (uint64_t *)((char *)&unk_19B44CD70 + 8 * a3 - 8);
  v6 = *v5;
  -[HMPresenceEvent setPresenceType:](self, "setPresenceType:", v8);
  +[HMPresenceEventActivation activationGranularityWithValue:](HMPresenceEventActivation, "activationGranularityWithValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPresenceEvent setActivation:](self, "setActivation:", v7);

}

- (HMPresenceEventUserType)presenceUserType
{
  void *v3;
  HMPresenceEventUserType v4;

  -[HMPresenceEvent presenceType](self, "presenceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPresenceEvent activationGranularity](self, "activationGranularity");
  v4 = userTypeForPresenceTypeAndGranularity(v3);

  return v4;
}

- (void)setPresenceUserType:(unint64_t)a3
{
  HMPresenceEventType v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  id v8;

  presenceTypeForEventTypeAndGranularity(-[HMPresenceEvent presenceEventType](self, "presenceEventType"), a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[HMPresenceEvent presenceEventType](self, "presenceEventType");
  if (v4 - 1 >= 4)
    v5 = (uint64_t *)&kInvalidHMPresenceEventActivationGranularity;
  else
    v5 = (uint64_t *)((char *)&unk_19B44CD70 + 8 * v4 - 8);
  v6 = *v5;
  -[HMPresenceEvent setPresenceType:](self, "setPresenceType:", v8);
  +[HMPresenceEventActivation activationGranularityWithValue:](HMPresenceEventActivation, "activationGranularityWithValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPresenceEvent setActivation:](self, "setActivation:", v7);

}

- (id)users
{
  void *v2;
  void *v3;

  -[HMPresenceEvent observedUsers](self, "observedUsers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMPresenceEvent *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMPresenceEvent *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMPresenceEvent *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMPresenceEvent;
  -[HMEvent _updateFromDictionary:](&v25, sel__updateFromDictionary_, v4);
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kPresenceEventPresence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC](-[HMPresenceEvent setPresenceType:](self, "setPresenceType:", v5));
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v9;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating presence type to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  +[HMPresenceEventActivation activationGranularityWithDict:](HMPresenceEventActivation, "activationGranularityWithDict:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC](-[HMPresenceEvent setActivation:](self, "setActivation:", v10));
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating activation to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("kPresenceEventUsers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HMEvent eventTrigger](self, "eventTrigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMPresenceEvent presenceType](self, "presenceType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMPresenceEvent users:home:presenceType:](HMPresenceEvent, "users:home:presenceType:", v15, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v23;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating users list to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMPresenceEvent observedUsers](v21, "observedUsers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setArray:", v19);

  }
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)HMPresenceEvent;
  -[HMEvent _serializeForAdd](&v24, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMPresenceEvent presenceType](self, "presenceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kPresenceEventPresence"));

  -[HMPresenceEvent activation](self, "activation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addToPayload:", v4);

  -[HMPresenceEvent users](self, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[HMPresenceEvent users](self, "users", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }

    v17 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("kPresenceEventUsers"));

  }
  v18 = (void *)objc_msgSend(v4, "copy");

  return v18;
}

- (void)updatePresenceType:(id)a3 completionHandler:(id)a4
{
  char *v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMPresenceEvent *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMPresenceEvent *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMPresenceEvent *v25;
  NSObject *v26;
  void *v27;
  id v28;
  const __CFString *v29;
  char *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, void *))a4;
  -[HMEvent context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMPresenceEvent updatePresenceType:completionHandler:]", CFSTR("completion"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v27;
      v33 = 2112;
      v34 = (const char *)v23;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v9 = (void *)v8;
  if (v8)
  {
    if ((isValidPresenceType(v6) & 1) != 0)
    {
      -[HMPresenceEvent presenceType](self, "presenceType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v6);

      if (!v11)
      {
        v29 = CFSTR("kPresenceEventPresence");
        v30 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMEvent _updateEventWithPayload:completionHandler:](self, "_updateEventWithPayload:completionHandler:", v22, v7);

        goto LABEL_13;
      }
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v15;
        v33 = 2112;
        v34 = v6;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Presence type is already %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v9, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "callCompletion:error:", v7, 0);
    }
    else
    {
      objc_msgSend(v9, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "callCompletion:error:", v7, v21);

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
      v32 = v20;
      v33 = 2080;
      v34 = "-[HMPresenceEvent updatePresenceType:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);
  }

LABEL_13:
}

- (void)updateUsers:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  HMPresenceEvent *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HMPresenceEvent *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const __CFString *v54;
  void *v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const char *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMEvent context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMPresenceEvent updateUsers:completionHandler:]", CFSTR("completion"));
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
      v59 = v41;
      v60 = 2112;
      v61 = (const char *)v37;
      _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v37, 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }
  v9 = (void *)v8;
  if (!v8)
  {
    v31 = (void *)MEMORY[0x1A1AC1AAC]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v34;
      v60 = 2080;
      v61 = "-[HMPresenceEvent updateUsers:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v35);
    goto LABEL_25;
  }
  -[HMPresenceEvent presenceType](self, "presenceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = usersListApplicable(v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v9, "delegateCaller");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "callCompletion:error:", v7, 0);
LABEL_25:

    goto LABEL_29;
  }
  v44 = v9;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v45 = v6;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v15);
  }

  -[HMPresenceEvent users](self, "users");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v12, "count");
  if (v21 == objc_msgSend(v20, "count"))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v43 = v20;
    v22 = v20;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "uuid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "UUIDString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v12, "containsObject:", v28);

          if (!v29)
          {

            v20 = v43;
            goto LABEL_27;
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        if (v24)
          continue;
        break;
      }
    }

    v9 = v44;
    objc_msgSend(v44, "delegateCaller");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "callCompletion:error:", v7, 0);
    v6 = v45;
    v20 = v43;
  }
  else
  {
LABEL_27:
    v54 = CFSTR("kPresenceEventUsers");
    objc_msgSend(v12, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEvent _updateEventWithPayload:completionHandler:](self, "_updateEventWithPayload:completionHandler:", v36, v7);

    v9 = v44;
    v6 = v45;
  }

LABEL_29:
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  HMObjectMergeCollection *v17;
  void *v18;
  void *v19;
  void *v20;
  HMObjectMergeCollection *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[5];
  _QWORD v32[5];
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HMPresenceEvent;
  v5 = -[HMEvent mergeFromNewObject:](&v33, sel_mergeFromNewObject_, v4);
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMPresenceEvent presenceType](self, "presenceType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presenceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v8, "presenceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMPresenceEvent setPresenceType:](self, "setPresenceType:", v12);

      v5 = 1;
    }
    -[HMPresenceEvent activation](self, "activation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HMFEqualObjects();

    if ((v15 & 1) == 0)
    {
      objc_msgSend(v8, "activation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMPresenceEvent setActivation:](self, "setActivation:", v16);

      v5 = 1;
    }
    v17 = [HMObjectMergeCollection alloc];
    -[HMPresenceEvent observedUsers](self, "observedUsers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "users");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v17, "initWithCurrentObjects:newObjects:", v19, v20);

    -[HMObjectMergeCollection removedObjects](v21, "removedObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __38__HMPresenceEvent_mergeFromNewObject___block_invoke;
    v32[3] = &unk_1E3AB4198;
    v32[4] = self;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v32);

    -[HMEvent eventTrigger](self, "eventTrigger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "users");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMObjectMergeCollection replaceAddedObjectsWithObjects:](v21, "replaceAddedObjectsWithObjects:", v26);

    -[HMObjectMergeCollection addedObjects](v21, "addedObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v23;
    v31[1] = 3221225472;
    v31[2] = __38__HMPresenceEvent_mergeFromNewObject___block_invoke_28;
    v31[3] = &unk_1E3AB4198;
    v31[4] = self;
    objc_msgSend(v27, "enumerateObjectsUsingBlock:", v31);

    if (-[HMObjectMergeCollection isModified](v21, "isModified"))
    {
      -[HMObjectMergeCollection finalObjects](v21, "finalObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMPresenceEvent observedUsers](self, "observedUsers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setArray:", v28);

      v5 = 1;
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMPresenceEvent *v4;
  HMPresenceEventType v5;
  HMPresenceEventUserType v6;
  void *v7;
  HMPresenceEvent *v8;

  v4 = [HMPresenceEvent alloc];
  v5 = -[HMPresenceEvent presenceEventType](self, "presenceEventType");
  v6 = -[HMPresenceEvent presenceUserType](self, "presenceUserType");
  -[HMPresenceEvent users](self, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMPresenceEvent initWithPresenceEventType:presenceUserType:users:](v4, "initWithPresenceEventType:presenceUserType:users:", v5, v6, v7);

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutablePresenceEvent *v4;
  HMPresenceEventType v5;
  HMPresenceEventUserType v6;
  void *v7;
  HMMutablePresenceEvent *v8;

  v4 = [HMMutablePresenceEvent alloc];
  v5 = -[HMPresenceEvent presenceEventType](self, "presenceEventType");
  v6 = -[HMPresenceEvent presenceUserType](self, "presenceUserType");
  -[HMPresenceEvent users](self, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMPresenceEvent initWithPresenceEventType:presenceUserType:users:](v4, "initWithPresenceEventType:presenceUserType:users:", v5, v6, v7);

  return v8;
}

- (HMPresenceEvent)initWithCoder:(id)a3
{
  id v4;
  HMPresenceEvent *v5;
  uint64_t v6;
  NSString *presenceType;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMMutableArray *observedUsers;
  uint64_t v14;
  HMPresenceEventActivation *activation;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMPresenceEvent;
  v5 = -[HMEvent initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPresenceEventPresence"));
    v6 = objc_claimAutoreleasedReturnValue();
    presenceType = v5->_presenceType;
    v5->_presenceType = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kPresenceEventUsers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMutableArray array](HMMutableArray, "array");
    v12 = objc_claimAutoreleasedReturnValue();
    observedUsers = v5->_observedUsers;
    v5->_observedUsers = (HMMutableArray *)v12;

    -[HMMutableArray setArray:](v5->_observedUsers, "setArray:", v11);
    +[HMPresenceEventActivation activationGranularityWithCoder:](HMPresenceEventActivation, "activationGranularityWithCoder:", v4);
    v14 = objc_claimAutoreleasedReturnValue();
    activation = v5->_activation;
    v5->_activation = (HMPresenceEventActivation *)v14;

  }
  return v5;
}

- (HMMutableArray)observedUsers
{
  return self->_observedUsers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedUsers, 0);
  objc_storeStrong((id *)&self->_activation, 0);
  objc_storeStrong((id *)&self->_presenceType, 0);
}

void __38__HMPresenceEvent_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed user via presence event merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __38__HMPresenceEvent_mergeFromNewObject___block_invoke_28(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added user via presence event merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

+ (BOOL)isSupportedForHome:(id)a3
{
  return +[HMEvent sharedTriggerActivationSupportedForHome:](HMEvent, "sharedTriggerActivationSupportedForHome:", a3);
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMPresenceEvent *v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kPresenceEventPresence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("kPresenceEventUsers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMPresenceEvent users:home:presenceType:](HMPresenceEvent, "users:home:presenceType:", v8, v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMPresenceEventActivation activationGranularityWithDict:](HMPresenceEventActivation, "activationGranularityWithDict:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMPresenceEvent initWithDict:presenceType:users:activation:]([HMPresenceEvent alloc], "initWithDict:presenceType:users:activation:", v6, v7, v9, v10);

  return v11;
}

+ (id)users:(id)a3 home:(id)a4 presenceType:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((usersListApplicable(v9) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v28 = v9;
      v29 = v8;
      objc_msgSend(v8, "users");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v31 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v16, "uuid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "UUIDString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v7, "containsObject:", v18);

            if (v19)
              objc_msgSend(v10, "addObject:", v16);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v13);
      }
      v8 = v29;
      objc_msgSend(v29, "currentUser");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v7, "containsObject:", v22);

      if (v23)
        objc_msgSend(v10, "addObject:", v20);

      v9 = v28;
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v26;
      v37 = 2112;
      v38 = v9;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@Presence type %@ does not apply for users", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
