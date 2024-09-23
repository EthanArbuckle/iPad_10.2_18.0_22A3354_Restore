@implementation HMEventTrigger

- (HMEventTrigger)initWithName:(NSString *)name events:(NSArray *)events endEvents:(NSArray *)endEvents recurrences:(NSArray *)recurrences predicate:(NSPredicate *)predicate
{
  NSString *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  NSPredicate *v16;
  NSPredicate *v17;
  HMEventTrigger *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v12 = name;
  v13 = events;
  v14 = endEvents;
  v15 = recurrences;
  v16 = predicate;
  if (!v13
    || (v17 = v16, !+[HMEventTrigger __validateRecurrences:](HMEventTrigger, "__validateRecurrences:", v15))|| !+[HMPredicateUtilities validatePredicate:](HMPredicateUtilities, "validatePredicate:", v17))
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmStringFromErrorCode:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v23);
  }
  v18 = -[HMEventTrigger initInternalWithName:configuredName:events:endEvents:recurrences:predicate:](self, "initInternalWithName:configuredName:events:endEvents:recurrences:predicate:", v12, v12, v13, v14, v15, v17);

  return v18;
}

- (id)initInternalWithName:(id)a3 configuredName:(id)a4 events:(id)a5 endEvents:(id)a6 recurrences:(id)a7 predicate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMEventTrigger *v18;
  uint64_t v19;
  HMMutableArray *currentEvents;
  uint64_t v21;
  NSPredicate *internalPredicate;
  uint64_t v23;
  NSArray *recurrences;
  objc_super v26;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMEventTrigger;
  v18 = -[HMTrigger initWithName:configuredName:](&v26, sel_initWithName_configuredName_, a3, a4);
  if (v18)
  {
    +[HMMutableArray arrayWithArray:](HMMutableArray, "arrayWithArray:", v14);
    v19 = objc_claimAutoreleasedReturnValue();
    currentEvents = v18->_currentEvents;
    v18->_currentEvents = (HMMutableArray *)v19;

    -[HMMutableArray addObjectsFromArray:](v18->_currentEvents, "addObjectsFromArray:", v15);
    v21 = objc_msgSend(v17, "copy");
    internalPredicate = v18->_internalPredicate;
    v18->_internalPredicate = (NSPredicate *)v21;

    v23 = objc_msgSend(v16, "copy");
    recurrences = v18->_recurrences;
    v18->_recurrences = (NSArray *)v23;

    v18->_activationState = 0;
  }

  return v18;
}

- (HMEventTrigger)initWithName:(NSString *)name events:(NSArray *)events predicate:(NSPredicate *)predicate
{
  return -[HMEventTrigger initWithName:events:endEvents:recurrences:predicate:](self, "initWithName:events:endEvents:recurrences:predicate:", name, events, 0, 0, predicate);
}

- (HMEventTrigger)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMEventTrigger *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *recurrences;
  uint64_t v14;
  NSPredicate *internalPredicate;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  HMMutableArray *currentEvents;
  int v30;
  HMEventTrigger *v31;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)HMEventTrigger;
  v8 = -[HMTrigger initWithDictionary:home:](&v40, sel_initWithDictionary_home_, v6, v7);
  if (!v8)
  {
LABEL_22:
    v31 = v8;
    goto LABEL_23;
  }
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kEventTriggerRecurrencesKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "unsignedIntegerValue");
    if (v11 == 127)
      goto LABEL_7;
    HMDaysOfTheWeekToDateComponents(v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "arrayOfDateComponentsFromDataForKey:", CFSTR("kEventTriggerRecurrencesKey"));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  recurrences = v8->_recurrences;
  v8->_recurrences = (NSArray *)v12;

LABEL_7:
  *(&v8->_executeOnce + 4) = objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kEventTriggerExecuteOnce"));
  objc_msgSend(v6, "predicateFromDataForKey:", CFSTR("kEventTriggerConditionKey"));
  v14 = objc_claimAutoreleasedReturnValue();
  internalPredicate = v8->_internalPredicate;
  v8->_internalPredicate = (NSPredicate *)v14;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_arrayForKey:ofClasses:", CFSTR("kEventTriggerEventsKey"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEventTrigger _eventsWithDictionaries:home:](v8, v17, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "hmf_arrayForKey:ofClasses:", CFSTR("kEventTriggerEndEventsKey"), v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger _eventsWithDictionaries:home:](v8, v19, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v34 = v16;
      v35 = v10;
      v21 = (void *)objc_msgSend(v18, "mutableCopy");
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v33 = v20;
      v22 = v20;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v37 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v27, "setEndEvent:", 1);
            objc_msgSend(v21, "addObject:", v27);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v24);
      }

      +[HMMutableArray arrayWithArray:](HMMutableArray, "arrayWithArray:", v21);
      v28 = objc_claimAutoreleasedReturnValue();
      currentEvents = v8->_currentEvents;
      v8->_currentEvents = (HMMutableArray *)v28;

      v30 = 0;
      v16 = v34;
      v10 = v35;
      v20 = v33;
    }
    else
    {
      v30 = 1;
    }

  }
  else
  {
    v30 = 1;
  }

  if (!v30)
    goto LABEL_22;
  v31 = 0;
