@implementation FBUpdateSceneTransaction

uint64_t __40__FBUpdateSceneTransaction__createScene__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteDidCommit:", a2);
}

- (void)_commitSceneUpdate:(id)a3
{
  void *v4;
  _BOOL4 waitsForSceneCommit;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);

  v11 = (void (**)(void))a3;
  if (self->_waitsForSceneCommit)
    -[FBUpdateSceneTransaction addMilestone:](self, "addMilestone:", CFSTR("sceneUpdateDidCommit"));
  -[FBUpdateSceneTransaction settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isForeground")
    || !-[FBSSceneTransitionContext _uikitShimming_isUISubclass](self->_transitionContext, "_uikitShimming_isUISubclass"))
  {
    goto LABEL_11;
  }
  waitsForSceneCommit = self->_waitsForSceneCommit;

  if (waitsForSceneCommit)
  {
    -[FBSSceneTransitionContext watchdogTransitionContext](self->_transitionContext, "watchdogTransitionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "watchdogBehavior");
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    objc_msgSend(v4, "setWatchdogBehavior:", v7);
    if (-[FBUpdateSceneTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    {
      NSStringFromFBWatchdogBehavior(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBUpdateSceneTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Updating scene with watchdog policy: %@"), v8);

    }
LABEL_11:

  }
  v11[2]();
  -[FBUpdateSceneTransaction scene](self, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  -[FBSSceneTransitionContext animationFence](self->_transitionContext, "animationFence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

}

- (FBSSceneSettings)settings
{
  return (FBSSceneSettings *)-[FBSSceneParameters settings](self->_parameters, "settings");
}

uint64_t __40__FBUpdateSceneTransaction__createScene__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v12[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 152);
  v4 = *(_QWORD *)(v2 + 168);
  objc_msgSend(*(id *)(v2 + 176), "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(v8 + 184);
  v12[1] = 3221225472;
  v12[2] = __40__FBUpdateSceneTransaction__createScene__block_invoke_2;
  v12[3] = &unk_1E4A13658;
  v12[4] = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v10 = (id)objc_msgSend(v3, "_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:", v4, v5, v6, v9, 0, v7, v12);

  objc_msgSend(*(id *)(a1 + 32), "_noteDidCreate");
  return objc_msgSend(*(id *)(a1 + 32), "_noteWillCommit");
}

- (void)_noteWillCommit
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__FBUpdateSceneTransaction__noteWillCommit__block_invoke;
  v2[3] = &unk_1E4A13680;
  v2[4] = self;
  -[FBUpdateSceneTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v2);
}

- (void)_noteDidCreate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__FBUpdateSceneTransaction__noteDidCreate__block_invoke;
  v2[3] = &unk_1E4A13680;
  v2[4] = self;
  -[FBUpdateSceneTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v2);
}

- (void)_createScene
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;

  -[FBSSceneDefinition clientIdentity](self->_definition, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isLocal") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqual:", v3),
        v4,
        v5))
  {
    +[FBLocalSynchronousSceneClientProvider sharedInstance](FBLocalSynchronousSceneClientProvider, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneDefinition clientIdentity](self->_definition, "clientIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processForIdentity:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workspace");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v14;
  }
  v15 = v6;
  if (v6)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __40__FBUpdateSceneTransaction__createScene__block_invoke;
    v16[3] = &unk_1E4A11FD0;
    v16[4] = self;
    v17 = v6;
    -[FBUpdateSceneTransaction _commitSceneUpdate:](self, "_commitSceneUpdate:", v16);

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[FBSSceneDefinition clientIdentity](self->_definition, "clientIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("no client provider for client with identity %@"), v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBUpdateSceneTransaction _failWithReason:description:](self, "_failWithReason:description:", CFSTR("scene update failed"), v13);

  }
}

