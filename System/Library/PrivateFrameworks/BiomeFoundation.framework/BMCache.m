@implementation BMCache

- (id)cachedObjectWithKey:(id)a3 missHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  os_unfair_lock_s *p_lock;
  void *v9;
  uint64_t v10;
  void *v11;
  BMCache *fallback;
  void *v13;
  id v14;
  void *v15;
  NSMapTable *mapTable;
  void *v17;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_mapTable, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_5:
    fallback = self->_fallback;
    if (fallback)
    {
      -[BMCache cachedObjectWithKey:missHandler:](fallback, "cachedObjectWithKey:missHandler:", v6, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v7)
      {
        v13 = 0;
LABEL_13:
        v14 = v13;
        goto LABEL_14;
      }
      v15 = (void *)MEMORY[0x1AF4569E0]();
      v7[2](v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v15);
    }
    if (v13)
    {
      mapTable = self->_mapTable;
      v17 = (void *)objc_msgSend(v6, "copyWithZone:", 0);
      -[NSMapTable setObject:forKey:](mapTable, "setObject:forKey:", v13, v17);

    }
    goto LABEL_13;
  }
  -[BMCache isExpiredBlock](self, "isExpiredBlock");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10 && (*(unsigned int (**)(uint64_t, void *))(v10 + 16))(v10, v9))
  {
    -[NSMapTable removeObjectForKey:](self->_mapTable, "removeObjectForKey:", v6);

    goto LABEL_5;
  }
  v14 = v9;

LABEL_14:
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (id)isExpiredBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isExpiredBlock, 0);
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_storeStrong((id *)&self->_mapTable, 0);
}

+ (id)weakCache
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithMapTable:fallback:", v3, 0);

  return v4;
}

- (void)setIsExpiredBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

+ (id)strongCacheWithFallbackCache:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "_initWithMapTable:fallback:", v6, v4);

  return v7;
}

- (id)_initWithMapTable:(id)a3 fallback:(id)a4
{
  id v7;
  id v8;
  BMCache *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMCache;
  v9 = -[BMCache init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_mapTable, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

+ (id)strongCache
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithMapTable:fallback:", v3, 0);

  return v4;
}

- (id)cachedObjectWithKey:(id)a3
{
  return -[BMCache cachedObjectWithKey:missHandler:](self, "cachedObjectWithKey:missHandler:", a3, 0);
}

- (void)removeCachedObjectForKey:(id)a3
{
  -[BMCache removeCachedObjectForKey:performWhileLocked:](self, "removeCachedObjectForKey:performWhileLocked:", a3, 0);
}

- (void)removeCachedObjectForKey:(id)a3 performWhileLocked:(id)a4
{
  void (**v6)(_QWORD);
  os_unfair_lock_s *p_lock;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(_QWORD))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[NSMapTable removeObjectForKey:](self->_mapTable, "removeObjectForKey:", v10);
  if (v6)
  {
    v9 = (void *)MEMORY[0x1AF4569E0](v8);
    v6[2](v6);
    objc_autoreleasePoolPop(v9);
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)pruneCacheWithBlock:(id)a3 completion:(id)a4
{
  unsigned int (**v7)(id, uint64_t, void *, char *);
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  NSMapTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *context;
  os_unfair_lock_t lock;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  char v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (unsigned int (**)(id, uint64_t, void *, char *))a3;
  v8 = (void (**)(_QWORD))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMCache.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = MEMORY[0x1AF4569E0]();
  v34 = 0;
  v10 = (void *)objc_opt_new();
  context = (void *)v9;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = self->_mapTable;
  v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v31;
LABEL_5:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v11);
      v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14);
      -[NSMapTable objectForKey:](self->_mapTable, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16 || v7[2](v7, v15, v16, &v34))
        objc_msgSend(v10, "addObject:", v15);
      v17 = v34 == 0;

      if (!v17)
        break;
      if (v12 == ++v14)
      {
        v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v12)
          goto LABEL_5;
        break;
      }
    }
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v18);
        -[NSMapTable removeObjectForKey:](self->_mapTable, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v19);
  }

  objc_autoreleasePoolPop(context);
  if (v8)
  {
    v22 = (void *)MEMORY[0x1AF4569E0]();
    v8[2](v8);
    objc_autoreleasePoolPop(v22);
  }
  os_unfair_lock_unlock(lock);

}

@end
