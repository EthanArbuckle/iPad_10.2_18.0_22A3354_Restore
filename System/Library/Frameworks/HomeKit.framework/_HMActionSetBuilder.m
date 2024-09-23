@implementation _HMActionSetBuilder

- (Class)class
{
  return (Class)objc_opt_class();
}

- (_HMActionSetBuilder)initWithType:(id)a3 context:(id)a4 home:(id)a5
{
  id v9;
  _HMActionSetBuilder *v10;
  _HMActionSetBuilder *v11;
  NSMutableArray *v12;
  NSMutableArray *actions;
  HMApplicationData *v14;
  HMApplicationData *applicationData;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HMActionSetBuilder;
  v10 = -[_HMAutomationBuilder initWithContext:home:](&v17, sel_initWithContext_home_, a4, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_type, a3);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v11->_actions;
    v11->_actions = v12;

    v14 = objc_alloc_init(HMApplicationData);
    applicationData = v11->_applicationData;
    v11->_applicationData = v14;

  }
  return v11;
}

- (_HMActionSetBuilder)initWithActionSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _HMActionSetBuilder *v7;
  int v8;
  void *v9;
  _HMActionSetBuilder *v10;
  uint64_t v11;
  NSString *type;
  NSMutableArray *v13;
  NSMutableArray *actions;
  uint64_t v15;
  NSString *name;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  HMApplicationData *applicationData;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_14;
  objc_msgSend(v5, "context");
  v7 = (_HMActionSetBuilder *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_15;
  v8 = objc_msgSend(v6, "areAutomationBuildersSupported");

  if (!v8)
  {
LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v6, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)_HMActionSetBuilder;
  v10 = -[_HMAutomationBuilder initWithContext:home:](&v32, sel_initWithContext_home_, v9, v6);

  if (v10)
  {
    objc_msgSend(v4, "actionSetType");
    v11 = objc_claimAutoreleasedReturnValue();
    type = v10->_type;
    v10->_type = (NSString *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v10->_actions;
    v10->_actions = v13;

    objc_msgSend(v4, "name");
    v15 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v15;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "actions", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v21), "copy");
          objc_msgSend(v6, "context");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "__configureWithContext:actionSet:", v23, v4);

          -[NSMutableArray addObject:](v10->_actions, "addObject:", v22);
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "applicationData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    applicationData = v10->_applicationData;
    v10->_applicationData = (HMApplicationData *)v25;

  }
  self = v10;
  v7 = self;
LABEL_15:

  return v7;
}

- (NSString)actionSetType
{
  return self->_type;
}

- (BOOL)isEmpty
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray count](self->_actions, "count"))
    v4 = 0;
  else
    v4 = -[HMApplicationData isEmpty](self->_applicationData, "isEmpty");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)copyAsBuilder
{
  HMActionSetBuilder *v3;
  _HMActionSetBuilder *v4;
  HMActionSetBuilder *v5;

  v3 = [HMActionSetBuilder alloc];
  v4 = self;
  v5 = -[HMActionSetBuilder initWithActionSet:](v3, "initWithActionSet:", v4);

  return v5;
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

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)updateName:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  unint64_t v9;
  _HMContext *context;
  _HMContext *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _HMContext *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _HMActionSetBuilder *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMActionSetBuilder updateName:completionHandler:]", CFSTR("completion"));
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
      v25 = v21;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v8 = v7;
  if (v23)
  {
    v9 = objc_msgSend(v23, "length");
    if (HMMaxLengthForNaming__hmf_once_t5 != -1)
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
    if (v9 <= HMMaxLengthForNaming__hmf_once_v6)
    {
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)&self->_name, a3);
      os_unfair_lock_unlock(&self->super._lock);
      v11 = self->super._context;
      -[_HMContext delegateCaller](v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "callCompletion:error:", v8, 0);
      goto LABEL_14;
    }
    if (self)
      context = self->super._context;
    else
      context = 0;
    v11 = context;
    -[_HMContext delegateCaller](v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 46;
  }
  else
  {
    if (self)
      v15 = self->super._context;
    else
      v15 = 0;
    v11 = v15;
    -[_HMContext delegateCaller](v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 20;
  }
  objc_msgSend(v13, "hmErrorWithCode:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "callCompletion:error:", v8, v16);

LABEL_14:
}

- (NSSet)actions
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_actions);
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)addAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _HMActionSetBuilder *v7;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMActionSetBuilder addAction:]", CFSTR("action"));
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
  -[_HMActionSetBuilder _addAction:]((id *)&self->super.super.isa, v4);

}