LABEL_23:

  return v31;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMEventTrigger;
  -[HMTrigger __configureWithContext:home:](&v16, sel___configureWithContext_home_, v6, a4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMEventTrigger allEvents](self, "allEvents", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "__configureWithContext:eventTrigger:", v6, self);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (NSArray)events
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMEventTrigger currentEvents](self, "currentEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEndEvent") & 1) == 0)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSArray)endEvents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMEventTrigger currentEvents](self, "currentEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEndEvent"))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSArray)allEvents
{
  void *v2;
  void *v3;

  -[HMEventTrigger currentEvents](self, "currentEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSPredicate)predicate
{
  void *v3;
  void *v4;
  void *v5;

  -[HMEventTrigger internalPredicate](self, "internalPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMTrigger home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMPredicateUtilities rewritePredicateForClient:home:](HMPredicateUtilities, "rewritePredicateForClient:home:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v5;
}

- (NSPredicate)internalPredicate
{
  os_unfair_lock_s *p_lock;
  NSPredicate *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_internalPredicate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInternalPredicate:(id)a3
{
  NSPredicate *v4;
  NSPredicate *internalPredicate;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSPredicate *)objc_msgSend(v6, "copy");
  internalPredicate = self->_internalPredicate;
  self->_internalPredicate = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSArray)recurrences
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_recurrences;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRecurrences:(id)a3
{
  NSArray *v4;
  NSArray *recurrences;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  recurrences = self->_recurrences;
  self->_recurrences = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (BOOL)executeOnce
{
  HMEventTrigger *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_executeOnce + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExecuteOnce:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->_executeOnce + 4) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)activationState
{
  os_unfair_lock_s *p_lock;
  unint64_t activationState;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  activationState = self->_activationState;
  os_unfair_lock_unlock(p_lock);
  return activationState;
}

- (void)setActivationState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_activationState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)addEvent:(HMEvent *)event completionHandler:(void *)completion
{
  HMEvent *v6;
  void (**v7)(void *, uint64_t);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMEventTrigger *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMEventTrigger *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD block[5];
  HMEvent *v24;
  void (**v25)(void *, uint64_t);
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = event;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMEventTrigger addEvent:completionHandler:]", CFSTR("completion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2112;
      v29 = (const char *)v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v9 = v8;
  if (!v8)
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
      v27 = v14;
      v28 = 2080;
      v29 = "-[HMEventTrigger addEvent:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 3, 0);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v16 = (void *)v15;
    v7[2](v7, v15);

    goto LABEL_10;
  }
  objc_msgSend(v8, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMEventTrigger_addEvent_completionHandler___block_invoke;
  block[3] = &unk_1E3AB5C58;
  block[4] = self;
  v24 = v6;
  v25 = v7;
  dispatch_async(v10, block);

LABEL_10:
}

- (void)_addEvent:(id)a3 completionHandler:(id)a4
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMEventTrigger *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  id v34;
  _BYTE *v35;
  id v36;
  id location;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "_serializeForAdd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (v10)
    {
      v42 = CFSTR("kEventTriggerEventsKey");
      v11 = (void *)objc_msgSend(v10, "copy");
      v43[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMTrigger context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0D285F8];
        v15 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMTrigger uuid](self, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);
        objc_msgSend(v14, "messageWithName:destination:payload:", CFSTR("kAddEventToEventTriggerRequestKey"), v17, v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v39 = __Block_byref_object_copy__14589;
        v40 = __Block_byref_object_dispose__14590;
        v41 = v6;
        objc_initWeak(&location, self);
        v30 = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __46__HMEventTrigger__addEvent_completionHandler___block_invoke;
        v33 = &unk_1E3AAF6B0;
        objc_copyWeak(&v36, &location);
        v34 = v7;
        v35 = buf;
        objc_msgSend(v18, "setResponseHandler:", &v30);
        objc_msgSend(v13, "messageDispatcher", v30, v31, v32, v33);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sendMessage:completionHandler:", v18, 0);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v26 = (void *)MEMORY[0x1A1AC1AAC]();
        v27 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[HMEventTrigger _addEvent:completionHandler:]";
          _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
      }

    }
    else
    {
      -[HMTrigger context](self, "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "delegateCaller");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 3, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "callCompletion:error:", v7, v25);

    }
  }
  else
  {
    -[HMTrigger context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "delegateCaller");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "callCompletion:error:", v7, v22);

  }
}

- (void)removeEvent:(HMEvent *)event completionHandler:(void *)completion
{
  HMEvent *v6;
  void (**v7)(void *, uint64_t);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMEventTrigger *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMEventTrigger *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD block[5];
  HMEvent *v24;
  void (**v25)(void *, uint64_t);
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = event;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMEventTrigger removeEvent:completionHandler:]", CFSTR("completion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2112;
      v29 = (const char *)v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v9 = v8;
  if (!v8)
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
      v27 = v14;
      v28 = 2080;
      v29 = "-[HMEventTrigger removeEvent:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 3, 0);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v16 = (void *)v15;
    v7[2](v7, v15);

    goto LABEL_10;
  }
  objc_msgSend(v8, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HMEventTrigger_removeEvent_completionHandler___block_invoke;
  block[3] = &unk_1E3AB5C58;
  block[4] = self;
  v24 = v6;
  v25 = v7;
  dispatch_async(v10, block);

LABEL_10:
}

- (void)_removeEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
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
  HMEventTrigger *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31;
  _BYTE location[12];
  __int16 v33;
  const char *v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v35 = CFSTR("kEventUUIDKey");
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMTrigger context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0D285F8];
      v14 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMTrigger uuid](self, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);
      objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("kRemoveEventFromEventTriggerRequestKey"), v16, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)location, self);
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __49__HMEventTrigger__removeEvent_completionHandler___block_invoke;
      v29 = &unk_1E3AB4AE0;
      objc_copyWeak(&v31, (id *)location);
      v30 = v7;
      objc_msgSend(v17, "setResponseHandler:", &v26);
      objc_msgSend(v12, "messageDispatcher", v26, v27, v28, v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sendMessage:completionHandler:", v17, 0);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v25;
        v33 = 2080;
        v34 = "-[HMEventTrigger _removeEvent:completionHandler:]";
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }

  }
  else
  {
    -[HMTrigger context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:error:", v7, v21);

  }
}

