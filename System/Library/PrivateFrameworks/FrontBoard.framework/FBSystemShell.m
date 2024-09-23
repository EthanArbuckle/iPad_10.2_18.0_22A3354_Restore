@implementation FBSystemShell

- (id)_initWithOptions:(id)a3
{
  id v4;
  FBSystemShell *v5;
  FBSystemShell *v6;
  uint64_t v7;
  NSMutableSet *lock_preventIdleSleepReasons;
  NSMutableArray *v9;
  NSMutableArray *lock_blocksToRunWhenReady;
  FBSystemShellInitializationContext *v11;
  void *v12;
  uint64_t v13;
  FBSystemShellInitializationContext *initializationContext;
  void *v15;
  void *v16;
  uint64_t v17;
  FBSystemShell *v18;
  uint64_t v19;
  id observerToken;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  RBSAssertion *runningAssertion;
  id v28;
  id v29;
  uint64_t v30;
  BKSSystemShellService *systemShellService;
  FBSystemShell *v32;
  _QWORD v34[4];
  id v35;
  uint8_t *v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  FBSystemShell *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  FBSystemShell *v46;
  objc_super v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)FBSystemShell;
  v5 = -[FBSystemShell init](&v47, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    lock_preventIdleSleepReasons = v6->_lock_preventIdleSleepReasons;
    v6->_lock_preventIdleSleepReasons = (NSMutableSet *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lock_blocksToRunWhenReady = v6->_lock_blocksToRunWhenReady;
    v6->_lock_blocksToRunWhenReady = v9;

    v11 = [FBSystemShellInitializationContext alloc];
    v12 = (void *)objc_msgSend(v4, "copy");
    v13 = -[FBSystemShellInitializationContext _initWithOptions:](v11, "_initWithOptions:", v12);
    initializationContext = v6->_initializationContext;
    v6->_initializationContext = (FBSystemShellInitializationContext *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __34__FBSystemShell__initWithOptions___block_invoke;
    v45[3] = &unk_1E4A122D0;
    v18 = v6;
    v46 = v18;
    objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", CFSTR("FBSystemShellReadyNotification"), 0, v16, v45);
    v19 = objc_claimAutoreleasedReturnValue();
    observerToken = v18->_observerToken;
    v18->_observerToken = (id)v19;

    -[FBSystemShell _setSystemIdleSleepDisabled:forReason:](v18, "_setSystemIdleSleepDisabled:forReason:", 1, CFSTR("FBSystemShellStartup"));
    FBLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A359A000, v21, OS_LOG_TYPE_INFO, "Taking out the system app's process assertion.", buf, 2u);
    }

    kdebug_trace();
    v22 = objc_alloc(MEMORY[0x1E0D87C98]);
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("SystemShell"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v22, "initWithExplanation:target:attributes:", CFSTR("FBSystemShell"), v23, v25);
    runningAssertion = v18->_runningAssertion;
    v18->_runningAssertion = (RBSAssertion *)v26;

    -[RBSAssertion acquireWithError:](v18->_runningAssertion, "acquireWithError:", 0);
    kdebug_trace();
    kdebug_trace();
    v28 = objc_alloc(MEMORY[0x1E0D00DE0]);
    v43[0] = v17;
    v43[1] = 3221225472;
    v43[2] = __34__FBSystemShell__initWithOptions___block_invoke_28;
    v43[3] = &unk_1E4A122F8;
    v29 = v4;
    v44 = v29;
    v30 = objc_msgSend(v28, "initWithConfigurator:", v43);
    systemShellService = v18->_systemShellService;
    v18->_systemShellService = (BKSSystemShellService *)v30;

    kdebug_trace();
    *(_QWORD *)buf = 0;
    v38 = buf;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__1;
    v41 = __Block_byref_object_dispose__1;
    v32 = v18;
    v42 = v32;
    v34[0] = v17;
    v34[1] = 3221225472;
    v34[2] = __34__FBSystemShell__initWithOptions___block_invoke_30;
    v34[3] = &unk_1E4A12320;
    v35 = v29;
    v36 = buf;
    -[FBSystemShell _addBlockToExecuteWhenReady:](v32, "_addBlockToExecuteWhenReady:", v34);

    _Block_object_dispose(buf, 8);
  }

  return v6;
}

uint64_t __34__FBSystemShell__initWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "readyForInteraction");
}

