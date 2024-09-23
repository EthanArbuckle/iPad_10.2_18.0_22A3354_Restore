@implementation BSMutableOrderedDictionary

- (void)addObject:(id)a3 toCollectionClass:(Class)a4 forKey:(id)a5
{
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BSMutableOrderedDictionary *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() != a4 && (Class)objc_opt_class() != a4 && (Class)objc_opt_class() != a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' must be NSMutableSet, NSMutableOrderedSet, or NSMutableArray, not (%@)"), a5, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v16 = v11;
      v17 = 2114;
      v18 = v13;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = CFSTR("BSOrderedDictionary.m");
      v23 = 1024;
      v24 = 536;
      v25 = 2114;
      v26 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BE74CLL);
  }
  -[BSOrderedDictionary objectForKey:](self, "objectForKey:", a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(a4);
    -[BSMutableOrderedDictionary setObject:forKey:](self, "setObject:forKey:", v14, a5);
  }
  objc_msgSend(v14, "addObject:", a3);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  NSArray *v10;
  NSDictionary *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BSOrderedDictionaryKeyStrategy *keyOrderingStrategy;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  void *v26;
  id v27;
  objc_class *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  BSMutableOrderedDictionary *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = -[BSOrderedDictionary count](self, "count");
  if (self)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("inKey != ((void *)0)"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setObject_forKey_atIndex_);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v32 = v19;
        v33 = 2114;
        v34 = v21;
        v35 = 2048;
        v36 = self;
        v37 = 2114;
        v38 = CFSTR("BSOrderedDictionary.m");
        v39 = 1024;
        v40 = 457;
        v41 = 2114;
        v42 = v18;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1BEA50);
    }
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("object != ((void *)0)"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setObject_forKey_atIndex_);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v32 = v23;
        v33 = 2114;
        v34 = v25;
        v35 = 2048;
        v36 = self;
        v37 = 2114;
        v38 = CFSTR("BSOrderedDictionary.m");
        v39 = 1024;
        v40 = 458;
        v41 = 2114;
        v42 = v22;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1BEB54);
    }
    v8 = v7;
    v9 = -[BSOrderedDictionary count](self, "count");
    if (v9 < v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx:%d greater than count:%d"), v8, v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setObject_forKey_atIndex_);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v32 = v27;
        v33 = 2114;
        v34 = v29;
        v35 = 2048;
        v36 = self;
        v37 = 2114;
        v38 = CFSTR("BSOrderedDictionary.m");
        v39 = 1024;
        v40 = 460;
        v41 = 2114;
        v42 = v26;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1BEC50);
    }
    v30 = (id)objc_msgSend(a4, "copyWithZone:", 0);
    v10 = self->super._keys;
    v11 = self->super._values;
    -[NSDictionary objectForKey:](v11, "objectForKey:", v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[NSArray indexOfObject:](v10, "indexOfObject:", v30);
      -[NSArray removeObjectAtIndex:](v10, "removeObjectAtIndex:", v13);
      -[NSDictionary removeObjectForKey:](v11, "removeObjectForKey:", v30);
      --v9;
      v8 -= v13 <= v8;
    }
    v14 = -[BSOrderedDictionaryKeyStrategy limitCount](self->super._keyOrderingStrategy, "limitCount");
    if (v14 >= 1)
    {
      v15 = v9 - v14 + 1;
      if (v15 >= 1)
      {
        -[BSMutableOrderedDictionary removeObjectsInRange:](self, "removeObjectsInRange:", 0, v15);
        if (v8 <= v15)
          v16 = 0;
        else
          v16 = v15;
        v8 -= v16;
      }
    }
    keyOrderingStrategy = self->super._keyOrderingStrategy;
    if (keyOrderingStrategy)
    {
      if (keyOrderingStrategy->_keyComparator)
        v8 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v10, "indexOfObject:inSortedRange:options:usingComparator:", v30, 0, -[NSArray count](v10, "count"), 1024, self->super._keyOrderingStrategy->_keyComparator);
    }
    -[NSArray insertObject:atIndex:](v10, "insertObject:atIndex:", v30, v8);
    -[NSDictionary setObject:forKey:](v11, "setObject:forKey:", a3, v30);

  }
}

