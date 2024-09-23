@implementation MCManagedDomainsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1)
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_12);
  return (id)sharedCache_cache_0;
}

void __36__MCManagedDomainsCache_sharedCache__block_invoke()
{
  MCManagedDomainsCache *v0;
  void *v1;

  v0 = objc_alloc_init(MCManagedDomainsCache);
  v1 = (void *)sharedCache_cache_0;
  sharedCache_cache_0 = (uint64_t)v0;

}

- (MCManagedDomainsCache)init
{
  MCManagedDomainsCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *memberQueue;
  NSMutableArray *v5;
  NSMutableArray *memberQueueCache;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  MCManagedDomainsCache *v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MCManagedDomainsCache;
  v2 = -[MCManagedDomainsCache init](&v17, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MCManagedDomainsCache member queue", MEMORY[0x1E0C80D50]);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memberQueueCache = v2->_memberQueueCache;
    v2->_memberQueueCache = v5;

    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __29__MCManagedDomainsCache_init__block_invoke;
    v14[3] = &unk_1E41E2BF8;
    objc_copyWeak(&v15, &location);
    v9 = (id)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.managedconfiguration.effectivesettingschanged"), 0, 0, v14);

    v10 = v2->_memberQueue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __29__MCManagedDomainsCache_init__block_invoke_2;
    block[3] = &unk_1E41E0C18;
    v13 = v2;
    dispatch_barrier_sync(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__MCManagedDomainsCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rereadCache");

}

uint64_t __29__MCManagedDomainsCache_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueRereadCache");
}

- (BOOL)isURLManaged:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  _QWORD block[5];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  if (v4)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x2020000000;
    v15 = 0;
    -[MCManagedDomainsCache memberQueue](self, "memberQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__MCManagedDomainsCache_isURLManaged___block_invoke;
    block[3] = &unk_1E41E2DE8;
    block[4] = self;
    v10 = v4;
    v11 = buf;
    dispatch_sync(v5, block);

    v6 = v13[24] != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "URL isn't managed since it's nil", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

void __38__MCManagedDomainsCache_isURLManaged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "memberQueueCache", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "matchesURL:", *(_QWORD *)(a1 + 40)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)rereadCache
{
  NSObject *v3;
  _QWORD block[5];

  -[MCManagedDomainsCache memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MCManagedDomainsCache_rereadCache__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

uint64_t __36__MCManagedDomainsCache_rereadCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueRereadCache");
}

- (void)memberQueueRereadCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MCDomainsCacheEntry *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MCManagedDomainsCache memberQueueCache](self, "memberQueueCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveUnionValuesForSetting:", CFSTR("managedWebDomains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = -[MCDomainsCacheEntry initWithPattern:]([MCDomainsCacheEntry alloc], "initWithPattern:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        -[MCManagedDomainsCache memberQueueCache](self, "memberQueueCache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

uint64_t __47__MCManagedDomainsCache_memberQueueRereadCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "length");
  v6 = objc_msgSend(v4, "length");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (NSMutableArray)memberQueueCache
{
  return self->_memberQueueCache;
}

- (void)setMemberQueueCache:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueCache, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end
