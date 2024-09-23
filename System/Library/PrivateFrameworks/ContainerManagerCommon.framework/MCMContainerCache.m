@implementation MCMContainerCache

- (id)classCacheForContainerIdentity:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "transient");
  v6 = objc_msgSend(v4, "containerClass");
  objc_msgSend(v4, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__11801;
  v21 = __Block_byref_object_dispose__11802;
  v22 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__MCMContainerCache_classCacheForContainerIdentity___block_invoke;
  v12[3] = &unk_1E8CB6340;
  v12[4] = self;
  v13 = v7;
  v14 = &v17;
  v15 = v6;
  v16 = v5;
  v9 = v7;
  dispatch_sync(queue, v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)entryForContainerIdentity:(id)a3 classCache:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  MCMError *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v25 = 138412290;
  while (1)
  {
    v11 = v10;
    objc_msgSend(v8, "cacheEntryForIdentifier:", v9, v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_7:
      v15 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 21, 3);
      v13 = 0;
      if (!a5)
        goto LABEL_14;
LABEL_8:
      if (!v13)
      {
        v15 = objc_retainAutorelease(v15);
        *a5 = v15;
      }
      goto LABEL_14;
    }
    v13 = v12;
    if ((objc_msgSend(v12, "verify") & 1) != 0)
      break;
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v25;
      v28 = v9;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Incoherent cache detected (stale cache entry) while looking up [%@]. Recovering by forcing cache resync.", buf, 0xCu);
    }

    objc_msgSend(v8, "resyncRequired");
    v10 = 1;
    if ((v11 & 1) != 0)
      goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
    goto LABEL_14;
  }
  v16 = v7;
  objc_msgSend(v16, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqual:", v18);

  if ((v19 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v22;
      v29 = 2112;
      v30 = v24;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Matching cache entry found, but UUIDs mismatch: requested = [%@] vs. cache entry = [%@]", buf, 0x16u);

    }
    v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 21);
    v13 = 0;
  }

  if (a5)
    goto LABEL_8;
LABEL_14:

  return v13;
}

void __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "isNoSpecificPersona");
        v10 = *(void **)(a1 + 40);
        if (v9)
        {
          objc_msgSend(v10, "userIdentityCache");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = v6;
          v17[1] = 3221225472;
          v17[2] = __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke_2;
          v17[3] = &unk_1E8CB6390;
          v12 = *(_QWORD *)(a1 + 64);
          v13 = *(void **)(a1 + 48);
          v17[4] = *(_QWORD *)(a1 + 40);
          v20 = v12;
          v21 = *(_BYTE *)(a1 + 72);
          v14 = v13;
          v15 = *(_QWORD *)(a1 + 56);
          v18 = v14;
          v19 = v15;
          objc_msgSend(v11, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v17);

        }
        else
        {
          objc_msgSend(v10, "_queue_containerClassCacheForUserIdentity:containerClass:transient:", v8, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
          else
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v4);
  }

}