- (BSMutableOrderedDictionary)init
{
  void *v3;
  BSMutableOrderedDictionary *v4;

  +[BSOrderedDictionaryKeyStrategy sortByInsertionOrder](BSOrderedDictionaryKeyStrategy, "sortByInsertionOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BSMutableOrderedDictionary initWithKeyOrderingStrategy:](self, "initWithKeyOrderingStrategy:", v3);

  return v4;
}

- (BSMutableOrderedDictionary)initWithKeyOrderingStrategy:(id)a3
{
  id v6;
  BSMutableOrderedDictionary *v7;
  NSArray *v8;
  NSArray *keys;
  NSDictionary *v10;
  NSDictionary *values;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  BSMutableOrderedDictionary *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("strategy"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v17;
      v32 = 2114;
      v33 = v19;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("BSOrderedDictionary.m");
      v38 = 1024;
      v39 = 348;
      v40 = 2114;
      v41 = v16;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BF934);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v21)
      v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("strategy"), v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v31 = v26;
      v32 = 2114;
      v33 = v28;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = CFSTR("BSOrderedDictionary.m");
      v38 = 1024;
      v39 = 348;
      v40 = 2114;
      v41 = v25;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BFA7CLL);
  }

  v29.receiver = self;
  v29.super_class = (Class)BSMutableOrderedDictionary;
  v7 = -[BSOrderedDictionary _initTabulaRasa](&v29, sel__initTabulaRasa);
  if (v7)
  {
    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    keys = v7->super._keys;
    v7->super._keys = v8;

    v10 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    values = v7->super._values;
    v7->super._values = v10;

    objc_storeStrong((id *)&v7->super._keyOrderingStrategy, a3);
  }
  return v7;
}

- (BSMutableOrderedDictionary)initWithCapacity:(unint64_t)a3 keyOrderingStrategy:(id)a4
{
  id v8;
  BSMutableOrderedDictionary *v9;
  uint64_t v10;
  NSArray *keys;
  uint64_t v12;
  NSDictionary *values;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  BSMutableOrderedDictionary *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("strategy"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v33 = v19;
      v34 = 2114;
      v35 = v21;
      v36 = 2048;
      v37 = self;
      v38 = 2114;
      v39 = CFSTR("BSOrderedDictionary.m");
      v40 = 1024;
      v41 = 360;
      v42 = 2114;
      v43 = v18;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    __break(0);
    JUMPOUT(0x18A211A50);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_msgSend(v8, "classForCoder");
    if (!v23)
      v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("strategy"), v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v33 = v28;
      v34 = 2114;
      v35 = v30;
      v36 = 2048;
      v37 = self;
      v38 = 2114;
      v39 = CFSTR("BSOrderedDictionary.m");
      v40 = 1024;
      v41 = 360;
      v42 = 2114;
      v43 = v27;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    __break(0);
    JUMPOUT(0x18A211B98);
  }

  v31.receiver = self;
  v31.super_class = (Class)BSMutableOrderedDictionary;
  v9 = -[BSOrderedDictionary _initTabulaRasa](&v31, sel__initTabulaRasa);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    keys = v9->super._keys;
    v9->super._keys = (NSArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
    values = v9->super._values;
    v9->super._values = (NSDictionary *)v12;

    objc_storeStrong((id *)&v9->super._keyOrderingStrategy, a4);
  }
  return v9;
}

- (BSMutableOrderedDictionary)initWithDictionary:(id)a3 keyOrderingStrategy:(id)a4
{
  id v7;
  id v8;
  BSMutableOrderedDictionary *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  id v30;
  objc_class *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  id v37;
  objc_class *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  id v46;
  objc_class *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  BSMutableOrderedDictionary *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("dictionary"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v21;
      v56 = 2114;
      v57 = v23;
      v58 = 2048;
      v59 = self;
      v60 = 2114;
      v61 = CFSTR("BSOrderedDictionary.m");
      v62 = 1024;
      v63 = 372;
      v64 = 2114;
      v65 = v20;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    __break(0);
    JUMPOUT(0x18A211EFCLL);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = (objc_class *)objc_msgSend(v7, "classForCoder");
    if (!v25)
      v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("dictionary"), v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v30;
      v56 = 2114;
      v57 = v32;
      v58 = 2048;
      v59 = self;
      v60 = 2114;
      v61 = CFSTR("BSOrderedDictionary.m");
      v62 = 1024;
      v63 = 372;
      v64 = 2114;
      v65 = v29;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    __break(0);
    JUMPOUT(0x18A212044);
  }

  v8 = a4;
  if (!v8)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("strategy"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v37;
      v56 = 2114;
      v57 = v39;
      v58 = 2048;
      v59 = self;
      v60 = 2114;
      v61 = CFSTR("BSOrderedDictionary.m");
      v62 = 1024;
      v63 = 373;
      v64 = 2114;
      v65 = v36;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    __break(0);
    JUMPOUT(0x18A212164);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1E0CB3940];
    v41 = (objc_class *)objc_msgSend(v8, "classForCoder");
    if (!v41)
      v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("strategy"), v42, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v46;
      v56 = 2114;
      v57 = v48;
      v58 = 2048;
      v59 = self;
      v60 = 2114;
      v61 = CFSTR("BSOrderedDictionary.m");
      v62 = 1024;
      v63 = 373;
      v64 = 2114;
      v65 = v45;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v45), "UTF8String");
    __break(0);
    JUMPOUT(0x18A2122ACLL);
  }

  v9 = -[BSMutableOrderedDictionary initWithCapacity:keyOrderingStrategy:](self, "initWithCapacity:keyOrderingStrategy:", objc_msgSend(v7, "count"), v8);
  if (v9)
  {
    objc_msgSend(v7, "allKeys");
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v50 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSMutableOrderedDictionary setObject:forKey:](v9, "setObject:forKey:", v15, v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v11);
    }

  }
  return v9;
}

