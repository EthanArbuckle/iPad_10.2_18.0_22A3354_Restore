@implementation COObserverSet

- (COObserverSet)init
{
  COObserverSet *v2;
  COObserverSet *v3;
  uint64_t v4;
  NSHashTable *registrations;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)COObserverSet;
  v2 = -[COObserverSet init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    registrations = v3->_registrations;
    v3->_registrations = (NSHashTable *)v4;

  }
  return v3;
}

- (NSOperationQueue)queue
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __22__COObserverSet_queue__block_invoke;
  v4[3] = &unk_24CD3EEA8;
  v4[4] = self;
  v4[5] = &v5;
  -[COObserverSet _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOperationQueue *)v2;
}

void __22__COObserverSet_queue__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD1710]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)addObserverForName:(id)a3 observable:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  COObserver *v14;
  COObserver *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = [COObserver alloc];
  v15 = v14;
  if (v12)
  {
    v16 = -[COObserver initForName:onObservable:handler:queue:](v14, "initForName:onObservable:handler:queue:", v10, v11, v13, v12);
  }
  else
  {
    -[COObserverSet queue](self, "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[COObserver initForName:onObservable:handler:queue:](v15, "initForName:onObservable:handler:queue:", v10, v11, v13, v17);

  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __64__COObserverSet_addObserverForName_observable_queue_usingBlock___block_invoke;
  v22[3] = &unk_24CD3EF20;
  v22[4] = self;
  v18 = v16;
  v23 = v18;
  -[COObserverSet _withLock:](self, "_withLock:", v22);
  v19 = v23;
  v20 = v18;

  return v20;
}

void __64__COObserverSet_addObserverForName_observable_queue_usingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeObserver:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __32__COObserverSet_removeObserver___block_invoke;
    v5[3] = &unk_24CD3EF20;
    v5[4] = self;
    v6 = v4;
    -[COObserverSet _withLock:](self, "_withLock:", v5);

  }
}

void __32__COObserverSet_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)postNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__COObserverSet_postNotification___block_invoke;
  v8[3] = &unk_24CD3F310;
  v8[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[COObserverSet _withLock:](self, "_withLock:", v8);

}

void __34__COObserverSet_postNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "registrations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v9)
          objc_msgSend(v7, "notify:", *(_QWORD *)(a1 + 48));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)registeredNames
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __32__COObserverSet_registeredNames__block_invoke;
  v8[3] = &unk_24CD3EF20;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[COObserverSet _withLock:](self, "_withLock:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __32__COObserverSet_registeredNames__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "registrations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (NSHashTable)registrations
{
  return self->_registrations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
