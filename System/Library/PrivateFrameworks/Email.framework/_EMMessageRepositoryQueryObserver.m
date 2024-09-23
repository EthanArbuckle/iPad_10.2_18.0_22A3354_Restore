@implementation _EMMessageRepositoryQueryObserver

- (void)performWithRemoteConnection:(id)a3
{
  -[_EMMessageRepositoryQueryObserver _performQueryWithRemoteConnection:forRecovery:](self, "_performQueryWithRemoteConnection:forRecovery:", a3, 0);
}

- (void)_performQueryWithRemoteConnection:(id)a3 forRecovery:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  EMQuery *query;
  EMObjectID *observationIdentifier;
  void *v12;
  _QWORD v13[5];

  v4 = a4;
  v6 = a3;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    if (v4)
    {
      -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queryDidStartRecovery");

      -[EFCancelationToken removeAllCancelationBlocks](self->_token, "removeAllCancelationBlocks");
      -[_EMMessageRepositoryQueryObserver threadCollection](self, "threadCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clearForRecovery");

    }
    objc_msgSend(v6, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    query = self->_query;
    observationIdentifier = self->_observationIdentifier;
    -[_EMMessageRepositoryQueryObserver queryHelperObserver](self, "queryHelperObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83___EMMessageRepositoryQueryObserver__performQueryWithRemoteConnection_forRecovery___block_invoke;
    v13[3] = &unk_1E70F2B90;
    v13[4] = self;
    objc_msgSend(v9, "performQuery:withObserver:observationIdentifier:helperObserver:completionHandler:", query, self, observationIdentifier, v12, v13);

  }
}

- (void)observerDidFinishInitialLoad:(id)a3
{
  id v4;

  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled", a3) & 1) == 0)
  {
    os_unfair_lock_lock(&self->_recoveryLock);
    self->_recoveryAttempt = 0;
    os_unfair_lock_unlock(&self->_recoveryLock);
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDidFinishInitialLoad");

  }
}

- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  EMMessageRepository *repository;
  EMObjectID *observationIdentifier;
  EMMessageRepository *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  _EMMessageRepositoryQueryObserver *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    -[_EMMessageRepositoryQueryObserver clearInMemoryThreadDataIfNeeded](self, "clearInMemoryThreadDataIfNeeded");
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queryMatchedAddedObjectIDs:before:extraInfo:", v11, v12, v13);

    repository = self->_repository;
    observationIdentifier = self->_observationIdentifier;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __85___EMMessageRepositoryQueryObserver_observer_matchedAddedObjectIDs_before_extraInfo___block_invoke;
    v22 = &unk_1E70F52E0;
    v23 = self;
    v24 = v10;
    -[EMMessageRepository _detectChangesForMatchedAddedObjectIDs:observerationIdentifier:matchedChangesHandler:](repository, "_detectChangesForMatchedAddedObjectIDs:observerationIdentifier:matchedChangesHandler:", v11, observationIdentifier, &v19);
    v17 = self->_repository;
    -[_EMMessageRepositoryQueryObserver _precachedItemsFromExtraInfo:](self, "_precachedItemsFromExtraInfo:", v13, v19, v20, v21, v22, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageRepository _addPrecachedItems:](v17, "_addPrecachedItems:", v18);

  }
}

