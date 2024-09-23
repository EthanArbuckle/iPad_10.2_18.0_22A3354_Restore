@implementation DALocalDBGateKeeper

+ (id)sharedGateKeeper
{
  if (sharedGateKeeper_onceToken != -1)
    dispatch_once(&sharedGateKeeper_onceToken, &__block_literal_global_9);
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
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DALocalDBGateKeeper;
  v2 = -[DALocalDBGateKeeper init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[DALocalDBGateKeeper setEventsWaiters:](v2, "setEventsWaiters:", v3);

    v4 = (void *)objc_opt_new();
    -[DALocalDBGateKeeper setWaiterIDsExpectingEventsLock:](v2, "setWaiterIDsExpectingEventsLock:", v4);

    v5 = (void *)objc_opt_new();
    -[DALocalDBGateKeeper setContactsWaiters:](v2, "setContactsWaiters:", v5);

    v6 = (void *)objc_opt_new();
    -[DALocalDBGateKeeper setNotesWaiters:](v2, "setNotesWaiters:", v6);

    v7 = (void *)objc_opt_new();
    -[DALocalDBGateKeeper setWaiterIDsExpectingContactsLock:](v2, "setWaiterIDsExpectingContactsLock:", v7);

    v8 = (void *)objc_opt_new();
    -[DALocalDBGateKeeper setWaiterIDsExpectingNotesLock:](v2, "setWaiterIDsExpectingNotesLock:", v8);

  }
  return v2;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (self->_contactsLockHolder)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBGateKeeper.m"), 87, CFSTR("DALocalDBGateKeeper is shutting down, but the following account is still holding the dataclass lock for dataclass %lx.  Account %@"), 2, self->_contactsLockHolder);

  }
  if (-[NSMutableArray count](self->_contactsWaiters, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBGateKeeper.m"), 88, CFSTR("DALocalDBGateKeeper is shutting down, but the following accounts are still waiting on the dataclass lock for dataclass %lx.  Account %@"), 2, self->_contactsWaiters);

  }
  if (self->_eventsLockHolder)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBGateKeeper.m"), 90, CFSTR("DALocalDBGateKeeper is shutting down, but the following account is still holding the dataclass lock for dataclass %lx.  Account %@"), 4, self->_eventsLockHolder);

  }
  if (-[NSMutableArray count](self->_eventsWaiters, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBGateKeeper.m"), 91, CFSTR("DALocalDBGateKeeper is shutting down, but the following accounts are still waiting on the dataclass lock for dataclass type %lx.  Account %@"), 4, self->_eventsWaiters);

  }
  if (self->_notesLockHolder)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBGateKeeper.m"), 93, CFSTR("DALocalDBGateKeeper is shutting down, but the following account is still holding the dataclass lock for dataclass %lx.  Account %@"), 32, self->_notesLockHolder);

  }
  if (-[NSMutableArray count](self->_notesWaiters, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBGateKeeper.m"), 94, CFSTR("DALocalDBGateKeeper is shutting down, but the following accounts are still waiting on the dataclass lock for dataclass type %lx.  Account %@"), 32, self->_notesWaiters);

  }
  v10.receiver = self;
  v10.super_class = (Class)DALocalDBGateKeeper;
  -[DALocalDBGateKeeper dealloc](&v10, sel_dealloc);
}

