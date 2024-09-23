@implementation _HMEventTriggerBuilder

- (Class)class
{
  return (Class)objc_opt_class();
}

- (_HMEventTriggerBuilder)initWithContext:(id)a3 home:(id)a4
{
  _HMEventTriggerBuilder *v4;
  NSMutableArray *v5;
  NSMutableArray *events;
  NSMutableArray *v7;
  NSMutableArray *endEvents;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_HMEventTriggerBuilder;
  v4 = -[_HMTriggerBuilder initWithContext:home:](&v10, sel_initWithContext_home_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    events = v4->_events;
    v4->_events = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    endEvents = v4->_endEvents;
    v4->_endEvents = v7;

  }
  return v4;
}

- (_HMEventTriggerBuilder)initWithEventTrigger:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _HMEventTriggerBuilder *v8;
  void *v9;
  _HMEventTriggerBuilder *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *events;
  NSMutableArray *v14;
  NSMutableArray *endEvents;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSPredicate *predicate;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (objc_msgSend(v5, "areAutomationBuildersSupported"))
    {
      objc_msgSend(v5, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v44.receiver = self;
      v44.super_class = (Class)_HMEventTriggerBuilder;
      v10 = -[_HMTriggerBuilder initWithContext:home:](&v44, sel_initWithContext_home_, v9, v5);

      if (v10)
      {
        v35 = v7;
        objc_msgSend(v4, "recurrences");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HMEventOrTimerTriggerBuilder setRecurrences:](v10, "setRecurrences:", v11);

        v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        events = v10->_events;
        v10->_events = v12;

        v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        endEvents = v10->_endEvents;
        v34 = 112;
        v10->_endEvents = v14;

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v4, "events");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v41;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v41 != v19)
                objc_enumerationMutation(v16);
              v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v20), "copy", v34);
              objc_msgSend(v5, "context");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "__configureWithContext:eventTrigger:", v22, v4);

              -[NSMutableArray addObject:](v10->_events, "addObject:", v21);
              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
          }
          while (v18);
        }

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v4, "endEvents");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        v25 = v34;
        if (v24)
        {
          v26 = v24;
          v27 = *(_QWORD *)v37;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v37 != v27)
                objc_enumerationMutation(v23);
              v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v28), "copy", v34);
              objc_msgSend(v5, "context");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "__configureWithContext:eventTrigger:", v30, v4);

              objc_msgSend(*(id *)((char *)&v10->super.super.super.super.isa + v25), "addObject:", v29);
              ++v28;
            }
            while (v26 != v28);
            v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v26);
        }

        objc_msgSend(v4, "predicate");
        v31 = objc_claimAutoreleasedReturnValue();
        predicate = v10->_predicate;
        v10->_predicate = (NSPredicate *)v31;

        v7 = v35;
      }
      self = v10;
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyAsBuilder
{
  HMEventTriggerBuilder *v3;
  _HMEventTriggerBuilder *v4;
  HMEventTriggerBuilder *v5;

  v3 = [HMEventTriggerBuilder alloc];
  v4 = self;
  v5 = -[HMEventTriggerBuilder initWithEventTrigger:](v3, "initWithEventTrigger:", v4);

  return v5;
}

- (BOOL)executeOnce
{
  _HMEventTriggerBuilder *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executeOnce;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExecuteOnce:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_executeOnce = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)updateExecuteOnce:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  _HMContext *context;
  _HMContext *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _HMEventTriggerBuilder *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder updateExecuteOnce:completionHandler:]", CFSTR("completion"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v9, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  -[_HMEventTriggerBuilder setExecuteOnce:](self, "setExecuteOnce:", v4);
  if (self)
    context = self->super.super.super._context;
  else
    context = 0;
  v7 = context;
  -[_HMContext delegateCaller](v7, "delegateCaller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callCompletion:error:", v15, 0);

}

