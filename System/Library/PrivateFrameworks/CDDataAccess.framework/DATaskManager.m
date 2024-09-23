@implementation DATaskManager

- (DATaskManager)init
{
  return -[DATaskManager initWithAccount:](self, "initWithAccount:", 0);
}

- (NSArray)allTasks
{
  void *v3;
  DATaskManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableSet *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  -[DATaskManager queuedExclusiveTasks](v4, "queuedExclusiveTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DATaskManager queuedExclusiveTasks](v4, "queuedExclusiveTasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[DATaskManager activeExclusiveTask](v4, "activeExclusiveTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DATaskManager activeExclusiveTask](v4, "activeExclusiveTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[DATaskManager independentTasks](v4, "independentTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v37;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v10);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v4->_heldIndependentTasks;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v14);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = v4->_modalHeldIndependentTasks;
  v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v20++), (_QWORD)v28);
      }
      while (v18 != v20);
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v18);
  }

  -[DATaskManager mQueuedTasks](v4, "mQueuedTasks");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[DATaskManager mQueuedTasks](v4, "mQueuedTasks");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v22);

  }
  -[DATaskManager activeQueuedTask](v4, "activeQueuedTask", (_QWORD)v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[DATaskManager activeQueuedTask](v4, "activeQueuedTask");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v24);

  }
  -[DATaskManager modalHeldActiveQueuedTask](v4, "modalHeldActiveQueuedTask");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[DATaskManager modalHeldActiveQueuedTask](v4, "modalHeldActiveQueuedTask");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

  }
  objc_sync_exit(v4);

  return (NSArray *)v3;
}

- (DATaskManager)initWithAccount:(id)a3
{
  id v4;
  DATaskManager *v5;
  DATaskManager *v6;
  DATaskManager *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DATaskManager;
  v5 = -[DATaskManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_sync_enter(v7);
    -[DATaskManager setAccount:](v7, "setAccount:", v4);
    -[DATaskManager setState:](v7, "setState:", 0);
    objc_sync_exit(v7);

  }
  return v6;
}

- (void)dealloc
{
  DATaskManager *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  DATransaction *transaction;
  NSObject *v8;
  os_log_type_t v9;
  DAActivity *daActivity;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  DATaskManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  if (-[NSMutableArray count](v3->_queuedExclusiveTasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("DATaskManager.m"), 117, CFSTR("There are queued exclusive tasks remaining during dealloc"));

  }
  if (v3->_activeExclusiveTask)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("DATaskManager.m"), 118, CFSTR("There is an active exclusive task remaining during dealloc"));

  }
  if (-[NSMutableSet count](v3->_independentTasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("DATaskManager.m"), 119, CFSTR("There are independent tasks remaining during dealloc"));

  }
  if (-[NSMutableSet count](v3->_heldIndependentTasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("DATaskManager.m"), 120, CFSTR("There are held independent tasks remaining during dealloc"));

  }
  if (-[NSMutableSet count](v3->_modalHeldIndependentTasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("DATaskManager.m"), 121, CFSTR("There are modal-held independent tasks remaining during dealloc"));

  }
  if (-[NSMutableArray count](v3->_mQueuedTasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("DATaskManager.m"), 122, CFSTR("There are queued tasks remaining during dealloc"));

  }
  if (v3->_activeQueuedTask)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("DATaskManager.m"), 123, CFSTR("There is an active queued task remaining during dealloc"));

  }
  if (v3->_modalHeldActiveQueuedTask)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("DATaskManager.m"), 124, CFSTR("There is a modal-held active queued task remaining during dealloc"));

  }
  -[NSTimer invalidate](v3->_managerIdleTimer, "invalidate");
  -[NSTimer invalidate](v3->_userInitiatedSyncTimer, "invalidate");
  -[NSTimer invalidate](v3->_xpcTransactionTimer, "invalidate");
  v4 = MEMORY[0x1E0D03918];
  if (v3->_transaction)
  {
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(v4 + 5);
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_impl(&dword_1C1CD1000, v5, v6, "DATaskManager: Task manager %@ is being deallocated. Ending XPC transaction", buf, 0xCu);
    }

    transaction = v3->_transaction;
    v3->_transaction = 0;

  }
  if (v3->_daActivity)
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(v4 + 5);
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_impl(&dword_1C1CD1000, v8, v9, "DATaskManager: Task manager %@ is being deallocated. Ending XPC activity", buf, 0xCu);
    }

    daActivity = v3->_daActivity;
    v3->_daActivity = 0;

  }
  -[NSTimer invalidate](v3->_powerLogIdleTimer, "invalidate");
  objc_sync_exit(v3);

  v19.receiver = v3;
  v19.super_class = (Class)DATaskManager;
  -[DATaskManager dealloc](&v19, sel_dealloc);
}

- (void)_populateVersionDescriptions
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)_CFCopyServerVersionDictionary();
  if (!v2)
    v2 = (void *)_CFCopySystemVersionDictionary();
  v6 = v2;
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)sVersion;
  sVersion = v4;

}

- (id)_version
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__DATaskManager__version__block_invoke;
  block[3] = &unk_1E7B92278;
  block[4] = self;
  if (_version_onceToken != -1)
    dispatch_once(&_version_onceToken, block);
  return (id)sVersion;
}

uint64_t __25__DATaskManager__version__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_populateVersionDescriptions");
}

- (BOOL)_useFakeDescriptions
{
  return 0;
}

- (id)userAgent
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__DATaskManager_userAgent__block_invoke;
  block[3] = &unk_1E7B92278;
  block[4] = self;
  if (userAgent_onceToken != -1)
    dispatch_once(&userAgent_onceToken, block);
  return (id)userAgent_sUserAgentString;
}

void __26__DATaskManager_userAgent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  DAModelString();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Apple-%@/%@"), v6, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)userAgent_sUserAgentString;
  userAgent_sUserAgentString = v4;

}

- (id)user
{
  void *v2;
  void *v3;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)port
{
  void *v2;
  int64_t v3;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "port");

  return v3;
}

- (id)server
{
  void *v2;
  void *v3;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)password
{
  void *v2;
  void *v3;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "password");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)OAuth2Token
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingAccountInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_6;
  objc_msgSend(v4, "credentialType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8F1A0]))
  {
    objc_msgSend(v4, "credentialType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F1A8]);

    if (v7)
      goto LABEL_5;
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }

LABEL_5:
  objc_msgSend(v4, "oauthToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (BOOL)useSSL
{
  void *v2;
  char v3;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useSSL");

  return v3;
}

- (id)identityPersist
{
  void *v2;
  void *v3;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityPersist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accountID
{
  void *v2;
  void *v3;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accountPersistentUUID
{
  void *v2;
  void *v3;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isShutdown
{
  DATaskManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_state == 5;
  objc_sync_exit(v2);

  return v3;
}

- (void)submitExclusiveTask:(id)a3
{
  -[DATaskManager submitExclusiveTask:toFrontOfQueue:](self, "submitExclusiveTask:toFrontOfQueue:", a3, 0);
}

- (void)submitExclusiveTask:(id)a3 toFrontOfQueue:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  uint64_t v9;
  os_log_type_t v10;
  DATaskManager *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  DATransaction *transaction;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  void *v25;
  DAActivity *v26;
  void *v27;
  uint64_t v28;
  DAActivity *daActivity;
  int v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  int v37;
  id v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0D03918];
  v10 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v8, v10))
  {
    v37 = 138412546;
    v38 = v7;
    v39 = 1024;
    v40 = v4;
    _os_log_impl(&dword_1C1CD1000, v8, v10, "Exclusive task %@ submitted, to front: %d", (uint8_t *)&v37, 0x12u);
  }

  v11 = self;
  objc_sync_enter(v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setTaskManager:", v11);
  if (-[DATaskManager state](v11, "state") == 5)
  {
    objc_msgSend(v7, "cancelTaskWithReason:underlyingError:", 1, 0);
    objc_sync_exit(v11);

    goto LABEL_35;
  }
  -[DATaskManager xpcTransactionTimer](v11, "xpcTransactionTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DATaskManager xpcTransactionTimer](v11, "xpcTransactionTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidate");

    -[DATaskManager setXpcTransactionTimer:](v11, "setXpcTransactionTimer:", 0);
  }
  if (!v11->_transaction)
  {
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_BYTE *)(v9 + 5);
    if (os_log_type_enabled(v14, v15))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1C1CD1000, v14, v15, "DATaskManager: Begin an xpc transaction due to exclusive task", (uint8_t *)&v37, 2u);
    }

    v16 = objc_opt_new();
    transaction = v11->_transaction;
    v11->_transaction = (DATransaction *)v16;

    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, v15))
    {
      -[DATransaction transactionId](v11->_transaction, "transactionId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138412290;
      v38 = v19;
      _os_log_impl(&dword_1C1CD1000, v18, v15, "DATaskManager: DATransaction starting, ID: %@", (uint8_t *)&v37, 0xCu);

    }
  }
  if (!v11->_daActivity)
  {
    -[DATaskManager account](v11, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasXpcActivity");

    if (v21)
    {
      DALoggingwithCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_BYTE *)(v9 + 5);
      if (os_log_type_enabled(v22, v23))
      {
        -[DATaskManager account](v11, "account");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "accountID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412290;
        v38 = v25;
        _os_log_impl(&dword_1C1CD1000, v22, v23, "DATaskManager: Retain an xpc activity due to exclusive task for account %@", (uint8_t *)&v37, 0xCu);

      }
      v26 = [DAActivity alloc];
      -[DATaskManager account](v11, "account");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[DAActivity initWithAccount:](v26, "initWithAccount:", v27);
      daActivity = v11->_daActivity;
      v11->_daActivity = (DAActivity *)v28;

    }
  }
  v30 = -[DATaskManager state](v11, "state");
  if ((v30 - 1) < 4)
  {
    v31 = 0;
    if (v4)
    {
LABEL_22:
      -[DATaskManager queuedExclusiveTasks](v11, "queuedExclusiveTasks");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "insertObject:atIndex:", v7, 0);
LABEL_31:

      goto LABEL_32;
    }
