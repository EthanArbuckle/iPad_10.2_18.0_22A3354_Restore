@implementation AVTInMemoryResourceCache

+ (id)keyForItem:(id)a3 scope:(id)a4
{
  return (id)objc_msgSend(a3, "volatileIdentifierForScope:", a4);
}

- (id)observeChangesForItem:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__AVTInMemoryResourceCache_observeChangesForItem_key___block_invoke;
    v10[3] = &unk_1EA51D160;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    objc_msgSend(v6, "tokenForObservingChangesWithHandler:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[AVTInMemoryResourceCache logger](self, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logInMemoryCacheEvictsResource:", v7);

  -[AVTInMemoryResourceCache orderedEntries](self, "orderedEntries");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v5);

}

- (OS_dispatch_queue)storageLock
{
  return self->_storageLock;
}

void __68__AVTInMemoryResourceCache__resourceForItem_scope_cacheMissHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "objectForKey:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "resource");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (AVTInMemoryResourceCache)initWithLockProvider:(id)a3 totalCostLimit:(unint64_t)a4 logger:(id)a5
{
  void (**v8)(id, const char *);
  id v9;
  AVTInMemoryResourceCache *v10;
  NSCache *v11;
  NSCache *storage;
  uint64_t v13;
  NSMutableArray *orderedEntries;
  uint64_t v15;
  OS_dispatch_queue *storageLock;
  objc_super v18;

  v8 = (void (**)(id, const char *))a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVTInMemoryResourceCache;
  v10 = -[AVTInMemoryResourceCache init](&v18, sel_init);
  if (v10)
  {
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    storage = v10->_storage;
    v10->_storage = v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    orderedEntries = v10->_orderedEntries;
    v10->_orderedEntries = (NSMutableArray *)v13;

    -[NSCache setTotalCostLimit:](v10->_storage, "setTotalCostLimit:", a4);
    -[NSCache setDelegate:](v10->_storage, "setDelegate:", v10);
    v8[2](v8, "com.apple.AvatarUI.AVTInMemoryResourceCache.storageLock");
    v15 = objc_claimAutoreleasedReturnValue();
    storageLock = v10->_storageLock;
    v10->_storageLock = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v10->_logger, a5);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NSCache removeAllObjects](self->_storage, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)AVTInMemoryResourceCache;
  -[AVTInMemoryResourceCache dealloc](&v3, sel_dealloc);
}

+ (unint64_t)costForItem:(id)a3 scope:(id)a4
{
  return objc_msgSend(a3, "costForScope:", a4);
}

- (void)performStorageWork:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AVTInMemoryResourceCache storageLock](self, "storageLock");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVTInMemoryResourceCache_performStorageWork___block_invoke;
  block[3] = &unk_1EA51D058;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __47__AVTInMemoryResourceCache_performStorageWork___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "keyForItem:scope:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__AVTInMemoryResourceCache_resourceExistsInCacheForItem_scope___block_invoke;
  v11[3] = &unk_1EA51D080;
  v13 = &v14;
  v9 = v8;
  v12 = v9;
  -[AVTInMemoryResourceCache performStorageWork:](self, "performStorageWork:", v11);
  LOBYTE(self) = v15[5] != 0;

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __63__AVTInMemoryResourceCache_resourceExistsInCacheForItem_scope___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)resourceForItem:(id)a3 scope:(id)a4
{
  return -[AVTInMemoryResourceCache _resourceForItem:scope:cacheMissHandler:](self, "_resourceForItem:scope:cacheMissHandler:", a3, a4, 0);
}

