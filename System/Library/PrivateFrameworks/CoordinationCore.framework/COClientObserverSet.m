@implementation COClientObserverSet

- (COClientObserverSet)init
{
  COClientObserverSet *v2;
  uint64_t v3;
  NSMapTable *observers;
  NSDictionary *v5;
  NSDictionary *registrations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)COClientObserverSet;
  v2 = -[COClientObserverSet init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v3;

    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    registrations = v2->_registrations;
    v2->_registrations = v5;

  }
  return v2;
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

- (id)clientObservers
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__COClientObserverSet_clientObservers__block_invoke;
  v8[3] = &unk_24D4B0858;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[COClientObserverSet _withLock:](self, "_withLock:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __38__COClientObserverSet_clientObservers__block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
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
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)clientObserversForXPCConnection:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__17;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__COClientObserverSet_clientObserversForXPCConnection___block_invoke;
  v8[3] = &unk_24D4B0BE0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[COClientObserverSet _withLock:](self, "_withLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __55__COClientObserverSet_clientObserversForXPCConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)clientObserversForNotificationName:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__17;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__COClientObserverSet_clientObserversForNotificationName___block_invoke;
  v8[3] = &unk_24D4B0BE0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[COClientObserverSet _withLock:](self, "_withLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __58__COClientObserverSet_clientObserversForNotificationName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addClientObserver:(id)a3 forNotificationName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__COClientObserverSet_addClientObserver_forNotificationName___block_invoke;
  v10[3] = &unk_24D4B08D0;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[COClientObserverSet _withLock:](self, "_withLock:", v10);

}

void __61__COClientObserverSet_addClientObserver_forNotificationName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    if (v2)
    {
      objc_msgSend(v2, "arrayByAddingObject:", *(_QWORD *)(a1 + 48));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *(_QWORD *)(a1 + 48));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setRegistrations:", v4);

    objc_msgSend(*(id *)(a1 + 32), "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      if (v2)
      {
        objc_msgSend(v2, "arrayByAddingObject:", *(_QWORD *)(a1 + 48));
        v7 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *(_QWORD *)(a1 + 48));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "setObject:forKey:", v2, v6);
    }

  }
}

- (void)removeClientObserver:(id)a3 forNotificationName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__COClientObserverSet_removeClientObserver_forNotificationName___block_invoke;
  v10[3] = &unk_24D4B08D0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[COClientObserverSet _withLock:](self, "_withLock:", v10);

}

void __64__COClientObserverSet_removeClientObserver_forNotificationName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

LABEL_17:
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v20, "removeObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(v20, "count"))
      objc_msgSend(v17, "setObject:forKey:", v20, v18);
    else
      objc_msgSend(v17, "removeObjectForKey:", v18);

    goto LABEL_21;
  }
  v5 = v4;
  v21 = 0;
  v6 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v2, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "indexOfObject:", *(_QWORD *)(a1 + 40));
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v10;
        v12 = *(void **)(a1 + 48);
        if (v12 && !objc_msgSend(v12, "isEqualToString:", v8))
        {
          v21 = 1;
        }
        else
        {
          v13 = v3;
          v14 = (void *)objc_msgSend(v9, "mutableCopy");
          objc_msgSend(v14, "removeObjectAtIndex:", v11);
          v15 = (void *)objc_msgSend(v2, "mutableCopy");
          objc_msgSend(v15, "setObject:forKey:", v14, v8);
          v16 = v15;

          objc_msgSend(*(id *)(a1 + 32), "setRegistrations:", v16);
          v3 = v13;
          v2 = v16;
        }
      }

    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v5);

  if ((v21 & 1) == 0 || !*(_QWORD *)(a1 + 48))
    goto LABEL_17;
LABEL_21:

}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