LABEL_30:
    -[DATaskManager queuedExclusiveTasks](v11, "queuedExclusiveTasks");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v7);
    goto LABEL_31;
  }
  if (v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("DATaskManager.m"), 314, CFSTR("Out of bounds state"));

  }
  else
  {
    -[DATaskManager activeQueuedTask](v11, "activeQueuedTask");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {

      goto LABEL_29;
    }
    -[DATaskManager independentTasks](v11, "independentTasks");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count") == 0;

    if (!v36)
    {
LABEL_29:
      v31 = 1;
      if (v4)
        goto LABEL_22;
      goto LABEL_30;
    }
    -[DATaskManager setActiveExclusiveTask:](v11, "setActiveExclusiveTask:", v7);
  }
  -[DATaskManager _schedulePerformTask:](v11, "_schedulePerformTask:", v7);
  v31 = 0;
LABEL_32:
  -[DATaskManager _makeStateTransition](v11, "_makeStateTransition");
  if (v31)
    -[DATaskManager _requestCancelTasksWithReason:](v11, "_requestCancelTasksWithReason:", 0);
  objc_sync_exit(v11);

  -[DATaskManager taskManagerDidAddTask:](v11, "taskManagerDidAddTask:", v7);
LABEL_35:

}

- (void)submitIndependentTask:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  os_log_type_t v8;
  DATaskManager *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  DATransaction *transaction;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  DAActivity *v24;
  void *v25;
  uint64_t v26;
  DAActivity *daActivity;
  int v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0D03918];
  v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v6, v8))
  {
    v31 = 138412290;
    v32 = v5;
    _os_log_impl(&dword_1C1CD1000, v6, v8, "Independent task %@ submitted", (uint8_t *)&v31, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setTaskManager:", v9);
  if (-[DATaskManager state](v9, "state") != 5)
  {
    -[DATaskManager xpcTransactionTimer](v9, "xpcTransactionTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[DATaskManager xpcTransactionTimer](v9, "xpcTransactionTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      -[DATaskManager setXpcTransactionTimer:](v9, "setXpcTransactionTimer:", 0);
    }
    if (!v9->_transaction)
    {
      DALoggingwithCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_BYTE *)(v7 + 5);
      if (os_log_type_enabled(v12, v13))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_1C1CD1000, v12, v13, "DATaskManager: Begin an xpc transaction due to independent task", (uint8_t *)&v31, 2u);
      }

      v14 = objc_opt_new();
      transaction = v9->_transaction;
      v9->_transaction = (DATransaction *)v14;

      DALoggingwithCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, v13))
      {
        -[DATransaction transactionId](v9->_transaction, "transactionId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412290;
        v32 = v17;
        _os_log_impl(&dword_1C1CD1000, v16, v13, "DATaskManager: DATransaction starting, ID: %@", (uint8_t *)&v31, 0xCu);

      }
    }
    if (!v9->_daActivity)
    {
      -[DATaskManager account](v9, "account");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasXpcActivity");

      if (v19)
      {
        DALoggingwithCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_BYTE *)(v7 + 5);
        if (os_log_type_enabled(v20, v21))
        {
          -[DATaskManager account](v9, "account");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "accountID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138412290;
          v32 = v23;
          _os_log_impl(&dword_1C1CD1000, v20, v21, "DATaskManager: Retain an xpc activity due to independent task for account %@", (uint8_t *)&v31, 0xCu);

        }
        v24 = [DAActivity alloc];
        -[DATaskManager account](v9, "account");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[DAActivity initWithAccount:](v24, "initWithAccount:", v25);
        daActivity = v9->_daActivity;
        v9->_daActivity = (DAActivity *)v26;

      }
    }
    v28 = -[DATaskManager state](v9, "state");
    if ((v28 - 1) >= 4)
    {
      if (!v28)
      {
        -[DATaskManager independentTasks](v9, "independentTasks");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v5);

        -[DATaskManager _schedulePerformTask:](v9, "_schedulePerformTask:", v5);
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("DATaskManager.m"), 381, CFSTR("Out of bounds state"));
    }
    else
    {
      -[DATaskManager heldIndependentTasks](v9, "heldIndependentTasks");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v5);
    }

LABEL_23:
    objc_sync_exit(v9);

    -[DATaskManager taskManagerDidAddTask:](v9, "taskManagerDidAddTask:", v5);
    goto LABEL_24;
  }
  objc_msgSend(v5, "cancelTaskWithReason:underlyingError:", 1, 0);
  objc_sync_exit(v9);

LABEL_24:
}

- (void)submitQueuedTask:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  os_log_type_t v8;
  DATaskManager *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  DATransaction *transaction;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  DAActivity *v24;
  void *v25;
  uint64_t v26;
  DAActivity *daActivity;
  int v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0D03918];
  v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v6, v8))
  {
    v32 = 138412290;
    v33 = v5;
    _os_log_impl(&dword_1C1CD1000, v6, v8, "Queued task %@ submitted", (uint8_t *)&v32, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setTaskManager:", v9);
  if (-[DATaskManager state](v9, "state") != 5)
  {
    -[DATaskManager xpcTransactionTimer](v9, "xpcTransactionTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[DATaskManager xpcTransactionTimer](v9, "xpcTransactionTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      -[DATaskManager setXpcTransactionTimer:](v9, "setXpcTransactionTimer:", 0);
    }
    if (!v9->_transaction)
    {
      DALoggingwithCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_BYTE *)(v7 + 5);
      if (os_log_type_enabled(v12, v13))
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_1C1CD1000, v12, v13, "DATaskManager: Begin an xpc transaction due to queued task", (uint8_t *)&v32, 2u);
      }

      v14 = objc_opt_new();
      transaction = v9->_transaction;
      v9->_transaction = (DATransaction *)v14;

      DALoggingwithCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, v13))
      {
        -[DATransaction transactionId](v9->_transaction, "transactionId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412290;
        v33 = v17;
        _os_log_impl(&dword_1C1CD1000, v16, v13, "DATaskManager: DATransaction starting, ID: %@", (uint8_t *)&v32, 0xCu);

      }
    }
    if (!v9->_daActivity)
    {
      -[DATaskManager account](v9, "account");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasXpcActivity");

      if (v19)
      {
        DALoggingwithCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_BYTE *)(v7 + 5);
        if (os_log_type_enabled(v20, v21))
        {
          -[DATaskManager account](v9, "account");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "accountID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138412290;
          v33 = v23;
          _os_log_impl(&dword_1C1CD1000, v20, v21, "DATaskManager: Retain an xpc activity due to queued task for account %@", (uint8_t *)&v32, 0xCu);

        }
        v24 = [DAActivity alloc];
        -[DATaskManager account](v9, "account");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[DAActivity initWithAccount:](v24, "initWithAccount:", v25);
        daActivity = v9->_daActivity;
        v9->_daActivity = (DAActivity *)v26;

      }
    }
    v28 = -[DATaskManager state](v9, "state");
    if ((v28 - 1) >= 4)
    {
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("DATaskManager.m"), 437, CFSTR("Out of bounds state"));
        goto LABEL_22;
      }
      -[DATaskManager activeQueuedTask](v9, "activeQueuedTask");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30 == 0;

      if (v31)
      {
        -[DATaskManager setActiveQueuedTask:](v9, "setActiveQueuedTask:", v5);
        -[DATaskManager _schedulePerformTask:](v9, "_schedulePerformTask:", v5);
        goto LABEL_23;
      }
    }
    -[DATaskManager mQueuedTasks](v9, "mQueuedTasks");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v5);
LABEL_22:

LABEL_23:
    objc_sync_exit(v9);

    -[DATaskManager taskManagerDidAddTask:](v9, "taskManagerDidAddTask:", v5);
    goto LABEL_24;
  }
  objc_msgSend(v5, "cancelTaskWithReason:underlyingError:", 1, 0);
  objc_sync_exit(v9);

LABEL_24:
}

