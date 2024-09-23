@implementation ITIdleTimerStateModel

- (id)newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v13;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerStateModel.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  -[ITIdleTimerStateModel _access_newIdleTimerAssertionWithConfiguration:forReason:error:](self, "_access_newIdleTimerAssertionWithConfiguration:forReason:error:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_accessLock);

  return v11;
}

- (id)_access_newIdleTimerAssertionWithConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  ITIdleTimerStateRequestHandling *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  ITIdleTimerStateModel *v19;
  ITIdleTimerAssertion *v20;
  ITIdleTimerStateModel *v21;
  NSMutableDictionary *access_idleTimerAssertionsByConfigIdentifier;
  void *v23;
  void *v25;
  _QWORD v26[4];
  ITIdleTimerStateModel *v27;
  ITIdleTimerStateRequestHandling *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimerStateModel.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  os_unfair_lock_assert_owner(&self->_accessLock);
  v11 = self->_requestHandler;
  objc_msgSend(v9, "_uniquedReason:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ITLogIdleTimer();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v15;
    v32 = 2114;
    v33 = v12;
    _os_log_impl(&dword_2063D2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Adding IdleTimer assertion for reason: %{public}@.", buf, 0x16u);

  }
  v29 = 0;
  -[ITIdleTimerStateRequestHandling addIdleTimerConfiguration:forReason:error:](v11, "addIdleTimerConfiguration:forReason:error:", v9, v12, &v29);
  v16 = v29;
  v17 = v16;
  if (v16)
  {
    v18 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
  }
  else
  {
    v19 = self;
    v20 = [ITIdleTimerAssertion alloc];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __88__ITIdleTimerStateModel__access_newIdleTimerAssertionWithConfiguration_forReason_error___block_invoke;
    v26[3] = &unk_24BF08C10;
    v27 = v19;
    v28 = v11;
    v21 = v19;
    v18 = -[ITIdleTimerAssertion _initWithConfiguration:forReason:invalidationBlock:](v20, "_initWithConfiguration:forReason:invalidationBlock:", v9, v10, v26);
    access_idleTimerAssertionsByConfigIdentifier = v21->_access_idleTimerAssertionsByConfigIdentifier;
    objc_msgSend(v9, "_identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](access_idleTimerAssertionsByConfigIdentifier, "setObject:forKey:", v18, v23);

  }
  return v18;
}

- (ITIdleTimerStateModel)init
{
  ITIdleTimerStateModel *v2;
  ITIdleTimerStateModel *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *access_idleTimerAssertionsByConfigIdentifier;
  uint64_t v6;
  ITIdleTimerStateRequestHandling *requestHandler;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ITIdleTimerStateModel;
  v2 = -[ITIdleTimerStateModel init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    access_idleTimerAssertionsByConfigIdentifier = v3->_access_idleTimerAssertionsByConfigIdentifier;
    v3->_access_idleTimerAssertionsByConfigIdentifier = v4;

    +[ITIdleTimerServiceProvider makeRequestHandlerWithDelegate:](ITIdleTimerServiceProvider, "makeRequestHandlerWithDelegate:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    requestHandler = v3->_requestHandler;
    v3->_requestHandler = (ITIdleTimerStateRequestHandling *)v6;

    -[ITIdleTimerStateModel _addStateCaptureHandler](v3, "_addStateCaptureHandler");
  }
  return v3;
}

- (void)dealloc
{
  BSInvalidatable *stateCaptureAssertion;
  BSInvalidatable *v4;
  objc_super v5;

  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    -[BSInvalidatable invalidate](stateCaptureAssertion, "invalidate");
    v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ITIdleTimerStateModel;
  -[ITIdleTimerStateModel dealloc](&v5, sel_dealloc);
}

- (BOOL)isIdleTimerServiceAvailable
{
  return -[ITIdleTimerStateRequestHandling isIdleTimerServiceAvailable](self->_requestHandler, "isIdleTimerServiceAvailable");
}

- (void)resendIdleTimerAssertions
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  ITIdleTimerStateRequestHandling *requestHandler;
  id v13;
  NSObject *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  ITLogIdleTimer();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2063D2000, v3, OS_LOG_TYPE_DEFAULT, "[ITIdleTimerStateModel resendIdleTimerAssertions]", buf, 2u);
  }

  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_access_idleTimerAssertionsByConfigIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "configuration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_uniqueReason");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        requestHandler = self->_requestHandler;
        v15 = 0;
        -[ITIdleTimerStateRequestHandling addIdleTimerConfiguration:forReason:error:](requestHandler, "addIdleTimerConfiguration:forReason:error:", v10, v11, &v15);
        v13 = v15;
        if (v13)
        {
          ITLogIdleTimer();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v21 = v13;
            _os_log_error_impl(&dword_2063D2000, v14, OS_LOG_TYPE_ERROR, "Encountered error resending idle timer assertions: %{public}@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_accessLock);
}

- (BOOL)handleIdleEvent:(unint64_t)a3 usingConfigurationWithIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  os_unfair_lock_s *p_accessLock;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  int v16;
  unint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  ITLogIdleTimer();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218242;
    v17 = a3;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_2063D2000, v7, OS_LOG_TYPE_DEFAULT, "[ITIdleTimerStateModel handleIdleEvent: %lu usingConfigurationWithIdentifier: %{public}@]", (uint8_t *)&v16, 0x16u);
  }

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  -[NSMutableDictionary objectForKey:](self->_access_idleTimerAssertionsByConfigIdentifier, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_idleEventHandlerBlock");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (*(uint64_t (**)(uint64_t, unint64_t))(v12 + 16))(v12, a3);
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }
  os_unfair_lock_unlock(p_accessLock);

  return v14;
}

void __88__ITIdleTimerStateModel__access_newIdleTimerAssertionWithConfiguration_forReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const os_unfair_lock *v4;
  os_unfair_lock *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (const os_unfair_lock *)*(id *)(a1 + 32);
  v5 = (os_unfair_lock *)v4;
  if (v4)
  {
    os_unfair_lock_assert_not_owner(v4 + 2);
    os_unfair_lock_lock(v5 + 2);
    objc_msgSend(v3, "_uniqueReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ITLogIdleTimer();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_2063D2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Removing IdleTimer assertion for reason: %{public}@.", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(v3, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeIdleTimerConfiguration:forReason:", v10, v6);
    objc_msgSend(v10, "_identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)&v5[4]._os_unfair_lock_opaque, "removeObjectForKey:", v11);
    os_unfair_lock_unlock(v5 + 2);

  }
}

- (void)_addStateCaptureHandler
{
  id v3;
  BSInvalidatable *v4;
  BSInvalidatable *stateCaptureAssertion;
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC9B8];
  objc_copyWeak(&v6, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureAssertion = self->_stateCaptureAssertion;
  self->_stateCaptureAssertion = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

__CFString *__48__ITIdleTimerStateModel__addStateCaptureHandler__block_invoke(uint64_t a1)
{
  char *WeakRetained;
  os_unfair_lock_s *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (os_unfair_lock_s *)(WeakRetained + 8);
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)WeakRetained + 2);
  if (WeakRetained)
  {
    os_unfair_lock_lock(v2);
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*((id *)WeakRetained + 2), "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "description");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    os_unfair_lock_unlock(v2);
    objc_msgSend(v3, "description");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_24BF08CF8;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_access_idleTimerAssertionsByConfigIdentifier, 0);
}

@end
