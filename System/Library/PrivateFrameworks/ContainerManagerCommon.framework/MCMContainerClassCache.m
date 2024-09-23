@implementation MCMContainerClassCache

uint64_t __58__MCMContainerClassCache_waitForSynchronizationToComplete__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_consumeResyncRequired");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_syncWithDisk");
  return result;
}

- (id)cacheEntryForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cacheLock;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMContainerClassCache waitForSynchronizationToComplete](self, "waitForSynchronizationToComplete");
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[MCMContainerClassCache lock_cache](self, "lock_cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "corrupt") & 1) != 0 || objc_msgSend(v7, "ignore"))
  {

    v7 = 0;
  }
  os_unfair_lock_unlock(p_cacheLock);
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_1CF807000, v8, OS_LOG_TYPE_DEBUG, "Retrieving cache entry; identifier = %@, cache entry = %@",
      (uint8_t *)&v10,
      0x16u);
  }

  return v7;
}

- (NSMutableDictionary)lock_cache
{
  return self->_lock_cache;
}

- (void)waitForSynchronizationToComplete
{
  NSObject *fsScanQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  fsScanQueue = self->_fsScanQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__MCMContainerClassCache_waitForSynchronizationToComplete__block_invoke;
  v3[3] = &unk_1E8CB6458;
  v3[4] = self;
  dispatch_async_and_wait(fsScanQueue, v3);
}

- (void)asyncStartSynchronization
{
  NSObject *fsScanQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  fsScanQueue = self->_fsScanQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__MCMContainerClassCache_asyncStartSynchronization__block_invoke;
  v3[3] = &unk_1E8CB6458;
  v3[4] = self;
  dispatch_async(fsScanQueue, v3);
}

