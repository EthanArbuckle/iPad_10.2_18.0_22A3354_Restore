@implementation BGTaskScheduler

- (void)cancelTaskRequestWithIdentifier:(NSString *)identifier
{
  NSString *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = identifier;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_2116F8000, v5, OS_LOG_TYPE_DEFAULT, "cancelTaskRequestWithIdentifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[BGTaskScheduler _scheduler](self, "_scheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelTaskRequestWithIdentifier:", v4);

}

- (void)cancelAllTaskRequests
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2116F8000, v3, OS_LOG_TYPE_DEFAULT, "cancelAllTaskRequests", v5, 2u);
  }

  -[BGTaskScheduler _scheduler](self, "_scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllTaskRequests");

}

- (void)getPendingTaskRequestsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = completionHandler;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2116F8000, v5, OS_LOG_TYPE_DEFAULT, "Getting pending task requests", buf, 2u);
  }

  -[BGTaskScheduler _scheduler](self, "_scheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__BGTaskScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke;
  v8[3] = &unk_24CC62200;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getPendingTaskRequestsWithCompletionHandler:", v8);

}

void __63__BGTaskScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v24 = v6;
      _os_log_impl(&dword_2116F8000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching activities: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v24 = v5;
      _os_log_impl(&dword_2116F8000, v7, OS_LOG_TYPE_DEFAULT, "Found pending activities: %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          +[BGTaskRequest _requestFromActivity:](BGTaskRequest, "_requestFromActivity:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v16 = *(_QWORD *)(a1 + 32);
    v17 = (void *)objc_msgSend(v9, "copy");
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  }
}

void __34__BGTaskScheduler_sharedScheduler__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_isRunningInExtension"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  }
  atomic_store(1u, sharedSchedulerCreated);
  v3 = -[BGTaskScheduler _init]([BGTaskScheduler alloc], "_init");
  v4 = (void *)sharedScheduler_sharedScheduler;
  sharedScheduler_sharedScheduler = (uint64_t)v3;

}

- (id)_init
{
  BGTaskScheduler *v2;
  BGTaskScheduler *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *registrations;
  uint64_t v6;
  NSMapTable *runningTasksMap;
  uint64_t v8;
  _DASActivityBackgroundTasksScheduler *scheduler;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BGTaskScheduler;
  v2 = -[BGTaskScheduler init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->__lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    registrations = v3->__registrations;
    v3->__registrations = v4;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    runningTasksMap = v3->__runningTasksMap;
    v3->__runningTasksMap = (NSMapTable *)v6;

    objc_msgSend(MEMORY[0x24BE2E228], "sharedScheduler");
    v8 = objc_claimAutoreleasedReturnValue();
    scheduler = v3->__scheduler;
    v3->__scheduler = (_DASActivityBackgroundTasksScheduler *)v8;

  }
  return v3;
}

- (BOOL)submitTaskRequest:(BGTaskRequest *)taskRequest error:(NSError *)error
{
  BGTaskRequest *v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  BGTaskRequest *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = taskRequest;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_2116F8000, v7, OS_LOG_TYPE_DEFAULT, "submitTaskRequest: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock(&self->__lock);
  v8 = -[BGTaskScheduler _unsafe_submitTaskRequest:error:](self, "_unsafe_submitTaskRequest:error:", v6, error);
  os_unfair_lock_unlock(&self->__lock);

  return v8;
}