- (BSMutableOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  const void **v7;
  unint64_t v8;
  const void **v9;
  void *v10;
  BSMutableOrderedDictionary *v11;
  id v12;
  id v13;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  BSMutableOrderedDictionary *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), a4, a5, CFSTR("objects != ((void *)0)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v28 = v16;
      v29 = 2114;
      v30 = v18;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BSOrderedDictionary.m");
      v35 = 1024;
      v36 = 386;
      v37 = 2114;
      v38 = v15;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    __break(0);
    JUMPOUT(0x18A2125D8);
  }
  v7 = a4;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), 0, a5, CFSTR("keys != ((void *)0)"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v28 = v20;
      v29 = 2114;
      v30 = v22;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BSOrderedDictionary.m");
      v35 = 1024;
      v36 = 387;
      v37 = 2114;
      v38 = v19;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    __break(0);
    JUMPOUT(0x18A2126DCLL);
  }
  v8 = a5;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("count > 0"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v28 = v24;
      v29 = 2114;
      v30 = v26;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BSOrderedDictionary.m");
      v35 = 1024;
      v36 = 388;
      v37 = 2114;
      v38 = v23;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    __break(0);
    JUMPOUT(0x18A2127E0);
  }
  v9 = a3;
  +[BSOrderedDictionaryKeyStrategy sortByInsertionOrder](BSOrderedDictionaryKeyStrategy, "sortByInsertionOrder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BSMutableOrderedDictionary initWithCapacity:keyOrderingStrategy:](self, "initWithCapacity:keyOrderingStrategy:", v8, v10);

  if (v11)
  {
    do
    {
      v12 = (id)*v7;
      v13 = (id)*v9;
      -[BSMutableOrderedDictionary setObject:forKey:](v11, "setObject:forKey:", v13, v12);

      ++v9;
      ++v7;
      --v8;
    }
    while (v8);
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)-[BSOrderedDictionary _initWithCopyOfOrderedDictionary:]([BSOrderedDictionary alloc], (id *)&self->super.super.isa);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSMutableOrderedDictionary)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSMutableOrderedDictionary;
  return -[BSOrderedDictionary initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSMutableOrderedDictionary;
  -[BSOrderedDictionary encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BSOrderedDictionaryKeyStrategy)keyOrderingStrategy
{
  BSOrderedDictionaryKeyStrategy *keyOrderingStrategy;

  keyOrderingStrategy = self->super._keyOrderingStrategy;
  if (keyOrderingStrategy)
    return keyOrderingStrategy;
  +[BSOrderedDictionaryKeyStrategy sortByInsertionOrder](BSOrderedDictionaryKeyStrategy, "sortByInsertionOrder");
  return (BSOrderedDictionaryKeyStrategy *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setKeyOrderingStrategy:(id)a3
{
  BSOrderedDictionaryKeyStrategy *v4;
  uint64_t v5;
  id *v6;
  NSArray *v7;
  NSArray *keys;
  NSDictionary *v9;
  NSDictionary *values;
  BSOrderedDictionaryKeyStrategy *v11;

  v4 = (BSOrderedDictionaryKeyStrategy *)a3;
  if (!v4)
  {
    +[BSOrderedDictionaryKeyStrategy sortByInsertionOrder](BSOrderedDictionaryKeyStrategy, "sortByInsertionOrder");
    v4 = (BSOrderedDictionaryKeyStrategy *)objc_claimAutoreleasedReturnValue();
  }
  if (self->super._keyOrderingStrategy != v4)
  {
    v11 = v4;
    objc_storeStrong((id *)&self->super._keyOrderingStrategy, v4);
    v5 = -[BSOrderedDictionaryKeyStrategy limitCount](v11, "limitCount");
    if (v5 >= 1 && (int64_t)(-[BSOrderedDictionary count](self, "count") - v5) >= 1)
      -[BSMutableOrderedDictionary removeObjectsInRange:](self, "removeObjectsInRange:", 0);
    v4 = v11;
    if (v11->_keyComparator)
    {
      -[BSOrderedDictionary sortedDictionaryUsingComparator:](self, "sortedDictionaryUsingComparator:");
      v6 = (id *)objc_claimAutoreleasedReturnValue();
      v7 = (NSArray *)objc_msgSend(v6[1], "mutableCopy");
      keys = self->super._keys;
      self->super._keys = v7;

      v9 = (NSDictionary *)objc_msgSend(v6[2], "mutableCopy");
      values = self->super._values;
      self->super._values = v9;

      v4 = v11;
    }
  }

}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a3)
    -[BSMutableOrderedDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
  else
    -[BSMutableOrderedDictionary removeObjectForKey:](self, "removeObjectForKey:", a4);
}

- (void)addEntriesFromOrderedDictionary:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  BSMutableOrderedDictionary *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("otherDictionary"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v10;
      v25 = 2114;
      v26 = v12;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = CFSTR("BSOrderedDictionary.m");
      v31 = 1024;
      v32 = 518;
      v33 = 2114;
      v34 = v9;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    __break(0);
    JUMPOUT(0x18A212C54);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_msgSend(v5, "classForCoder");
    if (!v14)
      v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("otherDictionary"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v19;
      v25 = 2114;
      v26 = v21;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = CFSTR("BSOrderedDictionary.m");
      v31 = 1024;
      v32 = 518;
      v33 = 2114;
      v34 = v18;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    __break(0);
    JUMPOUT(0x18A212D9CLL);
  }

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62__BSMutableOrderedDictionary_addEntriesFromOrderedDictionary___block_invoke;
  v22[3] = &unk_1E1EC02D8;
  v22[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsWithIndexesUsingBlock:", v22);
}

uint64_t __62__BSMutableOrderedDictionary_addEntriesFromOrderedDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a2, a3);
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  BSMutableOrderedDictionary *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("otherDictionary"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v10;
      v25 = 2114;
      v26 = v12;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = CFSTR("BSOrderedDictionary.m");
      v31 = 1024;
      v32 = 527;
      v33 = 2114;
      v34 = v9;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    __break(0);
    JUMPOUT(0x18A213018);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_msgSend(v5, "classForCoder");
    if (!v14)
      v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("otherDictionary"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v19;
      v25 = 2114;
      v26 = v21;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = CFSTR("BSOrderedDictionary.m");
      v31 = 1024;
      v32 = 527;
      v33 = 2114;
      v34 = v18;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    __break(0);
    JUMPOUT(0x18A213160);
  }

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__BSMutableOrderedDictionary_addEntriesFromDictionary___block_invoke;
  v22[3] = &unk_1E1EC0300;
  v22[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v22);
}

uint64_t __55__BSMutableOrderedDictionary_addEntriesFromDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a2, a3);
}