- (void)_didComplete
{
  void *v3;
  objc_super v4;

  -[FBUpdateSceneTransaction scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FBUpdateSceneTransaction;
  -[FBUpdateSceneTransaction _didComplete](&v4, sel__didComplete);
}

- (void)performSynchronizedCommit
{
  id v3;

  if (-[FBUpdateSceneTransaction isReadyForSynchronizedCommit](self, "isReadyForSynchronizedCommit"))
  {
    self->_didCommit = 1;
    if (-[FBUpdateSceneTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[FBUpdateSceneTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Performing synchronized commit."));
    -[FBUpdateSceneTransaction synchronizationDelegate](self, "synchronizationDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronizedTransaction:willCommitSynchronizedTransactions:", self, 0);
    -[FBUpdateSceneTransaction _performCommit](self, "_performCommit");
    objc_msgSend(v3, "synchronizedTransaction:didCommitSynchronizedTransactions:", self, 0);
    -[FBUpdateSceneTransaction satisfyMilestone:](self, "satisfyMilestone:", CFSTR("synchronizedCommit"));

  }
}

- (FBSynchronizedTransactionDelegate)synchronizationDelegate
{
  return (FBSynchronizedTransactionDelegate *)objc_loadWeakRetained((id *)&self->_synchronizationDelegate);
}

- (BOOL)isReadyForSynchronizedCommit
{
  return !self->_didCommit && self->_readyToCommit;
}

- (void)_performCommit
{
  void *v3;

  -[FBUpdateSceneTransaction scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[FBUpdateSceneTransaction _updateScene](self, "_updateScene");
  else
    -[FBUpdateSceneTransaction _createScene](self, "_createScene");
}

void __43__FBUpdateSceneTransaction__noteWillCommit__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "updateSceneTransactionWillCommitUpdate:", *(_QWORD *)(a1 + 32));

}

void __43__FBUpdateSceneTransaction__noteDidCommit___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "updateSceneTransactionDidCommitUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  FBWaitForSceneDestructionTransaction *v6;
  FBWaitForSceneDestructionTransaction *destructionTransaction;
  objc_super v8;

  -[FBUpdateSceneTransaction scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && objc_msgSend(v4, "isPendingExit"))
  {
    if (-[FBUpdateSceneTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
      -[FBUpdateSceneTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Scene exists but is invalidated. Waiting for it to be destroyed..."));
    v6 = -[FBWaitForSceneDestructionTransaction initWithScene:]([FBWaitForSceneDestructionTransaction alloc], "initWithScene:", v3);
    destructionTransaction = self->_destructionTransaction;
    self->_destructionTransaction = v6;

    -[FBUpdateSceneTransaction addChildTransaction:](self, "addChildTransaction:", self->_destructionTransaction);
  }
  else
  {
    -[FBUpdateSceneTransaction _commitSceneOrWait](self, "_commitSceneOrWait");
  }
  v8.receiver = self;
  v8.super_class = (Class)FBUpdateSceneTransaction;
  -[FBUpdateSceneTransaction _begin](&v8, sel__begin);

}

- (void)_commitSceneOrWait
{
  void *v3;
  id v4;

  self->_readyToCommit = 1;
  -[FBUpdateSceneTransaction addMilestone:](self, "addMilestone:", CFSTR("synchronizedCommit"));
  -[FBUpdateSceneTransaction synchronizationDelegate](self, "synchronizationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "synchronizedTransactionReadyToCommit:", self);
  else
    -[FBUpdateSceneTransaction performSynchronizedCommit](self, "performSynchronizedCommit");

}

void __35__FBUpdateSceneTransaction_dealloc__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "sceneWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 48));

}

- (void)setWaitsForSceneCommit:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  char v8;

  v3 = a3;
  -[FBUpdateSceneTransaction queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_waitsForSceneCommit != v3)
  {
    self->_waitsForSceneCommit = v3;
    v6 = -[FBUpdateSceneTransaction isWaitingForMilestone:](self, "isWaitingForMilestone:", CFSTR("sceneUpdateDidCommit"));
    if (self->_waitsForSceneCommit || v6 == 0)
    {
      if (self->_waitsForSceneCommit)
        v8 = v6;
      else
        v8 = 1;
      if ((v8 & 1) == 0 && (-[FBUpdateSceneTransaction isComplete](self, "isComplete") & 1) == 0)
        -[FBUpdateSceneTransaction addMilestone:](self, "addMilestone:", CFSTR("sceneUpdateDidCommit"));
    }
    else
    {
      -[FBUpdateSceneTransaction removeMilestone:](self, "removeMilestone:", CFSTR("sceneUpdateDidCommit"));
    }
  }
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBUpdateSceneTransaction;
  -[FBUpdateSceneTransaction addObserver:](&v3, sel_addObserver_, a3);
}

- (id)_initWithSceneDefinition:(id)a3 parameters:(id)a4 transitionContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  FBUpdateSceneTransaction *v15;
  uint64_t v16;
  FBSceneManager *sceneManager;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *sceneID;
  uint64_t v22;
  FBSSceneDefinition *definition;
  uint64_t v24;
  FBSSceneParameters *parameters;
  uint64_t v26;
  FBSSceneTransitionContext *transitionContext;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  NSClassFromString(CFSTR("FBSSceneDefinition"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:].cold.1();
LABEL_28:
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35AC260);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneDefinitionClass]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:].cold.1();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35AC2C4);
  }

  v13 = v10;
  NSClassFromString(CFSTR("FBSSceneParameters"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35AC328);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneParametersClass]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35AC38CLL);
  }

  if ((objc_msgSend(v12, "isValid") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[definition isValid]"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:].cold.4();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35AC3F0);
  }
  v14 = v11;
  if (v14)
  {
    NSClassFromString(CFSTR("FBSSceneTransitionContext"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSSceneTransitionContextClass]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:].cold.3();
      goto LABEL_28;
    }
  }

  v34.receiver = self;
  v34.super_class = (Class)FBUpdateSceneTransaction;
  v15 = -[FBTransaction init](&v34, sel_init);
  if (v15)
  {
    +[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    sceneManager = v15->_sceneManager;
    v15->_sceneManager = (FBSceneManager *)v16;

    objc_msgSend(v12, "identity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    sceneID = v15->_sceneID;
    v15->_sceneID = (NSString *)v20;

    v22 = objc_msgSend(v12, "copy");
    definition = v15->_definition;
    v15->_definition = (FBSSceneDefinition *)v22;

    v24 = objc_msgSend(v13, "copy");
    parameters = v15->_parameters;
    v15->_parameters = (FBSSceneParameters *)v24;

    v26 = objc_msgSend(v14, "copy");
    transitionContext = v15->_transitionContext;
    v15->_transitionContext = (FBSSceneTransitionContext *)v26;

    v15->_waitsForSceneCommit = 1;
  }

  return v15;
}

- (FBScene)scene
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  FBScene *result;
  void *v7;

  -[FBUpdateSceneTransaction queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[FBSceneManager sceneWithIdentifier:](self->_sceneManager, "sceneWithIdentifier:", self->_sceneID);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4 || -[FBScene _isLegacy](v4))
    return (FBScene *)v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this transaction only supports legacy scenes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBUpdateSceneTransaction scene].cold.1();
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = (FBScene *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)setSynchronizationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_synchronizationDelegate, a3);
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBUpdateSceneTransaction;
  -[FBUpdateSceneTransaction removeObserver:](&v3, sel_removeObserver_, a3);
}