void __34__FBSystemShell__initWithOptions___block_invoke_28(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setWaitForDataMigration:", objc_msgSend(*(id *)(a1 + 32), "shouldWaitForMigrator"));
  objc_msgSend(*(id *)(a1 + 32), "systemSleepInterval");
  objc_msgSend(v4, "setIdleSleepInterval:");
  objc_msgSend(*(id *)(a1 + 32), "independentWatchdogPortName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v4, "setCollectiveWatchdogPingBlock:", 0);

}

void __34__FBSystemShell__initWithOptions___block_invoke_30(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "independentWatchdogPortName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (v2)
  {
    objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
    wd_endpoint_register();
    wd_endpoint_add_queue();
    +[FBSystemService sharedInstanceIfExists](FBSystemService, "sharedInstanceIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_applicationInfoProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "_synchronizationQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        wd_endpoint_add_queue();

    }
    wd_endpoint_activate();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_setSystemIdleSleepDisabled:forReason:", 0, CFSTR("FBSystemShellStartup"));

}

+ (id)_createSingletonWithOptions:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v8;
  _QWORD block[4];
  id v10;

  v3 = a3;
  if (__instance)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot create multiple FBSystemShell instances."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSystemShell _createSingletonWithOptions:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C623CLL);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FBSystemShell__createSingletonWithOptions___block_invoke;
  block[3] = &unk_1E4A12348;
  v10 = v3;
  v4 = _createSingletonWithOptions__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&_createSingletonWithOptions__onceToken, block);
  v6 = (id)__instance;

  return v6;
}

void __45__FBSystemShell__createSingletonWithOptions___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = -[FBSystemShell _initWithOptions:]([FBSystemShell alloc], "_initWithOptions:", *(_QWORD *)(a1 + 32));
  v2 = (void *)__instance;
  __instance = (uint64_t)v1;

}

+ (id)sharedInstance
{
  return (id)__instance;
}

- (void)readyForInteraction
{
  -[FBSystemShell _setState:](self, "_setState:", 2);
}

- (void)sendActionsToBackBoard:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BKSSystemShellService *systemShellService;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          systemShellService = self->_systemShellService;
          v11 = v9;
          -[BKSSystemShellService restartWithOptions:](systemShellService, "restartWithOptions:", objc_msgSend(v11, "options"));

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)assertWatchdogEnabledForLimitedDurationForReason:(id)a3
{
  id v4;
  void *v5;
  BSCompoundAssertion *v6;
  BSCompoundAssertion *lock_temporaryWatchdogAssertion;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_temporaryWatchdogAssertion)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0D22F98];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__FBSystemShell_assertWatchdogEnabledForLimitedDurationForReason___block_invoke;
    v10[3] = &unk_1E4A12370;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("FBSystemShell temporary watchdog"), v10);
    v6 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    lock_temporaryWatchdogAssertion = self->_lock_temporaryWatchdogAssertion;
    self->_lock_temporaryWatchdogAssertion = v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(&self->_lock);
  -[BSCompoundAssertion acquireForReason:](self->_lock_temporaryWatchdogAssertion, "acquireForReason:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __66__FBSystemShell_assertWatchdogEnabledForLimitedDurationForReason___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[5], "setIndependentWatchdogEnabled:", objc_msgSend(v5, "isActive"));

}

- (void)_initializationComplete
{
  -[FBSystemShell _setState:](self, "_setState:", 1);
}

- (void)_addBlockToExecuteWhenReady:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *lock_blocksToRunWhenReady;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_blocksToRunWhenReady = self->_lock_blocksToRunWhenReady;
  if (lock_blocksToRunWhenReady)
  {
    v6 = (void *)MEMORY[0x1A8590C4C](v7);
    -[NSMutableArray addObject:](lock_blocksToRunWhenReady, "addObject:", v6);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v7[2]();
  }

}

- (void)_startSystemShellService
{
  -[BKSSystemShellService start](self->_systemShellService, "start");
}

- (void)_informSystemShellServiceDidFinishLaunching
{
  -[BKSSystemShellService didFinishLaunching](self->_systemShellService, "didFinishLaunching");
}

