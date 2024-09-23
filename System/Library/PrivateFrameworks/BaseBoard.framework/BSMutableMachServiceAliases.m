@implementation BSMutableMachServiceAliases

+ (id)new
{
  BSMutableMachServiceAliases *v2;
  void *v3;
  id *v4;

  v2 = [BSMutableMachServiceAliases alloc];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BSMachServiceAliases _initWithAliases:encoded:mutable:]((id *)&v2->super.super.isa, v3, 0, 1);

  return v4;
}

- (void)setService:(id)a3 forAlias:(id)a4
{
  id v6;
  NSString *lock_encoded;
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  NSMutableDictionary *lock_aliases;
  void *v13;
  void *v14;
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
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  BSMutableMachServiceAliases *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v6 = a4;
  if (self)
  {
    if (!self->super._mutable)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__setService_forAlias_, self, CFSTR("BSMachServiceAliases.m"), 91, CFSTR("cannot mutate an immutable : %@"), self, v33);

    }
    lock_encoded = (NSString *)v33;
    NSClassFromString(CFSTR("NSString"));
    if (!lock_encoded)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setService_forAlias_);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v35 = v16;
        v36 = 2114;
        v37 = v18;
        v38 = 2048;
        v39 = self;
        v40 = 2114;
        v41 = CFSTR("BSMachServiceAliases.m");
        v42 = 1024;
        v43 = 92;
        v44 = 2114;
        v45 = v15;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1E8DD4);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setService_forAlias_);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v35 = v20;
        v36 = 2114;
        v37 = v22;
        v38 = 2048;
        v39 = self;
        v40 = 2114;
        v41 = CFSTR("BSMachServiceAliases.m");
        v42 = 1024;
        v43 = 92;
        v44 = 2114;
        v45 = v19;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1E8ED8);
    }

    v8 = v6;
    NSClassFromString(CFSTR("NSString"));
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setService_forAlias_);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v35 = v24;
        v36 = 2114;
        v37 = v26;
        v38 = 2048;
        v39 = self;
        v40 = 2114;
        v41 = CFSTR("BSMachServiceAliases.m");
        v42 = 1024;
        v43 = 93;
        v44 = 2114;
        v45 = v23;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1E8FDCLL);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setService_forAlias_);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v35 = v28;
        v36 = 2114;
        v37 = v30;
        v38 = 2048;
        v39 = self;
        v40 = 2114;
        v41 = CFSTR("BSMachServiceAliases.m");
        v42 = 1024;
        v43 = 93;
        v44 = 2114;
        v45 = v27;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1E90E0);
    }

    if (!-[NSString length](lock_encoded, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", sel__setService_forAlias_, self, CFSTR("BSMachServiceAliases.m"), 94, CFSTR("machService cannot be empty"));

    }
    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel__setService_forAlias_, self, CFSTR("BSMachServiceAliases.m"), 95, CFSTR("machService cannot be empty"));

    }
    os_unfair_lock_lock(&self->super._lock);
    -[NSMutableDictionary objectForKey:](self->super._lock_aliases, "objectForKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if ((NSString *)v9 != lock_encoded)
    {
      if (v9)
      {
        v11 = -[NSString isEqual:](lock_encoded, "isEqual:", v9);

        if ((v11 & 1) != 0)
          goto LABEL_17;
      }
      lock_aliases = self->super._lock_aliases;
      v13 = (void *)-[NSString copy](lock_encoded, "copy");
      -[NSMutableDictionary setObject:forKey:](lock_aliases, "setObject:forKey:", v13, v8);

      lock_encoded = self->super._lock_encoded;
      self->super._lock_encoded = 0;
    }

LABEL_17:
    os_unfair_lock_unlock(&self->super._lock);
  }

}

@end