- (void)cancelTask:(id)a3 withUnderlyingError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1C1CD1000, v7, v8, "Task %@ aborted", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v5, "cancelTaskWithReason:underlyingError:", 0, v6);
}

- (void)cancelTask:(id)a3
{
  -[DATaskManager cancelTask:withUnderlyingError:](self, "cancelTask:withUnderlyingError:", a3, 0);
}

- (void)cancelAllTasks
{
  void *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[DATaskManager allTasks](self, "allTasks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[DATaskManager cancelTask:](self, "cancelTask:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)shutdown
{
  NSObject *v3;
  uint64_t v4;
  os_log_type_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  DATaskManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  DATransaction *transaction;
  NSObject *v19;
  os_log_type_t v20;
  DAActivity *daActivity;
  void *v22;
  void *v23;
  int v24;
  DATaskManager *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0D03918];
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v3, v5))
  {
    -[DATaskManager account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134218240;
    v25 = self;
    v26 = 2048;
    v27 = v6;
    _os_log_impl(&dword_1C1CD1000, v3, v5, "Task Manager %p shutting down with account at %p", (uint8_t *)&v24, 0x16u);

  }
  -[DATaskManager setAccount:](self, "setAccount:", 0);
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, v5))
  {
    -[DATaskManager stateString](self, "stateString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134218242;
    v25 = self;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1C1CD1000, v7, v5, "Task Manager %p shutting down with state %@", (uint8_t *)&v24, 0x16u);

  }
  if (-[DATaskManager state](self, "state") != 5)
  {
    v9 = self;
    objc_sync_enter(v9);
    -[DATaskManager setState:](v9, "setState:", 5);
    -[DATaskManager managerIdleTimer](v9, "managerIdleTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[DATaskManager managerIdleTimer](v9, "managerIdleTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidate");

      -[DATaskManager setManagerIdleTimer:](v9, "setManagerIdleTimer:", 0);
    }
    -[DATaskManager userInitiatedSyncTimer](v9, "userInitiatedSyncTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[DATaskManager userInitiatedSyncTimer](v9, "userInitiatedSyncTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "invalidate");

      -[DATaskManager setUserInitiatedSyncTimer:](v9, "setUserInitiatedSyncTimer:", 0);
    }
    -[DATaskManager xpcTransactionTimer](v9, "xpcTransactionTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[DATaskManager xpcTransactionTimer](v9, "xpcTransactionTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "invalidate");

      -[DATaskManager setXpcTransactionTimer:](v9, "setXpcTransactionTimer:", 0);
    }
    if (v9->_transaction)
    {
      DALoggingwithCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_BYTE *)(v4 + 5);
      if (os_log_type_enabled(v16, v17))
      {
        v24 = 138412290;
        v25 = v9;
        _os_log_impl(&dword_1C1CD1000, v16, v17, "DATaskManager: Task manager %@ is being shut down. Ending XPC transaction", (uint8_t *)&v24, 0xCu);
      }

      transaction = v9->_transaction;
      v9->_transaction = 0;

    }
    if (v9->_daActivity)
    {
      DALoggingwithCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_BYTE *)(v4 + 5);
      if (os_log_type_enabled(v19, v20))
      {
        v24 = 138412290;
        v25 = v9;
        _os_log_impl(&dword_1C1CD1000, v19, v20, "DATaskManager: Task manager %@ is being shut down. Releasing XPC activity", (uint8_t *)&v24, 0xCu);
      }

      daActivity = v9->_daActivity;
      v9->_daActivity = 0;

    }
    -[DATaskManager powerLogIdleTimer](v9, "powerLogIdleTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[DATaskManager powerLogIdleTimer](v9, "powerLogIdleTimer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "invalidate");

      -[DATaskManager setPowerLogIdleTimer:](v9, "setPowerLogIdleTimer:", 0);
    }
    objc_sync_exit(v9);

    -[DATaskManager _cancelTasksWithReason:](v9, "_cancelTasksWithReason:", 1);
  }
}

- (void)cancelTasksDueToOnPowerMode
{
  -[DATaskManager _cancelTasksWithReason:](self, "_cancelTasksWithReason:", 2);
}

- (id)stateString
{
  DATaskManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  getStateName(-[DATaskManager state](v2, "state"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager activeExclusiveTask](v2, "activeExclusiveTask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager queuedExclusiveTasks](v2, "queuedExclusiveTasks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager independentTasks](v2, "independentTasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager heldIndependentTasks](v2, "heldIndependentTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager modalHeldIndependentTasks](v2, "modalHeldIndependentTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager activeQueuedTask](v2, "activeQueuedTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager mQueuedTasks](v2, "mQueuedTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager activeModalTask](v2, "activeModalTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager queuedModalTasks](v2, "queuedModalTasks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DATaskManager account](v2, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DATaskManager %@ state:%@\nActive exclusive task: %@\nQueued exclusive tasks: %@\nIndependent tasks: %@\nHeld independent tasks: %@\nModal-held independent tasks: %@\nActive queued task: %@\nQueued tasks: %@\nActive modal task: %@\nQueued modal tasks: %@\nAssociated with account: %@\n"), v2, v16, v15, v14, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v12;
}

- (void)_useOpportunisticSocketsAgain
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  int v6;
  DATaskManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[DATaskManager state](self, "state") != 5)
  {
    DALoggingwithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
    if (os_log_type_enabled(v3, v4))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1C1CD1000, v3, v4, "Task manager %@ has finally drained its queue. Turning opportunistic socket support back on", (uint8_t *)&v6, 0xCu);
    }

    -[DATaskManager account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShouldUseOpportunisticSockets:", 1);

  }
}

- (id)_powerLogInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  -[DATaskManager account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DATaskManager account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("AccountID"));

  }
  -[DATaskManager account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DATaskManager account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("AccountName"));

  }
  -[DATaskManager account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();

  if (v13)
  {
    -[DATaskManager account](self, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("AccountClass"));

  }
  return v3;
}

- (void)_clearUserInitiatedSyncTimer
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  int v6;
  DATaskManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[DATaskManager state](self, "state") != 5)
  {
    DALoggingwithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
    if (os_log_type_enabled(v3, v4))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1C1CD1000, v3, v4, "Task manager %@ has finally drained its queue. Clearing its user initiated sync state", (uint8_t *)&v6, 0xCu);
    }

    -[DATaskManager account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWasUserInitiated:", 0);

  }
}

- (void)_endXpcTransaction
{
  NSObject *v3;
  uint64_t v4;
  os_log_type_t v5;
  DAActivity *v6;
  DATransaction *transaction;
  NSObject *v8;
  DAActivity *daActivity;
  DAActivity *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  int v14;
  DATaskManager *v15;
  __int16 v16;
  DAActivity *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0D03918];
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 5);
  if (os_log_type_enabled(v3, v5))
  {
    -[DATransaction transactionId](self->_transaction, "transactionId");
    v6 = (DAActivity *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1C1CD1000, v3, v5, "DATaskManager: Task manager %@ has finally drained its queue. Ending XPC transaction %@", (uint8_t *)&v14, 0x16u);

  }
  transaction = self->_transaction;
  self->_transaction = 0;

  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, v5))
  {
    daActivity = self->_daActivity;
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = daActivity;
    _os_log_impl(&dword_1C1CD1000, v8, v5, "DATaskManager: Task manager %@ has finally drained its queue. Releasing XPC activity %@", (uint8_t *)&v14, 0x16u);
  }

  v10 = self->_daActivity;
  self->_daActivity = 0;

  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_BYTE *)(v4 + 6);
  if (os_log_type_enabled(v11, v12))
  {
    v14 = 138412290;
    v15 = self;
    _os_log_impl(&dword_1C1CD1000, v11, v12, "Task manager %@ has finally drained its queue. Reset automatic fetching state", (uint8_t *)&v14, 0xCu);
  }

  -[DATaskManager account](self, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "saveFetchingAutomaticallyState:", 0);

}

- (void)_logSyncEnd
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  -[DATaskManager _powerLogInfoDictionary](self, "_powerLogInfoDictionary");
  v3[0] = CFSTR("AccountName");
  v3[1] = CFSTR("AccountClass");
  v3[2] = CFSTR("AccountID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  PLLogRegisteredEvent();
  self->_didLogSyncStart = 0;
}

