@implementation FBApplicationUpdateScenesTransaction

void __78__FBApplicationUpdateScenesTransaction_updateSceneTransactionDidCommitUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transaction:didCommitSceneUpdate:", v3, v4);

  }
}

- (void)_didSatisfyMilestone:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction _didSatisfyMilestone:](&v4, sel__didSatisfyMilestone_, a3);
  -[FBApplicationUpdateScenesTransaction _executeProcessLaunchIfAppropriate](self, "_executeProcessLaunchIfAppropriate");
}

- (void)updateSceneTransactionWillCommitUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBApplicationUpdateScenesTransaction _noteWillCommitUpdateForScene:](self, "_noteWillCommitUpdateForScene:", v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__FBApplicationUpdateScenesTransaction_updateSceneTransactionWillCommitUpdate___block_invoke;
  v7[3] = &unk_1E4A125F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FBApplicationUpdateScenesTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v7);

}

- (void)updateSceneTransactionDidCommitUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBApplicationUpdateScenesTransaction _noteDidCommitUpdateForScene:](self, "_noteDidCommitUpdateForScene:", v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__FBApplicationUpdateScenesTransaction_updateSceneTransactionDidCommitUpdate___block_invoke;
  v7[3] = &unk_1E4A125F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FBApplicationUpdateScenesTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v7);

}

void __77__FBApplicationUpdateScenesTransaction_updateSceneTransactionDidCreateScene___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transaction:didCreateScene:", v3, v4);

  }
}

void __79__FBApplicationUpdateScenesTransaction_updateSceneTransactionWillCommitUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transaction:willCommitSceneUpdate:", v3, v4);

  }
}

void __70__FBApplicationUpdateScenesTransaction_transaction_willLaunchProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:willLaunchProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)updateSceneWithIdentifier:(id)a3 parameters:(id)a4 transitionContext:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0D231F0];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "identityForIdentifier:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[FBApplicationUpdateScenesTransaction _updateSceneWithIdentity:parameters:transitionContext:](self, "_updateSceneWithIdentity:parameters:transitionContext:", v11, v10, v9);

}

- (void)setWaitsForSceneCommits:(BOOL)a3
{
  NSMutableArray *v4;
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

  v14 = *MEMORY[0x1E0C80C00];
  self->_waitsForSceneCommits = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_updateSceneTransactions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setWaitsForSceneCommit:", self->_waitsForSceneCommits, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)transaction:(id)a3 willLaunchProcess:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  FBApplicationUpdateScenesTransaction *v11;
  id v12;

  v5 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __70__FBApplicationUpdateScenesTransaction_transaction_willLaunchProcess___block_invoke;
  v10 = &unk_1E4A125F8;
  v11 = self;
  v12 = v5;
  v6 = v5;
  -[FBApplicationUpdateScenesTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", &v7);
  self->_processLaunched = 1;
  -[FBApplicationUpdateScenesTransaction _executeSceneUpdatesIfAppropriate](self, "_executeSceneUpdatesIfAppropriate", v7, v8, v9, v10, v11);

}

- (void)_updateSceneWithIdentity:(id)a3 parameters:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  FBUpdateSceneTransaction *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  NSClassFromString(CFSTR("FBSSceneParameters"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationUpdateScenesTransaction _updateSceneWithIdentity:parameters:transitionContext:].cold.1();
LABEL_20:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35ABC50);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneParametersClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationUpdateScenesTransaction _updateSceneWithIdentity:parameters:transitionContext:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35ABCB4);
  }

  objc_msgSend(v10, "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("FBSSceneSpecification"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationUpdateScenesTransaction _updateSceneWithIdentity:parameters:transitionContext:].cold.2();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35ABD18);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationUpdateScenesTransaction _updateSceneWithIdentity:parameters:transitionContext:].cold.2();
    goto LABEL_20;
  }

  if ((-[FBApplicationUpdateScenesTransaction isRunning](self, "isRunning") & 1) == 0
    && (-[FBApplicationUpdateScenesTransaction isComplete](self, "isComplete") & 1) == 0)
  {
    -[FBApplicationUpdateScenesTransaction queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v12);

    objc_msgSend(MEMORY[0x1E0D23140], "definition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIdentity:", v19);
    objc_msgSend(v13, "setClientIdentity:", self->_clientIdentity);
    objc_msgSend(v10, "specification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSpecification:", v14);

    v15 = -[FBUpdateSceneTransaction initWithSceneDefinition:parameters:transitionContext:]([FBUpdateSceneTransaction alloc], "initWithSceneDefinition:parameters:transitionContext:", v13, v10, v9);
    -[NSMutableArray addObject:](self->_pendingUpdateTransactions, "addObject:", v15);
    -[FBApplicationUpdateScenesTransaction _executeSceneUpdatesIfAppropriate](self, "_executeSceneUpdatesIfAppropriate");

  }
}