void __42__FBUpdateSceneTransaction__noteDidCreate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "updateSceneTransactionDidCreateScene:", *(_QWORD *)(a1 + 32));

}

- (void)_noteDidCommit:(BOOL)a3
{
  id v4;
  _QWORD v5[5];

  if (a3)
  {
    if ((-[FBUpdateSceneTransaction isFailed](self, "isFailed") & 1) == 0)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __43__FBUpdateSceneTransaction__noteDidCommit___block_invoke;
      v5[3] = &unk_1E4A13680;
      v5[4] = self;
      -[FBUpdateSceneTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v5);
      -[FBUpdateSceneTransaction satisfyMilestone:](self, "satisfyMilestone:", CFSTR("sceneUpdateDidCommit"));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Scene update failed"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[FBUpdateSceneTransaction _failWithReason:description:](self, "_failWithReason:description:", CFSTR("scene update failed"), v4);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_synchronizationDelegate);
  objc_storeStrong((id *)&self->_destructionTransaction, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)dealloc
{
  NSString *v3;
  FBSceneManager *v4;
  NSString *v5;
  FBSceneManager *v6;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  FBSceneManager *v12;
  NSString *v13;
  FBUpdateSceneTransaction *v14;

  v3 = self->_sceneID;
  v4 = self->_sceneManager;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __35__FBUpdateSceneTransaction_dealloc__block_invoke;
  v11 = &unk_1E4A13630;
  v12 = v4;
  v13 = v3;
  v14 = self;
  v5 = v3;
  v6 = v4;
  BSDispatchMain();

  v7.receiver = self;
  v7.super_class = (Class)FBUpdateSceneTransaction;
  -[FBUpdateSceneTransaction dealloc](&v7, sel_dealloc);
}

- (FBUpdateSceneTransaction)initWithSceneIdentifier:(id)a3 process:(id)a4 parameters:(id)a5 transitionContext:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  FBUpdateSceneTransaction *v21;

  v10 = (void *)MEMORY[0x1E0D23140];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "definition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setIdentity:", v16);
  v17 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(v13, "identity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "identityForProcessIdentity:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClientIdentity:", v19);

  objc_msgSend(v12, "specification");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSpecification:", v20);

  v21 = -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:](self, "_initWithSceneDefinition:parameters:transitionContext:", v15, v12, v11);
  return v21;
}

- (FBUpdateSceneTransaction)initWithSceneToUpdate:(id)a3 newSettings:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FBUpdateSceneTransaction *v16;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sceneID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBUpdateSceneTransaction initWithSceneToUpdate:newSettings:transitionContext:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E3E88);
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("newSettings"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBUpdateSceneTransaction initWithSceneToUpdate:newSettings:transitionContext:].cold.2();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E3EECLL);
  }
  v11 = v10;
  +[FBSceneManager sharedInstance](FBSceneManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sceneWithIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[FBScene _isLegacy]((_BOOL8)v13))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this transaction only supports legacy scenes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBUpdateSceneTransaction initWithSceneToUpdate:newSettings:transitionContext:].cold.3();
    goto LABEL_13;
  }
  objc_msgSend(v13, "parameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSettings:", v9);
  objc_msgSend(v13, "definition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:](self, "_initWithSceneDefinition:parameters:transitionContext:", v15, v14, v11);

  return v16;
}

