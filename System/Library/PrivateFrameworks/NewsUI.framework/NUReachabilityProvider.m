@implementation NUReachabilityProvider

- (NUReachabilityProvider)initWithNetworkReachability:(id)a3
{
  id v5;
  NUReachabilityProvider *v6;
  uint64_t v7;
  NSHashTable *observers;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NUReachabilityProvider;
  v6 = -[NUReachabilityProvider init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_networkReachability, a3);
    objc_msgSend(v5, "addObserver:", v6);
  }

  return v6;
}

- (BOOL)isNetworkReachable
{
  void *v2;
  char v3;

  -[NUReachabilityProvider networkReachability](self, "networkReachability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  return v3;
}

- (void)addReachabilityObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NUReachabilityProvider observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeReachabilityObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NUReachabilityProvider observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)networkReachabilityDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "isNetworkReachable");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NUReachabilityProvider observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "reachabilityChanged:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (FCNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
}

@end
