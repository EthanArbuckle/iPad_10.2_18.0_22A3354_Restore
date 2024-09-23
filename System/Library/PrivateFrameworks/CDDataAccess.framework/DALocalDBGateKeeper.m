@implementation DALocalDBGateKeeper

+ (id)sharedGateKeeper
{
  if (sharedGateKeeper_onceToken != -1)
    dispatch_once(&sharedGateKeeper_onceToken, &__block_literal_global_4);
  return (id)sharedGateKeeper___sharedGateKeeper;
}

void __39__DALocalDBGateKeeper_sharedGateKeeper__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedGateKeeper___sharedGateKeeper;
  sharedGateKeeper___sharedGateKeeper = v0;

}

- (DALocalDBGateKeeper)init
{
  DALocalDBGateKeeper *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DALocalDBGateKeeper;
  v2 = -[DALocalDBGateKeeper init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[DALocalDBGateKeeper setEventsWaiters:](v2, "setEventsWaiters:", v3);

    v4 = (void *)objc_opt_new();
    -[DALocalDBGateKeeper setWaiterIDsExpectingEventsLock:](v2, "setWaiterIDsExpectingEventsLock:", v4);

  }
  return v2;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_eventsLockHolder)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBGateKeeper.m"), 95, CFSTR("DALocalDBGateKeeper is shutting down, but the following account is still holding the dataclass lock for dataclass %lx.  Account %@"), 4, self->_eventsLockHolder);

  }
  if (-[NSMutableArray count](self->_eventsWaiters, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBGateKeeper.m"), 96, CFSTR("DALocalDBGateKeeper is shutting down, but the following accounts are still waiting on the dataclass lock for dataclass type %lx.  Account %@"), 4, self->_eventsWaiters);

  }
  v6.receiver = self;
  v6.super_class = (Class)DALocalDBGateKeeper;
  -[DALocalDBGateKeeper dealloc](&v6, sel_dealloc);
}

- (void)setEventsLockHolder:(id)a3
{
  DADataclassLockWatcher *v5;
  DADataclassLockWatcher **p_eventsLockHolder;
  DADataclassLockWatcher *eventsLockHolder;
  DADataclassLockWatcher *v8;

  v5 = (DADataclassLockWatcher *)a3;
  eventsLockHolder = self->_eventsLockHolder;
  p_eventsLockHolder = &self->_eventsLockHolder;
  if (eventsLockHolder != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_eventsLockHolder, a3);
    v5 = v8;
  }

}

- (BOOL)_canWakenWaiter:(id)a3
{
  id v4;
  char v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "dataclasses");
  v6 = objc_msgSend(v4, "waiterNum");
  if ((v5 & 0x14) == 0)
    goto LABEL_6;
  if (!self->_eventsLockHolder)
  {
    v7 = v6;
    -[NSMutableArray objectAtIndexedSubscript:](self->_eventsWaiters, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "waiterNum");

    if (v9 == v7)
    {
      objc_msgSend(v4, "waiter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DALocalDBGateKeeper setEventsLockHolder:](self, "setEventsLockHolder:", v11);

      -[NSMutableArray removeObjectAtIndex:](self->_eventsWaiters, "removeObjectAtIndex:", 0);
LABEL_6:
      v10 = 1;
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)_abortWaiterForWrappers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  uint64_t j;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "waiterNum"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

        objc_msgSend(v11, "waiter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "waiterID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          -[NSMutableSet removeObject:](self->_waiterIDsExpectingEventsLock, "removeObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v8);
  }
  v27 = v6;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = v5;
  objc_msgSend(v5, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    v19 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        DALoggingwithCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, v19))
        {
          v23 = objc_msgSend(v21, "dataclasses");
          objc_msgSend(v21, "waiter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v37 = v23;
          v38 = 2112;
          v39 = v24;
          _os_log_impl(&dword_1C1CD1000, v22, v19, "Aborting locks for dataclasses %lx to %@", buf, 0x16u);

        }
        objc_msgSend(v21, "completionHandler");
        v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v25[2](v25, objc_msgSend(v21, "dataclasses"), 0);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v17);
  }

}

