@implementation WFAccountCache

- (WFAccountCache)init
{
  WFAccountCache *v2;
  uint64_t v3;
  NSCache *cache;
  WFAccountCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFAccountCache;
  v2 = -[WFAccountCache init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSCache *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)numberOfAccountsForService:(id)a3
{
  id v4;
  NSCache *cache;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  cache = self->_cache;
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](cache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[WFAccountCache accountsForService:](self, "accountsForService:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)accountsForService:(id)a3
{
  NSCache *cache;
  void *v4;
  void *v5;

  cache = self->_cache;
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("-accounts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setNumberOfAccounts:(id)a3 forService:(id)a4
{
  NSCache *cache;
  id v6;
  id v7;

  cache = self->_cache;
  v6 = a3;
  objc_msgSend(a4, "stringByAppendingString:", CFSTR("-count"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:](cache, "setObject:forKey:", v6, v7);

}

- (void)setAccounts:(id)a3 forService:(id)a4
{
  NSCache *cache;
  id v6;
  id v7;

  cache = self->_cache;
  v6 = a3;
  objc_msgSend(a4, "stringByAppendingString:", CFSTR("-accounts"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:](cache, "setObject:forKey:", v6, v7);

}

- (void)clearCacheForService:(id)a3
{
  NSCache *cache;
  id v5;
  void *v6;
  NSCache *v7;
  id v8;

  cache = self->_cache;
  v5 = a3;
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("-accounts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache removeObjectForKey:](cache, "removeObjectForKey:", v6);

  v7 = self->_cache;
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("-count"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSCache removeObjectForKey:](v7, "removeObjectForKey:", v8);
}

- (NSCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