void __52__MCMContainerCache_classCacheForContainerIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_containerClassCacheForUserIdentity:containerClass:transient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_containerClassCacheForUserIdentity:(id)a3 containerClass:(unint64_t)a4 transient:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *queue;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  queue = self->_queue;
  v9 = a3;
  dispatch_assert_queue_V2(queue);
  -[MCMContainerCache _containerClassPathForUserIdentity:containerClass:transient:](self, "_containerClassPathForUserIdentity:containerClass:transient:", v9, a4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMContainerCache _queue_containerClassCacheForContainerClassPath:](self, "_queue_containerClassCacheForContainerClassPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_containerClassPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4 transient:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = containermanager_copy_global_configuration();
  objc_msgSend(v7, "staticConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configForContainerClass:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = containermanager_copy_global_configuration();
  objc_msgSend(v10, "classPathCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerClassPathForUserIdentity:containerConfig:typeClass:", v6, v9, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_queue_containerClassCacheForContainerClassPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_cache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc(-[MCMContainerCache classCacheClass](self, "classCacheClass"));
    v7 = -[MCMContainerCache cacheEntryClass](self, "cacheEntryClass");
    -[MCMContainerCache userIdentityCache](self, "userIdentityCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithContainerClassPath:cacheEntryClass:targetQueue:userIdentityCache:", v4, v7, 0, v8);

    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEFAULT, "Create cache for %@: %@", (uint8_t *)&v12, 0x16u);
    }

    if (v5)
    {
      -[MCMContainerCache _queue_setContainerClassCache:](self, "_queue_setContainerClassCache:", v5);
    }
    else
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_fault_impl(&dword_1CF807000, v10, OS_LOG_TYPE_FAULT, "Could not create cache for %@", (uint8_t *)&v12, 0xCu);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (id)entriesForUserIdentities:(id)a3 contentClass:(unint64_t)a4 transient:(BOOL)a5 error:(id *)a6
{
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *queue;
  uint64_t v17;
  id v18;
  int v19;
  NSObject *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  void *context;
  MCMError *v30;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD block[4];
  id v38;
  MCMContainerCache *v39;
  id v40;
  __int128 *p_buf;
  unint64_t v42;
  BOOL v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 buf;
  uint64_t v50;
  char v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = container_class_normalized();
  context = (void *)MEMORY[0x1D17D7010]();
  if (!+[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", v8))
  {
    -[MCMContainerCache userIdentityCache](self, "userIdentityCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultUserIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    {
      -[MCMContainerCache userIdentityCache](self, "userIdentityCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "globalSystemUserIdentity");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    if (v8 <= 8 && ((1 << v8) & 0x12A) != 0)
    {
      -[MCMContainerCache userIdentityCache](self, "userIdentityCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "globalBundleUserIdentity");
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v15 = objc_claimAutoreleasedReturnValue();

    v33 = (id)v15;
  }
  if (v8 - 1 >= 0xE)
  {
    v30 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 47, 3);
    container_log_handle_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Invalid Content Class: %ld", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v50 = 0x2020000000;
    v51 = 0;
    queue = self->_queue;
    v17 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke;
    block[3] = &unk_1E8CB63B8;
    v38 = v33;
    v39 = self;
    v42 = v8;
    v43 = a5;
    v18 = v32;
    v40 = v18;
    p_buf = &buf;
    dispatch_sync(queue, block);
    v19 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      v30 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 43, 4);
    else
      v30 = 0;

    _Block_object_dispose(&buf, 8);
    if (v19)
      goto LABEL_16;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v20 = v18;
    v23 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "resyncRequired");
          objc_msgSend(v26, "waitForSynchronizationToComplete");
          v35[0] = v17;
          v35[1] = 3221225472;
          v35[2] = __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke_3;
          v35[3] = &unk_1E8CB63E0;
          v36 = v27;
          v28 = v27;
          objc_msgSend(v26, "enumerateCacheEntriesWithEnumerator:", v35);
          objc_msgSend(v34, "addObjectsFromArray:", v28);

        }
        v23 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
      }
      while (v23);
    }
  }

LABEL_16:
  objc_autoreleasePoolPop(context);
  if (a6 && !v34)
    *a6 = objc_retainAutorelease(v30);
  v21 = (void *)objc_msgSend(v34, "copy");

  return v21;
}

uint64_t __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (id)entryForContainerIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  MCMError *v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMContainerCache classCacheForContainerIdentity:](self, "classCacheForContainerIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11[0] = 0;
    -[MCMContainerCache entryForContainerIdentity:classCache:error:](self, "entryForContainerIdentity:classCache:error:", v6, v7, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (MCMError *)v11[0];
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v9 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 43);
    v8 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v8)
    *a4 = objc_retainAutorelease(v9);
LABEL_7:

  return v8;
}

- (MCMContainerCache)initWithUserIdentityCache:(id)a3 childParentMapCache:(id)a4 classCacheClass:(Class)a5 cacheEntryClass:(Class)a6 queue:(id)a7
{
  id v13;
  id v14;
  id v15;
  MCMContainerCache *v16;
  MCMContainerCache *v17;
  uint64_t v18;
  NSMutableDictionary *queue_cache;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MCMContainerCache;
  v16 = -[MCMContainerCache init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_classCacheClass, a5);
    objc_storeStrong((id *)&v17->_cacheEntryClass, a6);
    objc_storeStrong((id *)&v17->_childParentMapCache, a4);
    v18 = objc_opt_new();
    queue_cache = v17->_queue_cache;
    v17->_queue_cache = (NSMutableDictionary *)v18;

    objc_storeStrong((id *)&v17->_userIdentityCache, a3);
    objc_storeStrong((id *)&v17->_queue, a7);
  }

  return v17;
}

- (MCMContainerCache)initWithUserIdentityCache:(id)a3 childParentMapCache:(id)a4 classCacheClass:(Class)a5 cacheEntryClass:(Class)a6 error:(id *)a7
{
  id v11;
  id v12;
  dispatch_queue_t v13;
  MCMContainerCache *v14;
  MCMContainerCache *v15;

  v11 = a4;
  v12 = a3;
  v13 = dispatch_queue_create("com.apple.containermanagerd.cache", 0);
  v14 = -[MCMContainerCache initWithUserIdentityCache:childParentMapCache:classCacheClass:cacheEntryClass:queue:](self, "initWithUserIdentityCache:childParentMapCache:classCacheClass:cacheEntryClass:queue:", v12, v11, a5, a6, v13);

  v15 = v14;
  return v15;
}