- (void)_queue_syncWithDisk
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t i;
  id v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  os_signpost_id_t spid;
  id v55;
  unint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id obj;
  void *v62;
  void *v63;
  id v64;
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[4];
  id v68;
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fsScanQueue);
  -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = (uint64_t)v3;
    _os_log_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEFAULT, "Resyncing container class cache: %@", buf, 0xCu);
  }

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);

  container_log_handle_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v56 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v9 = objc_msgSend(v3, "containerClass");
    *(_DWORD *)buf = 134349056;
    v71 = v9;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ResyncingCache", " class=%{public, signpost.description:attribute}llu ", buf, 0xCu);
  }
  spid = v6;

  -[MCMContainerClassCache userIdentityCache](self, "userIdentityCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "libraryRepairForUserIdentity:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v3;
  objc_msgSend(v3, "classURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke;
  v67[3] = &unk_1E8CB6768;
  v15 = v13;
  v68 = v15;
  v57 = v12;
  LODWORD(v13) = objc_msgSend(v12, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v14, &v69, v67);
  v55 = v69;

  if ((_DWORD)v13)
  {
    -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setExists:", 1);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_cacheLock);
  -[MCMContainerClassCache lock_cache](self, "lock_cache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v18, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v18;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v83, 16);
  if (v60)
  {
    v59 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v60; ++i)
      {
        if (*(_QWORD *)v85 != v59)
          objc_enumerationMutation(obj);
        objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i));
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v62 = v21;
        do
        {
          objc_msgSend(v21, "containerPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "containerRootURL");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "containsObject:", v23))
          {
            v24 = objc_msgSend(v21, "corrupt");
            container_log_handle_for_category();
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
            if (v24)
            {
              if (v26)
              {
                objc_msgSend(v23, "path");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v71 = (uint64_t)v31;
                _os_log_debug_impl(&dword_1CF807000, v25, OS_LOG_TYPE_DEBUG, "Disk sync knows about corrupt [%@]", buf, 0xCu);

              }
              objc_msgSend(v63, "addObject:", v21);
            }
            else
            {
              if (v26)
              {
                objc_msgSend(v23, "path");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v71 = (uint64_t)v32;
                _os_log_debug_impl(&dword_1CF807000, v25, OS_LOG_TYPE_DEBUG, "Disk sync knows about [%@]", buf, 0xCu);

              }
            }
            objc_msgSend(v19, "addObject:", v23);
          }
          else
          {
            container_log_handle_for_category();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v23, "path");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v71 = (uint64_t)v28;
              _os_log_impl(&dword_1CF807000, v27, OS_LOG_TYPE_DEFAULT, "Disk sync has stale entry for [%@]", buf, 0xCu);

            }
            objc_msgSend(v17, "addObject:", v21);
            -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setExists:", 0);

          }
          objc_msgSend(v21, "next");
          v30 = objc_claimAutoreleasedReturnValue();

          v21 = (id)v30;
        }
        while (v30);

      }
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v83, 16);
    }
    while (v60);
  }

  os_unfair_lock_unlock(&self->_cacheLock);
  objc_msgSend(v15, "minusSet:", v19);
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v64 = v17;
  v33 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v79, v78, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v80;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v80 != v35)
          objc_enumerationMutation(v64);
        v37 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
        container_log_handle_for_category();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v71 = (uint64_t)v37;
          _os_log_impl(&dword_1CF807000, v38, OS_LOG_TYPE_DEFAULT, "Disk sync evicting stale entry: %@", buf, 0xCu);
        }

        objc_msgSend(v37, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "containerPath");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[MCMContainerClassCache _setEntry:forIdentifier:containerPath:writeThrough:replace:](self, "_setEntry:forIdentifier:containerPath:writeThrough:replace:", 0, v39, v40, 1, 0);

      }
      v34 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v79, v78, 16);
    }
    while (v34);
  }

  objc_msgSend(v15, "allObjects");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_8;
  v66[3] = &unk_1E8CB52B8;
  v66[4] = self;
  -[MCMContainerClassCache _processURLs:handler:](self, "_processURLs:handler:", v42, v66);

  v65[0] = v43;
  v65[1] = 3221225472;
  v65[2] = __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_10;
  v65[3] = &unk_1E8CB52B8;
  v65[4] = self;
  -[MCMContainerClassCache _processCorruptEntries:handler:](self, "_processCorruptEntries:handler:", v63, v65);
  v44 = objc_msgSend(v19, "count");
  v45 = objc_msgSend(v15, "count");
  v46 = objc_msgSend(v64, "count");
  container_log_handle_for_category();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = v45 + v44 - v46;
    v49 = objc_msgSend(v15, "count");
    v50 = objc_msgSend(v64, "count");
    *(_DWORD *)buf = 138413058;
    v71 = (uint64_t)v58;
    v72 = 2048;
    v73 = v49;
    v74 = 2048;
    v75 = v50;
    v76 = 2048;
    v77 = v48;
    _os_log_impl(&dword_1CF807000, v47, OS_LOG_TYPE_DEFAULT, "Finished resyncing container class cache: %@, added = %lu, removed = %lu, total = %lu", buf, 0x2Au);
  }

  container_log_handle_for_category();
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v56 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    v53 = objc_msgSend(v58, "containerClass");
    *(_DWORD *)buf = 134349056;
    v71 = v53;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v52, OS_SIGNPOST_INTERVAL_END, spid, "ResyncingCache", " class=%{public, signpost.description:attribute}llu ", buf, 0xCu);
  }

}

uint64_t __51__MCMContainerClassCache_asyncStartSynchronization__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_consumeResyncRequired");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_syncWithDisk");
  return result;
}

- (NSUUID)lastCompletedDiskScanUUID
{
  return self->_lastCompletedDiskScanUUID;
}

- (NSUUID)targetDiskScanUUID
{
  return self->_targetDiskScanUUID;
}

- (void)setLastCompletedDiskScanUUID:(id)a3
{
  objc_storeStrong((id *)&self->_lastCompletedDiskScanUUID, a3);
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (MCMContainerClassPath)containerClassPath
{
  return self->_containerClassPath;
}

- (BOOL)enumerateCacheEntriesWithEnumerator:(id)a3
{
  uint64_t (**v4)(id, void *);
  os_unfair_lock_s *p_cacheLock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[MCMContainerClassCache lock_cache](self, "lock_cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(p_cacheLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "corrupt") & 1) == 0 && (objc_msgSend(v14, "ignore") & 1) == 0)
        {
          if ((v4[2](v4, v14) & 1) == 0)
          {

            goto LABEL_14;
          }
          v11 = 1;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
LABEL_14:
    v11 = 0;
  }

  return v11 & 1;
}

- (void)_processCorruptEntries:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__MCMContainerClassCache__processCorruptEntries_handler___block_invoke;
  v8[3] = &unk_1E8CB52E0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsWithOptions:usingBlock:", 0, v8);

}

- (void)_processURLs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__MCMContainerClassCache__processURLs_handler___block_invoke;
  v8[3] = &unk_1E8CB52E0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsWithOptions:usingBlock:", 0, v8);

}

