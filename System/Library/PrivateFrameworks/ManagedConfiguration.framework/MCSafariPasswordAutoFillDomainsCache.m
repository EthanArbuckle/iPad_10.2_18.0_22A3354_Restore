@implementation MCSafariPasswordAutoFillDomainsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_5);
  return (id)sharedCache_cache;
}

void __51__MCSafariPasswordAutoFillDomainsCache_sharedCache__block_invoke()
{
  MCSafariPasswordAutoFillDomainsCache *v0;
  void *v1;

  v0 = objc_alloc_init(MCSafariPasswordAutoFillDomainsCache);
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = (uint64_t)v0;

}

- (MCSafariPasswordAutoFillDomainsCache)init
{
  MCSafariPasswordAutoFillDomainsCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *memberQueue;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  MCSafariPasswordAutoFillDomainsCache *v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCSafariPasswordAutoFillDomainsCache;
  v2 = -[MCSafariPasswordAutoFillDomainsCache init](&v15, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MCSafariPasswordAutoFillDomainsCache member queue", MEMORY[0x1E0C80D50]);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__MCSafariPasswordAutoFillDomainsCache_init__block_invoke;
    v12[3] = &unk_1E41E2BF8;
    objc_copyWeak(&v13, &location);
    v7 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.managedconfiguration.effectivesettingschanged"), 0, 0, v12);

    v8 = v2->_memberQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __44__MCSafariPasswordAutoFillDomainsCache_init__block_invoke_2;
    block[3] = &unk_1E41E0C18;
    v11 = v2;
    dispatch_barrier_async(v8, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __44__MCSafariPasswordAutoFillDomainsCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rereadCache");

}

uint64_t __44__MCSafariPasswordAutoFillDomainsCache_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueRereadCache");
}

- (BOOL)isSafariPasswordAutoFillAllowedForURL:(id)a3
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
    -[MCSafariPasswordAutoFillDomainsCache memberQueue](self, "memberQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__MCSafariPasswordAutoFillDomainsCache_isSafariPasswordAutoFillAllowedForURL___block_invoke;
    block[3] = &unk_1E41E2C20;
    block[4] = self;
    v11 = buf;
    v10 = v4;
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
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Safari Password Auto Fill isn't allowed since the URL is nil", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

void __78__MCSafariPasswordAutoFillDomainsCache_isSafariPasswordAutoFillAllowedForURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "memberQueueCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "memberQueueCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "matchesURL:", *(_QWORD *)(a1 + 40)))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "userMode") != 1;

  }
}

- (void)rereadCache
{
  NSObject *v3;
  _QWORD block[5];

  -[MCSafariPasswordAutoFillDomainsCache memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MCSafariPasswordAutoFillDomainsCache_rereadCache__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

uint64_t __51__MCSafariPasswordAutoFillDomainsCache_rereadCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueRereadCache");
}

- (void)memberQueueRereadCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MCDomainsCacheEntry *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveUnionValuesForSetting:", CFSTR("allowedSafariPasswordAutoFillDomains"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCSafariPasswordAutoFillDomainsCache memberQueueCache](self, "memberQueueCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MCSafariPasswordAutoFillDomainsCache memberQueueCache](self, "memberQueueCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAllObjects");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCSafariPasswordAutoFillDomainsCache setMemberQueueCache:](self, "setMemberQueueCache:", v6);
    }

    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_8_1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = -[MCDomainsCacheEntry initWithPattern:]([MCDomainsCacheEntry alloc], "initWithPattern:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
          -[MCSafariPasswordAutoFillDomainsCache memberQueueCache](self, "memberQueueCache");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[MCSafariPasswordAutoFillDomainsCache setMemberQueueCache:](self, "setMemberQueueCache:", 0);
  }

}

uint64_t __62__MCSafariPasswordAutoFillDomainsCache_memberQueueRereadCache__block_invoke(uint64_t a1, void *a2, void *a3)
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