- (void)_executeSceneUpdatesIfAppropriate
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_processLaunched)
  {
    -[FBApplicationProcessLaunchTransaction process](self->_processLaunchTransaction, "process");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[NSMutableArray count](self->_pendingUpdateTransactions, "count");

      if (v5)
      {
        if (-[FBApplicationUpdateScenesTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
          -[FBApplicationUpdateScenesTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Beginning scene updates."));
        v6 = (void *)-[NSMutableArray copy](self->_pendingUpdateTransactions, "copy");
        -[NSMutableArray removeAllObjects](self->_pendingUpdateTransactions, "removeAllObjects");
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v14;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v14 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
              objc_msgSend(v12, "addObserver:", self, (_QWORD)v13);
              objc_msgSend(v12, "setWaitsForSceneCommit:", self->_waitsForSceneCommits);
              -[FBSynchronizedTransactionGroup addSynchronizedTransaction:](self, "addSynchronizedTransaction:", v12);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v9);
        }

      }
    }
  }
}

- (void)_willBegin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction _willBegin](&v3, sel__willBegin);
  -[FBApplicationUpdateScenesTransaction _executeProcessLaunchIfAppropriate](self, "_executeProcessLaunchIfAppropriate");
}

- (void)_didComplete
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[FBApplicationProcessLaunchTransaction removeObserver:](self->_processLaunchTransaction, "removeObserver:", self);
  -[NSMutableArray removeAllObjects](self->_pendingUpdateTransactions, "removeAllObjects");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_updateSceneTransactions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeObserver:", self);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBSynchronizedTransactionGroup _didComplete](&v8, sel__didComplete);
}

- (void)_childTransactionDidFinishWork:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction _childTransactionDidFinishWork:](&v4, sel__childTransactionDidFinishWork_, a3);
  -[FBApplicationUpdateScenesTransaction _executeProcessLaunchIfAppropriate](self, "_executeProcessLaunchIfAppropriate");
}

- (void)_childTransactionDidComplete:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBSynchronizedTransactionGroup _childTransactionDidComplete:](&v4, sel__childTransactionDidComplete_, a3);
  -[FBApplicationUpdateScenesTransaction _executeProcessLaunchIfAppropriate](self, "_executeProcessLaunchIfAppropriate");
}

- (void)_executeProcessLaunchIfAppropriate
{
  if (!self->_hasScheduledProcessLaunch)
  {
    if (-[FBApplicationUpdateScenesTransaction _isReadyToLaunch](self, "_isReadyToLaunch"))
    {
      self->_hasScheduledProcessLaunch = 1;
      -[FBApplicationProcessLaunchTransaction addObserver:](self->_processLaunchTransaction, "addObserver:", self);
      -[FBApplicationUpdateScenesTransaction addChildTransaction:](self, "addChildTransaction:", self->_processLaunchTransaction);
    }
  }
}

