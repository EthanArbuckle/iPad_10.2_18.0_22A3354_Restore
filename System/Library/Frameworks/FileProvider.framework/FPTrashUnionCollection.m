@implementation FPTrashUnionCollection

uint64_t __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCollections:", *(_QWORD *)(a1 + 40));
}

- (FPTrashUnionCollection)initWithQueryCollection:(id)a3
{
  id v5;
  void *v6;
  FPTrashUnionCollection *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  id providerDomainChangesToken;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)FPTrashUnionCollection;
  v7 = -[FPUnionCollection initWithCollections:](&v16, sel_initWithCollections_, v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_trashQueryCollection, a3);
    -[FPItemCollection updateQueue](v7->_trashQueryCollection, "updateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    location = 0;
    objc_initWeak(&location, v7);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__FPTrashUnionCollection_initWithQueryCollection___block_invoke;
    v13[3] = &unk_1E444E7F8;
    objc_copyWeak(&v14, &location);
    +[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:](FPProviderDomain, "beginMonitoringProviderDomainChangesWithHandler:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
    providerDomainChangesToken = v7->_providerDomainChangesToken;
    v7->_providerDomainChangesToken = (id)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __50__FPTrashUnionCollection_initWithQueryCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  _QWORD *v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "filterDomains:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = WeakRetained[32];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__FPTrashUnionCollection_initWithQueryCollection___block_invoke_2;
    v9[3] = &unk_1E4449A40;
    v10 = WeakRetained;
    v11 = v6;
    v8 = v6;
    dispatch_async(v7, v9);

  }
}

- (id)filterDomains:(id)a3
{
  return (id)objc_msgSend(a3, "fp_filter:", &__block_literal_global_43);
}

uint64_t __50__FPTrashUnionCollection_initWithQueryCollection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCollectionsForDomains:", *(_QWORD *)(a1 + 40));
}

BOOL __40__FPTrashUnionCollection_filterDomains___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "spotlightMountPoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)updateCollectionsForDomains:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *queue;
  id v15;
  _QWORD block[5];
  id v17;
  _QWORD v18[5];
  id v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPTrashUnionCollection updateCollectionsForDomains:].cold.1((uint64_t)v4, v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", self->_trashQueryCollection);
  v7 = dispatch_group_create();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
        dispatch_group_enter(v7);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke;
        v18[3] = &unk_1E444E890;
        v18[4] = v13;
        v19 = v6;
        v20 = v7;
        -[FPTrashUnionCollection fetchTrashItemsFromProvider:completionHandler:](self, "fetchTrashItemsFromProvider:completionHandler:", v13, v18);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_8;
  block[3] = &unk_1E4449A40;
  block[4] = self;
  v17 = v6;
  v15 = v6;
  dispatch_group_notify(v7, queue, block);

}

- (FPQueryCollection)trashQueryCollection
{
  return self->_trashQueryCollection;
}

- (void)fetchTrashItemsFromProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__FPTrashUnionCollection_fetchTrashItemsFromProvider_completionHandler___block_invoke;
  v10[3] = &unk_1E444E868;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "fetchOperationServiceForProviderDomainID:handler:", v8, v10);

}

void __72__FPTrashUnionCollection_fetchTrashItemsFromProvider_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __72__FPTrashUnionCollection_fetchTrashItemsFromProvider_completionHandler___block_invoke_2;
    v5[3] = &unk_1E444E840;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "fetchTrashIdentifiersWithCompletionHandler:", v5);

  }
}

uint64_t __72__FPTrashUnionCollection_fetchTrashItemsFromProvider_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v15 = a3;
  if (v15)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_cold_2();
  }
  else
  {
    v5 = *(id *)(a1 + 40);
    objc_sync_enter(v5);
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_cold_1();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v16;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = *(void **)(a1 + 40);
          +[FPItemManager defaultManager](FPItemManager, "defaultManager", v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "newCollectionWithItemID:", v11);
          objc_msgSend(v12, "addObject:", v14);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    objc_sync_exit(v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)scopedSearchQuery
{
  return -[NSFileProviderSearchQuery initWithSearchScope:]([NSFileProviderSearchQuery alloc], "initWithSearchScope:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trashQueryCollection, 0);
  objc_storeStrong(&self->_providerDomainChangesToken, 0);
}

- (void)updateCollectionsForDomains:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] updating trash collection with domains %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] received trash items %@ for domain %@");
  OUTLINED_FUNCTION_3();
}

void __54__FPTrashUnionCollection_updateCollectionsForDomains___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] Received error %@ looking for trash items on domain %@");
  OUTLINED_FUNCTION_3();
}

@end