- (void)updateEvents:(NSArray *)events completionHandler:(void *)completion
{
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMEventTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMEventTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSArray *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = events;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMEventTrigger updateEvents:completionHandler:]", CFSTR("completion"));
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
    block[2] = __49__HMEventTrigger_updateEvents_completionHandler___block_invoke;
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
      v28 = "-[HMEventTrigger updateEvents:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)updateEndEvents:(NSArray *)endEvents completionHandler:(void *)completion
{
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMEventTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMEventTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSArray *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = endEvents;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMEventTrigger updateEndEvents:completionHandler:]", CFSTR("completion"));
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
    block[2] = __52__HMEventTrigger_updateEndEvents_completionHandler___block_invoke;
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
      v28 = "-[HMEventTrigger updateEndEvents:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateEvents:(id)a3 endEvent:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
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
  HMEventTrigger *val;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD *v44;
  id v45;
  id location;
  _QWORD v47[5];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[2];
  _QWORD v58[2];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v6 = a4;
  v61 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  val = self;
  v39 = a5;
  -[HMTrigger home](self, "home");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v41, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v9 = v41;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v54 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "copy");
          objc_msgSend(v8, "addObject:", v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v50;
      while (2)
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v50 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "_serializeForAdd");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v19, "mutableCopy");

          if (!v20)
          {
            -[HMTrigger context](val, "context");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "delegateCaller");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 3, 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "callCompletion:error:", v39, v34);

            v25 = v15;
            goto LABEL_19;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("kEventTriggerEndEvent"));

          v22 = (void *)objc_msgSend(v20, "copy");
          objc_msgSend(v14, "addObject:", v22);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        if (v16)
          continue;
        break;
      }
    }

    v57[0] = CFSTR("kEventTriggerEventsKey");
    v23 = (void *)objc_msgSend(v14, "copy");
    v57[1] = CFSTR("kEventTriggerEndEvent");
    v58[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0D285F8];
    v27 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMTrigger uuid](val, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithTarget:", v28);
    objc_msgSend(v26, "messageWithName:destination:payload:", CFSTR("kUpdateEventsToEventTriggerRequestKey"), v29, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = __Block_byref_object_copy__14589;
    v47[4] = __Block_byref_object_dispose__14590;
    v48 = v15;
    objc_initWeak(&location, val);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __59__HMEventTrigger__updateEvents_endEvent_completionHandler___block_invoke;
    v42[3] = &unk_1E3AAF6B0;
    objc_copyWeak(&v45, &location);
    v43 = v39;
    v44 = v47;
    objc_msgSend(v30, "setResponseHandler:", v42);
    -[HMTrigger context](val, "context");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "messageDispatcher");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sendMessage:completionHandler:", v30, 0);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    _Block_object_dispose(v47, 8);

LABEL_19:
  }
  else
  {
    -[HMTrigger context](self, "context");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "delegateCaller");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "callCompletion:error:", v39, v37);

  }
}

- (void)_updateCharacteristicReference
{
  HMEventTrigger *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;
  uint64_t i;
  char *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  char **v18;
  void *v19;
  HMEventTrigger *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v2 = self;
  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic references in the events and predicate", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HMEventTrigger allEvents](v2, "allEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v10 = &selRef__handleUpdateProfileState_;
    v23 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v12 = v10[57];
        v13 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v13, "conformsToProtocol:", v12))
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15
          && !-[HMEventTrigger _updateCharacteristicReferenceInNewEvent:](v2, "_updateCharacteristicReferenceInNewEvent:", v15))
        {
          v16 = (void *)MEMORY[0x1A1AC1AAC]();
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = v10;
            v19 = v6;
            v20 = v2;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v29 = v21;
            v30 = 2112;
            v31 = v22;
            _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Failed to update the characteristic reference for event %@", buf, 0x16u);

            v2 = v20;
            v6 = v19;
            v10 = v18;
            v9 = v23;
          }

          objc_autoreleasePoolPop(v16);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

}

- (void)updatePredicate:(NSPredicate *)predicate completionHandler:(void *)completion
{
  NSPredicate *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMEventTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMEventTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSPredicate *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = predicate;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMEventTrigger updatePredicate:completionHandler:]", CFSTR("completion"));
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
    block[2] = __52__HMEventTrigger_updatePredicate_completionHandler___block_invoke;
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
      v28 = "-[HMEventTrigger updatePredicate:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updatePredicate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMEventTrigger *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31;
  _BYTE location[12];
  __int16 v33;
  const char *v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[HMTrigger context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v6)
  {
    if (+[HMPredicateUtilities validatePredicate:](HMPredicateUtilities, "validatePredicate:", v6))
    {
      location[0] = 0;
      +[HMPredicateUtilities rewritePredicateForDaemon:characteristicIsInvalid:](HMPredicateUtilities, "rewritePredicateForDaemon:characteristicIsInvalid:", v6, location);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v35 = CFSTR("kEventTriggerConditionKey");
        encodeRootObject(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
      goto LABEL_11;
    }
    -[HMTrigger context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 3, 0);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v14 = (void *)v13;
    objc_msgSend(v12, "callCompletion:error:", v7, v13);

    goto LABEL_17;
  }
  v9 = 0;
LABEL_11:
  -[HMTrigger context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0D285F8];
    v17 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMTrigger uuid](self, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);
    objc_msgSend(v16, "messageWithName:destination:payload:", CFSTR("kUpdateEventTriggerConditionRequestKey"), v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __53__HMEventTrigger__updatePredicate_completionHandler___block_invoke;
    v29 = &unk_1E3AB4AE0;
    objc_copyWeak(&v31, (id *)location);
    v30 = v7;
    objc_msgSend(v20, "setResponseHandler:", &v26);
    objc_msgSend(v15, "messageDispatcher", v26, v27, v28, v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendMessage:completionHandler:", v20, 0);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v25;
      v33 = 2080;
      v34 = "-[HMEventTrigger _updatePredicate:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
  }

  v6 = v9;
LABEL_17:

}

- (void)updateRecurrences:(NSArray *)recurrences completionHandler:(void *)completion
{
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMEventTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMEventTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSArray *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = recurrences;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMEventTrigger updateRecurrences:completionHandler:]", CFSTR("completion"));
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
    block[2] = __54__HMEventTrigger_updateRecurrences_completionHandler___block_invoke;
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
      v28 = "-[HMEventTrigger updateRecurrences:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateRecurrences:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMEventTrigger *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  id v31;
  id v32;
  _BYTE location[12];
  __int16 v34;
  const char *v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[HMTrigger context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v6)
  {
    if (+[HMEventTrigger __validateRecurrences:](HMEventTrigger, "__validateRecurrences:", v6))
    {
      encodeRootObject(v6);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
      {
        v36 = CFSTR("kEventTriggerRecurrencesKey");
        v37[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_12;
    }
    -[HMTrigger context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 3, 0);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v15 = (void *)v14;
    objc_msgSend(v13, "callCompletion:error:", v7, v14);

    goto LABEL_18;
  }
  v11 = 0;
LABEL_12:
  -[HMTrigger context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0D285F8];
    v18 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMTrigger uuid](self, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);
    objc_msgSend(v17, "messageWithName:destination:payload:", CFSTR("kUpdateEventTriggerRecurrencesRequestKey"), v20, v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __55__HMEventTrigger__updateRecurrences_completionHandler___block_invoke;
    v30 = &unk_1E3AB4AE0;
    objc_copyWeak(&v32, (id *)location);
    v31 = v7;
    objc_msgSend(v21, "setResponseHandler:", &v27);
    objc_msgSend(v16, "messageDispatcher", v27, v28, v29, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendMessage:completionHandler:", v21, 0);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)location);

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
      v34 = 2080;
      v35 = "-[HMEventTrigger _updateRecurrences:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
  }

LABEL_18:
}

- (void)updateExecuteOnce:(BOOL)executeOnce completionHandler:(void *)completion
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMEventTrigger *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMEventTrigger *v17;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMEventTrigger updateExecuteOnce:completionHandler:]", CFSTR("completion"));
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
    block[2] = __54__HMEventTrigger_updateExecuteOnce_completionHandler___block_invoke;
    block[3] = &unk_1E3AB15D0;
    block[4] = self;
    v23 = executeOnce;
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
      v27 = "-[HMEventTrigger updateExecuteOnce:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v6 + 2))(v6, v14);

  }
}

