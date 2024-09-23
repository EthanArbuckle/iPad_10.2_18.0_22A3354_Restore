@implementation EDVIPManagerProxy

- (EDVIPManagerProxy)initWithVIPManager:(id)a3
{
  id v5;
  EDVIPManagerProxy *v6;
  EDVIPManagerProxy *v7;
  uint64_t v8;
  NSMapTable *observersByIdentifier;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EDVIPManagerProxy;
  v6 = -[EDVIPManagerProxy init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_observersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observersByIdentifier = v7->_observersByIdentifier;
    v7->_observersByIdentifier = (NSMapTable *)v8;

    objc_storeStrong((id *)&v7->_vipManager, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__vipsDidChange_, *MEMORY[0x1E0D1E0A8], v5);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)EDVIPManagerProxy;
  -[EDVIPManagerProxy dealloc](&v4, sel_dealloc);
}

- (void)registerObserver:(id)a3 observationIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_observersLock);
  -[NSMapTable setObject:forKey:](self->_observersByIdentifier, "setObject:forKey:", v9, v6);
  os_unfair_lock_unlock(&self->_observersLock);
  -[EDVIPManagerProxy vipManager](self, "vipManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allVIPs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "observer:gotVIPs:", v6, v8);

}

- (void)cancelObservation:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSMapTable removeObjectForKey:](self->_observersByIdentifier, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)saveVIPs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDVIPManagerProxy vipManager](self, "vipManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveVIPs:", v5);

}

- (void)removeVIPsWithIdentifiers:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDVIPManagerProxy vipManager](self, "vipManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeVIPsWithIdentifiers:", v5);

}

- (void)removeVIPsWithEmailAddresses:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDVIPManagerProxy vipManager](self, "vipManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeVIPsWithEmailAddresses:", v5);

}

- (void)_vipsDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D1E0B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D1E0B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_observersLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_observersByIdentifier;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_observersByIdentifier, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "observer:updatedVIPs:removedVIPs:", v10, v4, v5);

      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_observersLock);
}

- (NSSet)allVIPWaitForResult
{
  return self->allVIPWaitForResult;
}

- (EDVIPManager)vipManager
{
  return self->_vipManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->allVIPWaitForResult, 0);
  objc_storeStrong((id *)&self->_observersByIdentifier, 0);
}

@end