- (FBSSceneSpecification)specification
{
  return (FBSSceneSpecification *)-[FBSSceneParameters specification](self->_parameters, "specification");
}

- (void)add:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBUpdateSceneTransaction;
  -[FBUpdateSceneTransaction addObserver:](&v3, sel_addObserver_, a3);
}

- (void)remove:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBUpdateSceneTransaction;
  -[FBUpdateSceneTransaction removeObserver:](&v3, sel_removeObserver_, a3);
}

- (void)_updateScene
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

uint64_t __40__FBUpdateSceneTransaction__updateScene__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "_noteWillUpdate");
  objc_msgSend(*(id *)(a1 + 32), "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 184);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__FBUpdateSceneTransaction__updateScene__block_invoke_2;
  v7[3] = &unk_1E4A11FA8;
  v7[4] = v4;
  objc_msgSend(v2, "updateSettings:withTransitionContext:completion:", v3, v5, v7);

  return objc_msgSend(*(id *)(a1 + 32), "_noteWillCommit");
}

uint64_t __40__FBUpdateSceneTransaction__updateScene__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteDidCommit:", a2);
}

- (void)_childTransactionDidComplete:(id)a3
{
  FBWaitForSceneDestructionTransaction *v4;
  FBWaitForSceneDestructionTransaction *v5;
  FBWaitForSceneDestructionTransaction *destructionTransaction;
  objc_super v7;

  v4 = (FBWaitForSceneDestructionTransaction *)a3;
  v5 = v4;
  if (self->_destructionTransaction == v4)
  {
    if ((-[FBWaitForSceneDestructionTransaction isFailed](v4, "isFailed") & 1) == 0
      && (-[FBWaitForSceneDestructionTransaction isInterrupted](v5, "isInterrupted") & 1) == 0)
    {
      if (-[FBUpdateSceneTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
        -[FBUpdateSceneTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Invalidated scene was destroyed."));
      -[FBUpdateSceneTransaction _commitSceneOrWait](self, "_commitSceneOrWait");
    }
    destructionTransaction = self->_destructionTransaction;
    self->_destructionTransaction = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)FBUpdateSceneTransaction;
  -[FBUpdateSceneTransaction _childTransactionDidComplete:](&v7, sel__childTransactionDidComplete_, v5);

}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (id)_customizedDescriptionProperties
{
  void *v3;
  void *v4;
  const __CFString *sceneID;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_sceneID)
    sceneID = (const __CFString *)self->_sceneID;
  else
    sceneID = CFSTR("(none)");
  objc_msgSend(v3, "setObject:forKey:", sceneID, CFSTR("SceneID"));
  -[FBUpdateSceneTransaction settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FBUpdateSceneTransaction settings](self, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isForeground"))
      v8 = CFSTR("Foreground");
    else
      v8 = CFSTR("Background");
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("Scene Visibility"));

  }
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("Wait for Commit"));

  return v4;
}

- (void)_noteWillUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__FBUpdateSceneTransaction__noteWillUpdate__block_invoke;
  v2[3] = &unk_1E4A13680;
  v2[4] = self;
  -[FBUpdateSceneTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v2);
}

void __43__FBUpdateSceneTransaction__noteWillUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "updateSceneTransactionWillUpdateScene:", *(_QWORD *)(a1 + 32));

}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "removeObserver:", self);
  self->_destroyed = 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Scene destroyed: %@"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[FBUpdateSceneTransaction _failWithReason:description:](self, "_failWithReason:description:", CFSTR("scene update failed"), v5);
}

- (NSString)sceneIdentifier
{
  return self->_sceneID;
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (BOOL)destroyed
{
  return self->_destroyed;
}

- (BOOL)waitsForSceneCommit
{
  return self->_waitsForSceneCommit;
}

- (void)_initWithSceneDefinition:parameters:transitionContext:.cold.1()
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

- (void)_initWithSceneDefinition:(const char *)a1 parameters:transitionContext:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_9_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_initWithSceneDefinition:parameters:transitionContext:.cold.3()
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

- (void)_initWithSceneDefinition:parameters:transitionContext:.cold.4()
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

- (void)initWithSceneToUpdate:newSettings:transitionContext:.cold.1()
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

- (void)initWithSceneToUpdate:newSettings:transitionContext:.cold.2()
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

- (void)initWithSceneToUpdate:newSettings:transitionContext:.cold.3()
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

- (void)scene
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

@end
