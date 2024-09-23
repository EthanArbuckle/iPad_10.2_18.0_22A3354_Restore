@implementation QLPXObservable

- (QLPXObservable)init
{
  QLPXObservable *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *observersQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLPXObservable;
  v2 = -[QLPXObservable init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.photosuicore.observable.internal-queue", 0);
    observersQueue = v2->_observersQueue;
    v2->_observersQueue = (OS_dispatch_queue *)v3;

    v2->_currentChange = 0;
  }
  return v2;
}

- (void)performChanges:(id)a3
{
  void (**v4)(id, void *);
  NSMutableArray *pendingChangeBlocks;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void (**v12)(id, void *);

  v4 = (void (**)(id, void *))a3;
  v12 = v4;
  if (self->_isEnumeratingObservers)
  {
    pendingChangeBlocks = self->_pendingChangeBlocks;
    if (pendingChangeBlocks)
    {
      v6 = (void *)objc_msgSend(v4, "copy");
      -[NSMutableArray addObject:](pendingChangeBlocks, "addObject:", v6);

    }
    else
    {
      v8 = (void *)MEMORY[0x24BDBCEB8];
      v9 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v8, "arrayWithObject:", v9);
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v11 = self->_pendingChangeBlocks;
      self->_pendingChangeBlocks = v10;

    }
  }
  else
  {
    -[QLPXObservable _willChange](self, "_willChange");
    -[QLPXObservable mutableChangeObject](self, "mutableChangeObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v7);

    -[QLPXObservable _didChange](self, "_didChange");
  }

}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  NSObject *observersQueue;
  id v8;
  _QWORD block[5];
  id v10;
  void *v11;

  v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__QLPXObservable_registerChangeObserver_context___block_invoke;
  block[3] = &unk_24C724E38;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(observersQueue, block);

}

void __49__QLPXObservable_registerChangeObserver_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v12 = v2;
    v6 = objc_msgSend(v2, "count");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = v12;
      while (1)
      {
        v10 = objc_msgSend(v9, "pointerAtIndex:", v8);
        v11 = *(_QWORD *)(a1 + 48);
        if (v10 == v11)
          break;
        ++v8;
        v9 = v12;
        if (v7 == v8)
          goto LABEL_12;
      }
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 48);
LABEL_12:
      objc_msgSend(v12, "addPointer:", v11);
    }
  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    {
      objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 64);
      *(_QWORD *)(v4 + 64) = v3;

    }
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1748]), "initWithOptions:", 256);
    objc_msgSend(v12, "addPointer:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));
  }

}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  NSObject *observersQueue;
  id v8;
  _QWORD block[5];
  id v10;
  void *v11;

  v6 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__QLPXObservable_unregisterChangeObserver_context___block_invoke;
  block[3] = &unk_24C724E38;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(observersQueue, block);

}

void __51__QLPXObservable_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "count");
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    while (objc_msgSend(v5, "pointerAtIndex:", v4) != *(_QWORD *)(a1 + 48))
    {
      if (v3 == ++v4)
        goto LABEL_7;
    }
    objc_msgSend(v5, "removePointerAtIndex:", v4);
  }
LABEL_7:
  if (v5 && !objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)signalChange:(unint64_t)a3
{
  self->_currentChange |= a3;
}

- (unint64_t)currentChanges
{
  return self->_currentChange;
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  BOOL isEnumeratingObservers;
  NSObject *observersQueue;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  _BOOL4 v14;
  NSObject *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _QWORD block[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  isEnumeratingObservers = self->_isEnumeratingObservers;
  self->_isEnumeratingObservers = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  v28 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__QLPXObservable_enumerateObserversUsingBlock___block_invoke;
  block[3] = &unk_24C725078;
  block[4] = self;
  block[5] = &v23;
  dispatch_sync(observersQueue, block);
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend((id)v24[5], "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v7);
      v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
      objc_msgSend((id)v24[5], "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      while (v13 < objc_msgSend(v12, "count"))
      {
        v4[2](v4, v11, objc_msgSend(v12, "pointerAtIndex:", v13++), &v21);
        if (v21)
        {

          goto LABEL_13;
        }
      }
      v14 = v21 == 0;

      if (!v14)
        break;
      if (++v10 == v8)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
LABEL_13:

  v15 = self->_observersQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __47__QLPXObservable_enumerateObserversUsingBlock___block_invoke_2;
  v16[3] = &unk_24C724B00;
  v16[4] = self;
  dispatch_sync(v15, v16);
  self->_isEnumeratingObservers = isEnumeratingObservers;
  _Block_object_dispose(&v23, 8);

}

void __47__QLPXObservable_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
}

uint64_t __47__QLPXObservable_enumerateObserversUsingBlock___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 56) = 0;
  return result;
}