- (void)setTargetDiskScanUUID:(id)a3
{
  objc_storeStrong((id *)&self->_targetDiskScanUUID, a3);
}

BOOL __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "urlsForItemsInDirectoryAtURL:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v7);
  return v7 != 0;
}

- (MCMContainerClassCache)initWithContainerClassPath:(id)a3 cacheEntryClass:(Class)a4 targetQueue:(id)a5 userIdentityCache:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  MCMContainerClassCache *v14;
  MCMContainerClassCache *v15;
  id lock_concurrentWriteThroughHandler;
  id v17;
  int v18;
  uint64_t v19;
  NSUUID *targetDiskScanUUID;
  NSUUID *lastCompletedDiskScanUUID;
  uint64_t v22;
  NSMutableDictionary *lock_cache;
  NSObject *v24;
  NSObject *v25;
  dispatch_queue_t v26;
  NSObject *v27;
  MCMContainerClassCache *v28;
  OS_dispatch_queue *fsScanQueue;
  unint64_t containerClass;
  objc_super v32;
  uint8_t buf[4];
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)MCMContainerClassCache;
  v14 = -[MCMContainerClassCache init](&v32, sel_init);
  v15 = v14;
  if (!v14)
  {
LABEL_10:
    v28 = v15;
    goto LABEL_11;
  }
  v14->_lock_resyncRequired = 1;
  lock_concurrentWriteThroughHandler = v14->_lock_concurrentWriteThroughHandler;
  v14->_lock_concurrentWriteThroughHandler = 0;
  *(_QWORD *)&v14->_cacheLock._os_unfair_lock_opaque = 0;

  objc_storeStrong((id *)&v15->_cacheEntryClass, a4);
  v15->_containerClass = objc_msgSend(v11, "containerClass");
  v17 = containermanager_copy_global_configuration();
  v18 = objc_msgSend(v17, "dispositionForContainerClass:", v15->_containerClass);

  if (v18 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = objc_claimAutoreleasedReturnValue();
    targetDiskScanUUID = v15->_targetDiskScanUUID;
    v15->_targetDiskScanUUID = (NSUUID *)v19;

    lastCompletedDiskScanUUID = v15->_lastCompletedDiskScanUUID;
    v15->_lastCompletedDiskScanUUID = 0;

    objc_storeStrong((id *)&v15->_containerClassPath, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    lock_cache = v15->_lock_cache;
    v15->_lock_cache = (NSMutableDictionary *)v22;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_BACKGROUND, 0);
    v25 = objc_claimAutoreleasedReturnValue();

    if (v12)
      v26 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.fsScan", v25, v12);
    else
      v26 = dispatch_queue_create("com.apple.containermanagerd.fsScan", v25);
    fsScanQueue = v15->_fsScanQueue;
    v15->_fsScanQueue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v15->_userIdentityCache, a6);
    goto LABEL_10;
  }
  container_log_handle_for_category();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    containerClass = v15->_containerClass;
    *(_DWORD *)buf = 134217984;
    v34 = containerClass;
    _os_log_fault_impl(&dword_1CF807000, v27, OS_LOG_TYPE_FAULT, "Attempting to build cache for class not supported by this daemon: %llu", buf, 0xCu);
  }

  v28 = 0;
LABEL_11:

  return v28;
}

- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4
{
  return -[MCMContainerClassCache setCacheEntry:forIdentifier:writeThrough:](self, "setCacheEntry:forIdentifier:writeThrough:", a3, a4, 1);
}

- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4 writeThrough:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8)
    objc_msgSend(v8, "setXattrs");
  objc_msgSend(v8, "containerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerClassCache _setEntry:forIdentifier:containerPath:writeThrough:replace:](self, "_setEntry:forIdentifier:containerPath:writeThrough:replace:", v8, v9, v10, v5, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)resyncRequired
{
  os_unfair_lock_s *p_resyncRequiredLock;

  p_resyncRequiredLock = &self->_resyncRequiredLock;
  os_unfair_lock_lock(&self->_resyncRequiredLock);
  self->_lock_resyncRequired = 1;
  os_unfair_lock_unlock(p_resyncRequiredLock);
}

- (void)forceWriteThrough
{
  os_unfair_lock_s *p_cacheLock;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v4 = (void *)MEMORY[0x1D17D71B4](self->_lock_concurrentWriteThroughHandler);
  -[MCMContainerClassCache lock_cache](self, "lock_cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  os_unfair_lock_unlock(p_cacheLock);
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__MCMContainerClassCache_forceWriteThrough__block_invoke;
    v7[3] = &unk_1E8CB5290;
    v8 = v4;
    objc_msgSend(v6, "enumerateKeysAndObjectsWithOptions:usingBlock:", 1, v7);

  }
}

- (void)setConcurrentWriteThroughHandler:(id)a3
{
  os_unfair_lock_s *p_cacheLock;
  id v5;
  void *v6;
  id lock_concurrentWriteThroughHandler;

  p_cacheLock = &self->_cacheLock;
  v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  v6 = (void *)MEMORY[0x1D17D71B4](v5);

  lock_concurrentWriteThroughHandler = self->_lock_concurrentWriteThroughHandler;
  self->_lock_concurrentWriteThroughHandler = v6;

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)concurrentWriteThroughHandler
{
  os_unfair_lock_s *p_cacheLock;
  void *v4;
  void *v5;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v4 = (void *)MEMORY[0x1D17D71B4](self->_lock_concurrentWriteThroughHandler);
  os_unfair_lock_unlock(p_cacheLock);
  v5 = (void *)MEMORY[0x1D17D71B4](v4);

  return v5;
}

- (BOOL)_queue_consumeResyncRequired
{
  BOOL lock_resyncRequired;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_fsScanQueue);
  os_unfair_lock_lock(&self->_resyncRequiredLock);
  lock_resyncRequired = self->_lock_resyncRequired;
  self->_lock_resyncRequired = 0;
  os_unfair_lock_unlock(&self->_resyncRequiredLock);
  return lock_resyncRequired;
}

- (BOOL)_checkExistanceOfCacheEntry:(id)a3 libraryRepair:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "classURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__MCMContainerClassCache__checkExistanceOfCacheEntry_libraryRepair___block_invoke;
  v12[3] = &unk_1E8CB6740;
  v12[4] = &v14;
  objc_msgSend(v7, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v9, &v13, v12);
  v10 = v13;

  LODWORD(v8) = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (_DWORD)v8 != 0;
}

- (void)_concurrent_processURL:(id)a3 handler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MCMFileHandle *v10;
  void *v11;
  MCMFileHandle *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v7;
  +[MCMContainerPath containerPathForContainerClassPath:containerPathIdentifier:](MCMContainerPath, "containerPathForContainerClassPath:containerPathIdentifier:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [MCMFileHandle alloc];
  objc_msgSend(v6, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 0;
  v12 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:](v10, "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:", v11, 0, 9, 0, 0, 0, v24);

  v27 = 0;
  LOBYTE(v10) = -[MCMFileHandle openWithError:](v12, "openWithError:", &v27);
  v13 = v27;
  if ((v10 & 1) == 0)
  {
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v13;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Failed to open [%@] for container scan, skipping; error = %@",
        buf,
        0x16u);

    }
    v17 = 0;
    v15 = 0;
    v14 = 0;
    v20 = 0;
    goto LABEL_15;
  }
  +[MCMContainerCacheEntry identifierForFileHandle:](MCMContainerCacheEntry, "identifierForFileHandle:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerCacheEntry UUIDForFileHandle:](MCMContainerCacheEntry, "UUIDForFileHandle:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerCacheEntry schemaVersionForFileHandle:](MCMContainerCacheEntry, "schemaVersionForFileHandle:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v14 && v15 && v16)
  {
    -[MCMContainerClassCache _concurrent_generateCacheEntryWithURL:identifier:containerPath:schemaVersion:uuid:metadata:](self, "_concurrent_generateCacheEntryWithURL:identifier:containerPath:schemaVersion:uuid:metadata:", v6, v14, v9, v16, v15, 0);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v17;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1CF807000, v21, OS_LOG_TYPE_INFO, "Container did not have xattr (%@|%@|%@), reading plist (slow); path = %@",
        buf,
        0x2Au);
    }

    -[MCMContainerClassCache _concurrent_slowGenerateCacheEntryWithFileHandle:URL:identifier:uuid:schemaVersion:containerPath:](self, "_concurrent_slowGenerateCacheEntryWithFileHandle:URL:identifier:uuid:schemaVersion:containerPath:", v12, v6, v14, v15, v17, v9);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v18;
  if (!v18)
  {
    -[MCMContainerClassCache _handleUnrecoverableCorruptContainerPath:](self, "_handleUnrecoverableCorruptContainerPath:", v9);
LABEL_15:
    v22 = v26;
    goto LABEL_16;
  }
  v22 = v26;
  (*((void (**)(id, uint64_t))v26 + 2))(v26, v18);
