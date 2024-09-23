@implementation AMSLRUCache

- (id)objectForKey:(id)a3 canLogCacheMisses:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _BYTE v18[24];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock_with_options();
  -[AMSLRUCache backingDictionary](self, "backingDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSLRUCache backingList](self, "backingList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeNode:", v8);

    -[AMSLRUCache backingList](self, "backingList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertNode:", v8);

  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v8, "object");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v4 && !v11)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v18 = 138412546;
      *(_QWORD *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v6;
      v15 = *(id *)&v18[4];
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEBUG, "%@: %@ resulted in a cache miss.", v18, 0x16u);

    }
  }
  objc_msgSend(v12, "object", *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)objectForKey:(id)a3
{
  return -[AMSLRUCache objectForKey:canLogCacheMisses:](self, "objectForKey:canLogCacheMisses:", a3, 1);
}

- (AMSDoubleLinkedList)backingList
{
  return self->_backingList;
}

- (NSMutableDictionary)backingDictionary
{
  return self->_backingDictionary;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  if (v7)
    -[AMSLRUCache _addObject:forKey:](self, "_addObject:forKey:", v7, v6);
  else
    -[AMSLRUCache _removeObjectForKey:](self, "_removeObjectForKey:", v6);

  os_unfair_lock_unlock(&self->_lock);
}

- (id)objectForKey:(id)a3 withCreationBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[AMSLRUCache backingDictionary](self, "backingDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v7[2](v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSLRUCache _addObject:forKey:](self, "_addObject:forKey:", v11, v6);

    -[AMSLRUCache backingDictionary](self, "backingDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AMSLRUCache backingList](self, "backingList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeNode:", v10);

  -[AMSLRUCache backingList](self, "backingList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertNode:", v10);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v10, "object");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "object");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_addObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  AMSLRUCacheItem *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v7)
  {
    -[AMSLRUCache backingDictionary](self, "backingDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[AMSLRUCache backingList](self, "backingList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeNode:", v9);

    }
    v11 = -[AMSLRUCacheItem initWithKey:object:]([AMSLRUCacheItem alloc], "initWithKey:object:", v7, v6);
    -[AMSLRUCache backingList](self, "backingList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObject:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSLRUCache backingDictionary](self, "backingDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v13, v7);

    v15 = -[AMSLRUCache _count](self, "_count");
    if (v15 > -[AMSLRUCache maxSize](self, "maxSize"))
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v23 = 138412290;
        v24 = (id)objc_opt_class();
        v18 = v24;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEBUG, "%@: Cache is full. The oldest object will be evicted.", (uint8_t *)&v23, 0xCu);

      }
      -[AMSLRUCache backingList](self, "backingList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "tail");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "object");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSLRUCache _removeObjectForKey:](self, "_removeObjectForKey:", v22);

    }
  }

}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (unint64_t)_count
{
  void *v3;
  unint64_t v4;

  os_unfair_lock_assert_owner(&self->_lock);
  -[AMSLRUCache backingDictionary](self, "backingDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (AMSLRUCache)initWithMaxSize:(unint64_t)a3
{
  AMSLRUCache *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *backingDictionary;
  AMSDoubleLinkedList *v7;
  AMSDoubleLinkedList *backingList;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AMSLRUCache;
  v4 = -[AMSLRUCache init](&v10, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backingDictionary = v4->_backingDictionary;
    v4->_backingDictionary = v5;

    v7 = objc_alloc_init(AMSDoubleLinkedList);
    backingList = v4->_backingList;
    v4->_backingList = v7;

    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_maxSize = a3;
  }
  return v4;
}

- (void)_removeObjectForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[AMSLRUCache backingDictionary](self, "backingDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSLRUCache backingList](self, "backingList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeNode:", v5);

    -[AMSLRUCache backingDictionary](self, "backingDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
}

- (AMSLRUCache)init
{
  return -[AMSLRUCache initWithMaxSize:](self, "initWithMaxSize:", 5);
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[AMSLRUCache _count](self, "_count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)allObjectsAndKeys
{
  id v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[AMSLRUCache backingDictionary](self, "backingDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__AMSLRUCache_allObjectsAndKeys__block_invoke;
  v8[3] = &unk_1E2542BB0;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

void __32__AMSLRUCache_allObjectsAndKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[AMSLRUCache backingDictionary](self, "backingDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[AMSLRUCache backingList](self, "backingList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllNodes");

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  id v3;
  void *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v21.receiver = self;
  v21.super_class = (Class)AMSLRUCache;
  -[AMSLRUCache description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR(" {"));
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AMSLRUCache backingList](self, "backingList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "object");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("\n%@: %@,"), v14, v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "appendString:", CFSTR("\n}"));
  return v3;
}

- (void)performExclusively:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingList, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end
