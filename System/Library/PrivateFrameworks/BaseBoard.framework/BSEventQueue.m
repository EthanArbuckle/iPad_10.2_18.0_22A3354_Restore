@implementation BSEventQueue

- (BSEventQueueEvent)executingEvent
{
  return self->_executingEvent;
}

- (BOOL)isLocked
{
  return -[NSHashTable count](self->_eventQueueLocks, "count") != 0;
}

- (void)executeOrInsertEvents:(id)a3 atPosition:(int)a4
{
  uint64_t v4;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v4 = *(_QWORD *)&a4;
    if (!objc_msgSend(a3, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__executeOrPendEvents_position_, self, CFSTR("BSEventQueue.m"), 50, CFSTR("Must have something to execute"));

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = a3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (-[BSEventQueue _shouldProcessEvent:enqueuedDuringExecutionOfEvent:](self, "_shouldProcessEvent:enqueuedDuringExecutionOfEvent:", v12, self->_executingEvent))
          {
            objc_msgSend(v7, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    -[BSEventQueue _noteWillPendEvents:atPosition:](self, "_noteWillPendEvents:atPosition:", v7, v4);
    if ((_DWORD)v4 == 1)
    {
      -[NSMutableArray addObjectsFromArray:](self->_eventQueue, "addObjectsFromArray:", v7);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v7, "reverseObjectEnumerator", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(v13);
            -[NSMutableArray insertObject:atIndex:](self->_eventQueue, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), 0);
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v14);
      }

    }
    -[BSEventQueue _processNextEvent]((uint64_t)self);

  }
}

- (BOOL)_shouldProcessEvent:(id)a3 enqueuedDuringExecutionOfEvent:(id)a4
{
  return 1;
}

- (void)_processNextEvent
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a1 && !*(_BYTE *)(a1 + 24))
  {
    v3 = (_QWORD *)(a1 + 48);
    v2 = *(_QWORD *)(a1 + 48);
    *(_BYTE *)(a1 + 24) = 1;
    if (!v2)
    {
      do
      {
        if (objc_msgSend(*(id *)(a1 + 8), "count") || !objc_msgSend(*(id *)(a1 + 16), "count"))
          break;
        objc_msgSend(*(id *)(a1 + 16), "objectAtIndex:", 0);
        v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          objc_storeStrong((id *)(a1 + 48), v4);
          objc_msgSend((id)a1, "acquireLockForReason:", CFSTR("ExecutingEvent"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 16), "removeObjectAtIndex:", 0);
          objc_msgSend((id)a1, "_noteWillExecuteEvent:", v4);
          v6 = v4[1];
          if (v6)
            (*(void (**)(void))(v6 + 16))();
          objc_msgSend((id)a1, "relinquishLock:", v5);
          v7 = *(void **)(a1 + 48);
          *(_QWORD *)(a1 + 48) = 0;

          if (!objc_msgSend(*(id *)(a1 + 16), "count"))
            objc_msgSend((id)a1, "_noteQueueDidDrain");

        }
      }
      while (!*v3);
    }
    *(_BYTE *)(a1 + 24) = 0;
  }
}

- (void)relinquishLock:(id)a3
{
  void *v6;
  BSEventQueue *v7;
  void *v8;

  if (a3)
    v6 = (void *)*((_QWORD *)a3 + 3);
  else
    v6 = 0;
  v7 = v6;

  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSEventQueue.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[lock eventQueue] == self"));

  }
  objc_msgSend(a3, "relinquish");
}