- (void)addAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  _HMContext *v10;
  char v11;
  _HMContext *v12;
  _HMContext *v13;
  _HMContext *v14;
  _HMContext *v15;
  void *v16;
  _HMContext *v17;
  _HMContext *context;
  _HMContext *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _HMActionSetBuilder *v25;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMActionSetBuilder addAction:completionHandler:]", CFSTR("completion"));
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
  if (!v6)
  {
    if (self)
      context = self->super._context;
    else
      context = 0;
    v10 = context;
    -[_HMContext delegateCaller](v10, "delegateCaller");
    v13 = (_HMContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v15 = (_HMContext *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v16 = v8;
    v17 = v15;
    goto LABEL_15;
  }
  v29 = 0;
  v9 = objc_msgSend(v6, "isValidWithError:", &v29);
  v10 = (_HMContext *)v29;
  if ((v9 & 1) == 0)
  {
    if (self)
      v19 = self->super._context;
    else
      v19 = 0;
    v13 = v19;
    -[_HMContext delegateCaller](v13, "delegateCaller");
    v14 = (_HMContext *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10)
    {
      v16 = v8;
      v17 = v10;
      goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = 3;
LABEL_18:
    objc_msgSend(v20, "hmErrorWithCode:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMContext callCompletion:error:](v15, "callCompletion:error:", v8, v22);

    goto LABEL_19;
  }
  v11 = -[_HMActionSetBuilder _addAction:]((id *)&self->super.super.isa, v6);
  if (self)
    v12 = self->super._context;
  else
    v12 = 0;
  v13 = v12;
  -[_HMContext delegateCaller](v13, "delegateCaller");
  v14 = (_HMContext *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v11 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = 1;
    goto LABEL_18;
  }
  v16 = v8;
  v17 = 0;
LABEL_15:
  -[_HMContext callCompletion:error:](v14, "callCompletion:error:", v16, v17);
LABEL_19:

}

- (void)removeAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _HMActionSetBuilder *v7;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMActionSetBuilder removeAction:]", CFSTR("action"));
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
  -[_HMActionSetBuilder _removeAction:]((uint64_t)self, v4);

}

- (void)removeAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  _HMContext *v9;
  _HMContext *v10;
  void *v11;
  void *v12;
  _HMContext *context;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _HMActionSetBuilder *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMActionSetBuilder removeAction:completionHandler:]", CFSTR("completion"));
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
      v25 = v21;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v7 = v6;
  if (!v23)
  {
    if (self)
      context = self->super._context;
    else
      context = 0;
    v10 = context;
    -[_HMContext delegateCaller](v10, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 20;
    goto LABEL_11;
  }
  v8 = -[_HMActionSetBuilder _removeAction:]((uint64_t)self, v23);
  if (self)
    v9 = self->super._context;
  else
    v9 = 0;
  v10 = v9;
  -[_HMContext delegateCaller](v10, "delegateCaller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v8)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 2;
LABEL_11:
    objc_msgSend(v14, "hmErrorWithCode:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "callCompletion:error:", v7, v16);

    goto LABEL_12;
  }
  objc_msgSend(v11, "callCompletion:error:", v7, 0);
LABEL_12:

}

- (void)setActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *actions;
  _HMContext *v15;
  _HMActionSetBuilder *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  _HMActionSetBuilder *v24;
  NSObject *v25;
  void *v26;
  id v27;
  os_unfair_lock_t lock;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMActionSetBuilder setActions:]", CFSTR("actions"));
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
      v41 = v26;
      v42 = 2112;
      v43 = v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v5 = v4;
  lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v6 = (void *)-[NSMutableArray mutableCopy](self->_actions, "mutableCopy");
  -[NSMutableArray removeAllObjects](self->_actions, "removeAllObjects");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v11 = objc_opt_class();
        if (v11 == objc_opt_class())
        {
          _HMFPreconditionFailure();
          __break(1u);
        }
        v12 = (void *)objc_msgSend(v10, "copy");
        v13 = objc_msgSend(v6, "indexOfObject:", v12);
        actions = self->_actions;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((-[NSMutableArray containsObject:](self->_actions, "containsObject:", v12) & 1) == 0)
          {
            v15 = self->super._context;
            v16 = self;
            objc_msgSend(v12, "__configureWithContext:actionSet:", v15, v16);

            -[NSMutableArray addObject:](self->_actions, "addObject:", v12);
          }
        }
        else
        {
          objc_msgSend(v6, "objectAtIndex:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](actions, "addObject:", v17);

          objc_msgSend(v6, "removeObjectAtIndex:", v13);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v7);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "_unconfigure");
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v19);
  }

  os_unfair_lock_unlock(lock);
}

- (HMApplicationData)applicationData
{
  return self->_applicationData;
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _HMContext *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (self->_applicationData != a3)
  {
    objc_msgSend(a3, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMApplicationData setDictionary:](self->_applicationData, "setDictionary:", v6);

  }
  v7 = self->super._context;
  -[_HMContext delegateCaller](v7, "delegateCaller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callCompletion:error:", v9, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (BOOL)_removeAction:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v4 = objc_msgSend(*(id *)(a1 + 56), "indexOfObject:", v3);
    v5 = v4 != 0x7FFFFFFFFFFFFFFFLL;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_unconfigure");

      objc_msgSend(*(id *)(a1 + 56), "removeObjectAtIndex:", v4);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_addAction:(id *)a1
{
  id v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  id *v9;
  uint64_t result;

  v3 = a2;
  if (!a1)
  {
LABEL_6:

    return (uint64_t)a1;
  }
  v4 = (os_unfair_lock_s *)(a1 + 1);
  os_unfair_lock_lock_with_options();
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v6 = (void *)objc_msgSend(v3, "copy");
    v7 = objc_msgSend(a1[7], "containsObject:", v6);
    if ((v7 & 1) == 0)
    {
      v8 = a1[4];
      v9 = a1;
      objc_msgSend(v6, "__configureWithContext:actionSet:", v8, v9);

      objc_msgSend(v9[7], "addObject:", v6);
    }
    a1 = (id *)(v7 ^ 1u);

    os_unfair_lock_unlock(v4);
    goto LABEL_6;
  }
  result = _HMFPreconditionFailure();
  __break(1u);
  return result;
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

- (BOOL)isExecuting
{
  return 0;
}

- (id)lastExecutionDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
}

@end
