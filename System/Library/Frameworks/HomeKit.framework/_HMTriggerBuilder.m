@implementation _HMTriggerBuilder

- (Class)class
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

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v6;

  if ((Class)objc_opt_class() == a3)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)_HMTriggerBuilder;
  return -[_HMTriggerBuilder isKindOfClass:](&v6, sel_isKindOfClass_, a3);
}

- (_HMTriggerBuilder)initWithContext:(id)a3 home:(id)a4
{
  _HMTriggerBuilder *v4;
  NSMutableArray *v5;
  NSMutableArray *actionSets;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HMTriggerBuilder;
  v4 = -[_HMAutomationBuilder initWithContext:home:](&v8, sel_initWithContext_home_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actionSets = v4->_actionSets;
    v4->_actionSets = v5;

  }
  return v4;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  __CFString *name;
  __CFString *v5;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  name = (__CFString *)self->_name;
  if (!name)
    name = &stru_1E3AB7688;
  v5 = name;
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v5;
}

- (BOOL)nameIsConfigured
{
  _HMTriggerBuilder *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_nameIsConfigured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setName:(id)a3
{
  -[_HMTriggerBuilder setName:isConfigured:](self, "setName:isConfigured:", a3, 1);
}

- (void)setName:(id)a3 isConfigured:(BOOL)a4
{
  NSString *v6;
  NSString *name;
  BOOL v8;

  v6 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  name = self->_name;
  self->_name = v6;

  if (v6)
    v8 = a4;
  else
    v8 = 0;
  self->_nameIsConfigured = v8;
  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)configuredName
{
  os_unfair_lock_s *p_lock;
  NSString *name;
  NSString *v5;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  if (self->_nameIsConfigured)
    name = self->_name;
  else
    name = 0;
  v5 = name;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)updateName:(id)a3 completionHandler:(id)a4
{
  -[_HMTriggerBuilder updateName:configuredName:completionHandler:](self, "updateName:configuredName:completionHandler:", a3, a3, a4);
}

- (void)updateName:(id)a3 configuredName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  _HMContext *context;
  _HMContext *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _HMContext *v21;
  uint64_t v22;
  void *v23;
  _HMTriggerBuilder *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTriggerBuilder updateName:configuredName:completionHandler:]", CFSTR("completion"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v26;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v11 = v10;
  v28 = 0;
  v12 = +[HMTrigger _validateName:configuredName:error:]((uint64_t)HMTrigger, v8, v9, &v28);
  v13 = v28;
  if ((v12 & 1) != 0)
  {
    if (v9)
      v14 = v9;
    else
      v14 = v8;
    -[_HMTriggerBuilder setName:isConfigured:](self, "setName:isConfigured:", v14, v9 != 0);
    if (self)
      context = self->super._context;
    else
      context = 0;
    v16 = context;
    -[_HMContext delegateCaller](v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v11;
    v20 = 0;
  }
  else
  {
    if (self)
      v21 = self->super._context;
    else
      v21 = 0;
    v16 = v21;
    -[_HMContext delegateCaller](v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = v11;
    v20 = v13;
  }
  objc_msgSend(v17, "callCompletion:error:", v19, v20);

}

- (HMTriggerPolicy)policy
{
  os_unfair_lock_s *p_lock;
  HMTriggerPolicy *v4;

  p_lock = &self->super._lock;
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

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)updatePolicy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  _HMContext *context;
  _HMContext *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _HMContext *v16;
  void *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v8 = +[HMTrigger _validatePolicy:error:]((uint64_t)HMTrigger, v6, &v18);
  v9 = v18;
  if ((v8 & 1) != 0)
  {
    -[_HMTriggerBuilder setPolicy:](self, "setPolicy:", v6);
    if (self)
      context = self->super._context;
    else
      context = 0;
    v11 = context;
    -[_HMContext delegateCaller](v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v7;
    v15 = 0;
  }
  else
  {
    if (self)
      v16 = self->super._context;
    else
      v16 = 0;
    v11 = v16;
    -[_HMContext delegateCaller](v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "callCompletion:error:", v7, v17);

      goto LABEL_10;
    }
    v14 = v7;
    v15 = v9;
  }
  objc_msgSend(v12, "callCompletion:error:", v14, v15);
LABEL_10:

}