- (void)setContainerClassCache:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MCMContainerCache_setContainerClassCache___block_invoke;
  block[3] = &unk_1E8CB6318;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (int64_t)countContainersForOtherUserIdentitiesWithIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  int64_t v9;
  _QWORD v11[4];
  id v12;
  MCMContainerCache *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11801;
  v20 = __Block_byref_object_dispose__11802;
  v21 = 0;
  -[MCMContainerCache userIdentityCache](self, "userIdentityCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__MCMContainerCache_countContainersForOtherUserIdentitiesWithIdentity_error___block_invoke;
  v11[3] = &unk_1E8CB6368;
  v14 = &v16;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v15 = &v22;
  objc_msgSend(v7, "forEachAccessibleUserIdentitySynchronouslyExecuteBlock:", v11);

  v9 = v23[3];
  if (a4 && v9 < 0)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = v23[3];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (id)addContainerMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *queue;
  id v10;
  MCMContainerCacheEntry *v11;
  void *v12;
  MCMContainerCacheEntry *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  MCMError *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "containerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerClassPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__11801;
  v30 = __Block_byref_object_dispose__11802;
  v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MCMContainerCache_addContainerMetadata_error___block_invoke;
  block[3] = &unk_1E8CB6408;
  v25 = &v26;
  block[4] = self;
  v10 = v8;
  v24 = v10;
  dispatch_sync(queue, block);
  if (!v27[5])
  {
    v18 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 43, 4);
    v16 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v11 = [MCMContainerCacheEntry alloc];
  -[MCMContainerCache userIdentityCache](self, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MCMContainerCacheEntry initWithMetadata:userIdentityCache:](v11, "initWithMetadata:userIdentityCache:", v6, v12);

  v14 = (void *)v27[5];
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCacheEntry:forIdentifier:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "containerPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "containerClassPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v21;
    v34 = 2112;
    v35 = v22;
    _os_log_debug_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEBUG, "Cache: %@: Added Identifier: %@", buf, 0x16u);

  }
  v18 = 0;
  if (a4)
  {
LABEL_7:
    if (!v16)
      *a4 = objc_retainAutorelease(v18);
  }
LABEL_9:

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (BOOL)removeContainerForUserIdentity:(id)a3 contentClass:(unint64_t)a4 identifier:(id)a5 transient:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *queue;
  void *v15;
  id v16;
  MCMError *v17;
  BOOL v18;
  NSObject *v19;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__11801;
  v30 = __Block_byref_object_dispose__11802;
  v31 = 0;
  if (a4 - 1 >= 0xE)
  {
    v17 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 47, 3);
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v33 = a4;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Invalid Content Class: %ld", buf, 0xCu);
    }

    if (!a7)
      goto LABEL_9;
    goto LABEL_7;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__MCMContainerCache_removeContainerForUserIdentity_contentClass_identifier_transient_error___block_invoke;
  block[3] = &unk_1E8CB6340;
  v23 = &v26;
  block[4] = self;
  v22 = v12;
  v24 = a4;
  v25 = a6;
  dispatch_sync(queue, block);

  v15 = (void *)v27[5];
  if (!v15)
  {
    v17 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 43, 4);
    if (!a7)
    {
LABEL_9:
      v18 = 0;
      goto LABEL_10;
    }
LABEL_7:
    v17 = objc_retainAutorelease(v17);
    v18 = 0;
    *a7 = v17;
    goto LABEL_10;
  }
  v16 = (id)objc_msgSend(v15, "setCacheEntry:forIdentifier:", 0, v13);
  v17 = 0;
  v18 = 1;
LABEL_10:
  _Block_object_dispose(&v26, 8);

  return v18;
}

- (void)flushCacheForUserIdentity:(id)a3 containerClass:(unint64_t)a4 transient:(BOOL)a5
{
  id v7;
  uint64_t v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = container_class_normalized();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MCMContainerCache_flushCacheForUserIdentity_containerClass_transient___block_invoke;
  block[3] = &unk_1E8CB6430;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a5;
  v10 = v7;
  dispatch_sync(queue, block);

}

- (void)flush
{
  NSObject *queue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__MCMContainerCache_flush__block_invoke;
  v3[3] = &unk_1E8CB6458;
  v3[4] = self;
  dispatch_sync(queue, v3);
}

- (void)invalidateUserIdentity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MCMContainerCache_invalidateUserIdentity___block_invoke;
  block[3] = &unk_1E8CB6318;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)didInvalidateUserIdentity:(id)a3
{
  -[MCMContainerCache invalidateUserIdentity:](self, "invalidateUserIdentity:", a3);
}

