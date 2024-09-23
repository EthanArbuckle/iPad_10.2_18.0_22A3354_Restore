@implementation _BSErrorConfiguration

- (_QWORD)initWithDomain:(uint64_t)a3 code:
{
  id v5;
  void *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = v5;
    NSClassFromString(CFSTR("NSString"));
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_initWithDomain_code_);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v24 = v15;
        v25 = 2114;
        v26 = v17;
        v27 = 2048;
        v28 = a1;
        v29 = 2114;
        v30 = CFSTR("NSError+BaseBoard.m");
        v31 = 1024;
        v32 = 36;
        v33 = 2114;
        v34 = v14;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B8690);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_initWithDomain_code_);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v24 = v19;
        v25 = 2114;
        v26 = v21;
        v27 = 2048;
        v28 = a1;
        v29 = 2114;
        v30 = CFSTR("NSError+BaseBoard.m");
        v31 = 1024;
        v32 = 36;
        v33 = 2114;
        v34 = v18;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B8794);
    }

    v22.receiver = a1;
    v22.super_class = (Class)_BSErrorConfiguration;
    v8 = objc_msgSendSuper2(&v22, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)v8[1];
      v8[1] = v9;

      v8[2] = a3;
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = (void *)v8[3];
      v8[3] = v11;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setFailureReason:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  _BYTE buf[12];
  __int16 v13;
  void *v14;
  __int16 v15;
  _BSErrorConfiguration *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v9;
        v13 = 2114;
        v14 = v11;
        v15 = 2048;
        v16 = self;
        v17 = 2114;
        v18 = CFSTR("NSError+BaseBoard.m");
        v19 = 1024;
        v20 = 66;
        v21 = 2114;
        v22 = v8;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1C84ECLL);
    }

    *(_QWORD *)buf = &v24;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v5, &v24);

    v5 = (id)v6;
  }
  v7 = (void *)objc_msgSend(v5, "copy");
  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v7, (void *)*MEMORY[0x1E0CB2D68]);

}

- (void)setCodeDescription:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  _BSErrorConfiguration *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v10)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
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
        v16 = self;
        v17 = 2114;
        v18 = CFSTR("NSError+BaseBoard.m");
        v19 = 1024;
        v20 = 103;
        v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1C8704);
    }
  }

  v5 = (void *)objc_msgSend(v10, "copy");
  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v5, CFSTR("BSErrorCodeDescription"));

}

- (void)setFailureDescription:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  _BSErrorConfiguration *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v10)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
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
        v16 = self;
        v17 = 2114;
        v18 = CFSTR("NSError+BaseBoard.m");
        v19 = 1024;
        v20 = 61;
        v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1C8920);
    }
  }

  v5 = (void *)objc_msgSend(v10, "copy");
  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v5, (void *)*MEMORY[0x1E0CB2D60]);

}

- (void)_setObject:(void *)a3 forKey:
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(void **)(a1 + 24);
    if (v7)
      objc_msgSend(v6, "setObject:forKey:", v7, v5);
    else
      objc_msgSend(v6, "removeObjectForKey:", v5);
  }

}

- (_BSErrorConfiguration)init
{
  return (_BSErrorConfiguration *)-[_BSErrorConfiguration initWithDomain:code:](self, 0, 0);
}

- (void)setUserInfoValue:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  _BSErrorConfiguration *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v7 = a4;
  NSClassFromString(CFSTR("NSString"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v27 = v11;
      v28 = 2114;
      v29 = v13;
      v30 = 2048;
      v31 = self;
      v32 = 2114;
      v33 = CFSTR("NSError+BaseBoard.m");
      v34 = 1024;
      v35 = 79;
      v36 = 2114;
      v37 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1F2BD0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v27 = v15;
      v28 = 2114;
      v29 = v17;
      v30 = 2048;
      v31 = self;
      v32 = 2114;
      v33 = CFSTR("NSError+BaseBoard.m");
      v34 = 1024;
      v35 = 79;
      v36 = 2114;
      v37 = v14;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1F2CD4);
  }

  v8 = v25;
  if (v25)
  {
    v9 = objc_msgSend((id)objc_opt_class(), "supportsSecureCoding");
    v8 = v25;
    if ((v9 & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ does not support secure coding. Putting this object in an error is a bad idea"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v27 = v22;
        v28 = 2114;
        v29 = v24;
        v30 = 2048;
        v31 = self;
        v32 = 2114;
        v33 = CFSTR("NSError+BaseBoard.m");
        v34 = 1024;
        v35 = 81;
        v36 = 2114;
        v37 = v21;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1F2DECLL);
    }
  }
  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v8, v7);

}

- (void)setUnderlyingError:(id)a3
{
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BSErrorConfiguration *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v9)
  {
    NSClassFromString(CFSTR("NSError"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSErrorClass]"));
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
        v17 = CFSTR("NSError+BaseBoard.m");
        v18 = 1024;
        v19 = 87;
        v20 = 2114;
        v21 = v5;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1F3040);
    }
  }

  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v9, (void *)*MEMORY[0x1E0CB3388]);
}

- (void)setUnderlyingErrors:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  _BSErrorConfiguration *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    NSClassFromString(CFSTR("NSArray"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v29 = v20;
        v30 = 2114;
        v31 = v22;
        v32 = 2048;
        v33 = self;
        v34 = 2114;
        v35 = CFSTR("NSError+BaseBoard.m");
        v36 = 1024;
        v37 = 92;
        v38 = 2114;
        v39 = v19;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1F3528);
    }
  }

  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v6);
        v10 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        NSClassFromString(CFSTR("NSError"));
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v12 = (id)objc_claimAutoreleasedReturnValue();
            v13 = (objc_class *)objc_opt_class();
            NSStringFromClass(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v29 = v12;
            v30 = 2114;
            v31 = v14;
            v32 = 2048;
            v33 = self;
            v34 = 2114;
            v35 = CFSTR("NSError+BaseBoard.m");
            v36 = 1024;
            v37 = 97;
            v38 = 2114;
            v39 = v11;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          __break(0);
          JUMPOUT(0x18A1F3320);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSErrorClass]"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v29 = v16;
            v30 = 2114;
            v31 = v18;
            v32 = 2048;
            v33 = self;
            v34 = 2114;
            v35 = CFSTR("NSError+BaseBoard.m");
            v36 = 1024;
            v37 = 97;
            v38 = 2114;
            v39 = v15;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
          __break(0);
          JUMPOUT(0x18A1F3424);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v6, (void *)*MEMORY[0x1E0CB2F70]);
}

@end