- (BOOL)_unsafe_submitTaskRequest:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  _DASActivityBackgroundTasksScheduler *scheduler;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "_correspondingTaskClass"))
  {
LABEL_23:
    v13 = 0;
    goto LABEL_24;
  }
  if ((objc_msgSend((id)objc_opt_class(), "_isRunningInExtension") & 1) == 0)
  {
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BGTaskScheduler _unsafe_registrationForIdentifier:](self, "_unsafe_registrationForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (!v9 && (isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "infoDictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", CFSTR("BGTaskSchedulerPermittedIdentifiers"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v7, "identifier"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v22, "containsObject:", v23),
              v23,
              (v24 & 1) != 0))
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BGTaskScheduler.m"), 274, CFSTR("No launch handler registered for task with identifier %@"), v26);

        }
        else if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BGTaskSchedulerErrorDomain"), 3, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_23;
      }
    }

  }
  scheduler = self->__scheduler;
  objc_msgSend(v7, "_activity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASActivityBackgroundTasksScheduler submitTaskRequest:](scheduler, "submitTaskRequest:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12 == 0;
  if (v12)
  {
    +[BGTaskScheduler _log](BGTaskScheduler, "_log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v7;
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_2116F8000, v14, OS_LOG_TYPE_DEFAULT, "Error submitting task request: %{public}@, error: %{public}@", buf, 0x16u);
    }

    if (a4)
    {
      objc_msgSend(v12, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE2E250]);

      if (v16 && (v17 = objc_msgSend(v12, "code"), (unint64_t)(v17 - 2) <= 2))
        v18 = qword_2117006A8[v17 - 2];
      else
        v18 = 1;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BGTaskSchedulerErrorDomain"), v18, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_24:
  return v13;
}

- (id)_unsafe_registrationForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BGTaskScheduler _registrations](self, "_registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __50__BGTaskScheduler__applicationDidFinishLaunching___block_invoke(uint64_t a1)
{
  id v1;

  atomic_store(1u, appHasLaunched);
  objc_msgSend(*(id *)(a1 + 32), "_sharedSchedulerIfExists");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_handleAppLaunch");

}

+ (id)_sharedSchedulerIfExists
{
  unsigned __int8 v2;

  v2 = atomic_load(sharedSchedulerCreated);
  if ((v2 & 1) == 0)
    return 0;
  objc_msgSend(a1, "sharedScheduler");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BGTaskScheduler)sharedScheduler
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__BGTaskScheduler_sharedScheduler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedScheduler_onceToken != -1)
    dispatch_once(&sharedScheduler_onceToken, block);
  return (BGTaskScheduler *)(id)sharedScheduler_sharedScheduler;
}