- (void)setContactsLockHolder:(id)a3
{
  DADataclassLockWatcher *v5;
  DADataclassLockWatcher *v6;
  DADataclassLockWatcher **p_contactsLockHolder;
  DADataclassLockWatcher *contactsLockHolder;
  void *v9;
  void *v10;
  DADataclassLockWatcher *v11;

  v5 = (DADataclassLockWatcher *)a3;
  contactsLockHolder = self->_contactsLockHolder;
  p_contactsLockHolder = &self->_contactsLockHolder;
  v6 = contactsLockHolder;
  if (contactsLockHolder != v5)
  {
    v11 = v5;
    if (v5)
    {
      +[DAPriorityManager sharedManager](DAPriorityManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestPriority:forClient:dataclasses:", 1, v11, 2);

      v6 = *p_contactsLockHolder;
    }
    if (v6)
    {
      +[DAPriorityManager sharedManager](DAPriorityManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestPriority:forClient:dataclasses:", 0, *p_contactsLockHolder, 2);

    }
    objc_storeStrong((id *)p_contactsLockHolder, a3);
    v5 = v11;
  }

}

- (void)setEventsLockHolder:(id)a3
{
  DADataclassLockWatcher *v5;
  DADataclassLockWatcher *v6;
  DADataclassLockWatcher **p_eventsLockHolder;
  DADataclassLockWatcher *eventsLockHolder;
  void *v9;
  void *v10;
  DADataclassLockWatcher *v11;

  v5 = (DADataclassLockWatcher *)a3;
  eventsLockHolder = self->_eventsLockHolder;
  p_eventsLockHolder = &self->_eventsLockHolder;
  v6 = eventsLockHolder;
  if (eventsLockHolder != v5)
  {
    v11 = v5;
    if (v5)
    {
      +[DAPriorityManager sharedManager](DAPriorityManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestPriority:forClient:dataclasses:", 1, v11, 20);

      v6 = *p_eventsLockHolder;
    }
    if (v6)
    {
      +[DAPriorityManager sharedManager](DAPriorityManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestPriority:forClient:dataclasses:", 0, *p_eventsLockHolder, 20);

    }
    objc_storeStrong((id *)p_eventsLockHolder, a3);
    v5 = v11;
  }

}

- (void)setNotesLockHolder:(id)a3
{
  DADataclassLockWatcher *v5;
  DADataclassLockWatcher *v6;
  DADataclassLockWatcher **p_notesLockHolder;
  DADataclassLockWatcher *notesLockHolder;
  void *v9;
  void *v10;
  DADataclassLockWatcher *v11;

  v5 = (DADataclassLockWatcher *)a3;
  notesLockHolder = self->_notesLockHolder;
  p_notesLockHolder = &self->_notesLockHolder;
  v6 = notesLockHolder;
  if (notesLockHolder != v5)
  {
    v11 = v5;
    if (v5)
    {
      +[DAPriorityManager sharedManager](DAPriorityManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestPriority:forClient:dataclasses:", 1, v11, 32);

      v6 = *p_notesLockHolder;
    }
    if (v6)
    {
      +[DAPriorityManager sharedManager](DAPriorityManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestPriority:forClient:dataclasses:", 0, *p_notesLockHolder, 32);

    }
    objc_storeStrong((id *)p_notesLockHolder, a3);
    v5 = v11;
  }

}

- (BOOL)_canWakenWaiter:(id)a3
{
  id v4;
  char v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "dataclasses");
  v6 = objc_msgSend(v4, "waiterNum");
  v7 = 1;
  if ((v5 & 2) != 0)
  {
    if (self->_contactsLockHolder
      || (-[NSMutableArray objectAtIndexedSubscript:](self->_contactsWaiters, "objectAtIndexedSubscript:", 0),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "waiterNum"),
          v8,
          v9 != v6))
    {
      v7 = 0;
    }
  }
  v10 = v5 & 0x14;
  if ((v5 & 0x14) != 0
    && (self->_eventsLockHolder
     || (-[NSMutableArray objectAtIndexedSubscript:](self->_eventsWaiters, "objectAtIndexedSubscript:", 0),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v11, "waiterNum"),
         v11,
         v12 != v6)))
  {
    v7 = 0;
    v13 = 0;
    if ((v5 & 0x20) == 0)
      goto LABEL_25;
  }
  else if ((v5 & 0x20) == 0)
  {
    if (!v7)
    {
LABEL_15:
      v13 = 0;
      goto LABEL_25;
    }
    v13 = 1;
    goto LABEL_18;
  }
  if (self->_notesLockHolder)
    goto LABEL_15;
  -[NSMutableArray objectAtIndexedSubscript:](self->_notesWaiters, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "waiterNum");

  v13 = 0;
  if (v15 == v6 && v7)
  {
LABEL_18:
    if ((v5 & 2) != 0)
    {
      objc_msgSend(v4, "waiter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DALocalDBGateKeeper setContactsLockHolder:](self, "setContactsLockHolder:", v16);

      -[NSMutableArray removeObjectAtIndex:](self->_contactsWaiters, "removeObjectAtIndex:", 0);
    }
    if (v10)
    {
      objc_msgSend(v4, "waiter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DALocalDBGateKeeper setEventsLockHolder:](self, "setEventsLockHolder:", v17);

      -[NSMutableArray removeObjectAtIndex:](self->_eventsWaiters, "removeObjectAtIndex:", 0);
    }
    if (!v13)
    {
      objc_msgSend(v4, "waiter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DALocalDBGateKeeper setNotesLockHolder:](self, "setNotesLockHolder:", v18);

      -[NSMutableArray removeObjectAtIndex:](self->_notesWaiters, "removeObjectAtIndex:", 0);
    }
    v13 = 1;
  }
LABEL_25:

  return v13;
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
        {
          -[NSMutableSet removeObject:](self->_waiterIDsExpectingContactsLock, "removeObject:", v14);
          -[NSMutableSet removeObject:](self->_waiterIDsExpectingEventsLock, "removeObject:", v14);
          -[NSMutableSet removeObject:](self->_waiterIDsExpectingNotesLock, "removeObject:", v14);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v8);
  }
  v26 = v6;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = v5;
  objc_msgSend(v5, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    v19 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
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
          v23 = objc_msgSend(v21, "dataclasses", v26);
          objc_msgSend(v21, "waiter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v37 = v23;
          v38 = 2112;
          v39 = v24;
          _os_log_impl(&dword_1B51E4000, v22, v19, "Aborting locks for dataclasses %lx to %@", buf, 0x16u);

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
  id v4;
  void *v5;
  DALocalDBGateKeeper *v6;
  NSObject *v7;
  uint64_t v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 3);
  v6 = self;
  objc_sync_enter(v6);
  v22 = v4;
  LODWORD(self) = objc_msgSend(v4, "intValue");
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (int)self;
  v9 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 134217984;
    v28 = v8;
    _os_log_impl(&dword_1B51E4000, v7, v9, "Notifying waiters for dataclasses %ldd", buf, 0xCu);
  }

  if ((v8 & 2) != 0 && !v6->_contactsLockHolder && -[NSMutableArray count](v6->_contactsWaiters, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](v6->_contactsWaiters, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DALocalDBGateKeeper _canWakenWaiter:](v6, "_canWakenWaiter:", v10))
      objc_msgSend(v5, "addObject:", v10);

  }
  if ((v8 & 0x14) != 0 && !v6->_eventsLockHolder && -[NSMutableArray count](v6->_eventsWaiters, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](v6->_eventsWaiters, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DALocalDBGateKeeper _canWakenWaiter:](v6, "_canWakenWaiter:", v11))
      objc_msgSend(v5, "addObject:", v11);

  }
  if ((v8 & 0x20) != 0 && !v6->_notesLockHolder && -[NSMutableArray count](v6->_notesWaiters, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](v6->_notesWaiters, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DALocalDBGateKeeper _canWakenWaiter:](v6, "_canWakenWaiter:", v12))
      objc_msgSend(v5, "addObject:", v12);

  }
  objc_sync_exit(v6);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        DALoggingwithCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, v9))
        {
          v19 = objc_msgSend(v17, "dataclasses");
          objc_msgSend(v17, "waiter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v28 = v19;
          v29 = 2112;
          v30 = v20;
          _os_log_impl(&dword_1B51E4000, v18, v9, "Granting locks for dataclasses %lx to %@", buf, 0x16u);

        }
        objc_msgSend(v17, "completionHandler");
        v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v21[2](v21, objc_msgSend(v17, "dataclasses"), 1);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

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
  _BOOL4 v21;
  void *v22;
  NSMutableArray *contactsWaiters;
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
  v13 = MEMORY[0x1E0D1C448];
  v14 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v12, v14))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_1B51E4000, v12, v14, "registerWaiter %@ forDataclassLocks %lx", buf, 0x16u);
  }

  v15 = self;
  objc_sync_enter(v15);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setCompletionHandler:", v11);
  objc_msgSend(v16, "setWaiter:", v10);
  objc_msgSend(v16, "setDataclasses:", a4);
  v17 = objc_msgSend(MEMORY[0x1E0D1C3E8], "isInHoldingPattern");
  if (v17)
  {
    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_BYTE *)(v13 + 3);
    if (os_log_type_enabled(v18, v19))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v16;
      _os_log_impl(&dword_1B51E4000, v18, v19, "Not allowing waiter %@ to get the gate, as we're in a holding pattern", buf, 0xCu);
    }

    v26 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DALocalDBGateKeeper _abortWaiterForWrappers:](v15, "_abortWaiterForWrappers:", v20);

    goto LABEL_7;
  }
  if ((a4 & 2) == 0)
  {
    if ((a4 & 0x14) == 0)
    {
      if ((a4 & 0x20) == 0)
      {
LABEL_7:
        v21 = 0;
        goto LABEL_8;
      }
      v21 = v15->_notesLockHolder == 0;
      if (!v7)
        goto LABEL_30;
LABEL_21:
      -[NSMutableArray insertObject:atIndex:](v15->_notesWaiters, "insertObject:atIndex:", v16, 0);
      goto LABEL_8;
    }
    v21 = v15->_eventsLockHolder == 0;
    if (!v7)
      goto LABEL_27;
    goto LABEL_18;
  }
  contactsWaiters = v15->_contactsWaiters;
  v21 = v15->_contactsLockHolder == 0;
  if (v7)
  {
    -[NSMutableArray insertObject:atIndex:](contactsWaiters, "insertObject:atIndex:", v16, 0);
    if ((a4 & 0x14) == 0)
    {
LABEL_19:
      if ((a4 & 0x20) == 0)
        goto LABEL_8;
      v21 = v15->_notesLockHolder == 0;
      goto LABEL_21;
    }
    v21 = v15->_eventsLockHolder == 0;
LABEL_18:
    -[NSMutableArray insertObject:atIndex:](v15->_eventsWaiters, "insertObject:atIndex:", v16, 0);
    goto LABEL_19;
  }
  -[NSMutableArray addObject:](contactsWaiters, "addObject:", v16);
  if ((a4 & 0x14) != 0)
  {
    v21 = v15->_eventsLockHolder == 0;
LABEL_27:
    -[NSMutableArray addObject:](v15->_eventsWaiters, "addObject:", v16);
  }
  if ((a4 & 0x20) == 0)
    goto LABEL_8;
  v21 = v15->_notesLockHolder == 0;