- (void)_updateExecuteOnce:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMEventTrigger *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  id v29;
  const __CFString *v30;
  void *v31;
  _BYTE location[12];
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMTrigger home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v30 = CFSTR("kEventTriggerExecuteOnce");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0D285F8];
      v13 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMTrigger uuid](self, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);
      objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("kUpdateEventTriggerExecuteOnceRequestKey"), v15, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)location, self);
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __55__HMEventTrigger__updateExecuteOnce_completionHandler___block_invoke;
      v27 = &unk_1E3AB4AE0;
      objc_copyWeak(&v29, (id *)location);
      v28 = v6;
      objc_msgSend(v16, "setResponseHandler:", &v24);
      objc_msgSend(v9, "messageDispatcher", v24, v25, v26, v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sendMessage:completionHandler:", v16, 0);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)location);

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
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v23;
        v33 = 2080;
        v34 = "-[HMEventTrigger _updateExecuteOnce:completionHandler:]";
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
  else
  {
    objc_msgSend(v8, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "callCompletion:error:", v6, v19);

  }
}

- (void)_removeEventsForAccessory:(id)a3
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
  HMEventTrigger *v26;
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
  -[HMEventTrigger allEvents](self, "allEvents");
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

  -[HMEventTrigger currentEvents](self, "currentEvents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectsInArray:", v21);

  -[HMTrigger home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMTrigger context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __44__HMEventTrigger__removeEventsForAccessory___block_invoke;
    v24[3] = &unk_1E3AB5ED8;
    v25 = v18;
    v26 = self;
    objc_msgSend(v20, "invokeBlock:", v24);

  }
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
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
  void *v24;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v31.receiver = self;
  v31.super_class = (Class)HMEventTrigger;
  -[HMTrigger _serializeForAdd](&v31, sel__serializeForAdd);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HMEventTrigger events](self, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "_serializeForAdd");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kEventTriggerTypeKey"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v6, "addObject:", v14);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("kEventTriggerEventsKey"));

  -[HMEventTrigger internalPredicate](self, "internalPredicate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v26 = 0;
    -[HMEventTrigger predicate](self, "predicate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMPredicateUtilities rewritePredicateForDaemon:characteristicIsInvalid:](HMPredicateUtilities, "rewritePredicateForDaemon:characteristicIsInvalid:", v18, &v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    encodeRootObject(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("kEventTriggerConditionKey"));

  }
  -[HMEventTrigger recurrences](self, "recurrences");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[HMEventTrigger recurrences](self, "recurrences");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("kEventTriggerRecurrencesKey"));

  }
  v24 = (void *)objc_msgSend(v5, "copy");

  return v24;
}

- (void)_registerNotificationHandlers
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMEventTrigger;
  -[HMTrigger _registerNotificationHandlers](&v5, sel__registerNotificationHandlers);
  -[HMTrigger context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("kEventTriggerActivationStateNotificationKey"), self, sel_handleActivationStateNotification_);

}