+ (void)_applicationDidFinishLaunching:(id)a3
{
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  _QWORD block[5];

  +[BGTaskScheduler _log](BGTaskScheduler, "_log", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[BGTaskScheduler _applicationDidFinishLaunching:].cold.1(v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", a1);

  if ((objc_msgSend(a1, "_isRunningInExtension") & 1) == 0)
  {
    v6 = atomic_load(appHasLaunched);
    if ((v6 & 1) == 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __50__BGTaskScheduler__applicationDidFinishLaunching___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

- (BOOL)registerForTaskWithIdentifier:(NSString *)identifier usingQueue:(dispatch_queue_t)queue launchHandler:(void *)launchHandler
{
  NSString *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_unfair_lock_s *p_lock;
  BOOL v13;

  v8 = identifier;
  v9 = launchHandler;
  v10 = queue;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[BGTaskScheduler registerForTaskWithIdentifier:usingQueue:launchHandler:].cold.1((uint64_t)v8, v11);

  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  v13 = -[BGTaskScheduler _unsafe_registerForTaskWithIdentifier:usingQueue:launchHandler:](self, "_unsafe_registerForTaskWithIdentifier:usingQueue:launchHandler:", v8, v10, v9);

  os_unfair_lock_unlock(p_lock);
  return v13;
}

+ (id)_log
{
  if (_log_onceToken != -1)
    dispatch_once(&_log_onceToken, &__block_literal_global_71);
  return (id)_log_log;
}

- (BOOL)_unsafe_registerForTaskWithIdentifier:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  _BGTaskSchedulerRegistration *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend((id)objc_opt_class(), "_isNotApplication") & 1) != 0
    || (-[BGTaskScheduler _permittedIdentifiers](self, "_permittedIdentifiers"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "containsObject:", v9),
        v12,
        v13))
  {
    v14 = atomic_load(appHasLaunched);
    if ((v14 & 1) != 0 && (objc_msgSend((id)objc_opt_class(), "_isNotApplication") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (_BGTaskSchedulerRegistration *)objc_claimAutoreleasedReturnValue();
      -[_BGTaskSchedulerRegistration handleFailureInMethod:object:file:lineNumber:description:](v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BGTaskScheduler.m"), 225, CFSTR("All launch handlers must be registered before application finishes launching"), v24);
    }
    else
    {
      -[BGTaskScheduler _registrations](self, "_registrations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[BGTaskScheduler _registrations](self, "_registrations");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (!v20)
        {
          -[BGTaskScheduler _scheduler](self, "_scheduler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setBackgroundTasksSchedulerDelegate:", self);

        }
        v17 = -[_BGTaskSchedulerRegistration initWithIdentifier:queue:launchHandler:]([_BGTaskSchedulerRegistration alloc], "initWithIdentifier:queue:launchHandler:", v9, v10, v11);
        -[BGTaskScheduler _registrations](self, "_registrations");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, v9);

        v18 = 1;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (_BGTaskSchedulerRegistration *)objc_claimAutoreleasedReturnValue();
      -[_BGTaskSchedulerRegistration handleFailureInMethod:object:file:lineNumber:description:](v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BGTaskScheduler.m"), 229, CFSTR("Launch handler for task with identifier %@ has already been registered"), v9);
    }
    v18 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (NSMutableDictionary)_registrations
{
  return self->__registrations;
}

+ (BOOL)_isRunningInExtension
{
  if (_isRunningInExtension_once != -1)
    dispatch_once(&_isRunningInExtension_once, &__block_literal_global_0);
  return _isRunningInExtension_result;
}

- (NSSet)_permittedIdentifiers
{
  NSSet *permittedIdentifiers;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  permittedIdentifiers = self->__permittedIdentifiers;
  if (!permittedIdentifiers)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("BGTaskSchedulerPermittedIdentifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v6 = (void *)MEMORY[0x24BDBD1A8];
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->__permittedIdentifiers;
    self->__permittedIdentifiers = v7;

    permittedIdentifiers = self->__permittedIdentifiers;
  }
  return permittedIdentifiers;
}

void __40__BGTaskScheduler__isRunningInExtension__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NSExtension"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    _isRunningInExtension_result = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "infoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("PlugInKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _isRunningInExtension_result = v4 != 0;

  }
}

+ (void)load
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__applicationDidFinishLaunching_, CFSTR("UIApplicationDidFinishLaunchingNotification"), 0);

}

- (_DASActivityBackgroundTasksScheduler)_scheduler
{
  return self->__scheduler;
}

- (void)_handleAppLaunch
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2116F8000, v3, OS_LOG_TYPE_DEFAULT, "Handling app launch", v12, 2u);
  }

  os_unfair_lock_lock(&self->__lock);
  -[BGTaskScheduler _queuedLaunchActivities](self, "_queuedLaunchActivities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[BGTaskScheduler _queuedLaunchActivities](self, "_queuedLaunchActivities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[BGTaskScheduler _setQueuedLaunchActivities:](self, "_setQueuedLaunchActivities:", 0);
  }
  else
  {
    v7 = 0;
  }
  -[BGTaskScheduler _queuedExpiredLaunchActivities](self, "_queuedExpiredLaunchActivities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[BGTaskScheduler _queuedExpiredLaunchActivities](self, "_queuedExpiredLaunchActivities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    -[BGTaskScheduler _setQueuedExpiredLaunchActivities:](self, "_setQueuedExpiredLaunchActivities:", 0);
  }
  else
  {
    v11 = 0;
  }
  -[BGTaskScheduler _setPermittedIdentifiers:](self, "_setPermittedIdentifiers:", 0);
  os_unfair_lock_unlock(&self->__lock);
  if (objc_msgSend(v7, "count"))
    -[BGTaskScheduler _callRegisteredHandlersForActivities:](self, "_callRegisteredHandlersForActivities:", v7);
  if (objc_msgSend(v11, "count"))
    -[BGTaskScheduler _callExpirationHandlersForActivities:shouldQueue:](self, "_callExpirationHandlersForActivities:shouldQueue:", v11, 0);

}

- (void)_setPermittedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__permittedIdentifiers, a3);
}

