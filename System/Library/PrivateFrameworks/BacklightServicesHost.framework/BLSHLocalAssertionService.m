@implementation BLSHLocalAssertionService

- (BLSHLocalAssertionService)initWithOSInterfaceProvider:(id)a3
{
  id v5;
  BLSHLocalAssertionService *v6;
  BLSHLocalAssertionService *v7;
  uint64_t v8;
  NSMutableDictionary *attributeHandlers;
  uint64_t v10;
  NSMapTable *activeAssertions;
  uint64_t v12;
  NSMutableArray *pausedAssertions;
  uint64_t v14;
  NSMutableSet *queue_deferredAcquisitionAssertions;
  uint64_t v16;
  NSHashTable *observers;
  BLSHAggregatedSystemActivityAssertionFactory *v18;
  BLSHAggregatedSystemActivityAssertionFactory *aggregatedAssertionFactory;
  dispatch_workloop_t inactive;
  OS_dispatch_workloop *rootWorkloop;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  id v25;
  id location;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BLSHLocalAssertionService;
  v6 = -[BLSHLocalAssertionService init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    attributeHandlers = v7->_attributeHandlers;
    v7->_attributeHandlers = (NSMutableDictionary *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 517, 8);
    activeAssertions = v7->_activeAssertions;
    v7->_activeAssertions = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    pausedAssertions = v7->_pausedAssertions;
    v7->_pausedAssertions = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    queue_deferredAcquisitionAssertions = v7->_queue_deferredAcquisitionAssertions;
    v7->_queue_deferredAcquisitionAssertions = (NSMutableSet *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 2);
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v16;

    objc_storeStrong((id *)&v7->_osInterfaceProvider, a3);
    v18 = objc_alloc_init(BLSHAggregatedSystemActivityAssertionFactory);
    aggregatedAssertionFactory = v7->_aggregatedAssertionFactory;
    v7->_aggregatedAssertionFactory = v18;

    inactive = dispatch_workloop_create_inactive("BLSHLocalAssertionService workloop");
    rootWorkloop = v7->_rootWorkloop;
    v7->_rootWorkloop = (OS_dispatch_workloop *)inactive;

    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v7->_rootWorkloop);
    v22 = dispatch_queue_create_with_target_V2("BLSHLocalAssertionService queue", 0, (dispatch_queue_t)v7->_rootWorkloop);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v22;

    objc_initWeak(&location, v7);
    objc_copyWeak(&v25, &location);
    v7->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v7;
}

