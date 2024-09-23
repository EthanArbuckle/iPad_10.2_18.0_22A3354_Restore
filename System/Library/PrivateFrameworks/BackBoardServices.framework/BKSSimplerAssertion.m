@implementation BKSSimplerAssertion

- (BKSSimplerAssertion)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSSimplerAssertion *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSSimplerAssertion *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot -init"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BKSSimplerAssertion.m");
    v17 = 1024;
    v18 = 36;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSSimplerAssertion *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  atomic_flag *p_invalid;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BKSSimplerAssertion *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_invalid = &self->_invalid;
  do
    v5 = __ldaxr((unsigned __int8 *)p_invalid);
  while (__stlxr(1u, (unsigned __int8 *)p_invalid));
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client code must invalidate <%@:%p> (%@) before dealloc"), objc_opt_class(), self, self->_identifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("BKSSimplerAssertion.m");
      v19 = 1024;
      v20 = 58;
      v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A127A94);
  }
  v10.receiver = self;
  v10.super_class = (Class)BKSSimplerAssertion;
  -[BKSSimplerAssertion dealloc](&v10, sel_dealloc);
}

- (NSString)description
{
  return self->_identifier;
}

- (void)invalidate
{
  atomic_flag *p_invalid;
  unsigned __int8 v4;
  id invalidationBlock;

  p_invalid = &self->_invalid;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalid);
  while (__stlxr(1u, (unsigned __int8 *)p_invalid));
  if ((v4 & 1) == 0)
  {
    (*((void (**)(void))self->_invalidationBlock + 2))();
    invalidationBlock = self->_invalidationBlock;
    self->_invalidationBlock = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
  int v9;
  void *v10;
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot +new"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BKSSimplerAssertion.m");
    v17 = 1024;
    v18 = 31;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)assertionWithDescription:(id)a3 invalidationBlock:(id)a4
{
  id v5;
  id v6;
  BKSSimplerAssertion *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  id invalidationBlock;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  BKSSimplerAssertion *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [BKSSimplerAssertion alloc];
  v8 = v6;
  v9 = v5;
  if (v7)
  {
    v34.receiver = v7;
    v34.super_class = (Class)BKSSimplerAssertion;
    v7 = objc_msgSendSuper2(&v34, sel_init);
    if (v7)
    {
      v10 = v8;
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_opt_class();
      v12 = (objc_class *)objc_opt_class();
      if (!v10)
      {
        NSStringFromClass(v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("string"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithIdentifier_invalidationBlock_);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v36 = v18;
          v37 = 2114;
          v38 = v20;
          v39 = 2048;
          v40 = v7;
          v41 = 2114;
          v42 = CFSTR("BKSSimplerAssertion.m");
          v43 = 1024;
          v44 = 43;
          v45 = 2114;
          v46 = v17;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A127E68);
      }
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        v22 = (objc_class *)objc_msgSend(v10, "classForCoder");
        if (!v22)
          v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("string"), v23, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithIdentifier_invalidationBlock_);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v36 = v27;
          v37 = 2114;
          v38 = v29;
          v39 = 2048;
          v40 = v7;
          v41 = 2114;
          v42 = CFSTR("BKSSimplerAssertion.m");
          v43 = 1024;
          v44 = 43;
          v45 = 2114;
          v46 = v26;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A127FA4);
      }

      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block != ((void *)0)"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithIdentifier_invalidationBlock_);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v36 = v31;
          v37 = 2114;
          v38 = v33;
          v39 = 2048;
          v40 = v7;
          v41 = 2114;
          v42 = CFSTR("BKSSimplerAssertion.m");
          v43 = 1024;
          v44 = 44;
          v45 = 2114;
          v46 = v30;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A128098);
      }
      objc_storeStrong((id *)&v7->_identifier, a3);
      v13 = objc_msgSend(v9, "copy");
      invalidationBlock = v7->_invalidationBlock;
      v7->_invalidationBlock = (id)v13;

    }
  }

  return v7;
}

@end