- (NSMutableSet)_queuedLaunchActivities
{
  return self->__queuedLaunchActivities;
}

- (NSMutableSet)_queuedExpiredLaunchActivities
{
  return self->__queuedExpiredLaunchActivities;
}

void __23__BGTaskScheduler__log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BackgroundTasks", "Framework");
  v1 = (void *)_log_log;
  _log_log = (uint64_t)v0;

}

+ (void)initialize
{
  id v3;

  if (objc_msgSend(a1, "_isNotApplication"))
  {
    atomic_store(1u, appHasLaunched);
    objc_msgSend(a1, "_sharedSchedulerIfExists");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_handleAppLaunch");

  }
}

+ (BOOL)_isNotApplication
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE80C78], "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isApplication") ^ 1;

  return v3;
}

+ (BOOL)_isRunningInNonExtensionOrApplication
{
  if (_isRunningInNonExtensionOrApplication_once != -1)
    dispatch_once(&_isRunningInNonExtensionOrApplication_once, &__block_literal_global_43);
  return _isRunningInNonExtensionOrApplication_result;
}

void __56__BGTaskScheduler__isRunningInNonExtensionOrApplication__block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "infoDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_2116F8000, v0, OS_LOG_TYPE_DEFAULT, "Main Bundle: %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _isRunningInNonExtensionOrApplication_result = objc_msgSend(v4, "count") == 0;

}

+ (BOOL)_hasExtensionEntitlement
{
  return 1;
}

- (BGTaskScheduler)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BGTaskScheduler.m"), 150, CFSTR("Do not directly instantiate; use the shared scheduler instead"));

  return 0;
}

- (id)_queueForRegistration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;

  v3 = a3;
  objc_msgSend(v3, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.BGTaskScheduler (%@)"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create(v8, v10);

  }
  return v4;
}

- (id)_runningTasks
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->__lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BGTaskScheduler _runningTasksMap](self, "_runningTasksMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[BGTaskScheduler _runningTasksMap](self, "_runningTasksMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->__lock);
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (BOOL)_isRunningTaskOfClass:(Class)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[BGTaskScheduler _runningTasksMap](self, "_runningTasksMap", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[BGTaskScheduler _runningTasksMap](self, "_runningTasksMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (void)_runTask:(id)a3 registration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  BGTaskScheduler *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  id v38;
  BGTaskScheduler *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v6;
    _os_log_impl(&dword_2116F8000, v8, OS_LOG_TYPE_DEFAULT, "Running task: %{public}@", buf, 0xCu);
  }

  -[BGTaskScheduler _queueForRegistration:](self, "_queueForRegistration:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setHandlerQueue:", v9);

  objc_msgSend(v6, "_activity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->__lock);
  -[BGTaskScheduler _runningTasksMap](self, "_runningTasksMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v6, v13);

  os_unfair_lock_unlock(&self->__lock);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("_BGTaskSchedulerRunningTasksDidChangeNotification"), self);

  objc_initWeak((id *)buf, v6);
  v15 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __41__BGTaskScheduler__runTask_registration___block_invoke;
  v37[3] = &unk_24CC62248;
  objc_copyWeak(&v41, (id *)buf);
  v16 = v10;
  v38 = v16;
  v39 = self;
  v17 = v11;
  v40 = v17;
  objc_msgSend(v6, "_setCompletionHandler:", v37);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v6;
    v35[0] = v15;
    v35[1] = 3221225472;
    v35[2] = __41__BGTaskScheduler__runTask_registration___block_invoke_79;
    v35[3] = &unk_24CC62270;
    v35[4] = self;
    v36 = v16;
    objc_msgSend(v18, "_setProgressHandler:", v35);
    v19 = &v36;
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v6;
    v33[0] = v15;
    v33[1] = 3221225472;
    v33[2] = __41__BGTaskScheduler__runTask_registration___block_invoke_2;
    v33[3] = &unk_24CC62270;
    v33[4] = self;
    v21 = v16;
    v34 = v21;
    objc_msgSend(v20, "_setProgressHandler:", v33);
    v30[0] = v15;
    v30[1] = 3221225472;
    v30[2] = __41__BGTaskScheduler__runTask_registration___block_invoke_3;
    v30[3] = &unk_24CC62298;
    v31 = v21;
    v32 = self;
    objc_msgSend(v20, "_setDescriptionUpdateHandler:", v30);

    v19 = &v34;
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v6, "_handlerQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __41__BGTaskScheduler__runTask_registration___block_invoke_4;
  block[3] = &unk_24CC622C0;
  v27 = v16;
  v28 = v6;
  v29 = v7;
  v23 = v7;
  v24 = v6;
  v25 = v16;
  dispatch_async(v22, block);

  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)buf);

}