uint64_t __57__BLSHLocalAssertionService_initWithOSInterfaceProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[BLSHLocalAssertionService activeAssertionDescription]((uint64_t)WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (id)activeAssertionDescription
{
  void *v2;
  os_unfair_lock_s *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  if (a1)
  {
    v2 = (void *)objc_opt_new();
    v3 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(id *)(a1 + 24);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v5 = MEMORY[0x24BDAC760];
    v27 = 0;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__BLSHLocalAssertionService_activeAssertionDescription__block_invoke;
    v20[3] = &unk_24D1BCAC0;
    v20[4] = a1;
    v6 = v4;
    v21 = v6;
    v7 = v2;
    v22 = v7;
    v23 = &v24;
    objc_msgSend(v7, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", CFSTR("activeAssertions"), CFSTR("["), CFSTR("]"), v20);
    *((_DWORD *)v25 + 6) = 0;
    v12 = v5;
    v13 = 3221225472;
    v14 = __55__BLSHLocalAssertionService_activeAssertionDescription__block_invoke_2;
    v15 = &unk_24D1BCAC0;
    v16 = a1;
    v8 = v6;
    v17 = v8;
    v9 = v7;
    v18 = v9;
    v19 = &v24;
    objc_msgSend(v9, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", CFSTR("pausedAssertions"), CFSTR("["), CFSTR("]"), &v12);
    os_unfair_lock_unlock(v3);
    objc_msgSend(v9, "description", v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

void __55__BLSHLocalAssertionService_activeAssertionDescription__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1[4] + 16), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = (void *)a1[5];
        objc_msgSend(v7, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

        if ((v8 & 1) == 0)
        {
          v10 = (void *)MEMORY[0x24BDD17C8];
          v11 = (void *)a1[6];
          v12 = *(_QWORD *)(a1[7] + 8);
          v13 = (*(_DWORD *)(v12 + 24) + 1);
          *(_DWORD *)(v12 + 24) = v13;
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%d"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (id)objc_msgSend(v11, "appendObject:withName:", v7, v14);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

void __55__BLSHLocalAssertionService_activeAssertionDescription__block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1[4] + 16), "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = (void *)a1[5];
        objc_msgSend(v7, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "containsObject:", v9);

        if ((_DWORD)v8)
        {
          v10 = (void *)MEMORY[0x24BDD17C8];
          v11 = (void *)a1[6];
          v12 = *(_QWORD *)(a1[7] + 8);
          v13 = (*(_DWORD *)(v12 + 24) + 1);
          *(_DWORD *)(v12 + 24) = v13;
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%d"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (id)objc_msgSend(v11, "appendObject:withName:", v7, v14);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

- (id)existingAttributeHandlerForClasses:(uint64_t)a1
{
  id v3;
  os_unfair_lock_s *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__3;
    v15 = __Block_byref_object_dispose__3;
    v16 = 0;
    v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__BLSHLocalAssertionService_existingAttributeHandlerForClasses___block_invoke;
    v8[3] = &unk_24D1BCAE8;
    v9 = v3;
    v10 = &v11;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
    os_unfair_lock_unlock(v4);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __64__BLSHLocalAssertionService_existingAttributeHandlerForClasses___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "firstObjectCommonWithArray:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)activeAssertionForIdentifier:(os_unfair_lock_s *)a1
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;

  v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1 + 20;
    v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 80));
    objc_msgSend(*(id *)(v2 + 16), "objectForKey:", v4);
    v2 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v3);
  }
  return (id)v2;
}

- (void)registerAttributeHandler:(id)a3 forAttributeClasses:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__BLSHLocalAssertionService_registerAttributeHandler_forAttributeClasses___block_invoke;
  block[3] = &unk_24D1BC3C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __74__BLSHLocalAssertionService_registerAttributeHandler_forAttributeClasses___block_invoke(uint64_t a1)
{
  -[BLSHLocalAssertionService queue_registerAttributeHandler:forAttributeClasses:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)queue_registerAttributeHandler:(void *)a3 forAttributeClasses:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id obj;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v25 = a2;
  v5 = a3;
  if (a1)
  {
    -[BLSHLocalAssertionService existingAttributeHandlerForClasses:](a1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("cannot register handler for classes:%@ overlaps existing handler for classes:%@"), v5, v6);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v25, v5);
      NSAllMapTableValues(*(NSMapTable **)(a1 + 16));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(*(id *)(a1 + 24), "copy");
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      bls_assertions_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BLSHLocalAssertionService queue_registerAttributeHandler:forAttributeClasses:].cold.1();
      v24 = a1;

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = v7;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v14, "descriptor");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "attributesOfClasses:", v5);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v8, "containsObject:", v17);

            if (v18)
            {
              objc_msgSend(v16, "indexesOfObjectsPassingTest:", &__block_literal_global_6);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectsAtIndexes:", v19);
              v20 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v20;
            }
            if (objc_msgSend(v16, "count"))
            {
              bls_assertions_log();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                NSStringFromBLSAssertingObject();
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218754;
                v31 = v24;
                v32 = 2114;
                v33 = v25;
                v34 = 2114;
                v35 = v16;
                v36 = 2114;
                v37 = v22;
                _os_log_debug_impl(&dword_2145AC000, v21, OS_LOG_TYPE_DEBUG, "%p will now activate (registered handler:%{public}@) attributes:%{public}@ from assertion:%{public}@", buf, 0x2Au);

              }
              objc_msgSend(v25, "activateAttributes:fromAssertion:forService:", v16, v14, v24);
            }

          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        }
        while (v11);
      }

      v6 = 0;
    }

  }
}