- (void)_notifyWaitersForDataclasses:(id)a3
{
  void *v4;
  DALocalDBGateKeeper *v5;
  int v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v19 = _os_activity_create(&dword_1C1CD1000, "DALocalDBGateKeeper notifyWaiters", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v19, &state);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 3);
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v20, "intValue");
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 134217984;
    v27 = v6;
    _os_log_impl(&dword_1C1CD1000, v7, v8, "Notifying waiters for dataclasses %ldd", buf, 0xCu);
  }

  if ((v6 & 0x14) != 0 && !v5->_eventsLockHolder && -[NSMutableArray count](v5->_eventsWaiters, "count", v19))
  {
    -[NSMutableArray objectAtIndexedSubscript:](v5->_eventsWaiters, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DALocalDBGateKeeper _canWakenWaiter:](v5, "_canWakenWaiter:", v9))
      objc_msgSend(v4, "addObject:", v9);

  }
  objc_sync_exit(v5);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        DALoggingwithCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, v8))
        {
          v16 = objc_msgSend(v14, "dataclasses");
          objc_msgSend(v14, "waiter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v27 = v16;
          v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_1C1CD1000, v15, v8, "Granting locks for dataclasses %lx to %@", buf, 0x16u);

        }
        objc_msgSend(v14, "completionHandler");
        v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v18[2](v18, objc_msgSend(v14, "dataclasses"), 1);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v11);
  }

  os_activity_scope_leave(&state);
}

- (void)_registerWaiter:(id)a3 forDataclassLocks:(int64_t)a4 preempt:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  os_log_type_t v14;
  DALocalDBGateKeeper *v15;
  void *v16;
  int v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  NSMutableArray *eventsWaiters;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSString *unitTestHackRunLoopMode;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v7 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0D03918];
  v14 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v12, v14))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_1C1CD1000, v12, v14, "registerWaiter %@ forDataclassLocks %lx", buf, 0x16u);
  }

  v15 = self;
  objc_sync_enter(v15);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setCompletionHandler:", v11);
  objc_msgSend(v16, "setWaiter:", v10);
  objc_msgSend(v16, "setDataclasses:", a4);
  v17 = objc_msgSend(MEMORY[0x1E0D03908], "isInHoldingPattern");
  if (v17)
  {
    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_BYTE *)(v13 + 3);
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v16;
      _os_log_impl(&dword_1C1CD1000, v18, v19, "Not allowing waiter %@ to get the gate, as we're in a holding pattern", buf, 0xCu);
    }

    v26 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DALocalDBGateKeeper _abortWaiterForWrappers:](v15, "_abortWaiterForWrappers:", v20);

    goto LABEL_10;
  }
  if ((a4 & 0x14) == 0)
  {
LABEL_10:
    v22 = 0;
    goto LABEL_11;
  }
  eventsWaiters = v15->_eventsWaiters;
  v22 = v15->_eventsLockHolder == 0;
  if (v7)
    -[NSMutableArray insertObject:atIndex:](eventsWaiters, "insertObject:atIndex:", v16, 0);
  else
    -[NSMutableArray addObject:](eventsWaiters, "addObject:", v16);
LABEL_11:

  objc_sync_exit(v15);
  if (((v17 | !v22) & 1) == 0)
  {
    if (v15->_unitTestHackRunLoopMode)
    {
      unitTestHackRunLoopMode = v15->_unitTestHackRunLoopMode;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &unitTestHackRunLoopMode, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DALocalDBGateKeeper _setUnitTestHackRunLoopMode:](v15, "_setUnitTestHackRunLoopMode:", 0);
    }
    else
    {
      runLoopModesToPerformDelayedSelectorsIn();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject da_addNullRunLoopSourceAndPerformSelector:withObject:afterDelay:inModes:](v15, "da_addNullRunLoopSourceAndPerformSelector:withObject:afterDelay:inModes:", sel__notifyWaitersForDataclasses_, v24, v23, 0.0);

  }
}

