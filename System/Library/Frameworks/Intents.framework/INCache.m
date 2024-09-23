@implementation INCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_75735 != -1)
    dispatch_once(&sharedCache_onceToken_75735, &__block_literal_global_75736);
  return (id)sharedCache_sSharedCache;
}

- (void)addCacheableObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSCache setObject:forKey:](self->_underlyingCache, "setObject:forKey:", v4, v5);
  }
  else
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[INCache addCacheableObject:]";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Unable to add %@ to cache because there's no identifier.", (uint8_t *)&v7, 0x16u);
    }
  }

}

void __22__INCache_sharedCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[INCache _init]([INCache alloc], "_init");
  v1 = (void *)sharedCache_sSharedCache;
  sharedCache_sSharedCache = (uint64_t)v0;

}

- (id)_init
{
  INCache *v2;
  NSCache *v3;
  NSCache *underlyingCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INCache;
  v2 = -[INCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    underlyingCache = v2->_underlyingCache;
    v2->_underlyingCache = v3;

  }
  return v2;
}

- (id)cacheableObjectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSCache objectForKey:](self->_underlyingCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[INCache cacheableObjectForIdentifier:]";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Unable to find cacheable object with identifier %@ in cache.", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

- (NSCache)_cacheDictionary
{
  return self->_underlyingCache;
}

- (void)removeCacheableObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSCache removeObjectForKey:](self->_underlyingCache, "removeObjectForKey:", v5);
  }
  else
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[INCache removeCacheableObject:]";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Unable to remove %@ from cache because there's no identifier.", (uint8_t *)&v7, 0x16u);
    }
  }

}

- (id)consumeCacheableObjectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSCache objectForKey:](self->_underlyingCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSCache removeObjectForKey:](self->_underlyingCache, "removeObjectForKey:", v4);
  }
  else
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[INCache consumeCacheableObjectForIdentifier:]";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Unable to find cacheable object with identifier %@ in cache for consuming.", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

- (void)removeAllCacheableObjects
{
  -[NSCache removeAllObjects](self->_underlyingCache, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingCache, 0);
}

@end