uint64_t __80__BLSHLocalAssertionService_queue_registerAttributeHandler_forAttributeClasses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canBePaused") ^ 1;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)pauseAssertion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__BLSHLocalAssertionService_pauseAssertion___block_invoke;
  v7[3] = &unk_24D1BBE80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __44__BLSHLocalAssertionService_pauseAssertion___block_invoke(uint64_t a1)
{
  -[BLSHLocalAssertionService queue_pauseAssertion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)queue_pauseAssertion:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      v7 = objc_msgSend(*(id *)(a1 + 24), "containsObject:", v5);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      bls_assertions_log();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[BLSHLocalAssertionService queue_pauseAssertion:].cold.2();
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v21 = a1;
          v22 = 2114;
          v23 = v4;
          _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEFAULT, "%p will pause assertion:%{public}@", buf, 0x16u);
        }

        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        objc_msgSend(*(id *)(a1 + 24), "addObject:", v5);
        v9 = objc_msgSend(*(id *)(a1 + 8), "copy");
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        objc_msgSend(v4, "descriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MEMORY[0x24BDAC760];
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke;
        v16[3] = &unk_24D1BCB50;
        v17 = v10;
        v18 = a1;
        v12 = v4;
        v19 = v12;
        v13 = v10;
        -[NSObject enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v16);
        objc_msgSend(v12, "serviceDidPause");
        v14[0] = v11;
        v14[1] = 3221225472;
        v14[2] = __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke_28;
        v14[3] = &unk_24D1BCB78;
        v14[4] = a1;
        v15 = v12;
        -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v14);

      }
    }
    else
    {
      bls_assertions_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BLSHLocalAssertionService queue_pauseAssertion:].cold.1();
    }

  }
}

void __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "attributesOfClasses:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_27_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    bls_assertions_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 40);
      NSStringFromBLSAssertingObject();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218754;
      v13 = v10;
      v14 = 2114;
      v15 = v5;
      v16 = 2114;
      v17 = v8;
      v18 = 2114;
      v19 = v11;
      _os_log_debug_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ will deactivate (pause) attributes:%{public}@ from assertion:%{public}@", (uint8_t *)&v12, 0x2Au);

    }
    objc_msgSend(v5, "deactivateAttributes:fromAssertion:forService:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

uint64_t __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canBePaused");
}

void __50__BLSHLocalAssertionService_queue_pauseAssertion___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:didPauseAssertion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  os_unfair_lock_s *v4;
  void *v5;
  id v6;
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
  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
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
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)resumeAssertion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__BLSHLocalAssertionService_resumeAssertion___block_invoke;
  v7[3] = &unk_24D1BBE80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __45__BLSHLocalAssertionService_resumeAssertion___block_invoke(uint64_t a1)
{
  -[BLSHLocalAssertionService queue_resumeAssertion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)queue_resumeAssertion:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      v7 = objc_msgSend(*(id *)(a1 + 24), "containsObject:", v5);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      bls_assertions_log();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if ((v7 & 1) != 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v21 = a1;
          v22 = 2114;
          v23 = v4;
          _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEFAULT, "%p will resume assertion:%{public}@", buf, 0x16u);
        }

        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        objc_msgSend(*(id *)(a1 + 24), "removeObject:", v5);
        v9 = objc_msgSend(*(id *)(a1 + 8), "copy");
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        objc_msgSend(v4, "descriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MEMORY[0x24BDAC760];
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke;
        v16[3] = &unk_24D1BCB50;
        v17 = v10;
        v18 = a1;
        v12 = v4;
        v19 = v12;
        v13 = v10;
        -[NSObject enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v16);
        objc_msgSend(v12, "serviceDidResume");
        v14[0] = v11;
        v14[1] = 3221225472;
        v14[2] = __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_33;
        v14[3] = &unk_24D1BCB78;
        v14[4] = a1;
        v15 = v12;
        -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v14);

      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[BLSHLocalAssertionService queue_resumeAssertion:].cold.2();
      }
    }
    else
    {
      bls_assertions_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BLSHLocalAssertionService queue_resumeAssertion:].cold.1();
    }

  }
}

void __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "attributesOfClasses:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    bls_assertions_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_cold_1();

    objc_msgSend(v5, "activateAttributes:fromAssertion:forService:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

uint64_t __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canBePaused");
}

void __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:didResumeAssertion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)willCancelAssertion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BLSHLocalAssertionService_willCancelAssertion___block_invoke;
  v7[3] = &unk_24D1BBE80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __49__BLSHLocalAssertionService_willCancelAssertion___block_invoke(uint64_t a1)
{
  -[BLSHLocalAssertionService queue_willCancelAssertion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)queue_willCancelAssertion:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "serviceWillCancel");
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__BLSHLocalAssertionService_queue_willCancelAssertion___block_invoke;
    v5[3] = &unk_24D1BCB78;
    v5[4] = a1;
    v6 = v4;
    -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v5);

  }
}

void __55__BLSHLocalAssertionService_queue_willCancelAssertion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:willCancelAssertion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)acquireAssertion:(id)a3
{
  -[BLSHLocalAssertionService acquireAssertion:skipSleepCheck:]((uint64_t)self, a3, 0);
}