- (id)_resourceForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, id);
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  AVTInMemoryResourceCache *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  objc_msgSend((id)objc_opt_class(), "keyForItem:scope:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v12 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __68__AVTInMemoryResourceCache__resourceForItem_scope_cacheMissHandler___block_invoke;
  v28[3] = &unk_1EA51D0A8;
  v30 = &v38;
  v13 = v11;
  v29 = v13;
  v31 = &v32;
  -[AVTInMemoryResourceCache performStorageWork:](self, "performStorageWork:", v28);
  if (v10 && !v33[5])
  {
    v14 = objc_msgSend((id)objc_opt_class(), "costForItem:scope:", v8, v9);
    v10[2](v10, v8, v9);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v33[5];
    v33[5] = v15;

    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __68__AVTInMemoryResourceCache__resourceForItem_scope_cacheMissHandler___block_invoke_2;
    v21[3] = &unk_1EA51D0D0;
    v25 = &v38;
    v22 = v13;
    v23 = self;
    v24 = v8;
    v26 = &v32;
    v27 = v14;
    -[AVTInMemoryResourceCache performStorageWork:](self, "performStorageWork:", v21);

  }
  if (v39[5])
  {
    -[AVTInMemoryResourceCache logger](self, "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v39[5], "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logInMemoryCacheHitForResource:", v18);

  }
  v19 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v19;
}

void __68__AVTInMemoryResourceCache__resourceForItem_scope_cacheMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  AVTInMemoryResourceCacheEntry *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "observeChangesForItem:key:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AVTInMemoryResourceCacheEntry initWithResource:changeToken:key:cost:]([AVTInMemoryResourceCacheEntry alloc], "initWithResource:changeToken:key:cost:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 40), "nts_evictObjectsToFreeUpCost:", *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTInMemoryResourceCacheEntry description](v7, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logInMemoryCacheStorageForResource:", v9);

    objc_msgSend(*(id *)(a1 + 40), "orderedEntries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v7);

    objc_msgSend(v11, "setObject:forKey:cost:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
  }

}

- (void)evictResourceFromCache:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "keyForItem:scope:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__AVTInMemoryResourceCache_evictResourceFromCache_scope___block_invoke;
  v10[3] = &unk_1EA51D0F8;
  v11 = v8;
  v9 = v8;
  -[AVTInMemoryResourceCache performStorageWork:](self, "performStorageWork:", v10);

}

uint64_t __57__AVTInMemoryResourceCache_evictResourceFromCache_scope___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (void)clearCache
{
  -[AVTInMemoryResourceCache performStorageWork:](self, "performStorageWork:", &__block_literal_global_0);
}

uint64_t __38__AVTInMemoryResourceCache_clearCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (void)nts_evictObjectsToFreeUpCost:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[AVTInMemoryResourceCache storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "totalCostLimit");

  -[AVTInMemoryResourceCache orderedEntries](self, "orderedEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 - 1 >= 0)
  {
    v9 = 0;
    v10 = v6 - a3;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      --v8;
      -[AVTInMemoryResourceCache orderedEntries](self, "orderedEntries");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v9 += objc_msgSend(v13, "cost");
      if (v9 > v10)
        break;
      v11 = v8;
      if (v8 < 1)
        return;
    }
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[AVTInMemoryResourceCache orderedEntries](self, "orderedEntries");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectsAtIndexes:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            -[AVTInMemoryResourceCache storage](self, "storage", (_QWORD)v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "key");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "removeObjectForKey:", v24);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v19);
      }

    }
  }
}

void __54__AVTInMemoryResourceCache_observeChangesForItem_key___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleChangeForItemForKey:", *(_QWORD *)(a1 + 32));

}

- (void)handleChangeForItemForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__AVTInMemoryResourceCache_handleChangeForItemForKey___block_invoke;
  v6[3] = &unk_1EA51D0F8;
  v7 = v4;
  v5 = v4;
  -[AVTInMemoryResourceCache performStorageWork:](self, "performStorageWork:", v6);

}

uint64_t __54__AVTInMemoryResourceCache_handleChangeForItemForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (NSCache)storage
{
  return self->_storage;
}

- (NSMutableArray)orderedEntries
{
  return self->_orderedEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_storageLock, 0);
  objc_storeStrong((id *)&self->_orderedEntries, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