- (id)trampoliningObserver
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (WeakRetained)
  {
    -[EMRepository trampoliningObserverForObserver:](self->_repository, "trampoliningObserverForObserver:", WeakRetained);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (_EMMessageRepositoryQueryObserver)initWithRepository:(id)a3 query:(id)a4 observer:(id)a5 queryHandlerStorable:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _EMMessageRepositoryQueryObserver *v15;
  _EMMessageRepositoryQueryObserver *v16;
  uint64_t v17;
  EMObjectID *observationIdentifier;
  EFCancelationToken *v19;
  EFCancelationToken *token;
  uint64_t v21;
  EFScheduler *recoveryScheduler;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_EMMessageRepositoryQueryObserver;
  v15 = -[_EMMessageRepositoryQueryObserver init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_repository, a3);
    objc_storeStrong((id *)&v16->_query, a4);
    objc_msgSend(v13, "objectID");
    v17 = objc_claimAutoreleasedReturnValue();
    observationIdentifier = v16->_observationIdentifier;
    v16->_observationIdentifier = (EMObjectID *)v17;

    objc_storeWeak((id *)&v16->_observer, v13);
    v19 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    token = v16->_token;
    v16->_token = v19;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("_EMMessageRepositoryQueryObserver.recoveryScheduler"));
    v21 = objc_claimAutoreleasedReturnValue();
    recoveryScheduler = v16->_recoveryScheduler;
    v16->_recoveryScheduler = (EFScheduler *)v21;

    v16->_recoveryLock._os_unfair_lock_opaque = 0;
    v16->_recoveryAttempt = 0;
    objc_storeWeak((id *)&v16->_queryHandlerStorable, v14);
    -[_EMMessageRepositoryQueryObserver _createInMemoryThreadQueryHandlerIfNeeded](v16, "_createInMemoryThreadQueryHandlerIfNeeded");
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_token, "cancel");
  -[_EMMessageRepositoryQueryObserver setInMemoryThreadQueryHandler:](self, "setInMemoryThreadQueryHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_EMMessageRepositoryQueryObserver;
  -[_EMMessageRepositoryQueryObserver dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  -[EFCancelationToken cancel](self->_token, "cancel");
}

- (void)clearInMemoryThreadDataIfNeeded
{
  _EMMessageRepositoryMessageQueryHelperObserver *queryHelperObserver;
  _EMMessageRepositoryMessageQueryHelperObserver *v4;

  if (_os_feature_enabled_impl())
  {
    queryHelperObserver = self->_queryHelperObserver;
    if (queryHelperObserver)
    {
      if (!-[_EMMessageRepositoryMessageQueryHelperObserver didUseThreadCollection](queryHelperObserver, "didUseThreadCollection"))
      {
        -[_EMMessageRepositoryQueryObserver setInMemoryThreadQueryHandler:](self, "setInMemoryThreadQueryHandler:", 0);
        v4 = self->_queryHelperObserver;
        self->_queryHelperObserver = 0;

      }
    }
  }
}

- (EMInMemoryThreadCollection)threadCollection
{
  void *v2;
  void *v3;

  -[_EMMessageRepositoryQueryObserver inMemoryThreadQueryHandler](self, "inMemoryThreadQueryHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMInMemoryThreadCollection *)v3;
}

- (void)refreshQueryWithRemoteConnection:(id)a3
{
  id v4;
  NSObject *v5;
  EMObjectID *observationIdentifier;
  EMQuery *query;
  void *v8;
  _EMMessageRepositoryMessageQueryHelperObserver *queryHelperObserver;
  int v10;
  _EMMessageRepositoryQueryObserver *v11;
  __int16 v12;
  EMObjectID *v13;
  __int16 v14;
  EMQuery *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMMessageRepository log](EMMessageRepository, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    observationIdentifier = self->_observationIdentifier;
    query = self->_query;
    -[EMQuery debugDescription](query, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218754;
    v11 = self;
    v12 = 2114;
    v13 = observationIdentifier;
    v14 = 2048;
    v15 = query;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ refreshing query<%p>: %@", (uint8_t *)&v10, 0x2Au);

  }
  -[EFCancelable cancel](self->_remoteCancelable, "cancel");
  queryHelperObserver = self->_queryHelperObserver;
  self->_queryHelperObserver = 0;

  -[_EMMessageRepositoryQueryObserver setInMemoryThreadQueryHandler:](self, "setInMemoryThreadQueryHandler:", 0);
  -[_EMMessageRepositoryQueryObserver _performQueryWithRemoteConnection:forRecovery:](self, "_performQueryWithRemoteConnection:forRecovery:", v4, 1);

}

- (void)recoverWithRemoteConnection:(id)a3
{
  id v4;
  int64_t recoveryAttempt;
  NSObject *v6;
  EMObjectID *observationIdentifier;
  EMQuery *query;
  EMQuery *v9;
  double v10;
  NSObject *v11;
  EMObjectID *v12;
  EMQuery *v13;
  void *v14;
  EFScheduler *recoveryScheduler;
  id v16;
  NSObject *v17;
  EMObjectID *v18;
  EMQuery *v19;
  EMQuery *v20;
  _QWORD v21[4];
  id v22;
  id v23[2];
  _BYTE buf[12];
  __int16 v25;
  EMObjectID *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  EMQuery *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_recoveryLock);
  recoveryAttempt = self->_recoveryAttempt;
  if (self->_recoveryIsScheduled)
  {
    os_unfair_lock_unlock(&self->_recoveryLock);
    +[EMMessageRepository log](EMMessageRepository, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      observationIdentifier = self->_observationIdentifier;
      query = self->_query;
      -[EMQuery debugDescription](query, "debugDescription");
      v9 = (EMQuery *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = self;
      v25 = 2114;
      v26 = observationIdentifier;
      v27 = 2048;
      v28 = recoveryAttempt;
      v29 = 2048;
      v30 = *(double *)&query;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ recovery attempt %ld already scheduled for query<%p>: %@", buf, 0x34u);

    }
  }
  else
  {
    self->_recoveryAttempt = recoveryAttempt + 1;
    if (recoveryAttempt)
    {
      self->_recoveryIsScheduled = 1;
      os_unfair_lock_unlock(&self->_recoveryLock);
      if (recoveryAttempt <= 1)
        v10 = 2.0;
      else
        v10 = 4.0;
      +[EMMessageRepository log](EMMessageRepository, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_observationIdentifier;
        v13 = self->_query;
        -[EMQuery debugDescription](v13, "debugDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        *(_QWORD *)&buf[4] = self;
        v25 = 2114;
        v26 = v12;
        v27 = 2048;
        v28 = recoveryAttempt;
        v29 = 2048;
        v30 = v10;
        v31 = 2048;
        v32 = v13;
        v33 = 2112;
        v34 = v14;
        _os_log_impl(&dword_1B99BB000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ scheduling recovery %ld with %fs delay for query<%p>: %@", buf, 0x3Eu);

      }
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      recoveryScheduler = self->_recoveryScheduler;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __65___EMMessageRepositoryQueryObserver_recoverWithRemoteConnection___block_invoke;
      v21[3] = &unk_1E70F52B8;
      objc_copyWeak(v23, (id *)buf);
      v23[1] = (id)recoveryAttempt;
      v22 = v4;
      v16 = (id)-[EFScheduler afterDelay:performBlock:](recoveryScheduler, "afterDelay:performBlock:", v21, v10);

      objc_destroyWeak(v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      os_unfair_lock_unlock(&self->_recoveryLock);
      +[EMMessageRepository log](EMMessageRepository, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_observationIdentifier;
        v19 = self->_query;
        -[EMQuery debugDescription](v19, "debugDescription");
        v20 = (EMQuery *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = self;
        v25 = 2114;
        v26 = v18;
        v27 = 2048;
        v28 = 0;
        v29 = 2048;
        v30 = *(double *)&v19;
        v31 = 2112;
        v32 = v20;
        _os_log_impl(&dword_1B99BB000, v17, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ attempting recovery %ld for query<%p>: %@", buf, 0x34u);

      }
      -[_EMMessageRepositoryQueryObserver _performQueryWithRemoteConnection:forRecovery:](self, "_performQueryWithRemoteConnection:forRecovery:", v4, 1);
    }
  }

}

- (void)observer:(id)a3 wasUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  _EMMessageRepositoryQueryObserver *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    +[EMMessageRepository log](EMMessageRepository, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218498;
      v10 = self;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "<%p> Acknowledging update for %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
    }

    objc_msgSend(v7, "invoke");
  }

}

- (id)_precachedItemsFromExtraInfo:(id)a3
{
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("precachedItems"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  EMMessageRepository *repository;
  EMObjectID *observationIdentifier;
  _QWORD v17[5];
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queryMatchedAddedObjectIDs:after:extraInfo:", v11, v12, v13);

    repository = self->_repository;
    observationIdentifier = self->_observationIdentifier;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84___EMMessageRepositoryQueryObserver_observer_matchedAddedObjectIDs_after_extraInfo___block_invoke;
    v17[3] = &unk_1E70F52E0;
    v17[4] = self;
    v18 = v10;
    -[EMMessageRepository _detectChangesForMatchedAddedObjectIDs:observerationIdentifier:matchedChangesHandler:](repository, "_detectChangesForMatchedAddedObjectIDs:observerationIdentifier:matchedChangesHandler:", v11, observationIdentifier, v17);

  }
}

- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryMatchedMovedObjectIDs:before:extraInfo:", v12, v9, v10);

  }
}

- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryMatchedMovedObjectIDs:after:extraInfo:", v12, v9, v10);

  }
}

- (void)observer:(id)a3 matchedChangesForObjectIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    -[EMMessageRepository _applyChangesToCachedObjects:](self->_repository, "_applyChangesToCachedObjects:", v5);
    v9 = CFSTR("changesByObjectID");
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryMatchedChangedObjectIDs:extraInfo:", v8, v6);

  }
}