void __41__BGTaskScheduler__runTask_registration___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    +[BGTaskScheduler _log](BGTaskScheduler, "_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v5;
      v14 = 1024;
      v15 = a2;
      _os_log_impl(&dword_2116F8000, v6, OS_LOG_TYPE_DEFAULT, "Marking task %{public}@ complete with success: %d", buf, 0x12u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_scheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completeTaskRequest:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    NSLog(CFSTR("Marking simulated task complete: %@"), WeakRetained);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(*(id *)(a1 + 40), "_runningTasksMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || v5 == v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "_runningTasksMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("_BGTaskSchedulerRunningTasksDidChangeNotification"), *(_QWORD *)(a1 + 40));

}

void __41__BGTaskScheduler__runTask_registration___block_invoke_79(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_scheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateProgress:forOngoingTask:", v4, *(_QWORD *)(a1 + 40));

}

void __41__BGTaskScheduler__runTask_registration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_scheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateProgress:forOngoingTask:", v4, *(_QWORD *)(a1 + 40));

}

void __41__BGTaskScheduler__runTask_registration___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setClientProvidedTitle:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setClientProvidedReason:", v6);

  objc_msgSend(*(id *)(a1 + 40), "_scheduler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateOngoingTask:", *(_QWORD *)(a1 + 32));

}

void __41__BGTaskScheduler__runTask_registration___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    +[BGTaskScheduler _log](BGTaskScheduler, "_log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v6 = v3;
      _os_log_impl(&dword_2116F8000, v2, OS_LOG_TYPE_DEFAULT, "Starting task: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    NSLog(CFSTR("Starting simulated task: %{public}@"), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 48), "launchHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, *(_QWORD *)(a1 + 40));

}

