@implementation ENAuthCache

- (ENAuthCache)init
{
  ENAuthCache *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENAuthCache;
  v2 = -[ENAuthCache init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[ENAuthCache setLinkedCache:](v2, "setLinkedCache:", v3);

  }
  return v2;
}

- (void)setAuthenticationResult:(id)a3 forLinkedNotebookGuid:(id)a4
{
  id v6;
  void *v7;
  ENAuthCache *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    +[ENAuthCacheEntry entryWithResult:](ENAuthCacheEntry, "entryWithResult:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    objc_sync_enter(v8);
    -[ENAuthCache linkedCache](v8, "linkedCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);

    objc_sync_exit(v8);
  }

}

- (id)authenticationResultForLinkedNotebookGuid:(id)a3
{
  id v4;
  ENAuthCache *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ENAuthCache linkedCache](v5, "linkedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_msgSend(v7, "isValid") & 1) == 0)
  {
    -[ENAuthCache linkedCache](v5, "linkedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v4);

    v7 = 0;
  }
  objc_msgSend(v7, "authResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v9;
}

- (void)setAuthenticationResultForBusiness:(id)a3
{
  id v4;
  void *v5;
  ENAuthCache *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    +[ENAuthCacheEntry entryWithResult:](ENAuthCacheEntry, "entryWithResult:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self;
    objc_sync_enter(v6);
    -[ENAuthCache setBusinessCache:](v6, "setBusinessCache:", v5);
    objc_sync_exit(v6);

    v4 = v7;
  }

}

- (id)authenticationResultForBusiness
{
  ENAuthCache *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  -[ENAuthCache businessCache](v2, "businessCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isValid") & 1) == 0)
    -[ENAuthCache setBusinessCache:](v2, "setBusinessCache:", 0);
  objc_msgSend(v4, "authResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v5;
}

- (NSMutableDictionary)linkedCache
{
  return self->_linkedCache;
}

- (void)setLinkedCache:(id)a3
{
  objc_storeStrong((id *)&self->_linkedCache, a3);
}

- (ENAuthCacheEntry)businessCache
{
  return self->_businessCache;
}

- (void)setBusinessCache:(id)a3
{
  objc_storeStrong((id *)&self->_businessCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessCache, 0);
  objc_storeStrong((id *)&self->_linkedCache, 0);
}

@end
