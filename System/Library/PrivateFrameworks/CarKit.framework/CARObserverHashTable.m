@implementation CARObserverHashTable

- (CARObserverHashTable)initWithProtocol:(id)a3 callbackQueue:(id)a4
{
  id v7;
  id v8;
  CARObserverHashTable *v9;
  CARObserverHashTable *v10;
  CARObserverHashTable *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CARObserverHashTable;
  v9 = -[CARObserverHashTable init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_protocol, a3);
    objc_storeStrong((id *)&v10->_callbackQueue, a4);
    v10->_observersLock._os_unfair_lock_opaque = 0;
    v11 = v10;
  }

  return v10;
}

- (CARObserverHashTable)initWithProtocol:(id)a3
{
  return -[CARObserverHashTable initWithProtocol:callbackQueue:](self, "initWithProtocol:callbackQueue:", a3, MEMORY[0x1E0C80D38]);
}

- (BOOL)hasObservers
{
  CARObserverHashTable *v2;
  os_unfair_lock_s *p_observersLock;

  v2 = self;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(p_observersLock);
  LOBYTE(v2) = -[NSHashTable count](v2->_observers, "count") != 0;
  os_unfair_lock_unlock(p_observersLock);
  return (char)v2;
}

- (void)registerObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(&self->_observersLock);
  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_observersLock);

}

- (void)unregisterObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;
  NSHashTable *observers;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_observersLock);
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
  os_unfair_lock_unlock(p_observersLock);
}

- (void)enumerateObserversWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(&self->_observersLock);
  v5 = -[NSHashTable copy](self->_observers, "copy");
  v6 = (void *)v17[5];
  v17[5] = v5;

  os_unfair_lock_unlock(&self->_observersLock);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52__CARObserverHashTable_enumerateObserversWithBlock___block_invoke;
  v13 = &unk_1E5429870;
  v15 = &v16;
  v7 = v4;
  v14 = v7;
  v8 = (void *)MEMORY[0x1A85D396C](&v10);
  -[CARObserverHashTable callbackQueue](self, "callbackQueue", v10, v11, v12, v13);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v9, v8);

  _Block_object_dispose(&v16, 8);
}

void __52__CARObserverHashTable_enumerateObserversWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  while (1)
  {
    v4 = (void *)v3;
    objc_msgSend(v2, "nextObject");
    v3 = objc_claimAutoreleasedReturnValue();

    if (!v3)
      break;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  SEL name;
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v8;
  BOOL v9;
  void *v10;

  MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 0, 1);
  types = MethodDescription.types;
  name = MethodDescription.name;
  if (!MethodDescription.name)
  {
    v8 = protocol_getMethodDescription(self->_protocol, a3, 1, 1);
    types = v8.types;
    name = v8.name;
  }
  if (name)
    v9 = types == 0;
  else
    v9 = 1;
  if (v9)
  {
    -[CARObserverHashTable doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a3);
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  os_unfair_lock_assert_not_owner(&self->_observersLock);
  os_unfair_lock_lock(&self->_observersLock);
  v5 = -[NSHashTable copy](self->_observers, "copy");
  v6 = (void *)v17[5];
  v17[5] = v5;

  os_unfair_lock_unlock(&self->_observersLock);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __42__CARObserverHashTable_forwardInvocation___block_invoke;
  v13 = &unk_1E5429898;
  v7 = v4;
  v14 = v7;
  v15 = &v16;
  v8 = (void *)MEMORY[0x1A85D396C](&v10);
  objc_msgSend(v7, "retainArguments", v10, v11, v12, v13);
  -[CARObserverHashTable callbackQueue](self, "callbackQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v9, v8);

  _Block_object_dispose(&v16, 8);
}

void __42__CARObserverHashTable_forwardInvocation___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "selector");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", v7, (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ observers count: %d"), v5, -[NSHashTable count](self->_observers, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ (%p)"), objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return v6;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end
