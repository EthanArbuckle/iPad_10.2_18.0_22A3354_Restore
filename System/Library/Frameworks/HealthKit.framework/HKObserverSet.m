@implementation HKObserverSet

- (void)registerObserver:(id)a3
{
  -[HKObserverSet _registerObserver:queue:runIfFirstObserver:]((uint64_t)self, a3, 0, 0);
}

- (void)unregisterObserver:(id)a3
{
  -[HKObserverSet _unregisterObserver:runIfLastObserver:]((uint64_t)self, a3, 0);
}

- (void)notifyObservers:(id)a3
{
  -[HKObserverSet _notifyObserversInGroup:handler:]((uint64_t)self, 0, a3);
}

- (HKObserverSet)initWithName:(id)a3 loggingCategory:(id)a4
{
  id v6;
  id v7;
  HKObserverSet *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKObserverSet;
  v8 = -[HKObserverSet init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_category, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)_registerObserver:(void *)a3 queue:(void *)a4 runIfFirstObserver:
{
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v9 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if (!v7)
      {
        v11 = *(void **)(a1 + 40);
        if (!v11)
        {
          HKCreateSerialDispatchQueue((void *)a1, *(void **)(a1 + 8));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(void **)(a1 + 40);
          *(_QWORD *)(a1 + 40) = v12;

          v11 = *(void **)(a1 + 40);
        }
        v7 = v11;
      }
      v14 = *(void **)(a1 + 32);
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v15;

        v14 = *(void **)(a1 + 32);
      }
      objc_msgSend(v14, "setObject:forKey:", v7, v17);
    }
    if (v8 && !v9 && objc_msgSend(*(id *)(a1 + 32), "count") == 1)
      v8[2](v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }

}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet _registerObserver:queue:runIfFirstObserver:]((uint64_t)self, a3, a4, 0);
}

- (void)registerObserver:(id)a3 queue:(id)a4 runIfFirstObserver:(id)a5
{
  -[HKObserverSet _registerObserver:queue:runIfFirstObserver:]((uint64_t)self, a3, a4, a5);
}

- (void)_unregisterObserver:(void *)a3 runIfLastObserver:
{
  id v5;
  uint64_t v6;
  void *v7;
  void (**v8)(void);

  v8 = a3;
  if (a1)
  {
    v5 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v5);

    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v7 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      if (v8)
      {
        if (v6 >= 1)
          v8[2]();
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }

}

- (void)unregisterObserver:(id)a3 runIfLastObserver:(id)a4
{
  -[HKObserverSet _unregisterObserver:runIfLastObserver:]((uint64_t)self, a3, a4);
}

- (void)unregisterAllObservers
{
  os_unfair_lock_s *p_lock;
  NSMapTable *queuesByObserver;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  queuesByObserver = self->_queuesByObserver;
  self->_queuesByObserver = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyObserversInGroup:(void *)a3 handler:
{
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "keyEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
          if (v5)
            dispatch_group_enter(v5);
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          -[HKObserverSet _notifyObserver:queue:handler:](a1, v12, v13, v6);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }

}

- (void)notifyObserversInGroup:(id)a3 handler:(id)a4
{
  -[HKObserverSet _notifyObserversInGroup:handler:]((uint64_t)self, a3, a4);
}

- (void)_notifyObserver:(NSObject *)a3 queue:(void *)a4 handler:
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__HKObserverSet__notifyObserver_queue_handler___block_invoke;
    v10[3] = &unk_1E37E6D40;
    v12 = v8;
    v11 = v7;
    dispatch_async(a3, v10);

  }
}

- (void)notifyObserver:(id)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_queuesByObserver, "objectForKey:", v8);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    -[HKObserverSet _notifyObserver:queue:handler:]((uint64_t)self, v8, v7, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMapTable count](self->_queuesByObserver, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)allObservers
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable keyEnumerator](self->_queuesByObserver, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9))
          objc_msgSend(v4, "addObject:");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v10 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v10;
}

uint64_t __47__HKObserverSet__notifyObserver_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultObserverQueue, 0);
  objc_storeStrong((id *)&self->_queuesByObserver, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