- (void)acquireAssertion:(char)a3 skipSleepCheck:
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__BLSHLocalAssertionService_acquireAssertion_skipSleepCheck___block_invoke;
    block[3] = &unk_24D1BC2F8;
    block[4] = a1;
    v9 = v5;
    v10 = a3;
    dispatch_async(v7, block);

  }
}

void __61__BLSHLocalAssertionService_acquireAssertion_skipSleepCheck___block_invoke(uint64_t a1)
{
  -[BLSHLocalAssertionService queue_acquireAssertion:skipSleepCheck:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_BYTE *)(a1 + 48));
}

- (void)queue_acquireAssertion:(char)a3 skipSleepCheck:
{
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t (*v6)(uint64_t, uint64_t);
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  id v34;
  NSObject *v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  _QWORD v37[5];
  uint64_t (*v38)(uint64_t, uint64_t);
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  id v43;
  _QWORD v44[4];
  uint64_t (*v45)(uint64_t, uint64_t);
  id v46;
  _BYTE *v47;
  id v48[2];
  id location;
  _QWORD v50[5];
  uint64_t (*v51)(uint64_t, uint64_t);
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  _BYTE v57[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[2];
  uint64_t v62;
  _QWORD v63[4];

  v63[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x24BE0B840]);
      v9 = getpid();
      v7 = (void *)objc_msgSend(v8, "initWithClientPid:hostPid:count:", v9, getpid(), objc_msgSend(MEMORY[0x24BE0B840], "nextCount"));
      bls_assertions_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v57 = 134218498;
        *(_QWORD *)&v57[4] = a1;
        *(_WORD *)&v57[12] = 2114;
        *(_QWORD *)&v57[14] = v7;
        *(_WORD *)&v57[22] = 2114;
        v58 = v6;
        _os_log_debug_impl(&dword_2145AC000, v10, OS_LOG_TYPE_DEBUG, "%p created identifer:%{public}@ for local assertion:%{public}@", v57, 0x20u);
      }

      objc_msgSend(v6, "setIdentifier:", v7);
    }
    -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (v12)
    {
      objc_msgSend(v6, "descriptor");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v61[0] = objc_opt_class();
      v61[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attributesOfClasses:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if ((a3 & 1) == 0
        && v20
        && (objc_msgSend(*(id *)(a1 + 88), "systemSleepMonitor"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "hasSleepBeenRequested"),
            v21,
            v22))
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
        v23 = (void *)mach_continuous_time();
        v24 = *(id *)(a1 + 88);
        *(_QWORD *)v57 = 0;
        *(_QWORD *)&v57[8] = v57;
        *(_QWORD *)&v57[16] = 0x3032000000;
        v58 = __Block_byref_object_copy__3;
        v59 = __Block_byref_object_dispose__3;
        NSStringFromBLSAssertingObject();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[BLSHSystemWaker wakerWithIdentifier:osInterfaceProvider:](BLSHSystemWaker, "wakerWithIdentifier:osInterfaceProvider:", v25, v24);
        v60 = (id)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, (id)a1);
        bls_assertions_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          v54 = a1;
          v55 = 2114;
          v56 = v6;
          _os_log_impl(&dword_2145AC000, v26, OS_LOG_TYPE_INFO, "%p system about to sleep - will defer acquiring assertion:%{public}@", buf, 0x16u);
        }

        v27 = *(void **)(*(_QWORD *)&v57[8] + 40);
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_49;
        v44[3] = &unk_24D1BCC38;
        objc_copyWeak(v48, &location);
        v45 = v6;
        v48[1] = v23;
        v28 = v24;
        v46 = v28;
        v47 = v57;
        objc_msgSend(v27, "wakeWithCompletion:", v44);

        objc_destroyWeak(v48);
        objc_destroyWeak(&location);
        _Block_object_dispose(v57, 8);

      }
      else
      {
        bls_assertions_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v57 = 134218242;
          *(_QWORD *)&v57[4] = a1;
          *(_WORD *)&v57[12] = 2114;
          *(_QWORD *)&v57[14] = v6;
          _os_log_impl(&dword_2145AC000, v29, OS_LOG_TYPE_DEFAULT, "%p will acquire assertion:%{public}@", v57, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v6, v7);
        v28 = (id)objc_msgSend(*(id *)(a1 + 8), "copy");
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        objc_msgSend(v17, "attributes");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "mutableCopy");

        v32 = MEMORY[0x24BDAC760];
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_55;
        v39[3] = &unk_24D1BCC60;
        v40 = v17;
        v41 = a1;
        v33 = v6;
        v42 = v33;
        v34 = v31;
        v43 = v34;
        objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v39);
        if (objc_msgSend(v34, "count"))
        {
          bls_assertions_log();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            NSStringFromBLSAssertingObject();
            v36 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v57 = 134218498;
            *(_QWORD *)&v57[4] = a1;
            *(_WORD *)&v57[12] = 2114;
            *(_QWORD *)&v57[14] = v34;
            *(_WORD *)&v57[22] = 2114;
            v58 = v36;
            _os_log_impl(&dword_2145AC000, v35, OS_LOG_TYPE_INFO, "%p (no handler) will delay activation of attributes:%{public}@ for assertion:%{public}@", v57, 0x20u);

          }
        }
        objc_msgSend(v33, "serviceDidAcquire");
        v37[0] = v32;
        v37[1] = 3221225472;
        v37[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_56;
        v37[3] = &unk_24D1BCB78;
        v37[4] = a1;
        v38 = v33;
        -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v37);

      }
    }
    else
    {
      bls_assertions_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[BLSHLocalAssertionService queue_acquireAssertion:skipSleepCheck:].cold.1();

      v14 = (void *)MEMORY[0x24BDD1540];
      v62 = *MEMORY[0x24BDD0FC8];
      v63[0] = CFSTR("already acquired assertion");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0B778], 2, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "serviceFailedToAcquireWithError:", v16);
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke;
      v50[3] = &unk_24D1BCBC0;
      v50[4] = a1;
      v51 = v6;
      v52 = v16;
      v17 = v16;
      -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v50);

    }
  }

}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:failedToAcquireAssertion:withError:", a1[4], a1[5], a1[6]);

}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_49(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[9];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_2;
    block[3] = &unk_24D1BCC10;
    block[4] = WeakRetained;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 64);
    v12 = v5;
    v15 = v6;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v13 = v7;
    v14 = v8;
    dispatch_async(v4, block);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_3;
  v8[3] = &unk_24D1BCBE8;
  v8[4] = v3;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v4;
  v12 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10 = v6;
  v11 = v7;
  -[BLSHLocalAssertionService _queue_acquireDeferredAssertion:completion:](v3, v4, v8);

}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  bls_assertions_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
    v6 = OS_LOG_TYPE_DEFAULT;
  else
    v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v4, v6))
  {
    if (a2)
      v7 = CFSTR("for assertion");
    else
      v7 = CFSTR("but assertion was already canceled");
    v8 = *(_QWORD *)(a1 + 32);
    NSStringFromBLSAssertingObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 48), "systemSleepMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134219010;
    v16 = v8;
    v17 = 2112;
    v18 = v7;
    v19 = 2114;
    v20 = v9;
    v21 = 2048;
    v22 = v11;
    v23 = 1024;
    v24 = objc_msgSend(v12, "hasSleepBeenRequested");
    _os_log_impl(&dword_2145AC000, v5, v6, "%p system awoke  %@:\"%{public}@\" elapsed:%.4lfs hasSleepBeenRequested:%{BOOL}u", (uint8_t *)&v15, 0x30u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "invalidate");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

}

