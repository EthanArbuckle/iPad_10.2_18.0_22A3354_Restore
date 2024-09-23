@implementation CHDelegateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
}

- (CHDelegateManager)init
{
  CHDelegateManager *v2;
  CHDelegateManager *v3;
  uint64_t v4;
  NSMapTable *delegateToQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHDelegateManager;
  v2 = -[CHDelegateManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    delegateToQueue = v3->_delegateToQueue;
    v3->_delegateToQueue = (NSMapTable *)v4;

  }
  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  os_unfair_lock_s *p_accessorLock;
  id v7;
  id v8;
  void *v9;

  p_accessorLock = &self->_accessorLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_accessorLock);
  -[CHDelegateManager delegateToQueue](self, "delegateToQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v7, v8);

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  void *v6;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  -[CHDelegateManager delegateToQueue](self, "delegateToQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)performDelegateSelector:(SEL)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_unfair_lock_t lock;
  _QWORD block[7];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  lock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CHDelegateManager delegateToQueue](self, "delegateToQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[CHDelegateManager delegateToQueue](self, "delegateToQueue", lock);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v10);
          v12 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __45__CHDelegateManager_performDelegateSelector___block_invoke;
          block[3] = &unk_1E6746740;
          block[5] = v10;
          block[6] = a3;
          block[4] = self;
          dispatch_async(v12, block);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

uint64_t __45__CHDelegateManager_performDelegateSelector___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performDelegateSelector:withDelegate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)performDelegateSelector:(SEL)a3 withDelegate:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Subclass is required to override %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

@end
