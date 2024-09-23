@implementation BSOrderedDictionaryKeyStrategy

- (int64_t)limitCount
{
  return self->_limitCount;
}

+ (id)sortByInsertionOrder
{
  if (_MergedGlobals_36 != -1)
    dispatch_once(&_MergedGlobals_36, &__block_literal_global_34);
  return (id)qword_1ECD39B30;
}

+ (id)new
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  id result;
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("use one of the class methods"));
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
    v16 = CFSTR("BSOrderedDictionary.m");
    v17 = 1024;
    v18 = 37;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  result = (id)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

- (BSOrderedDictionaryKeyStrategy)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSOrderedDictionaryKeyStrategy *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSOrderedDictionaryKeyStrategy *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("use one of the class methods"));
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
    v16 = CFSTR("BSOrderedDictionary.m");
    v17 = 1024;
    v18 = 42;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  result = (BSOrderedDictionaryKeyStrategy *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

void __54__BSOrderedDictionaryKeyStrategy_sortByInsertionOrder__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BSOrderedDictionaryKeyStrategy _init]([BSOrderedDictionaryKeyStrategy alloc], "_init");
  v1 = (void *)qword_1ECD39B30;
  qword_1ECD39B30 = (uint64_t)v0;

}

- (id)_init
{
  BSOrderedDictionaryKeyStrategy *v3;
  uint64_t v4;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BSOrderedDictionaryKeyStrategy *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)BSOrderedDictionaryKeyStrategy;
  v3 = -[BSOrderedDictionaryKeyStrategy init](&v10, sel_init);
  if (v3)
  {
    v4 = objc_opt_class();
    if (v4 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subclassing not permitted"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v12 = v7;
        v13 = 2114;
        v14 = v9;
        v15 = 2048;
        v16 = v3;
        v17 = 2114;
        v18 = CFSTR("BSOrderedDictionary.m");
        v19 = 1024;
        v20 = 60;
        v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      __break(0);
      JUMPOUT(0x18A210808);
    }
  }
  return v3;
}

+ (id)sortByInsertionOrderWithEntryLimit:(int64_t)a3
{
  id v4;

  v4 = -[BSOrderedDictionaryKeyStrategy _init]([BSOrderedDictionaryKeyStrategy alloc], "_init");
  objc_msgSend(v4, "setLimitCount:", a3);
  return v4;
}

+ (id)sortUsingComparator:(id)a3
{
  id v4;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("comparator != ((void *)0)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = a1;
      v18 = 2114;
      v19 = CFSTR("BSOrderedDictionary.m");
      v20 = 1024;
      v21 = 72;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    __break(0);
    JUMPOUT(0x18A210A14);
  }
  v4 = -[BSOrderedDictionaryKeyStrategy _init]([BSOrderedDictionaryKeyStrategy alloc], "_init");
  objc_msgSend(v4, "setKeyComparator:", a3);
  return v4;
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (id)keyComparator
{
  return self->_keyComparator;
}

- (void)setKeyComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyComparator, 0);
}

@end