- (BOOL)_taskForcesNetworking:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v3, "shouldForceNetworking");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_taskInQueueForcesNetworkConnection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[DATaskManager _taskForcesNetworking:](self, "_taskForcesNetworking:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_hasTasksForcingNetworkConnection
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  void *v22;
  BOOL v23;
  void *v25;
  BOOL v26;

  -[DATaskManager queuedExclusiveTasks](self, "queuedExclusiveTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DATaskManager _taskInQueueForcesNetworkConnection:](self, "_taskInQueueForcesNetworkConnection:", v3);

  if (v4)
    return 1;
  -[DATaskManager independentTasks](self, "independentTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DATaskManager _taskInQueueForcesNetworkConnection:](self, "_taskInQueueForcesNetworkConnection:", v6);

  if (v7)
    return 1;
  -[DATaskManager heldIndependentTasks](self, "heldIndependentTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DATaskManager _taskInQueueForcesNetworkConnection:](self, "_taskInQueueForcesNetworkConnection:", v9);

  if (v10)
    return 1;
  -[DATaskManager modalHeldIndependentTasks](self, "modalHeldIndependentTasks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[DATaskManager _taskInQueueForcesNetworkConnection:](self, "_taskInQueueForcesNetworkConnection:", v12);

  if (v13)
    return 1;
  -[DATaskManager mQueuedTasks](self, "mQueuedTasks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[DATaskManager _taskInQueueForcesNetworkConnection:](self, "_taskInQueueForcesNetworkConnection:", v14);

  if (v15)
    return 1;
  -[DATaskManager queuedModalTasks](self, "queuedModalTasks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[DATaskManager _taskInQueueForcesNetworkConnection:](self, "_taskInQueueForcesNetworkConnection:", v16);

  if (v17)
    return 1;
  -[DATaskManager activeModalTask](self, "activeModalTask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[DATaskManager _taskForcesNetworking:](self, "_taskForcesNetworking:", v18);

  if (v19)
    return 1;
  -[DATaskManager activeQueuedTask](self, "activeQueuedTask");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[DATaskManager _taskForcesNetworking:](self, "_taskForcesNetworking:", v20);

  if (v21)
    return 1;
  -[DATaskManager modalHeldActiveQueuedTask](self, "modalHeldActiveQueuedTask");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[DATaskManager _taskForcesNetworking:](self, "_taskForcesNetworking:", v22);

  if (v23)
    return 1;
  -[DATaskManager activeModalTask](self, "activeModalTask");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[DATaskManager _taskForcesNetworking:](self, "_taskForcesNetworking:", v25);

  return v26;
}

- (BOOL)_hasTasksIndicatingARunningSync
{
  void *v2;
  BOOL v3;

  -[DATaskManager allTasks](self, "allTasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)taskDidFinish:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  DATaskManager *v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  BOOL v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  BOOL v81;
  id v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t k;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t m;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  _BOOL4 v120;
  void *v121;
  int v122;
  os_log_type_t v123;
  void *v124;
  void *v125;
  os_log_type_t type;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[4];
  id v148;
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0D03918];
  type = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v6, type))
  {
    *(_DWORD *)buf = 138412290;
    v148 = v5;
    _os_log_impl(&dword_1C1CD1000, v6, type, "Task %@ finished.", buf, 0xCu);
  }

  if (-[DATaskManager state](self, "state") != 5)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[DATaskManager activeExclusiveTask](v8, "activeExclusiveTask");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v5)
    {
      -[DATaskManager setActiveExclusiveTask:](v8, "setActiveExclusiveTask:", 0);
    }
    else
    {
      -[DATaskManager activeQueuedTask](v8, "activeQueuedTask");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v10 == v5;

      if (v11)
      {
        -[DATaskManager setActiveQueuedTask:](v8, "setActiveQueuedTask:", 0);
      }
      else
      {
        -[DATaskManager modalHeldActiveQueuedTask](v8, "modalHeldActiveQueuedTask");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v12 == v5;

        if (v13)
        {
          -[DATaskManager setModalHeldActiveQueuedTask:](v8, "setModalHeldActiveQueuedTask:", 0);
        }
        else
        {
          -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v5);

          if (v15)
          {
            -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "removeObject:", v5);
          }
          else
          {
            -[DATaskManager independentTasks](v8, "independentTasks");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "containsObject:", v5);

            if (v18)
            {
              -[DATaskManager independentTasks](v8, "independentTasks");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "removeObject:", v5);
            }
            else
            {
              -[DATaskManager heldIndependentTasks](v8, "heldIndependentTasks");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "containsObject:", v5);

              if (v20)
              {
                -[DATaskManager heldIndependentTasks](v8, "heldIndependentTasks");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "removeObject:", v5);
              }
              else
              {
                -[DATaskManager modalHeldIndependentTasks](v8, "modalHeldIndependentTasks");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "containsObject:", v5);

                if (v22)
                {
                  -[DATaskManager modalHeldIndependentTasks](v8, "modalHeldIndependentTasks");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "removeObject:", v5);
                }
                else
                {
                  -[DATaskManager mQueuedTasks](v8, "mQueuedTasks");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "containsObject:", v5);

                  if (!v24)
                  {
                    -[DATaskManager activeModalTask](v8, "activeModalTask");
                    v119 = (id)objc_claimAutoreleasedReturnValue();
                    v120 = v119 == v5;

                    if (v120)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                      v124 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v124, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("DATaskManager.m"), 676, CFSTR("Finished task is not being managed, so cannot be active modal task."));

                    }
                    -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    v122 = objc_msgSend(v121, "containsObject:", v5);

                    if (v122)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                      v125 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v125, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("DATaskManager.m"), 678, CFSTR("Finished task is not being managed, so cannot be in modal queue."));

                    }
                    DALoggingwithCategory();
                    v111 = objc_claimAutoreleasedReturnValue();
                    v123 = *(_BYTE *)(v7 + 6);
                    if (os_log_type_enabled(v111, v123))
                    {
                      *(_DWORD *)buf = 138412290;
                      v148 = v5;
                      _os_log_impl(&dword_1C1CD1000, v111, v123, "Early return because task %@ isn't in our collection", buf, 0xCu);
                    }
                    goto LABEL_111;
                  }
                  -[DATaskManager mQueuedTasks](v8, "mQueuedTasks");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "removeObject:", v5);
                }
              }
            }
          }

        }
      }
    }
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v8, sel__performTask_, v5);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v8, sel__startModal_, v5);
    -[DATaskManager taskManagerWillRemoveTask:](v8, "taskManagerWillRemoveTask:", v5);
    -[DATaskManager _releasePowerAssertionForTask:](v8, "_releasePowerAssertionForTask:", v5);
    -[DATaskManager activeModalTask](v8, "activeModalTask");
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (v25 == v5)
    {
      -[DATaskManager setActiveModalTask:](v8, "setActiveModalTask:", 0);
    }
    else
    {
      -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "containsObject:", v5);

      if (v27)
      {
        -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeObject:", v5);

        v29 = 1;
        goto LABEL_27;
      }
    }
    v29 = 0;
LABEL_27:
    switch(-[DATaskManager state](v8, "state"))
    {
      case 0:
        -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "count"))
          goto LABEL_59;
        -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
        {

          goto LABEL_59;
        }
        -[DATaskManager activeQueuedTask](v8, "activeQueuedTask");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53 == 0;

        if (v54)
        {
          -[DATaskManager mQueuedTasks](v8, "mQueuedTasks");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "count");

          if (v56)
          {
            -[DATaskManager mQueuedTasks](v8, "mQueuedTasks");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[DATaskManager setActiveQueuedTask:](v8, "setActiveQueuedTask:", v58);

            -[DATaskManager mQueuedTasks](v8, "mQueuedTasks");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "removeObjectAtIndex:", 0);

            -[DATaskManager activeQueuedTask](v8, "activeQueuedTask");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[DATaskManager _schedulePerformTask:](v8, "_schedulePerformTask:", v30);
            goto LABEL_59;
          }
        }
        goto LABEL_60;
      case 1:
        -[DATaskManager activeQueuedTask](v8, "activeQueuedTask");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {

LABEL_47:
          -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v45, "count") == 0;

          goto LABEL_48;
        }
        -[DATaskManager independentTasks](v8, "independentTasks");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count") == 0;

        if (!v44)
          goto LABEL_47;
        -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "count");

        if (v61)
        {
LABEL_58:
          -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[DATaskManager setActiveExclusiveTask:](v8, "setActiveExclusiveTask:", v63);

          -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "removeObjectAtIndex:", 0);

          -[DATaskManager activeExclusiveTask](v8, "activeExclusiveTask");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[DATaskManager _schedulePerformTask:](v8, "_schedulePerformTask:", v30);
LABEL_59:

        }
LABEL_60:
        -[DATaskManager _makeStateTransition](v8, "_makeStateTransition");
        -[DATaskManager managerIdleTimer](v8, "managerIdleTimer");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        if (v65)
        {
          -[DATaskManager managerIdleTimer](v8, "managerIdleTimer");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "invalidate");

          -[DATaskManager setManagerIdleTimer:](v8, "setManagerIdleTimer:", 0);
        }
        -[DATaskManager account](v8, "account");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v67, "shouldUseOpportunisticSockets") & 1) != 0)
          goto LABEL_71;
        v68 = -[DATaskManager _hasTasksForcingNetworkConnection](v8, "_hasTasksForcingNetworkConnection");

        if (!v68)
        {
          v69 = objc_alloc(MEMORY[0x1E0C99E88]);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = (void *)objc_msgSend(v69, "initWithFireDate:interval:target:selector:userInfo:repeats:", v70, v8, sel__useOpportunisticSocketsAgain, 0, 0, 0.0);
          -[DATaskManager setManagerIdleTimer:](v8, "setManagerIdleTimer:", v71);

          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          runLoopModesToPerformDelayedSelectorsIn();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v139, v146, 16);
          if (v72)
          {
            v73 = *(_QWORD *)v140;
            do
            {
              for (i = 0; i != v72; ++i)
              {
                if (*(_QWORD *)v140 != v73)
                  objc_enumerationMutation(v67);
                v75 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                -[DATaskManager managerIdleTimer](v8, "managerIdleTimer");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "addTimer:forMode:", v77, v75);

              }
              v72 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v139, v146, 16);
            }
            while (v72);
          }