LABEL_16:

}

- (void)_concurrent_processCorruptEntry:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(_QWORD, NSObject *);
  void *v8;
  void *v9;
  MCMFileHandle *v10;
  void *v11;
  MCMFileHandle *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  MCMContainerClassCache *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void (**v23)(_QWORD, NSObject *);
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD, NSObject *))a4;
  objc_msgSend(v6, "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerRootURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [MCMFileHandle alloc];
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = 0;
  v12 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:](v10, "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:", v11, 0, 9, 0, 0, 0, v22);

  v24 = 0;
  v13 = -[MCMFileHandle openWithError:](v12, "openWithError:", &v24);
  v14 = v24;
  container_log_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
  {
    v23 = v7;
    v17 = self;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_INFO, "Attempting to repair corrupt container (slow); path = %@",
        buf,
        0xCu);
    }

    objc_msgSend(v6, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "schemaVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerClassCache _concurrent_slowGenerateCacheEntryWithFileHandle:URL:identifier:uuid:schemaVersion:containerPath:](v17, "_concurrent_slowGenerateCacheEntryWithFileHandle:URL:identifier:uuid:schemaVersion:containerPath:", v12, v9, v18, v19, v20, v8);
    v16 = objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[MCMContainerClassCache _handleUnrecoverableCorruptContainerPath:](v17, "_handleUnrecoverableCorruptContainerPath:", v8);
      v7 = v23;
      goto LABEL_9;
    }
    v7 = v23;
    v23[2](v23, v16);
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v21;
    v27 = 2112;
    v28 = v14;
    _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Failed to open [%@] for container scan, skipping; error = %@",
      buf,
      0x16u);

  }
LABEL_9:

}

- (id)_concurrent_slowGenerateCacheEntryWithFileHandle:(id)a3 URL:(id)a4 identifier:(id)a5 uuid:(id)a6 schemaVersion:(id)a7 containerPath:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  MCMMetadata *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  NSObject *v32;
  MCMContainerCacheEntry *v33;
  void *v34;
  NSObject *v35;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v38 = a5;
  v16 = a6;
  v40 = a7;
  v17 = a8;
  -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containerClass");
  objc_msgSend(v18, "userIdentity");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = [MCMMetadata alloc];
  -[MCMContainerClassCache userIdentityCache](self, "userIdentityCache");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v37 = (void *)v20;
  v23 = -[MCMMetadataMinimal initByReadingAndValidatingMetadataAtContainerPath:userIdentity:containerClass:userIdentityCache:error:](v21, "initByReadingAndValidatingMetadataAtContainerPath:userIdentity:containerClass:userIdentityCache:error:", v17, v20, v19, v22, &v41);
  v39 = v41;

  if (v23)
  {
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "schemaVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerClassCache _concurrent_generateCacheEntryWithURL:identifier:containerPath:schemaVersion:uuid:metadata:](self, "_concurrent_generateCacheEntryWithURL:identifier:containerPath:schemaVersion:uuid:metadata:", v15, v24, v17, v25, v26, v23);
    v27 = objc_claimAutoreleasedReturnValue();

    -[NSObject setXattrsWithFileHandle:](v27, "setXattrsWithFileHandle:", v14);
    v28 = v38;
    goto LABEL_16;
  }
  v29 = containermanager_copy_global_configuration();
  objc_msgSend(v29, "staticConfig");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v30, "attemptMetadataReconstructionIfMissing") & 1) != 0)
  {

  }
  else
  {
    v31 = objc_msgSend(v39, "POSIXerrno");

    if (v31 == 2)
    {
      container_log_handle_for_category();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v38;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413570;
        v43 = v38;
        v44 = 2112;
        v45 = v17;
        v46 = 2112;
        v47 = v38;
        v48 = 2112;
        v49 = v16;
        v50 = 2112;
        v51 = v40;
        v52 = 2112;
        v53 = v39;
        _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "Could not read metadata for [(%@) %@]; identifier = [%@], uuid = %@, schemaVersion = %@, error = %@",
          buf,
          0x3Eu);
      }
      goto LABEL_15;
    }
  }
  container_log_handle_for_category();
  v32 = objc_claimAutoreleasedReturnValue();
  v28 = v38;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413570;
    v43 = v38;
    v44 = 2112;
    v45 = v17;
    v46 = 2112;
    v47 = v38;
    v48 = 2112;
    v49 = v16;
    v50 = 2112;
    v51 = v40;
    v52 = 2112;
    v53 = v39;
    _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "Could not read metadata for [(%@) %@], attempting recovery; identifier = [%@], uuid = %@, schemaVersion = %@, error = %@",
      buf,
      0x3Eu);
  }

  v33 = [MCMContainerCacheEntry alloc];
  -[MCMContainerClassCache userIdentityCache](self, "userIdentityCache");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[MCMContainerCacheEntry initFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:](v33, "initFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:", v17, v38, v16, v40, v34);

  if (v27 && (-[NSObject verify](v27, "verify") & 1) == 0)
  {
    container_log_handle_for_category();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v43 = v38;
      v44 = 2112;
      v45 = v16;
      v46 = 2112;
      v47 = v40;
      _os_log_error_impl(&dword_1CF807000, v35, OS_LOG_TYPE_ERROR, "Attempted to recover, but verification failed; identifier = [%@], uuid = %@, schemaVersion = %@",
        buf,
        0x20u);
    }

