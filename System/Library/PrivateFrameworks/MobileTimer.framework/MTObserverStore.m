@implementation MTObserverStore

void __47__MTObserverStore_enumerateObserversWithBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if (*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6))
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addObserver:(id)a3
{
  -[MTObserverStore addObserver:wasFirst:](self, "addObserver:wasFirst:", a3, 0);
}

- (void)addObserver:(id)a3 wasFirst:(BOOL *)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  BOOL *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTObserverStore.m"), 49, CFSTR("observer cannot be nil"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MTObserverStore_addObserver_wasFirst___block_invoke;
  v10[3] = &unk_1E39CBA08;
  v10[4] = self;
  v11 = v7;
  v12 = a4;
  v8 = v7;
  -[MTObserverStore _withLock:](self, "_withLock:", v10);

}

- (MTObserverStore)init
{
  void *v3;
  MTObserverStore *v4;

  objc_msgSend(MEMORY[0x1E0D519E8], "mtMainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MTObserverStore initWithCallbackScheduler:](self, "initWithCallbackScheduler:", v3);

  return v4;
}

- (MTObserverStore)initWithCallbackScheduler:(id)a3
{
  id v5;
  MTObserverStore *v6;
  MTObserverStore *v7;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTObserverStore;
  v6 = -[MTObserverStore init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackScheduler, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    v7->_observersLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)enumerateObserversWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  NAScheduler *callbackScheduler;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__11;
  v12[4] = __Block_byref_object_dispose__11;
  v13 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__MTObserverStore_enumerateObserversWithBlock___block_invoke;
  v11[3] = &unk_1E39CBB50;
  v11[4] = self;
  v11[5] = v12;
  -[MTObserverStore _withLock:](self, "_withLock:", v11);
  callbackScheduler = self->_callbackScheduler;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __47__MTObserverStore_enumerateObserversWithBlock___block_invoke_2;
  v8[3] = &unk_1E39CE050;
  v10 = v12;
  v7 = v4;
  v9 = v7;
  -[NAScheduler performBlock:](callbackScheduler, "performBlock:", v8);

  _Block_object_dispose(v12, 8);
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  void (**v4)(_QWORD);

  p_observersLock = &self->_observersLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_observersLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_observersLock);
}

void __47__MTObserverStore_enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __40__MTObserverStore_addObserver_wasFirst___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
    if (result == 1)
      **(_BYTE **)(a1 + 48) = 1;
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  -[MTObserverStore removeObserver:wasLast:](self, "removeObserver:wasLast:", a3, 0);
}

- (void)removeObserver:(id)a3 wasLast:(BOOL *)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  BOOL *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTObserverStore.m"), 63, CFSTR("observer cannot be nil"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__MTObserverStore_removeObserver_wasLast___block_invoke;
  v10[3] = &unk_1E39CBA08;
  v10[4] = self;
  v11 = v7;
  v12 = a4;
  v8 = v7;
  -[MTObserverStore _withLock:](self, "_withLock:", v10);

}

uint64_t __42__MTObserverStore_removeObserver_wasLast___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
    if (!result)
      **(_BYTE **)(a1 + 48) = 1;
  }
  return result;
}

- (BOOL)containsObserver:(id)a3
{
  id v5;
  id v6;
  char v7;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTObserverStore.m"), 88, CFSTR("observer cannot be nil"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__MTObserverStore_containsObserver___block_invoke;
  v10[3] = &unk_1E39CB8A8;
  v12 = &v13;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  -[MTObserverStore _withLock:](self, "_withLock:", v10);
  v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __36__MTObserverStore_containsObserver___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 24), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (unint64_t)count
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__MTObserverStore_count__block_invoke;
  v4[3] = &unk_1E39CBB50;
  v4[4] = self;
  v4[5] = &v5;
  -[MTObserverStore _withLock:](self, "_withLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __24__MTObserverStore_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)currentObservers
{
  return -[NSHashTable allObjects](self->_observers, "allObjects");
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (void)setCallbackScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_callbackScheduler, a3);
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setObserversLock:(os_unfair_lock_s)a3
{
  self->_observersLock = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
}

@end