- (NSPredicate)predicate
{
  os_unfair_lock_s *p_lock;
  NSPredicate *v4;

  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_predicate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPredicate:(id)a3
{
  NSPredicate *v4;
  NSPredicate *predicate;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSPredicate *)objc_msgSend(v6, "copy");
  predicate = self->_predicate;
  self->_predicate = v4;

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (void)updatePredicate:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _HMContext *context;
  _HMContext *v9;
  void *v10;
  _HMContext *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _HMEventTriggerBuilder *v15;
  void *v16;
  _HMEventTriggerBuilder *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder updatePredicate:completionHandler:]", CFSTR("completion"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1A1AC1AAC]();
    v15 = self;
    v16 = (void *)v14;
    v17 = v15;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v7 = v6;
  if (+[HMPredicateUtilities validatePredicate:](HMPredicateUtilities, "validatePredicate:", v21))
  {
    -[_HMEventTriggerBuilder setPredicate:](self, "setPredicate:", v21);
    if (self)
      context = self->super.super.super._context;
    else
      context = 0;
    v9 = context;
    -[_HMContext delegateCaller](v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v7, 0);
  }
  else
  {
    if (self)
      v11 = self->super.super.super._context;
    else
      v11 = 0;
    v9 = v11;
    -[_HMContext delegateCaller](v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v7, v12);

  }
}

- (NSArray)events
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_events, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)endEvents
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_endEvents, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setEvents:(id)a3
{
  -[_HMEventTriggerBuilder _with:setEvents:](self, "_with:setEvents:", self->_events, a3);
}

- (void)setEndEvents:(id)a3
{
  -[_HMEventTriggerBuilder _with:setEvents:](self, "_with:setEvents:", self->_endEvents, a3);
}

- (void)addEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _HMEventTriggerBuilder *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder addEvent:]", CFSTR("event"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v11 = v4;
  -[_HMEventTriggerBuilder _with:addEvent:](self, "_with:addEvent:", self->_events, v4);

}

- (void)addEndEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _HMEventTriggerBuilder *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder addEndEvent:]", CFSTR("event"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v11 = v4;
  -[_HMEventTriggerBuilder _with:addEvent:](self, "_with:addEvent:", self->_endEvents, v4);

}

- (void)removeEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _HMEventTriggerBuilder *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder removeEvent:]", CFSTR("event"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v11 = v4;
  -[_HMEventTriggerBuilder _with:removeEvent:](self, "_with:removeEvent:", self->_events, v4);

}

- (void)removeEndEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _HMEventTriggerBuilder *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder removeEndEvent:]", CFSTR("event"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v11 = v4;
  -[_HMEventTriggerBuilder _with:removeEvent:](self, "_with:removeEvent:", self->_endEvents, v4);

}

- (BOOL)_with:(id)a3 addEvent:(id)a4
{
  char v4;
  id v7;
  id v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  _HMContext *context;
  _HMContext *v12;
  _HMEventTriggerBuilder *v13;

  v7 = a3;
  v8 = a4;
  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v10 = (void *)objc_opt_class();
  if (v10 == (void *)objc_opt_class())
  {
    _HMFPreconditionFailure();
    __break(1u);
    goto LABEL_8;
  }
  v10 = (void *)objc_msgSend(v8, "copy");
  v4 = objc_msgSend(v7, "containsObject:", v10);
  if ((v4 & 1) == 0)
  {
    if (self)
    {
      context = self->super.super.super._context;
LABEL_5:
      v12 = context;
      v13 = self;
      objc_msgSend(v10, "__configureWithContext:eventTrigger:", v12, v13);

      objc_msgSend(v7, "addObject:", v10);
      goto LABEL_6;
    }
LABEL_8:
    context = 0;
    goto LABEL_5;
  }
LABEL_6:

  os_unfair_lock_unlock(p_lock);
  return v4 ^ 1;
}

- (BOOL)_with:(id)a3 removeEvent:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v9 = objc_msgSend(v6, "indexOfObject:", v7);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_unconfigure");

    objc_msgSend(v6, "removeObjectAtIndex:", v9);
  }
  os_unfair_lock_unlock(p_lock);

  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_with:(id)a3 setEvents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _HMContext *context;
  _HMContext *v17;
  _HMEventTriggerBuilder *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  os_unfair_lock_t lock;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v6, "removeAllObjects");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v32;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
        v13 = objc_opt_class();
        if (v13 == objc_opt_class())
        {
          _HMFPreconditionFailure();
          __break(1u);
        }
        v14 = (void *)objc_msgSend(v12, "copy", lock);
        v15 = objc_msgSend(v8, "indexOfObject:", v14);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
          {
            if (self)
              context = self->super.super.super._context;
            else
              context = 0;
            v17 = context;
            v18 = self;
            objc_msgSend(v14, "__configureWithContext:eventTrigger:", v17, v18);

            objc_msgSend(v6, "addObject:", v14);
          }
        }
        else
        {
          objc_msgSend(v8, "objectAtIndex:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v19);

          objc_msgSend(v8, "removeObjectAtIndex:", v15);
        }

        ++v11;
      }
      while (v9 != v11);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v9 = v20;
    }
    while (v20);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = v8;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "_unconfigure", lock);
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v22);
  }

  os_unfair_lock_unlock(lock);
}

