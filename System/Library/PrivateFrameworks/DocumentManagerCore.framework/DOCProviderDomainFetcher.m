@implementation DOCProviderDomainFetcher

- (DOCProviderDomainFetcher)init
{
  DOCProviderDomainFetcher *v2;
  uint64_t v3;
  FINode *providerDomainsNode;
  uint64_t v5;
  FINodeObserver *observer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCProviderDomainFetcher;
  v2 = -[DOCProviderDomainFetcher init](&v8, sel_init);
  if (v2)
  {
    StartFINode();
    objc_msgSend(MEMORY[0x24BE2BEB0], "providerDomainsContainer");
    v3 = objc_claimAutoreleasedReturnValue();
    providerDomainsNode = v2->_providerDomainsNode;
    v2->_providerDomainsNode = (FINode *)v3;

    objc_msgSend(MEMORY[0x24BE2BEB8], "observerForFINode:withObserver:", v2->_providerDomainsNode, v2);
    v5 = objc_claimAutoreleasedReturnValue();
    observer = v2->_observer;
    v2->_observer = (FINodeObserver *)v5;

    -[FINodeObserver startObserving:](v2->_observer, "startObserving:", 3);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[DOCProviderDomainFetcher observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopObserving:", 3);

  v4.receiver = self;
  v4.super_class = (Class)DOCProviderDomainFetcher;
  -[DOCProviderDomainFetcher dealloc](&v4, sel_dealloc);
}

- (BOOL)fetchProviders:(id)a3
{
  return -[DOCProviderDomainFetcher fetchProviders:queue:](self, "fetchProviders:queue:", a3, 0);
}

- (BOOL)fetchProviders:(id)a3 queue:(id)a4
{
  void (**v6)(id, DOCProviderDomainFetcher *);
  id v7;
  void *v8;
  void *v9;
  int v10;
  DOCProviderDomainFetcher *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (void (**)(id, DOCProviderDomainFetcher *))a3;
  v7 = a4;
  -[DOCProviderDomainFetcher providerDomainsNode](self, "providerDomainsNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iteratorWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "fullyPopulated");
  if (v10)
  {
    -[DOCProviderDomainFetcher providersFromIterator:](self, "providersFromIterator:", v9);
    v11 = (DOCProviderDomainFetcher *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);
  }
  else
  {
    if (!v7)
    {
      dispatch_get_global_queue(21, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = self;
    objc_sync_enter(v11);
    -[DOCProviderDomainFetcher pendingQueuesAndCallbacks](v11, "pendingQueuesAndCallbacks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "objectForKey:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)MEMORY[0x20BD0D5D4](v6);
    objc_msgSend(v15, "addObject:", v16);

    objc_msgSend(v13, "setObject:forKey:", v15, v7);
    -[DOCProviderDomainFetcher setPendingQueuesAndCallbacks:](v11, "setPendingQueuesAndCallbacks:", v13);

    objc_sync_exit(v11);
  }

  return v10;
}

- (id)providersFromIterator:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "first");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v6, "fpDomain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v4, "addObject:", v7);

      objc_msgSend(v3, "next");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    while (v8);
  }

  return v4;
}

- (void)openSyncCompleted:(id)a3
{
  DOCProviderDomainFetcher *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v4 = self;
  objc_sync_enter(v4);
  -[DOCProviderDomainFetcher pendingQueuesAndCallbacks](v4, "pendingQueuesAndCallbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCProviderDomainFetcher setPendingQueuesAndCallbacks:](v4, "setPendingQueuesAndCallbacks:", 0);
  objc_sync_exit(v4);

  if (objc_msgSend(v5, "count"))
  {
    -[DOCProviderDomainFetcher providerDomainsNode](v4, "providerDomainsNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iteratorWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[DOCProviderDomainFetcher providersFromIterator:](v4, "providersFromIterator:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          v12 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __46__DOCProviderDomainFetcher_openSyncCompleted___block_invoke;
          block[3] = &unk_24C0FE190;
          v18 = v13;
          v19 = v7;
          v14 = v13;
          dispatch_async(v12, block);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

  }
}

void __46__DOCProviderDomainFetcher_openSyncCompleted___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (FINode)providerDomainsNode
{
  return (FINode *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProviderDomainsNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FINodeObserver)observer
{
  return (FINodeObserver *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMapTable)pendingQueuesAndCallbacks
{
  return (NSMapTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingQueuesAndCallbacks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingQueuesAndCallbacks, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_providerDomainsNode, 0);
}

@end
