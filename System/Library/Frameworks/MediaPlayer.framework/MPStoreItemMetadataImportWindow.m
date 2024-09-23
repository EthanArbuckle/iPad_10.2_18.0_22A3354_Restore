@implementation MPStoreItemMetadataImportWindow

- (MPStoreItemMetadataImportWindow)initWithEventCadence:(double)a3 maximumLatency:(double)a4 serverObjectDatabase:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  MPStoreItemMetadataImportWindow *v12;
  MPStoreItemMetadataImportWindow *v13;
  NSMutableArray *v14;
  NSMutableArray *accumulatedObjects;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MPStoreItemMetadataImportWindow;
  v12 = -[MPStoreItemMetadataImportWindow init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_eventCadence = a3;
    v12->_maximumLatency = a4;
    objc_storeWeak((id *)&v12->_serverObjectDatabase, v10);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    accumulatedObjects = v13->_accumulatedObjects;
    v13->_accumulatedObjects = v14;

    v13->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_queue, a6);
  }

  return v13;
}

- (void)addPayload:(id)a3 userIdentity:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  MPStoreItemMetadataImportDescriptor *v9;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  if (!-[NSMutableArray count](self->_accumulatedObjects, "count"))
    -[MPStoreItemMetadataImportWindow performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__purge, 0, self->_maximumLatency);
  v9 = -[MPStoreItemMetadataImportDescriptor initWithPayload:userIdentity:]([MPStoreItemMetadataImportDescriptor alloc], "initWithPayload:userIdentity:", v8, v7);

  -[NSMutableArray addObject:](self->_accumulatedObjects, "addObject:", v9);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__checkCadence, 0);
  -[MPStoreItemMetadataImportWindow performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__checkCadence, 0, self->_eventCadence);

}

- (void)_purge
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  MPServerObjectDatabaseStorePlatformImportRequest *v28;
  void *v29;
  NSObject *queue;
  MPServerObjectDatabaseStorePlatformImportRequest *v31;
  void *v32;
  MPStoreItemMetadataImportWindow *v33;
  _QWORD block[4];
  id v35;
  MPServerObjectDatabaseStorePlatformImportRequest *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_accumulatedObjects, "copy");
  v33 = self;
  -[NSMutableArray removeAllObjects](self->_accumulatedObjects, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v11, "userIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        objc_msgSend(v5, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v11, "platformDictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v17);
        }
        else
        {
          v18 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v11, "platformDictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "arrayWithObject:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v8);
  }
  v32 = v6;

  WeakRetained = objc_loadWeakRetained((id *)&v33->_serverObjectDatabase);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = v5;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKeyedSubscript:", v26, v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[MPServerObjectDatabaseStorePlatformImportRequest initWithPayload:]([MPServerObjectDatabaseStorePlatformImportRequest alloc], "initWithPayload:", v27);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26 != v29)
          -[MPServerObjectDatabaseImportRequest setUserIdentity:](v28, "setUserIdentity:", v26);
        queue = v33->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __41__MPStoreItemMetadataImportWindow__purge__block_invoke;
        block[3] = &unk_1E31635F8;
        v35 = WeakRetained;
        v36 = v28;
        v31 = v28;
        dispatch_async(queue, block);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v23);
  }

}

- (double)eventCadence
{
  return self->_eventCadence;
}

- (double)maximumLatency
{
  return self->_maximumLatency;
}

- (MPServerObjectDatabase)serverObjectDatabase
{
  return (MPServerObjectDatabase *)objc_loadWeakRetained((id *)&self->_serverObjectDatabase);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_serverObjectDatabase);
  objc_storeStrong((id *)&self->_accumulatedObjects, 0);
}

id __41__MPStoreItemMetadataImportWindow__purge__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "importObjectsFromRequest:options:error:", *(_QWORD *)(a1 + 40), 0, 0);
}

@end