- (void)removePolicy:(id)a3 completionHandler:(id)a4
{
  id v6;
  char v7;
  id v8;
  _HMContext *context;
  _HMContext *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _HMContext *v15;
  void *v16;
  id v17;

  v6 = a4;
  v17 = 0;
  v7 = +[HMTrigger _validatePolicy:error:]((uint64_t)HMTrigger, a3, &v17);
  v8 = v17;
  if ((v7 & 1) != 0)
  {
    -[_HMTriggerBuilder setPolicy:](self, "setPolicy:", 0);
    if (self)
      context = self->super._context;
    else
      context = 0;
    v10 = context;
    -[_HMContext delegateCaller](v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v6;
    v14 = 0;
  }
  else
  {
    if (self)
      v15 = self->super._context;
    else
      v15 = 0;
    v10 = v15;
    -[_HMContext delegateCaller](v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "callCompletion:error:", v6, v16);

      goto LABEL_10;
    }
    v13 = v6;
    v14 = v8;
  }
  objc_msgSend(v11, "callCompletion:error:", v13, v14);
LABEL_10:

}

- (BOOL)isEnabled
{
  _HMTriggerBuilder *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)enable:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  _HMContext *context;
  _HMContext *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _HMTriggerBuilder *v11;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTriggerBuilder enable:completionHandler:]", CFSTR("completion"));
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
  -[_HMTriggerBuilder setEnabled:](self, "setEnabled:", v4);
  if (self)
    context = self->super._context;
  else
    context = 0;
  v7 = context;
  -[_HMContext delegateCaller](v7, "delegateCaller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callCompletion:error:", v15, 0);

}