- (void)_queue_invalidateUserIdentity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  uint32_t v9;
  uint32_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Clearing container cache entries corresponding to invalidated user identity; identity = %@",
      buf,
      0xCu);
  }

  v6 = containermanager_copy_global_configuration();
  objc_msgSend(v6, "classIterator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__MCMContainerCache__queue_invalidateUserIdentity___block_invoke;
  v12[3] = &unk_1E8CB64A8;
  v12[4] = self;
  v13 = v4;
  v8 = v4;
  objc_msgSend(v7, "selectUserWithIterator:", v12);

  v9 = notify_post((const char *)*MEMORY[0x1E0C803E8]);
  if (v9)
  {
    v10 = v9;
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v15) = v10;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Could not post user-invalidated notification: %u", buf, 8u);
    }

  }
}

- (void)_queue_flushCacheForContainerClassPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  int v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  MCMContainerCache *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  _BYTE v37[14];
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  _BYTE v43[14];
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v5 = objc_msgSend(v4, "containerClass");
    objc_msgSend(v4, "userIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v6, "posixUser");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMContainerClassPath posixOwnerForContainerClass:user:](MCMContainerClassPath, "posixOwnerForContainerClass:user:", v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "UID");
      v11 = 1;
      switch(v5)
      {
        case 2:
        case 4:
        case 6:
        case 9:
        case 10:
        case 11:
          break;
        case 7:
          if ((_os_feature_enabled_impl() & 1) != 0)
            goto LABEL_21;
          v11 = 2;
          break;
        case 12:
          if ((_os_feature_enabled_impl() & 1) != 0)
            goto LABEL_21;
          v10 = 0;
          v11 = 4;
          break;
        case 13:
          if ((_os_feature_enabled_impl() & 1) != 0)
            goto LABEL_21;
          v10 = 0;
          v11 = 8;
          break;
        default:
          goto LABEL_21;
      }
      v31 = v4;
      v29 = v6;
      v12 = v6;
      v34 = v12;
      v13 = v9;
      v35 = v13;
      v14 = sandbox_user_state_iterate_items();
      if (v14)
      {
        v15 = v14;
        container_log_handle_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v37 = v15;
          _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Failed to read back sandbox cache when trying to flush it; result = %d",
            buf,
            8u);
        }

      }
      v27 = v9;
      v28 = v8;
      v32 = v5;
      v30 = self;
      v17 = objc_msgSend(v12, "kernelPersonaID");
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v18 = v13;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v46 != v21)
              objc_enumerationMutation(v18);
            v33 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i)), "UTF8String");
            v23 = sandbox_set_user_state_item_with_persona();
            if (v23)
            {
              v24 = v23;
              container_log_handle_for_category();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110402;
                *(_DWORD *)v37 = v10;
                *(_WORD *)&v37[4] = 2048;
                *(_QWORD *)&v37[6] = v11;
                v38 = 2080;
                v39 = v33;
                v40 = 2048;
                v41 = v32;
                v42 = 2080;
                *(_QWORD *)v43 = 0;
                *(_WORD *)&v43[8] = 1024;
                *(_DWORD *)&v43[10] = v24;
                _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Failed to remove mapping for user: %u, itemType: %llu, identifier: %s, class: %llu, path: %s : %d", buf, 0x36u);
              }
            }
            else
            {
              container_log_handle_for_category();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67110402;
                *(_DWORD *)v37 = v10;
                *(_WORD *)&v37[4] = 2048;
                *(_QWORD *)&v37[6] = v11;
                v38 = 2080;
                v39 = v33;
                v40 = 2048;
                v41 = v32;
                v42 = 1024;
                *(_DWORD *)v43 = v17;
                *(_WORD *)&v43[4] = 2080;
                *(_QWORD *)&v43[6] = 0;
                _os_log_impl(&dword_1CF807000, v25, OS_LOG_TYPE_DEFAULT, "Pushed user: %u, itemType: %llu, identifier %s, class: %llu, persona id: %d, path: %s", buf, 0x36u);
              }
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
        }
        while (v20);
      }

      self = v30;
      v4 = v31;
      v8 = v28;
      v6 = v29;
      v9 = v27;
LABEL_21:

    }
  }
  -[NSMutableDictionary removeObjectForKey:](self->_queue_cache, "removeObjectForKey:", v4);
  container_log_handle_for_category();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v37 = v4;
    _os_log_impl(&dword_1CF807000, v26, OS_LOG_TYPE_DEFAULT, "Cache: %@: Flushed", buf, 0xCu);
  }

}

- (void)_queue_flush
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v3 = containermanager_copy_global_configuration();
    objc_msgSend(v3, "defaultUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UID");

    v5 = sandbox_user_state_iterate_items();
    if (v5)
    {
      v6 = v5;
      container_log_handle_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9[0] = 67109120;
        v9[1] = v6;
        _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Failed to read back sandbox cache when trying to flush it; result = %d",
          (uint8_t *)v9,
          8u);
      }

    }
  }
  -[NSMutableDictionary removeAllObjects](self->_queue_cache, "removeAllObjects");
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1CF807000, v8, OS_LOG_TYPE_DEFAULT, "All caches flushed", (uint8_t *)v9, 2u);
  }

}