- (void)registerPreemptiveWaiter:(id)a3 forDataclassLocks:(int64_t)a4 completionHandler:(id)a5
{
  -[DALocalDBGateKeeper _registerWaiter:forDataclassLocks:preempt:completionHandler:](self, "_registerWaiter:forDataclassLocks:preempt:completionHandler:", a3, a4, 1, a5);
}

- (void)registerWaiter:(id)a3 forDataclassLocks:(int64_t)a4 completionHandler:(id)a5
{
  -[DALocalDBGateKeeper _registerWaiter:forDataclassLocks:preempt:completionHandler:](self, "_registerWaiter:forDataclassLocks:preempt:completionHandler:", a3, a4, 0, a5);
}

- (void)_sendAllClearNotifications
{
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 claimedOwnershipOfEvents;
  uint64_t v6;
  DADataclassLockWatcher *eventsLockHolder;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  DADataclassLockWatcher *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_claimedOwnershipOfEvents
    || -[NSMutableArray count](self->_eventsWaiters, "count")
    || self->_eventsLockHolder
    || -[NSMutableSet count](self->_waiterIDsExpectingEventsLock, "count"))
  {
    DALoggingwithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
    if (os_log_type_enabled(v3, v4))
    {
      claimedOwnershipOfEvents = self->_claimedOwnershipOfEvents;
      v6 = -[NSMutableArray count](self->_eventsWaiters, "count");
      eventsLockHolder = self->_eventsLockHolder;
      v8 = -[NSMutableSet count](self->_waiterIDsExpectingEventsLock, "count");
      v9[0] = 67109888;
      v9[1] = claimedOwnershipOfEvents;
      v10 = 2048;
      v11 = v6;
      v12 = 2048;
      v13 = eventsLockHolder;
      v14 = 2048;
      v15 = v8;
      _os_log_impl(&dword_1C1CD1000, v3, v4, "Not notifying for events.  Claimed %d waiters count %lu holder %p expectant waiters %lu", (uint8_t *)v9, 0x26u);
    }

  }
  else
  {
    self->_claimedOwnershipOfEvents = 0;
  }
}

- (void)unregisterWaiterForDataclassLocks:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  DALocalDBGateKeeper *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  id *p_isa;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  NSMutableArray *eventsWaiters;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "unregisterWaiterForDataclassLocks %@", buf, 0xCu);
  }

  v7 = (void *)objc_opt_new();
  v8 = self;
  objc_sync_enter(v8);
  p_isa = (id *)&v8->super.isa;
  eventsWaiters = v8->_eventsWaiters;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &eventsWaiters, 1);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v20 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "count");
        if (v12 >= 1)
        {
          v13 = v12 + 1;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", (v13 - 2));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "waiter");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v4);

            if (v16)
            {
              objc_msgSend(v7, "addObject:", v14);
              objc_msgSend(v11, "removeObjectAtIndex:", (v13 - 2));
            }

            --v13;
          }
          while (v13 > 1);
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v17 = objc_msgSend(p_isa[2], "isEqual:", v4);
  objc_sync_exit(p_isa);

  if (v17)
    objc_msgSend(p_isa, "relinquishLocksForWaiter:dataclasses:moreComing:", v4, 20, 0);
  objc_msgSend(p_isa, "_abortWaiterForWrappers:", v7);
  objc_msgSend(p_isa, "_sendAllClearNotifications");

}