- (NSString)description
{
  return (NSString *)-[FBSystemShell descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSystemShell succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromFBSystemShellState(self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("state"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSystemShell descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[FBSystemShell succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_initializationContext, CFSTR("initializationContext"), 1);
  return v4;
}

- (void)_setSystemIdleSleepDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  NSMutableSet *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSMutableSet *lock_preventIdleSleepReasons;
  uint64_t v12;
  RBSAssertion *lock_preventSleepAssertion;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  RBSAssertion *v19;
  RBSAssertion *v20;
  NSObject *v21;
  RBSAssertion *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  NSMutableSet *v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = (NSMutableSet *)a4;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSystemShell _setSystemIdleSleepDisabled:forReason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C6AC4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSystemShell _setSystemIdleSleepDisabled:forReason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C6B28);
  }

  os_unfair_lock_lock(&self->_lock);
  v7 = -[NSMutableSet containsObject:](self->_lock_preventIdleSleepReasons, "containsObject:", v6);
  if (v4)
  {
    if ((v7 & 1) == 0)
    {
      FBLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v6;
        _os_log_impl(&dword_1A359A000, v8, OS_LOG_TYPE_INFO, "Preventing system idle sleep for reason: %{public}@", buf, 0xCu);
      }

      -[NSMutableSet addObject:](self->_lock_preventIdleSleepReasons, "addObject:", v6);
    }
  }
  else if (v7)
  {
    FBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v6;
      _os_log_impl(&dword_1A359A000, v9, OS_LOG_TYPE_INFO, "Allowing system idle sleep for reason: %{public}@", buf, 0xCu);
    }

    -[NSMutableSet removeObject:](self->_lock_preventIdleSleepReasons, "removeObject:", v6);
  }
  FBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (-[NSMutableSet count](self->_lock_preventIdleSleepReasons, "count"))
      lock_preventIdleSleepReasons = self->_lock_preventIdleSleepReasons;
    else
      lock_preventIdleSleepReasons = (NSMutableSet *)CFSTR("(none)");
    *(_DWORD *)buf = 138543362;
    v27 = lock_preventIdleSleepReasons;
    _os_log_impl(&dword_1A359A000, v10, OS_LOG_TYPE_DEFAULT, "Prevent idle sleep reasons: %{public}@", buf, 0xCu);
  }

  v12 = -[NSMutableSet count](self->_lock_preventIdleSleepReasons, "count");
  lock_preventSleepAssertion = self->_lock_preventSleepAssertion;
  if (v12)
  {
    if (!lock_preventSleepAssertion)
    {
      FBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A359A000, v14, OS_LOG_TYPE_DEFAULT, "Now preventing system idle sleep.", buf, 2u);
      }

      v15 = objc_alloc(MEMORY[0x1E0D87C98]);
      objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.frontboard"), CFSTR("SystemShell-PreventIdleSleep"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (RBSAssertion *)objc_msgSend(v15, "initWithExplanation:target:attributes:", CFSTR("FBSystemApp-PreventIdleSleep"), v16, v18);
      v20 = self->_lock_preventSleepAssertion;
      self->_lock_preventSleepAssertion = v19;

      -[RBSAssertion acquireWithError:](self->_lock_preventSleepAssertion, "acquireWithError:", 0);
    }
  }
  else if (lock_preventSleepAssertion)
  {
    FBLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A359A000, v21, OS_LOG_TYPE_DEFAULT, "Now allowing system idle sleep.", buf, 2u);
    }

    -[RBSAssertion invalidate](self->_lock_preventSleepAssertion, "invalidate");
    v22 = self->_lock_preventSleepAssertion;
    self->_lock_preventSleepAssertion = 0;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_setState:(unint64_t)a3
{
  unint64_t state;
  void *v5;
  NSMutableArray *lock_blocksToRunWhenReady;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state == a3)
    return;
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      if (state == 1)
      {
        self->_state = 2;
        os_unfair_lock_lock(&self->_lock);
        v5 = (void *)-[NSMutableArray copy](self->_lock_blocksToRunWhenReady, "copy");
        lock_blocksToRunWhenReady = self->_lock_blocksToRunWhenReady;
        self->_lock_blocksToRunWhenReady = 0;

        os_unfair_lock_unlock(&self->_lock);
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v15;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v15 != v10)
                objc_enumerationMutation(v7);
              (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v9);
        }

        return;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSystemShell _setState:].cold.2();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set to state: uninitialized."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSystemShell _setState:].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C6CDCLL);
  }
  if (state)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSystemShell _setState:].cold.3();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35C6D34);
  }
  self->_state = 1;
}

- (FBSystemShellInitializationContext)initializationContext
{
  return self->_initializationContext;
}

- (unint64_t)_state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_temporaryWatchdogAssertion, 0);
  objc_storeStrong((id *)&self->_lock_blocksToRunWhenReady, 0);
  objc_storeStrong((id *)&self->_lock_preventIdleSleepReasons, 0);
  objc_storeStrong((id *)&self->_lock_preventSleepAssertion, 0);
  objc_storeStrong((id *)&self->_systemShellService, 0);
  objc_storeStrong((id *)&self->_runningAssertion, 0);
  objc_storeStrong(&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_initializationContext, 0);
}

+ (void)_createSingletonWithOptions:.cold.1()
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

- (void)_setSystemIdleSleepDisabled:forReason:.cold.1()
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

- (void)_setState:.cold.1()
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

- (void)_setState:.cold.2()
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

- (void)_setState:.cold.3()
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