- (void)_handleAddEventFromResponse:(id)a3 newEventPayload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v18 = v6;
  if (v18)
  {
    objc_msgSend(v18, "setEndEvent:", objc_msgSend(v7, "hmf_BOOLForKey:", CFSTR("kEventTriggerEndEvent")));
    v8 = v18;
  }
  else
  {
    -[HMTrigger home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger addedEvent:home:](self, v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_11;
  }
  v10 = v8;
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EE40E448);
  if (v11)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  if (!v11
    || (v14 = -[HMEventTrigger _updateCharacteristicReferenceInNewEvent:](self, "_updateCharacteristicReferenceInNewEvent:", v10), v15 = v10, v14))
  {
    -[HMEventTrigger currentEvents](self, "currentEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "replaceObject:", v10);

    -[HMTrigger context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__configureWithContext:eventTrigger:", v17, self);

    v15 = v13;
  }

LABEL_11:
}

- (void)_updateEventsFromResponse:(id)a3 responsePayload:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  v7 = objc_msgSend(v31, "hmf_BOOLForKey:", CFSTR("kEventTriggerEndEvent"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[HMEventTrigger currentEvents](self, "currentEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if ((_DWORD)v7 == objc_msgSend(v14, "isEndEvent"))
        {
          -[HMEventTrigger currentEvents](self, "currentEvents");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObject:", v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v11);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        -[HMEventTrigger currentEvents](self, "currentEvents");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "replaceObject:", v21);

        objc_msgSend(v21, "setEndEvent:", v7);
        -[HMTrigger context](self, "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "__configureWithContext:eventTrigger:", v23, self);

        v24 = v21;
        if (objc_msgSend(v24, "conformsToProtocol:", &unk_1EE40E448))
          v25 = v24;
        else
          v25 = 0;
        v26 = v25;

        if (v26
          && !-[HMEventTrigger _updateCharacteristicReferenceInNewEvent:](self, "_updateCharacteristicReferenceInNewEvent:", v26))
        {

          goto LABEL_26;
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      if (v18)
        continue;
      break;
    }
  }

  v27 = (void *)MEMORY[0x1A1AC1AAC]();
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger allEvents](self, "allEvents");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v29;
    v42 = 2112;
    v43 = v30;
    _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@handleEventsUpdatedNotification: current events: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
LABEL_26:

}

- (void)_handleEventsRemovedFromResponse:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "hmf_arrayForKey:", CFSTR("kUUIDsOfEventsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
          -[HMEventTrigger currentEvents](self, "currentEvents");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstItemWithUUID:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            -[HMEventTrigger currentEvents](self, "currentEvents");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObject:", v12);

            objc_msgSend(v12, "_unconfigure");
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
  }

}

- (void)handleActivationStateNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "numberForKey:", CFSTR("kEventTriggerActivationStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[HMEventTrigger setActivationState:](self, "setActivationState:", v5);
  -[HMTrigger home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_notifyDelegateOfTriggerUpdated:", self);

}

- (HMEventTrigger)initWithCoder:(id)a3
{
  id v4;
  HMEventTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HMMutableArray *currentEvents;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSPredicate *internalPredicate;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *recurrences;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[9];

  v26[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMEventTrigger;
  v5 = -[HMTrigger initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v26[3] = objc_opt_class();
    v26[4] = objc_opt_class();
    v26[5] = objc_opt_class();
    v26[6] = objc_opt_class();
    v26[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HM.eventTriggerEvents"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMMutableArray arrayWithArray:](HMMutableArray, "arrayWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    currentEvents = v5->_currentEvents;
    v5->_currentEvents = (HMMutableArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("HM.eventTriggerCondition"));
    v15 = objc_claimAutoreleasedReturnValue();
    internalPredicate = v5->_internalPredicate;
    v5->_internalPredicate = (NSPredicate *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("HM.eventTriggerRecurrences"));
    v20 = objc_claimAutoreleasedReturnValue();
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v20;

    v5->_activationState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kEventTriggerActivationStateKey"));
    *(&v5->_executeOnce + 4) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kEventTriggerExecuteOnce"));

  }
  return v5;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  unsigned int v5;
  HMObjectMergeCollection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMObjectMergeCollection *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  unint64_t v26;
  BOOL v27;
  void *v28;
  NSObject *v29;
  _QWORD block[5];
  _QWORD v32[5];
  _QWORD v33[5];
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HMEventTrigger;
  v5 = -[HMTrigger mergeFromNewObject:](&v34, sel_mergeFromNewObject_, v4);
  v6 = [HMObjectMergeCollection alloc];
  -[HMEventTrigger currentEvents](self, "currentEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v6, "initWithCurrentObjects:newObjects:", v8, v10);

  -[HMObjectMergeCollection removedObjects](v11, "removedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __37__HMEventTrigger_mergeFromNewObject___block_invoke;
  v33[3] = &unk_1E3AAF6E8;
  v33[4] = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v33);

  -[HMObjectMergeCollection addedObjects](v11, "addedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __37__HMEventTrigger_mergeFromNewObject___block_invoke_129;
  v32[3] = &unk_1E3AAF6E8;
  v32[4] = self;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v32);

  -[HMObjectMergeCollection mergeCommonObjects](v11, "mergeCommonObjects");
  if (-[HMObjectMergeCollection isModified](v11, "isModified"))
  {
    -[HMObjectMergeCollection finalObjects](v11, "finalObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger currentEvents](self, "currentEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setArray:", v15);

    v5 = 1;
  }
  -[HMEventTrigger internalPredicate](self, "internalPredicate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalPredicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = HMFEqualObjects();

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v4, "internalPredicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger setInternalPredicate:](self, "setInternalPredicate:", v20);

    v5 = 1;
  }
  -[HMEventTrigger recurrences](self, "recurrences");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recurrences");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = HMFEqualObjects();

  if ((v23 & 1) == 0)
  {
    objc_msgSend(v4, "recurrences");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger setRecurrences:](self, "setRecurrences:", v24);

    v5 = 1;
  }
  v25 = -[HMEventTrigger executeOnce](self, "executeOnce");
  if (v25 != objc_msgSend(v4, "executeOnce"))
  {
    -[HMEventTrigger setExecuteOnce:](self, "setExecuteOnce:", objc_msgSend(v4, "executeOnce"));
    v5 = 1;
  }
  v26 = -[HMEventTrigger activationState](self, "activationState");
  if (v26 != objc_msgSend(v4, "activationState"))
  {
    -[HMEventTrigger setActivationState:](self, "setActivationState:", objc_msgSend(v4, "activationState"));
    goto LABEL_13;
  }
  if (v5)
  {
LABEL_13:
    -[HMTrigger context](self, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "queue");
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __37__HMEventTrigger_mergeFromNewObject___block_invoke_130;
    block[3] = &unk_1E3AB5E18;
    block[4] = self;
    dispatch_async(v29, block);

    v27 = 1;
    goto LABEL_14;
  }
  v27 = 0;
LABEL_14:

  return v27;
}

- (BOOL)mergeFromNewObjectForBuilderUpdates:(id)a3
{
  id v4;
  BOOL v5;
  HMObjectMergeCollection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMObjectMergeCollection *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  unint64_t v26;
  _QWORD v28[5];
  _QWORD v29[5];
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMEventTrigger;
  v5 = -[HMTrigger mergeFromNewObjectForBuilderUpdates:](&v30, sel_mergeFromNewObjectForBuilderUpdates_, v4);
  v6 = [HMObjectMergeCollection alloc];
  -[HMEventTrigger currentEvents](self, "currentEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v6, "initWithCurrentObjects:newObjects:", v8, v10);

  -[HMObjectMergeCollection removedObjects](v11, "removedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __54__HMEventTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke;
  v29[3] = &unk_1E3AAF6E8;
  v29[4] = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v29);

  -[HMObjectMergeCollection addedObjects](v11, "addedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __54__HMEventTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke_133;
  v28[3] = &unk_1E3AAF6E8;
  v28[4] = self;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v28);

  -[HMObjectMergeCollection mergeCommonObjects](v11, "mergeCommonObjects");
  if (-[HMObjectMergeCollection isModified](v11, "isModified"))
  {
    -[HMObjectMergeCollection finalObjects](v11, "finalObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger currentEvents](self, "currentEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setArray:", v15);

    v5 = 1;
  }
  -[HMEventTrigger internalPredicate](self, "internalPredicate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalPredicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = HMFEqualObjects();

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v4, "internalPredicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger setInternalPredicate:](self, "setInternalPredicate:", v20);

    v5 = 1;
  }
  -[HMEventTrigger recurrences](self, "recurrences");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recurrences");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = HMFEqualObjects();

  if ((v23 & 1) == 0)
  {
    objc_msgSend(v4, "recurrences");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger setRecurrences:](self, "setRecurrences:", v24);

    v5 = 1;
  }
  v25 = -[HMEventTrigger executeOnce](self, "executeOnce");
  if (v25 != objc_msgSend(v4, "executeOnce"))
  {
    -[HMEventTrigger setExecuteOnce:](self, "setExecuteOnce:", objc_msgSend(v4, "executeOnce"));
    v5 = 1;
  }
  v26 = -[HMEventTrigger activationState](self, "activationState");
  if (v26 != objc_msgSend(v4, "activationState"))
  {
    -[HMEventTrigger setActivationState:](self, "setActivationState:", objc_msgSend(v4, "activationState"));
    v5 = 1;
  }

  return v5;
}

- (BOOL)_updateCharacteristicReferenceInNewEvent:(id)a3
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
  BOOL v14;

  v4 = a3;
  objc_msgSend(v4, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMTrigger home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryWithUUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "instanceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_findCharacteristic:forService:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13 != 0;
    if (v13)
      objc_msgSend(v4, "setCharacteristic:", v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)containsSharedTriggerActivationBits
{
  void *v3;
  HMEventTrigger *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _BOOL4 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[HMEventTrigger executeOnce](self, "executeOnce"))
  {
    v3 = (void *)MEMORY[0x1A1AC1AAC]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_5;
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    v7 = "%{public}@Contains execute once, requires data version 4";
    goto LABEL_4;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMEventTrigger currentEvents](self, "currentEvents", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "isEndEvent") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
              }
            }
          }
        }

        return 1;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }

  -[HMEventTrigger internalPredicate](self, "internalPredicate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[HMPredicateUtilities containsPresenceEvents:](HMPredicateUtilities, "containsPresenceEvents:", v14);

  if (!v15)
    return 0;
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    v7 = "%{public}@Contains presence events, requires data version 4";
LABEL_4:
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, v7, buf, 0xCu);

  }
LABEL_5:

  objc_autoreleasePoolPop(v3);
  return 1;
}

- (BOOL)compatibleWithApp
{
  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 1;
  else
    return !-[HMEventTrigger containsSharedTriggerActivationBits](self, "containsSharedTriggerActivationBits");
}

- (HMMutableArray)currentEvents
{
  return self->_currentEvents;
}

- (void)setCurrentEvents:(id)a3
{
  objc_storeStrong((id *)&self->_currentEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEvents, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
  objc_storeStrong((id *)&self->_internalPredicate, 0);
}

void __54__HMEventTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed event via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "_unconfigure");

}

