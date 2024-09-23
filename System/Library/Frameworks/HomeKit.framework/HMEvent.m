@implementation HMEvent

- (HMEvent)initWithDict:(id)a3
{
  id v4;
  HMEvent *v5;
  void *v6;
  uint64_t v7;
  NSUUID *uuid;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMEvent;
  v5 = -[HMEvent init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("kEventUUIDKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v7;

    v5->_endEvent = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("kEventTriggerEndEvent"));
    -[HMEvent _updateTriggerType](v5, "_updateTriggerType");

  }
  return v5;
}

- (void)_unconfigureContext
{
  void *v3;
  _HMContext *context;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  HMEvent *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
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
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring event", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMEvent setEventTrigger:](v5, "setEventTrigger:", 0);
    -[HMEvent _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)__configureWithContext:(id)a3 eventTrigger:(id)a4
{
  id v7;

  v7 = a3;
  -[HMEvent setEventTrigger:](self, "setEventTrigger:", a4);
  if (v7)
    objc_storeStrong((id *)&self->_context, a3);

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMEvent uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMEvent *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMEvent *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMEvent uuid](v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMEvent uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
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

- (HMEventTrigger)eventTrigger
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventTrigger);
  os_unfair_lock_unlock(p_lock);
  return (HMEventTrigger *)WeakRetained;
}

- (void)setEventTrigger:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_eventTrigger, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_updateTriggerType
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeCharacteristicEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeLocationEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeCalendarEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeSignificantTimeEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeDurationEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypeCharacteristicThresholdRangeEventKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_triggerType, CFSTR("kEventTriggerTypePresenceEventKey"));
}

- (void)_updateEventWithPayload:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMEvent *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  HMEvent *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMEvent context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMEvent uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__HMEvent__updateEventWithPayload_completionHandler___block_invoke;
    v15[3] = &unk_1E3AB60C8;
    v16 = v8;
    v17 = self;
    v18 = v7;
    -[_HMContext sendMessage:target:payload:responseHandler:](v16, CFSTR("kEventTriggerUpdateEventRequestKey"), v9, v6, v15);

    v10 = v16;
LABEL_7:

    goto LABEL_8;
  }
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2080;
    v22 = "-[HMEvent _updateEventWithPayload:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
    goto LABEL_7;
  }
LABEL_8:

}

- (HMEvent)initWithCoder:(id)a3
{
  id v4;
  HMEvent *v5;
  uint64_t v6;
  NSUUID *uuid;
  void *v8;

  v4 = a3;
  v5 = -[HMEvent init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "hm_decodeAndCacheUUIDFromStringForKey:", CFSTR("HM.eventIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_endEvent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kEventTriggerEndEvent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.eventTrigger"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_eventTrigger, v8);

    -[HMEvent _updateTriggerType](v5, "_updateTriggerType");
  }

  return v5;
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("kEventUUIDKey");
  -[HMEvent uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("kEventTriggerEndEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMEvent isEndEvent](self, "isEndEvent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("kEventTriggerTypeKey");
  -[HMEvent triggerType](self, "triggerType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return 0;
}

- (HMEvent)init
{
  void *v3;
  void *v4;
  HMEvent *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kEventUUIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMEvent initWithDict:](self, "initWithDict:", v4);

  return v5;
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isEndEvent
{
  return self->_endEvent;
}

- (void)setEndEvent:(BOOL)a3
{
  self->_endEvent = a3;
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_eventTrigger);
}

void __53__HMEvent__updateEventWithPayload_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateFromDictionary:", a3);
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 0;
  }
  objc_msgSend(v5, "callCompletion:error:", v7, v8);

}

+ (BOOL)isSupportedForHome:(HMHome *)home
{
  return 1;
}

+ (BOOL)sharedTriggerActivationSupportedForHome:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "residentDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "capabilities") & 8) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (HMEvent)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HMEvent;
  return (HMEvent *)objc_msgSendSuper2(&v3, "new");
}

@end