- (void)scheduler:(id)a3 handleLaunchForActivities:(id)a4
{
  id v5;
  NSObject *v6;
  os_unfair_lock_s *p_lock;
  unsigned __int8 v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v5;
    _os_log_impl(&dword_2116F8000, v6, OS_LOG_TYPE_DEFAULT, "Application launched for activities: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  v8 = atomic_load(appHasLaunched);
  if ((v8 & 1) != 0)
  {
    os_unfair_lock_unlock(&self->__lock);
    -[BGTaskScheduler _callRegisteredHandlersForActivities:](self, "_callRegisteredHandlersForActivities:", v5);
  }
  else
  {
    -[BGTaskScheduler _queuedLaunchActivities](self, "_queuedLaunchActivities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      -[BGTaskScheduler _setQueuedLaunchActivities:](self, "_setQueuedLaunchActivities:", v10);

    }
    -[BGTaskScheduler _queuedLaunchActivities](self, "_queuedLaunchActivities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unionSet:", v5);

    os_unfair_lock_unlock(p_lock);
  }

}

- (void)_callRegisteredHandlersForActivities:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __objc2_class **v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v4;
    _os_log_impl(&dword_2116F8000, v5, OS_LOG_TYPE_DEFAULT, "Calling handlers for activities: %{public}@", buf, 0xCu);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v32 = *MEMORY[0x24BE2E278];
    v29 = *MEMORY[0x24BE2E298];
    v28 = *MEMORY[0x24BE2E288];
    v27 = *MEMORY[0x24BE2E290];
    v26 = *MEMORY[0x24BE2E280];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "clientProvidedIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_lock(&self->__lock);
        -[BGTaskScheduler _unsafe_registrationForIdentifier:](self, "_unsafe_registrationForIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(&self->__lock);
        if (!v12)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BGTaskScheduler.m"), 546, CFSTR("No launch handler registered for task with identifier %@"), v11);
          goto LABEL_17;
        }
        objc_msgSend(v10, "launchReason");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v32);

        v15 = off_24CC61D30;
        if ((v14 & 1) != 0)
          goto LABEL_23;
        objc_msgSend(v10, "launchReason");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v29);

        v15 = off_24CC61D20;
        if ((v17 & 1) != 0)
          goto LABEL_23;
        objc_msgSend(v10, "launchReason");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v28);

        v15 = off_24CC61D10;
        if ((v19 & 1) != 0)
          goto LABEL_23;
        objc_msgSend(v10, "launchReason");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v27);

        v15 = off_24CC61DC8;
        if ((v21 & 1) != 0
          || (objc_msgSend(v10, "launchReason"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = objc_msgSend(v22, "isEqualToString:", v26),
              v22,
              v15 = off_24CC61D00,
              v23))
        {
LABEL_23:
          v24 = objc_msgSend(objc_alloc(*v15), "_initWithIdentifier:activity:", v11, v10);
          if (v24)
          {
            v25 = (void *)v24;
            -[BGTaskScheduler _runTask:registration:](self, "_runTask:registration:", v24, v12);
LABEL_17:

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

}

- (void)_callExpirationHandlersForActivities:(id)a3 shouldQueue:(BOOL)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t n;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  _BOOL4 v63;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD block[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint8_t v92[128];
  uint8_t buf[4];
  id v94;
  uint64_t v95;

  v63 = a4;
  v95 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v94 = v4;
    _os_log_impl(&dword_2116F8000, v5, OS_LOG_TYPE_DEFAULT, "Calling expiration handlers for activities: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v85 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
    }
    while (v9);
  }
  v65 = v7;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->__lock);
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  -[BGTaskScheduler _runningTasksMap](self, "_runningTasksMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v81 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
        -[BGTaskScheduler _runningTasksMap](self, "_runningTasksMap");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v21, "_activity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v6, "containsObject:", v23);

          if (v24)
          {
            objc_msgSend(v66, "addObject:", v21);
            objc_msgSend(v21, "_activity");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "uuid");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "removeObject:", v26);

          }
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
    }
    while (v16);
  }

  if (v63)
  {
    v27 = atomic_load(appHasLaunched);
    if ((v27 & 1) == 0)
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v28 = v65;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v77;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v77 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
            objc_msgSend(v33, "uuid");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v6, "containsObject:", v34);

            if (v35)
            {
              -[BGTaskScheduler _queuedExpiredLaunchActivities](self, "_queuedExpiredLaunchActivities");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v36)
              {
                objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[BGTaskScheduler _setQueuedExpiredLaunchActivities:](self, "_setQueuedExpiredLaunchActivities:", v37);

              }
              -[BGTaskScheduler _queuedExpiredLaunchActivities](self, "_queuedExpiredLaunchActivities");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "addObject:", v33);

              objc_msgSend(v33, "uuid");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "removeObject:", v39);

            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
        }
        while (v30);
      }

      -[BGTaskScheduler _queuedExpiredLaunchActivities](self, "_queuedExpiredLaunchActivities");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (v41)
      {
        +[BGTaskScheduler _log](BGTaskScheduler, "_log");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          -[BGTaskScheduler _queuedExpiredLaunchActivities](self, "_queuedExpiredLaunchActivities");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v94 = v43;
          _os_log_impl(&dword_2116F8000, v42, OS_LOG_TYPE_DEFAULT, "Queued activities for expiration: %{public}@", buf, 0xCu);

        }
      }
    }
  }
  os_unfair_lock_unlock(&self->__lock);
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v94 = v66;
    _os_log_impl(&dword_2116F8000, v44, OS_LOG_TYPE_DEFAULT, "Calling expiration handlers for tasks: %{public}@", buf, 0xCu);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v45 = v66;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v73;
    v49 = MEMORY[0x24BDAC760];
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v73 != v48)
          objc_enumerationMutation(v45);
        v51 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * m);
        objc_msgSend(v51, "_handlerQueue");
        v52 = objc_claimAutoreleasedReturnValue();
        block[0] = v49;
        block[1] = 3221225472;
        block[2] = __68__BGTaskScheduler__callExpirationHandlersForActivities_shouldQueue___block_invoke;
        block[3] = &unk_24CC622E8;
        block[4] = v51;
        dispatch_async(v52, block);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
    }
    while (v47);
  }

  if (objc_msgSend(v6, "count"))
  {
    +[BGTaskScheduler _log](BGTaskScheduler, "_log");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[BGTaskScheduler _callExpirationHandlersForActivities:shouldQueue:].cold.1((uint64_t)v6, v53);

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v54 = v65;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v68;
      do
      {
        for (n = 0; n != v56; ++n)
        {
          if (*(_QWORD *)v68 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * n);
          objc_msgSend(v59, "uuid");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v6, "containsObject:", v60);

          if (v61)
          {
            -[BGTaskScheduler _scheduler](self, "_scheduler");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "completeTaskRequest:", v59);

          }
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
      }
      while (v56);
    }

  }
}