- (FBApplicationUpdateScenesTransaction)initWithProcessIdentity:(id)a3 executionContextProvider:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  FBApplicationUpdateScenesTransaction *v9;

  v6 = (void *)MEMORY[0x1E0D231C0];
  v7 = a4;
  objc_msgSend(v6, "identityForProcessIdentity:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FBApplicationUpdateScenesTransaction initWithClientIdentity:executionContextProvider:](self, "initWithClientIdentity:executionContextProvider:", v8, v7);

  return v9;
}

- (FBApplicationUpdateScenesTransaction)initWithClientIdentity:(id)a3 executionContextProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  FBApplicationUpdateScenesTransaction *v10;
  uint64_t v11;
  FBSSceneClientIdentity *clientIdentity;
  NSMutableArray *v13;
  NSMutableArray *updateSceneTransactions;
  NSMutableArray *v15;
  NSMutableArray *pendingUpdateTransactions;
  uint64_t v17;
  void *v18;
  FBApplicationProcessLaunchTransaction *v19;
  id v20;
  uint64_t v21;
  FBApplicationProcessLaunchTransaction *processLaunchTransaction;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("clientIdentity"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationUpdateScenesTransaction initWithClientIdentity:executionContextProvider:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_12;
  }
  v9 = v8;
  v31.receiver = self;
  v31.super_class = (Class)FBApplicationUpdateScenesTransaction;
  v10 = -[FBSynchronizedTransactionGroup init](&v31, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    clientIdentity = v10->_clientIdentity;
    v10->_clientIdentity = (FBSSceneClientIdentity *)v11;

    v10->_waitsForSceneCommits = 1;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updateSceneTransactions = v10->_updateSceneTransactions;
    v10->_updateSceneTransactions = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingUpdateTransactions = v10->_pendingUpdateTransactions;
    v10->_pendingUpdateTransactions = v15;

    objc_msgSend(v7, "processIdentity");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_initWeak(&location, v10);
      v19 = [FBApplicationProcessLaunchTransaction alloc];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __88__FBApplicationUpdateScenesTransaction_initWithClientIdentity_executionContextProvider___block_invoke;
      v26[3] = &unk_1E4A125D0;
      objc_copyWeak(&v29, &location);
      v28 = v9;
      v20 = v18;
      v27 = v20;
      v21 = -[FBApplicationProcessLaunchTransaction initWithProcessIdentity:executionContextProvider:](v19, "initWithProcessIdentity:executionContextProvider:", v20, v26);
      processLaunchTransaction = v10->_processLaunchTransaction;
      v10->_processLaunchTransaction = (FBApplicationProcessLaunchTransaction *)v21;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);

      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must be a process identity based client identity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationUpdateScenesTransaction initWithClientIdentity:executionContextProvider:].cold.2();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_12:
    JUMPOUT(0x1A35AD518);
  }
LABEL_5:

  return v10;
}

- (void)_willAddChildTransaction:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction _willAddChildTransaction:](&v5, sel__willAddChildTransaction_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NSMutableArray addObject:](self->_updateSceneTransactions, "addObject:", v4);

}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction addObserver:](&v3, sel_addObserver_, a3);
}

void __69__FBApplicationUpdateScenesTransaction_transaction_didLaunchProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transaction:didLaunchProcess:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)transaction:(id)a3 didLaunchProcess:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__FBApplicationUpdateScenesTransaction_transaction_didLaunchProcess___block_invoke;
  v7[3] = &unk_1E4A125F8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[FBApplicationUpdateScenesTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v7);

}

- (void)updateSceneTransactionDidCreateScene:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__FBApplicationUpdateScenesTransaction_updateSceneTransactionDidCreateScene___block_invoke;
  v6[3] = &unk_1E4A125F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FBApplicationUpdateScenesTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdateTransactions, 0);
  objc_storeStrong((id *)&self->_updateSceneTransactions, 0);
  objc_storeStrong((id *)&self->_processLaunchTransaction, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
}