LABEL_15:
    v27 = 0;
  }
LABEL_16:

  return v27;
}

- (id)_concurrent_generateCacheEntryWithURL:(id)a3 identifier:(id)a4 containerPath:(id)a5 schemaVersion:(id)a6 uuid:(id)a7 metadata:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = objc_alloc(-[MCMContainerClassCache cacheEntryClass](self, "cacheEntryClass"));
  -[MCMContainerClassCache userIdentityCache](self, "userIdentityCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithIdentifier:containerPath:schemaVersion:uuid:metadata:userIdentityCache:", v17, v16, v15, v14, v13, v19);

  return v20;
}

- (BOOL)_identifier:(id)a3 isEqualToOtherIdentifier:(id)a4 caseSensitive:(BOOL)a5
{
  if (a5)
    return objc_msgSend(a3, "isEqualToString:", a4);
  else
    return objc_msgSend(a3, "compare:options:", a4, 1) == 0;
}

- (id)_setEntry:(id)a3 forIdentifier:(id)a4 containerPath:(id)a5 writeThrough:(BOOL)a6 replace:(BOOL)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  os_unfair_lock_s *p_cacheLock;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v8 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v12;
  if (v15)
    -[MCMContainerClassCache _lightweightAnnotateEntry:](self, "_lightweightAnnotateEntry:", v15);
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[MCMContainerClassCache lock_cache](self, "lock_cache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_5;
  }
  else
  {
    v19 = 0;
    if (v8)
    {
LABEL_5:
      v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17D71B4](self->_lock_concurrentWriteThroughHandler);
      if (v15)
        goto LABEL_6;
LABEL_11:
      if (v14)
        -[MCMContainerClassCache _lock_rootEntryFromRootEntry:afterRemovingEntryForContainerPath:](self, "_lock_rootEntryFromRootEntry:afterRemovingEntryForContainerPath:", v19, v14);
      else
        objc_msgSend(v19, "next");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, v13);

      v21 = 0;
      goto LABEL_17;
    }
  }
  v20 = 0;
  if (!v15)
    goto LABEL_11;
LABEL_6:
  v21 = (void *)objc_msgSend(v15, "copyWithZone:", 0);

  objc_msgSend(v21, "setCache:", self);
  if (!v19 || a7)
  {
    objc_msgSend(v19, "next");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNext:", v22);
  }
  else
  {
    -[MCMContainerClassCache _lock_rootEntryByResortingFromRootEntry:insertEntry:](self, "_lock_rootEntryByResortingFromRootEntry:insertEntry:", v19, v15);
    v22 = v21;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, v13);