uint64_t __68__BGTaskScheduler__callExpirationHandlersForActivities_shouldQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_2116F8000, v2, OS_LOG_TYPE_DEFAULT, "Expiring task: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_callExpirationHandler");
}

- (void)scheduler:(id)a3 willExpireActivities:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[BGTaskScheduler _log](BGTaskScheduler, "_log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2116F8000, v6, OS_LOG_TYPE_DEFAULT, "Will expire activities: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[BGTaskScheduler _callExpirationHandlersForActivities:shouldQueue:](self, "_callExpirationHandlersForActivities:shouldQueue:", v5, 1);
}

- (void)_simulateLaunchForTaskWithIdentifier:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BGTaskScheduler *v9;
  SEL v10;

  v5 = a3;
  NSLog(CFSTR("Simulating launch for task with identifier %@"), v5);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__BGTaskScheduler__simulateLaunchForTaskWithIdentifier___block_invoke;
  v7[3] = &unk_24CC62310;
  v8 = v5;
  v9 = self;
  v10 = a2;
  v6 = v5;
  -[BGTaskScheduler getPendingTaskRequestsWithCompletionHandler:](self, "getPendingTaskRequestsWithCompletionHandler:", v7);

}

void __56__BGTaskScheduler__simulateLaunchForTaskWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v4)
    goto LABEL_9;
  v5 = v4;
  v6 = *(_QWORD *)v17;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

      if ((v10 & 1) != 0)
      {
        v11 = v8;

        if (!v11)
          goto LABEL_14;
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
        objc_msgSend(*(id *)(a1 + 40), "_runningTasksMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", *(_QWORD *)(a1 + 32));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          NSLog(CFSTR("Task with identifier %{public}@ is already running"), *(_QWORD *)(a1 + 32));
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "_unsafe_registrationForIdentifier:", *(_QWORD *)(a1 + 32));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
          if (v14)
          {
            v15 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_correspondingTaskClass")), "_initWithIdentifier:activity:", *(_QWORD *)(a1 + 32), 0);
            if (v15)
            {
              objc_msgSend(*(id *)(a1 + 40), "cancelTaskRequestWithIdentifier:", *(_QWORD *)(a1 + 32));
              objc_msgSend(*(id *)(a1 + 40), "_runTask:registration:", v15, v14);
            }

            goto LABEL_19;
          }
        }
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("BGTaskScheduler.m"), 664, CFSTR("No launch handler registered for task with identifier %{public}@"), *(_QWORD *)(a1 + 32));
LABEL_19:

        goto LABEL_20;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
      continue;
    break;
  }
