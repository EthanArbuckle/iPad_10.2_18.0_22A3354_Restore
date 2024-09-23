@implementation HDBackgroundWorkoutRunner

- (HDBackgroundWorkoutRunner)initWithDaemon:(id)a3
{
  id v4;
  HDBackgroundWorkoutRunner *v5;
  HDBackgroundWorkoutRunner *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  HDAssertionManager *v9;
  HDAssertionManager *assertionManager;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDBackgroundWorkoutRunner;
  v5 = -[HDBackgroundWorkoutRunner init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v9;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v6->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v6, CFSTR("HDWorkoutSessionAssertionIdentifierBackgroundRunning"), v6->_queue);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertionManager removeObserver:](self->_assertionManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HDBackgroundWorkoutRunner;
  -[HDBackgroundWorkoutRunner dealloc](&v3, sel_dealloc);
}

- (id)takeBackgroundRunningAssertionForOwnerIdentifier:(id)a3 client:(id)a4 includeCoreLocationAssertion:(BOOL)a5
{
  id v9;
  id v10;
  _HDBackgroundRunningAssertion *v11;
  id v12;
  HDBackgroundWorkoutRunner *v13;
  _HDBackgroundRunningAssertion *v14;
  _HDBackgroundRunningAssertion *v15;
  objc_super v17;

  v9 = a4;
  v10 = a3;
  v11 = [_HDBackgroundRunningAssertion alloc];
  v12 = v9;
  if (v11)
  {
    v17.receiver = v11;
    v17.super_class = (Class)_HDBackgroundRunningAssertion;
    v13 = -[HDBackgroundWorkoutRunner initWithAssertionIdentifier:ownerIdentifier:](&v17, sel_initWithAssertionIdentifier_ownerIdentifier_, CFSTR("HDWorkoutSessionAssertionIdentifierBackgroundRunning"), v10);
    v11 = (_HDBackgroundRunningAssertion *)v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13[2]._queue, a4);
      v11->_shouldAcquireCLAssertion = a5;
    }
  }

  if (-[HDAssertionManager takeAssertion:](self->_assertionManager, "takeAssertion:", v11))
    v14 = v11;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (void)assertionManager:(id)a3 assertionTaken:(id)a4
{
  id v6;
  id *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  id *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDBackgroundWorkoutRunner.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assertion isKindOfClass:[_HDBackgroundRunningAssertion class]]"));

  }
  v7 = (id *)v6;
  v23 = v7;
  if (v7)
    v8 = v7[11];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "process");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[HDBackgroundWorkoutRunner hasBackgroundPermissionForBundleIdentifier:errorOut:](HDBackgroundWorkoutRunner, "hasBackgroundPermissionForBundleIdentifier:errorOut:", v11, 0))
  {
    +[HDBackgroundWorkoutRunner acquireBKSAssertionForClient:](HDBackgroundWorkoutRunner, "acquireBKSAssertionForClient:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HDBackgroundRunningAssertion setBksAssertion:]((uint64_t)v23, v12);

    if (v23 && *((_BYTE *)v23 + 80))
    {
      objc_msgSend(v9, "process");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        objc_msgSend(v13, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        v26 = 1024;
        v27 = objc_msgSend(v13, "processIdentifier");
        _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_INFO, "Taking CoreLocation in-use assertion for bundle %{public}@ (%d).", buf, 0x12u);

      }
      v17 = (void *)MEMORY[0x1E0C9E3A8];
      objc_msgSend(v13, "applicationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "newAssertionForBundleIdentifier:withReason:", v18, CFSTR("HealthKit Background Workout"));

      objc_storeStrong(v23 + 13, v19);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "processStateManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerObserver:forBundleIdentifier:", self, v11);

  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  id v7;
  NSObject *queue;
  id v9;
  id *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  id *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  queue = self->_queue;
  v9 = a3;
  dispatch_assert_queue_V2(queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDBackgroundWorkoutRunner.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assertion isKindOfClass:[_HDBackgroundRunningAssertion class]]"));

  }
  v10 = (id *)v7;
  v27 = v10;
  if (v10)
    v11 = v10[11];
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v27, "ownerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeAssertionsForIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "count");
  if (!v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "processStateManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "process");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unregisterObserver:forBundleIdentifier:", self, v19);

  }
  if (v27)
  {
    v20 = v27[13];
    if (v20)
    {
      objc_msgSend(v12, "process");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v22 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        objc_msgSend(v21, "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v24;
        v30 = 1024;
        v31 = objc_msgSend(v21, "processIdentifier");
        _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_INFO, "Releasing CoreLocation in-use assertion for bundle %{public}@ (%d)", buf, 0x12u);

      }
      objc_msgSend(v20, "invalidate");

    }
    v25 = v27[12];
  }
  else
  {
    v25 = 0;
  }
  +[HDBackgroundWorkoutRunner releaseBKSAssertion:forClient:](HDBackgroundWorkoutRunner, "releaseBKSAssertion:forClient:", v25, v12);

}

- (void)processDidEnterForeground:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HDBackgroundWorkoutRunner *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HDBackgroundWorkoutRunner_processDidEnterForeground___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __55__HDBackgroundWorkoutRunner_processDidEnterForeground___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v24 = v16;
    _os_log_debug_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEBUG, "Application entered foreground: %@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "activeAssertionsForIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierBackgroundRunning"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6);
        if (v7)
          v8 = *(void **)(v7 + 88);
        else
          v8 = 0;
        v9 = v8;
        objc_msgSend(v9, "process");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v12)
        {
          if (v7)
            v13 = *(_QWORD *)(v7 + 96);
          else
            v13 = 0;
          +[HDBackgroundWorkoutRunner releaseBKSAssertion:forClient:](HDBackgroundWorkoutRunner, "releaseBKSAssertion:forClient:", v13, v9);
          +[HDBackgroundWorkoutRunner acquireBKSAssertionForClient:](HDBackgroundWorkoutRunner, "acquireBKSAssertionForClient:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HDBackgroundRunningAssertion setBksAssertion:](v7, v14);

        }
        ++v6;
      }
      while (v4 != v6);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v4 = v15;
    }
    while (v15);
  }

}

+ (BOOL)hasBackgroundPermissionForBundleIdentifier:(id)a3 errorOut:(id *)a4
{
  NSObject *v4;
  uint8_t v6[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "Client does not have background run mode. Will not take process assertion", v6, 2u);
  }
  return 0;
}

+ (id)acquireBKSAssertionForClient:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "process");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_INFO, "Taking background workout assertion for process %{public}@", buf, 0xCu);
  }
  v6 = objc_alloc(MEMORY[0x1E0CFE308]);
  v7 = objc_msgSend(v3, "processIdentifier");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HDBackgroundWorkoutRunner_acquireBKSAssertionForClient___block_invoke;
  v11[3] = &unk_1E6CEEA30;
  v12 = v4;
  v8 = v4;
  v9 = (void *)objc_msgSend(v6, "initWithPID:flags:reason:name:withHandler:", v7, 3, 19, CFSTR("HealthKit Background Workout"), v11);

  return v9;
}

void __58__HDBackgroundWorkoutRunner_acquireBKSAssertionForClient___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "Failed to acquire assertion for : %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (void)releaseBKSAssertion:(id)a3 forClient:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      objc_msgSend(v6, "process");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "process");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 1024;
      v15 = objc_msgSend(v11, "processIdentifier");
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "Releasing background workout assertion for process %{public}@ (%d)", (uint8_t *)&v12, 0x12u);

    }
    objc_msgSend(v5, "invalidate");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