- (void)_queue_setContainerClassCache:(id)a3
{
  id v4;
  NSMutableDictionary *queue_cache;
  id v6;

  v4 = a3;
  -[MCMContainerCache _queue_attachSandboxWriteThroughHandlerToContainerClassCache:](self, "_queue_attachSandboxWriteThroughHandlerToContainerClassCache:", v4);
  queue_cache = self->_queue_cache;
  objc_msgSend(v4, "containerClassPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](queue_cache, "setObject:forKeyedSubscript:", v4);

}

- (id)_sandboxSentinelForContainerClass:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.containermanagerd.%llu"), a3);
}

- (BOOL)_sandboxSentinelExistsForContainerClass:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[MCMContainerCache _sandboxSentinelForContainerClass:](self, "_sandboxSentinelForContainerClass:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = containermanager_copy_global_configuration();
  objc_msgSend(v5, "defaultUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UID");
  v7 = v4;
  v8 = sandbox_user_state_iterate_items();

  if (v8)
  {
    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v17 = a3;
      v18 = 1024;
      v19 = v8;
      _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Failed to read back sandbox cache; class = %llu, result = %d",
        buf,
        0x12u);
    }

  }
  v10 = *((_BYTE *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return v10;
}

- (void)_sandboxSetSentinelForContainerClass:(unint64_t)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint8_t buf[4];
  unint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[MCMContainerCache _sandboxSentinelForContainerClass:](self, "_sandboxSentinelForContainerClass:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  v5 = containermanager_copy_global_configuration();
  objc_msgSend(v5, "defaultUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UID");
  v7 = sandbox_set_user_state_item_with_persona();

  if (v7)
  {
    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v10 = a3;
      v11 = 1024;
      v12 = v7;
      _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Failed to set sandbox sentinel; class = %llu, result = %d",
        buf,
        0x12u);
    }

  }
}

- (BOOL)_concurrent_setSandboxContainerMappingForUserIdentity:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5 url:(id)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  uint64_t v17;
  id v18;
  int v19;
  int v20;
  NSObject *v21;
  int v23;
  int v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  _BYTE v31[14];
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  _BYTE v37[14];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  v11 = a3;
  v12 = objc_msgSend(v11, "kernelPersonaID");
  objc_msgSend(v11, "posixUser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMContainerClassPath posixOwnerForContainerClass:user:](MCMContainerClassPath, "posixOwnerForContainerClass:user:", a5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "UID");
  v16 = 1;
  v17 = 2;
  switch(a5)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 8uLL:
    case 0xEuLL:
      goto LABEL_7;
    case 2uLL:
    case 4uLL:
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      _os_feature_enabled_impl();
      v17 = 1;
      goto LABEL_3;
    case 7uLL:
      goto LABEL_18;
    case 0xCuLL:
      v15 = 0;
      v17 = 4;
      goto LABEL_18;
    case 0xDuLL:
      v15 = 0;
      v17 = 8;
LABEL_18:
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
LABEL_3:
        v18 = objc_retainAutorelease(v9);
        v28 = objc_msgSend(v18, "UTF8String");
        v29 = 0;
        v19 = sandbox_set_user_state_item_with_persona();
        if (v19)
        {
          v20 = v19;
          container_log_handle_for_category();
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            goto LABEL_5;
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v31 = v15;
          *(_WORD *)&v31[4] = 2048;
          *(_QWORD *)&v31[6] = v17;
          v32 = 2080;
          v33 = v28;
          v34 = 2048;
          v35 = a5;
          v36 = 2080;
          *(_QWORD *)v37 = 0;
          *(_WORD *)&v37[8] = 1024;
          *(_DWORD *)&v37[10] = v20;
          v25 = "Failed to remove mapping for user: %u, itemType: %llu, identifier: %s, class: %llu, path: %s : %d";
        }
        else
        {
          if (!v10
            || (v28 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String"),
                v29 = objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"),
                (v23 = sandbox_set_user_state_item_with_persona()) == 0))
          {
            container_log_handle_for_category();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67110402;
              *(_DWORD *)v31 = v15;
              *(_WORD *)&v31[4] = 2048;
              *(_QWORD *)&v31[6] = v17;
              v32 = 2080;
              v33 = v28;
              v34 = 2048;
              v35 = a5;
              v36 = 1024;
              *(_DWORD *)v37 = v12;
              *(_WORD *)&v37[4] = 2080;
              *(_QWORD *)&v37[6] = v29;
              _os_log_impl(&dword_1CF807000, v21, OS_LOG_TYPE_DEFAULT, "Pushed user: %u, itemType: %llu, identifier %s, class: %llu, persona id: %d, path: %s", buf, 0x36u);
            }
            goto LABEL_6;
          }
          v24 = v23;
          container_log_handle_for_category();
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
LABEL_5:
            v16 = 0;
LABEL_6:

            goto LABEL_7;
          }
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v31 = v15;
          *(_WORD *)&v31[4] = 2048;
          *(_QWORD *)&v31[6] = v17;
          v32 = 2080;
          v33 = v28;
          v34 = 2048;
          v35 = a5;
          v36 = 2080;
          *(_QWORD *)v37 = v29;
          *(_WORD *)&v37[8] = 1024;
          *(_DWORD *)&v37[10] = v24;
          v25 = "Failed to set mapping for user: %u, itemType: %llu, identifier %s, class: %llu, path: %s : %d";
        }
        v26 = v21;
        v27 = 54;