id __88__FBApplicationUpdateScenesTransaction_initWithClientIdentity_executionContextProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  FBMutableProcessExecutionContext *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = (void *)*((_QWORD *)WeakRetained + 28);
  else
    v4 = 0;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6
    || ((*(void (**)(void))(v6 + 16))(),
        (v7 = (FBMutableProcessExecutionContext *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = -[FBProcessExecutionContext initWithIdentity:]([FBMutableProcessExecutionContext alloc], "initWithIdentity:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FBProcessExecutionContext copyOrUpdateForSceneActivationWithSettings:](v7, "copyOrUpdateForSceneActivationWithSettings:", v9);

  return v10;
}

- (FBApplicationUpdateScenesTransaction)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBApplicationUpdateScenesTransaction *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBApplicationUpdateScenesTransaction *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on FBApplicationProcessLaunchTransaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBApplicationUpdateScenesTransaction.m");
    v17 = 1024;
    v18 = 50;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBApplicationUpdateScenesTransaction *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBApplicationUpdateScenesTransaction)initWithApplicationBundleID:(id)a3 executionContextProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  FBApplicationUpdateScenesTransaction *v10;
  FBApplicationUpdateScenesTransaction *result;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FBApplicationUpdateScenesTransaction initWithProcessIdentity:executionContextProvider:](self, "initWithProcessIdentity:executionContextProvider:", v9, v8);

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bundleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBApplicationUpdateScenesTransaction initWithApplicationBundleID:executionContextProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    result = (FBApplicationUpdateScenesTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (NSString)bundleID
{
  void *v2;
  void *v3;

  -[FBSSceneClientIdentity processIdentity](self->_clientIdentity, "processIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedApplicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FBApplicationProcess)process
{
  NSObject *v3;

  -[FBApplicationUpdateScenesTransaction queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return (FBApplicationProcess *)-[FBApplicationProcessLaunchTransaction process](self->_processLaunchTransaction, "process");
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction removeObserver:](&v3, sel_removeObserver_, a3);
}

- (void)add:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction addObserver:](&v3, sel_addObserver_, a3);
}

- (void)remove:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction removeObserver:](&v3, sel_removeObserver_, a3);
}

- (void)_didRemoveChildTransaction:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction _didRemoveChildTransaction:](&v5, sel__didRemoveChildTransaction_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "removeObserver:", self);
    -[NSMutableArray removeObject:](self->_updateSceneTransactions, "removeObject:", v4);
  }

}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  id v3;
  char isKindOfClass;

  if (self->_processLaunchTransaction == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_willInterruptWithReason:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction _willInterruptWithReason:](&v13, sel__willInterruptWithReason_, a3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_updateSceneTransactions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setWaitsForSceneCommit:", 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void)_willFailWithReason:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)FBApplicationUpdateScenesTransaction;
  -[FBApplicationUpdateScenesTransaction _willFailWithReason:](&v13, sel__willFailWithReason_, a3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_updateSceneTransactions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setWaitsForSceneCommit:", 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (id)_customizedDescriptionProperties
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", self->_clientIdentity, CFSTR("ClientIdentity"));
  NSStringFromBOOL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Waits for scene commits"));

  return v3;
}

- (BOOL)_isReadyToLaunch
{
  return 1;
}

- (void)updateSceneTransactionWillUpdateScene:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__FBApplicationUpdateScenesTransaction_updateSceneTransactionWillUpdateScene___block_invoke;
  v6[3] = &unk_1E4A125F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FBApplicationUpdateScenesTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v6);

}

void __78__FBApplicationUpdateScenesTransaction_updateSceneTransactionWillUpdateScene___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transaction:willUpdateScene:", v3, v4);

  }
}

- (BOOL)waitsForSceneCommits
{
  return self->_waitsForSceneCommits;
}

- (void)initWithApplicationBundleID:executionContextProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithClientIdentity:(const char *)a1 executionContextProvider:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithClientIdentity:executionContextProvider:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_updateSceneWithIdentity:parameters:transitionContext:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_updateSceneWithIdentity:parameters:transitionContext:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