void __54__HMEventTrigger_mergeFromNewObjectForBuilderUpdates___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added event via merge: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = v3;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE40E448))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10 || objc_msgSend(*(id *)(a1 + 32), "_updateCharacteristicReferenceInNewEvent:", v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__configureWithContext:eventTrigger:", v11, *(_QWORD *)(a1 + 32));

  }
}

void __37__HMEventTrigger_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed event via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "_unconfigure");

}

void __37__HMEventTrigger_mergeFromNewObject___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added event via merge: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = v3;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE40E448))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10 || objc_msgSend(*(id *)(a1 + 32), "_updateCharacteristicReferenceInNewEvent:", v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__configureWithContext:eventTrigger:", v11, *(_QWORD *)(a1 + 32));

  }
}

void __37__HMEventTrigger_mergeFromNewObject___block_invoke_130(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_notifyDelegateOfTriggerUpdated:", *(_QWORD *)(a1 + 32));

}

- (id)addedEvent:(void *)a3 home:
{
  id v5;
  id v6;
  void *v7;
  __objc2_class *v8;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "hmf_stringForKey:", CFSTR("kEventTriggerTypeKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("kEventTriggerTypeCharacteristicEventKey")))
    {
      v8 = HMCharacteristicEvent;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("kEventTriggerTypeLocationEventKey")))
    {
      v8 = HMLocationEvent;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("kEventTriggerTypeCalendarEventKey")))
    {
      v8 = HMCalendarEvent;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("kEventTriggerTypeSignificantTimeEventKey")))
    {
      v8 = HMSignificantTimeEvent;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("kEventTriggerTypeCharacteristicThresholdRangeEventKey")))
    {
      v8 = HMCharacteristicThresholdRangeEvent;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("kEventTriggerTypePresenceEventKey")))
    {
      v8 = HMPresenceEvent;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("kEventTriggerTypeDurationEventKey")))
      {
        v10 = (void *)MEMORY[0x1A1AC1AAC]();
        v11 = a1;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543874;
          v15 = v13;
          v16 = 2112;
          v17 = objc_opt_class();
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, invalid event type '%@'", (uint8_t *)&v14, 0x20u);

        }
        objc_autoreleasePoolPop(v10);
        a1 = 0;
        goto LABEL_17;
      }
      v8 = HMDurationEvent;
    }
    -[__objc2_class createWithDictionary:home:](v8, "createWithDictionary:home:", v5, v6);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  }
  return a1;
}

void __44__HMEventTrigger__removeEventsForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home:didUpdateTrigger:", v3, *(_QWORD *)(a1 + 40));

}

void __55__HMEventTrigger__updateExecuteOnce_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v14 = 138544130;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Update event trigger execute once response : %@, completionHandler: %@ error %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5)
  {
    if (v6)
      v13 = objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kEventTriggerExecuteOnce"));
    else
      v13 = 0;
    objc_msgSend(v9, "setExecuteOnce:", v13);
  }
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