LABEL_22:
        _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
        goto LABEL_5;
      }
      v16 = 0;
LABEL_7:

      return v16;
    default:
      container_log_handle_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v31 = a5;
      v25 = "Unsupported class for setting sandbox container mapping: %llu";
      v26 = v21;
      v27 = 12;
      goto LABEL_22;
  }
}

- (void)_queue_attachSandboxWriteThroughHandlerToContainerClassCache:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MCMContainerCache *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "containerClassPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && objc_msgSend(v5, "containerClass") != 10)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__MCMContainerCache__queue_attachSandboxWriteThroughHandlerToContainerClassCache___block_invoke;
    v7[3] = &unk_1E8CB6560;
    v6 = v5;
    v8 = v6;
    v9 = self;
    objc_msgSend(v4, "setConcurrentWriteThroughHandler:", v7);
    if (!-[MCMContainerCache _sandboxSentinelExistsForContainerClass:](self, "_sandboxSentinelExistsForContainerClass:", objc_msgSend(v6, "containerClass")))
    {
      objc_msgSend(v4, "forceWriteThrough");
      -[MCMContainerCache _sandboxSetSentinelForContainerClass:](self, "_sandboxSetSentinelForContainerClass:", objc_msgSend(v6, "containerClass"));
    }

  }
}

- (BOOL)isWellKnownIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

- (BOOL)_concurrent_shouldRegisterSandboxMappingWithUserIdentity:(id)a3 identifier:(id)a4 childParentMapCache:(id)a5 containerClass:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  _BOOL4 v23;
  char v24;
  int v25;
  NSObject *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!_os_feature_enabled_impl()
    || -[MCMContainerCache isWellKnownIdentifier:](self, "isWellKnownIdentifier:", v11))
  {
    if (a6 <= 0xB)
    {
      if (((1 << a6) & 0xE54) != 0)
      {
        if (MCMRequirePersona_onceToken != -1)
          dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
        if (!MCMRequirePersona_result)
          goto LABEL_11;
        if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
        if (MCMRequirePersonaTelemetryOnly_result)
        {
LABEL_11:
          objc_msgSend(v12, "parentIdentifierForChildIdentifier:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v13)
            v15 = (void *)v13;
          else
            v15 = v11;
          v16 = v15;
          -[MCMContainerCache userIdentityCache](self, "userIdentityCache");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "userIdentitiesForBundleIdentifier:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v18, "count") >= 2)
          {
            -[MCMContainerCache userIdentityCache](self, "userIdentityCache");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "userIdentityForPersonalPersona");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v18, "containsObject:", v20);

            if ((v21 & 1) != 0)
            {
              v22 = objc_msgSend(v10, "isDataSeparated");

              v23 = 1;
              if ((v22 & 1) == 0)
                goto LABEL_31;
LABEL_27:
              container_log_handle_for_category();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v10, "shortDescription");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = 138413314;
                v30 = v27;
                v31 = 2112;
                v32 = v11;
                v33 = 2112;
                v34 = v16;
                v35 = 2048;
                v36 = a6;
                v37 = 1024;
                v38 = v23;
                _os_log_impl(&dword_1CF807000, v26, OS_LOG_TYPE_INFO, "Deciding not to register userIdentity: %@, identifier: %@ (parent %@), containerClass: %llu with sandbox; isMultiPersona: %d",
                  (uint8_t *)&v29,
                  0x30u);

              }
              LOBYTE(v23) = 0;
              goto LABEL_31;
            }
          }
          v24 = objc_msgSend(v18, "containsObject:", v10);

          if ((v24 & 1) != 0)
          {
LABEL_30:
            LOBYTE(v23) = 1;
LABEL_31:

            goto LABEL_32;
          }
LABEL_26:
          v23 = 0;
          goto LABEL_27;
        }
        v25 = objc_msgSend(v10, "personaType");
