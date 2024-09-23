@implementation FBSApplicationDataStoreMonitor

- (FBSApplicationDataStoreMonitor)init
{
  return -[FBSApplicationDataStoreMonitor initWithClient:](self, "initWithClient:", 0);
}

- (FBSApplicationDataStoreMonitor)initWithClient:(id)a3
{
  id v4;
  FBSApplicationDataStoreMonitor *v5;
  FBSApplicationDataStoreMonitor *v6;
  FBSApplicationDataStoreRepositoryClient *v7;
  char v8;
  void *client;
  uint64_t v10;
  FBSApplicationDataStoreRepositoryClient *v11;
  uint64_t v12;
  NSHashTable *lock_observers;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FBSApplicationDataStoreMonitor;
  v5 = -[FBSApplicationDataStoreMonitor init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      v7 = (FBSApplicationDataStoreRepositoryClient *)v4;
      v8 = 0;
      client = v6->_client;
      v6->_client = v7;
    }
    else
    {
      +[FBSApplicationDataStoreClientFactory sharedInstance](FBSApplicationDataStoreClientFactory, "sharedInstance");
      client = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(client, "checkout");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v6->_client;
      v6->_client = (FBSApplicationDataStoreRepositoryClient *)v10;

      v8 = 1;
    }

    v6->_clientNeedsCheckin = v8;
    -[FBSApplicationDataStoreRepositoryClient addObserver:](v6->_client, "addObserver:", v6);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    lock_observers = v6->_lock_observers;
    v6->_lock_observers = (NSHashTable *)v12;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[FBSApplicationDataStoreRepositoryClient removeObserver:](self->_client, "removeObserver:", self);
  if (self->_clientNeedsCheckin)
  {
    +[FBSApplicationDataStoreClientFactory sharedInstance](FBSApplicationDataStoreClientFactory, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "checkin");

  }
  v4.receiver = self;
  v4.super_class = (Class)FBSApplicationDataStoreMonitor;
  -[FBSApplicationDataStoreMonitor dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_hasObserver:(id)a3
{
  FBSApplicationDataStoreMonitor *v3;
  os_unfair_lock_s *p_lock;
  id v5;

  v3 = self;
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = -[NSHashTable containsObject:](v3->_lock_observers, "containsObject:", v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (void)applicationDataStoreRepositoryClient:(id)a3 application:(id)a4 changedObject:(id)a5 forKey:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_lock_observers, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "dataStoreMonitor:didUpdateApplication:forKey:", self, v8, v9, (_QWORD)v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)applicationDataStoreRepositoryClient:(id)a3 storeInvalidatedForApplication:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_lock_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "dataStoreMonitor:didInvalidateApplication:", self, v5, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