- (void)removeObject:(id)a3 fromCollectionForKey:(id)a4
{
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BSMutableOrderedDictionary *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[BSOrderedDictionary objectForKey:](self, "objectForKey:", a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0 && (_NSIsNSArray() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' must be NSMutableSet, NSMutableOrderedSet, or NSMutableArray, not (%@)"), a4, objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v14 = v9;
          v15 = 2114;
          v16 = v11;
          v17 = 2048;
          v18 = self;
          v19 = 2114;
          v20 = CFSTR("BSOrderedDictionary.m");
          v21 = 1024;
          v22 = 553;
          v23 = 2114;
          v24 = v8;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        __break(0);
        JUMPOUT(0x18A2133ECLL);
      }
      objc_msgSend(v12, "removeObject:", a3);
      if (!objc_msgSend(v12, "count"))
        -[BSMutableOrderedDictionary removeObjectForKey:](self, "removeObjectForKey:", a4);
    }

  }
}

- (void)removeObjectForKey:(id)a3
{
  NSDictionary *v5;
  NSArray *v6;

  if (a3)
  {
    v6 = self->super._keys;
    v5 = self->super._values;
    -[NSArray removeObject:](v6, "removeObject:", a3);
    -[NSDictionary removeObjectForKey:](v5, "removeObjectForKey:", a3);

  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  NSDictionary *v5;
  void *v6;
  NSArray *v7;

  v7 = self->super._keys;
  v5 = self->super._values;
  -[NSArray objectAtIndex:](v7, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray removeObject:](v7, "removeObject:", v6);
  -[NSDictionary removeObjectForKey:](v5, "removeObjectForKey:", v6);

}

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v7;
  NSDictionary *v8;
  void *v9;
  _QWORD *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  void *v31;
  id v32;
  objc_class *v33;
  void *v34;
  NSArray *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  BSMutableOrderedDictionary *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;
  NSRange v49;

  length = a3.length;
  location = a3.location;
  v48 = *MEMORY[0x1E0C80C00];
  if (a3.location >= 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromRange(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("range.location too large: %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v37 = v15;
      v38 = 2114;
      v39 = v17;
      v40 = 2048;
      v41 = self;
      v42 = 2114;
      v43 = CFSTR("BSOrderedDictionary.m");
      v44 = 1024;
      v45 = 583;
      v46 = 2114;
      v47 = v14;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    __break(0);
    JUMPOUT(0x18A2137F8);
  }
  if (a3.length >= 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromRange(a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("range.length too large: %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v37 = v21;
      v38 = 2114;
      v39 = v23;
      v40 = 2048;
      v41 = self;
      v42 = 2114;
      v43 = CFSTR("BSOrderedDictionary.m");
      v44 = 1024;
      v45 = 584;
      v46 = 2114;
      v47 = v20;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    __break(0);
    JUMPOUT(0x18A213910);
  }
  v7 = -[BSOrderedDictionary count](self, "count");
  if (location + length > v7)
  {
    v24 = v7;
    v25 = (void *)MEMORY[0x1E0CB3940];
    v49.location = location;
    v49.length = length;
    NSStringFromRange(v49);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("range (%@) exceeds self.count (%d)"), v26, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v37 = v28;
      v38 = 2114;
      v39 = v30;
      v40 = 2048;
      v41 = self;
      v42 = 2114;
      v43 = CFSTR("BSOrderedDictionary.m");
      v44 = 1024;
      v45 = 586;
      v46 = 2114;
      v47 = v27;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    __break(0);
    JUMPOUT(0x18A213A2CLL);
  }
  v35 = self->super._keys;
  v8 = self->super._values;
  if (location || length != -[BSOrderedDictionary count](self, "count"))
  {
    if (length)
    {
      if (length == 1)
      {
        -[NSArray objectAtIndex:](v35, "objectAtIndex:", location);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray removeObjectAtIndex:](v35, "removeObjectAtIndex:", location);
        -[NSDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

      }
      else
      {
        v10 = malloc_type_malloc(8 * length, 0x80040B8603338uLL);
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unix can't run out of memory! you will regret this! (failed to allocate for %d items)"), length);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            v33 = (objc_class *)objc_opt_class();
            NSStringFromClass(v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v37 = v32;
            v38 = 2114;
            v39 = v34;
            v40 = 2048;
            v41 = self;
            v42 = 2114;
            v43 = CFSTR("BSOrderedDictionary.m");
            v44 = 1024;
            v45 = 602;
            v46 = 2114;
            v47 = v31;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
          __break(0);
          JUMPOUT(0x18A213B28);
        }
        -[NSArray getObjects:range:](v35, "getObjects:range:", v10, location, length);
        -[NSArray removeObjectsInRange:](v35, "removeObjectsInRange:", location, length);
        for (i = 0; i != length; ++i)
          -[NSDictionary removeObjectForKey:](v8, "removeObjectForKey:", v10[i]);
        free(v10);
      }
    }
  }
  else
  {
    -[NSArray removeAllObjects](v35, "removeAllObjects");
    -[NSDictionary removeAllObjects](v8, "removeAllObjects");
  }

}

- (void)removeAllObjects
{
  NSDictionary *v3;
  NSArray *v4;

  v4 = self->super._keys;
  v3 = self->super._values;
  -[NSArray removeAllObjects](v4, "removeAllObjects");
  -[NSDictionary removeAllObjects](v3, "removeAllObjects");

}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[BSMutableOrderedDictionary removeObjectForKey:](self, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

@end