- (void)_queue_acquireDeferredAssertion:(void *)a3 completion:
{
  void (**v5)(id, uint64_t);
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(v8, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
    if ((_DWORD)v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);
      -[BLSHLocalAssertionService queue_acquireAssertion:skipSleepCheck:](a1, v8, 1);
    }
    v5[2](v5, v7);

  }
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "attributesOfClasses:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    bls_assertions_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_55_cold_1();

    objc_msgSend(v5, "activateAttributes:fromAssertion:forService:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 56), "removeObjectsInArray:", v6);
  }

}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:didAcquireAssertion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)cancelAssertion:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BLSHLocalAssertionService_cancelAssertion_withError___block_invoke;
  block[3] = &unk_24D1BC3C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __55__BLSHLocalAssertionService_cancelAssertion_withError___block_invoke(uint64_t a1)
{
  -[BLSHLocalAssertionService queue_cancelAssertion:withError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)queue_cancelAssertion:(void *)a3 withError:
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  char *__ptr32 *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  char v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7);
    v9 = MEMORY[0x24BDAC760];
    v10 = &off_21462C000;
    if (v8)
    {
      bls_assertions_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v35 = a1;
        v36 = 2114;
        v37 = v5;
        _os_log_impl(&dword_2145AC000, v11, OS_LOG_TYPE_INFO, "%p removing deferred assertion and notifying observers %{public}@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);
    }
    else
    {
      -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        bls_assertions_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          v35 = a1;
          v36 = 2114;
          v37 = v5;
          _os_log_impl(&dword_2145AC000, v24, OS_LOG_TYPE_INFO, "%p already cancelled assertion %{public}@", buf, 0x16u);
        }

        goto LABEL_17;
      }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
      v13 = objc_msgSend(*(id *)(a1 + 24), "containsObject:", v7);
      objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", v7);
      objc_msgSend(*(id *)(a1 + 24), "removeObject:", v7);
      v14 = (void *)objc_msgSend(*(id *)(a1 + 8), "copy");
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
      bls_assertions_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v35 = a1;
        v36 = 2114;
        v37 = v5;
        v38 = 1024;
        LODWORD(v39) = v13;
        _os_log_impl(&dword_2145AC000, v15, OS_LOG_TYPE_DEFAULT, "%p will cancel assertion:%{public}@ wasPaused:%{BOOL}u", buf, 0x1Cu);
      }

      objc_msgSend(v5, "descriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "attributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      if (v13)
      {
        objc_msgSend(v18, "indexesOfObjectsPassingTest:", &__block_literal_global_59);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectsAtIndexes:", v19);

      }
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_2;
      v28[3] = &unk_24D1BCCA8;
      v33 = v13;
      v29 = v16;
      v30 = a1;
      v31 = v5;
      v20 = v18;
      v32 = v20;
      v21 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v28);
      if (objc_msgSend(v20, "count"))
      {
        bls_assertions_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          NSStringFromBLSAssertingObject();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v35 = a1;
          v36 = 2114;
          v37 = v20;
          v38 = 2114;
          v39 = v23;
          _os_log_impl(&dword_2145AC000, v22, OS_LOG_TYPE_INFO, "%p (still no handler) will not cancel attributes:%{public}@ for assertion:%{public}@", buf, 0x20u);

        }
      }

      v9 = MEMORY[0x24BDAC760];
      v10 = &off_21462C000;
    }
    objc_msgSend(v5, "serviceDidCancelWithError:", v6);
    v25[0] = v9;
    v25[1] = *((_QWORD *)v10 + 47);
    v25[2] = __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_61;
    v25[3] = &unk_24D1BCBC0;
    v25[4] = a1;
    v26 = v5;
    v27 = v6;
    -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v25);