uint64_t __54__HMEventTrigger_updateExecuteOnce_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateExecuteOnce:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __55__HMEventTrigger__updateRecurrences_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v14 = 138544130;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Update event trigger recurrences response : %@, completionHandler: %@ error %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5)
  {
    if (v6)
    {
      objc_msgSend(v6, "arrayOfDateComponentsFromDataForKey:", CFSTR("kEventTriggerRecurrencesKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRecurrences:", v13);

    }
    else
    {
      objc_msgSend(v9, "setRecurrences:", 0);
    }
  }
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

uint64_t __54__HMEventTrigger_updateRecurrences_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRecurrences:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __53__HMEventTrigger__updatePredicate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v14 = 138544130;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Update event trigger condition response : %@, completionHandler: %@ error %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5)
  {
    if (v6)
    {
      objc_msgSend(v6, "predicateFromDataForKey:", CFSTR("kEventTriggerConditionKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInternalPredicate:", v13);

    }
    else
    {
      objc_msgSend(v9, "setInternalPredicate:", 0);
    }
  }
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

uint64_t __52__HMEventTrigger_updatePredicate_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePredicate:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __59__HMEventTrigger__updateEvents_endEvent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
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
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Update events to event trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5 && v6)
    objc_msgSend(v9, "_updateEventsFromResponse:responsePayload:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

uint64_t __52__HMEventTrigger_updateEndEvents_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEvents:endEvent:completionHandler:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

uint64_t __49__HMEventTrigger_updateEvents_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEvents:endEvent:completionHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

void __49__HMEventTrigger__removeEvent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove event from event trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5 && v6)
    objc_msgSend(v9, "_handleEventsRemovedFromResponse:", v6);
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

uint64_t __48__HMEventTrigger_removeEvent_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeEvent:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __46__HMEventTrigger__addEvent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
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
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Add event to event trigger response : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5 && v6)
    objc_msgSend(v9, "_handleAddEventFromResponse:newEventPayload:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

uint64_t __45__HMEventTrigger_addEvent_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addEvent:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_eventsWithDictionaries:(void *)a3 home:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        -[HMEventTrigger addedEvent:home:](a1, *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12), v6);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

          v15 = 0;
          goto LABEL_11;
        }
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13, (_QWORD)v17);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15 = (void *)objc_msgSend(v7, "copy");
LABEL_11:

  return v15;
}

+ (BOOL)__validateRecurrences:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "weekday", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

