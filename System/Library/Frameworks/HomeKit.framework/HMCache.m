@implementation HMCache

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMCache)initWithCachedObjects:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  HMCache *v8;
  HMCache *v9;
  uint64_t v10;
  NSMutableDictionary *cachedItems;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMCache;
  v8 = -[HMCache init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v6, "mutableCopy");
    cachedItems = v9->_cachedItems;
    v9->_cachedItems = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_cacheName, a4);
  }

  return v9;
}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Data cannot be nil"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  -[HMCache _setData:forKey:](self, "_setData:forKey:", v8, v6);

}

- (id)numberForKey:(id)a3
{
  void *v3;
  void *v4;

  -[HMCache dataForKey:](self, "dataForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedItems, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "isExpired"))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItems, "setObject:forKeyedSubscript:", 0, v4);

    os_unfair_lock_unlock(&self->_lock);
    -[HMCache delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cacheDidUpdate:", self);

    v6 = 0;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setData:(id)a3 forKey:(id)a4
{
  id v6;
  HMCacheEntry *v7;
  void *v8;
  HMCacheEntry *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    v7 = [HMCacheEntry alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMCacheEntry initWithData:lastModificationDate:](v7, "initWithData:lastModificationDate:", v11, v8);

    os_unfair_lock_lock_with_options();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItems, "setObject:forKeyedSubscript:", v9, v6);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    os_unfair_lock_lock_with_options();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedItems, "setObject:forKeyedSubscript:", 0, v6);
    os_unfair_lock_unlock(&self->_lock);
  }
  -[HMCache delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cacheDidUpdate:", self);

}

- (HMCacheDelegate)delegate
{
  return (HMCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)cacheName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedItems, 0);
}

- (void)removeObjectForKey:(id)a3
{
  -[HMCache _setData:forKey:](self, "_setData:forKey:", 0, a3);
}

- (NSDictionary)cachedObjects
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  int v10;
  NSMutableDictionary *cachedItems;
  void *v12;
  void *v13;
  void *v14;
  os_unfair_lock_t lock;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_cachedItems, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (void *)-[NSMutableDictionary copy](self->_cachedItems, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedItems, "objectForKeyedSubscript:", v8, lock);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isExpired");

        cachedItems = self->_cachedItems;
        if (v10)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](cachedItems, "setObject:forKeyedSubscript:", 0, v8);
          v5 = 1;
        }
        else
        {
          -[NSMutableDictionary objectForKeyedSubscript:](cachedItems, "objectForKeyedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, v8);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);

    os_unfair_lock_unlock(lock);
    if ((v5 & 1) != 0)
    {
      -[HMCache delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cacheDidUpdate:", self);

    }
  }
  else
  {

    os_unfair_lock_unlock(lock);
  }
  v14 = (void *)objc_msgSend(v17, "copy", lock);

  return (NSDictionary *)v14;
}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Number cannot be nil"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v8 = (void *)v7;
  -[HMCache setData:forKey:](self, "setData:forKey:", v7, v6);

}

- (id)stringForKey:(id)a3
{
  void *v3;
  void *v4;

  -[HMCache dataForKey:](self, "dataForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("String cannot be nil"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v8 = (void *)v7;
  -[HMCache setData:forKey:](self, "setData:forKey:", v7, v6);

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