- (NSArray)actionSets
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_actionSets, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setActionSets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  os_unfair_lock_s *lock;
  os_unfair_lock_s *locka;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  -[_HMTriggerBuilder __findTriggerOwnedActionSet]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMutableArray removeObjectsInRange:](self->_actionSets, "removeObjectsInRange:", 1, -[NSMutableArray count](self->_actionSets, "count", lock) - 1);
  else
    -[NSMutableArray removeAllObjects](self->_actionSets, "removeAllObjects", lock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[_HMAutomationBuilder home](self, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v12 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v10, v11, 1, &v17);
        v13 = v17;

        if ((v12 & 1) == 0)
        {
          HMExceptionForError(v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v14);
        }
        -[_HMTriggerBuilder __addActionSet:]((uint64_t)self, v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(locka);
}

- (void)addActionSet:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  -[_HMAutomationBuilder home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v4, v5, 1, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    HMExceptionForError(v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  -[_HMTriggerBuilder _addActionSet:]((uint64_t)self, v4);

}

- (void)addActionSet:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  char v12;
  _HMContext *v13;
  _HMContext *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _HMContext *context;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _HMTriggerBuilder *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTriggerBuilder addActionSet:completionHandler:]", CFSTR("completion"));
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
      v31 = v27;
      v32 = 2112;
      v33 = v23;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v8 = v7;
  -[_HMAutomationBuilder home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v10 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v6, v9, 1, &v29);
  v11 = v29;

  if ((v10 & 1) == 0)
  {
    if (self)
      context = self->super._context;
    else
      context = 0;
    v14 = context;
    -[_HMContext delegateCaller](v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v11)
    {
      v17 = v8;
      v18 = v11;
      goto LABEL_11;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = 3;
LABEL_14:
    objc_msgSend(v20, "hmErrorWithCode:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "callCompletion:error:", v8, v22);

    goto LABEL_15;
  }
  v12 = -[_HMTriggerBuilder _addActionSet:]((uint64_t)self, v6);
  if (self)
    v13 = self->super._context;
  else
    v13 = 0;
  v14 = v13;
  -[_HMContext delegateCaller](v14, "delegateCaller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v12 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = 1;
    goto LABEL_14;
  }
  v17 = v8;
  v18 = 0;
LABEL_11:
  objc_msgSend(v15, "callCompletion:error:", v17, v18);
LABEL_15:

}

- (void)removeActionSet:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  -[_HMAutomationBuilder home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v4, v5, 0, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    HMExceptionForError(v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  -[_HMTriggerBuilder _removeActionSet:]((uint64_t)self, v4);

}

- (void)removeActionSet:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  BOOL v12;
  _HMContext *v13;
  _HMContext *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _HMContext *context;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _HMTriggerBuilder *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTriggerBuilder removeActionSet:completionHandler:]", CFSTR("completion"));
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
      v31 = v27;
      v32 = 2112;
      v33 = v23;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v8 = v7;
  -[_HMAutomationBuilder home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v10 = +[HMTrigger _validateActionSet:home:homeOwnedOnly:error:]((uint64_t)HMTrigger, v6, v9, 0, &v29);
  v11 = v29;

  if ((v10 & 1) == 0)
  {
    if (self)
      context = self->super._context;
    else
      context = 0;
    v14 = context;
    -[_HMContext delegateCaller](v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v11)
    {
      v17 = v8;
      v18 = v11;
      goto LABEL_11;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = 3;
LABEL_14:
    objc_msgSend(v20, "hmErrorWithCode:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "callCompletion:error:", v8, v22);

    goto LABEL_15;
  }
  v12 = -[_HMTriggerBuilder _removeActionSet:]((uint64_t)self, v6);
  if (self)
    v13 = self->super._context;
  else
    v13 = 0;
  v14 = v13;
  -[_HMContext delegateCaller](v14, "delegateCaller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v12)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = 2;
    goto LABEL_14;
  }
  v17 = v8;
  v18 = 0;
LABEL_11:
  objc_msgSend(v15, "callCompletion:error:", v17, v18);
LABEL_15:

}

- (HMActionSetBuilder)triggerOwnedActionSet
{
  os_unfair_lock_s *p_lock;
  HMActionSetBuilder *v4;
  HMActionSetBuilder *v5;
  _HMContext *context;
  _HMContext *v7;
  void *v8;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  -[_HMTriggerBuilder __findTriggerOwnedActionSet]((uint64_t)self);
  v4 = (HMActionSetBuilder *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = [HMActionSetBuilder alloc];
    if (self)
      context = self->super._context;
    else
      context = 0;
    v7 = context;
    -[_HMAutomationBuilder home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[HMActionSetBuilder initWithType:context:home:](v5, "initWithType:context:home:", CFSTR("HMActionSetTypeTriggerOwned"), v7, v8);

    -[NSMutableArray insertObject:atIndex:](self->_actionSets, "insertObject:atIndex:", v4, 0);
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addActionSetOfType:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _HMContext *context;
  _HMContext *v9;
  void *v10;
  void *v11;
  _HMTriggerBuilder *v12;
  uint64_t v13;
  void *v14;
  _HMTriggerBuilder *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTriggerBuilder addActionSetOfType:completionHandler:]", CFSTR("completion"));
    v12 = self;
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = v12;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = (const __CFString *)v13;
LABEL_10:
    objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v7 = v6;
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("HMActionSetTypeTriggerOwned")) & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = CFSTR("type must be HMActionSetTypeTriggerOwned");
    goto LABEL_10;
  }
  if (self)
    context = self->super._context;
  else
    context = 0;
  v9 = context;
  -[_HMContext delegateCaller](v9, "delegateCaller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMTriggerBuilder triggerOwnedActionSet](self, "triggerOwnedActionSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callCompletion:actionSet:error:", v7, v11, 0);

}

- (void)addActionSetWithCompletionHandler:(id)a3
{
  -[_HMTriggerBuilder addActionSetOfType:completionHandler:](self, "addActionSetOfType:completionHandler:", CFSTR("HMActionSetTypeTriggerOwned"), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSets, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)__findTriggerOwnedActionSet
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  id v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "firstObject");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1
      && (objc_msgSend(v1, "actionSetType"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HMActionSetTypeTriggerOwned")),
          v3,
          v4))
    {
      v5 = v2;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_removeActionSet:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v4 = -[_HMTriggerBuilder __indexOfActionSet:](a1, v3);
    v5 = v4 != 0x7FFFFFFFFFFFFFFFLL;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(*(id *)(a1 + 64), "removeObjectAtIndex:", v4);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)__indexOfActionSet:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40___HMTriggerBuilder___indexOfActionSet___block_invoke;
  v10[3] = &unk_1E3AADB68;
  v6 = v3;
  v11 = v6;
  v12 = v4;
  v7 = v4;
  v8 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);

  return v8;
}

- (uint64_t)_addActionSet:(uint64_t)a1
{
  id v3;
  os_unfair_lock_s *v4;

  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    a1 = -[_HMTriggerBuilder __addActionSet:](a1, v3);
    os_unfair_lock_unlock(v4);
  }

  return a1;
}

- (uint64_t)__addActionSet:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    if (-[_HMTriggerBuilder __indexOfActionSet:](a1, v3) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
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

- (id)lastFireDate
{
  return 0;
}

- (id)creator
{
  return 0;
}

- (id)creatorDevice
{
  return 0;
}

@end