- (void)_removeEventQueueLock:(id *)a1
{
  void *v4;

  if (a1)
  {
    objc_msgSend(a1, "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BSDispatchQueueAssert(v4);

    if (a2)
    {
      objc_msgSend(a1[1], "removeObject:", a2);
      if (!objc_msgSend(a1[1], "count"))
        objc_msgSend(a1, "_noteQueueDidUnlock");
      -[BSEventQueue _processNextEvent]((uint64_t)a1);
    }
  }
}

- (id)acquireLockForReason:(id)a3
{
  return -[BSEventQueueLock initWithEventQueue:reason:]([BSEventQueueLock alloc], "initWithEventQueue:reason:", self, a3);
}

- (void)_addEventQueueLock:(id *)a1
{
  void *v4;

  if (a1)
  {
    objc_msgSend(a1, "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BSDispatchQueueAssert(v4);

    if (a2)
    {
      if ((objc_msgSend(a1[1], "containsObject:", a2) & 1) == 0)
      {
        objc_msgSend(a1[1], "addObject:", a2);
        if (objc_msgSend(a1[1], "count") == 1)
          objc_msgSend(a1, "_noteQueueDidLock");
      }
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)pendingEvents
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_eventQueue, "copy");
}

- (void)executeOrInsertEvent:(id)a3 atPosition:(int)a4
{
  uint64_t v4;
  void *v6;
  _QWORD v7[2];

  v4 = *(_QWORD *)&a4;
  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue executeOrInsertEvents:atPosition:](self, "executeOrInsertEvents:atPosition:", v6, v4);

}

- (void)flushAllEvents
{
  _QWORD *v3;
  uint64_t v4;
  id v5;

  if (-[NSMutableArray count](self->_eventQueue, "count"))
  {
    -[BSEventQueue acquireLockForReason:](self, "acquireLockForReason:", CFSTR("FlushAllEvents"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    while (-[NSMutableArray count](self->_eventQueue, "count"))
    {
      -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
      v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", 0);
        -[BSEventQueue _noteWillExecuteEvent:](self, "_noteWillExecuteEvent:", v3);
        v4 = v3[1];
        if (v4)
          (*(void (**)(void))(v4 + 16))();
      }

    }
    objc_msgSend(v5, "relinquish");

  }
}

- (void)cancelEventsWithName:(id)a3
{
  NSMutableArray *eventQueue;
  void *v6;
  _QWORD v7[5];

  if (-[NSMutableArray count](self->_eventQueue, "count"))
  {
    eventQueue = self->_eventQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__BSEventQueue_cancelEventsWithName___block_invoke;
    v7[3] = &unk_1E1EBF120;
    v7[4] = a3;
    -[NSMutableArray indexesOfObjectsPassingTest:](eventQueue, "indexesOfObjectsPassingTest:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      -[BSEventQueue _noteWillCancelEventsWithName:count:](self, "_noteWillCancelEventsWithName:count:", a3, objc_msgSend(v6, "count"));
      -[NSMutableArray removeObjectsAtIndexes:](self->_eventQueue, "removeObjectsAtIndexes:", v6);
    }

  }
}

- (void)flushEvents:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    -[BSEventQueue acquireLockForReason:](self, "acquireLockForReason:", CFSTR("FlushEvents"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = a3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v10 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_eventQueue, "indexOfObjectIdenticalTo:", v9);
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            BSLogCommon();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              -[BSEventQueue succinctDescription](self, "succinctDescription");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v20 = v13;
              v21 = 2114;
              v22 = v9;
              _os_log_error_impl(&dword_18A184000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Provided event is not a member. Ignoring: %{public}@", buf, 0x16u);

            }
          }
          else
          {
            -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", v10);
            -[BSEventQueue _noteWillExecuteEvent:](self, "_noteWillExecuteEvent:", v9);
            if (v9)
            {
              v12 = *(_QWORD *)(v9 + 8);
              if (v12)
                (*(void (**)(void))(v12 + 16))();
            }
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v6);
    }

    objc_msgSend(v14, "relinquish");
  }
}

- (BSEventQueue)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSEventQueue.m"), 25, CFSTR("wrong initializer"));

  return self;
}

- (BSEventQueue)initWithName:(id)a3 onQueue:(id)a4
{
  BSEventQueue *v6;
  uint64_t v7;
  NSString *name;
  NSMutableArray *v9;
  NSMutableArray *eventQueue;
  uint64_t v11;
  NSHashTable *eventQueueLocks;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BSEventQueue;
  v6 = -[BSEventQueue init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(a3, "copy");
    name = v6->_name;
    v6->_name = (NSString *)v7;

    objc_storeStrong((id *)&v6->_queue, a4);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    eventQueue = v6->_eventQueue;
    v6->_eventQueue = v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    eventQueueLocks = v6->_eventQueueLocks;
    v6->_eventQueueLocks = (NSHashTable *)v11;

  }
  return v6;
}

- (NSString)description
{
  return (NSString *)-[BSEventQueue descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_eventQueue, "count") == 0;
}

- (void)flushPendingEvents
{
  id v3;

  v3 = (id)-[NSMutableArray copy](self->_eventQueue, "copy");
  -[BSEventQueue flushEvents:](self, "flushEvents:");

}

uint64_t __37__BSEventQueue_cancelEventsWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)hasEventWithPrefix:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_eventQueue;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "name", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasPrefix:", a3);

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasEventWithName:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_eventQueue;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "name", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", a3);

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSEventQueue succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_name, 0, 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSEventQueue descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BSEventQueue *v11;

  -[BSEventQueue succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSHashTable count](self->_eventQueueLocks, "count")
    || -[NSMutableArray count](self->_eventQueue, "count")
    || self->_executingEvent)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__BSEventQueue_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E1EBE700;
    v10 = v5;
    v11 = self;
    objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", 0, a3, v9);

  }
  else
  {
    v7 = (id)objc_msgSend(v5, "appendObject:withName:", CFSTR("(none)"), CFSTR("locks"));
    v8 = (id)objc_msgSend(v5, "appendObject:withName:", CFSTR("(none)"), CFSTR("pending events"));
  }
  return v5;
}

void __54__BSEventQueue_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("executingEvent"));
  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("queued events"), 1);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:");

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executingEvent, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_eventQueueLocks, 0);
}

@end
