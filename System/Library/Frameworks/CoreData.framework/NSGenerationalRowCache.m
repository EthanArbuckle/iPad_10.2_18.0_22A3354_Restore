@implementation NSGenerationalRowCache

- (id)rowCacheForGeneration:(uint64_t)a1
{
  _WORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  if (!a1)
    return 0;
  if ((objc_msgSend(a2, "_isEnabled") & 1) == 0)
    return *(id *)(a1 + 16);
  v4 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)a2, *(id *)(a1 + 8));
  if (!v4)
    return 0;
  v5 = *((_QWORD *)v4 + 3);
  if (!v5)
    return 0;
  os_unfair_lock_lock_with_options();
  v6 = (void *)objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v5);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "rowCacheClass")), "initWithPersistentStore:", *(_QWORD *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v7, v5);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  v10 = v7;
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_primaryCache = 0;
  self->_rowCachesByGenerationToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSGenerationalRowCache;
  -[NSGenerationalRowCache dealloc](&v3, sel_dealloc);
}

- (void)removeRowCacheForGenerationWithIdentifier:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    if (a2)
    {
      v4 = (os_unfair_lock_s *)(a1 + 32);
      os_unfair_lock_lock_with_options();
      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", a2);
      os_unfair_lock_unlock(v4);
    }
  }
}

- (NSGenerationalRowCache)initWithStore:(id)a3
{
  NSGenerationalRowCache *v4;
  NSGenerationalRowCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSGenerationalRowCache;
  v4 = -[NSGenerationalRowCache init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_store = (NSPersistentStore *)a3;
    v4->_primaryCache = (NSPersistentStoreCache *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "rowCacheClass")), "initWithPersistentStore:", a3);
    v5->_rowCachesByGenerationToken = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)forgetAllGenerationalExternalData
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    v3 = os_unfair_lock_lock_with_options();
    v4 = (void *)MEMORY[0x18D76B4E4](v3);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 24), "allValues", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          -[NSPersistentStoreCache forgetAllExternalData](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    objc_autoreleasePoolPop(v4);
    os_unfair_lock_unlock(v2);
  }
}

@end
