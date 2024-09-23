@implementation BSCompoundAssertion

- (NSSet)context
{
  void *v2;
  void *v3;

  -[BSCompoundAssertion orderedContext](self, "orderedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSOrderedSet)orderedContext
{
  os_unfair_lock_s *p_dataLock;
  void *v4;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_not_owner(&self->_dataLock);
  os_unfair_lock_lock(p_dataLock);
  -[BSCompoundAssertion _dataLock_context]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_dataLock);
  return (NSOrderedSet *)v4;
}

- (id)acquireForReason:(id)a3
{
  -[BSCompoundAssertion acquireForReason:withContext:](self, "acquireForReason:withContext:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)acquireForReason:(id)a3 withContext:(id)a4
{
  id v7;
  id v8;
  _BSCompoundAssertionAcquisitionReference *v9;
  id v10;
  id v11;
  NSMutableOrderedSet *v12;
  NSMutableOrderedSet *dataLock_acquisitionRecords;
  _BSCompoundAssertionAcquisitionRecord *v14;
  id *p_isa;
  SEL v16;
  _BSCompoundAssertionAcquisitionReference *v17;
  uint64_t v18;
  id syncLock_block;
  int v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  OS_os_log *dataLock_log;
  NSObject *v24;
  id v25;
  NSString *identifierPrefix;
  int v27;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  BSCompoundAssertion *v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  _BSCompoundAssertionAcquisitionReference *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSCompoundAssertion.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason != nil"));

  }
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  os_unfair_lock_lock(&self->_syncLock);
  if (self->_syncLock_invalid)
  {
    v9 = 0;
    goto LABEL_27;
  }
  v10 = v7;
  v11 = v8;
  os_unfair_lock_assert_owner(&self->_syncLock);
  os_unfair_lock_lock(&self->_dataLock);
  v33 = v10;
  v34 = v11;
  if (!self->_dataLock_acquisitionRecords)
  {
    v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    dataLock_acquisitionRecords = self->_dataLock_acquisitionRecords;
    self->_dataLock_acquisitionRecords = v12;

  }
  v14 = objc_alloc_init(_BSCompoundAssertionAcquisitionRecord);
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_assertion, self);
    objc_setProperty_nonatomic_copy(p_isa, v16, v10, 16);
  }
  -[_BSCompoundAssertionAcquisitionRecord setContext:]((uint64_t)p_isa, v11);
  v17 = objc_alloc_init(_BSCompoundAssertionAcquisitionReference);
  v9 = v17;
  if (v17)
    objc_storeStrong((id *)&v17->_record, p_isa);
  if (p_isa)
    objc_storeWeak(p_isa + 3, v9);
  -[BSCompoundAssertion _dataLock_context]((uint64_t)self);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet addObject:](self->_dataLock_acquisitionRecords, "addObject:", p_isa);
  v18 = -[NSMutableOrderedSet count](self->_dataLock_acquisitionRecords, "count");
  syncLock_block = self->_syncLock_block;
  if (!syncLock_block)
    goto LABEL_17;
  if (v18 == 1)
  {
LABEL_19:
    v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D769CFC](syncLock_block);
    -[BSCompoundAssertion _dataLock_copyState]((uint64_t)self);
    v20 = 1;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v11 && (objc_msgSend(v32, "containsObject:") & 1) == 0)
  {
    syncLock_block = self->_syncLock_block;
    goto LABEL_19;
  }
LABEL_17:
  v20 = 0;
  v21 = 0;
  v22 = 0;
LABEL_20:
  dataLock_log = self->_dataLock_log;
  if (dataLock_log)
  {
    v24 = dataLock_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v21;
      v31 = v8;
      v25 = (id)objc_opt_class();
      identifierPrefix = self->_identifierPrefix;
      v27 = -[NSMutableOrderedSet count](self->_dataLock_acquisitionRecords, "count");
      *(_DWORD *)buf = 138544642;
      v36 = v25;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = identifierPrefix;
      v41 = 2114;
      v42 = v33;
      v43 = 2048;
      v44 = v9;
      v45 = 1024;
      v46 = v27;
      _os_log_impl(&dword_18A184000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> (%{public}@) acquire for reason:%{public}@ acq:%p count:%d", buf, 0x3Au);

      v21 = v30;
      v8 = v31;
    }

  }
  os_unfair_lock_unlock(&self->_dataLock);
  if (v20)
    ((void (**)(_QWORD, void *))v21)[2](v21, v22);

LABEL_27:
  os_unfair_lock_unlock(&self->_syncLock);

  return v9;
}

- (_BSCompoundAssertionState)_dataLock_copyState
{
  _BSCompoundAssertionState *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSOrderedSet *context;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  v2 = objc_alloc_init(_BSCompoundAssertionState);
  v3 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v2)
    v2->_active = v3 != 0;
  -[BSCompoundAssertion _dataLock_context](a1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v2->_context;
    v2->_context = (NSOrderedSet *)v6;

  }
  return v2;
}

- (id)_dataLock_context
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        if (v7)
        {
          v8 = *(id *)(v7 + 32);
          if (v8)
          {
            if (!v3)
              v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
            objc_msgSend(v3, "addObject:", v8, (_QWORD)v11);
          }
        }
        else
        {
          v8 = 0;
        }

        ++v6;
      }
      while (v4 != v6);
      v9 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = v9;
    }
    while (v9);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataLock_log, 0);
  objc_storeStrong((id *)&self->_dataLock_acquisitionRecords, 0);
  objc_storeStrong(&self->_syncLock_block, 0);
  objc_storeStrong((id *)&self->_identifierPrefix, 0);
}