- (void)relinquishLocksForWaiter:(id)a3 dataclasses:(int64_t)a4 moreComing:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  DALocalDBGateKeeper *v12;
  void *v13;
  NSMutableSet *waiterIDsExpectingEventsLock;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v10, v11))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v9;
    v21 = 2048;
    v22 = a4;
    _os_log_impl(&dword_1C1CD1000, v10, v11, "relinquishing locks for waiter %@ dataclasses %lx", buf, 0x16u);
  }

  v12 = self;
  objc_sync_enter(v12);
  if ((a4 & 0x14) != 0)
  {
    if ((-[DADataclassLockWatcher isEqual:](v12->_eventsLockHolder, "isEqual:", v9) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("DALocalDBGateKeeper.m"), 448, CFSTR("Waiter %@ tried to relinquish a lock for data class %ld, but it was held by another waiter: %@"), v9, a4, v12->_eventsLockHolder);

    }
    -[DALocalDBGateKeeper setEventsLockHolder:](v12, "setEventsLockHolder:", 0);
    objc_msgSend(v9, "waiterID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      waiterIDsExpectingEventsLock = v12->_waiterIDsExpectingEventsLock;
      objc_msgSend(v9, "waiterID");
      if (v5)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](waiterIDsExpectingEventsLock, "addObject:", v15);
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](waiterIDsExpectingEventsLock, "removeObject:", v15);
      }

    }
  }
  objc_sync_exit(v12);

  -[DALocalDBGateKeeper _sendAllClearNotifications](v12, "_sendAllClearNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  runLoopModesToPerformDelayedSelectorsIn();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject da_addNullRunLoopSourceAndPerformSelector:withObject:afterDelay:inModes:](v12, "da_addNullRunLoopSourceAndPerformSelector:withObject:afterDelay:inModes:", sel__notifyWaitersForDataclasses_, v16, v17, 0.0);

}

- (void)claimedOwnershipOfDataclasses:(int64_t)a3
{
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Claiming ownership of dataclasses 0x%lx", (uint8_t *)&v7, 0xCu);
  }

  if ((a3 & 4) != 0)
    self->_claimedOwnershipOfEvents = 1;
}

- (id)stateString
{
  void *v3;
  DALocalDBGateKeeper *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E7B93480);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("_eventsLockHolder %@\n"), v4->_eventsLockHolder);
  objc_msgSend(v3, "appendFormat:", CFSTR("_eventsWaiters %@\n"), v4->_eventsWaiters);
  objc_msgSend(v3, "appendFormat:", CFSTR("_waiterIDsExpectingEventsLock %@\n"), v4->_waiterIDsExpectingEventsLock);
  objc_sync_exit(v4);

  return v3;
}

- (void)_setUnitTestHackRunLoopMode:(id)a3
{
  NSString *v5;
  NSString **p_unitTestHackRunLoopMode;
  NSString *unitTestHackRunLoopMode;
  NSString *v8;

  v5 = (NSString *)a3;
  unitTestHackRunLoopMode = self->_unitTestHackRunLoopMode;
  p_unitTestHackRunLoopMode = &self->_unitTestHackRunLoopMode;
  if (unitTestHackRunLoopMode != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_unitTestHackRunLoopMode, a3);
    v5 = v8;
  }

}

- (BOOL)claimedOwnershipOfEvents
{
  return self->_claimedOwnershipOfEvents;
}

- (void)setClaimedOwnershipOfEvents:(BOOL)a3
{
  self->_claimedOwnershipOfEvents = a3;
}

- (DADataclassLockWatcher)eventsLockHolder
{
  return self->_eventsLockHolder;
}

- (NSMutableArray)eventsWaiters
{
  return self->_eventsWaiters;
}

- (void)setEventsWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_eventsWaiters, a3);
}

- (NSMutableSet)waiterIDsExpectingEventsLock
{
  return self->_waiterIDsExpectingEventsLock;
}

- (void)setWaiterIDsExpectingEventsLock:(id)a3
{
  objc_storeStrong((id *)&self->_waiterIDsExpectingEventsLock, a3);
}

- (NSString)unitTestHackRunLoopMode
{
  return self->_unitTestHackRunLoopMode;
}

- (void)setUnitTestHackRunLoopMode:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestHackRunLoopMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestHackRunLoopMode, 0);
  objc_storeStrong((id *)&self->_waiterIDsExpectingEventsLock, 0);
  objc_storeStrong((id *)&self->_eventsWaiters, 0);
  objc_storeStrong((id *)&self->_eventsLockHolder, 0);
}

@end