LABEL_17:
  container_log_handle_for_category();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v21, "next");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412802;
    v28 = v13;
    v29 = 2112;
    v30 = v21;
    v31 = 2112;
    v32 = v26;
    _os_log_debug_impl(&dword_1CF807000, v24, OS_LOG_TYPE_DEBUG, "Setting cache entry; identifier = %@, cache entry = %@, next = %@",
      (uint8_t *)&v27,
      0x20u);

  }
  os_unfair_lock_unlock(p_cacheLock);
  if (v20)
    ((void (**)(_QWORD, id, void *, id))v20)[2](v20, v13, v19, v15);

  return v21;
}

- (id)_lock_rootEntryFromRootEntry:(id)a3 afterRemovingEntryForContainerPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = 0;
  v9 = v7;
  while (1)
  {
    objc_msgSend(v9, "containerPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);

    if (v11)
      break;
    v12 = v9;

    objc_msgSend(v12, "next");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v12;
    if (!v9)
    {
      v8 = v12;
      goto LABEL_11;
    }
  }
  objc_msgSend(v9, "next");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v8)
  {
    objc_msgSend(v8, "setNext:", v13);
    v15 = v14;
  }
  else
  {
    v15 = v7;
    v7 = (id)v13;
  }

  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v7;
    _os_log_debug_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEBUG, "Removing entry %@, new root is %@", (uint8_t *)&v19, 0x16u);
  }

LABEL_11:
  v17 = v7;

  return v17;
}

- (id)_lock_rootEntryByResortingFromRootEntry:(id)a3 insertEntry:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(v7, "ignore")
      || !-[MCMContainerClassCache _isEntryA:olderThanEntryB:](self, "_isEntryA:olderThanEntryB:", v7, v9))
    {
      v12 = 0;
      v14 = v9;
      while (1)
      {
        v15 = v12;
        v12 = v14;

        if ((objc_msgSend(v7, "ignore") & 1) == 0)
        {
          objc_msgSend(v12, "next");
          v16 = objc_claimAutoreleasedReturnValue();
          if (!v16)
            break;
          v17 = (void *)v16;
          v18 = -[MCMContainerClassCache _isEntryA:olderThanEntryB:](self, "_isEntryA:olderThanEntryB:", v12, v7);

          if (v18)
            break;
        }
        objc_msgSend(v12, "next");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(v12, "setNext:", v7);
          container_log_handle_for_category();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v26 = 138412546;
            v27 = v7;
            v28 = 2112;
            v29 = v12;
            _os_log_debug_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEBUG, "Inserting entry %@ after entry %@", (uint8_t *)&v26, 0x16u);
          }

          v13 = 0;
          goto LABEL_19;
        }
      }
      container_log_handle_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "next");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412802;
        v27 = v7;
        v28 = 2112;
        v29 = v12;
        v30 = 2112;
        v31 = v24;
        _os_log_debug_impl(&dword_1CF807000, v20, OS_LOG_TYPE_DEBUG, "Inserting entry %@ after entry %@ but before entry %@", (uint8_t *)&v26, 0x20u);

      }
      objc_msgSend(v12, "next");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNext:", v21);

      objc_msgSend(v12, "setNext:", v7);
      v13 = v12;
LABEL_19:
      v10 = v9;
    }
    else
    {
      objc_msgSend(v7, "setNext:", v9);
      v10 = v7;

      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "next");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412546;
        v27 = v10;
        v28 = 2112;
        v29 = v25;
        _os_log_debug_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEBUG, "Inserting entry %@ as root entry; next = %@",
          (uint8_t *)&v26,
          0x16u);

      }
      v12 = 0;
      v13 = v9;
    }
  }
  else
  {
    v10 = v7;
    v12 = 0;
    v13 = 0;
  }
  v22 = v10;

  return v22;
}