LABEL_25:
        v16 = 0;
        if (!v25)
          goto LABEL_30;
        goto LABEL_26;
      }
      if (a6 == 7)
      {
        v16 = 0;
        goto LABEL_30;
      }
    }
    v25 = objc_msgSend(v10, "isDataSeparated");
    goto LABEL_25;
  }
  LOBYTE(v23) = 0;
LABEL_32:

  return v23;
}

- (MCMChildParentMapCache)childParentMapCache
{
  return self->_childParentMapCache;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (Class)cacheEntryClass
{
  return self->_cacheEntryClass;
}

- (Class)classCacheClass
{
  return self->_classCacheClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classCacheClass, 0);
  objc_storeStrong((id *)&self->_cacheEntryClass, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_childParentMapCache, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_queue_cache, 0);
}

void __82__MCMContainerCache__queue_attachSandboxWriteThroughHandlerToContainerClassCache___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  _BYTE v29[28];
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(a4, "containerPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = !v9 || !v10 || (objc_msgSend(v9, "isEqual:", v10) & 1) == 0;
  container_log_handle_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v23 = *(_QWORD *)(a1 + 32);
    v28 = 138413314;
    *(_QWORD *)v29 = v7;
    *(_WORD *)&v29[8] = 2112;
    *(_QWORD *)&v29[10] = v9;
    *(_WORD *)&v29[18] = 2112;
    *(_QWORD *)&v29[20] = v10;
    v30 = 1024;
    v31 = v11;
    v32 = 2112;
    v33 = v23;
    _os_log_debug_impl(&dword_1CF807000, v12, OS_LOG_TYPE_DEBUG, "Cache write-through; identifier = %@, newPath = %@, oldPath = %@, updateSandbox = %d, containerClassPath = %@",
      (uint8_t *)&v28,
      0x30u);
  }

  if (v11)
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "childParentMapCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "_concurrent_shouldRegisterSandboxMappingWithUserIdentity:identifier:childParentMapCache:containerClass:", v14, v7, v15, objc_msgSend(*(id *)(a1 + 32), "containerClass"));

    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v28 = 67109634;
      *(_DWORD *)v29 = v16;
      *(_WORD *)&v29[4] = 2112;
      *(_QWORD *)&v29[6] = v7;
      *(_WORD *)&v29[14] = 2112;
      *(_QWORD *)&v29[16] = v24;
      _os_log_debug_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEBUG, "Cache write-through update = %d; identifier = %@, containerClassPath = %@",
        (uint8_t *)&v28,
        0x1Cu);
    }

    if (v16)
    {
      v18 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "userIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(*(id *)(a1 + 32), "containerClass");
      objc_msgSend(v9, "containerDataURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v18) = objc_msgSend(v18, "_concurrent_setSandboxContainerMappingForUserIdentity:identifier:containerClass:url:", v19, v7, v20, v21);

      if ((v18 & 1) == 0)
      {
        container_log_handle_for_category();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v25 = objc_msgSend(*(id *)(a1 + 32), "containerClass");
          objc_msgSend(v9, "containerDataURL");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138412802;
          *(_QWORD *)v29 = v7;
          *(_WORD *)&v29[8] = 2048;
          *(_QWORD *)&v29[10] = v25;
          *(_WORD *)&v29[18] = 2112;
          *(_QWORD *)&v29[20] = v27;
          _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "Failed to update container mapping of [%@(%llu)] to [%@]", (uint8_t *)&v28, 0x20u);

        }
      }
    }
  }

}

void __61__MCMContainerCache__sandboxSentinelExistsForContainerClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (a4)
    {
      if (a3 != 1)
        return;
      if (*(_QWORD *)a4 && *(_QWORD *)(a4 + 8))
      {
        if (!strncmp(*(const char **)a4, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), 0x400uLL))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        return;
      }
      container_log_handle_for_category();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:

        return;
      }
      v8 = 134217984;
      v9 = 1;
      v7 = "Sandbox.kext: Got an item with no identifier or path; itemType = %llu";
    }
    else
    {
      container_log_handle_for_category();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      v8 = 134217984;
      v9 = a3;
      v7 = "Sandbox.kext: Got an item iteration with no item struct; itemType = %llu";
    }
    _os_log_debug_impl(&dword_1CF807000, v6, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v8, 0xCu);
    goto LABEL_11;
  }
}

