@implementation BSMachServiceAliases

void __42__BSMachServiceAliases_environmentAliases__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "environment");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_opt_self();
  v24 = v21;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__aliasesFromEnvironmentRepresentation_);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v30 = v14;
      v31 = 2114;
      v32 = v16;
      v33 = 2048;
      v34 = v0;
      v35 = 2114;
      v36 = CFSTR("BSMachServiceAliases.m");
      v37 = 1024;
      v38 = 70;
      v39 = 2114;
      v40 = v13;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    __break(0);
    JUMPOUT(0x18A197A5CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__aliasesFromEnvironmentRepresentation_);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v30 = v18;
      v31 = 2114;
      v32 = v20;
      v33 = 2048;
      v34 = v0;
      v35 = 2114;
      v36 = CFSTR("BSMachServiceAliases.m");
      v37 = 1024;
      v38 = 70;
      v39 = 2114;
      v40 = v17;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    __break(0);
    JUMPOUT(0x18A197B60);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bs_safeStringForKey:", CFSTR("BSMachServiceAliases"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(","));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, buf, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v26 != v4)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "count") == 2)
          {
            objc_msgSend(v6, "objectAtIndex:", 0);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "stringByRemovingPercentEncoding");
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "objectAtIndex:", 1);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "stringByRemovingPercentEncoding");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v8, "length") && objc_msgSend(v10, "length"))
              objc_msgSend(v1, "setObject:forKey:", v10, v8);

          }
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, buf, 16);
      }
      while (v3);
    }

  }
  v11 = -[BSMachServiceAliases _initWithAliases:encoded:mutable:]((id *)[BSMachServiceAliases alloc], v1, v22, 0);

  v12 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = (uint64_t)v11;

}

- (id)_initWithAliases:(void *)a3 encoded:(char)a4 mutable:
{
  id v8;
  id v9;
  id *v10;
  objc_super v12;

  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BSMachServiceAliases;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      *((_DWORD *)v10 + 6) = 0;
      objc_storeStrong(v10 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      *((_BYTE *)a1 + 28) = a4;
    }
  }

  return a1;
}

+ (id)environmentAliases
{
  if (qword_1ECD398F8 != -1)
    dispatch_once(&qword_1ECD398F8, &__block_literal_global_14);
  return (id)_MergedGlobals_16;
}

- (id)resolveMachService:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  BSMachServiceAliases *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
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
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      v22 = 2048;
      v23 = self;
      v24 = 2114;
      v25 = CFSTR("BSMachServiceAliases.m");
      v26 = 1024;
      v27 = 106;
      v28 = 2114;
      v29 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1C06D4);
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
      v19 = v15;
      v20 = 2114;
      v21 = v17;
      v22 = 2048;
      v23 = self;
      v24 = 2114;
      v25 = CFSTR("BSMachServiceAliases.m");
      v26 = 1024;
      v27 = 106;
      v28 = 2114;
      v29 = v14;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1C07D8);
  }

  if (self->_mutable)
    os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_aliases, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mutable)
    os_unfair_lock_unlock(&self->_lock);
  if (v6)
    v7 = v6;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

- (NSDictionary)environmentRepresentation
{
  os_unfair_lock_s *p_lock;
  NSString *v4;
  void *v5;
  void *v7;
  void *v8;
  NSMutableDictionary *lock_aliases;
  id v10;
  id v11;
  NSString *v12;
  NSString *lock_encoded;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_encoded;
  if (v4)
  {
    os_unfair_lock_unlock(p_lock);
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("BSMachServiceAliases"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSDictionary *)v5;
  }
  if (-[NSMutableDictionary count](self->_lock_aliases, "count"))
  {
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("+-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    lock_aliases = self->_lock_aliases;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __49__BSMachServiceAliases_environmentRepresentation__block_invoke;
    v18 = &unk_1E1EBF2F8;
    v10 = v8;
    v19 = v10;
    v11 = v7;
    v20 = v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lock_aliases, "enumerateKeysAndObjectsUsingBlock:", &v15);
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","), v15, v16, v17, v18);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    lock_encoded = self->_lock_encoded;
    self->_lock_encoded = v12;

    v14 = v12;
    os_unfair_lock_unlock(p_lock);
    v4 = v14;
    if (v14)
      goto LABEL_3;
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (BSMachServiceAliases)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMachServiceAliases.m"), 26, CFSTR("-init is not allowed on BSMachServiceAliases"));

  return 0;
}

void __49__BSMachServiceAliases_environmentRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringByAddingPercentEncodingWithAllowedCharacters:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

}

- (id)copy
{
  return -[BSMachServiceAliases copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  BSMutableMachServiceAliases *v5;
  void *v6;
  id *v7;

  if (!self->_mutable)
    return self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = [BSMutableMachServiceAliases alloc];
  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_lock_aliases, "mutableCopy");
  v7 = -[BSMachServiceAliases _initWithAliases:encoded:mutable:]((id *)&v5->super.super.isa, v6, self->_lock_encoded, 0);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)mutableCopy
{
  return -[BSMachServiceAliases mutableCopyWithZone:](self, "mutableCopyWithZone:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BSMutableMachServiceAliases *v4;
  void *v5;
  id *v6;

  if (self->_mutable)
    os_unfair_lock_lock(&self->_lock);
  v4 = [BSMutableMachServiceAliases alloc];
  v5 = (void *)-[NSMutableDictionary mutableCopy](self->_lock_aliases, "mutableCopy");
  v6 = -[BSMachServiceAliases _initWithAliases:encoded:mutable:]((id *)&v4->super.super.isa, v5, self->_lock_encoded, 1);

  if (self->_mutable)
    os_unfair_lock_unlock(&self->_lock);
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  if (self->_mutable)
    os_unfair_lock_lock(&self->_lock);
  v3 = -[NSMutableDictionary hash](self->_lock_aliases, "hash");
  if (self->_mutable)
    os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BSMachServiceAliases *v4;
  uint64_t v5;
  char v6;

  v4 = (BSMachServiceAliases *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_22;
  }
  v5 = objc_opt_class();
  if (v5 != objc_opt_class() && v5 != objc_opt_class())
  {
    v6 = 0;
    goto LABEL_22;
  }
  if (self >= v4)
  {
    if (v4->_mutable)
      os_unfair_lock_lock(&v4->_lock);
    if (self->_mutable)
      os_unfair_lock_lock(&self->_lock);
    v6 = BSEqualDictionaries((CFDictionaryRef)self->_lock_aliases, (const __CFDictionary *)v4->_lock_aliases);
    if (v4->_mutable)
      os_unfair_lock_unlock(&v4->_lock);
    if (self->_mutable)
      goto LABEL_23;
  }
  else
  {
    if (self->_mutable)
      os_unfair_lock_lock(&self->_lock);
    if (v4->_mutable)
      os_unfair_lock_lock(&v4->_lock);
    v6 = BSEqualDictionaries((CFDictionaryRef)self->_lock_aliases, (const __CFDictionary *)v4->_lock_aliases);
    if (self->_mutable)
      os_unfair_lock_unlock(&self->_lock);
    self = v4;
    if (v4->_mutable)
LABEL_23:
      os_unfair_lock_unlock(&self->_lock);
  }
LABEL_22:

  return v6;
}

- (id)description
{
  void *v3;

  if (self->_mutable)
    os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> %@"), objc_opt_class(), self, self->_lock_aliases);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mutable)
    os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_encoded, 0);
  objc_storeStrong((id *)&self->_lock_aliases, 0);
}

@end