- (BOOL)_isEntryA:(id)a3 olderThanEntryB:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  const __CFString *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v24 = 0;
  v7 = objc_msgSend(v5, "birthtimeWithError:", &v24);
  v9 = v8;
  v10 = v24;
  v23 = 0;
  v11 = objc_msgSend(v6, "birthtimeWithError:", &v23);
  v13 = v12;
  v14 = v23;
  if (!(v7 | v9))
  {
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v5;
      v27 = 2112;
      v28 = v10;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Unpredicatable resolution for conflicting container paths since birthtime not available on A; entry = %@, error = %@",
        buf,
        0x16u);
    }

  }
  if (!(v11 | v13))
  {
    container_log_handle_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v6;
      v27 = 2112;
      v28 = v14;
      _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Unpredicatable resolution for conflicting container paths since birthtime not available on B; entry = %@, error = %@",
        buf,
        0x16u);
    }

  }
  v17 = v7 < v11;
  if (v7 == v11 && (v17 = v9 < v13, v9 == v13))
  {
    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "Unpredicatable resolution for conflicting container paths since birthtime is the same; entryA = %@, entryB = %@",
        buf,
        0x16u);
    }

    v19 = 0;
  }
  else
  {
    v19 = v17;
  }
  container_log_handle_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = CFSTR("NO");
    *(_DWORD *)buf = 138413826;
    v26 = v5;
    if (v19)
      v22 = CFSTR("YES");
    v27 = 2112;
    v28 = v6;
    v29 = 2112;
    v30 = v22;
    v31 = 2048;
    v32 = v7;
    v33 = 2048;
    v34 = v9;
    v35 = 2048;
    v36 = v11;
    v37 = 2048;
    v38 = v13;
    _os_log_debug_impl(&dword_1CF807000, v20, OS_LOG_TYPE_DEBUG, "entryA %@ is older than entryB %@: %@; birthtimeA = %ld.%09ld, birthtimeB = %ld.%09ld",
      buf,
      0x48u);
  }

  return v19;
}

- (void)_handleUnrecoverableCorruptContainerPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "containerRootURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containerClass");
  objc_msgSend(v3, "containerPathIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  LODWORD(v6) = +[MCMCommandOperationDelete deleteContainerRootURL:userIdentity:containerClass:containerPathIdentifier:preferDirectDelete:error:](MCMCommandOperationDelete, "deleteContainerRootURL:userIdentity:containerClass:containerPathIdentifier:preferDirectDelete:error:", v4, v5, v6, v7, 0, &v11);
  v8 = v11;

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "DELETED: [%@] (corrupt container)", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v8;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Could not delete corrupt container; path = %@, error = %@",
      buf,
      0x16u);
  }

}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (OS_dispatch_queue)fsScanQueue
{
  return self->_fsScanQueue;
}

- (BOOL)writeThroughEnabled
{
  return self->_writeThroughEnabled;
}

- (void)setWriteThroughEnabled:(BOOL)a3
{
  self->_writeThroughEnabled = a3;
}

- (Class)cacheEntryClass
{
  return self->_cacheEntryClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_cacheEntryClass, 0);
  objc_storeStrong((id *)&self->_fsScanQueue, 0);
  objc_storeStrong((id *)&self->_lock_cache, 0);
  objc_storeStrong((id *)&self->_targetDiskScanUUID, 0);
  objc_storeStrong((id *)&self->_lastCompletedDiskScanUUID, 0);
  objc_storeStrong((id *)&self->_containerClassPath, 0);
  objc_storeStrong(&self->_lock_concurrentWriteThroughHandler, 0);
}

void __57__MCMContainerClassCache__processCorruptEntries_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1D17D7010]();
  objc_msgSend(*(id *)(a1 + 32), "_concurrent_processCorruptEntry:handler:", v4, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v3);

}

void __47__MCMContainerClassCache__processURLs_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1D17D7010]();
  objc_msgSend(*(id *)(a1 + 32), "_concurrent_processURL:handler:", v4, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v3);

}

void __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEFAULT, "Disk sync reporting on new entry: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "_setEntry:forIdentifier:containerPath:writeThrough:replace:", v3, v6, v7, 1, 0);

}

void __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEFAULT, "Disk sync reporting on repaired entry: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "_setEntry:forIdentifier:containerPath:writeThrough:replace:", v3, v6, v7, 1, 1);

}

uint64_t __68__MCMContainerClassCache__checkExistanceOfCacheEntry_libraryRepair___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "itemAtURL:exists:error:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24, a3);

  return v7;
}

uint64_t __43__MCMContainerClassCache_forceWriteThrough__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, 0, a3);
}

@end