LABEL_71:

        }
        -[DATaskManager userInitiatedSyncTimer](v8, "userInitiatedSyncTimer");
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (v78)
        {
          -[DATaskManager userInitiatedSyncTimer](v8, "userInitiatedSyncTimer");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "invalidate");

          -[DATaskManager setUserInitiatedSyncTimer:](v8, "setUserInitiatedSyncTimer:", 0);
        }
        -[DATaskManager account](v8, "account");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v80, "wasUserInitiated"))
          goto LABEL_83;
        v81 = -[DATaskManager _hasTasksIndicatingARunningSync](v8, "_hasTasksIndicatingARunningSync");

        if (!v81)
        {
          v82 = objc_alloc(MEMORY[0x1E0C99E88]);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = (void *)objc_msgSend(v82, "initWithFireDate:interval:target:selector:userInfo:repeats:", v83, v8, sel__clearUserInitiatedSyncTimer, 0, 0, 0.0);
          -[DATaskManager setUserInitiatedSyncTimer:](v8, "setUserInitiatedSyncTimer:", v84);

          v137 = 0u;
          v138 = 0u;
          v135 = 0u;
          v136 = 0u;
          runLoopModesToPerformDelayedSelectorsIn();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
          if (v85)
          {
            v86 = *(_QWORD *)v136;
            do
            {
              for (j = 0; j != v85; ++j)
              {
                if (*(_QWORD *)v136 != v86)
                  objc_enumerationMutation(v80);
                v88 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * j);
                objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                -[DATaskManager userInitiatedSyncTimer](v8, "userInitiatedSyncTimer");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "addTimer:forMode:", v90, v88);

              }
              v85 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
            }
            while (v85);
          }
LABEL_83:

        }
        -[DATaskManager xpcTransactionTimer](v8, "xpcTransactionTimer");
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        if (v91)
        {
          -[DATaskManager xpcTransactionTimer](v8, "xpcTransactionTimer");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "invalidate");

          -[DATaskManager setXpcTransactionTimer:](v8, "setXpcTransactionTimer:", 0);
        }
        if (!-[DATaskManager _hasTasksIndicatingARunningSync](v8, "_hasTasksIndicatingARunningSync"))
        {
          DALoggingwithCategory();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, type))
          {
            -[DATaskManager account](v8, "account");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "accountDescription");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v148 = v95;
            _os_log_impl(&dword_1C1CD1000, v93, type, "Pending tasks are finished for account %@", buf, 0xCu);

          }
          v96 = objc_alloc(MEMORY[0x1E0C99E88]);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = (void *)objc_msgSend(v96, "initWithFireDate:interval:target:selector:userInfo:repeats:", v97, v8, sel__endXpcTransaction, 0, 0, 0.0);
          -[DATaskManager setXpcTransactionTimer:](v8, "setXpcTransactionTimer:", v98);

          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          runLoopModesToPerformDelayedSelectorsIn();
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v131, v144, 16);
          if (v100)
          {
            v101 = *(_QWORD *)v132;
            do
            {
              for (k = 0; k != v100; ++k)
              {
                if (*(_QWORD *)v132 != v101)
                  objc_enumerationMutation(v99);
                v103 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * k);
                objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                -[DATaskManager xpcTransactionTimer](v8, "xpcTransactionTimer");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "addTimer:forMode:", v105, v103);

              }
              v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v131, v144, 16);
            }
            while (v100);
          }

        }
        -[DATaskManager powerLogIdleTimer](v8, "powerLogIdleTimer");
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        if (v106)
        {
          -[DATaskManager powerLogIdleTimer](v8, "powerLogIdleTimer");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "invalidate");

          -[DATaskManager setPowerLogIdleTimer:](v8, "setPowerLogIdleTimer:", 0);
        }
        if (-[DATaskManager _hasTasksIndicatingARunningSync](v8, "_hasTasksIndicatingARunningSync")
          || !-[DATaskManager didLogSyncStart](v8, "didLogSyncStart")
          || !PLShouldLogRegisteredEvent())
        {
          goto LABEL_112;
        }
        v108 = objc_alloc(MEMORY[0x1E0C99E88]);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = (void *)objc_msgSend(v108, "initWithFireDate:interval:target:selector:userInfo:repeats:", v109, v8, sel__logSyncEnd, 0, 0, 0.0);
        -[DATaskManager setPowerLogIdleTimer:](v8, "setPowerLogIdleTimer:", v110);

        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        runLoopModesToPerformDelayedSelectorsIn();
        v111 = objc_claimAutoreleasedReturnValue();
        v112 = -[NSObject countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v127, v143, 16);
        if (v112)
        {
          v113 = *(_QWORD *)v128;
          do
          {
            for (m = 0; m != v112; ++m)
            {
              if (*(_QWORD *)v128 != v113)
                objc_enumerationMutation(v111);
              v115 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * m);
              -[DATaskManager powerLogIdleTimer](v8, "powerLogIdleTimer");
              v116 = (void *)objc_claimAutoreleasedReturnValue();

              if (v116)
              {
                objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                -[DATaskManager powerLogIdleTimer](v8, "powerLogIdleTimer");
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "addTimer:forMode:", v118, v115);

              }
            }
            v112 = -[NSObject countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v127, v143, 16);
          }
          while (v112);
        }
        break;
      case 2:
        if (v9 != v5)
          goto LABEL_60;
        -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        if (v36)
          goto LABEL_58;
        -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "count");

        if (v49)
          goto LABEL_53;
        goto LABEL_49;
      case 3:
        if (v29)
        {
          -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count") == 0;

LABEL_48:
          if (v38)
LABEL_49:
            -[DATaskManager _reactivateHeldTasks](v8, "_reactivateHeldTasks");
        }
        else
        {
          -[DATaskManager activeQueuedTask](v8, "activeQueuedTask");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            goto LABEL_59;
          -[DATaskManager independentTasks](v8, "independentTasks");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count") == 0;

          if (v40)
          {
            -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "count");

            if (v42)
            {
LABEL_53:
              -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[DATaskManager setActiveModalTask:](v8, "setActiveModalTask:", v51);

              -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "removeObjectAtIndex:", 0);

              -[DATaskManager activeModalTask](v8, "activeModalTask");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[DATaskManager _scheduleStartModal:](v8, "_scheduleStartModal:", v30);
              goto LABEL_59;
            }
          }
        }
        goto LABEL_60;
      case 4:
        if (v25 != v5)
          goto LABEL_60;
        -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count");

        if (v33)
          goto LABEL_53;
        -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "count");

        if (v47)
          goto LABEL_58;
        goto LABEL_49;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("DATaskManager.m"), 771, CFSTR("Out of bounds state"));
        goto LABEL_59;
    }
LABEL_111:

LABEL_112:
    objc_sync_exit(v8);

    goto LABEL_113;
  }
  -[DATaskManager taskManagerWillRemoveTask:](self, "taskManagerWillRemoveTask:", v5);
  -[DATaskManager _releasePowerAssertionForTask:](self, "_releasePowerAssertionForTask:", v5);
LABEL_113:

}

- (void)taskRequestModal:(id)a3
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  DATaskManager *v9;
  int v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 830, CFSTR("A nil task requested modal?"));

  }
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v6, v7))
  {
    v38 = 138412290;
    v39 = v5;
    _os_log_impl(&dword_1C1CD1000, v6, v7, "Task %@ requesting modal", (uint8_t *)&v38, 0xCu);
  }

  if (-[DATaskManager state](self, "state") == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 836, CFSTR("Cannot request modal behavior during shutdown"));

    goto LABEL_27;
  }
  v9 = self;
  objc_sync_enter(v9);
  v10 = 1;
  v11 = 1;
  switch(-[DATaskManager state](v9, "state"))
  {
    case 0:
      -[DATaskManager activeQueuedTask](v9, "activeQueuedTask");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 == v5)
      {
        -[DATaskManager independentTasks](v9, "independentTasks");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count") == 0;

        if (v31)
          goto LABEL_13;
      }
      else
      {

      }
      -[DATaskManager activeQueuedTask](v9, "activeQueuedTask");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {

      }
      else
      {
        -[DATaskManager independentTasks](v9, "independentTasks");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "count") == 1)
        {
          -[DATaskManager independentTasks](v9, "independentTasks");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "containsObject:", v5);

          v10 = v35 ^ 1;
          v11 = v35 ^ 1;
        }
        else
        {

        }
      }
      goto LABEL_15;
    case 1:
      goto LABEL_15;
    case 2:
      -[DATaskManager activeExclusiveTask](v9, "activeExclusiveTask");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v14 == v5;

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("DATaskManager.m"), 863, CFSTR("Only the active exclusive task can go modal immediately"));

      }
      goto LABEL_13;
    case 3:
    case 4:
      goto LABEL_14;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("DATaskManager.m"), 873, CFSTR("Out of bounds state."));

