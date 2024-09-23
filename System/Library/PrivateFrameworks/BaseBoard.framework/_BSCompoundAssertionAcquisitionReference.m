@implementation _BSCompoundAssertionAcquisitionReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
}

- (void)invalidate
{
  atomic_flag *p_invalid;
  unsigned __int8 v4;
  _BSCompoundAssertionAcquisitionRecord *record;
  _BSCompoundAssertionAcquisitionReference *v6;
  _BSCompoundAssertionAcquisitionReference *v7;
  _BSCompoundAssertionAcquisitionReference *v8;
  os_unfair_lock_s *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  int v14;
  _BSCompoundAssertionAcquisitionRecord *v15;
  uint64_t v16;
  void *v17;
  id context;
  id v19;
  uint64_t v20;
  void *v21;
  char v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  _BSCompoundAssertionAcquisitionReference *v30;
  char *WeakRetained;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  _BSCompoundAssertionAcquisitionReference *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  p_invalid = &self->_invalid;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalid);
  while (__stlxr(1u, (unsigned __int8 *)p_invalid));
  if ((v4 & 1) == 0)
  {
    record = self->_record;
    if (record)
    {
      WeakRetained = (char *)objc_loadWeakRetained((id *)&record->_assertion);
      v6 = self;
      if (WeakRetained)
      {
        v7 = v6;
        os_unfair_lock_assert_not_owner((const os_unfair_lock *)WeakRetained + 4);
        os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
        v8 = v7;
        os_unfair_lock_assert_owner((const os_unfair_lock *)WeakRetained + 4);
        if (WeakRetained[20])
        {
LABEL_26:

          os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
          -[_BSCompoundAssertionAcquisitionRecord setContext:]((uint64_t)self->_record, 0);
LABEL_27:

          return;
        }
        v9 = (os_unfair_lock_s *)(WeakRetained + 32);
        os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
        v10 = (void *)*((_QWORD *)WeakRetained + 6);
        if (v10)
        {
          v11 = v10;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = (id)objc_opt_class();
            v13 = *((_QWORD *)WeakRetained + 1);
            v14 = objc_msgSend(*((id *)WeakRetained + 5), "count");
            *(_DWORD *)buf = 138544386;
            v33 = v12;
            v34 = 2048;
            v35 = WeakRetained;
            v36 = 2114;
            v37 = v13;
            v38 = 2048;
            v39 = v8;
            v40 = 1024;
            v41 = v14;
            _os_log_impl(&dword_18A184000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> (%{public}@) invalidate acq:%p count:%d", buf, 0x30u);

          }
        }
        if ((objc_msgSend(*((id *)WeakRetained + 5), "containsObject:", self->_record) & 1) == 0)
        {
          os_unfair_lock_unlock(v9);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/BaseBoard/BaseBoard/BSCompoundAssertion.m");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          v27 = CFSTR("<Unknown File>");
          if (v25)
            v27 = (__CFString *)v25;
          v28 = v27;

          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncLock_acquisitionDidInvalidate_, WeakRetained, v28, 433, CFSTR("acquisition invalidated twice"));

        }
        v15 = self->_record;
        objc_msgSend(*((id *)WeakRetained + 5), "removeObject:", v15);
        v16 = objc_msgSend(*((id *)WeakRetained + 5), "count");
        if (!v16)
        {
          v17 = (void *)*((_QWORD *)WeakRetained + 5);
          *((_QWORD *)WeakRetained + 5) = 0;

        }
        if (v15)
          context = v15->_context;
        else
          context = 0;
        v19 = context;
        v20 = *((_QWORD *)WeakRetained + 3);
        if (v16 && v20)
        {
          if (v19)
          {
            -[BSCompoundAssertion _dataLock_context]((uint64_t)WeakRetained);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "containsObject:", v19);

            if ((v22 & 1) == 0)
            {
              v20 = *((_QWORD *)WeakRetained + 3);
LABEL_23:
              v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D769CFC](v20);
              -[BSCompoundAssertion _dataLock_copyState]((uint64_t)WeakRetained);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              os_unfair_lock_unlock(v9);
              ((void (**)(_QWORD, void *))v23)[2](v23, v24);
LABEL_25:

              goto LABEL_26;
            }
          }
        }
        else if (v20)
        {
          goto LABEL_23;
        }
        os_unfair_lock_unlock(v9);
        v24 = 0;
        v23 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v30 = self;
    }
    WeakRetained = 0;
    goto LABEL_27;
  }
}

- (void)dealloc
{
  atomic_flag *p_invalid;
  unsigned __int8 v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  _BSCompoundAssertionAcquisitionReference *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_invalid = &self->_invalid;
  do
    v5 = __ldaxr((unsigned __int8 *)p_invalid);
  while (__stlxr(1u, (unsigned __int8 *)p_invalid));
  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[_BSCompoundAssertionAcquisitionRecord assertion]((id *)&self->_record->super.isa);
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion _identifier](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("client bug: someone forgot to invoke -invalidate on acquisition %@ (assertion: %@)"), self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      v18 = 2048;
      v19 = self;
      v20 = 2114;
      v21 = CFSTR("BSCompoundAssertion.m");
      v22 = 1024;
      v23 = 144;
      v24 = 2114;
      v25 = v9;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BEFA4);
  }
  v13.receiver = self;
  v13.super_class = (Class)_BSCompoundAssertionAcquisitionReference;
  -[_BSCompoundAssertionAcquisitionReference dealloc](&v13, sel_dealloc);
}

- (NSString)description
{
  _BSCompoundAssertionAcquisitionRecord *record;

  record = self->_record;
  if (record)
    record = (_BSCompoundAssertionAcquisitionRecord *)record->_reason;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CAcq %p:%@>"), self, record);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