LABEL_17:
  }

}

uint64_t __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canBePaused") ^ 1;
}

void __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "attributesOfClasses:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_60);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsAtIndexes:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  if (objc_msgSend(v7, "count"))
  {
    bls_assertions_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 40);
      NSStringFromBLSAssertingObject();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218754;
      v14 = v11;
      v15 = 2114;
      v16 = v5;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v12;
      _os_log_debug_impl(&dword_2145AC000, v10, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ will deactivate (cancel) attributes:%{public}@ from assertion:%{public}@", (uint8_t *)&v13, 0x2Au);

    }
    objc_msgSend(v5, "deactivateAttributes:fromAssertion:forService:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 56), "removeObjectsInArray:", v7);
  }

}

uint64_t __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canBePaused") ^ 1;
}

void __61__BLSHLocalAssertionService_queue_cancelAssertion_withError___block_invoke_61(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:didCancelAssertion:withError:", a1[4], a1[5], a1[6]);

}

- (void)restartAssertionTimeoutTimer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__BLSHLocalAssertionService_restartAssertionTimeoutTimer___block_invoke;
  v7[3] = &unk_24D1BBE80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __58__BLSHLocalAssertionService_restartAssertionTimeoutTimer___block_invoke(uint64_t a1)
{
  -[BLSHLocalAssertionService queue_restartAssertionTimeoutTimer:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)queue_restartAssertionTimeoutTimer:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = objc_opt_class();
    objc_msgSend(v3, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributeOfClass:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      -[BLSHLocalAssertionService activeAssertionForIdentifier:]((os_unfair_lock_s *)a1, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__3;
        v23 = __Block_byref_object_dispose__3;
        v24 = 0;
        v9 = *(void **)(a1 + 8);
        v10 = MEMORY[0x24BDAC760];
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __64__BLSHLocalAssertionService_queue_restartAssertionTimeoutTimer___block_invoke;
        v18[3] = &unk_24D1BCCD0;
        v18[4] = &v19;
        v18[5] = v4;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v18);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
        if (v20[5])
        {
          bls_assertions_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218498;
            v27 = a1;
            v28 = 2114;
            v29 = v6;
            v30 = 2114;
            v31 = v3;
            _os_log_impl(&dword_2145AC000, v11, OS_LOG_TYPE_INFO, "%p will restart timer:%{public}@ for assertion:%{public}@", buf, 0x20u);
          }

          v12 = (void *)v20[5];
          v25 = v6;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "activateAttributes:fromAssertion:forService:", v13, v3, a1);

          v16[0] = v10;
          v16[1] = 3221225472;
          v16[2] = __64__BLSHLocalAssertionService_queue_restartAssertionTimeoutTimer___block_invoke_65;
          v16[3] = &unk_24D1BCB78;
          v16[4] = a1;
          v17 = v3;
          -[BLSHLocalAssertionService notifyObserversWithBlock:](a1, v16);

        }
        else
        {
          bls_assertions_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218498;
            v27 = a1;
            v28 = 2114;
            v29 = v6;
            v30 = 2114;
            v31 = v3;
            _os_log_impl(&dword_2145AC000, v15, OS_LOG_TYPE_INFO, "%p (no handler) will not restart timeout:%{public}@ for assertion:%{public}@", buf, 0x20u);
          }

        }
        _Block_object_dispose(&v19, 8);

      }
      else
      {
        bls_assertions_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[BLSHLocalAssertionService queue_restartAssertionTimeoutTimer:].cold.2();

      }
    }
    else
    {
      bls_assertions_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[BLSHLocalAssertionService queue_restartAssertionTimeoutTimer:].cold.1();
    }

  }
}