- (void)observer:(id)a3 matchedDeletedObjectIDs:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryMatchedDeletedObjectIDs:", v6);

  }
}

- (void)observerDidFinishRemoteSearch:(id)a3
{
  id v4;

  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled", a3) & 1) == 0)
  {
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDidFinishRemoteSearch");

  }
}

- (void)observer:(id)a3 replacedExistingObjectID:(id)a4 withNewObjectID:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryReplacedObjectID:withNewObjectID:", v9, v7);

  }
}

- (void)observerWillRestart:(id)a3
{
  id v4;

  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled", a3) & 1) == 0)
  {
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryDidStartRecovery");

  }
}

- (void)observer:(id)a3 matchedOldestItemsUpdatedForMailboxes:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if ((-[EFCancelationToken isCanceled](self->_token, "isCanceled") & 1) == 0)
  {
    -[_EMMessageRepositoryQueryObserver trampoliningObserver](self, "trampoliningObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF24AC28))
      objc_msgSend(v5, "queryMatchedOldestItemsUpdatedForMailboxesObjectIDs:", v6);

  }
}

- (id)queryHelperObserver
{
  _EMMessageRepositoryMessageQueryHelperObserver *v3;
  void *v4;
  _EMMessageRepositoryMessageQueryHelperObserver *v5;
  _EMMessageRepositoryMessageQueryHelperObserver *queryHelperObserver;

  if (_os_feature_enabled_impl()
    && !self->_queryHelperObserver
    && -[objc_class isEqual:](-[EMQuery targetClass](self->_query, "targetClass"), "isEqual:", objc_opt_class()))
  {
    -[_EMMessageRepositoryQueryObserver _createInMemoryThreadQueryHandlerIfNeeded](self, "_createInMemoryThreadQueryHandlerIfNeeded");
    v3 = [_EMMessageRepositoryMessageQueryHelperObserver alloc];
    -[_EMMessageRepositoryQueryObserver threadCollection](self, "threadCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_EMMessageRepositoryMessageQueryHelperObserver initWithThreadCollection:repository:observer:observationIdentifier:](v3, "initWithThreadCollection:repository:observer:observationIdentifier:", v4, self->_repository, self, self->_observationIdentifier);
    queryHelperObserver = self->_queryHelperObserver;
    self->_queryHelperObserver = v5;

  }
  return self->_queryHelperObserver;
}

- (id)_createInMemoryThreadQueryHandler
{
  EMInMemoryThreadQueryHandler *v3;
  EMQuery *query;
  EMMessageRepository *repository;
  void *v6;
  EMInMemoryThreadQueryHandler *v7;

  v3 = [EMInMemoryThreadQueryHandler alloc];
  repository = self->_repository;
  query = self->_query;
  -[EMMessageRepository mailboxRepository](repository, "mailboxRepository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMInMemoryThreadQueryHandler initWithQuery:repository:mailboxTypeResolver:resultsObserver:observationIdentifier:](v3, "initWithQuery:repository:mailboxTypeResolver:resultsObserver:observationIdentifier:", query, repository, v6, self, self->_observationIdentifier);

  return v7;
}

- (void)_createInMemoryThreadQueryHandlerIfNeeded
{
  void *v3;
  objc_class *v4;
  uint64_t v5;

  if (_os_feature_enabled_impl())
  {
    -[_EMMessageRepositoryQueryObserver inMemoryThreadQueryHandler](self, "inMemoryThreadQueryHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
LABEL_3:

      return;
    }
    v4 = -[EMQuery targetClass](self->_query, "targetClass");
    if (v4 == (objc_class *)objc_opt_class())
    {
      -[_EMMessageRepositoryQueryObserver _createInMemoryThreadQueryHandler](self, "_createInMemoryThreadQueryHandler");
      v5 = objc_claimAutoreleasedReturnValue();
      -[_EMMessageRepositoryQueryObserver setInMemoryThreadQueryHandler:](self, "setInMemoryThreadQueryHandler:");
      v3 = (void *)v5;
      goto LABEL_3;
    }
  }
}

- (void)setInMemoryThreadQueryHandler:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inMemoryThreadQueryHandler);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_inMemoryThreadQueryHandler);
    objc_storeWeak((id *)&self->_inMemoryThreadQueryHandler, obj);
    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->_queryHandlerStorable);
      objc_msgSend(v7, "removeQueryHandler:", v6);

    }
    if (obj)
    {
      v8 = objc_loadWeakRetained((id *)&self->_queryHandlerStorable);
      objc_msgSend(v8, "addQueryHandler:", obj);

    }
    v5 = obj;
  }

}

- (EMInMemoryThreadQueryHandler)inMemoryThreadQueryHandler
{
  return (EMInMemoryThreadQueryHandler *)objc_loadWeakRetained((id *)&self->_inMemoryThreadQueryHandler);
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_destroyWeak((id *)&self->_inMemoryThreadQueryHandler);
  objc_destroyWeak((id *)&self->_queryHandlerStorable);
  objc_storeStrong((id *)&self->_queryHelperObserver, 0);
  objc_storeStrong((id *)&self->_recoveryScheduler, 0);
  objc_storeStrong((id *)&self->_remoteCancelable, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

@end