+ (id)negateOffset:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  if (objc_msgSend(v3, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "setMinute:", -objc_msgSend(v3, "minute"));
  if (objc_msgSend(v3, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "setHour:", -objc_msgSend(v3, "hour"));

  return v4;
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:(NSString *)significantEvent applyingOffset:(NSDateComponents *)offset
{
  return (NSPredicate *)+[HMEventTrigger _predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:applyingOffset:](HMEventTrigger, "_predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:applyingOffset:", significantEvent, offset);
}

+ (id)_predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:(id)a3 applyingOffset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a4)
  {
    v5 = a3;
    +[HMEventTrigger negateOffset:](HMEventTrigger, "negateOffset:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3880];
    _HMSignificantEventKeyPath(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K > now() + %@"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    v11 = a3;
    _HMSignificantEventKeyPath(v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K > now()"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:(HMSignificantTimeEvent *)significantEvent
{
  HMSignificantTimeEvent *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = significantEvent;
  -[HMSignificantTimeEvent significantEvent](v3, "significantEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSignificantTimeEvent offset](v3, "offset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMEventTrigger _predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:applyingOffset:](HMEventTrigger, "_predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:applyingOffset:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v6;
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringAfterSignificantEvent:(NSString *)significantEvent applyingOffset:(NSDateComponents *)offset
{
  return (NSPredicate *)+[HMEventTrigger _predicateForEvaluatingTriggerOccurringAfterSignificantEvent:applyingOffset:](HMEventTrigger, "_predicateForEvaluatingTriggerOccurringAfterSignificantEvent:applyingOffset:", significantEvent, offset);
}

+ (id)_predicateForEvaluatingTriggerOccurringAfterSignificantEvent:(id)a3 applyingOffset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a4)
  {
    v5 = a3;
    +[HMEventTrigger negateOffset:](HMEventTrigger, "negateOffset:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3880];
    _HMSignificantEventKeyPath(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K <= now() + %@"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    v11 = a3;
    _HMSignificantEventKeyPath(v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K <= now()"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringAfterSignificantEvent:(HMSignificantTimeEvent *)significantEvent
{
  HMSignificantTimeEvent *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = significantEvent;
  -[HMSignificantTimeEvent significantEvent](v3, "significantEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSignificantTimeEvent offset](v3, "offset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMEventTrigger _predicateForEvaluatingTriggerOccurringAfterSignificantEvent:applyingOffset:](HMEventTrigger, "_predicateForEvaluatingTriggerOccurringAfterSignificantEvent:applyingOffset:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v6;
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBetweenSignificantEvent:(HMSignificantTimeEvent *)firstSignificantEvent secondSignificantEvent:(HMSignificantTimeEvent *)secondSignificantEvent
{
  HMSignificantTimeEvent *v5;
  HMSignificantTimeEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = secondSignificantEvent;
  v6 = firstSignificantEvent;
  +[HMEventTrigger predicateForEvaluatingTriggerOccurringAfterSignificantEvent:](HMEventTrigger, "predicateForEvaluatingTriggerOccurringAfterSignificantEvent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMEventTrigger predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:](HMEventTrigger, "predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSignificantTimeEvent significantEvent](v6, "significantEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("sunrise")) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[HMSignificantTimeEvent significantEvent](v5, "significantEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("sunset"));

  if (!v11)
  {
LABEL_5:
    v15 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v7;
    v18[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "orPredicateWithSubpredicates:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v12 = (void *)MEMORY[0x1E0CB3528];
  v19[0] = v7;
  v19[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v16 = (void *)v14;

  return (NSPredicate *)v16;
}

+ (NSPredicate)predicateForEvaluatingTriggerWithPresence:(HMPresenceEvent *)presenceEvent
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("presence"), presenceEvent);
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:(NSDateComponents *)dateComponents
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("now() < %@"), dateComponents);
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringOnDateWithComponents:(NSDateComponents *)dateComponents
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("now() = %@"), dateComponents);
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringAfterDateWithComponents:(NSDateComponents *)dateComponents
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("now() > %@"), dateComponents);
}

+ (NSPredicate)predicateForEvaluatingTriggerOccurringBetweenDateWithComponents:(NSDateComponents *)firstDateComponents secondDateWithComponents:(NSDateComponents *)secondDateWithComponents
{
  NSDateComponents *v5;
  NSDateComponents *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = firstDateComponents;
  v6 = secondDateWithComponents;
  +[HMEventTrigger predicateForEvaluatingTriggerOccurringAfterDateWithComponents:](HMEventTrigger, "predicateForEvaluatingTriggerOccurringAfterDateWithComponents:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMEventTrigger predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:](HMEventTrigger, "predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[HMPredicateUtilities areOnlyHourAndMinuteSet:](HMPredicateUtilities, "areOnlyHourAndMinuteSet:", v5)|| !+[HMPredicateUtilities areOnlyHourAndMinuteSet:](HMPredicateUtilities, "areOnlyHourAndMinuteSet:", v6))
  {
    v15 = (void *)MEMORY[0x1E0CB3528];
    v21[0] = v7;
    v21[1] = v8;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v21;
    goto LABEL_8;
  }
  v9 = -[NSDateComponents hour](v5, "hour");
  if (v9 <= -[NSDateComponents hour](v6, "hour"))
  {
    v10 = -[NSDateComponents hour](v5, "hour");
    if (v10 >= -[NSDateComponents hour](v6, "hour"))
    {
      v11 = -[NSDateComponents minute](v5, "minute");
      if (v11 > -[NSDateComponents minute](v6, "minute"))
        goto LABEL_6;
      v20 = -[NSDateComponents minute](v5, "minute");
      if (v20 >= -[NSDateComponents minute](v6, "minute"))
      {
        +[HMEventTrigger predicateForEvaluatingTriggerOccurringOnDateWithComponents:](HMEventTrigger, "predicateForEvaluatingTriggerOccurringOnDateWithComponents:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    v15 = (void *)MEMORY[0x1E0CB3528];
    v23[0] = v7;
    v23[1] = v8;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v23;
LABEL_8:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_6:
  v12 = (void *)MEMORY[0x1E0CB3528];
  v22[0] = v7;
  v22[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orPredicateWithSubpredicates:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v18 = (void *)v14;

LABEL_10:
  return (NSPredicate *)v18;
}

+ (id)predicateForEvaluatingTriggerWithCharacteristic:(id)a3 matchingValue:(id)a4
{
  return +[HMEventTrigger predicateForEvaluatingTriggerWithCharacteristic:relatedBy:toValue:](HMEventTrigger, "predicateForEvaluatingTriggerWithCharacteristic:relatedBy:toValue:", a3, 4, a4);
}

+ (NSPredicate)predicateForEvaluatingTriggerWithCharacteristic:(HMCharacteristic *)characteristic relatedBy:(NSPredicateOperatorType)operatorType toValue:(id)value
{
  HMCharacteristic *v7;
  id v8;
  void *v9;

  v7 = characteristic;
  v8 = value;
  if (operatorType >= NSMatchesPredicateOperatorType)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%tu is not a supported operation type"), operatorType);
    v9 = 0;
  }
  else
  {
    +[HMEventTrigger _predicateForEvaluatingTriggerWithCharacteristic:value:valueFormatString:](HMEventTrigger, "_predicateForEvaluatingTriggerWithCharacteristic:value:valueFormatString:", v7, v8, off_1E3AAF708[operatorType]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSPredicate *)v9;
}

+ (id)_predicateForEvaluatingTriggerWithCharacteristic:(id)a3 value:(id)a4 valueFormatString:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("characteristic"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v8, CFSTR("characteristicValue"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  v16[0] = v10;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMEventTrigger *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kTriggerName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "hmf_stringForKey:", CFSTR("HMT.triggerConfiguredNameKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayOfDateComponentsFromDataForKey:", CFSTR("kEventTriggerRecurrencesKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateFromDataForKey:", CFSTR("kEventTriggerConditionKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [HMEventTrigger alloc];
    v10 = -[HMEventTrigger initInternalWithName:configuredName:events:endEvents:recurrences:predicate:](v9, "initInternalWithName:configuredName:events:endEvents:recurrences:predicate:", v5, v6, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v7, v8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isActionAffectedByEndEvents:(id)a3
{
  return objc_msgSend(a3, "isAffectedByEndEvents");
}

- (id)copyAsBuilder
{
  return -[HMEventTriggerBuilder initWithEventTrigger:]([HMEventTriggerBuilder alloc], "initWithEventTrigger:", self);
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
  HMEventTrigger *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMEventTrigger *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  HMEventTrigger *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMTrigger home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v37 = 0;
    v11 = objc_msgSend(v9, "validateBuilder:error:", v6, &v37);
    v12 = v37;
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E0C99E08];
      v36 = v12;
      objc_msgSend(v10, "encodeEventTriggerBuilder:error:", v6, &v36);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v36;

      objc_msgSend(v14, "dictionaryWithDictionary:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMTrigger uuid](self, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("kTriggerUUID"));

      if (v17)
      {
        v20 = (void *)MEMORY[0x1A1AC1AAC]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v23;
          v40 = 2112;
          v41 = (const char *)v17;
          _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Going to update the event trigger with : %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        -[HMTrigger uuid](v21, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __77__HMEventTrigger_HMEventTriggerBuilder__updateWithBuilder_completionHandler___block_invoke;
        v30[3] = &unk_1E3AB2FA8;
        v31 = v8;
        v35 = v7;
        v32 = v21;
        v33 = v17;
        v34 = v10;
        -[_HMContext sendMessage:target:payload:responseHandler:](v31, CFSTR("HMUpdateEventTriggerFromBuilderMessage"), v24, v33, v30);

        v25 = v31;
      }
      else
      {
        objc_msgSend(v8, "delegateCaller");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "callCompletion:error:", v7, v16);
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
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v29;
      v40 = 2080;
      v41 = "-[HMEventTrigger(HMEventTriggerBuilder) updateWithBuilder:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
  }

}

void __77__HMEventTrigger_HMEventTriggerBuilder__updateWithBuilder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HMEventTrigger *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
    v7 = (HMEventTrigger *)objc_claimAutoreleasedReturnValue();
    -[HMEventTrigger callCompletion:error:](v7, "callCompletion:error:", *(_QWORD *)(a1 + 64), v5);
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully updated the event trigger. ResponsePayload : %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = -[HMEventTrigger initWithDictionary:home:]([HMEventTrigger alloc], "initWithDictionary:home:", v6, *(_QWORD *)(a1 + 56));
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "mergeFromNewObjectForBuilderUpdates:", v7);
      objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "callCompletion:error:", *(_QWORD *)(a1 + 64), 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "callCompletion:error:", v14, v15);

    }
  }

}

@end