LABEL_30:
  -[NSMutableArray addObject:](v15->_notesWaiters, "addObject:", v16);
LABEL_8:

  objc_sync_exit(v15);
  if (((v17 | !v21) & 1) == 0)
  {
    if (v15->_unitTestHackRunLoopMode)
    {
      unitTestHackRunLoopMode = v15->_unitTestHackRunLoopMode;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &unitTestHackRunLoopMode, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DALocalDBGateKeeper _setUnitTestHackRunLoopMode:](v15, "_setUnitTestHackRunLoopMode:", 0);
    }
    else
    {
      runLoopModesToPerformDelayedSelectorsIn();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject da_addNullRunLoopSourceAndPerformSelector:withObject:afterDelay:inModes:](v15, "da_addNullRunLoopSourceAndPerformSelector:withObject:afterDelay:inModes:", sel__notifyWaitersForDataclasses_, v24, v22, 0.0);

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
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 claimedOwnershipOfContacts;
  uint64_t v7;
  DADataclassLockWatcher *contactsLockHolder;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 claimedOwnershipOfEvents;
  uint64_t v13;
  DADataclassLockWatcher *eventsLockHolder;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 claimedOwnershipOfNotes;
  uint64_t v19;
  DADataclassLockWatcher *notesLockHolder;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v25;
  os_log_type_t v26;
  __CFNotificationCenter *v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  _BOOL4 v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  DADataclassLockWatcher *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0D1C448];
  if (!self->_claimedOwnershipOfContacts
    || -[NSMutableArray count](self->_contactsWaiters, "count")
    || self->_contactsLockHolder
    || -[NSMutableSet count](self->_waiterIDsExpectingContactsLock, "count"))
  {
    DALoggingwithCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(v3 + 7);
    if (os_log_type_enabled(v4, v5))
    {
      claimedOwnershipOfContacts = self->_claimedOwnershipOfContacts;
      v7 = -[NSMutableArray count](self->_contactsWaiters, "count");
      contactsLockHolder = self->_contactsLockHolder;
      v9 = -[NSMutableSet count](self->_waiterIDsExpectingContactsLock, "count");
      v30 = 67109888;
      v31 = claimedOwnershipOfContacts;
      v32 = 2048;
      v33 = v7;
      v34 = 2048;
      v35 = contactsLockHolder;
      v36 = 2048;
      v37 = v9;
      _os_log_impl(&dword_1B51E4000, v4, v5, "Not notifying for contacts.  Claimed %d waiters count %lu holder %p expectant waiters %lu", (uint8_t *)&v30, 0x26u);
    }

  }
  else
  {
    DALoggingwithCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_BYTE *)(v3 + 6);
    if (os_log_type_enabled(v22, v23))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1B51E4000, v22, v23, "Letting everyone know we're done with contacts", (uint8_t *)&v30, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0CF6348], 0, 0, 1u);
    self->_claimedOwnershipOfContacts = 0;
  }
  if (!self->_claimedOwnershipOfEvents
    || -[NSMutableArray count](self->_eventsWaiters, "count")
    || self->_eventsLockHolder
    || -[NSMutableSet count](self->_waiterIDsExpectingEventsLock, "count"))
  {
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_BYTE *)(v3 + 7);
    if (os_log_type_enabled(v10, v11))
    {
      claimedOwnershipOfEvents = self->_claimedOwnershipOfEvents;
      v13 = -[NSMutableArray count](self->_eventsWaiters, "count");
      eventsLockHolder = self->_eventsLockHolder;
      v15 = -[NSMutableSet count](self->_waiterIDsExpectingEventsLock, "count");
      v30 = 67109888;
      v31 = claimedOwnershipOfEvents;
      v32 = 2048;
      v33 = v13;
      v34 = 2048;
      v35 = eventsLockHolder;
      v36 = 2048;
      v37 = v15;
      _os_log_impl(&dword_1B51E4000, v10, v11, "Not notifying for events.  Claimed %d waiters count %lu holder %p expectant waiters %lu", (uint8_t *)&v30, 0x26u);
    }

  }
  else
  {
    DALoggingwithCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_BYTE *)(v3 + 6);
    if (os_log_type_enabled(v25, v26))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1B51E4000, v25, v26, "Letting everyone know we're done with events", (uint8_t *)&v30, 2u);
    }

    v27 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v27, (CFNotificationName)*MEMORY[0x1E0D0BF00], 0, 0, 1u);
    self->_claimedOwnershipOfEvents = 0;
  }
  if (!self->_claimedOwnershipOfNotes
    || -[NSMutableArray count](self->_notesWaiters, "count")
    || self->_notesLockHolder
    || -[NSMutableSet count](self->_waiterIDsExpectingNotesLock, "count"))
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_BYTE *)(v3 + 7);
    if (os_log_type_enabled(v16, v17))
    {
      claimedOwnershipOfNotes = self->_claimedOwnershipOfNotes;
      v19 = -[NSMutableArray count](self->_notesWaiters, "count");
      notesLockHolder = self->_notesLockHolder;
      v21 = -[NSMutableSet count](self->_waiterIDsExpectingNotesLock, "count");
      v30 = 67109888;
      v31 = claimedOwnershipOfNotes;
      v32 = 2048;
      v33 = v19;
      v34 = 2048;
      v35 = notesLockHolder;
      v36 = 2048;
      v37 = v21;
      _os_log_impl(&dword_1B51E4000, v16, v17, "Not notifying for notes.  Claimed %d waiters count %lu holder %p expectant waiters %lu", (uint8_t *)&v30, 0x26u);
    }

  }
  else
  {
    DALoggingwithCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_BYTE *)(v3 + 6);
    if (os_log_type_enabled(v28, v29))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1B51E4000, v28, v29, "Letting everyone know we're done with notes", (uint8_t *)&v30, 2u);
    }

    self->_claimedOwnershipOfNotes = 0;
  }
}

