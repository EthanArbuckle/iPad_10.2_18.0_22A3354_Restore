@implementation AFConnectionEntitlementCache

- (AFConnectionEntitlementCache)init
{
  AFConnectionEntitlementCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  uint64_t v5;
  NSMutableDictionary *bundleIDToPIDMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFConnectionEntitlementCache;
  v2 = -[AFConnectionEntitlementCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    bundleIDToPIDMap = v2->_bundleIDToPIDMap;
    v2->_bundleIDToPIDMap = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (BOOL)hasEntitlement:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *cache;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  cache = self->_cache;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "isEqualToString:", v7);

  return (char)v6;
}

- (void)cacheEntitlement:(id)a3 forPID:(int)a4 bundleID:(id)a5
{
  uint64_t v5;
  NSMutableDictionary *cache;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSMutableDictionary *bundleIDToPIDMap;
  void *v16;
  id v17;

  v5 = *(_QWORD *)&a4;
  v17 = a5;
  cache = self->_cache;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](cache, "setObject:forKey:", v10, v11);

  -[NSMutableDictionary objectForKey:](self->_bundleIDToPIDMap, "objectForKey:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", v12);
      bundleIDToPIDMap = self->_bundleIDToPIDMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](bundleIDToPIDMap, "setObject:forKey:", v16, v17);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDToPIDMap, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_262);
  return (id)sharedCache_sCache;
}

void __43__AFConnectionEntitlementCache_sharedCache__block_invoke()
{
  AFConnectionEntitlementCache *v0;
  void *v1;

  v0 = objc_alloc_init(AFConnectionEntitlementCache);
  v1 = (void *)sharedCache_sCache;
  sharedCache_sCache = (uint64_t)v0;

}

@end