LABEL_13:
      v10 = 0;
LABEL_14:
      v11 = 0;
LABEL_15:
      -[DATaskManager activeQueuedTask](v9, "activeQueuedTask");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v16 == v5;

      if (v17)
      {
        -[DATaskManager activeQueuedTask](v9, "activeQueuedTask");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DATaskManager setModalHeldActiveQueuedTask:](v9, "setModalHeldActiveQueuedTask:", v22);

        -[DATaskManager setActiveQueuedTask:](v9, "setActiveQueuedTask:", 0);
      }
      else
      {
        -[DATaskManager independentTasks](v9, "independentTasks");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsObject:", v5);

        if (v19)
        {
          -[DATaskManager modalHeldIndependentTasks](v9, "modalHeldIndependentTasks");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v5);

          -[DATaskManager independentTasks](v9, "independentTasks");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "removeObject:", v5);

        }
      }
      if (v10)
      {
        if (v5)
        {
          -[DATaskManager queuedModalTasks](v9, "queuedModalTasks");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v5);

        }
        -[DATaskManager independentTasks](v9, "independentTasks");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
          goto LABEL_23;
        -[DATaskManager activeQueuedTask](v9, "activeQueuedTask");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25 == 0;

        if (v26)
        {
          -[DATaskManager queuedModalTasks](v9, "queuedModalTasks");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[DATaskManager setActiveModalTask:](v9, "setActiveModalTask:", v28);

          -[DATaskManager queuedModalTasks](v9, "queuedModalTasks");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "removeObjectAtIndex:", 0);

          -[DATaskManager activeModalTask](v9, "activeModalTask");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[DATaskManager _scheduleStartModal:](v9, "_scheduleStartModal:", v24);
LABEL_23:

        }
      }
      else
      {
        -[DATaskManager setActiveModalTask:](v9, "setActiveModalTask:", v5);
        -[DATaskManager _scheduleStartModal:](v9, "_scheduleStartModal:", v5);
      }
      -[DATaskManager _makeStateTransition](v9, "_makeStateTransition");
      objc_sync_exit(v9);

      if (v11)
        -[DATaskManager _requestCancelTasksWithReason:](v9, "_requestCancelTasksWithReason:", 1);
LABEL_27:

      return;
  }
}

- (void)taskEndModal:(id)a3
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  DATaskManager *v8;
  id v9;
  BOOL v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v6, v7))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1C1CD1000, v6, v7, "Task %@ ending modal", buf, 0xCu);
  }

  if (-[DATaskManager state](self, "state") != 5)
  {
    if (-[DATaskManager state](self, "state") == 4)
    {
      v8 = self;
      objc_sync_enter(v8);
      -[DATaskManager activeModalTask](v8, "activeModalTask");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9 == v5;

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("DATaskManager.m"), 923, CFSTR("Only the active modal task can end modal behavior."));

      }
      -[DATaskManager setActiveModalTask:](v8, "setActiveModalTask:", 0);
      -[DATaskManager queuedModalTasks](v8, "queuedModalTasks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") == 0;

      if (v12)
      {
        -[DATaskManager activeExclusiveTask](v8, "activeExclusiveTask");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          -[DATaskManager queuedExclusiveTasks](v8, "queuedExclusiveTasks");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          if (!v15)
            -[DATaskManager _reactivateHeldTasks](v8, "_reactivateHeldTasks");
        }
      }
      -[DATaskManager _makeStateTransition](v8, "_makeStateTransition");
      objc_sync_exit(v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (DATaskManager *)objc_claimAutoreleasedReturnValue();
      -[DATaskManager handleFailureInMethod:object:file:lineNumber:description:](v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 918, CFSTR("taskEndModal can only be called in Run Modal state, not %d"), -[DATaskManager state](self, "state"));
    }

  }
}

- (BOOL)taskIsModal:(id)a3
{
  id v4;
  DATaskManager *v5;
  void *v6;
  BOOL v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[DATaskManager modalHeldIndependentTasks](v5, "modalHeldIndependentTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[DATaskManager modalHeldActiveQueuedTask](v5, "modalHeldActiveQueuedTask");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v4)
    {
      v7 = 1;
    }
    else
    {
      -[DATaskManager activeModalTask](v5, "activeModalTask");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v9 == v4;

    }
  }

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)shouldCancelTaskDueToOnPowerFetchMode
{
  void *v2;
  char v3;

  -[DATaskManager account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCancelTaskDueToOnPowerFetchMode");

  return v3;
}

- (void)_performTask:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  objc_class *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  objc_class *v13;
  void *v14;
  int v15;
  _QWORD v16[3];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[DATaskManager isShutdown](self, "isShutdown"))
  {
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1C1CD1000, v5, v6, "The _performTask is invoked after taskManager has been shutdown. Canceling %{public}@ %@", buf, 0x16u);

    }
    objc_msgSend(v4, "cancelTaskWithReason:underlyingError:", 1, 0);
  }
  else
  {
    v9 = -[DATaskManager shouldCancelTaskDueToOnPowerFetchMode](self, "shouldCancelTaskDueToOnPowerFetchMode");
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
      if (os_log_type_enabled(v10, v12))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v14;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_1C1CD1000, v11, v12, "The device is in on-power fetch mode, but is no longer on power or on wifi. Canceling %{public}@ %@", buf, 0x16u);

      }
      objc_msgSend(v4, "cancelTaskWithReason:underlyingError:", 2, 0);
      -[DATaskManager cancelTasksDueToOnPowerMode](self, "cancelTasksDueToOnPowerMode");
    }
    else
    {
      v15 = *(unsigned __int8 *)(MEMORY[0x1E0D03918] + 7);
      if (os_log_type_enabled(v10, *(os_log_type_t *)(MEMORY[0x1E0D03918] + 7)))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_impl(&dword_1C1CD1000, v11, (os_log_type_t)v15, "performTask called on task %@", buf, 0xCu);
      }

      if (PLShouldLogRegisteredEvent()
        && !self->_didLogSyncStart
        && -[DATaskManager _hasTasksIndicatingARunningSync](self, "_hasTasksIndicatingARunningSync"))
      {
        -[DATaskManager _powerLogInfoDictionary](self, "_powerLogInfoDictionary");
        v16[0] = CFSTR("AccountName");
        v16[1] = CFSTR("AccountClass");
        v16[2] = CFSTR("AccountID");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
        PLLogRegisteredEvent();
        self->_didLogSyncStart = 1;
      }
      -[DATaskManager _retainPowerAssertionForTask:](self, "_retainPowerAssertionForTask:", v4);
      objc_msgSend(v4, "performTask");
    }
  }

}

- (void)_requestCancelTasksWithReason:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[DATaskManager independentTasks](self, "independentTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "requestCancelTaskWithReason:", v3, (_QWORD)v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[DATaskManager activeQueuedTask](self, "activeQueuedTask");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[DATaskManager activeQueuedTask](self, "activeQueuedTask");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requestCancelTaskWithReason:", v3);

  }
}

- (void)_startModal:(id)a3
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[DATaskManager isShutdown](self, "isShutdown"))
  {
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1C1CD1000, v6, v7, "The _startModal is invoked after taskManager has been shutdown. Canceling %{public}@ %@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(v5, "cancelTaskWithReason:underlyingError:", 1, 0);
  }
  else
  {
    if (-[DATaskManager state](self, "state") == 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1007, CFSTR("Cannot handle _startModal: in Shutdown state"));

    }
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
    if (os_log_type_enabled(v10, v11))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1C1CD1000, v10, v11, "startModal called on task %@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v5, "startModal");
  }

}

- (void)_reactivateHeldTasks
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[DATaskManager heldIndependentTasks](self, "heldIndependentTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v7);
        -[DATaskManager independentTasks](self, "independentTasks");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v8);

        -[DATaskManager _schedulePerformTask:](self, "_schedulePerformTask:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v5);
  }

  -[DATaskManager heldIndependentTasks](self, "heldIndependentTasks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[DATaskManager modalHeldIndependentTasks](self, "modalHeldIndependentTasks", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
        -[DATaskManager independentTasks](self, "independentTasks");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v13);
  }

  -[DATaskManager modalHeldIndependentTasks](self, "modalHeldIndependentTasks");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

  -[DATaskManager modalHeldActiveQueuedTask](self, "modalHeldActiveQueuedTask");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[DATaskManager setActiveQueuedTask:](self, "setActiveQueuedTask:", self->_modalHeldActiveQueuedTask);
    -[DATaskManager setModalHeldActiveQueuedTask:](self, "setModalHeldActiveQueuedTask:", 0);
  }
  else
  {
    -[DATaskManager mQueuedTasks](self, "mQueuedTasks");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      -[DATaskManager mQueuedTasks](self, "mQueuedTasks");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DATaskManager setActiveQueuedTask:](self, "setActiveQueuedTask:", v23);

      -[DATaskManager mQueuedTasks](self, "mQueuedTasks");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeObjectAtIndex:", 0);

      -[DATaskManager activeQueuedTask](self, "activeQueuedTask");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DATaskManager _schedulePerformTask:](self, "_schedulePerformTask:", v25);

    }
  }
}