- (void)unregisterWaiterForDataclassLocks:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  NSMutableArray *eventsWaiters;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  DALocalDBGateKeeper *v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v4;
    _os_log_impl(&dword_1B51E4000, v5, v6, "unregisterWaiterForDataclassLocks %@", buf, 0xCu);
  }

  v7 = (void *)objc_opt_new();
  v22 = self;
  objc_sync_enter(v22);
  eventsWaiters = v22->_eventsWaiters;
  v30[0] = v22->_contactsWaiters;
  v30[1] = eventsWaiters;
  v30[2] = v22->_notesWaiters;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v24 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
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
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v17 = -[DADataclassLockWatcher isEqual:](v22->_contactsLockHolder, "isEqual:", v4);
  v18 = -[DADataclassLockWatcher isEqual:](v22->_eventsLockHolder, "isEqual:", v4);
  v19 = -[DADataclassLockWatcher isEqual:](v22->_notesLockHolder, "isEqual:", v4);
  v20 = 2;
  if (!v17)
    v20 = 0;
  if (v18)
    v20 |= 0x14uLL;
  if (v19)
    v21 = v20 | 0x20;
  else
    v21 = v20;

  objc_sync_exit(v22);
  if (v21)
    -[DALocalDBGateKeeper relinquishLocksForWaiter:dataclasses:moreComing:](v22, "relinquishLocksForWaiter:dataclasses:moreComing:", v4, v21, 0);
  -[DALocalDBGateKeeper _abortWaiterForWrappers:](v22, "_abortWaiterForWrappers:", v7);
  -[DALocalDBGateKeeper _sendAllClearNotifications](v22, "_sendAllClearNotifications");

}