LABEL_9:

LABEL_14:
  NSLog(CFSTR("No task request with identifier %{public}@ has been scheduled"), *(_QWORD *)(a1 + 32));
LABEL_20:

}

- (void)_simulateExpirationForTaskWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  NSLog(CFSTR("Simulating expiration for task with identifier %@"), v4);
  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  -[BGTaskScheduler _runningTasksMap](self, "_runningTasksMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v7 && (objc_msgSend(v7, "_activity"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    objc_msgSend(v7, "_handlerQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__BGTaskScheduler__simulateExpirationForTaskWithIdentifier___block_invoke;
    block[3] = &unk_24CC622E8;
    v11 = v7;
    dispatch_async(v9, block);

  }
  else
  {
    NSLog(CFSTR("Task with identifier %{public}@ is not currently being simulated"), v4);
  }

}

void __60__BGTaskScheduler__simulateExpirationForTaskWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "expirationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    NSLog(CFSTR("Expiring simulated task: %{public}@"), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_callExpirationHandler");
  }
  else
  {
    NSLog(CFSTR("No expiration handler for task: %{public}@"), *(_QWORD *)(a1 + 32));
  }
}

- (void)_setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->__scheduler, a3);
}

- (void)_setQueuedLaunchActivities:(id)a3
{
  objc_storeStrong((id *)&self->__queuedLaunchActivities, a3);
}

- (void)_setQueuedExpiredLaunchActivities:(id)a3
{
  objc_storeStrong((id *)&self->__queuedExpiredLaunchActivities, a3);
}

- (os_unfair_lock_s)_lock
{
  return self->__lock;
}

- (void)_setLock:(os_unfair_lock_s)a3
{
  self->__lock = a3;
}

- (void)_setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->__registrations, a3);
}

- (NSMapTable)_runningTasksMap
{
  return self->__runningTasksMap;
}

- (void)_setRunningTasksMap:(id)a3
{
  objc_storeStrong((id *)&self->__runningTasksMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__runningTasksMap, 0);
  objc_storeStrong((id *)&self->__permittedIdentifiers, 0);
  objc_storeStrong((id *)&self->__registrations, 0);
  objc_storeStrong((id *)&self->__queuedExpiredLaunchActivities, 0);
  objc_storeStrong((id *)&self->__queuedLaunchActivities, 0);
  objc_storeStrong((id *)&self->__scheduler, 0);
}

+ (void)_applicationDidFinishLaunching:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2116F8000, log, OS_LOG_TYPE_DEBUG, "Application finished launching", v1, 2u);
}

- (void)registerForTaskWithIdentifier:(uint64_t)a1 usingQueue:(NSObject *)a2 launchHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2116F8000, a2, OS_LOG_TYPE_DEBUG, "registerForTaskWithIdentifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_callExpirationHandlersForActivities:(uint64_t)a1 shouldQueue:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2116F8000, a2, OS_LOG_TYPE_ERROR, "Unknown activities expired, completing immediately: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
