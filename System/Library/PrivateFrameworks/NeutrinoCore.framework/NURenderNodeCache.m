@implementation NURenderNodeCache

- (NURenderNodeCache)init
{
  NURenderNodeCache *v2;
  uint64_t v3;
  NSHashTable *cache;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NURenderNodeCache;
  v2 = -[NURenderNodeCache init](&v10, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v3 = objc_claimAutoreleasedReturnValue();
  cache = v2->_cache;
  v2->_cache = (NSHashTable *)v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("NURenderNodeCache", v5);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__mediaServicesWereReset_, *MEMORY[0x1E0C89EE8], 0);

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C89EE8], 0);

  v4.receiver = self;
  v4.super_class = (Class)NURenderNodeCache;
  -[NURenderNodeCache dealloc](&v4, sel_dealloc);
}

- (void)_addNode:(id)a3
{
  -[NSHashTable addObject:](self->_cache, "addObject:", a3);
}

- (void)addNode:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__NURenderNodeCache_addNode___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)cachedNodeForNode:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__21459;
  v16 = __Block_byref_object_dispose__21460;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__NURenderNodeCache_cachedNodeForNode___block_invoke;
  block[3] = &unk_1E5063868;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)retrieveAndCacheNode:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__21459;
  v16 = __Block_byref_object_dispose__21460;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NURenderNodeCache_retrieveAndCacheNode___block_invoke;
  block[3] = &unk_1E5063868;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (unint64_t)unhitCacheEntriesCount
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__NURenderNodeCache_unhitCacheEntriesCount__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: 0x%p Count: %lu>"), objc_opt_class(), self, -[NSHashTable count](self->_cache, "count"));
}

- (id)debugDescription
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__21459;
  v10 = __Block_byref_object_dispose__21460;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__NURenderNodeCache_debugDescription__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_mediaServicesWereReset:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C89EE0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_48);
  v5 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "NURenderNodeCache: received AVAssetMediaServicesWereResetNotification. AVObjects are invalid! Error: %{public}@", (uint8_t *)&v7, 0xCu);
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_48);
  }
  v6 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_FAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_fault_impl(&dword_1A6553000, v6, OS_LOG_TYPE_FAULT, "AV media services reset: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __37__NURenderNodeCache_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  uint64_t v24;
  void *v25;
  long double v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: 0x%p Count: %lu"), objc_opt_class(), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR("\n| Node Created   |     Node Hash       |                    Node                  | Hits"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_msgSend(v5, "addObject:", v8);
      objc_msgSend(v6, "nextObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    while (v9);
  }
  v28 = v6;
  v29 = v5;
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_21465);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v32;
    do
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
        objc_msgSend(v16, "nodeCreationJobName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "nodeCreationJobName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if ((v19 & 1) == 0)
        {
          v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v16, "nodeCreationJobName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "appendFormat:", CFSTR("\n\n==== %@ =============="), v21);

        }
        if (objc_msgSend(v16, "cacheHitsCount"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v16, "cacheHitsCount"));
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = &stru_1E5068958;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), v16);
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = objc_msgSend(v23, "cStringUsingEncoding:", 1);

        v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(v16, "nodeCreationTime");
        NUAbsoluteTimeToString(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendFormat:", CFSTR("\n(%@) %20lu : %42s Hits:%@"), v27, objc_msgSend(v16, "hash"), v24, v22);

        v12 = v16;
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR("\n>"));

}

uint64_t __37__NURenderNodeCache_debugDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "nodeCreationJobName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeCreationJobName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v4, "nodeCreationTime");
    v9 = v8;
    objc_msgSend(v5, "nodeCreationTime");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "compare:", v13);

  }
  else
  {
    v14 = objc_msgSend(v6, "compare:", v7);
  }

  return v14;
}

void __43__NURenderNodeCache_unhitCacheEntriesCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectEnumerator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      if (!objc_msgSend(v3, "cacheHitsCount"))
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      objc_msgSend(v5, "nextObject");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    while (v4);
  }

}

void __42__NURenderNodeCache_retrieveAndCacheNode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "member:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  if (v6)
  {
    objc_msgSend(v6, "setCacheHitsCount:", objc_msgSend(*(id *)(v5 + 40), "cacheHitsCount") + 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_addNode:", *(_QWORD *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }
}

uint64_t __39__NURenderNodeCache_cachedNodeForNode___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 16), "member:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  return objc_msgSend(v5, "setCacheHitsCount:", objc_msgSend(v5, "cacheHitsCount") + 1);
}

uint64_t __29__NURenderNodeCache_addNode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addNode:", *(_QWORD *)(a1 + 40));
}

+ (NURenderNodeCache)sharedInstance
{
  void *v2;
  void *v3;

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderNodeCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NURenderNodeCache *)v3;
}

@end