- (void)relinquishLocksForWaiter:(id)a3 dataclasses:(int64_t)a4 moreComing:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  DALocalDBGateKeeper *v12;
  void *v13;
  NSMutableSet *waiterIDsExpectingContactsLock;
  void *v15;
  void *v16;
  NSMutableSet *waiterIDsExpectingEventsLock;
  void *v18;
  void *v19;
  NSMutableSet *waiterIDsExpectingNotesLock;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  DALoggingwithCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v10, v11))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v9;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_1B51E4000, v10, v11, "relinquishing locks for waiter %@ dataclasses %lx", buf, 0x16u);
  }

  v12 = self;
  objc_sync_enter(v12);
  if ((a4 & 2) != 0)
  {
    if ((-[DADataclassLockWatcher isEqual:](v12->_contactsLockHolder, "isEqual:", v9) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("DALocalDBGateKeeper.m"), 421, CFSTR("Waiter %@ tried to relinquish a lock for data class %ld, but it was held by another waiter: %@"), v9, a4, v12->_contactsLockHolder);

    }
    -[DALocalDBGateKeeper setContactsLockHolder:](v12, "setContactsLockHolder:", 0);
    objc_msgSend(v9, "waiterID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      waiterIDsExpectingContactsLock = v12->_waiterIDsExpectingContactsLock;
      objc_msgSend(v9, "waiterID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[NSMutableSet addObject:](waiterIDsExpectingContactsLock, "addObject:", v15);
      else
        -[NSMutableSet removeObject:](waiterIDsExpectingContactsLock, "removeObject:", v15);

    }
  }
  if ((a4 & 0x14) != 0)
  {
    if ((-[DADataclassLockWatcher isEqual:](v12->_eventsLockHolder, "isEqual:", v9) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("DALocalDBGateKeeper.m"), 434, CFSTR("Waiter %@ tried to relinquish a lock for data class %ld, but it was held by another waiter: %@"), v9, a4, v12->_eventsLockHolder);

    }
    -[DALocalDBGateKeeper setEventsLockHolder:](v12, "setEventsLockHolder:", 0);
    objc_msgSend(v9, "waiterID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      waiterIDsExpectingEventsLock = v12->_waiterIDsExpectingEventsLock;
      objc_msgSend(v9, "waiterID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[NSMutableSet addObject:](waiterIDsExpectingEventsLock, "addObject:", v18);
      else
        -[NSMutableSet removeObject:](waiterIDsExpectingEventsLock, "removeObject:", v18);

    }
  }
  if ((a4 & 0x20) != 0)
  {
    if ((-[DADataclassLockWatcher isEqual:](v12->_notesLockHolder, "isEqual:", v9) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("DALocalDBGateKeeper.m"), 447, CFSTR("Waiter %@ tried to relinquish a lock for data class %ld, but it was held by another waiter: %@"), v9, a4, v12->_notesLockHolder);

    }
    -[DALocalDBGateKeeper setNotesLockHolder:](v12, "setNotesLockHolder:", 0);
    objc_msgSend(v9, "waiterID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      waiterIDsExpectingNotesLock = v12->_waiterIDsExpectingNotesLock;
      objc_msgSend(v9, "waiterID");
      if (v5)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](waiterIDsExpectingNotesLock, "addObject:", v21);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](waiterIDsExpectingNotesLock, "removeObject:", v21);
      }

    }
  }
  objc_sync_exit(v12);

  -[DALocalDBGateKeeper _sendAllClearNotifications](v12, "_sendAllClearNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  runLoopModesToPerformDelayedSelectorsIn();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject da_addNullRunLoopSourceAndPerformSelector:withObject:afterDelay:inModes:](v12, "da_addNullRunLoopSourceAndPerformSelector:withObject:afterDelay:inModes:", sel__notifyWaitersForDataclasses_, v22, v23, 0.0);

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
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1B51E4000, v5, v6, "Claiming ownership of dataclasses 0x%lx", (uint8_t *)&v7, 0xCu);
  }

  if ((a3 & 2) != 0)
  {
    self->_claimedOwnershipOfContacts = 1;
    if ((a3 & 4) == 0)
    {
LABEL_5:
      if ((a3 & 0x20) == 0)
        return;
      goto LABEL_6;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_claimedOwnershipOfEvents = 1;
  if ((a3 & 0x20) == 0)
    return;
LABEL_6:
  self->_claimedOwnershipOfNotes = 1;
}

- (id)stateString
{
  void *v3;
  DALocalDBGateKeeper *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E68CCDC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("_contactsLockHolder %@\n"), v4->_contactsLockHolder);
  objc_msgSend(v3, "appendFormat:", CFSTR("_contactsWaiters %@\n"), v4->_contactsWaiters);
  objc_msgSend(v3, "appendFormat:", CFSTR("_waiterIDsExpectingContactsLock %@\n"), v4->_waiterIDsExpectingContactsLock);
  objc_msgSend(v3, "appendFormat:", CFSTR("_eventsLockHolder %@\n"), v4->_eventsLockHolder);
  objc_msgSend(v3, "appendFormat:", CFSTR("_eventsWaiters %@\n"), v4->_eventsWaiters);
  objc_msgSend(v3, "appendFormat:", CFSTR("_waiterIDsExpectingEventsLock %@\n"), v4->_waiterIDsExpectingEventsLock);
  objc_msgSend(v3, "appendFormat:", CFSTR("_notesLockHolder %@\n"), v4->_notesLockHolder);
  objc_msgSend(v3, "appendFormat:", CFSTR("_notesWaiters %@\n"), v4->_notesWaiters);
  objc_msgSend(v3, "appendFormat:", CFSTR("_waiterIDsExpectingNotesLock %@\n"), v4->_waiterIDsExpectingNotesLock);
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

- (BOOL)claimedOwnershipOfContacts
{
  return self->_claimedOwnershipOfContacts;
}

- (void)setClaimedOwnershipOfContacts:(BOOL)a3
{
  self->_claimedOwnershipOfContacts = a3;
}

- (DADataclassLockWatcher)contactsLockHolder
{
  return self->_contactsLockHolder;
}

- (NSMutableArray)contactsWaiters
{
  return self->_contactsWaiters;
}

- (void)setContactsWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_contactsWaiters, a3);
}