void __64__BLSHLocalAssertionService_queue_restartAssertionTimeoutTimer___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __64__BLSHLocalAssertionService_queue_restartAssertionTimeoutTimer___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:didRestartTimeoutTimerForAssertion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)replaceWithService:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSUInteger v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[NSMapTable count](self->_activeAssertions, "count");
  os_unfair_lock_unlock(p_lock);
  if (v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("BLSLocalAssertionService does not support replacement with %@"), v6);

}

- (BLSHOSInterfaceProviding)osInterfaceProvider
{
  return self->_osInterfaceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rootWorkloop, 0);
  objc_storeStrong((id *)&self->_aggregatedAssertionFactory, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue_deferredAcquisitionAssertions, 0);
  objc_storeStrong((id *)&self->_pausedAssertions, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_storeStrong((id *)&self->_attributeHandlers, 0);
}

- (void)queue_registerAttributeHandler:forAttributeClasses:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "%p registered handler for attributes:%{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)queue_pauseAssertion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "%p paused cancelled assertion %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)queue_pauseAssertion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_3(&dword_2145AC000, v0, v1, "%p already paused assertion %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)queue_resumeAssertion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "%p resumed cancelled assertion %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)queue_resumeAssertion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_3(&dword_2145AC000, v0, v1, "%p already resumed assertion %{public}@");
  OUTLINED_FUNCTION_2();
}

void __51__BLSHLocalAssertionService_queue_resumeAssertion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  NSStringFromBLSAssertingObject();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_0(&dword_2145AC000, v1, v2, "%p will activate (resume) attributes:%{public}@ from assertion:%{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_14();
}

- (void)queue_acquireAssertion:skipSleepCheck:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_3(&dword_2145AC000, v0, v1, "%p already acquired assertion %{public}@");
  OUTLINED_FUNCTION_2();
}

void __67__BLSHLocalAssertionService_queue_acquireAssertion_skipSleepCheck___block_invoke_55_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  NSStringFromBLSAssertingObject();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_0(&dword_2145AC000, v1, v2, "%p will activate (acquire) attributes:%{public}@ from assertion:%{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_14();
}

- (void)queue_restartAssertionTimeoutTimer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_3(&dword_2145AC000, v0, v1, "%p cannot restart timer without BLSTimeoutDurationAttribute for assertion %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)queue_restartAssertionTimeoutTimer:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_3(&dword_2145AC000, v0, v1, "%p cannot restart timer for unacquired assertion %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