- (void)_willChange
{
  int64_t nestedChanges;

  nestedChanges = self->_nestedChanges;
  if (!nestedChanges)
  {
    -[QLPXObservable willPerformChanges](self, "willPerformChanges");
    nestedChanges = self->_nestedChanges;
  }
  self->_nestedChanges = nestedChanges + 1;
}

- (void)_didChange
{
  int64_t nestedChanges;
  int64_t v4;

  nestedChanges = self->_nestedChanges;
  if (nestedChanges == 1)
  {
    -[QLPXObservable didPerformChanges](self, "didPerformChanges");
    nestedChanges = self->_nestedChanges;
  }
  v4 = nestedChanges - 1;
  self->_nestedChanges = v4;
  if (!v4)
  {
    if (self->_currentChange)
    {
      -[QLPXObservable _publishChanges](self, "_publishChanges");
      -[QLPXObservable didPublishChanges](self, "didPublishChanges");
      self->_currentChange = 0;
    }
    -[QLPXObservable _applyPendingChanges](self, "_applyPendingChanges");
  }
}

- (void)_publishChanges
{
  unint64_t currentChange;
  _QWORD v3[6];

  currentChange = self->_currentChange;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__QLPXObservable__publishChanges__block_invoke;
  v3[3] = &unk_24C7250A0;
  v3[4] = self;
  v3[5] = currentChange;
  -[QLPXObservable enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v3);
}

uint64_t __33__QLPXObservable__publishChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "observable:didChange:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

- (void)_applyPendingChanges
{
  int64_t numAppliedPendingChanges;
  NSMutableArray *pendingChangeBlocks;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  _QWORD v8[4];
  NSMutableArray *v9;

  pendingChangeBlocks = self->_pendingChangeBlocks;
  numAppliedPendingChanges = self->_numAppliedPendingChanges;
  self->_numAppliedPendingChanges = numAppliedPendingChanges + 1;
  if (pendingChangeBlocks)
  {
    v5 = pendingChangeBlocks;
    v6 = self->_pendingChangeBlocks;
    self->_pendingChangeBlocks = 0;

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __38__QLPXObservable__applyPendingChanges__block_invoke;
    v8[3] = &unk_24C7250C8;
    v9 = v5;
    v7 = v5;
    -[QLPXObservable performChanges:](self, "performChanges:", v8);

    numAppliedPendingChanges = self->_numAppliedPendingChanges - 1;
  }
  self->_numAppliedPendingChanges = numAppliedPendingChanges;
}

void __38__QLPXObservable__applyPendingChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_observersQueue_copyChangeObserversForWriteIfNeeded
{
  NSMapTable *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMapTable *observersQueue_changeObserversWithContexts;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_observersQueue_shouldCopyChangeObserversOnWrite)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMapTable keyEnumerator](self->_observersQueue_changeObserversWithContexts, "keyEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_observersQueue_changeObserversWithContexts, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "copy");

          -[NSMapTable setObject:forKey:](v3, "setObject:forKey:", v11, v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    observersQueue_changeObserversWithContexts = self->_observersQueue_changeObserversWithContexts;
    self->_observersQueue_changeObserversWithContexts = v3;

    self->_observersQueue_shouldCopyChangeObserversOnWrite = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersQueue_changeObserversWithContexts, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_pendingChangeBlocks, 0);
}

@end