- (void)_makeStateTransition
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  DATaskManager *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  SEL v48;
  DATaskManager *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  DATaskManager *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DATaskManager activeQueuedTask](self, "activeQueuedTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1038, CFSTR("Cannot have active queued task and active exclusive task at the same time."));

    }
    -[DATaskManager independentTasks](self, "independentTasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1040, CFSTR("Cannot have running independent tasks and an active exclusive task at the same time."));

    }
  }
  -[DATaskManager activeModalTask](self, "activeModalTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DATaskManager activeQueuedTask](self, "activeQueuedTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1043, CFSTR("Cannot have active queued task and a modal task at the same time."));

    }
    -[DATaskManager independentTasks](self, "independentTasks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1045, CFSTR("Cannot have running independent tasks and a modal task at the same time."));

    }
  }
  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v12, v13))
  {
    getStateName(-[DATaskManager state](self, "state"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 138412546;
    v84 = self;
    v85 = 2112;
    v86 = v14;
    _os_log_impl(&dword_1C1CD1000, v12, v13, "Task Manager %@ transitioning from state: %@", (uint8_t *)&v83, 0x16u);

  }
  switch(-[DATaskManager state](self, "state"))
  {
    case 0:
      -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_36;
      -[DATaskManager activeModalTask](self, "activeModalTask");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_28;
      -[DATaskManager queuedModalTasks](self, "queuedModalTasks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
        goto LABEL_31;
      -[DATaskManager queuedExclusiveTasks](self, "queuedExclusiveTasks");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20)
        goto LABEL_75;
      break;
    case 1:
      -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        goto LABEL_36;
      if (self->_activeModalTask)
        goto LABEL_28;
      if (!-[NSMutableArray count](self->_queuedExclusiveTasks, "count"))
        goto LABEL_76;
      break;
    case 2:
      -[DATaskManager activeModalTask](self, "activeModalTask");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_28;
      -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        goto LABEL_76;
      break;
    case 3:
      -[DATaskManager activeModalTask](self, "activeModalTask");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
LABEL_28:
        v26 = self;
        v27 = 4;
        goto LABEL_37;
      }
      -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
        goto LABEL_36;
      -[DATaskManager queuedModalTasks](self, "queuedModalTasks");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (!v33)
        goto LABEL_76;
      break;
    case 4:
      -[DATaskManager activeModalTask](self, "activeModalTask");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        -[DATaskManager queuedModalTasks](self, "queuedModalTasks");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

        if (v30)
        {
LABEL_31:
          v26 = self;
          v27 = 3;
        }
        else
        {
          -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
LABEL_36:
            v26 = self;
            v27 = 2;
          }
          else
          {
            -[DATaskManager queuedExclusiveTasks](self, "queuedExclusiveTasks");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "count");

            if (v68)
            {
LABEL_75:
              v26 = self;
              v27 = 1;
            }
            else
            {
LABEL_76:
              v26 = self;
              v27 = 0;
            }
          }
        }
LABEL_37:
        -[DATaskManager setState:](v26, "setState:", v27);
      }
      break;
    case 5:
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1103, CFSTR("Out of bounds state."));

      break;
  }
  DALoggingwithCategory();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, v13))
  {
    getStateName(-[DATaskManager state](self, "state"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 138412546;
    v84 = self;
    v85 = 2112;
    v86 = v36;
    _os_log_impl(&dword_1C1CD1000, v35, v13, "Task Manager %@ transitioning to state: %@", (uint8_t *)&v83, 0x16u);

  }
  switch(-[DATaskManager state](self, "state"))
  {
    case 0:
      -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1111, CFSTR("Cannot have active exclusive task in Nominal state."));

      }
      -[DATaskManager activeModalTask](self, "activeModalTask");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1112, CFSTR("Cannot have modal task in Nominal state."));

      }
      -[DATaskManager heldIndependentTasks](self, "heldIndependentTasks");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");

      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1113, CFSTR("We shouldn't be holding independent tasks in Nominal state"));

      }
      -[DATaskManager queuedExclusiveTasks](self, "queuedExclusiveTasks");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count");

      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1114, CFSTR("We shouldn't have queued exclusive tasks in Nominal state"));

      }
      -[DATaskManager modalHeldIndependentTasks](self, "modalHeldIndependentTasks");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "count");

      if (v44)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        v47 = CFSTR("We shouldn't have any independent tasks that are modal in Nominal state");
        v48 = a2;
        v49 = self;
        v50 = 1116;
        goto LABEL_52;
      }
      break;
    case 1:
      -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1119, CFSTR("Cannot have active exclusive task in Hold for Exclusive state."));

      }
      -[DATaskManager activeModalTask](self, "activeModalTask");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1120, CFSTR("Should not have any modal task active in Hold for Exclusive state"));

      }
      -[DATaskManager queuedExclusiveTasks](self, "queuedExclusiveTasks");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "count");

      if (!v54)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        v47 = CFSTR("Should have at least one queued exclusive task in Hold for Exclusive state");
        v48 = a2;
        v49 = self;
        v50 = 1122;
        goto LABEL_52;
      }
      break;
    case 2:
      -[DATaskManager independentTasks](self, "independentTasks");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "count");

      if (v56)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1125, CFSTR("Cannot have running independent tasks in Run Exclusive state."));

      }
      -[DATaskManager activeQueuedTask](self, "activeQueuedTask");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        v47 = CFSTR("Cannot have active queued task in Run Exclusive state.");
        v48 = a2;
        v49 = self;
        v50 = 1126;
        goto LABEL_52;
      }
      break;
    case 3:
      -[DATaskManager activeModalTask](self, "activeModalTask");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1129, CFSTR("Cannot have active modal task in Hold for Modal state."));

      }
      -[DATaskManager queuedModalTasks](self, "queuedModalTasks");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "count");

      if (!v60)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        v47 = CFSTR("Should have at least one queued modal task in Hold for Modal state.");
        v48 = a2;
        v49 = self;
        v50 = 1130;
        goto LABEL_52;
      }
      break;
    case 4:
      -[DATaskManager independentTasks](self, "independentTasks");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "count");

      if (v62)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1133, CFSTR("Should not be running other independent tasks in Run Modal state."));

      }
      -[DATaskManager activeQueuedTask](self, "activeQueuedTask");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v63)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DATaskManager.m"), 1134, CFSTR("Should not be running other queued task in Run Modal state."));

      }
      -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        -[DATaskManager activeModalTask](self, "activeModalTask");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[DATaskManager activeExclusiveTask](self, "activeExclusiveTask");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v65 != v66)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45;
          v47 = CFSTR("Only the exclusive task can currently go modal.");
          v48 = a2;
          v49 = self;
          v50 = 1136;
          goto LABEL_52;
        }
      }
      break;
    case 5:
      return;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v45;
      v47 = CFSTR("Out of bounds state.");
      v48 = a2;
      v49 = self;
      v50 = 1142;
LABEL_52:
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", v48, v49, CFSTR("DATaskManager.m"), v50, v47);

      break;
  }
}

- (void)_scheduleSelector:(SEL)a3 withArgument:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *Name;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  runLoopModesToPerformDelayedSelectorsIn();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v8, v9))
  {
    Name = sel_getName(a3);
    v11 = objc_msgSend(v7, "count");
    v12 = v7;
    if (v11 == 1)
    {
      objc_msgSend(v7, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = 136315650;
    v14 = Name;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1C1CD1000, v8, v9, "Scheduling selector: %s with argument: %@ in modes %@", (uint8_t *)&v13, 0x20u);
    if (v11 == 1)

  }
  -[DATaskManager performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", a3, v6, v7, 0.0);

}

- (void)_schedulePerformTask:(id)a3
{
  -[DATaskManager _scheduleSelector:withArgument:](self, "_scheduleSelector:withArgument:", sel__performTask_, a3);
}

- (void)_scheduleStartModal:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Scheduling modal task: %@", (uint8_t *)&v7, 0xCu);
  }

  -[DATaskManager _scheduleSelector:withArgument:](self, "_scheduleSelector:withArgument:", sel__startModal_, v4);
}

