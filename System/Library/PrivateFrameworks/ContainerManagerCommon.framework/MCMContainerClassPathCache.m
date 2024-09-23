@implementation MCMContainerClassPathCache

- (MCMContainerClassPathCache)initWithUserIdentityCache:(id)a3
{
  id v5;
  MCMContainerClassPathCache *v6;
  uint64_t v7;
  NSMutableDictionary *lookup;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCMContainerClassPathCache;
  v6 = -[MCMContainerClassPathCache init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    lookup = v6->_lookup;
    v6->_lookup = (NSMutableDictionary *)v7;

    v6->_lookupLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_userIdentityCache, a3);
  }

  return v6;
}

- (id)containerClassPathForContainerIdentity:(id)a3 typeClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMContainerClassPathCache containerClassPathForUserIdentity:containerConfig:typeClass:](self, "containerClassPathForUserIdentity:containerConfig:typeClass:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  -[MCMContainerClassPathCache userIdentityCache](self, "userIdentityCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userIdentityForContainerConfig:originatorUserIdentity:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lookupLock);
  -[MCMContainerClassPathCache _lock_containerClassPathForUserIdentity:containerConfig:typeClass:](self, "_lock_containerClassPathForUserIdentity:containerConfig:typeClass:", v11, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lookupLock);
  return v12;
}

- (void)flush
{
  os_unfair_lock_s *p_lookupLock;

  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  -[MCMContainerClassPathCache _lock_flush](self, "_lock_flush");
  os_unfair_lock_unlock(p_lookupLock);
}

- (id)referenceForPOSIXUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(id *, void *);
  void *v20;
  id v21;
  MCMContainerClassPathCache *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerClassPathCache userIdentityCache](self, "userIdentityCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke;
  v24[3] = &unk_1E8CB5330;
  v25 = v4;
  v9 = v6;
  v26 = v9;
  v10 = v4;
  objc_msgSend(v7, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v24);

  v11 = containermanager_copy_global_configuration();
  objc_msgSend(v11, "classIterator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8;
  v18 = 3221225472;
  v19 = __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke_2;
  v20 = &unk_1E8CB5358;
  v21 = v9;
  v22 = self;
  v23 = v5;
  v13 = v5;
  v14 = v9;
  objc_msgSend(v12, "selectWithIterator:", &v17);

  v15 = (void *)objc_msgSend(v13, "copy", v17, v18, v19, v20);
  return v15;
}

- (id)containerClassPathWithURL:(id)a3 reference:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "hasPrefix:", v11))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4
{
  -[MCMContainerClassPathCache flush](self, "flush", a3, a4);
}

- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4
{
  ;
}

- (id)_lock_containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5
{
  id v8;
  id v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_owner(&self->_lookupLock);
  v10 = objc_msgSend(v9, "containerClass");

  NSStringFromClass(a5);
  v11 = (char *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_lookup, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = (void *)MEMORY[0x1E0C99E08];
      +[MCMContainerClassPath containerPathTypeClasses](MCMContainerClassPath, "containerPathTypeClasses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lookup, "setObject:forKeyedSubscript:", v12, v11);
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 15);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v8);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[objc_class containerPathForUserIdentity:containerClass:](a5, "containerPathForUserIdentity:containerClass:", v8, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v23 = 138413058;
        v24 = v11;
        v25 = 2112;
        v26 = v8;
        v27 = 2048;
        v28 = v10;
        v29 = 2112;
        v30 = v17;
        _os_log_debug_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEBUG, "Container class path cache miss, creating type = [%@], userIdentity = [%@], class = %llu: %@", (uint8_t *)&v23, 0x2Au);
      }

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v19);

      }
    }
    v20 = v17;

    v21 = v20;
  }
  else
  {
    container_log_handle_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v23 = 136315138;
      v24 = "-[MCMContainerClassPathCache _lock_containerClassPathForUserIdentity:containerConfig:typeClass:]";
      _os_log_fault_impl(&dword_1CF807000, v20, OS_LOG_TYPE_FAULT, "Cannot call %s with a nil user identity.", (uint8_t *)&v23, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (void)_lock_flush
{
  NSMutableDictionary *v3;
  NSMutableDictionary *lookup;

  os_unfair_lock_assert_owner(&self->_lookupLock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  lookup = self->_lookup;
  self->_lookup = v3;

}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
}

void __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "userIdentityWithPOSIXUser:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:");

}

void __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  id v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  _QWORD v44[2];
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  void *v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultUserIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v3;
  if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", objc_msgSend(v3, "containerClass")))
  {
    v7 = a1[4];
LABEL_11:

    v6 = v7;
    goto LABEL_12;
  }
  v8 = objc_msgSend(v3, "containerClass");
  if (v8 <= 8 && ((1 << v8) & 0x12A) != 0)
  {
    v9 = containermanager_copy_global_configuration();
    v10 = objc_msgSend(v9, "bundleContainerMode");

    if (v10 == 1)
    {
      +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "globalBundleUserIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v56;
LABEL_10:
      objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v3 = v37;
      v6 = v11;
      goto LABEL_11;
    }
  }
  if ((objc_msgSend(v3, "containerClass") & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    v15 = containermanager_copy_global_configuration();
    v16 = objc_msgSend(v15, "systemContainerMode");

    if (v16 == 1)
    {
      +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "globalSystemUserIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v55;
      goto LABEL_10;
    }
  }
LABEL_12:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v6;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v52;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v52 != v33)
          objc_enumerationMutation(obj);
        v35 = v17;
        v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v17);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v44[0] = objc_opt_class();
        v44[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v47 != v22)
                objc_enumerationMutation(v19);
              v24 = *(objc_class **)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_msgSend(a1[5], "containerClassPathForUserIdentity:containerConfig:typeClass:", v18, v3, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v25;
              if (v25)
              {
                objc_msgSend(v25, "classURL");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "path");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "stringByAppendingString:", CFSTR("/"));
                v29 = objc_claimAutoreleasedReturnValue();

                v3 = v37;
                objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v26, v29);
              }
              else
              {
                container_log_handle_for_category();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v18, "shortDescription");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v3, "containerClass");
                  NSStringFromClass(v24);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v39 = v36;
                  v40 = 2048;
                  v41 = v30;
                  v3 = v37;
                  v42 = 2112;
                  v43 = v31;
                  _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "Could not fetch a class path; userIdentity = %@, class = %llu, type = %@",
                    buf,
                    0x20u);

                }
              }

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
          }
          while (v21);
        }

        v17 = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
    }
    while (v34);
  }

}

@end