- (BOOL)isActive
{
  BSCompoundAssertion *v2;
  os_unfair_lock_s *p_dataLock;

  v2 = self;
  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_not_owner(&self->_dataLock);
  os_unfair_lock_lock(p_dataLock);
  LOBYTE(v2) = -[NSMutableOrderedSet count](v2->_dataLock_acquisitionRecords, "count") != 0;
  os_unfair_lock_unlock(p_dataLock);
  return (char)v2;
}

+ (BSCompoundAssertion)assertionWithIdentifier:(id)a3 stateDidChangeHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = -[BSCompoundAssertion _initWithIdentifier:]([BSCompoundAssertion alloc], v5);
  v8 = objc_msgSend(v6, "copy");
  v9 = (void *)v7[3];
  v7[3] = v8;

  return (BSCompoundAssertion *)v7;
}

- (id)_initWithIdentifier:(id)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BSCompoundAssertion;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v4 = objc_opt_class();
      if (v4 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSCompoundAssertion is not safe to subclass"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithIdentifier_);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v14 = v9;
          v15 = 2114;
          v16 = v11;
          v17 = 2048;
          v18 = a1;
          v19 = 2114;
          v20 = CFSTR("BSCompoundAssertion.m");
          v21 = 1024;
          v22 = 187;
          v23 = 2114;
          v24 = v8;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1C0D9CLL);
      }
      *((_DWORD *)a1 + 4) = 0;
      *((_DWORD *)a1 + 8) = 0;
      v5 = objc_msgSend(v3, "copy");
      v6 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v5;

    }
  }

  return a1;
}

- (void)invalidate
{
  os_unfair_lock_s *p_syncLock;
  id syncLock_block;
  NSMutableOrderedSet *dataLock_acquisitionRecords;

  p_syncLock = &self->_syncLock;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  os_unfair_lock_lock(p_syncLock);
  if (!self->_syncLock_invalid)
  {
    self->_syncLock_invalid = 1;
    syncLock_block = self->_syncLock_block;
    self->_syncLock_block = 0;

    os_unfair_lock_lock(&self->_dataLock);
    dataLock_acquisitionRecords = self->_dataLock_acquisitionRecords;
    self->_dataLock_acquisitionRecords = 0;

    os_unfair_lock_unlock(&self->_dataLock);
  }
  os_unfair_lock_unlock(p_syncLock);
}

- (void)dealloc
{
  os_unfair_lock_s *p_syncLock;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BSCompoundAssertion *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_syncLock = &self->_syncLock;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  os_unfair_lock_lock(p_syncLock);
  if (!self->_syncLock_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you must invoke -invalidate on BSCompoundAssertion (%@) before releasing"), self->_identifierPrefix);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("BSCompoundAssertion.m");
      v18 = 1024;
      v19 = 209;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1C30F8);
  }
  os_unfair_lock_unlock(p_syncLock);
  v9.receiver = self;
  v9.super_class = (Class)BSCompoundAssertion;
  -[BSCompoundAssertion dealloc](&v9, sel_dealloc);
}

- (void)setLog:(id)a3
{
  OS_os_log *v4;
  OS_os_log *dataLock_log;

  v4 = (OS_os_log *)a3;
  os_unfair_lock_lock(&self->_dataLock);
  dataLock_log = self->_dataLock_log;
  self->_dataLock_log = v4;

  os_unfair_lock_unlock(&self->_dataLock);
}

- (id)_identifier
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

+ (BSCompoundAssertion)new
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSCompoundAssertion *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSCompoundAssertion does not support +new"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("BSCompoundAssertion.m");
    v17 = 1024;
    v18 = 175;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  result = (BSCompoundAssertion *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

- (BSCompoundAssertion)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSCompoundAssertion *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSCompoundAssertion *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSCompoundAssertion does not support -init"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BSCompoundAssertion.m");
    v17 = 1024;
    v18 = 180;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  result = (BSCompoundAssertion *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

+ (BSCompoundAssertion)assertionWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[BSCompoundAssertion _initWithIdentifier:](objc_alloc((Class)a1), v4);

  return (BSCompoundAssertion *)v5;
}

- (NSString)description
{
  os_unfair_lock_s *p_dataLock;
  void *v4;
  uint64_t v5;
  NSString *identifierPrefix;
  void *v7;
  void *v8;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_not_owner(&self->_dataLock);
  os_unfair_lock_lock(p_dataLock);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  identifierPrefix = self->_identifierPrefix;
  -[NSMutableOrderedSet bs_map:](self->_dataLock_acquisitionRecords, "bs_map:", &__block_literal_global_7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p %@> acquisitions:%@"), v5, self, identifierPrefix, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_dataLock);
  return (NSString *)v8;
}

id __34__BSCompoundAssertion_description__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  v3 = v2;
  if (!v2)
  {
    v7 = 0;
    goto LABEL_5;
  }
  v4 = *((id *)v2 + 4);
  if (!v4)
  {
    v7 = (void *)v3[2];
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (context:%@)"), v3[2], v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v6;
}

- (NSSet)reasons
{
  void *v2;
  void *v3;

  -[BSCompoundAssertion orderedReasons](self, "orderedReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSOrderedSet)orderedReasons
{
  os_unfair_lock_s *p_dataLock;
  void *v4;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_not_owner(&self->_dataLock);
  os_unfair_lock_lock(p_dataLock);
  -[NSMutableOrderedSet bs_map:](self->_dataLock_acquisitionRecords, "bs_map:", &__block_literal_global_108);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_dataLock);
  return (NSOrderedSet *)v4;
}

id __37__BSCompoundAssertion_orderedReasons__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(id *)(a2 + 16);
  else
    return 0;
}

- (OS_os_log)log
{
  os_unfair_lock_s *p_dataLock;
  OS_os_log *v4;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  v4 = self->_dataLock_log;
  os_unfair_lock_unlock(p_dataLock);
  return v4;
}

@end