- (void)_cancelTasksWithReason:(int)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  -[DATaskManager allTasks](self, "allTasks");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        DALoggingwithCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, v8))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v10;
          v25 = 1024;
          v26 = v3;
          _os_log_impl(&dword_1C1CD1000, v11, v8, "Cancelling task %@ with reason %d", buf, 0x12u);
        }

        objc_msgSend(v10, "cancelTaskWithReason:underlyingError:", v3, 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[DATaskManager queuedExclusiveTasks](self, "queuedExclusiveTasks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[DATaskManager setActiveExclusiveTask:](self, "setActiveExclusiveTask:", 0);
  -[DATaskManager independentTasks](self, "independentTasks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[DATaskManager heldIndependentTasks](self, "heldIndependentTasks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  -[DATaskManager modalHeldIndependentTasks](self, "modalHeldIndependentTasks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  -[DATaskManager mQueuedTasks](self, "mQueuedTasks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

  -[DATaskManager setActiveQueuedTask:](self, "setActiveQueuedTask:", 0);
  -[DATaskManager setModalHeldActiveQueuedTask:](self, "setModalHeldActiveQueuedTask:", 0);
  -[DATaskManager queuedModalTasks](self, "queuedModalTasks");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeAllObjects");

  -[DATaskManager setActiveModalTask:](self, "setActiveModalTask:", 0);
}

- (void)_retainPowerAssertionForTask:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = v4;
    if ((objc_opt_respondsToSelector() & 1) == 0 || (v6 = objc_msgSend(v12, "shouldHoldPowerAssertion"), v5 = v12, v6))
    {
      -[DATaskManager powerAssertionGroupID](self, "powerAssertionGroupID", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        -[DATaskManager account](self, "account");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "persistentUUID");
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "retainPowerAssertion:withGroupIdentifier:", v12, v9);

      v5 = v12;
    }
  }

}

- (void)_releasePowerAssertionForTask:(id)a3
{
  id v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (v3 && ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v3, "shouldHoldPowerAssertion")))
  {
    v4 = dispatch_time(0, 1000000000);
    dataaccess_get_global_queue();
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__DATaskManager__releasePowerAssertionForTask___block_invoke;
    block[3] = &unk_1E7B92278;
    v7 = v3;
    dispatch_after(v4, v5, block);

  }
}

void __47__DATaskManager__releasePowerAssertionForTask___block_invoke(uint64_t a1)
{
  id v2;

  +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releasePowerAssertion:", *(_QWORD *)(a1 + 32));

}

- (NSMutableArray)queuedExclusiveTasks
{
  NSMutableArray *queuedExclusiveTasks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  queuedExclusiveTasks = self->_queuedExclusiveTasks;
  if (!queuedExclusiveTasks)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_queuedExclusiveTasks;
    self->_queuedExclusiveTasks = v4;

    queuedExclusiveTasks = self->_queuedExclusiveTasks;
  }
  return queuedExclusiveTasks;
}

- (NSMutableSet)independentTasks
{
  NSMutableSet *independentTasks;
  NSMutableSet *v4;
  NSMutableSet *v5;

  independentTasks = self->_independentTasks;
  if (!independentTasks)
  {
    v4 = (NSMutableSet *)objc_opt_new();
    v5 = self->_independentTasks;
    self->_independentTasks = v4;

    independentTasks = self->_independentTasks;
  }
  return independentTasks;
}

- (NSMutableSet)heldIndependentTasks
{
  NSMutableSet *heldIndependentTasks;
  NSMutableSet *v4;
  NSMutableSet *v5;

  heldIndependentTasks = self->_heldIndependentTasks;
  if (!heldIndependentTasks)
  {
    v4 = (NSMutableSet *)objc_opt_new();
    v5 = self->_heldIndependentTasks;
    self->_heldIndependentTasks = v4;

    heldIndependentTasks = self->_heldIndependentTasks;
  }
  return heldIndependentTasks;
}

- (NSMutableSet)modalHeldIndependentTasks
{
  NSMutableSet *modalHeldIndependentTasks;
  NSMutableSet *v4;
  NSMutableSet *v5;

  modalHeldIndependentTasks = self->_modalHeldIndependentTasks;
  if (!modalHeldIndependentTasks)
  {
    v4 = (NSMutableSet *)objc_opt_new();
    v5 = self->_modalHeldIndependentTasks;
    self->_modalHeldIndependentTasks = v4;

    modalHeldIndependentTasks = self->_modalHeldIndependentTasks;
  }
  return modalHeldIndependentTasks;
}

- (NSMutableArray)mQueuedTasks
{
  NSMutableArray *mQueuedTasks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  mQueuedTasks = self->_mQueuedTasks;
  if (!mQueuedTasks)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_mQueuedTasks;
    self->_mQueuedTasks = v4;

    mQueuedTasks = self->_mQueuedTasks;
  }
  return mQueuedTasks;
}

- (NSMutableArray)queuedModalTasks
{
  NSMutableArray *queuedModalTasks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  queuedModalTasks = self->_queuedModalTasks;
  if (!queuedModalTasks)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_queuedModalTasks;
    self->_queuedModalTasks = v4;

    queuedModalTasks = self->_queuedModalTasks;
  }
  return queuedModalTasks;
}

- (DAAccount)account
{
  return (DAAccount *)objc_loadWeakRetained((id *)&self->_account);
}

- (void)setAccount:(id)a3
{
  objc_storeWeak((id *)&self->_account, a3);
}

- (DATask)activeModalTask
{
  return self->_activeModalTask;
}

- (void)setActiveModalTask:(id)a3
{
  objc_storeStrong((id *)&self->_activeModalTask, a3);
}

- (DATask)activeQueuedTask
{
  return self->_activeQueuedTask;
}

- (void)setActiveQueuedTask:(id)a3
{
  objc_storeStrong((id *)&self->_activeQueuedTask, a3);
}

- (NSString)powerAssertionGroupID
{
  return self->_powerAssertionGroupID;
}

- (void)setPowerAssertionGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setQueuedExclusiveTasks:(id)a3
{
  objc_storeStrong((id *)&self->_queuedExclusiveTasks, a3);
}

- (DATask)activeExclusiveTask
{
  return self->_activeExclusiveTask;
}

- (void)setActiveExclusiveTask:(id)a3
{
  objc_storeStrong((id *)&self->_activeExclusiveTask, a3);
}

- (void)setIndependentTasks:(id)a3
{
  objc_storeStrong((id *)&self->_independentTasks, a3);
}

- (void)setHeldIndependentTasks:(id)a3
{
  objc_storeStrong((id *)&self->_heldIndependentTasks, a3);
}

- (void)setModalHeldIndependentTasks:(id)a3
{
  objc_storeStrong((id *)&self->_modalHeldIndependentTasks, a3);
}

- (void)setMQueuedTasks:(id)a3
{
  objc_storeStrong((id *)&self->_mQueuedTasks, a3);
}

- (DATask)modalHeldActiveQueuedTask
{
  return self->_modalHeldActiveQueuedTask;
}

- (void)setModalHeldActiveQueuedTask:(id)a3
{
  objc_storeStrong((id *)&self->_modalHeldActiveQueuedTask, a3);
}

- (void)setQueuedModalTasks:(id)a3
{
  objc_storeStrong((id *)&self->_queuedModalTasks, a3);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSTimer)managerIdleTimer
{
  return self->_managerIdleTimer;
}

- (void)setManagerIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_managerIdleTimer, a3);
}

- (NSTimer)userInitiatedSyncTimer
{
  return self->_userInitiatedSyncTimer;
}

- (void)setUserInitiatedSyncTimer:(id)a3
{
  objc_storeStrong((id *)&self->_userInitiatedSyncTimer, a3);
}

- (NSTimer)xpcTransactionTimer
{
  return self->_xpcTransactionTimer;
}

- (void)setXpcTransactionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_xpcTransactionTimer, a3);
}

- (NSTimer)powerLogIdleTimer
{
  return self->_powerLogIdleTimer;
}

- (void)setPowerLogIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_powerLogIdleTimer, a3);
}

- (BOOL)didLogSyncStart
{
  return self->_didLogSyncStart;
}

- (void)setDidLogSyncStart:(BOOL)a3
{
  self->_didLogSyncStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogIdleTimer, 0);
  objc_storeStrong((id *)&self->_xpcTransactionTimer, 0);
  objc_storeStrong((id *)&self->_userInitiatedSyncTimer, 0);
  objc_storeStrong((id *)&self->_managerIdleTimer, 0);
  objc_storeStrong((id *)&self->_queuedModalTasks, 0);
  objc_storeStrong((id *)&self->_modalHeldActiveQueuedTask, 0);
  objc_storeStrong((id *)&self->_mQueuedTasks, 0);
  objc_storeStrong((id *)&self->_modalHeldIndependentTasks, 0);
  objc_storeStrong((id *)&self->_heldIndependentTasks, 0);
  objc_storeStrong((id *)&self->_independentTasks, 0);
  objc_storeStrong((id *)&self->_activeExclusiveTask, 0);
  objc_storeStrong((id *)&self->_queuedExclusiveTasks, 0);
  objc_storeStrong((id *)&self->_powerAssertionGroupID, 0);
  objc_storeStrong((id *)&self->_activeQueuedTask, 0);
  objc_storeStrong((id *)&self->_activeModalTask, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_daActivity, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