- (NSMutableSet)waiterIDsExpectingContactsLock
{
  return self->_waiterIDsExpectingContactsLock;
}

- (void)setWaiterIDsExpectingContactsLock:(id)a3
{
  objc_storeStrong((id *)&self->_waiterIDsExpectingContactsLock, a3);
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

- (BOOL)claimedOwnershipOfNotes
{
  return self->_claimedOwnershipOfNotes;
}

- (void)setClaimedOwnershipOfNotes:(BOOL)a3
{
  self->_claimedOwnershipOfNotes = a3;
}

- (DADataclassLockWatcher)notesLockHolder
{
  return self->_notesLockHolder;
}

- (NSMutableArray)notesWaiters
{
  return self->_notesWaiters;
}

- (void)setNotesWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_notesWaiters, a3);
}

- (NSMutableSet)waiterIDsExpectingNotesLock
{
  return self->_waiterIDsExpectingNotesLock;
}

- (void)setWaiterIDsExpectingNotesLock:(id)a3
{
  objc_storeStrong((id *)&self->_waiterIDsExpectingNotesLock, a3);
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
  objc_storeStrong((id *)&self->_waiterIDsExpectingNotesLock, 0);
  objc_storeStrong((id *)&self->_notesWaiters, 0);
  objc_storeStrong((id *)&self->_notesLockHolder, 0);
  objc_storeStrong((id *)&self->_waiterIDsExpectingEventsLock, 0);
  objc_storeStrong((id *)&self->_eventsWaiters, 0);
  objc_storeStrong((id *)&self->_eventsLockHolder, 0);
  objc_storeStrong((id *)&self->_waiterIDsExpectingContactsLock, 0);
  objc_storeStrong((id *)&self->_contactsWaiters, 0);
  objc_storeStrong((id *)&self->_contactsLockHolder, 0);
}

@end
