@implementation CHDelegateController

- (CHDelegateController)init
{
  CHDelegateController *v2;
  CHDelegateController *v3;
  uint64_t v4;
  NSMapTable *delegateToQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHDelegateController;
  v2 = -[CHDelegateController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_delegateLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v3->_delegateToQueue;
    v3->_delegateToQueue = (NSMapTable *)v4;

  }
  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  os_unfair_lock_s *p_delegateLock;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  -[CHDelegateController delegateToQueue](self, "delegateToQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, v9);

  os_unfair_lock_unlock(p_delegateLock);
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_delegateLock;
  void *v5;
  id v6;

  v6 = a3;
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  -[CHDelegateController delegateToQueue](self, "delegateToQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  os_unfair_lock_unlock(p_delegateLock);
}

- (void)enumerateDelegatesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  os_unfair_lock_lock(&self->_delegateLock);
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CHDelegateController delegateToQueue](self, "delegateToQueue", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v5);
      v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
      -[CHDelegateController delegateToQueue](self, "delegateToQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v4[2](v4, v9, v11, &v16);
      LOBYTE(v9) = v16 == 0;

      if ((v9 & 1) == 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  os_unfair_lock_unlock(&self->_delegateLock);
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (os_unfair_lock_s)delegateLock
{
  return self->_delegateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
}

@end