void __33__MCMContainerCache__queue_flush__block_invoke(uint64_t a1, int a2, unint64_t a3, uint64_t *a4)
{
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3 <= 8 && ((1 << a3) & 0x116) != 0 && a4 != 0)
  {
    v13 = *a4;
    v8 = sandbox_set_user_state_item_with_persona();
    if (v8)
    {
      v9 = v8;
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *((_DWORD *)a4 + 4);
        *(_DWORD *)buf = 67110402;
        v15 = a2;
        v16 = 2048;
        v17 = a3;
        v18 = 2080;
        v19 = v13;
        v20 = 1024;
        v21 = v11;
        v22 = 2080;
        v23 = 0;
        v24 = 1024;
        v25 = v9;
        _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Failed to remove mapping for user: %u, itemType: %llu, identifier: %s, persona id: %d, path: %s : %d", buf, 0x32u);
      }
    }
    else
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *((_DWORD *)a4 + 4);
        *(_DWORD *)buf = 67110146;
        v15 = a2;
        v16 = 2048;
        v17 = a3;
        v18 = 2080;
        v19 = v13;
        v20 = 1024;
        v21 = v12;
        v22 = 2080;
        v23 = 0;
        _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "Pushed user: %u, itemType: %llu, identifier %s, persona id: %d, path: %s", buf, 0x2Cu);
      }
    }

  }
}

void __60__MCMContainerCache__queue_flushCacheForContainerClassPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  int v7;
  id v8;

  if (a4)
  {
    if (*(_QWORD *)(a1 + 48) == a3)
    {
      v6 = *a4;
      if (*a4)
      {
        if (*(_QWORD *)(a1 + 56) == 7)
        {
          v7 = *((_DWORD *)a4 + 4);
          if (v7 != objc_msgSend(*(id *)(a1 + 32), "kernelPersonaID"))
            return;
          v6 = *a4;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObject:");

      }
    }
  }
}

void __51__MCMContainerCache__queue_invalidateUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v24;
    *(_QWORD *)&v5 = 138412290;
    v15 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "userIdentity", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isStrictlyEqualToUserIdentity:", *(_QWORD *)(a1 + 40));

        if (v11)
        {
          container_log_handle_for_category();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v9;
            _os_log_impl(&dword_1CF807000, v12, OS_LOG_TYPE_DEFAULT, "Invalidating container class path; %@", buf, 0xCu);
          }

          if ((_os_feature_enabled_impl() & 1) == 0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "waitForSynchronizationToComplete");
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __51__MCMContainerCache__queue_invalidateUserIdentity___block_invoke_13;
            v17[3] = &unk_1E8CB6480;
            v14 = *(void **)(a1 + 40);
            v17[4] = *(_QWORD *)(a1 + 32);
            v18 = v14;
            v19 = v16;
            objc_msgSend(v13, "enumerateCacheEntriesWithEnumerator:", v17);

          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v9);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v6);
  }

}

uint64_t __51__MCMContainerCache__queue_invalidateUserIdentity___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "_concurrent_setSandboxContainerMappingForUserIdentity:identifier:containerClass:url:", v5, v6, objc_msgSend(*(id *)(a1 + 48), "containerClass"), 0);

  if ((v4 & 1) == 0)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 48), "containerClass");
      v11 = 138412546;
      v12 = v9;
      v13 = 2048;
      v14 = v10;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Failed to remove container mapping of [%@], class: %llu", (uint8_t *)&v11, 0x16u);

    }
  }

  return 1;
}

uint64_t __44__MCMContainerCache_invalidateUserIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateUserIdentity:", *(_QWORD *)(a1 + 40));
}

uint64_t __26__MCMContainerCache_flush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_flush");
}

void __72__MCMContainerCache_flushCacheForUserIdentity_containerClass_transient___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_containerClassPathForUserIdentity:containerClass:transient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_queue_flushCacheForContainerClassPath:");

}

void __92__MCMContainerCache_removeContainerForUserIdentity_contentClass_identifier_transient_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_containerClassCacheForUserIdentity:containerClass:transient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __48__MCMContainerCache_addContainerMetadata_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_containerClassCacheForContainerClassPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__MCMContainerCache_entriesForUserIdentities_contentClass_transient_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_containerClassCacheForUserIdentity:containerClass:transient:", a2, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v3;
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, v3);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __77__MCMContainerCache_countContainersForOtherUserIdentitiesWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "userIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", v3);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "containerIdentity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identityByChangingUserIdentity:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = *(void **)(a1 + 40);
      v14 = 0;
      objc_msgSend(v8, "entryForContainerIdentity:error:", v7, &v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = v14;
      v12 = v11;
      if (v9)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      }
      else if (v11 && objc_msgSend(v11, "type") != 21)
      {
        container_log_handle_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v16 = v7;
          v17 = 2112;
          v18 = v12;
          _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Could not check whether other data containers of the same identifier exist; identity = %@, error = %@",
            buf,
            0x16u);
        }

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -1;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);
      }

    }
  }

}

uint64_t __44__MCMContainerCache_setContainerClassCache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setContainerClassCache:", *(_QWORD *)(a1 + 40));
}

@end