- (void)addEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _HMEventTriggerBuilder *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder addEvent:completionHandler:]", CFSTR("completion"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = v6;
  -[_HMEventTriggerBuilder _with:addEvent:completion:](self, "_with:addEvent:completion:", self->_events, v14, v6);

}

- (void)addEndEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _HMEventTriggerBuilder *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder addEndEvent:completionHandler:]", CFSTR("completion"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = v6;
  -[_HMEventTriggerBuilder _with:addEvent:completion:](self, "_with:addEvent:completion:", self->_endEvents, v14, v6);

}

- (void)removeEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _HMEventTriggerBuilder *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder removeEvent:completionHandler:]", CFSTR("completion"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = v6;
  -[_HMEventTriggerBuilder _with:removeEvent:completion:](self, "_with:removeEvent:completion:", self->_events, v14, v6);

}

- (void)removeEndEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _HMEventTriggerBuilder *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder removeEndEvent:completionHandler:]", CFSTR("completion"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = v6;
  -[_HMEventTriggerBuilder _with:removeEvent:completion:](self, "_with:removeEvent:completion:", self->_endEvents, v14, v6);

}

- (void)updateEvents:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _HMEventTriggerBuilder *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder updateEvents:completionHandler:]", CFSTR("completion"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = v6;
  -[_HMEventTriggerBuilder _with:updateEvents:completion:](self, "_with:updateEvents:completion:", self->_events, v14, v6);

}

- (void)updateEndEvents:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _HMEventTriggerBuilder *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMEventTriggerBuilder updateEndEvents:completionHandler:]", CFSTR("completion"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = v6;
  -[_HMEventTriggerBuilder _with:updateEvents:completion:](self, "_with:updateEvents:completion:", self->_endEvents, v14, v6);

}

- (void)_with:(id)a3 addEvent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  _HMContext *v11;
  _HMContext *v12;
  void *v13;
  void *v14;
  _HMContext *context;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    if (self)
      context = self->super.super.super._context;
    else
      context = 0;
    v12 = context;
    -[_HMContext delegateCaller](v12, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 20;
    goto LABEL_10;
  }
  v10 = -[_HMEventTriggerBuilder _with:addEvent:](self, "_with:addEvent:", v19, v8);
  if (self)
    v11 = self->super.super.super._context;
  else
    v11 = 0;
  v12 = v11;
  -[_HMContext delegateCaller](v12, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v10)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 1;
LABEL_10:
    objc_msgSend(v16, "hmErrorWithCode:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", v9, v18);

    goto LABEL_11;
  }
  objc_msgSend(v13, "callCompletion:error:", v9, 0);
LABEL_11:

}

- (void)_with:(id)a3 removeEvent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  _HMContext *v11;
  _HMContext *v12;
  void *v13;
  void *v14;
  _HMContext *context;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    if (self)
      context = self->super.super.super._context;
    else
      context = 0;
    v12 = context;
    -[_HMContext delegateCaller](v12, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 20;
    goto LABEL_10;
  }
  v10 = -[_HMEventTriggerBuilder _with:removeEvent:](self, "_with:removeEvent:", v19, v8);
  if (self)
    v11 = self->super.super.super._context;
  else
    v11 = 0;
  v12 = v11;
  -[_HMContext delegateCaller](v12, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v10)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 2;
LABEL_10:
    objc_msgSend(v16, "hmErrorWithCode:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", v9, v18);

    goto LABEL_11;
  }
  objc_msgSend(v13, "callCompletion:error:", v9, 0);
LABEL_11:

}

- (void)_with:(id)a3 updateEvents:(id)a4 completion:(id)a5
{
  id v8;
  _HMContext *context;
  void *v10;
  _HMContext *v11;

  v8 = a5;
  -[_HMEventTriggerBuilder _with:setEvents:](self, "_with:setEvents:", a3, a4);
  if (self)
    context = self->super.super.super._context;
  else
    context = 0;
  v11 = context;
  -[_HMContext delegateCaller](v11, "delegateCaller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callCompletion:error:", v8, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvents, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (void)initialize
{
  uint64_t v3;

  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_opt_class();
    objc_msgSend(a1, "adoptExternalCategoriesFromClasses:", v3, objc_opt_class(), 0);
  }
}

- (unint64_t)triggerActivationState
{
  return 0;
}

@end
